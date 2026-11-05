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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c11 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    const device _33* vp_s0 [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d_array<float> vp_t_tcb_14 [[id(16)]];
    sampler vp_t_tcb_14Smplr [[id(17)]];
    texture2d<float> vp_t_tcb_1C [[id(18)]];
    sampler vp_t_tcb_1CSmplr [[id(19)]];
    sampler vp_t_tcb_24Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_95 [[user(locn0)]];
    float4 m_91 [[user(locn1)]];
    float4 m_93 [[user(locn2)]];
    float4 m_101 [[user(locn3)]];
    float4 m_111 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_99 [[user(locn6)]];
    float4 m_103 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_109 [[user(locn10)]];
    float4 m_105 [[user(locn11)]];
    float4 m_107 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_87 [[attribute(0)]];
    float4 m_72 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_68 [[attribute(6)]];
    float4 m_76 [[attribute(7)]];
    float4 m_80 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2608 = false;
    bool _568 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_63.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_66.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2893 = as_type<float>(_146);
        out.gl_Position.z = _2893;
    }
    if (!_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_68.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    if (_160)
    {
        float _168 = float(_130);
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    if (_176)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _140;
    if (_176)
    {
        out.m_66.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _148 = as_type<int>(_180);
    }
    int _182 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2961 = as_type<float>(_182);
        out.gl_Position.z = _2961;
    }
    if (_176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _184 = in.m_70.x;
    float _186 = in.m_70.y;
    float _188 = in.m_70.z;
    float _190 = in.m_72.x;
    float _192 = in.m_72.y;
    float _194 = in.m_72.z;
    float _196 = in.m_74.x;
    float _198 = in.m_74.y;
    float _200 = in.m_74.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    bool _226 = _220 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _222;
    if (_226)
    {
        float _232 = rsqrt(_214);
        _230 = _232;
    }
    float _234 = _230;
    float _236 = 0.0;
    if (!_226)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    bool _240 = _224 > 0.0;
    float _242 = 0.0;
    float _244 = _224;
    float _246 = _238;
    if (!_226)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = _248;
    if (!_226)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = _220;
    float _256 = _252;
    if (_228)
    {
        float _258 = rsqrt(_216);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    if (!_228)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _266 = _262;
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    float _274 = _266;
    if (!_228)
    {
        _270 = 0.0;
    }
    float _276 = _270;
    float _278 = 0.0;
    float _280 = _276;
    if (_240)
    {
        float _282 = rsqrt(_218);
        _278 = _282;
    }
    float _284 = _278;
    if (_226)
    {
        float _286 = _234 * _190;
        _246 = _286;
    }
    float _288 = _246;
    if (_226)
    {
        float _290 = _234 * _184;
        _250 = _290;
    }
    float _292 = _250;
    if (_226)
    {
        float _294 = _234 * _196;
        _256 = _294;
    }
    float _296 = _256;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _300 = 0.0;
    float _302 = 0.0;
    if (!_240)
    {
        _300 = 0.0;
        _302 = 0.0;
    }
    float _304 = _300;
    float _306 = _302;
    float _308 = 0.0;
    float _310 = _304;
    float _312 = _306;
    if (!_240)
    {
        _308 = 0.0;
    }
    float _314 = _308;
    float _316 = _314;
    if (_228)
    {
        float _318 = _260 * _192;
        _280 = _318;
    }
    float _320 = _280;
    if (_228)
    {
        float _322 = _260 * _186;
        _272 = _322;
    }
    float _324 = _272;
    if (_228)
    {
        float _326 = _260 * _198;
        _274 = _326;
    }
    float _328 = _274;
    if (_240)
    {
        float _330 = _284 * _194;
        _310 = _330;
    }
    float _332 = _310;
    if (_240)
    {
        float _334 = _284 * _188;
        _316 = _334;
    }
    float _336 = _316;
    if (_240)
    {
        float _338 = _284 * _200;
        _312 = _338;
    }
    float _340 = _312;
    bool _342 = !_298;
    float _360;
    if (!_342)
    {
        float _344 = in.m_76.x;
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_130);
        float _366 = 1.0 / _364;
        float _368 = _164 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = in.m_76.x;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = _370 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _386;
    bool _390 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_370);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = 1.0 / _380;
    bool _404 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _406 = -_400;
    float _408 = _406 + 1.0;
    float _410 = 1.0 / _384;
    float _412 = 1.0 / _388;
    float _414 = _376 * _402;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _370 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _422 = _370 + _420;
    float _424 = _418 * _410;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _426;
    bool _430 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _432 = isnan(_370);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    bool _442 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_370);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = fma(_428, _414, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _456 = _440 * _408;
    float _458 = _422 * _412;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _460;
    bool _464 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _466 = isnan(_370);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _482 = fma(_462, _414, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _484 = -_440;
    float _486 = _484 + 1.0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = fma(_478, _424, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = _480 * _372;
    float _496 = _474 * _486;
    float _498 = -_474;
    float _500 = _498 + 1.0;
    float _502 = fma(_490, _424, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _504 = _452 * _500;
    float _506 = -_452;
    float _508 = _506 + 1.0;
    float _510 = trunc(_494);
    int _512 = int(_510);
    float _514 = _482 * _504;
    float _516 = _454 * _504;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _522;
    float _526 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[143].x, _514);
    float _528 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[143].y, _516);
    float _530 = fma(_520, _458, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _532 = fma(_524, _458, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _534 = fma(_492, _496, _526);
    float _536 = fma(_502, _496, _528);
    float _538 = fma(_530, _456, _534);
    float _540 = fma(_532, _456, _536);
    int _542 = _512 << 4;
    int _544 = _542 + 1712;
    float _546 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[146].x, _538);
    float _548 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[146].y, _540);
    bool _550 = !_404;
    float _566;
    if (!_550)
    {
        float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _554 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _558 = _556 * _552;
        float _560 = floor(_558);
        float _562 = -_560;
        float _564 = _558 + _562;
        _566 = _564;
        _568 = true;
    }
    else
    {
        float _570 = float(_130);
        float _572 = 1.0 / _570;
        float _574 = _164 * _572;
        _566 = _574;
    }
    _568 = false;
    float _576 = _566;
    float _578 = in.m_63.x;
    float _580 = in.m_63.y;
    float _582 = in.m_63.z;
    float _584 = in.m_74.w;
    float _586 = in.m_72.w;
    float _588 = _198 * _580;
    float _590 = _192 * _580;
    float _592 = fma(_196, _578, _588);
    float _594 = fma(_190, _578, _590);
    float _596 = fma(_200, _582, _592);
    float _598 = fma(_194, _582, _594);
    float _600 = _596 + _584;
    float _602 = _598 + _586;
    float _604 = fma(_600, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _606 = fma(_602, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _608 = floor(_604);
    float _610 = floor(_606);
    float _612 = -_608;
    float _614 = _604 + _612;
    float _616 = -_610;
    float _618 = _606 + _616;
    float2 _3615 = float2(_618, _614);
    float _620 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3615, float2(0.0), isnan(_3615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3615, float2(0.0), isnan(_3615)), level(0.0)).x;
    float _622 = in.m_78.w;
    float _624 = in.m_70.w;
    float _626 = _186 * _580;
    float _628 = in.m_80.x;
    float _630 = in.m_80.y;
    float _632 = trunc(_622);
    int _634 = int(_632);
    int _636 = _634 << 5;
    uint _639 = uint(int(uint(_636) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_639)];
    float _641 = as_type<float>(_dmw0.x);
    int _643 = _636 + 4;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    float _647 = as_type<float>(_dmw0.y);
    int _649 = _636 + 8;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    float _653 = as_type<float>(_dmw0.z);
    int _655 = _636 + 12;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    float _659 = as_type<float>(_dmw0.w);
    float _661 = fma(_184, _578, _626);
    float _663 = _548 * _630;
    float _665 = _546 * _628;
    float _667 = fma(_188, _582, _661);
    float _669 = _663 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _671 = _665 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _673 = _667 + _624;
    float _675 = as_type<float>(int(gl_VertexIndex));
    float _677 = _673 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _679 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[11].x, _677);
    float _681 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[11].z, _679);
    float _683 = _673 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _685 = _681 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _687 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[10].x, _683);
    float _689 = 1.0 / _685;
    float _691 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[10].z, _687);
    float _693 = _691 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _695 = as_type<int>(_675) & 1;
    bool _697 = _695 != 0;
    int _699 = as_type<int>(_675) & 2;
    bool _701 = _699 != 0;
    bool _703 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.5);
    bool _711 = _707 || _709;
    float _713 = _693 + _685;
    bool _715 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.5);
    bool _723 = _719 || _721;
    float _725 = _713 * _689;
    float _727 = _725 * 0.5;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _731 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[30].w, _729);
    float _733 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _735 = 1.0 / _731;
    bool _737 = !_701;
    float _739 = _737 ? (-0.5) : 0.5;
    float _741 = _673 + _733;
    bool _743 = !_697;
    float _745 = _743 ? (-0.5) : 0.5;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _739);
    float _749 = _741 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _745);
    float _753 = _669 * _747;
    float _755 = fma(_602, (*spvDescriptorSet0.vp_c15)._m0[126].x, _749);
    float _757 = _671 * _751;
    float _759 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _761 = fma(_600, (*spvDescriptorSet0.vp_c15)._m0[126].z, _755);
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _765 = _735 * _763;
    float _767 = _741 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _769 = _759 * _320;
    float _771 = _761 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _773 = _765 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _775 = fma(_602, (*spvDescriptorSet0.vp_c15)._m0[127].x, _767);
    bool _777 = _765 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _779 = _759 * _328;
    float _781 = fma(_757, _288, _769);
    float _783 = fma(_600, (*spvDescriptorSet0.vp_c15)._m0[127].z, _775);
    bool _785 = !_773;
    int _787 = _785 ? 0 : 1;
    float _789 = fma(_757, _296, _779);
    float _791 = trunc(_771);
    int _793 = int(_791);
    float _795 = _783 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _797 = -_753;
    float _799 = fma(_797, _332, _781);
    float _801 = -_753;
    float _803 = fma(_801, _340, _789);
    float _805 = _759 * _324;
    int _807 = 2;
    float _809 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _811 = _795;
    if (!_773)
    {
        _807 = 1;
    }
    int _813 = _807;
    float _815 = _602 + _799;
    int _817 = _813;
    if (!_777)
    {
        _817 = _787;
    }
    int _819 = _817;
    float _821 = trunc(_795);
    int _823 = int(_821);
    float _825 = _600 + _803;
    float _827 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _829 = _815 + _827;
    int _831 = _819 << 6;
    float _833 = fma(_757, _292, _805);
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _837 = _825 + _835;
    int _839 = _831 + 48;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    uint _843 = uint(int(uint(int(_841)) >> uint(2)));
    int _845 = int(_841) & 3;
    float _847 = (*spvDescriptorSet0.vp_c15)._m0[int(_843)][_845];
    int _849 = int(_841) + 1;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    int _853 = _849 & 3;
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[int(_851)][_853];
    int _857 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _859 = _793 + _857;
    int _861 = _859 + 1;
    float _863 = _837 * _837;
    float _865 = -_753;
    float _867 = fma(_865, _336, _833);
    bool _869 = _861 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _871 = _673 + _867;
    int _873 = _831 + 56;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    uint _877 = uint(int(uint(int(_875)) >> uint(2)));
    int _879 = int(_875) & 3;
    float _881 = (*spvDescriptorSet0.vp_c15)._m0[int(_877)][_879];
    int _883 = int(_875) + 1;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    int _887 = _883 & 3;
    float _889 = (*spvDescriptorSet0.vp_c15)._m0[int(_885)][_887];
    int _891 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _893 = _823 + _891;
    int _895 = _893 + 1;
    float _897 = fma(_829, _829, _863);
    int _899 = _861 | _895;
    float _901 = sqrt(_897);
    int _903 = _831 + 64;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    uint _907 = uint(int(uint(int(_905)) >> uint(2)));
    int _909 = int(_905) & 3;
    float _911 = (*spvDescriptorSet0.vp_c15)._m0[int(_907)][_909];
    int _913 = int(_905) + 1;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    int _917 = _913 & 3;
    float _919 = (*spvDescriptorSet0.vp_c15)._m0[int(_915)][_917];
    bool _921 = _899 < 0;
    bool _923 = _921 || _869;
    bool _925 = _895 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _927 = _925 || _923;
    int _929 = _831 + 72;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.vp_c15)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.vp_c15)._m0[int(_941)][_943];
    bool _947 = _901 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _949 = _831 + 96;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    uint _953 = uint(int(uint(int(_951)) >> uint(2)));
    int _955 = int(_951) & 3;
    float _957 = (*spvDescriptorSet0.vp_c15)._m0[int(_953)][_955];
    int _959 = int(_951) + 1;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    int _963 = _959 & 3;
    float _965 = (*spvDescriptorSet0.vp_c15)._m0[int(_961)][_963];
    int _967 = _861;
    if (!_927)
    {
        int _969 = _895 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _971 = _969 + _861;
        _967 = _971;
    }
    int _973 = _967;
    int _975 = 0;
    if (!_927)
    {
        int _977 = _973 << 2;
        _975 = _977;
    }
    int _979 = _975;
    int _981 = _831 + 104;
    uint _983 = uint(int(uint(_981) >> uint(2)));
    uint _985 = uint(int(uint(int(_983)) >> uint(2)));
    int _987 = int(_983) & 3;
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[int(_985)][_987];
    int _991 = int(_983) + 1;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    int _995 = _991 & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    float _999 = 0.0;
    int _1001 = _979;
    if (!_947)
    {
        _999 = _815;
    }
    float _1003 = _999;
    float _1005 = _1003;
    if (!_927)
    {
        int _1007 = 12 & _979;
        _1001 = _1007;
    }
    int _1009 = _1001;
    if (!_947)
    {
        _809 = _871;
    }
    float _1011 = _809;
    float _1013 = _659 * 2.0;
    float _1015 = _641 * 2.0;
    float _1017 = _647 * 2.0;
    float _1019 = _641 * _641;
    float _1021 = _653 * _1013;
    float _1023 = _647 * _1013;
    float _1025 = _641 * _1013;
    float _1027 = _653 * _653;
    float _1029 = -_1021;
    float _1031 = fma(_647, _1015, _1029);
    float _1033 = fma(_647, _1015, _1021);
    float _1035 = fma(_653, _1015, _1023);
    float _1037 = -_1023;
    float _1039 = fma(_653, _1015, _1037);
    float _1041 = -_1025;
    float _1043 = fma(_653, _1017, _1041);
    float _1045 = fma(_653, _1017, _1025);
    float _1047 = _647 * _647;
    float _1049 = _653;
    int _1051 = as_type<int>(_1019);
    float _1053 = _1011;
    if (!_947)
    {
        _1049 = _825;
    }
    float _1055 = _1049;
    float _1057 = fma(_1019, -2.0, 1.0);
    float _1059 = fma(_1047, -2.0, 1.0);
    float _1061 = _1055;
    if (!_927)
    {
        uint _1063 = uint(int(uint(_973) >> uint(2)));
        _1051 = int(_1063);
    }
    int _1065 = _1051;
    bool _1067 = !_947;
    float _1069 = 0.0;
    if (!_1067)
    {
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1075 = _901 + _1073;
        float _1077 = _871 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1079 = rsqrt(_897);
        float _1081 = _1075 * _1071;
        float _1083 = _1081 * 0.15915493667125701904296875;
        float _1085 = _1083 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = _1083 * 6.283185482025146484375;
        float _1091 = sin(_1089);
        float _1093 = _1087 + (-1.0);
        float _1095 = fma(_1091, _1077, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1099 = _1079 * _1095;
        float _1101 = fma(_871, _1087, _1097);
        float _1103 = fma(_829, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1105 = fma(_837, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1053 = _1101;
        _1069 = _1083;
        _1005 = _1103;
        _1061 = _1105;
    }
    float _1107 = _1053;
    float _1109 = _1069;
    float _1111 = _1005;
    float _1113 = _1061;
    float _1115 = _1109;
    if (!_927)
    {
        int _1117 = _1065 << 4;
        int _1119 = _1117 + _1009;
        _1115 = as_type<float>(_1119);
    }
    float _1121 = _1115;
    float _1123 = _741 * _965;
    float _1125 = -_673;
    float _1127 = _1125 + _1107;
    float _1129 = fma(_1027, -2.0, _1059);
    float _1131 = fma(_1027, -2.0, _1057);
    float _1133 = fma(_602, _957, _1123);
    float _1135 = _1121;
    if (!_927)
    {
        int _1137 = as_type<int>(_1121) + 400;
        uint _1139 = uint(int(uint(_1137) >> uint(2)));
        uint _1141 = uint(int(uint(int(_1139)) >> uint(2)));
        int _1143 = int(_1139) & 3;
        float _1145 = (*spvDescriptorSet0.vp_c15)._m0[int(_1141)][_1143];
        _1135 = _1145;
    }
    float _1147 = _1135;
    float _1149 = fma(_1047, -2.0, _1057);
    float _1151 = -_602;
    float _1153 = _1151 + _1111;
    float _1155 = _1127 * _324;
    float _1157 = fma(_600, _989, _1133);
    float _1159 = _1127 * _292;
    float _1161 = _1127 * _336;
    float _1163 = _741 * _855;
    float _1165 = -_600;
    float _1167 = _1165 + _1113;
    float _1169 = fma(_1153, _320, _1155);
    float _1171 = _1157 + _997;
    float _1173 = fma(_1153, _288, _1159);
    float _1175 = fma(_1153, _332, _1161);
    float _1177 = fma(_602, _847, _1163);
    float _1179 = fma(_1167, _328, _1169);
    float _1181 = _741 * _919;
    float _1183 = fma(_1167, _296, _1173);
    float _1185 = 1.0 / _1171;
    float _1187 = fma(_1167, _340, _1175);
    float _1189 = _1179 * _1031;
    float _1191 = _1179 * _1131;
    float _1193 = _1179 * _1045;
    int _1195 = _831 + 80;
    uint _1197 = uint(int(uint(_1195) >> uint(2)));
    uint _1199 = uint(int(uint(int(_1197)) >> uint(2)));
    int _1201 = int(_1197) & 3;
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[int(_1199)][_1201];
    int _1205 = int(_1197) + 1;
    uint _1207 = uint(int(uint(_1205) >> uint(2)));
    int _1209 = _1205 & 3;
    float _1211 = (*spvDescriptorSet0.vp_c15)._m0[int(_1207)][_1209];
    float _1213 = fma(_600, _881, _1177);
    float _1215 = fma(_1183, _1033, _1191);
    float _1217 = _997;
    float _1219 = _1171;
    float _1221 = _1149;
    if (!_927)
    {
        float _1223 = floor(_771);
        _1217 = _1223;
    }
    float _1225 = _1217;
    float _1227 = _1213 + _889;
    float _1229 = fma(_1187, _1043, _1215);
    int _1231 = _831 + 88;
    uint _1233 = uint(int(uint(_1231) >> uint(2)));
    uint _1235 = uint(int(uint(int(_1233)) >> uint(2)));
    int _1237 = int(_1233) & 3;
    float _1239 = (*spvDescriptorSet0.vp_c15)._m0[int(_1235)][_1237];
    int _1241 = int(_1233) + 1;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    int _1245 = _1241 & 3;
    float _1247 = (*spvDescriptorSet0.vp_c15)._m0[int(_1243)][_1245];
    float _1249 = fma(_602, _911, _1181);
    float _1251 = fma(_1183, _1129, _1189);
    float _1253 = fma(_1183, _1039, _1193);
    float _1255 = fma(_600, _937, _1249);
    float _1257 = fma(_1187, _1035, _1251);
    float _1259 = fma(_1187, _1149, _1253);
    float _1261 = _673 + _1229;
    float _1263 = _1255 + _945;
    float _1265 = _602 + _1257;
    float _1267 = _600 + _1259;
    float _1269 = _1227 * _1185;
    float _1271 = _1261;
    float _1273 = _1265;
    float _1275 = _1267;
    float _1277 = _1211;
    float _1279 = _1203;
    if (!_711)
    {
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1283 = _673 + _1281;
        float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1287 = _602 + _1285;
        float _1289 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1291 = _1283 * _1283;
        float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1295 = _600 + _1293;
        float _1297 = fma(_1287, _1287, _1291);
        float _1299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1301 = fma(_1295, _1295, _1297);
        float _1303 = sqrt(_1301);
        float _1305 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1307 = precise::min(_1303, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1309 = _1307 * _1299;
        float _1311 = _1305 * _1309;
        float _1313 = fma(_1229, _1311, _673);
        float _1315 = fma(_1257, _1311, _602);
        float _1317 = fma(_1259, _1311, _600);
        _1271 = _1313;
        _1273 = _1315;
        _1275 = _1317;
    }
    float _1319 = _1271;
    float _1321 = _1273;
    float _1323 = _1275;
    float _1325 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1327 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1329 = _889;
    if (!_927)
    {
        float _1331 = floor(_795);
        _1329 = _1331;
    }
    float _1333 = _1329;
    float _1335 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1325);
    float _1339 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1327);
    bool _1341 = _1269 >= 0.0;
    float _1343 = _1263 * _1185;
    float _1345 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1337);
    float _1347 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1349 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1339);
    float _1351 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1335);
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1355 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1347);
    float _1357 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1359 = _1269 <= 1.0;
    bool _1361 = _1359 && _1341;
    float _1363 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1365 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1355);
    float _1367 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1351);
    bool _1371 = _1343 >= 0.0;
    bool _1373 = _1371 && _1361;
    float _1375 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1377 = -_1363;
    float _1379 = fma(_1377, _1357, 1.0);
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1383 = _1365;
    if (_723)
    {
        _1383 = 1.0;
    }
    float _1385 = _1383;
    float _1387 = _1385;
    float _1389 = _1333;
    if (!_723)
    {
        float _1391 = as_type<float>(in.m_87.w);
        int _1393 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1395 = _1393 == 4;
        bool _1397 = _1393 == 8;
        bool _1399 = _1393 == 12;
        int _1401 = as_type<int>(_1391) << 16;
        int _1403 = as_type<int>(_1391) << 8;
        int _1405 = as_type<int>(_1391) << 24;
        int _1407 = _1401 >> 24;
        int _1409 = _1403 >> 24;
        int _1411 = as_type<int>(_1391) >> 24;
        int _1413 = _1405 >> 24;
        float _1415 = float(_1407);
        float _1417 = float(_1409);
        float _1419 = float(_1411);
        float _1421 = _1415 * 0.0078740157186985015869140625;
        float _1423 = float(_1413);
        float _1425 = _1417 * 0.0078740157186985015869140625;
        float _1427 = _1419 * 0.0078740157186985015869140625;
        float _1429 = precise::min(_1421, 1.0);
        float _1431 = _1423 * 0.0078740157186985015869140625;
        float _1433 = precise::min(_1425, 1.0);
        float _1435 = precise::min(_1427, 1.0);
        float _1437 = precise::min(_1431, 1.0);
        float _1439 = precise::max(_1429, -1.0);
        float _1441 = precise::max(_1433, -1.0);
        float _1443 = precise::max(_1435, -1.0);
        float _1445 = precise::max(_1437, -1.0);
        float _1447 = _1445;
        if (_1395)
        {
            _1447 = _1439;
        }
        float _1449 = _1447;
        float _1451 = _1449;
        if (_1397)
        {
            _1451 = _1441;
        }
        float _1453 = _1451;
        float _1455 = _1453;
        if (_1399)
        {
            _1455 = _1443;
        }
        float _1457 = _1455;
        float _1459 = abs(_1457);
        float _1461 = (-0.0) + _1459;
        _1387 = _1461;
    }
    float _1463 = _1387;
    float _1465 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1381);
    bool _1467 = _1343 <= 1.0;
    bool _1469 = _1467 && _1373;
    float _1471 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1473 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1475 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1465);
    float _1477 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1479 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1471);
    bool _1481 = _1463 != 0.0;
    bool _1483 = isnan(_1463);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan(0.0);
    bool _1489 = _1485 || _1487;
    float _1491 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1475);
    float _1493 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1477);
    float _1495 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1479);
    float _1497 = log2(_1379);
    float _1499 = _741 * _1211;
    float _1501 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1493);
    float _1503 = _1479;
    if (_1469)
    {
        float _1505 = float(_819);
        _1503 = _1505;
    }
    float _1507 = _1503;
    float _1509 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1495);
    float _1511 = fma(_602, _1203, _1499);
    if (!_927)
    {
        float _1513 = -_1333;
        float _1515 = _795 + _1513;
        _1219 = _1515;
    }
    float _1517 = _1219;
    float _1519 = _1517;
    if (!_927)
    {
        float _1521 = -_1225;
        float _1523 = _771 + _1521;
        _1389 = _1523;
    }
    float _1525 = _1389;
    float _1527 = 1.0 / _1491;
    float _1529 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    if (_1489)
    {
        _1277 = _1509;
    }
    float _1531 = _1277;
    float _1533 = fma(_600, _1239, _1511);
    float _1535 = _1531;
    if (_1489)
    {
        _1279 = _1529;
    }
    float _1537 = _1279;
    float _1539 = _1537;
    if (!_1489)
    {
        _1535 = 0.0;
        _1539 = 0.0;
    }
    float _1541 = _1535;
    float _1543 = _1539;
    float _1545 = _1501;
    if (_1469)
    {
        float _1547 = rint(_1507);
        float _1549 = precise::max(_1547, 0.0);
        uint _1551 = uint(_1549);
        uint _1553 = clamp(_1551, 0u, 65535u);
        _1545 = as_type<float>(_1553);
    }
    float _1555 = _1545;
    float _1557 = _1533 + _1247;
    float _1559 = _1497 * 0.693147182464599609375;
    float _1561 = _1557 * _1185;
    float _1563 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1565 = _1495;
    if (!_927)
    {
        float _1567 = rint(_1147);
        float _1569 = precise::max(_1567, 0.0);
        uint _1571 = uint(_1569);
        uint _1573 = clamp(_1571, 0u, 65535u);
        _1565 = as_type<float>(_1573);
    }
    float _1575 = _1565;
    float _1577 = _1527 * _1541;
    float _1579 = _1527 * _1543;
    float _1581 = fma(_1577, 0.5, 0.5);
    float _1583 = fma(_1579, -0.5, 0.5);
    float _1585 = _1343;
    float _1587 = _1581;
    float _1589 = _1583;
    if (_1469)
    {
        float3 _5173 = float3(_1269, _1343, float(as_type<int>(_1555)));
        float3 _5177 = select(_5173, float3(0.0), isnan(_5173));
        float _1591 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5177.xy, uint(rint(_5177.z)), _1561, level(0.0));
        _1585 = _1591;
    }
    float _1593 = _1585;
    float3 _5187 = float3(_1581, _1583, _1563);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5187, float3(0.0), isnan(_5187)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5187, float3(0.0), isnan(_5187)), level(0.0)).x;
    float3 _5196 = float3(_1581, _1583, _1563);
    float4 _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5196, float3(0.0), isnan(_5196)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5196, float3(0.0), isnan(_5196)), level(0.0)).xyzw;
    float _1600 = _1598.x;
    float _1602 = _1598.y;
    float _1604 = _1598.z;
    float _1606 = _1598.w;
    float _1608 = _1225;
    if (!_927)
    {
        float3 _5219 = float3(_1525, _1517, float(as_type<int>(_1575)));
        float3 _5221 = select(_5219, float3(0.0), isnan(_5219));
        float _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5221.xy, uint(rint(_5221.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5221.xy, uint(rint(_5221.z)), level(0.0)).x;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (_927)
    {
        _811 = 1.0;
    }
    float _1614 = _811;
    float _1616 = _1614;
    if (!_927)
    {
        int _1618 = _973 << 4;
        int _1620 = _1618 + 2048;
        uint _1622 = uint(int(uint(_1620) >> uint(2)));
        uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
        int _1626 = int(_1622) & 3;
        float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
        int _1630 = int(_1622) + 1;
        uint _1632 = uint(int(uint(_1630) >> uint(2)));
        int _1634 = _1630 & 3;
        float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
        int _1638 = _1620 + 8;
        uint _1640 = uint(int(uint(_1638) >> uint(2)));
        uint _1642 = uint(int(uint(int(_1640)) >> uint(2)));
        int _1644 = int(_1640) & 3;
        float _1646 = (*spvDescriptorSet0.vp_c15)._m0[int(_1642)][_1644];
        int _1648 = int(_1640) + 1;
        uint _1650 = uint(int(uint(_1648) >> uint(2)));
        int _1652 = _1648 & 3;
        float _1654 = (*spvDescriptorSet0.vp_c15)._m0[int(_1650)][_1652];
        float _1656 = _741 * _1636;
        float _1658 = fma(_602, _1628, _1656);
        float _1660 = fma(_600, _1646, _1658);
        float _1662 = _1660 + _1654;
        float _1664 = precise::clamp(_1662, 0.0, 1.0);
        float _1666 = -_1664;
        float _1668 = _1666 + _1612;
        float _1670 = fma(_1668, 500.0, 1.5);
        float _1672 = exp2(_1670);
        float _1674 = 0.0 + _1672;
        float _1676 = precise::clamp(_1674, 0.0, 1.0);
        _1616 = _1676;
    }
    float _1678 = _1616;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1682 = _1319 + _1680;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1686 = _1321 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1690 = _1323 + _1688;
    float _1692 = _1682 * _1682;
    float _1694 = fma(_1686, _1686, _1692);
    float _1696 = fma(_1690, _1690, _1694);
    float _1698 = rsqrt(_1696);
    float _1700 = sqrt(_1696);
    float _1702 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1704 = _1686 * _1702;
    float _1706 = _1690 * _1702;
    float _1708 = _1704 * _1704;
    float _1710 = _1706 * _1706;
    float _1712 = _1708 + _1710;
    float _1714 = sqrt(_1712);
    bool _1716 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1720 = _1714 + _1718;
    float _1722 = _1698;
    float _1724 = _1720;
    float _1726 = _1682;
    if (_1716)
    {
        float _1728 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1722 = _1728;
    }
    float _1730 = _1722;
    if (_1716)
    {
        float _1732 = rsqrt(_1712);
        _1587 = _1732;
    }
    float _1734 = _1587;
    float _1736 = _1734;
    if (_1716)
    {
        float _1738 = _1720 * _1730;
        _1724 = _1738;
    }
    float _1740 = _1724;
    if (_1716)
    {
        float _1742 = _1740 * 0.15915493667125701904296875;
        _1589 = _1742;
    }
    float _1744 = _1589;
    float _1746 = _1690;
    if (_1716)
    {
        float _1748 = _1744 * 6.283185482025146484375;
        float _1750 = sin(_1748);
        _1746 = _1750;
    }
    float _1752 = _1746;
    float _1754 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1756 = precise::max(0.0, _1754);
    float _1758 = _1730;
    float _1760 = _1756;
    if (_1716)
    {
        float _1762 = _1744 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        _1758 = _1764;
    }
    float _1766 = _1758;
    float _1768 = -_1702;
    float _1770 = -_1756;
    float _1772 = fma(_1682, _1768, _1770);
    if (_1716)
    {
        float _1774 = _1772 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1774;
    }
    float _1776 = _1726;
    float _1778 = _1776;
    float _1780 = _1752;
    if (_1716)
    {
        float _1782 = fma(_1752, _1776, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1778 = _1782;
    }
    float _1784 = _1778;
    float _1786 = _1784;
    if (!_1716)
    {
        _1780 = _1704;
    }
    float _1788 = _1780;
    float _1790 = _1788;
    float _1792 = _1766;
    if (_1716)
    {
        float _1794 = _1766 + (-1.0);
        _1760 = _1794;
    }
    float _1796 = _1760;
    float _1798 = 0.0;
    float _1800 = _1796;
    if (_1716)
    {
        float _1802 = _1734 * _1784;
        _1798 = _1802;
    }
    float _1804 = _1798;
    if (!_1716)
    {
        _1786 = _1772;
    }
    float _1806 = _1786;
    float _1808 = _1806;
    if (_1716)
    {
        float _1810 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1810;
    }
    float _1812 = _1519;
    if (_1716)
    {
        float _1814 = _1704 * _1804;
        _1790 = _1814;
    }
    float _1816 = _1790;
    if (!_1716)
    {
        _1800 = _1706;
    }
    float _1818 = _1800;
    float _1820 = _1818;
    if (_1716)
    {
        float _1822 = _1706 * _1804;
        _1820 = _1822;
    }
    float _1824 = _1820;
    if (!_1716)
    {
        _1736 = _1708;
    }
    float _1826 = _1736;
    float _1828 = _1826;
    if (_1716)
    {
        float _1830 = fma(_1772, _1766, _1812);
        _1808 = _1830;
    }
    float _1832 = _1808;
    if (_1716)
    {
        float _1834 = _1816 * _1816;
        _1828 = _1834;
    }
    float _1836 = _1828;
    if (!_1716)
    {
        _1792 = _1710;
    }
    float _1838 = _1792;
    float _1840 = _1838;
    if (_1716)
    {
        float _1842 = _1824 * _1824;
        _1840 = _1842;
    }
    float _1844 = _1840;
    float _1846 = fma(_1832, _1832, _1836);
    float _1848 = _1846 + _1844;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1852 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1850);
    float _1854 = precise::clamp(_1852, 0.0, 1.0);
    float _1856 = -_1854;
    float _1858 = _1856 + 1.0;
    float _1860 = rsqrt(_1848);
    float _1862 = abs(_1858);
    float _1864 = log2(_1862);
    float _1866 = _1860 * _1816;
    float _1868 = _1860 * _1832;
    float _1870 = _1860 * _1824;
    float _1872 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1874 = -_1872;
    float _1876 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1874);
    float _1878 = -_1870;
    float _1880 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1876);
    float _1882 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1884 = fma(_1880, -0.5, 0.5);
    float _1886 = fma(_1880, 0.5, 0.5);
    float _1888 = exp2(_1882);
    float _1890 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = fma(_1886, _1890, -0.212114393711090087890625);
    float _1894 = _1868 + 1.0;
    float _1896 = sqrt(_1884);
    float _1898 = fma(_1886, _1892, 1.570728778839111328125);
    float _1900 = -_1868;
    float _1902 = fma(_1888, _1894, _1900);
    float _1904 = fma(_1902, 0.5, 0.5);
    float _1906 = _1896 * 0.636619746685028076171875;
    float _1908 = -_1898;
    float _1910 = fma(_1906, _1908, 1.0);
    float2 _5690 = float2(_1910, _1904);
    float3 _1914 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5690, float2(0.0), isnan(_5690)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5690, float2(0.0), isnan(_5690)), level(0.0)).xyz;
    float _1916 = _1914.x;
    float _1918 = _1914.y;
    float _1920 = _1914.z;
    float _1922 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1924 = in.m_76.y;
    float _1926 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1928 = _1922 * _372;
    float _1930 = in.m_76.w;
    bool _1932 = _372 > 0.5;
    float _1934 = exp2(_1926);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1938 = _1936 != 0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1944 = in.m_76.z;
    bool _1946 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1948 = isnan(_576);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1954 = _1950 || _1952;
    float _1956 = float(_1954);
    float _1958 = -_620;
    float _1960 = _1958 + 1.0;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1964 = _1962 != 0;
    out.m_89.x = _1321;
    out.m_89.y = _1319;
    out.m_89.z = _1323;
    float _1966 = trunc(_1928);
    int _1968 = int(_1966);
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1972 = _1970 != 0;
    float _1974 = 1.0 / _1942;
    bool _1976 = _1924 > 0.5;
    bool _1978 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1980 = isnan(_576);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1986 = _1982 || _1984;
    float _1988 = float(_1986);
    float _1990 = -_739;
    int _1992 = _1976 ? as_type<int>(_1990) : as_type<int>(_739);
    int _1994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1996 = _1994 != 0;
    int _1998 = _1968 << 4;
    int _2000 = _1998 + 1968;
    float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2002;
    bool _2006 = !_1938;
    float _2008 = _2006 ? _739 : as_type<float>(_1992);
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2012 = uint(int(uint(_2000) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    bool _2028 = _1930 > 0.5;
    float _2030 = _2004 * _1974;
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2034 = _576 + _2032;
    float _2036 = -_1988;
    float _2038 = _2036 + 1.0;
    float _2040 = -_739;
    int _2042 = _2028 ? as_type<int>(_2040) : as_type<int>(_739);
    float _2044 = -_2008;
    float _2046 = _2044 + 0.5;
    int _2048 = _2000 + 8;
    uint _2050 = uint(int(uint(_2048) >> uint(2)));
    uint _2052 = uint(int(uint(int(_2050)) >> uint(2)));
    int _2054 = int(_2050) & 3;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[int(_2052)][_2054];
    float _2058 = fma(_2030, _2034, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2060 = _1944 > 0.5;
    float _2062 = _1956 * _2038;
    float _2064 = -_1956;
    float _2066 = _2064 + 1.0;
    float _2068 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    uint _2070 = uint(int(uint(_544) >> uint(2)));
    uint _2072 = uint(int(uint(int(_2070)) >> uint(2)));
    int _2074 = int(_2070) & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = int(_2070) + 1;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    int _2082 = _2078 & 3;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[int(_2080)][_2082];
    float _2086 = _2058 * _2062;
    bool _2088 = !_1964;
    float _2090 = _2088 ? _739 : as_type<float>(_2042);
    float _2092 = _739 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2096 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2094);
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2100 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2098);
    float _2102 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2086);
    float _2104 = fma(_2092, _2092, 1.0);
    float _2106 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2096);
    float _2108 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2100);
    float _2110 = -_2090;
    float _2112 = _2110 + 0.5;
    float _2114 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2102);
    float _2116 = _602 + _2106;
    float _2118 = rsqrt(_2104);
    float _2120 = -_745;
    int _2122 = _1932 ? as_type<int>(_2120) : as_type<int>(_745);
    int _2124 = _544 + 8;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    uint _2128 = uint(int(uint(int(_2126)) >> uint(2)));
    int _2130 = int(_2126) & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    bool _2134 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2136 = isnan(0.0);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2142 = _2138 || _2140;
    float _2144 = _600 + _2108;
    bool _2146 = !_1972;
    float _2148 = _2146 ? _745 : as_type<float>(_2122);
    float _2150 = _745 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2152 = -_745;
    int _2154 = _2060 ? as_type<int>(_2152) : as_type<int>(_745);
    float _2156 = -_2144;
    float _2158 = _2156 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2162 = fma(_2150, _292, _324);
    float _2164 = fma(_2150, _296, _328);
    float _2166 = _2148 + 0.5;
    float _2168 = precise::min(_2144, _2158);
    bool _2170 = !_1996;
    float _2172 = _2170 ? _745 : as_type<float>(_2154);
    float _2174 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_2142)
    {
        float _2176 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2174 = _2176;
    }
    float _2178 = _2174;
    float _2180 = -_332;
    float _2182 = _2118 * _2180;
    float _2184 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2186 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2188 = fma(_2150, _288, _320);
    float _2190 = _2026 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2192 = _2178;
    if (_2142)
    {
        float _2194 = precise::min(_2178, 20.0);
        _2192 = _2194;
    }
    float _2196 = _2192;
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2200 = -_2092;
    float _2202 = fma(_2200, _332, _2188);
    float _2204 = -_2092;
    float _2206 = fma(_2204, _336, _2162);
    float _2208 = -_2092;
    float _2210 = fma(_2208, _340, _2164);
    float _2212 = _2056 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2214 = _2092 * _2118;
    float _2216 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2218 = -_336;
    float _2220 = _2118 * _2218;
    float _2222 = -_340;
    float _2224 = _2118 * _2222;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2230 = -_2116;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2234 = _2076 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2236 = -_2214;
    float _2238 = fma(_2236, _328, _2224);
    out.m_91.x = _2198;
    out.m_91.y = _2216;
    out.m_91.z = _2226;
    float _2240 = _2206 * _1131;
    float _2242 = precise::min(_2116, _2232);
    float _2244 = -_2214;
    float _2246 = fma(_2244, _320, _2182);
    float _2248 = _2076;
    float _2250 = _2084;
    if (_2142)
    {
        float _2252 = 1.0 / _2196;
        _2248 = _2252;
    }
    float _2254 = _2248;
    float _2256 = _2084 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2258 = precise::min(_2242, _2168);
    float _2260 = _2172 + 0.5;
    if (!_2142)
    {
        _2250 = 1.0;
    }
    float _2262 = _2250;
    float _2264 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2266 = _2256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2184 * _2010;
    float _2270 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2274 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2276 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2278 = _2270 * _2228;
    float _2280 = -_2214;
    float _2282 = fma(_2280, _324, _2220);
    float _2284 = _2206 * _1031;
    float _2286 = _2262;
    if (_2142)
    {
        float _2288 = _2258 * _2254;
        float _2290 = precise::clamp(_2288, 0.0, 1.0);
        _2286 = _2290;
    }
    float _2292 = _2286;
    float _2294 = _1031 * _292;
    float _2296 = _2282 * _1031;
    float _2298 = _2206 * _1045;
    float _2300 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2302 = abs(_765);
    float _2304 = log2(_2302);
    float _2306 = _2274 * _2160;
    float _2308 = _1131 * _292;
    float _2310 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2312 = _1045 * _292;
    float _2314 = _2276 * _2272;
    float _2316 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2318 = fma(_1033, _288, _2308);
    float _2320 = fma(_2202, _1039, _2298);
    float _2322 = _2282 * _1131;
    out.m_93.x = _2268;
    out.m_93.y = _2306;
    out.m_93.z = _2314;
    out.m_93.w = _2278;
    bool _2324 = _765 <= 8000.0;
    bool _2326 = isnan(_765);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan(8000.0);
    bool _2332 = _2328 || _2330;
    float _2334 = float(_2332);
    out.m_95.x = _2264;
    out.m_95.y = _2266;
    out.m_95.z = _2310;
    out.m_95.w = _2316;
    float _2336 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2338 = exp2(_2336);
    float _2340 = _2282 * _1045;
    float _2342 = fma(_1129, _288, _2294);
    float _2344 = fma(_1039, _288, _2312);
    float _2346 = fma(_2202, _1129, _2284);
    float _2348 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2350 = fma(_2246, _1039, _2340);
    float _2352 = fma(_1035, _296, _2342);
    float _2354 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2348);
    float _2356 = fma(_2238, _1149, _2350);
    float _2358 = fma(_1043, _296, _2318);
    float _2360 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2354);
    float _2362 = fma(_1149, _296, _2344);
    float _2364 = fma(_2246, _1129, _2296);
    float _2366 = fma(_2202, _1033, _2240);
    float _2368 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2360);
    float _2370 = fma(_2246, _1033, _2322);
    out.m_97.x = _2352;
    out.m_97.y = _2358;
    out.m_97.z = _2362;
    float _2372 = fma(_2238, _1035, _2364);
    float _2374 = _2368 + _1491;
    float _2376 = fma(_2238, _1043, _2370);
    float _2378 = _2370;
    float _2380 = _2334;
    if (!_1489)
    {
        _2378 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2382 = _2378;
    float _2384 = _2374 * 0.5;
    float _2386 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2388 = precise::clamp(_2386, 0.0, 1.0);
    out.gl_Position.x = _1509;
    out.gl_Position.y = _1529;
    out.gl_Position.z = _2368;
    out.gl_Position.w = _1491;
    int _2390 = as_type<int>(_2382);
    if (!_1489)
    {
        float _2392 = _2382 * 5.0;
        _2390 = as_type<int>(_2392);
    }
    int _2394 = _2390;
    float _2396 = fma(_2388, -2.0, 3.0);
    float _2398 = fma(_2210, _1035, _2346);
    float _2400 = _2388 * _2388;
    float _2402 = -_1934;
    float _2404 = _2402 + 1.0;
    float _2406 = fma(_2210, _1043, _2366);
    if (!_1489)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6536 = as_type<float>(_2394);
        out.gl_Position.z = _6536;
    }
    float _2408 = _2400 * _2396;
    float _2410 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2412 = fma(_2210, _1149, _2320);
    out.m_99.x = _2372;
    out.m_99.y = _2376;
    out.m_99.z = _2356;
    float _2414 = -_2408;
    float _2416 = _2414 + 1.0;
    float _2418 = _2410 * _1595;
    float _2420 = -_2410;
    float _2422 = _2420 + 1.0;
    out.m_101.z = _2384;
    out.m_101.w = _1491;
    float _2424 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2408);
    float _2426 = _2292 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2428 = _1606 * _2422;
    float _2430 = _1606 * _2418;
    float _2432 = _2334 * _2424;
    float _2434 = _2410;
    float _2436 = _2432;
    float _2438 = _2422;
    if (!_1469)
    {
        _2380 = 1.0;
    }
    float _2440 = _2380;
    out.m_103.x = _2398;
    out.m_103.y = _2406;
    out.m_103.z = _2412;
    float _2442 = _2440;
    if (_1469)
    {
        bool _2444 = _1593 >= _1561;
        bool _2446 = isnan(_1593);
        bool _2448 = _2444 || _2446;
        bool _2450 = isnan(_1561);
        bool _2452 = _2448 || _2450;
        float _2454 = float(_2452);
        _2442 = _2454;
    }
    float _2456 = _2442;
    float _2458 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2460 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2462 = isnan(_1700);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2468 = _2464 || _2466;
    float _2470 = _2426 * _1463;
    float _2472 = _1960 * _2458;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = _2456 * _1678;
    float _2478 = _2458;
    float _2480 = _2476;
    if (_1489)
    {
        _1221 = _2470;
    }
    float _2482 = _1221;
    float _2484 = -_2474;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2488 = _2482;
    if (!_1489)
    {
        _2488 = 0.0;
    }
    float _2490 = _2488;
    float _2492 = -_2476;
    float _2494 = fma(_2492, _2486, 1.0);
    float _2496 = precise::clamp(_2494, 0.0, 1.0);
    if (!_2468)
    {
        _2434 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2498 = _2434;
    float _2500 = _2496 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2502 = _2500;
    float _2504 = _2498;
    float _2506 = _2498;
    if (!_2468)
    {
        _2436 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2508 = _2436;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2468)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2514 = _2478;
    out.m_105.x = _2500;
    float _2516 = _2514;
    float _2518 = _2514;
    if (!_2468)
    {
        _2438 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2520 = _2438;
    float _2522 = _2520;
    float _2524 = _2520;
    if (!_2468)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2526 = _2480;
    float _2528 = _2526;
    float _2530 = _2526;
    if (!_2468)
    {
        _2502 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2532 = _2502;
    float _2534 = _1920 * _2418;
    float _2536 = fma(_1916, _2430, _1600);
    float _2538 = fma(_1918, _2430, _1602);
    float _2540 = fma(_1606, _2534, _1604);
    out.m_107.x = _2536;
    out.m_107.y = _2538;
    out.m_107.z = _2540;
    out.m_107.w = _2428;
    bool _2542 = !_2468;
    float _2544 = _2532;
    float _2546 = _2532;
    if (!_2542)
    {
        bool _2548 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2550 = isnan(_1700);
        bool _2552 = _2548 || _2550;
        bool _2554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2556 = _2552 || _2554;
        if (!_2556)
        {
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2560 = _1700 + _2558;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2564 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2562;
            float _2566 = 1.0 / _2564;
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2588 = _2560 * _2566;
            float _2590 = precise::clamp(_2588, 0.0, 1.0);
            float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2596 = fma(_2590, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2598 = fma(_2590, _2594, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2600 = fma(_2590, _2574, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2602 = fma(_2590, _2578, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2604 = fma(_2590, _2582, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2606 = fma(_2590, _2586, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2512 = _2598;
            _2530 = _2604;
            _2506 = _2596;
            _2524 = _2602;
            _2518 = _2600;
            _2546 = _2606;
            _2608 = true;
        }
        else
        {
            bool _2610 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2612 = isnan(_1700);
            bool _2614 = _2610 || _2612;
            bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2618 = _2614 || _2616;
            if (!_2618)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2620 = _2504;
            _2506 = _2620;
            if (!_2618)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2622 = _2510;
            _2512 = _2622;
            if (!_2618)
            {
                _2516 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2624 = _2516;
            _2518 = _2624;
            if (!_2618)
            {
                _2522 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2626 = _2522;
            _2524 = _2626;
            if (!_2618)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2628 = _2528;
            _2530 = _2628;
            if (!_2618)
            {
                _2544 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2630 = _2544;
            bool _2632 = !_2618;
            _2546 = _2630;
            if (!_2632)
            {
                bool _2634 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2636 = isnan(_1700);
                bool _2638 = _2634 || _2636;
                bool _2640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2642 = _2638 || _2640;
                if (!_2642)
                {
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2646 = _1700 + _2644;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2650 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2648;
                    float _2652 = 1.0 / _2650;
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2674 = _2646 * _2652;
                    float _2676 = precise::clamp(_2674, 0.0, 1.0);
                    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2682 = fma(_2676, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2684 = fma(_2676, _2680, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2686 = fma(_2676, _2660, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2688 = fma(_2676, _2664, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2690 = fma(_2676, _2668, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2692 = fma(_2676, _2672, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2512 = _2684;
                    _2530 = _2690;
                    _2506 = _2682;
                    _2524 = _2688;
                    _2518 = _2686;
                    _2546 = _2692;
                    _2608 = true;
                }
                else
                {
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2524 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2518 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2546 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2608 = false;
    float _2694 = _2512;
    float _2696 = _2530;
    float _2698 = _2506;
    float _2700 = _2524;
    float _2702 = _2518;
    float _2704 = _2546;
    float _2706 = fma(_2406, -0.5, 0.5);
    float _2708 = precise::clamp(_2706, 0.0, 1.0);
    float _2710 = -_2694;
    float _2712 = _2710 + _2696;
    float _2714 = -_2698;
    float _2716 = _2714 + _2700;
    float _2718 = -_2702;
    float _2720 = _2718 + _2704;
    bool _2722 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2724 = fma(_2708, _2712, _2694);
    float _2726 = fma(_2708, _2716, _2698);
    float _2728 = fma(_2708, _2720, _2702);
    float _2730 = _2490 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2732 = _2724 * 0.586610972881317138671875;
    out.m_66.x = 1.0;
    float _2734 = fma(_2726, 0.298911988735198974609375, _2732);
    out.m_105.w = _2730;
    float _2736 = fma(_2728, 0.114477999508380889892578125, _2734);
    out.m_109.x = 0.0;
    float _2738 = -_2736;
    float _2740 = _2726 + _2738;
    float _2742 = -_2736;
    float _2744 = _2724 + _2742;
    float _2746 = -_2736;
    float _2748 = _2728 + _2746;
    float _2750 = fma(_2740, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2736);
    float _2752 = fma(_2744, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2736);
    float _2754 = fma(_2748, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2736);
    out.m_111.x = _2750;
    out.m_111.y = _2752;
    out.m_111.z = _2754;
    if (!_2722)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2756 = -_1319;
    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2760 = -_1321;
    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2764 = -_1323;
    float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2768 = _2758 * _2758;
    float _2770 = fma(_2762, _2762, _2768);
    float _2772 = fma(_2766, _2766, _2770);
    float _2774 = sqrt(_2772);
    float _2776 = rsqrt(_2772);
    float _2778 = -_2774;
    float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2782 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2784 = precise::clamp(_2782, 0.0, 1.0);
    float _2786 = _2762 * _2776;
    float _2788 = _2758 * _2776;
    float _2790 = abs(_2784);
    float _2792 = log2(_2790);
    float _2794 = _2766 * _2776;
    float _2796 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2798 = _2406 * _2788;
    float _2800 = -_2788;
    float _2802 = -_2796;
    float _2804 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2802);
    float _2806 = fma(_2398, _2786, _2798);
    float _2808 = -_2794;
    float _2810 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2804);
    float _2812 = fma(_2412, _2794, _2806);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2818 = _2810 + _2816;
    float _2820 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2822 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2824 = precise::clamp(_2822, 0.0, 1.0);
    float _2826 = exp2(_2820);
    float _2828 = _2826 * _2824;
    float _2830 = _2814 * _2828;
    float _2832 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2834 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2836 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _2832;
    out.m_109.y = _2834;
    out.m_109.z = _2836;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2608 = false;
    bool _568 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_63.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_66.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2893 = as_type<float>(_146);
        out.gl_Position.z = _2893;
    }
    if (!_134)
    {
        return out;
    }
    float _150 = in.m_68.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    if (_160)
    {
        float _168 = float(_130);
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    if (_176)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _140;
    if (_176)
    {
        out.m_66.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _148 = as_type<int>(_180);
    }
    int _182 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2961 = as_type<float>(_182);
        out.gl_Position.z = _2961;
    }
    if (_176)
    {
        return out;
    }
    float _184 = in.m_70.x;
    float _186 = in.m_70.y;
    float _188 = in.m_70.z;
    float _190 = in.m_72.x;
    float _192 = in.m_72.y;
    float _194 = in.m_72.z;
    float _196 = in.m_74.x;
    float _198 = in.m_74.y;
    float _200 = in.m_74.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    bool _226 = _220 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _222;
    if (_226)
    {
        float _232 = rsqrt(_214);
        _230 = _232;
    }
    float _234 = _230;
    float _236 = 0.0;
    if (!_226)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    bool _240 = _224 > 0.0;
    float _242 = 0.0;
    float _244 = _224;
    float _246 = _238;
    if (!_226)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = _248;
    if (!_226)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = _220;
    float _256 = _252;
    if (_228)
    {
        float _258 = rsqrt(_216);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    if (!_228)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _266 = _262;
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    float _274 = _266;
    if (!_228)
    {
        _270 = 0.0;
    }
    float _276 = _270;
    float _278 = 0.0;
    float _280 = _276;
    if (_240)
    {
        float _282 = rsqrt(_218);
        _278 = _282;
    }
    float _284 = _278;
    if (_226)
    {
        float _286 = _234 * _190;
        _246 = _286;
    }
    float _288 = _246;
    if (_226)
    {
        float _290 = _234 * _184;
        _250 = _290;
    }
    float _292 = _250;
    if (_226)
    {
        float _294 = _234 * _196;
        _256 = _294;
    }
    float _296 = _256;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _300 = 0.0;
    float _302 = 0.0;
    if (!_240)
    {
        _300 = 0.0;
        _302 = 0.0;
    }
    float _304 = _300;
    float _306 = _302;
    float _308 = 0.0;
    float _310 = _304;
    float _312 = _306;
    if (!_240)
    {
        _308 = 0.0;
    }
    float _314 = _308;
    float _316 = _314;
    if (_228)
    {
        float _318 = _260 * _192;
        _280 = _318;
    }
    float _320 = _280;
    if (_228)
    {
        float _322 = _260 * _186;
        _272 = _322;
    }
    float _324 = _272;
    if (_228)
    {
        float _326 = _260 * _198;
        _274 = _326;
    }
    float _328 = _274;
    if (_240)
    {
        float _330 = _284 * _194;
        _310 = _330;
    }
    float _332 = _310;
    if (_240)
    {
        float _334 = _284 * _188;
        _316 = _334;
    }
    float _336 = _316;
    if (_240)
    {
        float _338 = _284 * _200;
        _312 = _338;
    }
    float _340 = _312;
    bool _342 = !_298;
    float _360;
    if (!_342)
    {
        float _344 = in.m_76.x;
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_130);
        float _366 = 1.0 / _364;
        float _368 = _164 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = in.m_76.x;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = _370 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _386;
    bool _390 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_370);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = 1.0 / _380;
    bool _404 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _406 = -_400;
    float _408 = _406 + 1.0;
    float _410 = 1.0 / _384;
    float _412 = 1.0 / _388;
    float _414 = _376 * _402;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _370 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _422 = _370 + _420;
    float _424 = _418 * _410;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _426;
    bool _430 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _432 = isnan(_370);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    bool _442 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_370);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = fma(_428, _414, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _456 = _440 * _408;
    float _458 = _422 * _412;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _460;
    bool _464 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _466 = isnan(_370);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _482 = fma(_462, _414, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _484 = -_440;
    float _486 = _484 + 1.0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = fma(_478, _424, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = _480 * _372;
    float _496 = _474 * _486;
    float _498 = -_474;
    float _500 = _498 + 1.0;
    float _502 = fma(_490, _424, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _504 = _452 * _500;
    float _506 = -_452;
    float _508 = _506 + 1.0;
    float _510 = trunc(_494);
    int _512 = int(_510);
    float _514 = _482 * _504;
    float _516 = _454 * _504;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _522;
    float _526 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[143].x, _514);
    float _528 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[143].y, _516);
    float _530 = fma(_520, _458, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _532 = fma(_524, _458, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _534 = fma(_492, _496, _526);
    float _536 = fma(_502, _496, _528);
    float _538 = fma(_530, _456, _534);
    float _540 = fma(_532, _456, _536);
    int _542 = _512 << 4;
    int _544 = _542 + 1712;
    float _546 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[146].x, _538);
    float _548 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[146].y, _540);
    bool _550 = !_404;
    float _566;
    if (!_550)
    {
        float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _554 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _558 = _556 * _552;
        float _560 = floor(_558);
        float _562 = -_560;
        float _564 = _558 + _562;
        _566 = _564;
        _568 = true;
    }
    else
    {
        float _570 = float(_130);
        float _572 = 1.0 / _570;
        float _574 = _164 * _572;
        _566 = _574;
    }
    _568 = false;
    float _576 = _566;
    float _578 = in.m_63.x;
    float _580 = in.m_63.y;
    float _582 = in.m_63.z;
    float _584 = in.m_74.w;
    float _586 = in.m_72.w;
    float _588 = _198 * _580;
    float _590 = _192 * _580;
    float _592 = fma(_196, _578, _588);
    float _594 = fma(_190, _578, _590);
    float _596 = fma(_200, _582, _592);
    float _598 = fma(_194, _582, _594);
    float _600 = _596 + _584;
    float _602 = _598 + _586;
    float _604 = fma(_600, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _606 = fma(_602, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _608 = floor(_604);
    float _610 = floor(_606);
    float _612 = -_608;
    float _614 = _604 + _612;
    float _616 = -_610;
    float _618 = _606 + _616;
    float2 _3615 = float2(_618, _614);
    float _620 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3615, float2(0.0), isnan(_3615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3615, float2(0.0), isnan(_3615)), level(0.0)).x;
    float _622 = in.m_78.w;
    float _624 = in.m_70.w;
    float _626 = _186 * _580;
    float _628 = in.m_80.x;
    float _630 = in.m_80.y;
    float _632 = trunc(_622);
    int _634 = int(_632);
    int _636 = _634 << 5;
    uint _639 = uint(int(uint(_636) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_639)];
    float _641 = as_type<float>(_dmw0.x);
    int _643 = _636 + 4;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    float _647 = as_type<float>(_dmw0.y);
    int _649 = _636 + 8;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    float _653 = as_type<float>(_dmw0.z);
    int _655 = _636 + 12;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    float _659 = as_type<float>(_dmw0.w);
    float _661 = fma(_184, _578, _626);
    float _663 = _548 * _630;
    float _665 = _546 * _628;
    float _667 = fma(_188, _582, _661);
    float _669 = _663 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _671 = _665 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _673 = _667 + _624;
    float _675 = as_type<float>(int(gl_VertexIndex));
    float _677 = _673 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _679 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[11].x, _677);
    float _681 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[11].z, _679);
    float _683 = _673 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _685 = _681 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _687 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[10].x, _683);
    float _689 = 1.0 / _685;
    float _691 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[10].z, _687);
    float _693 = _691 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _695 = as_type<int>(_675) & 1;
    bool _697 = _695 != 0;
    int _699 = as_type<int>(_675) & 2;
    bool _701 = _699 != 0;
    bool _703 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.5);
    bool _711 = _707 || _709;
    float _713 = _693 + _685;
    bool _715 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.5);
    bool _723 = _719 || _721;
    float _725 = _713 * _689;
    float _727 = _725 * 0.5;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _731 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[30].w, _729);
    float _733 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _735 = 1.0 / _731;
    bool _737 = !_701;
    float _739 = _737 ? (-0.5) : 0.5;
    float _741 = _673 + _733;
    bool _743 = !_697;
    float _745 = _743 ? (-0.5) : 0.5;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _739);
    float _749 = _741 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _745);
    float _753 = _669 * _747;
    float _755 = fma(_602, (*spvDescriptorSet0.vp_c15)._m0[126].x, _749);
    float _757 = _671 * _751;
    float _759 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _761 = fma(_600, (*spvDescriptorSet0.vp_c15)._m0[126].z, _755);
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _765 = _735 * _763;
    float _767 = _741 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _769 = _759 * _320;
    float _771 = _761 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _773 = _765 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _775 = fma(_602, (*spvDescriptorSet0.vp_c15)._m0[127].x, _767);
    bool _777 = _765 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _779 = _759 * _328;
    float _781 = fma(_757, _288, _769);
    float _783 = fma(_600, (*spvDescriptorSet0.vp_c15)._m0[127].z, _775);
    bool _785 = !_773;
    int _787 = _785 ? 0 : 1;
    float _789 = fma(_757, _296, _779);
    float _791 = trunc(_771);
    int _793 = int(_791);
    float _795 = _783 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _797 = -_753;
    float _799 = fma(_797, _332, _781);
    float _801 = -_753;
    float _803 = fma(_801, _340, _789);
    float _805 = _759 * _324;
    int _807 = 2;
    float _809 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _811 = _795;
    if (!_773)
    {
        _807 = 1;
    }
    int _813 = _807;
    float _815 = _602 + _799;
    int _817 = _813;
    if (!_777)
    {
        _817 = _787;
    }
    int _819 = _817;
    float _821 = trunc(_795);
    int _823 = int(_821);
    float _825 = _600 + _803;
    float _827 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _829 = _815 + _827;
    int _831 = _819 << 6;
    float _833 = fma(_757, _292, _805);
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _837 = _825 + _835;
    int _839 = _831 + 48;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    uint _843 = uint(int(uint(int(_841)) >> uint(2)));
    int _845 = int(_841) & 3;
    float _847 = (*spvDescriptorSet0.vp_c15)._m0[int(_843)][_845];
    int _849 = int(_841) + 1;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    int _853 = _849 & 3;
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[int(_851)][_853];
    int _857 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _859 = _793 + _857;
    int _861 = _859 + 1;
    float _863 = _837 * _837;
    float _865 = -_753;
    float _867 = fma(_865, _336, _833);
    bool _869 = _861 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _871 = _673 + _867;
    int _873 = _831 + 56;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    uint _877 = uint(int(uint(int(_875)) >> uint(2)));
    int _879 = int(_875) & 3;
    float _881 = (*spvDescriptorSet0.vp_c15)._m0[int(_877)][_879];
    int _883 = int(_875) + 1;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    int _887 = _883 & 3;
    float _889 = (*spvDescriptorSet0.vp_c15)._m0[int(_885)][_887];
    int _891 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _893 = _823 + _891;
    int _895 = _893 + 1;
    float _897 = fma(_829, _829, _863);
    int _899 = _861 | _895;
    float _901 = sqrt(_897);
    int _903 = _831 + 64;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    uint _907 = uint(int(uint(int(_905)) >> uint(2)));
    int _909 = int(_905) & 3;
    float _911 = (*spvDescriptorSet0.vp_c15)._m0[int(_907)][_909];
    int _913 = int(_905) + 1;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    int _917 = _913 & 3;
    float _919 = (*spvDescriptorSet0.vp_c15)._m0[int(_915)][_917];
    bool _921 = _899 < 0;
    bool _923 = _921 || _869;
    bool _925 = _895 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _927 = _925 || _923;
    int _929 = _831 + 72;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.vp_c15)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.vp_c15)._m0[int(_941)][_943];
    bool _947 = _901 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _949 = _831 + 96;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    uint _953 = uint(int(uint(int(_951)) >> uint(2)));
    int _955 = int(_951) & 3;
    float _957 = (*spvDescriptorSet0.vp_c15)._m0[int(_953)][_955];
    int _959 = int(_951) + 1;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    int _963 = _959 & 3;
    float _965 = (*spvDescriptorSet0.vp_c15)._m0[int(_961)][_963];
    int _967 = _861;
    if (!_927)
    {
        int _969 = _895 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _971 = _969 + _861;
        _967 = _971;
    }
    int _973 = _967;
    int _975 = 0;
    if (!_927)
    {
        int _977 = _973 << 2;
        _975 = _977;
    }
    int _979 = _975;
    int _981 = _831 + 104;
    uint _983 = uint(int(uint(_981) >> uint(2)));
    uint _985 = uint(int(uint(int(_983)) >> uint(2)));
    int _987 = int(_983) & 3;
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[int(_985)][_987];
    int _991 = int(_983) + 1;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    int _995 = _991 & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    float _999 = 0.0;
    int _1001 = _979;
    if (!_947)
    {
        _999 = _815;
    }
    float _1003 = _999;
    float _1005 = _1003;
    if (!_927)
    {
        int _1007 = 12 & _979;
        _1001 = _1007;
    }
    int _1009 = _1001;
    if (!_947)
    {
        _809 = _871;
    }
    float _1011 = _809;
    float _1013 = _659 * 2.0;
    float _1015 = _641 * 2.0;
    float _1017 = _647 * 2.0;
    float _1019 = _641 * _641;
    float _1021 = _653 * _1013;
    float _1023 = _647 * _1013;
    float _1025 = _641 * _1013;
    float _1027 = _653 * _653;
    float _1029 = -_1021;
    float _1031 = fma(_647, _1015, _1029);
    float _1033 = fma(_647, _1015, _1021);
    float _1035 = fma(_653, _1015, _1023);
    float _1037 = -_1023;
    float _1039 = fma(_653, _1015, _1037);
    float _1041 = -_1025;
    float _1043 = fma(_653, _1017, _1041);
    float _1045 = fma(_653, _1017, _1025);
    float _1047 = _647 * _647;
    float _1049 = _653;
    int _1051 = as_type<int>(_1019);
    float _1053 = _1011;
    if (!_947)
    {
        _1049 = _825;
    }
    float _1055 = _1049;
    float _1057 = fma(_1019, -2.0, 1.0);
    float _1059 = fma(_1047, -2.0, 1.0);
    float _1061 = _1055;
    if (!_927)
    {
        uint _1063 = uint(int(uint(_973) >> uint(2)));
        _1051 = int(_1063);
    }
    int _1065 = _1051;
    bool _1067 = !_947;
    float _1069 = 0.0;
    if (!_1067)
    {
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1075 = _901 + _1073;
        float _1077 = _871 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1079 = rsqrt(_897);
        float _1081 = _1075 * _1071;
        float _1083 = _1081 * 0.15915493667125701904296875;
        float _1085 = _1083 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = _1083 * 6.283185482025146484375;
        float _1091 = sin(_1089);
        float _1093 = _1087 + (-1.0);
        float _1095 = fma(_1091, _1077, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1099 = _1079 * _1095;
        float _1101 = fma(_871, _1087, _1097);
        float _1103 = fma(_829, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1105 = fma(_837, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1053 = _1101;
        _1069 = _1083;
        _1005 = _1103;
        _1061 = _1105;
    }
    float _1107 = _1053;
    float _1109 = _1069;
    float _1111 = _1005;
    float _1113 = _1061;
    float _1115 = _1109;
    if (!_927)
    {
        int _1117 = _1065 << 4;
        int _1119 = _1117 + _1009;
        _1115 = as_type<float>(_1119);
    }
    float _1121 = _1115;
    float _1123 = _741 * _965;
    float _1125 = -_673;
    float _1127 = _1125 + _1107;
    float _1129 = fma(_1027, -2.0, _1059);
    float _1131 = fma(_1027, -2.0, _1057);
    float _1133 = fma(_602, _957, _1123);
    float _1135 = _1121;
    if (!_927)
    {
        int _1137 = as_type<int>(_1121) + 400;
        uint _1139 = uint(int(uint(_1137) >> uint(2)));
        uint _1141 = uint(int(uint(int(_1139)) >> uint(2)));
        int _1143 = int(_1139) & 3;
        float _1145 = (*spvDescriptorSet0.vp_c15)._m0[int(_1141)][_1143];
        _1135 = _1145;
    }
    float _1147 = _1135;
    float _1149 = fma(_1047, -2.0, _1057);
    float _1151 = -_602;
    float _1153 = _1151 + _1111;
    float _1155 = _1127 * _324;
    float _1157 = fma(_600, _989, _1133);
    float _1159 = _1127 * _292;
    float _1161 = _1127 * _336;
    float _1163 = _741 * _855;
    float _1165 = -_600;
    float _1167 = _1165 + _1113;
    float _1169 = fma(_1153, _320, _1155);
    float _1171 = _1157 + _997;
    float _1173 = fma(_1153, _288, _1159);
    float _1175 = fma(_1153, _332, _1161);
    float _1177 = fma(_602, _847, _1163);
    float _1179 = fma(_1167, _328, _1169);
    float _1181 = _741 * _919;
    float _1183 = fma(_1167, _296, _1173);
    float _1185 = 1.0 / _1171;
    float _1187 = fma(_1167, _340, _1175);
    float _1189 = _1179 * _1031;
    float _1191 = _1179 * _1131;
    float _1193 = _1179 * _1045;
    int _1195 = _831 + 80;
    uint _1197 = uint(int(uint(_1195) >> uint(2)));
    uint _1199 = uint(int(uint(int(_1197)) >> uint(2)));
    int _1201 = int(_1197) & 3;
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[int(_1199)][_1201];
    int _1205 = int(_1197) + 1;
    uint _1207 = uint(int(uint(_1205) >> uint(2)));
    int _1209 = _1205 & 3;
    float _1211 = (*spvDescriptorSet0.vp_c15)._m0[int(_1207)][_1209];
    float _1213 = fma(_600, _881, _1177);
    float _1215 = fma(_1183, _1033, _1191);
    float _1217 = _997;
    float _1219 = _1171;
    float _1221 = _1149;
    if (!_927)
    {
        float _1223 = floor(_771);
        _1217 = _1223;
    }
    float _1225 = _1217;
    float _1227 = _1213 + _889;
    float _1229 = fma(_1187, _1043, _1215);
    int _1231 = _831 + 88;
    uint _1233 = uint(int(uint(_1231) >> uint(2)));
    uint _1235 = uint(int(uint(int(_1233)) >> uint(2)));
    int _1237 = int(_1233) & 3;
    float _1239 = (*spvDescriptorSet0.vp_c15)._m0[int(_1235)][_1237];
    int _1241 = int(_1233) + 1;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    int _1245 = _1241 & 3;
    float _1247 = (*spvDescriptorSet0.vp_c15)._m0[int(_1243)][_1245];
    float _1249 = fma(_602, _911, _1181);
    float _1251 = fma(_1183, _1129, _1189);
    float _1253 = fma(_1183, _1039, _1193);
    float _1255 = fma(_600, _937, _1249);
    float _1257 = fma(_1187, _1035, _1251);
    float _1259 = fma(_1187, _1149, _1253);
    float _1261 = _673 + _1229;
    float _1263 = _1255 + _945;
    float _1265 = _602 + _1257;
    float _1267 = _600 + _1259;
    float _1269 = _1227 * _1185;
    float _1271 = _1261;
    float _1273 = _1265;
    float _1275 = _1267;
    float _1277 = _1211;
    float _1279 = _1203;
    if (!_711)
    {
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1283 = _673 + _1281;
        float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1287 = _602 + _1285;
        float _1289 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1291 = _1283 * _1283;
        float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1295 = _600 + _1293;
        float _1297 = fma(_1287, _1287, _1291);
        float _1299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1301 = fma(_1295, _1295, _1297);
        float _1303 = sqrt(_1301);
        float _1305 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1307 = precise::min(_1303, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1309 = _1307 * _1299;
        float _1311 = _1305 * _1309;
        float _1313 = fma(_1229, _1311, _673);
        float _1315 = fma(_1257, _1311, _602);
        float _1317 = fma(_1259, _1311, _600);
        _1271 = _1313;
        _1273 = _1315;
        _1275 = _1317;
    }
    float _1319 = _1271;
    float _1321 = _1273;
    float _1323 = _1275;
    float _1325 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1327 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1329 = _889;
    if (!_927)
    {
        float _1331 = floor(_795);
        _1329 = _1331;
    }
    float _1333 = _1329;
    float _1335 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1325);
    float _1339 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1327);
    bool _1341 = _1269 >= 0.0;
    float _1343 = _1263 * _1185;
    float _1345 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1337);
    float _1347 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1349 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1339);
    float _1351 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1335);
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1355 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1347);
    float _1357 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1359 = _1269 <= 1.0;
    bool _1361 = _1359 && _1341;
    float _1363 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1365 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1355);
    float _1367 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1351);
    bool _1371 = _1343 >= 0.0;
    bool _1373 = _1371 && _1361;
    float _1375 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1377 = -_1363;
    float _1379 = fma(_1377, _1357, 1.0);
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1383 = _1365;
    if (_723)
    {
        _1383 = 1.0;
    }
    float _1385 = _1383;
    float _1387 = _1385;
    float _1389 = _1333;
    if (!_723)
    {
        float _1391 = as_type<float>(in.m_87.w);
        int _1393 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1395 = _1393 == 4;
        bool _1397 = _1393 == 8;
        bool _1399 = _1393 == 12;
        int _1401 = as_type<int>(_1391) << 16;
        int _1403 = as_type<int>(_1391) << 8;
        int _1405 = as_type<int>(_1391) << 24;
        int _1407 = _1401 >> 24;
        int _1409 = _1403 >> 24;
        int _1411 = as_type<int>(_1391) >> 24;
        int _1413 = _1405 >> 24;
        float _1415 = float(_1407);
        float _1417 = float(_1409);
        float _1419 = float(_1411);
        float _1421 = _1415 * 0.0078740157186985015869140625;
        float _1423 = float(_1413);
        float _1425 = _1417 * 0.0078740157186985015869140625;
        float _1427 = _1419 * 0.0078740157186985015869140625;
        float _1429 = precise::min(_1421, 1.0);
        float _1431 = _1423 * 0.0078740157186985015869140625;
        float _1433 = precise::min(_1425, 1.0);
        float _1435 = precise::min(_1427, 1.0);
        float _1437 = precise::min(_1431, 1.0);
        float _1439 = precise::max(_1429, -1.0);
        float _1441 = precise::max(_1433, -1.0);
        float _1443 = precise::max(_1435, -1.0);
        float _1445 = precise::max(_1437, -1.0);
        float _1447 = _1445;
        if (_1395)
        {
            _1447 = _1439;
        }
        float _1449 = _1447;
        float _1451 = _1449;
        if (_1397)
        {
            _1451 = _1441;
        }
        float _1453 = _1451;
        float _1455 = _1453;
        if (_1399)
        {
            _1455 = _1443;
        }
        float _1457 = _1455;
        float _1459 = abs(_1457);
        float _1461 = (-0.0) + _1459;
        _1387 = _1461;
    }
    float _1463 = _1387;
    float _1465 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1381);
    bool _1467 = _1343 <= 1.0;
    bool _1469 = _1467 && _1373;
    float _1471 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1473 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1475 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1465);
    float _1477 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1479 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1471);
    bool _1481 = _1463 != 0.0;
    bool _1483 = isnan(_1463);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan(0.0);
    bool _1489 = _1485 || _1487;
    float _1491 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1475);
    float _1493 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1477);
    float _1495 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1479);
    float _1497 = log2(_1379);
    float _1499 = _741 * _1211;
    float _1501 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1493);
    float _1503 = _1479;
    if (_1469)
    {
        float _1505 = float(_819);
        _1503 = _1505;
    }
    float _1507 = _1503;
    float _1509 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1495);
    float _1511 = fma(_602, _1203, _1499);
    if (!_927)
    {
        float _1513 = -_1333;
        float _1515 = _795 + _1513;
        _1219 = _1515;
    }
    float _1517 = _1219;
    float _1519 = _1517;
    if (!_927)
    {
        float _1521 = -_1225;
        float _1523 = _771 + _1521;
        _1389 = _1523;
    }
    float _1525 = _1389;
    float _1527 = 1.0 / _1491;
    float _1529 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    if (_1489)
    {
        _1277 = _1509;
    }
    float _1531 = _1277;
    float _1533 = fma(_600, _1239, _1511);
    float _1535 = _1531;
    if (_1489)
    {
        _1279 = _1529;
    }
    float _1537 = _1279;
    float _1539 = _1537;
    if (!_1489)
    {
        _1535 = 0.0;
        _1539 = 0.0;
    }
    float _1541 = _1535;
    float _1543 = _1539;
    float _1545 = _1501;
    if (_1469)
    {
        float _1547 = rint(_1507);
        float _1549 = precise::max(_1547, 0.0);
        uint _1551 = uint(_1549);
        uint _1553 = clamp(_1551, 0u, 65535u);
        _1545 = as_type<float>(_1553);
    }
    float _1555 = _1545;
    float _1557 = _1533 + _1247;
    float _1559 = _1497 * 0.693147182464599609375;
    float _1561 = _1557 * _1185;
    float _1563 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1565 = _1495;
    if (!_927)
    {
        float _1567 = rint(_1147);
        float _1569 = precise::max(_1567, 0.0);
        uint _1571 = uint(_1569);
        uint _1573 = clamp(_1571, 0u, 65535u);
        _1565 = as_type<float>(_1573);
    }
    float _1575 = _1565;
    float _1577 = _1527 * _1541;
    float _1579 = _1527 * _1543;
    float _1581 = fma(_1577, 0.5, 0.5);
    float _1583 = fma(_1579, -0.5, 0.5);
    float _1585 = _1343;
    float _1587 = _1581;
    float _1589 = _1583;
    if (_1469)
    {
        float3 _5173 = float3(_1269, _1343, float(as_type<int>(_1555)));
        float3 _5177 = select(_5173, float3(0.0), isnan(_5173));
        float _1591 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5177.xy, uint(rint(_5177.z)), _1561, level(0.0));
        _1585 = _1591;
    }
    float _1593 = _1585;
    float3 _5187 = float3(_1581, _1583, _1563);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5187, float3(0.0), isnan(_5187)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5187, float3(0.0), isnan(_5187)), level(0.0)).x;
    float3 _5196 = float3(_1581, _1583, _1563);
    float4 _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5196, float3(0.0), isnan(_5196)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5196, float3(0.0), isnan(_5196)), level(0.0)).xyzw;
    float _1600 = _1598.x;
    float _1602 = _1598.y;
    float _1604 = _1598.z;
    float _1606 = _1598.w;
    float _1608 = _1225;
    if (!_927)
    {
        float3 _5219 = float3(_1525, _1517, float(as_type<int>(_1575)));
        float3 _5221 = select(_5219, float3(0.0), isnan(_5219));
        float _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5221.xy, uint(rint(_5221.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5221.xy, uint(rint(_5221.z)), level(0.0)).x;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (_927)
    {
        _811 = 1.0;
    }
    float _1614 = _811;
    float _1616 = _1614;
    if (!_927)
    {
        int _1618 = _973 << 4;
        int _1620 = _1618 + 2048;
        uint _1622 = uint(int(uint(_1620) >> uint(2)));
        uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
        int _1626 = int(_1622) & 3;
        float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
        int _1630 = int(_1622) + 1;
        uint _1632 = uint(int(uint(_1630) >> uint(2)));
        int _1634 = _1630 & 3;
        float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
        int _1638 = _1620 + 8;
        uint _1640 = uint(int(uint(_1638) >> uint(2)));
        uint _1642 = uint(int(uint(int(_1640)) >> uint(2)));
        int _1644 = int(_1640) & 3;
        float _1646 = (*spvDescriptorSet0.vp_c15)._m0[int(_1642)][_1644];
        int _1648 = int(_1640) + 1;
        uint _1650 = uint(int(uint(_1648) >> uint(2)));
        int _1652 = _1648 & 3;
        float _1654 = (*spvDescriptorSet0.vp_c15)._m0[int(_1650)][_1652];
        float _1656 = _741 * _1636;
        float _1658 = fma(_602, _1628, _1656);
        float _1660 = fma(_600, _1646, _1658);
        float _1662 = _1660 + _1654;
        float _1664 = precise::clamp(_1662, 0.0, 1.0);
        float _1666 = -_1664;
        float _1668 = _1666 + _1612;
        float _1670 = fma(_1668, 500.0, 1.5);
        float _1672 = exp2(_1670);
        float _1674 = 0.0 + _1672;
        float _1676 = precise::clamp(_1674, 0.0, 1.0);
        _1616 = _1676;
    }
    float _1678 = _1616;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1682 = _1319 + _1680;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1686 = _1321 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1690 = _1323 + _1688;
    float _1692 = _1682 * _1682;
    float _1694 = fma(_1686, _1686, _1692);
    float _1696 = fma(_1690, _1690, _1694);
    float _1698 = rsqrt(_1696);
    float _1700 = sqrt(_1696);
    float _1702 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1704 = _1686 * _1702;
    float _1706 = _1690 * _1702;
    float _1708 = _1704 * _1704;
    float _1710 = _1706 * _1706;
    float _1712 = _1708 + _1710;
    float _1714 = sqrt(_1712);
    bool _1716 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1720 = _1714 + _1718;
    float _1722 = _1698;
    float _1724 = _1720;
    float _1726 = _1682;
    if (_1716)
    {
        float _1728 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1722 = _1728;
    }
    float _1730 = _1722;
    if (_1716)
    {
        float _1732 = rsqrt(_1712);
        _1587 = _1732;
    }
    float _1734 = _1587;
    float _1736 = _1734;
    if (_1716)
    {
        float _1738 = _1720 * _1730;
        _1724 = _1738;
    }
    float _1740 = _1724;
    if (_1716)
    {
        float _1742 = _1740 * 0.15915493667125701904296875;
        _1589 = _1742;
    }
    float _1744 = _1589;
    float _1746 = _1690;
    if (_1716)
    {
        float _1748 = _1744 * 6.283185482025146484375;
        float _1750 = sin(_1748);
        _1746 = _1750;
    }
    float _1752 = _1746;
    float _1754 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1756 = precise::max(0.0, _1754);
    float _1758 = _1730;
    float _1760 = _1756;
    if (_1716)
    {
        float _1762 = _1744 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        _1758 = _1764;
    }
    float _1766 = _1758;
    float _1768 = -_1702;
    float _1770 = -_1756;
    float _1772 = fma(_1682, _1768, _1770);
    if (_1716)
    {
        float _1774 = _1772 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1774;
    }
    float _1776 = _1726;
    float _1778 = _1776;
    float _1780 = _1752;
    if (_1716)
    {
        float _1782 = fma(_1752, _1776, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1778 = _1782;
    }
    float _1784 = _1778;
    float _1786 = _1784;
    if (!_1716)
    {
        _1780 = _1704;
    }
    float _1788 = _1780;
    float _1790 = _1788;
    float _1792 = _1766;
    if (_1716)
    {
        float _1794 = _1766 + (-1.0);
        _1760 = _1794;
    }
    float _1796 = _1760;
    float _1798 = 0.0;
    float _1800 = _1796;
    if (_1716)
    {
        float _1802 = _1734 * _1784;
        _1798 = _1802;
    }
    float _1804 = _1798;
    if (!_1716)
    {
        _1786 = _1772;
    }
    float _1806 = _1786;
    float _1808 = _1806;
    if (_1716)
    {
        float _1810 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1810;
    }
    float _1812 = _1519;
    if (_1716)
    {
        float _1814 = _1704 * _1804;
        _1790 = _1814;
    }
    float _1816 = _1790;
    if (!_1716)
    {
        _1800 = _1706;
    }
    float _1818 = _1800;
    float _1820 = _1818;
    if (_1716)
    {
        float _1822 = _1706 * _1804;
        _1820 = _1822;
    }
    float _1824 = _1820;
    if (!_1716)
    {
        _1736 = _1708;
    }
    float _1826 = _1736;
    float _1828 = _1826;
    if (_1716)
    {
        float _1830 = fma(_1772, _1766, _1812);
        _1808 = _1830;
    }
    float _1832 = _1808;
    if (_1716)
    {
        float _1834 = _1816 * _1816;
        _1828 = _1834;
    }
    float _1836 = _1828;
    if (!_1716)
    {
        _1792 = _1710;
    }
    float _1838 = _1792;
    float _1840 = _1838;
    if (_1716)
    {
        float _1842 = _1824 * _1824;
        _1840 = _1842;
    }
    float _1844 = _1840;
    float _1846 = fma(_1832, _1832, _1836);
    float _1848 = _1846 + _1844;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1852 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1850);
    float _1854 = precise::clamp(_1852, 0.0, 1.0);
    float _1856 = -_1854;
    float _1858 = _1856 + 1.0;
    float _1860 = rsqrt(_1848);
    float _1862 = abs(_1858);
    float _1864 = log2(_1862);
    float _1866 = _1860 * _1816;
    float _1868 = _1860 * _1832;
    float _1870 = _1860 * _1824;
    float _1872 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1874 = -_1872;
    float _1876 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1874);
    float _1878 = -_1870;
    float _1880 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1876);
    float _1882 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1884 = fma(_1880, -0.5, 0.5);
    float _1886 = fma(_1880, 0.5, 0.5);
    float _1888 = exp2(_1882);
    float _1890 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = fma(_1886, _1890, -0.212114393711090087890625);
    float _1894 = _1868 + 1.0;
    float _1896 = sqrt(_1884);
    float _1898 = fma(_1886, _1892, 1.570728778839111328125);
    float _1900 = -_1868;
    float _1902 = fma(_1888, _1894, _1900);
    float _1904 = fma(_1902, 0.5, 0.5);
    float _1906 = _1896 * 0.636619746685028076171875;
    float _1908 = -_1898;
    float _1910 = fma(_1906, _1908, 1.0);
    float2 _5690 = float2(_1910, _1904);
    float3 _1914 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5690, float2(0.0), isnan(_5690)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5690, float2(0.0), isnan(_5690)), level(0.0)).xyz;
    float _1916 = _1914.x;
    float _1918 = _1914.y;
    float _1920 = _1914.z;
    float _1922 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1924 = in.m_76.y;
    float _1926 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1928 = _1922 * _372;
    float _1930 = in.m_76.w;
    bool _1932 = _372 > 0.5;
    float _1934 = exp2(_1926);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1938 = _1936 != 0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1944 = in.m_76.z;
    bool _1946 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1948 = isnan(_576);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1954 = _1950 || _1952;
    float _1956 = float(_1954);
    float _1958 = -_620;
    float _1960 = _1958 + 1.0;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1964 = _1962 != 0;
    out.m_89.x = _1321;
    out.m_89.y = _1319;
    out.m_89.z = _1323;
    float _1966 = trunc(_1928);
    int _1968 = int(_1966);
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1972 = _1970 != 0;
    float _1974 = 1.0 / _1942;
    bool _1976 = _1924 > 0.5;
    bool _1978 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1980 = isnan(_576);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1986 = _1982 || _1984;
    float _1988 = float(_1986);
    float _1990 = -_739;
    int _1992 = _1976 ? as_type<int>(_1990) : as_type<int>(_739);
    int _1994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1996 = _1994 != 0;
    int _1998 = _1968 << 4;
    int _2000 = _1998 + 1968;
    float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2002;
    bool _2006 = !_1938;
    float _2008 = _2006 ? _739 : as_type<float>(_1992);
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2012 = uint(int(uint(_2000) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    bool _2028 = _1930 > 0.5;
    float _2030 = _2004 * _1974;
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2034 = _576 + _2032;
    float _2036 = -_1988;
    float _2038 = _2036 + 1.0;
    float _2040 = -_739;
    int _2042 = _2028 ? as_type<int>(_2040) : as_type<int>(_739);
    float _2044 = -_2008;
    float _2046 = _2044 + 0.5;
    int _2048 = _2000 + 8;
    uint _2050 = uint(int(uint(_2048) >> uint(2)));
    uint _2052 = uint(int(uint(int(_2050)) >> uint(2)));
    int _2054 = int(_2050) & 3;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[int(_2052)][_2054];
    float _2058 = fma(_2030, _2034, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2060 = _1944 > 0.5;
    float _2062 = _1956 * _2038;
    float _2064 = -_1956;
    float _2066 = _2064 + 1.0;
    float _2068 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    uint _2070 = uint(int(uint(_544) >> uint(2)));
    uint _2072 = uint(int(uint(int(_2070)) >> uint(2)));
    int _2074 = int(_2070) & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = int(_2070) + 1;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    int _2082 = _2078 & 3;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[int(_2080)][_2082];
    float _2086 = _2058 * _2062;
    bool _2088 = !_1964;
    float _2090 = _2088 ? _739 : as_type<float>(_2042);
    float _2092 = _739 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2096 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2094);
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2100 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2098);
    float _2102 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2086);
    float _2104 = fma(_2092, _2092, 1.0);
    float _2106 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2096);
    float _2108 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2100);
    float _2110 = -_2090;
    float _2112 = _2110 + 0.5;
    float _2114 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2102);
    float _2116 = _602 + _2106;
    float _2118 = rsqrt(_2104);
    float _2120 = -_745;
    int _2122 = _1932 ? as_type<int>(_2120) : as_type<int>(_745);
    int _2124 = _544 + 8;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    uint _2128 = uint(int(uint(int(_2126)) >> uint(2)));
    int _2130 = int(_2126) & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    bool _2134 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2136 = isnan(0.0);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2142 = _2138 || _2140;
    float _2144 = _600 + _2108;
    bool _2146 = !_1972;
    float _2148 = _2146 ? _745 : as_type<float>(_2122);
    float _2150 = _745 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2152 = -_745;
    int _2154 = _2060 ? as_type<int>(_2152) : as_type<int>(_745);
    float _2156 = -_2144;
    float _2158 = _2156 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2162 = fma(_2150, _292, _324);
    float _2164 = fma(_2150, _296, _328);
    float _2166 = _2148 + 0.5;
    float _2168 = precise::min(_2144, _2158);
    bool _2170 = !_1996;
    float _2172 = _2170 ? _745 : as_type<float>(_2154);
    float _2174 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_2142)
    {
        float _2176 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2174 = _2176;
    }
    float _2178 = _2174;
    float _2180 = -_332;
    float _2182 = _2118 * _2180;
    float _2184 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2186 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2188 = fma(_2150, _288, _320);
    float _2190 = _2026 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2192 = _2178;
    if (_2142)
    {
        float _2194 = precise::min(_2178, 20.0);
        _2192 = _2194;
    }
    float _2196 = _2192;
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2200 = -_2092;
    float _2202 = fma(_2200, _332, _2188);
    float _2204 = -_2092;
    float _2206 = fma(_2204, _336, _2162);
    float _2208 = -_2092;
    float _2210 = fma(_2208, _340, _2164);
    float _2212 = _2056 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2214 = _2092 * _2118;
    float _2216 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2218 = -_336;
    float _2220 = _2118 * _2218;
    float _2222 = -_340;
    float _2224 = _2118 * _2222;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2230 = -_2116;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2234 = _2076 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2236 = -_2214;
    float _2238 = fma(_2236, _328, _2224);
    out.m_91.x = _2198;
    out.m_91.y = _2216;
    out.m_91.z = _2226;
    float _2240 = _2206 * _1131;
    float _2242 = precise::min(_2116, _2232);
    float _2244 = -_2214;
    float _2246 = fma(_2244, _320, _2182);
    float _2248 = _2076;
    float _2250 = _2084;
    if (_2142)
    {
        float _2252 = 1.0 / _2196;
        _2248 = _2252;
    }
    float _2254 = _2248;
    float _2256 = _2084 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2258 = precise::min(_2242, _2168);
    float _2260 = _2172 + 0.5;
    if (!_2142)
    {
        _2250 = 1.0;
    }
    float _2262 = _2250;
    float _2264 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2266 = _2256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2184 * _2010;
    float _2270 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2274 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2276 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2278 = _2270 * _2228;
    float _2280 = -_2214;
    float _2282 = fma(_2280, _324, _2220);
    float _2284 = _2206 * _1031;
    float _2286 = _2262;
    if (_2142)
    {
        float _2288 = _2258 * _2254;
        float _2290 = precise::clamp(_2288, 0.0, 1.0);
        _2286 = _2290;
    }
    float _2292 = _2286;
    float _2294 = _1031 * _292;
    float _2296 = _2282 * _1031;
    float _2298 = _2206 * _1045;
    float _2300 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2302 = abs(_765);
    float _2304 = log2(_2302);
    float _2306 = _2274 * _2160;
    float _2308 = _1131 * _292;
    float _2310 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2312 = _1045 * _292;
    float _2314 = _2276 * _2272;
    float _2316 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2318 = fma(_1033, _288, _2308);
    float _2320 = fma(_2202, _1039, _2298);
    float _2322 = _2282 * _1131;
    out.m_93.x = _2268;
    out.m_93.y = _2306;
    out.m_93.z = _2314;
    out.m_93.w = _2278;
    bool _2324 = _765 <= 8000.0;
    bool _2326 = isnan(_765);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan(8000.0);
    bool _2332 = _2328 || _2330;
    float _2334 = float(_2332);
    out.m_95.x = _2264;
    out.m_95.y = _2266;
    out.m_95.z = _2310;
    out.m_95.w = _2316;
    float _2336 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2338 = exp2(_2336);
    float _2340 = _2282 * _1045;
    float _2342 = fma(_1129, _288, _2294);
    float _2344 = fma(_1039, _288, _2312);
    float _2346 = fma(_2202, _1129, _2284);
    float _2348 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2350 = fma(_2246, _1039, _2340);
    float _2352 = fma(_1035, _296, _2342);
    float _2354 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2348);
    float _2356 = fma(_2238, _1149, _2350);
    float _2358 = fma(_1043, _296, _2318);
    float _2360 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2354);
    float _2362 = fma(_1149, _296, _2344);
    float _2364 = fma(_2246, _1129, _2296);
    float _2366 = fma(_2202, _1033, _2240);
    float _2368 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2360);
    float _2370 = fma(_2246, _1033, _2322);
    out.m_97.x = _2352;
    out.m_97.y = _2358;
    out.m_97.z = _2362;
    float _2372 = fma(_2238, _1035, _2364);
    float _2374 = _2368 + _1491;
    float _2376 = fma(_2238, _1043, _2370);
    float _2378 = _2370;
    float _2380 = _2334;
    if (!_1489)
    {
        _2378 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2382 = _2378;
    float _2384 = _2374 * 0.5;
    float _2386 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2388 = precise::clamp(_2386, 0.0, 1.0);
    out.gl_Position.x = _1509;
    out.gl_Position.y = _1529;
    out.gl_Position.z = _2368;
    out.gl_Position.w = _1491;
    int _2390 = as_type<int>(_2382);
    if (!_1489)
    {
        float _2392 = _2382 * 5.0;
        _2390 = as_type<int>(_2392);
    }
    int _2394 = _2390;
    float _2396 = fma(_2388, -2.0, 3.0);
    float _2398 = fma(_2210, _1035, _2346);
    float _2400 = _2388 * _2388;
    float _2402 = -_1934;
    float _2404 = _2402 + 1.0;
    float _2406 = fma(_2210, _1043, _2366);
    if (!_1489)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6536 = as_type<float>(_2394);
        out.gl_Position.z = _6536;
    }
    float _2408 = _2400 * _2396;
    float _2410 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2412 = fma(_2210, _1149, _2320);
    out.m_99.x = _2372;
    out.m_99.y = _2376;
    out.m_99.z = _2356;
    float _2414 = -_2408;
    float _2416 = _2414 + 1.0;
    float _2418 = _2410 * _1595;
    float _2420 = -_2410;
    float _2422 = _2420 + 1.0;
    out.m_101.z = _2384;
    out.m_101.w = _1491;
    float _2424 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2408);
    float _2426 = _2292 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2428 = _1606 * _2422;
    float _2430 = _1606 * _2418;
    float _2432 = _2334 * _2424;
    float _2434 = _2410;
    float _2436 = _2432;
    float _2438 = _2422;
    if (!_1469)
    {
        _2380 = 1.0;
    }
    float _2440 = _2380;
    out.m_103.x = _2398;
    out.m_103.y = _2406;
    out.m_103.z = _2412;
    float _2442 = _2440;
    if (_1469)
    {
        bool _2444 = _1593 >= _1561;
        bool _2446 = isnan(_1593);
        bool _2448 = _2444 || _2446;
        bool _2450 = isnan(_1561);
        bool _2452 = _2448 || _2450;
        float _2454 = float(_2452);
        _2442 = _2454;
    }
    float _2456 = _2442;
    float _2458 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2460 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2462 = isnan(_1700);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2468 = _2464 || _2466;
    float _2470 = _2426 * _1463;
    float _2472 = _1960 * _2458;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = _2456 * _1678;
    float _2478 = _2458;
    float _2480 = _2476;
    if (_1489)
    {
        _1221 = _2470;
    }
    float _2482 = _1221;
    float _2484 = -_2474;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2488 = _2482;
    if (!_1489)
    {
        _2488 = 0.0;
    }
    float _2490 = _2488;
    float _2492 = -_2476;
    float _2494 = fma(_2492, _2486, 1.0);
    float _2496 = precise::clamp(_2494, 0.0, 1.0);
    if (!_2468)
    {
        _2434 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2498 = _2434;
    float _2500 = _2496 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2502 = _2500;
    float _2504 = _2498;
    float _2506 = _2498;
    if (!_2468)
    {
        _2436 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2508 = _2436;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2468)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2514 = _2478;
    out.m_105.x = _2500;
    float _2516 = _2514;
    float _2518 = _2514;
    if (!_2468)
    {
        _2438 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2520 = _2438;
    float _2522 = _2520;
    float _2524 = _2520;
    if (!_2468)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2526 = _2480;
    float _2528 = _2526;
    float _2530 = _2526;
    if (!_2468)
    {
        _2502 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2532 = _2502;
    float _2534 = _1920 * _2418;
    float _2536 = fma(_1916, _2430, _1600);
    float _2538 = fma(_1918, _2430, _1602);
    float _2540 = fma(_1606, _2534, _1604);
    out.m_107.x = _2536;
    out.m_107.y = _2538;
    out.m_107.z = _2540;
    out.m_107.w = _2428;
    bool _2542 = !_2468;
    float _2544 = _2532;
    float _2546 = _2532;
    if (!_2542)
    {
        bool _2548 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2550 = isnan(_1700);
        bool _2552 = _2548 || _2550;
        bool _2554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2556 = _2552 || _2554;
        if (!_2556)
        {
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2560 = _1700 + _2558;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2564 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2562;
            float _2566 = 1.0 / _2564;
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2588 = _2560 * _2566;
            float _2590 = precise::clamp(_2588, 0.0, 1.0);
            float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2596 = fma(_2590, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2598 = fma(_2590, _2594, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2600 = fma(_2590, _2574, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2602 = fma(_2590, _2578, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2604 = fma(_2590, _2582, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2606 = fma(_2590, _2586, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2512 = _2598;
            _2530 = _2604;
            _2506 = _2596;
            _2524 = _2602;
            _2518 = _2600;
            _2546 = _2606;
            _2608 = true;
        }
        else
        {
            bool _2610 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2612 = isnan(_1700);
            bool _2614 = _2610 || _2612;
            bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2618 = _2614 || _2616;
            if (!_2618)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2620 = _2504;
            _2506 = _2620;
            if (!_2618)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2622 = _2510;
            _2512 = _2622;
            if (!_2618)
            {
                _2516 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2624 = _2516;
            _2518 = _2624;
            if (!_2618)
            {
                _2522 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2626 = _2522;
            _2524 = _2626;
            if (!_2618)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2628 = _2528;
            _2530 = _2628;
            if (!_2618)
            {
                _2544 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2630 = _2544;
            bool _2632 = !_2618;
            _2546 = _2630;
            if (!_2632)
            {
                bool _2634 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2636 = isnan(_1700);
                bool _2638 = _2634 || _2636;
                bool _2640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2642 = _2638 || _2640;
                if (!_2642)
                {
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2646 = _1700 + _2644;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2650 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2648;
                    float _2652 = 1.0 / _2650;
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2674 = _2646 * _2652;
                    float _2676 = precise::clamp(_2674, 0.0, 1.0);
                    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2682 = fma(_2676, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2684 = fma(_2676, _2680, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2686 = fma(_2676, _2660, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2688 = fma(_2676, _2664, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2690 = fma(_2676, _2668, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2692 = fma(_2676, _2672, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2512 = _2684;
                    _2530 = _2690;
                    _2506 = _2682;
                    _2524 = _2688;
                    _2518 = _2686;
                    _2546 = _2692;
                    _2608 = true;
                }
                else
                {
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2524 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2518 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2546 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2608 = false;
    float _2694 = _2512;
    float _2696 = _2530;
    float _2698 = _2506;
    float _2700 = _2524;
    float _2702 = _2518;
    float _2704 = _2546;
    float _2706 = fma(_2406, -0.5, 0.5);
    float _2708 = precise::clamp(_2706, 0.0, 1.0);
    float _2710 = -_2694;
    float _2712 = _2710 + _2696;
    float _2714 = -_2698;
    float _2716 = _2714 + _2700;
    float _2718 = -_2702;
    float _2720 = _2718 + _2704;
    bool _2722 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2724 = fma(_2708, _2712, _2694);
    float _2726 = fma(_2708, _2716, _2698);
    float _2728 = fma(_2708, _2720, _2702);
    float _2730 = _2490 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2732 = _2724 * 0.586610972881317138671875;
    out.m_66.x = 1.0;
    float _2734 = fma(_2726, 0.298911988735198974609375, _2732);
    out.m_105.w = _2730;
    float _2736 = fma(_2728, 0.114477999508380889892578125, _2734);
    out.m_109.x = 0.0;
    float _2738 = -_2736;
    float _2740 = _2726 + _2738;
    float _2742 = -_2736;
    float _2744 = _2724 + _2742;
    float _2746 = -_2736;
    float _2748 = _2728 + _2746;
    float _2750 = fma(_2740, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2736);
    float _2752 = fma(_2744, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2736);
    float _2754 = fma(_2748, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2736);
    out.m_111.x = _2750;
    out.m_111.y = _2752;
    out.m_111.z = _2754;
    if (!_2722)
    {
        return out;
    }
    float _2756 = -_1319;
    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2760 = -_1321;
    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2764 = -_1323;
    float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2768 = _2758 * _2758;
    float _2770 = fma(_2762, _2762, _2768);
    float _2772 = fma(_2766, _2766, _2770);
    float _2774 = sqrt(_2772);
    float _2776 = rsqrt(_2772);
    float _2778 = -_2774;
    float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2782 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2784 = precise::clamp(_2782, 0.0, 1.0);
    float _2786 = _2762 * _2776;
    float _2788 = _2758 * _2776;
    float _2790 = abs(_2784);
    float _2792 = log2(_2790);
    float _2794 = _2766 * _2776;
    float _2796 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2798 = _2406 * _2788;
    float _2800 = -_2788;
    float _2802 = -_2796;
    float _2804 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2802);
    float _2806 = fma(_2398, _2786, _2798);
    float _2808 = -_2794;
    float _2810 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2804);
    float _2812 = fma(_2412, _2794, _2806);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2818 = _2810 + _2816;
    float _2820 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2822 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2824 = precise::clamp(_2822, 0.0, 1.0);
    float _2826 = exp2(_2820);
    float _2828 = _2826 * _2824;
    float _2830 = _2814 * _2828;
    float _2832 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2834 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2836 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _2832;
    out.m_109.y = _2834;
    out.m_109.z = _2836;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2608 = false;
    bool _568 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_63.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_66.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2893 = as_type<float>(_146);
        out.gl_Position.z = _2893;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_68.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    if (_160)
    {
        float _168 = float(_130);
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    if (_176)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _140;
    if (_176)
    {
        out.m_66.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _148 = as_type<int>(_180);
    }
    int _182 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2961 = as_type<float>(_182);
        out.gl_Position.z = _2961;
    }
    if (_176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _184 = in.m_70.x;
    float _186 = in.m_70.y;
    float _188 = in.m_70.z;
    float _190 = in.m_72.x;
    float _192 = in.m_72.y;
    float _194 = in.m_72.z;
    float _196 = in.m_74.x;
    float _198 = in.m_74.y;
    float _200 = in.m_74.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    bool _226 = _220 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _222;
    if (_226)
    {
        float _232 = rsqrt(_214);
        _230 = _232;
    }
    float _234 = _230;
    float _236 = 0.0;
    if (!_226)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    bool _240 = _224 > 0.0;
    float _242 = 0.0;
    float _244 = _224;
    float _246 = _238;
    if (!_226)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = _248;
    if (!_226)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = _220;
    float _256 = _252;
    if (_228)
    {
        float _258 = rsqrt(_216);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    if (!_228)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _266 = _262;
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    float _274 = _266;
    if (!_228)
    {
        _270 = 0.0;
    }
    float _276 = _270;
    float _278 = 0.0;
    float _280 = _276;
    if (_240)
    {
        float _282 = rsqrt(_218);
        _278 = _282;
    }
    float _284 = _278;
    if (_226)
    {
        float _286 = _234 * _190;
        _246 = _286;
    }
    float _288 = _246;
    if (_226)
    {
        float _290 = _234 * _184;
        _250 = _290;
    }
    float _292 = _250;
    if (_226)
    {
        float _294 = _234 * _196;
        _256 = _294;
    }
    float _296 = _256;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _300 = 0.0;
    float _302 = 0.0;
    if (!_240)
    {
        _300 = 0.0;
        _302 = 0.0;
    }
    float _304 = _300;
    float _306 = _302;
    float _308 = 0.0;
    float _310 = _304;
    float _312 = _306;
    if (!_240)
    {
        _308 = 0.0;
    }
    float _314 = _308;
    float _316 = _314;
    if (_228)
    {
        float _318 = _260 * _192;
        _280 = _318;
    }
    float _320 = _280;
    if (_228)
    {
        float _322 = _260 * _186;
        _272 = _322;
    }
    float _324 = _272;
    if (_228)
    {
        float _326 = _260 * _198;
        _274 = _326;
    }
    float _328 = _274;
    if (_240)
    {
        float _330 = _284 * _194;
        _310 = _330;
    }
    float _332 = _310;
    if (_240)
    {
        float _334 = _284 * _188;
        _316 = _334;
    }
    float _336 = _316;
    if (_240)
    {
        float _338 = _284 * _200;
        _312 = _338;
    }
    float _340 = _312;
    bool _342 = !_298;
    float _360;
    if (!_342)
    {
        float _344 = in.m_76.x;
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_130);
        float _366 = 1.0 / _364;
        float _368 = _164 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = in.m_76.x;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = _370 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _386;
    bool _390 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_370);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = 1.0 / _380;
    bool _404 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _406 = -_400;
    float _408 = _406 + 1.0;
    float _410 = 1.0 / _384;
    float _412 = 1.0 / _388;
    float _414 = _376 * _402;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _370 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _422 = _370 + _420;
    float _424 = _418 * _410;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _426;
    bool _430 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _432 = isnan(_370);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    bool _442 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_370);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = fma(_428, _414, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _456 = _440 * _408;
    float _458 = _422 * _412;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _460;
    bool _464 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _466 = isnan(_370);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _482 = fma(_462, _414, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _484 = -_440;
    float _486 = _484 + 1.0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = fma(_478, _424, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = _480 * _372;
    float _496 = _474 * _486;
    float _498 = -_474;
    float _500 = _498 + 1.0;
    float _502 = fma(_490, _424, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _504 = _452 * _500;
    float _506 = -_452;
    float _508 = _506 + 1.0;
    float _510 = trunc(_494);
    int _512 = int(_510);
    float _514 = _482 * _504;
    float _516 = _454 * _504;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _522;
    float _526 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[143].x, _514);
    float _528 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[143].y, _516);
    float _530 = fma(_520, _458, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _532 = fma(_524, _458, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _534 = fma(_492, _496, _526);
    float _536 = fma(_502, _496, _528);
    float _538 = fma(_530, _456, _534);
    float _540 = fma(_532, _456, _536);
    int _542 = _512 << 4;
    int _544 = _542 + 1712;
    float _546 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[146].x, _538);
    float _548 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[146].y, _540);
    bool _550 = !_404;
    float _566;
    if (!_550)
    {
        float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _554 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _558 = _556 * _552;
        float _560 = floor(_558);
        float _562 = -_560;
        float _564 = _558 + _562;
        _566 = _564;
        _568 = true;
    }
    else
    {
        float _570 = float(_130);
        float _572 = 1.0 / _570;
        float _574 = _164 * _572;
        _566 = _574;
    }
    _568 = false;
    float _576 = _566;
    float _578 = in.m_63.x;
    float _580 = in.m_63.y;
    float _582 = in.m_63.z;
    float _584 = in.m_74.w;
    float _586 = in.m_72.w;
    float _588 = _198 * _580;
    float _590 = _192 * _580;
    float _592 = fma(_196, _578, _588);
    float _594 = fma(_190, _578, _590);
    float _596 = fma(_200, _582, _592);
    float _598 = fma(_194, _582, _594);
    float _600 = _596 + _584;
    float _602 = _598 + _586;
    float _604 = fma(_600, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _606 = fma(_602, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _608 = floor(_604);
    float _610 = floor(_606);
    float _612 = -_608;
    float _614 = _604 + _612;
    float _616 = -_610;
    float _618 = _606 + _616;
    float2 _3615 = float2(_618, _614);
    float _620 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3615, float2(0.0), isnan(_3615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3615, float2(0.0), isnan(_3615)), level(0.0)).x;
    float _622 = in.m_78.w;
    float _624 = in.m_70.w;
    float _626 = _186 * _580;
    float _628 = in.m_80.x;
    float _630 = in.m_80.y;
    float _632 = trunc(_622);
    int _634 = int(_632);
    int _636 = _634 << 5;
    uint _639 = uint(int(uint(_636) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_639)];
    float _641 = as_type<float>(_dmw0.x);
    int _643 = _636 + 4;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    float _647 = as_type<float>(_dmw0.y);
    int _649 = _636 + 8;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    float _653 = as_type<float>(_dmw0.z);
    int _655 = _636 + 12;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    float _659 = as_type<float>(_dmw0.w);
    float _661 = fma(_184, _578, _626);
    float _663 = _548 * _630;
    float _665 = _546 * _628;
    float _667 = fma(_188, _582, _661);
    float _669 = _663 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _671 = _665 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _673 = _667 + _624;
    float _675 = as_type<float>(int(gl_VertexIndex));
    float _677 = _673 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _679 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[11].x, _677);
    float _681 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[11].z, _679);
    float _683 = _673 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _685 = _681 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _687 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[10].x, _683);
    float _689 = 1.0 / _685;
    float _691 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[10].z, _687);
    float _693 = _691 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _695 = as_type<int>(_675) & 1;
    bool _697 = _695 != 0;
    int _699 = as_type<int>(_675) & 2;
    bool _701 = _699 != 0;
    bool _703 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.5);
    bool _711 = _707 || _709;
    float _713 = _693 + _685;
    bool _715 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.5);
    bool _723 = _719 || _721;
    float _725 = _713 * _689;
    float _727 = _725 * 0.5;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _731 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[30].w, _729);
    float _733 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _735 = 1.0 / _731;
    bool _737 = !_701;
    float _739 = _737 ? (-0.5) : 0.5;
    float _741 = _673 + _733;
    bool _743 = !_697;
    float _745 = _743 ? (-0.5) : 0.5;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _739);
    float _749 = _741 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _745);
    float _753 = _669 * _747;
    float _755 = fma(_602, (*spvDescriptorSet0.vp_c15)._m0[126].x, _749);
    float _757 = _671 * _751;
    float _759 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _761 = fma(_600, (*spvDescriptorSet0.vp_c15)._m0[126].z, _755);
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _765 = _735 * _763;
    float _767 = _741 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _769 = _759 * _320;
    float _771 = _761 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _773 = _765 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _775 = fma(_602, (*spvDescriptorSet0.vp_c15)._m0[127].x, _767);
    bool _777 = _765 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _779 = _759 * _328;
    float _781 = fma(_757, _288, _769);
    float _783 = fma(_600, (*spvDescriptorSet0.vp_c15)._m0[127].z, _775);
    bool _785 = !_773;
    int _787 = _785 ? 0 : 1;
    float _789 = fma(_757, _296, _779);
    float _791 = trunc(_771);
    int _793 = int(_791);
    float _795 = _783 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _797 = -_753;
    float _799 = fma(_797, _332, _781);
    float _801 = -_753;
    float _803 = fma(_801, _340, _789);
    float _805 = _759 * _324;
    int _807 = 2;
    float _809 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _811 = _795;
    if (!_773)
    {
        _807 = 1;
    }
    int _813 = _807;
    float _815 = _602 + _799;
    int _817 = _813;
    if (!_777)
    {
        _817 = _787;
    }
    int _819 = _817;
    float _821 = trunc(_795);
    int _823 = int(_821);
    float _825 = _600 + _803;
    float _827 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _829 = _815 + _827;
    int _831 = _819 << 6;
    float _833 = fma(_757, _292, _805);
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _837 = _825 + _835;
    int _839 = _831 + 48;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    uint _843 = uint(int(uint(int(_841)) >> uint(2)));
    int _845 = int(_841) & 3;
    float _847 = (*spvDescriptorSet0.vp_c15)._m0[int(_843)][_845];
    int _849 = int(_841) + 1;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    int _853 = _849 & 3;
    float _855 = (*spvDescriptorSet0.vp_c15)._m0[int(_851)][_853];
    int _857 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _859 = _793 + _857;
    int _861 = _859 + 1;
    float _863 = _837 * _837;
    float _865 = -_753;
    float _867 = fma(_865, _336, _833);
    bool _869 = _861 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _871 = _673 + _867;
    int _873 = _831 + 56;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    uint _877 = uint(int(uint(int(_875)) >> uint(2)));
    int _879 = int(_875) & 3;
    float _881 = (*spvDescriptorSet0.vp_c15)._m0[int(_877)][_879];
    int _883 = int(_875) + 1;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    int _887 = _883 & 3;
    float _889 = (*spvDescriptorSet0.vp_c15)._m0[int(_885)][_887];
    int _891 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _893 = _823 + _891;
    int _895 = _893 + 1;
    float _897 = fma(_829, _829, _863);
    int _899 = _861 | _895;
    float _901 = sqrt(_897);
    int _903 = _831 + 64;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    uint _907 = uint(int(uint(int(_905)) >> uint(2)));
    int _909 = int(_905) & 3;
    float _911 = (*spvDescriptorSet0.vp_c15)._m0[int(_907)][_909];
    int _913 = int(_905) + 1;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    int _917 = _913 & 3;
    float _919 = (*spvDescriptorSet0.vp_c15)._m0[int(_915)][_917];
    bool _921 = _899 < 0;
    bool _923 = _921 || _869;
    bool _925 = _895 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _927 = _925 || _923;
    int _929 = _831 + 72;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.vp_c15)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.vp_c15)._m0[int(_941)][_943];
    bool _947 = _901 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _949 = _831 + 96;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    uint _953 = uint(int(uint(int(_951)) >> uint(2)));
    int _955 = int(_951) & 3;
    float _957 = (*spvDescriptorSet0.vp_c15)._m0[int(_953)][_955];
    int _959 = int(_951) + 1;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    int _963 = _959 & 3;
    float _965 = (*spvDescriptorSet0.vp_c15)._m0[int(_961)][_963];
    int _967 = _861;
    if (!_927)
    {
        int _969 = _895 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _971 = _969 + _861;
        _967 = _971;
    }
    int _973 = _967;
    int _975 = 0;
    if (!_927)
    {
        int _977 = _973 << 2;
        _975 = _977;
    }
    int _979 = _975;
    int _981 = _831 + 104;
    uint _983 = uint(int(uint(_981) >> uint(2)));
    uint _985 = uint(int(uint(int(_983)) >> uint(2)));
    int _987 = int(_983) & 3;
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[int(_985)][_987];
    int _991 = int(_983) + 1;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    int _995 = _991 & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    float _999 = 0.0;
    int _1001 = _979;
    if (!_947)
    {
        _999 = _815;
    }
    float _1003 = _999;
    float _1005 = _1003;
    if (!_927)
    {
        int _1007 = 12 & _979;
        _1001 = _1007;
    }
    int _1009 = _1001;
    if (!_947)
    {
        _809 = _871;
    }
    float _1011 = _809;
    float _1013 = _659 * 2.0;
    float _1015 = _641 * 2.0;
    float _1017 = _647 * 2.0;
    float _1019 = _641 * _641;
    float _1021 = _653 * _1013;
    float _1023 = _647 * _1013;
    float _1025 = _641 * _1013;
    float _1027 = _653 * _653;
    float _1029 = -_1021;
    float _1031 = fma(_647, _1015, _1029);
    float _1033 = fma(_647, _1015, _1021);
    float _1035 = fma(_653, _1015, _1023);
    float _1037 = -_1023;
    float _1039 = fma(_653, _1015, _1037);
    float _1041 = -_1025;
    float _1043 = fma(_653, _1017, _1041);
    float _1045 = fma(_653, _1017, _1025);
    float _1047 = _647 * _647;
    float _1049 = _653;
    int _1051 = as_type<int>(_1019);
    float _1053 = _1011;
    if (!_947)
    {
        _1049 = _825;
    }
    float _1055 = _1049;
    float _1057 = fma(_1019, -2.0, 1.0);
    float _1059 = fma(_1047, -2.0, 1.0);
    float _1061 = _1055;
    if (!_927)
    {
        uint _1063 = uint(int(uint(_973) >> uint(2)));
        _1051 = int(_1063);
    }
    int _1065 = _1051;
    bool _1067 = !_947;
    float _1069 = 0.0;
    if (!_1067)
    {
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1075 = _901 + _1073;
        float _1077 = _871 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1079 = rsqrt(_897);
        float _1081 = _1075 * _1071;
        float _1083 = _1081 * 0.15915493667125701904296875;
        float _1085 = _1083 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = _1083 * 6.283185482025146484375;
        float _1091 = sin(_1089);
        float _1093 = _1087 + (-1.0);
        float _1095 = fma(_1091, _1077, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1099 = _1079 * _1095;
        float _1101 = fma(_871, _1087, _1097);
        float _1103 = fma(_829, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1105 = fma(_837, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1053 = _1101;
        _1069 = _1083;
        _1005 = _1103;
        _1061 = _1105;
    }
    float _1107 = _1053;
    float _1109 = _1069;
    float _1111 = _1005;
    float _1113 = _1061;
    float _1115 = _1109;
    if (!_927)
    {
        int _1117 = _1065 << 4;
        int _1119 = _1117 + _1009;
        _1115 = as_type<float>(_1119);
    }
    float _1121 = _1115;
    float _1123 = _741 * _965;
    float _1125 = -_673;
    float _1127 = _1125 + _1107;
    float _1129 = fma(_1027, -2.0, _1059);
    float _1131 = fma(_1027, -2.0, _1057);
    float _1133 = fma(_602, _957, _1123);
    float _1135 = _1121;
    if (!_927)
    {
        int _1137 = as_type<int>(_1121) + 400;
        uint _1139 = uint(int(uint(_1137) >> uint(2)));
        uint _1141 = uint(int(uint(int(_1139)) >> uint(2)));
        int _1143 = int(_1139) & 3;
        float _1145 = (*spvDescriptorSet0.vp_c15)._m0[int(_1141)][_1143];
        _1135 = _1145;
    }
    float _1147 = _1135;
    float _1149 = fma(_1047, -2.0, _1057);
    float _1151 = -_602;
    float _1153 = _1151 + _1111;
    float _1155 = _1127 * _324;
    float _1157 = fma(_600, _989, _1133);
    float _1159 = _1127 * _292;
    float _1161 = _1127 * _336;
    float _1163 = _741 * _855;
    float _1165 = -_600;
    float _1167 = _1165 + _1113;
    float _1169 = fma(_1153, _320, _1155);
    float _1171 = _1157 + _997;
    float _1173 = fma(_1153, _288, _1159);
    float _1175 = fma(_1153, _332, _1161);
    float _1177 = fma(_602, _847, _1163);
    float _1179 = fma(_1167, _328, _1169);
    float _1181 = _741 * _919;
    float _1183 = fma(_1167, _296, _1173);
    float _1185 = 1.0 / _1171;
    float _1187 = fma(_1167, _340, _1175);
    float _1189 = _1179 * _1031;
    float _1191 = _1179 * _1131;
    float _1193 = _1179 * _1045;
    int _1195 = _831 + 80;
    uint _1197 = uint(int(uint(_1195) >> uint(2)));
    uint _1199 = uint(int(uint(int(_1197)) >> uint(2)));
    int _1201 = int(_1197) & 3;
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[int(_1199)][_1201];
    int _1205 = int(_1197) + 1;
    uint _1207 = uint(int(uint(_1205) >> uint(2)));
    int _1209 = _1205 & 3;
    float _1211 = (*spvDescriptorSet0.vp_c15)._m0[int(_1207)][_1209];
    float _1213 = fma(_600, _881, _1177);
    float _1215 = fma(_1183, _1033, _1191);
    float _1217 = _997;
    float _1219 = _1171;
    float _1221 = _1149;
    if (!_927)
    {
        float _1223 = floor(_771);
        _1217 = _1223;
    }
    float _1225 = _1217;
    float _1227 = _1213 + _889;
    float _1229 = fma(_1187, _1043, _1215);
    int _1231 = _831 + 88;
    uint _1233 = uint(int(uint(_1231) >> uint(2)));
    uint _1235 = uint(int(uint(int(_1233)) >> uint(2)));
    int _1237 = int(_1233) & 3;
    float _1239 = (*spvDescriptorSet0.vp_c15)._m0[int(_1235)][_1237];
    int _1241 = int(_1233) + 1;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    int _1245 = _1241 & 3;
    float _1247 = (*spvDescriptorSet0.vp_c15)._m0[int(_1243)][_1245];
    float _1249 = fma(_602, _911, _1181);
    float _1251 = fma(_1183, _1129, _1189);
    float _1253 = fma(_1183, _1039, _1193);
    float _1255 = fma(_600, _937, _1249);
    float _1257 = fma(_1187, _1035, _1251);
    float _1259 = fma(_1187, _1149, _1253);
    float _1261 = _673 + _1229;
    float _1263 = _1255 + _945;
    float _1265 = _602 + _1257;
    float _1267 = _600 + _1259;
    float _1269 = _1227 * _1185;
    float _1271 = _1261;
    float _1273 = _1265;
    float _1275 = _1267;
    float _1277 = _1211;
    float _1279 = _1203;
    if (!_711)
    {
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1283 = _673 + _1281;
        float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1287 = _602 + _1285;
        float _1289 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1291 = _1283 * _1283;
        float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1295 = _600 + _1293;
        float _1297 = fma(_1287, _1287, _1291);
        float _1299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1301 = fma(_1295, _1295, _1297);
        float _1303 = sqrt(_1301);
        float _1305 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1307 = precise::min(_1303, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1309 = _1307 * _1299;
        float _1311 = _1305 * _1309;
        float _1313 = fma(_1229, _1311, _673);
        float _1315 = fma(_1257, _1311, _602);
        float _1317 = fma(_1259, _1311, _600);
        _1271 = _1313;
        _1273 = _1315;
        _1275 = _1317;
    }
    float _1319 = _1271;
    float _1321 = _1273;
    float _1323 = _1275;
    float _1325 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1327 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1329 = _889;
    if (!_927)
    {
        float _1331 = floor(_795);
        _1329 = _1331;
    }
    float _1333 = _1329;
    float _1335 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1325);
    float _1339 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1327);
    bool _1341 = _1269 >= 0.0;
    float _1343 = _1263 * _1185;
    float _1345 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1337);
    float _1347 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1349 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1339);
    float _1351 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1335);
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1355 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1347);
    float _1357 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1359 = _1269 <= 1.0;
    bool _1361 = _1359 && _1341;
    float _1363 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1365 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1355);
    float _1367 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1351);
    bool _1371 = _1343 >= 0.0;
    bool _1373 = _1371 && _1361;
    float _1375 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1377 = -_1363;
    float _1379 = fma(_1377, _1357, 1.0);
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1383 = _1365;
    if (_723)
    {
        _1383 = 1.0;
    }
    float _1385 = _1383;
    float _1387 = _1385;
    float _1389 = _1333;
    if (!_723)
    {
        float _1391 = as_type<float>(in.m_87.w);
        int _1393 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1395 = _1393 == 4;
        bool _1397 = _1393 == 8;
        bool _1399 = _1393 == 12;
        int _1401 = as_type<int>(_1391) << 16;
        int _1403 = as_type<int>(_1391) << 8;
        int _1405 = as_type<int>(_1391) << 24;
        int _1407 = _1401 >> 24;
        int _1409 = _1403 >> 24;
        int _1411 = as_type<int>(_1391) >> 24;
        int _1413 = _1405 >> 24;
        float _1415 = float(_1407);
        float _1417 = float(_1409);
        float _1419 = float(_1411);
        float _1421 = _1415 * 0.0078740157186985015869140625;
        float _1423 = float(_1413);
        float _1425 = _1417 * 0.0078740157186985015869140625;
        float _1427 = _1419 * 0.0078740157186985015869140625;
        float _1429 = precise::min(_1421, 1.0);
        float _1431 = _1423 * 0.0078740157186985015869140625;
        float _1433 = precise::min(_1425, 1.0);
        float _1435 = precise::min(_1427, 1.0);
        float _1437 = precise::min(_1431, 1.0);
        float _1439 = precise::max(_1429, -1.0);
        float _1441 = precise::max(_1433, -1.0);
        float _1443 = precise::max(_1435, -1.0);
        float _1445 = precise::max(_1437, -1.0);
        float _1447 = _1445;
        if (_1395)
        {
            _1447 = _1439;
        }
        float _1449 = _1447;
        float _1451 = _1449;
        if (_1397)
        {
            _1451 = _1441;
        }
        float _1453 = _1451;
        float _1455 = _1453;
        if (_1399)
        {
            _1455 = _1443;
        }
        float _1457 = _1455;
        float _1459 = abs(_1457);
        float _1461 = (-0.0) + _1459;
        _1387 = _1461;
    }
    float _1463 = _1387;
    float _1465 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1381);
    bool _1467 = _1343 <= 1.0;
    bool _1469 = _1467 && _1373;
    float _1471 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1473 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1475 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1465);
    float _1477 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1479 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1471);
    bool _1481 = _1463 != 0.0;
    bool _1483 = isnan(_1463);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan(0.0);
    bool _1489 = _1485 || _1487;
    float _1491 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1475);
    float _1493 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1477);
    float _1495 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1479);
    float _1497 = log2(_1379);
    float _1499 = _741 * _1211;
    float _1501 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1493);
    float _1503 = _1479;
    if (_1469)
    {
        float _1505 = float(_819);
        _1503 = _1505;
    }
    float _1507 = _1503;
    float _1509 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1495);
    float _1511 = fma(_602, _1203, _1499);
    if (!_927)
    {
        float _1513 = -_1333;
        float _1515 = _795 + _1513;
        _1219 = _1515;
    }
    float _1517 = _1219;
    float _1519 = _1517;
    if (!_927)
    {
        float _1521 = -_1225;
        float _1523 = _771 + _1521;
        _1389 = _1523;
    }
    float _1525 = _1389;
    float _1527 = 1.0 / _1491;
    float _1529 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    if (_1489)
    {
        _1277 = _1509;
    }
    float _1531 = _1277;
    float _1533 = fma(_600, _1239, _1511);
    float _1535 = _1531;
    if (_1489)
    {
        _1279 = _1529;
    }
    float _1537 = _1279;
    float _1539 = _1537;
    if (!_1489)
    {
        _1535 = 0.0;
        _1539 = 0.0;
    }
    float _1541 = _1535;
    float _1543 = _1539;
    float _1545 = _1501;
    if (_1469)
    {
        float _1547 = rint(_1507);
        float _1549 = precise::max(_1547, 0.0);
        uint _1551 = uint(_1549);
        uint _1553 = clamp(_1551, 0u, 65535u);
        _1545 = as_type<float>(_1553);
    }
    float _1555 = _1545;
    float _1557 = _1533 + _1247;
    float _1559 = _1497 * 0.693147182464599609375;
    float _1561 = _1557 * _1185;
    float _1563 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1565 = _1495;
    if (!_927)
    {
        float _1567 = rint(_1147);
        float _1569 = precise::max(_1567, 0.0);
        uint _1571 = uint(_1569);
        uint _1573 = clamp(_1571, 0u, 65535u);
        _1565 = as_type<float>(_1573);
    }
    float _1575 = _1565;
    float _1577 = _1527 * _1541;
    float _1579 = _1527 * _1543;
    float _1581 = fma(_1577, 0.5, 0.5);
    float _1583 = fma(_1579, -0.5, 0.5);
    float _1585 = _1343;
    float _1587 = _1581;
    float _1589 = _1583;
    if (_1469)
    {
        float3 _5173 = float3(_1269, _1343, float(as_type<int>(_1555)));
        float3 _5177 = select(_5173, float3(0.0), isnan(_5173));
        float _1591 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5177.xy, uint(rint(_5177.z)), _1561, level(0.0));
        _1585 = _1591;
    }
    float _1593 = _1585;
    float3 _5187 = float3(_1581, _1583, _1563);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5187, float3(0.0), isnan(_5187)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5187, float3(0.0), isnan(_5187)), level(0.0)).x;
    float3 _5196 = float3(_1581, _1583, _1563);
    float4 _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5196, float3(0.0), isnan(_5196)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5196, float3(0.0), isnan(_5196)), level(0.0)).xyzw;
    float _1600 = _1598.x;
    float _1602 = _1598.y;
    float _1604 = _1598.z;
    float _1606 = _1598.w;
    float _1608 = _1225;
    if (!_927)
    {
        float3 _5219 = float3(_1525, _1517, float(as_type<int>(_1575)));
        float3 _5221 = select(_5219, float3(0.0), isnan(_5219));
        float _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5221.xy, uint(rint(_5221.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5221.xy, uint(rint(_5221.z)), level(0.0)).x;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (_927)
    {
        _811 = 1.0;
    }
    float _1614 = _811;
    float _1616 = _1614;
    if (!_927)
    {
        int _1618 = _973 << 4;
        int _1620 = _1618 + 2048;
        uint _1622 = uint(int(uint(_1620) >> uint(2)));
        uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
        int _1626 = int(_1622) & 3;
        float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
        int _1630 = int(_1622) + 1;
        uint _1632 = uint(int(uint(_1630) >> uint(2)));
        int _1634 = _1630 & 3;
        float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
        int _1638 = _1620 + 8;
        uint _1640 = uint(int(uint(_1638) >> uint(2)));
        uint _1642 = uint(int(uint(int(_1640)) >> uint(2)));
        int _1644 = int(_1640) & 3;
        float _1646 = (*spvDescriptorSet0.vp_c15)._m0[int(_1642)][_1644];
        int _1648 = int(_1640) + 1;
        uint _1650 = uint(int(uint(_1648) >> uint(2)));
        int _1652 = _1648 & 3;
        float _1654 = (*spvDescriptorSet0.vp_c15)._m0[int(_1650)][_1652];
        float _1656 = _741 * _1636;
        float _1658 = fma(_602, _1628, _1656);
        float _1660 = fma(_600, _1646, _1658);
        float _1662 = _1660 + _1654;
        float _1664 = precise::clamp(_1662, 0.0, 1.0);
        float _1666 = -_1664;
        float _1668 = _1666 + _1612;
        float _1670 = fma(_1668, 500.0, 1.5);
        float _1672 = exp2(_1670);
        float _1674 = 0.0 + _1672;
        float _1676 = precise::clamp(_1674, 0.0, 1.0);
        _1616 = _1676;
    }
    float _1678 = _1616;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1682 = _1319 + _1680;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1686 = _1321 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1690 = _1323 + _1688;
    float _1692 = _1682 * _1682;
    float _1694 = fma(_1686, _1686, _1692);
    float _1696 = fma(_1690, _1690, _1694);
    float _1698 = rsqrt(_1696);
    float _1700 = sqrt(_1696);
    float _1702 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1704 = _1686 * _1702;
    float _1706 = _1690 * _1702;
    float _1708 = _1704 * _1704;
    float _1710 = _1706 * _1706;
    float _1712 = _1708 + _1710;
    float _1714 = sqrt(_1712);
    bool _1716 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1720 = _1714 + _1718;
    float _1722 = _1698;
    float _1724 = _1720;
    float _1726 = _1682;
    if (_1716)
    {
        float _1728 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1722 = _1728;
    }
    float _1730 = _1722;
    if (_1716)
    {
        float _1732 = rsqrt(_1712);
        _1587 = _1732;
    }
    float _1734 = _1587;
    float _1736 = _1734;
    if (_1716)
    {
        float _1738 = _1720 * _1730;
        _1724 = _1738;
    }
    float _1740 = _1724;
    if (_1716)
    {
        float _1742 = _1740 * 0.15915493667125701904296875;
        _1589 = _1742;
    }
    float _1744 = _1589;
    float _1746 = _1690;
    if (_1716)
    {
        float _1748 = _1744 * 6.283185482025146484375;
        float _1750 = sin(_1748);
        _1746 = _1750;
    }
    float _1752 = _1746;
    float _1754 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1756 = precise::max(0.0, _1754);
    float _1758 = _1730;
    float _1760 = _1756;
    if (_1716)
    {
        float _1762 = _1744 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        _1758 = _1764;
    }
    float _1766 = _1758;
    float _1768 = -_1702;
    float _1770 = -_1756;
    float _1772 = fma(_1682, _1768, _1770);
    if (_1716)
    {
        float _1774 = _1772 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1774;
    }
    float _1776 = _1726;
    float _1778 = _1776;
    float _1780 = _1752;
    if (_1716)
    {
        float _1782 = fma(_1752, _1776, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1778 = _1782;
    }
    float _1784 = _1778;
    float _1786 = _1784;
    if (!_1716)
    {
        _1780 = _1704;
    }
    float _1788 = _1780;
    float _1790 = _1788;
    float _1792 = _1766;
    if (_1716)
    {
        float _1794 = _1766 + (-1.0);
        _1760 = _1794;
    }
    float _1796 = _1760;
    float _1798 = 0.0;
    float _1800 = _1796;
    if (_1716)
    {
        float _1802 = _1734 * _1784;
        _1798 = _1802;
    }
    float _1804 = _1798;
    if (!_1716)
    {
        _1786 = _1772;
    }
    float _1806 = _1786;
    float _1808 = _1806;
    if (_1716)
    {
        float _1810 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1810;
    }
    float _1812 = _1519;
    if (_1716)
    {
        float _1814 = _1704 * _1804;
        _1790 = _1814;
    }
    float _1816 = _1790;
    if (!_1716)
    {
        _1800 = _1706;
    }
    float _1818 = _1800;
    float _1820 = _1818;
    if (_1716)
    {
        float _1822 = _1706 * _1804;
        _1820 = _1822;
    }
    float _1824 = _1820;
    if (!_1716)
    {
        _1736 = _1708;
    }
    float _1826 = _1736;
    float _1828 = _1826;
    if (_1716)
    {
        float _1830 = fma(_1772, _1766, _1812);
        _1808 = _1830;
    }
    float _1832 = _1808;
    if (_1716)
    {
        float _1834 = _1816 * _1816;
        _1828 = _1834;
    }
    float _1836 = _1828;
    if (!_1716)
    {
        _1792 = _1710;
    }
    float _1838 = _1792;
    float _1840 = _1838;
    if (_1716)
    {
        float _1842 = _1824 * _1824;
        _1840 = _1842;
    }
    float _1844 = _1840;
    float _1846 = fma(_1832, _1832, _1836);
    float _1848 = _1846 + _1844;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1852 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1850);
    float _1854 = precise::clamp(_1852, 0.0, 1.0);
    float _1856 = -_1854;
    float _1858 = _1856 + 1.0;
    float _1860 = rsqrt(_1848);
    float _1862 = abs(_1858);
    float _1864 = log2(_1862);
    float _1866 = _1860 * _1816;
    float _1868 = _1860 * _1832;
    float _1870 = _1860 * _1824;
    float _1872 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1874 = -_1872;
    float _1876 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1874);
    float _1878 = -_1870;
    float _1880 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1876);
    float _1882 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1884 = fma(_1880, -0.5, 0.5);
    float _1886 = fma(_1880, 0.5, 0.5);
    float _1888 = exp2(_1882);
    float _1890 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = fma(_1886, _1890, -0.212114393711090087890625);
    float _1894 = _1868 + 1.0;
    float _1896 = sqrt(_1884);
    float _1898 = fma(_1886, _1892, 1.570728778839111328125);
    float _1900 = -_1868;
    float _1902 = fma(_1888, _1894, _1900);
    float _1904 = fma(_1902, 0.5, 0.5);
    float _1906 = _1896 * 0.636619746685028076171875;
    float _1908 = -_1898;
    float _1910 = fma(_1906, _1908, 1.0);
    float2 _5690 = float2(_1910, _1904);
    float3 _1914 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5690, float2(0.0), isnan(_5690)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5690, float2(0.0), isnan(_5690)), level(0.0)).xyz;
    float _1916 = _1914.x;
    float _1918 = _1914.y;
    float _1920 = _1914.z;
    float _1922 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1924 = in.m_76.y;
    float _1926 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1928 = _1922 * _372;
    float _1930 = in.m_76.w;
    bool _1932 = _372 > 0.5;
    float _1934 = exp2(_1926);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1938 = _1936 != 0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1944 = in.m_76.z;
    bool _1946 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1948 = isnan(_576);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1954 = _1950 || _1952;
    float _1956 = float(_1954);
    float _1958 = -_620;
    float _1960 = _1958 + 1.0;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1964 = _1962 != 0;
    out.m_89.x = _1321;
    out.m_89.y = _1319;
    out.m_89.z = _1323;
    float _1966 = trunc(_1928);
    int _1968 = int(_1966);
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1972 = _1970 != 0;
    float _1974 = 1.0 / _1942;
    bool _1976 = _1924 > 0.5;
    bool _1978 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1980 = isnan(_576);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1986 = _1982 || _1984;
    float _1988 = float(_1986);
    float _1990 = -_739;
    int _1992 = _1976 ? as_type<int>(_1990) : as_type<int>(_739);
    int _1994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1996 = _1994 != 0;
    int _1998 = _1968 << 4;
    int _2000 = _1998 + 1968;
    float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2002;
    bool _2006 = !_1938;
    float _2008 = _2006 ? _739 : as_type<float>(_1992);
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2012 = uint(int(uint(_2000) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    bool _2028 = _1930 > 0.5;
    float _2030 = _2004 * _1974;
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2034 = _576 + _2032;
    float _2036 = -_1988;
    float _2038 = _2036 + 1.0;
    float _2040 = -_739;
    int _2042 = _2028 ? as_type<int>(_2040) : as_type<int>(_739);
    float _2044 = -_2008;
    float _2046 = _2044 + 0.5;
    int _2048 = _2000 + 8;
    uint _2050 = uint(int(uint(_2048) >> uint(2)));
    uint _2052 = uint(int(uint(int(_2050)) >> uint(2)));
    int _2054 = int(_2050) & 3;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[int(_2052)][_2054];
    float _2058 = fma(_2030, _2034, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2060 = _1944 > 0.5;
    float _2062 = _1956 * _2038;
    float _2064 = -_1956;
    float _2066 = _2064 + 1.0;
    float _2068 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    uint _2070 = uint(int(uint(_544) >> uint(2)));
    uint _2072 = uint(int(uint(int(_2070)) >> uint(2)));
    int _2074 = int(_2070) & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = int(_2070) + 1;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    int _2082 = _2078 & 3;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[int(_2080)][_2082];
    float _2086 = _2058 * _2062;
    bool _2088 = !_1964;
    float _2090 = _2088 ? _739 : as_type<float>(_2042);
    float _2092 = _739 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2096 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2094);
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2100 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2098);
    float _2102 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2086);
    float _2104 = fma(_2092, _2092, 1.0);
    float _2106 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2096);
    float _2108 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2100);
    float _2110 = -_2090;
    float _2112 = _2110 + 0.5;
    float _2114 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2102);
    float _2116 = _602 + _2106;
    float _2118 = rsqrt(_2104);
    float _2120 = -_745;
    int _2122 = _1932 ? as_type<int>(_2120) : as_type<int>(_745);
    int _2124 = _544 + 8;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    uint _2128 = uint(int(uint(int(_2126)) >> uint(2)));
    int _2130 = int(_2126) & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    bool _2134 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2136 = isnan(0.0);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2142 = _2138 || _2140;
    float _2144 = _600 + _2108;
    bool _2146 = !_1972;
    float _2148 = _2146 ? _745 : as_type<float>(_2122);
    float _2150 = _745 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2152 = -_745;
    int _2154 = _2060 ? as_type<int>(_2152) : as_type<int>(_745);
    float _2156 = -_2144;
    float _2158 = _2156 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2162 = fma(_2150, _292, _324);
    float _2164 = fma(_2150, _296, _328);
    float _2166 = _2148 + 0.5;
    float _2168 = precise::min(_2144, _2158);
    bool _2170 = !_1996;
    float _2172 = _2170 ? _745 : as_type<float>(_2154);
    float _2174 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_2142)
    {
        float _2176 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2174 = _2176;
    }
    float _2178 = _2174;
    float _2180 = -_332;
    float _2182 = _2118 * _2180;
    float _2184 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2186 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2188 = fma(_2150, _288, _320);
    float _2190 = _2026 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2192 = _2178;
    if (_2142)
    {
        float _2194 = precise::min(_2178, 20.0);
        _2192 = _2194;
    }
    float _2196 = _2192;
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2200 = -_2092;
    float _2202 = fma(_2200, _332, _2188);
    float _2204 = -_2092;
    float _2206 = fma(_2204, _336, _2162);
    float _2208 = -_2092;
    float _2210 = fma(_2208, _340, _2164);
    float _2212 = _2056 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2214 = _2092 * _2118;
    float _2216 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2218 = -_336;
    float _2220 = _2118 * _2218;
    float _2222 = -_340;
    float _2224 = _2118 * _2222;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2230 = -_2116;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2234 = _2076 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2236 = -_2214;
    float _2238 = fma(_2236, _328, _2224);
    out.m_91.x = _2198;
    out.m_91.y = _2216;
    out.m_91.z = _2226;
    float _2240 = _2206 * _1131;
    float _2242 = precise::min(_2116, _2232);
    float _2244 = -_2214;
    float _2246 = fma(_2244, _320, _2182);
    float _2248 = _2076;
    float _2250 = _2084;
    if (_2142)
    {
        float _2252 = 1.0 / _2196;
        _2248 = _2252;
    }
    float _2254 = _2248;
    float _2256 = _2084 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2258 = precise::min(_2242, _2168);
    float _2260 = _2172 + 0.5;
    if (!_2142)
    {
        _2250 = 1.0;
    }
    float _2262 = _2250;
    float _2264 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2266 = _2256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2184 * _2010;
    float _2270 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2274 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2276 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2278 = _2270 * _2228;
    float _2280 = -_2214;
    float _2282 = fma(_2280, _324, _2220);
    float _2284 = _2206 * _1031;
    float _2286 = _2262;
    if (_2142)
    {
        float _2288 = _2258 * _2254;
        float _2290 = precise::clamp(_2288, 0.0, 1.0);
        _2286 = _2290;
    }
    float _2292 = _2286;
    float _2294 = _1031 * _292;
    float _2296 = _2282 * _1031;
    float _2298 = _2206 * _1045;
    float _2300 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2302 = abs(_765);
    float _2304 = log2(_2302);
    float _2306 = _2274 * _2160;
    float _2308 = _1131 * _292;
    float _2310 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2312 = _1045 * _292;
    float _2314 = _2276 * _2272;
    float _2316 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2318 = fma(_1033, _288, _2308);
    float _2320 = fma(_2202, _1039, _2298);
    float _2322 = _2282 * _1131;
    out.m_93.x = _2268;
    out.m_93.y = _2306;
    out.m_93.z = _2314;
    out.m_93.w = _2278;
    bool _2324 = _765 <= 8000.0;
    bool _2326 = isnan(_765);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan(8000.0);
    bool _2332 = _2328 || _2330;
    float _2334 = float(_2332);
    out.m_95.x = _2264;
    out.m_95.y = _2266;
    out.m_95.z = _2310;
    out.m_95.w = _2316;
    float _2336 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2338 = exp2(_2336);
    float _2340 = _2282 * _1045;
    float _2342 = fma(_1129, _288, _2294);
    float _2344 = fma(_1039, _288, _2312);
    float _2346 = fma(_2202, _1129, _2284);
    float _2348 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2350 = fma(_2246, _1039, _2340);
    float _2352 = fma(_1035, _296, _2342);
    float _2354 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2348);
    float _2356 = fma(_2238, _1149, _2350);
    float _2358 = fma(_1043, _296, _2318);
    float _2360 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2354);
    float _2362 = fma(_1149, _296, _2344);
    float _2364 = fma(_2246, _1129, _2296);
    float _2366 = fma(_2202, _1033, _2240);
    float _2368 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2360);
    float _2370 = fma(_2246, _1033, _2322);
    out.m_97.x = _2352;
    out.m_97.y = _2358;
    out.m_97.z = _2362;
    float _2372 = fma(_2238, _1035, _2364);
    float _2374 = _2368 + _1491;
    float _2376 = fma(_2238, _1043, _2370);
    float _2378 = _2370;
    float _2380 = _2334;
    if (!_1489)
    {
        _2378 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2382 = _2378;
    float _2384 = _2374 * 0.5;
    float _2386 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2388 = precise::clamp(_2386, 0.0, 1.0);
    out.gl_Position.x = _1509;
    out.gl_Position.y = _1529;
    out.gl_Position.z = _2368;
    out.gl_Position.w = _1491;
    int _2390 = as_type<int>(_2382);
    if (!_1489)
    {
        float _2392 = _2382 * 5.0;
        _2390 = as_type<int>(_2392);
    }
    int _2394 = _2390;
    float _2396 = fma(_2388, -2.0, 3.0);
    float _2398 = fma(_2210, _1035, _2346);
    float _2400 = _2388 * _2388;
    float _2402 = -_1934;
    float _2404 = _2402 + 1.0;
    float _2406 = fma(_2210, _1043, _2366);
    if (!_1489)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6536 = as_type<float>(_2394);
        out.gl_Position.z = _6536;
    }
    float _2408 = _2400 * _2396;
    float _2410 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2412 = fma(_2210, _1149, _2320);
    out.m_99.x = _2372;
    out.m_99.y = _2376;
    out.m_99.z = _2356;
    float _2414 = -_2408;
    float _2416 = _2414 + 1.0;
    float _2418 = _2410 * _1595;
    float _2420 = -_2410;
    float _2422 = _2420 + 1.0;
    out.m_101.z = _2384;
    out.m_101.w = _1491;
    float _2424 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2408);
    float _2426 = _2292 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2428 = _1606 * _2422;
    float _2430 = _1606 * _2418;
    float _2432 = _2334 * _2424;
    float _2434 = _2410;
    float _2436 = _2432;
    float _2438 = _2422;
    if (!_1469)
    {
        _2380 = 1.0;
    }
    float _2440 = _2380;
    out.m_103.x = _2398;
    out.m_103.y = _2406;
    out.m_103.z = _2412;
    float _2442 = _2440;
    if (_1469)
    {
        bool _2444 = _1593 >= _1561;
        bool _2446 = isnan(_1593);
        bool _2448 = _2444 || _2446;
        bool _2450 = isnan(_1561);
        bool _2452 = _2448 || _2450;
        float _2454 = float(_2452);
        _2442 = _2454;
    }
    float _2456 = _2442;
    float _2458 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2460 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2462 = isnan(_1700);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2468 = _2464 || _2466;
    float _2470 = _2426 * _1463;
    float _2472 = _1960 * _2458;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = _2456 * _1678;
    float _2478 = _2458;
    float _2480 = _2476;
    if (_1489)
    {
        _1221 = _2470;
    }
    float _2482 = _1221;
    float _2484 = -_2474;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2488 = _2482;
    if (!_1489)
    {
        _2488 = 0.0;
    }
    float _2490 = _2488;
    float _2492 = -_2476;
    float _2494 = fma(_2492, _2486, 1.0);
    float _2496 = precise::clamp(_2494, 0.0, 1.0);
    if (!_2468)
    {
        _2434 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2498 = _2434;
    float _2500 = _2496 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2502 = _2500;
    float _2504 = _2498;
    float _2506 = _2498;
    if (!_2468)
    {
        _2436 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2508 = _2436;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2468)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2514 = _2478;
    out.m_105.x = _2500;
    float _2516 = _2514;
    float _2518 = _2514;
    if (!_2468)
    {
        _2438 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2520 = _2438;
    float _2522 = _2520;
    float _2524 = _2520;
    if (!_2468)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2526 = _2480;
    float _2528 = _2526;
    float _2530 = _2526;
    if (!_2468)
    {
        _2502 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2532 = _2502;
    float _2534 = _1920 * _2418;
    float _2536 = fma(_1916, _2430, _1600);
    float _2538 = fma(_1918, _2430, _1602);
    float _2540 = fma(_1606, _2534, _1604);
    out.m_107.x = _2536;
    out.m_107.y = _2538;
    out.m_107.z = _2540;
    out.m_107.w = _2428;
    bool _2542 = !_2468;
    float _2544 = _2532;
    float _2546 = _2532;
    if (!_2542)
    {
        bool _2548 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2550 = isnan(_1700);
        bool _2552 = _2548 || _2550;
        bool _2554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2556 = _2552 || _2554;
        if (!_2556)
        {
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2560 = _1700 + _2558;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2564 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2562;
            float _2566 = 1.0 / _2564;
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2588 = _2560 * _2566;
            float _2590 = precise::clamp(_2588, 0.0, 1.0);
            float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2596 = fma(_2590, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2598 = fma(_2590, _2594, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2600 = fma(_2590, _2574, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2602 = fma(_2590, _2578, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2604 = fma(_2590, _2582, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2606 = fma(_2590, _2586, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2512 = _2598;
            _2530 = _2604;
            _2506 = _2596;
            _2524 = _2602;
            _2518 = _2600;
            _2546 = _2606;
            _2608 = true;
        }
        else
        {
            bool _2610 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2612 = isnan(_1700);
            bool _2614 = _2610 || _2612;
            bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2618 = _2614 || _2616;
            if (!_2618)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2620 = _2504;
            _2506 = _2620;
            if (!_2618)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2622 = _2510;
            _2512 = _2622;
            if (!_2618)
            {
                _2516 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2624 = _2516;
            _2518 = _2624;
            if (!_2618)
            {
                _2522 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2626 = _2522;
            _2524 = _2626;
            if (!_2618)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2628 = _2528;
            _2530 = _2628;
            if (!_2618)
            {
                _2544 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2630 = _2544;
            bool _2632 = !_2618;
            _2546 = _2630;
            if (!_2632)
            {
                bool _2634 = _1700 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2636 = isnan(_1700);
                bool _2638 = _2634 || _2636;
                bool _2640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2642 = _2638 || _2640;
                if (!_2642)
                {
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2646 = _1700 + _2644;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2650 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2648;
                    float _2652 = 1.0 / _2650;
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2674 = _2646 * _2652;
                    float _2676 = precise::clamp(_2674, 0.0, 1.0);
                    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2682 = fma(_2676, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2684 = fma(_2676, _2680, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2686 = fma(_2676, _2660, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2688 = fma(_2676, _2664, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2690 = fma(_2676, _2668, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2692 = fma(_2676, _2672, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2512 = _2684;
                    _2530 = _2690;
                    _2506 = _2682;
                    _2524 = _2688;
                    _2518 = _2686;
                    _2546 = _2692;
                    _2608 = true;
                }
                else
                {
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2524 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2518 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2546 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2608 = false;
    float _2694 = _2512;
    float _2696 = _2530;
    float _2698 = _2506;
    float _2700 = _2524;
    float _2702 = _2518;
    float _2704 = _2546;
    float _2706 = fma(_2406, -0.5, 0.5);
    float _2708 = precise::clamp(_2706, 0.0, 1.0);
    float _2710 = -_2694;
    float _2712 = _2710 + _2696;
    float _2714 = -_2698;
    float _2716 = _2714 + _2700;
    float _2718 = -_2702;
    float _2720 = _2718 + _2704;
    bool _2722 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2724 = fma(_2708, _2712, _2694);
    float _2726 = fma(_2708, _2716, _2698);
    float _2728 = fma(_2708, _2720, _2702);
    float _2730 = _2490 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2732 = _2724 * 0.586610972881317138671875;
    out.m_66.x = 1.0;
    float _2734 = fma(_2726, 0.298911988735198974609375, _2732);
    out.m_105.w = _2730;
    float _2736 = fma(_2728, 0.114477999508380889892578125, _2734);
    out.m_109.x = 0.0;
    float _2738 = -_2736;
    float _2740 = _2726 + _2738;
    float _2742 = -_2736;
    float _2744 = _2724 + _2742;
    float _2746 = -_2736;
    float _2748 = _2728 + _2746;
    float _2750 = fma(_2740, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2736);
    float _2752 = fma(_2744, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2736);
    float _2754 = fma(_2748, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2736);
    out.m_111.x = _2750;
    out.m_111.y = _2752;
    out.m_111.z = _2754;
    if (!_2722)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2756 = -_1319;
    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2760 = -_1321;
    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2764 = -_1323;
    float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2768 = _2758 * _2758;
    float _2770 = fma(_2762, _2762, _2768);
    float _2772 = fma(_2766, _2766, _2770);
    float _2774 = sqrt(_2772);
    float _2776 = rsqrt(_2772);
    float _2778 = -_2774;
    float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2782 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2784 = precise::clamp(_2782, 0.0, 1.0);
    float _2786 = _2762 * _2776;
    float _2788 = _2758 * _2776;
    float _2790 = abs(_2784);
    float _2792 = log2(_2790);
    float _2794 = _2766 * _2776;
    float _2796 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2798 = _2406 * _2788;
    float _2800 = -_2788;
    float _2802 = -_2796;
    float _2804 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2802);
    float _2806 = fma(_2398, _2786, _2798);
    float _2808 = -_2794;
    float _2810 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2804);
    float _2812 = fma(_2412, _2794, _2806);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2818 = _2810 + _2816;
    float _2820 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2822 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2824 = precise::clamp(_2822, 0.0, 1.0);
    float _2826 = exp2(_2820);
    float _2828 = _2826 * _2824;
    float _2830 = _2814 * _2828;
    float _2832 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2834 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2836 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _2832;
    out.m_109.y = _2834;
    out.m_109.z = _2836;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

