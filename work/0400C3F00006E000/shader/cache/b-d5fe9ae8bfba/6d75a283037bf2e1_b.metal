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
    float4 m_73 [[user(locn0)]];
    float4 m_79 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2096 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_56.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_59.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2381 = as_type<float>(_122);
        out.gl_Position.z = _2381;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_61.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_59.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2450 = as_type<float>(_160);
        out.gl_Position.z = _2450;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_63.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_56.x;
    float _196 = in.m_56.y;
    float _198 = in.m_56.z;
    float _200 = _196 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _202 = _196 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _204 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[4].x, _200);
    float _206 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[6].x, _202);
    float _208 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].z, _204);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].z, _206);
    float _212 = _208 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _214 = _210 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _216 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _218 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _220 = floor(_216);
    float _222 = floor(_218);
    float _224 = -_220;
    float _226 = _216 + _224;
    float _228 = -_222;
    float _230 = _218 + _228;
    float2 _2577 = float2(_226, _230);
    float _232 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2577, float2(0.0), isnan(_2577)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2577, float2(0.0), isnan(_2577)), level(0.0)).x;
    float _234 = in.m_63.x;
    float _236 = in.m_63.y;
    float _238 = in.m_63.z;
    float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _242 = log2(_240);
    float _244 = _196 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _256 = 1.0 + _254;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _268 = _266 != 0;
    float _270 = 1.0 / _248;
    bool _272 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _274 = isnan(1.0);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _280 = _276 || _278;
    float _282 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[5].x, _244);
    bool _284 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _286 = isnan(0.0);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _292 = _288 || _290;
    float _294 = _242 * _140;
    float _296 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].z, _282);
    float _298 = 1.0 / _252;
    float _300 = _296 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _302 = _238 * 2.0;
    float _304 = _236 * 2.0;
    float _306 = _234 * 2.0;
    float _308 = exp2(_294);
    float _310 = _236 + _238;
    float _312 = _238 + _234;
    float _314 = _238 + (-0.5);
    float _316 = _236 + _234;
    float _318 = _236 + (-0.5);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _192 + _320;
    float _324 = _234 + (-0.5);
    float _326 = floor(_302);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _192 + _328;
    float _332 = _322 * _298;
    float _334 = _316 + (-1.0);
    float _336 = _310 + (-1.0);
    float _338 = _330 * _270;
    float _340 = 1.0 / _256;
    float _342 = -_308;
    float _344 = _342 + 1.0;
    float _346 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _348 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _350 = isnan(_192);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _360;
    float _364 = _300 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _366 = _292 ? _344 : 0.0;
    float _368 = floor(_304);
    bool _370 = _326 > 0.0;
    float _372 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _374 = _326 >= 0.0;
    bool _376 = isnan(_326);
    bool _378 = _374 || _376;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    float _384 = _312 + (-1.0);
    bool _386 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _388 = isnan(_192);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -_358;
    float _400 = _398 + 1.0;
    float _402 = floor(_306);
    int _404 = 2;
    float _406 = _212;
    if (_280)
    {
        float _408 = _366 * _340;
        _144 = _408;
    }
    float _410 = _144;
    bool _412 = !_260;
    int _414 = _412 ? 0 : 1;
    float _416 = -_396;
    float _418 = _416 + 1.0;
    int _420 = _382 ? 0 : 1;
    float _422 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _424 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _426 = isnan(_192);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _436;
    bool _440 = _368 > 0.0;
    float _442 = fma(_362, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _444 = _368 >= 0.0;
    bool _446 = isnan(_368);
    bool _448 = _444 || _446;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    float _454 = _434 * _400;
    float _456 = fma(_438, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _458 = -_434;
    float _460 = _458 + 1.0;
    int _462 = abs(_414);
    float _464 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[10].x, _364);
    bool _466 = _402 > 0.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _468;
    bool _472 = _402 >= 0.0;
    bool _474 = isnan(_402);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = _358 * _418;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = fma(_470, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = fma(_486, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _500 = _442 * _454;
    float _502 = _300 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _504 = _492 * _454;
    float _506 = _456 * _454;
    int _508 = ~_420;
    int _510 = _508 + 1;
    int _512 = _510 + 1;
    float _514 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[11].x, _502);
    float _516 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].x, _504);
    float _518 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    float _520 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].z, _506);
    int _522 = _512;
    if (!_370)
    {
        int _524 = ~_420;
        int _526 = _524 + 1;
        _522 = _526;
    }
    int _528 = _522;
    float _530 = in.m_65.x;
    float _532 = in.m_65.y;
    float _534 = in.m_65.z;
    float _536 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[11].z, _514);
    float _538 = float(_462);
    float _540 = fma(_496, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _542 = fma(_490, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _544 = _536 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _546 = float(_528);
    float _548 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[10].z, _464);
    int _550 = _452 ? 0 : 1;
    float _552 = 1.0 / _544;
    int _554 = _480 ? 0 : 1;
    float _556 = _538 * _546;
    int _558 = ~_550;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    float _564 = fma(_498, _482, _516);
    int _566 = _562;
    if (!_440)
    {
        int _568 = ~_550;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    float _574 = _556 * (-2.0);
    int _576 = ~_554;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    float _582 = _548 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _584 = _580;
    if (!_466)
    {
        int _586 = ~_554;
        int _588 = _586 + 1;
        _584 = _588;
    }
    int _590 = _584;
    float _592 = fma(_540, _482, _518);
    bool _594 = !_264;
    int _596 = _594 ? 0 : 1;
    float _598 = fma(_346, _574, _346);
    bool _600 = !_268;
    int _602 = _600 ? 0 : 1;
    float _604 = _582 + _544;
    int _606 = abs(_596);
    float _608 = fma(_574, _530, _530);
    int _610 = abs(_602);
    float _612 = _604 * _552;
    float _614 = _612 * 0.5;
    float _616 = float(_606);
    float _618 = in.m_67.x;
    float _620 = in.m_67.y;
    float _622 = in.m_67.z;
    float _624 = float(_590);
    float _626 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    float _628 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[145].x, _564);
    float _630 = _616 * _624;
    float _632 = fma(_598, _410, _626);
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _636 = fma(_614, (*spvDescriptorSet0.vp_c8)._m0[30].w, _634);
    float _638 = float(_610);
    float _640 = _630 * (-2.0);
    float _642 = float(_572);
    float _644 = in.m_69.x;
    float _646 = in.m_69.y;
    float _648 = in.m_69.z;
    float _650 = 1.0 / _636;
    float _652 = fma(_640, _532, _532);
    float _654 = _638 * _642;
    float _656 = fma(_372, _640, _372);
    float _658 = _632 * 0.15915493667125701904296875;
    float _660 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[196].y, _652);
    float _662 = _654 * (-2.0);
    float _664 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[145].y, _592);
    float _666 = _658 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = fma(_656, _410, _660);
    float _672 = fma(_662, _534, _534);
    float _674 = _628 * _618;
    float _676 = fma(_422, _662, _422);
    float _678 = _664 * _620;
    float _680 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[196].z, _672);
    float _682 = _670 * 0.15915493667125701904296875;
    float _684 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _686 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _688 = fma(_676, _410, _680);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _692 = _650 * _690;
    float _694 = _682 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = fma(_542, _482, _520);
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _646);
    float _702 = _688 * 0.15915493667125701904296875;
    bool _704 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _706 = _300 + _684;
    bool _708 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _710 = _686 * _700;
    float _712 = _682 * 6.283185482025146484375;
    float _714 = cos(_712);
    float _716 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[145].z, _698);
    bool _718 = !_704;
    int _720 = _718 ? 0 : 1;
    float _722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _644);
    float _724 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _726 = _706 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _728 = _716 * _622;
    float _730 = _706 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _732 = _702 * 6.283185482025146484375;
    float _734 = cos(_732);
    if (!_704)
    {
        _404 = 1;
    }
    int _736 = _404;
    float _738 = _724 * _722;
    int _740 = _736;
    if (!_708)
    {
        _740 = _720;
    }
    int _742 = _740;
    float _744 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[127].x, _726);
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _648);
    float _748 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _750 = _742 << 6;
    float _752 = _658 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[127].z, _744);
    float _758 = _668 * _714;
    float _760 = _668 * _696;
    float _762 = _748 * _746;
    float _764 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[126].x, _730);
    int _766 = _750 + 48;
    uint _769 = uint(int(uint(_766) >> uint(2)));
    uint _771 = uint(int(uint(int(_769)) >> uint(2)));
    int _773 = int(_769) & 3;
    float _775 = (*spvDescriptorSet0.vp_c15)._m0[int(_771)][_773];
    int _777 = int(_769) + 1;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    int _781 = _777 & 3;
    float _783 = (*spvDescriptorSet0.vp_c15)._m0[int(_779)][_781];
    bool _785 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _787 = isnan(0.5);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _793 = _789 || _791;
    float _795 = _702 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _668 * _734;
    float _801 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[126].z, _764);
    int _803 = _750 + 96;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    uint _807 = uint(int(uint(int(_805)) >> uint(2)));
    int _809 = int(_805) & 3;
    float _811 = (*spvDescriptorSet0.vp_c15)._m0[int(_807)][_809];
    int _813 = int(_805) + 1;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    int _817 = _813 & 3;
    float _819 = (*spvDescriptorSet0.vp_c15)._m0[int(_815)][_817];
    float _821 = _801 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _823 = _754 * _696;
    float _825 = _754 * _714;
    float _827 = _754 * _734;
    float _829 = _714 * _734;
    float _831 = _696 * _734;
    float _833 = _756 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _835 = _799 * _710;
    float _837 = trunc(_821);
    int _839 = int(_837);
    float _841 = fma(_797, _758, _823);
    float _843 = -_760;
    float _845 = fma(_797, _825, _843);
    float _847 = -_825;
    float _849 = fma(_797, _760, _847);
    float _851 = -_710;
    float _853 = _797 * _851;
    float _855 = fma(_841, _738, _835);
    float _857 = _827 * _710;
    int _859 = _750 + 104;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    uint _863 = uint(int(uint(int(_861)) >> uint(2)));
    int _865 = int(_861) & 3;
    float _867 = (*spvDescriptorSet0.vp_c15)._m0[int(_863)][_865];
    int _869 = int(_861) + 1;
    uint _871 = uint(int(uint(_869) >> uint(2)));
    int _873 = _869 & 3;
    float _875 = (*spvDescriptorSet0.vp_c15)._m0[int(_871)][_873];
    float _877 = trunc(_833);
    int _879 = int(_877);
    float _881 = fma(_829, _738, _853);
    float _883 = fma(_849, _762, _855);
    float _885 = fma(_797, _823, _758);
    float _887 = fma(_845, _738, _857);
    float _889 = fma(_831, _762, _881);
    float _891 = _883 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _893 = _750 + 64;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    uint _897 = uint(int(uint(int(_895)) >> uint(2)));
    int _899 = int(_895) & 3;
    float _901 = (*spvDescriptorSet0.vp_c15)._m0[int(_897)][_899];
    int _903 = int(_895) + 1;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    int _907 = _903 & 3;
    float _909 = (*spvDescriptorSet0.vp_c15)._m0[int(_905)][_907];
    float _911 = _883 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _913 = fma(_885, _762, _887);
    float _915 = fma(_889, (*spvDescriptorSet0.vp_c10)._m0[10].x, _891);
    int _917 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _919 = _839 + _917;
    int _921 = _919 + 1;
    float _923 = fma(_889, (*spvDescriptorSet0.vp_c10)._m0[8].x, _911);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[10].z, _915);
    int _927 = _750 + 56;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c15)._m0[int(_931)][_933];
    int _937 = int(_929) + 1;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    int _941 = _937 & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    float _945 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[8].z, _923);
    int _947 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _949 = _879 + _947;
    int _951 = _949 + 1;
    float _953 = _214 + _925;
    bool _955 = _921 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _957 = _212 + _945;
    int _959 = _921 | _951;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _963 = _953 + _961;
    int _965 = _750 + 72;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    uint _969 = uint(int(uint(int(_967)) >> uint(2)));
    int _971 = int(_967) & 3;
    float _973 = (*spvDescriptorSet0.vp_c15)._m0[int(_969)][_971];
    int _975 = int(_967) + 1;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    int _979 = _975 & 3;
    float _981 = (*spvDescriptorSet0.vp_c15)._m0[int(_977)][_979];
    bool _983 = _959 < 0;
    bool _985 = _983 || _955;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _989 = _957 + _987;
    float _991 = _963 * _963;
    bool _993 = _951 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _995 = _993 || _985;
    int _997 = _750 + 80;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
    int _1003 = int(_999) & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = int(_999) + 1;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    int _1011 = _1007 & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    float _1015 = fma(_989, _989, _991);
    float _1017 = _706 * _819;
    float _1019 = _883 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1021 = sqrt(_1015);
    float _1023 = fma(_212, _811, _1017);
    int _1025 = as_type<int>(_883);
    int _1027 = as_type<int>(_1023);
    float _1029 = _957;
    float _1031 = _953;
    float _1033 = _1015;
    float _1035 = _963;
    float _1037 = _989;
    float _1039 = as_type<float>(_742);
    float _1041 = _889;
    if (!_995)
    {
        int _1043 = _951 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1045 = _1043 + _921;
        _1025 = _1045;
    }
    int _1047 = _1025;
    float _1049 = _706 * _783;
    float _1051 = fma(_889, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1019);
    float _1053 = _1019;
    int _1055 = as_type<int>(_1051);
    if (!_995)
    {
        float _1057 = floor(_821);
        _1053 = _1057;
    }
    float _1059 = _1053;
    float _1061 = fma(_214, _867, _1023);
    float _1063 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1051);
    float _1065 = fma(_212, _775, _1049);
    int _1067 = as_type<int>(_901);
    if (!_995)
    {
        int _1069 = _1047 << 2;
        _1027 = _1069;
    }
    int _1071 = _1027;
    float _1073 = _1061 + _875;
    bool _1075 = _1021 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1077 = _300 + _1063;
    float _1079 = as_type<float>(_1071);
    if (!_995)
    {
        int _1081 = 12 & _1071;
        _1055 = _1081;
    }
    int _1083 = _1055;
    float _1085 = _706 * _909;
    float _1087 = 1.0 / _1073;
    float _1089 = fma(_212, _901, _1085);
    if (!_995)
    {
        uint _1091 = uint(int(uint(_1047) >> uint(2)));
        _1067 = int(_1091);
    }
    int _1093 = _1067;
    float _1095 = fma(_214, _935, _1065);
    int _1097 = _1093;
    if (!_995)
    {
        int _1099 = _1093 << 4;
        int _1101 = _1099 + _1083;
        _1097 = _1101;
    }
    int _1103 = _1097;
    float _1105 = _1095 + _943;
    float _1107 = fma(_214, _973, _1089);
    float _1109 = _973;
    if (!_1075)
    {
        _1109 = _1077;
    }
    float _1111 = _1109;
    float _1113 = _1107 + _981;
    bool _1115 = !_1075;
    float _1117 = _1111;
    if (!_1115)
    {
        float _1119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1123 = _1021 + _1121;
        float _1125 = _1077 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1127 = rsqrt(_1015);
        float _1129 = _1123 * _1119;
        float _1131 = _1129 * 0.15915493667125701904296875;
        float _1133 = _1131 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1131 * 6.283185482025146484375;
        float _1139 = cos(_1137);
        float _1141 = fma(_1135, _1125, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1143 = _1127 * _1141;
        float _1145 = _1139 + (-1.0);
        float _1147 = fma(_989, _1143, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1149 = fma(_963, _1143, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1151 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1153 = fma(_1077, _1139, _1151);
        _1029 = _1147;
        _1117 = _1153;
        _1031 = _1149;
        _1033 = _1127;
        _1079 = _1125;
    }
    float _1155 = _1029;
    float _1157 = _1117;
    float _1159 = _1031;
    float _1161 = _1033;
    float _1163 = _1079;
    float _1165 = _1161;
    float _1167 = _1163;
    if (_793)
    {
        _1165 = _1155;
    }
    float _1169 = _1165;
    float _1171 = _1169;
    if (_793)
    {
        _1035 = _1157;
    }
    float _1173 = _1035;
    float _1175 = _1173;
    if (_793)
    {
        _1037 = _1159;
    }
    float _1177 = _1037;
    float _1179 = _1177;
    if (!_793)
    {
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1183 = _300 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1187 = _212 + _1185;
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1191 = -_300;
        float _1193 = _1191 + _1157;
        float _1195 = _1183 * _1183;
        float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1199 = _214 + _1197;
        float _1201 = -_212;
        float _1203 = _1201 + _1155;
        float _1205 = -_214;
        float _1207 = _1205 + _1159;
        float _1209 = fma(_1187, _1187, _1195);
        float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1213 = fma(_1199, _1199, _1209);
        float _1215 = sqrt(_1213);
        float _1217 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1219 = precise::min(_1215, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1221 = _1219 * _1211;
        float _1223 = _1217 * _1221;
        float _1225 = fma(_1193, _1223, _300);
        float _1227 = fma(_1203, _1223, _212);
        float _1229 = fma(_1207, _1223, _214);
        _1175 = _1225;
        _1171 = _1227;
        _1179 = _1229;
        _1167 = _1215;
    }
    float _1231 = _1175;
    float _1233 = _1171;
    float _1235 = _1179;
    float _1237 = _1167;
    int _1239 = _750 + 88;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    uint _1243 = uint(int(uint(int(_1241)) >> uint(2)));
    int _1245 = int(_1241) & 3;
    float _1247 = (*spvDescriptorSet0.vp_c15)._m0[int(_1243)][_1245];
    int _1249 = int(_1241) + 1;
    uint _1251 = uint(int(uint(_1249) >> uint(2)));
    int _1253 = _1249 & 3;
    float _1255 = (*spvDescriptorSet0.vp_c15)._m0[int(_1251)][_1253];
    float _1257 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1259 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1261 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1263 = _1105 * _1087;
    float _1265 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1257);
    float _1267 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1259);
    float _1269 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1261);
    float _1271 = _1155;
    if (!_995)
    {
        int _1273 = _1103 + 400;
        uint _1275 = uint(int(uint(_1273) >> uint(2)));
        uint _1277 = uint(int(uint(int(_1275)) >> uint(2)));
        int _1279 = int(_1275) & 3;
        float _1281 = (*spvDescriptorSet0.vp_c15)._m0[int(_1277)][_1279];
        _1271 = _1281;
    }
    float _1283 = _1271;
    float _1285 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1265);
    bool _1287 = _1263 >= 0.0;
    float _1289 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1267);
    float _1291 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1293 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1269);
    float _1295 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1297 = _1113 * _1087;
    bool _1299 = _1263 <= 1.0;
    bool _1301 = _1299 && _1287;
    float _1303 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1291);
    float _1307 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1309 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1311 = _1297 >= 0.0;
    bool _1313 = _1311 && _1301;
    float _1315 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1317 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1319 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1305);
    float _1321 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1309);
    bool _1323 = _1297 <= 1.0;
    bool _1325 = _1323 && _1313;
    float _1327 = -_1317;
    float _1329 = fma(_1327, _1315, 1.0);
    float _1331 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1333 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = _706 * _1013;
    float _1337 = _1237;
    if (!_995)
    {
        float _1339 = floor(_833);
        _1337 = _1339;
    }
    float _1341 = _1337;
    float _1343 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    float _1347 = fma(_212, _1005, _1335);
    float _1349 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1351 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1343);
    float _1353 = log2(_1329);
    float _1355 = _1345;
    if (_1325)
    {
        float _1357 = float(_742);
        _1039 = _1357;
    }
    float _1359 = _1039;
    float _1361 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1349);
    float _1363 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1365 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1361);
    float _1367 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1363);
    float _1369 = 1.0 / _1345;
    float _1371 = fma(_214, _1247, _1347);
    float _1373 = _1255;
    float _1375 = _1359;
    if (!_995)
    {
        float _1377 = -_1341;
        float _1379 = _833 + _1377;
        _1041 = _1379;
    }
    float _1381 = _1041;
    float _1383 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1365);
    float _1385 = _1371 + _1255;
    float _1387 = _1383;
    if (!_995)
    {
        float _1389 = -_1059;
        float _1391 = _821 + _1389;
        _1373 = _1391;
    }
    float _1393 = _1373;
    float _1395 = _1335;
    float _1397 = _1393;
    if (_1325)
    {
        float _1399 = rint(_1359);
        float _1401 = precise::max(_1399, 0.0);
        uint _1403 = uint(_1401);
        uint _1405 = clamp(_1403, 0u, 65535u);
        _1395 = as_type<float>(_1405);
    }
    float _1407 = _1395;
    float _1409 = _1385 * _1087;
    float _1411 = _1353 * 0.693147182464599609375;
    float _1413 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1415 = _1385;
    if (!_995)
    {
        float _1417 = rint(_1283);
        float _1419 = precise::max(_1417, 0.0);
        uint _1421 = uint(_1419);
        uint _1423 = clamp(_1421, 0u, 65535u);
        _1415 = as_type<float>(_1423);
    }
    float _1425 = _1415;
    float _1427 = _1367 * _1369;
    float _1429 = _1383 * _1369;
    float _1431 = fma(_1427, 0.5, 0.5);
    float _1433 = fma(_1429, -0.5, 0.5);
    float _1435 = as_type<float>(_750);
    if (_1325)
    {
        float3 _4498 = float3(_1263, _1297, float(as_type<int>(_1407)));
        float3 _4502 = select(_4498, float3(0.0), isnan(_4498));
        float _1437 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4502.xy, uint(rint(_4502.z)), _1409, level(0.0));
        _1435 = _1437;
    }
    float _1439 = _1435;
    float3 _4512 = float3(_1431, _1433, _1413);
    float _1441 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4512, float3(0.0), isnan(_4512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4512, float3(0.0), isnan(_4512)), level(0.0)).x;
    float3 _4521 = float3(_1431, _1433, _1413);
    float4 _1444 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4521, float3(0.0), isnan(_4521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4521, float3(0.0), isnan(_4521)), level(0.0)).xyzw;
    float _1446 = _1444.x;
    float _1448 = _1444.y;
    float _1450 = _1444.z;
    float _1452 = _1444.w;
    float _1454 = _1411;
    if (!_995)
    {
        float3 _4544 = float3(_1393, _1381, float(as_type<int>(_1425)));
        float3 _4546 = select(_4544, float3(0.0), isnan(_4544));
        float _1456 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4546.xy, uint(rint(_4546.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4546.xy, uint(rint(_4546.z)), level(0.0)).x;
        _1454 = _1456;
    }
    float _1458 = _1454;
    if (_995)
    {
        _1375 = 1.0;
    }
    float _1460 = _1375;
    float _1462 = _1460;
    if (!_995)
    {
        int _1464 = _1047 << 4;
        int _1466 = _1464 + 2048;
        uint _1468 = uint(int(uint(_1466) >> uint(2)));
        uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
        int _1472 = int(_1468) & 3;
        float _1474 = (*spvDescriptorSet0.vp_c15)._m0[int(_1470)][_1472];
        int _1476 = int(_1468) + 1;
        uint _1478 = uint(int(uint(_1476) >> uint(2)));
        int _1480 = _1476 & 3;
        float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
        int _1484 = _1466 + 8;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
        int _1490 = int(_1486) & 3;
        float _1492 = (*spvDescriptorSet0.vp_c15)._m0[int(_1488)][_1490];
        int _1494 = int(_1486) + 1;
        uint _1496 = uint(int(uint(_1494) >> uint(2)));
        int _1498 = _1494 & 3;
        float _1500 = (*spvDescriptorSet0.vp_c15)._m0[int(_1496)][_1498];
        float _1502 = _706 * _1482;
        float _1504 = fma(_212, _1474, _1502);
        float _1506 = fma(_214, _1492, _1504);
        float _1508 = _1506 + _1500;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        float _1512 = -_1510;
        float _1514 = _1512 + _1458;
        float _1516 = fma(_1514, 500.0, 1.5);
        float _1518 = exp2(_1516);
        float _1520 = 0.0 + _1518;
        float _1522 = precise::clamp(_1520, 0.0, 1.0);
        _1397 = _1500;
        _1462 = _1522;
    }
    float _1524 = _1397;
    float _1526 = _1462;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1231 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1534 = _1233 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = _1235 + _1536;
    float _1540 = _1530 * _1530;
    float _1542 = fma(_1534, _1534, _1540);
    float _1544 = fma(_1538, _1538, _1542);
    float _1546 = rsqrt(_1544);
    float _1548 = sqrt(_1544);
    float _1550 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1552 = _1534 * _1550;
    float _1554 = _1538 * _1550;
    float _1556 = _1552 * _1552;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 + _1558;
    float _1562 = sqrt(_1560);
    bool _1564 = _1562 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = _1562 + _1566;
    float _1570 = _1524;
    float _1572 = _1560;
    float _1574 = _1568;
    float _1576 = _1530;
    float _1578 = _1550;
    float _1580 = _1552;
    float _1582 = _1554;
    float _1584 = _1558;
    if (_1564)
    {
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1570 = _1586;
    }
    float _1588 = _1570;
    if (_1564)
    {
        float _1590 = rsqrt(_1560);
        _1572 = _1590;
    }
    float _1592 = _1572;
    if (_1564)
    {
        float _1594 = _1568 * _1588;
        _1574 = _1594;
    }
    float _1596 = _1574;
    if (_1564)
    {
        float _1598 = _1596 * 0.15915493667125701904296875;
        _406 = _1598;
    }
    float _1600 = _406;
    float _1602 = _1433;
    if (_1564)
    {
        float _1604 = _1600 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1431;
    float _1616 = _1612;
    float _1618 = _1610;
    if (_1564)
    {
        float _1620 = _1600 * 6.283185482025146484375;
        float _1622 = cos(_1620);
        _1614 = _1622;
    }
    float _1624 = _1614;
    float _1626 = -_1550;
    float _1628 = -_1612;
    float _1630 = fma(_1530, _1626, _1628);
    if (!_1564)
    {
        _1616 = _1556;
    }
    float _1632 = _1616;
    float _1634 = _1632;
    if (_1564)
    {
        float _1636 = _1630 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1636;
    }
    float _1638 = _1576;
    float _1640 = _1608;
    float _1642 = _1638;
    if (_1564)
    {
        float _1644 = fma(_1608, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1640 = _1644;
    }
    float _1646 = _1640;
    float _1648 = _1646;
    if (!_1564)
    {
        _1642 = _1630;
    }
    float _1650 = _1642;
    float _1652 = _1650;
    if (_1564)
    {
        float _1654 = _1624 + (-1.0);
        _1618 = _1654;
    }
    float _1656 = _1618;
    if (_1564)
    {
        float _1658 = _1592 * _1646;
        _1578 = _1658;
    }
    float _1660 = _1578;
    if (_1564)
    {
        float _1662 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1648 = _1662;
    }
    float _1664 = _1648;
    if (_1564)
    {
        float _1666 = _1552 * _1660;
        _1580 = _1666;
    }
    float _1668 = _1580;
    if (_1564)
    {
        float _1670 = _1554 * _1660;
        _1582 = _1670;
    }
    float _1672 = _1582;
    if (_1564)
    {
        float _1674 = fma(_1630, _1624, _1664);
        _1652 = _1674;
    }
    float _1676 = _1652;
    if (_1564)
    {
        float _1678 = _1668 * _1668;
        _1634 = _1678;
    }
    float _1680 = _1634;
    if (_1564)
    {
        float _1682 = _1672 * _1672;
        _1584 = _1682;
    }
    float _1684 = _1584;
    float _1686 = fma(_1676, _1676, _1680);
    float _1688 = _1686 + _1684;
    float _1690 = rsqrt(_1688);
    float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1694 = fma(_1548, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1692);
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = -_1696;
    float _1700 = _1698 + 1.0;
    float _1702 = _1690 * _1668;
    float _1704 = _1690 * _1676;
    float _1706 = _1690 * _1672;
    float _1708 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = abs(_1700);
    float _1712 = log2(_1710);
    float _1714 = -_1708;
    float _1716 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1714);
    float _1718 = -_1706;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1716);
    float _1722 = fma(_1720, -0.5, 0.5);
    float _1724 = fma(_1720, 0.5, 0.5);
    float _1726 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1728 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1730 = sqrt(_1722);
    float _1732 = fma(_1724, _1726, -0.212114393711090087890625);
    float _1734 = _1704 + 1.0;
    float _1736 = fma(_1724, _1732, 1.570728778839111328125);
    float _1738 = exp2(_1728);
    float _1740 = _1730 * 0.636619746685028076171875;
    float _1742 = -_1736;
    float _1744 = fma(_1740, _1742, 1.0);
    float _1746 = -_1704;
    float _1748 = fma(_1738, _1734, _1746);
    float _1750 = fma(_1748, 0.5, 0.5);
    float2 _5000 = float2(_1744, _1750);
    float3 _1754 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5000, float2(0.0), isnan(_5000)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5000, float2(0.0), isnan(_5000)), level(0.0)).xyz;
    float _1756 = _1754.x;
    float _1758 = _1754.y;
    float _1760 = _1754.z;
    float _1762 = abs(_692);
    float _1764 = log2(_1762);
    float _1766 = in.m_71.x;
    float _1768 = in.m_71.y;
    float _1770 = in.m_71.z;
    bool _1772 = _646 != 0.0;
    bool _1774 = isnan(_646);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan(0.0);
    bool _1780 = _1776 || _1778;
    float _1782 = -_232;
    float _1784 = _1782 + 1.0;
    bool _1786 = _644 == 0.0;
    bool _1788 = !_1780;
    bool _1790 = _1786 && _1788;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1794 = _648 == 0.0;
    bool _1796 = _1794 && _1790;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1806 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1810 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1812 = exp2(_1802);
    float _1814 = _1768;
    float _1816 = _1766;
    float _1818 = _1770;
    if (!_1796)
    {
        float _1820 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1768);
        _1814 = _1820;
    }
    float _1822 = _1814;
    if (!_1796)
    {
        float _1824 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1766);
        _1816 = _1824;
    }
    float _1826 = _1816;
    if (!_1796)
    {
        float _1828 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1770);
        _1818 = _1828;
    }
    float _1830 = _1818;
    float _1832 = _799 * _1822;
    float _1834 = -_1822;
    float _1836 = _797 * _1834;
    float _1838 = _827 * _1822;
    float _1840 = fma(_841, _1826, _1832);
    float _1842 = fma(_829, _1826, _1836);
    float _1844 = fma(_845, _1826, _1838);
    out.m_73.x = _1800;
    out.m_73.y = _1806;
    out.m_73.z = _1810;
    out.m_73.w = _1808;
    float _1846 = fma(_849, _1830, _1840);
    float _1848 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1850 = precise::clamp(_1848, 0.0, 1.0);
    float _1852 = fma(_831, _1830, _1842);
    float _1854 = fma(_885, _1830, _1844);
    float _1856 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1858 = fma(_1850, -2.0, 3.0);
    float _1860 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1862 = _1850 * _1850;
    float _1864 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1866 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1868 = isnan(_1548);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1874 = _1870 || _1872;
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1860);
    float _1878 = exp2(_1856);
    float _1880 = _1862 * _1858;
    float _1882 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1884 = fma(_1852, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1864);
    float _1886 = fma(_1854, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1876);
    float _1888 = -_1880;
    float _1890 = _1888 + 1.0;
    float _1892 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1882);
    float _1894 = fma(_1854, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1884);
    bool _1896 = _692 <= 8000.0;
    bool _1898 = isnan(_692);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(8000.0);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = fma(_1890, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1880);
    float _1910 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1892);
    float _1912 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1914 = _1906 * _1908;
    float _1916 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1910);
    float _1918 = -_1878;
    float _1920 = _1918 + 1.0;
    float _1922 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1924 = _1916 + _1345;
    out.gl_Position.x = _1367;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _1916;
    out.gl_Position.w = _1345;
    float _1926 = fma(_1852, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1912);
    float _1928 = _1784 * _1922;
    float _1930 = precise::clamp(_1928, 0.0, 1.0);
    float _1932 = _1924 * 0.5;
    float _1934 = _1924;
    float _1936 = _1916;
    if (!_1325)
    {
        _1934 = 1.0;
    }
    float _1938 = _1934;
    float _1940 = fma(_1854, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1926);
    float _1942 = _1938;
    if (_1325)
    {
        bool _1944 = _1439 >= _1409;
        bool _1946 = isnan(_1439);
        bool _1948 = _1944 || _1946;
        bool _1950 = isnan(_1409);
        bool _1952 = _1948 || _1950;
        float _1954 = float(_1952);
        _1942 = _1954;
    }
    float _1956 = _1942;
    float _1958 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1960 = -_1930;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_75.z = _1932;
    out.m_75.w = _1345;
    float _1964 = _1958 * _1441;
    float _1966 = _1956 * _1526;
    out.m_77.x = _1886;
    out.m_77.y = _1940;
    out.m_77.z = _1894;
    float _1968 = -_1958;
    float _1970 = _1968 + 1.0;
    float _1972 = -_1966;
    float _1974 = fma(_1972, _1962, 1.0);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = _1970;
    float _1980 = 1.0;
    float _1982 = 1.0;
    if (!_1874)
    {
        _1355 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1984 = _1355;
    float _1986 = _1452 * _1970;
    float _1988 = _1452 * _1964;
    float _1990 = _1976 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _1992 = _1984;
    float _1994 = _1984;
    if (!_1874)
    {
        _1936 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1996 = _1936;
    float _1998 = _1996;
    float _2000 = _1996;
    if (!_1874)
    {
        _1387 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2002 = _1387;
    out.m_81.x = _1990;
    float _2004 = _2002;
    float _2006 = _2002;
    if (!_1874)
    {
        _1978 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2008 = _1978;
    float _2010 = _2008;
    float _2012 = _2008;
    if (!_1874)
    {
        _1980 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2014 = _1980;
    float _2016 = _2014;
    float _2018 = _2014;
    if (!_1874)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2020 = _1982;
    float _2022 = _1760 * _1964;
    float _2024 = fma(_1756, _1988, _1446);
    float _2026 = fma(_1758, _1988, _1448);
    float _2028 = fma(_1452, _2022, _1450);
    out.m_83.x = _2024;
    out.m_83.y = _2026;
    out.m_83.z = _2028;
    out.m_83.w = _1986;
    bool _2030 = !_1874;
    float _2032 = _2020;
    float _2034 = _2020;
    if (!_2030)
    {
        bool _2036 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2038 = isnan(_1548);
        bool _2040 = _2036 || _2038;
        bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2044 = _2040 || _2042;
        if (!_2044)
        {
            float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2048 = _1548 + _2046;
            float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2052 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2050;
            float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2058 = 1.0 / _2052;
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2062 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2076 = _2048 * _2058;
            float _2078 = precise::clamp(_2076, 0.0, 1.0);
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2084 = fma(_2078, _2056, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2086 = fma(_2078, _2082, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2088 = fma(_2078, _2062, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2090 = fma(_2078, _2066, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2092 = fma(_2078, _2070, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2094 = fma(_2078, _2074, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2034 = _2088;
            _2006 = _2092;
            _2018 = _2084;
            _2000 = _2090;
            _1994 = _2086;
            _2012 = _2094;
            _2096 = true;
        }
        else
        {
            bool _2098 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2100 = isnan(_1548);
            bool _2102 = _2098 || _2100;
            bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2106 = _2102 || _2104;
            if (!_2106)
            {
                _2016 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2108 = _2016;
            _2018 = _2108;
            if (!_2106)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2110 = _2032;
            _2034 = _2110;
            if (!_2106)
            {
                _1992 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2112 = _1992;
            _1994 = _2112;
            if (!_2106)
            {
                _1998 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2114 = _1998;
            _2000 = _2114;
            if (!_2106)
            {
                _2004 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2116 = _2004;
            _2006 = _2116;
            if (!_2106)
            {
                _2010 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2118 = _2010;
            bool _2120 = !_2106;
            _2012 = _2118;
            if (!_2120)
            {
                bool _2122 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2124 = isnan(_1548);
                bool _2126 = _2122 || _2124;
                bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2130 = _2126 || _2128;
                if (!_2130)
                {
                    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2134 = _1548 + _2132;
                    float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2136;
                    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2144 = 1.0 / _2138;
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2162 = _2134 * _2144;
                    float _2164 = precise::clamp(_2162, 0.0, 1.0);
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2170 = fma(_2164, _2142, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2172 = fma(_2164, _2168, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2174 = fma(_2164, _2148, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2176 = fma(_2164, _2152, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2178 = fma(_2164, _2156, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2180 = fma(_2164, _2160, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2034 = _2174;
                    _2006 = _2178;
                    _2018 = _2170;
                    _2000 = _2176;
                    _1994 = _2172;
                    _2012 = _2180;
                    _2096 = true;
                }
                else
                {
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2006 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2018 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2000 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1994 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2012 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2096 = false;
    float _2182 = _2034;
    float _2184 = _2006;
    float _2186 = _2018;
    float _2188 = _2000;
    float _2190 = _1994;
    float _2192 = _2012;
    float _2194 = fma(_1940, -0.5, 0.5);
    float _2196 = precise::clamp(_2194, 0.0, 1.0);
    float _2198 = -_2182;
    float _2200 = _2198 + _2184;
    float _2202 = -_2186;
    float _2204 = _2202 + _2188;
    float _2206 = -_2190;
    float _2208 = _2206 + _2192;
    bool _2210 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2212 = fma(_2196, _2200, _2182);
    float _2214 = fma(_2196, _2204, _2186);
    float _2216 = fma(_2196, _2208, _2190);
    float _2218 = _2212 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2220 = fma(_2214, 0.298911988735198974609375, _2218);
    float _2222 = fma(_2216, 0.114477999508380889892578125, _2220);
    out.m_85.x = 0.0;
    float _2224 = -_2222;
    float _2226 = _2214 + _2224;
    float _2228 = -_2222;
    float _2230 = _2212 + _2228;
    float _2232 = -_2222;
    float _2234 = _2216 + _2232;
    float _2236 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2222);
    float _2240 = fma(_2230, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2222);
    float _2242 = fma(_2234, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2222);
    out.m_81.w = _2236;
    out.m_87.x = _2238;
    out.m_87.y = _2240;
    out.m_87.z = _2242;
    if (!_2210)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2244 = -_1231;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2248 = -_1233;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2252 = -_1235;
    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2256 = _2246 * _2246;
    float _2258 = fma(_2250, _2250, _2256);
    float _2260 = fma(_2254, _2254, _2258);
    float _2262 = sqrt(_2260);
    float _2264 = rsqrt(_2260);
    float _2266 = -_2262;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2270 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2272 = precise::clamp(_2270, 0.0, 1.0);
    float _2274 = _2250 * _2264;
    float _2276 = _2246 * _2264;
    float _2278 = abs(_2272);
    float _2280 = log2(_2278);
    float _2282 = _2254 * _2264;
    float _2284 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2286 = _1940 * _2276;
    float _2288 = -_2276;
    float _2290 = -_2284;
    float _2292 = fma(_2288, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2290);
    float _2294 = fma(_1886, _2274, _2286);
    float _2296 = -_2282;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2292);
    float _2300 = fma(_1894, _2282, _2294);
    float _2302 = precise::clamp(_2300, 0.0, 1.0);
    float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2306 = _2298 + _2304;
    float _2308 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2310 = _2306 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = exp2(_2308);
    float _2316 = _2314 * _2312;
    float _2318 = _2302 * _2316;
    float _2320 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2322 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2324 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2320;
    out.m_85.y = _2322;
    out.m_85.z = _2324;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2096 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_56.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_59.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2381 = as_type<float>(_122);
        out.gl_Position.z = _2381;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_61.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_59.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2450 = as_type<float>(_160);
        out.gl_Position.z = _2450;
    }
    if (_154)
    {
        return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_63.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_56.x;
    float _196 = in.m_56.y;
    float _198 = in.m_56.z;
    float _200 = _196 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _202 = _196 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _204 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[4].x, _200);
    float _206 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[6].x, _202);
    float _208 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].z, _204);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].z, _206);
    float _212 = _208 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _214 = _210 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _216 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _218 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _220 = floor(_216);
    float _222 = floor(_218);
    float _224 = -_220;
    float _226 = _216 + _224;
    float _228 = -_222;
    float _230 = _218 + _228;
    float2 _2577 = float2(_226, _230);
    float _232 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2577, float2(0.0), isnan(_2577)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2577, float2(0.0), isnan(_2577)), level(0.0)).x;
    float _234 = in.m_63.x;
    float _236 = in.m_63.y;
    float _238 = in.m_63.z;
    float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _242 = log2(_240);
    float _244 = _196 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _256 = 1.0 + _254;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _268 = _266 != 0;
    float _270 = 1.0 / _248;
    bool _272 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _274 = isnan(1.0);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _280 = _276 || _278;
    float _282 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[5].x, _244);
    bool _284 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _286 = isnan(0.0);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _292 = _288 || _290;
    float _294 = _242 * _140;
    float _296 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].z, _282);
    float _298 = 1.0 / _252;
    float _300 = _296 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _302 = _238 * 2.0;
    float _304 = _236 * 2.0;
    float _306 = _234 * 2.0;
    float _308 = exp2(_294);
    float _310 = _236 + _238;
    float _312 = _238 + _234;
    float _314 = _238 + (-0.5);
    float _316 = _236 + _234;
    float _318 = _236 + (-0.5);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _192 + _320;
    float _324 = _234 + (-0.5);
    float _326 = floor(_302);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _192 + _328;
    float _332 = _322 * _298;
    float _334 = _316 + (-1.0);
    float _336 = _310 + (-1.0);
    float _338 = _330 * _270;
    float _340 = 1.0 / _256;
    float _342 = -_308;
    float _344 = _342 + 1.0;
    float _346 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _348 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _350 = isnan(_192);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _360;
    float _364 = _300 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _366 = _292 ? _344 : 0.0;
    float _368 = floor(_304);
    bool _370 = _326 > 0.0;
    float _372 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _374 = _326 >= 0.0;
    bool _376 = isnan(_326);
    bool _378 = _374 || _376;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    float _384 = _312 + (-1.0);
    bool _386 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _388 = isnan(_192);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -_358;
    float _400 = _398 + 1.0;
    float _402 = floor(_306);
    int _404 = 2;
    float _406 = _212;
    if (_280)
    {
        float _408 = _366 * _340;
        _144 = _408;
    }
    float _410 = _144;
    bool _412 = !_260;
    int _414 = _412 ? 0 : 1;
    float _416 = -_396;
    float _418 = _416 + 1.0;
    int _420 = _382 ? 0 : 1;
    float _422 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _424 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _426 = isnan(_192);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _436;
    bool _440 = _368 > 0.0;
    float _442 = fma(_362, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _444 = _368 >= 0.0;
    bool _446 = isnan(_368);
    bool _448 = _444 || _446;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    float _454 = _434 * _400;
    float _456 = fma(_438, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _458 = -_434;
    float _460 = _458 + 1.0;
    int _462 = abs(_414);
    float _464 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[10].x, _364);
    bool _466 = _402 > 0.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _468;
    bool _472 = _402 >= 0.0;
    bool _474 = isnan(_402);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = _358 * _418;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = fma(_470, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = fma(_486, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _500 = _442 * _454;
    float _502 = _300 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _504 = _492 * _454;
    float _506 = _456 * _454;
    int _508 = ~_420;
    int _510 = _508 + 1;
    int _512 = _510 + 1;
    float _514 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[11].x, _502);
    float _516 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].x, _504);
    float _518 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    float _520 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].z, _506);
    int _522 = _512;
    if (!_370)
    {
        int _524 = ~_420;
        int _526 = _524 + 1;
        _522 = _526;
    }
    int _528 = _522;
    float _530 = in.m_65.x;
    float _532 = in.m_65.y;
    float _534 = in.m_65.z;
    float _536 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[11].z, _514);
    float _538 = float(_462);
    float _540 = fma(_496, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _542 = fma(_490, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _544 = _536 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _546 = float(_528);
    float _548 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[10].z, _464);
    int _550 = _452 ? 0 : 1;
    float _552 = 1.0 / _544;
    int _554 = _480 ? 0 : 1;
    float _556 = _538 * _546;
    int _558 = ~_550;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    float _564 = fma(_498, _482, _516);
    int _566 = _562;
    if (!_440)
    {
        int _568 = ~_550;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    float _574 = _556 * (-2.0);
    int _576 = ~_554;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    float _582 = _548 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _584 = _580;
    if (!_466)
    {
        int _586 = ~_554;
        int _588 = _586 + 1;
        _584 = _588;
    }
    int _590 = _584;
    float _592 = fma(_540, _482, _518);
    bool _594 = !_264;
    int _596 = _594 ? 0 : 1;
    float _598 = fma(_346, _574, _346);
    bool _600 = !_268;
    int _602 = _600 ? 0 : 1;
    float _604 = _582 + _544;
    int _606 = abs(_596);
    float _608 = fma(_574, _530, _530);
    int _610 = abs(_602);
    float _612 = _604 * _552;
    float _614 = _612 * 0.5;
    float _616 = float(_606);
    float _618 = in.m_67.x;
    float _620 = in.m_67.y;
    float _622 = in.m_67.z;
    float _624 = float(_590);
    float _626 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    float _628 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[145].x, _564);
    float _630 = _616 * _624;
    float _632 = fma(_598, _410, _626);
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _636 = fma(_614, (*spvDescriptorSet0.vp_c8)._m0[30].w, _634);
    float _638 = float(_610);
    float _640 = _630 * (-2.0);
    float _642 = float(_572);
    float _644 = in.m_69.x;
    float _646 = in.m_69.y;
    float _648 = in.m_69.z;
    float _650 = 1.0 / _636;
    float _652 = fma(_640, _532, _532);
    float _654 = _638 * _642;
    float _656 = fma(_372, _640, _372);
    float _658 = _632 * 0.15915493667125701904296875;
    float _660 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[196].y, _652);
    float _662 = _654 * (-2.0);
    float _664 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[145].y, _592);
    float _666 = _658 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = fma(_656, _410, _660);
    float _672 = fma(_662, _534, _534);
    float _674 = _628 * _618;
    float _676 = fma(_422, _662, _422);
    float _678 = _664 * _620;
    float _680 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[196].z, _672);
    float _682 = _670 * 0.15915493667125701904296875;
    float _684 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _686 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _688 = fma(_676, _410, _680);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _692 = _650 * _690;
    float _694 = _682 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = fma(_542, _482, _520);
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _646);
    float _702 = _688 * 0.15915493667125701904296875;
    bool _704 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _706 = _300 + _684;
    bool _708 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _710 = _686 * _700;
    float _712 = _682 * 6.283185482025146484375;
    float _714 = cos(_712);
    float _716 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[145].z, _698);
    bool _718 = !_704;
    int _720 = _718 ? 0 : 1;
    float _722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _644);
    float _724 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _726 = _706 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _728 = _716 * _622;
    float _730 = _706 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _732 = _702 * 6.283185482025146484375;
    float _734 = cos(_732);
    if (!_704)
    {
        _404 = 1;
    }
    int _736 = _404;
    float _738 = _724 * _722;
    int _740 = _736;
    if (!_708)
    {
        _740 = _720;
    }
    int _742 = _740;
    float _744 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[127].x, _726);
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _648);
    float _748 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _750 = _742 << 6;
    float _752 = _658 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[127].z, _744);
    float _758 = _668 * _714;
    float _760 = _668 * _696;
    float _762 = _748 * _746;
    float _764 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[126].x, _730);
    int _766 = _750 + 48;
    uint _769 = uint(int(uint(_766) >> uint(2)));
    uint _771 = uint(int(uint(int(_769)) >> uint(2)));
    int _773 = int(_769) & 3;
    float _775 = (*spvDescriptorSet0.vp_c15)._m0[int(_771)][_773];
    int _777 = int(_769) + 1;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    int _781 = _777 & 3;
    float _783 = (*spvDescriptorSet0.vp_c15)._m0[int(_779)][_781];
    bool _785 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _787 = isnan(0.5);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _793 = _789 || _791;
    float _795 = _702 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _668 * _734;
    float _801 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[126].z, _764);
    int _803 = _750 + 96;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    uint _807 = uint(int(uint(int(_805)) >> uint(2)));
    int _809 = int(_805) & 3;
    float _811 = (*spvDescriptorSet0.vp_c15)._m0[int(_807)][_809];
    int _813 = int(_805) + 1;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    int _817 = _813 & 3;
    float _819 = (*spvDescriptorSet0.vp_c15)._m0[int(_815)][_817];
    float _821 = _801 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _823 = _754 * _696;
    float _825 = _754 * _714;
    float _827 = _754 * _734;
    float _829 = _714 * _734;
    float _831 = _696 * _734;
    float _833 = _756 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _835 = _799 * _710;
    float _837 = trunc(_821);
    int _839 = int(_837);
    float _841 = fma(_797, _758, _823);
    float _843 = -_760;
    float _845 = fma(_797, _825, _843);
    float _847 = -_825;
    float _849 = fma(_797, _760, _847);
    float _851 = -_710;
    float _853 = _797 * _851;
    float _855 = fma(_841, _738, _835);
    float _857 = _827 * _710;
    int _859 = _750 + 104;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    uint _863 = uint(int(uint(int(_861)) >> uint(2)));
    int _865 = int(_861) & 3;
    float _867 = (*spvDescriptorSet0.vp_c15)._m0[int(_863)][_865];
    int _869 = int(_861) + 1;
    uint _871 = uint(int(uint(_869) >> uint(2)));
    int _873 = _869 & 3;
    float _875 = (*spvDescriptorSet0.vp_c15)._m0[int(_871)][_873];
    float _877 = trunc(_833);
    int _879 = int(_877);
    float _881 = fma(_829, _738, _853);
    float _883 = fma(_849, _762, _855);
    float _885 = fma(_797, _823, _758);
    float _887 = fma(_845, _738, _857);
    float _889 = fma(_831, _762, _881);
    float _891 = _883 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _893 = _750 + 64;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    uint _897 = uint(int(uint(int(_895)) >> uint(2)));
    int _899 = int(_895) & 3;
    float _901 = (*spvDescriptorSet0.vp_c15)._m0[int(_897)][_899];
    int _903 = int(_895) + 1;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    int _907 = _903 & 3;
    float _909 = (*spvDescriptorSet0.vp_c15)._m0[int(_905)][_907];
    float _911 = _883 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _913 = fma(_885, _762, _887);
    float _915 = fma(_889, (*spvDescriptorSet0.vp_c10)._m0[10].x, _891);
    int _917 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _919 = _839 + _917;
    int _921 = _919 + 1;
    float _923 = fma(_889, (*spvDescriptorSet0.vp_c10)._m0[8].x, _911);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[10].z, _915);
    int _927 = _750 + 56;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c15)._m0[int(_931)][_933];
    int _937 = int(_929) + 1;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    int _941 = _937 & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    float _945 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[8].z, _923);
    int _947 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _949 = _879 + _947;
    int _951 = _949 + 1;
    float _953 = _214 + _925;
    bool _955 = _921 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _957 = _212 + _945;
    int _959 = _921 | _951;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _963 = _953 + _961;
    int _965 = _750 + 72;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    uint _969 = uint(int(uint(int(_967)) >> uint(2)));
    int _971 = int(_967) & 3;
    float _973 = (*spvDescriptorSet0.vp_c15)._m0[int(_969)][_971];
    int _975 = int(_967) + 1;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    int _979 = _975 & 3;
    float _981 = (*spvDescriptorSet0.vp_c15)._m0[int(_977)][_979];
    bool _983 = _959 < 0;
    bool _985 = _983 || _955;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _989 = _957 + _987;
    float _991 = _963 * _963;
    bool _993 = _951 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _995 = _993 || _985;
    int _997 = _750 + 80;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
    int _1003 = int(_999) & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = int(_999) + 1;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    int _1011 = _1007 & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    float _1015 = fma(_989, _989, _991);
    float _1017 = _706 * _819;
    float _1019 = _883 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1021 = sqrt(_1015);
    float _1023 = fma(_212, _811, _1017);
    int _1025 = as_type<int>(_883);
    int _1027 = as_type<int>(_1023);
    float _1029 = _957;
    float _1031 = _953;
    float _1033 = _1015;
    float _1035 = _963;
    float _1037 = _989;
    float _1039 = as_type<float>(_742);
    float _1041 = _889;
    if (!_995)
    {
        int _1043 = _951 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1045 = _1043 + _921;
        _1025 = _1045;
    }
    int _1047 = _1025;
    float _1049 = _706 * _783;
    float _1051 = fma(_889, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1019);
    float _1053 = _1019;
    int _1055 = as_type<int>(_1051);
    if (!_995)
    {
        float _1057 = floor(_821);
        _1053 = _1057;
    }
    float _1059 = _1053;
    float _1061 = fma(_214, _867, _1023);
    float _1063 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1051);
    float _1065 = fma(_212, _775, _1049);
    int _1067 = as_type<int>(_901);
    if (!_995)
    {
        int _1069 = _1047 << 2;
        _1027 = _1069;
    }
    int _1071 = _1027;
    float _1073 = _1061 + _875;
    bool _1075 = _1021 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1077 = _300 + _1063;
    float _1079 = as_type<float>(_1071);
    if (!_995)
    {
        int _1081 = 12 & _1071;
        _1055 = _1081;
    }
    int _1083 = _1055;
    float _1085 = _706 * _909;
    float _1087 = 1.0 / _1073;
    float _1089 = fma(_212, _901, _1085);
    if (!_995)
    {
        uint _1091 = uint(int(uint(_1047) >> uint(2)));
        _1067 = int(_1091);
    }
    int _1093 = _1067;
    float _1095 = fma(_214, _935, _1065);
    int _1097 = _1093;
    if (!_995)
    {
        int _1099 = _1093 << 4;
        int _1101 = _1099 + _1083;
        _1097 = _1101;
    }
    int _1103 = _1097;
    float _1105 = _1095 + _943;
    float _1107 = fma(_214, _973, _1089);
    float _1109 = _973;
    if (!_1075)
    {
        _1109 = _1077;
    }
    float _1111 = _1109;
    float _1113 = _1107 + _981;
    bool _1115 = !_1075;
    float _1117 = _1111;
    if (!_1115)
    {
        float _1119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1123 = _1021 + _1121;
        float _1125 = _1077 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1127 = rsqrt(_1015);
        float _1129 = _1123 * _1119;
        float _1131 = _1129 * 0.15915493667125701904296875;
        float _1133 = _1131 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1131 * 6.283185482025146484375;
        float _1139 = cos(_1137);
        float _1141 = fma(_1135, _1125, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1143 = _1127 * _1141;
        float _1145 = _1139 + (-1.0);
        float _1147 = fma(_989, _1143, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1149 = fma(_963, _1143, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1151 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1153 = fma(_1077, _1139, _1151);
        _1029 = _1147;
        _1117 = _1153;
        _1031 = _1149;
        _1033 = _1127;
        _1079 = _1125;
    }
    float _1155 = _1029;
    float _1157 = _1117;
    float _1159 = _1031;
    float _1161 = _1033;
    float _1163 = _1079;
    float _1165 = _1161;
    float _1167 = _1163;
    if (_793)
    {
        _1165 = _1155;
    }
    float _1169 = _1165;
    float _1171 = _1169;
    if (_793)
    {
        _1035 = _1157;
    }
    float _1173 = _1035;
    float _1175 = _1173;
    if (_793)
    {
        _1037 = _1159;
    }
    float _1177 = _1037;
    float _1179 = _1177;
    if (!_793)
    {
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1183 = _300 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1187 = _212 + _1185;
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1191 = -_300;
        float _1193 = _1191 + _1157;
        float _1195 = _1183 * _1183;
        float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1199 = _214 + _1197;
        float _1201 = -_212;
        float _1203 = _1201 + _1155;
        float _1205 = -_214;
        float _1207 = _1205 + _1159;
        float _1209 = fma(_1187, _1187, _1195);
        float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1213 = fma(_1199, _1199, _1209);
        float _1215 = sqrt(_1213);
        float _1217 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1219 = precise::min(_1215, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1221 = _1219 * _1211;
        float _1223 = _1217 * _1221;
        float _1225 = fma(_1193, _1223, _300);
        float _1227 = fma(_1203, _1223, _212);
        float _1229 = fma(_1207, _1223, _214);
        _1175 = _1225;
        _1171 = _1227;
        _1179 = _1229;
        _1167 = _1215;
    }
    float _1231 = _1175;
    float _1233 = _1171;
    float _1235 = _1179;
    float _1237 = _1167;
    int _1239 = _750 + 88;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    uint _1243 = uint(int(uint(int(_1241)) >> uint(2)));
    int _1245 = int(_1241) & 3;
    float _1247 = (*spvDescriptorSet0.vp_c15)._m0[int(_1243)][_1245];
    int _1249 = int(_1241) + 1;
    uint _1251 = uint(int(uint(_1249) >> uint(2)));
    int _1253 = _1249 & 3;
    float _1255 = (*spvDescriptorSet0.vp_c15)._m0[int(_1251)][_1253];
    float _1257 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1259 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1261 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1263 = _1105 * _1087;
    float _1265 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1257);
    float _1267 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1259);
    float _1269 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1261);
    float _1271 = _1155;
    if (!_995)
    {
        int _1273 = _1103 + 400;
        uint _1275 = uint(int(uint(_1273) >> uint(2)));
        uint _1277 = uint(int(uint(int(_1275)) >> uint(2)));
        int _1279 = int(_1275) & 3;
        float _1281 = (*spvDescriptorSet0.vp_c15)._m0[int(_1277)][_1279];
        _1271 = _1281;
    }
    float _1283 = _1271;
    float _1285 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1265);
    bool _1287 = _1263 >= 0.0;
    float _1289 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1267);
    float _1291 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1293 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1269);
    float _1295 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1297 = _1113 * _1087;
    bool _1299 = _1263 <= 1.0;
    bool _1301 = _1299 && _1287;
    float _1303 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1291);
    float _1307 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1309 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1311 = _1297 >= 0.0;
    bool _1313 = _1311 && _1301;
    float _1315 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1317 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1319 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1305);
    float _1321 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1309);
    bool _1323 = _1297 <= 1.0;
    bool _1325 = _1323 && _1313;
    float _1327 = -_1317;
    float _1329 = fma(_1327, _1315, 1.0);
    float _1331 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1333 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = _706 * _1013;
    float _1337 = _1237;
    if (!_995)
    {
        float _1339 = floor(_833);
        _1337 = _1339;
    }
    float _1341 = _1337;
    float _1343 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    float _1347 = fma(_212, _1005, _1335);
    float _1349 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1351 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1343);
    float _1353 = log2(_1329);
    float _1355 = _1345;
    if (_1325)
    {
        float _1357 = float(_742);
        _1039 = _1357;
    }
    float _1359 = _1039;
    float _1361 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1349);
    float _1363 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1365 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1361);
    float _1367 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1363);
    float _1369 = 1.0 / _1345;
    float _1371 = fma(_214, _1247, _1347);
    float _1373 = _1255;
    float _1375 = _1359;
    if (!_995)
    {
        float _1377 = -_1341;
        float _1379 = _833 + _1377;
        _1041 = _1379;
    }
    float _1381 = _1041;
    float _1383 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1365);
    float _1385 = _1371 + _1255;
    float _1387 = _1383;
    if (!_995)
    {
        float _1389 = -_1059;
        float _1391 = _821 + _1389;
        _1373 = _1391;
    }
    float _1393 = _1373;
    float _1395 = _1335;
    float _1397 = _1393;
    if (_1325)
    {
        float _1399 = rint(_1359);
        float _1401 = precise::max(_1399, 0.0);
        uint _1403 = uint(_1401);
        uint _1405 = clamp(_1403, 0u, 65535u);
        _1395 = as_type<float>(_1405);
    }
    float _1407 = _1395;
    float _1409 = _1385 * _1087;
    float _1411 = _1353 * 0.693147182464599609375;
    float _1413 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1415 = _1385;
    if (!_995)
    {
        float _1417 = rint(_1283);
        float _1419 = precise::max(_1417, 0.0);
        uint _1421 = uint(_1419);
        uint _1423 = clamp(_1421, 0u, 65535u);
        _1415 = as_type<float>(_1423);
    }
    float _1425 = _1415;
    float _1427 = _1367 * _1369;
    float _1429 = _1383 * _1369;
    float _1431 = fma(_1427, 0.5, 0.5);
    float _1433 = fma(_1429, -0.5, 0.5);
    float _1435 = as_type<float>(_750);
    if (_1325)
    {
        float3 _4498 = float3(_1263, _1297, float(as_type<int>(_1407)));
        float3 _4502 = select(_4498, float3(0.0), isnan(_4498));
        float _1437 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4502.xy, uint(rint(_4502.z)), _1409, level(0.0));
        _1435 = _1437;
    }
    float _1439 = _1435;
    float3 _4512 = float3(_1431, _1433, _1413);
    float _1441 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4512, float3(0.0), isnan(_4512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4512, float3(0.0), isnan(_4512)), level(0.0)).x;
    float3 _4521 = float3(_1431, _1433, _1413);
    float4 _1444 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4521, float3(0.0), isnan(_4521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4521, float3(0.0), isnan(_4521)), level(0.0)).xyzw;
    float _1446 = _1444.x;
    float _1448 = _1444.y;
    float _1450 = _1444.z;
    float _1452 = _1444.w;
    float _1454 = _1411;
    if (!_995)
    {
        float3 _4544 = float3(_1393, _1381, float(as_type<int>(_1425)));
        float3 _4546 = select(_4544, float3(0.0), isnan(_4544));
        float _1456 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4546.xy, uint(rint(_4546.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4546.xy, uint(rint(_4546.z)), level(0.0)).x;
        _1454 = _1456;
    }
    float _1458 = _1454;
    if (_995)
    {
        _1375 = 1.0;
    }
    float _1460 = _1375;
    float _1462 = _1460;
    if (!_995)
    {
        int _1464 = _1047 << 4;
        int _1466 = _1464 + 2048;
        uint _1468 = uint(int(uint(_1466) >> uint(2)));
        uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
        int _1472 = int(_1468) & 3;
        float _1474 = (*spvDescriptorSet0.vp_c15)._m0[int(_1470)][_1472];
        int _1476 = int(_1468) + 1;
        uint _1478 = uint(int(uint(_1476) >> uint(2)));
        int _1480 = _1476 & 3;
        float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
        int _1484 = _1466 + 8;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
        int _1490 = int(_1486) & 3;
        float _1492 = (*spvDescriptorSet0.vp_c15)._m0[int(_1488)][_1490];
        int _1494 = int(_1486) + 1;
        uint _1496 = uint(int(uint(_1494) >> uint(2)));
        int _1498 = _1494 & 3;
        float _1500 = (*spvDescriptorSet0.vp_c15)._m0[int(_1496)][_1498];
        float _1502 = _706 * _1482;
        float _1504 = fma(_212, _1474, _1502);
        float _1506 = fma(_214, _1492, _1504);
        float _1508 = _1506 + _1500;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        float _1512 = -_1510;
        float _1514 = _1512 + _1458;
        float _1516 = fma(_1514, 500.0, 1.5);
        float _1518 = exp2(_1516);
        float _1520 = 0.0 + _1518;
        float _1522 = precise::clamp(_1520, 0.0, 1.0);
        _1397 = _1500;
        _1462 = _1522;
    }
    float _1524 = _1397;
    float _1526 = _1462;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1231 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1534 = _1233 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = _1235 + _1536;
    float _1540 = _1530 * _1530;
    float _1542 = fma(_1534, _1534, _1540);
    float _1544 = fma(_1538, _1538, _1542);
    float _1546 = rsqrt(_1544);
    float _1548 = sqrt(_1544);
    float _1550 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1552 = _1534 * _1550;
    float _1554 = _1538 * _1550;
    float _1556 = _1552 * _1552;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 + _1558;
    float _1562 = sqrt(_1560);
    bool _1564 = _1562 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = _1562 + _1566;
    float _1570 = _1524;
    float _1572 = _1560;
    float _1574 = _1568;
    float _1576 = _1530;
    float _1578 = _1550;
    float _1580 = _1552;
    float _1582 = _1554;
    float _1584 = _1558;
    if (_1564)
    {
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1570 = _1586;
    }
    float _1588 = _1570;
    if (_1564)
    {
        float _1590 = rsqrt(_1560);
        _1572 = _1590;
    }
    float _1592 = _1572;
    if (_1564)
    {
        float _1594 = _1568 * _1588;
        _1574 = _1594;
    }
    float _1596 = _1574;
    if (_1564)
    {
        float _1598 = _1596 * 0.15915493667125701904296875;
        _406 = _1598;
    }
    float _1600 = _406;
    float _1602 = _1433;
    if (_1564)
    {
        float _1604 = _1600 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1431;
    float _1616 = _1612;
    float _1618 = _1610;
    if (_1564)
    {
        float _1620 = _1600 * 6.283185482025146484375;
        float _1622 = cos(_1620);
        _1614 = _1622;
    }
    float _1624 = _1614;
    float _1626 = -_1550;
    float _1628 = -_1612;
    float _1630 = fma(_1530, _1626, _1628);
    if (!_1564)
    {
        _1616 = _1556;
    }
    float _1632 = _1616;
    float _1634 = _1632;
    if (_1564)
    {
        float _1636 = _1630 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1636;
    }
    float _1638 = _1576;
    float _1640 = _1608;
    float _1642 = _1638;
    if (_1564)
    {
        float _1644 = fma(_1608, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1640 = _1644;
    }
    float _1646 = _1640;
    float _1648 = _1646;
    if (!_1564)
    {
        _1642 = _1630;
    }
    float _1650 = _1642;
    float _1652 = _1650;
    if (_1564)
    {
        float _1654 = _1624 + (-1.0);
        _1618 = _1654;
    }
    float _1656 = _1618;
    if (_1564)
    {
        float _1658 = _1592 * _1646;
        _1578 = _1658;
    }
    float _1660 = _1578;
    if (_1564)
    {
        float _1662 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1648 = _1662;
    }
    float _1664 = _1648;
    if (_1564)
    {
        float _1666 = _1552 * _1660;
        _1580 = _1666;
    }
    float _1668 = _1580;
    if (_1564)
    {
        float _1670 = _1554 * _1660;
        _1582 = _1670;
    }
    float _1672 = _1582;
    if (_1564)
    {
        float _1674 = fma(_1630, _1624, _1664);
        _1652 = _1674;
    }
    float _1676 = _1652;
    if (_1564)
    {
        float _1678 = _1668 * _1668;
        _1634 = _1678;
    }
    float _1680 = _1634;
    if (_1564)
    {
        float _1682 = _1672 * _1672;
        _1584 = _1682;
    }
    float _1684 = _1584;
    float _1686 = fma(_1676, _1676, _1680);
    float _1688 = _1686 + _1684;
    float _1690 = rsqrt(_1688);
    float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1694 = fma(_1548, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1692);
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = -_1696;
    float _1700 = _1698 + 1.0;
    float _1702 = _1690 * _1668;
    float _1704 = _1690 * _1676;
    float _1706 = _1690 * _1672;
    float _1708 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = abs(_1700);
    float _1712 = log2(_1710);
    float _1714 = -_1708;
    float _1716 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1714);
    float _1718 = -_1706;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1716);
    float _1722 = fma(_1720, -0.5, 0.5);
    float _1724 = fma(_1720, 0.5, 0.5);
    float _1726 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1728 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1730 = sqrt(_1722);
    float _1732 = fma(_1724, _1726, -0.212114393711090087890625);
    float _1734 = _1704 + 1.0;
    float _1736 = fma(_1724, _1732, 1.570728778839111328125);
    float _1738 = exp2(_1728);
    float _1740 = _1730 * 0.636619746685028076171875;
    float _1742 = -_1736;
    float _1744 = fma(_1740, _1742, 1.0);
    float _1746 = -_1704;
    float _1748 = fma(_1738, _1734, _1746);
    float _1750 = fma(_1748, 0.5, 0.5);
    float2 _5000 = float2(_1744, _1750);
    float3 _1754 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5000, float2(0.0), isnan(_5000)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5000, float2(0.0), isnan(_5000)), level(0.0)).xyz;
    float _1756 = _1754.x;
    float _1758 = _1754.y;
    float _1760 = _1754.z;
    float _1762 = abs(_692);
    float _1764 = log2(_1762);
    float _1766 = in.m_71.x;
    float _1768 = in.m_71.y;
    float _1770 = in.m_71.z;
    bool _1772 = _646 != 0.0;
    bool _1774 = isnan(_646);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan(0.0);
    bool _1780 = _1776 || _1778;
    float _1782 = -_232;
    float _1784 = _1782 + 1.0;
    bool _1786 = _644 == 0.0;
    bool _1788 = !_1780;
    bool _1790 = _1786 && _1788;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1794 = _648 == 0.0;
    bool _1796 = _1794 && _1790;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1806 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1810 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1812 = exp2(_1802);
    float _1814 = _1768;
    float _1816 = _1766;
    float _1818 = _1770;
    if (!_1796)
    {
        float _1820 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1768);
        _1814 = _1820;
    }
    float _1822 = _1814;
    if (!_1796)
    {
        float _1824 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1766);
        _1816 = _1824;
    }
    float _1826 = _1816;
    if (!_1796)
    {
        float _1828 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1770);
        _1818 = _1828;
    }
    float _1830 = _1818;
    float _1832 = _799 * _1822;
    float _1834 = -_1822;
    float _1836 = _797 * _1834;
    float _1838 = _827 * _1822;
    float _1840 = fma(_841, _1826, _1832);
    float _1842 = fma(_829, _1826, _1836);
    float _1844 = fma(_845, _1826, _1838);
    out.m_73.x = _1800;
    out.m_73.y = _1806;
    out.m_73.z = _1810;
    out.m_73.w = _1808;
    float _1846 = fma(_849, _1830, _1840);
    float _1848 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1850 = precise::clamp(_1848, 0.0, 1.0);
    float _1852 = fma(_831, _1830, _1842);
    float _1854 = fma(_885, _1830, _1844);
    float _1856 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1858 = fma(_1850, -2.0, 3.0);
    float _1860 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1862 = _1850 * _1850;
    float _1864 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1866 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1868 = isnan(_1548);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1874 = _1870 || _1872;
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1860);
    float _1878 = exp2(_1856);
    float _1880 = _1862 * _1858;
    float _1882 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1884 = fma(_1852, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1864);
    float _1886 = fma(_1854, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1876);
    float _1888 = -_1880;
    float _1890 = _1888 + 1.0;
    float _1892 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1882);
    float _1894 = fma(_1854, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1884);
    bool _1896 = _692 <= 8000.0;
    bool _1898 = isnan(_692);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(8000.0);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = fma(_1890, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1880);
    float _1910 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1892);
    float _1912 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1914 = _1906 * _1908;
    float _1916 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1910);
    float _1918 = -_1878;
    float _1920 = _1918 + 1.0;
    float _1922 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1924 = _1916 + _1345;
    out.gl_Position.x = _1367;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _1916;
    out.gl_Position.w = _1345;
    float _1926 = fma(_1852, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1912);
    float _1928 = _1784 * _1922;
    float _1930 = precise::clamp(_1928, 0.0, 1.0);
    float _1932 = _1924 * 0.5;
    float _1934 = _1924;
    float _1936 = _1916;
    if (!_1325)
    {
        _1934 = 1.0;
    }
    float _1938 = _1934;
    float _1940 = fma(_1854, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1926);
    float _1942 = _1938;
    if (_1325)
    {
        bool _1944 = _1439 >= _1409;
        bool _1946 = isnan(_1439);
        bool _1948 = _1944 || _1946;
        bool _1950 = isnan(_1409);
        bool _1952 = _1948 || _1950;
        float _1954 = float(_1952);
        _1942 = _1954;
    }
    float _1956 = _1942;
    float _1958 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1960 = -_1930;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_75.z = _1932;
    out.m_75.w = _1345;
    float _1964 = _1958 * _1441;
    float _1966 = _1956 * _1526;
    out.m_77.x = _1886;
    out.m_77.y = _1940;
    out.m_77.z = _1894;
    float _1968 = -_1958;
    float _1970 = _1968 + 1.0;
    float _1972 = -_1966;
    float _1974 = fma(_1972, _1962, 1.0);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = _1970;
    float _1980 = 1.0;
    float _1982 = 1.0;
    if (!_1874)
    {
        _1355 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1984 = _1355;
    float _1986 = _1452 * _1970;
    float _1988 = _1452 * _1964;
    float _1990 = _1976 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _1992 = _1984;
    float _1994 = _1984;
    if (!_1874)
    {
        _1936 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1996 = _1936;
    float _1998 = _1996;
    float _2000 = _1996;
    if (!_1874)
    {
        _1387 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2002 = _1387;
    out.m_81.x = _1990;
    float _2004 = _2002;
    float _2006 = _2002;
    if (!_1874)
    {
        _1978 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2008 = _1978;
    float _2010 = _2008;
    float _2012 = _2008;
    if (!_1874)
    {
        _1980 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2014 = _1980;
    float _2016 = _2014;
    float _2018 = _2014;
    if (!_1874)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2020 = _1982;
    float _2022 = _1760 * _1964;
    float _2024 = fma(_1756, _1988, _1446);
    float _2026 = fma(_1758, _1988, _1448);
    float _2028 = fma(_1452, _2022, _1450);
    out.m_83.x = _2024;
    out.m_83.y = _2026;
    out.m_83.z = _2028;
    out.m_83.w = _1986;
    bool _2030 = !_1874;
    float _2032 = _2020;
    float _2034 = _2020;
    if (!_2030)
    {
        bool _2036 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2038 = isnan(_1548);
        bool _2040 = _2036 || _2038;
        bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2044 = _2040 || _2042;
        if (!_2044)
        {
            float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2048 = _1548 + _2046;
            float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2052 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2050;
            float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2058 = 1.0 / _2052;
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2062 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2076 = _2048 * _2058;
            float _2078 = precise::clamp(_2076, 0.0, 1.0);
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2084 = fma(_2078, _2056, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2086 = fma(_2078, _2082, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2088 = fma(_2078, _2062, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2090 = fma(_2078, _2066, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2092 = fma(_2078, _2070, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2094 = fma(_2078, _2074, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2034 = _2088;
            _2006 = _2092;
            _2018 = _2084;
            _2000 = _2090;
            _1994 = _2086;
            _2012 = _2094;
            _2096 = true;
        }
        else
        {
            bool _2098 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2100 = isnan(_1548);
            bool _2102 = _2098 || _2100;
            bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2106 = _2102 || _2104;
            if (!_2106)
            {
                _2016 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2108 = _2016;
            _2018 = _2108;
            if (!_2106)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2110 = _2032;
            _2034 = _2110;
            if (!_2106)
            {
                _1992 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2112 = _1992;
            _1994 = _2112;
            if (!_2106)
            {
                _1998 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2114 = _1998;
            _2000 = _2114;
            if (!_2106)
            {
                _2004 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2116 = _2004;
            _2006 = _2116;
            if (!_2106)
            {
                _2010 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2118 = _2010;
            bool _2120 = !_2106;
            _2012 = _2118;
            if (!_2120)
            {
                bool _2122 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2124 = isnan(_1548);
                bool _2126 = _2122 || _2124;
                bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2130 = _2126 || _2128;
                if (!_2130)
                {
                    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2134 = _1548 + _2132;
                    float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2136;
                    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2144 = 1.0 / _2138;
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2162 = _2134 * _2144;
                    float _2164 = precise::clamp(_2162, 0.0, 1.0);
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2170 = fma(_2164, _2142, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2172 = fma(_2164, _2168, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2174 = fma(_2164, _2148, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2176 = fma(_2164, _2152, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2178 = fma(_2164, _2156, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2180 = fma(_2164, _2160, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2034 = _2174;
                    _2006 = _2178;
                    _2018 = _2170;
                    _2000 = _2176;
                    _1994 = _2172;
                    _2012 = _2180;
                    _2096 = true;
                }
                else
                {
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2006 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2018 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2000 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1994 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2012 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2096 = false;
    float _2182 = _2034;
    float _2184 = _2006;
    float _2186 = _2018;
    float _2188 = _2000;
    float _2190 = _1994;
    float _2192 = _2012;
    float _2194 = fma(_1940, -0.5, 0.5);
    float _2196 = precise::clamp(_2194, 0.0, 1.0);
    float _2198 = -_2182;
    float _2200 = _2198 + _2184;
    float _2202 = -_2186;
    float _2204 = _2202 + _2188;
    float _2206 = -_2190;
    float _2208 = _2206 + _2192;
    bool _2210 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2212 = fma(_2196, _2200, _2182);
    float _2214 = fma(_2196, _2204, _2186);
    float _2216 = fma(_2196, _2208, _2190);
    float _2218 = _2212 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2220 = fma(_2214, 0.298911988735198974609375, _2218);
    float _2222 = fma(_2216, 0.114477999508380889892578125, _2220);
    out.m_85.x = 0.0;
    float _2224 = -_2222;
    float _2226 = _2214 + _2224;
    float _2228 = -_2222;
    float _2230 = _2212 + _2228;
    float _2232 = -_2222;
    float _2234 = _2216 + _2232;
    float _2236 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2222);
    float _2240 = fma(_2230, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2222);
    float _2242 = fma(_2234, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2222);
    out.m_81.w = _2236;
    out.m_87.x = _2238;
    out.m_87.y = _2240;
    out.m_87.z = _2242;
    if (!_2210)
    {
        return out;
    }
    float _2244 = -_1231;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2248 = -_1233;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2252 = -_1235;
    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2256 = _2246 * _2246;
    float _2258 = fma(_2250, _2250, _2256);
    float _2260 = fma(_2254, _2254, _2258);
    float _2262 = sqrt(_2260);
    float _2264 = rsqrt(_2260);
    float _2266 = -_2262;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2270 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2272 = precise::clamp(_2270, 0.0, 1.0);
    float _2274 = _2250 * _2264;
    float _2276 = _2246 * _2264;
    float _2278 = abs(_2272);
    float _2280 = log2(_2278);
    float _2282 = _2254 * _2264;
    float _2284 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2286 = _1940 * _2276;
    float _2288 = -_2276;
    float _2290 = -_2284;
    float _2292 = fma(_2288, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2290);
    float _2294 = fma(_1886, _2274, _2286);
    float _2296 = -_2282;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2292);
    float _2300 = fma(_1894, _2282, _2294);
    float _2302 = precise::clamp(_2300, 0.0, 1.0);
    float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2306 = _2298 + _2304;
    float _2308 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2310 = _2306 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = exp2(_2308);
    float _2316 = _2314 * _2312;
    float _2318 = _2302 * _2316;
    float _2320 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2322 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2324 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2320;
    out.m_85.y = _2322;
    out.m_85.z = _2324;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2096 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_56.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_59.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2381 = as_type<float>(_122);
        out.gl_Position.z = _2381;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_61.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_59.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2450 = as_type<float>(_160);
        out.gl_Position.z = _2450;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_63.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_56.x;
    float _196 = in.m_56.y;
    float _198 = in.m_56.z;
    float _200 = _196 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _202 = _196 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _204 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[4].x, _200);
    float _206 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[6].x, _202);
    float _208 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].z, _204);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].z, _206);
    float _212 = _208 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _214 = _210 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _216 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _218 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _220 = floor(_216);
    float _222 = floor(_218);
    float _224 = -_220;
    float _226 = _216 + _224;
    float _228 = -_222;
    float _230 = _218 + _228;
    float2 _2577 = float2(_226, _230);
    float _232 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2577, float2(0.0), isnan(_2577)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2577, float2(0.0), isnan(_2577)), level(0.0)).x;
    float _234 = in.m_63.x;
    float _236 = in.m_63.y;
    float _238 = in.m_63.z;
    float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _242 = log2(_240);
    float _244 = _196 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _256 = 1.0 + _254;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _268 = _266 != 0;
    float _270 = 1.0 / _248;
    bool _272 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _274 = isnan(1.0);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _280 = _276 || _278;
    float _282 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[5].x, _244);
    bool _284 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _286 = isnan(0.0);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _292 = _288 || _290;
    float _294 = _242 * _140;
    float _296 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].z, _282);
    float _298 = 1.0 / _252;
    float _300 = _296 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _302 = _238 * 2.0;
    float _304 = _236 * 2.0;
    float _306 = _234 * 2.0;
    float _308 = exp2(_294);
    float _310 = _236 + _238;
    float _312 = _238 + _234;
    float _314 = _238 + (-0.5);
    float _316 = _236 + _234;
    float _318 = _236 + (-0.5);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _192 + _320;
    float _324 = _234 + (-0.5);
    float _326 = floor(_302);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _192 + _328;
    float _332 = _322 * _298;
    float _334 = _316 + (-1.0);
    float _336 = _310 + (-1.0);
    float _338 = _330 * _270;
    float _340 = 1.0 / _256;
    float _342 = -_308;
    float _344 = _342 + 1.0;
    float _346 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _348 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _350 = isnan(_192);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _360;
    float _364 = _300 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _366 = _292 ? _344 : 0.0;
    float _368 = floor(_304);
    bool _370 = _326 > 0.0;
    float _372 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _374 = _326 >= 0.0;
    bool _376 = isnan(_326);
    bool _378 = _374 || _376;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    float _384 = _312 + (-1.0);
    bool _386 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _388 = isnan(_192);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -_358;
    float _400 = _398 + 1.0;
    float _402 = floor(_306);
    int _404 = 2;
    float _406 = _212;
    if (_280)
    {
        float _408 = _366 * _340;
        _144 = _408;
    }
    float _410 = _144;
    bool _412 = !_260;
    int _414 = _412 ? 0 : 1;
    float _416 = -_396;
    float _418 = _416 + 1.0;
    int _420 = _382 ? 0 : 1;
    float _422 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _424 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _426 = isnan(_192);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _436;
    bool _440 = _368 > 0.0;
    float _442 = fma(_362, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _444 = _368 >= 0.0;
    bool _446 = isnan(_368);
    bool _448 = _444 || _446;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    float _454 = _434 * _400;
    float _456 = fma(_438, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _458 = -_434;
    float _460 = _458 + 1.0;
    int _462 = abs(_414);
    float _464 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[10].x, _364);
    bool _466 = _402 > 0.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _468;
    bool _472 = _402 >= 0.0;
    bool _474 = isnan(_402);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = _358 * _418;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = fma(_470, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = fma(_486, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _500 = _442 * _454;
    float _502 = _300 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _504 = _492 * _454;
    float _506 = _456 * _454;
    int _508 = ~_420;
    int _510 = _508 + 1;
    int _512 = _510 + 1;
    float _514 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[11].x, _502);
    float _516 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].x, _504);
    float _518 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    float _520 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].z, _506);
    int _522 = _512;
    if (!_370)
    {
        int _524 = ~_420;
        int _526 = _524 + 1;
        _522 = _526;
    }
    int _528 = _522;
    float _530 = in.m_65.x;
    float _532 = in.m_65.y;
    float _534 = in.m_65.z;
    float _536 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[11].z, _514);
    float _538 = float(_462);
    float _540 = fma(_496, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _542 = fma(_490, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _544 = _536 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _546 = float(_528);
    float _548 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[10].z, _464);
    int _550 = _452 ? 0 : 1;
    float _552 = 1.0 / _544;
    int _554 = _480 ? 0 : 1;
    float _556 = _538 * _546;
    int _558 = ~_550;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    float _564 = fma(_498, _482, _516);
    int _566 = _562;
    if (!_440)
    {
        int _568 = ~_550;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    float _574 = _556 * (-2.0);
    int _576 = ~_554;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    float _582 = _548 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _584 = _580;
    if (!_466)
    {
        int _586 = ~_554;
        int _588 = _586 + 1;
        _584 = _588;
    }
    int _590 = _584;
    float _592 = fma(_540, _482, _518);
    bool _594 = !_264;
    int _596 = _594 ? 0 : 1;
    float _598 = fma(_346, _574, _346);
    bool _600 = !_268;
    int _602 = _600 ? 0 : 1;
    float _604 = _582 + _544;
    int _606 = abs(_596);
    float _608 = fma(_574, _530, _530);
    int _610 = abs(_602);
    float _612 = _604 * _552;
    float _614 = _612 * 0.5;
    float _616 = float(_606);
    float _618 = in.m_67.x;
    float _620 = in.m_67.y;
    float _622 = in.m_67.z;
    float _624 = float(_590);
    float _626 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    float _628 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[145].x, _564);
    float _630 = _616 * _624;
    float _632 = fma(_598, _410, _626);
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _636 = fma(_614, (*spvDescriptorSet0.vp_c8)._m0[30].w, _634);
    float _638 = float(_610);
    float _640 = _630 * (-2.0);
    float _642 = float(_572);
    float _644 = in.m_69.x;
    float _646 = in.m_69.y;
    float _648 = in.m_69.z;
    float _650 = 1.0 / _636;
    float _652 = fma(_640, _532, _532);
    float _654 = _638 * _642;
    float _656 = fma(_372, _640, _372);
    float _658 = _632 * 0.15915493667125701904296875;
    float _660 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[196].y, _652);
    float _662 = _654 * (-2.0);
    float _664 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[145].y, _592);
    float _666 = _658 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = fma(_656, _410, _660);
    float _672 = fma(_662, _534, _534);
    float _674 = _628 * _618;
    float _676 = fma(_422, _662, _422);
    float _678 = _664 * _620;
    float _680 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[196].z, _672);
    float _682 = _670 * 0.15915493667125701904296875;
    float _684 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _686 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _688 = fma(_676, _410, _680);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _692 = _650 * _690;
    float _694 = _682 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = fma(_542, _482, _520);
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _646);
    float _702 = _688 * 0.15915493667125701904296875;
    bool _704 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _706 = _300 + _684;
    bool _708 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _710 = _686 * _700;
    float _712 = _682 * 6.283185482025146484375;
    float _714 = cos(_712);
    float _716 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[145].z, _698);
    bool _718 = !_704;
    int _720 = _718 ? 0 : 1;
    float _722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _644);
    float _724 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _726 = _706 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _728 = _716 * _622;
    float _730 = _706 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _732 = _702 * 6.283185482025146484375;
    float _734 = cos(_732);
    if (!_704)
    {
        _404 = 1;
    }
    int _736 = _404;
    float _738 = _724 * _722;
    int _740 = _736;
    if (!_708)
    {
        _740 = _720;
    }
    int _742 = _740;
    float _744 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[127].x, _726);
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _648);
    float _748 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _750 = _742 << 6;
    float _752 = _658 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[127].z, _744);
    float _758 = _668 * _714;
    float _760 = _668 * _696;
    float _762 = _748 * _746;
    float _764 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[126].x, _730);
    int _766 = _750 + 48;
    uint _769 = uint(int(uint(_766) >> uint(2)));
    uint _771 = uint(int(uint(int(_769)) >> uint(2)));
    int _773 = int(_769) & 3;
    float _775 = (*spvDescriptorSet0.vp_c15)._m0[int(_771)][_773];
    int _777 = int(_769) + 1;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    int _781 = _777 & 3;
    float _783 = (*spvDescriptorSet0.vp_c15)._m0[int(_779)][_781];
    bool _785 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _787 = isnan(0.5);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _793 = _789 || _791;
    float _795 = _702 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _668 * _734;
    float _801 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[126].z, _764);
    int _803 = _750 + 96;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    uint _807 = uint(int(uint(int(_805)) >> uint(2)));
    int _809 = int(_805) & 3;
    float _811 = (*spvDescriptorSet0.vp_c15)._m0[int(_807)][_809];
    int _813 = int(_805) + 1;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    int _817 = _813 & 3;
    float _819 = (*spvDescriptorSet0.vp_c15)._m0[int(_815)][_817];
    float _821 = _801 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _823 = _754 * _696;
    float _825 = _754 * _714;
    float _827 = _754 * _734;
    float _829 = _714 * _734;
    float _831 = _696 * _734;
    float _833 = _756 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _835 = _799 * _710;
    float _837 = trunc(_821);
    int _839 = int(_837);
    float _841 = fma(_797, _758, _823);
    float _843 = -_760;
    float _845 = fma(_797, _825, _843);
    float _847 = -_825;
    float _849 = fma(_797, _760, _847);
    float _851 = -_710;
    float _853 = _797 * _851;
    float _855 = fma(_841, _738, _835);
    float _857 = _827 * _710;
    int _859 = _750 + 104;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    uint _863 = uint(int(uint(int(_861)) >> uint(2)));
    int _865 = int(_861) & 3;
    float _867 = (*spvDescriptorSet0.vp_c15)._m0[int(_863)][_865];
    int _869 = int(_861) + 1;
    uint _871 = uint(int(uint(_869) >> uint(2)));
    int _873 = _869 & 3;
    float _875 = (*spvDescriptorSet0.vp_c15)._m0[int(_871)][_873];
    float _877 = trunc(_833);
    int _879 = int(_877);
    float _881 = fma(_829, _738, _853);
    float _883 = fma(_849, _762, _855);
    float _885 = fma(_797, _823, _758);
    float _887 = fma(_845, _738, _857);
    float _889 = fma(_831, _762, _881);
    float _891 = _883 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _893 = _750 + 64;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    uint _897 = uint(int(uint(int(_895)) >> uint(2)));
    int _899 = int(_895) & 3;
    float _901 = (*spvDescriptorSet0.vp_c15)._m0[int(_897)][_899];
    int _903 = int(_895) + 1;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    int _907 = _903 & 3;
    float _909 = (*spvDescriptorSet0.vp_c15)._m0[int(_905)][_907];
    float _911 = _883 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _913 = fma(_885, _762, _887);
    float _915 = fma(_889, (*spvDescriptorSet0.vp_c10)._m0[10].x, _891);
    int _917 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _919 = _839 + _917;
    int _921 = _919 + 1;
    float _923 = fma(_889, (*spvDescriptorSet0.vp_c10)._m0[8].x, _911);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[10].z, _915);
    int _927 = _750 + 56;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c15)._m0[int(_931)][_933];
    int _937 = int(_929) + 1;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    int _941 = _937 & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    float _945 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[8].z, _923);
    int _947 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _949 = _879 + _947;
    int _951 = _949 + 1;
    float _953 = _214 + _925;
    bool _955 = _921 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _957 = _212 + _945;
    int _959 = _921 | _951;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _963 = _953 + _961;
    int _965 = _750 + 72;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    uint _969 = uint(int(uint(int(_967)) >> uint(2)));
    int _971 = int(_967) & 3;
    float _973 = (*spvDescriptorSet0.vp_c15)._m0[int(_969)][_971];
    int _975 = int(_967) + 1;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    int _979 = _975 & 3;
    float _981 = (*spvDescriptorSet0.vp_c15)._m0[int(_977)][_979];
    bool _983 = _959 < 0;
    bool _985 = _983 || _955;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _989 = _957 + _987;
    float _991 = _963 * _963;
    bool _993 = _951 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _995 = _993 || _985;
    int _997 = _750 + 80;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
    int _1003 = int(_999) & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = int(_999) + 1;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    int _1011 = _1007 & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    float _1015 = fma(_989, _989, _991);
    float _1017 = _706 * _819;
    float _1019 = _883 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1021 = sqrt(_1015);
    float _1023 = fma(_212, _811, _1017);
    int _1025 = as_type<int>(_883);
    int _1027 = as_type<int>(_1023);
    float _1029 = _957;
    float _1031 = _953;
    float _1033 = _1015;
    float _1035 = _963;
    float _1037 = _989;
    float _1039 = as_type<float>(_742);
    float _1041 = _889;
    if (!_995)
    {
        int _1043 = _951 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1045 = _1043 + _921;
        _1025 = _1045;
    }
    int _1047 = _1025;
    float _1049 = _706 * _783;
    float _1051 = fma(_889, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1019);
    float _1053 = _1019;
    int _1055 = as_type<int>(_1051);
    if (!_995)
    {
        float _1057 = floor(_821);
        _1053 = _1057;
    }
    float _1059 = _1053;
    float _1061 = fma(_214, _867, _1023);
    float _1063 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1051);
    float _1065 = fma(_212, _775, _1049);
    int _1067 = as_type<int>(_901);
    if (!_995)
    {
        int _1069 = _1047 << 2;
        _1027 = _1069;
    }
    int _1071 = _1027;
    float _1073 = _1061 + _875;
    bool _1075 = _1021 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1077 = _300 + _1063;
    float _1079 = as_type<float>(_1071);
    if (!_995)
    {
        int _1081 = 12 & _1071;
        _1055 = _1081;
    }
    int _1083 = _1055;
    float _1085 = _706 * _909;
    float _1087 = 1.0 / _1073;
    float _1089 = fma(_212, _901, _1085);
    if (!_995)
    {
        uint _1091 = uint(int(uint(_1047) >> uint(2)));
        _1067 = int(_1091);
    }
    int _1093 = _1067;
    float _1095 = fma(_214, _935, _1065);
    int _1097 = _1093;
    if (!_995)
    {
        int _1099 = _1093 << 4;
        int _1101 = _1099 + _1083;
        _1097 = _1101;
    }
    int _1103 = _1097;
    float _1105 = _1095 + _943;
    float _1107 = fma(_214, _973, _1089);
    float _1109 = _973;
    if (!_1075)
    {
        _1109 = _1077;
    }
    float _1111 = _1109;
    float _1113 = _1107 + _981;
    bool _1115 = !_1075;
    float _1117 = _1111;
    if (!_1115)
    {
        float _1119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1123 = _1021 + _1121;
        float _1125 = _1077 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1127 = rsqrt(_1015);
        float _1129 = _1123 * _1119;
        float _1131 = _1129 * 0.15915493667125701904296875;
        float _1133 = _1131 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1131 * 6.283185482025146484375;
        float _1139 = cos(_1137);
        float _1141 = fma(_1135, _1125, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1143 = _1127 * _1141;
        float _1145 = _1139 + (-1.0);
        float _1147 = fma(_989, _1143, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1149 = fma(_963, _1143, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1151 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1153 = fma(_1077, _1139, _1151);
        _1029 = _1147;
        _1117 = _1153;
        _1031 = _1149;
        _1033 = _1127;
        _1079 = _1125;
    }
    float _1155 = _1029;
    float _1157 = _1117;
    float _1159 = _1031;
    float _1161 = _1033;
    float _1163 = _1079;
    float _1165 = _1161;
    float _1167 = _1163;
    if (_793)
    {
        _1165 = _1155;
    }
    float _1169 = _1165;
    float _1171 = _1169;
    if (_793)
    {
        _1035 = _1157;
    }
    float _1173 = _1035;
    float _1175 = _1173;
    if (_793)
    {
        _1037 = _1159;
    }
    float _1177 = _1037;
    float _1179 = _1177;
    if (!_793)
    {
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1183 = _300 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1187 = _212 + _1185;
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1191 = -_300;
        float _1193 = _1191 + _1157;
        float _1195 = _1183 * _1183;
        float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1199 = _214 + _1197;
        float _1201 = -_212;
        float _1203 = _1201 + _1155;
        float _1205 = -_214;
        float _1207 = _1205 + _1159;
        float _1209 = fma(_1187, _1187, _1195);
        float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1213 = fma(_1199, _1199, _1209);
        float _1215 = sqrt(_1213);
        float _1217 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1219 = precise::min(_1215, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1221 = _1219 * _1211;
        float _1223 = _1217 * _1221;
        float _1225 = fma(_1193, _1223, _300);
        float _1227 = fma(_1203, _1223, _212);
        float _1229 = fma(_1207, _1223, _214);
        _1175 = _1225;
        _1171 = _1227;
        _1179 = _1229;
        _1167 = _1215;
    }
    float _1231 = _1175;
    float _1233 = _1171;
    float _1235 = _1179;
    float _1237 = _1167;
    int _1239 = _750 + 88;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    uint _1243 = uint(int(uint(int(_1241)) >> uint(2)));
    int _1245 = int(_1241) & 3;
    float _1247 = (*spvDescriptorSet0.vp_c15)._m0[int(_1243)][_1245];
    int _1249 = int(_1241) + 1;
    uint _1251 = uint(int(uint(_1249) >> uint(2)));
    int _1253 = _1249 & 3;
    float _1255 = (*spvDescriptorSet0.vp_c15)._m0[int(_1251)][_1253];
    float _1257 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1259 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1261 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1263 = _1105 * _1087;
    float _1265 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1257);
    float _1267 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1259);
    float _1269 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1261);
    float _1271 = _1155;
    if (!_995)
    {
        int _1273 = _1103 + 400;
        uint _1275 = uint(int(uint(_1273) >> uint(2)));
        uint _1277 = uint(int(uint(int(_1275)) >> uint(2)));
        int _1279 = int(_1275) & 3;
        float _1281 = (*spvDescriptorSet0.vp_c15)._m0[int(_1277)][_1279];
        _1271 = _1281;
    }
    float _1283 = _1271;
    float _1285 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1265);
    bool _1287 = _1263 >= 0.0;
    float _1289 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1267);
    float _1291 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1293 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1269);
    float _1295 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1297 = _1113 * _1087;
    bool _1299 = _1263 <= 1.0;
    bool _1301 = _1299 && _1287;
    float _1303 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1291);
    float _1307 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1309 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1311 = _1297 >= 0.0;
    bool _1313 = _1311 && _1301;
    float _1315 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1317 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1319 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1305);
    float _1321 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1309);
    bool _1323 = _1297 <= 1.0;
    bool _1325 = _1323 && _1313;
    float _1327 = -_1317;
    float _1329 = fma(_1327, _1315, 1.0);
    float _1331 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1333 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = _706 * _1013;
    float _1337 = _1237;
    if (!_995)
    {
        float _1339 = floor(_833);
        _1337 = _1339;
    }
    float _1341 = _1337;
    float _1343 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    float _1347 = fma(_212, _1005, _1335);
    float _1349 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1351 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1343);
    float _1353 = log2(_1329);
    float _1355 = _1345;
    if (_1325)
    {
        float _1357 = float(_742);
        _1039 = _1357;
    }
    float _1359 = _1039;
    float _1361 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1349);
    float _1363 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1365 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1361);
    float _1367 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1363);
    float _1369 = 1.0 / _1345;
    float _1371 = fma(_214, _1247, _1347);
    float _1373 = _1255;
    float _1375 = _1359;
    if (!_995)
    {
        float _1377 = -_1341;
        float _1379 = _833 + _1377;
        _1041 = _1379;
    }
    float _1381 = _1041;
    float _1383 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1365);
    float _1385 = _1371 + _1255;
    float _1387 = _1383;
    if (!_995)
    {
        float _1389 = -_1059;
        float _1391 = _821 + _1389;
        _1373 = _1391;
    }
    float _1393 = _1373;
    float _1395 = _1335;
    float _1397 = _1393;
    if (_1325)
    {
        float _1399 = rint(_1359);
        float _1401 = precise::max(_1399, 0.0);
        uint _1403 = uint(_1401);
        uint _1405 = clamp(_1403, 0u, 65535u);
        _1395 = as_type<float>(_1405);
    }
    float _1407 = _1395;
    float _1409 = _1385 * _1087;
    float _1411 = _1353 * 0.693147182464599609375;
    float _1413 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1415 = _1385;
    if (!_995)
    {
        float _1417 = rint(_1283);
        float _1419 = precise::max(_1417, 0.0);
        uint _1421 = uint(_1419);
        uint _1423 = clamp(_1421, 0u, 65535u);
        _1415 = as_type<float>(_1423);
    }
    float _1425 = _1415;
    float _1427 = _1367 * _1369;
    float _1429 = _1383 * _1369;
    float _1431 = fma(_1427, 0.5, 0.5);
    float _1433 = fma(_1429, -0.5, 0.5);
    float _1435 = as_type<float>(_750);
    if (_1325)
    {
        float3 _4498 = float3(_1263, _1297, float(as_type<int>(_1407)));
        float3 _4502 = select(_4498, float3(0.0), isnan(_4498));
        float _1437 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4502.xy, uint(rint(_4502.z)), _1409, level(0.0));
        _1435 = _1437;
    }
    float _1439 = _1435;
    float3 _4512 = float3(_1431, _1433, _1413);
    float _1441 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4512, float3(0.0), isnan(_4512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4512, float3(0.0), isnan(_4512)), level(0.0)).x;
    float3 _4521 = float3(_1431, _1433, _1413);
    float4 _1444 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4521, float3(0.0), isnan(_4521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4521, float3(0.0), isnan(_4521)), level(0.0)).xyzw;
    float _1446 = _1444.x;
    float _1448 = _1444.y;
    float _1450 = _1444.z;
    float _1452 = _1444.w;
    float _1454 = _1411;
    if (!_995)
    {
        float3 _4544 = float3(_1393, _1381, float(as_type<int>(_1425)));
        float3 _4546 = select(_4544, float3(0.0), isnan(_4544));
        float _1456 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4546.xy, uint(rint(_4546.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4546.xy, uint(rint(_4546.z)), level(0.0)).x;
        _1454 = _1456;
    }
    float _1458 = _1454;
    if (_995)
    {
        _1375 = 1.0;
    }
    float _1460 = _1375;
    float _1462 = _1460;
    if (!_995)
    {
        int _1464 = _1047 << 4;
        int _1466 = _1464 + 2048;
        uint _1468 = uint(int(uint(_1466) >> uint(2)));
        uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
        int _1472 = int(_1468) & 3;
        float _1474 = (*spvDescriptorSet0.vp_c15)._m0[int(_1470)][_1472];
        int _1476 = int(_1468) + 1;
        uint _1478 = uint(int(uint(_1476) >> uint(2)));
        int _1480 = _1476 & 3;
        float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
        int _1484 = _1466 + 8;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
        int _1490 = int(_1486) & 3;
        float _1492 = (*spvDescriptorSet0.vp_c15)._m0[int(_1488)][_1490];
        int _1494 = int(_1486) + 1;
        uint _1496 = uint(int(uint(_1494) >> uint(2)));
        int _1498 = _1494 & 3;
        float _1500 = (*spvDescriptorSet0.vp_c15)._m0[int(_1496)][_1498];
        float _1502 = _706 * _1482;
        float _1504 = fma(_212, _1474, _1502);
        float _1506 = fma(_214, _1492, _1504);
        float _1508 = _1506 + _1500;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        float _1512 = -_1510;
        float _1514 = _1512 + _1458;
        float _1516 = fma(_1514, 500.0, 1.5);
        float _1518 = exp2(_1516);
        float _1520 = 0.0 + _1518;
        float _1522 = precise::clamp(_1520, 0.0, 1.0);
        _1397 = _1500;
        _1462 = _1522;
    }
    float _1524 = _1397;
    float _1526 = _1462;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1231 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1534 = _1233 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = _1235 + _1536;
    float _1540 = _1530 * _1530;
    float _1542 = fma(_1534, _1534, _1540);
    float _1544 = fma(_1538, _1538, _1542);
    float _1546 = rsqrt(_1544);
    float _1548 = sqrt(_1544);
    float _1550 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1552 = _1534 * _1550;
    float _1554 = _1538 * _1550;
    float _1556 = _1552 * _1552;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 + _1558;
    float _1562 = sqrt(_1560);
    bool _1564 = _1562 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = _1562 + _1566;
    float _1570 = _1524;
    float _1572 = _1560;
    float _1574 = _1568;
    float _1576 = _1530;
    float _1578 = _1550;
    float _1580 = _1552;
    float _1582 = _1554;
    float _1584 = _1558;
    if (_1564)
    {
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1570 = _1586;
    }
    float _1588 = _1570;
    if (_1564)
    {
        float _1590 = rsqrt(_1560);
        _1572 = _1590;
    }
    float _1592 = _1572;
    if (_1564)
    {
        float _1594 = _1568 * _1588;
        _1574 = _1594;
    }
    float _1596 = _1574;
    if (_1564)
    {
        float _1598 = _1596 * 0.15915493667125701904296875;
        _406 = _1598;
    }
    float _1600 = _406;
    float _1602 = _1433;
    if (_1564)
    {
        float _1604 = _1600 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1431;
    float _1616 = _1612;
    float _1618 = _1610;
    if (_1564)
    {
        float _1620 = _1600 * 6.283185482025146484375;
        float _1622 = cos(_1620);
        _1614 = _1622;
    }
    float _1624 = _1614;
    float _1626 = -_1550;
    float _1628 = -_1612;
    float _1630 = fma(_1530, _1626, _1628);
    if (!_1564)
    {
        _1616 = _1556;
    }
    float _1632 = _1616;
    float _1634 = _1632;
    if (_1564)
    {
        float _1636 = _1630 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1636;
    }
    float _1638 = _1576;
    float _1640 = _1608;
    float _1642 = _1638;
    if (_1564)
    {
        float _1644 = fma(_1608, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1640 = _1644;
    }
    float _1646 = _1640;
    float _1648 = _1646;
    if (!_1564)
    {
        _1642 = _1630;
    }
    float _1650 = _1642;
    float _1652 = _1650;
    if (_1564)
    {
        float _1654 = _1624 + (-1.0);
        _1618 = _1654;
    }
    float _1656 = _1618;
    if (_1564)
    {
        float _1658 = _1592 * _1646;
        _1578 = _1658;
    }
    float _1660 = _1578;
    if (_1564)
    {
        float _1662 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1648 = _1662;
    }
    float _1664 = _1648;
    if (_1564)
    {
        float _1666 = _1552 * _1660;
        _1580 = _1666;
    }
    float _1668 = _1580;
    if (_1564)
    {
        float _1670 = _1554 * _1660;
        _1582 = _1670;
    }
    float _1672 = _1582;
    if (_1564)
    {
        float _1674 = fma(_1630, _1624, _1664);
        _1652 = _1674;
    }
    float _1676 = _1652;
    if (_1564)
    {
        float _1678 = _1668 * _1668;
        _1634 = _1678;
    }
    float _1680 = _1634;
    if (_1564)
    {
        float _1682 = _1672 * _1672;
        _1584 = _1682;
    }
    float _1684 = _1584;
    float _1686 = fma(_1676, _1676, _1680);
    float _1688 = _1686 + _1684;
    float _1690 = rsqrt(_1688);
    float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1694 = fma(_1548, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1692);
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = -_1696;
    float _1700 = _1698 + 1.0;
    float _1702 = _1690 * _1668;
    float _1704 = _1690 * _1676;
    float _1706 = _1690 * _1672;
    float _1708 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = abs(_1700);
    float _1712 = log2(_1710);
    float _1714 = -_1708;
    float _1716 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1714);
    float _1718 = -_1706;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1716);
    float _1722 = fma(_1720, -0.5, 0.5);
    float _1724 = fma(_1720, 0.5, 0.5);
    float _1726 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1728 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1730 = sqrt(_1722);
    float _1732 = fma(_1724, _1726, -0.212114393711090087890625);
    float _1734 = _1704 + 1.0;
    float _1736 = fma(_1724, _1732, 1.570728778839111328125);
    float _1738 = exp2(_1728);
    float _1740 = _1730 * 0.636619746685028076171875;
    float _1742 = -_1736;
    float _1744 = fma(_1740, _1742, 1.0);
    float _1746 = -_1704;
    float _1748 = fma(_1738, _1734, _1746);
    float _1750 = fma(_1748, 0.5, 0.5);
    float2 _5000 = float2(_1744, _1750);
    float3 _1754 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5000, float2(0.0), isnan(_5000)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5000, float2(0.0), isnan(_5000)), level(0.0)).xyz;
    float _1756 = _1754.x;
    float _1758 = _1754.y;
    float _1760 = _1754.z;
    float _1762 = abs(_692);
    float _1764 = log2(_1762);
    float _1766 = in.m_71.x;
    float _1768 = in.m_71.y;
    float _1770 = in.m_71.z;
    bool _1772 = _646 != 0.0;
    bool _1774 = isnan(_646);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan(0.0);
    bool _1780 = _1776 || _1778;
    float _1782 = -_232;
    float _1784 = _1782 + 1.0;
    bool _1786 = _644 == 0.0;
    bool _1788 = !_1780;
    bool _1790 = _1786 && _1788;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1794 = _648 == 0.0;
    bool _1796 = _1794 && _1790;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1806 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1810 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1812 = exp2(_1802);
    float _1814 = _1768;
    float _1816 = _1766;
    float _1818 = _1770;
    if (!_1796)
    {
        float _1820 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1768);
        _1814 = _1820;
    }
    float _1822 = _1814;
    if (!_1796)
    {
        float _1824 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1766);
        _1816 = _1824;
    }
    float _1826 = _1816;
    if (!_1796)
    {
        float _1828 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1770);
        _1818 = _1828;
    }
    float _1830 = _1818;
    float _1832 = _799 * _1822;
    float _1834 = -_1822;
    float _1836 = _797 * _1834;
    float _1838 = _827 * _1822;
    float _1840 = fma(_841, _1826, _1832);
    float _1842 = fma(_829, _1826, _1836);
    float _1844 = fma(_845, _1826, _1838);
    out.m_73.x = _1800;
    out.m_73.y = _1806;
    out.m_73.z = _1810;
    out.m_73.w = _1808;
    float _1846 = fma(_849, _1830, _1840);
    float _1848 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1850 = precise::clamp(_1848, 0.0, 1.0);
    float _1852 = fma(_831, _1830, _1842);
    float _1854 = fma(_885, _1830, _1844);
    float _1856 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1858 = fma(_1850, -2.0, 3.0);
    float _1860 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1862 = _1850 * _1850;
    float _1864 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1866 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1868 = isnan(_1548);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1874 = _1870 || _1872;
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1860);
    float _1878 = exp2(_1856);
    float _1880 = _1862 * _1858;
    float _1882 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1884 = fma(_1852, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1864);
    float _1886 = fma(_1854, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1876);
    float _1888 = -_1880;
    float _1890 = _1888 + 1.0;
    float _1892 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1882);
    float _1894 = fma(_1854, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1884);
    bool _1896 = _692 <= 8000.0;
    bool _1898 = isnan(_692);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(8000.0);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = fma(_1890, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1880);
    float _1910 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1892);
    float _1912 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1914 = _1906 * _1908;
    float _1916 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1910);
    float _1918 = -_1878;
    float _1920 = _1918 + 1.0;
    float _1922 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1924 = _1916 + _1345;
    out.gl_Position.x = _1367;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _1916;
    out.gl_Position.w = _1345;
    float _1926 = fma(_1852, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1912);
    float _1928 = _1784 * _1922;
    float _1930 = precise::clamp(_1928, 0.0, 1.0);
    float _1932 = _1924 * 0.5;
    float _1934 = _1924;
    float _1936 = _1916;
    if (!_1325)
    {
        _1934 = 1.0;
    }
    float _1938 = _1934;
    float _1940 = fma(_1854, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1926);
    float _1942 = _1938;
    if (_1325)
    {
        bool _1944 = _1439 >= _1409;
        bool _1946 = isnan(_1439);
        bool _1948 = _1944 || _1946;
        bool _1950 = isnan(_1409);
        bool _1952 = _1948 || _1950;
        float _1954 = float(_1952);
        _1942 = _1954;
    }
    float _1956 = _1942;
    float _1958 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1960 = -_1930;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_75.z = _1932;
    out.m_75.w = _1345;
    float _1964 = _1958 * _1441;
    float _1966 = _1956 * _1526;
    out.m_77.x = _1886;
    out.m_77.y = _1940;
    out.m_77.z = _1894;
    float _1968 = -_1958;
    float _1970 = _1968 + 1.0;
    float _1972 = -_1966;
    float _1974 = fma(_1972, _1962, 1.0);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = _1970;
    float _1980 = 1.0;
    float _1982 = 1.0;
    if (!_1874)
    {
        _1355 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1984 = _1355;
    float _1986 = _1452 * _1970;
    float _1988 = _1452 * _1964;
    float _1990 = _1976 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _1992 = _1984;
    float _1994 = _1984;
    if (!_1874)
    {
        _1936 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1996 = _1936;
    float _1998 = _1996;
    float _2000 = _1996;
    if (!_1874)
    {
        _1387 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2002 = _1387;
    out.m_81.x = _1990;
    float _2004 = _2002;
    float _2006 = _2002;
    if (!_1874)
    {
        _1978 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2008 = _1978;
    float _2010 = _2008;
    float _2012 = _2008;
    if (!_1874)
    {
        _1980 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2014 = _1980;
    float _2016 = _2014;
    float _2018 = _2014;
    if (!_1874)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2020 = _1982;
    float _2022 = _1760 * _1964;
    float _2024 = fma(_1756, _1988, _1446);
    float _2026 = fma(_1758, _1988, _1448);
    float _2028 = fma(_1452, _2022, _1450);
    out.m_83.x = _2024;
    out.m_83.y = _2026;
    out.m_83.z = _2028;
    out.m_83.w = _1986;
    bool _2030 = !_1874;
    float _2032 = _2020;
    float _2034 = _2020;
    if (!_2030)
    {
        bool _2036 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2038 = isnan(_1548);
        bool _2040 = _2036 || _2038;
        bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2044 = _2040 || _2042;
        if (!_2044)
        {
            float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2048 = _1548 + _2046;
            float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2052 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2050;
            float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2058 = 1.0 / _2052;
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2062 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2076 = _2048 * _2058;
            float _2078 = precise::clamp(_2076, 0.0, 1.0);
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2084 = fma(_2078, _2056, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2086 = fma(_2078, _2082, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2088 = fma(_2078, _2062, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2090 = fma(_2078, _2066, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2092 = fma(_2078, _2070, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2094 = fma(_2078, _2074, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2034 = _2088;
            _2006 = _2092;
            _2018 = _2084;
            _2000 = _2090;
            _1994 = _2086;
            _2012 = _2094;
            _2096 = true;
        }
        else
        {
            bool _2098 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2100 = isnan(_1548);
            bool _2102 = _2098 || _2100;
            bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2106 = _2102 || _2104;
            if (!_2106)
            {
                _2016 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2108 = _2016;
            _2018 = _2108;
            if (!_2106)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2110 = _2032;
            _2034 = _2110;
            if (!_2106)
            {
                _1992 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2112 = _1992;
            _1994 = _2112;
            if (!_2106)
            {
                _1998 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2114 = _1998;
            _2000 = _2114;
            if (!_2106)
            {
                _2004 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2116 = _2004;
            _2006 = _2116;
            if (!_2106)
            {
                _2010 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2118 = _2010;
            bool _2120 = !_2106;
            _2012 = _2118;
            if (!_2120)
            {
                bool _2122 = _1548 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2124 = isnan(_1548);
                bool _2126 = _2122 || _2124;
                bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2130 = _2126 || _2128;
                if (!_2130)
                {
                    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2134 = _1548 + _2132;
                    float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2136;
                    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2144 = 1.0 / _2138;
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2162 = _2134 * _2144;
                    float _2164 = precise::clamp(_2162, 0.0, 1.0);
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2170 = fma(_2164, _2142, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2172 = fma(_2164, _2168, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2174 = fma(_2164, _2148, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2176 = fma(_2164, _2152, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2178 = fma(_2164, _2156, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2180 = fma(_2164, _2160, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2034 = _2174;
                    _2006 = _2178;
                    _2018 = _2170;
                    _2000 = _2176;
                    _1994 = _2172;
                    _2012 = _2180;
                    _2096 = true;
                }
                else
                {
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2006 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2018 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2000 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1994 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2012 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2096 = false;
    float _2182 = _2034;
    float _2184 = _2006;
    float _2186 = _2018;
    float _2188 = _2000;
    float _2190 = _1994;
    float _2192 = _2012;
    float _2194 = fma(_1940, -0.5, 0.5);
    float _2196 = precise::clamp(_2194, 0.0, 1.0);
    float _2198 = -_2182;
    float _2200 = _2198 + _2184;
    float _2202 = -_2186;
    float _2204 = _2202 + _2188;
    float _2206 = -_2190;
    float _2208 = _2206 + _2192;
    bool _2210 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2212 = fma(_2196, _2200, _2182);
    float _2214 = fma(_2196, _2204, _2186);
    float _2216 = fma(_2196, _2208, _2190);
    float _2218 = _2212 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2220 = fma(_2214, 0.298911988735198974609375, _2218);
    float _2222 = fma(_2216, 0.114477999508380889892578125, _2220);
    out.m_85.x = 0.0;
    float _2224 = -_2222;
    float _2226 = _2214 + _2224;
    float _2228 = -_2222;
    float _2230 = _2212 + _2228;
    float _2232 = -_2222;
    float _2234 = _2216 + _2232;
    float _2236 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2222);
    float _2240 = fma(_2230, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2222);
    float _2242 = fma(_2234, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2222);
    out.m_81.w = _2236;
    out.m_87.x = _2238;
    out.m_87.y = _2240;
    out.m_87.z = _2242;
    if (!_2210)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2244 = -_1231;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2248 = -_1233;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2252 = -_1235;
    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2256 = _2246 * _2246;
    float _2258 = fma(_2250, _2250, _2256);
    float _2260 = fma(_2254, _2254, _2258);
    float _2262 = sqrt(_2260);
    float _2264 = rsqrt(_2260);
    float _2266 = -_2262;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2270 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2272 = precise::clamp(_2270, 0.0, 1.0);
    float _2274 = _2250 * _2264;
    float _2276 = _2246 * _2264;
    float _2278 = abs(_2272);
    float _2280 = log2(_2278);
    float _2282 = _2254 * _2264;
    float _2284 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2286 = _1940 * _2276;
    float _2288 = -_2276;
    float _2290 = -_2284;
    float _2292 = fma(_2288, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2290);
    float _2294 = fma(_1886, _2274, _2286);
    float _2296 = -_2282;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2292);
    float _2300 = fma(_1894, _2282, _2294);
    float _2302 = precise::clamp(_2300, 0.0, 1.0);
    float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2306 = _2298 + _2304;
    float _2308 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2310 = _2306 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = exp2(_2308);
    float _2316 = _2314 * _2312;
    float _2318 = _2302 * _2316;
    float _2320 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2322 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2324 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2320;
    out.m_85.y = _2322;
    out.m_85.z = _2324;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

