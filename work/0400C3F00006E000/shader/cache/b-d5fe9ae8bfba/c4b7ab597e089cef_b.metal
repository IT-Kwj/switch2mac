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
    float4 m_77 [[user(locn0)]];
    float4 m_59 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_95 [[user(locn12)]];
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
    float4 m_73 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2934 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_56.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_59.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3279 = as_type<float>(_130);
        out.gl_Position.z = _3279;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_61.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_59.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3349 = as_type<float>(_168);
        out.gl_Position.z = _3349;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_63.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = in.m_56.x;
    float _204 = in.m_56.y;
    float _206 = in.m_56.z;
    float _208 = _204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _210 = _204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _212 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].x, _208);
    float _214 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].x, _210);
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].z, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].z, _214);
    float _220 = _216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _222 = _218 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _224 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _228 = floor(_224);
    float _230 = floor(_226);
    float _232 = -_228;
    float _234 = _224 + _232;
    float _236 = -_230;
    float _238 = _226 + _236;
    float2 _3476 = float2(_234, _238);
    float _240 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3476, float2(0.0), isnan(_3476)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3476, float2(0.0), isnan(_3476)), level(0.0)).x;
    float _242 = in.m_63.x;
    float _244 = _204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _246 = in.m_63.y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _250 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].x, _244);
    float _252 = in.m_63.z;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _258 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _200 + _264;
    float _268 = 1.0 / _256;
    float _270 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].z, _250);
    bool _272 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _280 = _276 || _278;
    float _282 = _270 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _284 = 1.0 / _260;
    float _286 = _282 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _288 = _242 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _290 = _242 * 2.0;
    float _292 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].x, _286);
    float _294 = _246 * 2.0;
    float _296 = -_248;
    float _298 = fma(_288, 2.0, _296);
    float _300 = _246 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _302 = floor(_290);
    float _304 = _252 * 2.0;
    float _306 = _242 + _246;
    float _308 = fma(_300, -2.0, _262);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _200 + _310;
    float _314 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].z, _292);
    float _316 = _306 + (-1.0);
    float _318 = _266 * _284;
    float _320 = floor(_294);
    float _322 = _312 * _268;
    float _324 = _246 + _252;
    float _326 = _242 + _252;
    float _328 = _324 + (-1.0);
    float _330 = floor(_304);
    float _332 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _334 = _326 + (-1.0);
    bool _336 = _302 > 0.0;
    float _338 = _314 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _340 = _302 >= 0.0;
    bool _342 = isnan(_302);
    bool _344 = _340 || _342;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    float _350 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _354 = log2(_352);
    float _356 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _366 = _320 > 0.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _368;
    bool _372 = _330 > 0.0;
    float _374 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _376 = int(_374);
    bool _378 = _330 >= 0.0;
    bool _380 = isnan(_330);
    bool _382 = _378 || _380;
    bool _384 = isnan(0.0);
    bool _386 = _382 || _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    bool _392 = _320 >= 0.0;
    bool _394 = isnan(_320);
    bool _396 = _392 || _394;
    bool _398 = isnan(0.0);
    bool _400 = _396 || _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _354 * _148;
    float _412 = fma(_364, _318, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_404, _318, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_408, _318, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _420 = int(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _424 = 1.0 + _422;
    float _426 = fma(_360, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = fma(_370, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _430 = fma(_390, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _432 = float(_376);
    float _434 = _252 + (-0.5);
    float _436 = exp2(_410);
    float _438 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _440 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_200);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _454 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _456 = isnan(_200);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _468 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = isnan(_200);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = 1.0 / _432;
    float _482 = float(_420);
    float _484 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[78].z, _466);
    float _486 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _308);
    float _488 = -_478;
    float _490 = _488 + 1.0;
    int _492 = _400 ? 0 : 1;
    float _494 = _482 * _148;
    float _496 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _484);
    float _498 = -_436;
    float _500 = _498 + 1.0;
    float _502 = 1.0 / _424;
    float _504 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[78].w, _452);
    int _506 = _348 ? 0 : 1;
    float _508 = _464 * _490;
    float _510 = _280 ? _500 : 0.0;
    float _512 = -_464;
    float _514 = _512 + 1.0;
    bool _516 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _518 = isnan(1.0);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _524 = _520 || _522;
    float _526 = _480 * _148;
    float _528 = -_148;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _298);
    int _532 = ~_506;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _504);
    int _540 = _536;
    int _542 = 2;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_336)
    {
        int _546 = ~_506;
        int _548 = _546 + 1;
        _540 = _548;
    }
    int _550 = _540;
    float _552 = _450 * _514;
    int _554 = _386 ? 0 : 1;
    float _556 = 1.0 / _338;
    float _558 = float(_550);
    float _560 = _426 * _552;
    int _562 = ~_554;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    float _568 = _428 * _552;
    int _570 = _566;
    if (_524)
    {
        float _572 = _510 * _502;
        _150 = _572;
    }
    float _574 = _150;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _578 = _576 != 0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _582 = _580 != 0;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _586 = _584 != 0;
    float _588 = in.m_65.x;
    float _590 = in.m_65.y;
    float _592 = in.m_65.z;
    if (!_372)
    {
        int _594 = ~_554;
        int _596 = _594 + 1;
        _570 = _596;
    }
    int _598 = _570;
    float _600 = _430 * _552;
    int _602 = ~_492;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = _282 + _438;
    bool _610 = !_582;
    int _612 = _610 ? 0 : 1;
    bool _614 = !_578;
    int _616 = _614 ? 0 : 1;
    bool _618 = !_586;
    int _620 = _618 ? 0 : 1;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _632 = _630 != 0;
    float _634 = float(_598);
    int _636 = _606;
    if (!_366)
    {
        int _638 = ~_492;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    bool _644 = !_628;
    int _646 = _644 ? 0 : 1;
    bool _648 = !_624;
    int _650 = _648 ? 0 : 1;
    int _652 = abs(_646);
    int _654 = abs(_650);
    float _656 = _282 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _658 = float(_652);
    bool _660 = !_632;
    int _662 = _660 ? 0 : 1;
    float _664 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].x, _656);
    float _666 = _658 * _558;
    int _668 = abs(_662);
    float _670 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].z, _664);
    float _672 = float(_654);
    float _674 = _666 * (-2.0);
    float _676 = _670 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _678 = float(_642);
    float _680 = _672 * _634;
    float _682 = _246 + (-0.5);
    float _684 = fma(_674, _590, _590);
    float _686 = float(_668);
    float _688 = _676 + _338;
    float _690 = fma(_356, _674, _356);
    float _692 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _694 = _680 * (-2.0);
    float _696 = _686 * _678;
    float _698 = _688 * _556;
    float _700 = _698 * 0.5;
    float _702 = fma(_690, _574, _692);
    float _704 = _242 + (-0.5);
    float _706 = fma(_694, _588, _588);
    float _708 = fma(_332, _694, _332);
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _712 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[30].w, _710);
    float _714 = in.m_67.x;
    float _716 = in.m_67.y;
    float _718 = in.m_67.z;
    float _720 = _702 * 0.15915493667125701904296875;
    float _722 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].x, _706);
    float _724 = -_450;
    float _726 = _724 + 1.0;
    float _728 = _696 * (-2.0);
    float _730 = in.m_69.x;
    float _732 = in.m_69.y;
    float _734 = in.m_69.z;
    float _736 = 1.0 / _712;
    float _738 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _740 = fma(_728, _592, _592);
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _744 = fma(_350, _728, _350);
    float _746 = fma(_412, _508, _738);
    float _748 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[196].z, _740);
    float _750 = fma(_416, _508, _742);
    float _752 = fma(_708, _574, _722);
    float _754 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].y, _568);
    float _756 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].x, _746);
    float _758 = fma(_744, _574, _748);
    float _760 = fma(_414, _508, _754);
    float _762 = _752 * 0.15915493667125701904296875;
    float _764 = _758 * 0.15915493667125701904296875;
    float _766 = _720 * 6.283185482025146484375;
    float _768 = cos(_766);
    float _770 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].y, _760);
    float _772 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].z, _750);
    float _774 = _756 * _714;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _778 = _736 * _776;
    float _780 = _770 * _716;
    float _782 = _772 * _718;
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _730);
    float _786 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _788 = _762 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _794 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _796 = _786 * _784;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _734);
    bool _800 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _732);
    float _804 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _806 = _764 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _792 * _798;
    float _812 = _608 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _814 = _804 * _802;
    bool _816 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _818 = isnan(0.5);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _824 = _820 || _822;
    float _826 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[126].x, _812);
    if (!_794)
    {
        _542 = 1;
    }
    int _828 = _542;
    float _830 = _762 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = _790 * _768;
    float _836 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].z, _826);
    float _838 = _836 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _840 = _720 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _768 * _808;
    float _846 = _790 * _808;
    float _848 = _846 * _814;
    float _850 = _764 * 6.283185482025146484375;
    float _852 = sin(_850);
    float _854 = _832 * _768;
    bool _856 = !_794;
    int _858 = _856 ? 0 : 1;
    int _860 = _828;
    if (!_800)
    {
        _860 = _858;
    }
    int _862 = _860;
    float _864 = _790 * _842;
    float _866 = _832 * _842;
    float _868 = _842 * _808;
    float _870 = _608 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _872 = _832 * _808;
    int _874 = _862 << 6;
    float _876 = trunc(_838);
    int _878 = int(_876);
    float _880 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[127].x, _870);
    float _882 = fma(_852, _854, _864);
    float _884 = fma(_852, _864, _854);
    float _886 = -_866;
    float _888 = fma(_852, _834, _886);
    float _890 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].z, _880);
    float _892 = -_834;
    float _894 = fma(_852, _866, _892);
    int _896 = _874 + 96;
    uint _899 = uint(int(uint(_896) >> uint(2)));
    uint _901 = uint(int(uint(int(_899)) >> uint(2)));
    int _903 = int(_899) & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    int _907 = int(_899) + 1;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    int _911 = _907 & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    float _915 = _872 * _814;
    float _917 = _890 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _919 = -_814;
    float _921 = _852 * _919;
    float _923 = fma(_888, _796, _848);
    float _925 = fma(_882, _796, _915);
    float _927 = trunc(_917);
    int _929 = int(_927);
    float _931 = fma(_844, _796, _921);
    int _933 = _874 + 104;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.vp_c15)._m0[int(_937)][_939];
    int _943 = int(_935) + 1;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    int _947 = _943 & 3;
    float _949 = (*spvDescriptorSet0.vp_c15)._m0[int(_945)][_947];
    float _951 = fma(_894, _810, _925);
    float _953 = fma(_868, _810, _931);
    float _955 = fma(_884, _810, _923);
    float _957 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _959 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _961 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _963 = _874 + 48;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    float _981 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].x, _957);
    float _983 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].x, _959);
    float _985 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _987 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].z, _981);
    int _989 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _991 = _878 + _989;
    int _993 = _991 + 1;
    float _995 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].z, _983);
    int _997 = _874 + 64;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
    int _1003 = int(_999) & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = int(_999) + 1;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    int _1011 = _1007 & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    int _1015 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1017 = _929 + _1015;
    int _1019 = _1017 + 1;
    float _1021 = _987 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1023 = _993 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1025 = _995 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1027 = _993 | _1019;
    float _1029 = _222 + _1021;
    float _1031 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].z, _985);
    int _1033 = _874 + 56;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    uint _1037 = uint(int(uint(int(_1035)) >> uint(2)));
    int _1039 = int(_1035) & 3;
    float _1041 = (*spvDescriptorSet0.vp_c15)._m0[int(_1037)][_1039];
    int _1043 = int(_1035) + 1;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    int _1047 = _1043 & 3;
    float _1049 = (*spvDescriptorSet0.vp_c15)._m0[int(_1045)][_1047];
    bool _1051 = _1027 < 0;
    bool _1053 = _1051 || _1023;
    float _1055 = _220 + _1025;
    float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1059 = _1029 + _1057;
    bool _1061 = _1019 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1063 = _1061 || _1053;
    float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1067 = _1055 + _1065;
    float _1069 = _1059 * _1059;
    int _1071 = _874 + 72;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    uint _1075 = uint(int(uint(int(_1073)) >> uint(2)));
    int _1077 = int(_1073) & 3;
    float _1079 = (*spvDescriptorSet0.vp_c15)._m0[int(_1075)][_1077];
    int _1081 = int(_1073) + 1;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    int _1085 = _1081 & 3;
    float _1087 = (*spvDescriptorSet0.vp_c15)._m0[int(_1083)][_1085];
    float _1089 = fma(_1067, _1067, _1069);
    float _1091 = sqrt(_1089);
    int _1093 = _874 + 80;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    uint _1097 = uint(int(uint(int(_1095)) >> uint(2)));
    int _1099 = int(_1095) & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    int _1103 = int(_1095) + 1;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    int _1107 = _1103 & 3;
    float _1109 = (*spvDescriptorSet0.vp_c15)._m0[int(_1105)][_1107];
    int _1111 = _993;
    float _1113 = _1055;
    float _1115 = _1029;
    float _1117 = as_type<float>(_862);
    if (!_1063)
    {
        int _1119 = _1019 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1121 = _1119 + _993;
        _1111 = _1121;
    }
    int _1123 = _1111;
    float _1125 = _608 * _913;
    float _1127 = fma(_220, _905, _1125);
    float _1129 = _953;
    float _1131 = _913;
    float _1133 = as_type<float>(_1123);
    if (!_1063)
    {
        float _1135 = floor(_838);
        _1129 = _1135;
    }
    float _1137 = _1129;
    float _1139 = fma(_222, _941, _1127);
    int _1141 = as_type<int>(_941);
    if (!_1063)
    {
        int _1143 = _1123 << 2;
        _1141 = _1143;
    }
    int _1145 = _1141;
    float _1147 = _1139 + _949;
    bool _1149 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1151 = _608 * _979;
    float _1153 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1155 = 1.0 / _1147;
    int _1157 = _1145;
    int _1159 = as_type<int>(_1151);
    float _1161 = _1091;
    if (!_1063)
    {
        int _1163 = 12 & _1145;
        _1157 = _1163;
    }
    int _1165 = _1157;
    float _1167 = fma(_220, _971, _1151);
    float _1169 = _282 + _1153;
    float _1171 = _1169;
    if (!_1063)
    {
        uint _1173 = uint(int(uint(_1123) >> uint(2)));
        _1159 = int(_1173);
    }
    int _1175 = _1159;
    float _1177 = _608 * _1013;
    int _1179 = _1175;
    if (!_1063)
    {
        int _1181 = _1175 << 4;
        int _1183 = _1181 + _1165;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = fma(_220, _1005, _1177);
    if (!_1149)
    {
        _1131 = _1169;
    }
    float _1189 = _1131;
    float _1191 = fma(_222, _1041, _1167);
    float _1193 = fma(_222, _1079, _1187);
    float _1195 = _1191 + _1049;
    float _1197 = _1193 + _1087;
    bool _1199 = !_1149;
    float _1201 = _1189;
    if (!_1199)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1207 = _1091 + _1205;
        float _1209 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1211 = rsqrt(_1089);
        float _1213 = _1207 * _1203;
        float _1215 = _1213 * 0.15915493667125701904296875;
        float _1217 = _1215 * 6.283185482025146484375;
        float _1219 = cos(_1217);
        float _1221 = _1215 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = _1219 + (-1.0);
        float _1227 = fma(_1223, _1209, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = _1211 * _1227;
        float _1233 = fma(_1169, _1219, _1229);
        float _1235 = fma(_1067, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1237 = fma(_1059, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1235;
        _1115 = _1237;
        _1201 = _1233;
        _1161 = _1223;
    }
    float _1239 = _1113;
    float _1241 = _1115;
    float _1243 = _1201;
    float _1245 = _1161;
    float _1247 = _1245;
    float _1249 = _1243;
    if (_824)
    {
        _1171 = _1239;
    }
    float _1251 = _1171;
    float _1253 = _1251;
    if (_824)
    {
        _1247 = _1241;
    }
    float _1255 = _1247;
    float _1257 = _1255;
    if (!_824)
    {
        float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1261 = _282 + _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1265 = _220 + _1263;
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1269 = -_222;
        float _1271 = _1269 + _1241;
        float _1273 = _1261 * _1261;
        float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1277 = _222 + _1275;
        float _1279 = fma(_1265, _1265, _1273);
        float _1281 = fma(_1277, _1277, _1279);
        float _1283 = -_282;
        float _1285 = _1283 + _1243;
        float _1287 = sqrt(_1281);
        float _1289 = precise::min(_1287, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1291 = _1289 * _1267;
        float _1293 = -_220;
        float _1295 = _1293 + _1239;
        float _1297 = fma(_1285, _1291, _282);
        float _1299 = fma(_1295, _1291, _220);
        float _1301 = fma(_1271, _1291, _222);
        _1249 = _1297;
        _1253 = _1299;
        _1257 = _1301;
    }
    float _1303 = _1249;
    float _1305 = _1253;
    float _1307 = _1257;
    int _1309 = _874 + 88;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    uint _1313 = uint(int(uint(int(_1311)) >> uint(2)));
    int _1315 = int(_1311) & 3;
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[int(_1313)][_1315];
    int _1319 = int(_1311) + 1;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    int _1323 = _1319 & 3;
    float _1325 = (*spvDescriptorSet0.vp_c15)._m0[int(_1321)][_1323];
    float _1327 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1329 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1331 = _1195 * _1155;
    float _1333 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1335 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1327);
    float _1337 = _1197 * _1155;
    float _1339 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1329);
    float _1341 = _1239;
    if (!_1063)
    {
        int _1343 = _1185 + 400;
        uint _1345 = uint(int(uint(_1343) >> uint(2)));
        uint _1347 = uint(int(uint(int(_1345)) >> uint(2)));
        int _1349 = int(_1345) & 3;
        float _1351 = (*spvDescriptorSet0.vp_c15)._m0[int(_1347)][_1349];
        _1341 = _1351;
    }
    float _1353 = _1341;
    float _1355 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1335);
    float _1357 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1333);
    bool _1359 = _1331 >= 0.0;
    float _1361 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1363 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1365 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1367 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1357);
    bool _1369 = _1331 <= 1.0;
    bool _1371 = _1369 && _1359;
    float _1373 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1361);
    float _1375 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1377 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1379 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1381 = _1337 >= 0.0;
    bool _1383 = _1381 && _1371;
    float _1385 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1373);
    float _1387 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1377);
    float _1389 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1391 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1393 = _1337 <= 1.0;
    bool _1395 = _1393 && _1383;
    float _1397 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1399 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1387);
    float _1401 = _608 * _1109;
    float _1403 = -_1391;
    float _1405 = fma(_1403, _1389, 1.0);
    float _1407 = _1087;
    if (!_1063)
    {
        float _1409 = floor(_917);
        _1407 = _1409;
    }
    float _1411 = _1407;
    float _1413 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1399);
    float _1415 = fma(_220, _1101, _1401);
    float _1417 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1419 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1421 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1417);
    float _1423 = log2(_1405);
    float _1425 = _1419;
    if (_1395)
    {
        float _1427 = float(_862);
        _1117 = _1427;
    }
    float _1429 = _1117;
    float _1431 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1419);
    float _1433 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1421);
    float _1435 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1431);
    float _1437 = 1.0 / _1413;
    float _1439 = fma(_222, _1317, _1415);
    if (!_1063)
    {
        float _1441 = -_1411;
        float _1443 = _917 + _1441;
        _1425 = _1443;
    }
    float _1445 = _1425;
    float _1447 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1433);
    float _1449 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1435);
    float _1451 = _1439 + _1325;
    float _1453 = _1417;
    if (_1395)
    {
        float _1455 = rint(_1429);
        float _1457 = precise::max(_1455, 0.0);
        uint _1459 = uint(_1457);
        uint _1461 = clamp(_1459, 0u, 65535u);
        _1453 = as_type<float>(_1461);
    }
    float _1463 = _1453;
    float _1465 = _1451 * _1155;
    float _1467 = _1423 * 0.693147182464599609375;
    float _1469 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1471 = _1467;
    if (!_1063)
    {
        float _1473 = -_1137;
        float _1475 = _838 + _1473;
        _1471 = _1475;
    }
    float _1477 = _1471;
    float _1479 = _1451;
    if (!_1063)
    {
        float _1481 = rint(_1353);
        float _1483 = precise::max(_1481, 0.0);
        uint _1485 = uint(_1483);
        uint _1487 = clamp(_1485, 0u, 65535u);
        _1479 = as_type<float>(_1487);
    }
    float _1489 = _1479;
    float _1491 = _1447 * _1437;
    float _1493 = _1449 * _1437;
    float _1495 = fma(_1491, 0.5, 0.5);
    float _1497 = fma(_1493, -0.5, 0.5);
    float _1499 = _1337;
    if (_1395)
    {
        float3 _5508 = float3(_1331, _1337, float(as_type<int>(_1463)));
        float3 _5512 = select(_5508, float3(0.0), isnan(_5508));
        float _1501 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5512.xy, uint(rint(_5512.z)), _1465, level(0.0));
        _1499 = _1501;
    }
    float _1503 = _1499;
    float3 _5522 = float3(_1495, _1497, _1469);
    float _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5522, float3(0.0), isnan(_5522)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5522, float3(0.0), isnan(_5522)), level(0.0)).x;
    float3 _5531 = float3(_1495, _1497, _1469);
    float4 _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5531, float3(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5531, float3(0.0), isnan(_5531)), level(0.0)).xyzw;
    float _1510 = _1508.x;
    float _1512 = _1508.y;
    float _1514 = _1508.z;
    float _1516 = _1508.w;
    float _1518 = _1445;
    if (!_1063)
    {
        float3 _5554 = float3(_1477, _1445, float(as_type<int>(_1489)));
        float3 _5556 = select(_5554, float3(0.0), isnan(_5554));
        float _1520 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5556.xy, uint(rint(_5556.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5556.xy, uint(rint(_5556.z)), level(0.0)).x;
        _1518 = _1520;
    }
    float _1522 = _1518;
    float _1524 = float(uint(_420));
    float _1526 = trunc(_526);
    int _1528 = int(_1526);
    int _1530 = abs(_612);
    int _1532 = abs(_620);
    float _1534 = 1.0 / _1524;
    float _1536 = float(uint(_1528));
    int _1538 = as_type<int>(_1534) + (-2);
    float _1540 = as_type<float>(_1538) * _1536;
    float _1542 = trunc(_1540);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    int _1548 = ~_420;
    int _1550 = _1548 + 1;
    int _1552 = _1550 * int(_1546);
    int _1554 = _1552 + _1528;
    float _1556 = float(uint(_1554));
    int _1558 = ~_420;
    int _1560 = _1558 + 1;
    float _1562 = as_type<float>(_1538) * _1556;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1566 = _1564 != 0;
    float _1568 = trunc(_1562);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    float _1574 = float(_114);
    bool _1576 = !_1566;
    float _1578 = _1576 ? 7.345489978790283203125 : 1.0;
    float _1580 = _1578 * _242;
    float _1582 = 1.0 / _1574;
    int _1584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1586 = _1584 != 0;
    int _1588 = int(_1546) + int(_1572);
    float _1590 = floor(_1580);
    float _1592 = float(_1528);
    int _1594 = _1560 * _1588;
    int _1596 = _1594 + _1528;
    bool _1598 = _1592 >= _482;
    bool _1600 = isnan(_1592);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan(_482);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    bool _1610 = uint(_1596) >= uint(_420);
    float _1612 = trunc(_1608);
    int _1614 = int(_1612);
    bool _1616 = !_1610;
    int _1618 = _1616 ? 0 : (-1);
    bool _1620 = _420 == 0;
    float _1622 = -_1590;
    float _1624 = _1580 + _1622;
    int _1626 = ~_1588;
    int _1628 = _1626 + _1618;
    int _1630 = _1628 + 1;
    float _1632 = _1624 * _482;
    float _1634 = _494 * _1582;
    int _1636 = _420 * _1630;
    int _1638 = _1636 + _1528;
    bool _1640 = !_1586;
    int _1642 = _1640 ? 0 : 1;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1646 = _1644 != 0;
    float _1648 = trunc(_1632);
    int _1650 = int(_1648);
    int _1652 = ~_1614;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    bool _1658 = !_1620;
    int _1660 = _1658 ? _1638 : (-1);
    int _1662 = _420 + (-1);
    int _1664 = abs(_1642);
    float _1666 = trunc(_1634);
    int _1668 = int(_1666);
    int _1670 = _1660 * _1656;
    int _1672 = abs(_616);
    int _1674 = _1614 * _1662;
    int _1676 = _1674 + _1670;
    bool _1678 = !_1646;
    int _1680 = _1678 ? 0 : 1;
    int _1682 = _1650 * _1664;
    int _1684 = _1682 + _1528;
    int _1686 = _1676 * _1530;
    int _1688 = abs(_1680);
    float _1690 = as_type<float>(_1588);
    if (_1063)
    {
        _544 = 1.0;
    }
    float _1692 = _544;
    int _1694 = _1668 * _1672;
    int _1696 = _1694 + _1686;
    int _1698 = _1684 * _1532;
    int _1700 = _1698 + _1696;
    int _1702 = _1650 * _1688;
    int _1704 = _1702 + _1700;
    int _1706 = ~_420;
    int _1708 = _1706 + 1;
    float _1710 = float(uint(_1704));
    float _1712 = as_type<float>(_1538) * _1710;
    float _1714 = trunc(_1712);
    float _1716 = precise::max(_1714, 0.0);
    uint _1718 = uint(_1716);
    int _1720 = _1708 * int(_1718);
    int _1722 = _1720 + _1704;
    float _1724 = float(uint(_1722));
    float _1726 = as_type<float>(_1538) * _1724;
    float _1728 = trunc(_1726);
    float _1730 = precise::max(_1728, 0.0);
    uint _1732 = uint(_1730);
    int _1734 = int(_1718) + int(_1732);
    float _1736 = _1692;
    if (!_1063)
    {
        int _1738 = _1123 << 4;
        int _1740 = _1738 + 2048;
        uint _1742 = uint(int(uint(_1740) >> uint(2)));
        uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
        int _1746 = int(_1742) & 3;
        float _1748 = (*spvDescriptorSet0.vp_c15)._m0[int(_1744)][_1746];
        int _1750 = int(_1742) + 1;
        uint _1752 = uint(int(uint(_1750) >> uint(2)));
        int _1754 = _1750 & 3;
        float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
        int _1758 = _1740 + 8;
        uint _1760 = uint(int(uint(_1758) >> uint(2)));
        uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
        int _1764 = int(_1760) & 3;
        float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
        int _1768 = int(_1760) + 1;
        uint _1770 = uint(int(uint(_1768) >> uint(2)));
        int _1772 = _1768 & 3;
        float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
        float _1776 = _608 * _1756;
        float _1778 = fma(_220, _1748, _1776);
        float _1780 = fma(_222, _1766, _1778);
        float _1782 = _1780 + _1774;
        float _1784 = precise::clamp(_1782, 0.0, 1.0);
        float _1786 = -_1784;
        float _1788 = _1786 + _1522;
        float _1790 = fma(_1788, 500.0, 1.5);
        float _1792 = exp2(_1790);
        float _1794 = 0.0 + _1792;
        float _1796 = precise::clamp(_1794, 0.0, 1.0);
        _1133 = as_type<float>(_1740);
        _1736 = _1796;
    }
    float _1798 = _1133;
    float _1800 = _1736;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1804 = _1303 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1808 = _1305 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1812 = _1307 + _1810;
    float _1814 = _1804 * _1804;
    float _1816 = fma(_1808, _1808, _1814);
    float _1818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1820 = fma(_1812, _1812, _1816);
    float _1822 = precise::max(0.0, _1818);
    float _1824 = rsqrt(_1820);
    float _1826 = sqrt(_1820);
    float _1828 = _1808 * _1824;
    float _1830 = _1812 * _1824;
    float _1832 = _1804 * _1824;
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1836 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1838 = -_1832;
    float _1840 = -_1822;
    float _1842 = fma(_1838, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1840);
    float _1844 = _1834 * _1834;
    float _1846 = _1836 * _1836;
    float _1848 = _1844 + _1846;
    float _1850 = sqrt(_1848);
    bool _1852 = _1850 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1856 = _1850 + _1854;
    float _1858 = _1522;
    float _1860 = _1824;
    float _1862 = _1848;
    float _1864 = _1856;
    float _1866 = _1798;
    float _1868 = _1834;
    float _1870 = _1836;
    float _1872 = _1844;
    float _1874 = _1846;
    float _1876 = _1842;
    if (_1852)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1858 = _1878;
    }
    float _1880 = _1858;
    if (_1852)
    {
        float _1882 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1860 = _1882;
    }
    float _1884 = _1860;
    float _1886 = _1884;
    if (_1852)
    {
        float _1888 = rsqrt(_1848);
        _1862 = _1888;
    }
    float _1890 = _1862;
    if (_1852)
    {
        float _1892 = _1856 * _1880;
        _1864 = _1892;
    }
    float _1894 = _1864;
    if (_1852)
    {
        float _1896 = _1894 * 0.15915493667125701904296875;
        _1866 = _1896;
    }
    float _1898 = _1866;
    float _1900 = as_type<float>(_1532);
    if (_1852)
    {
        float _1902 = _1898 * 6.283185482025146484375;
        float _1904 = sin(_1902);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = _1894;
    if (_1852)
    {
        float _1910 = _1898 * 6.283185482025146484375;
        float _1912 = cos(_1910);
        _1908 = _1912;
    }
    float _1914 = _1908;
    float _1916 = _1906;
    if (_1852)
    {
        float _1918 = fma(_1906, _1884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1916 = _1918;
    }
    float _1920 = _1916;
    float _1922 = _1920;
    if (_1852)
    {
        float _1924 = _1890 * _1920;
        _1922 = _1924;
    }
    float _1926 = _1922;
    if (_1852)
    {
        float _1928 = _1914 + (-1.0);
        _1886 = _1928;
    }
    float _1930 = _1886;
    float _1932 = _1930;
    if (_1852)
    {
        float _1934 = _1834 * _1926;
        _1868 = _1934;
    }
    float _1936 = _1868;
    if (_1852)
    {
        float _1938 = _1836 * _1926;
        _1870 = _1938;
    }
    float _1940 = _1870;
    if (_1852)
    {
        float _1942 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1932 = _1942;
    }
    float _1944 = _1932;
    if (_1852)
    {
        float _1946 = _1936 * _1936;
        _1872 = _1946;
    }
    float _1948 = _1872;
    if (_1852)
    {
        float _1950 = _1940 * _1940;
        _1874 = _1950;
    }
    float _1952 = _1874;
    if (_1852)
    {
        float _1954 = fma(_1842, _1914, _1944);
        _1876 = _1954;
    }
    float _1956 = _1876;
    float _1958 = fma(_1956, _1956, _1948);
    float _1960 = _1958 + _1952;
    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1964 = fma(_1826, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1962);
    float _1966 = precise::clamp(_1964, 0.0, 1.0);
    float _1968 = rsqrt(_1960);
    float _1970 = -_1966;
    float _1972 = _1970 + 1.0;
    float _1974 = abs(_1972);
    float _1976 = log2(_1974);
    float _1978 = _1968 * _1936;
    float _1980 = _1968 * _1956;
    float _1982 = _1968 * _1940;
    float _1984 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1986 = -_1984;
    float _1988 = fma(_1980, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1986);
    float _1990 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1992 = -_1982;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1988);
    float _1996 = exp2(_1990);
    float _1998 = fma(_1994, -0.5, 0.5);
    float _2000 = fma(_1994, 0.5, 0.5);
    float _2002 = fma(_2000, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2004 = sqrt(_1998);
    float _2006 = fma(_2000, _2002, -0.212114393711090087890625);
    float _2008 = _1980 + 1.0;
    float _2010 = fma(_2000, _2006, 1.570728778839111328125);
    float _2012 = -_1980;
    float _2014 = fma(_1996, _2008, _2012);
    int _2016 = ~_420;
    int _2018 = _2016 + 1;
    float _2020 = fma(_2014, 0.5, 0.5);
    float _2022 = _2004 * 0.636619746685028076171875;
    float _2024 = -_2010;
    float _2026 = fma(_2022, _2024, 1.0);
    float2 _6286 = float2(_2026, _2020);
    float3 _2030 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6286, float2(0.0), isnan(_6286)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6286, float2(0.0), isnan(_6286)), level(0.0)).xyz;
    float _2032 = _2030.x;
    float _2034 = _2030.y;
    float _2036 = _2030.z;
    float _2038 = float(uint(_1684));
    int _2040 = _2018 * _1734;
    int _2042 = _2040 + _1704;
    float _2044 = abs(_778);
    float _2046 = log2(_2044);
    float _2048 = _894 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2050 = as_type<float>(_1538) * _2038;
    bool _2052 = uint(_2042) >= uint(_420);
    float _2054 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2056 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2058 = -_240;
    float _2060 = _2058 + 1.0;
    bool _2062 = !_2052;
    int _2064 = _2062 ? 0 : (-1);
    float _2066 = trunc(_2050);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    float _2072 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    bool _2074 = _778 <= 8000.0;
    bool _2076 = isnan(_778);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(8000.0);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    out.m_71.x = _1305;
    out.m_71.y = _1303;
    out.m_71.z = _1307;
    int _2086 = ~_1734;
    int _2088 = _2086 + _2064;
    int _2090 = _2088 + 1;
    float _2092 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    int _2094 = ~_420;
    int _2096 = _2094 + 1;
    float _2098 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2100 = exp2(_2054);
    int _2102 = _420 * _2090;
    int _2104 = _2102 + _1704;
    int _2106 = ~_420;
    int _2108 = _2106 + 1;
    float _2110 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2092);
    int _2112 = _2096 * int(_2070);
    int _2114 = _2112 + _1684;
    bool _2116 = !_1620;
    int _2118 = _2116 ? _2104 : (-1);
    out.gl_Position.x = _1447;
    out.gl_Position.y = _1449;
    out.gl_Position.z = _2110;
    out.gl_Position.w = _1413;
    int _2120 = _2118 >> 31;
    float _2122 = float(uint(_2114));
    float _2124 = -_2100;
    float _2126 = _2124 + 1.0;
    int _2128 = _2120 & 3;
    int _2130 = _2118 & 3;
    bool _2132 = _2130 != 0;
    float _2134 = as_type<float>(_1538) * _2122;
    int _2136 = _2118 + _2128;
    bool _2138 = uint(_2130) > 1u;
    float _2140 = trunc(_2134);
    float _2142 = precise::max(_2140, 0.0);
    uint _2144 = uint(_2142);
    int _2146 = _2136 >> 2;
    int _2148 = _2118 & 3;
    bool _2150 = _2148 != 0;
    int _2152 = _2146 << 4;
    int _2154 = _2152 + 368;
    int _2156 = _2150 ? 0 : 1;
    uint _2158 = uint(int(uint(_2154) >> uint(2)));
    uint _2160 = uint(int(uint(int(_2158)) >> uint(2)));
    int _2162 = int(_2158) & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = int(_2158) + 1;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    int _2170 = _2166 & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    bool _2174 = _2130 != 3;
    int _2176 = ~_2156;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    bool _2182 = uint(_2130) >= 2u;
    int _2184 = int(_2070) + int(_2144);
    int _2186 = _2154 + 8;
    uint _2188 = uint(int(uint(_2186) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = _2180;
    float _2206 = _2060;
    if (!_2138)
    {
        int _2208 = ~_2156;
        int _2210 = _2208 + 1;
        _2204 = _2210;
    }
    int _2212 = _2204;
    int _2214 = _2108 * _2184;
    int _2216 = _2214 + _1684;
    int _2218 = _2182 ? 0 : 1;
    float _2220 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2222 = int(_2220);
    int _2224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2226 = _2224 != 0;
    bool _2228 = uint(_2216) >= uint(_420);
    int _2230 = abs(_2212);
    bool _2232 = !_2228;
    int _2234 = _2232 ? 0 : (-1);
    bool _2236 = _2130 != 3;
    int _2238 = ~_2184;
    int _2240 = _2238 + _2234;
    int _2242 = _2240 + 1;
    float _2244 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _2246 = !_2132;
    int _2248 = _2246 ? 0 : 1;
    int _2250 = _420 * _2242;
    int _2252 = _2250 + _1684;
    int _2254 = ~_2218;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    float _2260 = _2244 * _242;
    int _2262 = abs(_2248);
    float _2264 = in.m_73.y;
    int _2266 = ~_2230;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    int _2272 = _2258;
    if (_2174)
    {
        int _2274 = ~_2218;
        int _2276 = _2274 + 1;
        _2272 = _2276;
    }
    int _2278 = _2272;
    float _2280 = trunc(_2260);
    int _2282 = int(_2280);
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2286 = _2284 != 0;
    bool _2288 = !_2236;
    int _2290 = _2288 ? 0 : (-1);
    int _2292 = ~_2262;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    int _2298 = abs(_2278);
    int _2300 = abs(_2290);
    int _2302 = _2270 * as_type<int>(_2172);
    bool _2304 = !_2286;
    int _2306 = _2304 ? 0 : 1;
    int _2308 = ~_2298;
    int _2310 = _2308 + 1;
    int _2312 = _2310 + 1;
    int _2314 = _2296 * as_type<int>(_2164);
    int _2316 = _2314 + _2302;
    int _2318 = abs(_2306);
    int _2320 = _2312 * as_type<int>(_2194);
    int _2322 = _2320 + _2316;
    float _2324 = float(uint(_2222));
    float _2326 = -_2264;
    float _2328 = _2326 + 1.0;
    int _2330 = ~_2300;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = ~_2318;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    int _2342 = _2282 << 4;
    int _2344 = _2342 + 1712;
    int _2346 = _2334 * as_type<int>(_2202);
    int _2348 = _2346 + _2322;
    int _2350 = abs(_2222);
    float _2352 = 1.0 / _2324;
    bool _2354 = !_1620;
    int _2356 = _2354 ? _2252 : (-1);
    int _2358 = _2348 * _2340;
    uint _2360 = uint(int(uint(_2344) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    float _2376 = in.m_73.x;
    int _2378 = _2356 * _2318;
    int _2380 = _2378 + _2358;
    float _2382 = float(uint(_2350));
    int _2384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2386 = _2384 != 0;
    float _2388 = float(uint(_2380));
    int _2390 = _2344 + 8;
    uint _2392 = uint(int(uint(_2390) >> uint(2)));
    uint _2394 = uint(int(uint(int(_2392)) >> uint(2)));
    int _2396 = int(_2392) & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    float _2400 = 1.0 / _2382;
    bool _2402 = _242 > 0.5;
    bool _2404 = _2402 && _2226;
    int _2406 = as_type<int>(_2352) + (-2);
    bool _2408 = _246 > 0.5;
    float _2410 = in.m_75.x;
    float _2412 = in.m_75.y;
    float _2414 = in.m_75.z;
    float _2416 = as_type<float>(_2406) * _2388;
    int _2418 = abs(_2380);
    bool _2420 = _732 != 0.0;
    bool _2422 = isnan(_732);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan(0.0);
    bool _2428 = _2424 || _2426;
    float _2430 = float(uint(_2418));
    float _2432 = trunc(_2416);
    float _2434 = precise::max(_2432, 0.0);
    uint _2436 = uint(_2434);
    bool _2438 = _730 == 0.0;
    bool _2440 = !_2428;
    bool _2442 = _2438 && _2440;
    int _2444 = as_type<int>(_2400) + (-2);
    float _2446 = _2430;
    float _2448 = _2264;
    if (_2226)
    {
        _1690 = _2376;
    }
    float _2450 = _1690;
    bool _2452 = _734 == 0.0;
    bool _2454 = _2452 && _2442;
    float _2456 = as_type<float>(_2444) * _2430;
    float _2458 = _2450;
    if (!_2226)
    {
        _2446 = _2376;
    }
    float _2460 = _2446;
    float _2462 = _2460;
    if (_2404)
    {
        float _2464 = -_2450;
        float _2466 = _2464 + 1.0;
        _2458 = _2466;
    }
    float _2468 = _2458;
    int _2470 = ~_2222;
    int _2472 = _2470 + 1;
    if (_2386)
    {
        float _2474 = _2408 ? _2328 : _2264;
        _2448 = _2474;
    }
    float _2476 = _2448;
    float _2478 = trunc(_2456);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    if (_2226)
    {
        _2462 = _2468;
    }
    float _2484 = _2462;
    int _2486 = _2472 * int(_2436);
    int _2488 = _2486 + _2380;
    int _2490 = ~_2350;
    int _2492 = _2490 + 1;
    float _2494 = _2410;
    float _2496 = _2414;
    float _2498 = _2412;
    if (!_2454)
    {
        float _2500 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2410);
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = float(uint(_2488));
    float _2506 = exp2(_2098);
    if (!_2454)
    {
        float _2508 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2414);
        _2496 = _2508;
    }
    float _2510 = _2496;
    float _2512 = _872 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2514 = _872 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2516 = as_type<float>(_2406) * _2504;
    if (!_2454)
    {
        float _2518 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2412);
        _2498 = _2518;
    }
    float _2520 = _2498;
    float _2522 = _2366 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2524 = _2492 * int(_2482);
    int _2526 = _2524 + _2418;
    float _2528 = _2374 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2530 = trunc(_2516);
    float _2532 = precise::max(_2530, 0.0);
    uint _2534 = uint(_2532);
    float _2536 = _2398 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2540 = float(uint(_2526));
    float _2542 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2544 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2546 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2548 = -_852;
    float _2550 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2514);
    float _2552 = as_type<float>(_2444) * _2540;
    float _2554 = _872 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2556 = -_852;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2512);
    out.m_77.x = _2542;
    out.m_77.y = _2544;
    out.m_77.z = _2546;
    out.m_77.w = _2538;
    float _2560 = trunc(_2552);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = -_852;
    float _2568 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2554);
    float _2570 = fma(_2506, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2572 = precise::clamp(_2570, 0.0, 1.0);
    float _2574 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2558);
    float _2576 = _882 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2578 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2568);
    float _2580 = _894 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2582 = int(_2436) + int(_2534);
    float _2584 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2576);
    float _2586 = _894 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2588 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2048);
    float _2590 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2584);
    float _2592 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2550);
    float _2594 = _882 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2596 = _882 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2598 = ~_2222;
    int _2600 = _2598 + 1;
    float _2602 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2586);
    int _2604 = int(_2482) + int(_2564);
    float _2606 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2594);
    int _2608 = ~_2350;
    int _2610 = _2608 + 1;
    float _2612 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2596);
    float _2614 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2580);
    float _2616 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2606);
    int _2618 = _2610 * _2604;
    int _2620 = _2618 + _2418;
    float _2622 = _2578 * _2520;
    int _2624 = _2600 * _2582;
    int _2626 = _2624 + _2380;
    int _2628 = _2380 ^ _2222;
    float _2630 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2612);
    bool _2632 = uint(_2620) >= uint(_2350);
    float _2634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2636 = uint(_2626) >= uint(_2222);
    float _2638 = _2574 * _2520;
    bool _2640 = !_2632;
    int _2642 = _2640 ? 0 : (-1);
    float _2644 = _2592 * _2520;
    uint _2646 = uint(int(uint(_2628) >> uint(31)));
    float _2648 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2602);
    bool _2650 = !_2636;
    int _2652 = _2650 ? 0 : (-1);
    float _2654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2656 = ~_2642;
    int _2658 = _2604 + _2656;
    int _2660 = _2658 + 1;
    float _2662 = fma(_2616, _2502, _2638);
    int _2664 = ~int(_2646);
    int _2666 = _2664 + 1;
    float _2668 = fma(_2630, _2502, _2622);
    int _2670 = ~_2582;
    int _2672 = _2670 + _2652;
    int _2674 = _2672 + 1;
    float _2676 = fma(_2590, _2502, _2644);
    int _2678 = _2660 ^ _2666;
    float _2680 = fma(_2648, _2510, _2668);
    int _2682 = _2222 * _2674;
    int _2684 = _2682 + _2380;
    bool _2686 = _2222 == 0;
    float _2688 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2614);
    bool _2690 = _2222 == 0;
    float _2692 = fma(_2572, -2.0, 3.0);
    int _2694 = ~_2666;
    int _2696 = _2694 + _2678;
    int _2698 = _2696 + 1;
    float _2700 = _2572 * _2572;
    float _2702 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2588);
    bool _2704 = !_2686;
    int _2706 = _2704 ? _2684 : (-1);
    float _2708 = _2654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2710 = !_2690;
    int _2712 = _2710 ? _2698 : (-1);
    float _2714 = _2700 * _2692;
    float _2716 = float(_2706);
    float _2718 = _2634 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2720 = float(_2712);
    float _2722 = fma(_2708, _2484, -0.5);
    float _2724 = fma(_2688, _2510, _2662);
    float _2726 = fma(_2718, _2476, -0.5);
    float _2728 = fma(_2708, _2716, _530);
    float _2730 = -_486;
    float _2732 = fma(_2718, _2720, _2730);
    float _2734 = fma(_2702, _2510, _2676);
    float _2736 = fma(_496, _2722, _2728);
    float _2738 = fma(_538, _2726, _2732);
    float _2740 = -_2714;
    float _2742 = _2740 + 1.0;
    float _2744 = _2110 + _1413;
    float _2746 = _2736 + 0.5;
    float _2748 = _2738 + 0.5;
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2714);
    float _2752 = _2744 * 0.5;
    out.m_79.x = _2724;
    out.m_79.y = _2680;
    out.m_79.z = _2734;
    float _2754 = _2084 * _2750;
    float _2756 = _2744;
    float _2758 = _2746;
    if (!_1395)
    {
        _2756 = 1.0;
    }
    float _2760 = _2756;
    out.m_81.x = _2746;
    out.m_81.y = _2748;
    float _2762 = _2760;
    if (_1395)
    {
        bool _2764 = _1503 >= _1465;
        bool _2766 = isnan(_1503);
        bool _2768 = _2764 || _2766;
        bool _2770 = isnan(_1465);
        bool _2772 = _2768 || _2770;
        float _2774 = float(_2772);
        _2762 = _2774;
    }
    float _2776 = _2762;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    bool _2778 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2780 = isnan(_1826);
    bool _2782 = _2778 || _2780;
    bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2786 = _2782 || _2784;
    float _2788 = _2776 * _1800;
    out.m_85.z = _2752;
    out.m_85.w = _1413;
    float _2790 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2792 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2794 = _2060 * _2790;
    float _2796 = precise::clamp(_2794, 0.0, 1.0);
    float _2798 = _2792 * _1505;
    float _2800 = -_2792;
    float _2802 = _2800 + 1.0;
    float _2804 = -_2796;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2808 = _1516 * _2798;
    float _2810 = _1516 * _2802;
    float _2812 = _1413;
    float _2814 = _2796;
    float _2816 = _2802;
    if (!_2786)
    {
        _2758 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2818 = _2758;
    float _2820 = -_2788;
    float _2822 = fma(_2820, _2806, 1.0);
    float _2824 = precise::clamp(_2822, 0.0, 1.0);
    float _2826 = _2824;
    float _2828 = _2818;
    float _2830 = _2818;
    if (!_2786)
    {
        _2812 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2832 = _2812;
    float _2834 = _2036 * _2798;
    float _2836 = fma(_2032, _2808, _1510);
    float _2838 = fma(_2034, _2808, _1512);
    float _2840 = _2824 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2842 = fma(_1516, _2834, _1514);
    float _2844 = _2832;
    float _2846 = _2832;
    if (!_2786)
    {
        _2814 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2848 = _2814;
    float _2850 = _2848;
    float _2852 = _2848;
    if (!_2786)
    {
        _2826 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2854 = _2826;
    out.m_87.x = _2840;
    float _2856 = _2854;
    float _2858 = _2854;
    if (!_2786)
    {
        _2816 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2860 = _2816;
    float _2862 = _2860;
    float _2864 = _2860;
    if (!_2786)
    {
        _2206 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2866 = _2206;
    out.m_89.x = _2836;
    out.m_89.y = _2838;
    out.m_89.z = _2842;
    out.m_89.w = _2810;
    bool _2868 = !_2786;
    float _2870 = _2866;
    float _2872 = _2866;
    if (!_2868)
    {
        bool _2874 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2876 = isnan(_1826);
        bool _2878 = _2874 || _2876;
        bool _2880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2882 = _2878 || _2880;
        if (!_2882)
        {
            float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2886 = _1826 + _2884;
            float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2890 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2888;
            float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2896 = 1.0 / _2890;
            float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2900 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2914 = _2886 * _2896;
            float _2916 = precise::clamp(_2914, 0.0, 1.0);
            float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2922 = fma(_2916, _2894, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2924 = fma(_2916, _2920, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2926 = fma(_2916, _2900, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2928 = fma(_2916, _2904, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2930 = fma(_2916, _2908, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2932 = fma(_2916, _2912, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2846 = _2922;
            _2864 = _2930;
            _2830 = _2926;
            _2858 = _2928;
            _2852 = _2924;
            _2872 = _2932;
            _2934 = true;
        }
        else
        {
            bool _2936 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2938 = isnan(_1826);
            bool _2940 = _2936 || _2938;
            bool _2942 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2944 = _2940 || _2942;
            if (!_2944)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2946 = _2828;
            _2830 = _2946;
            if (!_2944)
            {
                _2844 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2948 = _2844;
            _2846 = _2948;
            if (!_2944)
            {
                _2850 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2950 = _2850;
            _2852 = _2950;
            if (!_2944)
            {
                _2856 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2952 = _2856;
            _2858 = _2952;
            if (!_2944)
            {
                _2862 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2954 = _2862;
            _2864 = _2954;
            if (!_2944)
            {
                _2870 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2956 = _2870;
            bool _2958 = !_2944;
            _2872 = _2956;
            if (!_2958)
            {
                bool _2960 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2962 = isnan(_1826);
                bool _2964 = _2960 || _2962;
                bool _2966 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2968 = _2964 || _2966;
                if (!_2968)
                {
                    float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2972 = _1826 + _2970;
                    float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2976 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2974;
                    float _2978 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2982 = 1.0 / _2976;
                    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2994 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3000 = _2972 * _2982;
                    float _3002 = precise::clamp(_3000, 0.0, 1.0);
                    float _3004 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3008 = fma(_3002, _2980, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3010 = fma(_3002, _3006, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3012 = fma(_3002, _2986, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3014 = fma(_3002, _2990, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3016 = fma(_3002, _2994, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3018 = fma(_3002, _2998, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2846 = _3008;
                    _2864 = _3016;
                    _2830 = _3012;
                    _2858 = _3014;
                    _2852 = _3010;
                    _2872 = _3018;
                    _2934 = true;
                }
                else
                {
                    _2846 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2864 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2858 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2852 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2872 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2934 = false;
    float _3020 = _2846;
    float _3022 = _2864;
    float _3024 = _2830;
    float _3026 = _2858;
    float _3028 = _2852;
    float _3030 = _2872;
    float _3032 = fma(_2680, -0.5, 0.5);
    float _3034 = precise::clamp(_3032, 0.0, 1.0);
    float _3036 = -_3020;
    float _3038 = _3036 + _3022;
    float _3040 = -_3024;
    float _3042 = _3040 + _3026;
    float _3044 = -_3028;
    float _3046 = _3044 + _3030;
    bool _3048 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3050 = fma(_3034, _3038, _3020);
    float _3052 = fma(_3034, _3042, _3024);
    float _3054 = fma(_3034, _3046, _3028);
    float _3056 = _3050 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _3058 = fma(_3052, 0.298911988735198974609375, _3056);
    float _3060 = fma(_3054, 0.114477999508380889892578125, _3058);
    out.m_93.x = 0.0;
    float _3062 = -_3060;
    float _3064 = _3052 + _3062;
    float _3066 = -_3060;
    float _3068 = _3050 + _3066;
    float _3070 = -_3060;
    float _3072 = _3054 + _3070;
    float _3074 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3076 = fma(_3064, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3060);
    float _3078 = fma(_3068, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3060);
    float _3080 = fma(_3072, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3060);
    out.m_59.x = _3074;
    out.m_95.x = _3076;
    out.m_95.y = _3078;
    out.m_95.z = _3080;
    if (!_3048)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3082 = -_1303;
    float _3084 = _3082 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3086 = -_1305;
    float _3088 = _3086 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3090 = -_1307;
    float _3092 = _3090 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3094 = _3084 * _3084;
    float _3096 = fma(_3088, _3088, _3094);
    float _3098 = fma(_3092, _3092, _3096);
    float _3100 = rsqrt(_3098);
    float _3102 = sqrt(_3098);
    float _3104 = _3084 * _3100;
    float _3106 = _3088 * _3100;
    float _3108 = _3092 * _3100;
    float _3110 = -_1832;
    float _3112 = _3110 + _3104;
    float _3114 = -_1828;
    float _3116 = _3114 + _3106;
    float _3118 = -_1830;
    float _3120 = _3118 + _3108;
    float _3122 = _3112 * _3112;
    float _3124 = -_3102;
    float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3128 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3130 = precise::clamp(_3128, 0.0, 1.0);
    float _3132 = fma(_3116, _3116, _3122);
    float _3134 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3136 = precise::clamp(_3134, 0.0, 1.0);
    float _3138 = _3130 * _3130;
    float _3140 = fma(_3120, _3120, _3132);
    float _3142 = _3138 + (-1.0);
    float _3144 = abs(_3136);
    float _3146 = log2(_3144);
    float _3148 = rsqrt(_3140);
    float _3150 = _3146 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3152 = exp2(_3150);
    float _3154 = _3112 * _3148;
    float _3156 = _3116 * _3148;
    float _3158 = _3120 * _3148;
    float _3160 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3162 = _2680 * _3154;
    float _3164 = fma(_2724, _3156, _3162);
    float _3166 = fma(_2734, _3158, _3164);
    float _3168 = precise::clamp(_3166, 0.0, 1.0);
    float _3170 = _3168 * _3168;
    float _3172 = fma(_3170, _3142, 1.0);
    float _3174 = -_3104;
    float _3176 = -_3160;
    float _3178 = fma(_3174, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3176);
    float _3180 = _2680 * _3104;
    float _3182 = _3172 * _3172;
    float _3184 = -_3108;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3178);
    float _3188 = fma(_2724, _3106, _3180);
    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3192 = _3186 + _3190;
    float _3194 = 1.0 / _3182;
    float _3196 = fma(_2734, _3108, _3188);
    float _3198 = precise::clamp(_3196, 0.0, 1.0);
    float _3200 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3202 = precise::clamp(_3200, 0.0, 1.0);
    float _3204 = _3152 * _3202;
    float _3206 = _3198 * _3204;
    float _3208 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3210 = _3138 * _3194;
    float _3212 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3214 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3216 = _3206 * _3210;
    out.m_91.x = _3208;
    out.m_91.y = _3212;
    out.m_91.z = _3214;
    float _3218 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3220 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3222 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3218;
    out.m_93.y = _3220;
    out.m_93.z = _3222;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2934 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_56.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_59.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3279 = as_type<float>(_130);
        out.gl_Position.z = _3279;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_61.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_59.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3349 = as_type<float>(_168);
        out.gl_Position.z = _3349;
    }
    if (_160)
    {
        return out;
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_63.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = in.m_56.x;
    float _204 = in.m_56.y;
    float _206 = in.m_56.z;
    float _208 = _204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _210 = _204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _212 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].x, _208);
    float _214 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].x, _210);
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].z, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].z, _214);
    float _220 = _216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _222 = _218 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _224 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _228 = floor(_224);
    float _230 = floor(_226);
    float _232 = -_228;
    float _234 = _224 + _232;
    float _236 = -_230;
    float _238 = _226 + _236;
    float2 _3476 = float2(_234, _238);
    float _240 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3476, float2(0.0), isnan(_3476)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3476, float2(0.0), isnan(_3476)), level(0.0)).x;
    float _242 = in.m_63.x;
    float _244 = _204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _246 = in.m_63.y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _250 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].x, _244);
    float _252 = in.m_63.z;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _258 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _200 + _264;
    float _268 = 1.0 / _256;
    float _270 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].z, _250);
    bool _272 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _280 = _276 || _278;
    float _282 = _270 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _284 = 1.0 / _260;
    float _286 = _282 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _288 = _242 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _290 = _242 * 2.0;
    float _292 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].x, _286);
    float _294 = _246 * 2.0;
    float _296 = -_248;
    float _298 = fma(_288, 2.0, _296);
    float _300 = _246 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _302 = floor(_290);
    float _304 = _252 * 2.0;
    float _306 = _242 + _246;
    float _308 = fma(_300, -2.0, _262);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _200 + _310;
    float _314 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].z, _292);
    float _316 = _306 + (-1.0);
    float _318 = _266 * _284;
    float _320 = floor(_294);
    float _322 = _312 * _268;
    float _324 = _246 + _252;
    float _326 = _242 + _252;
    float _328 = _324 + (-1.0);
    float _330 = floor(_304);
    float _332 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _334 = _326 + (-1.0);
    bool _336 = _302 > 0.0;
    float _338 = _314 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _340 = _302 >= 0.0;
    bool _342 = isnan(_302);
    bool _344 = _340 || _342;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    float _350 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _354 = log2(_352);
    float _356 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _366 = _320 > 0.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _368;
    bool _372 = _330 > 0.0;
    float _374 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _376 = int(_374);
    bool _378 = _330 >= 0.0;
    bool _380 = isnan(_330);
    bool _382 = _378 || _380;
    bool _384 = isnan(0.0);
    bool _386 = _382 || _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    bool _392 = _320 >= 0.0;
    bool _394 = isnan(_320);
    bool _396 = _392 || _394;
    bool _398 = isnan(0.0);
    bool _400 = _396 || _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _354 * _148;
    float _412 = fma(_364, _318, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_404, _318, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_408, _318, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _420 = int(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _424 = 1.0 + _422;
    float _426 = fma(_360, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = fma(_370, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _430 = fma(_390, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _432 = float(_376);
    float _434 = _252 + (-0.5);
    float _436 = exp2(_410);
    float _438 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _440 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_200);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _454 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _456 = isnan(_200);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _468 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = isnan(_200);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = 1.0 / _432;
    float _482 = float(_420);
    float _484 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[78].z, _466);
    float _486 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _308);
    float _488 = -_478;
    float _490 = _488 + 1.0;
    int _492 = _400 ? 0 : 1;
    float _494 = _482 * _148;
    float _496 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _484);
    float _498 = -_436;
    float _500 = _498 + 1.0;
    float _502 = 1.0 / _424;
    float _504 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[78].w, _452);
    int _506 = _348 ? 0 : 1;
    float _508 = _464 * _490;
    float _510 = _280 ? _500 : 0.0;
    float _512 = -_464;
    float _514 = _512 + 1.0;
    bool _516 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _518 = isnan(1.0);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _524 = _520 || _522;
    float _526 = _480 * _148;
    float _528 = -_148;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _298);
    int _532 = ~_506;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _504);
    int _540 = _536;
    int _542 = 2;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_336)
    {
        int _546 = ~_506;
        int _548 = _546 + 1;
        _540 = _548;
    }
    int _550 = _540;
    float _552 = _450 * _514;
    int _554 = _386 ? 0 : 1;
    float _556 = 1.0 / _338;
    float _558 = float(_550);
    float _560 = _426 * _552;
    int _562 = ~_554;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    float _568 = _428 * _552;
    int _570 = _566;
    if (_524)
    {
        float _572 = _510 * _502;
        _150 = _572;
    }
    float _574 = _150;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _578 = _576 != 0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _582 = _580 != 0;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _586 = _584 != 0;
    float _588 = in.m_65.x;
    float _590 = in.m_65.y;
    float _592 = in.m_65.z;
    if (!_372)
    {
        int _594 = ~_554;
        int _596 = _594 + 1;
        _570 = _596;
    }
    int _598 = _570;
    float _600 = _430 * _552;
    int _602 = ~_492;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = _282 + _438;
    bool _610 = !_582;
    int _612 = _610 ? 0 : 1;
    bool _614 = !_578;
    int _616 = _614 ? 0 : 1;
    bool _618 = !_586;
    int _620 = _618 ? 0 : 1;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _632 = _630 != 0;
    float _634 = float(_598);
    int _636 = _606;
    if (!_366)
    {
        int _638 = ~_492;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    bool _644 = !_628;
    int _646 = _644 ? 0 : 1;
    bool _648 = !_624;
    int _650 = _648 ? 0 : 1;
    int _652 = abs(_646);
    int _654 = abs(_650);
    float _656 = _282 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _658 = float(_652);
    bool _660 = !_632;
    int _662 = _660 ? 0 : 1;
    float _664 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].x, _656);
    float _666 = _658 * _558;
    int _668 = abs(_662);
    float _670 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].z, _664);
    float _672 = float(_654);
    float _674 = _666 * (-2.0);
    float _676 = _670 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _678 = float(_642);
    float _680 = _672 * _634;
    float _682 = _246 + (-0.5);
    float _684 = fma(_674, _590, _590);
    float _686 = float(_668);
    float _688 = _676 + _338;
    float _690 = fma(_356, _674, _356);
    float _692 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _694 = _680 * (-2.0);
    float _696 = _686 * _678;
    float _698 = _688 * _556;
    float _700 = _698 * 0.5;
    float _702 = fma(_690, _574, _692);
    float _704 = _242 + (-0.5);
    float _706 = fma(_694, _588, _588);
    float _708 = fma(_332, _694, _332);
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _712 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[30].w, _710);
    float _714 = in.m_67.x;
    float _716 = in.m_67.y;
    float _718 = in.m_67.z;
    float _720 = _702 * 0.15915493667125701904296875;
    float _722 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].x, _706);
    float _724 = -_450;
    float _726 = _724 + 1.0;
    float _728 = _696 * (-2.0);
    float _730 = in.m_69.x;
    float _732 = in.m_69.y;
    float _734 = in.m_69.z;
    float _736 = 1.0 / _712;
    float _738 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _740 = fma(_728, _592, _592);
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _744 = fma(_350, _728, _350);
    float _746 = fma(_412, _508, _738);
    float _748 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[196].z, _740);
    float _750 = fma(_416, _508, _742);
    float _752 = fma(_708, _574, _722);
    float _754 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].y, _568);
    float _756 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].x, _746);
    float _758 = fma(_744, _574, _748);
    float _760 = fma(_414, _508, _754);
    float _762 = _752 * 0.15915493667125701904296875;
    float _764 = _758 * 0.15915493667125701904296875;
    float _766 = _720 * 6.283185482025146484375;
    float _768 = cos(_766);
    float _770 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].y, _760);
    float _772 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].z, _750);
    float _774 = _756 * _714;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _778 = _736 * _776;
    float _780 = _770 * _716;
    float _782 = _772 * _718;
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _730);
    float _786 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _788 = _762 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _794 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _796 = _786 * _784;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _734);
    bool _800 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _732);
    float _804 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _806 = _764 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _792 * _798;
    float _812 = _608 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _814 = _804 * _802;
    bool _816 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _818 = isnan(0.5);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _824 = _820 || _822;
    float _826 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[126].x, _812);
    if (!_794)
    {
        _542 = 1;
    }
    int _828 = _542;
    float _830 = _762 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = _790 * _768;
    float _836 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].z, _826);
    float _838 = _836 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _840 = _720 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _768 * _808;
    float _846 = _790 * _808;
    float _848 = _846 * _814;
    float _850 = _764 * 6.283185482025146484375;
    float _852 = sin(_850);
    float _854 = _832 * _768;
    bool _856 = !_794;
    int _858 = _856 ? 0 : 1;
    int _860 = _828;
    if (!_800)
    {
        _860 = _858;
    }
    int _862 = _860;
    float _864 = _790 * _842;
    float _866 = _832 * _842;
    float _868 = _842 * _808;
    float _870 = _608 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _872 = _832 * _808;
    int _874 = _862 << 6;
    float _876 = trunc(_838);
    int _878 = int(_876);
    float _880 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[127].x, _870);
    float _882 = fma(_852, _854, _864);
    float _884 = fma(_852, _864, _854);
    float _886 = -_866;
    float _888 = fma(_852, _834, _886);
    float _890 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].z, _880);
    float _892 = -_834;
    float _894 = fma(_852, _866, _892);
    int _896 = _874 + 96;
    uint _899 = uint(int(uint(_896) >> uint(2)));
    uint _901 = uint(int(uint(int(_899)) >> uint(2)));
    int _903 = int(_899) & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    int _907 = int(_899) + 1;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    int _911 = _907 & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    float _915 = _872 * _814;
    float _917 = _890 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _919 = -_814;
    float _921 = _852 * _919;
    float _923 = fma(_888, _796, _848);
    float _925 = fma(_882, _796, _915);
    float _927 = trunc(_917);
    int _929 = int(_927);
    float _931 = fma(_844, _796, _921);
    int _933 = _874 + 104;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.vp_c15)._m0[int(_937)][_939];
    int _943 = int(_935) + 1;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    int _947 = _943 & 3;
    float _949 = (*spvDescriptorSet0.vp_c15)._m0[int(_945)][_947];
    float _951 = fma(_894, _810, _925);
    float _953 = fma(_868, _810, _931);
    float _955 = fma(_884, _810, _923);
    float _957 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _959 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _961 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _963 = _874 + 48;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    float _981 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].x, _957);
    float _983 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].x, _959);
    float _985 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _987 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].z, _981);
    int _989 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _991 = _878 + _989;
    int _993 = _991 + 1;
    float _995 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].z, _983);
    int _997 = _874 + 64;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
    int _1003 = int(_999) & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = int(_999) + 1;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    int _1011 = _1007 & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    int _1015 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1017 = _929 + _1015;
    int _1019 = _1017 + 1;
    float _1021 = _987 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1023 = _993 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1025 = _995 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1027 = _993 | _1019;
    float _1029 = _222 + _1021;
    float _1031 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].z, _985);
    int _1033 = _874 + 56;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    uint _1037 = uint(int(uint(int(_1035)) >> uint(2)));
    int _1039 = int(_1035) & 3;
    float _1041 = (*spvDescriptorSet0.vp_c15)._m0[int(_1037)][_1039];
    int _1043 = int(_1035) + 1;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    int _1047 = _1043 & 3;
    float _1049 = (*spvDescriptorSet0.vp_c15)._m0[int(_1045)][_1047];
    bool _1051 = _1027 < 0;
    bool _1053 = _1051 || _1023;
    float _1055 = _220 + _1025;
    float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1059 = _1029 + _1057;
    bool _1061 = _1019 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1063 = _1061 || _1053;
    float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1067 = _1055 + _1065;
    float _1069 = _1059 * _1059;
    int _1071 = _874 + 72;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    uint _1075 = uint(int(uint(int(_1073)) >> uint(2)));
    int _1077 = int(_1073) & 3;
    float _1079 = (*spvDescriptorSet0.vp_c15)._m0[int(_1075)][_1077];
    int _1081 = int(_1073) + 1;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    int _1085 = _1081 & 3;
    float _1087 = (*spvDescriptorSet0.vp_c15)._m0[int(_1083)][_1085];
    float _1089 = fma(_1067, _1067, _1069);
    float _1091 = sqrt(_1089);
    int _1093 = _874 + 80;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    uint _1097 = uint(int(uint(int(_1095)) >> uint(2)));
    int _1099 = int(_1095) & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    int _1103 = int(_1095) + 1;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    int _1107 = _1103 & 3;
    float _1109 = (*spvDescriptorSet0.vp_c15)._m0[int(_1105)][_1107];
    int _1111 = _993;
    float _1113 = _1055;
    float _1115 = _1029;
    float _1117 = as_type<float>(_862);
    if (!_1063)
    {
        int _1119 = _1019 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1121 = _1119 + _993;
        _1111 = _1121;
    }
    int _1123 = _1111;
    float _1125 = _608 * _913;
    float _1127 = fma(_220, _905, _1125);
    float _1129 = _953;
    float _1131 = _913;
    float _1133 = as_type<float>(_1123);
    if (!_1063)
    {
        float _1135 = floor(_838);
        _1129 = _1135;
    }
    float _1137 = _1129;
    float _1139 = fma(_222, _941, _1127);
    int _1141 = as_type<int>(_941);
    if (!_1063)
    {
        int _1143 = _1123 << 2;
        _1141 = _1143;
    }
    int _1145 = _1141;
    float _1147 = _1139 + _949;
    bool _1149 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1151 = _608 * _979;
    float _1153 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1155 = 1.0 / _1147;
    int _1157 = _1145;
    int _1159 = as_type<int>(_1151);
    float _1161 = _1091;
    if (!_1063)
    {
        int _1163 = 12 & _1145;
        _1157 = _1163;
    }
    int _1165 = _1157;
    float _1167 = fma(_220, _971, _1151);
    float _1169 = _282 + _1153;
    float _1171 = _1169;
    if (!_1063)
    {
        uint _1173 = uint(int(uint(_1123) >> uint(2)));
        _1159 = int(_1173);
    }
    int _1175 = _1159;
    float _1177 = _608 * _1013;
    int _1179 = _1175;
    if (!_1063)
    {
        int _1181 = _1175 << 4;
        int _1183 = _1181 + _1165;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = fma(_220, _1005, _1177);
    if (!_1149)
    {
        _1131 = _1169;
    }
    float _1189 = _1131;
    float _1191 = fma(_222, _1041, _1167);
    float _1193 = fma(_222, _1079, _1187);
    float _1195 = _1191 + _1049;
    float _1197 = _1193 + _1087;
    bool _1199 = !_1149;
    float _1201 = _1189;
    if (!_1199)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1207 = _1091 + _1205;
        float _1209 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1211 = rsqrt(_1089);
        float _1213 = _1207 * _1203;
        float _1215 = _1213 * 0.15915493667125701904296875;
        float _1217 = _1215 * 6.283185482025146484375;
        float _1219 = cos(_1217);
        float _1221 = _1215 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = _1219 + (-1.0);
        float _1227 = fma(_1223, _1209, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = _1211 * _1227;
        float _1233 = fma(_1169, _1219, _1229);
        float _1235 = fma(_1067, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1237 = fma(_1059, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1235;
        _1115 = _1237;
        _1201 = _1233;
        _1161 = _1223;
    }
    float _1239 = _1113;
    float _1241 = _1115;
    float _1243 = _1201;
    float _1245 = _1161;
    float _1247 = _1245;
    float _1249 = _1243;
    if (_824)
    {
        _1171 = _1239;
    }
    float _1251 = _1171;
    float _1253 = _1251;
    if (_824)
    {
        _1247 = _1241;
    }
    float _1255 = _1247;
    float _1257 = _1255;
    if (!_824)
    {
        float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1261 = _282 + _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1265 = _220 + _1263;
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1269 = -_222;
        float _1271 = _1269 + _1241;
        float _1273 = _1261 * _1261;
        float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1277 = _222 + _1275;
        float _1279 = fma(_1265, _1265, _1273);
        float _1281 = fma(_1277, _1277, _1279);
        float _1283 = -_282;
        float _1285 = _1283 + _1243;
        float _1287 = sqrt(_1281);
        float _1289 = precise::min(_1287, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1291 = _1289 * _1267;
        float _1293 = -_220;
        float _1295 = _1293 + _1239;
        float _1297 = fma(_1285, _1291, _282);
        float _1299 = fma(_1295, _1291, _220);
        float _1301 = fma(_1271, _1291, _222);
        _1249 = _1297;
        _1253 = _1299;
        _1257 = _1301;
    }
    float _1303 = _1249;
    float _1305 = _1253;
    float _1307 = _1257;
    int _1309 = _874 + 88;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    uint _1313 = uint(int(uint(int(_1311)) >> uint(2)));
    int _1315 = int(_1311) & 3;
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[int(_1313)][_1315];
    int _1319 = int(_1311) + 1;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    int _1323 = _1319 & 3;
    float _1325 = (*spvDescriptorSet0.vp_c15)._m0[int(_1321)][_1323];
    float _1327 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1329 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1331 = _1195 * _1155;
    float _1333 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1335 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1327);
    float _1337 = _1197 * _1155;
    float _1339 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1329);
    float _1341 = _1239;
    if (!_1063)
    {
        int _1343 = _1185 + 400;
        uint _1345 = uint(int(uint(_1343) >> uint(2)));
        uint _1347 = uint(int(uint(int(_1345)) >> uint(2)));
        int _1349 = int(_1345) & 3;
        float _1351 = (*spvDescriptorSet0.vp_c15)._m0[int(_1347)][_1349];
        _1341 = _1351;
    }
    float _1353 = _1341;
    float _1355 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1335);
    float _1357 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1333);
    bool _1359 = _1331 >= 0.0;
    float _1361 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1363 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1365 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1367 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1357);
    bool _1369 = _1331 <= 1.0;
    bool _1371 = _1369 && _1359;
    float _1373 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1361);
    float _1375 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1377 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1379 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1381 = _1337 >= 0.0;
    bool _1383 = _1381 && _1371;
    float _1385 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1373);
    float _1387 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1377);
    float _1389 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1391 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1393 = _1337 <= 1.0;
    bool _1395 = _1393 && _1383;
    float _1397 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1399 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1387);
    float _1401 = _608 * _1109;
    float _1403 = -_1391;
    float _1405 = fma(_1403, _1389, 1.0);
    float _1407 = _1087;
    if (!_1063)
    {
        float _1409 = floor(_917);
        _1407 = _1409;
    }
    float _1411 = _1407;
    float _1413 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1399);
    float _1415 = fma(_220, _1101, _1401);
    float _1417 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1419 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1421 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1417);
    float _1423 = log2(_1405);
    float _1425 = _1419;
    if (_1395)
    {
        float _1427 = float(_862);
        _1117 = _1427;
    }
    float _1429 = _1117;
    float _1431 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1419);
    float _1433 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1421);
    float _1435 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1431);
    float _1437 = 1.0 / _1413;
    float _1439 = fma(_222, _1317, _1415);
    if (!_1063)
    {
        float _1441 = -_1411;
        float _1443 = _917 + _1441;
        _1425 = _1443;
    }
    float _1445 = _1425;
    float _1447 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1433);
    float _1449 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1435);
    float _1451 = _1439 + _1325;
    float _1453 = _1417;
    if (_1395)
    {
        float _1455 = rint(_1429);
        float _1457 = precise::max(_1455, 0.0);
        uint _1459 = uint(_1457);
        uint _1461 = clamp(_1459, 0u, 65535u);
        _1453 = as_type<float>(_1461);
    }
    float _1463 = _1453;
    float _1465 = _1451 * _1155;
    float _1467 = _1423 * 0.693147182464599609375;
    float _1469 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1471 = _1467;
    if (!_1063)
    {
        float _1473 = -_1137;
        float _1475 = _838 + _1473;
        _1471 = _1475;
    }
    float _1477 = _1471;
    float _1479 = _1451;
    if (!_1063)
    {
        float _1481 = rint(_1353);
        float _1483 = precise::max(_1481, 0.0);
        uint _1485 = uint(_1483);
        uint _1487 = clamp(_1485, 0u, 65535u);
        _1479 = as_type<float>(_1487);
    }
    float _1489 = _1479;
    float _1491 = _1447 * _1437;
    float _1493 = _1449 * _1437;
    float _1495 = fma(_1491, 0.5, 0.5);
    float _1497 = fma(_1493, -0.5, 0.5);
    float _1499 = _1337;
    if (_1395)
    {
        float3 _5508 = float3(_1331, _1337, float(as_type<int>(_1463)));
        float3 _5512 = select(_5508, float3(0.0), isnan(_5508));
        float _1501 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5512.xy, uint(rint(_5512.z)), _1465, level(0.0));
        _1499 = _1501;
    }
    float _1503 = _1499;
    float3 _5522 = float3(_1495, _1497, _1469);
    float _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5522, float3(0.0), isnan(_5522)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5522, float3(0.0), isnan(_5522)), level(0.0)).x;
    float3 _5531 = float3(_1495, _1497, _1469);
    float4 _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5531, float3(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5531, float3(0.0), isnan(_5531)), level(0.0)).xyzw;
    float _1510 = _1508.x;
    float _1512 = _1508.y;
    float _1514 = _1508.z;
    float _1516 = _1508.w;
    float _1518 = _1445;
    if (!_1063)
    {
        float3 _5554 = float3(_1477, _1445, float(as_type<int>(_1489)));
        float3 _5556 = select(_5554, float3(0.0), isnan(_5554));
        float _1520 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5556.xy, uint(rint(_5556.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5556.xy, uint(rint(_5556.z)), level(0.0)).x;
        _1518 = _1520;
    }
    float _1522 = _1518;
    float _1524 = float(uint(_420));
    float _1526 = trunc(_526);
    int _1528 = int(_1526);
    int _1530 = abs(_612);
    int _1532 = abs(_620);
    float _1534 = 1.0 / _1524;
    float _1536 = float(uint(_1528));
    int _1538 = as_type<int>(_1534) + (-2);
    float _1540 = as_type<float>(_1538) * _1536;
    float _1542 = trunc(_1540);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    int _1548 = ~_420;
    int _1550 = _1548 + 1;
    int _1552 = _1550 * int(_1546);
    int _1554 = _1552 + _1528;
    float _1556 = float(uint(_1554));
    int _1558 = ~_420;
    int _1560 = _1558 + 1;
    float _1562 = as_type<float>(_1538) * _1556;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1566 = _1564 != 0;
    float _1568 = trunc(_1562);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    float _1574 = float(_114);
    bool _1576 = !_1566;
    float _1578 = _1576 ? 7.345489978790283203125 : 1.0;
    float _1580 = _1578 * _242;
    float _1582 = 1.0 / _1574;
    int _1584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1586 = _1584 != 0;
    int _1588 = int(_1546) + int(_1572);
    float _1590 = floor(_1580);
    float _1592 = float(_1528);
    int _1594 = _1560 * _1588;
    int _1596 = _1594 + _1528;
    bool _1598 = _1592 >= _482;
    bool _1600 = isnan(_1592);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan(_482);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    bool _1610 = uint(_1596) >= uint(_420);
    float _1612 = trunc(_1608);
    int _1614 = int(_1612);
    bool _1616 = !_1610;
    int _1618 = _1616 ? 0 : (-1);
    bool _1620 = _420 == 0;
    float _1622 = -_1590;
    float _1624 = _1580 + _1622;
    int _1626 = ~_1588;
    int _1628 = _1626 + _1618;
    int _1630 = _1628 + 1;
    float _1632 = _1624 * _482;
    float _1634 = _494 * _1582;
    int _1636 = _420 * _1630;
    int _1638 = _1636 + _1528;
    bool _1640 = !_1586;
    int _1642 = _1640 ? 0 : 1;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1646 = _1644 != 0;
    float _1648 = trunc(_1632);
    int _1650 = int(_1648);
    int _1652 = ~_1614;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    bool _1658 = !_1620;
    int _1660 = _1658 ? _1638 : (-1);
    int _1662 = _420 + (-1);
    int _1664 = abs(_1642);
    float _1666 = trunc(_1634);
    int _1668 = int(_1666);
    int _1670 = _1660 * _1656;
    int _1672 = abs(_616);
    int _1674 = _1614 * _1662;
    int _1676 = _1674 + _1670;
    bool _1678 = !_1646;
    int _1680 = _1678 ? 0 : 1;
    int _1682 = _1650 * _1664;
    int _1684 = _1682 + _1528;
    int _1686 = _1676 * _1530;
    int _1688 = abs(_1680);
    float _1690 = as_type<float>(_1588);
    if (_1063)
    {
        _544 = 1.0;
    }
    float _1692 = _544;
    int _1694 = _1668 * _1672;
    int _1696 = _1694 + _1686;
    int _1698 = _1684 * _1532;
    int _1700 = _1698 + _1696;
    int _1702 = _1650 * _1688;
    int _1704 = _1702 + _1700;
    int _1706 = ~_420;
    int _1708 = _1706 + 1;
    float _1710 = float(uint(_1704));
    float _1712 = as_type<float>(_1538) * _1710;
    float _1714 = trunc(_1712);
    float _1716 = precise::max(_1714, 0.0);
    uint _1718 = uint(_1716);
    int _1720 = _1708 * int(_1718);
    int _1722 = _1720 + _1704;
    float _1724 = float(uint(_1722));
    float _1726 = as_type<float>(_1538) * _1724;
    float _1728 = trunc(_1726);
    float _1730 = precise::max(_1728, 0.0);
    uint _1732 = uint(_1730);
    int _1734 = int(_1718) + int(_1732);
    float _1736 = _1692;
    if (!_1063)
    {
        int _1738 = _1123 << 4;
        int _1740 = _1738 + 2048;
        uint _1742 = uint(int(uint(_1740) >> uint(2)));
        uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
        int _1746 = int(_1742) & 3;
        float _1748 = (*spvDescriptorSet0.vp_c15)._m0[int(_1744)][_1746];
        int _1750 = int(_1742) + 1;
        uint _1752 = uint(int(uint(_1750) >> uint(2)));
        int _1754 = _1750 & 3;
        float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
        int _1758 = _1740 + 8;
        uint _1760 = uint(int(uint(_1758) >> uint(2)));
        uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
        int _1764 = int(_1760) & 3;
        float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
        int _1768 = int(_1760) + 1;
        uint _1770 = uint(int(uint(_1768) >> uint(2)));
        int _1772 = _1768 & 3;
        float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
        float _1776 = _608 * _1756;
        float _1778 = fma(_220, _1748, _1776);
        float _1780 = fma(_222, _1766, _1778);
        float _1782 = _1780 + _1774;
        float _1784 = precise::clamp(_1782, 0.0, 1.0);
        float _1786 = -_1784;
        float _1788 = _1786 + _1522;
        float _1790 = fma(_1788, 500.0, 1.5);
        float _1792 = exp2(_1790);
        float _1794 = 0.0 + _1792;
        float _1796 = precise::clamp(_1794, 0.0, 1.0);
        _1133 = as_type<float>(_1740);
        _1736 = _1796;
    }
    float _1798 = _1133;
    float _1800 = _1736;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1804 = _1303 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1808 = _1305 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1812 = _1307 + _1810;
    float _1814 = _1804 * _1804;
    float _1816 = fma(_1808, _1808, _1814);
    float _1818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1820 = fma(_1812, _1812, _1816);
    float _1822 = precise::max(0.0, _1818);
    float _1824 = rsqrt(_1820);
    float _1826 = sqrt(_1820);
    float _1828 = _1808 * _1824;
    float _1830 = _1812 * _1824;
    float _1832 = _1804 * _1824;
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1836 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1838 = -_1832;
    float _1840 = -_1822;
    float _1842 = fma(_1838, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1840);
    float _1844 = _1834 * _1834;
    float _1846 = _1836 * _1836;
    float _1848 = _1844 + _1846;
    float _1850 = sqrt(_1848);
    bool _1852 = _1850 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1856 = _1850 + _1854;
    float _1858 = _1522;
    float _1860 = _1824;
    float _1862 = _1848;
    float _1864 = _1856;
    float _1866 = _1798;
    float _1868 = _1834;
    float _1870 = _1836;
    float _1872 = _1844;
    float _1874 = _1846;
    float _1876 = _1842;
    if (_1852)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1858 = _1878;
    }
    float _1880 = _1858;
    if (_1852)
    {
        float _1882 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1860 = _1882;
    }
    float _1884 = _1860;
    float _1886 = _1884;
    if (_1852)
    {
        float _1888 = rsqrt(_1848);
        _1862 = _1888;
    }
    float _1890 = _1862;
    if (_1852)
    {
        float _1892 = _1856 * _1880;
        _1864 = _1892;
    }
    float _1894 = _1864;
    if (_1852)
    {
        float _1896 = _1894 * 0.15915493667125701904296875;
        _1866 = _1896;
    }
    float _1898 = _1866;
    float _1900 = as_type<float>(_1532);
    if (_1852)
    {
        float _1902 = _1898 * 6.283185482025146484375;
        float _1904 = sin(_1902);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = _1894;
    if (_1852)
    {
        float _1910 = _1898 * 6.283185482025146484375;
        float _1912 = cos(_1910);
        _1908 = _1912;
    }
    float _1914 = _1908;
    float _1916 = _1906;
    if (_1852)
    {
        float _1918 = fma(_1906, _1884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1916 = _1918;
    }
    float _1920 = _1916;
    float _1922 = _1920;
    if (_1852)
    {
        float _1924 = _1890 * _1920;
        _1922 = _1924;
    }
    float _1926 = _1922;
    if (_1852)
    {
        float _1928 = _1914 + (-1.0);
        _1886 = _1928;
    }
    float _1930 = _1886;
    float _1932 = _1930;
    if (_1852)
    {
        float _1934 = _1834 * _1926;
        _1868 = _1934;
    }
    float _1936 = _1868;
    if (_1852)
    {
        float _1938 = _1836 * _1926;
        _1870 = _1938;
    }
    float _1940 = _1870;
    if (_1852)
    {
        float _1942 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1932 = _1942;
    }
    float _1944 = _1932;
    if (_1852)
    {
        float _1946 = _1936 * _1936;
        _1872 = _1946;
    }
    float _1948 = _1872;
    if (_1852)
    {
        float _1950 = _1940 * _1940;
        _1874 = _1950;
    }
    float _1952 = _1874;
    if (_1852)
    {
        float _1954 = fma(_1842, _1914, _1944);
        _1876 = _1954;
    }
    float _1956 = _1876;
    float _1958 = fma(_1956, _1956, _1948);
    float _1960 = _1958 + _1952;
    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1964 = fma(_1826, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1962);
    float _1966 = precise::clamp(_1964, 0.0, 1.0);
    float _1968 = rsqrt(_1960);
    float _1970 = -_1966;
    float _1972 = _1970 + 1.0;
    float _1974 = abs(_1972);
    float _1976 = log2(_1974);
    float _1978 = _1968 * _1936;
    float _1980 = _1968 * _1956;
    float _1982 = _1968 * _1940;
    float _1984 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1986 = -_1984;
    float _1988 = fma(_1980, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1986);
    float _1990 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1992 = -_1982;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1988);
    float _1996 = exp2(_1990);
    float _1998 = fma(_1994, -0.5, 0.5);
    float _2000 = fma(_1994, 0.5, 0.5);
    float _2002 = fma(_2000, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2004 = sqrt(_1998);
    float _2006 = fma(_2000, _2002, -0.212114393711090087890625);
    float _2008 = _1980 + 1.0;
    float _2010 = fma(_2000, _2006, 1.570728778839111328125);
    float _2012 = -_1980;
    float _2014 = fma(_1996, _2008, _2012);
    int _2016 = ~_420;
    int _2018 = _2016 + 1;
    float _2020 = fma(_2014, 0.5, 0.5);
    float _2022 = _2004 * 0.636619746685028076171875;
    float _2024 = -_2010;
    float _2026 = fma(_2022, _2024, 1.0);
    float2 _6286 = float2(_2026, _2020);
    float3 _2030 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6286, float2(0.0), isnan(_6286)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6286, float2(0.0), isnan(_6286)), level(0.0)).xyz;
    float _2032 = _2030.x;
    float _2034 = _2030.y;
    float _2036 = _2030.z;
    float _2038 = float(uint(_1684));
    int _2040 = _2018 * _1734;
    int _2042 = _2040 + _1704;
    float _2044 = abs(_778);
    float _2046 = log2(_2044);
    float _2048 = _894 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2050 = as_type<float>(_1538) * _2038;
    bool _2052 = uint(_2042) >= uint(_420);
    float _2054 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2056 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2058 = -_240;
    float _2060 = _2058 + 1.0;
    bool _2062 = !_2052;
    int _2064 = _2062 ? 0 : (-1);
    float _2066 = trunc(_2050);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    float _2072 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    bool _2074 = _778 <= 8000.0;
    bool _2076 = isnan(_778);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(8000.0);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    out.m_71.x = _1305;
    out.m_71.y = _1303;
    out.m_71.z = _1307;
    int _2086 = ~_1734;
    int _2088 = _2086 + _2064;
    int _2090 = _2088 + 1;
    float _2092 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    int _2094 = ~_420;
    int _2096 = _2094 + 1;
    float _2098 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2100 = exp2(_2054);
    int _2102 = _420 * _2090;
    int _2104 = _2102 + _1704;
    int _2106 = ~_420;
    int _2108 = _2106 + 1;
    float _2110 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2092);
    int _2112 = _2096 * int(_2070);
    int _2114 = _2112 + _1684;
    bool _2116 = !_1620;
    int _2118 = _2116 ? _2104 : (-1);
    out.gl_Position.x = _1447;
    out.gl_Position.y = _1449;
    out.gl_Position.z = _2110;
    out.gl_Position.w = _1413;
    int _2120 = _2118 >> 31;
    float _2122 = float(uint(_2114));
    float _2124 = -_2100;
    float _2126 = _2124 + 1.0;
    int _2128 = _2120 & 3;
    int _2130 = _2118 & 3;
    bool _2132 = _2130 != 0;
    float _2134 = as_type<float>(_1538) * _2122;
    int _2136 = _2118 + _2128;
    bool _2138 = uint(_2130) > 1u;
    float _2140 = trunc(_2134);
    float _2142 = precise::max(_2140, 0.0);
    uint _2144 = uint(_2142);
    int _2146 = _2136 >> 2;
    int _2148 = _2118 & 3;
    bool _2150 = _2148 != 0;
    int _2152 = _2146 << 4;
    int _2154 = _2152 + 368;
    int _2156 = _2150 ? 0 : 1;
    uint _2158 = uint(int(uint(_2154) >> uint(2)));
    uint _2160 = uint(int(uint(int(_2158)) >> uint(2)));
    int _2162 = int(_2158) & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = int(_2158) + 1;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    int _2170 = _2166 & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    bool _2174 = _2130 != 3;
    int _2176 = ~_2156;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    bool _2182 = uint(_2130) >= 2u;
    int _2184 = int(_2070) + int(_2144);
    int _2186 = _2154 + 8;
    uint _2188 = uint(int(uint(_2186) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = _2180;
    float _2206 = _2060;
    if (!_2138)
    {
        int _2208 = ~_2156;
        int _2210 = _2208 + 1;
        _2204 = _2210;
    }
    int _2212 = _2204;
    int _2214 = _2108 * _2184;
    int _2216 = _2214 + _1684;
    int _2218 = _2182 ? 0 : 1;
    float _2220 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2222 = int(_2220);
    int _2224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2226 = _2224 != 0;
    bool _2228 = uint(_2216) >= uint(_420);
    int _2230 = abs(_2212);
    bool _2232 = !_2228;
    int _2234 = _2232 ? 0 : (-1);
    bool _2236 = _2130 != 3;
    int _2238 = ~_2184;
    int _2240 = _2238 + _2234;
    int _2242 = _2240 + 1;
    float _2244 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _2246 = !_2132;
    int _2248 = _2246 ? 0 : 1;
    int _2250 = _420 * _2242;
    int _2252 = _2250 + _1684;
    int _2254 = ~_2218;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    float _2260 = _2244 * _242;
    int _2262 = abs(_2248);
    float _2264 = in.m_73.y;
    int _2266 = ~_2230;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    int _2272 = _2258;
    if (_2174)
    {
        int _2274 = ~_2218;
        int _2276 = _2274 + 1;
        _2272 = _2276;
    }
    int _2278 = _2272;
    float _2280 = trunc(_2260);
    int _2282 = int(_2280);
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2286 = _2284 != 0;
    bool _2288 = !_2236;
    int _2290 = _2288 ? 0 : (-1);
    int _2292 = ~_2262;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    int _2298 = abs(_2278);
    int _2300 = abs(_2290);
    int _2302 = _2270 * as_type<int>(_2172);
    bool _2304 = !_2286;
    int _2306 = _2304 ? 0 : 1;
    int _2308 = ~_2298;
    int _2310 = _2308 + 1;
    int _2312 = _2310 + 1;
    int _2314 = _2296 * as_type<int>(_2164);
    int _2316 = _2314 + _2302;
    int _2318 = abs(_2306);
    int _2320 = _2312 * as_type<int>(_2194);
    int _2322 = _2320 + _2316;
    float _2324 = float(uint(_2222));
    float _2326 = -_2264;
    float _2328 = _2326 + 1.0;
    int _2330 = ~_2300;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = ~_2318;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    int _2342 = _2282 << 4;
    int _2344 = _2342 + 1712;
    int _2346 = _2334 * as_type<int>(_2202);
    int _2348 = _2346 + _2322;
    int _2350 = abs(_2222);
    float _2352 = 1.0 / _2324;
    bool _2354 = !_1620;
    int _2356 = _2354 ? _2252 : (-1);
    int _2358 = _2348 * _2340;
    uint _2360 = uint(int(uint(_2344) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    float _2376 = in.m_73.x;
    int _2378 = _2356 * _2318;
    int _2380 = _2378 + _2358;
    float _2382 = float(uint(_2350));
    int _2384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2386 = _2384 != 0;
    float _2388 = float(uint(_2380));
    int _2390 = _2344 + 8;
    uint _2392 = uint(int(uint(_2390) >> uint(2)));
    uint _2394 = uint(int(uint(int(_2392)) >> uint(2)));
    int _2396 = int(_2392) & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    float _2400 = 1.0 / _2382;
    bool _2402 = _242 > 0.5;
    bool _2404 = _2402 && _2226;
    int _2406 = as_type<int>(_2352) + (-2);
    bool _2408 = _246 > 0.5;
    float _2410 = in.m_75.x;
    float _2412 = in.m_75.y;
    float _2414 = in.m_75.z;
    float _2416 = as_type<float>(_2406) * _2388;
    int _2418 = abs(_2380);
    bool _2420 = _732 != 0.0;
    bool _2422 = isnan(_732);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan(0.0);
    bool _2428 = _2424 || _2426;
    float _2430 = float(uint(_2418));
    float _2432 = trunc(_2416);
    float _2434 = precise::max(_2432, 0.0);
    uint _2436 = uint(_2434);
    bool _2438 = _730 == 0.0;
    bool _2440 = !_2428;
    bool _2442 = _2438 && _2440;
    int _2444 = as_type<int>(_2400) + (-2);
    float _2446 = _2430;
    float _2448 = _2264;
    if (_2226)
    {
        _1690 = _2376;
    }
    float _2450 = _1690;
    bool _2452 = _734 == 0.0;
    bool _2454 = _2452 && _2442;
    float _2456 = as_type<float>(_2444) * _2430;
    float _2458 = _2450;
    if (!_2226)
    {
        _2446 = _2376;
    }
    float _2460 = _2446;
    float _2462 = _2460;
    if (_2404)
    {
        float _2464 = -_2450;
        float _2466 = _2464 + 1.0;
        _2458 = _2466;
    }
    float _2468 = _2458;
    int _2470 = ~_2222;
    int _2472 = _2470 + 1;
    if (_2386)
    {
        float _2474 = _2408 ? _2328 : _2264;
        _2448 = _2474;
    }
    float _2476 = _2448;
    float _2478 = trunc(_2456);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    if (_2226)
    {
        _2462 = _2468;
    }
    float _2484 = _2462;
    int _2486 = _2472 * int(_2436);
    int _2488 = _2486 + _2380;
    int _2490 = ~_2350;
    int _2492 = _2490 + 1;
    float _2494 = _2410;
    float _2496 = _2414;
    float _2498 = _2412;
    if (!_2454)
    {
        float _2500 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2410);
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = float(uint(_2488));
    float _2506 = exp2(_2098);
    if (!_2454)
    {
        float _2508 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2414);
        _2496 = _2508;
    }
    float _2510 = _2496;
    float _2512 = _872 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2514 = _872 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2516 = as_type<float>(_2406) * _2504;
    if (!_2454)
    {
        float _2518 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2412);
        _2498 = _2518;
    }
    float _2520 = _2498;
    float _2522 = _2366 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2524 = _2492 * int(_2482);
    int _2526 = _2524 + _2418;
    float _2528 = _2374 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2530 = trunc(_2516);
    float _2532 = precise::max(_2530, 0.0);
    uint _2534 = uint(_2532);
    float _2536 = _2398 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2540 = float(uint(_2526));
    float _2542 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2544 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2546 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2548 = -_852;
    float _2550 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2514);
    float _2552 = as_type<float>(_2444) * _2540;
    float _2554 = _872 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2556 = -_852;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2512);
    out.m_77.x = _2542;
    out.m_77.y = _2544;
    out.m_77.z = _2546;
    out.m_77.w = _2538;
    float _2560 = trunc(_2552);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = -_852;
    float _2568 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2554);
    float _2570 = fma(_2506, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2572 = precise::clamp(_2570, 0.0, 1.0);
    float _2574 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2558);
    float _2576 = _882 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2578 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2568);
    float _2580 = _894 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2582 = int(_2436) + int(_2534);
    float _2584 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2576);
    float _2586 = _894 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2588 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2048);
    float _2590 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2584);
    float _2592 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2550);
    float _2594 = _882 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2596 = _882 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2598 = ~_2222;
    int _2600 = _2598 + 1;
    float _2602 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2586);
    int _2604 = int(_2482) + int(_2564);
    float _2606 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2594);
    int _2608 = ~_2350;
    int _2610 = _2608 + 1;
    float _2612 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2596);
    float _2614 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2580);
    float _2616 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2606);
    int _2618 = _2610 * _2604;
    int _2620 = _2618 + _2418;
    float _2622 = _2578 * _2520;
    int _2624 = _2600 * _2582;
    int _2626 = _2624 + _2380;
    int _2628 = _2380 ^ _2222;
    float _2630 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2612);
    bool _2632 = uint(_2620) >= uint(_2350);
    float _2634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2636 = uint(_2626) >= uint(_2222);
    float _2638 = _2574 * _2520;
    bool _2640 = !_2632;
    int _2642 = _2640 ? 0 : (-1);
    float _2644 = _2592 * _2520;
    uint _2646 = uint(int(uint(_2628) >> uint(31)));
    float _2648 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2602);
    bool _2650 = !_2636;
    int _2652 = _2650 ? 0 : (-1);
    float _2654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2656 = ~_2642;
    int _2658 = _2604 + _2656;
    int _2660 = _2658 + 1;
    float _2662 = fma(_2616, _2502, _2638);
    int _2664 = ~int(_2646);
    int _2666 = _2664 + 1;
    float _2668 = fma(_2630, _2502, _2622);
    int _2670 = ~_2582;
    int _2672 = _2670 + _2652;
    int _2674 = _2672 + 1;
    float _2676 = fma(_2590, _2502, _2644);
    int _2678 = _2660 ^ _2666;
    float _2680 = fma(_2648, _2510, _2668);
    int _2682 = _2222 * _2674;
    int _2684 = _2682 + _2380;
    bool _2686 = _2222 == 0;
    float _2688 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2614);
    bool _2690 = _2222 == 0;
    float _2692 = fma(_2572, -2.0, 3.0);
    int _2694 = ~_2666;
    int _2696 = _2694 + _2678;
    int _2698 = _2696 + 1;
    float _2700 = _2572 * _2572;
    float _2702 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2588);
    bool _2704 = !_2686;
    int _2706 = _2704 ? _2684 : (-1);
    float _2708 = _2654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2710 = !_2690;
    int _2712 = _2710 ? _2698 : (-1);
    float _2714 = _2700 * _2692;
    float _2716 = float(_2706);
    float _2718 = _2634 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2720 = float(_2712);
    float _2722 = fma(_2708, _2484, -0.5);
    float _2724 = fma(_2688, _2510, _2662);
    float _2726 = fma(_2718, _2476, -0.5);
    float _2728 = fma(_2708, _2716, _530);
    float _2730 = -_486;
    float _2732 = fma(_2718, _2720, _2730);
    float _2734 = fma(_2702, _2510, _2676);
    float _2736 = fma(_496, _2722, _2728);
    float _2738 = fma(_538, _2726, _2732);
    float _2740 = -_2714;
    float _2742 = _2740 + 1.0;
    float _2744 = _2110 + _1413;
    float _2746 = _2736 + 0.5;
    float _2748 = _2738 + 0.5;
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2714);
    float _2752 = _2744 * 0.5;
    out.m_79.x = _2724;
    out.m_79.y = _2680;
    out.m_79.z = _2734;
    float _2754 = _2084 * _2750;
    float _2756 = _2744;
    float _2758 = _2746;
    if (!_1395)
    {
        _2756 = 1.0;
    }
    float _2760 = _2756;
    out.m_81.x = _2746;
    out.m_81.y = _2748;
    float _2762 = _2760;
    if (_1395)
    {
        bool _2764 = _1503 >= _1465;
        bool _2766 = isnan(_1503);
        bool _2768 = _2764 || _2766;
        bool _2770 = isnan(_1465);
        bool _2772 = _2768 || _2770;
        float _2774 = float(_2772);
        _2762 = _2774;
    }
    float _2776 = _2762;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    bool _2778 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2780 = isnan(_1826);
    bool _2782 = _2778 || _2780;
    bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2786 = _2782 || _2784;
    float _2788 = _2776 * _1800;
    out.m_85.z = _2752;
    out.m_85.w = _1413;
    float _2790 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2792 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2794 = _2060 * _2790;
    float _2796 = precise::clamp(_2794, 0.0, 1.0);
    float _2798 = _2792 * _1505;
    float _2800 = -_2792;
    float _2802 = _2800 + 1.0;
    float _2804 = -_2796;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2808 = _1516 * _2798;
    float _2810 = _1516 * _2802;
    float _2812 = _1413;
    float _2814 = _2796;
    float _2816 = _2802;
    if (!_2786)
    {
        _2758 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2818 = _2758;
    float _2820 = -_2788;
    float _2822 = fma(_2820, _2806, 1.0);
    float _2824 = precise::clamp(_2822, 0.0, 1.0);
    float _2826 = _2824;
    float _2828 = _2818;
    float _2830 = _2818;
    if (!_2786)
    {
        _2812 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2832 = _2812;
    float _2834 = _2036 * _2798;
    float _2836 = fma(_2032, _2808, _1510);
    float _2838 = fma(_2034, _2808, _1512);
    float _2840 = _2824 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2842 = fma(_1516, _2834, _1514);
    float _2844 = _2832;
    float _2846 = _2832;
    if (!_2786)
    {
        _2814 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2848 = _2814;
    float _2850 = _2848;
    float _2852 = _2848;
    if (!_2786)
    {
        _2826 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2854 = _2826;
    out.m_87.x = _2840;
    float _2856 = _2854;
    float _2858 = _2854;
    if (!_2786)
    {
        _2816 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2860 = _2816;
    float _2862 = _2860;
    float _2864 = _2860;
    if (!_2786)
    {
        _2206 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2866 = _2206;
    out.m_89.x = _2836;
    out.m_89.y = _2838;
    out.m_89.z = _2842;
    out.m_89.w = _2810;
    bool _2868 = !_2786;
    float _2870 = _2866;
    float _2872 = _2866;
    if (!_2868)
    {
        bool _2874 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2876 = isnan(_1826);
        bool _2878 = _2874 || _2876;
        bool _2880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2882 = _2878 || _2880;
        if (!_2882)
        {
            float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2886 = _1826 + _2884;
            float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2890 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2888;
            float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2896 = 1.0 / _2890;
            float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2900 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2914 = _2886 * _2896;
            float _2916 = precise::clamp(_2914, 0.0, 1.0);
            float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2922 = fma(_2916, _2894, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2924 = fma(_2916, _2920, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2926 = fma(_2916, _2900, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2928 = fma(_2916, _2904, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2930 = fma(_2916, _2908, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2932 = fma(_2916, _2912, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2846 = _2922;
            _2864 = _2930;
            _2830 = _2926;
            _2858 = _2928;
            _2852 = _2924;
            _2872 = _2932;
            _2934 = true;
        }
        else
        {
            bool _2936 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2938 = isnan(_1826);
            bool _2940 = _2936 || _2938;
            bool _2942 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2944 = _2940 || _2942;
            if (!_2944)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2946 = _2828;
            _2830 = _2946;
            if (!_2944)
            {
                _2844 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2948 = _2844;
            _2846 = _2948;
            if (!_2944)
            {
                _2850 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2950 = _2850;
            _2852 = _2950;
            if (!_2944)
            {
                _2856 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2952 = _2856;
            _2858 = _2952;
            if (!_2944)
            {
                _2862 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2954 = _2862;
            _2864 = _2954;
            if (!_2944)
            {
                _2870 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2956 = _2870;
            bool _2958 = !_2944;
            _2872 = _2956;
            if (!_2958)
            {
                bool _2960 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2962 = isnan(_1826);
                bool _2964 = _2960 || _2962;
                bool _2966 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2968 = _2964 || _2966;
                if (!_2968)
                {
                    float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2972 = _1826 + _2970;
                    float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2976 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2974;
                    float _2978 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2982 = 1.0 / _2976;
                    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2994 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3000 = _2972 * _2982;
                    float _3002 = precise::clamp(_3000, 0.0, 1.0);
                    float _3004 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3008 = fma(_3002, _2980, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3010 = fma(_3002, _3006, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3012 = fma(_3002, _2986, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3014 = fma(_3002, _2990, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3016 = fma(_3002, _2994, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3018 = fma(_3002, _2998, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2846 = _3008;
                    _2864 = _3016;
                    _2830 = _3012;
                    _2858 = _3014;
                    _2852 = _3010;
                    _2872 = _3018;
                    _2934 = true;
                }
                else
                {
                    _2846 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2864 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2858 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2852 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2872 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2934 = false;
    float _3020 = _2846;
    float _3022 = _2864;
    float _3024 = _2830;
    float _3026 = _2858;
    float _3028 = _2852;
    float _3030 = _2872;
    float _3032 = fma(_2680, -0.5, 0.5);
    float _3034 = precise::clamp(_3032, 0.0, 1.0);
    float _3036 = -_3020;
    float _3038 = _3036 + _3022;
    float _3040 = -_3024;
    float _3042 = _3040 + _3026;
    float _3044 = -_3028;
    float _3046 = _3044 + _3030;
    bool _3048 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3050 = fma(_3034, _3038, _3020);
    float _3052 = fma(_3034, _3042, _3024);
    float _3054 = fma(_3034, _3046, _3028);
    float _3056 = _3050 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _3058 = fma(_3052, 0.298911988735198974609375, _3056);
    float _3060 = fma(_3054, 0.114477999508380889892578125, _3058);
    out.m_93.x = 0.0;
    float _3062 = -_3060;
    float _3064 = _3052 + _3062;
    float _3066 = -_3060;
    float _3068 = _3050 + _3066;
    float _3070 = -_3060;
    float _3072 = _3054 + _3070;
    float _3074 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3076 = fma(_3064, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3060);
    float _3078 = fma(_3068, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3060);
    float _3080 = fma(_3072, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3060);
    out.m_59.x = _3074;
    out.m_95.x = _3076;
    out.m_95.y = _3078;
    out.m_95.z = _3080;
    if (!_3048)
    {
        return out;
    }
    float _3082 = -_1303;
    float _3084 = _3082 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3086 = -_1305;
    float _3088 = _3086 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3090 = -_1307;
    float _3092 = _3090 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3094 = _3084 * _3084;
    float _3096 = fma(_3088, _3088, _3094);
    float _3098 = fma(_3092, _3092, _3096);
    float _3100 = rsqrt(_3098);
    float _3102 = sqrt(_3098);
    float _3104 = _3084 * _3100;
    float _3106 = _3088 * _3100;
    float _3108 = _3092 * _3100;
    float _3110 = -_1832;
    float _3112 = _3110 + _3104;
    float _3114 = -_1828;
    float _3116 = _3114 + _3106;
    float _3118 = -_1830;
    float _3120 = _3118 + _3108;
    float _3122 = _3112 * _3112;
    float _3124 = -_3102;
    float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3128 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3130 = precise::clamp(_3128, 0.0, 1.0);
    float _3132 = fma(_3116, _3116, _3122);
    float _3134 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3136 = precise::clamp(_3134, 0.0, 1.0);
    float _3138 = _3130 * _3130;
    float _3140 = fma(_3120, _3120, _3132);
    float _3142 = _3138 + (-1.0);
    float _3144 = abs(_3136);
    float _3146 = log2(_3144);
    float _3148 = rsqrt(_3140);
    float _3150 = _3146 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3152 = exp2(_3150);
    float _3154 = _3112 * _3148;
    float _3156 = _3116 * _3148;
    float _3158 = _3120 * _3148;
    float _3160 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3162 = _2680 * _3154;
    float _3164 = fma(_2724, _3156, _3162);
    float _3166 = fma(_2734, _3158, _3164);
    float _3168 = precise::clamp(_3166, 0.0, 1.0);
    float _3170 = _3168 * _3168;
    float _3172 = fma(_3170, _3142, 1.0);
    float _3174 = -_3104;
    float _3176 = -_3160;
    float _3178 = fma(_3174, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3176);
    float _3180 = _2680 * _3104;
    float _3182 = _3172 * _3172;
    float _3184 = -_3108;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3178);
    float _3188 = fma(_2724, _3106, _3180);
    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3192 = _3186 + _3190;
    float _3194 = 1.0 / _3182;
    float _3196 = fma(_2734, _3108, _3188);
    float _3198 = precise::clamp(_3196, 0.0, 1.0);
    float _3200 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3202 = precise::clamp(_3200, 0.0, 1.0);
    float _3204 = _3152 * _3202;
    float _3206 = _3198 * _3204;
    float _3208 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3210 = _3138 * _3194;
    float _3212 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3214 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3216 = _3206 * _3210;
    out.m_91.x = _3208;
    out.m_91.y = _3212;
    out.m_91.z = _3214;
    float _3218 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3220 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3222 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3218;
    out.m_93.y = _3220;
    out.m_93.z = _3222;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2934 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_56.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_59.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3279 = as_type<float>(_130);
        out.gl_Position.z = _3279;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_61.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_59.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3349 = as_type<float>(_168);
        out.gl_Position.z = _3349;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_63.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = in.m_56.x;
    float _204 = in.m_56.y;
    float _206 = in.m_56.z;
    float _208 = _204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _210 = _204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _212 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].x, _208);
    float _214 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].x, _210);
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].z, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].z, _214);
    float _220 = _216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _222 = _218 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _224 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _228 = floor(_224);
    float _230 = floor(_226);
    float _232 = -_228;
    float _234 = _224 + _232;
    float _236 = -_230;
    float _238 = _226 + _236;
    float2 _3476 = float2(_234, _238);
    float _240 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3476, float2(0.0), isnan(_3476)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3476, float2(0.0), isnan(_3476)), level(0.0)).x;
    float _242 = in.m_63.x;
    float _244 = _204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _246 = in.m_63.y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _250 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].x, _244);
    float _252 = in.m_63.z;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _258 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _200 + _264;
    float _268 = 1.0 / _256;
    float _270 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].z, _250);
    bool _272 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _280 = _276 || _278;
    float _282 = _270 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _284 = 1.0 / _260;
    float _286 = _282 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _288 = _242 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _290 = _242 * 2.0;
    float _292 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].x, _286);
    float _294 = _246 * 2.0;
    float _296 = -_248;
    float _298 = fma(_288, 2.0, _296);
    float _300 = _246 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _302 = floor(_290);
    float _304 = _252 * 2.0;
    float _306 = _242 + _246;
    float _308 = fma(_300, -2.0, _262);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _200 + _310;
    float _314 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].z, _292);
    float _316 = _306 + (-1.0);
    float _318 = _266 * _284;
    float _320 = floor(_294);
    float _322 = _312 * _268;
    float _324 = _246 + _252;
    float _326 = _242 + _252;
    float _328 = _324 + (-1.0);
    float _330 = floor(_304);
    float _332 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _334 = _326 + (-1.0);
    bool _336 = _302 > 0.0;
    float _338 = _314 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _340 = _302 >= 0.0;
    bool _342 = isnan(_302);
    bool _344 = _340 || _342;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    float _350 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _354 = log2(_352);
    float _356 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _366 = _320 > 0.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _368;
    bool _372 = _330 > 0.0;
    float _374 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _376 = int(_374);
    bool _378 = _330 >= 0.0;
    bool _380 = isnan(_330);
    bool _382 = _378 || _380;
    bool _384 = isnan(0.0);
    bool _386 = _382 || _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    bool _392 = _320 >= 0.0;
    bool _394 = isnan(_320);
    bool _396 = _392 || _394;
    bool _398 = isnan(0.0);
    bool _400 = _396 || _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _354 * _148;
    float _412 = fma(_364, _318, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_404, _318, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_408, _318, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _420 = int(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _424 = 1.0 + _422;
    float _426 = fma(_360, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = fma(_370, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _430 = fma(_390, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _432 = float(_376);
    float _434 = _252 + (-0.5);
    float _436 = exp2(_410);
    float _438 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _440 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_200);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _454 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _456 = isnan(_200);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _468 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = isnan(_200);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = 1.0 / _432;
    float _482 = float(_420);
    float _484 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[78].z, _466);
    float _486 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _308);
    float _488 = -_478;
    float _490 = _488 + 1.0;
    int _492 = _400 ? 0 : 1;
    float _494 = _482 * _148;
    float _496 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _484);
    float _498 = -_436;
    float _500 = _498 + 1.0;
    float _502 = 1.0 / _424;
    float _504 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[78].w, _452);
    int _506 = _348 ? 0 : 1;
    float _508 = _464 * _490;
    float _510 = _280 ? _500 : 0.0;
    float _512 = -_464;
    float _514 = _512 + 1.0;
    bool _516 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _518 = isnan(1.0);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _524 = _520 || _522;
    float _526 = _480 * _148;
    float _528 = -_148;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _298);
    int _532 = ~_506;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _504);
    int _540 = _536;
    int _542 = 2;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_336)
    {
        int _546 = ~_506;
        int _548 = _546 + 1;
        _540 = _548;
    }
    int _550 = _540;
    float _552 = _450 * _514;
    int _554 = _386 ? 0 : 1;
    float _556 = 1.0 / _338;
    float _558 = float(_550);
    float _560 = _426 * _552;
    int _562 = ~_554;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    float _568 = _428 * _552;
    int _570 = _566;
    if (_524)
    {
        float _572 = _510 * _502;
        _150 = _572;
    }
    float _574 = _150;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _578 = _576 != 0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _582 = _580 != 0;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _586 = _584 != 0;
    float _588 = in.m_65.x;
    float _590 = in.m_65.y;
    float _592 = in.m_65.z;
    if (!_372)
    {
        int _594 = ~_554;
        int _596 = _594 + 1;
        _570 = _596;
    }
    int _598 = _570;
    float _600 = _430 * _552;
    int _602 = ~_492;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = _282 + _438;
    bool _610 = !_582;
    int _612 = _610 ? 0 : 1;
    bool _614 = !_578;
    int _616 = _614 ? 0 : 1;
    bool _618 = !_586;
    int _620 = _618 ? 0 : 1;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _632 = _630 != 0;
    float _634 = float(_598);
    int _636 = _606;
    if (!_366)
    {
        int _638 = ~_492;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    bool _644 = !_628;
    int _646 = _644 ? 0 : 1;
    bool _648 = !_624;
    int _650 = _648 ? 0 : 1;
    int _652 = abs(_646);
    int _654 = abs(_650);
    float _656 = _282 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _658 = float(_652);
    bool _660 = !_632;
    int _662 = _660 ? 0 : 1;
    float _664 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].x, _656);
    float _666 = _658 * _558;
    int _668 = abs(_662);
    float _670 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].z, _664);
    float _672 = float(_654);
    float _674 = _666 * (-2.0);
    float _676 = _670 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _678 = float(_642);
    float _680 = _672 * _634;
    float _682 = _246 + (-0.5);
    float _684 = fma(_674, _590, _590);
    float _686 = float(_668);
    float _688 = _676 + _338;
    float _690 = fma(_356, _674, _356);
    float _692 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _694 = _680 * (-2.0);
    float _696 = _686 * _678;
    float _698 = _688 * _556;
    float _700 = _698 * 0.5;
    float _702 = fma(_690, _574, _692);
    float _704 = _242 + (-0.5);
    float _706 = fma(_694, _588, _588);
    float _708 = fma(_332, _694, _332);
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _712 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[30].w, _710);
    float _714 = in.m_67.x;
    float _716 = in.m_67.y;
    float _718 = in.m_67.z;
    float _720 = _702 * 0.15915493667125701904296875;
    float _722 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].x, _706);
    float _724 = -_450;
    float _726 = _724 + 1.0;
    float _728 = _696 * (-2.0);
    float _730 = in.m_69.x;
    float _732 = in.m_69.y;
    float _734 = in.m_69.z;
    float _736 = 1.0 / _712;
    float _738 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _740 = fma(_728, _592, _592);
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _744 = fma(_350, _728, _350);
    float _746 = fma(_412, _508, _738);
    float _748 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[196].z, _740);
    float _750 = fma(_416, _508, _742);
    float _752 = fma(_708, _574, _722);
    float _754 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].y, _568);
    float _756 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].x, _746);
    float _758 = fma(_744, _574, _748);
    float _760 = fma(_414, _508, _754);
    float _762 = _752 * 0.15915493667125701904296875;
    float _764 = _758 * 0.15915493667125701904296875;
    float _766 = _720 * 6.283185482025146484375;
    float _768 = cos(_766);
    float _770 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].y, _760);
    float _772 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].z, _750);
    float _774 = _756 * _714;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _778 = _736 * _776;
    float _780 = _770 * _716;
    float _782 = _772 * _718;
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _730);
    float _786 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _788 = _762 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _794 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _796 = _786 * _784;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _734);
    bool _800 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _732);
    float _804 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _806 = _764 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _792 * _798;
    float _812 = _608 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _814 = _804 * _802;
    bool _816 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _818 = isnan(0.5);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _824 = _820 || _822;
    float _826 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[126].x, _812);
    if (!_794)
    {
        _542 = 1;
    }
    int _828 = _542;
    float _830 = _762 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = _790 * _768;
    float _836 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].z, _826);
    float _838 = _836 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _840 = _720 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _768 * _808;
    float _846 = _790 * _808;
    float _848 = _846 * _814;
    float _850 = _764 * 6.283185482025146484375;
    float _852 = sin(_850);
    float _854 = _832 * _768;
    bool _856 = !_794;
    int _858 = _856 ? 0 : 1;
    int _860 = _828;
    if (!_800)
    {
        _860 = _858;
    }
    int _862 = _860;
    float _864 = _790 * _842;
    float _866 = _832 * _842;
    float _868 = _842 * _808;
    float _870 = _608 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _872 = _832 * _808;
    int _874 = _862 << 6;
    float _876 = trunc(_838);
    int _878 = int(_876);
    float _880 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[127].x, _870);
    float _882 = fma(_852, _854, _864);
    float _884 = fma(_852, _864, _854);
    float _886 = -_866;
    float _888 = fma(_852, _834, _886);
    float _890 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].z, _880);
    float _892 = -_834;
    float _894 = fma(_852, _866, _892);
    int _896 = _874 + 96;
    uint _899 = uint(int(uint(_896) >> uint(2)));
    uint _901 = uint(int(uint(int(_899)) >> uint(2)));
    int _903 = int(_899) & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    int _907 = int(_899) + 1;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    int _911 = _907 & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    float _915 = _872 * _814;
    float _917 = _890 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _919 = -_814;
    float _921 = _852 * _919;
    float _923 = fma(_888, _796, _848);
    float _925 = fma(_882, _796, _915);
    float _927 = trunc(_917);
    int _929 = int(_927);
    float _931 = fma(_844, _796, _921);
    int _933 = _874 + 104;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.vp_c15)._m0[int(_937)][_939];
    int _943 = int(_935) + 1;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    int _947 = _943 & 3;
    float _949 = (*spvDescriptorSet0.vp_c15)._m0[int(_945)][_947];
    float _951 = fma(_894, _810, _925);
    float _953 = fma(_868, _810, _931);
    float _955 = fma(_884, _810, _923);
    float _957 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _959 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _961 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _963 = _874 + 48;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    float _981 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].x, _957);
    float _983 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].x, _959);
    float _985 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _987 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].z, _981);
    int _989 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _991 = _878 + _989;
    int _993 = _991 + 1;
    float _995 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].z, _983);
    int _997 = _874 + 64;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
    int _1003 = int(_999) & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = int(_999) + 1;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    int _1011 = _1007 & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    int _1015 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1017 = _929 + _1015;
    int _1019 = _1017 + 1;
    float _1021 = _987 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1023 = _993 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1025 = _995 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1027 = _993 | _1019;
    float _1029 = _222 + _1021;
    float _1031 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].z, _985);
    int _1033 = _874 + 56;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    uint _1037 = uint(int(uint(int(_1035)) >> uint(2)));
    int _1039 = int(_1035) & 3;
    float _1041 = (*spvDescriptorSet0.vp_c15)._m0[int(_1037)][_1039];
    int _1043 = int(_1035) + 1;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    int _1047 = _1043 & 3;
    float _1049 = (*spvDescriptorSet0.vp_c15)._m0[int(_1045)][_1047];
    bool _1051 = _1027 < 0;
    bool _1053 = _1051 || _1023;
    float _1055 = _220 + _1025;
    float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1059 = _1029 + _1057;
    bool _1061 = _1019 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1063 = _1061 || _1053;
    float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1067 = _1055 + _1065;
    float _1069 = _1059 * _1059;
    int _1071 = _874 + 72;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    uint _1075 = uint(int(uint(int(_1073)) >> uint(2)));
    int _1077 = int(_1073) & 3;
    float _1079 = (*spvDescriptorSet0.vp_c15)._m0[int(_1075)][_1077];
    int _1081 = int(_1073) + 1;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    int _1085 = _1081 & 3;
    float _1087 = (*spvDescriptorSet0.vp_c15)._m0[int(_1083)][_1085];
    float _1089 = fma(_1067, _1067, _1069);
    float _1091 = sqrt(_1089);
    int _1093 = _874 + 80;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    uint _1097 = uint(int(uint(int(_1095)) >> uint(2)));
    int _1099 = int(_1095) & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    int _1103 = int(_1095) + 1;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    int _1107 = _1103 & 3;
    float _1109 = (*spvDescriptorSet0.vp_c15)._m0[int(_1105)][_1107];
    int _1111 = _993;
    float _1113 = _1055;
    float _1115 = _1029;
    float _1117 = as_type<float>(_862);
    if (!_1063)
    {
        int _1119 = _1019 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1121 = _1119 + _993;
        _1111 = _1121;
    }
    int _1123 = _1111;
    float _1125 = _608 * _913;
    float _1127 = fma(_220, _905, _1125);
    float _1129 = _953;
    float _1131 = _913;
    float _1133 = as_type<float>(_1123);
    if (!_1063)
    {
        float _1135 = floor(_838);
        _1129 = _1135;
    }
    float _1137 = _1129;
    float _1139 = fma(_222, _941, _1127);
    int _1141 = as_type<int>(_941);
    if (!_1063)
    {
        int _1143 = _1123 << 2;
        _1141 = _1143;
    }
    int _1145 = _1141;
    float _1147 = _1139 + _949;
    bool _1149 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1151 = _608 * _979;
    float _1153 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1155 = 1.0 / _1147;
    int _1157 = _1145;
    int _1159 = as_type<int>(_1151);
    float _1161 = _1091;
    if (!_1063)
    {
        int _1163 = 12 & _1145;
        _1157 = _1163;
    }
    int _1165 = _1157;
    float _1167 = fma(_220, _971, _1151);
    float _1169 = _282 + _1153;
    float _1171 = _1169;
    if (!_1063)
    {
        uint _1173 = uint(int(uint(_1123) >> uint(2)));
        _1159 = int(_1173);
    }
    int _1175 = _1159;
    float _1177 = _608 * _1013;
    int _1179 = _1175;
    if (!_1063)
    {
        int _1181 = _1175 << 4;
        int _1183 = _1181 + _1165;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = fma(_220, _1005, _1177);
    if (!_1149)
    {
        _1131 = _1169;
    }
    float _1189 = _1131;
    float _1191 = fma(_222, _1041, _1167);
    float _1193 = fma(_222, _1079, _1187);
    float _1195 = _1191 + _1049;
    float _1197 = _1193 + _1087;
    bool _1199 = !_1149;
    float _1201 = _1189;
    if (!_1199)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1207 = _1091 + _1205;
        float _1209 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1211 = rsqrt(_1089);
        float _1213 = _1207 * _1203;
        float _1215 = _1213 * 0.15915493667125701904296875;
        float _1217 = _1215 * 6.283185482025146484375;
        float _1219 = cos(_1217);
        float _1221 = _1215 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = _1219 + (-1.0);
        float _1227 = fma(_1223, _1209, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = _1211 * _1227;
        float _1233 = fma(_1169, _1219, _1229);
        float _1235 = fma(_1067, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1237 = fma(_1059, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1235;
        _1115 = _1237;
        _1201 = _1233;
        _1161 = _1223;
    }
    float _1239 = _1113;
    float _1241 = _1115;
    float _1243 = _1201;
    float _1245 = _1161;
    float _1247 = _1245;
    float _1249 = _1243;
    if (_824)
    {
        _1171 = _1239;
    }
    float _1251 = _1171;
    float _1253 = _1251;
    if (_824)
    {
        _1247 = _1241;
    }
    float _1255 = _1247;
    float _1257 = _1255;
    if (!_824)
    {
        float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1261 = _282 + _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1265 = _220 + _1263;
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1269 = -_222;
        float _1271 = _1269 + _1241;
        float _1273 = _1261 * _1261;
        float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1277 = _222 + _1275;
        float _1279 = fma(_1265, _1265, _1273);
        float _1281 = fma(_1277, _1277, _1279);
        float _1283 = -_282;
        float _1285 = _1283 + _1243;
        float _1287 = sqrt(_1281);
        float _1289 = precise::min(_1287, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1291 = _1289 * _1267;
        float _1293 = -_220;
        float _1295 = _1293 + _1239;
        float _1297 = fma(_1285, _1291, _282);
        float _1299 = fma(_1295, _1291, _220);
        float _1301 = fma(_1271, _1291, _222);
        _1249 = _1297;
        _1253 = _1299;
        _1257 = _1301;
    }
    float _1303 = _1249;
    float _1305 = _1253;
    float _1307 = _1257;
    int _1309 = _874 + 88;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    uint _1313 = uint(int(uint(int(_1311)) >> uint(2)));
    int _1315 = int(_1311) & 3;
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[int(_1313)][_1315];
    int _1319 = int(_1311) + 1;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    int _1323 = _1319 & 3;
    float _1325 = (*spvDescriptorSet0.vp_c15)._m0[int(_1321)][_1323];
    float _1327 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1329 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1331 = _1195 * _1155;
    float _1333 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1335 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1327);
    float _1337 = _1197 * _1155;
    float _1339 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1329);
    float _1341 = _1239;
    if (!_1063)
    {
        int _1343 = _1185 + 400;
        uint _1345 = uint(int(uint(_1343) >> uint(2)));
        uint _1347 = uint(int(uint(int(_1345)) >> uint(2)));
        int _1349 = int(_1345) & 3;
        float _1351 = (*spvDescriptorSet0.vp_c15)._m0[int(_1347)][_1349];
        _1341 = _1351;
    }
    float _1353 = _1341;
    float _1355 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1335);
    float _1357 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1333);
    bool _1359 = _1331 >= 0.0;
    float _1361 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1363 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1365 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1367 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1357);
    bool _1369 = _1331 <= 1.0;
    bool _1371 = _1369 && _1359;
    float _1373 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1361);
    float _1375 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1377 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1379 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1381 = _1337 >= 0.0;
    bool _1383 = _1381 && _1371;
    float _1385 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1373);
    float _1387 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1377);
    float _1389 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1391 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1393 = _1337 <= 1.0;
    bool _1395 = _1393 && _1383;
    float _1397 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1399 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1387);
    float _1401 = _608 * _1109;
    float _1403 = -_1391;
    float _1405 = fma(_1403, _1389, 1.0);
    float _1407 = _1087;
    if (!_1063)
    {
        float _1409 = floor(_917);
        _1407 = _1409;
    }
    float _1411 = _1407;
    float _1413 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1399);
    float _1415 = fma(_220, _1101, _1401);
    float _1417 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1419 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1421 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1417);
    float _1423 = log2(_1405);
    float _1425 = _1419;
    if (_1395)
    {
        float _1427 = float(_862);
        _1117 = _1427;
    }
    float _1429 = _1117;
    float _1431 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1419);
    float _1433 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1421);
    float _1435 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1431);
    float _1437 = 1.0 / _1413;
    float _1439 = fma(_222, _1317, _1415);
    if (!_1063)
    {
        float _1441 = -_1411;
        float _1443 = _917 + _1441;
        _1425 = _1443;
    }
    float _1445 = _1425;
    float _1447 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1433);
    float _1449 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1435);
    float _1451 = _1439 + _1325;
    float _1453 = _1417;
    if (_1395)
    {
        float _1455 = rint(_1429);
        float _1457 = precise::max(_1455, 0.0);
        uint _1459 = uint(_1457);
        uint _1461 = clamp(_1459, 0u, 65535u);
        _1453 = as_type<float>(_1461);
    }
    float _1463 = _1453;
    float _1465 = _1451 * _1155;
    float _1467 = _1423 * 0.693147182464599609375;
    float _1469 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1471 = _1467;
    if (!_1063)
    {
        float _1473 = -_1137;
        float _1475 = _838 + _1473;
        _1471 = _1475;
    }
    float _1477 = _1471;
    float _1479 = _1451;
    if (!_1063)
    {
        float _1481 = rint(_1353);
        float _1483 = precise::max(_1481, 0.0);
        uint _1485 = uint(_1483);
        uint _1487 = clamp(_1485, 0u, 65535u);
        _1479 = as_type<float>(_1487);
    }
    float _1489 = _1479;
    float _1491 = _1447 * _1437;
    float _1493 = _1449 * _1437;
    float _1495 = fma(_1491, 0.5, 0.5);
    float _1497 = fma(_1493, -0.5, 0.5);
    float _1499 = _1337;
    if (_1395)
    {
        float3 _5508 = float3(_1331, _1337, float(as_type<int>(_1463)));
        float3 _5512 = select(_5508, float3(0.0), isnan(_5508));
        float _1501 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5512.xy, uint(rint(_5512.z)), _1465, level(0.0));
        _1499 = _1501;
    }
    float _1503 = _1499;
    float3 _5522 = float3(_1495, _1497, _1469);
    float _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5522, float3(0.0), isnan(_5522)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5522, float3(0.0), isnan(_5522)), level(0.0)).x;
    float3 _5531 = float3(_1495, _1497, _1469);
    float4 _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5531, float3(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5531, float3(0.0), isnan(_5531)), level(0.0)).xyzw;
    float _1510 = _1508.x;
    float _1512 = _1508.y;
    float _1514 = _1508.z;
    float _1516 = _1508.w;
    float _1518 = _1445;
    if (!_1063)
    {
        float3 _5554 = float3(_1477, _1445, float(as_type<int>(_1489)));
        float3 _5556 = select(_5554, float3(0.0), isnan(_5554));
        float _1520 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5556.xy, uint(rint(_5556.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5556.xy, uint(rint(_5556.z)), level(0.0)).x;
        _1518 = _1520;
    }
    float _1522 = _1518;
    float _1524 = float(uint(_420));
    float _1526 = trunc(_526);
    int _1528 = int(_1526);
    int _1530 = abs(_612);
    int _1532 = abs(_620);
    float _1534 = 1.0 / _1524;
    float _1536 = float(uint(_1528));
    int _1538 = as_type<int>(_1534) + (-2);
    float _1540 = as_type<float>(_1538) * _1536;
    float _1542 = trunc(_1540);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    int _1548 = ~_420;
    int _1550 = _1548 + 1;
    int _1552 = _1550 * int(_1546);
    int _1554 = _1552 + _1528;
    float _1556 = float(uint(_1554));
    int _1558 = ~_420;
    int _1560 = _1558 + 1;
    float _1562 = as_type<float>(_1538) * _1556;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1566 = _1564 != 0;
    float _1568 = trunc(_1562);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    float _1574 = float(_114);
    bool _1576 = !_1566;
    float _1578 = _1576 ? 7.345489978790283203125 : 1.0;
    float _1580 = _1578 * _242;
    float _1582 = 1.0 / _1574;
    int _1584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1586 = _1584 != 0;
    int _1588 = int(_1546) + int(_1572);
    float _1590 = floor(_1580);
    float _1592 = float(_1528);
    int _1594 = _1560 * _1588;
    int _1596 = _1594 + _1528;
    bool _1598 = _1592 >= _482;
    bool _1600 = isnan(_1592);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan(_482);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    bool _1610 = uint(_1596) >= uint(_420);
    float _1612 = trunc(_1608);
    int _1614 = int(_1612);
    bool _1616 = !_1610;
    int _1618 = _1616 ? 0 : (-1);
    bool _1620 = _420 == 0;
    float _1622 = -_1590;
    float _1624 = _1580 + _1622;
    int _1626 = ~_1588;
    int _1628 = _1626 + _1618;
    int _1630 = _1628 + 1;
    float _1632 = _1624 * _482;
    float _1634 = _494 * _1582;
    int _1636 = _420 * _1630;
    int _1638 = _1636 + _1528;
    bool _1640 = !_1586;
    int _1642 = _1640 ? 0 : 1;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1646 = _1644 != 0;
    float _1648 = trunc(_1632);
    int _1650 = int(_1648);
    int _1652 = ~_1614;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    bool _1658 = !_1620;
    int _1660 = _1658 ? _1638 : (-1);
    int _1662 = _420 + (-1);
    int _1664 = abs(_1642);
    float _1666 = trunc(_1634);
    int _1668 = int(_1666);
    int _1670 = _1660 * _1656;
    int _1672 = abs(_616);
    int _1674 = _1614 * _1662;
    int _1676 = _1674 + _1670;
    bool _1678 = !_1646;
    int _1680 = _1678 ? 0 : 1;
    int _1682 = _1650 * _1664;
    int _1684 = _1682 + _1528;
    int _1686 = _1676 * _1530;
    int _1688 = abs(_1680);
    float _1690 = as_type<float>(_1588);
    if (_1063)
    {
        _544 = 1.0;
    }
    float _1692 = _544;
    int _1694 = _1668 * _1672;
    int _1696 = _1694 + _1686;
    int _1698 = _1684 * _1532;
    int _1700 = _1698 + _1696;
    int _1702 = _1650 * _1688;
    int _1704 = _1702 + _1700;
    int _1706 = ~_420;
    int _1708 = _1706 + 1;
    float _1710 = float(uint(_1704));
    float _1712 = as_type<float>(_1538) * _1710;
    float _1714 = trunc(_1712);
    float _1716 = precise::max(_1714, 0.0);
    uint _1718 = uint(_1716);
    int _1720 = _1708 * int(_1718);
    int _1722 = _1720 + _1704;
    float _1724 = float(uint(_1722));
    float _1726 = as_type<float>(_1538) * _1724;
    float _1728 = trunc(_1726);
    float _1730 = precise::max(_1728, 0.0);
    uint _1732 = uint(_1730);
    int _1734 = int(_1718) + int(_1732);
    float _1736 = _1692;
    if (!_1063)
    {
        int _1738 = _1123 << 4;
        int _1740 = _1738 + 2048;
        uint _1742 = uint(int(uint(_1740) >> uint(2)));
        uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
        int _1746 = int(_1742) & 3;
        float _1748 = (*spvDescriptorSet0.vp_c15)._m0[int(_1744)][_1746];
        int _1750 = int(_1742) + 1;
        uint _1752 = uint(int(uint(_1750) >> uint(2)));
        int _1754 = _1750 & 3;
        float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
        int _1758 = _1740 + 8;
        uint _1760 = uint(int(uint(_1758) >> uint(2)));
        uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
        int _1764 = int(_1760) & 3;
        float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
        int _1768 = int(_1760) + 1;
        uint _1770 = uint(int(uint(_1768) >> uint(2)));
        int _1772 = _1768 & 3;
        float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
        float _1776 = _608 * _1756;
        float _1778 = fma(_220, _1748, _1776);
        float _1780 = fma(_222, _1766, _1778);
        float _1782 = _1780 + _1774;
        float _1784 = precise::clamp(_1782, 0.0, 1.0);
        float _1786 = -_1784;
        float _1788 = _1786 + _1522;
        float _1790 = fma(_1788, 500.0, 1.5);
        float _1792 = exp2(_1790);
        float _1794 = 0.0 + _1792;
        float _1796 = precise::clamp(_1794, 0.0, 1.0);
        _1133 = as_type<float>(_1740);
        _1736 = _1796;
    }
    float _1798 = _1133;
    float _1800 = _1736;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1804 = _1303 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1808 = _1305 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1812 = _1307 + _1810;
    float _1814 = _1804 * _1804;
    float _1816 = fma(_1808, _1808, _1814);
    float _1818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1820 = fma(_1812, _1812, _1816);
    float _1822 = precise::max(0.0, _1818);
    float _1824 = rsqrt(_1820);
    float _1826 = sqrt(_1820);
    float _1828 = _1808 * _1824;
    float _1830 = _1812 * _1824;
    float _1832 = _1804 * _1824;
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1836 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1838 = -_1832;
    float _1840 = -_1822;
    float _1842 = fma(_1838, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1840);
    float _1844 = _1834 * _1834;
    float _1846 = _1836 * _1836;
    float _1848 = _1844 + _1846;
    float _1850 = sqrt(_1848);
    bool _1852 = _1850 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1856 = _1850 + _1854;
    float _1858 = _1522;
    float _1860 = _1824;
    float _1862 = _1848;
    float _1864 = _1856;
    float _1866 = _1798;
    float _1868 = _1834;
    float _1870 = _1836;
    float _1872 = _1844;
    float _1874 = _1846;
    float _1876 = _1842;
    if (_1852)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1858 = _1878;
    }
    float _1880 = _1858;
    if (_1852)
    {
        float _1882 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1860 = _1882;
    }
    float _1884 = _1860;
    float _1886 = _1884;
    if (_1852)
    {
        float _1888 = rsqrt(_1848);
        _1862 = _1888;
    }
    float _1890 = _1862;
    if (_1852)
    {
        float _1892 = _1856 * _1880;
        _1864 = _1892;
    }
    float _1894 = _1864;
    if (_1852)
    {
        float _1896 = _1894 * 0.15915493667125701904296875;
        _1866 = _1896;
    }
    float _1898 = _1866;
    float _1900 = as_type<float>(_1532);
    if (_1852)
    {
        float _1902 = _1898 * 6.283185482025146484375;
        float _1904 = sin(_1902);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = _1894;
    if (_1852)
    {
        float _1910 = _1898 * 6.283185482025146484375;
        float _1912 = cos(_1910);
        _1908 = _1912;
    }
    float _1914 = _1908;
    float _1916 = _1906;
    if (_1852)
    {
        float _1918 = fma(_1906, _1884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1916 = _1918;
    }
    float _1920 = _1916;
    float _1922 = _1920;
    if (_1852)
    {
        float _1924 = _1890 * _1920;
        _1922 = _1924;
    }
    float _1926 = _1922;
    if (_1852)
    {
        float _1928 = _1914 + (-1.0);
        _1886 = _1928;
    }
    float _1930 = _1886;
    float _1932 = _1930;
    if (_1852)
    {
        float _1934 = _1834 * _1926;
        _1868 = _1934;
    }
    float _1936 = _1868;
    if (_1852)
    {
        float _1938 = _1836 * _1926;
        _1870 = _1938;
    }
    float _1940 = _1870;
    if (_1852)
    {
        float _1942 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1932 = _1942;
    }
    float _1944 = _1932;
    if (_1852)
    {
        float _1946 = _1936 * _1936;
        _1872 = _1946;
    }
    float _1948 = _1872;
    if (_1852)
    {
        float _1950 = _1940 * _1940;
        _1874 = _1950;
    }
    float _1952 = _1874;
    if (_1852)
    {
        float _1954 = fma(_1842, _1914, _1944);
        _1876 = _1954;
    }
    float _1956 = _1876;
    float _1958 = fma(_1956, _1956, _1948);
    float _1960 = _1958 + _1952;
    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1964 = fma(_1826, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1962);
    float _1966 = precise::clamp(_1964, 0.0, 1.0);
    float _1968 = rsqrt(_1960);
    float _1970 = -_1966;
    float _1972 = _1970 + 1.0;
    float _1974 = abs(_1972);
    float _1976 = log2(_1974);
    float _1978 = _1968 * _1936;
    float _1980 = _1968 * _1956;
    float _1982 = _1968 * _1940;
    float _1984 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1986 = -_1984;
    float _1988 = fma(_1980, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1986);
    float _1990 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1992 = -_1982;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1988);
    float _1996 = exp2(_1990);
    float _1998 = fma(_1994, -0.5, 0.5);
    float _2000 = fma(_1994, 0.5, 0.5);
    float _2002 = fma(_2000, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2004 = sqrt(_1998);
    float _2006 = fma(_2000, _2002, -0.212114393711090087890625);
    float _2008 = _1980 + 1.0;
    float _2010 = fma(_2000, _2006, 1.570728778839111328125);
    float _2012 = -_1980;
    float _2014 = fma(_1996, _2008, _2012);
    int _2016 = ~_420;
    int _2018 = _2016 + 1;
    float _2020 = fma(_2014, 0.5, 0.5);
    float _2022 = _2004 * 0.636619746685028076171875;
    float _2024 = -_2010;
    float _2026 = fma(_2022, _2024, 1.0);
    float2 _6286 = float2(_2026, _2020);
    float3 _2030 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6286, float2(0.0), isnan(_6286)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6286, float2(0.0), isnan(_6286)), level(0.0)).xyz;
    float _2032 = _2030.x;
    float _2034 = _2030.y;
    float _2036 = _2030.z;
    float _2038 = float(uint(_1684));
    int _2040 = _2018 * _1734;
    int _2042 = _2040 + _1704;
    float _2044 = abs(_778);
    float _2046 = log2(_2044);
    float _2048 = _894 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2050 = as_type<float>(_1538) * _2038;
    bool _2052 = uint(_2042) >= uint(_420);
    float _2054 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2056 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2058 = -_240;
    float _2060 = _2058 + 1.0;
    bool _2062 = !_2052;
    int _2064 = _2062 ? 0 : (-1);
    float _2066 = trunc(_2050);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    float _2072 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    bool _2074 = _778 <= 8000.0;
    bool _2076 = isnan(_778);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(8000.0);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    out.m_71.x = _1305;
    out.m_71.y = _1303;
    out.m_71.z = _1307;
    int _2086 = ~_1734;
    int _2088 = _2086 + _2064;
    int _2090 = _2088 + 1;
    float _2092 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    int _2094 = ~_420;
    int _2096 = _2094 + 1;
    float _2098 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2100 = exp2(_2054);
    int _2102 = _420 * _2090;
    int _2104 = _2102 + _1704;
    int _2106 = ~_420;
    int _2108 = _2106 + 1;
    float _2110 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2092);
    int _2112 = _2096 * int(_2070);
    int _2114 = _2112 + _1684;
    bool _2116 = !_1620;
    int _2118 = _2116 ? _2104 : (-1);
    out.gl_Position.x = _1447;
    out.gl_Position.y = _1449;
    out.gl_Position.z = _2110;
    out.gl_Position.w = _1413;
    int _2120 = _2118 >> 31;
    float _2122 = float(uint(_2114));
    float _2124 = -_2100;
    float _2126 = _2124 + 1.0;
    int _2128 = _2120 & 3;
    int _2130 = _2118 & 3;
    bool _2132 = _2130 != 0;
    float _2134 = as_type<float>(_1538) * _2122;
    int _2136 = _2118 + _2128;
    bool _2138 = uint(_2130) > 1u;
    float _2140 = trunc(_2134);
    float _2142 = precise::max(_2140, 0.0);
    uint _2144 = uint(_2142);
    int _2146 = _2136 >> 2;
    int _2148 = _2118 & 3;
    bool _2150 = _2148 != 0;
    int _2152 = _2146 << 4;
    int _2154 = _2152 + 368;
    int _2156 = _2150 ? 0 : 1;
    uint _2158 = uint(int(uint(_2154) >> uint(2)));
    uint _2160 = uint(int(uint(int(_2158)) >> uint(2)));
    int _2162 = int(_2158) & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = int(_2158) + 1;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    int _2170 = _2166 & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    bool _2174 = _2130 != 3;
    int _2176 = ~_2156;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    bool _2182 = uint(_2130) >= 2u;
    int _2184 = int(_2070) + int(_2144);
    int _2186 = _2154 + 8;
    uint _2188 = uint(int(uint(_2186) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = _2180;
    float _2206 = _2060;
    if (!_2138)
    {
        int _2208 = ~_2156;
        int _2210 = _2208 + 1;
        _2204 = _2210;
    }
    int _2212 = _2204;
    int _2214 = _2108 * _2184;
    int _2216 = _2214 + _1684;
    int _2218 = _2182 ? 0 : 1;
    float _2220 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2222 = int(_2220);
    int _2224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2226 = _2224 != 0;
    bool _2228 = uint(_2216) >= uint(_420);
    int _2230 = abs(_2212);
    bool _2232 = !_2228;
    int _2234 = _2232 ? 0 : (-1);
    bool _2236 = _2130 != 3;
    int _2238 = ~_2184;
    int _2240 = _2238 + _2234;
    int _2242 = _2240 + 1;
    float _2244 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _2246 = !_2132;
    int _2248 = _2246 ? 0 : 1;
    int _2250 = _420 * _2242;
    int _2252 = _2250 + _1684;
    int _2254 = ~_2218;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    float _2260 = _2244 * _242;
    int _2262 = abs(_2248);
    float _2264 = in.m_73.y;
    int _2266 = ~_2230;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    int _2272 = _2258;
    if (_2174)
    {
        int _2274 = ~_2218;
        int _2276 = _2274 + 1;
        _2272 = _2276;
    }
    int _2278 = _2272;
    float _2280 = trunc(_2260);
    int _2282 = int(_2280);
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2286 = _2284 != 0;
    bool _2288 = !_2236;
    int _2290 = _2288 ? 0 : (-1);
    int _2292 = ~_2262;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    int _2298 = abs(_2278);
    int _2300 = abs(_2290);
    int _2302 = _2270 * as_type<int>(_2172);
    bool _2304 = !_2286;
    int _2306 = _2304 ? 0 : 1;
    int _2308 = ~_2298;
    int _2310 = _2308 + 1;
    int _2312 = _2310 + 1;
    int _2314 = _2296 * as_type<int>(_2164);
    int _2316 = _2314 + _2302;
    int _2318 = abs(_2306);
    int _2320 = _2312 * as_type<int>(_2194);
    int _2322 = _2320 + _2316;
    float _2324 = float(uint(_2222));
    float _2326 = -_2264;
    float _2328 = _2326 + 1.0;
    int _2330 = ~_2300;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = ~_2318;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    int _2342 = _2282 << 4;
    int _2344 = _2342 + 1712;
    int _2346 = _2334 * as_type<int>(_2202);
    int _2348 = _2346 + _2322;
    int _2350 = abs(_2222);
    float _2352 = 1.0 / _2324;
    bool _2354 = !_1620;
    int _2356 = _2354 ? _2252 : (-1);
    int _2358 = _2348 * _2340;
    uint _2360 = uint(int(uint(_2344) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    float _2376 = in.m_73.x;
    int _2378 = _2356 * _2318;
    int _2380 = _2378 + _2358;
    float _2382 = float(uint(_2350));
    int _2384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2386 = _2384 != 0;
    float _2388 = float(uint(_2380));
    int _2390 = _2344 + 8;
    uint _2392 = uint(int(uint(_2390) >> uint(2)));
    uint _2394 = uint(int(uint(int(_2392)) >> uint(2)));
    int _2396 = int(_2392) & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    float _2400 = 1.0 / _2382;
    bool _2402 = _242 > 0.5;
    bool _2404 = _2402 && _2226;
    int _2406 = as_type<int>(_2352) + (-2);
    bool _2408 = _246 > 0.5;
    float _2410 = in.m_75.x;
    float _2412 = in.m_75.y;
    float _2414 = in.m_75.z;
    float _2416 = as_type<float>(_2406) * _2388;
    int _2418 = abs(_2380);
    bool _2420 = _732 != 0.0;
    bool _2422 = isnan(_732);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan(0.0);
    bool _2428 = _2424 || _2426;
    float _2430 = float(uint(_2418));
    float _2432 = trunc(_2416);
    float _2434 = precise::max(_2432, 0.0);
    uint _2436 = uint(_2434);
    bool _2438 = _730 == 0.0;
    bool _2440 = !_2428;
    bool _2442 = _2438 && _2440;
    int _2444 = as_type<int>(_2400) + (-2);
    float _2446 = _2430;
    float _2448 = _2264;
    if (_2226)
    {
        _1690 = _2376;
    }
    float _2450 = _1690;
    bool _2452 = _734 == 0.0;
    bool _2454 = _2452 && _2442;
    float _2456 = as_type<float>(_2444) * _2430;
    float _2458 = _2450;
    if (!_2226)
    {
        _2446 = _2376;
    }
    float _2460 = _2446;
    float _2462 = _2460;
    if (_2404)
    {
        float _2464 = -_2450;
        float _2466 = _2464 + 1.0;
        _2458 = _2466;
    }
    float _2468 = _2458;
    int _2470 = ~_2222;
    int _2472 = _2470 + 1;
    if (_2386)
    {
        float _2474 = _2408 ? _2328 : _2264;
        _2448 = _2474;
    }
    float _2476 = _2448;
    float _2478 = trunc(_2456);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    if (_2226)
    {
        _2462 = _2468;
    }
    float _2484 = _2462;
    int _2486 = _2472 * int(_2436);
    int _2488 = _2486 + _2380;
    int _2490 = ~_2350;
    int _2492 = _2490 + 1;
    float _2494 = _2410;
    float _2496 = _2414;
    float _2498 = _2412;
    if (!_2454)
    {
        float _2500 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2410);
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = float(uint(_2488));
    float _2506 = exp2(_2098);
    if (!_2454)
    {
        float _2508 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2414);
        _2496 = _2508;
    }
    float _2510 = _2496;
    float _2512 = _872 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2514 = _872 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2516 = as_type<float>(_2406) * _2504;
    if (!_2454)
    {
        float _2518 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2412);
        _2498 = _2518;
    }
    float _2520 = _2498;
    float _2522 = _2366 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2524 = _2492 * int(_2482);
    int _2526 = _2524 + _2418;
    float _2528 = _2374 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2530 = trunc(_2516);
    float _2532 = precise::max(_2530, 0.0);
    uint _2534 = uint(_2532);
    float _2536 = _2398 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2540 = float(uint(_2526));
    float _2542 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2544 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2546 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2548 = -_852;
    float _2550 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2514);
    float _2552 = as_type<float>(_2444) * _2540;
    float _2554 = _872 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2556 = -_852;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2512);
    out.m_77.x = _2542;
    out.m_77.y = _2544;
    out.m_77.z = _2546;
    out.m_77.w = _2538;
    float _2560 = trunc(_2552);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = -_852;
    float _2568 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2554);
    float _2570 = fma(_2506, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2572 = precise::clamp(_2570, 0.0, 1.0);
    float _2574 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2558);
    float _2576 = _882 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2578 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2568);
    float _2580 = _894 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2582 = int(_2436) + int(_2534);
    float _2584 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2576);
    float _2586 = _894 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2588 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2048);
    float _2590 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2584);
    float _2592 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2550);
    float _2594 = _882 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2596 = _882 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2598 = ~_2222;
    int _2600 = _2598 + 1;
    float _2602 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2586);
    int _2604 = int(_2482) + int(_2564);
    float _2606 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2594);
    int _2608 = ~_2350;
    int _2610 = _2608 + 1;
    float _2612 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2596);
    float _2614 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2580);
    float _2616 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2606);
    int _2618 = _2610 * _2604;
    int _2620 = _2618 + _2418;
    float _2622 = _2578 * _2520;
    int _2624 = _2600 * _2582;
    int _2626 = _2624 + _2380;
    int _2628 = _2380 ^ _2222;
    float _2630 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2612);
    bool _2632 = uint(_2620) >= uint(_2350);
    float _2634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2636 = uint(_2626) >= uint(_2222);
    float _2638 = _2574 * _2520;
    bool _2640 = !_2632;
    int _2642 = _2640 ? 0 : (-1);
    float _2644 = _2592 * _2520;
    uint _2646 = uint(int(uint(_2628) >> uint(31)));
    float _2648 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2602);
    bool _2650 = !_2636;
    int _2652 = _2650 ? 0 : (-1);
    float _2654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2656 = ~_2642;
    int _2658 = _2604 + _2656;
    int _2660 = _2658 + 1;
    float _2662 = fma(_2616, _2502, _2638);
    int _2664 = ~int(_2646);
    int _2666 = _2664 + 1;
    float _2668 = fma(_2630, _2502, _2622);
    int _2670 = ~_2582;
    int _2672 = _2670 + _2652;
    int _2674 = _2672 + 1;
    float _2676 = fma(_2590, _2502, _2644);
    int _2678 = _2660 ^ _2666;
    float _2680 = fma(_2648, _2510, _2668);
    int _2682 = _2222 * _2674;
    int _2684 = _2682 + _2380;
    bool _2686 = _2222 == 0;
    float _2688 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2614);
    bool _2690 = _2222 == 0;
    float _2692 = fma(_2572, -2.0, 3.0);
    int _2694 = ~_2666;
    int _2696 = _2694 + _2678;
    int _2698 = _2696 + 1;
    float _2700 = _2572 * _2572;
    float _2702 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2588);
    bool _2704 = !_2686;
    int _2706 = _2704 ? _2684 : (-1);
    float _2708 = _2654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2710 = !_2690;
    int _2712 = _2710 ? _2698 : (-1);
    float _2714 = _2700 * _2692;
    float _2716 = float(_2706);
    float _2718 = _2634 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2720 = float(_2712);
    float _2722 = fma(_2708, _2484, -0.5);
    float _2724 = fma(_2688, _2510, _2662);
    float _2726 = fma(_2718, _2476, -0.5);
    float _2728 = fma(_2708, _2716, _530);
    float _2730 = -_486;
    float _2732 = fma(_2718, _2720, _2730);
    float _2734 = fma(_2702, _2510, _2676);
    float _2736 = fma(_496, _2722, _2728);
    float _2738 = fma(_538, _2726, _2732);
    float _2740 = -_2714;
    float _2742 = _2740 + 1.0;
    float _2744 = _2110 + _1413;
    float _2746 = _2736 + 0.5;
    float _2748 = _2738 + 0.5;
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2714);
    float _2752 = _2744 * 0.5;
    out.m_79.x = _2724;
    out.m_79.y = _2680;
    out.m_79.z = _2734;
    float _2754 = _2084 * _2750;
    float _2756 = _2744;
    float _2758 = _2746;
    if (!_1395)
    {
        _2756 = 1.0;
    }
    float _2760 = _2756;
    out.m_81.x = _2746;
    out.m_81.y = _2748;
    float _2762 = _2760;
    if (_1395)
    {
        bool _2764 = _1503 >= _1465;
        bool _2766 = isnan(_1503);
        bool _2768 = _2764 || _2766;
        bool _2770 = isnan(_1465);
        bool _2772 = _2768 || _2770;
        float _2774 = float(_2772);
        _2762 = _2774;
    }
    float _2776 = _2762;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    bool _2778 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2780 = isnan(_1826);
    bool _2782 = _2778 || _2780;
    bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2786 = _2782 || _2784;
    float _2788 = _2776 * _1800;
    out.m_85.z = _2752;
    out.m_85.w = _1413;
    float _2790 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2792 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2794 = _2060 * _2790;
    float _2796 = precise::clamp(_2794, 0.0, 1.0);
    float _2798 = _2792 * _1505;
    float _2800 = -_2792;
    float _2802 = _2800 + 1.0;
    float _2804 = -_2796;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2808 = _1516 * _2798;
    float _2810 = _1516 * _2802;
    float _2812 = _1413;
    float _2814 = _2796;
    float _2816 = _2802;
    if (!_2786)
    {
        _2758 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2818 = _2758;
    float _2820 = -_2788;
    float _2822 = fma(_2820, _2806, 1.0);
    float _2824 = precise::clamp(_2822, 0.0, 1.0);
    float _2826 = _2824;
    float _2828 = _2818;
    float _2830 = _2818;
    if (!_2786)
    {
        _2812 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2832 = _2812;
    float _2834 = _2036 * _2798;
    float _2836 = fma(_2032, _2808, _1510);
    float _2838 = fma(_2034, _2808, _1512);
    float _2840 = _2824 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2842 = fma(_1516, _2834, _1514);
    float _2844 = _2832;
    float _2846 = _2832;
    if (!_2786)
    {
        _2814 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2848 = _2814;
    float _2850 = _2848;
    float _2852 = _2848;
    if (!_2786)
    {
        _2826 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2854 = _2826;
    out.m_87.x = _2840;
    float _2856 = _2854;
    float _2858 = _2854;
    if (!_2786)
    {
        _2816 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2860 = _2816;
    float _2862 = _2860;
    float _2864 = _2860;
    if (!_2786)
    {
        _2206 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2866 = _2206;
    out.m_89.x = _2836;
    out.m_89.y = _2838;
    out.m_89.z = _2842;
    out.m_89.w = _2810;
    bool _2868 = !_2786;
    float _2870 = _2866;
    float _2872 = _2866;
    if (!_2868)
    {
        bool _2874 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2876 = isnan(_1826);
        bool _2878 = _2874 || _2876;
        bool _2880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2882 = _2878 || _2880;
        if (!_2882)
        {
            float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2886 = _1826 + _2884;
            float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2890 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2888;
            float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2896 = 1.0 / _2890;
            float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2900 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2914 = _2886 * _2896;
            float _2916 = precise::clamp(_2914, 0.0, 1.0);
            float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2922 = fma(_2916, _2894, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2924 = fma(_2916, _2920, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2926 = fma(_2916, _2900, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2928 = fma(_2916, _2904, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2930 = fma(_2916, _2908, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2932 = fma(_2916, _2912, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2846 = _2922;
            _2864 = _2930;
            _2830 = _2926;
            _2858 = _2928;
            _2852 = _2924;
            _2872 = _2932;
            _2934 = true;
        }
        else
        {
            bool _2936 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2938 = isnan(_1826);
            bool _2940 = _2936 || _2938;
            bool _2942 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2944 = _2940 || _2942;
            if (!_2944)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2946 = _2828;
            _2830 = _2946;
            if (!_2944)
            {
                _2844 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2948 = _2844;
            _2846 = _2948;
            if (!_2944)
            {
                _2850 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2950 = _2850;
            _2852 = _2950;
            if (!_2944)
            {
                _2856 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2952 = _2856;
            _2858 = _2952;
            if (!_2944)
            {
                _2862 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2954 = _2862;
            _2864 = _2954;
            if (!_2944)
            {
                _2870 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2956 = _2870;
            bool _2958 = !_2944;
            _2872 = _2956;
            if (!_2958)
            {
                bool _2960 = _1826 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2962 = isnan(_1826);
                bool _2964 = _2960 || _2962;
                bool _2966 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2968 = _2964 || _2966;
                if (!_2968)
                {
                    float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2972 = _1826 + _2970;
                    float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2976 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2974;
                    float _2978 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2982 = 1.0 / _2976;
                    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2994 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3000 = _2972 * _2982;
                    float _3002 = precise::clamp(_3000, 0.0, 1.0);
                    float _3004 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3008 = fma(_3002, _2980, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3010 = fma(_3002, _3006, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3012 = fma(_3002, _2986, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3014 = fma(_3002, _2990, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3016 = fma(_3002, _2994, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3018 = fma(_3002, _2998, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2846 = _3008;
                    _2864 = _3016;
                    _2830 = _3012;
                    _2858 = _3014;
                    _2852 = _3010;
                    _2872 = _3018;
                    _2934 = true;
                }
                else
                {
                    _2846 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2864 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2858 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2852 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2872 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2934 = false;
    float _3020 = _2846;
    float _3022 = _2864;
    float _3024 = _2830;
    float _3026 = _2858;
    float _3028 = _2852;
    float _3030 = _2872;
    float _3032 = fma(_2680, -0.5, 0.5);
    float _3034 = precise::clamp(_3032, 0.0, 1.0);
    float _3036 = -_3020;
    float _3038 = _3036 + _3022;
    float _3040 = -_3024;
    float _3042 = _3040 + _3026;
    float _3044 = -_3028;
    float _3046 = _3044 + _3030;
    bool _3048 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3050 = fma(_3034, _3038, _3020);
    float _3052 = fma(_3034, _3042, _3024);
    float _3054 = fma(_3034, _3046, _3028);
    float _3056 = _3050 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _3058 = fma(_3052, 0.298911988735198974609375, _3056);
    float _3060 = fma(_3054, 0.114477999508380889892578125, _3058);
    out.m_93.x = 0.0;
    float _3062 = -_3060;
    float _3064 = _3052 + _3062;
    float _3066 = -_3060;
    float _3068 = _3050 + _3066;
    float _3070 = -_3060;
    float _3072 = _3054 + _3070;
    float _3074 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3076 = fma(_3064, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3060);
    float _3078 = fma(_3068, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3060);
    float _3080 = fma(_3072, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3060);
    out.m_59.x = _3074;
    out.m_95.x = _3076;
    out.m_95.y = _3078;
    out.m_95.z = _3080;
    if (!_3048)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3082 = -_1303;
    float _3084 = _3082 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3086 = -_1305;
    float _3088 = _3086 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3090 = -_1307;
    float _3092 = _3090 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3094 = _3084 * _3084;
    float _3096 = fma(_3088, _3088, _3094);
    float _3098 = fma(_3092, _3092, _3096);
    float _3100 = rsqrt(_3098);
    float _3102 = sqrt(_3098);
    float _3104 = _3084 * _3100;
    float _3106 = _3088 * _3100;
    float _3108 = _3092 * _3100;
    float _3110 = -_1832;
    float _3112 = _3110 + _3104;
    float _3114 = -_1828;
    float _3116 = _3114 + _3106;
    float _3118 = -_1830;
    float _3120 = _3118 + _3108;
    float _3122 = _3112 * _3112;
    float _3124 = -_3102;
    float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3128 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3130 = precise::clamp(_3128, 0.0, 1.0);
    float _3132 = fma(_3116, _3116, _3122);
    float _3134 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3136 = precise::clamp(_3134, 0.0, 1.0);
    float _3138 = _3130 * _3130;
    float _3140 = fma(_3120, _3120, _3132);
    float _3142 = _3138 + (-1.0);
    float _3144 = abs(_3136);
    float _3146 = log2(_3144);
    float _3148 = rsqrt(_3140);
    float _3150 = _3146 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3152 = exp2(_3150);
    float _3154 = _3112 * _3148;
    float _3156 = _3116 * _3148;
    float _3158 = _3120 * _3148;
    float _3160 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3162 = _2680 * _3154;
    float _3164 = fma(_2724, _3156, _3162);
    float _3166 = fma(_2734, _3158, _3164);
    float _3168 = precise::clamp(_3166, 0.0, 1.0);
    float _3170 = _3168 * _3168;
    float _3172 = fma(_3170, _3142, 1.0);
    float _3174 = -_3104;
    float _3176 = -_3160;
    float _3178 = fma(_3174, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3176);
    float _3180 = _2680 * _3104;
    float _3182 = _3172 * _3172;
    float _3184 = -_3108;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3178);
    float _3188 = fma(_2724, _3106, _3180);
    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3192 = _3186 + _3190;
    float _3194 = 1.0 / _3182;
    float _3196 = fma(_2734, _3108, _3188);
    float _3198 = precise::clamp(_3196, 0.0, 1.0);
    float _3200 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3202 = precise::clamp(_3200, 0.0, 1.0);
    float _3204 = _3152 * _3202;
    float _3206 = _3198 * _3204;
    float _3208 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3210 = _3138 * _3194;
    float _3212 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3214 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3216 = _3206 * _3210;
    out.m_91.x = _3208;
    out.m_91.y = _3212;
    out.m_91.z = _3214;
    float _3218 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3220 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3222 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3218;
    out.m_93.y = _3220;
    out.m_93.z = _3222;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

