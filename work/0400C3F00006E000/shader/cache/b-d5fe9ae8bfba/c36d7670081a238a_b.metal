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
    bool _2088 = false;
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
        float _2433 = as_type<float>(_126);
        out.gl_Position.z = _2433;
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
        float _2502 = as_type<float>(_164);
        out.gl_Position.z = _2502;
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
    float2 _2629 = float2(_230, _234);
    float _236 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2629, float2(0.0), isnan(_2629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2629, float2(0.0), isnan(_2629)), level(0.0)).x;
    float _238 = in.m_63.x;
    float _240 = in.m_63.y;
    float _242 = in.m_63.z;
    float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _246 = log2(_244);
    float _248 = _200 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    float _260 = 1.0 / _252;
    float _262 = _246 * _144;
    float _264 = _242 * 2.0;
    float _266 = exp2(_262);
    float _268 = _240 * 2.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _272 = 1.0 + _270;
    float _274 = _238 * 2.0;
    float _276 = _240 + _242;
    float _278 = _242 + _238;
    float _280 = _242 + (-0.5);
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _284 = _282 != 0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _292 = _290 != 0;
    float _294 = 1.0 / _256;
    float _296 = _276 + (-1.0);
    float _298 = _240 + _238;
    bool _300 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _302 = isnan(1.0);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _308 = _304 || _306;
    float _310 = _238 + (-0.5);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = _196 + _312;
    bool _316 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _324 = _320 || _322;
    float _326 = _278 + (-1.0);
    float _328 = floor(_264);
    float _330 = _240 + (-0.5);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _196 + _332;
    float _336 = -_266;
    float _338 = _336 + 1.0;
    float _340 = _314 * _260;
    float _342 = _298 + (-1.0);
    float _344 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].z, _258);
    float _346 = floor(_268);
    float _348 = _334 * _294;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _350;
    float _354 = _324 ? _338 : 0.0;
    float _356 = _344 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _358 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _360 = 1.0 / _272;
    bool _362 = _328 >= 0.0;
    bool _364 = isnan(_328);
    bool _366 = _362 || _364;
    bool _368 = isnan(0.0);
    bool _370 = _366 || _368;
    float _372 = fma(_352, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _374 = _328 > 0.0;
    int _376 = _370 ? 0 : 1;
    bool _378 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _380 = isnan(_196);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = floor(_274);
    bool _392 = _346 > 0.0;
    bool _394 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_196);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _408 = 2;
    float _410 = _218;
    if (_308)
    {
        float _412 = _354 * _360;
        _148 = _412;
    }
    float _414 = _148;
    bool _416 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_196);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _428;
    float _432 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _434 = !_284;
    int _436 = _434 ? 0 : 1;
    float _438 = -_404;
    float _440 = _438 + 1.0;
    bool _442 = _346 >= 0.0;
    bool _444 = isnan(_346);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = fma(_430, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = _426 * _440;
    bool _456 = _390 > 0.0;
    float _458 = -_426;
    float _460 = _458 + 1.0;
    bool _462 = _390 >= 0.0;
    bool _464 = isnan(_390);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = -_388;
    float _474 = _472 + 1.0;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _476;
    float _480 = _372 * _454;
    int _482 = _470 ? 0 : 1;
    float _484 = _404 * _474;
    float _486 = fma(_478, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _500 = _486 * _454;
    float _502 = _452 * _454;
    float _504 = fma(_494, _348, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _506 = _356 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _508 = fma(_490, _348, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_498, _348, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _512 = ~_376;
    int _514 = _512 + 1;
    int _516 = _514 + 1;
    float _518 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].x, _480);
    float _520 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    float _522 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    int _524 = abs(_436);
    float _526 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[11].x, _506);
    int _528 = _516;
    if (!_374)
    {
        int _530 = ~_376;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = in.m_65.x;
    float _538 = in.m_65.y;
    float _540 = in.m_65.z;
    float _542 = _356 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _544 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[11].z, _526);
    float _546 = float(_524);
    float _548 = fma(_508, _484, _518);
    float _550 = float(_534);
    float _552 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[10].x, _542);
    float _554 = _544 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _556 = ~_482;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    float _562 = fma(_510, _484, _522);
    float _564 = _546 * _550;
    float _566 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[10].z, _552);
    float _568 = 1.0 / _554;
    int _570 = _560;
    if (!_456)
    {
        int _572 = ~_482;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = _564 * (-2.0);
    float _580 = _566 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _582 = !_288;
    int _584 = _582 ? 0 : 1;
    float _586 = fma(_504, _484, _520);
    int _588 = _450 ? 0 : 1;
    float _590 = fma(_358, _578, _358);
    bool _592 = !_292;
    int _594 = _592 ? 0 : 1;
    float _596 = _580 + _554;
    int _598 = abs(_584);
    float _600 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].y, _586);
    int _602 = ~_588;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = fma(_578, _536, _536);
    int _610 = _606;
    if (!_392)
    {
        int _612 = ~_588;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    int _618 = abs(_594);
    float _620 = _596 * _568;
    float _622 = _620 * 0.5;
    float _624 = float(_598);
    float _626 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    float _628 = float(_576);
    float _630 = in.m_67.x;
    float _632 = in.m_67.y;
    float _634 = in.m_67.z;
    float _636 = _624 * _628;
    float _638 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _640 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[30].w, _638);
    float _642 = fma(_590, _414, _626);
    float _644 = float(_618);
    float _646 = _636 * (-2.0);
    float _648 = float(_616);
    float _650 = in.m_69.x;
    float _652 = in.m_69.y;
    float _654 = in.m_69.z;
    float _656 = 1.0 / _640;
    float _658 = fma(_646, _538, _538);
    float _660 = fma(_406, _646, _406);
    float _662 = _644 * _648;
    float _664 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].x, _548);
    float _666 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[196].y, _658);
    float _668 = _642 * 0.15915493667125701904296875;
    float _670 = _662 * (-2.0);
    float _672 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].z, _562);
    float _674 = fma(_660, _414, _666);
    float _676 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _678 = fma(_670, _540, _540);
    float _680 = fma(_432, _670, _432);
    float _682 = _674 * 0.15915493667125701904296875;
    float _684 = _664 * _630;
    float _686 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[196].z, _678);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _690 = _656 * _688;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _694 = fma(_680, _414, _686);
    float _696 = _600 * _632;
    float _698 = _668 * 6.283185482025146484375;
    float _700 = sin(_698);
    bool _702 = _690 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _650);
    float _706 = _694 * 0.15915493667125701904296875;
    bool _708 = _690 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _710 = _672 * _634;
    float _712 = _356 + _676;
    float _714 = _692 * _704;
    float _716 = _668 * 6.283185482025146484375;
    float _718 = cos(_716);
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _652);
    float _722 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _724 = _712 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _726 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _728 = _722 * _720;
    float _730 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[126].x, _724);
    float _732 = _682 * 6.283185482025146484375;
    float _734 = sin(_732);
    bool _736 = !_702;
    int _738 = _736 ? 0 : 1;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _654);
    float _742 = _712;
    if (!_702)
    {
        _408 = 1;
    }
    int _744 = _408;
    float _746 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[126].z, _730);
    int _748 = _744;
    if (!_708)
    {
        _748 = _738;
    }
    int _750 = _748;
    float _752 = _726 * _740;
    bool _754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _756 = isnan(0.5);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _762 = _758 || _760;
    float _764 = _682 * 6.283185482025146484375;
    float _766 = cos(_764);
    float _768 = _746 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _770 = _750 << 6;
    int _772 = _770 + 96;
    uint _775 = uint(int(uint(_772) >> uint(2)));
    uint _777 = uint(int(uint(int(_775)) >> uint(2)));
    int _779 = int(_775) & 3;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[int(_777)][_779];
    int _783 = int(_775) + 1;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    int _787 = _783 & 3;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[int(_785)][_787];
    float _791 = _706 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _712 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _797 = _718 * _734;
    float _799 = _700 * _734;
    float _801 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[127].x, _795);
    int _803 = _770 + 48;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    uint _807 = uint(int(uint(int(_805)) >> uint(2)));
    int _809 = int(_805) & 3;
    float _811 = (*spvDescriptorSet0.vp_c15)._m0[int(_807)][_809];
    int _813 = int(_805) + 1;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    int _817 = _813 & 3;
    float _819 = (*spvDescriptorSet0.vp_c15)._m0[int(_815)][_817];
    float _821 = _706 * 6.283185482025146484375;
    float _823 = sin(_821);
    float _825 = _700 * _766;
    float _827 = _718 * _766;
    float _829 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[127].z, _801);
    float _831 = _829 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _833 = _718 * _793;
    float _835 = trunc(_768);
    int _837 = int(_835);
    float _839 = _700 * _793;
    float _841 = _766 * _793;
    float _843 = _734 * _793;
    float _845 = _839 * _728;
    int _847 = _770 + 64;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    uint _851 = uint(int(uint(int(_849)) >> uint(2)));
    int _853 = int(_849) & 3;
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[int(_851)][_853];
    int _857 = int(_849) + 1;
    uint _859 = uint(int(uint(_857) >> uint(2)));
    int _861 = _857 & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    float _865 = -_797;
    float _867 = fma(_823, _825, _865);
    float _869 = -_825;
    float _871 = fma(_823, _797, _869);
    float _873 = _833 * _728;
    float _875 = fma(_823, _827, _799);
    float _877 = trunc(_831);
    int _879 = int(_877);
    float _881 = -_728;
    float _883 = _823 * _881;
    float _885 = fma(_823, _799, _827);
    float _887 = fma(_875, _714, _873);
    float _889 = fma(_867, _714, _845);
    int _891 = _770 + 104;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    uint _895 = uint(int(uint(int(_893)) >> uint(2)));
    int _897 = int(_893) & 3;
    float _899 = (*spvDescriptorSet0.vp_c15)._m0[int(_895)][_897];
    int _901 = int(_893) + 1;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    int _905 = _901 & 3;
    float _907 = (*spvDescriptorSet0.vp_c15)._m0[int(_903)][_905];
    float _909 = fma(_841, _714, _883);
    float _911 = fma(_871, _752, _887);
    float _913 = fma(_885, _752, _889);
    int _915 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _917 = _837 + _915;
    int _919 = _917 + 1;
    float _921 = fma(_843, _752, _909);
    float _923 = _911 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _925 = _911 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _927 = _770 + 56;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c15)._m0[int(_931)][_933];
    int _937 = int(_929) + 1;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    int _941 = _937 & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    bool _945 = _919 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _947 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[10].x, _923);
    int _949 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _951 = _879 + _949;
    int _953 = _951 + 1;
    float _955 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[8].x, _925);
    float _957 = _712 * _789;
    float _959 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[10].z, _947);
    int _961 = _919 | _953;
    int _963 = _770 + 72;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    float _981 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[8].z, _955);
    float _983 = _218 + _959;
    bool _985 = _961 < 0;
    bool _987 = _985 || _945;
    float _989 = fma(_216, _781, _957);
    float _991 = _216 + _981;
    float _993 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _995 = _983 + _993;
    bool _997 = _953 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _999 = _997 || _987;
    int _1001 = _770 + 80;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    uint _1005 = uint(int(uint(int(_1003)) >> uint(2)));
    int _1007 = int(_1003) & 3;
    float _1009 = (*spvDescriptorSet0.vp_c15)._m0[int(_1005)][_1007];
    int _1011 = int(_1003) + 1;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    int _1015 = _1011 & 3;
    float _1017 = (*spvDescriptorSet0.vp_c15)._m0[int(_1013)][_1015];
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1021 = _991 + _1019;
    float _1023 = _995 * _995;
    float _1025 = _911 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1027 = _712 * _819;
    float _1029 = fma(_1021, _1021, _1023);
    float _1031 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1025);
    float _1033 = fma(_216, _811, _1027);
    float _1035 = sqrt(_1029);
    float _1037 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1031);
    uint _1039 = as_type<uint>(_911);
    int _1041 = as_type<int>(_989);
    int _1043 = as_type<int>(_1031);
    float _1045 = _983;
    float _1047 = _1021;
    if (!_999)
    {
        int _1049 = _953 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1051 = _1049 + _919;
        _1039 = uint(_1051);
    }
    uint _1053 = _1039;
    float _1055 = _712 * _863;
    float _1057 = _1027;
    int _1059 = as_type<int>(_855);
    if (!_999)
    {
        float _1061 = floor(_768);
        _1057 = _1061;
    }
    float _1063 = _1057;
    float _1065 = fma(_216, _855, _1055);
    float _1067 = _1065;
    if (!_999)
    {
        uint _1069 = uint(int(uint(int(_1053)) >> uint(2)));
        _1059 = int(_1069);
    }
    int _1071 = _1059;
    float _1073 = fma(_218, _899, _989);
    float _1075 = as_type<float>(_1071);
    if (!_999)
    {
        int _1077 = int(_1053) << 2;
        _1041 = _1077;
    }
    int _1079 = _1041;
    bool _1081 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1083 = _1073 + _907;
    if (!_999)
    {
        int _1085 = 12 & _1079;
        _1043 = _1085;
    }
    int _1087 = _1043;
    float _1089 = fma(_218, _935, _1033);
    int _1091 = as_type<int>(_935);
    float _1093 = _1089;
    if (!_999)
    {
        int _1095 = _1071 << 4;
        int _1097 = _1095 + _1087;
        _1091 = _1097;
    }
    int _1099 = _1091;
    float _1101 = 1.0 / _1083;
    float _1103 = _356 + _1037;
    float _1105 = fma(_218, _971, _1065);
    float _1107 = _1089 + _943;
    if (!_1081)
    {
        _1075 = _991;
    }
    float _1109 = _1075;
    float _1111 = _1105 + _979;
    float _1113 = _1109;
    if (!_1081)
    {
        _1067 = _1103;
    }
    float _1115 = _1067;
    bool _1117 = !_1081;
    float _1119 = _1115;
    if (!_1117)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1125 = _1035 + _1123;
        float _1127 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = rsqrt(_1029);
        float _1131 = _1125 * _1121;
        float _1133 = _1131 * 0.15915493667125701904296875;
        float _1135 = _1133 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1133 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1137 + (-1.0);
        float _1145 = fma(_1141, _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1147 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1129 * _1145;
        float _1151 = fma(_1103, _1137, _1147);
        float _1153 = fma(_1021, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1155 = fma(_995, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1045 = _1155;
        _1113 = _1153;
        _1119 = _1151;
    }
    float _1157 = _1045;
    float _1159 = _1113;
    float _1161 = _1119;
    float _1163 = _1161;
    float _1165 = _1159;
    if (_762)
    {
        _1047 = _1157;
    }
    float _1167 = _1047;
    float _1169 = _1167;
    if (!_762)
    {
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1173 = _356 + _1171;
        float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1177 = _216 + _1175;
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1181 = -_216;
        float _1183 = _1181 + _1159;
        float _1185 = _1173 * _1173;
        float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1189 = _218 + _1187;
        float _1191 = fma(_1177, _1177, _1185);
        float _1193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1195 = fma(_1189, _1189, _1191);
        float _1197 = sqrt(_1195);
        float _1199 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1201 = -_356;
        float _1203 = _1201 + _1161;
        float _1205 = precise::min(_1197, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1207 = _1205 * _1193;
        float _1209 = _1199 * _1207;
        float _1211 = -_218;
        float _1213 = _1211 + _1157;
        float _1215 = fma(_1203, _1209, _356);
        float _1217 = fma(_1183, _1209, _216);
        float _1219 = fma(_1213, _1209, _218);
        _1163 = _1215;
        _1165 = _1217;
        _1169 = _1219;
        _1093 = _1213;
    }
    float _1221 = _1163;
    float _1223 = _1165;
    float _1225 = _1169;
    float _1227 = _1093;
    int _1229 = _770 + 88;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    uint _1233 = uint(int(uint(int(_1231)) >> uint(2)));
    int _1235 = int(_1231) & 3;
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[int(_1233)][_1235];
    int _1239 = int(_1231) + 1;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    int _1243 = _1239 & 3;
    float _1245 = (*spvDescriptorSet0.vp_c15)._m0[int(_1241)][_1243];
    float _1247 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1249 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1251 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1253 = _1107 * _1101;
    float _1255 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1247);
    float _1257 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1249);
    float _1259 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1251);
    float _1261 = _991;
    if (!_999)
    {
        int _1263 = _1099 + 400;
        uint _1265 = uint(int(uint(_1263) >> uint(2)));
        uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
        int _1269 = int(_1265) & 3;
        float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
        _1261 = _1271;
    }
    float _1273 = _1261;
    float _1275 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1255);
    bool _1277 = _1253 >= 0.0;
    float _1279 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1257);
    float _1281 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1283 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1259);
    float _1285 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = _1111 * _1101;
    bool _1289 = _1253 <= 1.0;
    bool _1291 = _1289 && _1277;
    float _1293 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1281);
    float _1295 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1299 = _1287 >= 0.0;
    bool _1301 = _1299 && _1291;
    float _1303 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1293);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1297);
    bool _1309 = _1287 <= 1.0;
    bool _1311 = _1309 && _1301;
    float _1313 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1317 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1321 = _712 * _1017;
    float _1323 = _1227;
    float _1325 = _1313;
    if (!_999)
    {
        float _1327 = floor(_831);
        _1323 = _1327;
    }
    float _1329 = _1323;
    float _1331 = -_1315;
    float _1333 = fma(_1331, _1313, 1.0);
    float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1337 = fma(_216, _1009, _1321);
    float _1339 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1343 = _1333;
    if (_1311)
    {
        float _1345 = float(_750);
        _1325 = _1345;
    }
    float _1347 = _1325;
    float _1349 = log2(_1333);
    float _1351 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1353 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1341);
    float _1355 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1357 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1353);
    float _1359 = 1.0 / _1335;
    float _1361 = _1347;
    if (!_999)
    {
        float _1363 = -_1329;
        float _1365 = _831 + _1363;
        _1343 = _1365;
    }
    float _1367 = _1343;
    float _1369 = fma(_218, _1237, _1337);
    float _1371 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1355);
    float _1373 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1357);
    float _1375 = _1369 + _1245;
    float _1377 = _1245;
    if (!_999)
    {
        float _1379 = -_1063;
        float _1381 = _768 + _1379;
        _1377 = _1381;
    }
    float _1383 = _1377;
    float _1385 = _1339;
    if (_1311)
    {
        float _1387 = rint(_1347);
        float _1389 = precise::max(_1387, 0.0);
        uint _1391 = uint(_1389);
        uint _1393 = clamp(_1391, 0u, 65535u);
        _1385 = as_type<float>(_1393);
    }
    float _1395 = _1385;
    float _1397 = _1349 * 0.693147182464599609375;
    float _1399 = _1375 * _1101;
    float _1401 = _1375;
    if (!_999)
    {
        float _1403 = rint(_1273);
        float _1405 = precise::max(_1403, 0.0);
        uint _1407 = uint(_1405);
        uint _1409 = clamp(_1407, 0u, 65535u);
        _1401 = as_type<float>(_1409);
    }
    float _1411 = _1401;
    float _1413 = _1371 * _1359;
    float _1415 = _1373 * _1359;
    float _1417 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1419 = fma(_1413, 0.5, 0.5);
    float _1421 = fma(_1415, -0.5, 0.5);
    float _1423 = _1321;
    if (_1311)
    {
        float3 _4539 = float3(_1253, _1287, float(as_type<int>(_1395)));
        float3 _4543 = select(_4539, float3(0.0), isnan(_4539));
        float _1425 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4543.xy, uint(rint(_4543.z)), _1399, level(0.0));
        _1423 = _1425;
    }
    float _1427 = _1423;
    float3 _4553 = float3(_1419, _1421, _1417);
    float _1429 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4553, float3(0.0), isnan(_4553)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4553, float3(0.0), isnan(_4553)), level(0.0)).x;
    float3 _4562 = float3(_1419, _1421, _1417);
    float4 _1432 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4562, float3(0.0), isnan(_4562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4562, float3(0.0), isnan(_4562)), level(0.0)).xyzw;
    float _1434 = _1432.x;
    float _1436 = _1432.y;
    float _1438 = _1432.z;
    float _1440 = _1432.w;
    float _1442 = _1397;
    if (!_999)
    {
        float3 _4585 = float3(_1383, _1367, float(as_type<int>(_1411)));
        float3 _4587 = select(_4585, float3(0.0), isnan(_4585));
        float _1444 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4587.xy, uint(rint(_4587.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4587.xy, uint(rint(_4587.z)), level(0.0)).x;
        _1442 = _1444;
    }
    float _1446 = _1442;
    if (_999)
    {
        _1361 = 1.0;
    }
    float _1448 = _1361;
    float _1450 = _1448;
    if (!_999)
    {
        int _1452 = int(_1053) << 4;
        int _1454 = _1452 + 2048;
        uint _1456 = uint(int(uint(_1454) >> uint(2)));
        uint _1458 = uint(int(uint(int(_1456)) >> uint(2)));
        int _1460 = int(_1456) & 3;
        float _1462 = (*spvDescriptorSet0.vp_c15)._m0[int(_1458)][_1460];
        int _1464 = int(_1456) + 1;
        uint _1466 = uint(int(uint(_1464) >> uint(2)));
        int _1468 = _1464 & 3;
        float _1470 = (*spvDescriptorSet0.vp_c15)._m0[int(_1466)][_1468];
        int _1472 = _1454 + 8;
        uint _1474 = uint(int(uint(_1472) >> uint(2)));
        uint _1476 = uint(int(uint(int(_1474)) >> uint(2)));
        int _1478 = int(_1474) & 3;
        float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
        int _1482 = int(_1474) + 1;
        uint _1484 = uint(int(uint(_1482) >> uint(2)));
        int _1486 = _1482 & 3;
        float _1488 = (*spvDescriptorSet0.vp_c15)._m0[int(_1484)][_1486];
        float _1490 = _712 * _1470;
        float _1492 = fma(_216, _1462, _1490);
        float _1494 = fma(_218, _1480, _1492);
        float _1496 = _1494 + _1488;
        float _1498 = precise::clamp(_1496, 0.0, 1.0);
        float _1500 = -_1498;
        float _1502 = _1500 + _1446;
        float _1504 = fma(_1502, 500.0, 1.5);
        float _1506 = exp2(_1504);
        float _1508 = 0.0 + _1506;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        _742 = _1490;
        _1450 = _1510;
    }
    float _1512 = _742;
    float _1514 = _1450;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1221 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1223 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1225 + _1524;
    float _1528 = _1518 * _1518;
    float _1530 = fma(_1522, _1522, _1528);
    float _1532 = fma(_1526, _1526, _1530);
    float _1534 = rsqrt(_1532);
    float _1536 = sqrt(_1532);
    float _1538 = _1522 * _1534;
    float _1540 = _1526 * _1534;
    float _1542 = _1518 * _1534;
    float _1544 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 + _1550;
    float _1554 = sqrt(_1552);
    bool _1556 = _1554 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = _1554 + _1558;
    float _1562 = _216;
    float _1564 = _1552;
    float _1566 = _1560;
    float _1568 = _1534;
    float _1570 = _1544;
    float _1572 = _1546;
    float _1574 = _1548;
    float _1576 = _1550;
    if (_1556)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1562 = _1578;
    }
    float _1580 = _1562;
    if (_1556)
    {
        float _1582 = rsqrt(_1552);
        _1564 = _1582;
    }
    float _1584 = _1564;
    if (_1556)
    {
        float _1586 = _1560 * _1580;
        _1566 = _1586;
    }
    float _1588 = _1566;
    if (_1556)
    {
        float _1590 = _1588 * 0.15915493667125701904296875;
        _410 = _1590;
    }
    float _1592 = _410;
    float _1594 = _1580;
    if (_1556)
    {
        float _1596 = _1592 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1594 = _1598;
    }
    float _1600 = _1594;
    float _1602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1604 = precise::max(0.0, _1602);
    float _1606 = _1512;
    float _1608 = _1604;
    if (_1556)
    {
        float _1610 = _1592 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1542;
    float _1618 = -_1604;
    float _1620 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1618);
    if (_1556)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1622;
    }
    float _1624 = _1568;
    float _1626 = _1600;
    float _1628 = _1624;
    if (_1556)
    {
        float _1630 = fma(_1600, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    if (!_1556)
    {
        _1628 = _1620;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    if (_1556)
    {
        float _1640 = _1614 + (-1.0);
        _1608 = _1640;
    }
    float _1642 = _1608;
    float _1644 = 0.0;
    if (_1556)
    {
        float _1646 = _1584 * _1632;
        _1644 = _1646;
    }
    float _1648 = _1644;
    if (_1556)
    {
        float _1650 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1650;
    }
    float _1652 = _1634;
    if (_1556)
    {
        float _1654 = _1544 * _1648;
        _1570 = _1654;
    }
    float _1656 = _1570;
    if (_1556)
    {
        float _1658 = _1546 * _1648;
        _1572 = _1658;
    }
    float _1660 = _1572;
    if (_1556)
    {
        float _1662 = fma(_1620, _1614, _1652);
        _1638 = _1662;
    }
    float _1664 = _1638;
    if (_1556)
    {
        float _1666 = _1656 * _1656;
        _1574 = _1666;
    }
    float _1668 = _1574;
    if (_1556)
    {
        float _1670 = _1660 * _1660;
        _1576 = _1670;
    }
    float _1672 = _1576;
    float _1674 = fma(_1664, _1664, _1668);
    float _1676 = _1674 + _1672;
    float _1678 = rsqrt(_1676);
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1682 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1680);
    float _1684 = precise::clamp(_1682, 0.0, 1.0);
    float _1686 = -_1684;
    float _1688 = _1686 + 1.0;
    float _1690 = abs(_1688);
    float _1692 = log2(_1690);
    float _1694 = _1678 * _1656;
    float _1696 = _1678 * _1664;
    float _1698 = _1678 * _1660;
    float _1700 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1702 = -_1700;
    float _1704 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = -_1698;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1710 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1712 = fma(_1708, -0.5, 0.5);
    float _1714 = fma(_1708, 0.5, 0.5);
    float _1716 = _1696 + 1.0;
    float _1718 = exp2(_1710);
    float _1720 = fma(_1714, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1722 = fma(_1714, _1720, -0.212114393711090087890625);
    float _1724 = sqrt(_1712);
    float _1726 = fma(_1714, _1722, 1.570728778839111328125);
    float _1728 = -_1696;
    float _1730 = fma(_1718, _1716, _1728);
    float _1732 = fma(_1730, 0.5, 0.5);
    float _1734 = _1724 * 0.636619746685028076171875;
    float _1736 = -_1726;
    float _1738 = fma(_1734, _1736, 1.0);
    float2 _5042 = float2(_1738, _1732);
    float3 _1742 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5042, float2(0.0), isnan(_5042)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5042, float2(0.0), isnan(_5042)), level(0.0)).xyz;
    float _1744 = _1742.x;
    float _1746 = _1742.y;
    float _1748 = _1742.z;
    float _1750 = abs(_690);
    float _1752 = log2(_1750);
    float _1754 = in.m_71.x;
    float _1756 = in.m_71.y;
    float _1758 = in.m_71.z;
    bool _1760 = _652 != 0.0;
    bool _1762 = isnan(_652);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    float _1770 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1772 = -_236;
    float _1774 = _1772 + 1.0;
    bool _1776 = _650 == 0.0;
    bool _1778 = !_1768;
    bool _1780 = _1776 && _1778;
    float _1782 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1770);
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1786 = _654 == 0.0;
    bool _1788 = _1786 && _1780;
    float _1790 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1782);
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1794 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1796 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1804 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1790);
    float _1806 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1808 = exp2(_1796);
    out.m_73.x = _1223;
    out.m_73.y = _1221;
    out.m_73.z = _1225;
    float _1810 = _1756;
    float _1812 = _1754;
    float _1814 = _1758;
    float _1816 = _1804;
    if (!_1788)
    {
        float _1818 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1756);
        _1810 = _1818;
    }
    float _1820 = _1810;
    if (!_1788)
    {
        float _1822 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1754);
        _1812 = _1822;
    }
    float _1824 = _1812;
    if (!_1788)
    {
        float _1826 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1758);
        _1814 = _1826;
    }
    float _1828 = _1814;
    float _1830 = _833 * _1820;
    float _1832 = -_1820;
    float _1834 = _823 * _1832;
    out.m_75.x = _1794;
    out.m_75.y = _1800;
    out.m_75.z = _1806;
    out.m_75.w = _1802;
    float _1836 = fma(_875, _1824, _1830);
    float _1838 = _839 * _1820;
    float _1840 = fma(_841, _1824, _1834);
    bool _1842 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1844 = isnan(_1536);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1850 = _1846 || _1848;
    float _1852 = fma(_871, _1828, _1836);
    float _1854 = fma(_1808, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1856 = precise::clamp(_1854, 0.0, 1.0);
    float _1858 = fma(_867, _1824, _1838);
    float _1860 = fma(_843, _1828, _1840);
    float _1862 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1864 = fma(_1856, -2.0, 3.0);
    float _1866 = _1856 * _1856;
    float _1868 = fma(_885, _1828, _1858);
    float _1870 = fma(_1860, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1862);
    float _1872 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1874 = _1866 * _1864;
    float _1876 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1878 = fma(_1868, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1870);
    bool _1880 = _690 <= 8000.0;
    bool _1882 = isnan(_690);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(8000.0);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -_1874;
    float _1894 = _1892 + 1.0;
    float _1896 = exp2(_1872);
    float _1898 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1900 = _1804 + _1335;
    float _1902 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1874);
    float _1904 = fma(_1860, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1876);
    float _1906 = fma(_1860, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1898);
    float _1908 = _1900 * 0.5;
    float _1910 = _1890 * _1902;
    float _1912 = _1900;
    if (!_1311)
    {
        _1912 = 1.0;
    }
    float _1914 = _1912;
    float _1916 = fma(_1868, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1904);
    float _1918 = _1914;
    if (_1311)
    {
        bool _1920 = _1427 >= _1399;
        bool _1922 = isnan(_1427);
        bool _1924 = _1920 || _1922;
        bool _1926 = isnan(_1399);
        bool _1928 = _1924 || _1926;
        float _1930 = float(_1928);
        _1918 = _1930;
    }
    float _1932 = _1918;
    float _1934 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1936 = fma(_1868, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1906);
    float _1938 = _1774 * _1934;
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1896;
    float _1944 = _1942 + 1.0;
    float _1946 = _1932 * _1514;
    float _1948 = -_1940;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1954 = -_1946;
    float _1956 = fma(_1954, _1950, 1.0);
    float _1958 = precise::clamp(_1956, 0.0, 1.0);
    float _1960 = _1952 * _1429;
    out.gl_Position.x = _1371;
    out.gl_Position.y = _1373;
    out.gl_Position.z = _1804;
    out.gl_Position.w = _1335;
    out.m_79.z = _1908;
    out.m_79.w = _1335;
    float _1962 = _1440 * _1960;
    float _1964 = -_1952;
    float _1966 = _1964 + 1.0;
    out.m_81.x = _1916;
    out.m_81.y = _1936;
    out.m_81.z = _1878;
    float _1968 = _1952;
    float _1970 = _1371;
    float _1972 = _1966;
    float _1974 = _1958;
    float _1976 = _1962;
    if (!_1850)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1978 = _1968;
    float _1980 = _1440 * _1966;
    float _1982 = _1958 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1984 = _1978;
    float _1986 = _1978;
    if (!_1850)
    {
        _1816 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1988 = _1816;
    float _1990 = _1988;
    float _1992 = _1988;
    if (!_1850)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1994 = _1970;
    out.m_83.x = _1982;
    float _1996 = _1994;
    float _1998 = _1994;
    if (!_1850)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2000 = _1972;
    float _2002 = _2000;
    float _2004 = _2000;
    if (!_1850)
    {
        _1974 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2006 = _1974;
    float _2008 = _1748 * _1960;
    float _2010 = fma(_1744, _1962, _1434);
    float _2012 = fma(_1746, _1962, _1436);
    float _2014 = _2006;
    float _2016 = _2006;
    if (!_1850)
    {
        _1976 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2018 = _1976;
    float _2020 = fma(_1440, _2008, _1438);
    out.m_85.x = _2010;
    out.m_85.y = _2012;
    out.m_85.z = _2020;
    out.m_85.w = _1980;
    bool _2022 = !_1850;
    float _2024 = _2018;
    float _2026 = _2018;
    if (!_2022)
    {
        bool _2028 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2030 = isnan(_1536);
        bool _2032 = _2028 || _2030;
        bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2036 = _2032 || _2034;
        if (!_2036)
        {
            float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2040 = _1536 + _2038;
            float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2044 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2042;
            float _2046 = 1.0 / _2044;
            float _2048 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2056 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2062 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2068 = _2040 * _2046;
            float _2070 = precise::clamp(_2068, 0.0, 1.0);
            float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2076 = fma(_2070, _2050, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2078 = fma(_2070, _2074, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2080 = fma(_2070, _2054, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2082 = fma(_2070, _2058, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2084 = fma(_2070, _2062, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2086 = fma(_2070, _2066, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1992 = _2076;
            _2026 = _2084;
            _1986 = _2078;
            _2004 = _2082;
            _1998 = _2080;
            _2016 = _2086;
            _2088 = true;
        }
        else
        {
            bool _2090 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2092 = isnan(_1536);
            bool _2094 = _2090 || _2092;
            bool _2096 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2098 = _2094 || _2096;
            if (!_2098)
            {
                _1984 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2100 = _1984;
            _1986 = _2100;
            if (!_2098)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2102 = _1990;
            _1992 = _2102;
            if (!_2098)
            {
                _1996 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2104 = _1996;
            _1998 = _2104;
            if (!_2098)
            {
                _2002 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2106 = _2002;
            _2004 = _2106;
            if (!_2098)
            {
                _2024 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2108 = _2024;
            _2026 = _2108;
            if (!_2098)
            {
                _2014 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2110 = _2014;
            bool _2112 = !_2098;
            _2016 = _2110;
            if (!_2112)
            {
                bool _2114 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2116 = isnan(_1536);
                bool _2118 = _2114 || _2116;
                bool _2120 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2122 = _2118 || _2120;
                if (!_2122)
                {
                    float _2124 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2126 = _1536 + _2124;
                    float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2128;
                    float _2132 = 1.0 / _2130;
                    float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2136 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2154 = _2126 * _2132;
                    float _2156 = precise::clamp(_2154, 0.0, 1.0);
                    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2162 = fma(_2156, _2136, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2164 = fma(_2156, _2160, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2166 = fma(_2156, _2140, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2168 = fma(_2156, _2144, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2170 = fma(_2156, _2148, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2172 = fma(_2156, _2152, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1992 = _2162;
                    _2026 = _2170;
                    _1986 = _2164;
                    _2004 = _2168;
                    _1998 = _2166;
                    _2016 = _2172;
                    _2088 = true;
                }
                else
                {
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2026 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1986 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2004 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1998 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2016 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2088 = false;
    float _2174 = _1992;
    float _2176 = _2026;
    float _2178 = _1986;
    float _2180 = _2004;
    float _2182 = _1998;
    float _2184 = _2016;
    float _2186 = fma(_1936, -0.5, 0.5);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = -_2174;
    float _2192 = _2190 + _2176;
    float _2194 = -_2178;
    float _2196 = _2194 + _2180;
    float _2198 = -_2182;
    float _2200 = _2198 + _2184;
    bool _2202 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2204 = fma(_2188, _2192, _2174);
    float _2206 = fma(_2188, _2196, _2178);
    float _2208 = fma(_2188, _2200, _2182);
    float _2210 = _2204 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2212 = fma(_2206, 0.298911988735198974609375, _2210);
    float _2214 = fma(_2208, 0.114477999508380889892578125, _2212);
    out.m_87.x = 0.0;
    float _2216 = -_2214;
    float _2218 = _2206 + _2216;
    float _2220 = -_2214;
    float _2222 = _2204 + _2220;
    float _2224 = -_2214;
    float _2226 = _2208 + _2224;
    float _2228 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2230 = fma(_2218, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2214);
    float _2232 = fma(_2222, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2214);
    float _2234 = fma(_2226, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2214);
    out.m_89.x = 0.0;
    out.m_83.w = _2228;
    out.m_91.x = _2230;
    out.m_91.y = _2232;
    out.m_91.z = _2234;
    if (!_2202)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2236 = -_1221;
    float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2240 = -_1223;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2244 = -_1225;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2242, _2242, _2248);
    float _2252 = fma(_2246, _2246, _2250);
    float _2254 = rsqrt(_2252);
    float _2256 = _2238 * _2254;
    float _2258 = _2242 * _2254;
    float _2260 = _2246 * _2254;
    float _2262 = sqrt(_2252);
    float _2264 = -_1542;
    float _2266 = _2264 + _2256;
    float _2268 = -_1538;
    float _2270 = _2268 + _2258;
    float _2272 = -_1540;
    float _2274 = _2272 + _2260;
    float _2276 = _2266 * _2266;
    float _2278 = fma(_2270, _2270, _2276);
    float _2280 = fma(_2274, _2274, _2278);
    float _2282 = -_2262;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2286 = rsqrt(_2280);
    float _2288 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = abs(_2290);
    float _2294 = log2(_2292);
    float _2296 = _2266 * _2286;
    float _2298 = _2270 * _2286;
    float _2300 = _2274 * _2286;
    float _2302 = _1936 * _2296;
    float _2304 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = _1936 * _2256;
    float _2310 = fma(_1916, _2298, _2302);
    float _2312 = _2306 * _2306;
    float _2314 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2316 = fma(_1916, _2258, _2308);
    float _2318 = fma(_1878, _2300, _2310);
    float _2320 = precise::clamp(_2318, 0.0, 1.0);
    float _2322 = _2312 + (-1.0);
    float _2324 = fma(_1878, _2260, _2316);
    float _2326 = precise::clamp(_2324, 0.0, 1.0);
    float _2328 = _2320 * _2320;
    float _2330 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2332 = exp2(_2314);
    float _2334 = fma(_2328, _2322, 1.0);
    float _2336 = -_2256;
    float _2338 = -_2330;
    float _2340 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2338);
    float _2342 = _2334 * _2334;
    float _2344 = -_2260;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2340);
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2350 = _2346 + _2348;
    float _2352 = 1.0 / _2342;
    float _2354 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = _2332 * _2356;
    float _2360 = _2326 * _2358;
    float _2362 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2364 = _2312 * _2352;
    float _2366 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2368 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2370 = _2360 * _2364;
    out.m_87.x = _2366;
    out.m_87.y = _2362;
    out.m_87.z = _2368;
    float _2372 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2374 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2376 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2372;
    out.m_89.y = _2374;
    out.m_89.z = _2376;
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
    bool _2088 = false;
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
        float _2433 = as_type<float>(_126);
        out.gl_Position.z = _2433;
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
        float _2502 = as_type<float>(_164);
        out.gl_Position.z = _2502;
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
    float2 _2629 = float2(_230, _234);
    float _236 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2629, float2(0.0), isnan(_2629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2629, float2(0.0), isnan(_2629)), level(0.0)).x;
    float _238 = in.m_63.x;
    float _240 = in.m_63.y;
    float _242 = in.m_63.z;
    float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _246 = log2(_244);
    float _248 = _200 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    float _260 = 1.0 / _252;
    float _262 = _246 * _144;
    float _264 = _242 * 2.0;
    float _266 = exp2(_262);
    float _268 = _240 * 2.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _272 = 1.0 + _270;
    float _274 = _238 * 2.0;
    float _276 = _240 + _242;
    float _278 = _242 + _238;
    float _280 = _242 + (-0.5);
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _284 = _282 != 0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _292 = _290 != 0;
    float _294 = 1.0 / _256;
    float _296 = _276 + (-1.0);
    float _298 = _240 + _238;
    bool _300 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _302 = isnan(1.0);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _308 = _304 || _306;
    float _310 = _238 + (-0.5);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = _196 + _312;
    bool _316 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _324 = _320 || _322;
    float _326 = _278 + (-1.0);
    float _328 = floor(_264);
    float _330 = _240 + (-0.5);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _196 + _332;
    float _336 = -_266;
    float _338 = _336 + 1.0;
    float _340 = _314 * _260;
    float _342 = _298 + (-1.0);
    float _344 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].z, _258);
    float _346 = floor(_268);
    float _348 = _334 * _294;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _350;
    float _354 = _324 ? _338 : 0.0;
    float _356 = _344 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _358 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _360 = 1.0 / _272;
    bool _362 = _328 >= 0.0;
    bool _364 = isnan(_328);
    bool _366 = _362 || _364;
    bool _368 = isnan(0.0);
    bool _370 = _366 || _368;
    float _372 = fma(_352, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _374 = _328 > 0.0;
    int _376 = _370 ? 0 : 1;
    bool _378 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _380 = isnan(_196);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = floor(_274);
    bool _392 = _346 > 0.0;
    bool _394 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_196);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _408 = 2;
    float _410 = _218;
    if (_308)
    {
        float _412 = _354 * _360;
        _148 = _412;
    }
    float _414 = _148;
    bool _416 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_196);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _428;
    float _432 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _434 = !_284;
    int _436 = _434 ? 0 : 1;
    float _438 = -_404;
    float _440 = _438 + 1.0;
    bool _442 = _346 >= 0.0;
    bool _444 = isnan(_346);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = fma(_430, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = _426 * _440;
    bool _456 = _390 > 0.0;
    float _458 = -_426;
    float _460 = _458 + 1.0;
    bool _462 = _390 >= 0.0;
    bool _464 = isnan(_390);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = -_388;
    float _474 = _472 + 1.0;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _476;
    float _480 = _372 * _454;
    int _482 = _470 ? 0 : 1;
    float _484 = _404 * _474;
    float _486 = fma(_478, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _500 = _486 * _454;
    float _502 = _452 * _454;
    float _504 = fma(_494, _348, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _506 = _356 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _508 = fma(_490, _348, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_498, _348, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _512 = ~_376;
    int _514 = _512 + 1;
    int _516 = _514 + 1;
    float _518 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].x, _480);
    float _520 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    float _522 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    int _524 = abs(_436);
    float _526 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[11].x, _506);
    int _528 = _516;
    if (!_374)
    {
        int _530 = ~_376;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = in.m_65.x;
    float _538 = in.m_65.y;
    float _540 = in.m_65.z;
    float _542 = _356 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _544 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[11].z, _526);
    float _546 = float(_524);
    float _548 = fma(_508, _484, _518);
    float _550 = float(_534);
    float _552 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[10].x, _542);
    float _554 = _544 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _556 = ~_482;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    float _562 = fma(_510, _484, _522);
    float _564 = _546 * _550;
    float _566 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[10].z, _552);
    float _568 = 1.0 / _554;
    int _570 = _560;
    if (!_456)
    {
        int _572 = ~_482;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = _564 * (-2.0);
    float _580 = _566 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _582 = !_288;
    int _584 = _582 ? 0 : 1;
    float _586 = fma(_504, _484, _520);
    int _588 = _450 ? 0 : 1;
    float _590 = fma(_358, _578, _358);
    bool _592 = !_292;
    int _594 = _592 ? 0 : 1;
    float _596 = _580 + _554;
    int _598 = abs(_584);
    float _600 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].y, _586);
    int _602 = ~_588;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = fma(_578, _536, _536);
    int _610 = _606;
    if (!_392)
    {
        int _612 = ~_588;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    int _618 = abs(_594);
    float _620 = _596 * _568;
    float _622 = _620 * 0.5;
    float _624 = float(_598);
    float _626 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    float _628 = float(_576);
    float _630 = in.m_67.x;
    float _632 = in.m_67.y;
    float _634 = in.m_67.z;
    float _636 = _624 * _628;
    float _638 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _640 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[30].w, _638);
    float _642 = fma(_590, _414, _626);
    float _644 = float(_618);
    float _646 = _636 * (-2.0);
    float _648 = float(_616);
    float _650 = in.m_69.x;
    float _652 = in.m_69.y;
    float _654 = in.m_69.z;
    float _656 = 1.0 / _640;
    float _658 = fma(_646, _538, _538);
    float _660 = fma(_406, _646, _406);
    float _662 = _644 * _648;
    float _664 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].x, _548);
    float _666 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[196].y, _658);
    float _668 = _642 * 0.15915493667125701904296875;
    float _670 = _662 * (-2.0);
    float _672 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].z, _562);
    float _674 = fma(_660, _414, _666);
    float _676 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _678 = fma(_670, _540, _540);
    float _680 = fma(_432, _670, _432);
    float _682 = _674 * 0.15915493667125701904296875;
    float _684 = _664 * _630;
    float _686 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[196].z, _678);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _690 = _656 * _688;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _694 = fma(_680, _414, _686);
    float _696 = _600 * _632;
    float _698 = _668 * 6.283185482025146484375;
    float _700 = sin(_698);
    bool _702 = _690 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _650);
    float _706 = _694 * 0.15915493667125701904296875;
    bool _708 = _690 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _710 = _672 * _634;
    float _712 = _356 + _676;
    float _714 = _692 * _704;
    float _716 = _668 * 6.283185482025146484375;
    float _718 = cos(_716);
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _652);
    float _722 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _724 = _712 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _726 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _728 = _722 * _720;
    float _730 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[126].x, _724);
    float _732 = _682 * 6.283185482025146484375;
    float _734 = sin(_732);
    bool _736 = !_702;
    int _738 = _736 ? 0 : 1;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _654);
    float _742 = _712;
    if (!_702)
    {
        _408 = 1;
    }
    int _744 = _408;
    float _746 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[126].z, _730);
    int _748 = _744;
    if (!_708)
    {
        _748 = _738;
    }
    int _750 = _748;
    float _752 = _726 * _740;
    bool _754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _756 = isnan(0.5);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _762 = _758 || _760;
    float _764 = _682 * 6.283185482025146484375;
    float _766 = cos(_764);
    float _768 = _746 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _770 = _750 << 6;
    int _772 = _770 + 96;
    uint _775 = uint(int(uint(_772) >> uint(2)));
    uint _777 = uint(int(uint(int(_775)) >> uint(2)));
    int _779 = int(_775) & 3;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[int(_777)][_779];
    int _783 = int(_775) + 1;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    int _787 = _783 & 3;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[int(_785)][_787];
    float _791 = _706 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _712 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _797 = _718 * _734;
    float _799 = _700 * _734;
    float _801 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[127].x, _795);
    int _803 = _770 + 48;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    uint _807 = uint(int(uint(int(_805)) >> uint(2)));
    int _809 = int(_805) & 3;
    float _811 = (*spvDescriptorSet0.vp_c15)._m0[int(_807)][_809];
    int _813 = int(_805) + 1;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    int _817 = _813 & 3;
    float _819 = (*spvDescriptorSet0.vp_c15)._m0[int(_815)][_817];
    float _821 = _706 * 6.283185482025146484375;
    float _823 = sin(_821);
    float _825 = _700 * _766;
    float _827 = _718 * _766;
    float _829 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[127].z, _801);
    float _831 = _829 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _833 = _718 * _793;
    float _835 = trunc(_768);
    int _837 = int(_835);
    float _839 = _700 * _793;
    float _841 = _766 * _793;
    float _843 = _734 * _793;
    float _845 = _839 * _728;
    int _847 = _770 + 64;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    uint _851 = uint(int(uint(int(_849)) >> uint(2)));
    int _853 = int(_849) & 3;
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[int(_851)][_853];
    int _857 = int(_849) + 1;
    uint _859 = uint(int(uint(_857) >> uint(2)));
    int _861 = _857 & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    float _865 = -_797;
    float _867 = fma(_823, _825, _865);
    float _869 = -_825;
    float _871 = fma(_823, _797, _869);
    float _873 = _833 * _728;
    float _875 = fma(_823, _827, _799);
    float _877 = trunc(_831);
    int _879 = int(_877);
    float _881 = -_728;
    float _883 = _823 * _881;
    float _885 = fma(_823, _799, _827);
    float _887 = fma(_875, _714, _873);
    float _889 = fma(_867, _714, _845);
    int _891 = _770 + 104;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    uint _895 = uint(int(uint(int(_893)) >> uint(2)));
    int _897 = int(_893) & 3;
    float _899 = (*spvDescriptorSet0.vp_c15)._m0[int(_895)][_897];
    int _901 = int(_893) + 1;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    int _905 = _901 & 3;
    float _907 = (*spvDescriptorSet0.vp_c15)._m0[int(_903)][_905];
    float _909 = fma(_841, _714, _883);
    float _911 = fma(_871, _752, _887);
    float _913 = fma(_885, _752, _889);
    int _915 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _917 = _837 + _915;
    int _919 = _917 + 1;
    float _921 = fma(_843, _752, _909);
    float _923 = _911 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _925 = _911 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _927 = _770 + 56;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c15)._m0[int(_931)][_933];
    int _937 = int(_929) + 1;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    int _941 = _937 & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    bool _945 = _919 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _947 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[10].x, _923);
    int _949 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _951 = _879 + _949;
    int _953 = _951 + 1;
    float _955 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[8].x, _925);
    float _957 = _712 * _789;
    float _959 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[10].z, _947);
    int _961 = _919 | _953;
    int _963 = _770 + 72;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    float _981 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[8].z, _955);
    float _983 = _218 + _959;
    bool _985 = _961 < 0;
    bool _987 = _985 || _945;
    float _989 = fma(_216, _781, _957);
    float _991 = _216 + _981;
    float _993 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _995 = _983 + _993;
    bool _997 = _953 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _999 = _997 || _987;
    int _1001 = _770 + 80;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    uint _1005 = uint(int(uint(int(_1003)) >> uint(2)));
    int _1007 = int(_1003) & 3;
    float _1009 = (*spvDescriptorSet0.vp_c15)._m0[int(_1005)][_1007];
    int _1011 = int(_1003) + 1;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    int _1015 = _1011 & 3;
    float _1017 = (*spvDescriptorSet0.vp_c15)._m0[int(_1013)][_1015];
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1021 = _991 + _1019;
    float _1023 = _995 * _995;
    float _1025 = _911 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1027 = _712 * _819;
    float _1029 = fma(_1021, _1021, _1023);
    float _1031 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1025);
    float _1033 = fma(_216, _811, _1027);
    float _1035 = sqrt(_1029);
    float _1037 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1031);
    uint _1039 = as_type<uint>(_911);
    int _1041 = as_type<int>(_989);
    int _1043 = as_type<int>(_1031);
    float _1045 = _983;
    float _1047 = _1021;
    if (!_999)
    {
        int _1049 = _953 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1051 = _1049 + _919;
        _1039 = uint(_1051);
    }
    uint _1053 = _1039;
    float _1055 = _712 * _863;
    float _1057 = _1027;
    int _1059 = as_type<int>(_855);
    if (!_999)
    {
        float _1061 = floor(_768);
        _1057 = _1061;
    }
    float _1063 = _1057;
    float _1065 = fma(_216, _855, _1055);
    float _1067 = _1065;
    if (!_999)
    {
        uint _1069 = uint(int(uint(int(_1053)) >> uint(2)));
        _1059 = int(_1069);
    }
    int _1071 = _1059;
    float _1073 = fma(_218, _899, _989);
    float _1075 = as_type<float>(_1071);
    if (!_999)
    {
        int _1077 = int(_1053) << 2;
        _1041 = _1077;
    }
    int _1079 = _1041;
    bool _1081 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1083 = _1073 + _907;
    if (!_999)
    {
        int _1085 = 12 & _1079;
        _1043 = _1085;
    }
    int _1087 = _1043;
    float _1089 = fma(_218, _935, _1033);
    int _1091 = as_type<int>(_935);
    float _1093 = _1089;
    if (!_999)
    {
        int _1095 = _1071 << 4;
        int _1097 = _1095 + _1087;
        _1091 = _1097;
    }
    int _1099 = _1091;
    float _1101 = 1.0 / _1083;
    float _1103 = _356 + _1037;
    float _1105 = fma(_218, _971, _1065);
    float _1107 = _1089 + _943;
    if (!_1081)
    {
        _1075 = _991;
    }
    float _1109 = _1075;
    float _1111 = _1105 + _979;
    float _1113 = _1109;
    if (!_1081)
    {
        _1067 = _1103;
    }
    float _1115 = _1067;
    bool _1117 = !_1081;
    float _1119 = _1115;
    if (!_1117)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1125 = _1035 + _1123;
        float _1127 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = rsqrt(_1029);
        float _1131 = _1125 * _1121;
        float _1133 = _1131 * 0.15915493667125701904296875;
        float _1135 = _1133 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1133 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1137 + (-1.0);
        float _1145 = fma(_1141, _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1147 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1129 * _1145;
        float _1151 = fma(_1103, _1137, _1147);
        float _1153 = fma(_1021, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1155 = fma(_995, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1045 = _1155;
        _1113 = _1153;
        _1119 = _1151;
    }
    float _1157 = _1045;
    float _1159 = _1113;
    float _1161 = _1119;
    float _1163 = _1161;
    float _1165 = _1159;
    if (_762)
    {
        _1047 = _1157;
    }
    float _1167 = _1047;
    float _1169 = _1167;
    if (!_762)
    {
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1173 = _356 + _1171;
        float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1177 = _216 + _1175;
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1181 = -_216;
        float _1183 = _1181 + _1159;
        float _1185 = _1173 * _1173;
        float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1189 = _218 + _1187;
        float _1191 = fma(_1177, _1177, _1185);
        float _1193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1195 = fma(_1189, _1189, _1191);
        float _1197 = sqrt(_1195);
        float _1199 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1201 = -_356;
        float _1203 = _1201 + _1161;
        float _1205 = precise::min(_1197, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1207 = _1205 * _1193;
        float _1209 = _1199 * _1207;
        float _1211 = -_218;
        float _1213 = _1211 + _1157;
        float _1215 = fma(_1203, _1209, _356);
        float _1217 = fma(_1183, _1209, _216);
        float _1219 = fma(_1213, _1209, _218);
        _1163 = _1215;
        _1165 = _1217;
        _1169 = _1219;
        _1093 = _1213;
    }
    float _1221 = _1163;
    float _1223 = _1165;
    float _1225 = _1169;
    float _1227 = _1093;
    int _1229 = _770 + 88;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    uint _1233 = uint(int(uint(int(_1231)) >> uint(2)));
    int _1235 = int(_1231) & 3;
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[int(_1233)][_1235];
    int _1239 = int(_1231) + 1;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    int _1243 = _1239 & 3;
    float _1245 = (*spvDescriptorSet0.vp_c15)._m0[int(_1241)][_1243];
    float _1247 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1249 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1251 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1253 = _1107 * _1101;
    float _1255 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1247);
    float _1257 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1249);
    float _1259 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1251);
    float _1261 = _991;
    if (!_999)
    {
        int _1263 = _1099 + 400;
        uint _1265 = uint(int(uint(_1263) >> uint(2)));
        uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
        int _1269 = int(_1265) & 3;
        float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
        _1261 = _1271;
    }
    float _1273 = _1261;
    float _1275 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1255);
    bool _1277 = _1253 >= 0.0;
    float _1279 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1257);
    float _1281 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1283 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1259);
    float _1285 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = _1111 * _1101;
    bool _1289 = _1253 <= 1.0;
    bool _1291 = _1289 && _1277;
    float _1293 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1281);
    float _1295 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1299 = _1287 >= 0.0;
    bool _1301 = _1299 && _1291;
    float _1303 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1293);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1297);
    bool _1309 = _1287 <= 1.0;
    bool _1311 = _1309 && _1301;
    float _1313 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1317 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1321 = _712 * _1017;
    float _1323 = _1227;
    float _1325 = _1313;
    if (!_999)
    {
        float _1327 = floor(_831);
        _1323 = _1327;
    }
    float _1329 = _1323;
    float _1331 = -_1315;
    float _1333 = fma(_1331, _1313, 1.0);
    float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1337 = fma(_216, _1009, _1321);
    float _1339 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1343 = _1333;
    if (_1311)
    {
        float _1345 = float(_750);
        _1325 = _1345;
    }
    float _1347 = _1325;
    float _1349 = log2(_1333);
    float _1351 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1353 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1341);
    float _1355 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1357 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1353);
    float _1359 = 1.0 / _1335;
    float _1361 = _1347;
    if (!_999)
    {
        float _1363 = -_1329;
        float _1365 = _831 + _1363;
        _1343 = _1365;
    }
    float _1367 = _1343;
    float _1369 = fma(_218, _1237, _1337);
    float _1371 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1355);
    float _1373 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1357);
    float _1375 = _1369 + _1245;
    float _1377 = _1245;
    if (!_999)
    {
        float _1379 = -_1063;
        float _1381 = _768 + _1379;
        _1377 = _1381;
    }
    float _1383 = _1377;
    float _1385 = _1339;
    if (_1311)
    {
        float _1387 = rint(_1347);
        float _1389 = precise::max(_1387, 0.0);
        uint _1391 = uint(_1389);
        uint _1393 = clamp(_1391, 0u, 65535u);
        _1385 = as_type<float>(_1393);
    }
    float _1395 = _1385;
    float _1397 = _1349 * 0.693147182464599609375;
    float _1399 = _1375 * _1101;
    float _1401 = _1375;
    if (!_999)
    {
        float _1403 = rint(_1273);
        float _1405 = precise::max(_1403, 0.0);
        uint _1407 = uint(_1405);
        uint _1409 = clamp(_1407, 0u, 65535u);
        _1401 = as_type<float>(_1409);
    }
    float _1411 = _1401;
    float _1413 = _1371 * _1359;
    float _1415 = _1373 * _1359;
    float _1417 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1419 = fma(_1413, 0.5, 0.5);
    float _1421 = fma(_1415, -0.5, 0.5);
    float _1423 = _1321;
    if (_1311)
    {
        float3 _4539 = float3(_1253, _1287, float(as_type<int>(_1395)));
        float3 _4543 = select(_4539, float3(0.0), isnan(_4539));
        float _1425 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4543.xy, uint(rint(_4543.z)), _1399, level(0.0));
        _1423 = _1425;
    }
    float _1427 = _1423;
    float3 _4553 = float3(_1419, _1421, _1417);
    float _1429 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4553, float3(0.0), isnan(_4553)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4553, float3(0.0), isnan(_4553)), level(0.0)).x;
    float3 _4562 = float3(_1419, _1421, _1417);
    float4 _1432 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4562, float3(0.0), isnan(_4562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4562, float3(0.0), isnan(_4562)), level(0.0)).xyzw;
    float _1434 = _1432.x;
    float _1436 = _1432.y;
    float _1438 = _1432.z;
    float _1440 = _1432.w;
    float _1442 = _1397;
    if (!_999)
    {
        float3 _4585 = float3(_1383, _1367, float(as_type<int>(_1411)));
        float3 _4587 = select(_4585, float3(0.0), isnan(_4585));
        float _1444 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4587.xy, uint(rint(_4587.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4587.xy, uint(rint(_4587.z)), level(0.0)).x;
        _1442 = _1444;
    }
    float _1446 = _1442;
    if (_999)
    {
        _1361 = 1.0;
    }
    float _1448 = _1361;
    float _1450 = _1448;
    if (!_999)
    {
        int _1452 = int(_1053) << 4;
        int _1454 = _1452 + 2048;
        uint _1456 = uint(int(uint(_1454) >> uint(2)));
        uint _1458 = uint(int(uint(int(_1456)) >> uint(2)));
        int _1460 = int(_1456) & 3;
        float _1462 = (*spvDescriptorSet0.vp_c15)._m0[int(_1458)][_1460];
        int _1464 = int(_1456) + 1;
        uint _1466 = uint(int(uint(_1464) >> uint(2)));
        int _1468 = _1464 & 3;
        float _1470 = (*spvDescriptorSet0.vp_c15)._m0[int(_1466)][_1468];
        int _1472 = _1454 + 8;
        uint _1474 = uint(int(uint(_1472) >> uint(2)));
        uint _1476 = uint(int(uint(int(_1474)) >> uint(2)));
        int _1478 = int(_1474) & 3;
        float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
        int _1482 = int(_1474) + 1;
        uint _1484 = uint(int(uint(_1482) >> uint(2)));
        int _1486 = _1482 & 3;
        float _1488 = (*spvDescriptorSet0.vp_c15)._m0[int(_1484)][_1486];
        float _1490 = _712 * _1470;
        float _1492 = fma(_216, _1462, _1490);
        float _1494 = fma(_218, _1480, _1492);
        float _1496 = _1494 + _1488;
        float _1498 = precise::clamp(_1496, 0.0, 1.0);
        float _1500 = -_1498;
        float _1502 = _1500 + _1446;
        float _1504 = fma(_1502, 500.0, 1.5);
        float _1506 = exp2(_1504);
        float _1508 = 0.0 + _1506;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        _742 = _1490;
        _1450 = _1510;
    }
    float _1512 = _742;
    float _1514 = _1450;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1221 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1223 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1225 + _1524;
    float _1528 = _1518 * _1518;
    float _1530 = fma(_1522, _1522, _1528);
    float _1532 = fma(_1526, _1526, _1530);
    float _1534 = rsqrt(_1532);
    float _1536 = sqrt(_1532);
    float _1538 = _1522 * _1534;
    float _1540 = _1526 * _1534;
    float _1542 = _1518 * _1534;
    float _1544 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 + _1550;
    float _1554 = sqrt(_1552);
    bool _1556 = _1554 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = _1554 + _1558;
    float _1562 = _216;
    float _1564 = _1552;
    float _1566 = _1560;
    float _1568 = _1534;
    float _1570 = _1544;
    float _1572 = _1546;
    float _1574 = _1548;
    float _1576 = _1550;
    if (_1556)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1562 = _1578;
    }
    float _1580 = _1562;
    if (_1556)
    {
        float _1582 = rsqrt(_1552);
        _1564 = _1582;
    }
    float _1584 = _1564;
    if (_1556)
    {
        float _1586 = _1560 * _1580;
        _1566 = _1586;
    }
    float _1588 = _1566;
    if (_1556)
    {
        float _1590 = _1588 * 0.15915493667125701904296875;
        _410 = _1590;
    }
    float _1592 = _410;
    float _1594 = _1580;
    if (_1556)
    {
        float _1596 = _1592 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1594 = _1598;
    }
    float _1600 = _1594;
    float _1602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1604 = precise::max(0.0, _1602);
    float _1606 = _1512;
    float _1608 = _1604;
    if (_1556)
    {
        float _1610 = _1592 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1542;
    float _1618 = -_1604;
    float _1620 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1618);
    if (_1556)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1622;
    }
    float _1624 = _1568;
    float _1626 = _1600;
    float _1628 = _1624;
    if (_1556)
    {
        float _1630 = fma(_1600, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    if (!_1556)
    {
        _1628 = _1620;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    if (_1556)
    {
        float _1640 = _1614 + (-1.0);
        _1608 = _1640;
    }
    float _1642 = _1608;
    float _1644 = 0.0;
    if (_1556)
    {
        float _1646 = _1584 * _1632;
        _1644 = _1646;
    }
    float _1648 = _1644;
    if (_1556)
    {
        float _1650 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1650;
    }
    float _1652 = _1634;
    if (_1556)
    {
        float _1654 = _1544 * _1648;
        _1570 = _1654;
    }
    float _1656 = _1570;
    if (_1556)
    {
        float _1658 = _1546 * _1648;
        _1572 = _1658;
    }
    float _1660 = _1572;
    if (_1556)
    {
        float _1662 = fma(_1620, _1614, _1652);
        _1638 = _1662;
    }
    float _1664 = _1638;
    if (_1556)
    {
        float _1666 = _1656 * _1656;
        _1574 = _1666;
    }
    float _1668 = _1574;
    if (_1556)
    {
        float _1670 = _1660 * _1660;
        _1576 = _1670;
    }
    float _1672 = _1576;
    float _1674 = fma(_1664, _1664, _1668);
    float _1676 = _1674 + _1672;
    float _1678 = rsqrt(_1676);
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1682 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1680);
    float _1684 = precise::clamp(_1682, 0.0, 1.0);
    float _1686 = -_1684;
    float _1688 = _1686 + 1.0;
    float _1690 = abs(_1688);
    float _1692 = log2(_1690);
    float _1694 = _1678 * _1656;
    float _1696 = _1678 * _1664;
    float _1698 = _1678 * _1660;
    float _1700 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1702 = -_1700;
    float _1704 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = -_1698;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1710 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1712 = fma(_1708, -0.5, 0.5);
    float _1714 = fma(_1708, 0.5, 0.5);
    float _1716 = _1696 + 1.0;
    float _1718 = exp2(_1710);
    float _1720 = fma(_1714, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1722 = fma(_1714, _1720, -0.212114393711090087890625);
    float _1724 = sqrt(_1712);
    float _1726 = fma(_1714, _1722, 1.570728778839111328125);
    float _1728 = -_1696;
    float _1730 = fma(_1718, _1716, _1728);
    float _1732 = fma(_1730, 0.5, 0.5);
    float _1734 = _1724 * 0.636619746685028076171875;
    float _1736 = -_1726;
    float _1738 = fma(_1734, _1736, 1.0);
    float2 _5042 = float2(_1738, _1732);
    float3 _1742 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5042, float2(0.0), isnan(_5042)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5042, float2(0.0), isnan(_5042)), level(0.0)).xyz;
    float _1744 = _1742.x;
    float _1746 = _1742.y;
    float _1748 = _1742.z;
    float _1750 = abs(_690);
    float _1752 = log2(_1750);
    float _1754 = in.m_71.x;
    float _1756 = in.m_71.y;
    float _1758 = in.m_71.z;
    bool _1760 = _652 != 0.0;
    bool _1762 = isnan(_652);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    float _1770 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1772 = -_236;
    float _1774 = _1772 + 1.0;
    bool _1776 = _650 == 0.0;
    bool _1778 = !_1768;
    bool _1780 = _1776 && _1778;
    float _1782 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1770);
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1786 = _654 == 0.0;
    bool _1788 = _1786 && _1780;
    float _1790 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1782);
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1794 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1796 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1804 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1790);
    float _1806 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1808 = exp2(_1796);
    out.m_73.x = _1223;
    out.m_73.y = _1221;
    out.m_73.z = _1225;
    float _1810 = _1756;
    float _1812 = _1754;
    float _1814 = _1758;
    float _1816 = _1804;
    if (!_1788)
    {
        float _1818 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1756);
        _1810 = _1818;
    }
    float _1820 = _1810;
    if (!_1788)
    {
        float _1822 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1754);
        _1812 = _1822;
    }
    float _1824 = _1812;
    if (!_1788)
    {
        float _1826 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1758);
        _1814 = _1826;
    }
    float _1828 = _1814;
    float _1830 = _833 * _1820;
    float _1832 = -_1820;
    float _1834 = _823 * _1832;
    out.m_75.x = _1794;
    out.m_75.y = _1800;
    out.m_75.z = _1806;
    out.m_75.w = _1802;
    float _1836 = fma(_875, _1824, _1830);
    float _1838 = _839 * _1820;
    float _1840 = fma(_841, _1824, _1834);
    bool _1842 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1844 = isnan(_1536);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1850 = _1846 || _1848;
    float _1852 = fma(_871, _1828, _1836);
    float _1854 = fma(_1808, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1856 = precise::clamp(_1854, 0.0, 1.0);
    float _1858 = fma(_867, _1824, _1838);
    float _1860 = fma(_843, _1828, _1840);
    float _1862 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1864 = fma(_1856, -2.0, 3.0);
    float _1866 = _1856 * _1856;
    float _1868 = fma(_885, _1828, _1858);
    float _1870 = fma(_1860, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1862);
    float _1872 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1874 = _1866 * _1864;
    float _1876 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1878 = fma(_1868, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1870);
    bool _1880 = _690 <= 8000.0;
    bool _1882 = isnan(_690);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(8000.0);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -_1874;
    float _1894 = _1892 + 1.0;
    float _1896 = exp2(_1872);
    float _1898 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1900 = _1804 + _1335;
    float _1902 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1874);
    float _1904 = fma(_1860, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1876);
    float _1906 = fma(_1860, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1898);
    float _1908 = _1900 * 0.5;
    float _1910 = _1890 * _1902;
    float _1912 = _1900;
    if (!_1311)
    {
        _1912 = 1.0;
    }
    float _1914 = _1912;
    float _1916 = fma(_1868, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1904);
    float _1918 = _1914;
    if (_1311)
    {
        bool _1920 = _1427 >= _1399;
        bool _1922 = isnan(_1427);
        bool _1924 = _1920 || _1922;
        bool _1926 = isnan(_1399);
        bool _1928 = _1924 || _1926;
        float _1930 = float(_1928);
        _1918 = _1930;
    }
    float _1932 = _1918;
    float _1934 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1936 = fma(_1868, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1906);
    float _1938 = _1774 * _1934;
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1896;
    float _1944 = _1942 + 1.0;
    float _1946 = _1932 * _1514;
    float _1948 = -_1940;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1954 = -_1946;
    float _1956 = fma(_1954, _1950, 1.0);
    float _1958 = precise::clamp(_1956, 0.0, 1.0);
    float _1960 = _1952 * _1429;
    out.gl_Position.x = _1371;
    out.gl_Position.y = _1373;
    out.gl_Position.z = _1804;
    out.gl_Position.w = _1335;
    out.m_79.z = _1908;
    out.m_79.w = _1335;
    float _1962 = _1440 * _1960;
    float _1964 = -_1952;
    float _1966 = _1964 + 1.0;
    out.m_81.x = _1916;
    out.m_81.y = _1936;
    out.m_81.z = _1878;
    float _1968 = _1952;
    float _1970 = _1371;
    float _1972 = _1966;
    float _1974 = _1958;
    float _1976 = _1962;
    if (!_1850)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1978 = _1968;
    float _1980 = _1440 * _1966;
    float _1982 = _1958 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1984 = _1978;
    float _1986 = _1978;
    if (!_1850)
    {
        _1816 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1988 = _1816;
    float _1990 = _1988;
    float _1992 = _1988;
    if (!_1850)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1994 = _1970;
    out.m_83.x = _1982;
    float _1996 = _1994;
    float _1998 = _1994;
    if (!_1850)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2000 = _1972;
    float _2002 = _2000;
    float _2004 = _2000;
    if (!_1850)
    {
        _1974 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2006 = _1974;
    float _2008 = _1748 * _1960;
    float _2010 = fma(_1744, _1962, _1434);
    float _2012 = fma(_1746, _1962, _1436);
    float _2014 = _2006;
    float _2016 = _2006;
    if (!_1850)
    {
        _1976 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2018 = _1976;
    float _2020 = fma(_1440, _2008, _1438);
    out.m_85.x = _2010;
    out.m_85.y = _2012;
    out.m_85.z = _2020;
    out.m_85.w = _1980;
    bool _2022 = !_1850;
    float _2024 = _2018;
    float _2026 = _2018;
    if (!_2022)
    {
        bool _2028 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2030 = isnan(_1536);
        bool _2032 = _2028 || _2030;
        bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2036 = _2032 || _2034;
        if (!_2036)
        {
            float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2040 = _1536 + _2038;
            float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2044 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2042;
            float _2046 = 1.0 / _2044;
            float _2048 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2056 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2062 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2068 = _2040 * _2046;
            float _2070 = precise::clamp(_2068, 0.0, 1.0);
            float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2076 = fma(_2070, _2050, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2078 = fma(_2070, _2074, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2080 = fma(_2070, _2054, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2082 = fma(_2070, _2058, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2084 = fma(_2070, _2062, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2086 = fma(_2070, _2066, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1992 = _2076;
            _2026 = _2084;
            _1986 = _2078;
            _2004 = _2082;
            _1998 = _2080;
            _2016 = _2086;
            _2088 = true;
        }
        else
        {
            bool _2090 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2092 = isnan(_1536);
            bool _2094 = _2090 || _2092;
            bool _2096 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2098 = _2094 || _2096;
            if (!_2098)
            {
                _1984 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2100 = _1984;
            _1986 = _2100;
            if (!_2098)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2102 = _1990;
            _1992 = _2102;
            if (!_2098)
            {
                _1996 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2104 = _1996;
            _1998 = _2104;
            if (!_2098)
            {
                _2002 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2106 = _2002;
            _2004 = _2106;
            if (!_2098)
            {
                _2024 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2108 = _2024;
            _2026 = _2108;
            if (!_2098)
            {
                _2014 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2110 = _2014;
            bool _2112 = !_2098;
            _2016 = _2110;
            if (!_2112)
            {
                bool _2114 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2116 = isnan(_1536);
                bool _2118 = _2114 || _2116;
                bool _2120 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2122 = _2118 || _2120;
                if (!_2122)
                {
                    float _2124 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2126 = _1536 + _2124;
                    float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2128;
                    float _2132 = 1.0 / _2130;
                    float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2136 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2154 = _2126 * _2132;
                    float _2156 = precise::clamp(_2154, 0.0, 1.0);
                    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2162 = fma(_2156, _2136, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2164 = fma(_2156, _2160, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2166 = fma(_2156, _2140, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2168 = fma(_2156, _2144, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2170 = fma(_2156, _2148, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2172 = fma(_2156, _2152, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1992 = _2162;
                    _2026 = _2170;
                    _1986 = _2164;
                    _2004 = _2168;
                    _1998 = _2166;
                    _2016 = _2172;
                    _2088 = true;
                }
                else
                {
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2026 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1986 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2004 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1998 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2016 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2088 = false;
    float _2174 = _1992;
    float _2176 = _2026;
    float _2178 = _1986;
    float _2180 = _2004;
    float _2182 = _1998;
    float _2184 = _2016;
    float _2186 = fma(_1936, -0.5, 0.5);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = -_2174;
    float _2192 = _2190 + _2176;
    float _2194 = -_2178;
    float _2196 = _2194 + _2180;
    float _2198 = -_2182;
    float _2200 = _2198 + _2184;
    bool _2202 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2204 = fma(_2188, _2192, _2174);
    float _2206 = fma(_2188, _2196, _2178);
    float _2208 = fma(_2188, _2200, _2182);
    float _2210 = _2204 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2212 = fma(_2206, 0.298911988735198974609375, _2210);
    float _2214 = fma(_2208, 0.114477999508380889892578125, _2212);
    out.m_87.x = 0.0;
    float _2216 = -_2214;
    float _2218 = _2206 + _2216;
    float _2220 = -_2214;
    float _2222 = _2204 + _2220;
    float _2224 = -_2214;
    float _2226 = _2208 + _2224;
    float _2228 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2230 = fma(_2218, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2214);
    float _2232 = fma(_2222, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2214);
    float _2234 = fma(_2226, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2214);
    out.m_89.x = 0.0;
    out.m_83.w = _2228;
    out.m_91.x = _2230;
    out.m_91.y = _2232;
    out.m_91.z = _2234;
    if (!_2202)
    {
        return out;
    }
    float _2236 = -_1221;
    float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2240 = -_1223;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2244 = -_1225;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2242, _2242, _2248);
    float _2252 = fma(_2246, _2246, _2250);
    float _2254 = rsqrt(_2252);
    float _2256 = _2238 * _2254;
    float _2258 = _2242 * _2254;
    float _2260 = _2246 * _2254;
    float _2262 = sqrt(_2252);
    float _2264 = -_1542;
    float _2266 = _2264 + _2256;
    float _2268 = -_1538;
    float _2270 = _2268 + _2258;
    float _2272 = -_1540;
    float _2274 = _2272 + _2260;
    float _2276 = _2266 * _2266;
    float _2278 = fma(_2270, _2270, _2276);
    float _2280 = fma(_2274, _2274, _2278);
    float _2282 = -_2262;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2286 = rsqrt(_2280);
    float _2288 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = abs(_2290);
    float _2294 = log2(_2292);
    float _2296 = _2266 * _2286;
    float _2298 = _2270 * _2286;
    float _2300 = _2274 * _2286;
    float _2302 = _1936 * _2296;
    float _2304 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = _1936 * _2256;
    float _2310 = fma(_1916, _2298, _2302);
    float _2312 = _2306 * _2306;
    float _2314 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2316 = fma(_1916, _2258, _2308);
    float _2318 = fma(_1878, _2300, _2310);
    float _2320 = precise::clamp(_2318, 0.0, 1.0);
    float _2322 = _2312 + (-1.0);
    float _2324 = fma(_1878, _2260, _2316);
    float _2326 = precise::clamp(_2324, 0.0, 1.0);
    float _2328 = _2320 * _2320;
    float _2330 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2332 = exp2(_2314);
    float _2334 = fma(_2328, _2322, 1.0);
    float _2336 = -_2256;
    float _2338 = -_2330;
    float _2340 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2338);
    float _2342 = _2334 * _2334;
    float _2344 = -_2260;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2340);
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2350 = _2346 + _2348;
    float _2352 = 1.0 / _2342;
    float _2354 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = _2332 * _2356;
    float _2360 = _2326 * _2358;
    float _2362 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2364 = _2312 * _2352;
    float _2366 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2368 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2370 = _2360 * _2364;
    out.m_87.x = _2366;
    out.m_87.y = _2362;
    out.m_87.z = _2368;
    float _2372 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2374 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2376 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2372;
    out.m_89.y = _2374;
    out.m_89.z = _2376;
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
    bool _2088 = false;
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
        float _2433 = as_type<float>(_126);
        out.gl_Position.z = _2433;
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
        float _2502 = as_type<float>(_164);
        out.gl_Position.z = _2502;
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
    float2 _2629 = float2(_230, _234);
    float _236 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2629, float2(0.0), isnan(_2629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2629, float2(0.0), isnan(_2629)), level(0.0)).x;
    float _238 = in.m_63.x;
    float _240 = in.m_63.y;
    float _242 = in.m_63.z;
    float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _246 = log2(_244);
    float _248 = _200 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    float _260 = 1.0 / _252;
    float _262 = _246 * _144;
    float _264 = _242 * 2.0;
    float _266 = exp2(_262);
    float _268 = _240 * 2.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _272 = 1.0 + _270;
    float _274 = _238 * 2.0;
    float _276 = _240 + _242;
    float _278 = _242 + _238;
    float _280 = _242 + (-0.5);
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _284 = _282 != 0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _292 = _290 != 0;
    float _294 = 1.0 / _256;
    float _296 = _276 + (-1.0);
    float _298 = _240 + _238;
    bool _300 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _302 = isnan(1.0);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _308 = _304 || _306;
    float _310 = _238 + (-0.5);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = _196 + _312;
    bool _316 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _324 = _320 || _322;
    float _326 = _278 + (-1.0);
    float _328 = floor(_264);
    float _330 = _240 + (-0.5);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _196 + _332;
    float _336 = -_266;
    float _338 = _336 + 1.0;
    float _340 = _314 * _260;
    float _342 = _298 + (-1.0);
    float _344 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].z, _258);
    float _346 = floor(_268);
    float _348 = _334 * _294;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _350;
    float _354 = _324 ? _338 : 0.0;
    float _356 = _344 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _358 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _360 = 1.0 / _272;
    bool _362 = _328 >= 0.0;
    bool _364 = isnan(_328);
    bool _366 = _362 || _364;
    bool _368 = isnan(0.0);
    bool _370 = _366 || _368;
    float _372 = fma(_352, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _374 = _328 > 0.0;
    int _376 = _370 ? 0 : 1;
    bool _378 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _380 = isnan(_196);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = floor(_274);
    bool _392 = _346 > 0.0;
    bool _394 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_196);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _408 = 2;
    float _410 = _218;
    if (_308)
    {
        float _412 = _354 * _360;
        _148 = _412;
    }
    float _414 = _148;
    bool _416 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_196);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _428;
    float _432 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _434 = !_284;
    int _436 = _434 ? 0 : 1;
    float _438 = -_404;
    float _440 = _438 + 1.0;
    bool _442 = _346 >= 0.0;
    bool _444 = isnan(_346);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = fma(_430, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = _426 * _440;
    bool _456 = _390 > 0.0;
    float _458 = -_426;
    float _460 = _458 + 1.0;
    bool _462 = _390 >= 0.0;
    bool _464 = isnan(_390);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = -_388;
    float _474 = _472 + 1.0;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _476;
    float _480 = _372 * _454;
    int _482 = _470 ? 0 : 1;
    float _484 = _404 * _474;
    float _486 = fma(_478, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _500 = _486 * _454;
    float _502 = _452 * _454;
    float _504 = fma(_494, _348, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _506 = _356 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _508 = fma(_490, _348, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_498, _348, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _512 = ~_376;
    int _514 = _512 + 1;
    int _516 = _514 + 1;
    float _518 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].x, _480);
    float _520 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    float _522 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    int _524 = abs(_436);
    float _526 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[11].x, _506);
    int _528 = _516;
    if (!_374)
    {
        int _530 = ~_376;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = in.m_65.x;
    float _538 = in.m_65.y;
    float _540 = in.m_65.z;
    float _542 = _356 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _544 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[11].z, _526);
    float _546 = float(_524);
    float _548 = fma(_508, _484, _518);
    float _550 = float(_534);
    float _552 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[10].x, _542);
    float _554 = _544 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _556 = ~_482;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    float _562 = fma(_510, _484, _522);
    float _564 = _546 * _550;
    float _566 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[10].z, _552);
    float _568 = 1.0 / _554;
    int _570 = _560;
    if (!_456)
    {
        int _572 = ~_482;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = _564 * (-2.0);
    float _580 = _566 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _582 = !_288;
    int _584 = _582 ? 0 : 1;
    float _586 = fma(_504, _484, _520);
    int _588 = _450 ? 0 : 1;
    float _590 = fma(_358, _578, _358);
    bool _592 = !_292;
    int _594 = _592 ? 0 : 1;
    float _596 = _580 + _554;
    int _598 = abs(_584);
    float _600 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].y, _586);
    int _602 = ~_588;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = fma(_578, _536, _536);
    int _610 = _606;
    if (!_392)
    {
        int _612 = ~_588;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    int _618 = abs(_594);
    float _620 = _596 * _568;
    float _622 = _620 * 0.5;
    float _624 = float(_598);
    float _626 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    float _628 = float(_576);
    float _630 = in.m_67.x;
    float _632 = in.m_67.y;
    float _634 = in.m_67.z;
    float _636 = _624 * _628;
    float _638 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _640 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[30].w, _638);
    float _642 = fma(_590, _414, _626);
    float _644 = float(_618);
    float _646 = _636 * (-2.0);
    float _648 = float(_616);
    float _650 = in.m_69.x;
    float _652 = in.m_69.y;
    float _654 = in.m_69.z;
    float _656 = 1.0 / _640;
    float _658 = fma(_646, _538, _538);
    float _660 = fma(_406, _646, _406);
    float _662 = _644 * _648;
    float _664 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].x, _548);
    float _666 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[196].y, _658);
    float _668 = _642 * 0.15915493667125701904296875;
    float _670 = _662 * (-2.0);
    float _672 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].z, _562);
    float _674 = fma(_660, _414, _666);
    float _676 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _678 = fma(_670, _540, _540);
    float _680 = fma(_432, _670, _432);
    float _682 = _674 * 0.15915493667125701904296875;
    float _684 = _664 * _630;
    float _686 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[196].z, _678);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _690 = _656 * _688;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _694 = fma(_680, _414, _686);
    float _696 = _600 * _632;
    float _698 = _668 * 6.283185482025146484375;
    float _700 = sin(_698);
    bool _702 = _690 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _650);
    float _706 = _694 * 0.15915493667125701904296875;
    bool _708 = _690 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _710 = _672 * _634;
    float _712 = _356 + _676;
    float _714 = _692 * _704;
    float _716 = _668 * 6.283185482025146484375;
    float _718 = cos(_716);
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _652);
    float _722 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _724 = _712 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _726 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _728 = _722 * _720;
    float _730 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[126].x, _724);
    float _732 = _682 * 6.283185482025146484375;
    float _734 = sin(_732);
    bool _736 = !_702;
    int _738 = _736 ? 0 : 1;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _654);
    float _742 = _712;
    if (!_702)
    {
        _408 = 1;
    }
    int _744 = _408;
    float _746 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[126].z, _730);
    int _748 = _744;
    if (!_708)
    {
        _748 = _738;
    }
    int _750 = _748;
    float _752 = _726 * _740;
    bool _754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _756 = isnan(0.5);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _762 = _758 || _760;
    float _764 = _682 * 6.283185482025146484375;
    float _766 = cos(_764);
    float _768 = _746 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _770 = _750 << 6;
    int _772 = _770 + 96;
    uint _775 = uint(int(uint(_772) >> uint(2)));
    uint _777 = uint(int(uint(int(_775)) >> uint(2)));
    int _779 = int(_775) & 3;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[int(_777)][_779];
    int _783 = int(_775) + 1;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    int _787 = _783 & 3;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[int(_785)][_787];
    float _791 = _706 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _712 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _797 = _718 * _734;
    float _799 = _700 * _734;
    float _801 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[127].x, _795);
    int _803 = _770 + 48;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    uint _807 = uint(int(uint(int(_805)) >> uint(2)));
    int _809 = int(_805) & 3;
    float _811 = (*spvDescriptorSet0.vp_c15)._m0[int(_807)][_809];
    int _813 = int(_805) + 1;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    int _817 = _813 & 3;
    float _819 = (*spvDescriptorSet0.vp_c15)._m0[int(_815)][_817];
    float _821 = _706 * 6.283185482025146484375;
    float _823 = sin(_821);
    float _825 = _700 * _766;
    float _827 = _718 * _766;
    float _829 = fma(_218, (*spvDescriptorSet0.vp_c15)._m0[127].z, _801);
    float _831 = _829 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _833 = _718 * _793;
    float _835 = trunc(_768);
    int _837 = int(_835);
    float _839 = _700 * _793;
    float _841 = _766 * _793;
    float _843 = _734 * _793;
    float _845 = _839 * _728;
    int _847 = _770 + 64;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    uint _851 = uint(int(uint(int(_849)) >> uint(2)));
    int _853 = int(_849) & 3;
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[int(_851)][_853];
    int _857 = int(_849) + 1;
    uint _859 = uint(int(uint(_857) >> uint(2)));
    int _861 = _857 & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    float _865 = -_797;
    float _867 = fma(_823, _825, _865);
    float _869 = -_825;
    float _871 = fma(_823, _797, _869);
    float _873 = _833 * _728;
    float _875 = fma(_823, _827, _799);
    float _877 = trunc(_831);
    int _879 = int(_877);
    float _881 = -_728;
    float _883 = _823 * _881;
    float _885 = fma(_823, _799, _827);
    float _887 = fma(_875, _714, _873);
    float _889 = fma(_867, _714, _845);
    int _891 = _770 + 104;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    uint _895 = uint(int(uint(int(_893)) >> uint(2)));
    int _897 = int(_893) & 3;
    float _899 = (*spvDescriptorSet0.vp_c15)._m0[int(_895)][_897];
    int _901 = int(_893) + 1;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    int _905 = _901 & 3;
    float _907 = (*spvDescriptorSet0.vp_c15)._m0[int(_903)][_905];
    float _909 = fma(_841, _714, _883);
    float _911 = fma(_871, _752, _887);
    float _913 = fma(_885, _752, _889);
    int _915 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _917 = _837 + _915;
    int _919 = _917 + 1;
    float _921 = fma(_843, _752, _909);
    float _923 = _911 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _925 = _911 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _927 = _770 + 56;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c15)._m0[int(_931)][_933];
    int _937 = int(_929) + 1;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    int _941 = _937 & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    bool _945 = _919 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _947 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[10].x, _923);
    int _949 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _951 = _879 + _949;
    int _953 = _951 + 1;
    float _955 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[8].x, _925);
    float _957 = _712 * _789;
    float _959 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[10].z, _947);
    int _961 = _919 | _953;
    int _963 = _770 + 72;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    float _981 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[8].z, _955);
    float _983 = _218 + _959;
    bool _985 = _961 < 0;
    bool _987 = _985 || _945;
    float _989 = fma(_216, _781, _957);
    float _991 = _216 + _981;
    float _993 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _995 = _983 + _993;
    bool _997 = _953 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _999 = _997 || _987;
    int _1001 = _770 + 80;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    uint _1005 = uint(int(uint(int(_1003)) >> uint(2)));
    int _1007 = int(_1003) & 3;
    float _1009 = (*spvDescriptorSet0.vp_c15)._m0[int(_1005)][_1007];
    int _1011 = int(_1003) + 1;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    int _1015 = _1011 & 3;
    float _1017 = (*spvDescriptorSet0.vp_c15)._m0[int(_1013)][_1015];
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1021 = _991 + _1019;
    float _1023 = _995 * _995;
    float _1025 = _911 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1027 = _712 * _819;
    float _1029 = fma(_1021, _1021, _1023);
    float _1031 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1025);
    float _1033 = fma(_216, _811, _1027);
    float _1035 = sqrt(_1029);
    float _1037 = fma(_913, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1031);
    uint _1039 = as_type<uint>(_911);
    int _1041 = as_type<int>(_989);
    int _1043 = as_type<int>(_1031);
    float _1045 = _983;
    float _1047 = _1021;
    if (!_999)
    {
        int _1049 = _953 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1051 = _1049 + _919;
        _1039 = uint(_1051);
    }
    uint _1053 = _1039;
    float _1055 = _712 * _863;
    float _1057 = _1027;
    int _1059 = as_type<int>(_855);
    if (!_999)
    {
        float _1061 = floor(_768);
        _1057 = _1061;
    }
    float _1063 = _1057;
    float _1065 = fma(_216, _855, _1055);
    float _1067 = _1065;
    if (!_999)
    {
        uint _1069 = uint(int(uint(int(_1053)) >> uint(2)));
        _1059 = int(_1069);
    }
    int _1071 = _1059;
    float _1073 = fma(_218, _899, _989);
    float _1075 = as_type<float>(_1071);
    if (!_999)
    {
        int _1077 = int(_1053) << 2;
        _1041 = _1077;
    }
    int _1079 = _1041;
    bool _1081 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1083 = _1073 + _907;
    if (!_999)
    {
        int _1085 = 12 & _1079;
        _1043 = _1085;
    }
    int _1087 = _1043;
    float _1089 = fma(_218, _935, _1033);
    int _1091 = as_type<int>(_935);
    float _1093 = _1089;
    if (!_999)
    {
        int _1095 = _1071 << 4;
        int _1097 = _1095 + _1087;
        _1091 = _1097;
    }
    int _1099 = _1091;
    float _1101 = 1.0 / _1083;
    float _1103 = _356 + _1037;
    float _1105 = fma(_218, _971, _1065);
    float _1107 = _1089 + _943;
    if (!_1081)
    {
        _1075 = _991;
    }
    float _1109 = _1075;
    float _1111 = _1105 + _979;
    float _1113 = _1109;
    if (!_1081)
    {
        _1067 = _1103;
    }
    float _1115 = _1067;
    bool _1117 = !_1081;
    float _1119 = _1115;
    if (!_1117)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1125 = _1035 + _1123;
        float _1127 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = rsqrt(_1029);
        float _1131 = _1125 * _1121;
        float _1133 = _1131 * 0.15915493667125701904296875;
        float _1135 = _1133 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1133 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1137 + (-1.0);
        float _1145 = fma(_1141, _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1147 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1129 * _1145;
        float _1151 = fma(_1103, _1137, _1147);
        float _1153 = fma(_1021, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1155 = fma(_995, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1045 = _1155;
        _1113 = _1153;
        _1119 = _1151;
    }
    float _1157 = _1045;
    float _1159 = _1113;
    float _1161 = _1119;
    float _1163 = _1161;
    float _1165 = _1159;
    if (_762)
    {
        _1047 = _1157;
    }
    float _1167 = _1047;
    float _1169 = _1167;
    if (!_762)
    {
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1173 = _356 + _1171;
        float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1177 = _216 + _1175;
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1181 = -_216;
        float _1183 = _1181 + _1159;
        float _1185 = _1173 * _1173;
        float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1189 = _218 + _1187;
        float _1191 = fma(_1177, _1177, _1185);
        float _1193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1195 = fma(_1189, _1189, _1191);
        float _1197 = sqrt(_1195);
        float _1199 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1201 = -_356;
        float _1203 = _1201 + _1161;
        float _1205 = precise::min(_1197, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1207 = _1205 * _1193;
        float _1209 = _1199 * _1207;
        float _1211 = -_218;
        float _1213 = _1211 + _1157;
        float _1215 = fma(_1203, _1209, _356);
        float _1217 = fma(_1183, _1209, _216);
        float _1219 = fma(_1213, _1209, _218);
        _1163 = _1215;
        _1165 = _1217;
        _1169 = _1219;
        _1093 = _1213;
    }
    float _1221 = _1163;
    float _1223 = _1165;
    float _1225 = _1169;
    float _1227 = _1093;
    int _1229 = _770 + 88;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    uint _1233 = uint(int(uint(int(_1231)) >> uint(2)));
    int _1235 = int(_1231) & 3;
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[int(_1233)][_1235];
    int _1239 = int(_1231) + 1;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    int _1243 = _1239 & 3;
    float _1245 = (*spvDescriptorSet0.vp_c15)._m0[int(_1241)][_1243];
    float _1247 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1249 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1251 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1253 = _1107 * _1101;
    float _1255 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1247);
    float _1257 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1249);
    float _1259 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1251);
    float _1261 = _991;
    if (!_999)
    {
        int _1263 = _1099 + 400;
        uint _1265 = uint(int(uint(_1263) >> uint(2)));
        uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
        int _1269 = int(_1265) & 3;
        float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
        _1261 = _1271;
    }
    float _1273 = _1261;
    float _1275 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1255);
    bool _1277 = _1253 >= 0.0;
    float _1279 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1257);
    float _1281 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1283 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1259);
    float _1285 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = _1111 * _1101;
    bool _1289 = _1253 <= 1.0;
    bool _1291 = _1289 && _1277;
    float _1293 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1281);
    float _1295 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1299 = _1287 >= 0.0;
    bool _1301 = _1299 && _1291;
    float _1303 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1293);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1297);
    bool _1309 = _1287 <= 1.0;
    bool _1311 = _1309 && _1301;
    float _1313 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1317 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1321 = _712 * _1017;
    float _1323 = _1227;
    float _1325 = _1313;
    if (!_999)
    {
        float _1327 = floor(_831);
        _1323 = _1327;
    }
    float _1329 = _1323;
    float _1331 = -_1315;
    float _1333 = fma(_1331, _1313, 1.0);
    float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1337 = fma(_216, _1009, _1321);
    float _1339 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1343 = _1333;
    if (_1311)
    {
        float _1345 = float(_750);
        _1325 = _1345;
    }
    float _1347 = _1325;
    float _1349 = log2(_1333);
    float _1351 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1353 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1341);
    float _1355 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1357 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1353);
    float _1359 = 1.0 / _1335;
    float _1361 = _1347;
    if (!_999)
    {
        float _1363 = -_1329;
        float _1365 = _831 + _1363;
        _1343 = _1365;
    }
    float _1367 = _1343;
    float _1369 = fma(_218, _1237, _1337);
    float _1371 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1355);
    float _1373 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1357);
    float _1375 = _1369 + _1245;
    float _1377 = _1245;
    if (!_999)
    {
        float _1379 = -_1063;
        float _1381 = _768 + _1379;
        _1377 = _1381;
    }
    float _1383 = _1377;
    float _1385 = _1339;
    if (_1311)
    {
        float _1387 = rint(_1347);
        float _1389 = precise::max(_1387, 0.0);
        uint _1391 = uint(_1389);
        uint _1393 = clamp(_1391, 0u, 65535u);
        _1385 = as_type<float>(_1393);
    }
    float _1395 = _1385;
    float _1397 = _1349 * 0.693147182464599609375;
    float _1399 = _1375 * _1101;
    float _1401 = _1375;
    if (!_999)
    {
        float _1403 = rint(_1273);
        float _1405 = precise::max(_1403, 0.0);
        uint _1407 = uint(_1405);
        uint _1409 = clamp(_1407, 0u, 65535u);
        _1401 = as_type<float>(_1409);
    }
    float _1411 = _1401;
    float _1413 = _1371 * _1359;
    float _1415 = _1373 * _1359;
    float _1417 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1419 = fma(_1413, 0.5, 0.5);
    float _1421 = fma(_1415, -0.5, 0.5);
    float _1423 = _1321;
    if (_1311)
    {
        float3 _4539 = float3(_1253, _1287, float(as_type<int>(_1395)));
        float3 _4543 = select(_4539, float3(0.0), isnan(_4539));
        float _1425 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4543.xy, uint(rint(_4543.z)), _1399, level(0.0));
        _1423 = _1425;
    }
    float _1427 = _1423;
    float3 _4553 = float3(_1419, _1421, _1417);
    float _1429 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4553, float3(0.0), isnan(_4553)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4553, float3(0.0), isnan(_4553)), level(0.0)).x;
    float3 _4562 = float3(_1419, _1421, _1417);
    float4 _1432 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4562, float3(0.0), isnan(_4562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4562, float3(0.0), isnan(_4562)), level(0.0)).xyzw;
    float _1434 = _1432.x;
    float _1436 = _1432.y;
    float _1438 = _1432.z;
    float _1440 = _1432.w;
    float _1442 = _1397;
    if (!_999)
    {
        float3 _4585 = float3(_1383, _1367, float(as_type<int>(_1411)));
        float3 _4587 = select(_4585, float3(0.0), isnan(_4585));
        float _1444 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4587.xy, uint(rint(_4587.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4587.xy, uint(rint(_4587.z)), level(0.0)).x;
        _1442 = _1444;
    }
    float _1446 = _1442;
    if (_999)
    {
        _1361 = 1.0;
    }
    float _1448 = _1361;
    float _1450 = _1448;
    if (!_999)
    {
        int _1452 = int(_1053) << 4;
        int _1454 = _1452 + 2048;
        uint _1456 = uint(int(uint(_1454) >> uint(2)));
        uint _1458 = uint(int(uint(int(_1456)) >> uint(2)));
        int _1460 = int(_1456) & 3;
        float _1462 = (*spvDescriptorSet0.vp_c15)._m0[int(_1458)][_1460];
        int _1464 = int(_1456) + 1;
        uint _1466 = uint(int(uint(_1464) >> uint(2)));
        int _1468 = _1464 & 3;
        float _1470 = (*spvDescriptorSet0.vp_c15)._m0[int(_1466)][_1468];
        int _1472 = _1454 + 8;
        uint _1474 = uint(int(uint(_1472) >> uint(2)));
        uint _1476 = uint(int(uint(int(_1474)) >> uint(2)));
        int _1478 = int(_1474) & 3;
        float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
        int _1482 = int(_1474) + 1;
        uint _1484 = uint(int(uint(_1482) >> uint(2)));
        int _1486 = _1482 & 3;
        float _1488 = (*spvDescriptorSet0.vp_c15)._m0[int(_1484)][_1486];
        float _1490 = _712 * _1470;
        float _1492 = fma(_216, _1462, _1490);
        float _1494 = fma(_218, _1480, _1492);
        float _1496 = _1494 + _1488;
        float _1498 = precise::clamp(_1496, 0.0, 1.0);
        float _1500 = -_1498;
        float _1502 = _1500 + _1446;
        float _1504 = fma(_1502, 500.0, 1.5);
        float _1506 = exp2(_1504);
        float _1508 = 0.0 + _1506;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        _742 = _1490;
        _1450 = _1510;
    }
    float _1512 = _742;
    float _1514 = _1450;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1221 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1223 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1225 + _1524;
    float _1528 = _1518 * _1518;
    float _1530 = fma(_1522, _1522, _1528);
    float _1532 = fma(_1526, _1526, _1530);
    float _1534 = rsqrt(_1532);
    float _1536 = sqrt(_1532);
    float _1538 = _1522 * _1534;
    float _1540 = _1526 * _1534;
    float _1542 = _1518 * _1534;
    float _1544 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 + _1550;
    float _1554 = sqrt(_1552);
    bool _1556 = _1554 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = _1554 + _1558;
    float _1562 = _216;
    float _1564 = _1552;
    float _1566 = _1560;
    float _1568 = _1534;
    float _1570 = _1544;
    float _1572 = _1546;
    float _1574 = _1548;
    float _1576 = _1550;
    if (_1556)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1562 = _1578;
    }
    float _1580 = _1562;
    if (_1556)
    {
        float _1582 = rsqrt(_1552);
        _1564 = _1582;
    }
    float _1584 = _1564;
    if (_1556)
    {
        float _1586 = _1560 * _1580;
        _1566 = _1586;
    }
    float _1588 = _1566;
    if (_1556)
    {
        float _1590 = _1588 * 0.15915493667125701904296875;
        _410 = _1590;
    }
    float _1592 = _410;
    float _1594 = _1580;
    if (_1556)
    {
        float _1596 = _1592 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1594 = _1598;
    }
    float _1600 = _1594;
    float _1602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1604 = precise::max(0.0, _1602);
    float _1606 = _1512;
    float _1608 = _1604;
    if (_1556)
    {
        float _1610 = _1592 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1542;
    float _1618 = -_1604;
    float _1620 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1618);
    if (_1556)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1622;
    }
    float _1624 = _1568;
    float _1626 = _1600;
    float _1628 = _1624;
    if (_1556)
    {
        float _1630 = fma(_1600, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    if (!_1556)
    {
        _1628 = _1620;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    if (_1556)
    {
        float _1640 = _1614 + (-1.0);
        _1608 = _1640;
    }
    float _1642 = _1608;
    float _1644 = 0.0;
    if (_1556)
    {
        float _1646 = _1584 * _1632;
        _1644 = _1646;
    }
    float _1648 = _1644;
    if (_1556)
    {
        float _1650 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1650;
    }
    float _1652 = _1634;
    if (_1556)
    {
        float _1654 = _1544 * _1648;
        _1570 = _1654;
    }
    float _1656 = _1570;
    if (_1556)
    {
        float _1658 = _1546 * _1648;
        _1572 = _1658;
    }
    float _1660 = _1572;
    if (_1556)
    {
        float _1662 = fma(_1620, _1614, _1652);
        _1638 = _1662;
    }
    float _1664 = _1638;
    if (_1556)
    {
        float _1666 = _1656 * _1656;
        _1574 = _1666;
    }
    float _1668 = _1574;
    if (_1556)
    {
        float _1670 = _1660 * _1660;
        _1576 = _1670;
    }
    float _1672 = _1576;
    float _1674 = fma(_1664, _1664, _1668);
    float _1676 = _1674 + _1672;
    float _1678 = rsqrt(_1676);
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1682 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1680);
    float _1684 = precise::clamp(_1682, 0.0, 1.0);
    float _1686 = -_1684;
    float _1688 = _1686 + 1.0;
    float _1690 = abs(_1688);
    float _1692 = log2(_1690);
    float _1694 = _1678 * _1656;
    float _1696 = _1678 * _1664;
    float _1698 = _1678 * _1660;
    float _1700 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1702 = -_1700;
    float _1704 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = -_1698;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1710 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1712 = fma(_1708, -0.5, 0.5);
    float _1714 = fma(_1708, 0.5, 0.5);
    float _1716 = _1696 + 1.0;
    float _1718 = exp2(_1710);
    float _1720 = fma(_1714, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1722 = fma(_1714, _1720, -0.212114393711090087890625);
    float _1724 = sqrt(_1712);
    float _1726 = fma(_1714, _1722, 1.570728778839111328125);
    float _1728 = -_1696;
    float _1730 = fma(_1718, _1716, _1728);
    float _1732 = fma(_1730, 0.5, 0.5);
    float _1734 = _1724 * 0.636619746685028076171875;
    float _1736 = -_1726;
    float _1738 = fma(_1734, _1736, 1.0);
    float2 _5042 = float2(_1738, _1732);
    float3 _1742 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5042, float2(0.0), isnan(_5042)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5042, float2(0.0), isnan(_5042)), level(0.0)).xyz;
    float _1744 = _1742.x;
    float _1746 = _1742.y;
    float _1748 = _1742.z;
    float _1750 = abs(_690);
    float _1752 = log2(_1750);
    float _1754 = in.m_71.x;
    float _1756 = in.m_71.y;
    float _1758 = in.m_71.z;
    bool _1760 = _652 != 0.0;
    bool _1762 = isnan(_652);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    float _1770 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1772 = -_236;
    float _1774 = _1772 + 1.0;
    bool _1776 = _650 == 0.0;
    bool _1778 = !_1768;
    bool _1780 = _1776 && _1778;
    float _1782 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1770);
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1786 = _654 == 0.0;
    bool _1788 = _1786 && _1780;
    float _1790 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1782);
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1794 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1796 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1804 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1790);
    float _1806 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1808 = exp2(_1796);
    out.m_73.x = _1223;
    out.m_73.y = _1221;
    out.m_73.z = _1225;
    float _1810 = _1756;
    float _1812 = _1754;
    float _1814 = _1758;
    float _1816 = _1804;
    if (!_1788)
    {
        float _1818 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1756);
        _1810 = _1818;
    }
    float _1820 = _1810;
    if (!_1788)
    {
        float _1822 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1754);
        _1812 = _1822;
    }
    float _1824 = _1812;
    if (!_1788)
    {
        float _1826 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1758);
        _1814 = _1826;
    }
    float _1828 = _1814;
    float _1830 = _833 * _1820;
    float _1832 = -_1820;
    float _1834 = _823 * _1832;
    out.m_75.x = _1794;
    out.m_75.y = _1800;
    out.m_75.z = _1806;
    out.m_75.w = _1802;
    float _1836 = fma(_875, _1824, _1830);
    float _1838 = _839 * _1820;
    float _1840 = fma(_841, _1824, _1834);
    bool _1842 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1844 = isnan(_1536);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1850 = _1846 || _1848;
    float _1852 = fma(_871, _1828, _1836);
    float _1854 = fma(_1808, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1856 = precise::clamp(_1854, 0.0, 1.0);
    float _1858 = fma(_867, _1824, _1838);
    float _1860 = fma(_843, _1828, _1840);
    float _1862 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1864 = fma(_1856, -2.0, 3.0);
    float _1866 = _1856 * _1856;
    float _1868 = fma(_885, _1828, _1858);
    float _1870 = fma(_1860, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1862);
    float _1872 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1874 = _1866 * _1864;
    float _1876 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1878 = fma(_1868, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1870);
    bool _1880 = _690 <= 8000.0;
    bool _1882 = isnan(_690);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(8000.0);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -_1874;
    float _1894 = _1892 + 1.0;
    float _1896 = exp2(_1872);
    float _1898 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1900 = _1804 + _1335;
    float _1902 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1874);
    float _1904 = fma(_1860, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1876);
    float _1906 = fma(_1860, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1898);
    float _1908 = _1900 * 0.5;
    float _1910 = _1890 * _1902;
    float _1912 = _1900;
    if (!_1311)
    {
        _1912 = 1.0;
    }
    float _1914 = _1912;
    float _1916 = fma(_1868, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1904);
    float _1918 = _1914;
    if (_1311)
    {
        bool _1920 = _1427 >= _1399;
        bool _1922 = isnan(_1427);
        bool _1924 = _1920 || _1922;
        bool _1926 = isnan(_1399);
        bool _1928 = _1924 || _1926;
        float _1930 = float(_1928);
        _1918 = _1930;
    }
    float _1932 = _1918;
    float _1934 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1936 = fma(_1868, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1906);
    float _1938 = _1774 * _1934;
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1896;
    float _1944 = _1942 + 1.0;
    float _1946 = _1932 * _1514;
    float _1948 = -_1940;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1954 = -_1946;
    float _1956 = fma(_1954, _1950, 1.0);
    float _1958 = precise::clamp(_1956, 0.0, 1.0);
    float _1960 = _1952 * _1429;
    out.gl_Position.x = _1371;
    out.gl_Position.y = _1373;
    out.gl_Position.z = _1804;
    out.gl_Position.w = _1335;
    out.m_79.z = _1908;
    out.m_79.w = _1335;
    float _1962 = _1440 * _1960;
    float _1964 = -_1952;
    float _1966 = _1964 + 1.0;
    out.m_81.x = _1916;
    out.m_81.y = _1936;
    out.m_81.z = _1878;
    float _1968 = _1952;
    float _1970 = _1371;
    float _1972 = _1966;
    float _1974 = _1958;
    float _1976 = _1962;
    if (!_1850)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1978 = _1968;
    float _1980 = _1440 * _1966;
    float _1982 = _1958 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1984 = _1978;
    float _1986 = _1978;
    if (!_1850)
    {
        _1816 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1988 = _1816;
    float _1990 = _1988;
    float _1992 = _1988;
    if (!_1850)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1994 = _1970;
    out.m_83.x = _1982;
    float _1996 = _1994;
    float _1998 = _1994;
    if (!_1850)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2000 = _1972;
    float _2002 = _2000;
    float _2004 = _2000;
    if (!_1850)
    {
        _1974 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2006 = _1974;
    float _2008 = _1748 * _1960;
    float _2010 = fma(_1744, _1962, _1434);
    float _2012 = fma(_1746, _1962, _1436);
    float _2014 = _2006;
    float _2016 = _2006;
    if (!_1850)
    {
        _1976 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2018 = _1976;
    float _2020 = fma(_1440, _2008, _1438);
    out.m_85.x = _2010;
    out.m_85.y = _2012;
    out.m_85.z = _2020;
    out.m_85.w = _1980;
    bool _2022 = !_1850;
    float _2024 = _2018;
    float _2026 = _2018;
    if (!_2022)
    {
        bool _2028 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2030 = isnan(_1536);
        bool _2032 = _2028 || _2030;
        bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2036 = _2032 || _2034;
        if (!_2036)
        {
            float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2040 = _1536 + _2038;
            float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2044 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2042;
            float _2046 = 1.0 / _2044;
            float _2048 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2056 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2062 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2068 = _2040 * _2046;
            float _2070 = precise::clamp(_2068, 0.0, 1.0);
            float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2076 = fma(_2070, _2050, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2078 = fma(_2070, _2074, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2080 = fma(_2070, _2054, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2082 = fma(_2070, _2058, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2084 = fma(_2070, _2062, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2086 = fma(_2070, _2066, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1992 = _2076;
            _2026 = _2084;
            _1986 = _2078;
            _2004 = _2082;
            _1998 = _2080;
            _2016 = _2086;
            _2088 = true;
        }
        else
        {
            bool _2090 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2092 = isnan(_1536);
            bool _2094 = _2090 || _2092;
            bool _2096 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2098 = _2094 || _2096;
            if (!_2098)
            {
                _1984 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2100 = _1984;
            _1986 = _2100;
            if (!_2098)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2102 = _1990;
            _1992 = _2102;
            if (!_2098)
            {
                _1996 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2104 = _1996;
            _1998 = _2104;
            if (!_2098)
            {
                _2002 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2106 = _2002;
            _2004 = _2106;
            if (!_2098)
            {
                _2024 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2108 = _2024;
            _2026 = _2108;
            if (!_2098)
            {
                _2014 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2110 = _2014;
            bool _2112 = !_2098;
            _2016 = _2110;
            if (!_2112)
            {
                bool _2114 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2116 = isnan(_1536);
                bool _2118 = _2114 || _2116;
                bool _2120 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2122 = _2118 || _2120;
                if (!_2122)
                {
                    float _2124 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2126 = _1536 + _2124;
                    float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2128;
                    float _2132 = 1.0 / _2130;
                    float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2136 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2154 = _2126 * _2132;
                    float _2156 = precise::clamp(_2154, 0.0, 1.0);
                    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2162 = fma(_2156, _2136, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2164 = fma(_2156, _2160, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2166 = fma(_2156, _2140, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2168 = fma(_2156, _2144, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2170 = fma(_2156, _2148, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2172 = fma(_2156, _2152, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1992 = _2162;
                    _2026 = _2170;
                    _1986 = _2164;
                    _2004 = _2168;
                    _1998 = _2166;
                    _2016 = _2172;
                    _2088 = true;
                }
                else
                {
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2026 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1986 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2004 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1998 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2016 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2088 = false;
    float _2174 = _1992;
    float _2176 = _2026;
    float _2178 = _1986;
    float _2180 = _2004;
    float _2182 = _1998;
    float _2184 = _2016;
    float _2186 = fma(_1936, -0.5, 0.5);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = -_2174;
    float _2192 = _2190 + _2176;
    float _2194 = -_2178;
    float _2196 = _2194 + _2180;
    float _2198 = -_2182;
    float _2200 = _2198 + _2184;
    bool _2202 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2204 = fma(_2188, _2192, _2174);
    float _2206 = fma(_2188, _2196, _2178);
    float _2208 = fma(_2188, _2200, _2182);
    float _2210 = _2204 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2212 = fma(_2206, 0.298911988735198974609375, _2210);
    float _2214 = fma(_2208, 0.114477999508380889892578125, _2212);
    out.m_87.x = 0.0;
    float _2216 = -_2214;
    float _2218 = _2206 + _2216;
    float _2220 = -_2214;
    float _2222 = _2204 + _2220;
    float _2224 = -_2214;
    float _2226 = _2208 + _2224;
    float _2228 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2230 = fma(_2218, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2214);
    float _2232 = fma(_2222, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2214);
    float _2234 = fma(_2226, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2214);
    out.m_89.x = 0.0;
    out.m_83.w = _2228;
    out.m_91.x = _2230;
    out.m_91.y = _2232;
    out.m_91.z = _2234;
    if (!_2202)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2236 = -_1221;
    float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2240 = -_1223;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2244 = -_1225;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2242, _2242, _2248);
    float _2252 = fma(_2246, _2246, _2250);
    float _2254 = rsqrt(_2252);
    float _2256 = _2238 * _2254;
    float _2258 = _2242 * _2254;
    float _2260 = _2246 * _2254;
    float _2262 = sqrt(_2252);
    float _2264 = -_1542;
    float _2266 = _2264 + _2256;
    float _2268 = -_1538;
    float _2270 = _2268 + _2258;
    float _2272 = -_1540;
    float _2274 = _2272 + _2260;
    float _2276 = _2266 * _2266;
    float _2278 = fma(_2270, _2270, _2276);
    float _2280 = fma(_2274, _2274, _2278);
    float _2282 = -_2262;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2286 = rsqrt(_2280);
    float _2288 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = abs(_2290);
    float _2294 = log2(_2292);
    float _2296 = _2266 * _2286;
    float _2298 = _2270 * _2286;
    float _2300 = _2274 * _2286;
    float _2302 = _1936 * _2296;
    float _2304 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = _1936 * _2256;
    float _2310 = fma(_1916, _2298, _2302);
    float _2312 = _2306 * _2306;
    float _2314 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2316 = fma(_1916, _2258, _2308);
    float _2318 = fma(_1878, _2300, _2310);
    float _2320 = precise::clamp(_2318, 0.0, 1.0);
    float _2322 = _2312 + (-1.0);
    float _2324 = fma(_1878, _2260, _2316);
    float _2326 = precise::clamp(_2324, 0.0, 1.0);
    float _2328 = _2320 * _2320;
    float _2330 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2332 = exp2(_2314);
    float _2334 = fma(_2328, _2322, 1.0);
    float _2336 = -_2256;
    float _2338 = -_2330;
    float _2340 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2338);
    float _2342 = _2334 * _2334;
    float _2344 = -_2260;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2340);
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2350 = _2346 + _2348;
    float _2352 = 1.0 / _2342;
    float _2354 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = _2332 * _2356;
    float _2360 = _2326 * _2358;
    float _2362 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2364 = _2312 * _2352;
    float _2366 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2368 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2370 = _2360 * _2364;
    out.m_87.x = _2366;
    out.m_87.y = _2362;
    out.m_87.z = _2368;
    float _2372 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2374 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2376 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2372;
    out.m_89.y = _2374;
    out.m_89.z = _2376;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

