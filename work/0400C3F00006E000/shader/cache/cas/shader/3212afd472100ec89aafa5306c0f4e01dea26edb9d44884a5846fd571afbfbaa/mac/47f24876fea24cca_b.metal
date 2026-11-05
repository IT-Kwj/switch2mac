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
    float4 m_81 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2218 = false;
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
        float _2563 = as_type<float>(_132);
        out.gl_Position.z = _2563;
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
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_59.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2632 = as_type<float>(_170);
        out.gl_Position.z = _2632;
    }
    if (_164)
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
    float2 _2759 = float2(_236, _240);
    float _242 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2759, float2(0.0), isnan(_2759)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2759, float2(0.0), isnan(_2759)), level(0.0)).x;
    float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _246 = log2(_244);
    float _248 = in.m_63.z;
    float _250 = in.m_63.x;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = in.m_63.y;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    float _266 = 1.0 / _254;
    float _268 = _246 * _150;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _272 = 1.0 + _270;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _276 = _274 != 0;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _284 = _282 != 0;
    float _286 = 1.0 / _258;
    float _288 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _202 + _290;
    bool _294 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _296 = isnan(1.0);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _302 = _298 || _300;
    float _304 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _288);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _202 + _306;
    bool _310 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _312 = isnan(0.0);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _318 = _314 || _316;
    float _320 = exp2(_268);
    float _322 = _248 * 2.0;
    float _324 = _292 * _266;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = _202 + _326;
    float _330 = _260 + _248;
    float _332 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _304);
    float _334 = 1.0 / _264;
    float _336 = _308 * _286;
    float _338 = _330 + (-1.0);
    float _340 = _250 + _260;
    float _342 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _346 = _340 + (-1.0);
    float _348 = 1.0 / _272;
    float _350 = _250 * 2.0;
    float _352 = -_320;
    float _354 = _352 + 1.0;
    float _356 = _250 + _248;
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _360 = _248 + (-0.5);
    float _362 = _318 ? _354 : 0.0;
    float _364 = floor(_322);
    float _366 = _260 * 2.0;
    float _368 = _328 * _334;
    float _370 = _356 + (-1.0);
    float _372 = floor(_350);
    int _374 = 2;
    float _376 = _222;
    if (_302)
    {
        float _378 = _362 * _348;
        _154 = _378;
    }
    float _380 = _154;
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    bool _388 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _390 = isnan(_202);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = floor(_366);
    bool _406 = _364 >= 0.0;
    bool _408 = isnan(_364);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = -_398;
    float _418 = _416 + 1.0;
    bool _420 = _364 > 0.0;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    int _426 = _414 ? 0 : 1;
    bool _428 = _372 >= 0.0;
    bool _430 = isnan(_372);
    bool _432 = _428 || _430;
    bool _434 = isnan(0.0);
    bool _436 = _432 || _434;
    float _438 = fma(_424, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _440 = _372 > 0.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _442;
    int _446 = _436 ? 0 : 1;
    bool _448 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _450 = isnan(_202);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = fma(_444, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _462 = _404 > 0.0;
    bool _464 = _404 >= 0.0;
    bool _466 = isnan(_404);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = fma(_386, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _480 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_202);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _496 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _498 = isnan(_202);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = fma(_478, _336, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = _458 * _418;
    float _512 = -_458;
    float _514 = _512 + 1.0;
    float _516 = fma(_402, _336, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = -_506;
    float _520 = _518 + 1.0;
    float _522 = fma(_494, _336, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = _506 * _514;
    float _526 = _490 * _520;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _528;
    float _532 = -_490;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _540;
    float _544 = _474 * _526;
    float _546 = _438 * _526;
    float _548 = _460 * _526;
    float _550 = fma(_530, _368, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _552 = fma(_538, _368, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _554 = fma(_542, _368, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _556 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _546);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _548);
    int _562 = _472 ? 0 : 1;
    float _564 = fma(_508, _524, _556);
    bool _566 = !_276;
    int _568 = _566 ? 0 : 1;
    float _570 = _342 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _572 = ~_446;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = fma(_516, _524, _558);
    int _580 = ~_562;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].x, _570);
    int _588 = _576;
    int _590 = _584;
    if (!_440)
    {
        int _592 = ~_446;
        int _594 = _592 + 1;
        _588 = _594;
    }
    int _596 = _588;
    float _598 = fma(_522, _524, _560);
    if (!_462)
    {
        int _600 = ~_562;
        int _602 = _600 + 1;
        _590 = _602;
    }
    int _604 = _590;
    float _606 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].z, _586);
    int _608 = abs(_568);
    float _610 = _342 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _612 = in.m_65.x;
    float _614 = in.m_65.y;
    float _616 = in.m_65.z;
    int _618 = ~_426;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = _606 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _626 = !_280;
    int _628 = _626 ? 0 : 1;
    float _630 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].x, _610);
    int _632 = _622;
    if (!_420)
    {
        int _634 = ~_426;
        int _636 = _634 + 1;
        _632 = _636;
    }
    int _638 = _632;
    float _640 = 1.0 / _624;
    int _642 = abs(_628);
    float _644 = fma(_550, _510, _564);
    float _646 = float(_608);
    float _648 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].z, _630);
    float _650 = float(_638);
    float _652 = fma(_554, _510, _598);
    float _654 = _648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _656 = float(_596);
    float _658 = _646 * _650;
    float _660 = float(_642);
    float _662 = fma(_552, _510, _578);
    bool _664 = !_284;
    int _666 = _664 ? 0 : 1;
    float _668 = _658 * (-2.0);
    float _670 = _654 + _624;
    float _672 = _660 * _656;
    int _674 = abs(_666);
    float _676 = fma(_358, _668, _358);
    float _678 = _250 + (-0.5);
    float _680 = fma(_668, _612, _612);
    float _682 = _670 * _640;
    float _684 = _682 * 0.5;
    float _686 = float(_674);
    float _688 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].x, _680);
    float _690 = _672 * (-2.0);
    float _692 = in.m_67.x;
    float _694 = in.m_67.y;
    float _696 = in.m_67.z;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _700 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[30].w, _698);
    float _702 = fma(_676, _380, _688);
    float _704 = float(_604);
    float _706 = _260 + (-0.5);
    float _708 = in.m_69.x;
    float _710 = in.m_69.y;
    float _712 = in.m_69.z;
    float _714 = fma(_690, _614, _614);
    float _716 = 1.0 / _700;
    float _718 = _686 * _704;
    float _720 = fma(_344, _690, _344);
    float _722 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[196].y, _714);
    float _724 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[146].x, _644);
    float _726 = _718 * (-2.0);
    float _728 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[146].y, _662);
    float _730 = fma(_720, _380, _722);
    float _732 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[146].z, _652);
    float _734 = fma(_726, _616, _616);
    float _736 = fma(_382, _726, _382);
    float _738 = _702 * 0.15915493667125701904296875;
    float _740 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _742 = _738 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = _342 + _740;
    float _748 = _724 * _692;
    float _750 = _730 * 0.15915493667125701904296875;
    float _752 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[196].z, _734);
    float _754 = _732 * _696;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _758 = _716 * _756;
    float _760 = fma(_736, _380, _752);
    float _762 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _708);
    float _766 = _728 * _694;
    float _768 = _760 * 0.15915493667125701904296875;
    bool _770 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _772 = _738 * 6.283185482025146484375;
    float _774 = cos(_772);
    bool _776 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _778 = _762 * _764;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _710);
    float _782 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _784 = !_770;
    int _786 = _784 ? 0 : 1;
    float _788 = _746 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _790 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = _750 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = _782 * _780;
    float _798 = _746 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _800 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    float _802 = _746;
    if (!_770)
    {
        _374 = 1;
    }
    int _804 = _374;
    float _806 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].x, _788);
    float _808 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].x, _798);
    int _810 = _804;
    if (!_776)
    {
        _810 = _786;
    }
    int _812 = _810;
    float _814 = _750 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _790 * _800;
    float _820 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].z, _808);
    int _822 = _812 << 6;
    float _824 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].z, _806);
    bool _826 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _828 = isnan(0.5);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _834 = _830 || _832;
    float _836 = _820 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _838 = _822 + 96;
    uint _841 = uint(int(uint(_838) >> uint(2)));
    uint _843 = uint(int(uint(int(_841)) >> uint(2)));
    int _845 = int(_841) & 3;
    float _847 = (*spvDescriptorSet0.vp_c15)._m0[int(_843)][_845];
    int _849 = int(_841) + 1;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    int _853 = _849 & 3;
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[int(_851)][_853];
    float _857 = _768 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = _774 * _794;
    float _863 = _744 * _794;
    float _865 = _824 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _867 = _822 + 48;
    uint _869 = uint(int(uint(_867) >> uint(2)));
    uint _871 = uint(int(uint(int(_869)) >> uint(2)));
    int _873 = int(_869) & 3;
    float _875 = (*spvDescriptorSet0.vp_c15)._m0[int(_871)][_873];
    int _877 = int(_869) + 1;
    uint _879 = uint(int(uint(_877) >> uint(2)));
    int _881 = _877 & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    float _885 = _768 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = _744 * _816;
    float _891 = _774 * _816;
    float _893 = _774 * _859;
    float _895 = _744 * _859;
    float _897 = trunc(_865);
    int _899 = int(_897);
    float _901 = _816 * _859;
    float _903 = _794 * _859;
    float _905 = _895 * _796;
    int _907 = _822 + 64;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    uint _911 = uint(int(uint(int(_909)) >> uint(2)));
    int _913 = int(_909) & 3;
    float _915 = (*spvDescriptorSet0.vp_c15)._m0[int(_911)][_913];
    int _917 = int(_909) + 1;
    uint _919 = uint(int(uint(_917) >> uint(2)));
    int _921 = _917 & 3;
    float _923 = (*spvDescriptorSet0.vp_c15)._m0[int(_919)][_921];
    float _925 = -_861;
    float _927 = fma(_887, _889, _925);
    float _929 = -_889;
    float _931 = fma(_887, _861, _929);
    float _933 = _893 * _796;
    float _935 = fma(_887, _891, _863);
    float _937 = trunc(_836);
    int _939 = int(_937);
    float _941 = -_796;
    float _943 = _887 * _941;
    float _945 = fma(_887, _863, _891);
    float _947 = fma(_935, _778, _933);
    float _949 = fma(_927, _778, _905);
    int _951 = _822 + 104;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    uint _955 = uint(int(uint(int(_953)) >> uint(2)));
    int _957 = int(_953) & 3;
    float _959 = (*spvDescriptorSet0.vp_c15)._m0[int(_955)][_957];
    int _961 = int(_953) + 1;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    int _965 = _961 & 3;
    float _967 = (*spvDescriptorSet0.vp_c15)._m0[int(_963)][_965];
    float _969 = fma(_901, _778, _943);
    float _971 = fma(_931, _818, _947);
    int _973 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _975 = _899 + _973;
    int _977 = _975 + 1;
    float _979 = fma(_903, _818, _969);
    float _981 = fma(_945, _818, _949);
    float _983 = _971 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _985 = _971 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _987 = _822 + 56;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.vp_c15)._m0[int(_999)][_1001];
    bool _1005 = _977 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1007 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[10].x, _983);
    int _1009 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1011 = _939 + _1009;
    int _1013 = _1011 + 1;
    float _1015 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[8].x, _985);
    float _1017 = _746 * _855;
    float _1019 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1007);
    int _1021 = _977 | _1013;
    int _1023 = _822 + 72;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    float _1041 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1015);
    float _1043 = _224 + _1019;
    bool _1045 = _1021 < 0;
    bool _1047 = _1045 || _1005;
    float _1049 = fma(_222, _847, _1017);
    float _1051 = _222 + _1041;
    float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1055 = _1043 + _1053;
    bool _1057 = _1013 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1059 = _1057 || _1047;
    int _1061 = _822 + 80;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
    int _1067 = int(_1063) & 3;
    float _1069 = (*spvDescriptorSet0.vp_c15)._m0[int(_1065)][_1067];
    int _1071 = int(_1063) + 1;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    int _1075 = _1071 & 3;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[int(_1073)][_1075];
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1081 = _1051 + _1079;
    float _1083 = _1055 * _1055;
    float _1085 = _971 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1087 = _746 * _883;
    float _1089 = fma(_1081, _1081, _1083);
    float _1091 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1085);
    float _1093 = fma(_222, _875, _1087);
    float _1095 = sqrt(_1089);
    float _1097 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1091);
    int _1099 = as_type<int>(_971);
    int _1101 = as_type<int>(_1049);
    float _1103 = _1051;
    float _1105 = _1043;
    float _1107 = _1081;
    if (!_1059)
    {
        int _1109 = _1013 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1111 = _1109 + _977;
        _1099 = _1111;
    }
    int _1113 = _1099;
    float _1115 = _746 * _923;
    float _1117 = _342 + _1097;
    float _1119 = fma(_222, _915, _1115);
    float _1121 = _979;
    int _1123 = as_type<int>(_967);
    float _1125 = _1119;
    float _1127 = as_type<float>(_1113);
    if (!_1059)
    {
        float _1129 = floor(_865);
        _1121 = _1129;
    }
    float _1131 = _1121;
    float _1133 = fma(_224, _959, _1049);
    if (!_1059)
    {
        int _1135 = _1113 << 2;
        _1101 = _1135;
    }
    int _1137 = _1101;
    bool _1139 = _1095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1141 = _1133 + _967;
    int _1143 = _1137;
    if (!_1059)
    {
        uint _1145 = uint(int(uint(_1113) >> uint(2)));
        _1123 = int(_1145);
    }
    int _1147 = _1123;
    if (!_1059)
    {
        int _1149 = 12 & _1137;
        _1143 = _1149;
    }
    int _1151 = _1143;
    float _1153 = 1.0 / _1141;
    float _1155 = fma(_224, _995, _1093);
    float _1157 = _1155 + _1003;
    float _1159 = fma(_224, _1031, _1119);
    int _1161 = as_type<int>(_1031);
    float _1163 = _1159;
    if (!_1059)
    {
        int _1165 = _1147 << 4;
        int _1167 = _1165 + _1151;
        _1161 = _1167;
    }
    int _1169 = _1161;
    if (!_1139)
    {
        _1125 = _1117;
    }
    float _1171 = _1125;
    float _1173 = _1159 + _1039;
    bool _1175 = !_1139;
    float _1177 = _1171;
    if (!_1175)
    {
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1183 = _1095 + _1181;
        float _1185 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1187 = rsqrt(_1089);
        float _1189 = _1183 * _1179;
        float _1191 = _1189 * 0.15915493667125701904296875;
        float _1193 = _1191 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = _1191 * 6.283185482025146484375;
        float _1199 = sin(_1197);
        float _1201 = _1195 + (-1.0);
        float _1203 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = fma(_1199, _1185, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1207 = fma(_1117, _1195, _1203);
        float _1209 = _1187 * _1205;
        float _1211 = fma(_1081, _1209, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1213 = fma(_1055, _1209, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1103 = _1211;
        _1105 = _1213;
        _1177 = _1207;
        _1163 = _1199;
    }
    float _1215 = _1103;
    float _1217 = _1105;
    float _1219 = _1177;
    float _1221 = _1163;
    float _1223 = _1221;
    float _1225 = _1219;
    if (_834)
    {
        _1223 = _1215;
    }
    float _1227 = _1223;
    float _1229 = _1227;
    if (_834)
    {
        _1107 = _1217;
    }
    float _1231 = _1107;
    float _1233 = _1231;
    if (!_834)
    {
        float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1237 = _342 + _1235;
        float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1241 = _222 + _1239;
        float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1245 = -_224;
        float _1247 = _1245 + _1217;
        float _1249 = _1237 * _1237;
        float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1253 = _224 + _1251;
        float _1255 = fma(_1241, _1241, _1249);
        float _1257 = fma(_1253, _1253, _1255);
        float _1259 = -_342;
        float _1261 = _1259 + _1219;
        float _1263 = sqrt(_1257);
        float _1265 = precise::min(_1263, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1267 = _1265 * _1243;
        float _1269 = -_222;
        float _1271 = _1269 + _1215;
        float _1273 = fma(_1261, _1267, _342);
        float _1275 = fma(_1271, _1267, _222);
        float _1277 = fma(_1247, _1267, _224);
        _1225 = _1273;
        _1229 = _1275;
        _1233 = _1277;
    }
    float _1279 = _1225;
    float _1281 = _1229;
    float _1283 = _1233;
    int _1285 = _822 + 88;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    uint _1289 = uint(int(uint(int(_1287)) >> uint(2)));
    int _1291 = int(_1287) & 3;
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[int(_1289)][_1291];
    int _1295 = int(_1287) + 1;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    int _1299 = _1295 & 3;
    float _1301 = (*spvDescriptorSet0.vp_c15)._m0[int(_1297)][_1299];
    float _1303 = _1157 * _1153;
    float _1305 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1307 = _1173 * _1153;
    float _1309 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1313 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1305);
    bool _1315 = _1303 >= 0.0;
    float _1317 = _1215;
    if (!_1059)
    {
        int _1319 = _1169 + 400;
        uint _1321 = uint(int(uint(_1319) >> uint(2)));
        uint _1323 = uint(int(uint(int(_1321)) >> uint(2)));
        int _1325 = int(_1321) & 3;
        float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
        _1317 = _1327;
    }
    float _1329 = _1317;
    float _1331 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1333 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1311);
    float _1335 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1313);
    float _1337 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1339 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1331);
    float _1341 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1333);
    float _1343 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1345 = _1303 <= 1.0;
    bool _1347 = _1345 && _1315;
    float _1349 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1351 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1353 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1337);
    float _1355 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1357 = _1307 >= 0.0;
    bool _1359 = _1357 && _1347;
    float _1361 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1365 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1353);
    float _1367 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1355);
    bool _1369 = _1307 <= 1.0;
    bool _1371 = _1369 && _1359;
    float _1373 = -_1363;
    float _1375 = fma(_1373, _1361, 1.0);
    float _1377 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1379 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1367);
    float _1381 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1383 = _746 * _1077;
    float _1385 = _1117;
    float _1387 = _1361;
    if (!_1059)
    {
        float _1389 = floor(_836);
        _1385 = _1389;
    }
    float _1391 = _1385;
    float _1393 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1379);
    float _1395 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1397 = fma(_222, _1069, _1383);
    float _1399 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1395);
    if (_1371)
    {
        float _1401 = float(_812);
        _1387 = _1401;
    }
    float _1403 = _1387;
    float _1405 = 1.0 / _1393;
    float _1407 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1381);
    float _1409 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1411 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1407);
    float _1413 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    float _1415 = fma(_224, _1293, _1397);
    float _1417 = log2(_1375);
    float _1419 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1411);
    float _1421 = _1407;
    if (!_1059)
    {
        float _1423 = -_1391;
        float _1425 = _836 + _1423;
        _1421 = _1425;
    }
    float _1427 = _1421;
    float _1429 = _1415 + _1301;
    float _1431 = _1419 * _1405;
    float _1433 = _1383;
    float _1435 = _1429;
    if (_1371)
    {
        float _1437 = rint(_1403);
        float _1439 = precise::max(_1437, 0.0);
        uint _1441 = uint(_1439);
        uint _1443 = clamp(_1441, 0u, 65535u);
        _1433 = as_type<float>(_1443);
    }
    float _1445 = _1433;
    float _1447 = _1429 * _1153;
    float _1449 = _1413 * _1405;
    float _1451 = fma(_1431, 0.5, 0.5);
    float _1453 = _1447;
    if (!_1059)
    {
        float _1455 = -_1131;
        float _1457 = _865 + _1455;
        _1435 = _1457;
    }
    float _1459 = _1435;
    float _1461 = fma(_1449, -0.5, 0.5);
    float _1463 = _1431;
    if (!_1059)
    {
        float _1465 = rint(_1329);
        float _1467 = precise::max(_1465, 0.0);
        uint _1469 = uint(_1467);
        uint _1471 = clamp(_1469, 0u, 65535u);
        _1463 = as_type<float>(_1471);
    }
    float _1473 = _1463;
    float _1475 = _1417 * 0.693147182464599609375;
    float _1477 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1479 = _1403;
    float _1481 = _1475;
    if (_1371)
    {
        float3 _4746 = float3(_1303, _1307, float(as_type<int>(_1445)));
        float3 _4750 = select(_4746, float3(0.0), isnan(_4746));
        float _1483 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4750.xy, uint(rint(_4750.z)), _1447, level(0.0));
        _1479 = _1483;
    }
    float _1485 = _1479;
    float3 _4760 = float3(_1451, _1461, _1477);
    float _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4760, float3(0.0), isnan(_4760)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4760, float3(0.0), isnan(_4760)), level(0.0)).x;
    float3 _4769 = float3(_1451, _1461, _1477);
    float4 _1490 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4769, float3(0.0), isnan(_4769)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4769, float3(0.0), isnan(_4769)), level(0.0)).xyzw;
    float _1492 = _1490.x;
    float _1494 = _1490.y;
    float _1496 = _1490.z;
    float _1498 = _1490.w;
    float _1500 = _1405;
    if (!_1059)
    {
        float3 _4792 = float3(_1459, _1427, float(as_type<int>(_1473)));
        float3 _4794 = select(_4792, float3(0.0), isnan(_4792));
        float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4794.xy, uint(rint(_4794.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4794.xy, uint(rint(_4794.z)), level(0.0)).x;
        _1500 = _1502;
    }
    float _1504 = _1500;
    if (_1059)
    {
        _1481 = 1.0;
    }
    float _1506 = _1481;
    float _1508 = _1506;
    if (!_1059)
    {
        int _1510 = _1113 << 4;
        int _1512 = _1510 + 2048;
        uint _1514 = uint(int(uint(_1512) >> uint(2)));
        uint _1516 = uint(int(uint(int(_1514)) >> uint(2)));
        int _1518 = int(_1514) & 3;
        float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
        int _1522 = int(_1514) + 1;
        uint _1524 = uint(int(uint(_1522) >> uint(2)));
        int _1526 = _1522 & 3;
        float _1528 = (*spvDescriptorSet0.vp_c15)._m0[int(_1524)][_1526];
        int _1530 = _1512 + 8;
        uint _1532 = uint(int(uint(_1530) >> uint(2)));
        uint _1534 = uint(int(uint(int(_1532)) >> uint(2)));
        int _1536 = int(_1532) & 3;
        float _1538 = (*spvDescriptorSet0.vp_c15)._m0[int(_1534)][_1536];
        int _1540 = int(_1532) + 1;
        uint _1542 = uint(int(uint(_1540) >> uint(2)));
        int _1544 = _1540 & 3;
        float _1546 = (*spvDescriptorSet0.vp_c15)._m0[int(_1542)][_1544];
        float _1548 = _746 * _1528;
        float _1550 = fma(_222, _1520, _1548);
        float _1552 = fma(_224, _1538, _1550);
        float _1554 = _1552 + _1546;
        float _1556 = precise::clamp(_1554, 0.0, 1.0);
        float _1558 = -_1556;
        float _1560 = _1558 + _1504;
        float _1562 = fma(_1560, 500.0, 1.5);
        float _1564 = exp2(_1562);
        float _1566 = 0.0 + _1564;
        float _1568 = precise::clamp(_1566, 0.0, 1.0);
        _802 = _1548;
        _1127 = as_type<float>(_1512);
        _1508 = _1568;
    }
    float _1570 = _802;
    float _1572 = _1127;
    float _1574 = _1508;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1578 = _1279 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1582 = _1281 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1586 = _1283 + _1584;
    float _1588 = _1578 * _1578;
    float _1590 = fma(_1582, _1582, _1588);
    float _1592 = fma(_1586, _1586, _1590);
    float _1594 = rsqrt(_1592);
    float _1596 = sqrt(_1592);
    float _1598 = _1582 * _1594;
    float _1600 = _1586 * _1594;
    float _1602 = _1578 * _1594;
    float _1604 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1606 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 * _1606;
    float _1612 = _1608 + _1610;
    float _1614 = sqrt(_1612);
    bool _1616 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1620 = _1614 + _1618;
    float _1622 = _1451;
    float _1624 = _1620;
    float _1626 = _1572;
    float _1628 = _1604;
    float _1630 = _1606;
    float _1632 = _1608;
    float _1634 = _1610;
    if (_1616)
    {
        float _1636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1636;
    }
    float _1638 = _1622;
    if (_1616)
    {
        float _1640 = _1620 * _1638;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1616)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1626 = _1644;
    }
    float _1646 = _1626;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1650 = _1570;
    if (_1616)
    {
        float _1652 = _1646 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    float _1658 = precise::max(0.0, _1648);
    float _1660 = _1642;
    float _1662 = _1658;
    if (_1616)
    {
        float _1664 = _1646 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1602;
    float _1672 = -_1658;
    float _1674 = fma(_1670, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1672);
    if (_1616)
    {
        float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1676;
    }
    float _1678 = _1662;
    float _1680 = _1648;
    float _1682 = _1678;
    if (_1616)
    {
        float _1684 = rsqrt(_1612);
        _1680 = _1684;
    }
    float _1686 = _1680;
    float _1688 = _1656;
    if (_1616)
    {
        float _1690 = fma(_1656, _1678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _376 = _1690;
    }
    float _1692 = _376;
    float _1694 = _1692;
    if (_1616)
    {
        float _1696 = _1668 + (-1.0);
        _1682 = _1696;
    }
    float _1698 = _1682;
    if (_1616)
    {
        float _1700 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1700;
    }
    float _1702 = _1688;
    float _1704 = _1686;
    if (_1616)
    {
        float _1706 = _1686 * _1692;
        _1694 = _1706;
    }
    float _1708 = _1694;
    if (!_1616)
    {
        _1704 = _1674;
    }
    float _1710 = _1704;
    float _1712 = _1710;
    if (_1616)
    {
        float _1714 = fma(_1674, _1668, _1702);
        _1712 = _1714;
    }
    float _1716 = _1712;
    if (_1616)
    {
        float _1718 = _1604 * _1708;
        _1628 = _1718;
    }
    float _1720 = _1628;
    if (_1616)
    {
        float _1722 = _1606 * _1708;
        _1630 = _1722;
    }
    float _1724 = _1630;
    if (_1616)
    {
        float _1726 = _1720 * _1720;
        _1632 = _1726;
    }
    float _1728 = _1632;
    if (_1616)
    {
        float _1730 = _1724 * _1724;
        _1634 = _1730;
    }
    float _1732 = _1634;
    float _1734 = fma(_1716, _1716, _1728);
    float _1736 = _1734 + _1732;
    float _1738 = rsqrt(_1736);
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1742 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1740);
    float _1744 = precise::clamp(_1742, 0.0, 1.0);
    float _1746 = -_1744;
    float _1748 = _1746 + 1.0;
    float _1750 = abs(_1748);
    float _1752 = log2(_1750);
    float _1754 = _1738 * _1720;
    float _1756 = _1738 * _1716;
    float _1758 = _1738 * _1724;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1762 = -_1760;
    float _1764 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = -_1758;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1772 = exp2(_1766);
    float _1774 = fma(_1770, -0.5, 0.5);
    float _1776 = fma(_1770, 0.5, 0.5);
    float _1778 = _1756 + 1.0;
    float _1780 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1782 = sqrt(_1774);
    float _1784 = fma(_1776, _1780, -0.212114393711090087890625);
    float _1786 = fma(_1776, _1784, 1.570728778839111328125);
    float _1788 = -_1756;
    float _1790 = fma(_1772, _1778, _1788);
    float _1792 = fma(_1790, 0.5, 0.5);
    float _1794 = _1782 * 0.636619746685028076171875;
    float _1796 = -_1786;
    float _1798 = fma(_1794, _1796, 1.0);
    float2 _5252 = float2(_1798, _1792);
    float3 _1802 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5252, float2(0.0), isnan(_5252)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5252, float2(0.0), isnan(_5252)), level(0.0)).xyz;
    float _1804 = _1802.x;
    float _1806 = _1802.y;
    float _1808 = _1802.z;
    float _1810 = in.m_71.y;
    float _1812 = abs(_758);
    float _1814 = log2(_1812);
    bool _1816 = _260 > 0.5;
    float _1818 = in.m_71.x;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1822 = _1820 != 0;
    float _1824 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1828 = _1826 != 0;
    float _1830 = -_242;
    float _1832 = _1830 + 1.0;
    bool _1834 = _250 > 0.5;
    bool _1836 = _1834 && _1822;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_73.x = _1281;
    out.m_73.y = _1279;
    out.m_73.z = _1283;
    bool _1840 = _758 <= 8000.0;
    bool _1842 = isnan(_758);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(8000.0);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1854 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1856 = exp2(_1824);
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1860 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1864 = -_1810;
    float _1866 = _1864 + 1.0;
    float _1868 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = exp2(_1854);
    float _1872 = _1748;
    float _1874 = _1798;
    float _1876 = _1810;
    if (_1822)
    {
        _1872 = _1818;
    }
    float _1878 = _1872;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1882 = _1878;
    if (!_1822)
    {
        _1874 = _1818;
    }
    float _1884 = _1874;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1888 = _1884;
    if (_1828)
    {
        float _1890 = _1816 ? _1866 : _1810;
        _1876 = _1890;
    }
    float _1892 = _1876;
    if (_1836)
    {
        float _1894 = -_1878;
        float _1896 = _1894 + 1.0;
        _1882 = _1896;
    }
    float _1898 = _1882;
    float _1900 = in.m_75.x;
    float _1902 = in.m_75.y;
    float _1904 = in.m_75.z;
    bool _1906 = _710 != 0.0;
    bool _1908 = isnan(_710);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan(0.0);
    bool _1914 = _1910 || _1912;
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = -_1856;
    float _1920 = _1918 + 1.0;
    if (_1822)
    {
        _1888 = _1898;
    }
    float _1922 = _1888;
    float _1924 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1926 = _708 == 0.0;
    bool _1928 = !_1914;
    bool _1930 = _1926 && _1928;
    float _1932 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1934 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1936 = _712 == 0.0;
    bool _1938 = _1936 && _1930;
    float _1940 = _1932 * _1487;
    float _1942 = _1924 * _1838;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1946 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1934 * _1916;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1956 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _1950;
    out.m_77.y = _1860;
    out.m_77.z = _1868;
    float _1958 = _1902;
    float _1960 = _1900;
    float _1962 = _1904;
    if (!_1938)
    {
        float _1964 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1902);
        _1958 = _1964;
    }
    float _1966 = _1958;
    if (!_1938)
    {
        float _1968 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1900);
        _1960 = _1968;
    }
    float _1970 = _1960;
    if (!_1938)
    {
        float _1972 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1904);
        _1962 = _1972;
    }
    float _1974 = _1962;
    float _1976 = -_1966;
    float _1978 = _887 * _1976;
    float _1980 = _893 * _1966;
    float _1982 = _895 * _1966;
    float _1984 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1986 = precise::clamp(_1984, 0.0, 1.0);
    float _1988 = fma(_935, _1970, _1980);
    float _1990 = fma(_901, _1970, _1978);
    float _1992 = fma(_927, _1970, _1982);
    float _1994 = fma(_1986, -2.0, 3.0);
    float _1996 = _1986 * _1986;
    float _1998 = fma(_931, _1974, _1988);
    float _2000 = fma(_903, _1974, _1990);
    float _2002 = fma(_945, _1974, _1992);
    float _2004 = _1996 * _1994;
    float _2006 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2008 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2010 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2014 = fma(_2000, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2006);
    float _2016 = fma(_2000, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2008);
    float _2018 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2020 = fma(_2000, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2012);
    float _2022 = fma(_2002, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2014);
    float _2024 = fma(_2002, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2016);
    float _2026 = -_2004;
    float _2028 = _2026 + 1.0;
    float _2030 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2018);
    float _2032 = fma(_2002, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2020);
    float _2034 = fma(_2028, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2004);
    float _2036 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2030);
    float _2038 = _1498 * _1940;
    out.m_79.x = _1952;
    out.m_79.y = _1942;
    float _2040 = _1850 * _2034;
    float _2042 = _2036 + _1393;
    out.m_81.x = _1946;
    out.m_81.y = _1948;
    out.m_81.z = _1956;
    out.m_81.w = _1954;
    float _2044 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2046 = _2042 * 0.5;
    float _2048 = _2042;
    float _2050 = _2046;
    float _2052 = _2044;
    float _2054 = _2038;
    if (!_1371)
    {
        _2048 = 1.0;
    }
    float _2056 = _2048;
    out.gl_Position.x = _1419;
    out.gl_Position.y = _1413;
    out.gl_Position.z = _2036;
    out.gl_Position.w = _1393;
    float _2058 = _2056;
    if (_1371)
    {
        bool _2060 = _1485 >= _1447;
        bool _2062 = isnan(_1485);
        bool _2064 = _2060 || _2062;
        bool _2066 = isnan(_1447);
        bool _2068 = _2064 || _2066;
        float _2070 = float(_2068);
        _2058 = _2070;
    }
    float _2072 = _2058;
    float _2074 = _1832 * _2044;
    float _2076 = precise::clamp(_2074, 0.0, 1.0);
    out.m_83.z = _2046;
    out.m_83.w = _1393;
    bool _2078 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2080 = isnan(_1596);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2086 = _2082 || _2084;
    float _2088 = _2072 * _1574;
    float _2090 = -_2076;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    float _2094 = -_2088;
    float _2096 = fma(_2094, _2092, 1.0);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = -_1932;
    float _2102 = _2100 + 1.0;
    out.m_87.x = _2022;
    out.m_87.y = _2024;
    out.m_87.z = _2032;
    float _2104 = _2098 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2106 = _1498 * _2102;
    float _2108 = _2102;
    float _2110 = _2098;
    if (!_2086)
    {
        _2050 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2112 = _2050;
    out.m_89.x = _2104;
    float _2114 = _2112;
    float _2116 = _2112;
    if (!_2086)
    {
        _1453 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2118 = _1453;
    float _2120 = _2118;
    float _2122 = _2118;
    if (!_2086)
    {
        _2052 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2124 = _2052;
    float _2126 = _2124;
    float _2128 = _2124;
    if (!_2086)
    {
        _2108 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2130 = _2108;
    float _2132 = _2130;
    float _2134 = _2130;
    if (!_2086)
    {
        _2110 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2136 = _2110;
    float _2138 = _1808 * _1940;
    float _2140 = fma(_1804, _2038, _1492);
    float _2142 = fma(_1806, _2038, _1494);
    float _2144 = _2136;
    float _2146 = _2136;
    if (!_2086)
    {
        _2054 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2148 = _2054;
    float _2150 = fma(_1498, _2138, _1496);
    out.m_91.x = _2140;
    out.m_91.y = _2142;
    out.m_91.z = _2150;
    out.m_91.w = _2106;
    bool _2152 = !_2086;
    float _2154 = _2148;
    float _2156 = _2148;
    if (!_2152)
    {
        bool _2158 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2160 = isnan(_1596);
        bool _2162 = _2158 || _2160;
        bool _2164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2166 = _2162 || _2164;
        if (!_2166)
        {
            float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2170 = _1596 + _2168;
            float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2174 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2172;
            float _2176 = 1.0 / _2174;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2188 = _2186 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2192 = _2190 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2198 = _2170 * _2176;
            float _2200 = precise::clamp(_2198, 0.0, 1.0);
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2206 = fma(_2200, _2180, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2208 = fma(_2200, _2204, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2210 = fma(_2200, _2184, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2212 = fma(_2200, _2188, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2214 = fma(_2200, _2192, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2216 = fma(_2200, _2196, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2122 = _2208;
            _2134 = _2214;
            _2116 = _2206;
            _2156 = _2212;
            _2128 = _2210;
            _2146 = _2216;
            _2218 = true;
        }
        else
        {
            bool _2220 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2222 = isnan(_1596);
            bool _2224 = _2220 || _2222;
            bool _2226 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2228 = _2224 || _2226;
            if (!_2228)
            {
                _2114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2230 = _2114;
            _2116 = _2230;
            if (!_2228)
            {
                _2120 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2232 = _2120;
            _2122 = _2232;
            if (!_2228)
            {
                _2126 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2234 = _2126;
            _2128 = _2234;
            if (!_2228)
            {
                _2154 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2236 = _2154;
            _2156 = _2236;
            if (!_2228)
            {
                _2132 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2238 = _2132;
            _2134 = _2238;
            if (!_2228)
            {
                _2144 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2240 = _2144;
            bool _2242 = !_2228;
            _2146 = _2240;
            if (!_2242)
            {
                bool _2244 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2246 = isnan(_1596);
                bool _2248 = _2244 || _2246;
                bool _2250 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2252 = _2248 || _2250;
                if (!_2252)
                {
                    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2256 = _1596 + _2254;
                    float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2260 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2258;
                    float _2262 = 1.0 / _2260;
                    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2284 = _2256 * _2262;
                    float _2286 = precise::clamp(_2284, 0.0, 1.0);
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2292 = fma(_2286, _2266, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2294 = fma(_2286, _2290, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2296 = fma(_2286, _2270, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2298 = fma(_2286, _2274, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2300 = fma(_2286, _2278, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2302 = fma(_2286, _2282, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2122 = _2294;
                    _2134 = _2300;
                    _2116 = _2292;
                    _2156 = _2298;
                    _2128 = _2296;
                    _2146 = _2302;
                    _2218 = true;
                }
                else
                {
                    _2122 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2134 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2156 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2128 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2146 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2218 = false;
    float _2304 = _2122;
    float _2306 = _2134;
    float _2308 = _2116;
    float _2310 = _2156;
    float _2312 = _2128;
    float _2314 = _2146;
    float _2316 = fma(_2024, -0.5, 0.5);
    float _2318 = precise::clamp(_2316, 0.0, 1.0);
    float _2320 = -_2304;
    float _2322 = _2320 + _2306;
    float _2324 = -_2308;
    float _2326 = _2324 + _2310;
    float _2328 = -_2312;
    float _2330 = _2328 + _2314;
    bool _2332 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2334 = fma(_2318, _2322, _2304);
    float _2336 = fma(_2318, _2326, _2308);
    float _2338 = fma(_2318, _2330, _2312);
    float _2340 = _2334 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2342 = fma(_2336, 0.298911988735198974609375, _2340);
    float _2344 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2346 = fma(_2338, 0.114477999508380889892578125, _2342);
    out.m_59.x = _2344;
    float _2348 = -_2346;
    float _2350 = _2336 + _2348;
    float _2352 = -_2346;
    float _2354 = _2334 + _2352;
    float _2356 = -_2346;
    float _2358 = _2338 + _2356;
    out.m_95.x = 0.0;
    float _2360 = fma(_2350, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2346);
    float _2362 = fma(_2354, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2346);
    float _2364 = fma(_2358, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2346);
    out.m_97.x = _2360;
    out.m_97.y = _2362;
    out.m_97.z = _2364;
    if (!_2332)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2366 = -_1279;
    float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2370 = -_1281;
    float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2374 = -_1283;
    float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2378 = _2368 * _2368;
    float _2380 = fma(_2372, _2372, _2378);
    float _2382 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = fma(_2376, _2376, _2380);
    float _2388 = _2384 * _2384;
    float _2390 = rsqrt(_2386);
    float _2392 = _2388 + (-1.0);
    float _2394 = _2368 * _2390;
    float _2396 = _2372 * _2390;
    float _2398 = _2376 * _2390;
    float _2400 = sqrt(_2386);
    float _2402 = -_1602;
    float _2404 = _2402 + _2394;
    float _2406 = -_1598;
    float _2408 = _2406 + _2396;
    float _2410 = -_1600;
    float _2412 = _2410 + _2398;
    float _2414 = _2404 * _2404;
    float _2416 = fma(_2408, _2408, _2414);
    float _2418 = fma(_2412, _2412, _2416);
    float _2420 = -_2400;
    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2424 = rsqrt(_2418);
    float _2426 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    float _2430 = abs(_2428);
    float _2432 = log2(_2430);
    float _2434 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2436 = _2404 * _2424;
    float _2438 = _2408 * _2424;
    float _2440 = _2412 * _2424;
    float _2442 = _2024 * _2436;
    float _2444 = _2024 * _2394;
    float _2446 = fma(_2022, _2438, _2442);
    float _2448 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2450 = fma(_2022, _2396, _2444);
    float _2452 = fma(_2032, _2440, _2446);
    float _2454 = precise::clamp(_2452, 0.0, 1.0);
    float _2456 = fma(_2032, _2398, _2450);
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = exp2(_2448);
    float _2462 = _2454 * _2454;
    float _2464 = fma(_2462, _2392, 1.0);
    float _2466 = -_2394;
    float _2468 = -_2434;
    float _2470 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2468);
    float _2472 = _2464 * _2464;
    float _2474 = -_2398;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2470);
    float _2478 = 1.0 / _2472;
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2482 = _2476 + _2480;
    float _2484 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = _2460 * _2486;
    float _2490 = _2458 * _2488;
    float _2492 = _2388 * _2478;
    float _2494 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2496 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2498 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2500 = _2490 * _2492;
    float _2502 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2504 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2506 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2494;
    out.m_93.y = _2496;
    out.m_93.z = _2498;
    out.m_95.x = _2502;
    out.m_95.y = _2504;
    out.m_95.z = _2506;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2218 = false;
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
        float _2563 = as_type<float>(_132);
        out.gl_Position.z = _2563;
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
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_59.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2632 = as_type<float>(_170);
        out.gl_Position.z = _2632;
    }
    if (_164)
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
    float2 _2759 = float2(_236, _240);
    float _242 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2759, float2(0.0), isnan(_2759)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2759, float2(0.0), isnan(_2759)), level(0.0)).x;
    float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _246 = log2(_244);
    float _248 = in.m_63.z;
    float _250 = in.m_63.x;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = in.m_63.y;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    float _266 = 1.0 / _254;
    float _268 = _246 * _150;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _272 = 1.0 + _270;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _276 = _274 != 0;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _284 = _282 != 0;
    float _286 = 1.0 / _258;
    float _288 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _202 + _290;
    bool _294 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _296 = isnan(1.0);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _302 = _298 || _300;
    float _304 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _288);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _202 + _306;
    bool _310 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _312 = isnan(0.0);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _318 = _314 || _316;
    float _320 = exp2(_268);
    float _322 = _248 * 2.0;
    float _324 = _292 * _266;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = _202 + _326;
    float _330 = _260 + _248;
    float _332 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _304);
    float _334 = 1.0 / _264;
    float _336 = _308 * _286;
    float _338 = _330 + (-1.0);
    float _340 = _250 + _260;
    float _342 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _346 = _340 + (-1.0);
    float _348 = 1.0 / _272;
    float _350 = _250 * 2.0;
    float _352 = -_320;
    float _354 = _352 + 1.0;
    float _356 = _250 + _248;
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _360 = _248 + (-0.5);
    float _362 = _318 ? _354 : 0.0;
    float _364 = floor(_322);
    float _366 = _260 * 2.0;
    float _368 = _328 * _334;
    float _370 = _356 + (-1.0);
    float _372 = floor(_350);
    int _374 = 2;
    float _376 = _222;
    if (_302)
    {
        float _378 = _362 * _348;
        _154 = _378;
    }
    float _380 = _154;
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    bool _388 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _390 = isnan(_202);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = floor(_366);
    bool _406 = _364 >= 0.0;
    bool _408 = isnan(_364);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = -_398;
    float _418 = _416 + 1.0;
    bool _420 = _364 > 0.0;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    int _426 = _414 ? 0 : 1;
    bool _428 = _372 >= 0.0;
    bool _430 = isnan(_372);
    bool _432 = _428 || _430;
    bool _434 = isnan(0.0);
    bool _436 = _432 || _434;
    float _438 = fma(_424, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _440 = _372 > 0.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _442;
    int _446 = _436 ? 0 : 1;
    bool _448 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _450 = isnan(_202);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = fma(_444, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _462 = _404 > 0.0;
    bool _464 = _404 >= 0.0;
    bool _466 = isnan(_404);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = fma(_386, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _480 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_202);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _496 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _498 = isnan(_202);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = fma(_478, _336, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = _458 * _418;
    float _512 = -_458;
    float _514 = _512 + 1.0;
    float _516 = fma(_402, _336, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = -_506;
    float _520 = _518 + 1.0;
    float _522 = fma(_494, _336, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = _506 * _514;
    float _526 = _490 * _520;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _528;
    float _532 = -_490;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _540;
    float _544 = _474 * _526;
    float _546 = _438 * _526;
    float _548 = _460 * _526;
    float _550 = fma(_530, _368, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _552 = fma(_538, _368, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _554 = fma(_542, _368, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _556 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _546);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _548);
    int _562 = _472 ? 0 : 1;
    float _564 = fma(_508, _524, _556);
    bool _566 = !_276;
    int _568 = _566 ? 0 : 1;
    float _570 = _342 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _572 = ~_446;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = fma(_516, _524, _558);
    int _580 = ~_562;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].x, _570);
    int _588 = _576;
    int _590 = _584;
    if (!_440)
    {
        int _592 = ~_446;
        int _594 = _592 + 1;
        _588 = _594;
    }
    int _596 = _588;
    float _598 = fma(_522, _524, _560);
    if (!_462)
    {
        int _600 = ~_562;
        int _602 = _600 + 1;
        _590 = _602;
    }
    int _604 = _590;
    float _606 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].z, _586);
    int _608 = abs(_568);
    float _610 = _342 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _612 = in.m_65.x;
    float _614 = in.m_65.y;
    float _616 = in.m_65.z;
    int _618 = ~_426;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = _606 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _626 = !_280;
    int _628 = _626 ? 0 : 1;
    float _630 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].x, _610);
    int _632 = _622;
    if (!_420)
    {
        int _634 = ~_426;
        int _636 = _634 + 1;
        _632 = _636;
    }
    int _638 = _632;
    float _640 = 1.0 / _624;
    int _642 = abs(_628);
    float _644 = fma(_550, _510, _564);
    float _646 = float(_608);
    float _648 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].z, _630);
    float _650 = float(_638);
    float _652 = fma(_554, _510, _598);
    float _654 = _648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _656 = float(_596);
    float _658 = _646 * _650;
    float _660 = float(_642);
    float _662 = fma(_552, _510, _578);
    bool _664 = !_284;
    int _666 = _664 ? 0 : 1;
    float _668 = _658 * (-2.0);
    float _670 = _654 + _624;
    float _672 = _660 * _656;
    int _674 = abs(_666);
    float _676 = fma(_358, _668, _358);
    float _678 = _250 + (-0.5);
    float _680 = fma(_668, _612, _612);
    float _682 = _670 * _640;
    float _684 = _682 * 0.5;
    float _686 = float(_674);
    float _688 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].x, _680);
    float _690 = _672 * (-2.0);
    float _692 = in.m_67.x;
    float _694 = in.m_67.y;
    float _696 = in.m_67.z;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _700 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[30].w, _698);
    float _702 = fma(_676, _380, _688);
    float _704 = float(_604);
    float _706 = _260 + (-0.5);
    float _708 = in.m_69.x;
    float _710 = in.m_69.y;
    float _712 = in.m_69.z;
    float _714 = fma(_690, _614, _614);
    float _716 = 1.0 / _700;
    float _718 = _686 * _704;
    float _720 = fma(_344, _690, _344);
    float _722 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[196].y, _714);
    float _724 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[146].x, _644);
    float _726 = _718 * (-2.0);
    float _728 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[146].y, _662);
    float _730 = fma(_720, _380, _722);
    float _732 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[146].z, _652);
    float _734 = fma(_726, _616, _616);
    float _736 = fma(_382, _726, _382);
    float _738 = _702 * 0.15915493667125701904296875;
    float _740 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _742 = _738 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = _342 + _740;
    float _748 = _724 * _692;
    float _750 = _730 * 0.15915493667125701904296875;
    float _752 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[196].z, _734);
    float _754 = _732 * _696;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _758 = _716 * _756;
    float _760 = fma(_736, _380, _752);
    float _762 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _708);
    float _766 = _728 * _694;
    float _768 = _760 * 0.15915493667125701904296875;
    bool _770 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _772 = _738 * 6.283185482025146484375;
    float _774 = cos(_772);
    bool _776 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _778 = _762 * _764;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _710);
    float _782 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _784 = !_770;
    int _786 = _784 ? 0 : 1;
    float _788 = _746 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _790 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = _750 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = _782 * _780;
    float _798 = _746 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _800 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    float _802 = _746;
    if (!_770)
    {
        _374 = 1;
    }
    int _804 = _374;
    float _806 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].x, _788);
    float _808 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].x, _798);
    int _810 = _804;
    if (!_776)
    {
        _810 = _786;
    }
    int _812 = _810;
    float _814 = _750 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _790 * _800;
    float _820 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].z, _808);
    int _822 = _812 << 6;
    float _824 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].z, _806);
    bool _826 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _828 = isnan(0.5);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _834 = _830 || _832;
    float _836 = _820 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _838 = _822 + 96;
    uint _841 = uint(int(uint(_838) >> uint(2)));
    uint _843 = uint(int(uint(int(_841)) >> uint(2)));
    int _845 = int(_841) & 3;
    float _847 = (*spvDescriptorSet0.vp_c15)._m0[int(_843)][_845];
    int _849 = int(_841) + 1;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    int _853 = _849 & 3;
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[int(_851)][_853];
    float _857 = _768 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = _774 * _794;
    float _863 = _744 * _794;
    float _865 = _824 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _867 = _822 + 48;
    uint _869 = uint(int(uint(_867) >> uint(2)));
    uint _871 = uint(int(uint(int(_869)) >> uint(2)));
    int _873 = int(_869) & 3;
    float _875 = (*spvDescriptorSet0.vp_c15)._m0[int(_871)][_873];
    int _877 = int(_869) + 1;
    uint _879 = uint(int(uint(_877) >> uint(2)));
    int _881 = _877 & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    float _885 = _768 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = _744 * _816;
    float _891 = _774 * _816;
    float _893 = _774 * _859;
    float _895 = _744 * _859;
    float _897 = trunc(_865);
    int _899 = int(_897);
    float _901 = _816 * _859;
    float _903 = _794 * _859;
    float _905 = _895 * _796;
    int _907 = _822 + 64;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    uint _911 = uint(int(uint(int(_909)) >> uint(2)));
    int _913 = int(_909) & 3;
    float _915 = (*spvDescriptorSet0.vp_c15)._m0[int(_911)][_913];
    int _917 = int(_909) + 1;
    uint _919 = uint(int(uint(_917) >> uint(2)));
    int _921 = _917 & 3;
    float _923 = (*spvDescriptorSet0.vp_c15)._m0[int(_919)][_921];
    float _925 = -_861;
    float _927 = fma(_887, _889, _925);
    float _929 = -_889;
    float _931 = fma(_887, _861, _929);
    float _933 = _893 * _796;
    float _935 = fma(_887, _891, _863);
    float _937 = trunc(_836);
    int _939 = int(_937);
    float _941 = -_796;
    float _943 = _887 * _941;
    float _945 = fma(_887, _863, _891);
    float _947 = fma(_935, _778, _933);
    float _949 = fma(_927, _778, _905);
    int _951 = _822 + 104;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    uint _955 = uint(int(uint(int(_953)) >> uint(2)));
    int _957 = int(_953) & 3;
    float _959 = (*spvDescriptorSet0.vp_c15)._m0[int(_955)][_957];
    int _961 = int(_953) + 1;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    int _965 = _961 & 3;
    float _967 = (*spvDescriptorSet0.vp_c15)._m0[int(_963)][_965];
    float _969 = fma(_901, _778, _943);
    float _971 = fma(_931, _818, _947);
    int _973 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _975 = _899 + _973;
    int _977 = _975 + 1;
    float _979 = fma(_903, _818, _969);
    float _981 = fma(_945, _818, _949);
    float _983 = _971 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _985 = _971 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _987 = _822 + 56;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.vp_c15)._m0[int(_999)][_1001];
    bool _1005 = _977 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1007 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[10].x, _983);
    int _1009 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1011 = _939 + _1009;
    int _1013 = _1011 + 1;
    float _1015 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[8].x, _985);
    float _1017 = _746 * _855;
    float _1019 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1007);
    int _1021 = _977 | _1013;
    int _1023 = _822 + 72;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    float _1041 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1015);
    float _1043 = _224 + _1019;
    bool _1045 = _1021 < 0;
    bool _1047 = _1045 || _1005;
    float _1049 = fma(_222, _847, _1017);
    float _1051 = _222 + _1041;
    float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1055 = _1043 + _1053;
    bool _1057 = _1013 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1059 = _1057 || _1047;
    int _1061 = _822 + 80;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
    int _1067 = int(_1063) & 3;
    float _1069 = (*spvDescriptorSet0.vp_c15)._m0[int(_1065)][_1067];
    int _1071 = int(_1063) + 1;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    int _1075 = _1071 & 3;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[int(_1073)][_1075];
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1081 = _1051 + _1079;
    float _1083 = _1055 * _1055;
    float _1085 = _971 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1087 = _746 * _883;
    float _1089 = fma(_1081, _1081, _1083);
    float _1091 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1085);
    float _1093 = fma(_222, _875, _1087);
    float _1095 = sqrt(_1089);
    float _1097 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1091);
    int _1099 = as_type<int>(_971);
    int _1101 = as_type<int>(_1049);
    float _1103 = _1051;
    float _1105 = _1043;
    float _1107 = _1081;
    if (!_1059)
    {
        int _1109 = _1013 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1111 = _1109 + _977;
        _1099 = _1111;
    }
    int _1113 = _1099;
    float _1115 = _746 * _923;
    float _1117 = _342 + _1097;
    float _1119 = fma(_222, _915, _1115);
    float _1121 = _979;
    int _1123 = as_type<int>(_967);
    float _1125 = _1119;
    float _1127 = as_type<float>(_1113);
    if (!_1059)
    {
        float _1129 = floor(_865);
        _1121 = _1129;
    }
    float _1131 = _1121;
    float _1133 = fma(_224, _959, _1049);
    if (!_1059)
    {
        int _1135 = _1113 << 2;
        _1101 = _1135;
    }
    int _1137 = _1101;
    bool _1139 = _1095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1141 = _1133 + _967;
    int _1143 = _1137;
    if (!_1059)
    {
        uint _1145 = uint(int(uint(_1113) >> uint(2)));
        _1123 = int(_1145);
    }
    int _1147 = _1123;
    if (!_1059)
    {
        int _1149 = 12 & _1137;
        _1143 = _1149;
    }
    int _1151 = _1143;
    float _1153 = 1.0 / _1141;
    float _1155 = fma(_224, _995, _1093);
    float _1157 = _1155 + _1003;
    float _1159 = fma(_224, _1031, _1119);
    int _1161 = as_type<int>(_1031);
    float _1163 = _1159;
    if (!_1059)
    {
        int _1165 = _1147 << 4;
        int _1167 = _1165 + _1151;
        _1161 = _1167;
    }
    int _1169 = _1161;
    if (!_1139)
    {
        _1125 = _1117;
    }
    float _1171 = _1125;
    float _1173 = _1159 + _1039;
    bool _1175 = !_1139;
    float _1177 = _1171;
    if (!_1175)
    {
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1183 = _1095 + _1181;
        float _1185 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1187 = rsqrt(_1089);
        float _1189 = _1183 * _1179;
        float _1191 = _1189 * 0.15915493667125701904296875;
        float _1193 = _1191 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = _1191 * 6.283185482025146484375;
        float _1199 = sin(_1197);
        float _1201 = _1195 + (-1.0);
        float _1203 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = fma(_1199, _1185, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1207 = fma(_1117, _1195, _1203);
        float _1209 = _1187 * _1205;
        float _1211 = fma(_1081, _1209, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1213 = fma(_1055, _1209, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1103 = _1211;
        _1105 = _1213;
        _1177 = _1207;
        _1163 = _1199;
    }
    float _1215 = _1103;
    float _1217 = _1105;
    float _1219 = _1177;
    float _1221 = _1163;
    float _1223 = _1221;
    float _1225 = _1219;
    if (_834)
    {
        _1223 = _1215;
    }
    float _1227 = _1223;
    float _1229 = _1227;
    if (_834)
    {
        _1107 = _1217;
    }
    float _1231 = _1107;
    float _1233 = _1231;
    if (!_834)
    {
        float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1237 = _342 + _1235;
        float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1241 = _222 + _1239;
        float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1245 = -_224;
        float _1247 = _1245 + _1217;
        float _1249 = _1237 * _1237;
        float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1253 = _224 + _1251;
        float _1255 = fma(_1241, _1241, _1249);
        float _1257 = fma(_1253, _1253, _1255);
        float _1259 = -_342;
        float _1261 = _1259 + _1219;
        float _1263 = sqrt(_1257);
        float _1265 = precise::min(_1263, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1267 = _1265 * _1243;
        float _1269 = -_222;
        float _1271 = _1269 + _1215;
        float _1273 = fma(_1261, _1267, _342);
        float _1275 = fma(_1271, _1267, _222);
        float _1277 = fma(_1247, _1267, _224);
        _1225 = _1273;
        _1229 = _1275;
        _1233 = _1277;
    }
    float _1279 = _1225;
    float _1281 = _1229;
    float _1283 = _1233;
    int _1285 = _822 + 88;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    uint _1289 = uint(int(uint(int(_1287)) >> uint(2)));
    int _1291 = int(_1287) & 3;
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[int(_1289)][_1291];
    int _1295 = int(_1287) + 1;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    int _1299 = _1295 & 3;
    float _1301 = (*spvDescriptorSet0.vp_c15)._m0[int(_1297)][_1299];
    float _1303 = _1157 * _1153;
    float _1305 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1307 = _1173 * _1153;
    float _1309 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1313 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1305);
    bool _1315 = _1303 >= 0.0;
    float _1317 = _1215;
    if (!_1059)
    {
        int _1319 = _1169 + 400;
        uint _1321 = uint(int(uint(_1319) >> uint(2)));
        uint _1323 = uint(int(uint(int(_1321)) >> uint(2)));
        int _1325 = int(_1321) & 3;
        float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
        _1317 = _1327;
    }
    float _1329 = _1317;
    float _1331 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1333 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1311);
    float _1335 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1313);
    float _1337 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1339 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1331);
    float _1341 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1333);
    float _1343 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1345 = _1303 <= 1.0;
    bool _1347 = _1345 && _1315;
    float _1349 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1351 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1353 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1337);
    float _1355 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1357 = _1307 >= 0.0;
    bool _1359 = _1357 && _1347;
    float _1361 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1365 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1353);
    float _1367 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1355);
    bool _1369 = _1307 <= 1.0;
    bool _1371 = _1369 && _1359;
    float _1373 = -_1363;
    float _1375 = fma(_1373, _1361, 1.0);
    float _1377 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1379 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1367);
    float _1381 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1383 = _746 * _1077;
    float _1385 = _1117;
    float _1387 = _1361;
    if (!_1059)
    {
        float _1389 = floor(_836);
        _1385 = _1389;
    }
    float _1391 = _1385;
    float _1393 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1379);
    float _1395 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1397 = fma(_222, _1069, _1383);
    float _1399 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1395);
    if (_1371)
    {
        float _1401 = float(_812);
        _1387 = _1401;
    }
    float _1403 = _1387;
    float _1405 = 1.0 / _1393;
    float _1407 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1381);
    float _1409 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1411 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1407);
    float _1413 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    float _1415 = fma(_224, _1293, _1397);
    float _1417 = log2(_1375);
    float _1419 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1411);
    float _1421 = _1407;
    if (!_1059)
    {
        float _1423 = -_1391;
        float _1425 = _836 + _1423;
        _1421 = _1425;
    }
    float _1427 = _1421;
    float _1429 = _1415 + _1301;
    float _1431 = _1419 * _1405;
    float _1433 = _1383;
    float _1435 = _1429;
    if (_1371)
    {
        float _1437 = rint(_1403);
        float _1439 = precise::max(_1437, 0.0);
        uint _1441 = uint(_1439);
        uint _1443 = clamp(_1441, 0u, 65535u);
        _1433 = as_type<float>(_1443);
    }
    float _1445 = _1433;
    float _1447 = _1429 * _1153;
    float _1449 = _1413 * _1405;
    float _1451 = fma(_1431, 0.5, 0.5);
    float _1453 = _1447;
    if (!_1059)
    {
        float _1455 = -_1131;
        float _1457 = _865 + _1455;
        _1435 = _1457;
    }
    float _1459 = _1435;
    float _1461 = fma(_1449, -0.5, 0.5);
    float _1463 = _1431;
    if (!_1059)
    {
        float _1465 = rint(_1329);
        float _1467 = precise::max(_1465, 0.0);
        uint _1469 = uint(_1467);
        uint _1471 = clamp(_1469, 0u, 65535u);
        _1463 = as_type<float>(_1471);
    }
    float _1473 = _1463;
    float _1475 = _1417 * 0.693147182464599609375;
    float _1477 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1479 = _1403;
    float _1481 = _1475;
    if (_1371)
    {
        float3 _4746 = float3(_1303, _1307, float(as_type<int>(_1445)));
        float3 _4750 = select(_4746, float3(0.0), isnan(_4746));
        float _1483 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4750.xy, uint(rint(_4750.z)), _1447, level(0.0));
        _1479 = _1483;
    }
    float _1485 = _1479;
    float3 _4760 = float3(_1451, _1461, _1477);
    float _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4760, float3(0.0), isnan(_4760)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4760, float3(0.0), isnan(_4760)), level(0.0)).x;
    float3 _4769 = float3(_1451, _1461, _1477);
    float4 _1490 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4769, float3(0.0), isnan(_4769)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4769, float3(0.0), isnan(_4769)), level(0.0)).xyzw;
    float _1492 = _1490.x;
    float _1494 = _1490.y;
    float _1496 = _1490.z;
    float _1498 = _1490.w;
    float _1500 = _1405;
    if (!_1059)
    {
        float3 _4792 = float3(_1459, _1427, float(as_type<int>(_1473)));
        float3 _4794 = select(_4792, float3(0.0), isnan(_4792));
        float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4794.xy, uint(rint(_4794.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4794.xy, uint(rint(_4794.z)), level(0.0)).x;
        _1500 = _1502;
    }
    float _1504 = _1500;
    if (_1059)
    {
        _1481 = 1.0;
    }
    float _1506 = _1481;
    float _1508 = _1506;
    if (!_1059)
    {
        int _1510 = _1113 << 4;
        int _1512 = _1510 + 2048;
        uint _1514 = uint(int(uint(_1512) >> uint(2)));
        uint _1516 = uint(int(uint(int(_1514)) >> uint(2)));
        int _1518 = int(_1514) & 3;
        float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
        int _1522 = int(_1514) + 1;
        uint _1524 = uint(int(uint(_1522) >> uint(2)));
        int _1526 = _1522 & 3;
        float _1528 = (*spvDescriptorSet0.vp_c15)._m0[int(_1524)][_1526];
        int _1530 = _1512 + 8;
        uint _1532 = uint(int(uint(_1530) >> uint(2)));
        uint _1534 = uint(int(uint(int(_1532)) >> uint(2)));
        int _1536 = int(_1532) & 3;
        float _1538 = (*spvDescriptorSet0.vp_c15)._m0[int(_1534)][_1536];
        int _1540 = int(_1532) + 1;
        uint _1542 = uint(int(uint(_1540) >> uint(2)));
        int _1544 = _1540 & 3;
        float _1546 = (*spvDescriptorSet0.vp_c15)._m0[int(_1542)][_1544];
        float _1548 = _746 * _1528;
        float _1550 = fma(_222, _1520, _1548);
        float _1552 = fma(_224, _1538, _1550);
        float _1554 = _1552 + _1546;
        float _1556 = precise::clamp(_1554, 0.0, 1.0);
        float _1558 = -_1556;
        float _1560 = _1558 + _1504;
        float _1562 = fma(_1560, 500.0, 1.5);
        float _1564 = exp2(_1562);
        float _1566 = 0.0 + _1564;
        float _1568 = precise::clamp(_1566, 0.0, 1.0);
        _802 = _1548;
        _1127 = as_type<float>(_1512);
        _1508 = _1568;
    }
    float _1570 = _802;
    float _1572 = _1127;
    float _1574 = _1508;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1578 = _1279 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1582 = _1281 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1586 = _1283 + _1584;
    float _1588 = _1578 * _1578;
    float _1590 = fma(_1582, _1582, _1588);
    float _1592 = fma(_1586, _1586, _1590);
    float _1594 = rsqrt(_1592);
    float _1596 = sqrt(_1592);
    float _1598 = _1582 * _1594;
    float _1600 = _1586 * _1594;
    float _1602 = _1578 * _1594;
    float _1604 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1606 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 * _1606;
    float _1612 = _1608 + _1610;
    float _1614 = sqrt(_1612);
    bool _1616 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1620 = _1614 + _1618;
    float _1622 = _1451;
    float _1624 = _1620;
    float _1626 = _1572;
    float _1628 = _1604;
    float _1630 = _1606;
    float _1632 = _1608;
    float _1634 = _1610;
    if (_1616)
    {
        float _1636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1636;
    }
    float _1638 = _1622;
    if (_1616)
    {
        float _1640 = _1620 * _1638;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1616)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1626 = _1644;
    }
    float _1646 = _1626;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1650 = _1570;
    if (_1616)
    {
        float _1652 = _1646 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    float _1658 = precise::max(0.0, _1648);
    float _1660 = _1642;
    float _1662 = _1658;
    if (_1616)
    {
        float _1664 = _1646 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1602;
    float _1672 = -_1658;
    float _1674 = fma(_1670, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1672);
    if (_1616)
    {
        float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1676;
    }
    float _1678 = _1662;
    float _1680 = _1648;
    float _1682 = _1678;
    if (_1616)
    {
        float _1684 = rsqrt(_1612);
        _1680 = _1684;
    }
    float _1686 = _1680;
    float _1688 = _1656;
    if (_1616)
    {
        float _1690 = fma(_1656, _1678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _376 = _1690;
    }
    float _1692 = _376;
    float _1694 = _1692;
    if (_1616)
    {
        float _1696 = _1668 + (-1.0);
        _1682 = _1696;
    }
    float _1698 = _1682;
    if (_1616)
    {
        float _1700 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1700;
    }
    float _1702 = _1688;
    float _1704 = _1686;
    if (_1616)
    {
        float _1706 = _1686 * _1692;
        _1694 = _1706;
    }
    float _1708 = _1694;
    if (!_1616)
    {
        _1704 = _1674;
    }
    float _1710 = _1704;
    float _1712 = _1710;
    if (_1616)
    {
        float _1714 = fma(_1674, _1668, _1702);
        _1712 = _1714;
    }
    float _1716 = _1712;
    if (_1616)
    {
        float _1718 = _1604 * _1708;
        _1628 = _1718;
    }
    float _1720 = _1628;
    if (_1616)
    {
        float _1722 = _1606 * _1708;
        _1630 = _1722;
    }
    float _1724 = _1630;
    if (_1616)
    {
        float _1726 = _1720 * _1720;
        _1632 = _1726;
    }
    float _1728 = _1632;
    if (_1616)
    {
        float _1730 = _1724 * _1724;
        _1634 = _1730;
    }
    float _1732 = _1634;
    float _1734 = fma(_1716, _1716, _1728);
    float _1736 = _1734 + _1732;
    float _1738 = rsqrt(_1736);
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1742 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1740);
    float _1744 = precise::clamp(_1742, 0.0, 1.0);
    float _1746 = -_1744;
    float _1748 = _1746 + 1.0;
    float _1750 = abs(_1748);
    float _1752 = log2(_1750);
    float _1754 = _1738 * _1720;
    float _1756 = _1738 * _1716;
    float _1758 = _1738 * _1724;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1762 = -_1760;
    float _1764 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = -_1758;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1772 = exp2(_1766);
    float _1774 = fma(_1770, -0.5, 0.5);
    float _1776 = fma(_1770, 0.5, 0.5);
    float _1778 = _1756 + 1.0;
    float _1780 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1782 = sqrt(_1774);
    float _1784 = fma(_1776, _1780, -0.212114393711090087890625);
    float _1786 = fma(_1776, _1784, 1.570728778839111328125);
    float _1788 = -_1756;
    float _1790 = fma(_1772, _1778, _1788);
    float _1792 = fma(_1790, 0.5, 0.5);
    float _1794 = _1782 * 0.636619746685028076171875;
    float _1796 = -_1786;
    float _1798 = fma(_1794, _1796, 1.0);
    float2 _5252 = float2(_1798, _1792);
    float3 _1802 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5252, float2(0.0), isnan(_5252)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5252, float2(0.0), isnan(_5252)), level(0.0)).xyz;
    float _1804 = _1802.x;
    float _1806 = _1802.y;
    float _1808 = _1802.z;
    float _1810 = in.m_71.y;
    float _1812 = abs(_758);
    float _1814 = log2(_1812);
    bool _1816 = _260 > 0.5;
    float _1818 = in.m_71.x;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1822 = _1820 != 0;
    float _1824 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1828 = _1826 != 0;
    float _1830 = -_242;
    float _1832 = _1830 + 1.0;
    bool _1834 = _250 > 0.5;
    bool _1836 = _1834 && _1822;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_73.x = _1281;
    out.m_73.y = _1279;
    out.m_73.z = _1283;
    bool _1840 = _758 <= 8000.0;
    bool _1842 = isnan(_758);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(8000.0);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1854 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1856 = exp2(_1824);
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1860 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1864 = -_1810;
    float _1866 = _1864 + 1.0;
    float _1868 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = exp2(_1854);
    float _1872 = _1748;
    float _1874 = _1798;
    float _1876 = _1810;
    if (_1822)
    {
        _1872 = _1818;
    }
    float _1878 = _1872;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1882 = _1878;
    if (!_1822)
    {
        _1874 = _1818;
    }
    float _1884 = _1874;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1888 = _1884;
    if (_1828)
    {
        float _1890 = _1816 ? _1866 : _1810;
        _1876 = _1890;
    }
    float _1892 = _1876;
    if (_1836)
    {
        float _1894 = -_1878;
        float _1896 = _1894 + 1.0;
        _1882 = _1896;
    }
    float _1898 = _1882;
    float _1900 = in.m_75.x;
    float _1902 = in.m_75.y;
    float _1904 = in.m_75.z;
    bool _1906 = _710 != 0.0;
    bool _1908 = isnan(_710);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan(0.0);
    bool _1914 = _1910 || _1912;
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = -_1856;
    float _1920 = _1918 + 1.0;
    if (_1822)
    {
        _1888 = _1898;
    }
    float _1922 = _1888;
    float _1924 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1926 = _708 == 0.0;
    bool _1928 = !_1914;
    bool _1930 = _1926 && _1928;
    float _1932 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1934 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1936 = _712 == 0.0;
    bool _1938 = _1936 && _1930;
    float _1940 = _1932 * _1487;
    float _1942 = _1924 * _1838;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1946 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1934 * _1916;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1956 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _1950;
    out.m_77.y = _1860;
    out.m_77.z = _1868;
    float _1958 = _1902;
    float _1960 = _1900;
    float _1962 = _1904;
    if (!_1938)
    {
        float _1964 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1902);
        _1958 = _1964;
    }
    float _1966 = _1958;
    if (!_1938)
    {
        float _1968 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1900);
        _1960 = _1968;
    }
    float _1970 = _1960;
    if (!_1938)
    {
        float _1972 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1904);
        _1962 = _1972;
    }
    float _1974 = _1962;
    float _1976 = -_1966;
    float _1978 = _887 * _1976;
    float _1980 = _893 * _1966;
    float _1982 = _895 * _1966;
    float _1984 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1986 = precise::clamp(_1984, 0.0, 1.0);
    float _1988 = fma(_935, _1970, _1980);
    float _1990 = fma(_901, _1970, _1978);
    float _1992 = fma(_927, _1970, _1982);
    float _1994 = fma(_1986, -2.0, 3.0);
    float _1996 = _1986 * _1986;
    float _1998 = fma(_931, _1974, _1988);
    float _2000 = fma(_903, _1974, _1990);
    float _2002 = fma(_945, _1974, _1992);
    float _2004 = _1996 * _1994;
    float _2006 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2008 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2010 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2014 = fma(_2000, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2006);
    float _2016 = fma(_2000, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2008);
    float _2018 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2020 = fma(_2000, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2012);
    float _2022 = fma(_2002, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2014);
    float _2024 = fma(_2002, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2016);
    float _2026 = -_2004;
    float _2028 = _2026 + 1.0;
    float _2030 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2018);
    float _2032 = fma(_2002, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2020);
    float _2034 = fma(_2028, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2004);
    float _2036 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2030);
    float _2038 = _1498 * _1940;
    out.m_79.x = _1952;
    out.m_79.y = _1942;
    float _2040 = _1850 * _2034;
    float _2042 = _2036 + _1393;
    out.m_81.x = _1946;
    out.m_81.y = _1948;
    out.m_81.z = _1956;
    out.m_81.w = _1954;
    float _2044 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2046 = _2042 * 0.5;
    float _2048 = _2042;
    float _2050 = _2046;
    float _2052 = _2044;
    float _2054 = _2038;
    if (!_1371)
    {
        _2048 = 1.0;
    }
    float _2056 = _2048;
    out.gl_Position.x = _1419;
    out.gl_Position.y = _1413;
    out.gl_Position.z = _2036;
    out.gl_Position.w = _1393;
    float _2058 = _2056;
    if (_1371)
    {
        bool _2060 = _1485 >= _1447;
        bool _2062 = isnan(_1485);
        bool _2064 = _2060 || _2062;
        bool _2066 = isnan(_1447);
        bool _2068 = _2064 || _2066;
        float _2070 = float(_2068);
        _2058 = _2070;
    }
    float _2072 = _2058;
    float _2074 = _1832 * _2044;
    float _2076 = precise::clamp(_2074, 0.0, 1.0);
    out.m_83.z = _2046;
    out.m_83.w = _1393;
    bool _2078 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2080 = isnan(_1596);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2086 = _2082 || _2084;
    float _2088 = _2072 * _1574;
    float _2090 = -_2076;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    float _2094 = -_2088;
    float _2096 = fma(_2094, _2092, 1.0);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = -_1932;
    float _2102 = _2100 + 1.0;
    out.m_87.x = _2022;
    out.m_87.y = _2024;
    out.m_87.z = _2032;
    float _2104 = _2098 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2106 = _1498 * _2102;
    float _2108 = _2102;
    float _2110 = _2098;
    if (!_2086)
    {
        _2050 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2112 = _2050;
    out.m_89.x = _2104;
    float _2114 = _2112;
    float _2116 = _2112;
    if (!_2086)
    {
        _1453 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2118 = _1453;
    float _2120 = _2118;
    float _2122 = _2118;
    if (!_2086)
    {
        _2052 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2124 = _2052;
    float _2126 = _2124;
    float _2128 = _2124;
    if (!_2086)
    {
        _2108 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2130 = _2108;
    float _2132 = _2130;
    float _2134 = _2130;
    if (!_2086)
    {
        _2110 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2136 = _2110;
    float _2138 = _1808 * _1940;
    float _2140 = fma(_1804, _2038, _1492);
    float _2142 = fma(_1806, _2038, _1494);
    float _2144 = _2136;
    float _2146 = _2136;
    if (!_2086)
    {
        _2054 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2148 = _2054;
    float _2150 = fma(_1498, _2138, _1496);
    out.m_91.x = _2140;
    out.m_91.y = _2142;
    out.m_91.z = _2150;
    out.m_91.w = _2106;
    bool _2152 = !_2086;
    float _2154 = _2148;
    float _2156 = _2148;
    if (!_2152)
    {
        bool _2158 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2160 = isnan(_1596);
        bool _2162 = _2158 || _2160;
        bool _2164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2166 = _2162 || _2164;
        if (!_2166)
        {
            float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2170 = _1596 + _2168;
            float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2174 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2172;
            float _2176 = 1.0 / _2174;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2188 = _2186 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2192 = _2190 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2198 = _2170 * _2176;
            float _2200 = precise::clamp(_2198, 0.0, 1.0);
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2206 = fma(_2200, _2180, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2208 = fma(_2200, _2204, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2210 = fma(_2200, _2184, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2212 = fma(_2200, _2188, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2214 = fma(_2200, _2192, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2216 = fma(_2200, _2196, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2122 = _2208;
            _2134 = _2214;
            _2116 = _2206;
            _2156 = _2212;
            _2128 = _2210;
            _2146 = _2216;
            _2218 = true;
        }
        else
        {
            bool _2220 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2222 = isnan(_1596);
            bool _2224 = _2220 || _2222;
            bool _2226 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2228 = _2224 || _2226;
            if (!_2228)
            {
                _2114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2230 = _2114;
            _2116 = _2230;
            if (!_2228)
            {
                _2120 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2232 = _2120;
            _2122 = _2232;
            if (!_2228)
            {
                _2126 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2234 = _2126;
            _2128 = _2234;
            if (!_2228)
            {
                _2154 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2236 = _2154;
            _2156 = _2236;
            if (!_2228)
            {
                _2132 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2238 = _2132;
            _2134 = _2238;
            if (!_2228)
            {
                _2144 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2240 = _2144;
            bool _2242 = !_2228;
            _2146 = _2240;
            if (!_2242)
            {
                bool _2244 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2246 = isnan(_1596);
                bool _2248 = _2244 || _2246;
                bool _2250 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2252 = _2248 || _2250;
                if (!_2252)
                {
                    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2256 = _1596 + _2254;
                    float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2260 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2258;
                    float _2262 = 1.0 / _2260;
                    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2284 = _2256 * _2262;
                    float _2286 = precise::clamp(_2284, 0.0, 1.0);
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2292 = fma(_2286, _2266, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2294 = fma(_2286, _2290, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2296 = fma(_2286, _2270, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2298 = fma(_2286, _2274, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2300 = fma(_2286, _2278, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2302 = fma(_2286, _2282, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2122 = _2294;
                    _2134 = _2300;
                    _2116 = _2292;
                    _2156 = _2298;
                    _2128 = _2296;
                    _2146 = _2302;
                    _2218 = true;
                }
                else
                {
                    _2122 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2134 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2156 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2128 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2146 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2218 = false;
    float _2304 = _2122;
    float _2306 = _2134;
    float _2308 = _2116;
    float _2310 = _2156;
    float _2312 = _2128;
    float _2314 = _2146;
    float _2316 = fma(_2024, -0.5, 0.5);
    float _2318 = precise::clamp(_2316, 0.0, 1.0);
    float _2320 = -_2304;
    float _2322 = _2320 + _2306;
    float _2324 = -_2308;
    float _2326 = _2324 + _2310;
    float _2328 = -_2312;
    float _2330 = _2328 + _2314;
    bool _2332 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2334 = fma(_2318, _2322, _2304);
    float _2336 = fma(_2318, _2326, _2308);
    float _2338 = fma(_2318, _2330, _2312);
    float _2340 = _2334 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2342 = fma(_2336, 0.298911988735198974609375, _2340);
    float _2344 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2346 = fma(_2338, 0.114477999508380889892578125, _2342);
    out.m_59.x = _2344;
    float _2348 = -_2346;
    float _2350 = _2336 + _2348;
    float _2352 = -_2346;
    float _2354 = _2334 + _2352;
    float _2356 = -_2346;
    float _2358 = _2338 + _2356;
    out.m_95.x = 0.0;
    float _2360 = fma(_2350, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2346);
    float _2362 = fma(_2354, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2346);
    float _2364 = fma(_2358, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2346);
    out.m_97.x = _2360;
    out.m_97.y = _2362;
    out.m_97.z = _2364;
    if (!_2332)
    {
        return out;
    }
    float _2366 = -_1279;
    float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2370 = -_1281;
    float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2374 = -_1283;
    float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2378 = _2368 * _2368;
    float _2380 = fma(_2372, _2372, _2378);
    float _2382 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = fma(_2376, _2376, _2380);
    float _2388 = _2384 * _2384;
    float _2390 = rsqrt(_2386);
    float _2392 = _2388 + (-1.0);
    float _2394 = _2368 * _2390;
    float _2396 = _2372 * _2390;
    float _2398 = _2376 * _2390;
    float _2400 = sqrt(_2386);
    float _2402 = -_1602;
    float _2404 = _2402 + _2394;
    float _2406 = -_1598;
    float _2408 = _2406 + _2396;
    float _2410 = -_1600;
    float _2412 = _2410 + _2398;
    float _2414 = _2404 * _2404;
    float _2416 = fma(_2408, _2408, _2414);
    float _2418 = fma(_2412, _2412, _2416);
    float _2420 = -_2400;
    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2424 = rsqrt(_2418);
    float _2426 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    float _2430 = abs(_2428);
    float _2432 = log2(_2430);
    float _2434 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2436 = _2404 * _2424;
    float _2438 = _2408 * _2424;
    float _2440 = _2412 * _2424;
    float _2442 = _2024 * _2436;
    float _2444 = _2024 * _2394;
    float _2446 = fma(_2022, _2438, _2442);
    float _2448 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2450 = fma(_2022, _2396, _2444);
    float _2452 = fma(_2032, _2440, _2446);
    float _2454 = precise::clamp(_2452, 0.0, 1.0);
    float _2456 = fma(_2032, _2398, _2450);
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = exp2(_2448);
    float _2462 = _2454 * _2454;
    float _2464 = fma(_2462, _2392, 1.0);
    float _2466 = -_2394;
    float _2468 = -_2434;
    float _2470 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2468);
    float _2472 = _2464 * _2464;
    float _2474 = -_2398;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2470);
    float _2478 = 1.0 / _2472;
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2482 = _2476 + _2480;
    float _2484 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = _2460 * _2486;
    float _2490 = _2458 * _2488;
    float _2492 = _2388 * _2478;
    float _2494 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2496 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2498 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2500 = _2490 * _2492;
    float _2502 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2504 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2506 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2494;
    out.m_93.y = _2496;
    out.m_93.z = _2498;
    out.m_95.x = _2502;
    out.m_95.y = _2504;
    out.m_95.z = _2506;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2218 = false;
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
        float _2563 = as_type<float>(_132);
        out.gl_Position.z = _2563;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_61.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_59.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2632 = as_type<float>(_170);
        out.gl_Position.z = _2632;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float2 _2759 = float2(_236, _240);
    float _242 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2759, float2(0.0), isnan(_2759)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2759, float2(0.0), isnan(_2759)), level(0.0)).x;
    float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _246 = log2(_244);
    float _248 = in.m_63.z;
    float _250 = in.m_63.x;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = in.m_63.y;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    float _266 = 1.0 / _254;
    float _268 = _246 * _150;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _272 = 1.0 + _270;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _276 = _274 != 0;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _284 = _282 != 0;
    float _286 = 1.0 / _258;
    float _288 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _202 + _290;
    bool _294 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _296 = isnan(1.0);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _302 = _298 || _300;
    float _304 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _288);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _202 + _306;
    bool _310 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _312 = isnan(0.0);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _318 = _314 || _316;
    float _320 = exp2(_268);
    float _322 = _248 * 2.0;
    float _324 = _292 * _266;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = _202 + _326;
    float _330 = _260 + _248;
    float _332 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _304);
    float _334 = 1.0 / _264;
    float _336 = _308 * _286;
    float _338 = _330 + (-1.0);
    float _340 = _250 + _260;
    float _342 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _346 = _340 + (-1.0);
    float _348 = 1.0 / _272;
    float _350 = _250 * 2.0;
    float _352 = -_320;
    float _354 = _352 + 1.0;
    float _356 = _250 + _248;
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _360 = _248 + (-0.5);
    float _362 = _318 ? _354 : 0.0;
    float _364 = floor(_322);
    float _366 = _260 * 2.0;
    float _368 = _328 * _334;
    float _370 = _356 + (-1.0);
    float _372 = floor(_350);
    int _374 = 2;
    float _376 = _222;
    if (_302)
    {
        float _378 = _362 * _348;
        _154 = _378;
    }
    float _380 = _154;
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    bool _388 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _390 = isnan(_202);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = floor(_366);
    bool _406 = _364 >= 0.0;
    bool _408 = isnan(_364);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = -_398;
    float _418 = _416 + 1.0;
    bool _420 = _364 > 0.0;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    int _426 = _414 ? 0 : 1;
    bool _428 = _372 >= 0.0;
    bool _430 = isnan(_372);
    bool _432 = _428 || _430;
    bool _434 = isnan(0.0);
    bool _436 = _432 || _434;
    float _438 = fma(_424, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _440 = _372 > 0.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _442;
    int _446 = _436 ? 0 : 1;
    bool _448 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _450 = isnan(_202);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = fma(_444, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _462 = _404 > 0.0;
    bool _464 = _404 >= 0.0;
    bool _466 = isnan(_404);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = fma(_386, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _480 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_202);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _496 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _498 = isnan(_202);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = fma(_478, _336, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = _458 * _418;
    float _512 = -_458;
    float _514 = _512 + 1.0;
    float _516 = fma(_402, _336, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = -_506;
    float _520 = _518 + 1.0;
    float _522 = fma(_494, _336, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = _506 * _514;
    float _526 = _490 * _520;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _528;
    float _532 = -_490;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _540;
    float _544 = _474 * _526;
    float _546 = _438 * _526;
    float _548 = _460 * _526;
    float _550 = fma(_530, _368, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _552 = fma(_538, _368, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _554 = fma(_542, _368, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _556 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _546);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _548);
    int _562 = _472 ? 0 : 1;
    float _564 = fma(_508, _524, _556);
    bool _566 = !_276;
    int _568 = _566 ? 0 : 1;
    float _570 = _342 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _572 = ~_446;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = fma(_516, _524, _558);
    int _580 = ~_562;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].x, _570);
    int _588 = _576;
    int _590 = _584;
    if (!_440)
    {
        int _592 = ~_446;
        int _594 = _592 + 1;
        _588 = _594;
    }
    int _596 = _588;
    float _598 = fma(_522, _524, _560);
    if (!_462)
    {
        int _600 = ~_562;
        int _602 = _600 + 1;
        _590 = _602;
    }
    int _604 = _590;
    float _606 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].z, _586);
    int _608 = abs(_568);
    float _610 = _342 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _612 = in.m_65.x;
    float _614 = in.m_65.y;
    float _616 = in.m_65.z;
    int _618 = ~_426;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = _606 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _626 = !_280;
    int _628 = _626 ? 0 : 1;
    float _630 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].x, _610);
    int _632 = _622;
    if (!_420)
    {
        int _634 = ~_426;
        int _636 = _634 + 1;
        _632 = _636;
    }
    int _638 = _632;
    float _640 = 1.0 / _624;
    int _642 = abs(_628);
    float _644 = fma(_550, _510, _564);
    float _646 = float(_608);
    float _648 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].z, _630);
    float _650 = float(_638);
    float _652 = fma(_554, _510, _598);
    float _654 = _648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _656 = float(_596);
    float _658 = _646 * _650;
    float _660 = float(_642);
    float _662 = fma(_552, _510, _578);
    bool _664 = !_284;
    int _666 = _664 ? 0 : 1;
    float _668 = _658 * (-2.0);
    float _670 = _654 + _624;
    float _672 = _660 * _656;
    int _674 = abs(_666);
    float _676 = fma(_358, _668, _358);
    float _678 = _250 + (-0.5);
    float _680 = fma(_668, _612, _612);
    float _682 = _670 * _640;
    float _684 = _682 * 0.5;
    float _686 = float(_674);
    float _688 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].x, _680);
    float _690 = _672 * (-2.0);
    float _692 = in.m_67.x;
    float _694 = in.m_67.y;
    float _696 = in.m_67.z;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _700 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[30].w, _698);
    float _702 = fma(_676, _380, _688);
    float _704 = float(_604);
    float _706 = _260 + (-0.5);
    float _708 = in.m_69.x;
    float _710 = in.m_69.y;
    float _712 = in.m_69.z;
    float _714 = fma(_690, _614, _614);
    float _716 = 1.0 / _700;
    float _718 = _686 * _704;
    float _720 = fma(_344, _690, _344);
    float _722 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[196].y, _714);
    float _724 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[146].x, _644);
    float _726 = _718 * (-2.0);
    float _728 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[146].y, _662);
    float _730 = fma(_720, _380, _722);
    float _732 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[146].z, _652);
    float _734 = fma(_726, _616, _616);
    float _736 = fma(_382, _726, _382);
    float _738 = _702 * 0.15915493667125701904296875;
    float _740 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _742 = _738 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = _342 + _740;
    float _748 = _724 * _692;
    float _750 = _730 * 0.15915493667125701904296875;
    float _752 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[196].z, _734);
    float _754 = _732 * _696;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _758 = _716 * _756;
    float _760 = fma(_736, _380, _752);
    float _762 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _708);
    float _766 = _728 * _694;
    float _768 = _760 * 0.15915493667125701904296875;
    bool _770 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _772 = _738 * 6.283185482025146484375;
    float _774 = cos(_772);
    bool _776 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _778 = _762 * _764;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _710);
    float _782 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _784 = !_770;
    int _786 = _784 ? 0 : 1;
    float _788 = _746 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _790 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = _750 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = _782 * _780;
    float _798 = _746 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _800 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    float _802 = _746;
    if (!_770)
    {
        _374 = 1;
    }
    int _804 = _374;
    float _806 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].x, _788);
    float _808 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].x, _798);
    int _810 = _804;
    if (!_776)
    {
        _810 = _786;
    }
    int _812 = _810;
    float _814 = _750 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _790 * _800;
    float _820 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].z, _808);
    int _822 = _812 << 6;
    float _824 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].z, _806);
    bool _826 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _828 = isnan(0.5);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _834 = _830 || _832;
    float _836 = _820 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _838 = _822 + 96;
    uint _841 = uint(int(uint(_838) >> uint(2)));
    uint _843 = uint(int(uint(int(_841)) >> uint(2)));
    int _845 = int(_841) & 3;
    float _847 = (*spvDescriptorSet0.vp_c15)._m0[int(_843)][_845];
    int _849 = int(_841) + 1;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    int _853 = _849 & 3;
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[int(_851)][_853];
    float _857 = _768 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = _774 * _794;
    float _863 = _744 * _794;
    float _865 = _824 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _867 = _822 + 48;
    uint _869 = uint(int(uint(_867) >> uint(2)));
    uint _871 = uint(int(uint(int(_869)) >> uint(2)));
    int _873 = int(_869) & 3;
    float _875 = (*spvDescriptorSet0.vp_c15)._m0[int(_871)][_873];
    int _877 = int(_869) + 1;
    uint _879 = uint(int(uint(_877) >> uint(2)));
    int _881 = _877 & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    float _885 = _768 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = _744 * _816;
    float _891 = _774 * _816;
    float _893 = _774 * _859;
    float _895 = _744 * _859;
    float _897 = trunc(_865);
    int _899 = int(_897);
    float _901 = _816 * _859;
    float _903 = _794 * _859;
    float _905 = _895 * _796;
    int _907 = _822 + 64;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    uint _911 = uint(int(uint(int(_909)) >> uint(2)));
    int _913 = int(_909) & 3;
    float _915 = (*spvDescriptorSet0.vp_c15)._m0[int(_911)][_913];
    int _917 = int(_909) + 1;
    uint _919 = uint(int(uint(_917) >> uint(2)));
    int _921 = _917 & 3;
    float _923 = (*spvDescriptorSet0.vp_c15)._m0[int(_919)][_921];
    float _925 = -_861;
    float _927 = fma(_887, _889, _925);
    float _929 = -_889;
    float _931 = fma(_887, _861, _929);
    float _933 = _893 * _796;
    float _935 = fma(_887, _891, _863);
    float _937 = trunc(_836);
    int _939 = int(_937);
    float _941 = -_796;
    float _943 = _887 * _941;
    float _945 = fma(_887, _863, _891);
    float _947 = fma(_935, _778, _933);
    float _949 = fma(_927, _778, _905);
    int _951 = _822 + 104;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    uint _955 = uint(int(uint(int(_953)) >> uint(2)));
    int _957 = int(_953) & 3;
    float _959 = (*spvDescriptorSet0.vp_c15)._m0[int(_955)][_957];
    int _961 = int(_953) + 1;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    int _965 = _961 & 3;
    float _967 = (*spvDescriptorSet0.vp_c15)._m0[int(_963)][_965];
    float _969 = fma(_901, _778, _943);
    float _971 = fma(_931, _818, _947);
    int _973 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _975 = _899 + _973;
    int _977 = _975 + 1;
    float _979 = fma(_903, _818, _969);
    float _981 = fma(_945, _818, _949);
    float _983 = _971 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _985 = _971 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _987 = _822 + 56;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.vp_c15)._m0[int(_999)][_1001];
    bool _1005 = _977 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1007 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[10].x, _983);
    int _1009 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1011 = _939 + _1009;
    int _1013 = _1011 + 1;
    float _1015 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[8].x, _985);
    float _1017 = _746 * _855;
    float _1019 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1007);
    int _1021 = _977 | _1013;
    int _1023 = _822 + 72;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    float _1041 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1015);
    float _1043 = _224 + _1019;
    bool _1045 = _1021 < 0;
    bool _1047 = _1045 || _1005;
    float _1049 = fma(_222, _847, _1017);
    float _1051 = _222 + _1041;
    float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1055 = _1043 + _1053;
    bool _1057 = _1013 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1059 = _1057 || _1047;
    int _1061 = _822 + 80;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
    int _1067 = int(_1063) & 3;
    float _1069 = (*spvDescriptorSet0.vp_c15)._m0[int(_1065)][_1067];
    int _1071 = int(_1063) + 1;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    int _1075 = _1071 & 3;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[int(_1073)][_1075];
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1081 = _1051 + _1079;
    float _1083 = _1055 * _1055;
    float _1085 = _971 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1087 = _746 * _883;
    float _1089 = fma(_1081, _1081, _1083);
    float _1091 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1085);
    float _1093 = fma(_222, _875, _1087);
    float _1095 = sqrt(_1089);
    float _1097 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1091);
    int _1099 = as_type<int>(_971);
    int _1101 = as_type<int>(_1049);
    float _1103 = _1051;
    float _1105 = _1043;
    float _1107 = _1081;
    if (!_1059)
    {
        int _1109 = _1013 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1111 = _1109 + _977;
        _1099 = _1111;
    }
    int _1113 = _1099;
    float _1115 = _746 * _923;
    float _1117 = _342 + _1097;
    float _1119 = fma(_222, _915, _1115);
    float _1121 = _979;
    int _1123 = as_type<int>(_967);
    float _1125 = _1119;
    float _1127 = as_type<float>(_1113);
    if (!_1059)
    {
        float _1129 = floor(_865);
        _1121 = _1129;
    }
    float _1131 = _1121;
    float _1133 = fma(_224, _959, _1049);
    if (!_1059)
    {
        int _1135 = _1113 << 2;
        _1101 = _1135;
    }
    int _1137 = _1101;
    bool _1139 = _1095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1141 = _1133 + _967;
    int _1143 = _1137;
    if (!_1059)
    {
        uint _1145 = uint(int(uint(_1113) >> uint(2)));
        _1123 = int(_1145);
    }
    int _1147 = _1123;
    if (!_1059)
    {
        int _1149 = 12 & _1137;
        _1143 = _1149;
    }
    int _1151 = _1143;
    float _1153 = 1.0 / _1141;
    float _1155 = fma(_224, _995, _1093);
    float _1157 = _1155 + _1003;
    float _1159 = fma(_224, _1031, _1119);
    int _1161 = as_type<int>(_1031);
    float _1163 = _1159;
    if (!_1059)
    {
        int _1165 = _1147 << 4;
        int _1167 = _1165 + _1151;
        _1161 = _1167;
    }
    int _1169 = _1161;
    if (!_1139)
    {
        _1125 = _1117;
    }
    float _1171 = _1125;
    float _1173 = _1159 + _1039;
    bool _1175 = !_1139;
    float _1177 = _1171;
    if (!_1175)
    {
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1183 = _1095 + _1181;
        float _1185 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1187 = rsqrt(_1089);
        float _1189 = _1183 * _1179;
        float _1191 = _1189 * 0.15915493667125701904296875;
        float _1193 = _1191 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = _1191 * 6.283185482025146484375;
        float _1199 = sin(_1197);
        float _1201 = _1195 + (-1.0);
        float _1203 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1205 = fma(_1199, _1185, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1207 = fma(_1117, _1195, _1203);
        float _1209 = _1187 * _1205;
        float _1211 = fma(_1081, _1209, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1213 = fma(_1055, _1209, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1103 = _1211;
        _1105 = _1213;
        _1177 = _1207;
        _1163 = _1199;
    }
    float _1215 = _1103;
    float _1217 = _1105;
    float _1219 = _1177;
    float _1221 = _1163;
    float _1223 = _1221;
    float _1225 = _1219;
    if (_834)
    {
        _1223 = _1215;
    }
    float _1227 = _1223;
    float _1229 = _1227;
    if (_834)
    {
        _1107 = _1217;
    }
    float _1231 = _1107;
    float _1233 = _1231;
    if (!_834)
    {
        float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1237 = _342 + _1235;
        float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1241 = _222 + _1239;
        float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1245 = -_224;
        float _1247 = _1245 + _1217;
        float _1249 = _1237 * _1237;
        float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1253 = _224 + _1251;
        float _1255 = fma(_1241, _1241, _1249);
        float _1257 = fma(_1253, _1253, _1255);
        float _1259 = -_342;
        float _1261 = _1259 + _1219;
        float _1263 = sqrt(_1257);
        float _1265 = precise::min(_1263, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1267 = _1265 * _1243;
        float _1269 = -_222;
        float _1271 = _1269 + _1215;
        float _1273 = fma(_1261, _1267, _342);
        float _1275 = fma(_1271, _1267, _222);
        float _1277 = fma(_1247, _1267, _224);
        _1225 = _1273;
        _1229 = _1275;
        _1233 = _1277;
    }
    float _1279 = _1225;
    float _1281 = _1229;
    float _1283 = _1233;
    int _1285 = _822 + 88;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    uint _1289 = uint(int(uint(int(_1287)) >> uint(2)));
    int _1291 = int(_1287) & 3;
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[int(_1289)][_1291];
    int _1295 = int(_1287) + 1;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    int _1299 = _1295 & 3;
    float _1301 = (*spvDescriptorSet0.vp_c15)._m0[int(_1297)][_1299];
    float _1303 = _1157 * _1153;
    float _1305 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1307 = _1173 * _1153;
    float _1309 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1313 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1305);
    bool _1315 = _1303 >= 0.0;
    float _1317 = _1215;
    if (!_1059)
    {
        int _1319 = _1169 + 400;
        uint _1321 = uint(int(uint(_1319) >> uint(2)));
        uint _1323 = uint(int(uint(int(_1321)) >> uint(2)));
        int _1325 = int(_1321) & 3;
        float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
        _1317 = _1327;
    }
    float _1329 = _1317;
    float _1331 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1333 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1311);
    float _1335 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1313);
    float _1337 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1339 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1331);
    float _1341 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1333);
    float _1343 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1345 = _1303 <= 1.0;
    bool _1347 = _1345 && _1315;
    float _1349 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1351 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1353 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1337);
    float _1355 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1357 = _1307 >= 0.0;
    bool _1359 = _1357 && _1347;
    float _1361 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1365 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1353);
    float _1367 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1355);
    bool _1369 = _1307 <= 1.0;
    bool _1371 = _1369 && _1359;
    float _1373 = -_1363;
    float _1375 = fma(_1373, _1361, 1.0);
    float _1377 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1379 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1367);
    float _1381 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1383 = _746 * _1077;
    float _1385 = _1117;
    float _1387 = _1361;
    if (!_1059)
    {
        float _1389 = floor(_836);
        _1385 = _1389;
    }
    float _1391 = _1385;
    float _1393 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1379);
    float _1395 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1397 = fma(_222, _1069, _1383);
    float _1399 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1395);
    if (_1371)
    {
        float _1401 = float(_812);
        _1387 = _1401;
    }
    float _1403 = _1387;
    float _1405 = 1.0 / _1393;
    float _1407 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1381);
    float _1409 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1411 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1407);
    float _1413 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    float _1415 = fma(_224, _1293, _1397);
    float _1417 = log2(_1375);
    float _1419 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1411);
    float _1421 = _1407;
    if (!_1059)
    {
        float _1423 = -_1391;
        float _1425 = _836 + _1423;
        _1421 = _1425;
    }
    float _1427 = _1421;
    float _1429 = _1415 + _1301;
    float _1431 = _1419 * _1405;
    float _1433 = _1383;
    float _1435 = _1429;
    if (_1371)
    {
        float _1437 = rint(_1403);
        float _1439 = precise::max(_1437, 0.0);
        uint _1441 = uint(_1439);
        uint _1443 = clamp(_1441, 0u, 65535u);
        _1433 = as_type<float>(_1443);
    }
    float _1445 = _1433;
    float _1447 = _1429 * _1153;
    float _1449 = _1413 * _1405;
    float _1451 = fma(_1431, 0.5, 0.5);
    float _1453 = _1447;
    if (!_1059)
    {
        float _1455 = -_1131;
        float _1457 = _865 + _1455;
        _1435 = _1457;
    }
    float _1459 = _1435;
    float _1461 = fma(_1449, -0.5, 0.5);
    float _1463 = _1431;
    if (!_1059)
    {
        float _1465 = rint(_1329);
        float _1467 = precise::max(_1465, 0.0);
        uint _1469 = uint(_1467);
        uint _1471 = clamp(_1469, 0u, 65535u);
        _1463 = as_type<float>(_1471);
    }
    float _1473 = _1463;
    float _1475 = _1417 * 0.693147182464599609375;
    float _1477 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1479 = _1403;
    float _1481 = _1475;
    if (_1371)
    {
        float3 _4746 = float3(_1303, _1307, float(as_type<int>(_1445)));
        float3 _4750 = select(_4746, float3(0.0), isnan(_4746));
        float _1483 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4750.xy, uint(rint(_4750.z)), _1447, level(0.0));
        _1479 = _1483;
    }
    float _1485 = _1479;
    float3 _4760 = float3(_1451, _1461, _1477);
    float _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4760, float3(0.0), isnan(_4760)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4760, float3(0.0), isnan(_4760)), level(0.0)).x;
    float3 _4769 = float3(_1451, _1461, _1477);
    float4 _1490 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4769, float3(0.0), isnan(_4769)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4769, float3(0.0), isnan(_4769)), level(0.0)).xyzw;
    float _1492 = _1490.x;
    float _1494 = _1490.y;
    float _1496 = _1490.z;
    float _1498 = _1490.w;
    float _1500 = _1405;
    if (!_1059)
    {
        float3 _4792 = float3(_1459, _1427, float(as_type<int>(_1473)));
        float3 _4794 = select(_4792, float3(0.0), isnan(_4792));
        float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4794.xy, uint(rint(_4794.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4794.xy, uint(rint(_4794.z)), level(0.0)).x;
        _1500 = _1502;
    }
    float _1504 = _1500;
    if (_1059)
    {
        _1481 = 1.0;
    }
    float _1506 = _1481;
    float _1508 = _1506;
    if (!_1059)
    {
        int _1510 = _1113 << 4;
        int _1512 = _1510 + 2048;
        uint _1514 = uint(int(uint(_1512) >> uint(2)));
        uint _1516 = uint(int(uint(int(_1514)) >> uint(2)));
        int _1518 = int(_1514) & 3;
        float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
        int _1522 = int(_1514) + 1;
        uint _1524 = uint(int(uint(_1522) >> uint(2)));
        int _1526 = _1522 & 3;
        float _1528 = (*spvDescriptorSet0.vp_c15)._m0[int(_1524)][_1526];
        int _1530 = _1512 + 8;
        uint _1532 = uint(int(uint(_1530) >> uint(2)));
        uint _1534 = uint(int(uint(int(_1532)) >> uint(2)));
        int _1536 = int(_1532) & 3;
        float _1538 = (*spvDescriptorSet0.vp_c15)._m0[int(_1534)][_1536];
        int _1540 = int(_1532) + 1;
        uint _1542 = uint(int(uint(_1540) >> uint(2)));
        int _1544 = _1540 & 3;
        float _1546 = (*spvDescriptorSet0.vp_c15)._m0[int(_1542)][_1544];
        float _1548 = _746 * _1528;
        float _1550 = fma(_222, _1520, _1548);
        float _1552 = fma(_224, _1538, _1550);
        float _1554 = _1552 + _1546;
        float _1556 = precise::clamp(_1554, 0.0, 1.0);
        float _1558 = -_1556;
        float _1560 = _1558 + _1504;
        float _1562 = fma(_1560, 500.0, 1.5);
        float _1564 = exp2(_1562);
        float _1566 = 0.0 + _1564;
        float _1568 = precise::clamp(_1566, 0.0, 1.0);
        _802 = _1548;
        _1127 = as_type<float>(_1512);
        _1508 = _1568;
    }
    float _1570 = _802;
    float _1572 = _1127;
    float _1574 = _1508;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1578 = _1279 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1582 = _1281 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1586 = _1283 + _1584;
    float _1588 = _1578 * _1578;
    float _1590 = fma(_1582, _1582, _1588);
    float _1592 = fma(_1586, _1586, _1590);
    float _1594 = rsqrt(_1592);
    float _1596 = sqrt(_1592);
    float _1598 = _1582 * _1594;
    float _1600 = _1586 * _1594;
    float _1602 = _1578 * _1594;
    float _1604 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1606 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 * _1606;
    float _1612 = _1608 + _1610;
    float _1614 = sqrt(_1612);
    bool _1616 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1620 = _1614 + _1618;
    float _1622 = _1451;
    float _1624 = _1620;
    float _1626 = _1572;
    float _1628 = _1604;
    float _1630 = _1606;
    float _1632 = _1608;
    float _1634 = _1610;
    if (_1616)
    {
        float _1636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1636;
    }
    float _1638 = _1622;
    if (_1616)
    {
        float _1640 = _1620 * _1638;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1616)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1626 = _1644;
    }
    float _1646 = _1626;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1650 = _1570;
    if (_1616)
    {
        float _1652 = _1646 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    float _1658 = precise::max(0.0, _1648);
    float _1660 = _1642;
    float _1662 = _1658;
    if (_1616)
    {
        float _1664 = _1646 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1602;
    float _1672 = -_1658;
    float _1674 = fma(_1670, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1672);
    if (_1616)
    {
        float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1676;
    }
    float _1678 = _1662;
    float _1680 = _1648;
    float _1682 = _1678;
    if (_1616)
    {
        float _1684 = rsqrt(_1612);
        _1680 = _1684;
    }
    float _1686 = _1680;
    float _1688 = _1656;
    if (_1616)
    {
        float _1690 = fma(_1656, _1678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _376 = _1690;
    }
    float _1692 = _376;
    float _1694 = _1692;
    if (_1616)
    {
        float _1696 = _1668 + (-1.0);
        _1682 = _1696;
    }
    float _1698 = _1682;
    if (_1616)
    {
        float _1700 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1700;
    }
    float _1702 = _1688;
    float _1704 = _1686;
    if (_1616)
    {
        float _1706 = _1686 * _1692;
        _1694 = _1706;
    }
    float _1708 = _1694;
    if (!_1616)
    {
        _1704 = _1674;
    }
    float _1710 = _1704;
    float _1712 = _1710;
    if (_1616)
    {
        float _1714 = fma(_1674, _1668, _1702);
        _1712 = _1714;
    }
    float _1716 = _1712;
    if (_1616)
    {
        float _1718 = _1604 * _1708;
        _1628 = _1718;
    }
    float _1720 = _1628;
    if (_1616)
    {
        float _1722 = _1606 * _1708;
        _1630 = _1722;
    }
    float _1724 = _1630;
    if (_1616)
    {
        float _1726 = _1720 * _1720;
        _1632 = _1726;
    }
    float _1728 = _1632;
    if (_1616)
    {
        float _1730 = _1724 * _1724;
        _1634 = _1730;
    }
    float _1732 = _1634;
    float _1734 = fma(_1716, _1716, _1728);
    float _1736 = _1734 + _1732;
    float _1738 = rsqrt(_1736);
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1742 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1740);
    float _1744 = precise::clamp(_1742, 0.0, 1.0);
    float _1746 = -_1744;
    float _1748 = _1746 + 1.0;
    float _1750 = abs(_1748);
    float _1752 = log2(_1750);
    float _1754 = _1738 * _1720;
    float _1756 = _1738 * _1716;
    float _1758 = _1738 * _1724;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1762 = -_1760;
    float _1764 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = -_1758;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1772 = exp2(_1766);
    float _1774 = fma(_1770, -0.5, 0.5);
    float _1776 = fma(_1770, 0.5, 0.5);
    float _1778 = _1756 + 1.0;
    float _1780 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1782 = sqrt(_1774);
    float _1784 = fma(_1776, _1780, -0.212114393711090087890625);
    float _1786 = fma(_1776, _1784, 1.570728778839111328125);
    float _1788 = -_1756;
    float _1790 = fma(_1772, _1778, _1788);
    float _1792 = fma(_1790, 0.5, 0.5);
    float _1794 = _1782 * 0.636619746685028076171875;
    float _1796 = -_1786;
    float _1798 = fma(_1794, _1796, 1.0);
    float2 _5252 = float2(_1798, _1792);
    float3 _1802 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5252, float2(0.0), isnan(_5252)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5252, float2(0.0), isnan(_5252)), level(0.0)).xyz;
    float _1804 = _1802.x;
    float _1806 = _1802.y;
    float _1808 = _1802.z;
    float _1810 = in.m_71.y;
    float _1812 = abs(_758);
    float _1814 = log2(_1812);
    bool _1816 = _260 > 0.5;
    float _1818 = in.m_71.x;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1822 = _1820 != 0;
    float _1824 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1828 = _1826 != 0;
    float _1830 = -_242;
    float _1832 = _1830 + 1.0;
    bool _1834 = _250 > 0.5;
    bool _1836 = _1834 && _1822;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_73.x = _1281;
    out.m_73.y = _1279;
    out.m_73.z = _1283;
    bool _1840 = _758 <= 8000.0;
    bool _1842 = isnan(_758);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(8000.0);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1854 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1856 = exp2(_1824);
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1860 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1864 = -_1810;
    float _1866 = _1864 + 1.0;
    float _1868 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = exp2(_1854);
    float _1872 = _1748;
    float _1874 = _1798;
    float _1876 = _1810;
    if (_1822)
    {
        _1872 = _1818;
    }
    float _1878 = _1872;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1882 = _1878;
    if (!_1822)
    {
        _1874 = _1818;
    }
    float _1884 = _1874;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1888 = _1884;
    if (_1828)
    {
        float _1890 = _1816 ? _1866 : _1810;
        _1876 = _1890;
    }
    float _1892 = _1876;
    if (_1836)
    {
        float _1894 = -_1878;
        float _1896 = _1894 + 1.0;
        _1882 = _1896;
    }
    float _1898 = _1882;
    float _1900 = in.m_75.x;
    float _1902 = in.m_75.y;
    float _1904 = in.m_75.z;
    bool _1906 = _710 != 0.0;
    bool _1908 = isnan(_710);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan(0.0);
    bool _1914 = _1910 || _1912;
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = -_1856;
    float _1920 = _1918 + 1.0;
    if (_1822)
    {
        _1888 = _1898;
    }
    float _1922 = _1888;
    float _1924 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1926 = _708 == 0.0;
    bool _1928 = !_1914;
    bool _1930 = _1926 && _1928;
    float _1932 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1934 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1936 = _712 == 0.0;
    bool _1938 = _1936 && _1930;
    float _1940 = _1932 * _1487;
    float _1942 = _1924 * _1838;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1946 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1934 * _1916;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1956 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _1950;
    out.m_77.y = _1860;
    out.m_77.z = _1868;
    float _1958 = _1902;
    float _1960 = _1900;
    float _1962 = _1904;
    if (!_1938)
    {
        float _1964 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1902);
        _1958 = _1964;
    }
    float _1966 = _1958;
    if (!_1938)
    {
        float _1968 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1900);
        _1960 = _1968;
    }
    float _1970 = _1960;
    if (!_1938)
    {
        float _1972 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1904);
        _1962 = _1972;
    }
    float _1974 = _1962;
    float _1976 = -_1966;
    float _1978 = _887 * _1976;
    float _1980 = _893 * _1966;
    float _1982 = _895 * _1966;
    float _1984 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1986 = precise::clamp(_1984, 0.0, 1.0);
    float _1988 = fma(_935, _1970, _1980);
    float _1990 = fma(_901, _1970, _1978);
    float _1992 = fma(_927, _1970, _1982);
    float _1994 = fma(_1986, -2.0, 3.0);
    float _1996 = _1986 * _1986;
    float _1998 = fma(_931, _1974, _1988);
    float _2000 = fma(_903, _1974, _1990);
    float _2002 = fma(_945, _1974, _1992);
    float _2004 = _1996 * _1994;
    float _2006 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2008 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2010 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2014 = fma(_2000, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2006);
    float _2016 = fma(_2000, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2008);
    float _2018 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2020 = fma(_2000, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2012);
    float _2022 = fma(_2002, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2014);
    float _2024 = fma(_2002, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2016);
    float _2026 = -_2004;
    float _2028 = _2026 + 1.0;
    float _2030 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2018);
    float _2032 = fma(_2002, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2020);
    float _2034 = fma(_2028, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2004);
    float _2036 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2030);
    float _2038 = _1498 * _1940;
    out.m_79.x = _1952;
    out.m_79.y = _1942;
    float _2040 = _1850 * _2034;
    float _2042 = _2036 + _1393;
    out.m_81.x = _1946;
    out.m_81.y = _1948;
    out.m_81.z = _1956;
    out.m_81.w = _1954;
    float _2044 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2046 = _2042 * 0.5;
    float _2048 = _2042;
    float _2050 = _2046;
    float _2052 = _2044;
    float _2054 = _2038;
    if (!_1371)
    {
        _2048 = 1.0;
    }
    float _2056 = _2048;
    out.gl_Position.x = _1419;
    out.gl_Position.y = _1413;
    out.gl_Position.z = _2036;
    out.gl_Position.w = _1393;
    float _2058 = _2056;
    if (_1371)
    {
        bool _2060 = _1485 >= _1447;
        bool _2062 = isnan(_1485);
        bool _2064 = _2060 || _2062;
        bool _2066 = isnan(_1447);
        bool _2068 = _2064 || _2066;
        float _2070 = float(_2068);
        _2058 = _2070;
    }
    float _2072 = _2058;
    float _2074 = _1832 * _2044;
    float _2076 = precise::clamp(_2074, 0.0, 1.0);
    out.m_83.z = _2046;
    out.m_83.w = _1393;
    bool _2078 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2080 = isnan(_1596);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2086 = _2082 || _2084;
    float _2088 = _2072 * _1574;
    float _2090 = -_2076;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    float _2094 = -_2088;
    float _2096 = fma(_2094, _2092, 1.0);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = -_1932;
    float _2102 = _2100 + 1.0;
    out.m_87.x = _2022;
    out.m_87.y = _2024;
    out.m_87.z = _2032;
    float _2104 = _2098 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2106 = _1498 * _2102;
    float _2108 = _2102;
    float _2110 = _2098;
    if (!_2086)
    {
        _2050 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2112 = _2050;
    out.m_89.x = _2104;
    float _2114 = _2112;
    float _2116 = _2112;
    if (!_2086)
    {
        _1453 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2118 = _1453;
    float _2120 = _2118;
    float _2122 = _2118;
    if (!_2086)
    {
        _2052 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2124 = _2052;
    float _2126 = _2124;
    float _2128 = _2124;
    if (!_2086)
    {
        _2108 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2130 = _2108;
    float _2132 = _2130;
    float _2134 = _2130;
    if (!_2086)
    {
        _2110 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2136 = _2110;
    float _2138 = _1808 * _1940;
    float _2140 = fma(_1804, _2038, _1492);
    float _2142 = fma(_1806, _2038, _1494);
    float _2144 = _2136;
    float _2146 = _2136;
    if (!_2086)
    {
        _2054 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2148 = _2054;
    float _2150 = fma(_1498, _2138, _1496);
    out.m_91.x = _2140;
    out.m_91.y = _2142;
    out.m_91.z = _2150;
    out.m_91.w = _2106;
    bool _2152 = !_2086;
    float _2154 = _2148;
    float _2156 = _2148;
    if (!_2152)
    {
        bool _2158 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2160 = isnan(_1596);
        bool _2162 = _2158 || _2160;
        bool _2164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2166 = _2162 || _2164;
        if (!_2166)
        {
            float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2170 = _1596 + _2168;
            float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2174 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2172;
            float _2176 = 1.0 / _2174;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2188 = _2186 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2192 = _2190 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2198 = _2170 * _2176;
            float _2200 = precise::clamp(_2198, 0.0, 1.0);
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2206 = fma(_2200, _2180, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2208 = fma(_2200, _2204, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2210 = fma(_2200, _2184, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2212 = fma(_2200, _2188, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2214 = fma(_2200, _2192, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2216 = fma(_2200, _2196, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2122 = _2208;
            _2134 = _2214;
            _2116 = _2206;
            _2156 = _2212;
            _2128 = _2210;
            _2146 = _2216;
            _2218 = true;
        }
        else
        {
            bool _2220 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2222 = isnan(_1596);
            bool _2224 = _2220 || _2222;
            bool _2226 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2228 = _2224 || _2226;
            if (!_2228)
            {
                _2114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2230 = _2114;
            _2116 = _2230;
            if (!_2228)
            {
                _2120 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2232 = _2120;
            _2122 = _2232;
            if (!_2228)
            {
                _2126 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2234 = _2126;
            _2128 = _2234;
            if (!_2228)
            {
                _2154 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2236 = _2154;
            _2156 = _2236;
            if (!_2228)
            {
                _2132 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2238 = _2132;
            _2134 = _2238;
            if (!_2228)
            {
                _2144 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2240 = _2144;
            bool _2242 = !_2228;
            _2146 = _2240;
            if (!_2242)
            {
                bool _2244 = _1596 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2246 = isnan(_1596);
                bool _2248 = _2244 || _2246;
                bool _2250 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2252 = _2248 || _2250;
                if (!_2252)
                {
                    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2256 = _1596 + _2254;
                    float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2260 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2258;
                    float _2262 = 1.0 / _2260;
                    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2284 = _2256 * _2262;
                    float _2286 = precise::clamp(_2284, 0.0, 1.0);
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2292 = fma(_2286, _2266, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2294 = fma(_2286, _2290, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2296 = fma(_2286, _2270, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2298 = fma(_2286, _2274, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2300 = fma(_2286, _2278, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2302 = fma(_2286, _2282, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2122 = _2294;
                    _2134 = _2300;
                    _2116 = _2292;
                    _2156 = _2298;
                    _2128 = _2296;
                    _2146 = _2302;
                    _2218 = true;
                }
                else
                {
                    _2122 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2134 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2156 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2128 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2146 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2218 = false;
    float _2304 = _2122;
    float _2306 = _2134;
    float _2308 = _2116;
    float _2310 = _2156;
    float _2312 = _2128;
    float _2314 = _2146;
    float _2316 = fma(_2024, -0.5, 0.5);
    float _2318 = precise::clamp(_2316, 0.0, 1.0);
    float _2320 = -_2304;
    float _2322 = _2320 + _2306;
    float _2324 = -_2308;
    float _2326 = _2324 + _2310;
    float _2328 = -_2312;
    float _2330 = _2328 + _2314;
    bool _2332 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2334 = fma(_2318, _2322, _2304);
    float _2336 = fma(_2318, _2326, _2308);
    float _2338 = fma(_2318, _2330, _2312);
    float _2340 = _2334 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2342 = fma(_2336, 0.298911988735198974609375, _2340);
    float _2344 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2346 = fma(_2338, 0.114477999508380889892578125, _2342);
    out.m_59.x = _2344;
    float _2348 = -_2346;
    float _2350 = _2336 + _2348;
    float _2352 = -_2346;
    float _2354 = _2334 + _2352;
    float _2356 = -_2346;
    float _2358 = _2338 + _2356;
    out.m_95.x = 0.0;
    float _2360 = fma(_2350, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2346);
    float _2362 = fma(_2354, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2346);
    float _2364 = fma(_2358, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2346);
    out.m_97.x = _2360;
    out.m_97.y = _2362;
    out.m_97.z = _2364;
    if (!_2332)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2366 = -_1279;
    float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2370 = -_1281;
    float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2374 = -_1283;
    float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2378 = _2368 * _2368;
    float _2380 = fma(_2372, _2372, _2378);
    float _2382 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = fma(_2376, _2376, _2380);
    float _2388 = _2384 * _2384;
    float _2390 = rsqrt(_2386);
    float _2392 = _2388 + (-1.0);
    float _2394 = _2368 * _2390;
    float _2396 = _2372 * _2390;
    float _2398 = _2376 * _2390;
    float _2400 = sqrt(_2386);
    float _2402 = -_1602;
    float _2404 = _2402 + _2394;
    float _2406 = -_1598;
    float _2408 = _2406 + _2396;
    float _2410 = -_1600;
    float _2412 = _2410 + _2398;
    float _2414 = _2404 * _2404;
    float _2416 = fma(_2408, _2408, _2414);
    float _2418 = fma(_2412, _2412, _2416);
    float _2420 = -_2400;
    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2424 = rsqrt(_2418);
    float _2426 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    float _2430 = abs(_2428);
    float _2432 = log2(_2430);
    float _2434 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2436 = _2404 * _2424;
    float _2438 = _2408 * _2424;
    float _2440 = _2412 * _2424;
    float _2442 = _2024 * _2436;
    float _2444 = _2024 * _2394;
    float _2446 = fma(_2022, _2438, _2442);
    float _2448 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2450 = fma(_2022, _2396, _2444);
    float _2452 = fma(_2032, _2440, _2446);
    float _2454 = precise::clamp(_2452, 0.0, 1.0);
    float _2456 = fma(_2032, _2398, _2450);
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = exp2(_2448);
    float _2462 = _2454 * _2454;
    float _2464 = fma(_2462, _2392, 1.0);
    float _2466 = -_2394;
    float _2468 = -_2434;
    float _2470 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2468);
    float _2472 = _2464 * _2464;
    float _2474 = -_2398;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2470);
    float _2478 = 1.0 / _2472;
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2482 = _2476 + _2480;
    float _2484 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = _2460 * _2486;
    float _2490 = _2458 * _2488;
    float _2492 = _2388 * _2478;
    float _2494 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2496 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2498 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2500 = _2490 * _2492;
    float _2502 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2504 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2506 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2494;
    out.m_93.y = _2496;
    out.m_93.z = _2498;
    out.m_95.x = _2502;
    out.m_95.y = _2504;
    out.m_95.z = _2506;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

