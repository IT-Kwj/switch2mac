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
    float4 m_73 [[user(locn0)]];
    float4 m_59 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_69 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2310 = false;
    bool _430 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_56.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_59.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2615 = as_type<float>(_124);
        out.gl_Position.z = _2615;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_61.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _118 = _144;
    }
    float _146 = _118;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_59.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2684 = as_type<float>(_160);
        out.gl_Position.z = _2684;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_63.w;
    float _164 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_61.x;
    float _178 = in.m_61.y;
    float _180 = in.m_61.z;
    float _182 = in.m_56.x;
    float _184 = in.m_56.y;
    float _186 = in.m_56.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_65.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_108);
        float _308 = 1.0 / _306;
        float _310 = _142 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = 1.0 / _332;
    bool _336 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_312);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_328;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = _346 * _350;
    float _368 = -_346;
    float _370 = _368 + 1.0;
    float _372 = _316 * _334;
    float _374 = in.m_63.x;
    float _376 = in.m_63.y;
    float _378 = in.m_63.z;
    float _380 = fma(_354, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_364, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = fma(_358, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = _380 * _366;
    float _388 = _382 * _366;
    float _390 = _384 * _366;
    float _392 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _398 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].x, _392);
    float _400 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].y, _394);
    float _402 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].z, _396);
    float _404 = _398 * _374;
    float _406 = _400 * _376;
    float _408 = _402 * _378;
    bool _410 = !_360;
    float _428;
    if (!_410)
    {
        float _412 = in.m_65.x;
        float _414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _416 = _412 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _420 = _418 * _414;
        float _422 = floor(_420);
        float _424 = -_422;
        float _426 = _420 + _424;
        _428 = _426;
        _430 = true;
    }
    else
    {
        float _432 = float(_108);
        float _434 = 1.0 / _432;
        float _436 = _142 * _434;
        _428 = _436;
    }
    _430 = false;
    float _438 = _428;
    float _440 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _442 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _444 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _440);
    float _446 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _442);
    float _448 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _450 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
    float _452 = _448 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _454 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _456 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _458 = fma(_454, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _460 = floor(_456);
    float _462 = floor(_458);
    float _464 = -_460;
    float _466 = _456 + _464;
    float _468 = -_462;
    float _470 = _458 + _468;
    float2 _3180 = float2(_470, _466);
    float _472 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3180, float2(0.0), isnan(_3180)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3180, float2(0.0), isnan(_3180)), level(0.0)).x;
    float _474 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _476 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _478 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _474);
    float _480 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _482 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _484 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    bool _486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _488 = isnan(0.5);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _494 = _490 || _492;
    float _496 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _498 = _496 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _500 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[11].x, _498);
    float _502 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[11].z, _500);
    float _504 = _496 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _506 = _502 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _508 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[10].x, _504);
    float _510 = 1.0 / _506;
    float _512 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[10].z, _508);
    float _514 = _512 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _516 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _518 = _514 + _506;
    float _520 = _496 + _516;
    float _522 = _520 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _524 = _518 * _510;
    float _526 = _524 * 0.5;
    float _528 = _520 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _530 = fma(_454, (*spvDescriptorSet0.vp_c15)._m0[127].x, _522);
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _534 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[30].w, _532);
    float _536 = fma(_454, (*spvDescriptorSet0.vp_c15)._m0[126].x, _528);
    float _538 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[127].z, _530);
    float _540 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[126].z, _536);
    float _542 = 1.0 / _534;
    float _544 = _538 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _546 = _540 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _548 = in.m_67.x;
    float _550 = in.m_67.y;
    float _552 = in.m_67.z;
    float _554 = trunc(_546);
    int _556 = int(_554);
    float _558 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _560 = _542 * _558;
    float _562 = trunc(_544);
    int _564 = int(_562);
    bool _566 = _560 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _568 = _560 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _570 = !_566;
    int _572 = _570 ? 0 : 1;
    int _574 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _576 = _556 + _574;
    int _578 = _576 + 1;
    float _580 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _550);
    int _582 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _584 = _564 + _582;
    int _586 = _584 + 1;
    float _588 = _476 * _580;
    int _590 = 2;
    int _592 = _578;
    float _594 = _546;
    float _596 = _544;
    float _598 = _454;
    float _600 = _438;
    float _602 = _548;
    int _604 = as_type<int>(_550);
    float _606 = 1.0;
    if (!_566)
    {
        _590 = 1;
    }
    int _608 = _590;
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _548);
    int _612 = _608;
    if (!_568)
    {
        _612 = _572;
    }
    int _614 = _612;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _552);
    bool _618 = _578 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _620 = _480 * _610;
    int _622 = _578 | _586;
    float _624 = _588 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _626 = _614 << 6;
    float _628 = _588 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _630 = _622 < 0;
    bool _632 = _630 || _618;
    float _634 = _482 * _616;
    int _636 = _626 + 96;
    uint _639 = uint(int(uint(_636) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.vp_c15)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.vp_c15)._m0[int(_649)][_651];
    float _655 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[26].x, _624);
    bool _657 = _586 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _659 = _657 || _632;
    float _661 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[24].x, _628);
    float _663 = _588 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _665 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[26].z, _655);
    float _667 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[24].z, _661);
    int _669 = _626 + 104;
    uint _671 = uint(int(uint(_669) >> uint(2)));
    uint _673 = uint(int(uint(int(_671)) >> uint(2)));
    int _675 = int(_671) & 3;
    float _677 = (*spvDescriptorSet0.vp_c15)._m0[int(_673)][_675];
    int _679 = int(_671) + 1;
    uint _681 = uint(int(uint(_679) >> uint(2)));
    int _683 = _679 & 3;
    float _685 = (*spvDescriptorSet0.vp_c15)._m0[int(_681)][_683];
    float _687 = _665 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _689 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[25].x, _663);
    float _691 = _667 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _693 = _452 + _687;
    float _695 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[25].z, _689);
    int _697 = _622;
    int _699 = as_type<int>(_616);
    float _701 = _693;
    float _703 = as_type<float>(_626);
    if (!_659)
    {
        int _705 = _586 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _707 = _705 + _578;
        _592 = _707;
    }
    int _709 = _592;
    int _711 = _626 + 48;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.vp_c15)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.vp_c15)._m0[int(_723)][_725];
    float _729 = _454 + _691;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _733 = _693 + _731;
    float _735 = _733;
    if (!_659)
    {
        int _737 = _709 << 2;
        _697 = _737;
    }
    int _739 = _697;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _729 + _741;
    int _745 = _739;
    if (!_659)
    {
        uint _747 = uint(int(uint(_709) >> uint(2)));
        _699 = int(_747);
    }
    int _749 = _699;
    float _751 = _733 * _733;
    if (!_659)
    {
        int _753 = 12 & _739;
        _745 = _753;
    }
    int _755 = _745;
    int _757 = _626 + 64;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    uint _761 = uint(int(uint(int(_759)) >> uint(2)));
    int _763 = int(_759) & 3;
    float _765 = (*spvDescriptorSet0.vp_c15)._m0[int(_761)][_763];
    int _767 = int(_759) + 1;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    int _771 = _767 & 3;
    float _773 = (*spvDescriptorSet0.vp_c15)._m0[int(_769)][_771];
    float _775 = fma(_743, _743, _751);
    float _777 = 0.0;
    if (!_659)
    {
        int _779 = _749 << 4;
        int _781 = _779 + _755;
        _777 = as_type<float>(_781);
    }
    float _783 = _777;
    float _785 = sqrt(_775);
    int _787 = _626 + 56;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    uint _791 = uint(int(uint(int(_789)) >> uint(2)));
    int _793 = int(_789) & 3;
    float _795 = (*spvDescriptorSet0.vp_c15)._m0[int(_791)][_793];
    int _797 = int(_789) + 1;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    int _801 = _797 & 3;
    float _803 = (*spvDescriptorSet0.vp_c15)._m0[int(_799)][_801];
    int _805 = _626 + 72;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    uint _809 = uint(int(uint(int(_807)) >> uint(2)));
    int _811 = int(_807) & 3;
    float _813 = (*spvDescriptorSet0.vp_c15)._m0[int(_809)][_811];
    int _815 = int(_807) + 1;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    int _819 = _815 & 3;
    float _821 = (*spvDescriptorSet0.vp_c15)._m0[int(_817)][_819];
    bool _823 = _785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _825 = _520 * _653;
    int _827 = _626 + 80;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    uint _831 = uint(int(uint(int(_829)) >> uint(2)));
    int _833 = int(_829) & 3;
    float _835 = (*spvDescriptorSet0.vp_c15)._m0[int(_831)][_833];
    int _837 = int(_829) + 1;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    int _841 = _837 & 3;
    float _843 = (*spvDescriptorSet0.vp_c15)._m0[int(_839)][_841];
    float _845 = _653;
    if (!_659)
    {
        float _847 = floor(_546);
        _845 = _847;
    }
    float _849 = _845;
    float _851 = fma(_454, _645, _825);
    float _853 = fma(_452, _677, _851);
    int _855 = _626 + 88;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    uint _859 = uint(int(uint(int(_857)) >> uint(2)));
    int _861 = int(_857) & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    int _865 = int(_857) + 1;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    int _869 = _865 & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    float _873 = _695 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _875 = _853 + _685;
    float _877 = _496 + _873;
    float _879 = _520 * _727;
    float _881 = _783;
    float _883 = _873;
    float _885 = _719;
    float _887 = _685;
    if (!_659)
    {
        int _889 = as_type<int>(_783) + 400;
        uint _891 = uint(int(uint(_889) >> uint(2)));
        uint _893 = uint(int(uint(int(_891)) >> uint(2)));
        int _895 = int(_891) & 3;
        float _897 = (*spvDescriptorSet0.vp_c15)._m0[int(_893)][_895];
        _881 = _897;
    }
    float _899 = _881;
    float _901 = 1.0 / _875;
    if (!_823)
    {
        _883 = _877;
    }
    float _903 = _883;
    float _905 = fma(_454, _719, _879);
    float _907 = _903;
    if (!_823)
    {
        _885 = _729;
    }
    float _909 = _885;
    float _911 = _520 * _773;
    float _913 = fma(_454, _765, _911);
    bool _915 = !_823;
    float _917 = _909;
    float _919 = _765;
    if (!_915)
    {
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _923 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _925 = _785 + _923;
        float _927 = rsqrt(_775);
        float _929 = _925 * _921;
        float _931 = _877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = _929 * 0.15915493667125701904296875;
        float _935 = _933 * 6.283185482025146484375;
        float _937 = cos(_935);
        float _939 = _933 * 6.283185482025146484375;
        float _941 = sin(_939);
        float _943 = _937 + (-1.0);
        float _945 = fma(_941, _931, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _947 = _943 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _949 = _927 * _945;
        float _951 = fma(_877, _937, _947);
        float _953 = fma(_743, _949, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _955 = fma(_733, _949, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _917 = _953;
        _701 = _955;
        _919 = _949;
        _907 = _951;
        _887 = _933;
    }
    float _957 = _917;
    float _959 = _701;
    float _961 = _919;
    float _963 = _907;
    float _965 = _887;
    float _967 = fma(_452, _795, _905);
    float _969 = fma(_452, _813, _913);
    float _971 = _965;
    float _973 = _963;
    float _975 = _961;
    float _977 = _957;
    if (_494)
    {
        _735 = _957;
    }
    float _979 = _735;
    float _981 = _979;
    if (_494)
    {
        _971 = _959;
    }
    float _983 = _971;
    float _985 = _983;
    if (!_494)
    {
        float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _989 = _496 + _987;
        float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _993 = _454 + _991;
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _997 = -_496;
        float _999 = _997 + _963;
        float _1001 = _989 * _989;
        float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1005 = _452 + _1003;
        float _1007 = -_454;
        float _1009 = _1007 + _957;
        float _1011 = fma(_993, _993, _1001);
        float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1015 = fma(_1005, _1005, _1011);
        float _1017 = sqrt(_1015);
        float _1019 = _995 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1021 = precise::min(_1017, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1023 = _1021 * _1013;
        float _1025 = _1019 * _1023;
        float _1027 = -_452;
        float _1029 = _1027 + _959;
        float _1031 = fma(_999, _1025, _496);
        float _1033 = fma(_1009, _1025, _454);
        float _1035 = fma(_1029, _1025, _452);
        _973 = _1031;
        _981 = _1033;
        _985 = _1035;
        _975 = _995;
        _977 = _1009;
    }
    float _1037 = _973;
    float _1039 = _981;
    float _1041 = _985;
    float _1043 = _975;
    float _1045 = _977;
    float _1047 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1049 = _967 + _803;
    float _1051 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1053 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1055 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1047);
    float _1057 = _1049 * _901;
    float _1059 = _969 + _821;
    float _1061 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1051);
    float _1063 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1055);
    float _1065 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1053);
    bool _1067 = _1057 >= 0.0;
    float _1069 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1073 = _1059 * _901;
    float _1075 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1077 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1065);
    bool _1079 = _1057 <= 1.0;
    bool _1081 = _1079 && _1067;
    float _1083 = _1045;
    if (!_659)
    {
        float _1085 = rint(_899);
        float _1087 = precise::max(_1085, 0.0);
        uint _1089 = uint(_1087);
        uint _1091 = clamp(_1089, 0u, 65535u);
        _1083 = as_type<float>(_1091);
    }
    float _1093 = _1083;
    float _1095 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1075);
    float _1097 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1099 = _1073 >= 0.0;
    bool _1101 = _1099 && _1081;
    float _1103 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1105 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1095);
    float _1107 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1109 = _1073 <= 1.0;
    bool _1111 = _1109 && _1101;
    float _1113 = _1043;
    float _1115 = _1107;
    float _1117 = _1093;
    if (!_659)
    {
        float _1119 = floor(_544);
        _1113 = _1119;
    }
    float _1121 = _1113;
    float _1123 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1125 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1127 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1129 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1131 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1125);
    float _1133 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1135 = -_1129;
    float _1137 = fma(_1135, _1103, 1.0);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1131);
    float _1141 = _520 * _843;
    float _1143 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1133);
    float _1145 = log2(_1137);
    float _1147 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1139);
    float _1149 = _1133;
    float _1151 = _1137;
    float _1153 = _1147;
    if (_1111)
    {
        float _1155 = float(_614);
        _1149 = _1155;
    }
    float _1157 = _1149;
    float _1159 = fma(_454, _835, _1141);
    float _1161 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1107);
    float _1163 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1143);
    if (!_659)
    {
        float _1165 = -_1121;
        float _1167 = _544 + _1165;
        _1115 = _1167;
    }
    float _1169 = _1115;
    float _1171 = fma(_452, _863, _1159);
    float _1173 = 1.0 / _1147;
    float _1175 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1161);
    if (!_659)
    {
        float _1177 = -_849;
        float _1179 = _546 + _1177;
        _1151 = _1179;
    }
    float _1181 = _1151;
    float _1183 = _1171 + _871;
    float _1185 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1163);
    float _1187 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1175);
    float _1189 = _1183 * _901;
    float _1191 = _1157;
    float _1193 = _1185;
    if (_1111)
    {
        float _1195 = rint(_1157);
        float _1197 = precise::max(_1195, 0.0);
        uint _1199 = uint(_1197);
        uint _1201 = clamp(_1199, 0u, 65535u);
        _1191 = as_type<float>(_1201);
    }
    float _1203 = _1191;
    float _1205 = _1145 * 0.693147182464599609375;
    float _1207 = _1169;
    if (!_659)
    {
        float3 _4408 = float3(_1181, _1169, float(as_type<int>(_1093)));
        float3 _4412 = select(_4408, float3(0.0), isnan(_4408));
        float _1209 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4412.xy, uint(rint(_4412.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4412.xy, uint(rint(_4412.z)), level(0.0)).x;
        _1207 = _1209;
    }
    float _1211 = _1207;
    float _1213 = _1205 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1215 = _1185 * _1173;
    float _1217 = _1187 * _1173;
    float _1219 = fma(_1215, 0.5, 0.5);
    float _1221 = fma(_1217, -0.5, 0.5);
    float _1223 = _1203;
    float _1225 = _1173;
    if (_1111)
    {
        float3 _4443 = float3(_1057, _1073, float(as_type<int>(_1203)));
        float3 _4445 = select(_4443, float3(0.0), isnan(_4443));
        float _1227 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4445.xy, uint(rint(_4445.z)), _1189, level(0.0));
        _1223 = _1227;
    }
    float _1229 = _1223;
    float3 _4455 = float3(_1219, _1221, _1213);
    float _1231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4455, float3(0.0), isnan(_4455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4455, float3(0.0), isnan(_4455)), level(0.0)).x;
    float3 _4464 = float3(_1219, _1221, _1213);
    float4 _1234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4464, float3(0.0), isnan(_4464)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4464, float3(0.0), isnan(_4464)), level(0.0)).xyzw;
    float _1236 = _1234.x;
    float _1238 = _1234.y;
    float _1240 = _1234.z;
    float _1242 = _1234.w;
    bool _1244 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1246 = isnan(0.5);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1252 = _1248 || _1250;
    if (_659)
    {
        _1225 = 1.0;
    }
    float _1254 = _1225;
    float _1256 = _1254;
    if (_1252)
    {
        _594 = 1.0;
    }
    float _1258 = _594;
    float _1260 = _1258;
    if (_1252)
    {
        _596 = 1.0;
    }
    float _1262 = _596;
    float _1264 = _1262;
    if (!_1252)
    {
        float _1266 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1268 = _1266 * 0.15915493667125701904296875;
        float _1270 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1272 = _1268 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1270 * 0.15915493667125701904296875;
        float _1278 = _1268 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = 1.0 / _1274;
        float _1284 = _1276 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = _1276 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1286 * _1288;
        float _1296 = 1.0 / _1294;
        float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1300 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1298;
        float _1302 = 1.0 / _1300;
        float _1304 = _1292 * _1296;
        float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1308 = fma(_560, _1304, _1306);
        float _1310 = _1308 * _1302;
        float _1312 = precise::clamp(_1310, 0.0, 1.0);
        _1117 = _1282;
        _1264 = _1312;
    }
    float _1314 = _1117;
    float _1316 = _1264;
    float _1318 = _1314;
    if (!_1252)
    {
        float _1320 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1322 = _1320 * 0.15915493667125701904296875;
        float _1324 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1326 = _1322 * 6.283185482025146484375;
        float _1328 = cos(_1326);
        float _1330 = _1324 * 0.15915493667125701904296875;
        float _1332 = _1322 * 6.283185482025146484375;
        float _1334 = sin(_1332);
        float _1336 = 1.0 / _1328;
        float _1338 = _1330 * 6.283185482025146484375;
        float _1340 = cos(_1338);
        float _1342 = _1334 * _1336;
        float _1344 = _1330 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        float _1348 = _1340 * _1342;
        float _1350 = 1.0 / _1348;
        float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1354 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1352;
        float _1356 = 1.0 / _1354;
        float _1358 = _1346 * _1350;
        float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1362 = fma(_560, _1358, _1360);
        float _1364 = _1362 * _1356;
        float _1366 = precise::clamp(_1364, 0.0, 1.0);
        float _1368 = -_1366;
        float _1370 = _1368 + 1.0;
        _1318 = _1330;
        _1260 = _1370;
    }
    float _1372 = _1318;
    float _1374 = _1260;
    float _1376 = _1372;
    if (!_659)
    {
        int _1378 = _709 << 4;
        int _1380 = _1378 + 2048;
        uint _1382 = uint(int(uint(_1380) >> uint(2)));
        uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
        int _1386 = int(_1382) & 3;
        float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
        int _1390 = int(_1382) + 1;
        uint _1392 = uint(int(uint(_1390) >> uint(2)));
        int _1394 = _1390 & 3;
        float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
        int _1398 = _1380 + 8;
        uint _1400 = uint(int(uint(_1398) >> uint(2)));
        uint _1402 = uint(int(uint(int(_1400)) >> uint(2)));
        int _1404 = int(_1400) & 3;
        float _1406 = (*spvDescriptorSet0.vp_c15)._m0[int(_1402)][_1404];
        int _1408 = int(_1400) + 1;
        uint _1410 = uint(int(uint(_1408) >> uint(2)));
        int _1412 = _1408 & 3;
        float _1414 = (*spvDescriptorSet0.vp_c15)._m0[int(_1410)][_1412];
        float _1416 = _520 * _1396;
        float _1418 = fma(_454, _1388, _1416);
        float _1420 = fma(_452, _1406, _1418);
        float _1422 = _1420 + _1414;
        float _1424 = precise::clamp(_1422, 0.0, 1.0);
        float _1426 = -_1424;
        float _1428 = _1426 + _1211;
        float _1430 = fma(_1428, 500.0, 1.5);
        float _1432 = exp2(_1430);
        float _1434 = 0.0 + _1432;
        float _1436 = precise::clamp(_1434, 0.0, 1.0);
        _1376 = _1406;
        _1256 = _1436;
    }
    float _1438 = _1376;
    float _1440 = _1256;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1444 = _1037 + _1442;
    float _1446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1448 = _1039 + _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1452 = _1041 + _1450;
    float _1454 = _1444 * _1444;
    float _1456 = fma(_1448, _1448, _1454);
    float _1458 = fma(_1452, _1452, _1456);
    float _1460 = rsqrt(_1458);
    float _1462 = sqrt(_1458);
    float _1464 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1466 = _1448 * _1464;
    float _1468 = _1452 * _1464;
    float _1470 = _1466 * _1466;
    float _1472 = _1468 * _1468;
    float _1474 = _1470 + _1472;
    float _1476 = sqrt(_1474);
    bool _1478 = _1476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1482 = _1476 + _1480;
    float _1484 = _1452;
    float _1486 = _1482;
    float _1488 = _1454;
    float _1490 = _1444;
    if (_1478)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1484 = _1492;
    }
    float _1494 = _1484;
    if (_1478)
    {
        float _1496 = _1482 * _1494;
        _1486 = _1496;
    }
    float _1498 = _1486;
    if (_1478)
    {
        float _1500 = _1498 * 0.15915493667125701904296875;
        _1488 = _1500;
    }
    float _1502 = _1488;
    float _1504 = _1438;
    float _1506 = _1502;
    if (_1478)
    {
        float _1508 = _1502 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        _1504 = _1510;
    }
    float _1512 = _1504;
    float _1514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1516 = precise::max(0.0, _1514);
    float _1518 = _1460;
    float _1520 = _1516;
    if (_1478)
    {
        float _1522 = _1502 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = -_1464;
    float _1530 = -_1516;
    float _1532 = fma(_1444, _1528, _1530);
    float _1534 = _1514;
    if (_1478)
    {
        float _1536 = rsqrt(_1474);
        _1534 = _1536;
    }
    float _1538 = _1534;
    if (_1478)
    {
        float _1540 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1540;
    }
    float _1542 = _1520;
    float _1544 = _1542;
    if (!_1478)
    {
        _1506 = _1470;
    }
    float _1546 = _1506;
    float _1548 = _1546;
    if (_1478)
    {
        float _1550 = fma(_1512, _1542, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1544 = _1550;
    }
    float _1552 = _1544;
    float _1554 = _1552;
    float _1556 = _1526;
    if (_1478)
    {
        float _1558 = _1526 + (-1.0);
        _1490 = _1558;
    }
    float _1560 = _1490;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1564 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1562);
    float _1566 = precise::clamp(_1564, 0.0, 1.0);
    float _1568 = _1560;
    if (_1478)
    {
        float _1570 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _598 = _1570;
    }
    float _1572 = _598;
    if (!_1478)
    {
        _1568 = _1468;
    }
    float _1574 = _1568;
    float _1576 = _1538;
    float _1578 = _1574;
    if (_1478)
    {
        float _1580 = _1538 * _1552;
        _703 = _1580;
    }
    float _1582 = _703;
    if (!_1478)
    {
        _1554 = _1466;
    }
    float _1584 = _1554;
    float _1586 = _1584;
    if (!_1478)
    {
        _1576 = _1532;
    }
    float _1588 = _1576;
    float _1590 = _1588;
    if (_1478)
    {
        float _1592 = _1466 * _1582;
        _1586 = _1592;
    }
    float _1594 = _1586;
    if (_1478)
    {
        float _1596 = fma(_1532, _1526, _1572);
        _1590 = _1596;
    }
    float _1598 = _1590;
    if (_1478)
    {
        float _1600 = _1468 * _1582;
        _1578 = _1600;
    }
    float _1602 = _1578;
    if (!_1478)
    {
        _1556 = _1472;
    }
    float _1604 = _1556;
    float _1606 = _1604;
    if (_1478)
    {
        float _1608 = _1594 * _1594;
        _1548 = _1608;
    }
    float _1610 = _1548;
    float _1612 = -_1566;
    float _1614 = _1612 + 1.0;
    if (_1478)
    {
        float _1616 = _1602 * _1602;
        _1606 = _1616;
    }
    float _1618 = _1606;
    float _1620 = fma(_1598, _1598, _1610);
    float _1622 = _1620 + _1618;
    float _1624 = rsqrt(_1622);
    float _1626 = _1624 * _1594;
    float _1628 = _1624 * _1598;
    float _1630 = _1624 * _1602;
    float _1632 = abs(_1614);
    float _1634 = log2(_1632);
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1638 = -_1636;
    float _1640 = fma(_1628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1638);
    float _1642 = -_1630;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1640);
    float _1646 = fma(_1644, -0.5, 0.5);
    float _1648 = fma(_1644, 0.5, 0.5);
    float _1650 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1652 = fma(_1648, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1654 = sqrt(_1646);
    float _1656 = fma(_1648, _1652, -0.212114393711090087890625);
    float _1658 = _1628 + 1.0;
    float _1660 = fma(_1648, _1656, 1.570728778839111328125);
    float _1662 = exp2(_1650);
    float _1664 = _1654 * 0.636619746685028076171875;
    float _1666 = -_1660;
    float _1668 = fma(_1664, _1666, 1.0);
    float _1670 = -_1628;
    float _1672 = fma(_1662, _1658, _1670);
    float _1674 = fma(_1672, 0.5, 0.5);
    float2 _5112 = float2(_1668, _1674);
    float3 _1678 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5112, float2(0.0), isnan(_5112)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5112, float2(0.0), isnan(_5112)), level(0.0)).xyz;
    float _1680 = _1678.x;
    float _1682 = _1678.y;
    float _1684 = _1678.z;
    float _1686 = in.m_65.w;
    float _1688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1692 = _1690 != 0;
    float _1694 = in.m_69.y;
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1698 = _1696 != 0;
    float _1700 = -_472;
    float _1702 = _1700 + 1.0;
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1706 = _1704 != 0;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1714 = _1712 != 0;
    float _1716 = _1662;
    float _1718 = _1628;
    bool _1720 = _1714;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1724 = _1692;
    if (!_1692)
    {
        float _1726 = in.m_65.y;
        _1716 = _1726;
    }
    float _1728 = _1716;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1736 = _1734 != 0;
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (_1698)
    {
        float _1742 = in.m_65.z;
        _1740 = _1742;
    }
    float _1744 = _1740;
    float _1746 = 1.0 / _1732;
    bool _1748 = _438 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1750 = isnan(_438);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1756 = _1752 || _1754;
    float _1758 = float(_1756);
    float _1760 = _1582;
    if (!_1692)
    {
        float _1762 = in.m_65.z;
        _1760 = _1762;
    }
    float _1764 = _1760;
    bool _1766 = _1686 > 0.5;
    float _1768 = 0.0;
    if (_1706)
    {
        float _1770 = in.m_65.x;
        _1768 = _1770;
    }
    float _1772 = _1768;
    float _1774 = 1.0 / _1710;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1782 = _1780 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1784 = in.m_69.x;
    float _1786 = -_1694;
    float _1788 = _1786 + 1.0;
    float _1790 = _1778 * _1746;
    int _1792 = _1766 ? as_type<int>(_1788) : as_type<int>(_1694);
    float _1794 = _1694;
    if (!_1692)
    {
        _1718 = _1728;
    }
    float _1796 = _1718;
    bool _1798 = _550 != 0.0;
    bool _1800 = isnan(_550);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan(0.0);
    bool _1806 = _1802 || _1804;
    float _1808 = _1714 ? as_type<float>(_1792) : _1694;
    float _1810 = _1782 * _1774;
    float _1812 = _1796;
    float _1814 = _1728;
    if (_1692)
    {
        float _1816 = in.m_65.x;
        float _1818 = in.m_65.y;
        _1812 = _1816;
        _1814 = _1818;
    }
    float _1820 = _1812;
    float _1822 = _1814;
    float _1824 = _1764;
    if (_1698)
    {
        bool _1826 = _1744 > 0.5;
        _1720 = _1826;
    }
    bool _1828 = _1720;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1832 = _438 + _1830;
    bool _1834 = _438 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1836 = isnan(_438);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = in.m_71.x;
    float _1848 = in.m_71.y;
    float _1850 = in.m_71.z;
    if (!_1692)
    {
        _1722 = _1764;
    }
    float _1852 = _1722;
    float _1854 = fma(_1790, _1832, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1856 = _548 == 0.0;
    bool _1858 = !_1806;
    bool _1860 = _1856 && _1858;
    float _1862 = -_1844;
    float _1864 = _1862 + 1.0;
    bool _1866 = _552 == 0.0;
    bool _1868 = _1866 && _1860;
    float _1870 = _1758 * _1864;
    float _1872 = -_1758;
    float _1874 = _1872 + 1.0;
    float _1876 = _1852;
    int _1878 = as_type<int>(_1854);
    if (_1692)
    {
        _1876 = _1822;
    }
    float _1880 = _1876;
    if (_1692)
    {
        _1824 = _1822;
    }
    float _1882 = _1824;
    if (_1706)
    {
        bool _1884 = _1772 > 0.5;
        _1724 = _1884;
    }
    bool _1886 = _1724;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1890 = _438 + _1888;
    float _1892 = _1846;
    float _1894 = _1848;
    float _1896 = _1850;
    float _1898 = _1890;
    if (!_1868)
    {
        float _1900 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1846);
        _1892 = _1900;
    }
    float _1902 = _1892;
    if (!_1868)
    {
        float _1904 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1848);
        _1894 = _1904;
    }
    float _1906 = _1894;
    if (!_1868)
    {
        float _1908 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1850);
        _1896 = _1908;
    }
    float _1910 = _1896;
    float _1912 = fma(_1810, _1890, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1914 = _438 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1916 = isnan(_438);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1922 = _1918 || _1920;
    float _1924 = float(_1922);
    float _1926 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1706)
    {
        _1898 = _1784;
    }
    float _1928 = _1898;
    bool _1930 = _1822 > 0.5;
    float _1932 = _1924 * _1874;
    float _1934 = _1928;
    if (!_1706)
    {
        _600 = _1928;
    }
    float _1936 = _600;
    float _1938 = -_1924;
    float _1940 = _1938 + 1.0;
    float _1942 = _1936;
    if (_1706)
    {
        _1934 = _1784;
    }
    float _1944 = _1934;
    float _1946 = _1854 * _1932;
    float _1948 = fma(_1738, _1808, -0.5);
    if (!_1698)
    {
        _602 = _1944;
    }
    float _1950 = _602;
    float _1952 = _1950;
    if (_1698)
    {
        float _1954 = -_1944;
        float _1956 = _1954 + 1.0;
        _1878 = as_type<int>(_1956);
    }
    int _1958 = _1878;
    if (_1706)
    {
        float _1960 = -_1944;
        float _1962 = _1960 + 1.0;
        _604 = as_type<int>(_1962);
    }
    int _1964 = _604;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1968 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1698)
    {
        float _1970 = _1828 ? as_type<float>(_1958) : _1944;
        _1952 = _1970;
    }
    float _1972 = _1952;
    if (_1706)
    {
        float _1974 = _1886 ? as_type<float>(_1964) : _1944;
        _1942 = _1974;
    }
    float _1976 = _1942;
    float _1978 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1966);
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1986 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1946);
    float _1988 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    float _1990 = -_1984;
    float _1992 = fma(_1968, 2.0, _1990);
    float _1994 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1996 = abs(_560);
    float _1998 = log2(_1996);
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2002 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2004 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2006 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1994);
    float _2008 = fma(_1912, _1870, _1986);
    float _2010 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2002);
    float _2012 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2004);
    float _2014 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2016 = fma(_1926, -2.0, _2000);
    if (_1736)
    {
        float _2018 = _1930 ? _1788 : _1694;
        _1794 = _2018;
    }
    float _2020 = _1794;
    float _2022 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2012);
    float _2024 = fma(_2014, _1972, -0.5);
    float _2026 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2006);
    float _2028 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2010);
    float _2030 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2008);
    float _2032 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2034 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2016);
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2040 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1978);
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2044 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2046 = exp2(_2032);
    float _2048 = -_142;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1992);
    float _2052 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1988);
    float _2054 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2044);
    float _2056 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2058 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2060 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2062 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2054);
    float _2064 = _2030 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2068 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2062);
    float _2070 = -_2034;
    float _2072 = fma(_2052, _1948, _2070);
    out.m_73.x = _2056;
    out.m_73.y = _2058;
    out.m_73.z = _2060;
    out.m_73.w = _2064;
    float _2074 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2076 = _2068 + _1147;
    float _2078 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2080 = precise::clamp(_2078, 0.0, 1.0);
    out.gl_Position.x = _1185;
    out.gl_Position.y = _1187;
    out.gl_Position.z = _2068;
    out.gl_Position.w = _1147;
    float _2082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2084 = fma(_2040, _2024, _2050);
    float _2086 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2088 = _2072 + 0.5;
    out.m_75.x = _2026;
    out.m_75.y = _2028;
    out.m_75.z = _2022;
    float _2090 = _2084 + 0.5;
    float _2092 = _2074 * _2066;
    float _2094 = _2076 * 0.5;
    float _2096 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2098 = fma(_2080, -2.0, 3.0);
    float _2100 = _2080 * _2080;
    if (!_1111)
    {
        _1193 = 1.0;
    }
    float _2102 = _1193;
    float _2104 = exp2(_2096);
    float _2106 = _2102;
    if (_1111)
    {
        bool _2108 = _1229 >= _1189;
        bool _2110 = isnan(_1229);
        bool _2112 = _2108 || _2110;
        bool _2114 = isnan(_1189);
        bool _2116 = _2112 || _2114;
        float _2118 = float(_2116);
        _2106 = _2118;
    }
    float _2120 = _2106;
    float _2122 = _2100 * _2098;
    out.m_77.z = _2094;
    out.m_77.w = _1147;
    float _2124 = _2086 * _2082;
    float _2126 = -_2122;
    float _2128 = _2126 + 1.0;
    float _2130 = _2120 * _1440;
    bool _2132 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2134 = isnan(_1462);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2140 = _2136 || _2138;
    float _2142 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2122);
    bool _2144 = _560 <= 8000.0;
    bool _2146 = isnan(_560);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan(8000.0);
    bool _2152 = _2148 || _2150;
    float _2154 = float(_2152);
    out.m_79.x = _2092;
    out.m_79.y = _2124;
    out.m_79.z = _2090;
    out.m_79.w = _2088;
    float _2156 = _2154 * _2142;
    float _2158 = -_2104;
    float _2160 = _2158 + 1.0;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2164 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2166 = _2164;
    float _2168 = 1.0;
    if (!_2140)
    {
        _1153 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2170 = _1153;
    float _2172 = _1702 * _2162;
    float _2174 = precise::clamp(_2172, 0.0, 1.0);
    float _2176 = _2164 * _1231;
    float _2178 = -_2164;
    float _2180 = _2178 + 1.0;
    float _2182 = _2180;
    float _2184 = _2170;
    float _2186 = _2170;
    if (!_2140)
    {
        _2166 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2188 = _2166;
    float _2190 = -_2174;
    float _2192 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2194 = _1242 * _2176;
    float _2196 = _1242 * _2180;
    float _2198 = _2188;
    float _2200 = _2188;
    if (!_2140)
    {
        _2168 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2202 = _2168;
    float _2204 = -_2130;
    float _2206 = fma(_2204, _2192, 1.0);
    float _2208 = precise::clamp(_2206, 0.0, 1.0);
    float _2210 = _2202;
    float _2212 = _2202;
    if (!_2140)
    {
        _606 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2214 = _606;
    float _2216 = _2214;
    float _2218 = _2214;
    if (!_2140)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2220 = _2182;
    float _2222 = _2208 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2224 = _1316 * _1374;
    out.m_83.x = _2222;
    float _2226 = _2224 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2228 = _2224;
    float _2230 = _2220;
    float _2232 = _2220;
    if (!_2140)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2234 = _2228;
    float _2236 = _1684 * _2176;
    float _2238 = fma(_1680, _2194, _1236);
    float _2240 = fma(_1682, _2194, _1238);
    float _2242 = fma(_1242, _2236, _1240);
    out.m_85.x = _2238;
    out.m_85.y = _2240;
    out.m_85.z = _2242;
    out.m_85.w = _2196;
    bool _2244 = !_2140;
    float _2246 = _2234;
    float _2248 = _2234;
    if (!_2244)
    {
        bool _2250 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2252 = isnan(_1462);
        bool _2254 = _2250 || _2252;
        bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2258 = _2254 || _2256;
        if (!_2258)
        {
            float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2262 = _1462 + _2260;
            float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2266 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2264;
            float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2272 = 1.0 / _2266;
            float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2280 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2286 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2288 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2290 = _2262 * _2272;
            float _2292 = precise::clamp(_2290, 0.0, 1.0);
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2298 = fma(_2292, _2270, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2300 = fma(_2292, _2296, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2302 = fma(_2292, _2276, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2304 = fma(_2292, _2280, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2306 = fma(_2292, _2284, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2308 = fma(_2292, _2288, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2218 = _2302;
            _2200 = _2306;
            _2212 = _2298;
            _2232 = _2304;
            _2186 = _2300;
            _2248 = _2308;
            _2310 = true;
        }
        else
        {
            bool _2312 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2314 = isnan(_1462);
            bool _2316 = _2312 || _2314;
            bool _2318 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2320 = _2316 || _2318;
            if (!_2320)
            {
                _2210 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2322 = _2210;
            _2212 = _2322;
            if (!_2320)
            {
                _2216 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2324 = _2216;
            _2218 = _2324;
            if (!_2320)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2326 = _2184;
            _2186 = _2326;
            if (!_2320)
            {
                _2230 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2328 = _2230;
            _2232 = _2328;
            if (!_2320)
            {
                _2198 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2330 = _2198;
            _2200 = _2330;
            if (!_2320)
            {
                _2246 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2332 = _2246;
            bool _2334 = !_2320;
            _2248 = _2332;
            if (!_2334)
            {
                bool _2336 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2338 = isnan(_1462);
                bool _2340 = _2336 || _2338;
                bool _2342 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2344 = _2340 || _2342;
                if (!_2344)
                {
                    float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2348 = _1462 + _2346;
                    float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2352 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2350;
                    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2356 = _2354 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2358 = 1.0 / _2352;
                    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2376 = _2348 * _2358;
                    float _2378 = precise::clamp(_2376, 0.0, 1.0);
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2384 = fma(_2378, _2356, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2386 = fma(_2378, _2382, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2388 = fma(_2378, _2362, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2390 = fma(_2378, _2366, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2392 = fma(_2378, _2370, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2394 = fma(_2378, _2374, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2218 = _2388;
                    _2200 = _2392;
                    _2212 = _2384;
                    _2232 = _2390;
                    _2186 = _2386;
                    _2248 = _2394;
                    _2310 = true;
                }
                else
                {
                    _2218 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2200 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2212 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2232 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2248 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2310 = false;
    float _2396 = _2218;
    float _2398 = _2200;
    float _2400 = _2212;
    float _2402 = _2232;
    float _2404 = _2186;
    float _2406 = _2248;
    float _2408 = _2226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2410 = fma(_2028, -0.5, 0.5);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = -_2396;
    float _2416 = _2414 + _2398;
    float _2418 = -_2400;
    float _2420 = _2418 + _2402;
    out.m_87.x = 0.0;
    float _2422 = fma(_2412, _2416, _2396);
    float _2424 = -_2404;
    float _2426 = _2424 + _2406;
    float _2428 = fma(_2412, _2420, _2400);
    float _2430 = _2422 * 0.586610972881317138671875;
    bool _2432 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2434 = fma(_2412, _2426, _2404);
    out.m_59.x = _2408;
    float _2436 = fma(_2428, 0.298911988735198974609375, _2430);
    bool _2438 = _1316 > 0.0;
    bool _2440 = isnan(_1316);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan(0.0);
    bool _2446 = _2442 || _2444;
    float _2448 = fma(_2434, 0.114477999508380889892578125, _2436);
    bool _2450 = _1374 <= 0.0;
    bool _2452 = !_2446;
    bool _2454 = _2450 || _2452;
    float _2456 = -_2448;
    float _2458 = _2428 + _2456;
    float _2460 = -_2448;
    float _2462 = _2422 + _2460;
    float _2464 = -_2448;
    float _2466 = _2434 + _2464;
    float _2468 = fma(_2458, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2448);
    float _2470 = fma(_2462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2448);
    float _2472 = fma(_2466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2448);
    bool _2474 = !_2432;
    if (!_2474)
    {
        float _2476 = -_1037;
        float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2480 = -_1039;
        float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2484 = -_1041;
        float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2488 = _2478 * _2478;
        float _2490 = fma(_2482, _2482, _2488);
        float _2492 = fma(_2486, _2486, _2490);
        float _2494 = sqrt(_2492);
        float _2496 = rsqrt(_2492);
        float _2498 = -_2494;
        float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2502 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2504 = precise::clamp(_2502, 0.0, 1.0);
        float _2506 = _2482 * _2496;
        float _2508 = _2478 * _2496;
        float _2510 = abs(_2504);
        float _2512 = log2(_2510);
        float _2514 = _2486 * _2496;
        float _2516 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2518 = _2028 * _2508;
        float _2520 = -_2508;
        float _2522 = -_2516;
        float _2524 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2522);
        float _2526 = fma(_2026, _2506, _2518);
        float _2528 = -_2514;
        float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2524);
        float _2532 = fma(_2022, _2514, _2526);
        float _2534 = precise::clamp(_2532, 0.0, 1.0);
        float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2538 = _2530 + _2536;
        float _2540 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2542 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2544 = precise::clamp(_2542, 0.0, 1.0);
        float _2546 = exp2(_2540);
        float _2548 = _2546 * _2544;
        float _2550 = _2534 * _2548;
        float _2552 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2554 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2556 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2552;
        out.m_87.y = _2554;
        out.m_87.z = _2556;
    }
    out.m_89.x = _2468;
    out.m_89.y = _2470;
    out.m_89.z = _2472;
    if (!_2454)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2558;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2310 = false;
    bool _430 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_56.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_59.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2615 = as_type<float>(_124);
        out.gl_Position.z = _2615;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_61.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _118 = _144;
    }
    float _146 = _118;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_59.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2684 = as_type<float>(_160);
        out.gl_Position.z = _2684;
    }
    if (_152)
    {
        return out;
    }
    float _162 = in.m_63.w;
    float _164 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_61.x;
    float _178 = in.m_61.y;
    float _180 = in.m_61.z;
    float _182 = in.m_56.x;
    float _184 = in.m_56.y;
    float _186 = in.m_56.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_65.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_108);
        float _308 = 1.0 / _306;
        float _310 = _142 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = 1.0 / _332;
    bool _336 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_312);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_328;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = _346 * _350;
    float _368 = -_346;
    float _370 = _368 + 1.0;
    float _372 = _316 * _334;
    float _374 = in.m_63.x;
    float _376 = in.m_63.y;
    float _378 = in.m_63.z;
    float _380 = fma(_354, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_364, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = fma(_358, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = _380 * _366;
    float _388 = _382 * _366;
    float _390 = _384 * _366;
    float _392 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _398 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].x, _392);
    float _400 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].y, _394);
    float _402 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].z, _396);
    float _404 = _398 * _374;
    float _406 = _400 * _376;
    float _408 = _402 * _378;
    bool _410 = !_360;
    float _428;
    if (!_410)
    {
        float _412 = in.m_65.x;
        float _414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _416 = _412 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _420 = _418 * _414;
        float _422 = floor(_420);
        float _424 = -_422;
        float _426 = _420 + _424;
        _428 = _426;
        _430 = true;
    }
    else
    {
        float _432 = float(_108);
        float _434 = 1.0 / _432;
        float _436 = _142 * _434;
        _428 = _436;
    }
    _430 = false;
    float _438 = _428;
    float _440 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _442 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _444 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _440);
    float _446 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _442);
    float _448 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _450 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
    float _452 = _448 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _454 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _456 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _458 = fma(_454, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _460 = floor(_456);
    float _462 = floor(_458);
    float _464 = -_460;
    float _466 = _456 + _464;
    float _468 = -_462;
    float _470 = _458 + _468;
    float2 _3180 = float2(_470, _466);
    float _472 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3180, float2(0.0), isnan(_3180)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3180, float2(0.0), isnan(_3180)), level(0.0)).x;
    float _474 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _476 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _478 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _474);
    float _480 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _482 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _484 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    bool _486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _488 = isnan(0.5);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _494 = _490 || _492;
    float _496 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _498 = _496 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _500 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[11].x, _498);
    float _502 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[11].z, _500);
    float _504 = _496 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _506 = _502 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _508 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[10].x, _504);
    float _510 = 1.0 / _506;
    float _512 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[10].z, _508);
    float _514 = _512 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _516 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _518 = _514 + _506;
    float _520 = _496 + _516;
    float _522 = _520 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _524 = _518 * _510;
    float _526 = _524 * 0.5;
    float _528 = _520 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _530 = fma(_454, (*spvDescriptorSet0.vp_c15)._m0[127].x, _522);
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _534 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[30].w, _532);
    float _536 = fma(_454, (*spvDescriptorSet0.vp_c15)._m0[126].x, _528);
    float _538 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[127].z, _530);
    float _540 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[126].z, _536);
    float _542 = 1.0 / _534;
    float _544 = _538 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _546 = _540 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _548 = in.m_67.x;
    float _550 = in.m_67.y;
    float _552 = in.m_67.z;
    float _554 = trunc(_546);
    int _556 = int(_554);
    float _558 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _560 = _542 * _558;
    float _562 = trunc(_544);
    int _564 = int(_562);
    bool _566 = _560 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _568 = _560 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _570 = !_566;
    int _572 = _570 ? 0 : 1;
    int _574 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _576 = _556 + _574;
    int _578 = _576 + 1;
    float _580 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _550);
    int _582 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _584 = _564 + _582;
    int _586 = _584 + 1;
    float _588 = _476 * _580;
    int _590 = 2;
    int _592 = _578;
    float _594 = _546;
    float _596 = _544;
    float _598 = _454;
    float _600 = _438;
    float _602 = _548;
    int _604 = as_type<int>(_550);
    float _606 = 1.0;
    if (!_566)
    {
        _590 = 1;
    }
    int _608 = _590;
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _548);
    int _612 = _608;
    if (!_568)
    {
        _612 = _572;
    }
    int _614 = _612;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _552);
    bool _618 = _578 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _620 = _480 * _610;
    int _622 = _578 | _586;
    float _624 = _588 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _626 = _614 << 6;
    float _628 = _588 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _630 = _622 < 0;
    bool _632 = _630 || _618;
    float _634 = _482 * _616;
    int _636 = _626 + 96;
    uint _639 = uint(int(uint(_636) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.vp_c15)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.vp_c15)._m0[int(_649)][_651];
    float _655 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[26].x, _624);
    bool _657 = _586 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _659 = _657 || _632;
    float _661 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[24].x, _628);
    float _663 = _588 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _665 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[26].z, _655);
    float _667 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[24].z, _661);
    int _669 = _626 + 104;
    uint _671 = uint(int(uint(_669) >> uint(2)));
    uint _673 = uint(int(uint(int(_671)) >> uint(2)));
    int _675 = int(_671) & 3;
    float _677 = (*spvDescriptorSet0.vp_c15)._m0[int(_673)][_675];
    int _679 = int(_671) + 1;
    uint _681 = uint(int(uint(_679) >> uint(2)));
    int _683 = _679 & 3;
    float _685 = (*spvDescriptorSet0.vp_c15)._m0[int(_681)][_683];
    float _687 = _665 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _689 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[25].x, _663);
    float _691 = _667 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _693 = _452 + _687;
    float _695 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[25].z, _689);
    int _697 = _622;
    int _699 = as_type<int>(_616);
    float _701 = _693;
    float _703 = as_type<float>(_626);
    if (!_659)
    {
        int _705 = _586 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _707 = _705 + _578;
        _592 = _707;
    }
    int _709 = _592;
    int _711 = _626 + 48;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.vp_c15)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.vp_c15)._m0[int(_723)][_725];
    float _729 = _454 + _691;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _733 = _693 + _731;
    float _735 = _733;
    if (!_659)
    {
        int _737 = _709 << 2;
        _697 = _737;
    }
    int _739 = _697;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _729 + _741;
    int _745 = _739;
    if (!_659)
    {
        uint _747 = uint(int(uint(_709) >> uint(2)));
        _699 = int(_747);
    }
    int _749 = _699;
    float _751 = _733 * _733;
    if (!_659)
    {
        int _753 = 12 & _739;
        _745 = _753;
    }
    int _755 = _745;
    int _757 = _626 + 64;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    uint _761 = uint(int(uint(int(_759)) >> uint(2)));
    int _763 = int(_759) & 3;
    float _765 = (*spvDescriptorSet0.vp_c15)._m0[int(_761)][_763];
    int _767 = int(_759) + 1;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    int _771 = _767 & 3;
    float _773 = (*spvDescriptorSet0.vp_c15)._m0[int(_769)][_771];
    float _775 = fma(_743, _743, _751);
    float _777 = 0.0;
    if (!_659)
    {
        int _779 = _749 << 4;
        int _781 = _779 + _755;
        _777 = as_type<float>(_781);
    }
    float _783 = _777;
    float _785 = sqrt(_775);
    int _787 = _626 + 56;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    uint _791 = uint(int(uint(int(_789)) >> uint(2)));
    int _793 = int(_789) & 3;
    float _795 = (*spvDescriptorSet0.vp_c15)._m0[int(_791)][_793];
    int _797 = int(_789) + 1;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    int _801 = _797 & 3;
    float _803 = (*spvDescriptorSet0.vp_c15)._m0[int(_799)][_801];
    int _805 = _626 + 72;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    uint _809 = uint(int(uint(int(_807)) >> uint(2)));
    int _811 = int(_807) & 3;
    float _813 = (*spvDescriptorSet0.vp_c15)._m0[int(_809)][_811];
    int _815 = int(_807) + 1;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    int _819 = _815 & 3;
    float _821 = (*spvDescriptorSet0.vp_c15)._m0[int(_817)][_819];
    bool _823 = _785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _825 = _520 * _653;
    int _827 = _626 + 80;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    uint _831 = uint(int(uint(int(_829)) >> uint(2)));
    int _833 = int(_829) & 3;
    float _835 = (*spvDescriptorSet0.vp_c15)._m0[int(_831)][_833];
    int _837 = int(_829) + 1;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    int _841 = _837 & 3;
    float _843 = (*spvDescriptorSet0.vp_c15)._m0[int(_839)][_841];
    float _845 = _653;
    if (!_659)
    {
        float _847 = floor(_546);
        _845 = _847;
    }
    float _849 = _845;
    float _851 = fma(_454, _645, _825);
    float _853 = fma(_452, _677, _851);
    int _855 = _626 + 88;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    uint _859 = uint(int(uint(int(_857)) >> uint(2)));
    int _861 = int(_857) & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    int _865 = int(_857) + 1;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    int _869 = _865 & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    float _873 = _695 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _875 = _853 + _685;
    float _877 = _496 + _873;
    float _879 = _520 * _727;
    float _881 = _783;
    float _883 = _873;
    float _885 = _719;
    float _887 = _685;
    if (!_659)
    {
        int _889 = as_type<int>(_783) + 400;
        uint _891 = uint(int(uint(_889) >> uint(2)));
        uint _893 = uint(int(uint(int(_891)) >> uint(2)));
        int _895 = int(_891) & 3;
        float _897 = (*spvDescriptorSet0.vp_c15)._m0[int(_893)][_895];
        _881 = _897;
    }
    float _899 = _881;
    float _901 = 1.0 / _875;
    if (!_823)
    {
        _883 = _877;
    }
    float _903 = _883;
    float _905 = fma(_454, _719, _879);
    float _907 = _903;
    if (!_823)
    {
        _885 = _729;
    }
    float _909 = _885;
    float _911 = _520 * _773;
    float _913 = fma(_454, _765, _911);
    bool _915 = !_823;
    float _917 = _909;
    float _919 = _765;
    if (!_915)
    {
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _923 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _925 = _785 + _923;
        float _927 = rsqrt(_775);
        float _929 = _925 * _921;
        float _931 = _877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = _929 * 0.15915493667125701904296875;
        float _935 = _933 * 6.283185482025146484375;
        float _937 = cos(_935);
        float _939 = _933 * 6.283185482025146484375;
        float _941 = sin(_939);
        float _943 = _937 + (-1.0);
        float _945 = fma(_941, _931, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _947 = _943 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _949 = _927 * _945;
        float _951 = fma(_877, _937, _947);
        float _953 = fma(_743, _949, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _955 = fma(_733, _949, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _917 = _953;
        _701 = _955;
        _919 = _949;
        _907 = _951;
        _887 = _933;
    }
    float _957 = _917;
    float _959 = _701;
    float _961 = _919;
    float _963 = _907;
    float _965 = _887;
    float _967 = fma(_452, _795, _905);
    float _969 = fma(_452, _813, _913);
    float _971 = _965;
    float _973 = _963;
    float _975 = _961;
    float _977 = _957;
    if (_494)
    {
        _735 = _957;
    }
    float _979 = _735;
    float _981 = _979;
    if (_494)
    {
        _971 = _959;
    }
    float _983 = _971;
    float _985 = _983;
    if (!_494)
    {
        float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _989 = _496 + _987;
        float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _993 = _454 + _991;
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _997 = -_496;
        float _999 = _997 + _963;
        float _1001 = _989 * _989;
        float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1005 = _452 + _1003;
        float _1007 = -_454;
        float _1009 = _1007 + _957;
        float _1011 = fma(_993, _993, _1001);
        float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1015 = fma(_1005, _1005, _1011);
        float _1017 = sqrt(_1015);
        float _1019 = _995 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1021 = precise::min(_1017, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1023 = _1021 * _1013;
        float _1025 = _1019 * _1023;
        float _1027 = -_452;
        float _1029 = _1027 + _959;
        float _1031 = fma(_999, _1025, _496);
        float _1033 = fma(_1009, _1025, _454);
        float _1035 = fma(_1029, _1025, _452);
        _973 = _1031;
        _981 = _1033;
        _985 = _1035;
        _975 = _995;
        _977 = _1009;
    }
    float _1037 = _973;
    float _1039 = _981;
    float _1041 = _985;
    float _1043 = _975;
    float _1045 = _977;
    float _1047 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1049 = _967 + _803;
    float _1051 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1053 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1055 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1047);
    float _1057 = _1049 * _901;
    float _1059 = _969 + _821;
    float _1061 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1051);
    float _1063 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1055);
    float _1065 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1053);
    bool _1067 = _1057 >= 0.0;
    float _1069 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1073 = _1059 * _901;
    float _1075 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1077 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1065);
    bool _1079 = _1057 <= 1.0;
    bool _1081 = _1079 && _1067;
    float _1083 = _1045;
    if (!_659)
    {
        float _1085 = rint(_899);
        float _1087 = precise::max(_1085, 0.0);
        uint _1089 = uint(_1087);
        uint _1091 = clamp(_1089, 0u, 65535u);
        _1083 = as_type<float>(_1091);
    }
    float _1093 = _1083;
    float _1095 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1075);
    float _1097 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1099 = _1073 >= 0.0;
    bool _1101 = _1099 && _1081;
    float _1103 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1105 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1095);
    float _1107 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1109 = _1073 <= 1.0;
    bool _1111 = _1109 && _1101;
    float _1113 = _1043;
    float _1115 = _1107;
    float _1117 = _1093;
    if (!_659)
    {
        float _1119 = floor(_544);
        _1113 = _1119;
    }
    float _1121 = _1113;
    float _1123 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1125 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1127 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1129 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1131 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1125);
    float _1133 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1135 = -_1129;
    float _1137 = fma(_1135, _1103, 1.0);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1131);
    float _1141 = _520 * _843;
    float _1143 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1133);
    float _1145 = log2(_1137);
    float _1147 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1139);
    float _1149 = _1133;
    float _1151 = _1137;
    float _1153 = _1147;
    if (_1111)
    {
        float _1155 = float(_614);
        _1149 = _1155;
    }
    float _1157 = _1149;
    float _1159 = fma(_454, _835, _1141);
    float _1161 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1107);
    float _1163 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1143);
    if (!_659)
    {
        float _1165 = -_1121;
        float _1167 = _544 + _1165;
        _1115 = _1167;
    }
    float _1169 = _1115;
    float _1171 = fma(_452, _863, _1159);
    float _1173 = 1.0 / _1147;
    float _1175 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1161);
    if (!_659)
    {
        float _1177 = -_849;
        float _1179 = _546 + _1177;
        _1151 = _1179;
    }
    float _1181 = _1151;
    float _1183 = _1171 + _871;
    float _1185 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1163);
    float _1187 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1175);
    float _1189 = _1183 * _901;
    float _1191 = _1157;
    float _1193 = _1185;
    if (_1111)
    {
        float _1195 = rint(_1157);
        float _1197 = precise::max(_1195, 0.0);
        uint _1199 = uint(_1197);
        uint _1201 = clamp(_1199, 0u, 65535u);
        _1191 = as_type<float>(_1201);
    }
    float _1203 = _1191;
    float _1205 = _1145 * 0.693147182464599609375;
    float _1207 = _1169;
    if (!_659)
    {
        float3 _4408 = float3(_1181, _1169, float(as_type<int>(_1093)));
        float3 _4412 = select(_4408, float3(0.0), isnan(_4408));
        float _1209 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4412.xy, uint(rint(_4412.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4412.xy, uint(rint(_4412.z)), level(0.0)).x;
        _1207 = _1209;
    }
    float _1211 = _1207;
    float _1213 = _1205 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1215 = _1185 * _1173;
    float _1217 = _1187 * _1173;
    float _1219 = fma(_1215, 0.5, 0.5);
    float _1221 = fma(_1217, -0.5, 0.5);
    float _1223 = _1203;
    float _1225 = _1173;
    if (_1111)
    {
        float3 _4443 = float3(_1057, _1073, float(as_type<int>(_1203)));
        float3 _4445 = select(_4443, float3(0.0), isnan(_4443));
        float _1227 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4445.xy, uint(rint(_4445.z)), _1189, level(0.0));
        _1223 = _1227;
    }
    float _1229 = _1223;
    float3 _4455 = float3(_1219, _1221, _1213);
    float _1231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4455, float3(0.0), isnan(_4455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4455, float3(0.0), isnan(_4455)), level(0.0)).x;
    float3 _4464 = float3(_1219, _1221, _1213);
    float4 _1234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4464, float3(0.0), isnan(_4464)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4464, float3(0.0), isnan(_4464)), level(0.0)).xyzw;
    float _1236 = _1234.x;
    float _1238 = _1234.y;
    float _1240 = _1234.z;
    float _1242 = _1234.w;
    bool _1244 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1246 = isnan(0.5);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1252 = _1248 || _1250;
    if (_659)
    {
        _1225 = 1.0;
    }
    float _1254 = _1225;
    float _1256 = _1254;
    if (_1252)
    {
        _594 = 1.0;
    }
    float _1258 = _594;
    float _1260 = _1258;
    if (_1252)
    {
        _596 = 1.0;
    }
    float _1262 = _596;
    float _1264 = _1262;
    if (!_1252)
    {
        float _1266 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1268 = _1266 * 0.15915493667125701904296875;
        float _1270 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1272 = _1268 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1270 * 0.15915493667125701904296875;
        float _1278 = _1268 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = 1.0 / _1274;
        float _1284 = _1276 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = _1276 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1286 * _1288;
        float _1296 = 1.0 / _1294;
        float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1300 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1298;
        float _1302 = 1.0 / _1300;
        float _1304 = _1292 * _1296;
        float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1308 = fma(_560, _1304, _1306);
        float _1310 = _1308 * _1302;
        float _1312 = precise::clamp(_1310, 0.0, 1.0);
        _1117 = _1282;
        _1264 = _1312;
    }
    float _1314 = _1117;
    float _1316 = _1264;
    float _1318 = _1314;
    if (!_1252)
    {
        float _1320 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1322 = _1320 * 0.15915493667125701904296875;
        float _1324 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1326 = _1322 * 6.283185482025146484375;
        float _1328 = cos(_1326);
        float _1330 = _1324 * 0.15915493667125701904296875;
        float _1332 = _1322 * 6.283185482025146484375;
        float _1334 = sin(_1332);
        float _1336 = 1.0 / _1328;
        float _1338 = _1330 * 6.283185482025146484375;
        float _1340 = cos(_1338);
        float _1342 = _1334 * _1336;
        float _1344 = _1330 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        float _1348 = _1340 * _1342;
        float _1350 = 1.0 / _1348;
        float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1354 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1352;
        float _1356 = 1.0 / _1354;
        float _1358 = _1346 * _1350;
        float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1362 = fma(_560, _1358, _1360);
        float _1364 = _1362 * _1356;
        float _1366 = precise::clamp(_1364, 0.0, 1.0);
        float _1368 = -_1366;
        float _1370 = _1368 + 1.0;
        _1318 = _1330;
        _1260 = _1370;
    }
    float _1372 = _1318;
    float _1374 = _1260;
    float _1376 = _1372;
    if (!_659)
    {
        int _1378 = _709 << 4;
        int _1380 = _1378 + 2048;
        uint _1382 = uint(int(uint(_1380) >> uint(2)));
        uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
        int _1386 = int(_1382) & 3;
        float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
        int _1390 = int(_1382) + 1;
        uint _1392 = uint(int(uint(_1390) >> uint(2)));
        int _1394 = _1390 & 3;
        float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
        int _1398 = _1380 + 8;
        uint _1400 = uint(int(uint(_1398) >> uint(2)));
        uint _1402 = uint(int(uint(int(_1400)) >> uint(2)));
        int _1404 = int(_1400) & 3;
        float _1406 = (*spvDescriptorSet0.vp_c15)._m0[int(_1402)][_1404];
        int _1408 = int(_1400) + 1;
        uint _1410 = uint(int(uint(_1408) >> uint(2)));
        int _1412 = _1408 & 3;
        float _1414 = (*spvDescriptorSet0.vp_c15)._m0[int(_1410)][_1412];
        float _1416 = _520 * _1396;
        float _1418 = fma(_454, _1388, _1416);
        float _1420 = fma(_452, _1406, _1418);
        float _1422 = _1420 + _1414;
        float _1424 = precise::clamp(_1422, 0.0, 1.0);
        float _1426 = -_1424;
        float _1428 = _1426 + _1211;
        float _1430 = fma(_1428, 500.0, 1.5);
        float _1432 = exp2(_1430);
        float _1434 = 0.0 + _1432;
        float _1436 = precise::clamp(_1434, 0.0, 1.0);
        _1376 = _1406;
        _1256 = _1436;
    }
    float _1438 = _1376;
    float _1440 = _1256;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1444 = _1037 + _1442;
    float _1446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1448 = _1039 + _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1452 = _1041 + _1450;
    float _1454 = _1444 * _1444;
    float _1456 = fma(_1448, _1448, _1454);
    float _1458 = fma(_1452, _1452, _1456);
    float _1460 = rsqrt(_1458);
    float _1462 = sqrt(_1458);
    float _1464 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1466 = _1448 * _1464;
    float _1468 = _1452 * _1464;
    float _1470 = _1466 * _1466;
    float _1472 = _1468 * _1468;
    float _1474 = _1470 + _1472;
    float _1476 = sqrt(_1474);
    bool _1478 = _1476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1482 = _1476 + _1480;
    float _1484 = _1452;
    float _1486 = _1482;
    float _1488 = _1454;
    float _1490 = _1444;
    if (_1478)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1484 = _1492;
    }
    float _1494 = _1484;
    if (_1478)
    {
        float _1496 = _1482 * _1494;
        _1486 = _1496;
    }
    float _1498 = _1486;
    if (_1478)
    {
        float _1500 = _1498 * 0.15915493667125701904296875;
        _1488 = _1500;
    }
    float _1502 = _1488;
    float _1504 = _1438;
    float _1506 = _1502;
    if (_1478)
    {
        float _1508 = _1502 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        _1504 = _1510;
    }
    float _1512 = _1504;
    float _1514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1516 = precise::max(0.0, _1514);
    float _1518 = _1460;
    float _1520 = _1516;
    if (_1478)
    {
        float _1522 = _1502 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = -_1464;
    float _1530 = -_1516;
    float _1532 = fma(_1444, _1528, _1530);
    float _1534 = _1514;
    if (_1478)
    {
        float _1536 = rsqrt(_1474);
        _1534 = _1536;
    }
    float _1538 = _1534;
    if (_1478)
    {
        float _1540 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1540;
    }
    float _1542 = _1520;
    float _1544 = _1542;
    if (!_1478)
    {
        _1506 = _1470;
    }
    float _1546 = _1506;
    float _1548 = _1546;
    if (_1478)
    {
        float _1550 = fma(_1512, _1542, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1544 = _1550;
    }
    float _1552 = _1544;
    float _1554 = _1552;
    float _1556 = _1526;
    if (_1478)
    {
        float _1558 = _1526 + (-1.0);
        _1490 = _1558;
    }
    float _1560 = _1490;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1564 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1562);
    float _1566 = precise::clamp(_1564, 0.0, 1.0);
    float _1568 = _1560;
    if (_1478)
    {
        float _1570 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _598 = _1570;
    }
    float _1572 = _598;
    if (!_1478)
    {
        _1568 = _1468;
    }
    float _1574 = _1568;
    float _1576 = _1538;
    float _1578 = _1574;
    if (_1478)
    {
        float _1580 = _1538 * _1552;
        _703 = _1580;
    }
    float _1582 = _703;
    if (!_1478)
    {
        _1554 = _1466;
    }
    float _1584 = _1554;
    float _1586 = _1584;
    if (!_1478)
    {
        _1576 = _1532;
    }
    float _1588 = _1576;
    float _1590 = _1588;
    if (_1478)
    {
        float _1592 = _1466 * _1582;
        _1586 = _1592;
    }
    float _1594 = _1586;
    if (_1478)
    {
        float _1596 = fma(_1532, _1526, _1572);
        _1590 = _1596;
    }
    float _1598 = _1590;
    if (_1478)
    {
        float _1600 = _1468 * _1582;
        _1578 = _1600;
    }
    float _1602 = _1578;
    if (!_1478)
    {
        _1556 = _1472;
    }
    float _1604 = _1556;
    float _1606 = _1604;
    if (_1478)
    {
        float _1608 = _1594 * _1594;
        _1548 = _1608;
    }
    float _1610 = _1548;
    float _1612 = -_1566;
    float _1614 = _1612 + 1.0;
    if (_1478)
    {
        float _1616 = _1602 * _1602;
        _1606 = _1616;
    }
    float _1618 = _1606;
    float _1620 = fma(_1598, _1598, _1610);
    float _1622 = _1620 + _1618;
    float _1624 = rsqrt(_1622);
    float _1626 = _1624 * _1594;
    float _1628 = _1624 * _1598;
    float _1630 = _1624 * _1602;
    float _1632 = abs(_1614);
    float _1634 = log2(_1632);
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1638 = -_1636;
    float _1640 = fma(_1628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1638);
    float _1642 = -_1630;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1640);
    float _1646 = fma(_1644, -0.5, 0.5);
    float _1648 = fma(_1644, 0.5, 0.5);
    float _1650 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1652 = fma(_1648, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1654 = sqrt(_1646);
    float _1656 = fma(_1648, _1652, -0.212114393711090087890625);
    float _1658 = _1628 + 1.0;
    float _1660 = fma(_1648, _1656, 1.570728778839111328125);
    float _1662 = exp2(_1650);
    float _1664 = _1654 * 0.636619746685028076171875;
    float _1666 = -_1660;
    float _1668 = fma(_1664, _1666, 1.0);
    float _1670 = -_1628;
    float _1672 = fma(_1662, _1658, _1670);
    float _1674 = fma(_1672, 0.5, 0.5);
    float2 _5112 = float2(_1668, _1674);
    float3 _1678 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5112, float2(0.0), isnan(_5112)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5112, float2(0.0), isnan(_5112)), level(0.0)).xyz;
    float _1680 = _1678.x;
    float _1682 = _1678.y;
    float _1684 = _1678.z;
    float _1686 = in.m_65.w;
    float _1688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1692 = _1690 != 0;
    float _1694 = in.m_69.y;
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1698 = _1696 != 0;
    float _1700 = -_472;
    float _1702 = _1700 + 1.0;
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1706 = _1704 != 0;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1714 = _1712 != 0;
    float _1716 = _1662;
    float _1718 = _1628;
    bool _1720 = _1714;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1724 = _1692;
    if (!_1692)
    {
        float _1726 = in.m_65.y;
        _1716 = _1726;
    }
    float _1728 = _1716;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1736 = _1734 != 0;
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (_1698)
    {
        float _1742 = in.m_65.z;
        _1740 = _1742;
    }
    float _1744 = _1740;
    float _1746 = 1.0 / _1732;
    bool _1748 = _438 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1750 = isnan(_438);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1756 = _1752 || _1754;
    float _1758 = float(_1756);
    float _1760 = _1582;
    if (!_1692)
    {
        float _1762 = in.m_65.z;
        _1760 = _1762;
    }
    float _1764 = _1760;
    bool _1766 = _1686 > 0.5;
    float _1768 = 0.0;
    if (_1706)
    {
        float _1770 = in.m_65.x;
        _1768 = _1770;
    }
    float _1772 = _1768;
    float _1774 = 1.0 / _1710;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1782 = _1780 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1784 = in.m_69.x;
    float _1786 = -_1694;
    float _1788 = _1786 + 1.0;
    float _1790 = _1778 * _1746;
    int _1792 = _1766 ? as_type<int>(_1788) : as_type<int>(_1694);
    float _1794 = _1694;
    if (!_1692)
    {
        _1718 = _1728;
    }
    float _1796 = _1718;
    bool _1798 = _550 != 0.0;
    bool _1800 = isnan(_550);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan(0.0);
    bool _1806 = _1802 || _1804;
    float _1808 = _1714 ? as_type<float>(_1792) : _1694;
    float _1810 = _1782 * _1774;
    float _1812 = _1796;
    float _1814 = _1728;
    if (_1692)
    {
        float _1816 = in.m_65.x;
        float _1818 = in.m_65.y;
        _1812 = _1816;
        _1814 = _1818;
    }
    float _1820 = _1812;
    float _1822 = _1814;
    float _1824 = _1764;
    if (_1698)
    {
        bool _1826 = _1744 > 0.5;
        _1720 = _1826;
    }
    bool _1828 = _1720;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1832 = _438 + _1830;
    bool _1834 = _438 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1836 = isnan(_438);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = in.m_71.x;
    float _1848 = in.m_71.y;
    float _1850 = in.m_71.z;
    if (!_1692)
    {
        _1722 = _1764;
    }
    float _1852 = _1722;
    float _1854 = fma(_1790, _1832, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1856 = _548 == 0.0;
    bool _1858 = !_1806;
    bool _1860 = _1856 && _1858;
    float _1862 = -_1844;
    float _1864 = _1862 + 1.0;
    bool _1866 = _552 == 0.0;
    bool _1868 = _1866 && _1860;
    float _1870 = _1758 * _1864;
    float _1872 = -_1758;
    float _1874 = _1872 + 1.0;
    float _1876 = _1852;
    int _1878 = as_type<int>(_1854);
    if (_1692)
    {
        _1876 = _1822;
    }
    float _1880 = _1876;
    if (_1692)
    {
        _1824 = _1822;
    }
    float _1882 = _1824;
    if (_1706)
    {
        bool _1884 = _1772 > 0.5;
        _1724 = _1884;
    }
    bool _1886 = _1724;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1890 = _438 + _1888;
    float _1892 = _1846;
    float _1894 = _1848;
    float _1896 = _1850;
    float _1898 = _1890;
    if (!_1868)
    {
        float _1900 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1846);
        _1892 = _1900;
    }
    float _1902 = _1892;
    if (!_1868)
    {
        float _1904 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1848);
        _1894 = _1904;
    }
    float _1906 = _1894;
    if (!_1868)
    {
        float _1908 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1850);
        _1896 = _1908;
    }
    float _1910 = _1896;
    float _1912 = fma(_1810, _1890, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1914 = _438 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1916 = isnan(_438);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1922 = _1918 || _1920;
    float _1924 = float(_1922);
    float _1926 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1706)
    {
        _1898 = _1784;
    }
    float _1928 = _1898;
    bool _1930 = _1822 > 0.5;
    float _1932 = _1924 * _1874;
    float _1934 = _1928;
    if (!_1706)
    {
        _600 = _1928;
    }
    float _1936 = _600;
    float _1938 = -_1924;
    float _1940 = _1938 + 1.0;
    float _1942 = _1936;
    if (_1706)
    {
        _1934 = _1784;
    }
    float _1944 = _1934;
    float _1946 = _1854 * _1932;
    float _1948 = fma(_1738, _1808, -0.5);
    if (!_1698)
    {
        _602 = _1944;
    }
    float _1950 = _602;
    float _1952 = _1950;
    if (_1698)
    {
        float _1954 = -_1944;
        float _1956 = _1954 + 1.0;
        _1878 = as_type<int>(_1956);
    }
    int _1958 = _1878;
    if (_1706)
    {
        float _1960 = -_1944;
        float _1962 = _1960 + 1.0;
        _604 = as_type<int>(_1962);
    }
    int _1964 = _604;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1968 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1698)
    {
        float _1970 = _1828 ? as_type<float>(_1958) : _1944;
        _1952 = _1970;
    }
    float _1972 = _1952;
    if (_1706)
    {
        float _1974 = _1886 ? as_type<float>(_1964) : _1944;
        _1942 = _1974;
    }
    float _1976 = _1942;
    float _1978 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1966);
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1986 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1946);
    float _1988 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    float _1990 = -_1984;
    float _1992 = fma(_1968, 2.0, _1990);
    float _1994 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1996 = abs(_560);
    float _1998 = log2(_1996);
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2002 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2004 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2006 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1994);
    float _2008 = fma(_1912, _1870, _1986);
    float _2010 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2002);
    float _2012 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2004);
    float _2014 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2016 = fma(_1926, -2.0, _2000);
    if (_1736)
    {
        float _2018 = _1930 ? _1788 : _1694;
        _1794 = _2018;
    }
    float _2020 = _1794;
    float _2022 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2012);
    float _2024 = fma(_2014, _1972, -0.5);
    float _2026 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2006);
    float _2028 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2010);
    float _2030 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2008);
    float _2032 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2034 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2016);
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2040 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1978);
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2044 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2046 = exp2(_2032);
    float _2048 = -_142;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1992);
    float _2052 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1988);
    float _2054 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2044);
    float _2056 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2058 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2060 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2062 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2054);
    float _2064 = _2030 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2068 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2062);
    float _2070 = -_2034;
    float _2072 = fma(_2052, _1948, _2070);
    out.m_73.x = _2056;
    out.m_73.y = _2058;
    out.m_73.z = _2060;
    out.m_73.w = _2064;
    float _2074 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2076 = _2068 + _1147;
    float _2078 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2080 = precise::clamp(_2078, 0.0, 1.0);
    out.gl_Position.x = _1185;
    out.gl_Position.y = _1187;
    out.gl_Position.z = _2068;
    out.gl_Position.w = _1147;
    float _2082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2084 = fma(_2040, _2024, _2050);
    float _2086 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2088 = _2072 + 0.5;
    out.m_75.x = _2026;
    out.m_75.y = _2028;
    out.m_75.z = _2022;
    float _2090 = _2084 + 0.5;
    float _2092 = _2074 * _2066;
    float _2094 = _2076 * 0.5;
    float _2096 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2098 = fma(_2080, -2.0, 3.0);
    float _2100 = _2080 * _2080;
    if (!_1111)
    {
        _1193 = 1.0;
    }
    float _2102 = _1193;
    float _2104 = exp2(_2096);
    float _2106 = _2102;
    if (_1111)
    {
        bool _2108 = _1229 >= _1189;
        bool _2110 = isnan(_1229);
        bool _2112 = _2108 || _2110;
        bool _2114 = isnan(_1189);
        bool _2116 = _2112 || _2114;
        float _2118 = float(_2116);
        _2106 = _2118;
    }
    float _2120 = _2106;
    float _2122 = _2100 * _2098;
    out.m_77.z = _2094;
    out.m_77.w = _1147;
    float _2124 = _2086 * _2082;
    float _2126 = -_2122;
    float _2128 = _2126 + 1.0;
    float _2130 = _2120 * _1440;
    bool _2132 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2134 = isnan(_1462);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2140 = _2136 || _2138;
    float _2142 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2122);
    bool _2144 = _560 <= 8000.0;
    bool _2146 = isnan(_560);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan(8000.0);
    bool _2152 = _2148 || _2150;
    float _2154 = float(_2152);
    out.m_79.x = _2092;
    out.m_79.y = _2124;
    out.m_79.z = _2090;
    out.m_79.w = _2088;
    float _2156 = _2154 * _2142;
    float _2158 = -_2104;
    float _2160 = _2158 + 1.0;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2164 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2166 = _2164;
    float _2168 = 1.0;
    if (!_2140)
    {
        _1153 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2170 = _1153;
    float _2172 = _1702 * _2162;
    float _2174 = precise::clamp(_2172, 0.0, 1.0);
    float _2176 = _2164 * _1231;
    float _2178 = -_2164;
    float _2180 = _2178 + 1.0;
    float _2182 = _2180;
    float _2184 = _2170;
    float _2186 = _2170;
    if (!_2140)
    {
        _2166 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2188 = _2166;
    float _2190 = -_2174;
    float _2192 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2194 = _1242 * _2176;
    float _2196 = _1242 * _2180;
    float _2198 = _2188;
    float _2200 = _2188;
    if (!_2140)
    {
        _2168 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2202 = _2168;
    float _2204 = -_2130;
    float _2206 = fma(_2204, _2192, 1.0);
    float _2208 = precise::clamp(_2206, 0.0, 1.0);
    float _2210 = _2202;
    float _2212 = _2202;
    if (!_2140)
    {
        _606 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2214 = _606;
    float _2216 = _2214;
    float _2218 = _2214;
    if (!_2140)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2220 = _2182;
    float _2222 = _2208 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2224 = _1316 * _1374;
    out.m_83.x = _2222;
    float _2226 = _2224 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2228 = _2224;
    float _2230 = _2220;
    float _2232 = _2220;
    if (!_2140)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2234 = _2228;
    float _2236 = _1684 * _2176;
    float _2238 = fma(_1680, _2194, _1236);
    float _2240 = fma(_1682, _2194, _1238);
    float _2242 = fma(_1242, _2236, _1240);
    out.m_85.x = _2238;
    out.m_85.y = _2240;
    out.m_85.z = _2242;
    out.m_85.w = _2196;
    bool _2244 = !_2140;
    float _2246 = _2234;
    float _2248 = _2234;
    if (!_2244)
    {
        bool _2250 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2252 = isnan(_1462);
        bool _2254 = _2250 || _2252;
        bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2258 = _2254 || _2256;
        if (!_2258)
        {
            float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2262 = _1462 + _2260;
            float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2266 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2264;
            float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2272 = 1.0 / _2266;
            float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2280 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2286 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2288 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2290 = _2262 * _2272;
            float _2292 = precise::clamp(_2290, 0.0, 1.0);
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2298 = fma(_2292, _2270, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2300 = fma(_2292, _2296, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2302 = fma(_2292, _2276, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2304 = fma(_2292, _2280, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2306 = fma(_2292, _2284, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2308 = fma(_2292, _2288, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2218 = _2302;
            _2200 = _2306;
            _2212 = _2298;
            _2232 = _2304;
            _2186 = _2300;
            _2248 = _2308;
            _2310 = true;
        }
        else
        {
            bool _2312 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2314 = isnan(_1462);
            bool _2316 = _2312 || _2314;
            bool _2318 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2320 = _2316 || _2318;
            if (!_2320)
            {
                _2210 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2322 = _2210;
            _2212 = _2322;
            if (!_2320)
            {
                _2216 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2324 = _2216;
            _2218 = _2324;
            if (!_2320)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2326 = _2184;
            _2186 = _2326;
            if (!_2320)
            {
                _2230 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2328 = _2230;
            _2232 = _2328;
            if (!_2320)
            {
                _2198 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2330 = _2198;
            _2200 = _2330;
            if (!_2320)
            {
                _2246 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2332 = _2246;
            bool _2334 = !_2320;
            _2248 = _2332;
            if (!_2334)
            {
                bool _2336 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2338 = isnan(_1462);
                bool _2340 = _2336 || _2338;
                bool _2342 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2344 = _2340 || _2342;
                if (!_2344)
                {
                    float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2348 = _1462 + _2346;
                    float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2352 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2350;
                    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2356 = _2354 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2358 = 1.0 / _2352;
                    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2376 = _2348 * _2358;
                    float _2378 = precise::clamp(_2376, 0.0, 1.0);
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2384 = fma(_2378, _2356, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2386 = fma(_2378, _2382, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2388 = fma(_2378, _2362, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2390 = fma(_2378, _2366, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2392 = fma(_2378, _2370, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2394 = fma(_2378, _2374, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2218 = _2388;
                    _2200 = _2392;
                    _2212 = _2384;
                    _2232 = _2390;
                    _2186 = _2386;
                    _2248 = _2394;
                    _2310 = true;
                }
                else
                {
                    _2218 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2200 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2212 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2232 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2248 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2310 = false;
    float _2396 = _2218;
    float _2398 = _2200;
    float _2400 = _2212;
    float _2402 = _2232;
    float _2404 = _2186;
    float _2406 = _2248;
    float _2408 = _2226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2410 = fma(_2028, -0.5, 0.5);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = -_2396;
    float _2416 = _2414 + _2398;
    float _2418 = -_2400;
    float _2420 = _2418 + _2402;
    out.m_87.x = 0.0;
    float _2422 = fma(_2412, _2416, _2396);
    float _2424 = -_2404;
    float _2426 = _2424 + _2406;
    float _2428 = fma(_2412, _2420, _2400);
    float _2430 = _2422 * 0.586610972881317138671875;
    bool _2432 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2434 = fma(_2412, _2426, _2404);
    out.m_59.x = _2408;
    float _2436 = fma(_2428, 0.298911988735198974609375, _2430);
    bool _2438 = _1316 > 0.0;
    bool _2440 = isnan(_1316);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan(0.0);
    bool _2446 = _2442 || _2444;
    float _2448 = fma(_2434, 0.114477999508380889892578125, _2436);
    bool _2450 = _1374 <= 0.0;
    bool _2452 = !_2446;
    bool _2454 = _2450 || _2452;
    float _2456 = -_2448;
    float _2458 = _2428 + _2456;
    float _2460 = -_2448;
    float _2462 = _2422 + _2460;
    float _2464 = -_2448;
    float _2466 = _2434 + _2464;
    float _2468 = fma(_2458, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2448);
    float _2470 = fma(_2462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2448);
    float _2472 = fma(_2466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2448);
    bool _2474 = !_2432;
    if (!_2474)
    {
        float _2476 = -_1037;
        float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2480 = -_1039;
        float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2484 = -_1041;
        float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2488 = _2478 * _2478;
        float _2490 = fma(_2482, _2482, _2488);
        float _2492 = fma(_2486, _2486, _2490);
        float _2494 = sqrt(_2492);
        float _2496 = rsqrt(_2492);
        float _2498 = -_2494;
        float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2502 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2504 = precise::clamp(_2502, 0.0, 1.0);
        float _2506 = _2482 * _2496;
        float _2508 = _2478 * _2496;
        float _2510 = abs(_2504);
        float _2512 = log2(_2510);
        float _2514 = _2486 * _2496;
        float _2516 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2518 = _2028 * _2508;
        float _2520 = -_2508;
        float _2522 = -_2516;
        float _2524 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2522);
        float _2526 = fma(_2026, _2506, _2518);
        float _2528 = -_2514;
        float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2524);
        float _2532 = fma(_2022, _2514, _2526);
        float _2534 = precise::clamp(_2532, 0.0, 1.0);
        float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2538 = _2530 + _2536;
        float _2540 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2542 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2544 = precise::clamp(_2542, 0.0, 1.0);
        float _2546 = exp2(_2540);
        float _2548 = _2546 * _2544;
        float _2550 = _2534 * _2548;
        float _2552 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2554 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2556 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2552;
        out.m_87.y = _2554;
        out.m_87.z = _2556;
    }
    out.m_89.x = _2468;
    out.m_89.y = _2470;
    out.m_89.z = _2472;
    if (!_2454)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2558;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2310 = false;
    bool _430 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_56.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_59.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2615 = as_type<float>(_124);
        out.gl_Position.z = _2615;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_61.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _118 = _144;
    }
    float _146 = _118;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_59.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2684 = as_type<float>(_160);
        out.gl_Position.z = _2684;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_63.w;
    float _164 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_61.x;
    float _178 = in.m_61.y;
    float _180 = in.m_61.z;
    float _182 = in.m_56.x;
    float _184 = in.m_56.y;
    float _186 = in.m_56.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_65.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_108);
        float _308 = 1.0 / _306;
        float _310 = _142 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = 1.0 / _332;
    bool _336 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_312);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_328;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = _346 * _350;
    float _368 = -_346;
    float _370 = _368 + 1.0;
    float _372 = _316 * _334;
    float _374 = in.m_63.x;
    float _376 = in.m_63.y;
    float _378 = in.m_63.z;
    float _380 = fma(_354, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_364, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = fma(_358, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = _380 * _366;
    float _388 = _382 * _366;
    float _390 = _384 * _366;
    float _392 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _398 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].x, _392);
    float _400 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].y, _394);
    float _402 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].z, _396);
    float _404 = _398 * _374;
    float _406 = _400 * _376;
    float _408 = _402 * _378;
    bool _410 = !_360;
    float _428;
    if (!_410)
    {
        float _412 = in.m_65.x;
        float _414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _416 = _412 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _420 = _418 * _414;
        float _422 = floor(_420);
        float _424 = -_422;
        float _426 = _420 + _424;
        _428 = _426;
        _430 = true;
    }
    else
    {
        float _432 = float(_108);
        float _434 = 1.0 / _432;
        float _436 = _142 * _434;
        _428 = _436;
    }
    _430 = false;
    float _438 = _428;
    float _440 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _442 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _444 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _440);
    float _446 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _442);
    float _448 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _450 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
    float _452 = _448 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _454 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _456 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _458 = fma(_454, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _460 = floor(_456);
    float _462 = floor(_458);
    float _464 = -_460;
    float _466 = _456 + _464;
    float _468 = -_462;
    float _470 = _458 + _468;
    float2 _3180 = float2(_470, _466);
    float _472 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3180, float2(0.0), isnan(_3180)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3180, float2(0.0), isnan(_3180)), level(0.0)).x;
    float _474 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _476 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _478 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _474);
    float _480 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _482 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _484 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    bool _486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _488 = isnan(0.5);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _494 = _490 || _492;
    float _496 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _498 = _496 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _500 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[11].x, _498);
    float _502 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[11].z, _500);
    float _504 = _496 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _506 = _502 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _508 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[10].x, _504);
    float _510 = 1.0 / _506;
    float _512 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[10].z, _508);
    float _514 = _512 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _516 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _518 = _514 + _506;
    float _520 = _496 + _516;
    float _522 = _520 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _524 = _518 * _510;
    float _526 = _524 * 0.5;
    float _528 = _520 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _530 = fma(_454, (*spvDescriptorSet0.vp_c15)._m0[127].x, _522);
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _534 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[30].w, _532);
    float _536 = fma(_454, (*spvDescriptorSet0.vp_c15)._m0[126].x, _528);
    float _538 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[127].z, _530);
    float _540 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[126].z, _536);
    float _542 = 1.0 / _534;
    float _544 = _538 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _546 = _540 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _548 = in.m_67.x;
    float _550 = in.m_67.y;
    float _552 = in.m_67.z;
    float _554 = trunc(_546);
    int _556 = int(_554);
    float _558 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _560 = _542 * _558;
    float _562 = trunc(_544);
    int _564 = int(_562);
    bool _566 = _560 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _568 = _560 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _570 = !_566;
    int _572 = _570 ? 0 : 1;
    int _574 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _576 = _556 + _574;
    int _578 = _576 + 1;
    float _580 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _550);
    int _582 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _584 = _564 + _582;
    int _586 = _584 + 1;
    float _588 = _476 * _580;
    int _590 = 2;
    int _592 = _578;
    float _594 = _546;
    float _596 = _544;
    float _598 = _454;
    float _600 = _438;
    float _602 = _548;
    int _604 = as_type<int>(_550);
    float _606 = 1.0;
    if (!_566)
    {
        _590 = 1;
    }
    int _608 = _590;
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _548);
    int _612 = _608;
    if (!_568)
    {
        _612 = _572;
    }
    int _614 = _612;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _552);
    bool _618 = _578 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _620 = _480 * _610;
    int _622 = _578 | _586;
    float _624 = _588 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _626 = _614 << 6;
    float _628 = _588 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _630 = _622 < 0;
    bool _632 = _630 || _618;
    float _634 = _482 * _616;
    int _636 = _626 + 96;
    uint _639 = uint(int(uint(_636) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.vp_c15)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.vp_c15)._m0[int(_649)][_651];
    float _655 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[26].x, _624);
    bool _657 = _586 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _659 = _657 || _632;
    float _661 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[24].x, _628);
    float _663 = _588 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _665 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[26].z, _655);
    float _667 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[24].z, _661);
    int _669 = _626 + 104;
    uint _671 = uint(int(uint(_669) >> uint(2)));
    uint _673 = uint(int(uint(int(_671)) >> uint(2)));
    int _675 = int(_671) & 3;
    float _677 = (*spvDescriptorSet0.vp_c15)._m0[int(_673)][_675];
    int _679 = int(_671) + 1;
    uint _681 = uint(int(uint(_679) >> uint(2)));
    int _683 = _679 & 3;
    float _685 = (*spvDescriptorSet0.vp_c15)._m0[int(_681)][_683];
    float _687 = _665 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _689 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[25].x, _663);
    float _691 = _667 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _693 = _452 + _687;
    float _695 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[25].z, _689);
    int _697 = _622;
    int _699 = as_type<int>(_616);
    float _701 = _693;
    float _703 = as_type<float>(_626);
    if (!_659)
    {
        int _705 = _586 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _707 = _705 + _578;
        _592 = _707;
    }
    int _709 = _592;
    int _711 = _626 + 48;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.vp_c15)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.vp_c15)._m0[int(_723)][_725];
    float _729 = _454 + _691;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _733 = _693 + _731;
    float _735 = _733;
    if (!_659)
    {
        int _737 = _709 << 2;
        _697 = _737;
    }
    int _739 = _697;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _729 + _741;
    int _745 = _739;
    if (!_659)
    {
        uint _747 = uint(int(uint(_709) >> uint(2)));
        _699 = int(_747);
    }
    int _749 = _699;
    float _751 = _733 * _733;
    if (!_659)
    {
        int _753 = 12 & _739;
        _745 = _753;
    }
    int _755 = _745;
    int _757 = _626 + 64;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    uint _761 = uint(int(uint(int(_759)) >> uint(2)));
    int _763 = int(_759) & 3;
    float _765 = (*spvDescriptorSet0.vp_c15)._m0[int(_761)][_763];
    int _767 = int(_759) + 1;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    int _771 = _767 & 3;
    float _773 = (*spvDescriptorSet0.vp_c15)._m0[int(_769)][_771];
    float _775 = fma(_743, _743, _751);
    float _777 = 0.0;
    if (!_659)
    {
        int _779 = _749 << 4;
        int _781 = _779 + _755;
        _777 = as_type<float>(_781);
    }
    float _783 = _777;
    float _785 = sqrt(_775);
    int _787 = _626 + 56;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    uint _791 = uint(int(uint(int(_789)) >> uint(2)));
    int _793 = int(_789) & 3;
    float _795 = (*spvDescriptorSet0.vp_c15)._m0[int(_791)][_793];
    int _797 = int(_789) + 1;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    int _801 = _797 & 3;
    float _803 = (*spvDescriptorSet0.vp_c15)._m0[int(_799)][_801];
    int _805 = _626 + 72;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    uint _809 = uint(int(uint(int(_807)) >> uint(2)));
    int _811 = int(_807) & 3;
    float _813 = (*spvDescriptorSet0.vp_c15)._m0[int(_809)][_811];
    int _815 = int(_807) + 1;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    int _819 = _815 & 3;
    float _821 = (*spvDescriptorSet0.vp_c15)._m0[int(_817)][_819];
    bool _823 = _785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _825 = _520 * _653;
    int _827 = _626 + 80;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    uint _831 = uint(int(uint(int(_829)) >> uint(2)));
    int _833 = int(_829) & 3;
    float _835 = (*spvDescriptorSet0.vp_c15)._m0[int(_831)][_833];
    int _837 = int(_829) + 1;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    int _841 = _837 & 3;
    float _843 = (*spvDescriptorSet0.vp_c15)._m0[int(_839)][_841];
    float _845 = _653;
    if (!_659)
    {
        float _847 = floor(_546);
        _845 = _847;
    }
    float _849 = _845;
    float _851 = fma(_454, _645, _825);
    float _853 = fma(_452, _677, _851);
    int _855 = _626 + 88;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    uint _859 = uint(int(uint(int(_857)) >> uint(2)));
    int _861 = int(_857) & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    int _865 = int(_857) + 1;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    int _869 = _865 & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    float _873 = _695 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _875 = _853 + _685;
    float _877 = _496 + _873;
    float _879 = _520 * _727;
    float _881 = _783;
    float _883 = _873;
    float _885 = _719;
    float _887 = _685;
    if (!_659)
    {
        int _889 = as_type<int>(_783) + 400;
        uint _891 = uint(int(uint(_889) >> uint(2)));
        uint _893 = uint(int(uint(int(_891)) >> uint(2)));
        int _895 = int(_891) & 3;
        float _897 = (*spvDescriptorSet0.vp_c15)._m0[int(_893)][_895];
        _881 = _897;
    }
    float _899 = _881;
    float _901 = 1.0 / _875;
    if (!_823)
    {
        _883 = _877;
    }
    float _903 = _883;
    float _905 = fma(_454, _719, _879);
    float _907 = _903;
    if (!_823)
    {
        _885 = _729;
    }
    float _909 = _885;
    float _911 = _520 * _773;
    float _913 = fma(_454, _765, _911);
    bool _915 = !_823;
    float _917 = _909;
    float _919 = _765;
    if (!_915)
    {
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _923 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _925 = _785 + _923;
        float _927 = rsqrt(_775);
        float _929 = _925 * _921;
        float _931 = _877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = _929 * 0.15915493667125701904296875;
        float _935 = _933 * 6.283185482025146484375;
        float _937 = cos(_935);
        float _939 = _933 * 6.283185482025146484375;
        float _941 = sin(_939);
        float _943 = _937 + (-1.0);
        float _945 = fma(_941, _931, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _947 = _943 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _949 = _927 * _945;
        float _951 = fma(_877, _937, _947);
        float _953 = fma(_743, _949, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _955 = fma(_733, _949, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _917 = _953;
        _701 = _955;
        _919 = _949;
        _907 = _951;
        _887 = _933;
    }
    float _957 = _917;
    float _959 = _701;
    float _961 = _919;
    float _963 = _907;
    float _965 = _887;
    float _967 = fma(_452, _795, _905);
    float _969 = fma(_452, _813, _913);
    float _971 = _965;
    float _973 = _963;
    float _975 = _961;
    float _977 = _957;
    if (_494)
    {
        _735 = _957;
    }
    float _979 = _735;
    float _981 = _979;
    if (_494)
    {
        _971 = _959;
    }
    float _983 = _971;
    float _985 = _983;
    if (!_494)
    {
        float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _989 = _496 + _987;
        float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _993 = _454 + _991;
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _997 = -_496;
        float _999 = _997 + _963;
        float _1001 = _989 * _989;
        float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1005 = _452 + _1003;
        float _1007 = -_454;
        float _1009 = _1007 + _957;
        float _1011 = fma(_993, _993, _1001);
        float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1015 = fma(_1005, _1005, _1011);
        float _1017 = sqrt(_1015);
        float _1019 = _995 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1021 = precise::min(_1017, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1023 = _1021 * _1013;
        float _1025 = _1019 * _1023;
        float _1027 = -_452;
        float _1029 = _1027 + _959;
        float _1031 = fma(_999, _1025, _496);
        float _1033 = fma(_1009, _1025, _454);
        float _1035 = fma(_1029, _1025, _452);
        _973 = _1031;
        _981 = _1033;
        _985 = _1035;
        _975 = _995;
        _977 = _1009;
    }
    float _1037 = _973;
    float _1039 = _981;
    float _1041 = _985;
    float _1043 = _975;
    float _1045 = _977;
    float _1047 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1049 = _967 + _803;
    float _1051 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1053 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1055 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1047);
    float _1057 = _1049 * _901;
    float _1059 = _969 + _821;
    float _1061 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1051);
    float _1063 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1055);
    float _1065 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1053);
    bool _1067 = _1057 >= 0.0;
    float _1069 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1073 = _1059 * _901;
    float _1075 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1077 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1065);
    bool _1079 = _1057 <= 1.0;
    bool _1081 = _1079 && _1067;
    float _1083 = _1045;
    if (!_659)
    {
        float _1085 = rint(_899);
        float _1087 = precise::max(_1085, 0.0);
        uint _1089 = uint(_1087);
        uint _1091 = clamp(_1089, 0u, 65535u);
        _1083 = as_type<float>(_1091);
    }
    float _1093 = _1083;
    float _1095 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1075);
    float _1097 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1099 = _1073 >= 0.0;
    bool _1101 = _1099 && _1081;
    float _1103 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1105 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1095);
    float _1107 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1109 = _1073 <= 1.0;
    bool _1111 = _1109 && _1101;
    float _1113 = _1043;
    float _1115 = _1107;
    float _1117 = _1093;
    if (!_659)
    {
        float _1119 = floor(_544);
        _1113 = _1119;
    }
    float _1121 = _1113;
    float _1123 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1125 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1127 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1129 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1131 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1125);
    float _1133 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1135 = -_1129;
    float _1137 = fma(_1135, _1103, 1.0);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1131);
    float _1141 = _520 * _843;
    float _1143 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1133);
    float _1145 = log2(_1137);
    float _1147 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1139);
    float _1149 = _1133;
    float _1151 = _1137;
    float _1153 = _1147;
    if (_1111)
    {
        float _1155 = float(_614);
        _1149 = _1155;
    }
    float _1157 = _1149;
    float _1159 = fma(_454, _835, _1141);
    float _1161 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1107);
    float _1163 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1143);
    if (!_659)
    {
        float _1165 = -_1121;
        float _1167 = _544 + _1165;
        _1115 = _1167;
    }
    float _1169 = _1115;
    float _1171 = fma(_452, _863, _1159);
    float _1173 = 1.0 / _1147;
    float _1175 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1161);
    if (!_659)
    {
        float _1177 = -_849;
        float _1179 = _546 + _1177;
        _1151 = _1179;
    }
    float _1181 = _1151;
    float _1183 = _1171 + _871;
    float _1185 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1163);
    float _1187 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1175);
    float _1189 = _1183 * _901;
    float _1191 = _1157;
    float _1193 = _1185;
    if (_1111)
    {
        float _1195 = rint(_1157);
        float _1197 = precise::max(_1195, 0.0);
        uint _1199 = uint(_1197);
        uint _1201 = clamp(_1199, 0u, 65535u);
        _1191 = as_type<float>(_1201);
    }
    float _1203 = _1191;
    float _1205 = _1145 * 0.693147182464599609375;
    float _1207 = _1169;
    if (!_659)
    {
        float3 _4408 = float3(_1181, _1169, float(as_type<int>(_1093)));
        float3 _4412 = select(_4408, float3(0.0), isnan(_4408));
        float _1209 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4412.xy, uint(rint(_4412.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4412.xy, uint(rint(_4412.z)), level(0.0)).x;
        _1207 = _1209;
    }
    float _1211 = _1207;
    float _1213 = _1205 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1215 = _1185 * _1173;
    float _1217 = _1187 * _1173;
    float _1219 = fma(_1215, 0.5, 0.5);
    float _1221 = fma(_1217, -0.5, 0.5);
    float _1223 = _1203;
    float _1225 = _1173;
    if (_1111)
    {
        float3 _4443 = float3(_1057, _1073, float(as_type<int>(_1203)));
        float3 _4445 = select(_4443, float3(0.0), isnan(_4443));
        float _1227 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4445.xy, uint(rint(_4445.z)), _1189, level(0.0));
        _1223 = _1227;
    }
    float _1229 = _1223;
    float3 _4455 = float3(_1219, _1221, _1213);
    float _1231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4455, float3(0.0), isnan(_4455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4455, float3(0.0), isnan(_4455)), level(0.0)).x;
    float3 _4464 = float3(_1219, _1221, _1213);
    float4 _1234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4464, float3(0.0), isnan(_4464)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4464, float3(0.0), isnan(_4464)), level(0.0)).xyzw;
    float _1236 = _1234.x;
    float _1238 = _1234.y;
    float _1240 = _1234.z;
    float _1242 = _1234.w;
    bool _1244 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1246 = isnan(0.5);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1252 = _1248 || _1250;
    if (_659)
    {
        _1225 = 1.0;
    }
    float _1254 = _1225;
    float _1256 = _1254;
    if (_1252)
    {
        _594 = 1.0;
    }
    float _1258 = _594;
    float _1260 = _1258;
    if (_1252)
    {
        _596 = 1.0;
    }
    float _1262 = _596;
    float _1264 = _1262;
    if (!_1252)
    {
        float _1266 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1268 = _1266 * 0.15915493667125701904296875;
        float _1270 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1272 = _1268 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1270 * 0.15915493667125701904296875;
        float _1278 = _1268 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = 1.0 / _1274;
        float _1284 = _1276 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = _1276 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1286 * _1288;
        float _1296 = 1.0 / _1294;
        float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1300 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1298;
        float _1302 = 1.0 / _1300;
        float _1304 = _1292 * _1296;
        float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1308 = fma(_560, _1304, _1306);
        float _1310 = _1308 * _1302;
        float _1312 = precise::clamp(_1310, 0.0, 1.0);
        _1117 = _1282;
        _1264 = _1312;
    }
    float _1314 = _1117;
    float _1316 = _1264;
    float _1318 = _1314;
    if (!_1252)
    {
        float _1320 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1322 = _1320 * 0.15915493667125701904296875;
        float _1324 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1326 = _1322 * 6.283185482025146484375;
        float _1328 = cos(_1326);
        float _1330 = _1324 * 0.15915493667125701904296875;
        float _1332 = _1322 * 6.283185482025146484375;
        float _1334 = sin(_1332);
        float _1336 = 1.0 / _1328;
        float _1338 = _1330 * 6.283185482025146484375;
        float _1340 = cos(_1338);
        float _1342 = _1334 * _1336;
        float _1344 = _1330 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        float _1348 = _1340 * _1342;
        float _1350 = 1.0 / _1348;
        float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1354 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1352;
        float _1356 = 1.0 / _1354;
        float _1358 = _1346 * _1350;
        float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1362 = fma(_560, _1358, _1360);
        float _1364 = _1362 * _1356;
        float _1366 = precise::clamp(_1364, 0.0, 1.0);
        float _1368 = -_1366;
        float _1370 = _1368 + 1.0;
        _1318 = _1330;
        _1260 = _1370;
    }
    float _1372 = _1318;
    float _1374 = _1260;
    float _1376 = _1372;
    if (!_659)
    {
        int _1378 = _709 << 4;
        int _1380 = _1378 + 2048;
        uint _1382 = uint(int(uint(_1380) >> uint(2)));
        uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
        int _1386 = int(_1382) & 3;
        float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
        int _1390 = int(_1382) + 1;
        uint _1392 = uint(int(uint(_1390) >> uint(2)));
        int _1394 = _1390 & 3;
        float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
        int _1398 = _1380 + 8;
        uint _1400 = uint(int(uint(_1398) >> uint(2)));
        uint _1402 = uint(int(uint(int(_1400)) >> uint(2)));
        int _1404 = int(_1400) & 3;
        float _1406 = (*spvDescriptorSet0.vp_c15)._m0[int(_1402)][_1404];
        int _1408 = int(_1400) + 1;
        uint _1410 = uint(int(uint(_1408) >> uint(2)));
        int _1412 = _1408 & 3;
        float _1414 = (*spvDescriptorSet0.vp_c15)._m0[int(_1410)][_1412];
        float _1416 = _520 * _1396;
        float _1418 = fma(_454, _1388, _1416);
        float _1420 = fma(_452, _1406, _1418);
        float _1422 = _1420 + _1414;
        float _1424 = precise::clamp(_1422, 0.0, 1.0);
        float _1426 = -_1424;
        float _1428 = _1426 + _1211;
        float _1430 = fma(_1428, 500.0, 1.5);
        float _1432 = exp2(_1430);
        float _1434 = 0.0 + _1432;
        float _1436 = precise::clamp(_1434, 0.0, 1.0);
        _1376 = _1406;
        _1256 = _1436;
    }
    float _1438 = _1376;
    float _1440 = _1256;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1444 = _1037 + _1442;
    float _1446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1448 = _1039 + _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1452 = _1041 + _1450;
    float _1454 = _1444 * _1444;
    float _1456 = fma(_1448, _1448, _1454);
    float _1458 = fma(_1452, _1452, _1456);
    float _1460 = rsqrt(_1458);
    float _1462 = sqrt(_1458);
    float _1464 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1466 = _1448 * _1464;
    float _1468 = _1452 * _1464;
    float _1470 = _1466 * _1466;
    float _1472 = _1468 * _1468;
    float _1474 = _1470 + _1472;
    float _1476 = sqrt(_1474);
    bool _1478 = _1476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1482 = _1476 + _1480;
    float _1484 = _1452;
    float _1486 = _1482;
    float _1488 = _1454;
    float _1490 = _1444;
    if (_1478)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1484 = _1492;
    }
    float _1494 = _1484;
    if (_1478)
    {
        float _1496 = _1482 * _1494;
        _1486 = _1496;
    }
    float _1498 = _1486;
    if (_1478)
    {
        float _1500 = _1498 * 0.15915493667125701904296875;
        _1488 = _1500;
    }
    float _1502 = _1488;
    float _1504 = _1438;
    float _1506 = _1502;
    if (_1478)
    {
        float _1508 = _1502 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        _1504 = _1510;
    }
    float _1512 = _1504;
    float _1514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1516 = precise::max(0.0, _1514);
    float _1518 = _1460;
    float _1520 = _1516;
    if (_1478)
    {
        float _1522 = _1502 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = -_1464;
    float _1530 = -_1516;
    float _1532 = fma(_1444, _1528, _1530);
    float _1534 = _1514;
    if (_1478)
    {
        float _1536 = rsqrt(_1474);
        _1534 = _1536;
    }
    float _1538 = _1534;
    if (_1478)
    {
        float _1540 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1540;
    }
    float _1542 = _1520;
    float _1544 = _1542;
    if (!_1478)
    {
        _1506 = _1470;
    }
    float _1546 = _1506;
    float _1548 = _1546;
    if (_1478)
    {
        float _1550 = fma(_1512, _1542, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1544 = _1550;
    }
    float _1552 = _1544;
    float _1554 = _1552;
    float _1556 = _1526;
    if (_1478)
    {
        float _1558 = _1526 + (-1.0);
        _1490 = _1558;
    }
    float _1560 = _1490;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1564 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1562);
    float _1566 = precise::clamp(_1564, 0.0, 1.0);
    float _1568 = _1560;
    if (_1478)
    {
        float _1570 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _598 = _1570;
    }
    float _1572 = _598;
    if (!_1478)
    {
        _1568 = _1468;
    }
    float _1574 = _1568;
    float _1576 = _1538;
    float _1578 = _1574;
    if (_1478)
    {
        float _1580 = _1538 * _1552;
        _703 = _1580;
    }
    float _1582 = _703;
    if (!_1478)
    {
        _1554 = _1466;
    }
    float _1584 = _1554;
    float _1586 = _1584;
    if (!_1478)
    {
        _1576 = _1532;
    }
    float _1588 = _1576;
    float _1590 = _1588;
    if (_1478)
    {
        float _1592 = _1466 * _1582;
        _1586 = _1592;
    }
    float _1594 = _1586;
    if (_1478)
    {
        float _1596 = fma(_1532, _1526, _1572);
        _1590 = _1596;
    }
    float _1598 = _1590;
    if (_1478)
    {
        float _1600 = _1468 * _1582;
        _1578 = _1600;
    }
    float _1602 = _1578;
    if (!_1478)
    {
        _1556 = _1472;
    }
    float _1604 = _1556;
    float _1606 = _1604;
    if (_1478)
    {
        float _1608 = _1594 * _1594;
        _1548 = _1608;
    }
    float _1610 = _1548;
    float _1612 = -_1566;
    float _1614 = _1612 + 1.0;
    if (_1478)
    {
        float _1616 = _1602 * _1602;
        _1606 = _1616;
    }
    float _1618 = _1606;
    float _1620 = fma(_1598, _1598, _1610);
    float _1622 = _1620 + _1618;
    float _1624 = rsqrt(_1622);
    float _1626 = _1624 * _1594;
    float _1628 = _1624 * _1598;
    float _1630 = _1624 * _1602;
    float _1632 = abs(_1614);
    float _1634 = log2(_1632);
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1638 = -_1636;
    float _1640 = fma(_1628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1638);
    float _1642 = -_1630;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1640);
    float _1646 = fma(_1644, -0.5, 0.5);
    float _1648 = fma(_1644, 0.5, 0.5);
    float _1650 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1652 = fma(_1648, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1654 = sqrt(_1646);
    float _1656 = fma(_1648, _1652, -0.212114393711090087890625);
    float _1658 = _1628 + 1.0;
    float _1660 = fma(_1648, _1656, 1.570728778839111328125);
    float _1662 = exp2(_1650);
    float _1664 = _1654 * 0.636619746685028076171875;
    float _1666 = -_1660;
    float _1668 = fma(_1664, _1666, 1.0);
    float _1670 = -_1628;
    float _1672 = fma(_1662, _1658, _1670);
    float _1674 = fma(_1672, 0.5, 0.5);
    float2 _5112 = float2(_1668, _1674);
    float3 _1678 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5112, float2(0.0), isnan(_5112)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5112, float2(0.0), isnan(_5112)), level(0.0)).xyz;
    float _1680 = _1678.x;
    float _1682 = _1678.y;
    float _1684 = _1678.z;
    float _1686 = in.m_65.w;
    float _1688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1692 = _1690 != 0;
    float _1694 = in.m_69.y;
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1698 = _1696 != 0;
    float _1700 = -_472;
    float _1702 = _1700 + 1.0;
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1706 = _1704 != 0;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1714 = _1712 != 0;
    float _1716 = _1662;
    float _1718 = _1628;
    bool _1720 = _1714;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1724 = _1692;
    if (!_1692)
    {
        float _1726 = in.m_65.y;
        _1716 = _1726;
    }
    float _1728 = _1716;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1736 = _1734 != 0;
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (_1698)
    {
        float _1742 = in.m_65.z;
        _1740 = _1742;
    }
    float _1744 = _1740;
    float _1746 = 1.0 / _1732;
    bool _1748 = _438 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1750 = isnan(_438);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1756 = _1752 || _1754;
    float _1758 = float(_1756);
    float _1760 = _1582;
    if (!_1692)
    {
        float _1762 = in.m_65.z;
        _1760 = _1762;
    }
    float _1764 = _1760;
    bool _1766 = _1686 > 0.5;
    float _1768 = 0.0;
    if (_1706)
    {
        float _1770 = in.m_65.x;
        _1768 = _1770;
    }
    float _1772 = _1768;
    float _1774 = 1.0 / _1710;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1782 = _1780 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1784 = in.m_69.x;
    float _1786 = -_1694;
    float _1788 = _1786 + 1.0;
    float _1790 = _1778 * _1746;
    int _1792 = _1766 ? as_type<int>(_1788) : as_type<int>(_1694);
    float _1794 = _1694;
    if (!_1692)
    {
        _1718 = _1728;
    }
    float _1796 = _1718;
    bool _1798 = _550 != 0.0;
    bool _1800 = isnan(_550);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan(0.0);
    bool _1806 = _1802 || _1804;
    float _1808 = _1714 ? as_type<float>(_1792) : _1694;
    float _1810 = _1782 * _1774;
    float _1812 = _1796;
    float _1814 = _1728;
    if (_1692)
    {
        float _1816 = in.m_65.x;
        float _1818 = in.m_65.y;
        _1812 = _1816;
        _1814 = _1818;
    }
    float _1820 = _1812;
    float _1822 = _1814;
    float _1824 = _1764;
    if (_1698)
    {
        bool _1826 = _1744 > 0.5;
        _1720 = _1826;
    }
    bool _1828 = _1720;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1832 = _438 + _1830;
    bool _1834 = _438 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1836 = isnan(_438);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = in.m_71.x;
    float _1848 = in.m_71.y;
    float _1850 = in.m_71.z;
    if (!_1692)
    {
        _1722 = _1764;
    }
    float _1852 = _1722;
    float _1854 = fma(_1790, _1832, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1856 = _548 == 0.0;
    bool _1858 = !_1806;
    bool _1860 = _1856 && _1858;
    float _1862 = -_1844;
    float _1864 = _1862 + 1.0;
    bool _1866 = _552 == 0.0;
    bool _1868 = _1866 && _1860;
    float _1870 = _1758 * _1864;
    float _1872 = -_1758;
    float _1874 = _1872 + 1.0;
    float _1876 = _1852;
    int _1878 = as_type<int>(_1854);
    if (_1692)
    {
        _1876 = _1822;
    }
    float _1880 = _1876;
    if (_1692)
    {
        _1824 = _1822;
    }
    float _1882 = _1824;
    if (_1706)
    {
        bool _1884 = _1772 > 0.5;
        _1724 = _1884;
    }
    bool _1886 = _1724;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1890 = _438 + _1888;
    float _1892 = _1846;
    float _1894 = _1848;
    float _1896 = _1850;
    float _1898 = _1890;
    if (!_1868)
    {
        float _1900 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1846);
        _1892 = _1900;
    }
    float _1902 = _1892;
    if (!_1868)
    {
        float _1904 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1848);
        _1894 = _1904;
    }
    float _1906 = _1894;
    if (!_1868)
    {
        float _1908 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1850);
        _1896 = _1908;
    }
    float _1910 = _1896;
    float _1912 = fma(_1810, _1890, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1914 = _438 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1916 = isnan(_438);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1922 = _1918 || _1920;
    float _1924 = float(_1922);
    float _1926 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1706)
    {
        _1898 = _1784;
    }
    float _1928 = _1898;
    bool _1930 = _1822 > 0.5;
    float _1932 = _1924 * _1874;
    float _1934 = _1928;
    if (!_1706)
    {
        _600 = _1928;
    }
    float _1936 = _600;
    float _1938 = -_1924;
    float _1940 = _1938 + 1.0;
    float _1942 = _1936;
    if (_1706)
    {
        _1934 = _1784;
    }
    float _1944 = _1934;
    float _1946 = _1854 * _1932;
    float _1948 = fma(_1738, _1808, -0.5);
    if (!_1698)
    {
        _602 = _1944;
    }
    float _1950 = _602;
    float _1952 = _1950;
    if (_1698)
    {
        float _1954 = -_1944;
        float _1956 = _1954 + 1.0;
        _1878 = as_type<int>(_1956);
    }
    int _1958 = _1878;
    if (_1706)
    {
        float _1960 = -_1944;
        float _1962 = _1960 + 1.0;
        _604 = as_type<int>(_1962);
    }
    int _1964 = _604;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1968 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1698)
    {
        float _1970 = _1828 ? as_type<float>(_1958) : _1944;
        _1952 = _1970;
    }
    float _1972 = _1952;
    if (_1706)
    {
        float _1974 = _1886 ? as_type<float>(_1964) : _1944;
        _1942 = _1974;
    }
    float _1976 = _1942;
    float _1978 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1966);
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1986 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1946);
    float _1988 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    float _1990 = -_1984;
    float _1992 = fma(_1968, 2.0, _1990);
    float _1994 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1996 = abs(_560);
    float _1998 = log2(_1996);
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2002 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2004 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2006 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1994);
    float _2008 = fma(_1912, _1870, _1986);
    float _2010 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2002);
    float _2012 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2004);
    float _2014 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2016 = fma(_1926, -2.0, _2000);
    if (_1736)
    {
        float _2018 = _1930 ? _1788 : _1694;
        _1794 = _2018;
    }
    float _2020 = _1794;
    float _2022 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2012);
    float _2024 = fma(_2014, _1972, -0.5);
    float _2026 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2006);
    float _2028 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2010);
    float _2030 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2008);
    float _2032 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2034 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2016);
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2040 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1978);
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2044 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2046 = exp2(_2032);
    float _2048 = -_142;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1992);
    float _2052 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1988);
    float _2054 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2044);
    float _2056 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2058 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2060 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2062 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2054);
    float _2064 = _2030 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2068 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2062);
    float _2070 = -_2034;
    float _2072 = fma(_2052, _1948, _2070);
    out.m_73.x = _2056;
    out.m_73.y = _2058;
    out.m_73.z = _2060;
    out.m_73.w = _2064;
    float _2074 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2076 = _2068 + _1147;
    float _2078 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2080 = precise::clamp(_2078, 0.0, 1.0);
    out.gl_Position.x = _1185;
    out.gl_Position.y = _1187;
    out.gl_Position.z = _2068;
    out.gl_Position.w = _1147;
    float _2082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2084 = fma(_2040, _2024, _2050);
    float _2086 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2088 = _2072 + 0.5;
    out.m_75.x = _2026;
    out.m_75.y = _2028;
    out.m_75.z = _2022;
    float _2090 = _2084 + 0.5;
    float _2092 = _2074 * _2066;
    float _2094 = _2076 * 0.5;
    float _2096 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2098 = fma(_2080, -2.0, 3.0);
    float _2100 = _2080 * _2080;
    if (!_1111)
    {
        _1193 = 1.0;
    }
    float _2102 = _1193;
    float _2104 = exp2(_2096);
    float _2106 = _2102;
    if (_1111)
    {
        bool _2108 = _1229 >= _1189;
        bool _2110 = isnan(_1229);
        bool _2112 = _2108 || _2110;
        bool _2114 = isnan(_1189);
        bool _2116 = _2112 || _2114;
        float _2118 = float(_2116);
        _2106 = _2118;
    }
    float _2120 = _2106;
    float _2122 = _2100 * _2098;
    out.m_77.z = _2094;
    out.m_77.w = _1147;
    float _2124 = _2086 * _2082;
    float _2126 = -_2122;
    float _2128 = _2126 + 1.0;
    float _2130 = _2120 * _1440;
    bool _2132 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2134 = isnan(_1462);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2140 = _2136 || _2138;
    float _2142 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2122);
    bool _2144 = _560 <= 8000.0;
    bool _2146 = isnan(_560);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan(8000.0);
    bool _2152 = _2148 || _2150;
    float _2154 = float(_2152);
    out.m_79.x = _2092;
    out.m_79.y = _2124;
    out.m_79.z = _2090;
    out.m_79.w = _2088;
    float _2156 = _2154 * _2142;
    float _2158 = -_2104;
    float _2160 = _2158 + 1.0;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2164 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2166 = _2164;
    float _2168 = 1.0;
    if (!_2140)
    {
        _1153 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2170 = _1153;
    float _2172 = _1702 * _2162;
    float _2174 = precise::clamp(_2172, 0.0, 1.0);
    float _2176 = _2164 * _1231;
    float _2178 = -_2164;
    float _2180 = _2178 + 1.0;
    float _2182 = _2180;
    float _2184 = _2170;
    float _2186 = _2170;
    if (!_2140)
    {
        _2166 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2188 = _2166;
    float _2190 = -_2174;
    float _2192 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2194 = _1242 * _2176;
    float _2196 = _1242 * _2180;
    float _2198 = _2188;
    float _2200 = _2188;
    if (!_2140)
    {
        _2168 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2202 = _2168;
    float _2204 = -_2130;
    float _2206 = fma(_2204, _2192, 1.0);
    float _2208 = precise::clamp(_2206, 0.0, 1.0);
    float _2210 = _2202;
    float _2212 = _2202;
    if (!_2140)
    {
        _606 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2214 = _606;
    float _2216 = _2214;
    float _2218 = _2214;
    if (!_2140)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2220 = _2182;
    float _2222 = _2208 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2224 = _1316 * _1374;
    out.m_83.x = _2222;
    float _2226 = _2224 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2228 = _2224;
    float _2230 = _2220;
    float _2232 = _2220;
    if (!_2140)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2234 = _2228;
    float _2236 = _1684 * _2176;
    float _2238 = fma(_1680, _2194, _1236);
    float _2240 = fma(_1682, _2194, _1238);
    float _2242 = fma(_1242, _2236, _1240);
    out.m_85.x = _2238;
    out.m_85.y = _2240;
    out.m_85.z = _2242;
    out.m_85.w = _2196;
    bool _2244 = !_2140;
    float _2246 = _2234;
    float _2248 = _2234;
    if (!_2244)
    {
        bool _2250 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2252 = isnan(_1462);
        bool _2254 = _2250 || _2252;
        bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2258 = _2254 || _2256;
        if (!_2258)
        {
            float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2262 = _1462 + _2260;
            float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2266 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2264;
            float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2272 = 1.0 / _2266;
            float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2280 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2286 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2288 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2290 = _2262 * _2272;
            float _2292 = precise::clamp(_2290, 0.0, 1.0);
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2298 = fma(_2292, _2270, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2300 = fma(_2292, _2296, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2302 = fma(_2292, _2276, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2304 = fma(_2292, _2280, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2306 = fma(_2292, _2284, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2308 = fma(_2292, _2288, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2218 = _2302;
            _2200 = _2306;
            _2212 = _2298;
            _2232 = _2304;
            _2186 = _2300;
            _2248 = _2308;
            _2310 = true;
        }
        else
        {
            bool _2312 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2314 = isnan(_1462);
            bool _2316 = _2312 || _2314;
            bool _2318 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2320 = _2316 || _2318;
            if (!_2320)
            {
                _2210 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2322 = _2210;
            _2212 = _2322;
            if (!_2320)
            {
                _2216 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2324 = _2216;
            _2218 = _2324;
            if (!_2320)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2326 = _2184;
            _2186 = _2326;
            if (!_2320)
            {
                _2230 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2328 = _2230;
            _2232 = _2328;
            if (!_2320)
            {
                _2198 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2330 = _2198;
            _2200 = _2330;
            if (!_2320)
            {
                _2246 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2332 = _2246;
            bool _2334 = !_2320;
            _2248 = _2332;
            if (!_2334)
            {
                bool _2336 = _1462 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2338 = isnan(_1462);
                bool _2340 = _2336 || _2338;
                bool _2342 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2344 = _2340 || _2342;
                if (!_2344)
                {
                    float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2348 = _1462 + _2346;
                    float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2352 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2350;
                    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2356 = _2354 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2358 = 1.0 / _2352;
                    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2376 = _2348 * _2358;
                    float _2378 = precise::clamp(_2376, 0.0, 1.0);
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2384 = fma(_2378, _2356, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2386 = fma(_2378, _2382, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2388 = fma(_2378, _2362, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2390 = fma(_2378, _2366, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2392 = fma(_2378, _2370, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2394 = fma(_2378, _2374, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2218 = _2388;
                    _2200 = _2392;
                    _2212 = _2384;
                    _2232 = _2390;
                    _2186 = _2386;
                    _2248 = _2394;
                    _2310 = true;
                }
                else
                {
                    _2218 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2200 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2212 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2232 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2248 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2310 = false;
    float _2396 = _2218;
    float _2398 = _2200;
    float _2400 = _2212;
    float _2402 = _2232;
    float _2404 = _2186;
    float _2406 = _2248;
    float _2408 = _2226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2410 = fma(_2028, -0.5, 0.5);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = -_2396;
    float _2416 = _2414 + _2398;
    float _2418 = -_2400;
    float _2420 = _2418 + _2402;
    out.m_87.x = 0.0;
    float _2422 = fma(_2412, _2416, _2396);
    float _2424 = -_2404;
    float _2426 = _2424 + _2406;
    float _2428 = fma(_2412, _2420, _2400);
    float _2430 = _2422 * 0.586610972881317138671875;
    bool _2432 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2434 = fma(_2412, _2426, _2404);
    out.m_59.x = _2408;
    float _2436 = fma(_2428, 0.298911988735198974609375, _2430);
    bool _2438 = _1316 > 0.0;
    bool _2440 = isnan(_1316);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan(0.0);
    bool _2446 = _2442 || _2444;
    float _2448 = fma(_2434, 0.114477999508380889892578125, _2436);
    bool _2450 = _1374 <= 0.0;
    bool _2452 = !_2446;
    bool _2454 = _2450 || _2452;
    float _2456 = -_2448;
    float _2458 = _2428 + _2456;
    float _2460 = -_2448;
    float _2462 = _2422 + _2460;
    float _2464 = -_2448;
    float _2466 = _2434 + _2464;
    float _2468 = fma(_2458, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2448);
    float _2470 = fma(_2462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2448);
    float _2472 = fma(_2466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2448);
    bool _2474 = !_2432;
    if (!_2474)
    {
        float _2476 = -_1037;
        float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2480 = -_1039;
        float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2484 = -_1041;
        float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2488 = _2478 * _2478;
        float _2490 = fma(_2482, _2482, _2488);
        float _2492 = fma(_2486, _2486, _2490);
        float _2494 = sqrt(_2492);
        float _2496 = rsqrt(_2492);
        float _2498 = -_2494;
        float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2502 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2504 = precise::clamp(_2502, 0.0, 1.0);
        float _2506 = _2482 * _2496;
        float _2508 = _2478 * _2496;
        float _2510 = abs(_2504);
        float _2512 = log2(_2510);
        float _2514 = _2486 * _2496;
        float _2516 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2518 = _2028 * _2508;
        float _2520 = -_2508;
        float _2522 = -_2516;
        float _2524 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2522);
        float _2526 = fma(_2026, _2506, _2518);
        float _2528 = -_2514;
        float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2524);
        float _2532 = fma(_2022, _2514, _2526);
        float _2534 = precise::clamp(_2532, 0.0, 1.0);
        float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2538 = _2530 + _2536;
        float _2540 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2542 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2544 = precise::clamp(_2542, 0.0, 1.0);
        float _2546 = exp2(_2540);
        float _2548 = _2546 * _2544;
        float _2550 = _2534 * _2548;
        float _2552 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2554 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2556 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2552;
        out.m_87.y = _2554;
        out.m_87.z = _2556;
    }
    out.m_89.x = _2468;
    out.m_89.y = _2470;
    out.m_89.z = _2472;
    if (!_2454)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2558;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

