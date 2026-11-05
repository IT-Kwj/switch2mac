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
    float4 m_75 [[user(locn0)]];
    float4 m_77 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2096 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_56.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_59.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2441 = as_type<float>(_126);
        out.gl_Position.z = _2441;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_61.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_59.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2510 = as_type<float>(_164);
        out.gl_Position.z = _2510;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_63.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
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
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = in.m_56.x;
    float _200 = in.m_56.y;
    float _202 = in.m_56.z;
    float _204 = _200 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _206 = _200 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _208 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].x, _204);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].x, _206);
    float _212 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].z, _208);
    float _214 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].z, _210);
    float _216 = _212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _218 = _214 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _220 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _222 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _224 = floor(_220);
    float _226 = floor(_222);
    float _228 = -_224;
    float _230 = _220 + _228;
    float _232 = -_226;
    float _234 = _222 + _232;
    float2 _2637 = float2(_230, _234);
    float _236 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2637, float2(0.0), isnan(_2637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2637, float2(0.0), isnan(_2637)), level(0.0)).x;
    float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _240 = log2(_238);
    float _242 = in.m_63.x;
    float _244 = _200 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _246 = in.m_63.z;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = in.m_63.y;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _268 = _266 != 0;
    float _270 = 1.0 / _250;
    float _272 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].x, _244);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _196 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _196 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _284 = 1.0 + _282;
    float _286 = _240 * _144;
    bool _288 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _290 = isnan(1.0);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _296 = _292 || _294;
    float _298 = 1.0 / _254;
    bool _300 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _308 = _304 || _306;
    float _310 = exp2(_286);
    float _312 = _242 * 2.0;
    float _314 = _246 * 2.0;
    float _316 = _276 * _270;
    float _318 = _242 + _246;
    float _320 = _256 + _246;
    bool _322 = !_264;
    int _324 = _322 ? 0 : 1;
    float _326 = _280 * _298;
    float _328 = 1.0 / _284;
    float _330 = _256 * 2.0;
    float _332 = _320 + (-1.0);
    float _334 = _246 + (-0.5);
    float _336 = -_310;
    float _338 = _336 + 1.0;
    float _340 = floor(_312);
    float _342 = _318 + (-1.0);
    float _344 = _242 + _256;
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _348 = _308 ? _338 : 0.0;
    float _350 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _352 = _344 + (-1.0);
    float _354 = _256 + (-0.5);
    float _356 = floor(_314);
    if (_296)
    {
        float _358 = _348 * _328;
        _148 = _358;
    }
    float _360 = _148;
    float _362 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _364 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _366 = isnan(_196);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_196);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = floor(_330);
    bool _390 = _340 >= 0.0;
    bool _392 = isnan(_340);
    bool _394 = _390 || _392;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    float _400 = -_374;
    float _402 = _400 + 1.0;
    bool _404 = _340 > 0.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    bool _410 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _412 = isnan(_196);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _426 = _398 ? 0 : 1;
    float _428 = fma(_408, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _430 = _356 > 0.0;
    float _432 = _420 * _402;
    bool _434 = _356 >= 0.0;
    bool _436 = isnan(_356);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    float _444 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].z, _272);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _446;
    float _450 = -_420;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _458 = _388 > 0.0;
    float _460 = fma(_448, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _462 = _388 >= 0.0;
    bool _464 = isnan(_388);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = fma(_456, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _482 = _444 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _484 = fma(_474, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _486 = _386 * _452;
    float _488 = -_386;
    float _490 = _488 + 1.0;
    float _492 = fma(_424, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = fma(_478, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = _428 * _486;
    float _498 = _484 * _486;
    float _500 = _482 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _502 = _460 * _486;
    int _504 = ~_426;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].y, _498);
    float _512 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[11].x, _500);
    float _514 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].x, _496);
    float _516 = in.m_65.x;
    float _518 = in.m_65.y;
    float _520 = in.m_65.z;
    float _522 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    int _524 = abs(_324);
    float _526 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[11].z, _512);
    int _528 = _508;
    if (!_404)
    {
        int _530 = ~_426;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = fma(_492, _432, _514);
    float _538 = float(_524);
    float _540 = _482 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _542 = float(_534);
    float _544 = _526 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _546 = _442 ? 0 : 1;
    float _548 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[10].x, _540);
    int _550 = _470 ? 0 : 1;
    float _552 = _538 * _542;
    int _554 = ~_546;
    int _556 = _554 + 1;
    int _558 = _556 + 1;
    float _560 = 1.0 / _544;
    int _562 = _558;
    if (!_430)
    {
        int _564 = ~_546;
        int _566 = _564 + 1;
        _562 = _566;
    }
    int _568 = _562;
    float _570 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[10].z, _548);
    bool _572 = !_260;
    int _574 = _572 ? 0 : 1;
    float _576 = _552 * (-2.0);
    int _578 = ~_550;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = _570 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _586 = _582;
    if (!_458)
    {
        int _588 = ~_550;
        int _590 = _588 + 1;
        _586 = _590;
    }
    int _592 = _586;
    float _594 = fma(_346, _576, _346);
    int _596 = abs(_574);
    float _598 = fma(_576, _518, _518);
    float _600 = _584 + _544;
    bool _602 = !_268;
    int _604 = _602 ? 0 : 1;
    float _606 = fma(_480, _432, _510);
    float _608 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[196].y, _598);
    float _610 = float(_568);
    float _612 = in.m_67.x;
    float _614 = in.m_67.y;
    float _616 = in.m_67.z;
    float _618 = float(_596);
    float _620 = _600 * _560;
    float _622 = _620 * 0.5;
    int _624 = abs(_604);
    float _626 = fma(_594, _360, _608);
    float _628 = _618 * _610;
    float _630 = float(_624);
    float _632 = fma(_494, _432, _522);
    float _634 = float(_592);
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _638 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[30].w, _636);
    float _640 = _628 * (-2.0);
    float _642 = _242 + (-0.5);
    float _644 = _626 * 0.15915493667125701904296875;
    float _646 = _630 * _634;
    float _648 = 1.0 / _638;
    float _650 = fma(_640, _516, _516);
    float _652 = in.m_69.x;
    float _654 = in.m_69.y;
    float _656 = in.m_69.z;
    float _658 = _646 * (-2.0);
    float _660 = fma(_362, _640, _362);
    float _662 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[196].x, _650);
    float _664 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _666 = fma(_350, _658, _350);
    float _668 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[145].x, _536);
    float _670 = fma(_658, _520, _520);
    float _672 = fma(_660, _360, _662);
    float _674 = _644 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = _668 * _612;
    float _680 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[196].z, _670);
    float _682 = _672 * 0.15915493667125701904296875;
    float _684 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[145].y, _606);
    float _686 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _688 = fma(_666, _360, _680);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _692 = _648 * _690;
    float _694 = _682 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _688 * 0.15915493667125701904296875;
    float _700 = _482 + _664;
    bool _702 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _704 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[145].z, _632);
    bool _706 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _708 = _684 * _614;
    float _710 = _644 * 6.283185482025146484375;
    float _712 = cos(_710);
    float _714 = _700 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _716 = _704 * _616;
    float _718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _652);
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _654);
    float _722 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _724 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[126].x, _714);
    bool _726 = !_702;
    int _728 = _726 ? 0 : 1;
    float _730 = _682 * 6.283185482025146484375;
    float _732 = cos(_730);
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _656);
    float _736 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _738 = _686 * _718;
    float _740 = _700 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _742 = 2;
    if (!_702)
    {
        _742 = 1;
    }
    int _744 = _742;
    float _746 = _722 * _720;
    float _748 = _698 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[126].z, _724);
    int _754 = _744;
    if (!_706)
    {
        _754 = _728;
    }
    int _756 = _754;
    float _758 = _736 * _734;
    float _760 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[127].x, _740);
    float _762 = _752 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _764 = _756 << 6;
    float _766 = _696 * _676;
    float _768 = _698 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _732 * _712;
    float _774 = _732 * _676;
    float _776 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[127].z, _760);
    float _778 = _696 * _712;
    int _780 = _764 + 96;
    uint _783 = uint(int(uint(_780) >> uint(2)));
    uint _785 = uint(int(uint(int(_783)) >> uint(2)));
    int _787 = int(_783) & 3;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[int(_785)][_787];
    int _791 = int(_783) + 1;
    uint _793 = uint(int(uint(_791) >> uint(2)));
    int _795 = _791 & 3;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[int(_793)][_795];
    float _799 = _776 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _801 = _732 * _750;
    float _803 = _696 * _750;
    float _805 = _712 * _750;
    float _807 = _676 * _750;
    float _809 = _801 * _746;
    float _811 = trunc(_762);
    int _813 = int(_811);
    int _815 = _764 + 104;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.vp_c15)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.vp_c15)._m0[int(_827)][_829];
    float _833 = fma(_770, _772, _766);
    float _835 = -_774;
    float _837 = fma(_770, _778, _835);
    float _839 = -_778;
    float _841 = fma(_770, _774, _839);
    float _843 = -_746;
    float _845 = _770 * _843;
    float _847 = fma(_833, _738, _809);
    float _849 = trunc(_799);
    int _851 = int(_849);
    float _853 = _803 * _746;
    float _855 = fma(_805, _738, _845);
    float _857 = fma(_841, _758, _847);
    float _859 = fma(_770, _766, _772);
    float _861 = fma(_837, _738, _853);
    float _863 = fma(_807, _758, _855);
    float _865 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _867 = _764 + 64;
    uint _869 = uint(int(uint(_867) >> uint(2)));
    uint _871 = uint(int(uint(int(_869)) >> uint(2)));
    int _873 = int(_869) & 3;
    float _875 = (*spvDescriptorSet0.vp_c15)._m0[int(_871)][_873];
    int _877 = int(_869) + 1;
    uint _879 = uint(int(uint(_877) >> uint(2)));
    int _881 = _877 & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    float _885 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _887 = fma(_859, _758, _861);
    float _889 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[26].x, _865);
    int _891 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _893 = _813 + _891;
    int _895 = _893 + 1;
    float _897 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[24].x, _885);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _889);
    int _901 = _764 + 48;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    uint _905 = uint(int(uint(int(_903)) >> uint(2)));
    int _907 = int(_903) & 3;
    float _909 = (*spvDescriptorSet0.vp_c15)._m0[int(_905)][_907];
    int _911 = int(_903) + 1;
    uint _913 = uint(int(uint(_911) >> uint(2)));
    int _915 = _911 & 3;
    float _917 = (*spvDescriptorSet0.vp_c15)._m0[int(_913)][_915];
    int _919 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _921 = _851 + _919;
    int _923 = _921 + 1;
    float _925 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _897);
    float _927 = _899 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _929 = _895 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _931 = _895 | _923;
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _935 = _764 + 56;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[int(_947)][_949];
    float _953 = _218 + _927;
    bool _955 = _931 < 0;
    bool _957 = _955 || _929;
    float _959 = _216 + _933;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _963 = _953 + _961;
    bool _965 = _923 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _967 = _965 || _957;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _971 = _959 + _969;
    int _973 = _764 + 72;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    uint _977 = uint(int(uint(int(_975)) >> uint(2)));
    int _979 = int(_975) & 3;
    float _981 = (*spvDescriptorSet0.vp_c15)._m0[int(_977)][_979];
    int _983 = int(_975) + 1;
    uint _985 = uint(int(uint(_983) >> uint(2)));
    int _987 = _983 & 3;
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[int(_985)][_987];
    float _991 = _963 * _963;
    float _993 = _700 * _797;
    float _995 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _997 = fma(_971, _971, _991);
    float _999 = fma(_216, _789, _993);
    float _1001 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[25].x, _995);
    int _1003 = _764 + 80;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    uint _1007 = uint(int(uint(int(_1005)) >> uint(2)));
    int _1009 = int(_1005) & 3;
    float _1011 = (*spvDescriptorSet0.vp_c15)._m0[int(_1007)][_1009];
    int _1013 = int(_1005) + 1;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    int _1017 = _1013 & 3;
    float _1019 = (*spvDescriptorSet0.vp_c15)._m0[int(_1015)][_1017];
    float _1021 = sqrt(_997);
    float _1023 = fma(_218, _823, _999);
    uint _1025 = uint(_895);
    int _1027 = as_type<int>(_831);
    float _1029 = _857;
    float _1031 = _959;
    if (!_967)
    {
        int _1033 = _923 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1035 = _1033 + _895;
        _1025 = uint(_1035);
    }
    uint _1037 = _1025;
    float _1039 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1001);
    float _1041 = _1023 + _831;
    float _1043 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1045 = _995;
    if (!_967)
    {
        float _1047 = floor(_762);
        _1045 = _1047;
    }
    float _1049 = _1045;
    if (!_967)
    {
        uint _1051 = uint(int(uint(int(_1037)) >> uint(2)));
        _1027 = int(_1051);
    }
    int _1053 = _1027;
    float _1055 = _700 * _883;
    bool _1057 = _1021 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1059 = 1.0 / _1041;
    float _1061 = fma(_216, _875, _1055);
    int _1063 = as_type<int>(_875);
    int _1065 = _1053;
    float _1067 = _1061;
    if (!_967)
    {
        int _1069 = int(_1037) << 2;
        _1063 = _1069;
    }
    int _1071 = _1063;
    float _1073 = _700 * _917;
    int _1075 = _1071;
    if (!_967)
    {
        int _1077 = 12 & _1071;
        _1075 = _1077;
    }
    int _1079 = _1075;
    float _1081 = fma(_216, _909, _1073);
    float _1083 = _482 + _1043;
    float _1085 = as_type<float>(_1079);
    if (!_967)
    {
        int _1087 = _1053 << 4;
        int _1089 = _1087 + _1079;
        _1065 = _1089;
    }
    int _1091 = _1065;
    float _1093 = fma(_218, _943, _1081);
    if (!_1057)
    {
        _1085 = _959;
    }
    float _1095 = _1085;
    float _1097 = _1095;
    if (!_1057)
    {
        _1029 = _953;
    }
    float _1099 = _1029;
    float _1101 = _1093 + _951;
    float _1103 = fma(_218, _981, _1061);
    float _1105 = _1099;
    if (!_1057)
    {
        _1067 = _1083;
    }
    float _1107 = _1067;
    float _1109 = _1103 + _989;
    bool _1111 = !_1057;
    float _1113 = _1107;
    if (!_1111)
    {
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1119 = _1021 + _1117;
        float _1121 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = rsqrt(_997);
        float _1125 = _1119 * _1115;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = _1127 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1131 + (-1.0);
        float _1139 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = fma(_1135, _1121, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1143 = fma(_1083, _1131, _1139);
        float _1145 = _1123 * _1141;
        float _1147 = fma(_971, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1149 = fma(_963, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1143;
        _1097 = _1147;
        _1105 = _1149;
    }
    float _1151 = _1113;
    float _1153 = _1097;
    float _1155 = _1105;
    int _1157 = _764 + 88;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    uint _1161 = uint(int(uint(int(_1159)) >> uint(2)));
    int _1163 = int(_1159) & 3;
    float _1165 = (*spvDescriptorSet0.vp_c15)._m0[int(_1161)][_1163];
    int _1167 = int(_1159) + 1;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    int _1171 = _1167 & 3;
    float _1173 = (*spvDescriptorSet0.vp_c15)._m0[int(_1169)][_1171];
    float _1175 = _1101 * _1059;
    float _1177 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1179 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1181 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1183 = _1109 * _1059;
    float _1185 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1177);
    float _1187 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1179);
    float _1189 = _953;
    if (!_967)
    {
        int _1191 = _1091 + 400;
        uint _1193 = uint(int(uint(_1191) >> uint(2)));
        uint _1195 = uint(int(uint(int(_1193)) >> uint(2)));
        int _1197 = int(_1193) & 3;
        float _1199 = (*spvDescriptorSet0.vp_c15)._m0[int(_1195)][_1197];
        _1189 = _1199;
    }
    float _1201 = _1189;
    float _1203 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1181);
    float _1205 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1185);
    float _1207 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1187);
    float _1209 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1211 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1203);
    float _1213 = _1205 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1215 = _1175 >= 0.0;
    float _1217 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1209);
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1221 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1223 = _1175 <= 1.0;
    bool _1225 = _1223 && _1215;
    float _1227 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1229 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1217);
    float _1231 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1221);
    bool _1233 = _1183 >= 0.0;
    bool _1235 = _1233 && _1225;
    float _1237 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1239 = _1229 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1231);
    bool _1243 = _1183 <= 1.0;
    bool _1245 = _1243 && _1235;
    float _1247 = _971;
    if (!_967)
    {
        float _1249 = floor(_799);
        _1247 = _1249;
    }
    float _1251 = _1247;
    float _1253 = _1227 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1255 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1241);
    float _1257 = _700 * _1019;
    float _1259 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1261 = -_1253;
    float _1263 = fma(_1261, _1237, 1.0);
    float _1265 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1267 = fma(_216, _1011, _1257);
    float _1269 = 1.0 / _1255;
    float _1271 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1259);
    float _1273 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1265);
    float _1275 = _1253;
    float _1277 = _1265;
    float _1279 = _1255;
    if (_1245)
    {
        float _1281 = float(_756);
        _1275 = _1281;
    }
    float _1283 = _1275;
    float _1285 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1271);
    float _1287 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1273);
    if (!_967)
    {
        float _1289 = -_1251;
        float _1291 = _799 + _1289;
        _1031 = _1291;
    }
    float _1293 = _1031;
    float _1295 = log2(_1263);
    float _1297 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1287);
    float _1299 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1285);
    float _1301 = fma(_218, _1165, _1267);
    float _1303 = _1301 + _1173;
    float _1305 = _1297 * _1269;
    float _1307 = _1259;
    float _1309 = _1173;
    float _1311 = _1297;
    if (_1245)
    {
        float _1313 = rint(_1283);
        float _1315 = precise::max(_1313, 0.0);
        uint _1317 = uint(_1315);
        uint _1319 = clamp(_1317, 0u, 65535u);
        _1307 = as_type<float>(_1319);
    }
    float _1321 = _1307;
    float _1323 = _1299 * _1269;
    float _1325 = _1303 * _1059;
    if (!_967)
    {
        float _1327 = -_1049;
        float _1329 = _762 + _1327;
        _1309 = _1329;
    }
    float _1331 = _1309;
    float _1333 = fma(_1323, 0.5, 0.5);
    float _1335 = _1295 * 0.693147182464599609375;
    float _1337 = fma(_1305, -0.5, 0.5);
    float _1339 = _1305;
    if (!_967)
    {
        float _1341 = rint(_1201);
        float _1343 = precise::max(_1341, 0.0);
        uint _1345 = uint(_1343);
        uint _1347 = clamp(_1345, 0u, 65535u);
        _1339 = as_type<float>(_1347);
    }
    float _1349 = _1339;
    float _1351 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1353 = _762;
    float _1355 = _1351;
    if (_1245)
    {
        float3 _4449 = float3(_1175, _1183, float(as_type<int>(_1321)));
        float3 _4453 = select(_4449, float3(0.0), isnan(_4449));
        float _1357 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4453.xy, uint(rint(_4453.z)), _1325, level(0.0));
        _1353 = _1357;
    }
    float _1359 = _1353;
    float3 _4463 = float3(_1333, _1337, _1351);
    float _1361 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4463, float3(0.0), isnan(_4463)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4463, float3(0.0), isnan(_4463)), level(0.0)).x;
    float3 _4472 = float3(_1333, _1337, _1351);
    float4 _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4472, float3(0.0), isnan(_4472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4472, float3(0.0), isnan(_4472)), level(0.0)).xyzw;
    float _1366 = _1364.x;
    float _1368 = _1364.y;
    float _1370 = _1364.z;
    float _1372 = _1364.w;
    float _1374 = _1293;
    if (!_967)
    {
        float3 _4495 = float3(_1331, _1293, float(as_type<int>(_1349)));
        float3 _4497 = select(_4495, float3(0.0), isnan(_4495));
        float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4497.xy, uint(rint(_4497.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4497.xy, uint(rint(_4497.z)), level(0.0)).x;
        _1374 = _1376;
    }
    float _1378 = _1374;
    if (_967)
    {
        _1277 = 1.0;
    }
    float _1380 = _1277;
    float _1382 = _1380;
    if (!_967)
    {
        int _1384 = int(_1037) << 4;
        int _1386 = _1384 + 2048;
        uint _1388 = uint(int(uint(_1386) >> uint(2)));
        uint _1390 = uint(int(uint(int(_1388)) >> uint(2)));
        int _1392 = int(_1388) & 3;
        float _1394 = (*spvDescriptorSet0.vp_c15)._m0[int(_1390)][_1392];
        int _1396 = int(_1388) + 1;
        uint _1398 = uint(int(uint(_1396) >> uint(2)));
        int _1400 = _1396 & 3;
        float _1402 = (*spvDescriptorSet0.vp_c15)._m0[int(_1398)][_1400];
        int _1404 = _1386 + 8;
        uint _1406 = uint(int(uint(_1404) >> uint(2)));
        uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
        int _1410 = int(_1406) & 3;
        float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
        int _1414 = int(_1406) + 1;
        uint _1416 = uint(int(uint(_1414) >> uint(2)));
        int _1418 = _1414 & 3;
        float _1420 = (*spvDescriptorSet0.vp_c15)._m0[int(_1416)][_1418];
        float _1422 = _700 * _1402;
        float _1424 = fma(_216, _1394, _1422);
        float _1426 = fma(_218, _1412, _1424);
        float _1428 = _1426 + _1420;
        float _1430 = precise::clamp(_1428, 0.0, 1.0);
        float _1432 = -_1430;
        float _1434 = _1432 + _1378;
        float _1436 = fma(_1434, 500.0, 1.5);
        float _1438 = exp2(_1436);
        float _1440 = 0.0 + _1438;
        float _1442 = precise::clamp(_1440, 0.0, 1.0);
        _1382 = _1442;
    }
    float _1444 = _1382;
    float _1446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1448 = _1151 + _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1452 = _1153 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1456 = _1155 + _1454;
    float _1458 = _1448 * _1448;
    float _1460 = fma(_1452, _1452, _1458);
    float _1462 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1464 = fma(_1456, _1456, _1460);
    float _1466 = rsqrt(_1464);
    float _1468 = sqrt(_1464);
    float _1470 = _1452 * _1466;
    float _1472 = _1456 * _1466;
    float _1474 = _1448 * _1466;
    float _1476 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1478 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1480 = _1476 * _1476;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 + _1482;
    float _1486 = sqrt(_1484);
    bool _1488 = _1486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = _1486 + _1490;
    float _1494 = _1337;
    float _1496 = _1492;
    float _1498 = _1462;
    float _1500 = _1466;
    float _1502 = _1476;
    float _1504 = _1480;
    float _1506 = _1482;
    if (_1488)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1508;
    }
    float _1510 = _1494;
    if (_1488)
    {
        float _1512 = _1492 * _1510;
        _1496 = _1512;
    }
    float _1514 = _1496;
    float _1516 = precise::max(0.0, _1462);
    float _1518 = _1516;
    if (_1488)
    {
        float _1520 = rsqrt(_1484);
        _1498 = _1520;
    }
    float _1522 = _1498;
    float _1524 = _1522;
    if (_1488)
    {
        float _1526 = _1514 * 0.15915493667125701904296875;
        _1355 = _1526;
    }
    float _1528 = _1355;
    float _1530 = -_1474;
    float _1532 = -_1516;
    float _1534 = fma(_1530, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1532);
    if (_1488)
    {
        float _1536 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1536;
    }
    float _1538 = _1500;
    float _1540 = _1378;
    float _1542 = _1538;
    if (_1488)
    {
        float _1544 = _1528 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        _1540 = _1546;
    }
    float _1548 = _1540;
    float _1550 = _1514;
    if (_1488)
    {
        float _1552 = _1528 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        _1550 = _1554;
    }
    float _1556 = _1550;
    float _1558 = _1548;
    if (_1488)
    {
        float _1560 = fma(_1548, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1558 = _1560;
    }
    float _1562 = _1558;
    float _1564 = _1562;
    if (_1488)
    {
        float _1566 = _1522 * _1562;
        _1564 = _1566;
    }
    float _1568 = _1564;
    if (!_1488)
    {
        _1524 = _1534;
    }
    float _1570 = _1524;
    float _1572 = _1570;
    if (_1488)
    {
        float _1574 = _1556 + (-1.0);
        _1542 = _1574;
    }
    float _1576 = _1542;
    float _1578 = _1576;
    if (_1488)
    {
        float _1580 = _1476 * _1568;
        _1502 = _1580;
    }
    float _1582 = _1502;
    if (_1488)
    {
        float _1584 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1584;
    }
    float _1586 = _1518;
    if (!_1488)
    {
        _1578 = _1478;
    }
    float _1588 = _1578;
    float _1590 = _1588;
    if (_1488)
    {
        float _1592 = _1478 * _1568;
        _1590 = _1592;
    }
    float _1594 = _1590;
    if (_1488)
    {
        float _1596 = _1582 * _1582;
        _1504 = _1596;
    }
    float _1598 = _1504;
    if (_1488)
    {
        float _1600 = fma(_1534, _1556, _1586);
        _1572 = _1600;
    }
    float _1602 = _1572;
    if (_1488)
    {
        float _1604 = _1594 * _1594;
        _1506 = _1604;
    }
    float _1606 = _1506;
    float _1608 = fma(_1602, _1602, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1612 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1610);
    float _1614 = precise::clamp(_1612, 0.0, 1.0);
    float _1616 = _1608 + _1606;
    float _1618 = -_1614;
    float _1620 = _1618 + 1.0;
    float _1622 = rsqrt(_1616);
    float _1624 = abs(_1620);
    float _1626 = log2(_1624);
    float _1628 = _1622 * _1582;
    float _1630 = _1622 * _1602;
    float _1632 = _1622 * _1594;
    float _1634 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1636 = _1630 + 1.0;
    float _1638 = -_1634;
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1638);
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1644 = -_1632;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1640);
    float _1648 = exp2(_1642);
    float _1650 = fma(_1646, -0.5, 0.5);
    float _1652 = fma(_1646, 0.5, 0.5);
    float _1654 = fma(_1652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1656 = sqrt(_1650);
    float _1658 = fma(_1652, _1654, -0.212114393711090087890625);
    float _1660 = fma(_1652, _1658, 1.570728778839111328125);
    float _1662 = -_1630;
    float _1664 = fma(_1648, _1636, _1662);
    float _1666 = _1656 * 0.636619746685028076171875;
    float _1668 = -_1660;
    float _1670 = fma(_1666, _1668, 1.0);
    float _1672 = fma(_1664, 0.5, 0.5);
    float2 _4959 = float2(_1670, _1672);
    float3 _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4959, float2(0.0), isnan(_4959)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4959, float2(0.0), isnan(_4959)), level(0.0)).xyz;
    float _1678 = _1676.x;
    float _1680 = _1676.y;
    float _1682 = _1676.z;
    float _1684 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1686 = abs(_692);
    float _1688 = log2(_1686);
    bool _1690 = _654 != 0.0;
    bool _1692 = isnan(_654);
    bool _1694 = _1690 || _1692;
    bool _1696 = isnan(0.0);
    bool _1698 = _1694 || _1696;
    float _1700 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1702 = -_236;
    float _1704 = _1702 + 1.0;
    float _1706 = _1684 * _242;
    bool _1708 = _652 == 0.0;
    bool _1710 = !_1698;
    bool _1712 = _1708 && _1710;
    float _1714 = in.m_71.x;
    float _1716 = in.m_71.y;
    float _1718 = in.m_71.z;
    float _1720 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1700);
    float _1722 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1724 = _656 == 0.0;
    bool _1726 = _1724 && _1712;
    float _1728 = trunc(_1706);
    int _1730 = int(_1728);
    float _1732 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1720);
    float _1734 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1722);
    out.m_73.x = _1153;
    out.m_73.y = _1151;
    out.m_73.z = _1155;
    float _1736 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1732);
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1740 = exp2(_1738);
    int _1742 = _1730 << 4;
    int _1744 = _1742 + 1712;
    uint _1746 = uint(int(uint(_1744) >> uint(2)));
    uint _1748 = uint(int(uint(int(_1746)) >> uint(2)));
    int _1750 = int(_1746) & 3;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[int(_1748)][_1750];
    int _1754 = int(_1746) + 1;
    uint _1756 = uint(int(uint(_1754) >> uint(2)));
    int _1758 = _1754 & 3;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[int(_1756)][_1758];
    float _1762 = _1714;
    float _1764 = _1718;
    float _1766 = _1716;
    float _1768 = _1736;
    if (!_1726)
    {
        float _1770 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1714);
        _1762 = _1770;
    }
    float _1772 = _1762;
    if (!_1726)
    {
        float _1774 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1718);
        _1764 = _1774;
    }
    float _1776 = _1764;
    if (!_1726)
    {
        float _1778 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1716);
        _1766 = _1778;
    }
    float _1780 = _1766;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1784 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1786 = isnan(_1468);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1792 = _1788 || _1790;
    int _1794 = _1744 + 8;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
    int _1800 = int(_1796) & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    float _1804 = _801 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1806 = -_770;
    float _1808 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1804);
    float _1810 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1812 = _801 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1814 = _801 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1816 = _1760 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1818 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = -_770;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1812);
    float _1824 = -_770;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1814);
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1830 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1832 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1822);
    float _1834 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1826);
    float _1836 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1840 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1842 = precise::clamp(_1840, 0.0, 1.0);
    float _1844 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1808);
    float _1846 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_75.x = _1818;
    out.m_75.y = _1828;
    out.m_75.z = _1836;
    out.m_75.w = _1782;
    float _1848 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1850 = _1832 * _1780;
    float _1852 = _1844 * _1780;
    float _1854 = _1834 * _1780;
    float _1856 = fma(_1842, -2.0, 3.0);
    float _1858 = _1842 * _1842;
    float _1860 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1862 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1846);
    float _1864 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1866 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1838);
    float _1868 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1870 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1860);
    float _1872 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1862);
    float _1874 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1864);
    float _1876 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1866);
    float _1878 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1868);
    float _1880 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1870);
    float _1882 = fma(_1872, _1772, _1850);
    float _1884 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1874);
    float _1886 = fma(_1876, _1772, _1852);
    float _1888 = fma(_1878, _1772, _1854);
    float _1890 = fma(_1880, _1776, _1882);
    float _1892 = _1858 * _1856;
    float _1894 = fma(_1884, _1776, _1886);
    float _1896 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1898 = _1736 + _1255;
    float _1900 = -_1892;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1734);
    float _1906 = _1898 * 0.5;
    float _1908 = exp2(_1896);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1892);
    bool _1912 = _692 <= 8000.0;
    bool _1914 = isnan(_692);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan(8000.0);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1924 = fma(_1904, _1776, _1888);
    float _1926 = _1922 * _1910;
    float _1928 = _1922;
    if (!_1245)
    {
        _1928 = 1.0;
    }
    float _1930 = _1928;
    out.gl_Position.x = _1299;
    out.gl_Position.y = _1297;
    out.gl_Position.z = _1736;
    out.gl_Position.w = _1255;
    float _1932 = _1930;
    if (_1245)
    {
        bool _1934 = _1359 >= _1325;
        bool _1936 = isnan(_1359);
        bool _1938 = _1934 || _1936;
        bool _1940 = isnan(_1325);
        bool _1942 = _1938 || _1940;
        float _1944 = float(_1942);
        _1932 = _1944;
    }
    float _1946 = _1932;
    float _1948 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1906;
    out.m_79.w = _1255;
    float _1950 = _1704 * _1948;
    float _1952 = precise::clamp(_1950, 0.0, 1.0);
    float _1954 = -_1908;
    float _1956 = _1954 + 1.0;
    float _1958 = _1946 * _1444;
    out.m_81.x = _1890;
    out.m_81.y = _1894;
    out.m_81.z = _1924;
    float _1960 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1962 = -_1952;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1966 = _1960 * _1361;
    float _1968 = -_1960;
    float _1970 = _1968 + 1.0;
    float _1972 = _1966;
    if (!_1792)
    {
        _1279 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1974 = _1279;
    float _1976 = -_1958;
    float _1978 = fma(_1976, _1964, 1.0);
    float _1980 = precise::clamp(_1978, 0.0, 1.0);
    float _1982 = _1372 * _1966;
    float _1984 = _1372 * _1970;
    float _1986 = _1980;
    float _1988 = _1982;
    float _1990 = _1974;
    float _1992 = _1974;
    if (!_1792)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1994 = _1768;
    float _1996 = _1980 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1998 = _1994;
    float _2000 = _1994;
    if (!_1792)
    {
        _1311 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2002 = _1311;
    float _2004 = _2002;
    float _2006 = _2002;
    if (!_1792)
    {
        _1986 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2008 = _1986;
    out.m_83.x = _1996;
    float _2010 = _1682 * _1966;
    float _2012 = fma(_1678, _1982, _1366);
    float _2014 = fma(_1680, _1982, _1368);
    float _2016 = _2008;
    float _2018 = _2008;
    if (!_1792)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2020 = _1972;
    float _2022 = fma(_1372, _2010, _1370);
    float _2024 = _2020;
    float _2026 = _2020;
    if (!_1792)
    {
        _1988 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2028 = _1988;
    out.m_85.x = _2012;
    out.m_85.y = _2014;
    out.m_85.z = _2022;
    out.m_85.w = _1984;
    bool _2030 = !_1792;
    float _2032 = _2028;
    float _2034 = _2028;
    if (!_2030)
    {
        bool _2036 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2038 = isnan(_1468);
        bool _2040 = _2036 || _2038;
        bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2044 = _2040 || _2042;
        if (!_2044)
        {
            float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2048 = _1468 + _2046;
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
            _1992 = _2088;
            _2018 = _2092;
            _2026 = _2084;
            _2006 = _2090;
            _2000 = _2086;
            _2034 = _2094;
            _2096 = true;
        }
        else
        {
            bool _2098 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2100 = isnan(_1468);
            bool _2102 = _2098 || _2100;
            bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2106 = _2102 || _2104;
            if (!_2106)
            {
                _2024 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2108 = _2024;
            _2026 = _2108;
            if (!_2106)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2110 = _1990;
            _1992 = _2110;
            if (!_2106)
            {
                _1998 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2112 = _1998;
            _2000 = _2112;
            if (!_2106)
            {
                _2004 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2114 = _2004;
            _2006 = _2114;
            if (!_2106)
            {
                _2016 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2116 = _2016;
            _2018 = _2116;
            if (!_2106)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2118 = _2032;
            bool _2120 = !_2106;
            _2034 = _2118;
            if (!_2120)
            {
                bool _2122 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2124 = isnan(_1468);
                bool _2126 = _2122 || _2124;
                bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2130 = _2126 || _2128;
                if (!_2130)
                {
                    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2134 = _1468 + _2132;
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
                    _1992 = _2174;
                    _2018 = _2178;
                    _2026 = _2170;
                    _2006 = _2176;
                    _2000 = _2172;
                    _2034 = _2180;
                    _2096 = true;
                }
                else
                {
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2018 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2026 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2006 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2000 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2096 = false;
    float _2182 = _1992;
    float _2184 = _2018;
    float _2186 = _2026;
    float _2188 = _2006;
    float _2190 = _2000;
    float _2192 = _2034;
    float _2194 = fma(_1894, -0.5, 0.5);
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
    float _2222 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2224 = fma(_2216, 0.114477999508380889892578125, _2220);
    out.m_83.w = _2222;
    float _2226 = -_2224;
    float _2228 = _2214 + _2226;
    float _2230 = -_2224;
    float _2232 = _2212 + _2230;
    float _2234 = -_2224;
    float _2236 = _2216 + _2234;
    out.m_87.x = 0.0;
    float _2238 = fma(_2228, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2224);
    float _2240 = fma(_2232, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2224);
    float _2242 = fma(_2236, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2224);
    out.m_89.x = 0.0;
    out.m_91.x = _2238;
    out.m_91.y = _2240;
    out.m_91.z = _2242;
    if (!_2210)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2244 = -_1151;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2248 = -_1153;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2252 = -_1155;
    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2256 = _2246 * _2246;
    float _2258 = fma(_2250, _2250, _2256);
    float _2260 = fma(_2254, _2254, _2258);
    float _2262 = rsqrt(_2260);
    float _2264 = _2246 * _2262;
    float _2266 = _2250 * _2262;
    float _2268 = _2254 * _2262;
    float _2270 = sqrt(_2260);
    float _2272 = -_1474;
    float _2274 = _2272 + _2264;
    float _2276 = -_1470;
    float _2278 = _2276 + _2266;
    float _2280 = -_1472;
    float _2282 = _2280 + _2268;
    float _2284 = _2274 * _2274;
    float _2286 = fma(_2278, _2278, _2284);
    float _2288 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = fma(_2282, _2282, _2286);
    float _2294 = _2290 * _2290;
    float _2296 = -_2270;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2300 = _2294 + (-1.0);
    float _2302 = rsqrt(_2292);
    float _2304 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = abs(_2306);
    float _2310 = log2(_2308);
    float _2312 = _2274 * _2302;
    float _2314 = _2278 * _2302;
    float _2316 = _2282 * _2302;
    float _2318 = _1894 * _2312;
    float _2320 = _1894 * _2264;
    float _2322 = fma(_1890, _2314, _2318);
    float _2324 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2326 = fma(_1890, _2266, _2320);
    float _2328 = fma(_1924, _2316, _2322);
    float _2330 = precise::clamp(_2328, 0.0, 1.0);
    float _2332 = fma(_1924, _2268, _2326);
    float _2334 = precise::clamp(_2332, 0.0, 1.0);
    float _2336 = exp2(_2324);
    float _2338 = _2330 * _2330;
    float _2340 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2342 = fma(_2338, _2300, 1.0);
    float _2344 = -_2264;
    float _2346 = -_2340;
    float _2348 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2346);
    float _2350 = _2342 * _2342;
    float _2352 = -_2268;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2348);
    float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2358 = _2354 + _2356;
    float _2360 = 1.0 / _2350;
    float _2362 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    float _2366 = _2336 * _2364;
    float _2368 = _2334 * _2366;
    float _2370 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2372 = _2294 * _2360;
    float _2374 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2376 = _2368 * _2372;
    float _2378 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2380 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2382 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2384 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2370;
    out.m_87.y = _2378;
    out.m_87.z = _2374;
    out.m_89.x = _2380;
    out.m_89.y = _2382;
    out.m_89.z = _2384;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2096 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_56.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_59.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2441 = as_type<float>(_126);
        out.gl_Position.z = _2441;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_61.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_59.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2510 = as_type<float>(_164);
        out.gl_Position.z = _2510;
    }
    if (_158)
    {
        return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_63.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
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
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = in.m_56.x;
    float _200 = in.m_56.y;
    float _202 = in.m_56.z;
    float _204 = _200 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _206 = _200 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _208 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].x, _204);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].x, _206);
    float _212 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].z, _208);
    float _214 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].z, _210);
    float _216 = _212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _218 = _214 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _220 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _222 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _224 = floor(_220);
    float _226 = floor(_222);
    float _228 = -_224;
    float _230 = _220 + _228;
    float _232 = -_226;
    float _234 = _222 + _232;
    float2 _2637 = float2(_230, _234);
    float _236 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2637, float2(0.0), isnan(_2637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2637, float2(0.0), isnan(_2637)), level(0.0)).x;
    float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _240 = log2(_238);
    float _242 = in.m_63.x;
    float _244 = _200 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _246 = in.m_63.z;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = in.m_63.y;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _268 = _266 != 0;
    float _270 = 1.0 / _250;
    float _272 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].x, _244);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _196 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _196 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _284 = 1.0 + _282;
    float _286 = _240 * _144;
    bool _288 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _290 = isnan(1.0);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _296 = _292 || _294;
    float _298 = 1.0 / _254;
    bool _300 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _308 = _304 || _306;
    float _310 = exp2(_286);
    float _312 = _242 * 2.0;
    float _314 = _246 * 2.0;
    float _316 = _276 * _270;
    float _318 = _242 + _246;
    float _320 = _256 + _246;
    bool _322 = !_264;
    int _324 = _322 ? 0 : 1;
    float _326 = _280 * _298;
    float _328 = 1.0 / _284;
    float _330 = _256 * 2.0;
    float _332 = _320 + (-1.0);
    float _334 = _246 + (-0.5);
    float _336 = -_310;
    float _338 = _336 + 1.0;
    float _340 = floor(_312);
    float _342 = _318 + (-1.0);
    float _344 = _242 + _256;
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _348 = _308 ? _338 : 0.0;
    float _350 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _352 = _344 + (-1.0);
    float _354 = _256 + (-0.5);
    float _356 = floor(_314);
    if (_296)
    {
        float _358 = _348 * _328;
        _148 = _358;
    }
    float _360 = _148;
    float _362 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _364 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _366 = isnan(_196);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_196);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = floor(_330);
    bool _390 = _340 >= 0.0;
    bool _392 = isnan(_340);
    bool _394 = _390 || _392;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    float _400 = -_374;
    float _402 = _400 + 1.0;
    bool _404 = _340 > 0.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    bool _410 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _412 = isnan(_196);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _426 = _398 ? 0 : 1;
    float _428 = fma(_408, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _430 = _356 > 0.0;
    float _432 = _420 * _402;
    bool _434 = _356 >= 0.0;
    bool _436 = isnan(_356);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    float _444 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].z, _272);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _446;
    float _450 = -_420;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _458 = _388 > 0.0;
    float _460 = fma(_448, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _462 = _388 >= 0.0;
    bool _464 = isnan(_388);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = fma(_456, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _482 = _444 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _484 = fma(_474, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _486 = _386 * _452;
    float _488 = -_386;
    float _490 = _488 + 1.0;
    float _492 = fma(_424, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = fma(_478, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = _428 * _486;
    float _498 = _484 * _486;
    float _500 = _482 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _502 = _460 * _486;
    int _504 = ~_426;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].y, _498);
    float _512 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[11].x, _500);
    float _514 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].x, _496);
    float _516 = in.m_65.x;
    float _518 = in.m_65.y;
    float _520 = in.m_65.z;
    float _522 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    int _524 = abs(_324);
    float _526 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[11].z, _512);
    int _528 = _508;
    if (!_404)
    {
        int _530 = ~_426;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = fma(_492, _432, _514);
    float _538 = float(_524);
    float _540 = _482 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _542 = float(_534);
    float _544 = _526 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _546 = _442 ? 0 : 1;
    float _548 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[10].x, _540);
    int _550 = _470 ? 0 : 1;
    float _552 = _538 * _542;
    int _554 = ~_546;
    int _556 = _554 + 1;
    int _558 = _556 + 1;
    float _560 = 1.0 / _544;
    int _562 = _558;
    if (!_430)
    {
        int _564 = ~_546;
        int _566 = _564 + 1;
        _562 = _566;
    }
    int _568 = _562;
    float _570 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[10].z, _548);
    bool _572 = !_260;
    int _574 = _572 ? 0 : 1;
    float _576 = _552 * (-2.0);
    int _578 = ~_550;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = _570 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _586 = _582;
    if (!_458)
    {
        int _588 = ~_550;
        int _590 = _588 + 1;
        _586 = _590;
    }
    int _592 = _586;
    float _594 = fma(_346, _576, _346);
    int _596 = abs(_574);
    float _598 = fma(_576, _518, _518);
    float _600 = _584 + _544;
    bool _602 = !_268;
    int _604 = _602 ? 0 : 1;
    float _606 = fma(_480, _432, _510);
    float _608 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[196].y, _598);
    float _610 = float(_568);
    float _612 = in.m_67.x;
    float _614 = in.m_67.y;
    float _616 = in.m_67.z;
    float _618 = float(_596);
    float _620 = _600 * _560;
    float _622 = _620 * 0.5;
    int _624 = abs(_604);
    float _626 = fma(_594, _360, _608);
    float _628 = _618 * _610;
    float _630 = float(_624);
    float _632 = fma(_494, _432, _522);
    float _634 = float(_592);
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _638 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[30].w, _636);
    float _640 = _628 * (-2.0);
    float _642 = _242 + (-0.5);
    float _644 = _626 * 0.15915493667125701904296875;
    float _646 = _630 * _634;
    float _648 = 1.0 / _638;
    float _650 = fma(_640, _516, _516);
    float _652 = in.m_69.x;
    float _654 = in.m_69.y;
    float _656 = in.m_69.z;
    float _658 = _646 * (-2.0);
    float _660 = fma(_362, _640, _362);
    float _662 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[196].x, _650);
    float _664 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _666 = fma(_350, _658, _350);
    float _668 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[145].x, _536);
    float _670 = fma(_658, _520, _520);
    float _672 = fma(_660, _360, _662);
    float _674 = _644 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = _668 * _612;
    float _680 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[196].z, _670);
    float _682 = _672 * 0.15915493667125701904296875;
    float _684 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[145].y, _606);
    float _686 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _688 = fma(_666, _360, _680);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _692 = _648 * _690;
    float _694 = _682 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _688 * 0.15915493667125701904296875;
    float _700 = _482 + _664;
    bool _702 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _704 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[145].z, _632);
    bool _706 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _708 = _684 * _614;
    float _710 = _644 * 6.283185482025146484375;
    float _712 = cos(_710);
    float _714 = _700 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _716 = _704 * _616;
    float _718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _652);
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _654);
    float _722 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _724 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[126].x, _714);
    bool _726 = !_702;
    int _728 = _726 ? 0 : 1;
    float _730 = _682 * 6.283185482025146484375;
    float _732 = cos(_730);
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _656);
    float _736 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _738 = _686 * _718;
    float _740 = _700 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _742 = 2;
    if (!_702)
    {
        _742 = 1;
    }
    int _744 = _742;
    float _746 = _722 * _720;
    float _748 = _698 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[126].z, _724);
    int _754 = _744;
    if (!_706)
    {
        _754 = _728;
    }
    int _756 = _754;
    float _758 = _736 * _734;
    float _760 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[127].x, _740);
    float _762 = _752 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _764 = _756 << 6;
    float _766 = _696 * _676;
    float _768 = _698 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _732 * _712;
    float _774 = _732 * _676;
    float _776 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[127].z, _760);
    float _778 = _696 * _712;
    int _780 = _764 + 96;
    uint _783 = uint(int(uint(_780) >> uint(2)));
    uint _785 = uint(int(uint(int(_783)) >> uint(2)));
    int _787 = int(_783) & 3;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[int(_785)][_787];
    int _791 = int(_783) + 1;
    uint _793 = uint(int(uint(_791) >> uint(2)));
    int _795 = _791 & 3;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[int(_793)][_795];
    float _799 = _776 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _801 = _732 * _750;
    float _803 = _696 * _750;
    float _805 = _712 * _750;
    float _807 = _676 * _750;
    float _809 = _801 * _746;
    float _811 = trunc(_762);
    int _813 = int(_811);
    int _815 = _764 + 104;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.vp_c15)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.vp_c15)._m0[int(_827)][_829];
    float _833 = fma(_770, _772, _766);
    float _835 = -_774;
    float _837 = fma(_770, _778, _835);
    float _839 = -_778;
    float _841 = fma(_770, _774, _839);
    float _843 = -_746;
    float _845 = _770 * _843;
    float _847 = fma(_833, _738, _809);
    float _849 = trunc(_799);
    int _851 = int(_849);
    float _853 = _803 * _746;
    float _855 = fma(_805, _738, _845);
    float _857 = fma(_841, _758, _847);
    float _859 = fma(_770, _766, _772);
    float _861 = fma(_837, _738, _853);
    float _863 = fma(_807, _758, _855);
    float _865 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _867 = _764 + 64;
    uint _869 = uint(int(uint(_867) >> uint(2)));
    uint _871 = uint(int(uint(int(_869)) >> uint(2)));
    int _873 = int(_869) & 3;
    float _875 = (*spvDescriptorSet0.vp_c15)._m0[int(_871)][_873];
    int _877 = int(_869) + 1;
    uint _879 = uint(int(uint(_877) >> uint(2)));
    int _881 = _877 & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    float _885 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _887 = fma(_859, _758, _861);
    float _889 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[26].x, _865);
    int _891 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _893 = _813 + _891;
    int _895 = _893 + 1;
    float _897 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[24].x, _885);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _889);
    int _901 = _764 + 48;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    uint _905 = uint(int(uint(int(_903)) >> uint(2)));
    int _907 = int(_903) & 3;
    float _909 = (*spvDescriptorSet0.vp_c15)._m0[int(_905)][_907];
    int _911 = int(_903) + 1;
    uint _913 = uint(int(uint(_911) >> uint(2)));
    int _915 = _911 & 3;
    float _917 = (*spvDescriptorSet0.vp_c15)._m0[int(_913)][_915];
    int _919 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _921 = _851 + _919;
    int _923 = _921 + 1;
    float _925 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _897);
    float _927 = _899 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _929 = _895 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _931 = _895 | _923;
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _935 = _764 + 56;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[int(_947)][_949];
    float _953 = _218 + _927;
    bool _955 = _931 < 0;
    bool _957 = _955 || _929;
    float _959 = _216 + _933;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _963 = _953 + _961;
    bool _965 = _923 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _967 = _965 || _957;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _971 = _959 + _969;
    int _973 = _764 + 72;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    uint _977 = uint(int(uint(int(_975)) >> uint(2)));
    int _979 = int(_975) & 3;
    float _981 = (*spvDescriptorSet0.vp_c15)._m0[int(_977)][_979];
    int _983 = int(_975) + 1;
    uint _985 = uint(int(uint(_983) >> uint(2)));
    int _987 = _983 & 3;
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[int(_985)][_987];
    float _991 = _963 * _963;
    float _993 = _700 * _797;
    float _995 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _997 = fma(_971, _971, _991);
    float _999 = fma(_216, _789, _993);
    float _1001 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[25].x, _995);
    int _1003 = _764 + 80;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    uint _1007 = uint(int(uint(int(_1005)) >> uint(2)));
    int _1009 = int(_1005) & 3;
    float _1011 = (*spvDescriptorSet0.vp_c15)._m0[int(_1007)][_1009];
    int _1013 = int(_1005) + 1;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    int _1017 = _1013 & 3;
    float _1019 = (*spvDescriptorSet0.vp_c15)._m0[int(_1015)][_1017];
    float _1021 = sqrt(_997);
    float _1023 = fma(_218, _823, _999);
    uint _1025 = uint(_895);
    int _1027 = as_type<int>(_831);
    float _1029 = _857;
    float _1031 = _959;
    if (!_967)
    {
        int _1033 = _923 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1035 = _1033 + _895;
        _1025 = uint(_1035);
    }
    uint _1037 = _1025;
    float _1039 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1001);
    float _1041 = _1023 + _831;
    float _1043 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1045 = _995;
    if (!_967)
    {
        float _1047 = floor(_762);
        _1045 = _1047;
    }
    float _1049 = _1045;
    if (!_967)
    {
        uint _1051 = uint(int(uint(int(_1037)) >> uint(2)));
        _1027 = int(_1051);
    }
    int _1053 = _1027;
    float _1055 = _700 * _883;
    bool _1057 = _1021 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1059 = 1.0 / _1041;
    float _1061 = fma(_216, _875, _1055);
    int _1063 = as_type<int>(_875);
    int _1065 = _1053;
    float _1067 = _1061;
    if (!_967)
    {
        int _1069 = int(_1037) << 2;
        _1063 = _1069;
    }
    int _1071 = _1063;
    float _1073 = _700 * _917;
    int _1075 = _1071;
    if (!_967)
    {
        int _1077 = 12 & _1071;
        _1075 = _1077;
    }
    int _1079 = _1075;
    float _1081 = fma(_216, _909, _1073);
    float _1083 = _482 + _1043;
    float _1085 = as_type<float>(_1079);
    if (!_967)
    {
        int _1087 = _1053 << 4;
        int _1089 = _1087 + _1079;
        _1065 = _1089;
    }
    int _1091 = _1065;
    float _1093 = fma(_218, _943, _1081);
    if (!_1057)
    {
        _1085 = _959;
    }
    float _1095 = _1085;
    float _1097 = _1095;
    if (!_1057)
    {
        _1029 = _953;
    }
    float _1099 = _1029;
    float _1101 = _1093 + _951;
    float _1103 = fma(_218, _981, _1061);
    float _1105 = _1099;
    if (!_1057)
    {
        _1067 = _1083;
    }
    float _1107 = _1067;
    float _1109 = _1103 + _989;
    bool _1111 = !_1057;
    float _1113 = _1107;
    if (!_1111)
    {
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1119 = _1021 + _1117;
        float _1121 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = rsqrt(_997);
        float _1125 = _1119 * _1115;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = _1127 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1131 + (-1.0);
        float _1139 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = fma(_1135, _1121, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1143 = fma(_1083, _1131, _1139);
        float _1145 = _1123 * _1141;
        float _1147 = fma(_971, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1149 = fma(_963, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1143;
        _1097 = _1147;
        _1105 = _1149;
    }
    float _1151 = _1113;
    float _1153 = _1097;
    float _1155 = _1105;
    int _1157 = _764 + 88;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    uint _1161 = uint(int(uint(int(_1159)) >> uint(2)));
    int _1163 = int(_1159) & 3;
    float _1165 = (*spvDescriptorSet0.vp_c15)._m0[int(_1161)][_1163];
    int _1167 = int(_1159) + 1;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    int _1171 = _1167 & 3;
    float _1173 = (*spvDescriptorSet0.vp_c15)._m0[int(_1169)][_1171];
    float _1175 = _1101 * _1059;
    float _1177 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1179 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1181 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1183 = _1109 * _1059;
    float _1185 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1177);
    float _1187 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1179);
    float _1189 = _953;
    if (!_967)
    {
        int _1191 = _1091 + 400;
        uint _1193 = uint(int(uint(_1191) >> uint(2)));
        uint _1195 = uint(int(uint(int(_1193)) >> uint(2)));
        int _1197 = int(_1193) & 3;
        float _1199 = (*spvDescriptorSet0.vp_c15)._m0[int(_1195)][_1197];
        _1189 = _1199;
    }
    float _1201 = _1189;
    float _1203 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1181);
    float _1205 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1185);
    float _1207 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1187);
    float _1209 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1211 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1203);
    float _1213 = _1205 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1215 = _1175 >= 0.0;
    float _1217 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1209);
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1221 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1223 = _1175 <= 1.0;
    bool _1225 = _1223 && _1215;
    float _1227 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1229 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1217);
    float _1231 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1221);
    bool _1233 = _1183 >= 0.0;
    bool _1235 = _1233 && _1225;
    float _1237 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1239 = _1229 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1231);
    bool _1243 = _1183 <= 1.0;
    bool _1245 = _1243 && _1235;
    float _1247 = _971;
    if (!_967)
    {
        float _1249 = floor(_799);
        _1247 = _1249;
    }
    float _1251 = _1247;
    float _1253 = _1227 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1255 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1241);
    float _1257 = _700 * _1019;
    float _1259 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1261 = -_1253;
    float _1263 = fma(_1261, _1237, 1.0);
    float _1265 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1267 = fma(_216, _1011, _1257);
    float _1269 = 1.0 / _1255;
    float _1271 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1259);
    float _1273 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1265);
    float _1275 = _1253;
    float _1277 = _1265;
    float _1279 = _1255;
    if (_1245)
    {
        float _1281 = float(_756);
        _1275 = _1281;
    }
    float _1283 = _1275;
    float _1285 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1271);
    float _1287 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1273);
    if (!_967)
    {
        float _1289 = -_1251;
        float _1291 = _799 + _1289;
        _1031 = _1291;
    }
    float _1293 = _1031;
    float _1295 = log2(_1263);
    float _1297 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1287);
    float _1299 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1285);
    float _1301 = fma(_218, _1165, _1267);
    float _1303 = _1301 + _1173;
    float _1305 = _1297 * _1269;
    float _1307 = _1259;
    float _1309 = _1173;
    float _1311 = _1297;
    if (_1245)
    {
        float _1313 = rint(_1283);
        float _1315 = precise::max(_1313, 0.0);
        uint _1317 = uint(_1315);
        uint _1319 = clamp(_1317, 0u, 65535u);
        _1307 = as_type<float>(_1319);
    }
    float _1321 = _1307;
    float _1323 = _1299 * _1269;
    float _1325 = _1303 * _1059;
    if (!_967)
    {
        float _1327 = -_1049;
        float _1329 = _762 + _1327;
        _1309 = _1329;
    }
    float _1331 = _1309;
    float _1333 = fma(_1323, 0.5, 0.5);
    float _1335 = _1295 * 0.693147182464599609375;
    float _1337 = fma(_1305, -0.5, 0.5);
    float _1339 = _1305;
    if (!_967)
    {
        float _1341 = rint(_1201);
        float _1343 = precise::max(_1341, 0.0);
        uint _1345 = uint(_1343);
        uint _1347 = clamp(_1345, 0u, 65535u);
        _1339 = as_type<float>(_1347);
    }
    float _1349 = _1339;
    float _1351 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1353 = _762;
    float _1355 = _1351;
    if (_1245)
    {
        float3 _4449 = float3(_1175, _1183, float(as_type<int>(_1321)));
        float3 _4453 = select(_4449, float3(0.0), isnan(_4449));
        float _1357 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4453.xy, uint(rint(_4453.z)), _1325, level(0.0));
        _1353 = _1357;
    }
    float _1359 = _1353;
    float3 _4463 = float3(_1333, _1337, _1351);
    float _1361 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4463, float3(0.0), isnan(_4463)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4463, float3(0.0), isnan(_4463)), level(0.0)).x;
    float3 _4472 = float3(_1333, _1337, _1351);
    float4 _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4472, float3(0.0), isnan(_4472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4472, float3(0.0), isnan(_4472)), level(0.0)).xyzw;
    float _1366 = _1364.x;
    float _1368 = _1364.y;
    float _1370 = _1364.z;
    float _1372 = _1364.w;
    float _1374 = _1293;
    if (!_967)
    {
        float3 _4495 = float3(_1331, _1293, float(as_type<int>(_1349)));
        float3 _4497 = select(_4495, float3(0.0), isnan(_4495));
        float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4497.xy, uint(rint(_4497.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4497.xy, uint(rint(_4497.z)), level(0.0)).x;
        _1374 = _1376;
    }
    float _1378 = _1374;
    if (_967)
    {
        _1277 = 1.0;
    }
    float _1380 = _1277;
    float _1382 = _1380;
    if (!_967)
    {
        int _1384 = int(_1037) << 4;
        int _1386 = _1384 + 2048;
        uint _1388 = uint(int(uint(_1386) >> uint(2)));
        uint _1390 = uint(int(uint(int(_1388)) >> uint(2)));
        int _1392 = int(_1388) & 3;
        float _1394 = (*spvDescriptorSet0.vp_c15)._m0[int(_1390)][_1392];
        int _1396 = int(_1388) + 1;
        uint _1398 = uint(int(uint(_1396) >> uint(2)));
        int _1400 = _1396 & 3;
        float _1402 = (*spvDescriptorSet0.vp_c15)._m0[int(_1398)][_1400];
        int _1404 = _1386 + 8;
        uint _1406 = uint(int(uint(_1404) >> uint(2)));
        uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
        int _1410 = int(_1406) & 3;
        float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
        int _1414 = int(_1406) + 1;
        uint _1416 = uint(int(uint(_1414) >> uint(2)));
        int _1418 = _1414 & 3;
        float _1420 = (*spvDescriptorSet0.vp_c15)._m0[int(_1416)][_1418];
        float _1422 = _700 * _1402;
        float _1424 = fma(_216, _1394, _1422);
        float _1426 = fma(_218, _1412, _1424);
        float _1428 = _1426 + _1420;
        float _1430 = precise::clamp(_1428, 0.0, 1.0);
        float _1432 = -_1430;
        float _1434 = _1432 + _1378;
        float _1436 = fma(_1434, 500.0, 1.5);
        float _1438 = exp2(_1436);
        float _1440 = 0.0 + _1438;
        float _1442 = precise::clamp(_1440, 0.0, 1.0);
        _1382 = _1442;
    }
    float _1444 = _1382;
    float _1446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1448 = _1151 + _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1452 = _1153 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1456 = _1155 + _1454;
    float _1458 = _1448 * _1448;
    float _1460 = fma(_1452, _1452, _1458);
    float _1462 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1464 = fma(_1456, _1456, _1460);
    float _1466 = rsqrt(_1464);
    float _1468 = sqrt(_1464);
    float _1470 = _1452 * _1466;
    float _1472 = _1456 * _1466;
    float _1474 = _1448 * _1466;
    float _1476 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1478 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1480 = _1476 * _1476;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 + _1482;
    float _1486 = sqrt(_1484);
    bool _1488 = _1486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = _1486 + _1490;
    float _1494 = _1337;
    float _1496 = _1492;
    float _1498 = _1462;
    float _1500 = _1466;
    float _1502 = _1476;
    float _1504 = _1480;
    float _1506 = _1482;
    if (_1488)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1508;
    }
    float _1510 = _1494;
    if (_1488)
    {
        float _1512 = _1492 * _1510;
        _1496 = _1512;
    }
    float _1514 = _1496;
    float _1516 = precise::max(0.0, _1462);
    float _1518 = _1516;
    if (_1488)
    {
        float _1520 = rsqrt(_1484);
        _1498 = _1520;
    }
    float _1522 = _1498;
    float _1524 = _1522;
    if (_1488)
    {
        float _1526 = _1514 * 0.15915493667125701904296875;
        _1355 = _1526;
    }
    float _1528 = _1355;
    float _1530 = -_1474;
    float _1532 = -_1516;
    float _1534 = fma(_1530, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1532);
    if (_1488)
    {
        float _1536 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1536;
    }
    float _1538 = _1500;
    float _1540 = _1378;
    float _1542 = _1538;
    if (_1488)
    {
        float _1544 = _1528 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        _1540 = _1546;
    }
    float _1548 = _1540;
    float _1550 = _1514;
    if (_1488)
    {
        float _1552 = _1528 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        _1550 = _1554;
    }
    float _1556 = _1550;
    float _1558 = _1548;
    if (_1488)
    {
        float _1560 = fma(_1548, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1558 = _1560;
    }
    float _1562 = _1558;
    float _1564 = _1562;
    if (_1488)
    {
        float _1566 = _1522 * _1562;
        _1564 = _1566;
    }
    float _1568 = _1564;
    if (!_1488)
    {
        _1524 = _1534;
    }
    float _1570 = _1524;
    float _1572 = _1570;
    if (_1488)
    {
        float _1574 = _1556 + (-1.0);
        _1542 = _1574;
    }
    float _1576 = _1542;
    float _1578 = _1576;
    if (_1488)
    {
        float _1580 = _1476 * _1568;
        _1502 = _1580;
    }
    float _1582 = _1502;
    if (_1488)
    {
        float _1584 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1584;
    }
    float _1586 = _1518;
    if (!_1488)
    {
        _1578 = _1478;
    }
    float _1588 = _1578;
    float _1590 = _1588;
    if (_1488)
    {
        float _1592 = _1478 * _1568;
        _1590 = _1592;
    }
    float _1594 = _1590;
    if (_1488)
    {
        float _1596 = _1582 * _1582;
        _1504 = _1596;
    }
    float _1598 = _1504;
    if (_1488)
    {
        float _1600 = fma(_1534, _1556, _1586);
        _1572 = _1600;
    }
    float _1602 = _1572;
    if (_1488)
    {
        float _1604 = _1594 * _1594;
        _1506 = _1604;
    }
    float _1606 = _1506;
    float _1608 = fma(_1602, _1602, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1612 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1610);
    float _1614 = precise::clamp(_1612, 0.0, 1.0);
    float _1616 = _1608 + _1606;
    float _1618 = -_1614;
    float _1620 = _1618 + 1.0;
    float _1622 = rsqrt(_1616);
    float _1624 = abs(_1620);
    float _1626 = log2(_1624);
    float _1628 = _1622 * _1582;
    float _1630 = _1622 * _1602;
    float _1632 = _1622 * _1594;
    float _1634 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1636 = _1630 + 1.0;
    float _1638 = -_1634;
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1638);
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1644 = -_1632;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1640);
    float _1648 = exp2(_1642);
    float _1650 = fma(_1646, -0.5, 0.5);
    float _1652 = fma(_1646, 0.5, 0.5);
    float _1654 = fma(_1652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1656 = sqrt(_1650);
    float _1658 = fma(_1652, _1654, -0.212114393711090087890625);
    float _1660 = fma(_1652, _1658, 1.570728778839111328125);
    float _1662 = -_1630;
    float _1664 = fma(_1648, _1636, _1662);
    float _1666 = _1656 * 0.636619746685028076171875;
    float _1668 = -_1660;
    float _1670 = fma(_1666, _1668, 1.0);
    float _1672 = fma(_1664, 0.5, 0.5);
    float2 _4959 = float2(_1670, _1672);
    float3 _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4959, float2(0.0), isnan(_4959)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4959, float2(0.0), isnan(_4959)), level(0.0)).xyz;
    float _1678 = _1676.x;
    float _1680 = _1676.y;
    float _1682 = _1676.z;
    float _1684 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1686 = abs(_692);
    float _1688 = log2(_1686);
    bool _1690 = _654 != 0.0;
    bool _1692 = isnan(_654);
    bool _1694 = _1690 || _1692;
    bool _1696 = isnan(0.0);
    bool _1698 = _1694 || _1696;
    float _1700 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1702 = -_236;
    float _1704 = _1702 + 1.0;
    float _1706 = _1684 * _242;
    bool _1708 = _652 == 0.0;
    bool _1710 = !_1698;
    bool _1712 = _1708 && _1710;
    float _1714 = in.m_71.x;
    float _1716 = in.m_71.y;
    float _1718 = in.m_71.z;
    float _1720 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1700);
    float _1722 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1724 = _656 == 0.0;
    bool _1726 = _1724 && _1712;
    float _1728 = trunc(_1706);
    int _1730 = int(_1728);
    float _1732 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1720);
    float _1734 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1722);
    out.m_73.x = _1153;
    out.m_73.y = _1151;
    out.m_73.z = _1155;
    float _1736 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1732);
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1740 = exp2(_1738);
    int _1742 = _1730 << 4;
    int _1744 = _1742 + 1712;
    uint _1746 = uint(int(uint(_1744) >> uint(2)));
    uint _1748 = uint(int(uint(int(_1746)) >> uint(2)));
    int _1750 = int(_1746) & 3;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[int(_1748)][_1750];
    int _1754 = int(_1746) + 1;
    uint _1756 = uint(int(uint(_1754) >> uint(2)));
    int _1758 = _1754 & 3;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[int(_1756)][_1758];
    float _1762 = _1714;
    float _1764 = _1718;
    float _1766 = _1716;
    float _1768 = _1736;
    if (!_1726)
    {
        float _1770 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1714);
        _1762 = _1770;
    }
    float _1772 = _1762;
    if (!_1726)
    {
        float _1774 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1718);
        _1764 = _1774;
    }
    float _1776 = _1764;
    if (!_1726)
    {
        float _1778 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1716);
        _1766 = _1778;
    }
    float _1780 = _1766;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1784 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1786 = isnan(_1468);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1792 = _1788 || _1790;
    int _1794 = _1744 + 8;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
    int _1800 = int(_1796) & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    float _1804 = _801 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1806 = -_770;
    float _1808 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1804);
    float _1810 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1812 = _801 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1814 = _801 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1816 = _1760 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1818 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = -_770;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1812);
    float _1824 = -_770;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1814);
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1830 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1832 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1822);
    float _1834 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1826);
    float _1836 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1840 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1842 = precise::clamp(_1840, 0.0, 1.0);
    float _1844 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1808);
    float _1846 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_75.x = _1818;
    out.m_75.y = _1828;
    out.m_75.z = _1836;
    out.m_75.w = _1782;
    float _1848 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1850 = _1832 * _1780;
    float _1852 = _1844 * _1780;
    float _1854 = _1834 * _1780;
    float _1856 = fma(_1842, -2.0, 3.0);
    float _1858 = _1842 * _1842;
    float _1860 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1862 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1846);
    float _1864 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1866 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1838);
    float _1868 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1870 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1860);
    float _1872 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1862);
    float _1874 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1864);
    float _1876 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1866);
    float _1878 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1868);
    float _1880 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1870);
    float _1882 = fma(_1872, _1772, _1850);
    float _1884 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1874);
    float _1886 = fma(_1876, _1772, _1852);
    float _1888 = fma(_1878, _1772, _1854);
    float _1890 = fma(_1880, _1776, _1882);
    float _1892 = _1858 * _1856;
    float _1894 = fma(_1884, _1776, _1886);
    float _1896 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1898 = _1736 + _1255;
    float _1900 = -_1892;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1734);
    float _1906 = _1898 * 0.5;
    float _1908 = exp2(_1896);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1892);
    bool _1912 = _692 <= 8000.0;
    bool _1914 = isnan(_692);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan(8000.0);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1924 = fma(_1904, _1776, _1888);
    float _1926 = _1922 * _1910;
    float _1928 = _1922;
    if (!_1245)
    {
        _1928 = 1.0;
    }
    float _1930 = _1928;
    out.gl_Position.x = _1299;
    out.gl_Position.y = _1297;
    out.gl_Position.z = _1736;
    out.gl_Position.w = _1255;
    float _1932 = _1930;
    if (_1245)
    {
        bool _1934 = _1359 >= _1325;
        bool _1936 = isnan(_1359);
        bool _1938 = _1934 || _1936;
        bool _1940 = isnan(_1325);
        bool _1942 = _1938 || _1940;
        float _1944 = float(_1942);
        _1932 = _1944;
    }
    float _1946 = _1932;
    float _1948 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1906;
    out.m_79.w = _1255;
    float _1950 = _1704 * _1948;
    float _1952 = precise::clamp(_1950, 0.0, 1.0);
    float _1954 = -_1908;
    float _1956 = _1954 + 1.0;
    float _1958 = _1946 * _1444;
    out.m_81.x = _1890;
    out.m_81.y = _1894;
    out.m_81.z = _1924;
    float _1960 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1962 = -_1952;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1966 = _1960 * _1361;
    float _1968 = -_1960;
    float _1970 = _1968 + 1.0;
    float _1972 = _1966;
    if (!_1792)
    {
        _1279 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1974 = _1279;
    float _1976 = -_1958;
    float _1978 = fma(_1976, _1964, 1.0);
    float _1980 = precise::clamp(_1978, 0.0, 1.0);
    float _1982 = _1372 * _1966;
    float _1984 = _1372 * _1970;
    float _1986 = _1980;
    float _1988 = _1982;
    float _1990 = _1974;
    float _1992 = _1974;
    if (!_1792)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1994 = _1768;
    float _1996 = _1980 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1998 = _1994;
    float _2000 = _1994;
    if (!_1792)
    {
        _1311 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2002 = _1311;
    float _2004 = _2002;
    float _2006 = _2002;
    if (!_1792)
    {
        _1986 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2008 = _1986;
    out.m_83.x = _1996;
    float _2010 = _1682 * _1966;
    float _2012 = fma(_1678, _1982, _1366);
    float _2014 = fma(_1680, _1982, _1368);
    float _2016 = _2008;
    float _2018 = _2008;
    if (!_1792)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2020 = _1972;
    float _2022 = fma(_1372, _2010, _1370);
    float _2024 = _2020;
    float _2026 = _2020;
    if (!_1792)
    {
        _1988 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2028 = _1988;
    out.m_85.x = _2012;
    out.m_85.y = _2014;
    out.m_85.z = _2022;
    out.m_85.w = _1984;
    bool _2030 = !_1792;
    float _2032 = _2028;
    float _2034 = _2028;
    if (!_2030)
    {
        bool _2036 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2038 = isnan(_1468);
        bool _2040 = _2036 || _2038;
        bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2044 = _2040 || _2042;
        if (!_2044)
        {
            float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2048 = _1468 + _2046;
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
            _1992 = _2088;
            _2018 = _2092;
            _2026 = _2084;
            _2006 = _2090;
            _2000 = _2086;
            _2034 = _2094;
            _2096 = true;
        }
        else
        {
            bool _2098 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2100 = isnan(_1468);
            bool _2102 = _2098 || _2100;
            bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2106 = _2102 || _2104;
            if (!_2106)
            {
                _2024 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2108 = _2024;
            _2026 = _2108;
            if (!_2106)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2110 = _1990;
            _1992 = _2110;
            if (!_2106)
            {
                _1998 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2112 = _1998;
            _2000 = _2112;
            if (!_2106)
            {
                _2004 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2114 = _2004;
            _2006 = _2114;
            if (!_2106)
            {
                _2016 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2116 = _2016;
            _2018 = _2116;
            if (!_2106)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2118 = _2032;
            bool _2120 = !_2106;
            _2034 = _2118;
            if (!_2120)
            {
                bool _2122 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2124 = isnan(_1468);
                bool _2126 = _2122 || _2124;
                bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2130 = _2126 || _2128;
                if (!_2130)
                {
                    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2134 = _1468 + _2132;
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
                    _1992 = _2174;
                    _2018 = _2178;
                    _2026 = _2170;
                    _2006 = _2176;
                    _2000 = _2172;
                    _2034 = _2180;
                    _2096 = true;
                }
                else
                {
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2018 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2026 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2006 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2000 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2096 = false;
    float _2182 = _1992;
    float _2184 = _2018;
    float _2186 = _2026;
    float _2188 = _2006;
    float _2190 = _2000;
    float _2192 = _2034;
    float _2194 = fma(_1894, -0.5, 0.5);
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
    float _2222 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2224 = fma(_2216, 0.114477999508380889892578125, _2220);
    out.m_83.w = _2222;
    float _2226 = -_2224;
    float _2228 = _2214 + _2226;
    float _2230 = -_2224;
    float _2232 = _2212 + _2230;
    float _2234 = -_2224;
    float _2236 = _2216 + _2234;
    out.m_87.x = 0.0;
    float _2238 = fma(_2228, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2224);
    float _2240 = fma(_2232, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2224);
    float _2242 = fma(_2236, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2224);
    out.m_89.x = 0.0;
    out.m_91.x = _2238;
    out.m_91.y = _2240;
    out.m_91.z = _2242;
    if (!_2210)
    {
        return out;
    }
    float _2244 = -_1151;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2248 = -_1153;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2252 = -_1155;
    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2256 = _2246 * _2246;
    float _2258 = fma(_2250, _2250, _2256);
    float _2260 = fma(_2254, _2254, _2258);
    float _2262 = rsqrt(_2260);
    float _2264 = _2246 * _2262;
    float _2266 = _2250 * _2262;
    float _2268 = _2254 * _2262;
    float _2270 = sqrt(_2260);
    float _2272 = -_1474;
    float _2274 = _2272 + _2264;
    float _2276 = -_1470;
    float _2278 = _2276 + _2266;
    float _2280 = -_1472;
    float _2282 = _2280 + _2268;
    float _2284 = _2274 * _2274;
    float _2286 = fma(_2278, _2278, _2284);
    float _2288 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = fma(_2282, _2282, _2286);
    float _2294 = _2290 * _2290;
    float _2296 = -_2270;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2300 = _2294 + (-1.0);
    float _2302 = rsqrt(_2292);
    float _2304 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = abs(_2306);
    float _2310 = log2(_2308);
    float _2312 = _2274 * _2302;
    float _2314 = _2278 * _2302;
    float _2316 = _2282 * _2302;
    float _2318 = _1894 * _2312;
    float _2320 = _1894 * _2264;
    float _2322 = fma(_1890, _2314, _2318);
    float _2324 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2326 = fma(_1890, _2266, _2320);
    float _2328 = fma(_1924, _2316, _2322);
    float _2330 = precise::clamp(_2328, 0.0, 1.0);
    float _2332 = fma(_1924, _2268, _2326);
    float _2334 = precise::clamp(_2332, 0.0, 1.0);
    float _2336 = exp2(_2324);
    float _2338 = _2330 * _2330;
    float _2340 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2342 = fma(_2338, _2300, 1.0);
    float _2344 = -_2264;
    float _2346 = -_2340;
    float _2348 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2346);
    float _2350 = _2342 * _2342;
    float _2352 = -_2268;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2348);
    float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2358 = _2354 + _2356;
    float _2360 = 1.0 / _2350;
    float _2362 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    float _2366 = _2336 * _2364;
    float _2368 = _2334 * _2366;
    float _2370 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2372 = _2294 * _2360;
    float _2374 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2376 = _2368 * _2372;
    float _2378 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2380 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2382 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2384 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2370;
    out.m_87.y = _2378;
    out.m_87.z = _2374;
    out.m_89.x = _2380;
    out.m_89.y = _2382;
    out.m_89.z = _2384;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2096 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_56.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_59.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2441 = as_type<float>(_126);
        out.gl_Position.z = _2441;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_61.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_59.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2510 = as_type<float>(_164);
        out.gl_Position.z = _2510;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_63.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
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
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = in.m_56.x;
    float _200 = in.m_56.y;
    float _202 = in.m_56.z;
    float _204 = _200 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _206 = _200 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _208 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].x, _204);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].x, _206);
    float _212 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].z, _208);
    float _214 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].z, _210);
    float _216 = _212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _218 = _214 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _220 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _222 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _224 = floor(_220);
    float _226 = floor(_222);
    float _228 = -_224;
    float _230 = _220 + _228;
    float _232 = -_226;
    float _234 = _222 + _232;
    float2 _2637 = float2(_230, _234);
    float _236 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2637, float2(0.0), isnan(_2637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2637, float2(0.0), isnan(_2637)), level(0.0)).x;
    float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _240 = log2(_238);
    float _242 = in.m_63.x;
    float _244 = _200 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _246 = in.m_63.z;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = in.m_63.y;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _268 = _266 != 0;
    float _270 = 1.0 / _250;
    float _272 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].x, _244);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _196 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _196 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _284 = 1.0 + _282;
    float _286 = _240 * _144;
    bool _288 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _290 = isnan(1.0);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _296 = _292 || _294;
    float _298 = 1.0 / _254;
    bool _300 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _308 = _304 || _306;
    float _310 = exp2(_286);
    float _312 = _242 * 2.0;
    float _314 = _246 * 2.0;
    float _316 = _276 * _270;
    float _318 = _242 + _246;
    float _320 = _256 + _246;
    bool _322 = !_264;
    int _324 = _322 ? 0 : 1;
    float _326 = _280 * _298;
    float _328 = 1.0 / _284;
    float _330 = _256 * 2.0;
    float _332 = _320 + (-1.0);
    float _334 = _246 + (-0.5);
    float _336 = -_310;
    float _338 = _336 + 1.0;
    float _340 = floor(_312);
    float _342 = _318 + (-1.0);
    float _344 = _242 + _256;
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _348 = _308 ? _338 : 0.0;
    float _350 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _352 = _344 + (-1.0);
    float _354 = _256 + (-0.5);
    float _356 = floor(_314);
    if (_296)
    {
        float _358 = _348 * _328;
        _148 = _358;
    }
    float _360 = _148;
    float _362 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _364 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _366 = isnan(_196);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_196);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = floor(_330);
    bool _390 = _340 >= 0.0;
    bool _392 = isnan(_340);
    bool _394 = _390 || _392;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    float _400 = -_374;
    float _402 = _400 + 1.0;
    bool _404 = _340 > 0.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    bool _410 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _412 = isnan(_196);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _426 = _398 ? 0 : 1;
    float _428 = fma(_408, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _430 = _356 > 0.0;
    float _432 = _420 * _402;
    bool _434 = _356 >= 0.0;
    bool _436 = isnan(_356);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    float _444 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].z, _272);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _446;
    float _450 = -_420;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _458 = _388 > 0.0;
    float _460 = fma(_448, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _462 = _388 >= 0.0;
    bool _464 = isnan(_388);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = fma(_456, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _482 = _444 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _484 = fma(_474, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _486 = _386 * _452;
    float _488 = -_386;
    float _490 = _488 + 1.0;
    float _492 = fma(_424, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = fma(_478, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = _428 * _486;
    float _498 = _484 * _486;
    float _500 = _482 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _502 = _460 * _486;
    int _504 = ~_426;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].y, _498);
    float _512 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[11].x, _500);
    float _514 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].x, _496);
    float _516 = in.m_65.x;
    float _518 = in.m_65.y;
    float _520 = in.m_65.z;
    float _522 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    int _524 = abs(_324);
    float _526 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[11].z, _512);
    int _528 = _508;
    if (!_404)
    {
        int _530 = ~_426;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = fma(_492, _432, _514);
    float _538 = float(_524);
    float _540 = _482 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _542 = float(_534);
    float _544 = _526 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _546 = _442 ? 0 : 1;
    float _548 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[10].x, _540);
    int _550 = _470 ? 0 : 1;
    float _552 = _538 * _542;
    int _554 = ~_546;
    int _556 = _554 + 1;
    int _558 = _556 + 1;
    float _560 = 1.0 / _544;
    int _562 = _558;
    if (!_430)
    {
        int _564 = ~_546;
        int _566 = _564 + 1;
        _562 = _566;
    }
    int _568 = _562;
    float _570 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[10].z, _548);
    bool _572 = !_260;
    int _574 = _572 ? 0 : 1;
    float _576 = _552 * (-2.0);
    int _578 = ~_550;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = _570 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _586 = _582;
    if (!_458)
    {
        int _588 = ~_550;
        int _590 = _588 + 1;
        _586 = _590;
    }
    int _592 = _586;
    float _594 = fma(_346, _576, _346);
    int _596 = abs(_574);
    float _598 = fma(_576, _518, _518);
    float _600 = _584 + _544;
    bool _602 = !_268;
    int _604 = _602 ? 0 : 1;
    float _606 = fma(_480, _432, _510);
    float _608 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[196].y, _598);
    float _610 = float(_568);
    float _612 = in.m_67.x;
    float _614 = in.m_67.y;
    float _616 = in.m_67.z;
    float _618 = float(_596);
    float _620 = _600 * _560;
    float _622 = _620 * 0.5;
    int _624 = abs(_604);
    float _626 = fma(_594, _360, _608);
    float _628 = _618 * _610;
    float _630 = float(_624);
    float _632 = fma(_494, _432, _522);
    float _634 = float(_592);
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _638 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[30].w, _636);
    float _640 = _628 * (-2.0);
    float _642 = _242 + (-0.5);
    float _644 = _626 * 0.15915493667125701904296875;
    float _646 = _630 * _634;
    float _648 = 1.0 / _638;
    float _650 = fma(_640, _516, _516);
    float _652 = in.m_69.x;
    float _654 = in.m_69.y;
    float _656 = in.m_69.z;
    float _658 = _646 * (-2.0);
    float _660 = fma(_362, _640, _362);
    float _662 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[196].x, _650);
    float _664 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _666 = fma(_350, _658, _350);
    float _668 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[145].x, _536);
    float _670 = fma(_658, _520, _520);
    float _672 = fma(_660, _360, _662);
    float _674 = _644 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = _668 * _612;
    float _680 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[196].z, _670);
    float _682 = _672 * 0.15915493667125701904296875;
    float _684 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[145].y, _606);
    float _686 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _688 = fma(_666, _360, _680);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _692 = _648 * _690;
    float _694 = _682 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _688 * 0.15915493667125701904296875;
    float _700 = _482 + _664;
    bool _702 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _704 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[145].z, _632);
    bool _706 = _692 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _708 = _684 * _614;
    float _710 = _644 * 6.283185482025146484375;
    float _712 = cos(_710);
    float _714 = _700 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _716 = _704 * _616;
    float _718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _652);
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _654);
    float _722 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _724 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[126].x, _714);
    bool _726 = !_702;
    int _728 = _726 ? 0 : 1;
    float _730 = _682 * 6.283185482025146484375;
    float _732 = cos(_730);
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _656);
    float _736 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _738 = _686 * _718;
    float _740 = _700 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _742 = 2;
    if (!_702)
    {
        _742 = 1;
    }
    int _744 = _742;
    float _746 = _722 * _720;
    float _748 = _698 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[126].z, _724);
    int _754 = _744;
    if (!_706)
    {
        _754 = _728;
    }
    int _756 = _754;
    float _758 = _736 * _734;
    float _760 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[127].x, _740);
    float _762 = _752 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _764 = _756 << 6;
    float _766 = _696 * _676;
    float _768 = _698 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _732 * _712;
    float _774 = _732 * _676;
    float _776 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[127].z, _760);
    float _778 = _696 * _712;
    int _780 = _764 + 96;
    uint _783 = uint(int(uint(_780) >> uint(2)));
    uint _785 = uint(int(uint(int(_783)) >> uint(2)));
    int _787 = int(_783) & 3;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[int(_785)][_787];
    int _791 = int(_783) + 1;
    uint _793 = uint(int(uint(_791) >> uint(2)));
    int _795 = _791 & 3;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[int(_793)][_795];
    float _799 = _776 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _801 = _732 * _750;
    float _803 = _696 * _750;
    float _805 = _712 * _750;
    float _807 = _676 * _750;
    float _809 = _801 * _746;
    float _811 = trunc(_762);
    int _813 = int(_811);
    int _815 = _764 + 104;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.vp_c15)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.vp_c15)._m0[int(_827)][_829];
    float _833 = fma(_770, _772, _766);
    float _835 = -_774;
    float _837 = fma(_770, _778, _835);
    float _839 = -_778;
    float _841 = fma(_770, _774, _839);
    float _843 = -_746;
    float _845 = _770 * _843;
    float _847 = fma(_833, _738, _809);
    float _849 = trunc(_799);
    int _851 = int(_849);
    float _853 = _803 * _746;
    float _855 = fma(_805, _738, _845);
    float _857 = fma(_841, _758, _847);
    float _859 = fma(_770, _766, _772);
    float _861 = fma(_837, _738, _853);
    float _863 = fma(_807, _758, _855);
    float _865 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _867 = _764 + 64;
    uint _869 = uint(int(uint(_867) >> uint(2)));
    uint _871 = uint(int(uint(int(_869)) >> uint(2)));
    int _873 = int(_869) & 3;
    float _875 = (*spvDescriptorSet0.vp_c15)._m0[int(_871)][_873];
    int _877 = int(_869) + 1;
    uint _879 = uint(int(uint(_877) >> uint(2)));
    int _881 = _877 & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    float _885 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _887 = fma(_859, _758, _861);
    float _889 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[26].x, _865);
    int _891 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _893 = _813 + _891;
    int _895 = _893 + 1;
    float _897 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[24].x, _885);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _889);
    int _901 = _764 + 48;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    uint _905 = uint(int(uint(int(_903)) >> uint(2)));
    int _907 = int(_903) & 3;
    float _909 = (*spvDescriptorSet0.vp_c15)._m0[int(_905)][_907];
    int _911 = int(_903) + 1;
    uint _913 = uint(int(uint(_911) >> uint(2)));
    int _915 = _911 & 3;
    float _917 = (*spvDescriptorSet0.vp_c15)._m0[int(_913)][_915];
    int _919 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _921 = _851 + _919;
    int _923 = _921 + 1;
    float _925 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _897);
    float _927 = _899 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _929 = _895 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _931 = _895 | _923;
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _935 = _764 + 56;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[int(_947)][_949];
    float _953 = _218 + _927;
    bool _955 = _931 < 0;
    bool _957 = _955 || _929;
    float _959 = _216 + _933;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _963 = _953 + _961;
    bool _965 = _923 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _967 = _965 || _957;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _971 = _959 + _969;
    int _973 = _764 + 72;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    uint _977 = uint(int(uint(int(_975)) >> uint(2)));
    int _979 = int(_975) & 3;
    float _981 = (*spvDescriptorSet0.vp_c15)._m0[int(_977)][_979];
    int _983 = int(_975) + 1;
    uint _985 = uint(int(uint(_983) >> uint(2)));
    int _987 = _983 & 3;
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[int(_985)][_987];
    float _991 = _963 * _963;
    float _993 = _700 * _797;
    float _995 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _997 = fma(_971, _971, _991);
    float _999 = fma(_216, _789, _993);
    float _1001 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[25].x, _995);
    int _1003 = _764 + 80;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    uint _1007 = uint(int(uint(int(_1005)) >> uint(2)));
    int _1009 = int(_1005) & 3;
    float _1011 = (*spvDescriptorSet0.vp_c15)._m0[int(_1007)][_1009];
    int _1013 = int(_1005) + 1;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    int _1017 = _1013 & 3;
    float _1019 = (*spvDescriptorSet0.vp_c15)._m0[int(_1015)][_1017];
    float _1021 = sqrt(_997);
    float _1023 = fma(_218, _823, _999);
    uint _1025 = uint(_895);
    int _1027 = as_type<int>(_831);
    float _1029 = _857;
    float _1031 = _959;
    if (!_967)
    {
        int _1033 = _923 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1035 = _1033 + _895;
        _1025 = uint(_1035);
    }
    uint _1037 = _1025;
    float _1039 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1001);
    float _1041 = _1023 + _831;
    float _1043 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1045 = _995;
    if (!_967)
    {
        float _1047 = floor(_762);
        _1045 = _1047;
    }
    float _1049 = _1045;
    if (!_967)
    {
        uint _1051 = uint(int(uint(int(_1037)) >> uint(2)));
        _1027 = int(_1051);
    }
    int _1053 = _1027;
    float _1055 = _700 * _883;
    bool _1057 = _1021 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1059 = 1.0 / _1041;
    float _1061 = fma(_216, _875, _1055);
    int _1063 = as_type<int>(_875);
    int _1065 = _1053;
    float _1067 = _1061;
    if (!_967)
    {
        int _1069 = int(_1037) << 2;
        _1063 = _1069;
    }
    int _1071 = _1063;
    float _1073 = _700 * _917;
    int _1075 = _1071;
    if (!_967)
    {
        int _1077 = 12 & _1071;
        _1075 = _1077;
    }
    int _1079 = _1075;
    float _1081 = fma(_216, _909, _1073);
    float _1083 = _482 + _1043;
    float _1085 = as_type<float>(_1079);
    if (!_967)
    {
        int _1087 = _1053 << 4;
        int _1089 = _1087 + _1079;
        _1065 = _1089;
    }
    int _1091 = _1065;
    float _1093 = fma(_218, _943, _1081);
    if (!_1057)
    {
        _1085 = _959;
    }
    float _1095 = _1085;
    float _1097 = _1095;
    if (!_1057)
    {
        _1029 = _953;
    }
    float _1099 = _1029;
    float _1101 = _1093 + _951;
    float _1103 = fma(_218, _981, _1061);
    float _1105 = _1099;
    if (!_1057)
    {
        _1067 = _1083;
    }
    float _1107 = _1067;
    float _1109 = _1103 + _989;
    bool _1111 = !_1057;
    float _1113 = _1107;
    if (!_1111)
    {
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1119 = _1021 + _1117;
        float _1121 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = rsqrt(_997);
        float _1125 = _1119 * _1115;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = _1127 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1131 + (-1.0);
        float _1139 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = fma(_1135, _1121, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1143 = fma(_1083, _1131, _1139);
        float _1145 = _1123 * _1141;
        float _1147 = fma(_971, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1149 = fma(_963, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1143;
        _1097 = _1147;
        _1105 = _1149;
    }
    float _1151 = _1113;
    float _1153 = _1097;
    float _1155 = _1105;
    int _1157 = _764 + 88;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    uint _1161 = uint(int(uint(int(_1159)) >> uint(2)));
    int _1163 = int(_1159) & 3;
    float _1165 = (*spvDescriptorSet0.vp_c15)._m0[int(_1161)][_1163];
    int _1167 = int(_1159) + 1;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    int _1171 = _1167 & 3;
    float _1173 = (*spvDescriptorSet0.vp_c15)._m0[int(_1169)][_1171];
    float _1175 = _1101 * _1059;
    float _1177 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1179 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1181 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1183 = _1109 * _1059;
    float _1185 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1177);
    float _1187 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1179);
    float _1189 = _953;
    if (!_967)
    {
        int _1191 = _1091 + 400;
        uint _1193 = uint(int(uint(_1191) >> uint(2)));
        uint _1195 = uint(int(uint(int(_1193)) >> uint(2)));
        int _1197 = int(_1193) & 3;
        float _1199 = (*spvDescriptorSet0.vp_c15)._m0[int(_1195)][_1197];
        _1189 = _1199;
    }
    float _1201 = _1189;
    float _1203 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1181);
    float _1205 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1185);
    float _1207 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1187);
    float _1209 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1211 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1203);
    float _1213 = _1205 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1215 = _1175 >= 0.0;
    float _1217 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1209);
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1221 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1223 = _1175 <= 1.0;
    bool _1225 = _1223 && _1215;
    float _1227 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1229 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1217);
    float _1231 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1221);
    bool _1233 = _1183 >= 0.0;
    bool _1235 = _1233 && _1225;
    float _1237 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1239 = _1229 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1231);
    bool _1243 = _1183 <= 1.0;
    bool _1245 = _1243 && _1235;
    float _1247 = _971;
    if (!_967)
    {
        float _1249 = floor(_799);
        _1247 = _1249;
    }
    float _1251 = _1247;
    float _1253 = _1227 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1255 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1241);
    float _1257 = _700 * _1019;
    float _1259 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1261 = -_1253;
    float _1263 = fma(_1261, _1237, 1.0);
    float _1265 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1267 = fma(_216, _1011, _1257);
    float _1269 = 1.0 / _1255;
    float _1271 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1259);
    float _1273 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1265);
    float _1275 = _1253;
    float _1277 = _1265;
    float _1279 = _1255;
    if (_1245)
    {
        float _1281 = float(_756);
        _1275 = _1281;
    }
    float _1283 = _1275;
    float _1285 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1271);
    float _1287 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1273);
    if (!_967)
    {
        float _1289 = -_1251;
        float _1291 = _799 + _1289;
        _1031 = _1291;
    }
    float _1293 = _1031;
    float _1295 = log2(_1263);
    float _1297 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1287);
    float _1299 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1285);
    float _1301 = fma(_218, _1165, _1267);
    float _1303 = _1301 + _1173;
    float _1305 = _1297 * _1269;
    float _1307 = _1259;
    float _1309 = _1173;
    float _1311 = _1297;
    if (_1245)
    {
        float _1313 = rint(_1283);
        float _1315 = precise::max(_1313, 0.0);
        uint _1317 = uint(_1315);
        uint _1319 = clamp(_1317, 0u, 65535u);
        _1307 = as_type<float>(_1319);
    }
    float _1321 = _1307;
    float _1323 = _1299 * _1269;
    float _1325 = _1303 * _1059;
    if (!_967)
    {
        float _1327 = -_1049;
        float _1329 = _762 + _1327;
        _1309 = _1329;
    }
    float _1331 = _1309;
    float _1333 = fma(_1323, 0.5, 0.5);
    float _1335 = _1295 * 0.693147182464599609375;
    float _1337 = fma(_1305, -0.5, 0.5);
    float _1339 = _1305;
    if (!_967)
    {
        float _1341 = rint(_1201);
        float _1343 = precise::max(_1341, 0.0);
        uint _1345 = uint(_1343);
        uint _1347 = clamp(_1345, 0u, 65535u);
        _1339 = as_type<float>(_1347);
    }
    float _1349 = _1339;
    float _1351 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1353 = _762;
    float _1355 = _1351;
    if (_1245)
    {
        float3 _4449 = float3(_1175, _1183, float(as_type<int>(_1321)));
        float3 _4453 = select(_4449, float3(0.0), isnan(_4449));
        float _1357 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4453.xy, uint(rint(_4453.z)), _1325, level(0.0));
        _1353 = _1357;
    }
    float _1359 = _1353;
    float3 _4463 = float3(_1333, _1337, _1351);
    float _1361 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4463, float3(0.0), isnan(_4463)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4463, float3(0.0), isnan(_4463)), level(0.0)).x;
    float3 _4472 = float3(_1333, _1337, _1351);
    float4 _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4472, float3(0.0), isnan(_4472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4472, float3(0.0), isnan(_4472)), level(0.0)).xyzw;
    float _1366 = _1364.x;
    float _1368 = _1364.y;
    float _1370 = _1364.z;
    float _1372 = _1364.w;
    float _1374 = _1293;
    if (!_967)
    {
        float3 _4495 = float3(_1331, _1293, float(as_type<int>(_1349)));
        float3 _4497 = select(_4495, float3(0.0), isnan(_4495));
        float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4497.xy, uint(rint(_4497.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4497.xy, uint(rint(_4497.z)), level(0.0)).x;
        _1374 = _1376;
    }
    float _1378 = _1374;
    if (_967)
    {
        _1277 = 1.0;
    }
    float _1380 = _1277;
    float _1382 = _1380;
    if (!_967)
    {
        int _1384 = int(_1037) << 4;
        int _1386 = _1384 + 2048;
        uint _1388 = uint(int(uint(_1386) >> uint(2)));
        uint _1390 = uint(int(uint(int(_1388)) >> uint(2)));
        int _1392 = int(_1388) & 3;
        float _1394 = (*spvDescriptorSet0.vp_c15)._m0[int(_1390)][_1392];
        int _1396 = int(_1388) + 1;
        uint _1398 = uint(int(uint(_1396) >> uint(2)));
        int _1400 = _1396 & 3;
        float _1402 = (*spvDescriptorSet0.vp_c15)._m0[int(_1398)][_1400];
        int _1404 = _1386 + 8;
        uint _1406 = uint(int(uint(_1404) >> uint(2)));
        uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
        int _1410 = int(_1406) & 3;
        float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
        int _1414 = int(_1406) + 1;
        uint _1416 = uint(int(uint(_1414) >> uint(2)));
        int _1418 = _1414 & 3;
        float _1420 = (*spvDescriptorSet0.vp_c15)._m0[int(_1416)][_1418];
        float _1422 = _700 * _1402;
        float _1424 = fma(_216, _1394, _1422);
        float _1426 = fma(_218, _1412, _1424);
        float _1428 = _1426 + _1420;
        float _1430 = precise::clamp(_1428, 0.0, 1.0);
        float _1432 = -_1430;
        float _1434 = _1432 + _1378;
        float _1436 = fma(_1434, 500.0, 1.5);
        float _1438 = exp2(_1436);
        float _1440 = 0.0 + _1438;
        float _1442 = precise::clamp(_1440, 0.0, 1.0);
        _1382 = _1442;
    }
    float _1444 = _1382;
    float _1446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1448 = _1151 + _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1452 = _1153 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1456 = _1155 + _1454;
    float _1458 = _1448 * _1448;
    float _1460 = fma(_1452, _1452, _1458);
    float _1462 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1464 = fma(_1456, _1456, _1460);
    float _1466 = rsqrt(_1464);
    float _1468 = sqrt(_1464);
    float _1470 = _1452 * _1466;
    float _1472 = _1456 * _1466;
    float _1474 = _1448 * _1466;
    float _1476 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1478 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1480 = _1476 * _1476;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 + _1482;
    float _1486 = sqrt(_1484);
    bool _1488 = _1486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = _1486 + _1490;
    float _1494 = _1337;
    float _1496 = _1492;
    float _1498 = _1462;
    float _1500 = _1466;
    float _1502 = _1476;
    float _1504 = _1480;
    float _1506 = _1482;
    if (_1488)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1508;
    }
    float _1510 = _1494;
    if (_1488)
    {
        float _1512 = _1492 * _1510;
        _1496 = _1512;
    }
    float _1514 = _1496;
    float _1516 = precise::max(0.0, _1462);
    float _1518 = _1516;
    if (_1488)
    {
        float _1520 = rsqrt(_1484);
        _1498 = _1520;
    }
    float _1522 = _1498;
    float _1524 = _1522;
    if (_1488)
    {
        float _1526 = _1514 * 0.15915493667125701904296875;
        _1355 = _1526;
    }
    float _1528 = _1355;
    float _1530 = -_1474;
    float _1532 = -_1516;
    float _1534 = fma(_1530, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1532);
    if (_1488)
    {
        float _1536 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1536;
    }
    float _1538 = _1500;
    float _1540 = _1378;
    float _1542 = _1538;
    if (_1488)
    {
        float _1544 = _1528 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        _1540 = _1546;
    }
    float _1548 = _1540;
    float _1550 = _1514;
    if (_1488)
    {
        float _1552 = _1528 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        _1550 = _1554;
    }
    float _1556 = _1550;
    float _1558 = _1548;
    if (_1488)
    {
        float _1560 = fma(_1548, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1558 = _1560;
    }
    float _1562 = _1558;
    float _1564 = _1562;
    if (_1488)
    {
        float _1566 = _1522 * _1562;
        _1564 = _1566;
    }
    float _1568 = _1564;
    if (!_1488)
    {
        _1524 = _1534;
    }
    float _1570 = _1524;
    float _1572 = _1570;
    if (_1488)
    {
        float _1574 = _1556 + (-1.0);
        _1542 = _1574;
    }
    float _1576 = _1542;
    float _1578 = _1576;
    if (_1488)
    {
        float _1580 = _1476 * _1568;
        _1502 = _1580;
    }
    float _1582 = _1502;
    if (_1488)
    {
        float _1584 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1584;
    }
    float _1586 = _1518;
    if (!_1488)
    {
        _1578 = _1478;
    }
    float _1588 = _1578;
    float _1590 = _1588;
    if (_1488)
    {
        float _1592 = _1478 * _1568;
        _1590 = _1592;
    }
    float _1594 = _1590;
    if (_1488)
    {
        float _1596 = _1582 * _1582;
        _1504 = _1596;
    }
    float _1598 = _1504;
    if (_1488)
    {
        float _1600 = fma(_1534, _1556, _1586);
        _1572 = _1600;
    }
    float _1602 = _1572;
    if (_1488)
    {
        float _1604 = _1594 * _1594;
        _1506 = _1604;
    }
    float _1606 = _1506;
    float _1608 = fma(_1602, _1602, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1612 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1610);
    float _1614 = precise::clamp(_1612, 0.0, 1.0);
    float _1616 = _1608 + _1606;
    float _1618 = -_1614;
    float _1620 = _1618 + 1.0;
    float _1622 = rsqrt(_1616);
    float _1624 = abs(_1620);
    float _1626 = log2(_1624);
    float _1628 = _1622 * _1582;
    float _1630 = _1622 * _1602;
    float _1632 = _1622 * _1594;
    float _1634 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1636 = _1630 + 1.0;
    float _1638 = -_1634;
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1638);
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1644 = -_1632;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1640);
    float _1648 = exp2(_1642);
    float _1650 = fma(_1646, -0.5, 0.5);
    float _1652 = fma(_1646, 0.5, 0.5);
    float _1654 = fma(_1652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1656 = sqrt(_1650);
    float _1658 = fma(_1652, _1654, -0.212114393711090087890625);
    float _1660 = fma(_1652, _1658, 1.570728778839111328125);
    float _1662 = -_1630;
    float _1664 = fma(_1648, _1636, _1662);
    float _1666 = _1656 * 0.636619746685028076171875;
    float _1668 = -_1660;
    float _1670 = fma(_1666, _1668, 1.0);
    float _1672 = fma(_1664, 0.5, 0.5);
    float2 _4959 = float2(_1670, _1672);
    float3 _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4959, float2(0.0), isnan(_4959)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4959, float2(0.0), isnan(_4959)), level(0.0)).xyz;
    float _1678 = _1676.x;
    float _1680 = _1676.y;
    float _1682 = _1676.z;
    float _1684 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1686 = abs(_692);
    float _1688 = log2(_1686);
    bool _1690 = _654 != 0.0;
    bool _1692 = isnan(_654);
    bool _1694 = _1690 || _1692;
    bool _1696 = isnan(0.0);
    bool _1698 = _1694 || _1696;
    float _1700 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1702 = -_236;
    float _1704 = _1702 + 1.0;
    float _1706 = _1684 * _242;
    bool _1708 = _652 == 0.0;
    bool _1710 = !_1698;
    bool _1712 = _1708 && _1710;
    float _1714 = in.m_71.x;
    float _1716 = in.m_71.y;
    float _1718 = in.m_71.z;
    float _1720 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1700);
    float _1722 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1724 = _656 == 0.0;
    bool _1726 = _1724 && _1712;
    float _1728 = trunc(_1706);
    int _1730 = int(_1728);
    float _1732 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1720);
    float _1734 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1722);
    out.m_73.x = _1153;
    out.m_73.y = _1151;
    out.m_73.z = _1155;
    float _1736 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1732);
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1740 = exp2(_1738);
    int _1742 = _1730 << 4;
    int _1744 = _1742 + 1712;
    uint _1746 = uint(int(uint(_1744) >> uint(2)));
    uint _1748 = uint(int(uint(int(_1746)) >> uint(2)));
    int _1750 = int(_1746) & 3;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[int(_1748)][_1750];
    int _1754 = int(_1746) + 1;
    uint _1756 = uint(int(uint(_1754) >> uint(2)));
    int _1758 = _1754 & 3;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[int(_1756)][_1758];
    float _1762 = _1714;
    float _1764 = _1718;
    float _1766 = _1716;
    float _1768 = _1736;
    if (!_1726)
    {
        float _1770 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1714);
        _1762 = _1770;
    }
    float _1772 = _1762;
    if (!_1726)
    {
        float _1774 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1718);
        _1764 = _1774;
    }
    float _1776 = _1764;
    if (!_1726)
    {
        float _1778 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1716);
        _1766 = _1778;
    }
    float _1780 = _1766;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1784 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1786 = isnan(_1468);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1792 = _1788 || _1790;
    int _1794 = _1744 + 8;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
    int _1800 = int(_1796) & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    float _1804 = _801 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1806 = -_770;
    float _1808 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1804);
    float _1810 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1812 = _801 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1814 = _801 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1816 = _1760 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1818 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = -_770;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1812);
    float _1824 = -_770;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1814);
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1830 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1832 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1822);
    float _1834 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1826);
    float _1836 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1840 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1842 = precise::clamp(_1840, 0.0, 1.0);
    float _1844 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1808);
    float _1846 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_75.x = _1818;
    out.m_75.y = _1828;
    out.m_75.z = _1836;
    out.m_75.w = _1782;
    float _1848 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1850 = _1832 * _1780;
    float _1852 = _1844 * _1780;
    float _1854 = _1834 * _1780;
    float _1856 = fma(_1842, -2.0, 3.0);
    float _1858 = _1842 * _1842;
    float _1860 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1862 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1846);
    float _1864 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1866 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1838);
    float _1868 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1870 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1860);
    float _1872 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1862);
    float _1874 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1864);
    float _1876 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1866);
    float _1878 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1868);
    float _1880 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1870);
    float _1882 = fma(_1872, _1772, _1850);
    float _1884 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1874);
    float _1886 = fma(_1876, _1772, _1852);
    float _1888 = fma(_1878, _1772, _1854);
    float _1890 = fma(_1880, _1776, _1882);
    float _1892 = _1858 * _1856;
    float _1894 = fma(_1884, _1776, _1886);
    float _1896 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1898 = _1736 + _1255;
    float _1900 = -_1892;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1734);
    float _1906 = _1898 * 0.5;
    float _1908 = exp2(_1896);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1892);
    bool _1912 = _692 <= 8000.0;
    bool _1914 = isnan(_692);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan(8000.0);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1924 = fma(_1904, _1776, _1888);
    float _1926 = _1922 * _1910;
    float _1928 = _1922;
    if (!_1245)
    {
        _1928 = 1.0;
    }
    float _1930 = _1928;
    out.gl_Position.x = _1299;
    out.gl_Position.y = _1297;
    out.gl_Position.z = _1736;
    out.gl_Position.w = _1255;
    float _1932 = _1930;
    if (_1245)
    {
        bool _1934 = _1359 >= _1325;
        bool _1936 = isnan(_1359);
        bool _1938 = _1934 || _1936;
        bool _1940 = isnan(_1325);
        bool _1942 = _1938 || _1940;
        float _1944 = float(_1942);
        _1932 = _1944;
    }
    float _1946 = _1932;
    float _1948 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1906;
    out.m_79.w = _1255;
    float _1950 = _1704 * _1948;
    float _1952 = precise::clamp(_1950, 0.0, 1.0);
    float _1954 = -_1908;
    float _1956 = _1954 + 1.0;
    float _1958 = _1946 * _1444;
    out.m_81.x = _1890;
    out.m_81.y = _1894;
    out.m_81.z = _1924;
    float _1960 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1962 = -_1952;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1966 = _1960 * _1361;
    float _1968 = -_1960;
    float _1970 = _1968 + 1.0;
    float _1972 = _1966;
    if (!_1792)
    {
        _1279 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1974 = _1279;
    float _1976 = -_1958;
    float _1978 = fma(_1976, _1964, 1.0);
    float _1980 = precise::clamp(_1978, 0.0, 1.0);
    float _1982 = _1372 * _1966;
    float _1984 = _1372 * _1970;
    float _1986 = _1980;
    float _1988 = _1982;
    float _1990 = _1974;
    float _1992 = _1974;
    if (!_1792)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1994 = _1768;
    float _1996 = _1980 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1998 = _1994;
    float _2000 = _1994;
    if (!_1792)
    {
        _1311 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2002 = _1311;
    float _2004 = _2002;
    float _2006 = _2002;
    if (!_1792)
    {
        _1986 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2008 = _1986;
    out.m_83.x = _1996;
    float _2010 = _1682 * _1966;
    float _2012 = fma(_1678, _1982, _1366);
    float _2014 = fma(_1680, _1982, _1368);
    float _2016 = _2008;
    float _2018 = _2008;
    if (!_1792)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2020 = _1972;
    float _2022 = fma(_1372, _2010, _1370);
    float _2024 = _2020;
    float _2026 = _2020;
    if (!_1792)
    {
        _1988 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2028 = _1988;
    out.m_85.x = _2012;
    out.m_85.y = _2014;
    out.m_85.z = _2022;
    out.m_85.w = _1984;
    bool _2030 = !_1792;
    float _2032 = _2028;
    float _2034 = _2028;
    if (!_2030)
    {
        bool _2036 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2038 = isnan(_1468);
        bool _2040 = _2036 || _2038;
        bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2044 = _2040 || _2042;
        if (!_2044)
        {
            float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2048 = _1468 + _2046;
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
            _1992 = _2088;
            _2018 = _2092;
            _2026 = _2084;
            _2006 = _2090;
            _2000 = _2086;
            _2034 = _2094;
            _2096 = true;
        }
        else
        {
            bool _2098 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2100 = isnan(_1468);
            bool _2102 = _2098 || _2100;
            bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2106 = _2102 || _2104;
            if (!_2106)
            {
                _2024 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2108 = _2024;
            _2026 = _2108;
            if (!_2106)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2110 = _1990;
            _1992 = _2110;
            if (!_2106)
            {
                _1998 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2112 = _1998;
            _2000 = _2112;
            if (!_2106)
            {
                _2004 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2114 = _2004;
            _2006 = _2114;
            if (!_2106)
            {
                _2016 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2116 = _2016;
            _2018 = _2116;
            if (!_2106)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2118 = _2032;
            bool _2120 = !_2106;
            _2034 = _2118;
            if (!_2120)
            {
                bool _2122 = _1468 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2124 = isnan(_1468);
                bool _2126 = _2122 || _2124;
                bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2130 = _2126 || _2128;
                if (!_2130)
                {
                    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2134 = _1468 + _2132;
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
                    _1992 = _2174;
                    _2018 = _2178;
                    _2026 = _2170;
                    _2006 = _2176;
                    _2000 = _2172;
                    _2034 = _2180;
                    _2096 = true;
                }
                else
                {
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2018 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2026 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2006 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2000 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2096 = false;
    float _2182 = _1992;
    float _2184 = _2018;
    float _2186 = _2026;
    float _2188 = _2006;
    float _2190 = _2000;
    float _2192 = _2034;
    float _2194 = fma(_1894, -0.5, 0.5);
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
    float _2222 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2224 = fma(_2216, 0.114477999508380889892578125, _2220);
    out.m_83.w = _2222;
    float _2226 = -_2224;
    float _2228 = _2214 + _2226;
    float _2230 = -_2224;
    float _2232 = _2212 + _2230;
    float _2234 = -_2224;
    float _2236 = _2216 + _2234;
    out.m_87.x = 0.0;
    float _2238 = fma(_2228, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2224);
    float _2240 = fma(_2232, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2224);
    float _2242 = fma(_2236, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2224);
    out.m_89.x = 0.0;
    out.m_91.x = _2238;
    out.m_91.y = _2240;
    out.m_91.z = _2242;
    if (!_2210)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2244 = -_1151;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2248 = -_1153;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2252 = -_1155;
    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2256 = _2246 * _2246;
    float _2258 = fma(_2250, _2250, _2256);
    float _2260 = fma(_2254, _2254, _2258);
    float _2262 = rsqrt(_2260);
    float _2264 = _2246 * _2262;
    float _2266 = _2250 * _2262;
    float _2268 = _2254 * _2262;
    float _2270 = sqrt(_2260);
    float _2272 = -_1474;
    float _2274 = _2272 + _2264;
    float _2276 = -_1470;
    float _2278 = _2276 + _2266;
    float _2280 = -_1472;
    float _2282 = _2280 + _2268;
    float _2284 = _2274 * _2274;
    float _2286 = fma(_2278, _2278, _2284);
    float _2288 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = fma(_2282, _2282, _2286);
    float _2294 = _2290 * _2290;
    float _2296 = -_2270;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2300 = _2294 + (-1.0);
    float _2302 = rsqrt(_2292);
    float _2304 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = abs(_2306);
    float _2310 = log2(_2308);
    float _2312 = _2274 * _2302;
    float _2314 = _2278 * _2302;
    float _2316 = _2282 * _2302;
    float _2318 = _1894 * _2312;
    float _2320 = _1894 * _2264;
    float _2322 = fma(_1890, _2314, _2318);
    float _2324 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2326 = fma(_1890, _2266, _2320);
    float _2328 = fma(_1924, _2316, _2322);
    float _2330 = precise::clamp(_2328, 0.0, 1.0);
    float _2332 = fma(_1924, _2268, _2326);
    float _2334 = precise::clamp(_2332, 0.0, 1.0);
    float _2336 = exp2(_2324);
    float _2338 = _2330 * _2330;
    float _2340 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2342 = fma(_2338, _2300, 1.0);
    float _2344 = -_2264;
    float _2346 = -_2340;
    float _2348 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2346);
    float _2350 = _2342 * _2342;
    float _2352 = -_2268;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2348);
    float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2358 = _2354 + _2356;
    float _2360 = 1.0 / _2350;
    float _2362 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    float _2366 = _2336 * _2364;
    float _2368 = _2334 * _2366;
    float _2370 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2372 = _2294 * _2360;
    float _2374 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2376 = _2368 * _2372;
    float _2378 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2380 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2382 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2384 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2370;
    out.m_87.y = _2378;
    out.m_87.z = _2374;
    out.m_89.x = _2380;
    out.m_89.y = _2382;
    out.m_89.z = _2384;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

