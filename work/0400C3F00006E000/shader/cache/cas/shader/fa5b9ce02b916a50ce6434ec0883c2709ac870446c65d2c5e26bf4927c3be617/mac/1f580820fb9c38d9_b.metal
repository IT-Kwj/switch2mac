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
    float4 m_85 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2082 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_56.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_59.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2367 = as_type<float>(_120);
        out.gl_Position.z = _2367;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_61.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_59.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2436 = as_type<float>(_158);
        out.gl_Position.z = _2436;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _162 = !_160;
    float _180;
    if (!_162)
    {
        float _164 = in.m_63.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_104);
        float _186 = 1.0 / _184;
        float _188 = _138 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = in.m_56.x;
    float _194 = in.m_56.y;
    float _196 = in.m_56.z;
    float _198 = _194 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _200 = _194 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _202 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[4].x, _198);
    float _204 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[6].x, _200);
    float _206 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[4].z, _202);
    float _208 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[6].z, _204);
    float _210 = _206 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _212 = _208 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _214 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _216 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _218 = floor(_214);
    float _220 = floor(_216);
    float _222 = -_218;
    float _224 = _214 + _222;
    float _226 = -_220;
    float _228 = _216 + _226;
    float2 _2563 = float2(_224, _228);
    float _230 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2563, float2(0.0), isnan(_2563)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2563, float2(0.0), isnan(_2563)), level(0.0)).x;
    float _232 = in.m_63.x;
    float _234 = in.m_63.y;
    float _236 = in.m_63.z;
    float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _240 = log2(_238);
    float _242 = _194 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _254 = 1.0 + _252;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _258 = _256 != 0;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _262 = _260 != 0;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _266 = _264 != 0;
    float _268 = 1.0 / _246;
    bool _270 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _272 = isnan(1.0);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _278 = _274 || _276;
    float _280 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[5].x, _242);
    bool _282 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _284 = isnan(0.0);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _290 = _286 || _288;
    float _292 = _240 * _138;
    float _294 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _296 = 1.0 / _250;
    float _298 = _294 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _300 = _236 * 2.0;
    float _302 = _234 * 2.0;
    float _304 = _232 * 2.0;
    float _306 = exp2(_292);
    float _308 = _234 + _236;
    float _310 = _236 + _232;
    float _312 = _236 + (-0.5);
    float _314 = _234 + _232;
    float _316 = _234 + (-0.5);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _190 + _318;
    float _322 = _232 + (-0.5);
    float _324 = floor(_300);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = _190 + _326;
    float _330 = _320 * _296;
    float _332 = _314 + (-1.0);
    float _334 = _308 + (-1.0);
    float _336 = _328 * _268;
    float _338 = 1.0 / _254;
    float _340 = -_306;
    float _342 = _340 + 1.0;
    float _344 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _346 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_190);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _298 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _364 = _290 ? _342 : 0.0;
    float _366 = floor(_302);
    bool _368 = _324 >= 0.0;
    bool _370 = isnan(_324);
    bool _372 = _368 || _370;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    float _378 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _380 = _324 > 0.0;
    float _382 = _310 + (-1.0);
    bool _384 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_190);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -_356;
    float _398 = _396 + 1.0;
    float _400 = floor(_304);
    int _402 = 2;
    float _404 = _210;
    if (_278)
    {
        float _406 = _364 * _338;
        _142 = _406;
    }
    float _408 = _142;
    bool _410 = !_258;
    int _412 = _410 ? 0 : 1;
    float _414 = -_394;
    float _416 = _414 + 1.0;
    int _418 = _376 ? 0 : 1;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _422 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_190);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _434;
    bool _438 = _366 > 0.0;
    float _440 = fma(_360, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _442 = _366 >= 0.0;
    bool _444 = isnan(_366);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = _432 * _398;
    float _454 = fma(_436, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _456 = -_432;
    float _458 = _456 + 1.0;
    int _460 = abs(_412);
    float _462 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _362);
    bool _464 = _400 > 0.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _466;
    bool _470 = _400 >= 0.0;
    bool _472 = isnan(_400);
    bool _474 = _470 || _472;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    float _480 = _356 * _416;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = fma(_468, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = fma(_484, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _498 = _440 * _452;
    float _500 = _298 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _502 = _486 * _452;
    float _504 = _454 * _452;
    float _506 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].y, _498);
    float _508 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _500);
    float _510 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].x, _502);
    float _512 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].z, _504);
    int _514 = ~_418;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = in.m_65.x;
    float _522 = in.m_65.y;
    float _524 = in.m_65.z;
    int _526 = _518;
    if (!_380)
    {
        int _528 = ~_418;
        int _530 = _528 + 1;
        _526 = _530;
    }
    int _532 = _526;
    float _534 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[11].z, _508);
    float _536 = float(_460);
    float _538 = fma(_494, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _540 = fma(_490, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _542 = _534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _544 = float(_532);
    float _546 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[10].z, _462);
    int _548 = _450 ? 0 : 1;
    float _550 = 1.0 / _542;
    int _552 = _478 ? 0 : 1;
    float _554 = _536 * _544;
    int _556 = ~_548;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    float _562 = fma(_496, _480, _510);
    int _564 = _560;
    if (!_438)
    {
        int _566 = ~_548;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    float _572 = _554 * (-2.0);
    bool _574 = !_262;
    int _576 = _574 ? 0 : 1;
    float _578 = _546 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _580 = ~_552;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[145].x, _562);
    int _588 = _584;
    if (!_464)
    {
        int _590 = ~_552;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = fma(_538, _480, _506);
    int _598 = abs(_576);
    float _600 = fma(_344, _572, _344);
    bool _602 = !_266;
    int _604 = _602 ? 0 : 1;
    float _606 = fma(_572, _520, _520);
    float _608 = float(_598);
    float _610 = _578 + _542;
    float _612 = float(_594);
    float _614 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[196].x, _606);
    int _616 = abs(_604);
    float _618 = _610 * _550;
    float _620 = _618 * 0.5;
    float _622 = in.m_67.x;
    float _624 = in.m_67.y;
    float _626 = in.m_67.z;
    float _628 = _608 * _612;
    float _630 = fma(_600, _408, _614);
    float _632 = float(_570);
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _636 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[30].w, _634);
    float _638 = float(_616);
    float _640 = _628 * (-2.0);
    float _642 = _630 * 0.15915493667125701904296875;
    float _644 = in.m_69.x;
    float _646 = in.m_69.y;
    float _648 = in.m_69.z;
    float _650 = fma(_540, _480, _512);
    float _652 = 1.0 / _636;
    float _654 = _638 * _632;
    float _656 = fma(_640, _522, _522);
    float _658 = fma(_378, _640, _378);
    float _660 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[145].z, _650);
    float _662 = _654 * (-2.0);
    float _664 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[196].y, _656);
    float _666 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[145].y, _596);
    float _668 = fma(_662, _524, _524);
    float _670 = fma(_658, _408, _664);
    float _672 = _642 * 6.283185482025146484375;
    float _674 = cos(_672);
    float _676 = _666 * _624;
    float _678 = fma(_420, _662, _420);
    float _680 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _668);
    float _682 = _586 * _622;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _686 = _652 * _684;
    float _688 = _670 * 0.15915493667125701904296875;
    float _690 = fma(_678, _408, _680);
    float _692 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _694 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _696 = _686 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _644);
    float _700 = _690 * 0.15915493667125701904296875;
    bool _702 = _686 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _704 = _688 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _692 * _698;
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _646);
    float _712 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _714 = _298 + _694;
    bool _716 = !_696;
    int _718 = _716 ? 0 : 1;
    float _720 = _660 * _626;
    float _722 = _712 * _710;
    float _724 = _688 * 6.283185482025146484375;
    float _726 = cos(_724);
    float _728 = _714 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    if (!_696)
    {
        _402 = 1;
    }
    int _730 = _402;
    float _732 = _714 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _734 = _730;
    if (!_702)
    {
        _734 = _718;
    }
    int _736 = _734;
    float _738 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[127].x, _728);
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _648);
    float _742 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[126].x, _732);
    float _744 = _700 * 6.283185482025146484375;
    float _746 = cos(_744);
    int _748 = _736 << 6;
    float _750 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[127].z, _738);
    float _752 = _674 * _706;
    float _754 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[126].z, _742);
    int _756 = _748 + 96;
    uint _759 = uint(int(uint(_756) >> uint(2)));
    uint _761 = uint(int(uint(int(_759)) >> uint(2)));
    int _763 = int(_759) & 3;
    float _765 = (*spvDescriptorSet0.vp_c15)._m0[int(_761)][_763];
    int _767 = int(_759) + 1;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    int _771 = _767 & 3;
    float _773 = (*spvDescriptorSet0.vp_c15)._m0[int(_769)][_771];
    float _775 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _777 = _750 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _779 = _642 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _674 * _726;
    float _785 = _754 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _787 = _775 * _740;
    bool _789 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _791 = isnan(0.5);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _797 = _793 || _795;
    float _799 = _700 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _674 * _746;
    int _805 = _748 + 48;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    uint _809 = uint(int(uint(int(_807)) >> uint(2)));
    int _811 = int(_807) & 3;
    float _813 = (*spvDescriptorSet0.vp_c15)._m0[int(_809)][_811];
    int _815 = int(_807) + 1;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    int _819 = _815 & 3;
    float _821 = (*spvDescriptorSet0.vp_c15)._m0[int(_817)][_819];
    float _823 = _803 * _722;
    float _825 = _781 * _706;
    float _827 = _781 * _726;
    float _829 = trunc(_785);
    int _831 = int(_829);
    float _833 = _781 * _746;
    float _835 = _726 * _746;
    float _837 = _706 * _746;
    float _839 = _833 * _722;
    float _841 = fma(_801, _783, _825);
    float _843 = -_752;
    float _845 = fma(_801, _827, _843);
    float _847 = trunc(_777);
    int _849 = int(_847);
    float _851 = -_827;
    float _853 = fma(_801, _752, _851);
    float _855 = fma(_841, _708, _823);
    float _857 = -_722;
    float _859 = _801 * _857;
    int _861 = _748 + 104;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    uint _865 = uint(int(uint(int(_863)) >> uint(2)));
    int _867 = int(_863) & 3;
    float _869 = (*spvDescriptorSet0.vp_c15)._m0[int(_865)][_867];
    int _871 = int(_863) + 1;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    int _875 = _871 & 3;
    float _877 = (*spvDescriptorSet0.vp_c15)._m0[int(_873)][_875];
    float _879 = fma(_801, _825, _783);
    float _881 = fma(_853, _787, _855);
    float _883 = fma(_835, _708, _859);
    float _885 = fma(_845, _708, _839);
    int _887 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _889 = _831 + _887;
    int _891 = _889 + 1;
    float _893 = _881 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _895 = fma(_837, _787, _883);
    int _897 = _748 + 64;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    uint _901 = uint(int(uint(int(_899)) >> uint(2)));
    int _903 = int(_899) & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    int _907 = int(_899) + 1;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    int _911 = _907 & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    float _915 = _881 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _917 = fma(_879, _787, _885);
    float _919 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[10].x, _893);
    int _921 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _923 = _849 + _921;
    int _925 = _923 + 1;
    float _927 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[8].x, _915);
    bool _929 = _891 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _931 = fma(_917, (*spvDescriptorSet0.vp_c10)._m0[10].z, _919);
    int _933 = _748 + 56;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.vp_c15)._m0[int(_937)][_939];
    int _943 = int(_935) + 1;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    int _947 = _943 & 3;
    float _949 = (*spvDescriptorSet0.vp_c15)._m0[int(_945)][_947];
    int _951 = _891 | _925;
    float _953 = fma(_917, (*spvDescriptorSet0.vp_c10)._m0[8].z, _927);
    float _955 = _212 + _931;
    float _957 = _714 * _773;
    bool _959 = _951 < 0;
    bool _961 = _959 || _929;
    float _963 = _210 + _953;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _955 + _965;
    int _969 = _748 + 72;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    uint _973 = uint(int(uint(int(_971)) >> uint(2)));
    int _975 = int(_971) & 3;
    float _977 = (*spvDescriptorSet0.vp_c15)._m0[int(_973)][_975];
    int _979 = int(_971) + 1;
    uint _981 = uint(int(uint(_979) >> uint(2)));
    int _983 = _979 & 3;
    float _985 = (*spvDescriptorSet0.vp_c15)._m0[int(_981)][_983];
    bool _987 = _925 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _989 = _987 || _961;
    float _991 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _993 = _963 + _991;
    float _995 = _967 * _967;
    float _997 = fma(_210, _765, _957);
    float _999 = _714 * _821;
    float _1001 = _881 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1003 = fma(_993, _993, _995);
    int _1005 = _748 + 80;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    uint _1009 = uint(int(uint(int(_1007)) >> uint(2)));
    int _1011 = int(_1007) & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    int _1015 = int(_1007) + 1;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    int _1019 = _1015 & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    float _1023 = fma(_210, _813, _999);
    float _1025 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1001);
    float _1027 = sqrt(_1003);
    int _1029 = as_type<int>(_881);
    int _1031 = as_type<int>(_997);
    int _1033 = as_type<int>(_1025);
    float _1035 = _963;
    float _1037 = _955;
    float _1039 = _1003;
    float _1041 = _967;
    float _1043 = _993;
    float _1045 = as_type<float>(_736);
    float _1047 = _895;
    if (!_989)
    {
        int _1049 = _925 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1051 = _1049 + _891;
        _1029 = _1051;
    }
    int _1053 = _1029;
    float _1055 = fma(_917, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1025);
    float _1057 = _999;
    if (!_989)
    {
        float _1059 = floor(_785);
        _1057 = _1059;
    }
    float _1061 = _1057;
    float _1063 = _298 + _1055;
    float _1065 = fma(_212, _869, _997);
    if (!_989)
    {
        int _1067 = _1053 << 2;
        _1031 = _1067;
    }
    int _1069 = _1031;
    bool _1071 = _1027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1073 = _1065 + _877;
    if (!_989)
    {
        int _1075 = 12 & _1069;
        _1033 = _1075;
    }
    int _1077 = _1033;
    float _1079 = _714 * _913;
    float _1081 = 1.0 / _1073;
    float _1083 = fma(_210, _905, _1079);
    int _1085 = as_type<int>(_905);
    if (!_989)
    {
        uint _1087 = uint(int(uint(_1053) >> uint(2)));
        _1085 = int(_1087);
    }
    int _1089 = _1085;
    float _1091 = fma(_212, _941, _1023);
    int _1093 = _1089;
    if (!_989)
    {
        int _1095 = _1089 << 4;
        int _1097 = _1095 + _1077;
        _1093 = _1097;
    }
    int _1099 = _1093;
    float _1101 = _1091 + _949;
    float _1103 = fma(_212, _977, _1083);
    float _1105 = _977;
    if (!_1071)
    {
        _1105 = _1063;
    }
    float _1107 = _1105;
    float _1109 = _1103 + _985;
    bool _1111 = !_1071;
    float _1113 = _1107;
    if (!_1111)
    {
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1119 = _1027 + _1117;
        float _1121 = _1063 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = rsqrt(_1003);
        float _1125 = _1119 * _1115;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = sin(_1129);
        float _1133 = _1127 * 6.283185482025146484375;
        float _1135 = cos(_1133);
        float _1137 = fma(_1131, _1121, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1139 = _1123 * _1137;
        float _1141 = _1135 + (-1.0);
        float _1143 = fma(_993, _1139, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1145 = fma(_967, _1139, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1147 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = fma(_1063, _1135, _1147);
        _1035 = _1143;
        _1113 = _1149;
        _1037 = _1145;
        _1039 = _1123;
    }
    float _1151 = _1035;
    float _1153 = _1113;
    float _1155 = _1037;
    float _1157 = _1039;
    float _1159 = _1157;
    if (_797)
    {
        _1159 = _1151;
    }
    float _1161 = _1159;
    float _1163 = _1161;
    if (_797)
    {
        _1041 = _1153;
    }
    float _1165 = _1041;
    float _1167 = _1165;
    if (_797)
    {
        _1043 = _1155;
    }
    float _1169 = _1043;
    float _1171 = _1169;
    if (!_797)
    {
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1175 = _298 + _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1179 = _210 + _1177;
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1183 = -_298;
        float _1185 = _1183 + _1153;
        float _1187 = _1175 * _1175;
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1191 = _212 + _1189;
        float _1193 = -_210;
        float _1195 = _1193 + _1151;
        float _1197 = -_212;
        float _1199 = _1197 + _1155;
        float _1201 = fma(_1179, _1179, _1187);
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1205 = fma(_1191, _1191, _1201);
        float _1207 = sqrt(_1205);
        float _1209 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1211 = precise::min(_1207, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1213 = _1211 * _1203;
        float _1215 = _1209 * _1213;
        float _1217 = fma(_1185, _1215, _298);
        float _1219 = fma(_1195, _1215, _210);
        float _1221 = fma(_1199, _1215, _212);
        _1167 = _1217;
        _1163 = _1219;
        _1171 = _1221;
    }
    float _1223 = _1167;
    float _1225 = _1163;
    float _1227 = _1171;
    int _1229 = _748 + 88;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    uint _1233 = uint(int(uint(int(_1231)) >> uint(2)));
    int _1235 = int(_1231) & 3;
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[int(_1233)][_1235];
    int _1239 = int(_1231) + 1;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    int _1243 = _1239 & 3;
    float _1245 = (*spvDescriptorSet0.vp_c15)._m0[int(_1241)][_1243];
    float _1247 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1249 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1251 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1253 = _1101 * _1081;
    float _1255 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1247);
    float _1257 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1249);
    float _1259 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1251);
    float _1261 = _1151;
    if (!_989)
    {
        int _1263 = _1099 + 400;
        uint _1265 = uint(int(uint(_1263) >> uint(2)));
        uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
        int _1269 = int(_1265) & 3;
        float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
        _1261 = _1271;
    }
    float _1273 = _1261;
    float _1275 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1255);
    bool _1277 = _1253 >= 0.0;
    float _1279 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1281 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1257);
    float _1283 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1259);
    float _1285 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = _1109 * _1081;
    bool _1289 = _1253 <= 1.0;
    bool _1291 = _1289 && _1277;
    float _1293 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1279);
    float _1295 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1297 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1301 = _1287 >= 0.0;
    bool _1303 = _1301 && _1291;
    float _1305 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1309 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1293);
    float _1311 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    bool _1313 = _1287 <= 1.0;
    bool _1315 = _1313 && _1303;
    float _1317 = -_1307;
    float _1319 = fma(_1317, _1305, 1.0);
    float _1321 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1323 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1311);
    float _1325 = _714 * _1021;
    float _1327 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1329 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1331 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1323);
    float _1333 = fma(_210, _1013, _1325);
    float _1335 = log2(_1319);
    float _1337 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1327);
    float _1339 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1329);
    float _1341 = _1331;
    if (_1315)
    {
        float _1343 = float(_736);
        _1045 = _1343;
    }
    float _1345 = _1045;
    float _1347 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1337);
    float _1349 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1339);
    float _1351 = 1.0 / _1331;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float _1355 = fma(_212, _1237, _1333);
    float _1357 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1347);
    float _1359 = as_type<float>(_1077);
    float _1361 = _1245;
    float _1363 = _1345;
    float _1365 = _1353;
    if (!_989)
    {
        float _1367 = floor(_777);
        _1359 = _1367;
    }
    float _1369 = _1359;
    float _1371 = _1355 + _1245;
    float _1373 = _1335 * 0.693147182464599609375;
    if (!_989)
    {
        float _1375 = -_1061;
        float _1377 = _785 + _1375;
        _1361 = _1377;
    }
    float _1379 = _1361;
    float _1381 = _1371 * _1081;
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1385 = _1325;
    float _1387 = _1379;
    if (_1315)
    {
        float _1389 = rint(_1345);
        float _1391 = precise::max(_1389, 0.0);
        uint _1393 = uint(_1391);
        uint _1395 = clamp(_1393, 0u, 65535u);
        _1385 = as_type<float>(_1395);
    }
    float _1397 = _1385;
    float _1399 = _1357 * _1351;
    float _1401 = _1353 * _1351;
    float _1403 = fma(_1399, 0.5, 0.5);
    float _1405 = _1371;
    if (!_989)
    {
        float _1407 = rint(_1273);
        float _1409 = precise::max(_1407, 0.0);
        uint _1411 = uint(_1409);
        uint _1413 = clamp(_1411, 0u, 65535u);
        _1405 = as_type<float>(_1413);
    }
    float _1415 = _1405;
    if (!_989)
    {
        float _1417 = -_1369;
        float _1419 = _777 + _1417;
        _1047 = _1419;
    }
    float _1421 = _1047;
    float _1423 = fma(_1401, -0.5, 0.5);
    float _1425 = as_type<float>(_748);
    if (_1315)
    {
        float3 _4478 = float3(_1253, _1287, float(as_type<int>(_1397)));
        float3 _4482 = select(_4478, float3(0.0), isnan(_4478));
        float _1427 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4482.xy, uint(rint(_4482.z)), _1381, level(0.0));
        _1425 = _1427;
    }
    float _1429 = _1425;
    float3 _4492 = float3(_1403, _1423, _1383);
    float _1431 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4492, float3(0.0), isnan(_4492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4492, float3(0.0), isnan(_4492)), level(0.0)).x;
    float3 _4501 = float3(_1403, _1423, _1383);
    float4 _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4501, float3(0.0), isnan(_4501)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4501, float3(0.0), isnan(_4501)), level(0.0)).xyzw;
    float _1436 = _1434.x;
    float _1438 = _1434.y;
    float _1440 = _1434.z;
    float _1442 = _1434.w;
    float _1444 = _1339;
    if (!_989)
    {
        float3 _4524 = float3(_1379, _1421, float(as_type<int>(_1415)));
        float3 _4526 = select(_4524, float3(0.0), isnan(_4524));
        float _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4526.xy, uint(rint(_4526.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4526.xy, uint(rint(_4526.z)), level(0.0)).x;
        _1444 = _1446;
    }
    float _1448 = _1444;
    if (_989)
    {
        _1363 = 1.0;
    }
    float _1450 = _1363;
    float _1452 = _1450;
    if (!_989)
    {
        int _1454 = _1053 << 4;
        int _1456 = _1454 + 2048;
        uint _1458 = uint(int(uint(_1456) >> uint(2)));
        uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
        int _1462 = int(_1458) & 3;
        float _1464 = (*spvDescriptorSet0.vp_c15)._m0[int(_1460)][_1462];
        int _1466 = int(_1458) + 1;
        uint _1468 = uint(int(uint(_1466) >> uint(2)));
        int _1470 = _1466 & 3;
        float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
        int _1474 = _1456 + 8;
        uint _1476 = uint(int(uint(_1474) >> uint(2)));
        uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
        int _1480 = int(_1476) & 3;
        float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
        int _1484 = int(_1476) + 1;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        int _1488 = _1484 & 3;
        float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
        float _1492 = _714 * _1472;
        float _1494 = fma(_210, _1464, _1492);
        float _1496 = fma(_212, _1482, _1494);
        float _1498 = _1496 + _1490;
        float _1500 = precise::clamp(_1498, 0.0, 1.0);
        float _1502 = -_1500;
        float _1504 = _1502 + _1448;
        float _1506 = fma(_1504, 500.0, 1.5);
        float _1508 = exp2(_1506);
        float _1510 = 0.0 + _1508;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1387 = _1490;
        _1452 = _1512;
    }
    float _1514 = _1387;
    float _1516 = _1452;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1520 = _1223 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1524 = _1225 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1227 + _1526;
    float _1530 = _1520 * _1520;
    float _1532 = fma(_1524, _1524, _1530);
    float _1534 = fma(_1528, _1528, _1532);
    float _1536 = rsqrt(_1534);
    float _1538 = sqrt(_1534);
    float _1540 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1542 = _1524 * _1540;
    float _1544 = _1528 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 + _1548;
    float _1552 = sqrt(_1550);
    bool _1554 = _1552 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1552 + _1556;
    float _1560 = _1514;
    float _1562 = _1550;
    float _1564 = _1558;
    float _1566 = _1520;
    float _1568 = _1540;
    float _1570 = _1542;
    float _1572 = _1544;
    float _1574 = _1548;
    if (_1554)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1576;
    }
    float _1578 = _1560;
    if (_1554)
    {
        float _1580 = rsqrt(_1550);
        _1562 = _1580;
    }
    float _1582 = _1562;
    if (_1554)
    {
        float _1584 = _1558 * _1578;
        _1564 = _1584;
    }
    float _1586 = _1564;
    if (_1554)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _404 = _1588;
    }
    float _1590 = _404;
    float _1592 = _1423;
    if (_1554)
    {
        float _1594 = _1590 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1403;
    float _1606 = _1602;
    float _1608 = _1600;
    if (_1554)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = -_1540;
    float _1618 = -_1602;
    float _1620 = fma(_1520, _1616, _1618);
    if (!_1554)
    {
        _1606 = _1546;
    }
    float _1622 = _1606;
    float _1624 = _1622;
    if (_1554)
    {
        float _1626 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1626;
    }
    float _1628 = _1566;
    float _1630 = _1598;
    float _1632 = _1628;
    if (_1554)
    {
        float _1634 = fma(_1598, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1630 = _1634;
    }
    float _1636 = _1630;
    float _1638 = _1636;
    if (!_1554)
    {
        _1632 = _1620;
    }
    float _1640 = _1632;
    float _1642 = _1640;
    if (_1554)
    {
        float _1644 = _1614 + (-1.0);
        _1608 = _1644;
    }
    float _1646 = _1608;
    if (_1554)
    {
        float _1648 = _1582 * _1636;
        _1568 = _1648;
    }
    float _1650 = _1568;
    if (_1554)
    {
        float _1652 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1554)
    {
        float _1656 = _1542 * _1650;
        _1570 = _1656;
    }
    float _1658 = _1570;
    if (_1554)
    {
        float _1660 = _1544 * _1650;
        _1572 = _1660;
    }
    float _1662 = _1572;
    if (_1554)
    {
        float _1664 = fma(_1620, _1614, _1654);
        _1642 = _1664;
    }
    float _1666 = _1642;
    if (_1554)
    {
        float _1668 = _1658 * _1658;
        _1624 = _1668;
    }
    float _1670 = _1624;
    if (_1554)
    {
        float _1672 = _1662 * _1662;
        _1574 = _1672;
    }
    float _1674 = _1574;
    float _1676 = fma(_1666, _1666, _1670);
    float _1678 = _1676 + _1674;
    float _1680 = rsqrt(_1678);
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1684 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1682);
    float _1686 = precise::clamp(_1684, 0.0, 1.0);
    float _1688 = -_1686;
    float _1690 = _1688 + 1.0;
    float _1692 = _1680 * _1658;
    float _1694 = _1680 * _1666;
    float _1696 = _1680 * _1662;
    float _1698 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1700 = abs(_1690);
    float _1702 = log2(_1700);
    float _1704 = -_1698;
    float _1706 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1704);
    float _1708 = -_1696;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1706);
    float _1712 = fma(_1710, -0.5, 0.5);
    float _1714 = fma(_1710, 0.5, 0.5);
    float _1716 = fma(_1714, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1718 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1720 = sqrt(_1712);
    float _1722 = fma(_1714, _1716, -0.212114393711090087890625);
    float _1724 = _1694 + 1.0;
    float _1726 = fma(_1714, _1722, 1.570728778839111328125);
    float _1728 = exp2(_1718);
    float _1730 = _1720 * 0.636619746685028076171875;
    float _1732 = -_1726;
    float _1734 = fma(_1730, _1732, 1.0);
    float _1736 = -_1694;
    float _1738 = fma(_1728, _1724, _1736);
    float _1740 = fma(_1738, 0.5, 0.5);
    float2 _4980 = float2(_1734, _1740);
    float3 _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4980, float2(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4980, float2(0.0), isnan(_4980)), level(0.0)).xyz;
    float _1746 = _1744.x;
    float _1748 = _1744.y;
    float _1750 = _1744.z;
    float _1752 = abs(_686);
    float _1754 = log2(_1752);
    float _1756 = in.m_71.x;
    float _1758 = in.m_71.y;
    float _1760 = in.m_71.z;
    bool _1762 = _646 != 0.0;
    bool _1764 = isnan(_646);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(0.0);
    bool _1770 = _1766 || _1768;
    float _1772 = -_230;
    float _1774 = _1772 + 1.0;
    bool _1776 = _644 == 0.0;
    bool _1778 = !_1770;
    bool _1780 = _1776 && _1778;
    bool _1782 = _648 == 0.0;
    bool _1784 = _1782 && _1780;
    float _1786 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = exp2(_1786);
    float _1800 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = _1758;
    float _1806 = _1756;
    float _1808 = _1760;
    if (!_1784)
    {
        float _1810 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1758);
        _1804 = _1810;
    }
    float _1812 = _1804;
    if (!_1784)
    {
        float _1814 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1756);
        _1806 = _1814;
    }
    float _1816 = _1806;
    if (!_1784)
    {
        float _1818 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1760);
        _1808 = _1818;
    }
    float _1820 = _1808;
    float _1822 = -_1812;
    float _1824 = _801 * _1822;
    float _1826 = _803 * _1812;
    float _1828 = _833 * _1812;
    float _1830 = fma(_835, _1816, _1824);
    float _1832 = fma(_841, _1816, _1826);
    float _1834 = fma(_845, _1816, _1828);
    out.m_73.x = _1800;
    out.m_73.y = _1796;
    out.m_73.z = _1802;
    out.m_73.w = _1794;
    float _1836 = fma(_837, _1820, _1830);
    float _1838 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1840 = precise::clamp(_1838, 0.0, 1.0);
    float _1842 = fma(_853, _1820, _1832);
    float _1844 = fma(_879, _1820, _1834);
    float _1846 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1848 = _686 <= 8000.0;
    bool _1850 = isnan(_686);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan(8000.0);
    bool _1856 = _1852 || _1854;
    float _1858 = float(_1856);
    float _1860 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1862 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1864 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1866 = isnan(_1538);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1872 = _1868 || _1870;
    float _1874 = exp2(_1846);
    float _1876 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1860);
    float _1878 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1862);
    float _1880 = fma(_1840, -2.0, 3.0);
    float _1882 = _1840 * _1840;
    float _1884 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1886 = fma(_1844, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1876);
    float _1888 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1890 = _1882 * _1880;
    float _1892 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1884);
    float _1894 = fma(_1844, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1878);
    float _1896 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1888);
    float _1898 = -_1890;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1844, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1892);
    float _1904 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1896);
    float _1906 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1890);
    float _1908 = -_1874;
    float _1910 = _1908 + 1.0;
    out.m_75.x = _1886;
    out.m_75.y = _1894;
    out.m_75.z = _1902;
    float _1912 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1904);
    float _1914 = _1858 * _1906;
    float _1916 = _1906;
    float _1918 = _1912;
    if (!_1315)
    {
        _1916 = 1.0;
    }
    float _1920 = _1916;
    float _1922 = _1920;
    if (_1315)
    {
        bool _1924 = _1429 >= _1381;
        bool _1926 = isnan(_1429);
        bool _1928 = _1924 || _1926;
        bool _1930 = isnan(_1381);
        bool _1932 = _1928 || _1930;
        float _1934 = float(_1932);
        _1922 = _1934;
    }
    float _1936 = _1922;
    float _1938 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1940 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1357;
    out.gl_Position.y = _1353;
    out.gl_Position.z = _1912;
    out.gl_Position.w = _1331;
    float _1942 = _1774 * _1938;
    float _1944 = precise::clamp(_1942, 0.0, 1.0);
    float _1946 = _1940 * _1431;
    float _1948 = _1936 * _1516;
    float _1950 = -_1944;
    float _1952 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1954 = _1442 * _1946;
    float _1956 = -_1948;
    float _1958 = fma(_1956, _1952, 1.0);
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1962 = -_1940;
    float _1964 = _1962 + 1.0;
    float _1966 = _1960 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1968 = 1.0;
    float _1970 = 1.0;
    float _1972 = _1964;
    if (!_1872)
    {
        _1341 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1974 = _1341;
    float _1976 = _1442 * _1964;
    float _1978 = _1974;
    float _1980 = _1974;
    if (!_1872)
    {
        _1918 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1982 = _1918;
    out.m_79.x = _1966;
    float _1984 = _1982;
    float _1986 = _1982;
    if (!_1872)
    {
        _1365 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1988 = _1365;
    float _1990 = _1988;
    float _1992 = _1988;
    if (!_1872)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1994 = _1968;
    float _1996 = _1994;
    float _1998 = _1994;
    if (!_1872)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2000 = _1970;
    float _2002 = _2000;
    float _2004 = _2000;
    if (!_1872)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2006 = _1972;
    float _2008 = _1750 * _1946;
    float _2010 = fma(_1746, _1954, _1436);
    float _2012 = fma(_1748, _1954, _1438);
    float _2014 = fma(_1442, _2008, _1440);
    out.m_81.x = _2010;
    out.m_81.y = _2012;
    out.m_81.z = _2014;
    out.m_81.w = _1976;
    bool _2016 = !_1872;
    float _2018 = _2006;
    float _2020 = _2006;
    if (!_2016)
    {
        bool _2022 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2024 = isnan(_1538);
        bool _2026 = _2022 || _2024;
        bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2030 = _2026 || _2028;
        if (!_2030)
        {
            float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2034 = _1538 + _2032;
            float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2038 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2036;
            float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2042 = _2040 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2044 = 1.0 / _2038;
            float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2048 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2052 = _2050 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2062 = _2034 * _2044;
            float _2064 = precise::clamp(_2062, 0.0, 1.0);
            float _2066 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2070 = fma(_2064, _2042, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2072 = fma(_2064, _2068, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2074 = fma(_2064, _2048, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2076 = fma(_2064, _2052, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2078 = fma(_2064, _2056, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2080 = fma(_2064, _2060, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2004 = _2074;
            _1992 = _2078;
            _1998 = _2070;
            _1986 = _2076;
            _1980 = _2072;
            _2020 = _2080;
            _2082 = true;
        }
        else
        {
            bool _2084 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2086 = isnan(_1538);
            bool _2088 = _2084 || _2086;
            bool _2090 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2092 = _2088 || _2090;
            if (!_2092)
            {
                _1996 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2094 = _1996;
            _1998 = _2094;
            if (!_2092)
            {
                _2002 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2096 = _2002;
            _2004 = _2096;
            if (!_2092)
            {
                _1978 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2098 = _1978;
            _1980 = _2098;
            if (!_2092)
            {
                _1984 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2100 = _1984;
            _1986 = _2100;
            if (!_2092)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2102 = _1990;
            _1992 = _2102;
            if (!_2092)
            {
                _2018 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2104 = _2018;
            bool _2106 = !_2092;
            _2020 = _2104;
            if (!_2106)
            {
                bool _2108 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2110 = isnan(_1538);
                bool _2112 = _2108 || _2110;
                bool _2114 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2116 = _2112 || _2114;
                if (!_2116)
                {
                    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2120 = _1538 + _2118;
                    float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2124 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2122;
                    float _2126 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2128 = _2126 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2130 = 1.0 / _2124;
                    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2138 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2148 = _2120 * _2130;
                    float _2150 = precise::clamp(_2148, 0.0, 1.0);
                    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2156 = fma(_2150, _2128, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2158 = fma(_2150, _2154, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2160 = fma(_2150, _2134, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2162 = fma(_2150, _2138, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2164 = fma(_2150, _2142, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2166 = fma(_2150, _2146, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2004 = _2160;
                    _1992 = _2164;
                    _1998 = _2156;
                    _1986 = _2162;
                    _1980 = _2158;
                    _2020 = _2166;
                    _2082 = true;
                }
                else
                {
                    _2004 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1998 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1986 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1980 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2020 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2082 = false;
    float _2168 = _2004;
    float _2170 = _1992;
    float _2172 = _1998;
    float _2174 = _1986;
    float _2176 = _1980;
    float _2178 = _2020;
    float _2180 = fma(_1894, -0.5, 0.5);
    float _2182 = precise::clamp(_2180, 0.0, 1.0);
    float _2184 = -_2168;
    float _2186 = _2184 + _2170;
    float _2188 = -_2172;
    float _2190 = _2188 + _2174;
    float _2192 = -_2176;
    float _2194 = _2192 + _2178;
    bool _2196 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2198 = fma(_2182, _2186, _2168);
    float _2200 = fma(_2182, _2190, _2172);
    float _2202 = fma(_2182, _2194, _2176);
    float _2204 = _2198 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2206 = fma(_2200, 0.298911988735198974609375, _2204);
    float _2208 = fma(_2202, 0.114477999508380889892578125, _2206);
    out.m_83.x = 0.0;
    float _2210 = -_2208;
    float _2212 = _2200 + _2210;
    float _2214 = -_2208;
    float _2216 = _2198 + _2214;
    float _2218 = -_2208;
    float _2220 = _2202 + _2218;
    float _2222 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2224 = fma(_2212, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2208);
    float _2226 = fma(_2216, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2208);
    float _2228 = fma(_2220, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2208);
    out.m_79.w = _2222;
    out.m_85.x = _2224;
    out.m_85.y = _2226;
    out.m_85.z = _2228;
    if (!_2196)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2230 = -_1223;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2234 = -_1225;
    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2238 = -_1227;
    float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2242 = _2232 * _2232;
    float _2244 = fma(_2236, _2236, _2242);
    float _2246 = fma(_2240, _2240, _2244);
    float _2248 = sqrt(_2246);
    float _2250 = rsqrt(_2246);
    float _2252 = -_2248;
    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2256 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    float _2260 = _2236 * _2250;
    float _2262 = _2232 * _2250;
    float _2264 = abs(_2258);
    float _2266 = log2(_2264);
    float _2268 = _2240 * _2250;
    float _2270 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2272 = _1894 * _2262;
    float _2274 = -_2262;
    float _2276 = -_2270;
    float _2278 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2276);
    float _2280 = fma(_1886, _2260, _2272);
    float _2282 = -_2268;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2278);
    float _2286 = fma(_1902, _2268, _2280);
    float _2288 = precise::clamp(_2286, 0.0, 1.0);
    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2292 = _2284 + _2290;
    float _2294 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2296 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = exp2(_2294);
    float _2302 = _2300 * _2298;
    float _2304 = _2288 * _2302;
    float _2306 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2308 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2310 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _2306;
    out.m_83.y = _2308;
    out.m_83.z = _2310;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2082 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_56.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_59.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2367 = as_type<float>(_120);
        out.gl_Position.z = _2367;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_61.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_59.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2436 = as_type<float>(_158);
        out.gl_Position.z = _2436;
    }
    if (_152)
    {
        return out;
    }
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _162 = !_160;
    float _180;
    if (!_162)
    {
        float _164 = in.m_63.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_104);
        float _186 = 1.0 / _184;
        float _188 = _138 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = in.m_56.x;
    float _194 = in.m_56.y;
    float _196 = in.m_56.z;
    float _198 = _194 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _200 = _194 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _202 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[4].x, _198);
    float _204 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[6].x, _200);
    float _206 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[4].z, _202);
    float _208 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[6].z, _204);
    float _210 = _206 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _212 = _208 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _214 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _216 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _218 = floor(_214);
    float _220 = floor(_216);
    float _222 = -_218;
    float _224 = _214 + _222;
    float _226 = -_220;
    float _228 = _216 + _226;
    float2 _2563 = float2(_224, _228);
    float _230 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2563, float2(0.0), isnan(_2563)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2563, float2(0.0), isnan(_2563)), level(0.0)).x;
    float _232 = in.m_63.x;
    float _234 = in.m_63.y;
    float _236 = in.m_63.z;
    float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _240 = log2(_238);
    float _242 = _194 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _254 = 1.0 + _252;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _258 = _256 != 0;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _262 = _260 != 0;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _266 = _264 != 0;
    float _268 = 1.0 / _246;
    bool _270 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _272 = isnan(1.0);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _278 = _274 || _276;
    float _280 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[5].x, _242);
    bool _282 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _284 = isnan(0.0);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _290 = _286 || _288;
    float _292 = _240 * _138;
    float _294 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _296 = 1.0 / _250;
    float _298 = _294 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _300 = _236 * 2.0;
    float _302 = _234 * 2.0;
    float _304 = _232 * 2.0;
    float _306 = exp2(_292);
    float _308 = _234 + _236;
    float _310 = _236 + _232;
    float _312 = _236 + (-0.5);
    float _314 = _234 + _232;
    float _316 = _234 + (-0.5);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _190 + _318;
    float _322 = _232 + (-0.5);
    float _324 = floor(_300);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = _190 + _326;
    float _330 = _320 * _296;
    float _332 = _314 + (-1.0);
    float _334 = _308 + (-1.0);
    float _336 = _328 * _268;
    float _338 = 1.0 / _254;
    float _340 = -_306;
    float _342 = _340 + 1.0;
    float _344 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _346 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_190);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _298 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _364 = _290 ? _342 : 0.0;
    float _366 = floor(_302);
    bool _368 = _324 >= 0.0;
    bool _370 = isnan(_324);
    bool _372 = _368 || _370;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    float _378 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _380 = _324 > 0.0;
    float _382 = _310 + (-1.0);
    bool _384 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_190);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -_356;
    float _398 = _396 + 1.0;
    float _400 = floor(_304);
    int _402 = 2;
    float _404 = _210;
    if (_278)
    {
        float _406 = _364 * _338;
        _142 = _406;
    }
    float _408 = _142;
    bool _410 = !_258;
    int _412 = _410 ? 0 : 1;
    float _414 = -_394;
    float _416 = _414 + 1.0;
    int _418 = _376 ? 0 : 1;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _422 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_190);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _434;
    bool _438 = _366 > 0.0;
    float _440 = fma(_360, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _442 = _366 >= 0.0;
    bool _444 = isnan(_366);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = _432 * _398;
    float _454 = fma(_436, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _456 = -_432;
    float _458 = _456 + 1.0;
    int _460 = abs(_412);
    float _462 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _362);
    bool _464 = _400 > 0.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _466;
    bool _470 = _400 >= 0.0;
    bool _472 = isnan(_400);
    bool _474 = _470 || _472;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    float _480 = _356 * _416;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = fma(_468, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = fma(_484, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _498 = _440 * _452;
    float _500 = _298 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _502 = _486 * _452;
    float _504 = _454 * _452;
    float _506 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].y, _498);
    float _508 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _500);
    float _510 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].x, _502);
    float _512 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].z, _504);
    int _514 = ~_418;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = in.m_65.x;
    float _522 = in.m_65.y;
    float _524 = in.m_65.z;
    int _526 = _518;
    if (!_380)
    {
        int _528 = ~_418;
        int _530 = _528 + 1;
        _526 = _530;
    }
    int _532 = _526;
    float _534 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[11].z, _508);
    float _536 = float(_460);
    float _538 = fma(_494, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _540 = fma(_490, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _542 = _534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _544 = float(_532);
    float _546 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[10].z, _462);
    int _548 = _450 ? 0 : 1;
    float _550 = 1.0 / _542;
    int _552 = _478 ? 0 : 1;
    float _554 = _536 * _544;
    int _556 = ~_548;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    float _562 = fma(_496, _480, _510);
    int _564 = _560;
    if (!_438)
    {
        int _566 = ~_548;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    float _572 = _554 * (-2.0);
    bool _574 = !_262;
    int _576 = _574 ? 0 : 1;
    float _578 = _546 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _580 = ~_552;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[145].x, _562);
    int _588 = _584;
    if (!_464)
    {
        int _590 = ~_552;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = fma(_538, _480, _506);
    int _598 = abs(_576);
    float _600 = fma(_344, _572, _344);
    bool _602 = !_266;
    int _604 = _602 ? 0 : 1;
    float _606 = fma(_572, _520, _520);
    float _608 = float(_598);
    float _610 = _578 + _542;
    float _612 = float(_594);
    float _614 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[196].x, _606);
    int _616 = abs(_604);
    float _618 = _610 * _550;
    float _620 = _618 * 0.5;
    float _622 = in.m_67.x;
    float _624 = in.m_67.y;
    float _626 = in.m_67.z;
    float _628 = _608 * _612;
    float _630 = fma(_600, _408, _614);
    float _632 = float(_570);
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _636 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[30].w, _634);
    float _638 = float(_616);
    float _640 = _628 * (-2.0);
    float _642 = _630 * 0.15915493667125701904296875;
    float _644 = in.m_69.x;
    float _646 = in.m_69.y;
    float _648 = in.m_69.z;
    float _650 = fma(_540, _480, _512);
    float _652 = 1.0 / _636;
    float _654 = _638 * _632;
    float _656 = fma(_640, _522, _522);
    float _658 = fma(_378, _640, _378);
    float _660 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[145].z, _650);
    float _662 = _654 * (-2.0);
    float _664 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[196].y, _656);
    float _666 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[145].y, _596);
    float _668 = fma(_662, _524, _524);
    float _670 = fma(_658, _408, _664);
    float _672 = _642 * 6.283185482025146484375;
    float _674 = cos(_672);
    float _676 = _666 * _624;
    float _678 = fma(_420, _662, _420);
    float _680 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _668);
    float _682 = _586 * _622;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _686 = _652 * _684;
    float _688 = _670 * 0.15915493667125701904296875;
    float _690 = fma(_678, _408, _680);
    float _692 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _694 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _696 = _686 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _644);
    float _700 = _690 * 0.15915493667125701904296875;
    bool _702 = _686 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _704 = _688 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _692 * _698;
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _646);
    float _712 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _714 = _298 + _694;
    bool _716 = !_696;
    int _718 = _716 ? 0 : 1;
    float _720 = _660 * _626;
    float _722 = _712 * _710;
    float _724 = _688 * 6.283185482025146484375;
    float _726 = cos(_724);
    float _728 = _714 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    if (!_696)
    {
        _402 = 1;
    }
    int _730 = _402;
    float _732 = _714 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _734 = _730;
    if (!_702)
    {
        _734 = _718;
    }
    int _736 = _734;
    float _738 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[127].x, _728);
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _648);
    float _742 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[126].x, _732);
    float _744 = _700 * 6.283185482025146484375;
    float _746 = cos(_744);
    int _748 = _736 << 6;
    float _750 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[127].z, _738);
    float _752 = _674 * _706;
    float _754 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[126].z, _742);
    int _756 = _748 + 96;
    uint _759 = uint(int(uint(_756) >> uint(2)));
    uint _761 = uint(int(uint(int(_759)) >> uint(2)));
    int _763 = int(_759) & 3;
    float _765 = (*spvDescriptorSet0.vp_c15)._m0[int(_761)][_763];
    int _767 = int(_759) + 1;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    int _771 = _767 & 3;
    float _773 = (*spvDescriptorSet0.vp_c15)._m0[int(_769)][_771];
    float _775 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _777 = _750 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _779 = _642 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _674 * _726;
    float _785 = _754 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _787 = _775 * _740;
    bool _789 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _791 = isnan(0.5);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _797 = _793 || _795;
    float _799 = _700 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _674 * _746;
    int _805 = _748 + 48;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    uint _809 = uint(int(uint(int(_807)) >> uint(2)));
    int _811 = int(_807) & 3;
    float _813 = (*spvDescriptorSet0.vp_c15)._m0[int(_809)][_811];
    int _815 = int(_807) + 1;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    int _819 = _815 & 3;
    float _821 = (*spvDescriptorSet0.vp_c15)._m0[int(_817)][_819];
    float _823 = _803 * _722;
    float _825 = _781 * _706;
    float _827 = _781 * _726;
    float _829 = trunc(_785);
    int _831 = int(_829);
    float _833 = _781 * _746;
    float _835 = _726 * _746;
    float _837 = _706 * _746;
    float _839 = _833 * _722;
    float _841 = fma(_801, _783, _825);
    float _843 = -_752;
    float _845 = fma(_801, _827, _843);
    float _847 = trunc(_777);
    int _849 = int(_847);
    float _851 = -_827;
    float _853 = fma(_801, _752, _851);
    float _855 = fma(_841, _708, _823);
    float _857 = -_722;
    float _859 = _801 * _857;
    int _861 = _748 + 104;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    uint _865 = uint(int(uint(int(_863)) >> uint(2)));
    int _867 = int(_863) & 3;
    float _869 = (*spvDescriptorSet0.vp_c15)._m0[int(_865)][_867];
    int _871 = int(_863) + 1;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    int _875 = _871 & 3;
    float _877 = (*spvDescriptorSet0.vp_c15)._m0[int(_873)][_875];
    float _879 = fma(_801, _825, _783);
    float _881 = fma(_853, _787, _855);
    float _883 = fma(_835, _708, _859);
    float _885 = fma(_845, _708, _839);
    int _887 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _889 = _831 + _887;
    int _891 = _889 + 1;
    float _893 = _881 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _895 = fma(_837, _787, _883);
    int _897 = _748 + 64;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    uint _901 = uint(int(uint(int(_899)) >> uint(2)));
    int _903 = int(_899) & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    int _907 = int(_899) + 1;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    int _911 = _907 & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    float _915 = _881 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _917 = fma(_879, _787, _885);
    float _919 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[10].x, _893);
    int _921 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _923 = _849 + _921;
    int _925 = _923 + 1;
    float _927 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[8].x, _915);
    bool _929 = _891 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _931 = fma(_917, (*spvDescriptorSet0.vp_c10)._m0[10].z, _919);
    int _933 = _748 + 56;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.vp_c15)._m0[int(_937)][_939];
    int _943 = int(_935) + 1;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    int _947 = _943 & 3;
    float _949 = (*spvDescriptorSet0.vp_c15)._m0[int(_945)][_947];
    int _951 = _891 | _925;
    float _953 = fma(_917, (*spvDescriptorSet0.vp_c10)._m0[8].z, _927);
    float _955 = _212 + _931;
    float _957 = _714 * _773;
    bool _959 = _951 < 0;
    bool _961 = _959 || _929;
    float _963 = _210 + _953;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _955 + _965;
    int _969 = _748 + 72;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    uint _973 = uint(int(uint(int(_971)) >> uint(2)));
    int _975 = int(_971) & 3;
    float _977 = (*spvDescriptorSet0.vp_c15)._m0[int(_973)][_975];
    int _979 = int(_971) + 1;
    uint _981 = uint(int(uint(_979) >> uint(2)));
    int _983 = _979 & 3;
    float _985 = (*spvDescriptorSet0.vp_c15)._m0[int(_981)][_983];
    bool _987 = _925 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _989 = _987 || _961;
    float _991 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _993 = _963 + _991;
    float _995 = _967 * _967;
    float _997 = fma(_210, _765, _957);
    float _999 = _714 * _821;
    float _1001 = _881 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1003 = fma(_993, _993, _995);
    int _1005 = _748 + 80;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    uint _1009 = uint(int(uint(int(_1007)) >> uint(2)));
    int _1011 = int(_1007) & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    int _1015 = int(_1007) + 1;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    int _1019 = _1015 & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    float _1023 = fma(_210, _813, _999);
    float _1025 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1001);
    float _1027 = sqrt(_1003);
    int _1029 = as_type<int>(_881);
    int _1031 = as_type<int>(_997);
    int _1033 = as_type<int>(_1025);
    float _1035 = _963;
    float _1037 = _955;
    float _1039 = _1003;
    float _1041 = _967;
    float _1043 = _993;
    float _1045 = as_type<float>(_736);
    float _1047 = _895;
    if (!_989)
    {
        int _1049 = _925 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1051 = _1049 + _891;
        _1029 = _1051;
    }
    int _1053 = _1029;
    float _1055 = fma(_917, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1025);
    float _1057 = _999;
    if (!_989)
    {
        float _1059 = floor(_785);
        _1057 = _1059;
    }
    float _1061 = _1057;
    float _1063 = _298 + _1055;
    float _1065 = fma(_212, _869, _997);
    if (!_989)
    {
        int _1067 = _1053 << 2;
        _1031 = _1067;
    }
    int _1069 = _1031;
    bool _1071 = _1027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1073 = _1065 + _877;
    if (!_989)
    {
        int _1075 = 12 & _1069;
        _1033 = _1075;
    }
    int _1077 = _1033;
    float _1079 = _714 * _913;
    float _1081 = 1.0 / _1073;
    float _1083 = fma(_210, _905, _1079);
    int _1085 = as_type<int>(_905);
    if (!_989)
    {
        uint _1087 = uint(int(uint(_1053) >> uint(2)));
        _1085 = int(_1087);
    }
    int _1089 = _1085;
    float _1091 = fma(_212, _941, _1023);
    int _1093 = _1089;
    if (!_989)
    {
        int _1095 = _1089 << 4;
        int _1097 = _1095 + _1077;
        _1093 = _1097;
    }
    int _1099 = _1093;
    float _1101 = _1091 + _949;
    float _1103 = fma(_212, _977, _1083);
    float _1105 = _977;
    if (!_1071)
    {
        _1105 = _1063;
    }
    float _1107 = _1105;
    float _1109 = _1103 + _985;
    bool _1111 = !_1071;
    float _1113 = _1107;
    if (!_1111)
    {
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1119 = _1027 + _1117;
        float _1121 = _1063 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = rsqrt(_1003);
        float _1125 = _1119 * _1115;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = sin(_1129);
        float _1133 = _1127 * 6.283185482025146484375;
        float _1135 = cos(_1133);
        float _1137 = fma(_1131, _1121, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1139 = _1123 * _1137;
        float _1141 = _1135 + (-1.0);
        float _1143 = fma(_993, _1139, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1145 = fma(_967, _1139, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1147 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = fma(_1063, _1135, _1147);
        _1035 = _1143;
        _1113 = _1149;
        _1037 = _1145;
        _1039 = _1123;
    }
    float _1151 = _1035;
    float _1153 = _1113;
    float _1155 = _1037;
    float _1157 = _1039;
    float _1159 = _1157;
    if (_797)
    {
        _1159 = _1151;
    }
    float _1161 = _1159;
    float _1163 = _1161;
    if (_797)
    {
        _1041 = _1153;
    }
    float _1165 = _1041;
    float _1167 = _1165;
    if (_797)
    {
        _1043 = _1155;
    }
    float _1169 = _1043;
    float _1171 = _1169;
    if (!_797)
    {
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1175 = _298 + _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1179 = _210 + _1177;
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1183 = -_298;
        float _1185 = _1183 + _1153;
        float _1187 = _1175 * _1175;
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1191 = _212 + _1189;
        float _1193 = -_210;
        float _1195 = _1193 + _1151;
        float _1197 = -_212;
        float _1199 = _1197 + _1155;
        float _1201 = fma(_1179, _1179, _1187);
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1205 = fma(_1191, _1191, _1201);
        float _1207 = sqrt(_1205);
        float _1209 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1211 = precise::min(_1207, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1213 = _1211 * _1203;
        float _1215 = _1209 * _1213;
        float _1217 = fma(_1185, _1215, _298);
        float _1219 = fma(_1195, _1215, _210);
        float _1221 = fma(_1199, _1215, _212);
        _1167 = _1217;
        _1163 = _1219;
        _1171 = _1221;
    }
    float _1223 = _1167;
    float _1225 = _1163;
    float _1227 = _1171;
    int _1229 = _748 + 88;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    uint _1233 = uint(int(uint(int(_1231)) >> uint(2)));
    int _1235 = int(_1231) & 3;
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[int(_1233)][_1235];
    int _1239 = int(_1231) + 1;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    int _1243 = _1239 & 3;
    float _1245 = (*spvDescriptorSet0.vp_c15)._m0[int(_1241)][_1243];
    float _1247 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1249 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1251 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1253 = _1101 * _1081;
    float _1255 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1247);
    float _1257 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1249);
    float _1259 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1251);
    float _1261 = _1151;
    if (!_989)
    {
        int _1263 = _1099 + 400;
        uint _1265 = uint(int(uint(_1263) >> uint(2)));
        uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
        int _1269 = int(_1265) & 3;
        float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
        _1261 = _1271;
    }
    float _1273 = _1261;
    float _1275 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1255);
    bool _1277 = _1253 >= 0.0;
    float _1279 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1281 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1257);
    float _1283 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1259);
    float _1285 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = _1109 * _1081;
    bool _1289 = _1253 <= 1.0;
    bool _1291 = _1289 && _1277;
    float _1293 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1279);
    float _1295 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1297 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1301 = _1287 >= 0.0;
    bool _1303 = _1301 && _1291;
    float _1305 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1309 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1293);
    float _1311 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    bool _1313 = _1287 <= 1.0;
    bool _1315 = _1313 && _1303;
    float _1317 = -_1307;
    float _1319 = fma(_1317, _1305, 1.0);
    float _1321 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1323 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1311);
    float _1325 = _714 * _1021;
    float _1327 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1329 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1331 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1323);
    float _1333 = fma(_210, _1013, _1325);
    float _1335 = log2(_1319);
    float _1337 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1327);
    float _1339 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1329);
    float _1341 = _1331;
    if (_1315)
    {
        float _1343 = float(_736);
        _1045 = _1343;
    }
    float _1345 = _1045;
    float _1347 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1337);
    float _1349 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1339);
    float _1351 = 1.0 / _1331;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float _1355 = fma(_212, _1237, _1333);
    float _1357 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1347);
    float _1359 = as_type<float>(_1077);
    float _1361 = _1245;
    float _1363 = _1345;
    float _1365 = _1353;
    if (!_989)
    {
        float _1367 = floor(_777);
        _1359 = _1367;
    }
    float _1369 = _1359;
    float _1371 = _1355 + _1245;
    float _1373 = _1335 * 0.693147182464599609375;
    if (!_989)
    {
        float _1375 = -_1061;
        float _1377 = _785 + _1375;
        _1361 = _1377;
    }
    float _1379 = _1361;
    float _1381 = _1371 * _1081;
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1385 = _1325;
    float _1387 = _1379;
    if (_1315)
    {
        float _1389 = rint(_1345);
        float _1391 = precise::max(_1389, 0.0);
        uint _1393 = uint(_1391);
        uint _1395 = clamp(_1393, 0u, 65535u);
        _1385 = as_type<float>(_1395);
    }
    float _1397 = _1385;
    float _1399 = _1357 * _1351;
    float _1401 = _1353 * _1351;
    float _1403 = fma(_1399, 0.5, 0.5);
    float _1405 = _1371;
    if (!_989)
    {
        float _1407 = rint(_1273);
        float _1409 = precise::max(_1407, 0.0);
        uint _1411 = uint(_1409);
        uint _1413 = clamp(_1411, 0u, 65535u);
        _1405 = as_type<float>(_1413);
    }
    float _1415 = _1405;
    if (!_989)
    {
        float _1417 = -_1369;
        float _1419 = _777 + _1417;
        _1047 = _1419;
    }
    float _1421 = _1047;
    float _1423 = fma(_1401, -0.5, 0.5);
    float _1425 = as_type<float>(_748);
    if (_1315)
    {
        float3 _4478 = float3(_1253, _1287, float(as_type<int>(_1397)));
        float3 _4482 = select(_4478, float3(0.0), isnan(_4478));
        float _1427 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4482.xy, uint(rint(_4482.z)), _1381, level(0.0));
        _1425 = _1427;
    }
    float _1429 = _1425;
    float3 _4492 = float3(_1403, _1423, _1383);
    float _1431 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4492, float3(0.0), isnan(_4492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4492, float3(0.0), isnan(_4492)), level(0.0)).x;
    float3 _4501 = float3(_1403, _1423, _1383);
    float4 _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4501, float3(0.0), isnan(_4501)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4501, float3(0.0), isnan(_4501)), level(0.0)).xyzw;
    float _1436 = _1434.x;
    float _1438 = _1434.y;
    float _1440 = _1434.z;
    float _1442 = _1434.w;
    float _1444 = _1339;
    if (!_989)
    {
        float3 _4524 = float3(_1379, _1421, float(as_type<int>(_1415)));
        float3 _4526 = select(_4524, float3(0.0), isnan(_4524));
        float _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4526.xy, uint(rint(_4526.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4526.xy, uint(rint(_4526.z)), level(0.0)).x;
        _1444 = _1446;
    }
    float _1448 = _1444;
    if (_989)
    {
        _1363 = 1.0;
    }
    float _1450 = _1363;
    float _1452 = _1450;
    if (!_989)
    {
        int _1454 = _1053 << 4;
        int _1456 = _1454 + 2048;
        uint _1458 = uint(int(uint(_1456) >> uint(2)));
        uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
        int _1462 = int(_1458) & 3;
        float _1464 = (*spvDescriptorSet0.vp_c15)._m0[int(_1460)][_1462];
        int _1466 = int(_1458) + 1;
        uint _1468 = uint(int(uint(_1466) >> uint(2)));
        int _1470 = _1466 & 3;
        float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
        int _1474 = _1456 + 8;
        uint _1476 = uint(int(uint(_1474) >> uint(2)));
        uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
        int _1480 = int(_1476) & 3;
        float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
        int _1484 = int(_1476) + 1;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        int _1488 = _1484 & 3;
        float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
        float _1492 = _714 * _1472;
        float _1494 = fma(_210, _1464, _1492);
        float _1496 = fma(_212, _1482, _1494);
        float _1498 = _1496 + _1490;
        float _1500 = precise::clamp(_1498, 0.0, 1.0);
        float _1502 = -_1500;
        float _1504 = _1502 + _1448;
        float _1506 = fma(_1504, 500.0, 1.5);
        float _1508 = exp2(_1506);
        float _1510 = 0.0 + _1508;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1387 = _1490;
        _1452 = _1512;
    }
    float _1514 = _1387;
    float _1516 = _1452;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1520 = _1223 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1524 = _1225 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1227 + _1526;
    float _1530 = _1520 * _1520;
    float _1532 = fma(_1524, _1524, _1530);
    float _1534 = fma(_1528, _1528, _1532);
    float _1536 = rsqrt(_1534);
    float _1538 = sqrt(_1534);
    float _1540 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1542 = _1524 * _1540;
    float _1544 = _1528 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 + _1548;
    float _1552 = sqrt(_1550);
    bool _1554 = _1552 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1552 + _1556;
    float _1560 = _1514;
    float _1562 = _1550;
    float _1564 = _1558;
    float _1566 = _1520;
    float _1568 = _1540;
    float _1570 = _1542;
    float _1572 = _1544;
    float _1574 = _1548;
    if (_1554)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1576;
    }
    float _1578 = _1560;
    if (_1554)
    {
        float _1580 = rsqrt(_1550);
        _1562 = _1580;
    }
    float _1582 = _1562;
    if (_1554)
    {
        float _1584 = _1558 * _1578;
        _1564 = _1584;
    }
    float _1586 = _1564;
    if (_1554)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _404 = _1588;
    }
    float _1590 = _404;
    float _1592 = _1423;
    if (_1554)
    {
        float _1594 = _1590 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1403;
    float _1606 = _1602;
    float _1608 = _1600;
    if (_1554)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = -_1540;
    float _1618 = -_1602;
    float _1620 = fma(_1520, _1616, _1618);
    if (!_1554)
    {
        _1606 = _1546;
    }
    float _1622 = _1606;
    float _1624 = _1622;
    if (_1554)
    {
        float _1626 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1626;
    }
    float _1628 = _1566;
    float _1630 = _1598;
    float _1632 = _1628;
    if (_1554)
    {
        float _1634 = fma(_1598, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1630 = _1634;
    }
    float _1636 = _1630;
    float _1638 = _1636;
    if (!_1554)
    {
        _1632 = _1620;
    }
    float _1640 = _1632;
    float _1642 = _1640;
    if (_1554)
    {
        float _1644 = _1614 + (-1.0);
        _1608 = _1644;
    }
    float _1646 = _1608;
    if (_1554)
    {
        float _1648 = _1582 * _1636;
        _1568 = _1648;
    }
    float _1650 = _1568;
    if (_1554)
    {
        float _1652 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1554)
    {
        float _1656 = _1542 * _1650;
        _1570 = _1656;
    }
    float _1658 = _1570;
    if (_1554)
    {
        float _1660 = _1544 * _1650;
        _1572 = _1660;
    }
    float _1662 = _1572;
    if (_1554)
    {
        float _1664 = fma(_1620, _1614, _1654);
        _1642 = _1664;
    }
    float _1666 = _1642;
    if (_1554)
    {
        float _1668 = _1658 * _1658;
        _1624 = _1668;
    }
    float _1670 = _1624;
    if (_1554)
    {
        float _1672 = _1662 * _1662;
        _1574 = _1672;
    }
    float _1674 = _1574;
    float _1676 = fma(_1666, _1666, _1670);
    float _1678 = _1676 + _1674;
    float _1680 = rsqrt(_1678);
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1684 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1682);
    float _1686 = precise::clamp(_1684, 0.0, 1.0);
    float _1688 = -_1686;
    float _1690 = _1688 + 1.0;
    float _1692 = _1680 * _1658;
    float _1694 = _1680 * _1666;
    float _1696 = _1680 * _1662;
    float _1698 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1700 = abs(_1690);
    float _1702 = log2(_1700);
    float _1704 = -_1698;
    float _1706 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1704);
    float _1708 = -_1696;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1706);
    float _1712 = fma(_1710, -0.5, 0.5);
    float _1714 = fma(_1710, 0.5, 0.5);
    float _1716 = fma(_1714, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1718 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1720 = sqrt(_1712);
    float _1722 = fma(_1714, _1716, -0.212114393711090087890625);
    float _1724 = _1694 + 1.0;
    float _1726 = fma(_1714, _1722, 1.570728778839111328125);
    float _1728 = exp2(_1718);
    float _1730 = _1720 * 0.636619746685028076171875;
    float _1732 = -_1726;
    float _1734 = fma(_1730, _1732, 1.0);
    float _1736 = -_1694;
    float _1738 = fma(_1728, _1724, _1736);
    float _1740 = fma(_1738, 0.5, 0.5);
    float2 _4980 = float2(_1734, _1740);
    float3 _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4980, float2(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4980, float2(0.0), isnan(_4980)), level(0.0)).xyz;
    float _1746 = _1744.x;
    float _1748 = _1744.y;
    float _1750 = _1744.z;
    float _1752 = abs(_686);
    float _1754 = log2(_1752);
    float _1756 = in.m_71.x;
    float _1758 = in.m_71.y;
    float _1760 = in.m_71.z;
    bool _1762 = _646 != 0.0;
    bool _1764 = isnan(_646);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(0.0);
    bool _1770 = _1766 || _1768;
    float _1772 = -_230;
    float _1774 = _1772 + 1.0;
    bool _1776 = _644 == 0.0;
    bool _1778 = !_1770;
    bool _1780 = _1776 && _1778;
    bool _1782 = _648 == 0.0;
    bool _1784 = _1782 && _1780;
    float _1786 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = exp2(_1786);
    float _1800 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = _1758;
    float _1806 = _1756;
    float _1808 = _1760;
    if (!_1784)
    {
        float _1810 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1758);
        _1804 = _1810;
    }
    float _1812 = _1804;
    if (!_1784)
    {
        float _1814 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1756);
        _1806 = _1814;
    }
    float _1816 = _1806;
    if (!_1784)
    {
        float _1818 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1760);
        _1808 = _1818;
    }
    float _1820 = _1808;
    float _1822 = -_1812;
    float _1824 = _801 * _1822;
    float _1826 = _803 * _1812;
    float _1828 = _833 * _1812;
    float _1830 = fma(_835, _1816, _1824);
    float _1832 = fma(_841, _1816, _1826);
    float _1834 = fma(_845, _1816, _1828);
    out.m_73.x = _1800;
    out.m_73.y = _1796;
    out.m_73.z = _1802;
    out.m_73.w = _1794;
    float _1836 = fma(_837, _1820, _1830);
    float _1838 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1840 = precise::clamp(_1838, 0.0, 1.0);
    float _1842 = fma(_853, _1820, _1832);
    float _1844 = fma(_879, _1820, _1834);
    float _1846 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1848 = _686 <= 8000.0;
    bool _1850 = isnan(_686);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan(8000.0);
    bool _1856 = _1852 || _1854;
    float _1858 = float(_1856);
    float _1860 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1862 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1864 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1866 = isnan(_1538);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1872 = _1868 || _1870;
    float _1874 = exp2(_1846);
    float _1876 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1860);
    float _1878 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1862);
    float _1880 = fma(_1840, -2.0, 3.0);
    float _1882 = _1840 * _1840;
    float _1884 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1886 = fma(_1844, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1876);
    float _1888 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1890 = _1882 * _1880;
    float _1892 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1884);
    float _1894 = fma(_1844, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1878);
    float _1896 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1888);
    float _1898 = -_1890;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1844, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1892);
    float _1904 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1896);
    float _1906 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1890);
    float _1908 = -_1874;
    float _1910 = _1908 + 1.0;
    out.m_75.x = _1886;
    out.m_75.y = _1894;
    out.m_75.z = _1902;
    float _1912 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1904);
    float _1914 = _1858 * _1906;
    float _1916 = _1906;
    float _1918 = _1912;
    if (!_1315)
    {
        _1916 = 1.0;
    }
    float _1920 = _1916;
    float _1922 = _1920;
    if (_1315)
    {
        bool _1924 = _1429 >= _1381;
        bool _1926 = isnan(_1429);
        bool _1928 = _1924 || _1926;
        bool _1930 = isnan(_1381);
        bool _1932 = _1928 || _1930;
        float _1934 = float(_1932);
        _1922 = _1934;
    }
    float _1936 = _1922;
    float _1938 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1940 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1357;
    out.gl_Position.y = _1353;
    out.gl_Position.z = _1912;
    out.gl_Position.w = _1331;
    float _1942 = _1774 * _1938;
    float _1944 = precise::clamp(_1942, 0.0, 1.0);
    float _1946 = _1940 * _1431;
    float _1948 = _1936 * _1516;
    float _1950 = -_1944;
    float _1952 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1954 = _1442 * _1946;
    float _1956 = -_1948;
    float _1958 = fma(_1956, _1952, 1.0);
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1962 = -_1940;
    float _1964 = _1962 + 1.0;
    float _1966 = _1960 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1968 = 1.0;
    float _1970 = 1.0;
    float _1972 = _1964;
    if (!_1872)
    {
        _1341 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1974 = _1341;
    float _1976 = _1442 * _1964;
    float _1978 = _1974;
    float _1980 = _1974;
    if (!_1872)
    {
        _1918 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1982 = _1918;
    out.m_79.x = _1966;
    float _1984 = _1982;
    float _1986 = _1982;
    if (!_1872)
    {
        _1365 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1988 = _1365;
    float _1990 = _1988;
    float _1992 = _1988;
    if (!_1872)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1994 = _1968;
    float _1996 = _1994;
    float _1998 = _1994;
    if (!_1872)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2000 = _1970;
    float _2002 = _2000;
    float _2004 = _2000;
    if (!_1872)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2006 = _1972;
    float _2008 = _1750 * _1946;
    float _2010 = fma(_1746, _1954, _1436);
    float _2012 = fma(_1748, _1954, _1438);
    float _2014 = fma(_1442, _2008, _1440);
    out.m_81.x = _2010;
    out.m_81.y = _2012;
    out.m_81.z = _2014;
    out.m_81.w = _1976;
    bool _2016 = !_1872;
    float _2018 = _2006;
    float _2020 = _2006;
    if (!_2016)
    {
        bool _2022 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2024 = isnan(_1538);
        bool _2026 = _2022 || _2024;
        bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2030 = _2026 || _2028;
        if (!_2030)
        {
            float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2034 = _1538 + _2032;
            float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2038 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2036;
            float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2042 = _2040 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2044 = 1.0 / _2038;
            float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2048 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2052 = _2050 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2062 = _2034 * _2044;
            float _2064 = precise::clamp(_2062, 0.0, 1.0);
            float _2066 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2070 = fma(_2064, _2042, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2072 = fma(_2064, _2068, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2074 = fma(_2064, _2048, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2076 = fma(_2064, _2052, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2078 = fma(_2064, _2056, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2080 = fma(_2064, _2060, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2004 = _2074;
            _1992 = _2078;
            _1998 = _2070;
            _1986 = _2076;
            _1980 = _2072;
            _2020 = _2080;
            _2082 = true;
        }
        else
        {
            bool _2084 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2086 = isnan(_1538);
            bool _2088 = _2084 || _2086;
            bool _2090 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2092 = _2088 || _2090;
            if (!_2092)
            {
                _1996 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2094 = _1996;
            _1998 = _2094;
            if (!_2092)
            {
                _2002 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2096 = _2002;
            _2004 = _2096;
            if (!_2092)
            {
                _1978 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2098 = _1978;
            _1980 = _2098;
            if (!_2092)
            {
                _1984 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2100 = _1984;
            _1986 = _2100;
            if (!_2092)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2102 = _1990;
            _1992 = _2102;
            if (!_2092)
            {
                _2018 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2104 = _2018;
            bool _2106 = !_2092;
            _2020 = _2104;
            if (!_2106)
            {
                bool _2108 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2110 = isnan(_1538);
                bool _2112 = _2108 || _2110;
                bool _2114 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2116 = _2112 || _2114;
                if (!_2116)
                {
                    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2120 = _1538 + _2118;
                    float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2124 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2122;
                    float _2126 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2128 = _2126 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2130 = 1.0 / _2124;
                    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2138 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2148 = _2120 * _2130;
                    float _2150 = precise::clamp(_2148, 0.0, 1.0);
                    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2156 = fma(_2150, _2128, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2158 = fma(_2150, _2154, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2160 = fma(_2150, _2134, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2162 = fma(_2150, _2138, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2164 = fma(_2150, _2142, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2166 = fma(_2150, _2146, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2004 = _2160;
                    _1992 = _2164;
                    _1998 = _2156;
                    _1986 = _2162;
                    _1980 = _2158;
                    _2020 = _2166;
                    _2082 = true;
                }
                else
                {
                    _2004 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1998 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1986 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1980 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2020 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2082 = false;
    float _2168 = _2004;
    float _2170 = _1992;
    float _2172 = _1998;
    float _2174 = _1986;
    float _2176 = _1980;
    float _2178 = _2020;
    float _2180 = fma(_1894, -0.5, 0.5);
    float _2182 = precise::clamp(_2180, 0.0, 1.0);
    float _2184 = -_2168;
    float _2186 = _2184 + _2170;
    float _2188 = -_2172;
    float _2190 = _2188 + _2174;
    float _2192 = -_2176;
    float _2194 = _2192 + _2178;
    bool _2196 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2198 = fma(_2182, _2186, _2168);
    float _2200 = fma(_2182, _2190, _2172);
    float _2202 = fma(_2182, _2194, _2176);
    float _2204 = _2198 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2206 = fma(_2200, 0.298911988735198974609375, _2204);
    float _2208 = fma(_2202, 0.114477999508380889892578125, _2206);
    out.m_83.x = 0.0;
    float _2210 = -_2208;
    float _2212 = _2200 + _2210;
    float _2214 = -_2208;
    float _2216 = _2198 + _2214;
    float _2218 = -_2208;
    float _2220 = _2202 + _2218;
    float _2222 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2224 = fma(_2212, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2208);
    float _2226 = fma(_2216, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2208);
    float _2228 = fma(_2220, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2208);
    out.m_79.w = _2222;
    out.m_85.x = _2224;
    out.m_85.y = _2226;
    out.m_85.z = _2228;
    if (!_2196)
    {
        return out;
    }
    float _2230 = -_1223;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2234 = -_1225;
    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2238 = -_1227;
    float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2242 = _2232 * _2232;
    float _2244 = fma(_2236, _2236, _2242);
    float _2246 = fma(_2240, _2240, _2244);
    float _2248 = sqrt(_2246);
    float _2250 = rsqrt(_2246);
    float _2252 = -_2248;
    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2256 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    float _2260 = _2236 * _2250;
    float _2262 = _2232 * _2250;
    float _2264 = abs(_2258);
    float _2266 = log2(_2264);
    float _2268 = _2240 * _2250;
    float _2270 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2272 = _1894 * _2262;
    float _2274 = -_2262;
    float _2276 = -_2270;
    float _2278 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2276);
    float _2280 = fma(_1886, _2260, _2272);
    float _2282 = -_2268;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2278);
    float _2286 = fma(_1902, _2268, _2280);
    float _2288 = precise::clamp(_2286, 0.0, 1.0);
    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2292 = _2284 + _2290;
    float _2294 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2296 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = exp2(_2294);
    float _2302 = _2300 * _2298;
    float _2304 = _2288 * _2302;
    float _2306 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2308 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2310 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _2306;
    out.m_83.y = _2308;
    out.m_83.z = _2310;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2082 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_56.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_59.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2367 = as_type<float>(_120);
        out.gl_Position.z = _2367;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_61.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_59.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2436 = as_type<float>(_158);
        out.gl_Position.z = _2436;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _162 = !_160;
    float _180;
    if (!_162)
    {
        float _164 = in.m_63.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_104);
        float _186 = 1.0 / _184;
        float _188 = _138 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = in.m_56.x;
    float _194 = in.m_56.y;
    float _196 = in.m_56.z;
    float _198 = _194 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _200 = _194 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _202 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[4].x, _198);
    float _204 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[6].x, _200);
    float _206 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[4].z, _202);
    float _208 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[6].z, _204);
    float _210 = _206 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _212 = _208 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _214 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _216 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _218 = floor(_214);
    float _220 = floor(_216);
    float _222 = -_218;
    float _224 = _214 + _222;
    float _226 = -_220;
    float _228 = _216 + _226;
    float2 _2563 = float2(_224, _228);
    float _230 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2563, float2(0.0), isnan(_2563)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2563, float2(0.0), isnan(_2563)), level(0.0)).x;
    float _232 = in.m_63.x;
    float _234 = in.m_63.y;
    float _236 = in.m_63.z;
    float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _240 = log2(_238);
    float _242 = _194 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _254 = 1.0 + _252;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _258 = _256 != 0;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _262 = _260 != 0;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _266 = _264 != 0;
    float _268 = 1.0 / _246;
    bool _270 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _272 = isnan(1.0);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _278 = _274 || _276;
    float _280 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[5].x, _242);
    bool _282 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _284 = isnan(0.0);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _290 = _286 || _288;
    float _292 = _240 * _138;
    float _294 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _296 = 1.0 / _250;
    float _298 = _294 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _300 = _236 * 2.0;
    float _302 = _234 * 2.0;
    float _304 = _232 * 2.0;
    float _306 = exp2(_292);
    float _308 = _234 + _236;
    float _310 = _236 + _232;
    float _312 = _236 + (-0.5);
    float _314 = _234 + _232;
    float _316 = _234 + (-0.5);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _190 + _318;
    float _322 = _232 + (-0.5);
    float _324 = floor(_300);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = _190 + _326;
    float _330 = _320 * _296;
    float _332 = _314 + (-1.0);
    float _334 = _308 + (-1.0);
    float _336 = _328 * _268;
    float _338 = 1.0 / _254;
    float _340 = -_306;
    float _342 = _340 + 1.0;
    float _344 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _346 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_190);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _298 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _364 = _290 ? _342 : 0.0;
    float _366 = floor(_302);
    bool _368 = _324 >= 0.0;
    bool _370 = isnan(_324);
    bool _372 = _368 || _370;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    float _378 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _380 = _324 > 0.0;
    float _382 = _310 + (-1.0);
    bool _384 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_190);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -_356;
    float _398 = _396 + 1.0;
    float _400 = floor(_304);
    int _402 = 2;
    float _404 = _210;
    if (_278)
    {
        float _406 = _364 * _338;
        _142 = _406;
    }
    float _408 = _142;
    bool _410 = !_258;
    int _412 = _410 ? 0 : 1;
    float _414 = -_394;
    float _416 = _414 + 1.0;
    int _418 = _376 ? 0 : 1;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _422 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_190);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _434;
    bool _438 = _366 > 0.0;
    float _440 = fma(_360, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _442 = _366 >= 0.0;
    bool _444 = isnan(_366);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = _432 * _398;
    float _454 = fma(_436, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _456 = -_432;
    float _458 = _456 + 1.0;
    int _460 = abs(_412);
    float _462 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _362);
    bool _464 = _400 > 0.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _466;
    bool _470 = _400 >= 0.0;
    bool _472 = isnan(_400);
    bool _474 = _470 || _472;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    float _480 = _356 * _416;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = fma(_468, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = fma(_484, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _498 = _440 * _452;
    float _500 = _298 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _502 = _486 * _452;
    float _504 = _454 * _452;
    float _506 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].y, _498);
    float _508 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _500);
    float _510 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].x, _502);
    float _512 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].z, _504);
    int _514 = ~_418;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = in.m_65.x;
    float _522 = in.m_65.y;
    float _524 = in.m_65.z;
    int _526 = _518;
    if (!_380)
    {
        int _528 = ~_418;
        int _530 = _528 + 1;
        _526 = _530;
    }
    int _532 = _526;
    float _534 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[11].z, _508);
    float _536 = float(_460);
    float _538 = fma(_494, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _540 = fma(_490, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _542 = _534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _544 = float(_532);
    float _546 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[10].z, _462);
    int _548 = _450 ? 0 : 1;
    float _550 = 1.0 / _542;
    int _552 = _478 ? 0 : 1;
    float _554 = _536 * _544;
    int _556 = ~_548;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    float _562 = fma(_496, _480, _510);
    int _564 = _560;
    if (!_438)
    {
        int _566 = ~_548;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    float _572 = _554 * (-2.0);
    bool _574 = !_262;
    int _576 = _574 ? 0 : 1;
    float _578 = _546 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _580 = ~_552;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[145].x, _562);
    int _588 = _584;
    if (!_464)
    {
        int _590 = ~_552;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = fma(_538, _480, _506);
    int _598 = abs(_576);
    float _600 = fma(_344, _572, _344);
    bool _602 = !_266;
    int _604 = _602 ? 0 : 1;
    float _606 = fma(_572, _520, _520);
    float _608 = float(_598);
    float _610 = _578 + _542;
    float _612 = float(_594);
    float _614 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[196].x, _606);
    int _616 = abs(_604);
    float _618 = _610 * _550;
    float _620 = _618 * 0.5;
    float _622 = in.m_67.x;
    float _624 = in.m_67.y;
    float _626 = in.m_67.z;
    float _628 = _608 * _612;
    float _630 = fma(_600, _408, _614);
    float _632 = float(_570);
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _636 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[30].w, _634);
    float _638 = float(_616);
    float _640 = _628 * (-2.0);
    float _642 = _630 * 0.15915493667125701904296875;
    float _644 = in.m_69.x;
    float _646 = in.m_69.y;
    float _648 = in.m_69.z;
    float _650 = fma(_540, _480, _512);
    float _652 = 1.0 / _636;
    float _654 = _638 * _632;
    float _656 = fma(_640, _522, _522);
    float _658 = fma(_378, _640, _378);
    float _660 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[145].z, _650);
    float _662 = _654 * (-2.0);
    float _664 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[196].y, _656);
    float _666 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[145].y, _596);
    float _668 = fma(_662, _524, _524);
    float _670 = fma(_658, _408, _664);
    float _672 = _642 * 6.283185482025146484375;
    float _674 = cos(_672);
    float _676 = _666 * _624;
    float _678 = fma(_420, _662, _420);
    float _680 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _668);
    float _682 = _586 * _622;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _686 = _652 * _684;
    float _688 = _670 * 0.15915493667125701904296875;
    float _690 = fma(_678, _408, _680);
    float _692 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _694 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _696 = _686 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _644);
    float _700 = _690 * 0.15915493667125701904296875;
    bool _702 = _686 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _704 = _688 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _692 * _698;
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _646);
    float _712 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _714 = _298 + _694;
    bool _716 = !_696;
    int _718 = _716 ? 0 : 1;
    float _720 = _660 * _626;
    float _722 = _712 * _710;
    float _724 = _688 * 6.283185482025146484375;
    float _726 = cos(_724);
    float _728 = _714 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    if (!_696)
    {
        _402 = 1;
    }
    int _730 = _402;
    float _732 = _714 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _734 = _730;
    if (!_702)
    {
        _734 = _718;
    }
    int _736 = _734;
    float _738 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[127].x, _728);
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _648);
    float _742 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[126].x, _732);
    float _744 = _700 * 6.283185482025146484375;
    float _746 = cos(_744);
    int _748 = _736 << 6;
    float _750 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[127].z, _738);
    float _752 = _674 * _706;
    float _754 = fma(_212, (*spvDescriptorSet0.vp_c15)._m0[126].z, _742);
    int _756 = _748 + 96;
    uint _759 = uint(int(uint(_756) >> uint(2)));
    uint _761 = uint(int(uint(int(_759)) >> uint(2)));
    int _763 = int(_759) & 3;
    float _765 = (*spvDescriptorSet0.vp_c15)._m0[int(_761)][_763];
    int _767 = int(_759) + 1;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    int _771 = _767 & 3;
    float _773 = (*spvDescriptorSet0.vp_c15)._m0[int(_769)][_771];
    float _775 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _777 = _750 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _779 = _642 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _674 * _726;
    float _785 = _754 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _787 = _775 * _740;
    bool _789 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _791 = isnan(0.5);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _797 = _793 || _795;
    float _799 = _700 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _674 * _746;
    int _805 = _748 + 48;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    uint _809 = uint(int(uint(int(_807)) >> uint(2)));
    int _811 = int(_807) & 3;
    float _813 = (*spvDescriptorSet0.vp_c15)._m0[int(_809)][_811];
    int _815 = int(_807) + 1;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    int _819 = _815 & 3;
    float _821 = (*spvDescriptorSet0.vp_c15)._m0[int(_817)][_819];
    float _823 = _803 * _722;
    float _825 = _781 * _706;
    float _827 = _781 * _726;
    float _829 = trunc(_785);
    int _831 = int(_829);
    float _833 = _781 * _746;
    float _835 = _726 * _746;
    float _837 = _706 * _746;
    float _839 = _833 * _722;
    float _841 = fma(_801, _783, _825);
    float _843 = -_752;
    float _845 = fma(_801, _827, _843);
    float _847 = trunc(_777);
    int _849 = int(_847);
    float _851 = -_827;
    float _853 = fma(_801, _752, _851);
    float _855 = fma(_841, _708, _823);
    float _857 = -_722;
    float _859 = _801 * _857;
    int _861 = _748 + 104;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    uint _865 = uint(int(uint(int(_863)) >> uint(2)));
    int _867 = int(_863) & 3;
    float _869 = (*spvDescriptorSet0.vp_c15)._m0[int(_865)][_867];
    int _871 = int(_863) + 1;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    int _875 = _871 & 3;
    float _877 = (*spvDescriptorSet0.vp_c15)._m0[int(_873)][_875];
    float _879 = fma(_801, _825, _783);
    float _881 = fma(_853, _787, _855);
    float _883 = fma(_835, _708, _859);
    float _885 = fma(_845, _708, _839);
    int _887 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _889 = _831 + _887;
    int _891 = _889 + 1;
    float _893 = _881 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _895 = fma(_837, _787, _883);
    int _897 = _748 + 64;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    uint _901 = uint(int(uint(int(_899)) >> uint(2)));
    int _903 = int(_899) & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    int _907 = int(_899) + 1;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    int _911 = _907 & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    float _915 = _881 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _917 = fma(_879, _787, _885);
    float _919 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[10].x, _893);
    int _921 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _923 = _849 + _921;
    int _925 = _923 + 1;
    float _927 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[8].x, _915);
    bool _929 = _891 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _931 = fma(_917, (*spvDescriptorSet0.vp_c10)._m0[10].z, _919);
    int _933 = _748 + 56;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.vp_c15)._m0[int(_937)][_939];
    int _943 = int(_935) + 1;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    int _947 = _943 & 3;
    float _949 = (*spvDescriptorSet0.vp_c15)._m0[int(_945)][_947];
    int _951 = _891 | _925;
    float _953 = fma(_917, (*spvDescriptorSet0.vp_c10)._m0[8].z, _927);
    float _955 = _212 + _931;
    float _957 = _714 * _773;
    bool _959 = _951 < 0;
    bool _961 = _959 || _929;
    float _963 = _210 + _953;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _955 + _965;
    int _969 = _748 + 72;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    uint _973 = uint(int(uint(int(_971)) >> uint(2)));
    int _975 = int(_971) & 3;
    float _977 = (*spvDescriptorSet0.vp_c15)._m0[int(_973)][_975];
    int _979 = int(_971) + 1;
    uint _981 = uint(int(uint(_979) >> uint(2)));
    int _983 = _979 & 3;
    float _985 = (*spvDescriptorSet0.vp_c15)._m0[int(_981)][_983];
    bool _987 = _925 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _989 = _987 || _961;
    float _991 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _993 = _963 + _991;
    float _995 = _967 * _967;
    float _997 = fma(_210, _765, _957);
    float _999 = _714 * _821;
    float _1001 = _881 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1003 = fma(_993, _993, _995);
    int _1005 = _748 + 80;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    uint _1009 = uint(int(uint(int(_1007)) >> uint(2)));
    int _1011 = int(_1007) & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    int _1015 = int(_1007) + 1;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    int _1019 = _1015 & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    float _1023 = fma(_210, _813, _999);
    float _1025 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1001);
    float _1027 = sqrt(_1003);
    int _1029 = as_type<int>(_881);
    int _1031 = as_type<int>(_997);
    int _1033 = as_type<int>(_1025);
    float _1035 = _963;
    float _1037 = _955;
    float _1039 = _1003;
    float _1041 = _967;
    float _1043 = _993;
    float _1045 = as_type<float>(_736);
    float _1047 = _895;
    if (!_989)
    {
        int _1049 = _925 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1051 = _1049 + _891;
        _1029 = _1051;
    }
    int _1053 = _1029;
    float _1055 = fma(_917, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1025);
    float _1057 = _999;
    if (!_989)
    {
        float _1059 = floor(_785);
        _1057 = _1059;
    }
    float _1061 = _1057;
    float _1063 = _298 + _1055;
    float _1065 = fma(_212, _869, _997);
    if (!_989)
    {
        int _1067 = _1053 << 2;
        _1031 = _1067;
    }
    int _1069 = _1031;
    bool _1071 = _1027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1073 = _1065 + _877;
    if (!_989)
    {
        int _1075 = 12 & _1069;
        _1033 = _1075;
    }
    int _1077 = _1033;
    float _1079 = _714 * _913;
    float _1081 = 1.0 / _1073;
    float _1083 = fma(_210, _905, _1079);
    int _1085 = as_type<int>(_905);
    if (!_989)
    {
        uint _1087 = uint(int(uint(_1053) >> uint(2)));
        _1085 = int(_1087);
    }
    int _1089 = _1085;
    float _1091 = fma(_212, _941, _1023);
    int _1093 = _1089;
    if (!_989)
    {
        int _1095 = _1089 << 4;
        int _1097 = _1095 + _1077;
        _1093 = _1097;
    }
    int _1099 = _1093;
    float _1101 = _1091 + _949;
    float _1103 = fma(_212, _977, _1083);
    float _1105 = _977;
    if (!_1071)
    {
        _1105 = _1063;
    }
    float _1107 = _1105;
    float _1109 = _1103 + _985;
    bool _1111 = !_1071;
    float _1113 = _1107;
    if (!_1111)
    {
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1119 = _1027 + _1117;
        float _1121 = _1063 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = rsqrt(_1003);
        float _1125 = _1119 * _1115;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = sin(_1129);
        float _1133 = _1127 * 6.283185482025146484375;
        float _1135 = cos(_1133);
        float _1137 = fma(_1131, _1121, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1139 = _1123 * _1137;
        float _1141 = _1135 + (-1.0);
        float _1143 = fma(_993, _1139, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1145 = fma(_967, _1139, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1147 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = fma(_1063, _1135, _1147);
        _1035 = _1143;
        _1113 = _1149;
        _1037 = _1145;
        _1039 = _1123;
    }
    float _1151 = _1035;
    float _1153 = _1113;
    float _1155 = _1037;
    float _1157 = _1039;
    float _1159 = _1157;
    if (_797)
    {
        _1159 = _1151;
    }
    float _1161 = _1159;
    float _1163 = _1161;
    if (_797)
    {
        _1041 = _1153;
    }
    float _1165 = _1041;
    float _1167 = _1165;
    if (_797)
    {
        _1043 = _1155;
    }
    float _1169 = _1043;
    float _1171 = _1169;
    if (!_797)
    {
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1175 = _298 + _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1179 = _210 + _1177;
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1183 = -_298;
        float _1185 = _1183 + _1153;
        float _1187 = _1175 * _1175;
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1191 = _212 + _1189;
        float _1193 = -_210;
        float _1195 = _1193 + _1151;
        float _1197 = -_212;
        float _1199 = _1197 + _1155;
        float _1201 = fma(_1179, _1179, _1187);
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1205 = fma(_1191, _1191, _1201);
        float _1207 = sqrt(_1205);
        float _1209 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1211 = precise::min(_1207, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1213 = _1211 * _1203;
        float _1215 = _1209 * _1213;
        float _1217 = fma(_1185, _1215, _298);
        float _1219 = fma(_1195, _1215, _210);
        float _1221 = fma(_1199, _1215, _212);
        _1167 = _1217;
        _1163 = _1219;
        _1171 = _1221;
    }
    float _1223 = _1167;
    float _1225 = _1163;
    float _1227 = _1171;
    int _1229 = _748 + 88;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    uint _1233 = uint(int(uint(int(_1231)) >> uint(2)));
    int _1235 = int(_1231) & 3;
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[int(_1233)][_1235];
    int _1239 = int(_1231) + 1;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    int _1243 = _1239 & 3;
    float _1245 = (*spvDescriptorSet0.vp_c15)._m0[int(_1241)][_1243];
    float _1247 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1249 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1251 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1253 = _1101 * _1081;
    float _1255 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1247);
    float _1257 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1249);
    float _1259 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1251);
    float _1261 = _1151;
    if (!_989)
    {
        int _1263 = _1099 + 400;
        uint _1265 = uint(int(uint(_1263) >> uint(2)));
        uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
        int _1269 = int(_1265) & 3;
        float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
        _1261 = _1271;
    }
    float _1273 = _1261;
    float _1275 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1255);
    bool _1277 = _1253 >= 0.0;
    float _1279 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1281 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1257);
    float _1283 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1259);
    float _1285 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = _1109 * _1081;
    bool _1289 = _1253 <= 1.0;
    bool _1291 = _1289 && _1277;
    float _1293 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1279);
    float _1295 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1297 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1301 = _1287 >= 0.0;
    bool _1303 = _1301 && _1291;
    float _1305 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1309 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1293);
    float _1311 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    bool _1313 = _1287 <= 1.0;
    bool _1315 = _1313 && _1303;
    float _1317 = -_1307;
    float _1319 = fma(_1317, _1305, 1.0);
    float _1321 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1323 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1311);
    float _1325 = _714 * _1021;
    float _1327 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1329 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1331 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1323);
    float _1333 = fma(_210, _1013, _1325);
    float _1335 = log2(_1319);
    float _1337 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1327);
    float _1339 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1329);
    float _1341 = _1331;
    if (_1315)
    {
        float _1343 = float(_736);
        _1045 = _1343;
    }
    float _1345 = _1045;
    float _1347 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1337);
    float _1349 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1339);
    float _1351 = 1.0 / _1331;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float _1355 = fma(_212, _1237, _1333);
    float _1357 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1347);
    float _1359 = as_type<float>(_1077);
    float _1361 = _1245;
    float _1363 = _1345;
    float _1365 = _1353;
    if (!_989)
    {
        float _1367 = floor(_777);
        _1359 = _1367;
    }
    float _1369 = _1359;
    float _1371 = _1355 + _1245;
    float _1373 = _1335 * 0.693147182464599609375;
    if (!_989)
    {
        float _1375 = -_1061;
        float _1377 = _785 + _1375;
        _1361 = _1377;
    }
    float _1379 = _1361;
    float _1381 = _1371 * _1081;
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1385 = _1325;
    float _1387 = _1379;
    if (_1315)
    {
        float _1389 = rint(_1345);
        float _1391 = precise::max(_1389, 0.0);
        uint _1393 = uint(_1391);
        uint _1395 = clamp(_1393, 0u, 65535u);
        _1385 = as_type<float>(_1395);
    }
    float _1397 = _1385;
    float _1399 = _1357 * _1351;
    float _1401 = _1353 * _1351;
    float _1403 = fma(_1399, 0.5, 0.5);
    float _1405 = _1371;
    if (!_989)
    {
        float _1407 = rint(_1273);
        float _1409 = precise::max(_1407, 0.0);
        uint _1411 = uint(_1409);
        uint _1413 = clamp(_1411, 0u, 65535u);
        _1405 = as_type<float>(_1413);
    }
    float _1415 = _1405;
    if (!_989)
    {
        float _1417 = -_1369;
        float _1419 = _777 + _1417;
        _1047 = _1419;
    }
    float _1421 = _1047;
    float _1423 = fma(_1401, -0.5, 0.5);
    float _1425 = as_type<float>(_748);
    if (_1315)
    {
        float3 _4478 = float3(_1253, _1287, float(as_type<int>(_1397)));
        float3 _4482 = select(_4478, float3(0.0), isnan(_4478));
        float _1427 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4482.xy, uint(rint(_4482.z)), _1381, level(0.0));
        _1425 = _1427;
    }
    float _1429 = _1425;
    float3 _4492 = float3(_1403, _1423, _1383);
    float _1431 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4492, float3(0.0), isnan(_4492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4492, float3(0.0), isnan(_4492)), level(0.0)).x;
    float3 _4501 = float3(_1403, _1423, _1383);
    float4 _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4501, float3(0.0), isnan(_4501)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4501, float3(0.0), isnan(_4501)), level(0.0)).xyzw;
    float _1436 = _1434.x;
    float _1438 = _1434.y;
    float _1440 = _1434.z;
    float _1442 = _1434.w;
    float _1444 = _1339;
    if (!_989)
    {
        float3 _4524 = float3(_1379, _1421, float(as_type<int>(_1415)));
        float3 _4526 = select(_4524, float3(0.0), isnan(_4524));
        float _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4526.xy, uint(rint(_4526.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4526.xy, uint(rint(_4526.z)), level(0.0)).x;
        _1444 = _1446;
    }
    float _1448 = _1444;
    if (_989)
    {
        _1363 = 1.0;
    }
    float _1450 = _1363;
    float _1452 = _1450;
    if (!_989)
    {
        int _1454 = _1053 << 4;
        int _1456 = _1454 + 2048;
        uint _1458 = uint(int(uint(_1456) >> uint(2)));
        uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
        int _1462 = int(_1458) & 3;
        float _1464 = (*spvDescriptorSet0.vp_c15)._m0[int(_1460)][_1462];
        int _1466 = int(_1458) + 1;
        uint _1468 = uint(int(uint(_1466) >> uint(2)));
        int _1470 = _1466 & 3;
        float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
        int _1474 = _1456 + 8;
        uint _1476 = uint(int(uint(_1474) >> uint(2)));
        uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
        int _1480 = int(_1476) & 3;
        float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
        int _1484 = int(_1476) + 1;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        int _1488 = _1484 & 3;
        float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
        float _1492 = _714 * _1472;
        float _1494 = fma(_210, _1464, _1492);
        float _1496 = fma(_212, _1482, _1494);
        float _1498 = _1496 + _1490;
        float _1500 = precise::clamp(_1498, 0.0, 1.0);
        float _1502 = -_1500;
        float _1504 = _1502 + _1448;
        float _1506 = fma(_1504, 500.0, 1.5);
        float _1508 = exp2(_1506);
        float _1510 = 0.0 + _1508;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1387 = _1490;
        _1452 = _1512;
    }
    float _1514 = _1387;
    float _1516 = _1452;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1520 = _1223 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1524 = _1225 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1227 + _1526;
    float _1530 = _1520 * _1520;
    float _1532 = fma(_1524, _1524, _1530);
    float _1534 = fma(_1528, _1528, _1532);
    float _1536 = rsqrt(_1534);
    float _1538 = sqrt(_1534);
    float _1540 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1542 = _1524 * _1540;
    float _1544 = _1528 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 + _1548;
    float _1552 = sqrt(_1550);
    bool _1554 = _1552 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1552 + _1556;
    float _1560 = _1514;
    float _1562 = _1550;
    float _1564 = _1558;
    float _1566 = _1520;
    float _1568 = _1540;
    float _1570 = _1542;
    float _1572 = _1544;
    float _1574 = _1548;
    if (_1554)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1576;
    }
    float _1578 = _1560;
    if (_1554)
    {
        float _1580 = rsqrt(_1550);
        _1562 = _1580;
    }
    float _1582 = _1562;
    if (_1554)
    {
        float _1584 = _1558 * _1578;
        _1564 = _1584;
    }
    float _1586 = _1564;
    if (_1554)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _404 = _1588;
    }
    float _1590 = _404;
    float _1592 = _1423;
    if (_1554)
    {
        float _1594 = _1590 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1403;
    float _1606 = _1602;
    float _1608 = _1600;
    if (_1554)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = -_1540;
    float _1618 = -_1602;
    float _1620 = fma(_1520, _1616, _1618);
    if (!_1554)
    {
        _1606 = _1546;
    }
    float _1622 = _1606;
    float _1624 = _1622;
    if (_1554)
    {
        float _1626 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1626;
    }
    float _1628 = _1566;
    float _1630 = _1598;
    float _1632 = _1628;
    if (_1554)
    {
        float _1634 = fma(_1598, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1630 = _1634;
    }
    float _1636 = _1630;
    float _1638 = _1636;
    if (!_1554)
    {
        _1632 = _1620;
    }
    float _1640 = _1632;
    float _1642 = _1640;
    if (_1554)
    {
        float _1644 = _1614 + (-1.0);
        _1608 = _1644;
    }
    float _1646 = _1608;
    if (_1554)
    {
        float _1648 = _1582 * _1636;
        _1568 = _1648;
    }
    float _1650 = _1568;
    if (_1554)
    {
        float _1652 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1554)
    {
        float _1656 = _1542 * _1650;
        _1570 = _1656;
    }
    float _1658 = _1570;
    if (_1554)
    {
        float _1660 = _1544 * _1650;
        _1572 = _1660;
    }
    float _1662 = _1572;
    if (_1554)
    {
        float _1664 = fma(_1620, _1614, _1654);
        _1642 = _1664;
    }
    float _1666 = _1642;
    if (_1554)
    {
        float _1668 = _1658 * _1658;
        _1624 = _1668;
    }
    float _1670 = _1624;
    if (_1554)
    {
        float _1672 = _1662 * _1662;
        _1574 = _1672;
    }
    float _1674 = _1574;
    float _1676 = fma(_1666, _1666, _1670);
    float _1678 = _1676 + _1674;
    float _1680 = rsqrt(_1678);
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1684 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1682);
    float _1686 = precise::clamp(_1684, 0.0, 1.0);
    float _1688 = -_1686;
    float _1690 = _1688 + 1.0;
    float _1692 = _1680 * _1658;
    float _1694 = _1680 * _1666;
    float _1696 = _1680 * _1662;
    float _1698 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1700 = abs(_1690);
    float _1702 = log2(_1700);
    float _1704 = -_1698;
    float _1706 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1704);
    float _1708 = -_1696;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1706);
    float _1712 = fma(_1710, -0.5, 0.5);
    float _1714 = fma(_1710, 0.5, 0.5);
    float _1716 = fma(_1714, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1718 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1720 = sqrt(_1712);
    float _1722 = fma(_1714, _1716, -0.212114393711090087890625);
    float _1724 = _1694 + 1.0;
    float _1726 = fma(_1714, _1722, 1.570728778839111328125);
    float _1728 = exp2(_1718);
    float _1730 = _1720 * 0.636619746685028076171875;
    float _1732 = -_1726;
    float _1734 = fma(_1730, _1732, 1.0);
    float _1736 = -_1694;
    float _1738 = fma(_1728, _1724, _1736);
    float _1740 = fma(_1738, 0.5, 0.5);
    float2 _4980 = float2(_1734, _1740);
    float3 _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4980, float2(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4980, float2(0.0), isnan(_4980)), level(0.0)).xyz;
    float _1746 = _1744.x;
    float _1748 = _1744.y;
    float _1750 = _1744.z;
    float _1752 = abs(_686);
    float _1754 = log2(_1752);
    float _1756 = in.m_71.x;
    float _1758 = in.m_71.y;
    float _1760 = in.m_71.z;
    bool _1762 = _646 != 0.0;
    bool _1764 = isnan(_646);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(0.0);
    bool _1770 = _1766 || _1768;
    float _1772 = -_230;
    float _1774 = _1772 + 1.0;
    bool _1776 = _644 == 0.0;
    bool _1778 = !_1770;
    bool _1780 = _1776 && _1778;
    bool _1782 = _648 == 0.0;
    bool _1784 = _1782 && _1780;
    float _1786 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = exp2(_1786);
    float _1800 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = _1758;
    float _1806 = _1756;
    float _1808 = _1760;
    if (!_1784)
    {
        float _1810 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1758);
        _1804 = _1810;
    }
    float _1812 = _1804;
    if (!_1784)
    {
        float _1814 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1756);
        _1806 = _1814;
    }
    float _1816 = _1806;
    if (!_1784)
    {
        float _1818 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1760);
        _1808 = _1818;
    }
    float _1820 = _1808;
    float _1822 = -_1812;
    float _1824 = _801 * _1822;
    float _1826 = _803 * _1812;
    float _1828 = _833 * _1812;
    float _1830 = fma(_835, _1816, _1824);
    float _1832 = fma(_841, _1816, _1826);
    float _1834 = fma(_845, _1816, _1828);
    out.m_73.x = _1800;
    out.m_73.y = _1796;
    out.m_73.z = _1802;
    out.m_73.w = _1794;
    float _1836 = fma(_837, _1820, _1830);
    float _1838 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1840 = precise::clamp(_1838, 0.0, 1.0);
    float _1842 = fma(_853, _1820, _1832);
    float _1844 = fma(_879, _1820, _1834);
    float _1846 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1848 = _686 <= 8000.0;
    bool _1850 = isnan(_686);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan(8000.0);
    bool _1856 = _1852 || _1854;
    float _1858 = float(_1856);
    float _1860 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1862 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1864 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1866 = isnan(_1538);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1872 = _1868 || _1870;
    float _1874 = exp2(_1846);
    float _1876 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1860);
    float _1878 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1862);
    float _1880 = fma(_1840, -2.0, 3.0);
    float _1882 = _1840 * _1840;
    float _1884 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1886 = fma(_1844, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1876);
    float _1888 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1890 = _1882 * _1880;
    float _1892 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1884);
    float _1894 = fma(_1844, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1878);
    float _1896 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1888);
    float _1898 = -_1890;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1844, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1892);
    float _1904 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1896);
    float _1906 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1890);
    float _1908 = -_1874;
    float _1910 = _1908 + 1.0;
    out.m_75.x = _1886;
    out.m_75.y = _1894;
    out.m_75.z = _1902;
    float _1912 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1904);
    float _1914 = _1858 * _1906;
    float _1916 = _1906;
    float _1918 = _1912;
    if (!_1315)
    {
        _1916 = 1.0;
    }
    float _1920 = _1916;
    float _1922 = _1920;
    if (_1315)
    {
        bool _1924 = _1429 >= _1381;
        bool _1926 = isnan(_1429);
        bool _1928 = _1924 || _1926;
        bool _1930 = isnan(_1381);
        bool _1932 = _1928 || _1930;
        float _1934 = float(_1932);
        _1922 = _1934;
    }
    float _1936 = _1922;
    float _1938 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1940 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1357;
    out.gl_Position.y = _1353;
    out.gl_Position.z = _1912;
    out.gl_Position.w = _1331;
    float _1942 = _1774 * _1938;
    float _1944 = precise::clamp(_1942, 0.0, 1.0);
    float _1946 = _1940 * _1431;
    float _1948 = _1936 * _1516;
    float _1950 = -_1944;
    float _1952 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1954 = _1442 * _1946;
    float _1956 = -_1948;
    float _1958 = fma(_1956, _1952, 1.0);
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1962 = -_1940;
    float _1964 = _1962 + 1.0;
    float _1966 = _1960 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1968 = 1.0;
    float _1970 = 1.0;
    float _1972 = _1964;
    if (!_1872)
    {
        _1341 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1974 = _1341;
    float _1976 = _1442 * _1964;
    float _1978 = _1974;
    float _1980 = _1974;
    if (!_1872)
    {
        _1918 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1982 = _1918;
    out.m_79.x = _1966;
    float _1984 = _1982;
    float _1986 = _1982;
    if (!_1872)
    {
        _1365 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1988 = _1365;
    float _1990 = _1988;
    float _1992 = _1988;
    if (!_1872)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1994 = _1968;
    float _1996 = _1994;
    float _1998 = _1994;
    if (!_1872)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2000 = _1970;
    float _2002 = _2000;
    float _2004 = _2000;
    if (!_1872)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2006 = _1972;
    float _2008 = _1750 * _1946;
    float _2010 = fma(_1746, _1954, _1436);
    float _2012 = fma(_1748, _1954, _1438);
    float _2014 = fma(_1442, _2008, _1440);
    out.m_81.x = _2010;
    out.m_81.y = _2012;
    out.m_81.z = _2014;
    out.m_81.w = _1976;
    bool _2016 = !_1872;
    float _2018 = _2006;
    float _2020 = _2006;
    if (!_2016)
    {
        bool _2022 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2024 = isnan(_1538);
        bool _2026 = _2022 || _2024;
        bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2030 = _2026 || _2028;
        if (!_2030)
        {
            float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2034 = _1538 + _2032;
            float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2038 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2036;
            float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2042 = _2040 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2044 = 1.0 / _2038;
            float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2048 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2052 = _2050 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2062 = _2034 * _2044;
            float _2064 = precise::clamp(_2062, 0.0, 1.0);
            float _2066 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2070 = fma(_2064, _2042, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2072 = fma(_2064, _2068, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2074 = fma(_2064, _2048, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2076 = fma(_2064, _2052, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2078 = fma(_2064, _2056, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2080 = fma(_2064, _2060, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2004 = _2074;
            _1992 = _2078;
            _1998 = _2070;
            _1986 = _2076;
            _1980 = _2072;
            _2020 = _2080;
            _2082 = true;
        }
        else
        {
            bool _2084 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2086 = isnan(_1538);
            bool _2088 = _2084 || _2086;
            bool _2090 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2092 = _2088 || _2090;
            if (!_2092)
            {
                _1996 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2094 = _1996;
            _1998 = _2094;
            if (!_2092)
            {
                _2002 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2096 = _2002;
            _2004 = _2096;
            if (!_2092)
            {
                _1978 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2098 = _1978;
            _1980 = _2098;
            if (!_2092)
            {
                _1984 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2100 = _1984;
            _1986 = _2100;
            if (!_2092)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2102 = _1990;
            _1992 = _2102;
            if (!_2092)
            {
                _2018 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2104 = _2018;
            bool _2106 = !_2092;
            _2020 = _2104;
            if (!_2106)
            {
                bool _2108 = _1538 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2110 = isnan(_1538);
                bool _2112 = _2108 || _2110;
                bool _2114 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2116 = _2112 || _2114;
                if (!_2116)
                {
                    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2120 = _1538 + _2118;
                    float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2124 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2122;
                    float _2126 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2128 = _2126 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2130 = 1.0 / _2124;
                    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2138 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2148 = _2120 * _2130;
                    float _2150 = precise::clamp(_2148, 0.0, 1.0);
                    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2156 = fma(_2150, _2128, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2158 = fma(_2150, _2154, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2160 = fma(_2150, _2134, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2162 = fma(_2150, _2138, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2164 = fma(_2150, _2142, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2166 = fma(_2150, _2146, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2004 = _2160;
                    _1992 = _2164;
                    _1998 = _2156;
                    _1986 = _2162;
                    _1980 = _2158;
                    _2020 = _2166;
                    _2082 = true;
                }
                else
                {
                    _2004 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1998 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1986 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1980 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2020 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2082 = false;
    float _2168 = _2004;
    float _2170 = _1992;
    float _2172 = _1998;
    float _2174 = _1986;
    float _2176 = _1980;
    float _2178 = _2020;
    float _2180 = fma(_1894, -0.5, 0.5);
    float _2182 = precise::clamp(_2180, 0.0, 1.0);
    float _2184 = -_2168;
    float _2186 = _2184 + _2170;
    float _2188 = -_2172;
    float _2190 = _2188 + _2174;
    float _2192 = -_2176;
    float _2194 = _2192 + _2178;
    bool _2196 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2198 = fma(_2182, _2186, _2168);
    float _2200 = fma(_2182, _2190, _2172);
    float _2202 = fma(_2182, _2194, _2176);
    float _2204 = _2198 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2206 = fma(_2200, 0.298911988735198974609375, _2204);
    float _2208 = fma(_2202, 0.114477999508380889892578125, _2206);
    out.m_83.x = 0.0;
    float _2210 = -_2208;
    float _2212 = _2200 + _2210;
    float _2214 = -_2208;
    float _2216 = _2198 + _2214;
    float _2218 = -_2208;
    float _2220 = _2202 + _2218;
    float _2222 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2224 = fma(_2212, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2208);
    float _2226 = fma(_2216, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2208);
    float _2228 = fma(_2220, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2208);
    out.m_79.w = _2222;
    out.m_85.x = _2224;
    out.m_85.y = _2226;
    out.m_85.z = _2228;
    if (!_2196)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2230 = -_1223;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2234 = -_1225;
    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2238 = -_1227;
    float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2242 = _2232 * _2232;
    float _2244 = fma(_2236, _2236, _2242);
    float _2246 = fma(_2240, _2240, _2244);
    float _2248 = sqrt(_2246);
    float _2250 = rsqrt(_2246);
    float _2252 = -_2248;
    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2256 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    float _2260 = _2236 * _2250;
    float _2262 = _2232 * _2250;
    float _2264 = abs(_2258);
    float _2266 = log2(_2264);
    float _2268 = _2240 * _2250;
    float _2270 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2272 = _1894 * _2262;
    float _2274 = -_2262;
    float _2276 = -_2270;
    float _2278 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2276);
    float _2280 = fma(_1886, _2260, _2272);
    float _2282 = -_2268;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2278);
    float _2286 = fma(_1902, _2268, _2280);
    float _2288 = precise::clamp(_2286, 0.0, 1.0);
    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2292 = _2284 + _2290;
    float _2294 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2296 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = exp2(_2294);
    float _2302 = _2300 * _2298;
    float _2304 = _2288 * _2302;
    float _2306 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2308 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2310 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _2306;
    out.m_83.y = _2308;
    out.m_83.z = _2310;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

