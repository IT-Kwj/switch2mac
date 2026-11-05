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

struct _35
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c11 [[id(6)]];
    constant _16* vp_c7 [[id(7)]];
    const device _35* vp_s0 [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_14 [[id(11)]];
    sampler vp_t_tcb_14Smplr [[id(12)]];
    texture2d_array<float> vp_t_tcb_16 [[id(13)]];
    sampler vp_t_tcb_16Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_32 [[id(15)]];
    sampler vp_t_tcb_32Smplr [[id(16)]];
    texture3d<float> vp_t_tcb_30 [[id(17)]];
    sampler vp_t_tcb_30Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_87 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_109 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_101 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_99 [[user(locn9)]];
    float4 m_107 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_105 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_76 [[attribute(3)]];
    float4 m_91 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
    float4 m_78 [[attribute(7)]];
    float4 m_85 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2670 = false;
    bool _994 = false;
    bool _982 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_65.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_68.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2969 = as_type<float>(_144);
        out.gl_Position.z = _2969;
    }
    if (!_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_70.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_158)
    {
        float _164 = float(_128);
        _138 = _164;
    }
    float _166 = _138;
    bool _168 = _162 >= _166;
    bool _170 = !_158;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_68.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _146 = as_type<int>(_178);
    }
    int _180 = _146;
    float _182 = as_type<float>(_180);
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_180);
        out.gl_Position.z = _3040;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _184 = in.m_72.x;
    float _186 = in.m_72.y;
    float _188 = in.m_72.z;
    float _190 = in.m_74.x;
    float _192 = in.m_74.y;
    float _194 = in.m_74.z;
    float _196 = in.m_76.x;
    float _198 = in.m_76.y;
    float _200 = in.m_76.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = fma(_190, _190, _202);
    float _208 = fma(_192, _192, _204);
    float _210 = fma(_196, _196, _206);
    float _212 = _188 * _188;
    float _214 = fma(_198, _198, _208);
    float _216 = sqrt(_210);
    float _218 = fma(_194, _194, _212);
    float _220 = fma(_200, _200, _218);
    float _222 = sqrt(_214);
    float _224 = sqrt(_220);
    bool _226 = _216 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = 0.0;
    float _232 = _216;
    float _234 = _222;
    float _236 = _210;
    float _238 = _220;
    float _240 = _214;
    if (_226)
    {
        float _242 = rsqrt(_210);
        _230 = _242;
    }
    float _244 = _230;
    if (!_226)
    {
        _232 = 0.0;
    }
    float _246 = _232;
    bool _248 = _224 > 0.0;
    float _250 = _224;
    float _252 = _246;
    if (!_226)
    {
        _250 = 0.0;
        _234 = 0.0;
    }
    float _254 = _250;
    float _256 = _234;
    float _258 = 0.0;
    float _260 = _254;
    float _262 = _256;
    if (!_228)
    {
        _258 = 0.0;
    }
    float _264 = _258;
    float _266 = 0.0;
    float _268 = _264;
    if (_228)
    {
        float _270 = rsqrt(_214);
        _266 = _270;
    }
    float _272 = _266;
    float _274 = 0.0;
    if (_248)
    {
        float _276 = rsqrt(_220);
        _274 = _276;
    }
    float _278 = _274;
    float _280 = _244;
    if (_226)
    {
        float _282 = _244 * _190;
        _252 = _282;
    }
    float _284 = _252;
    if (_226)
    {
        float _286 = _244 * _184;
        _260 = _286;
    }
    float _288 = _260;
    if (_226)
    {
        float _290 = _244 * _196;
        _262 = _290;
    }
    float _292 = _262;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_228)
    {
        _280 = 0.0;
        _182 = 0.0;
    }
    float _296 = _280;
    float _298 = _182;
    float _300 = _296;
    float _302 = _298;
    if (!_248)
    {
        _236 = 0.0;
    }
    float _304 = _236;
    float _306 = _304;
    if (_228)
    {
        float _308 = _272 * _192;
        _268 = _308;
    }
    float _310 = _268;
    if (!_248)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _312 = _238;
    float _314 = _240;
    float _316 = _312;
    float _318 = _314;
    if (_228)
    {
        float _320 = _272 * _186;
        _300 = _320;
    }
    float _322 = _300;
    if (_228)
    {
        float _324 = _272 * _198;
        _302 = _324;
    }
    float _326 = _302;
    if (_248)
    {
        float _328 = _278 * _194;
        _316 = _328;
    }
    float _330 = _316;
    if (_248)
    {
        float _332 = _278 * _188;
        _318 = _332;
    }
    float _334 = _318;
    if (_248)
    {
        float _336 = _278 * _200;
        _306 = _336;
    }
    float _338 = _306;
    bool _340 = !_294;
    float _358;
    if (!_340)
    {
        float _342 = in.m_78.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_128);
        float _364 = 1.0 / _362;
        float _366 = _162 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = as_type<float>(int(gl_VertexIndex));
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _374 = _368 + _372;
    float _376 = in.m_65.x;
    float _378 = in.m_65.y;
    float _380 = in.m_65.z;
    float _382 = in.m_78.x;
    float _384 = in.m_78.y;
    float _386 = in.m_78.z;
    float _388 = in.m_78.w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _396 = in.m_74.w;
    float _398 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _400 = _392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _402 = _394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = in.m_72.w;
    float _406 = in.m_76.w;
    int _408 = as_type<int>(_370) & 1;
    bool _410 = _408 != 0;
    int _412 = as_type<int>(_370) & 2;
    bool _414 = _412 != 0;
    out.m_83.x = _398;
    out.m_83.y = _400;
    out.m_83.z = _402;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    float _420 = _192 * _378;
    float _422 = _186 * _378;
    float _424 = _198 * _378;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = fma(_190, _376, _420);
    float _432 = fma(_184, _376, _422);
    float _434 = fma(_196, _376, _424);
    float _436 = _384 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _438 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _444 = _388 > 0.5;
    float _446 = fma(_436, -2.0, _440);
    float _448 = -_442;
    float _450 = fma(_438, 2.0, _448);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _462 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].z, _452);
    float _464 = 1.0 / _456;
    float _466 = fma(_194, _380, _430);
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _470 = _468 != 0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _478 = _476 != 0;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _482 = 1.0 / _460;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _486 = fma(_188, _380, _432);
    bool _488 = !_410;
    float _490 = _488 ? (-0.5) : 0.5;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _368 + _492;
    float _496 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[78].w, _484);
    float _498 = -_162;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[76].x, _450);
    float _502 = 1.0 / _474;
    bool _504 = _386 > 0.5;
    float _506 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[79].z, _480);
    bool _508 = !_414;
    float _510 = _508 ? (-0.5) : 0.5;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _520 = _382 > 0.5;
    float _522 = fma(_200, _380, _434);
    float _524 = -_510;
    int _526 = _444 ? as_type<int>(_524) : as_type<int>(_510);
    float _528 = _514 * _464;
    float _530 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[79].x, _506);
    bool _532 = _384 > 0.5;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _368 + _534;
    bool _538 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = isnan(_368);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _550;
    float _554 = _518 * _502;
    float _556 = fma(_528, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _558 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = isnan(_368);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _552 * _482;
    float _572 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _446);
    float _574 = in.m_85.x;
    float _576 = in.m_85.y;
    float _578 = fma(_554, _494, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = -_568;
    float _582 = _580 + 1.0;
    float _584 = fma(_570, _374, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _586 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = isnan(_368);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _462);
    float _600 = _548 * _582;
    float _602 = -_548;
    float _604 = _602 + 1.0;
    float _606 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _496);
    bool _608 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_368);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = _466 + _396;
    float _622 = _596 * _604;
    float _624 = -_596;
    float _626 = _624 + 1.0;
    float _628 = _486 + _404;
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _490);
    float _632 = _522 + _406;
    float _634 = _618 * _626;
    float _636 = -_490;
    int _638 = _504 ? as_type<int>(_636) : as_type<int>(_490);
    float _640 = _510 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _510);
    float _644 = _556 * _634;
    float _646 = -_510;
    int _648 = _532 ? as_type<int>(_646) : as_type<int>(_510);
    float _650 = _530 * (-0.15915493667125701904296875);
    bool _652 = !_478;
    float _654 = _652 ? _510 : as_type<float>(_526);
    float _656 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _658 = !_428;
    float _660 = _658 ? _510 : as_type<float>(_648);
    float _662 = _490 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _664 = !_470;
    float _666 = _664 ? _490 : as_type<float>(_638);
    float _668 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _670 = _640 * _322;
    float _672 = _640 * _310;
    float _674 = _640 * _326;
    float _676 = _668 * _630;
    float _678 = -_490;
    int _680 = _520 ? as_type<int>(_678) : as_type<int>(_490);
    float _682 = _576 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _684 = fma(_662, _288, _670);
    float _686 = fma(_662, _284, _672);
    bool _688 = !_418;
    float _690 = _688 ? _490 : as_type<float>(_680);
    float _692 = fma(_662, _292, _674);
    float _694 = _650 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _628 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _700 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _702 = -_618;
    float _704 = _702 + 1.0;
    float _706 = _620 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _708 = _698 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _710 = _700 * _642;
    float _712 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[115].x, _644);
    float _714 = _650 * 6.283185482025146484375;
    float _716 = cos(_714);
    float _718 = _632 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c12)._m0[6].x, _708);
    float _722 = _710 * _322;
    float _724 = _710 * _310;
    float _726 = _710 * _326;
    float _728 = fma(_718, (*spvDescriptorSet0.vp_c12)._m0[8].x, _720);
    float _730 = fma(_640, _640, 1.0);
    float _732 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _734 = fma(_676, _288, _722);
    float _736 = _698 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _738 = fma(_676, _284, _724);
    float _740 = fma(_676, _292, _726);
    float _742 = _660 * _696;
    float _744 = fma(_578, _622, _712);
    float _746 = _728 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _750 = _660 * _716;
    float _752 = fma(_706, (*spvDescriptorSet0.vp_c12)._m0[6].y, _736);
    float _754 = -_742;
    float _756 = fma(_690, _716, _754);
    float _758 = _698 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _760 = fma(_690, _696, _750);
    float _762 = fma(_584, _600, _744);
    float _764 = _666 + 0.5;
    float _766 = rsqrt(_730);
    float _768 = _746 * _732;
    float _770 = fma(_718, (*spvDescriptorSet0.vp_c12)._m0[8].y, _752);
    float _772 = fma(_706, (*spvDescriptorSet0.vp_c12)._m0[6].z, _758);
    float _774 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _776 = fma(_768, 0.5, 0.5);
    float _778 = _770 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _780 = fma(_718, (*spvDescriptorSet0.vp_c12)._m0[8].z, _772);
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _784 = fma(_774, _330, _738);
    float _786 = _778 * _748;
    float _788 = fma(_774, _334, _734);
    float _790 = _780 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _792 = _764 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _794 = fma(_786, 0.5, 0.5);
    float _796 = -_654;
    float _798 = _796 + 0.5;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _802 = _640 * _766;
    float _804 = _756 + 0.5;
    float _806 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[118].x, _762);
    float _808 = -_330;
    float _810 = _802 * _808;
    float _812 = -_598;
    float _814 = _812 + 1.0;
    float _816 = fma(_774, _338, _740);
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _820 = _790 * _782;
    float _822 = fma(_766, _310, _810);
    float _824 = _760 + (-0.5);
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _828 = fma(_820, 0.5, 0.5);
    float _830 = -_334;
    float _832 = _802 * _830;
    float _834 = _684 + _334;
    float _836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _838 = _800 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _840 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = -_338;
    float _844 = _802 * _842;
    float _846 = fma(_766, _322, _832);
    float _848 = -_838;
    float _850 = -_572;
    float _852 = fma(_848, _824, _850);
    float _854 = fma(_766, _326, _844);
    float _856 = floor(_794);
    float _858 = _818 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _860 = fma(_858, _804, _500);
    float _862 = floor(_776);
    float _864 = _792 * _836;
    float _866 = _798 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _868 = -_606;
    float _870 = _868 + 1.0;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _876 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _878 = floor(_828);
    float _880 = -_856;
    float _882 = _794 + _880;
    float _884 = fma(_760, _870, _852);
    float _886 = -_814;
    float _888 = fma(_756, _886, _860);
    float _890 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = fma(_882, 2.0, -1.0);
    float _896 = -_862;
    float _898 = _776 + _896;
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _902 = _894 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_87.x = _890;
    out.m_87.y = _892;
    out.m_87.z = _840;
    out.m_87.w = _876;
    float _904 = fma(_898, 2.0, -1.0);
    float _906 = _902 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _908 = _902 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _910 = -_878;
    float _912 = _828 + _910;
    float _914 = _904 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _916 = _902 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _918 = fma(_912, 2.0, -1.0);
    float _920 = _918 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c12)._m0[2].x, _906);
    float _924 = fma(_914, (*spvDescriptorSet0.vp_c12)._m0[2].y, _908);
    float _926 = fma(_914, (*spvDescriptorSet0.vp_c12)._m0[2].z, _916);
    bool _928 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _930 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _932 = _928 || _930;
    bool _934 = isnan(1.0);
    bool _936 = _932 || _934;
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c12)._m0[4].x, _922);
    float _940 = fma(_920, (*spvDescriptorSet0.vp_c12)._m0[4].y, _924);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c12)._m0[4].z, _926);
    float _944 = _866 * _900;
    float _946 = _938 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _948 = _940 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _950 = _942 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    out.m_89.x = _888;
    out.m_89.y = _884;
    out.m_89.z = _864;
    out.m_89.w = _944;
    float _952 = _784 + _946;
    float _954 = _788 + _948;
    float _956 = _816 + _950;
    float _958 = _686 + _330;
    float _960 = _692 + _338;
    float _962 = _882;
    float _964 = _882;
    float _966 = _904;
    float _968 = _894;
    float _970 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _972 = _918;
    float _974 = _692;
    float _976 = _948;
    float _986;
    float _988;
    float _990;
    float _992;
    if (!_936)
    {
        bool _978 = _948 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _980 = !_978;
        _982 = _980;
        if (!_982)
        {
            float _984 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _986 = _984;
            _988 = 0.0;
            _990 = 0.0;
            _992 = 0.0;
            _994 = true;
        }
    }
    if ((!_994) || _982)
    {
        bool _1036;
        if (!_982)
        {
            bool _996 = _948 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _998 = isnan(_948);
            bool _1000 = _996 || _998;
            bool _1002 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1004 = _1000 || _1002;
            bool _1006 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1008 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1010 = !_1004;
            bool _1012 = _1008 && _1010;
            float _1014 = 0.0;
            if (_1012)
            {
                _1014 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1016 = _1014;
            float _1018 = 0.0;
            float _1020 = _1016;
            if (_1012)
            {
                _1018 = 0.0;
            }
            float _1022 = _1018;
            float _1024 = 0.0;
            _988 = _1022;
            if (_1012)
            {
                _1024 = 0.0;
            }
            float _1026 = _1024;
            _990 = _1026;
            if (_1012)
            {
                float _1028 = _1016 * 5.0;
                _1020 = _1028;
            }
            float _1030 = _1020;
            _986 = _1030;
            if (_1012)
            {
                _962 = 0.0;
            }
            float _1032 = _962;
            bool _1034 = !_1004;
            _1036 = _1034 && _1006;
            _964 = _1032;
            _992 = _1032;
        }
        if ((!_1036) || _982)
        {
            _982 = false;
            float _1038 = _964;
            bool _1040 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1042 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1044 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1046 = _876;
            float _1048 = _1038;
            _986 = _956;
            _988 = _952;
            _990 = _954;
            if (_1040)
            {
                float _1050 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1046 = _1050;
            }
            float _1052 = _1046;
            if (_1040)
            {
                float _1054 = abs(_904);
                float _1056 = -_1054;
                float _1058 = _1056 + 1.0;
                _966 = _1058;
            }
            float _1060 = _966;
            if (_1042)
            {
                float _1062 = abs(_894);
                float _1064 = -_1062;
                float _1066 = _1064 + 1.0;
                _968 = _1066;
            }
            float _1068 = _968;
            if (!_1040)
            {
                _970 = 1.0;
            }
            float _1070 = _970;
            float _1072 = _1070;
            if (_1044)
            {
                float _1074 = abs(_918);
                float _1076 = -_1074;
                float _1078 = _1076 + 1.0;
                _972 = _1078;
            }
            float _1080 = _972;
            if (!_1042)
            {
                _974 = 1.0;
            }
            float _1082 = _974;
            float _1084 = _1082;
            if (!_1044)
            {
                _1048 = 1.0;
            }
            float _1086 = _1048;
            float _1088 = _938;
            float _1090 = _1086;
            if (_1042)
            {
                float _1092 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1088 = _1092;
            }
            float _1094 = _1088;
            float _1096 = _920;
            if (_1044)
            {
                float _1098 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1096 = _1098;
            }
            float _1100 = _1096;
            if (_1040)
            {
                float _1102 = _1060 * _1052;
                float _1104 = precise::clamp(_1102, 0.0, 1.0);
                _1072 = _1104;
            }
            float _1106 = _1072;
            if (_1042)
            {
                float _1108 = _1068 * _1094;
                float _1110 = precise::clamp(_1108, 0.0, 1.0);
                _1084 = _1110;
            }
            float _1112 = _1084;
            float _1114 = _1106 * _1112;
            if (_1044)
            {
                float _1116 = _1080 * _1100;
                float _1118 = precise::clamp(_1116, 0.0, 1.0);
                _1090 = _1118;
            }
            float _1120 = _1090;
            float _1122 = _1114 * _1120;
            _992 = _1122;
        }
    }
    _994 = false;
    float _1124 = _986;
    float _1126 = _988;
    float _1128 = _990;
    float _1130 = _992;
    float _1132 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1134 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1136 = floor(_1132);
    float _1138 = floor(_1134);
    float _1140 = -_1136;
    float _1142 = _1132 + _1140;
    float _1144 = -_1138;
    float _1146 = _1134 + _1144;
    float2 _4586 = float2(_1142, _1146);
    float _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4586, float2(0.0), isnan(_4586)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4586, float2(0.0), isnan(_4586)), level(0.0)).x;
    float _1150 = in.m_91.w;
    float _1152 = trunc(_1150);
    int _1154 = int(_1152);
    int _1156 = _1154 << 5;
    uint _1159 = uint(int(uint(_1156) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1159)];
    float _1161 = as_type<float>(_dmw0.x);
    int _1163 = _1156 + 4;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    float _1167 = as_type<float>(_dmw0.y);
    int _1169 = _1156 + 8;
    uint _1171 = uint(int(uint(_1169) >> uint(2)));
    float _1173 = as_type<float>(_dmw0.z);
    int _1175 = _1156 + 12;
    uint _1177 = uint(int(uint(_1175) >> uint(2)));
    float _1179 = as_type<float>(_dmw0.w);
    float _1181 = _948 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1185 = _1124 + _1183;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1189 = _1126 + _1187;
    float _1191 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1181);
    float _1193 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1191);
    float _1195 = _948 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1197 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1199 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1195);
    float _1201 = 1.0 / _1197;
    float _1203 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1199);
    float _1205 = _1203 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1207 = _1205 + _1197;
    float _1209 = _1207 * _1201;
    float _1211 = _1209 * 0.5;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1215 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1213);
    float _1217 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1219 = 1.0 / _1215;
    float _1221 = _948 + _1217;
    float _1223 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1225 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1227 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1223);
    float _1229 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1225);
    float _1231 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1227);
    float _1233 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1229);
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1237 = _1219 * _1235;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1241 = _1233 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1243 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1245 = trunc(_1239);
    int _1247 = int(_1245);
    bool _1249 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1251 = !_1243;
    int _1253 = _1251 ? 0 : 1;
    float _1255 = trunc(_1241);
    int _1257 = int(_1255);
    int _1259 = 2;
    float _1261 = _1126;
    float _1263 = _1124;
    float _1265 = _1241;
    if (!_1243)
    {
        _1259 = 1;
    }
    int _1267 = _1259;
    int _1269 = _1267;
    if (!_1249)
    {
        _1269 = _1253;
    }
    int _1271 = _1269;
    float _1273 = _1185 * _1185;
    int _1275 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1277 = _1247 + _1275;
    int _1279 = _1277 + 1;
    int _1281 = _1271 << 6;
    float _1283 = fma(_1189, _1189, _1273);
    bool _1285 = _1279 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1287 = _1281 + 48;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c15)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    float _1305 = sqrt(_1283);
    int _1307 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1309 = _1257 + _1307;
    int _1311 = _1309 + 1;
    int _1313 = _1279 | _1311;
    int _1315 = _1281 + 56;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    bool _1333 = _1313 < 0;
    bool _1335 = _1333 || _1285;
    bool _1337 = _1311 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1339 = _1337 || _1335;
    int _1341 = _1281 + 64;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    uint _1345 = uint(int(uint(int(_1343)) >> uint(2)));
    int _1347 = int(_1343) & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    int _1351 = int(_1343) + 1;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    int _1355 = _1351 & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    bool _1359 = _1305 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1361 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan(0.5);
    bool _1369 = _1365 || _1367;
    int _1371 = _1281 + 72;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    uint _1375 = uint(int(uint(int(_1373)) >> uint(2)));
    int _1377 = int(_1373) & 3;
    float _1379 = (*spvDescriptorSet0.vp_c15)._m0[int(_1375)][_1377];
    int _1381 = int(_1373) + 1;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    int _1385 = _1381 & 3;
    float _1387 = (*spvDescriptorSet0.vp_c15)._m0[int(_1383)][_1385];
    int _1389 = _1279;
    float _1391 = as_type<float>(_1271);
    if (!_1339)
    {
        int _1393 = _1311 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1395 = _1393 + _1279;
        _1389 = _1395;
    }
    int _1397 = _1389;
    int _1399 = _1281 + 96;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c15)._m0[int(_1411)][_1413];
    int _1417 = _1281 + 104;
    uint _1419 = uint(int(uint(_1417) >> uint(2)));
    uint _1421 = uint(int(uint(int(_1419)) >> uint(2)));
    int _1423 = int(_1419) & 3;
    float _1425 = (*spvDescriptorSet0.vp_c15)._m0[int(_1421)][_1423];
    int _1427 = int(_1419) + 1;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    int _1431 = _1427 & 3;
    float _1433 = (*spvDescriptorSet0.vp_c15)._m0[int(_1429)][_1431];
    float _1435 = _1179 * 2.0;
    float _1437 = _1161 * 2.0;
    float _1439 = _1167 * 2.0;
    float _1441 = _1173 * _1173;
    float _1443 = _1173 * _1435;
    float _1445 = _1167 * _1435;
    float _1447 = _1161 * _1435;
    float _1449 = _1161 * _1161;
    float _1451 = -_1443;
    float _1453 = fma(_1167, _1437, _1451);
    float _1455 = fma(_1173, _1437, _1445);
    float _1457 = fma(_1167, _1437, _1443);
    float _1459 = -_1445;
    float _1461 = fma(_1173, _1437, _1459);
    float _1463 = _1167 * _1167;
    int _1465 = as_type<int>(_1167);
    float _1467 = _1173;
    int _1469 = as_type<int>(_1439);
    if (!_1339)
    {
        int _1471 = _1397 << 2;
        _1465 = _1471;
    }
    int _1473 = _1465;
    float _1475 = -_1447;
    float _1477 = fma(_1173, _1439, _1475);
    float _1479 = fma(_1173, _1439, _1447);
    int _1481 = _1473;
    if (!_1359)
    {
        _1467 = _1126;
    }
    float _1483 = _1467;
    float _1485 = _1483;
    if (!_1339)
    {
        uint _1487 = uint(int(uint(_1397) >> uint(2)));
        _1469 = int(_1487);
    }
    int _1489 = _1469;
    float _1491 = as_type<float>(_1489);
    if (!_1339)
    {
        int _1493 = 12 & _1473;
        _1481 = _1493;
    }
    int _1495 = _1481;
    if (!_1359)
    {
        _1261 = _1128;
    }
    float _1497 = _1261;
    bool _1499 = !_1359;
    float _1501 = _1497;
    if (!_1499)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1507 = _1305 + _1505;
        float _1509 = rsqrt(_1283);
        float _1511 = _1507 * _1503;
        float _1513 = _1128 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1515 = _1511 * 0.15915493667125701904296875;
        float _1517 = _1515 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = _1515 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        float _1525 = fma(_1519, _1513, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1527 = _1509 * _1525;
        float _1529 = _1523 + (-1.0);
        float _1531 = fma(_1189, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1533 = fma(_1185, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1535 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = fma(_1523, _1128, _1535);
        _1485 = _1531;
        _1501 = _1537;
        _1263 = _1533;
    }
    float _1539 = _1485;
    float _1541 = _1501;
    float _1543 = _1263;
    if (!_1339)
    {
        int _1545 = _1489 << 4;
        int _1547 = _1545 + _1495;
        _1491 = as_type<float>(_1547);
    }
    float _1549 = _1491;
    float _1551 = fma(_1463, -2.0, 1.0);
    float _1553 = -_946;
    float _1555 = _1553 + _1539;
    float _1557 = fma(_1449, -2.0, 1.0);
    int _1559 = _1281 + 88;
    uint _1561 = uint(int(uint(_1559) >> uint(2)));
    uint _1563 = uint(int(uint(int(_1561)) >> uint(2)));
    int _1565 = int(_1561) & 3;
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[int(_1563)][_1565];
    int _1569 = int(_1561) + 1;
    uint _1571 = uint(int(uint(_1569) >> uint(2)));
    int _1573 = _1569 & 3;
    float _1575 = (*spvDescriptorSet0.vp_c15)._m0[int(_1571)][_1573];
    float _1577 = fma(_1441, -2.0, _1551);
    float _1579 = -_948;
    float _1581 = _1579 + _1541;
    float _1583 = fma(_1441, -2.0, _1557);
    float _1585 = fma(_1463, -2.0, _1557);
    float _1587 = -_950;
    float _1589 = _1587 + _1543;
    float _1591 = _1581 * _322;
    float _1593 = _1581 * _334;
    int _1595 = _1281 + 80;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    uint _1599 = uint(int(uint(int(_1597)) >> uint(2)));
    int _1601 = int(_1597) & 3;
    float _1603 = (*spvDescriptorSet0.vp_c15)._m0[int(_1599)][_1601];
    int _1605 = int(_1597) + 1;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    int _1609 = _1605 & 3;
    float _1611 = (*spvDescriptorSet0.vp_c15)._m0[int(_1607)][_1609];
    float _1613 = _1581 * _288;
    float _1615 = fma(_1555, _310, _1591);
    float _1617 = _1221 * _1415;
    float _1619 = fma(_1555, _330, _1593);
    float _1621 = _1221 * _1357;
    float _1623 = fma(_1589, _326, _1615);
    float _1625 = fma(_946, _1407, _1617);
    float _1627 = _1549;
    float _1629 = _1555;
    if (!_1339)
    {
        int _1631 = as_type<int>(_1549) + 400;
        uint _1633 = uint(int(uint(_1631) >> uint(2)));
        uint _1635 = uint(int(uint(int(_1633)) >> uint(2)));
        int _1637 = int(_1633) & 3;
        float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
        _1627 = _1639;
    }
    float _1641 = _1627;
    float _1643 = fma(_1555, _284, _1613);
    float _1645 = fma(_1589, _338, _1619);
    float _1647 = fma(_950, _1425, _1625);
    float _1649 = fma(_946, _1349, _1621);
    float _1651 = _1623 * _1453;
    float _1653 = _1623 * _1583;
    float _1655 = _1647 + _1433;
    float _1657 = fma(_1589, _292, _1643);
    float _1659 = _1623 * _1479;
    float _1661 = _1221 * _1303;
    float _1663 = _1407;
    if (!_1339)
    {
        float _1665 = floor(_1239);
        _1663 = _1665;
    }
    float _1667 = _1663;
    float _1669 = fma(_1657, _1577, _1651);
    float _1671 = fma(_1657, _1461, _1659);
    float _1673 = fma(_1657, _1457, _1653);
    float _1675 = fma(_946, _1295, _1661);
    float _1677 = fma(_1645, _1455, _1669);
    float _1679 = fma(_1645, _1585, _1671);
    float _1681 = fma(_1645, _1477, _1673);
    float _1683 = _1589;
    if (!_1339)
    {
        float _1685 = floor(_1241);
        _1683 = _1685;
    }
    float _1687 = _1683;
    float _1689 = fma(_950, _1323, _1675);
    float _1691 = _950 + _1679;
    float _1693 = fma(_950, _1379, _1649);
    float _1695 = _946 + _1677;
    float _1697 = _1689 + _1331;
    float _1699 = _948 + _1681;
    float _1701 = _1693 + _1387;
    float _1703 = 1.0 / _1655;
    float _1705 = _1689;
    float _1707 = _1699;
    float _1709 = _1695;
    float _1711 = _1693;
    if (_1369)
    {
        _1705 = _1691;
    }
    float _1713 = _1705;
    float _1715 = _1713;
    if (!_1369)
    {
        float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1719 = _948 + _1717;
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1723 = _946 + _1721;
        float _1725 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1727 = _1719 * _1719;
        float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1731 = _950 + _1729;
        float _1733 = fma(_1723, _1723, _1727);
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1737 = fma(_1731, _1731, _1733);
        float _1739 = sqrt(_1737);
        float _1741 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1743 = precise::min(_1739, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1745 = _1743 * _1735;
        float _1747 = _1741 * _1745;
        float _1749 = fma(_1681, _1747, _948);
        float _1751 = fma(_1677, _1747, _946);
        float _1753 = fma(_1679, _1747, _950);
        _1707 = _1749;
        _1709 = _1751;
        _1715 = _1753;
    }
    float _1755 = _1707;
    float _1757 = _1709;
    float _1759 = _1715;
    float _1761 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1765 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1767 = _1697 * _1703;
    float _1769 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1761);
    float _1771 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1763);
    float _1773 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1765);
    float _1775 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1777 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1769);
    float _1779 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1771);
    bool _1781 = _1767 >= 0.0;
    float _1783 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1773);
    float _1785 = _1777 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1787 = _1701 * _1703;
    if (!_1339)
    {
        float _1789 = rint(_1641);
        float _1791 = precise::max(_1789, 0.0);
        uint _1793 = uint(_1791);
        uint _1795 = clamp(_1793, 0u, 65535u);
        _1711 = as_type<float>(_1795);
    }
    float _1797 = _1711;
    float _1799 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1801 = _1767 <= 1.0;
    bool _1803 = _1801 && _1781;
    float _1805 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1775);
    float _1807 = _1783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1811 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1813 = _1787 >= 0.0;
    bool _1815 = _1813 && _1803;
    float _1817 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1805);
    float _1819 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1821 = -_1811;
    float _1823 = fma(_1821, _1809, 1.0);
    bool _1825 = _1787 <= 1.0;
    bool _1827 = _1825 && _1815;
    float _1829 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1831 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1819);
    float _1833 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1835 = _1833;
    float _1837 = _1799;
    if (!_1339)
    {
        float _1839 = -_1687;
        float _1841 = _1241 + _1839;
        _976 = _1841;
    }
    float _1843 = _976;
    float _1845 = log2(_1823);
    float _1847 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1831);
    float _1849 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1833);
    if (!_1339)
    {
        float _1851 = -_1667;
        float _1853 = _1239 + _1851;
        _1835 = _1853;
    }
    float _1855 = _1835;
    float _1857 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1847);
    float _1859 = _1221 * _1611;
    float _1861 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1827)
    {
        float _1863 = float(_1271);
        _1391 = _1863;
    }
    float _1865 = _1391;
    float _1867 = 1.0 / _1857;
    float _1869 = fma(_946, _1603, _1859);
    float _1871 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1861);
    float _1873 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1849);
    float _1875 = fma(_950, _1567, _1869);
    float _1877 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1871);
    float _1879 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1873);
    float _1881 = _1869;
    if (_1827)
    {
        float _1883 = rint(_1865);
        float _1885 = precise::max(_1883, 0.0);
        uint _1887 = uint(_1885);
        uint _1889 = clamp(_1887, 0u, 65535u);
        _1881 = as_type<float>(_1889);
    }
    float _1891 = _1881;
    float _1893 = _1875 + _1575;
    float _1895 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1877);
    float _1897 = _1845 * 0.693147182464599609375;
    float _1899 = _1893 * _1703;
    float _1901 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1903 = _1895 * _1867;
    float _1905 = _1879 * _1867;
    float _1907 = fma(_1903, 0.5, 0.5);
    float _1909 = fma(_1905, -0.5, 0.5);
    float _1911 = _1865;
    if (!_1339)
    {
        float3 _5865 = float3(_1855, _1843, float(as_type<int>(_1797)));
        float3 _5869 = select(_5865, float3(0.0), isnan(_5865));
        float _1913 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5869.xy, uint(rint(_5869.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5869.xy, uint(rint(_5869.z)), level(0.0)).x;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = _1687;
    if (_1827)
    {
        float3 _5884 = float3(_1767, _1787, float(as_type<int>(_1891)));
        float3 _5886 = select(_5884, float3(0.0), isnan(_5884));
        float _1919 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5886.xy, uint(rint(_5886.z)), _1899, level(0.0));
        _1917 = _1919;
    }
    float _1921 = _1917;
    float3 _5896 = float3(_1907, _1909, _1901);
    float _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5896, float3(0.0), isnan(_5896)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5896, float3(0.0), isnan(_5896)), level(0.0)).x;
    float3 _5905 = float3(_1907, _1909, _1901);
    float4 _1926 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5905, float3(0.0), isnan(_5905)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5905, float3(0.0), isnan(_5905)), level(0.0)).xyzw;
    float _1928 = _1926.x;
    float _1930 = _1926.y;
    float _1932 = _1926.z;
    float _1934 = _1926.w;
    float _1936 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1339)
    {
        _1265 = 1.0;
    }
    float _1938 = _1265;
    bool _1940 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.5);
    bool _1948 = _1944 || _1946;
    float _1950 = _1938;
    if (_1948)
    {
        _1936 = 1.0;
    }
    float _1952 = _1936;
    float _1954 = _1952;
    if (!_1948)
    {
        float _1956 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1958 = _1956 * 0.15915493667125701904296875;
        float _1960 = _1958 * 6.283185482025146484375;
        float _1962 = cos(_1960);
        float _1964 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1966 = _1964 * 0.15915493667125701904296875;
        float _1968 = _1958 * 6.283185482025146484375;
        float _1970 = sin(_1968);
        float _1972 = 1.0 / _1962;
        float _1974 = _1966 * 6.283185482025146484375;
        float _1976 = cos(_1974);
        float _1978 = _1970 * _1972;
        float _1980 = _1966 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        float _1984 = _1976 * _1978;
        float _1986 = 1.0 / _1984;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1990 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1988;
        float _1992 = 1.0 / _1990;
        float _1994 = _1982 * _1986;
        float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1998 = fma(_1237, _1994, _1996);
        float _2000 = _1998 * _1992;
        float _2002 = precise::clamp(_2000, 0.0, 1.0);
        _1954 = _2002;
    }
    float _2004 = _1954;
    if (!_1339)
    {
        int _2006 = _1397 << 4;
        int _2008 = _2006 + 2048;
        uint _2010 = uint(int(uint(_2008) >> uint(2)));
        uint _2012 = uint(int(uint(int(_2010)) >> uint(2)));
        int _2014 = int(_2010) & 3;
        float _2016 = (*spvDescriptorSet0.vp_c15)._m0[int(_2012)][_2014];
        int _2018 = int(_2010) + 1;
        uint _2020 = uint(int(uint(_2018) >> uint(2)));
        int _2022 = _2018 & 3;
        float _2024 = (*spvDescriptorSet0.vp_c15)._m0[int(_2020)][_2022];
        int _2026 = _2008 + 8;
        uint _2028 = uint(int(uint(_2026) >> uint(2)));
        uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
        int _2032 = int(_2028) & 3;
        float _2034 = (*spvDescriptorSet0.vp_c15)._m0[int(_2030)][_2032];
        int _2036 = int(_2028) + 1;
        uint _2038 = uint(int(uint(_2036) >> uint(2)));
        int _2040 = _2036 & 3;
        float _2042 = (*spvDescriptorSet0.vp_c15)._m0[int(_2038)][_2040];
        float _2044 = _1221 * _2024;
        float _2046 = fma(_946, _2016, _2044);
        float _2048 = fma(_950, _2034, _2046);
        float _2050 = _2048 + _2042;
        float _2052 = precise::clamp(_2050, 0.0, 1.0);
        float _2054 = -_2052;
        float _2056 = _2054 + _1915;
        float _2058 = fma(_2056, 500.0, 1.5);
        float _2060 = exp2(_2058);
        float _2062 = 0.0 + _2060;
        float _2064 = precise::clamp(_2062, 0.0, 1.0);
        _1950 = _2064;
    }
    float _2066 = _1950;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2070 = _1755 + _2068;
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2074 = _1757 + _2072;
    float _2076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2078 = _1759 + _2076;
    float _2080 = _2070 * _2070;
    float _2082 = fma(_2074, _2074, _2080);
    float _2084 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2086 = fma(_2078, _2078, _2082);
    float _2088 = rsqrt(_2086);
    float _2090 = sqrt(_2086);
    float _2092 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2094 = _2074 * _2092;
    float _2096 = _2078 * _2092;
    float _2098 = _2094 * _2094;
    float _2100 = _2096 * _2096;
    float _2102 = _2098 + _2100;
    float _2104 = sqrt(_2102);
    bool _2106 = _2104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2110 = _2104 + _2108;
    float _2112 = _1843;
    float _2114 = _2102;
    float _2116 = _2110;
    float _2118 = _2070;
    float _2120 = _2092;
    float _2122 = _2094;
    float _2124 = _2096;
    float _2126 = _2098;
    float _2128 = _2100;
    if (_2106)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2112 = _2130;
    }
    float _2132 = _2112;
    if (_2106)
    {
        float _2134 = rsqrt(_2102);
        _2114 = _2134;
    }
    float _2136 = _2114;
    if (_2106)
    {
        float _2138 = _2110 * _2132;
        _2116 = _2138;
    }
    float _2140 = _2116;
    float _2142 = precise::max(0.0, _2084);
    float _2144 = _2142;
    if (_2106)
    {
        float _2146 = _2140 * 0.15915493667125701904296875;
        _1629 = _2146;
    }
    float _2148 = _1629;
    float _2150 = -_2092;
    float _2152 = -_2142;
    float _2154 = fma(_2070, _2150, _2152);
    float _2156 = _1901;
    if (_2106)
    {
        float _2158 = _2148 * 6.283185482025146484375;
        float _2160 = sin(_2158);
        _2156 = _2160;
    }
    float _2162 = _2156;
    if (_2106)
    {
        float _2164 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2118 = _2164;
    }
    float _2166 = _2118;
    float _2168 = _2140;
    float _2170 = _2166;
    if (_2106)
    {
        float _2172 = _2148 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        _2168 = _2174;
    }
    float _2176 = _2168;
    if (_2106)
    {
        float _2178 = fma(_2162, _2166, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2170 = _2178;
    }
    float _2180 = _2170;
    float _2182 = _2180;
    if (_2106)
    {
        float _2184 = _2136 * _2180;
        _2144 = _2184;
    }
    float _2186 = _2144;
    if (!_2106)
    {
        _2182 = _2154;
    }
    float _2188 = _2182;
    float _2190 = _2188;
    if (_2106)
    {
        float _2192 = _2176 + (-1.0);
        _2120 = _2192;
    }
    float _2194 = _2120;
    float _2196 = _2194;
    if (_2106)
    {
        float _2198 = _2094 * _2186;
        _2122 = _2198;
    }
    float _2200 = _2122;
    if (_2106)
    {
        float _2202 = _2096 * _2186;
        _2124 = _2202;
    }
    float _2204 = _2124;
    if (_2106)
    {
        float _2206 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2196 = _2206;
    }
    float _2208 = _2196;
    if (_2106)
    {
        float _2210 = _2200 * _2200;
        _2126 = _2210;
    }
    float _2212 = _2126;
    if (_2106)
    {
        float _2214 = _2204 * _2204;
        _2128 = _2214;
    }
    float _2216 = _2128;
    if (_2106)
    {
        float _2218 = fma(_2154, _2176, _2208);
        _2190 = _2218;
    }
    float _2220 = _2190;
    float _2222 = fma(_2220, _2220, _2212);
    float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2226 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2224);
    float _2228 = precise::clamp(_2226, 0.0, 1.0);
    float _2230 = _2222 + _2216;
    float _2232 = -_2228;
    float _2234 = _2232 + 1.0;
    float _2236 = rsqrt(_2230);
    float _2238 = abs(_2234);
    float _2240 = log2(_2238);
    float _2242 = _2236 * _2200;
    float _2244 = _2236 * _2220;
    float _2246 = _2236 * _2204;
    float _2248 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2250 = -_2248;
    float _2252 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2250);
    float _2254 = -_2246;
    float _2256 = fma(_2254, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2252);
    float _2258 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2260 = fma(_2256, -0.5, 0.5);
    float _2262 = exp2(_2258);
    float _2264 = fma(_2256, 0.5, 0.5);
    float _2266 = fma(_2264, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2268 = sqrt(_2260);
    float _2270 = fma(_2264, _2266, -0.212114393711090087890625);
    float _2272 = _2244 + 1.0;
    float _2274 = fma(_2264, _2270, 1.570728778839111328125);
    float _2276 = -_2244;
    float _2278 = fma(_2262, _2272, _2276);
    float _2280 = _2268 * 0.636619746685028076171875;
    float _2282 = -_2274;
    float _2284 = fma(_2280, _2282, 1.0);
    float _2286 = fma(_2278, 0.5, 0.5);
    float2 _6445 = float2(_2284, _2286);
    float3 _2290 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6445, float2(0.0), isnan(_6445)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6445, float2(0.0), isnan(_6445)), level(0.0)).xyz;
    float _2292 = _2290.x;
    float _2294 = _2290.y;
    float _2296 = _2290.z;
    float _2298 = _1453 * _288;
    float _2300 = _1479 * _288;
    float _2302 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2312 = _2308 || _2310;
    float _2314 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2316 = fma(_1577, _284, _2298);
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2320 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2318);
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2324 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2322);
    float _2326 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2314);
    float _2328 = fma(_1461, _284, _2300);
    float _2330 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2320);
    float _2332 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2324);
    float _2334 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2336 = -_1148;
    float _2338 = _2336 + 1.0;
    float _2340 = _946 + _2330;
    float _2342 = _950 + _2332;
    float _2344 = _1583 * _288;
    float _2346 = _2234;
    if (_2312)
    {
        float _2348 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2346 = _2348;
    }
    float _2350 = _2346;
    float _2352 = abs(_1237);
    float _2354 = log2(_2352);
    float _2356 = -_2340;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2360 = -_2342;
    float _2362 = _2360 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2364 = fma(_1457, _284, _2344);
    float _2366 = _2350;
    float _2368 = _2362;
    if (_2312)
    {
        float _2370 = precise::min(_2350, 20.0);
        _2366 = _2370;
    }
    float _2372 = _2366;
    out.m_93.x = _1757;
    out.m_93.y = _1755;
    out.m_93.z = _1759;
    float _2374 = precise::min(_2340, _2358);
    float _2376 = fma(_1585, _292, _2328);
    float _2378 = _946;
    if (_2312)
    {
        float _2380 = 1.0 / _2372;
        _2378 = _2380;
    }
    float _2382 = _2378;
    float _2384 = precise::min(_2342, _2362);
    if (!_2312)
    {
        _2368 = 1.0;
    }
    float _2386 = _2368;
    float _2388 = precise::min(_2374, _2384);
    float _2390 = _834 * _1583;
    float _2392 = _846 * _1583;
    float _2394 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2396 = _834 * _1453;
    float _2398 = _846 * _1453;
    float _2400 = fma(_822, _1457, _2392);
    float _2402 = exp2(_2334);
    float _2404 = fma(_958, _1577, _2396);
    float _2406 = fma(_822, _1577, _2398);
    float _2408 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2326);
    float _2410 = _2386;
    if (_2312)
    {
        float _2412 = _2388 * _2382;
        float _2414 = precise::clamp(_2412, 0.0, 1.0);
        _2410 = _2414;
    }
    float _2416 = _2410;
    float _2418 = _846 * _1479;
    float _2420 = fma(_1455, _292, _2316);
    float _2422 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2408);
    float _2424 = exp2(_2394);
    float _2426 = _1130 * _2416;
    float _2428 = fma(_822, _1461, _2418);
    float _2430 = fma(_958, _1457, _2390);
    float _2432 = fma(_1477, _292, _2364);
    float _2434 = fma(_854, _1455, _2406);
    float _2436 = fma(_854, _1477, _2400);
    float _2438 = fma(_854, _1585, _2428);
    bool _2440 = _1237 <= 8000.0;
    bool _2442 = isnan(_1237);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan(8000.0);
    bool _2448 = _2444 || _2446;
    float _2450 = float(_2448);
    float _2452 = _2422 + _1857;
    float _2454 = _834 * _1479;
    out.m_95.x = _2434;
    out.m_95.y = _2436;
    out.m_95.z = _2438;
    float _2456 = _2452 * 0.5;
    float _2458 = fma(_960, _1455, _2404);
    float _2460 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2462 = precise::clamp(_2460, 0.0, 1.0);
    float _2464 = fma(_958, _1461, _2454);
    float _2466 = fma(_960, _1477, _2430);
    out.m_97.z = _2456;
    out.m_97.w = _1857;
    float _2468 = fma(_2462, -2.0, 3.0);
    float _2470 = _2462 * _2462;
    float _2472 = fma(_960, _1585, _2464);
    out.m_99.x = _2420;
    out.m_99.y = _2432;
    out.m_99.z = _2376;
    bool _2474 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2476 = isnan(_2090);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2482 = _2478 || _2480;
    float _2484 = _2470 * _2468;
    float _2486 = -_2402;
    float _2488 = _2486 + 1.0;
    float _2490 = _2434;
    float _2492 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (!_1827)
    {
        _2490 = 1.0;
    }
    float _2494 = _2490;
    out.gl_Position.x = _1895;
    out.gl_Position.y = _1879;
    out.gl_Position.z = _2422;
    out.gl_Position.w = _1857;
    float _2496 = -_2484;
    float _2498 = _2496 + 1.0;
    float _2500 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2502 = _2494;
    if (_1827)
    {
        bool _2504 = _1921 >= _1899;
        bool _2506 = isnan(_1921);
        bool _2508 = _2504 || _2506;
        bool _2510 = isnan(_1899);
        bool _2512 = _2508 || _2510;
        float _2514 = float(_2512);
        _2502 = _2514;
    }
    float _2516 = _2502;
    out.m_101.x = _2458;
    out.m_101.y = _2466;
    out.m_101.z = _2472;
    float _2518 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2484);
    float _2520 = _2500 * _1923;
    float _2522 = -_2500;
    float _2524 = _2522 + 1.0;
    float _2526 = _2516 * _2066;
    float _2528 = _2450 * _2518;
    float _2530 = _1934 * _2520;
    float _2532 = _2426 * _2004;
    float _2534 = _2524;
    float _2536 = _2520;
    if (!_2482)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2538 = _1837;
    float _2540 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2542 = _2540;
    float _2544 = _2538;
    float _2546 = _2538;
    if (!_2482)
    {
        _2492 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2548 = _2492;
    float _2550 = _2532 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2552 = _2338 * _2540;
    float _2554 = precise::clamp(_2552, 0.0, 1.0);
    float _2556 = _2548;
    float _2558 = _2548;
    if (!_2482)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2560 = _2542;
    float _2562 = -_2554;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2566 = -_2526;
    float _2568 = fma(_2566, _2564, 1.0);
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = _1934 * _2524;
    float _2574 = _2560;
    float _2576 = _2560;
    if (!_2482)
    {
        _2534 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2578 = _2534;
    float _2580 = _2570 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_103.x = _2580;
    float _2582 = _2580;
    float _2584 = _2578;
    float _2586 = _2578;
    if (!_2482)
    {
        _2582 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2588 = _2582;
    float _2590 = _2296 * _2520;
    float _2592 = fma(_2292, _2530, _1928);
    float _2594 = fma(_2294, _2530, _1930);
    float _2596 = _2588;
    float _2598 = _2588;
    if (!_2482)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2600 = _2536;
    float _2602 = fma(_1934, _2590, _1932);
    out.m_105.x = _2592;
    out.m_105.y = _2594;
    out.m_105.z = _2602;
    out.m_105.w = _2572;
    bool _2604 = !_2482;
    float _2606 = _2600;
    float _2608 = _2600;
    if (!_2604)
    {
        bool _2610 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2612 = isnan(_2090);
        bool _2614 = _2610 || _2612;
        bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2618 = _2614 || _2616;
        if (!_2618)
        {
            float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2622 = _2090 + _2620;
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2626 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2624;
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2632 = 1.0 / _2626;
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2650 = _2622 * _2632;
            float _2652 = precise::clamp(_2650, 0.0, 1.0);
            float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2658 = fma(_2652, _2630, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2660 = fma(_2652, _2656, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2662 = fma(_2652, _2636, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2664 = fma(_2652, _2640, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2666 = fma(_2652, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2668 = fma(_2652, _2648, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2608 = _2662;
            _2576 = _2666;
            _2546 = _2658;
            _2586 = _2664;
            _2558 = _2660;
            _2598 = _2668;
            _2670 = true;
        }
        else
        {
            bool _2672 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2674 = isnan(_2090);
            bool _2676 = _2672 || _2674;
            bool _2678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2680 = _2676 || _2678;
            if (!_2680)
            {
                _2544 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2682 = _2544;
            _2546 = _2682;
            if (!_2680)
            {
                _2606 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2684 = _2606;
            _2608 = _2684;
            if (!_2680)
            {
                _2556 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2686 = _2556;
            _2558 = _2686;
            if (!_2680)
            {
                _2584 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2688 = _2584;
            _2586 = _2688;
            if (!_2680)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2690 = _2574;
            _2576 = _2690;
            if (!_2680)
            {
                _2596 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2692 = _2596;
            bool _2694 = !_2680;
            _2598 = _2692;
            if (!_2694)
            {
                bool _2696 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2698 = isnan(_2090);
                bool _2700 = _2696 || _2698;
                bool _2702 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2704 = _2700 || _2702;
                if (!_2704)
                {
                    float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2708 = _2090 + _2706;
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2712 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2710;
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2718 = 1.0 / _2712;
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2736 = _2708 * _2718;
                    float _2738 = precise::clamp(_2736, 0.0, 1.0);
                    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2744 = fma(_2738, _2716, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2746 = fma(_2738, _2742, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2748 = fma(_2738, _2722, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2750 = fma(_2738, _2726, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2752 = fma(_2738, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2754 = fma(_2738, _2734, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2608 = _2748;
                    _2576 = _2752;
                    _2546 = _2744;
                    _2586 = _2750;
                    _2558 = _2746;
                    _2598 = _2754;
                    _2670 = true;
                }
                else
                {
                    _2608 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2546 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2586 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2558 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2598 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2670 = false;
    float _2756 = _2608;
    float _2758 = _2576;
    float _2760 = _2546;
    float _2762 = _2586;
    float _2764 = _2558;
    float _2766 = _2598;
    float _2768 = fma(_2466, -0.5, 0.5);
    float _2770 = precise::clamp(_2768, 0.0, 1.0);
    float _2772 = -_2756;
    float _2774 = _2772 + _2758;
    float _2776 = _2550 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2778 = -_2760;
    float _2780 = _2778 + _2762;
    float _2782 = fma(_2770, _2774, _2756);
    out.m_107.x = 0.0;
    float _2784 = -_2764;
    float _2786 = _2784 + _2766;
    float _2788 = fma(_2770, _2780, _2760);
    float _2790 = _2782 * 0.586610972881317138671875;
    out.m_68.x = _2776;
    bool _2792 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2794 = fma(_2770, _2786, _2764);
    float _2796 = fma(_2788, 0.298911988735198974609375, _2790);
    bool _2798 = _2004 > 0.0;
    bool _2800 = isnan(_2004);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan(0.0);
    bool _2806 = _2802 || _2804;
    float _2808 = fma(_2794, 0.114477999508380889892578125, _2796);
    float _2810 = -_2808;
    float _2812 = _2788 + _2810;
    float _2814 = -_2808;
    float _2816 = _2782 + _2814;
    float _2818 = -_2808;
    float _2820 = _2794 + _2818;
    float _2822 = fma(_2812, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2808);
    float _2824 = fma(_2816, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2808);
    float _2826 = fma(_2820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2808);
    bool _2828 = !_2792;
    if (!_2828)
    {
        float _2830 = -_1755;
        float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2834 = -_1757;
        float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2838 = -_1759;
        float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2842 = _2832 * _2832;
        float _2844 = fma(_2836, _2836, _2842);
        float _2846 = fma(_2840, _2840, _2844);
        float _2848 = sqrt(_2846);
        float _2850 = rsqrt(_2846);
        float _2852 = -_2848;
        float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2856 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2858 = precise::clamp(_2856, 0.0, 1.0);
        float _2860 = _2836 * _2850;
        float _2862 = _2832 * _2850;
        float _2864 = abs(_2858);
        float _2866 = log2(_2864);
        float _2868 = _2840 * _2850;
        float _2870 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2872 = _2466 * _2862;
        float _2874 = -_2862;
        float _2876 = -_2870;
        float _2878 = fma(_2874, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2876);
        float _2880 = fma(_2458, _2860, _2872);
        float _2882 = -_2868;
        float _2884 = fma(_2882, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2878);
        float _2886 = fma(_2472, _2868, _2880);
        float _2888 = precise::clamp(_2886, 0.0, 1.0);
        float _2890 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2892 = _2884 + _2890;
        float _2894 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2896 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2898 = precise::clamp(_2896, 0.0, 1.0);
        float _2900 = exp2(_2894);
        float _2902 = _2900 * _2898;
        float _2904 = _2888 * _2902;
        float _2906 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2908 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2910 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2906;
        out.m_107.y = _2908;
        out.m_107.z = _2910;
    }
    out.m_109.x = _2822;
    out.m_109.y = _2824;
    out.m_109.z = _2826;
    if (_2806)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_68.x = 0.0;
    float _2912 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2912;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2670 = false;
    bool _994 = false;
    bool _982 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_65.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_68.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2969 = as_type<float>(_144);
        out.gl_Position.z = _2969;
    }
    if (!_132)
    {
        return out;
    }
    float _148 = in.m_70.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_158)
    {
        float _164 = float(_128);
        _138 = _164;
    }
    float _166 = _138;
    bool _168 = _162 >= _166;
    bool _170 = !_158;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_68.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _146 = as_type<int>(_178);
    }
    int _180 = _146;
    float _182 = as_type<float>(_180);
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_180);
        out.gl_Position.z = _3040;
    }
    if (_172)
    {
        return out;
    }
    float _184 = in.m_72.x;
    float _186 = in.m_72.y;
    float _188 = in.m_72.z;
    float _190 = in.m_74.x;
    float _192 = in.m_74.y;
    float _194 = in.m_74.z;
    float _196 = in.m_76.x;
    float _198 = in.m_76.y;
    float _200 = in.m_76.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = fma(_190, _190, _202);
    float _208 = fma(_192, _192, _204);
    float _210 = fma(_196, _196, _206);
    float _212 = _188 * _188;
    float _214 = fma(_198, _198, _208);
    float _216 = sqrt(_210);
    float _218 = fma(_194, _194, _212);
    float _220 = fma(_200, _200, _218);
    float _222 = sqrt(_214);
    float _224 = sqrt(_220);
    bool _226 = _216 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = 0.0;
    float _232 = _216;
    float _234 = _222;
    float _236 = _210;
    float _238 = _220;
    float _240 = _214;
    if (_226)
    {
        float _242 = rsqrt(_210);
        _230 = _242;
    }
    float _244 = _230;
    if (!_226)
    {
        _232 = 0.0;
    }
    float _246 = _232;
    bool _248 = _224 > 0.0;
    float _250 = _224;
    float _252 = _246;
    if (!_226)
    {
        _250 = 0.0;
        _234 = 0.0;
    }
    float _254 = _250;
    float _256 = _234;
    float _258 = 0.0;
    float _260 = _254;
    float _262 = _256;
    if (!_228)
    {
        _258 = 0.0;
    }
    float _264 = _258;
    float _266 = 0.0;
    float _268 = _264;
    if (_228)
    {
        float _270 = rsqrt(_214);
        _266 = _270;
    }
    float _272 = _266;
    float _274 = 0.0;
    if (_248)
    {
        float _276 = rsqrt(_220);
        _274 = _276;
    }
    float _278 = _274;
    float _280 = _244;
    if (_226)
    {
        float _282 = _244 * _190;
        _252 = _282;
    }
    float _284 = _252;
    if (_226)
    {
        float _286 = _244 * _184;
        _260 = _286;
    }
    float _288 = _260;
    if (_226)
    {
        float _290 = _244 * _196;
        _262 = _290;
    }
    float _292 = _262;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_228)
    {
        _280 = 0.0;
        _182 = 0.0;
    }
    float _296 = _280;
    float _298 = _182;
    float _300 = _296;
    float _302 = _298;
    if (!_248)
    {
        _236 = 0.0;
    }
    float _304 = _236;
    float _306 = _304;
    if (_228)
    {
        float _308 = _272 * _192;
        _268 = _308;
    }
    float _310 = _268;
    if (!_248)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _312 = _238;
    float _314 = _240;
    float _316 = _312;
    float _318 = _314;
    if (_228)
    {
        float _320 = _272 * _186;
        _300 = _320;
    }
    float _322 = _300;
    if (_228)
    {
        float _324 = _272 * _198;
        _302 = _324;
    }
    float _326 = _302;
    if (_248)
    {
        float _328 = _278 * _194;
        _316 = _328;
    }
    float _330 = _316;
    if (_248)
    {
        float _332 = _278 * _188;
        _318 = _332;
    }
    float _334 = _318;
    if (_248)
    {
        float _336 = _278 * _200;
        _306 = _336;
    }
    float _338 = _306;
    bool _340 = !_294;
    float _358;
    if (!_340)
    {
        float _342 = in.m_78.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_128);
        float _364 = 1.0 / _362;
        float _366 = _162 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = as_type<float>(int(gl_VertexIndex));
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _374 = _368 + _372;
    float _376 = in.m_65.x;
    float _378 = in.m_65.y;
    float _380 = in.m_65.z;
    float _382 = in.m_78.x;
    float _384 = in.m_78.y;
    float _386 = in.m_78.z;
    float _388 = in.m_78.w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _396 = in.m_74.w;
    float _398 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _400 = _392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _402 = _394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = in.m_72.w;
    float _406 = in.m_76.w;
    int _408 = as_type<int>(_370) & 1;
    bool _410 = _408 != 0;
    int _412 = as_type<int>(_370) & 2;
    bool _414 = _412 != 0;
    out.m_83.x = _398;
    out.m_83.y = _400;
    out.m_83.z = _402;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    float _420 = _192 * _378;
    float _422 = _186 * _378;
    float _424 = _198 * _378;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = fma(_190, _376, _420);
    float _432 = fma(_184, _376, _422);
    float _434 = fma(_196, _376, _424);
    float _436 = _384 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _438 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _444 = _388 > 0.5;
    float _446 = fma(_436, -2.0, _440);
    float _448 = -_442;
    float _450 = fma(_438, 2.0, _448);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _462 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].z, _452);
    float _464 = 1.0 / _456;
    float _466 = fma(_194, _380, _430);
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _470 = _468 != 0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _478 = _476 != 0;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _482 = 1.0 / _460;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _486 = fma(_188, _380, _432);
    bool _488 = !_410;
    float _490 = _488 ? (-0.5) : 0.5;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _368 + _492;
    float _496 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[78].w, _484);
    float _498 = -_162;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[76].x, _450);
    float _502 = 1.0 / _474;
    bool _504 = _386 > 0.5;
    float _506 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[79].z, _480);
    bool _508 = !_414;
    float _510 = _508 ? (-0.5) : 0.5;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _520 = _382 > 0.5;
    float _522 = fma(_200, _380, _434);
    float _524 = -_510;
    int _526 = _444 ? as_type<int>(_524) : as_type<int>(_510);
    float _528 = _514 * _464;
    float _530 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[79].x, _506);
    bool _532 = _384 > 0.5;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _368 + _534;
    bool _538 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = isnan(_368);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _550;
    float _554 = _518 * _502;
    float _556 = fma(_528, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _558 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = isnan(_368);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _552 * _482;
    float _572 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _446);
    float _574 = in.m_85.x;
    float _576 = in.m_85.y;
    float _578 = fma(_554, _494, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = -_568;
    float _582 = _580 + 1.0;
    float _584 = fma(_570, _374, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _586 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = isnan(_368);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _462);
    float _600 = _548 * _582;
    float _602 = -_548;
    float _604 = _602 + 1.0;
    float _606 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _496);
    bool _608 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_368);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = _466 + _396;
    float _622 = _596 * _604;
    float _624 = -_596;
    float _626 = _624 + 1.0;
    float _628 = _486 + _404;
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _490);
    float _632 = _522 + _406;
    float _634 = _618 * _626;
    float _636 = -_490;
    int _638 = _504 ? as_type<int>(_636) : as_type<int>(_490);
    float _640 = _510 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _510);
    float _644 = _556 * _634;
    float _646 = -_510;
    int _648 = _532 ? as_type<int>(_646) : as_type<int>(_510);
    float _650 = _530 * (-0.15915493667125701904296875);
    bool _652 = !_478;
    float _654 = _652 ? _510 : as_type<float>(_526);
    float _656 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _658 = !_428;
    float _660 = _658 ? _510 : as_type<float>(_648);
    float _662 = _490 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _664 = !_470;
    float _666 = _664 ? _490 : as_type<float>(_638);
    float _668 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _670 = _640 * _322;
    float _672 = _640 * _310;
    float _674 = _640 * _326;
    float _676 = _668 * _630;
    float _678 = -_490;
    int _680 = _520 ? as_type<int>(_678) : as_type<int>(_490);
    float _682 = _576 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _684 = fma(_662, _288, _670);
    float _686 = fma(_662, _284, _672);
    bool _688 = !_418;
    float _690 = _688 ? _490 : as_type<float>(_680);
    float _692 = fma(_662, _292, _674);
    float _694 = _650 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _628 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _700 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _702 = -_618;
    float _704 = _702 + 1.0;
    float _706 = _620 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _708 = _698 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _710 = _700 * _642;
    float _712 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[115].x, _644);
    float _714 = _650 * 6.283185482025146484375;
    float _716 = cos(_714);
    float _718 = _632 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c12)._m0[6].x, _708);
    float _722 = _710 * _322;
    float _724 = _710 * _310;
    float _726 = _710 * _326;
    float _728 = fma(_718, (*spvDescriptorSet0.vp_c12)._m0[8].x, _720);
    float _730 = fma(_640, _640, 1.0);
    float _732 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _734 = fma(_676, _288, _722);
    float _736 = _698 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _738 = fma(_676, _284, _724);
    float _740 = fma(_676, _292, _726);
    float _742 = _660 * _696;
    float _744 = fma(_578, _622, _712);
    float _746 = _728 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _750 = _660 * _716;
    float _752 = fma(_706, (*spvDescriptorSet0.vp_c12)._m0[6].y, _736);
    float _754 = -_742;
    float _756 = fma(_690, _716, _754);
    float _758 = _698 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _760 = fma(_690, _696, _750);
    float _762 = fma(_584, _600, _744);
    float _764 = _666 + 0.5;
    float _766 = rsqrt(_730);
    float _768 = _746 * _732;
    float _770 = fma(_718, (*spvDescriptorSet0.vp_c12)._m0[8].y, _752);
    float _772 = fma(_706, (*spvDescriptorSet0.vp_c12)._m0[6].z, _758);
    float _774 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _776 = fma(_768, 0.5, 0.5);
    float _778 = _770 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _780 = fma(_718, (*spvDescriptorSet0.vp_c12)._m0[8].z, _772);
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _784 = fma(_774, _330, _738);
    float _786 = _778 * _748;
    float _788 = fma(_774, _334, _734);
    float _790 = _780 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _792 = _764 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _794 = fma(_786, 0.5, 0.5);
    float _796 = -_654;
    float _798 = _796 + 0.5;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _802 = _640 * _766;
    float _804 = _756 + 0.5;
    float _806 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[118].x, _762);
    float _808 = -_330;
    float _810 = _802 * _808;
    float _812 = -_598;
    float _814 = _812 + 1.0;
    float _816 = fma(_774, _338, _740);
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _820 = _790 * _782;
    float _822 = fma(_766, _310, _810);
    float _824 = _760 + (-0.5);
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _828 = fma(_820, 0.5, 0.5);
    float _830 = -_334;
    float _832 = _802 * _830;
    float _834 = _684 + _334;
    float _836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _838 = _800 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _840 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = -_338;
    float _844 = _802 * _842;
    float _846 = fma(_766, _322, _832);
    float _848 = -_838;
    float _850 = -_572;
    float _852 = fma(_848, _824, _850);
    float _854 = fma(_766, _326, _844);
    float _856 = floor(_794);
    float _858 = _818 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _860 = fma(_858, _804, _500);
    float _862 = floor(_776);
    float _864 = _792 * _836;
    float _866 = _798 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _868 = -_606;
    float _870 = _868 + 1.0;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _876 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _878 = floor(_828);
    float _880 = -_856;
    float _882 = _794 + _880;
    float _884 = fma(_760, _870, _852);
    float _886 = -_814;
    float _888 = fma(_756, _886, _860);
    float _890 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = fma(_882, 2.0, -1.0);
    float _896 = -_862;
    float _898 = _776 + _896;
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _902 = _894 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_87.x = _890;
    out.m_87.y = _892;
    out.m_87.z = _840;
    out.m_87.w = _876;
    float _904 = fma(_898, 2.0, -1.0);
    float _906 = _902 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _908 = _902 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _910 = -_878;
    float _912 = _828 + _910;
    float _914 = _904 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _916 = _902 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _918 = fma(_912, 2.0, -1.0);
    float _920 = _918 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c12)._m0[2].x, _906);
    float _924 = fma(_914, (*spvDescriptorSet0.vp_c12)._m0[2].y, _908);
    float _926 = fma(_914, (*spvDescriptorSet0.vp_c12)._m0[2].z, _916);
    bool _928 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _930 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _932 = _928 || _930;
    bool _934 = isnan(1.0);
    bool _936 = _932 || _934;
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c12)._m0[4].x, _922);
    float _940 = fma(_920, (*spvDescriptorSet0.vp_c12)._m0[4].y, _924);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c12)._m0[4].z, _926);
    float _944 = _866 * _900;
    float _946 = _938 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _948 = _940 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _950 = _942 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    out.m_89.x = _888;
    out.m_89.y = _884;
    out.m_89.z = _864;
    out.m_89.w = _944;
    float _952 = _784 + _946;
    float _954 = _788 + _948;
    float _956 = _816 + _950;
    float _958 = _686 + _330;
    float _960 = _692 + _338;
    float _962 = _882;
    float _964 = _882;
    float _966 = _904;
    float _968 = _894;
    float _970 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _972 = _918;
    float _974 = _692;
    float _976 = _948;
    float _986;
    float _988;
    float _990;
    float _992;
    if (!_936)
    {
        bool _978 = _948 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _980 = !_978;
        _982 = _980;
        if (!_982)
        {
            float _984 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _986 = _984;
            _988 = 0.0;
            _990 = 0.0;
            _992 = 0.0;
            _994 = true;
        }
    }
    if ((!_994) || _982)
    {
        bool _1036;
        if (!_982)
        {
            bool _996 = _948 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _998 = isnan(_948);
            bool _1000 = _996 || _998;
            bool _1002 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1004 = _1000 || _1002;
            bool _1006 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1008 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1010 = !_1004;
            bool _1012 = _1008 && _1010;
            float _1014 = 0.0;
            if (_1012)
            {
                _1014 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1016 = _1014;
            float _1018 = 0.0;
            float _1020 = _1016;
            if (_1012)
            {
                _1018 = 0.0;
            }
            float _1022 = _1018;
            float _1024 = 0.0;
            _988 = _1022;
            if (_1012)
            {
                _1024 = 0.0;
            }
            float _1026 = _1024;
            _990 = _1026;
            if (_1012)
            {
                float _1028 = _1016 * 5.0;
                _1020 = _1028;
            }
            float _1030 = _1020;
            _986 = _1030;
            if (_1012)
            {
                _962 = 0.0;
            }
            float _1032 = _962;
            bool _1034 = !_1004;
            _1036 = _1034 && _1006;
            _964 = _1032;
            _992 = _1032;
        }
        if ((!_1036) || _982)
        {
            _982 = false;
            float _1038 = _964;
            bool _1040 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1042 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1044 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1046 = _876;
            float _1048 = _1038;
            _986 = _956;
            _988 = _952;
            _990 = _954;
            if (_1040)
            {
                float _1050 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1046 = _1050;
            }
            float _1052 = _1046;
            if (_1040)
            {
                float _1054 = abs(_904);
                float _1056 = -_1054;
                float _1058 = _1056 + 1.0;
                _966 = _1058;
            }
            float _1060 = _966;
            if (_1042)
            {
                float _1062 = abs(_894);
                float _1064 = -_1062;
                float _1066 = _1064 + 1.0;
                _968 = _1066;
            }
            float _1068 = _968;
            if (!_1040)
            {
                _970 = 1.0;
            }
            float _1070 = _970;
            float _1072 = _1070;
            if (_1044)
            {
                float _1074 = abs(_918);
                float _1076 = -_1074;
                float _1078 = _1076 + 1.0;
                _972 = _1078;
            }
            float _1080 = _972;
            if (!_1042)
            {
                _974 = 1.0;
            }
            float _1082 = _974;
            float _1084 = _1082;
            if (!_1044)
            {
                _1048 = 1.0;
            }
            float _1086 = _1048;
            float _1088 = _938;
            float _1090 = _1086;
            if (_1042)
            {
                float _1092 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1088 = _1092;
            }
            float _1094 = _1088;
            float _1096 = _920;
            if (_1044)
            {
                float _1098 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1096 = _1098;
            }
            float _1100 = _1096;
            if (_1040)
            {
                float _1102 = _1060 * _1052;
                float _1104 = precise::clamp(_1102, 0.0, 1.0);
                _1072 = _1104;
            }
            float _1106 = _1072;
            if (_1042)
            {
                float _1108 = _1068 * _1094;
                float _1110 = precise::clamp(_1108, 0.0, 1.0);
                _1084 = _1110;
            }
            float _1112 = _1084;
            float _1114 = _1106 * _1112;
            if (_1044)
            {
                float _1116 = _1080 * _1100;
                float _1118 = precise::clamp(_1116, 0.0, 1.0);
                _1090 = _1118;
            }
            float _1120 = _1090;
            float _1122 = _1114 * _1120;
            _992 = _1122;
        }
    }
    _994 = false;
    float _1124 = _986;
    float _1126 = _988;
    float _1128 = _990;
    float _1130 = _992;
    float _1132 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1134 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1136 = floor(_1132);
    float _1138 = floor(_1134);
    float _1140 = -_1136;
    float _1142 = _1132 + _1140;
    float _1144 = -_1138;
    float _1146 = _1134 + _1144;
    float2 _4586 = float2(_1142, _1146);
    float _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4586, float2(0.0), isnan(_4586)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4586, float2(0.0), isnan(_4586)), level(0.0)).x;
    float _1150 = in.m_91.w;
    float _1152 = trunc(_1150);
    int _1154 = int(_1152);
    int _1156 = _1154 << 5;
    uint _1159 = uint(int(uint(_1156) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1159)];
    float _1161 = as_type<float>(_dmw0.x);
    int _1163 = _1156 + 4;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    float _1167 = as_type<float>(_dmw0.y);
    int _1169 = _1156 + 8;
    uint _1171 = uint(int(uint(_1169) >> uint(2)));
    float _1173 = as_type<float>(_dmw0.z);
    int _1175 = _1156 + 12;
    uint _1177 = uint(int(uint(_1175) >> uint(2)));
    float _1179 = as_type<float>(_dmw0.w);
    float _1181 = _948 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1185 = _1124 + _1183;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1189 = _1126 + _1187;
    float _1191 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1181);
    float _1193 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1191);
    float _1195 = _948 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1197 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1199 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1195);
    float _1201 = 1.0 / _1197;
    float _1203 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1199);
    float _1205 = _1203 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1207 = _1205 + _1197;
    float _1209 = _1207 * _1201;
    float _1211 = _1209 * 0.5;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1215 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1213);
    float _1217 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1219 = 1.0 / _1215;
    float _1221 = _948 + _1217;
    float _1223 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1225 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1227 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1223);
    float _1229 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1225);
    float _1231 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1227);
    float _1233 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1229);
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1237 = _1219 * _1235;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1241 = _1233 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1243 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1245 = trunc(_1239);
    int _1247 = int(_1245);
    bool _1249 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1251 = !_1243;
    int _1253 = _1251 ? 0 : 1;
    float _1255 = trunc(_1241);
    int _1257 = int(_1255);
    int _1259 = 2;
    float _1261 = _1126;
    float _1263 = _1124;
    float _1265 = _1241;
    if (!_1243)
    {
        _1259 = 1;
    }
    int _1267 = _1259;
    int _1269 = _1267;
    if (!_1249)
    {
        _1269 = _1253;
    }
    int _1271 = _1269;
    float _1273 = _1185 * _1185;
    int _1275 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1277 = _1247 + _1275;
    int _1279 = _1277 + 1;
    int _1281 = _1271 << 6;
    float _1283 = fma(_1189, _1189, _1273);
    bool _1285 = _1279 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1287 = _1281 + 48;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c15)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    float _1305 = sqrt(_1283);
    int _1307 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1309 = _1257 + _1307;
    int _1311 = _1309 + 1;
    int _1313 = _1279 | _1311;
    int _1315 = _1281 + 56;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    bool _1333 = _1313 < 0;
    bool _1335 = _1333 || _1285;
    bool _1337 = _1311 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1339 = _1337 || _1335;
    int _1341 = _1281 + 64;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    uint _1345 = uint(int(uint(int(_1343)) >> uint(2)));
    int _1347 = int(_1343) & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    int _1351 = int(_1343) + 1;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    int _1355 = _1351 & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    bool _1359 = _1305 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1361 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan(0.5);
    bool _1369 = _1365 || _1367;
    int _1371 = _1281 + 72;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    uint _1375 = uint(int(uint(int(_1373)) >> uint(2)));
    int _1377 = int(_1373) & 3;
    float _1379 = (*spvDescriptorSet0.vp_c15)._m0[int(_1375)][_1377];
    int _1381 = int(_1373) + 1;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    int _1385 = _1381 & 3;
    float _1387 = (*spvDescriptorSet0.vp_c15)._m0[int(_1383)][_1385];
    int _1389 = _1279;
    float _1391 = as_type<float>(_1271);
    if (!_1339)
    {
        int _1393 = _1311 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1395 = _1393 + _1279;
        _1389 = _1395;
    }
    int _1397 = _1389;
    int _1399 = _1281 + 96;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c15)._m0[int(_1411)][_1413];
    int _1417 = _1281 + 104;
    uint _1419 = uint(int(uint(_1417) >> uint(2)));
    uint _1421 = uint(int(uint(int(_1419)) >> uint(2)));
    int _1423 = int(_1419) & 3;
    float _1425 = (*spvDescriptorSet0.vp_c15)._m0[int(_1421)][_1423];
    int _1427 = int(_1419) + 1;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    int _1431 = _1427 & 3;
    float _1433 = (*spvDescriptorSet0.vp_c15)._m0[int(_1429)][_1431];
    float _1435 = _1179 * 2.0;
    float _1437 = _1161 * 2.0;
    float _1439 = _1167 * 2.0;
    float _1441 = _1173 * _1173;
    float _1443 = _1173 * _1435;
    float _1445 = _1167 * _1435;
    float _1447 = _1161 * _1435;
    float _1449 = _1161 * _1161;
    float _1451 = -_1443;
    float _1453 = fma(_1167, _1437, _1451);
    float _1455 = fma(_1173, _1437, _1445);
    float _1457 = fma(_1167, _1437, _1443);
    float _1459 = -_1445;
    float _1461 = fma(_1173, _1437, _1459);
    float _1463 = _1167 * _1167;
    int _1465 = as_type<int>(_1167);
    float _1467 = _1173;
    int _1469 = as_type<int>(_1439);
    if (!_1339)
    {
        int _1471 = _1397 << 2;
        _1465 = _1471;
    }
    int _1473 = _1465;
    float _1475 = -_1447;
    float _1477 = fma(_1173, _1439, _1475);
    float _1479 = fma(_1173, _1439, _1447);
    int _1481 = _1473;
    if (!_1359)
    {
        _1467 = _1126;
    }
    float _1483 = _1467;
    float _1485 = _1483;
    if (!_1339)
    {
        uint _1487 = uint(int(uint(_1397) >> uint(2)));
        _1469 = int(_1487);
    }
    int _1489 = _1469;
    float _1491 = as_type<float>(_1489);
    if (!_1339)
    {
        int _1493 = 12 & _1473;
        _1481 = _1493;
    }
    int _1495 = _1481;
    if (!_1359)
    {
        _1261 = _1128;
    }
    float _1497 = _1261;
    bool _1499 = !_1359;
    float _1501 = _1497;
    if (!_1499)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1507 = _1305 + _1505;
        float _1509 = rsqrt(_1283);
        float _1511 = _1507 * _1503;
        float _1513 = _1128 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1515 = _1511 * 0.15915493667125701904296875;
        float _1517 = _1515 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = _1515 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        float _1525 = fma(_1519, _1513, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1527 = _1509 * _1525;
        float _1529 = _1523 + (-1.0);
        float _1531 = fma(_1189, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1533 = fma(_1185, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1535 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = fma(_1523, _1128, _1535);
        _1485 = _1531;
        _1501 = _1537;
        _1263 = _1533;
    }
    float _1539 = _1485;
    float _1541 = _1501;
    float _1543 = _1263;
    if (!_1339)
    {
        int _1545 = _1489 << 4;
        int _1547 = _1545 + _1495;
        _1491 = as_type<float>(_1547);
    }
    float _1549 = _1491;
    float _1551 = fma(_1463, -2.0, 1.0);
    float _1553 = -_946;
    float _1555 = _1553 + _1539;
    float _1557 = fma(_1449, -2.0, 1.0);
    int _1559 = _1281 + 88;
    uint _1561 = uint(int(uint(_1559) >> uint(2)));
    uint _1563 = uint(int(uint(int(_1561)) >> uint(2)));
    int _1565 = int(_1561) & 3;
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[int(_1563)][_1565];
    int _1569 = int(_1561) + 1;
    uint _1571 = uint(int(uint(_1569) >> uint(2)));
    int _1573 = _1569 & 3;
    float _1575 = (*spvDescriptorSet0.vp_c15)._m0[int(_1571)][_1573];
    float _1577 = fma(_1441, -2.0, _1551);
    float _1579 = -_948;
    float _1581 = _1579 + _1541;
    float _1583 = fma(_1441, -2.0, _1557);
    float _1585 = fma(_1463, -2.0, _1557);
    float _1587 = -_950;
    float _1589 = _1587 + _1543;
    float _1591 = _1581 * _322;
    float _1593 = _1581 * _334;
    int _1595 = _1281 + 80;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    uint _1599 = uint(int(uint(int(_1597)) >> uint(2)));
    int _1601 = int(_1597) & 3;
    float _1603 = (*spvDescriptorSet0.vp_c15)._m0[int(_1599)][_1601];
    int _1605 = int(_1597) + 1;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    int _1609 = _1605 & 3;
    float _1611 = (*spvDescriptorSet0.vp_c15)._m0[int(_1607)][_1609];
    float _1613 = _1581 * _288;
    float _1615 = fma(_1555, _310, _1591);
    float _1617 = _1221 * _1415;
    float _1619 = fma(_1555, _330, _1593);
    float _1621 = _1221 * _1357;
    float _1623 = fma(_1589, _326, _1615);
    float _1625 = fma(_946, _1407, _1617);
    float _1627 = _1549;
    float _1629 = _1555;
    if (!_1339)
    {
        int _1631 = as_type<int>(_1549) + 400;
        uint _1633 = uint(int(uint(_1631) >> uint(2)));
        uint _1635 = uint(int(uint(int(_1633)) >> uint(2)));
        int _1637 = int(_1633) & 3;
        float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
        _1627 = _1639;
    }
    float _1641 = _1627;
    float _1643 = fma(_1555, _284, _1613);
    float _1645 = fma(_1589, _338, _1619);
    float _1647 = fma(_950, _1425, _1625);
    float _1649 = fma(_946, _1349, _1621);
    float _1651 = _1623 * _1453;
    float _1653 = _1623 * _1583;
    float _1655 = _1647 + _1433;
    float _1657 = fma(_1589, _292, _1643);
    float _1659 = _1623 * _1479;
    float _1661 = _1221 * _1303;
    float _1663 = _1407;
    if (!_1339)
    {
        float _1665 = floor(_1239);
        _1663 = _1665;
    }
    float _1667 = _1663;
    float _1669 = fma(_1657, _1577, _1651);
    float _1671 = fma(_1657, _1461, _1659);
    float _1673 = fma(_1657, _1457, _1653);
    float _1675 = fma(_946, _1295, _1661);
    float _1677 = fma(_1645, _1455, _1669);
    float _1679 = fma(_1645, _1585, _1671);
    float _1681 = fma(_1645, _1477, _1673);
    float _1683 = _1589;
    if (!_1339)
    {
        float _1685 = floor(_1241);
        _1683 = _1685;
    }
    float _1687 = _1683;
    float _1689 = fma(_950, _1323, _1675);
    float _1691 = _950 + _1679;
    float _1693 = fma(_950, _1379, _1649);
    float _1695 = _946 + _1677;
    float _1697 = _1689 + _1331;
    float _1699 = _948 + _1681;
    float _1701 = _1693 + _1387;
    float _1703 = 1.0 / _1655;
    float _1705 = _1689;
    float _1707 = _1699;
    float _1709 = _1695;
    float _1711 = _1693;
    if (_1369)
    {
        _1705 = _1691;
    }
    float _1713 = _1705;
    float _1715 = _1713;
    if (!_1369)
    {
        float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1719 = _948 + _1717;
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1723 = _946 + _1721;
        float _1725 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1727 = _1719 * _1719;
        float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1731 = _950 + _1729;
        float _1733 = fma(_1723, _1723, _1727);
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1737 = fma(_1731, _1731, _1733);
        float _1739 = sqrt(_1737);
        float _1741 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1743 = precise::min(_1739, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1745 = _1743 * _1735;
        float _1747 = _1741 * _1745;
        float _1749 = fma(_1681, _1747, _948);
        float _1751 = fma(_1677, _1747, _946);
        float _1753 = fma(_1679, _1747, _950);
        _1707 = _1749;
        _1709 = _1751;
        _1715 = _1753;
    }
    float _1755 = _1707;
    float _1757 = _1709;
    float _1759 = _1715;
    float _1761 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1765 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1767 = _1697 * _1703;
    float _1769 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1761);
    float _1771 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1763);
    float _1773 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1765);
    float _1775 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1777 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1769);
    float _1779 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1771);
    bool _1781 = _1767 >= 0.0;
    float _1783 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1773);
    float _1785 = _1777 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1787 = _1701 * _1703;
    if (!_1339)
    {
        float _1789 = rint(_1641);
        float _1791 = precise::max(_1789, 0.0);
        uint _1793 = uint(_1791);
        uint _1795 = clamp(_1793, 0u, 65535u);
        _1711 = as_type<float>(_1795);
    }
    float _1797 = _1711;
    float _1799 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1801 = _1767 <= 1.0;
    bool _1803 = _1801 && _1781;
    float _1805 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1775);
    float _1807 = _1783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1811 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1813 = _1787 >= 0.0;
    bool _1815 = _1813 && _1803;
    float _1817 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1805);
    float _1819 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1821 = -_1811;
    float _1823 = fma(_1821, _1809, 1.0);
    bool _1825 = _1787 <= 1.0;
    bool _1827 = _1825 && _1815;
    float _1829 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1831 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1819);
    float _1833 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1835 = _1833;
    float _1837 = _1799;
    if (!_1339)
    {
        float _1839 = -_1687;
        float _1841 = _1241 + _1839;
        _976 = _1841;
    }
    float _1843 = _976;
    float _1845 = log2(_1823);
    float _1847 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1831);
    float _1849 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1833);
    if (!_1339)
    {
        float _1851 = -_1667;
        float _1853 = _1239 + _1851;
        _1835 = _1853;
    }
    float _1855 = _1835;
    float _1857 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1847);
    float _1859 = _1221 * _1611;
    float _1861 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1827)
    {
        float _1863 = float(_1271);
        _1391 = _1863;
    }
    float _1865 = _1391;
    float _1867 = 1.0 / _1857;
    float _1869 = fma(_946, _1603, _1859);
    float _1871 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1861);
    float _1873 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1849);
    float _1875 = fma(_950, _1567, _1869);
    float _1877 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1871);
    float _1879 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1873);
    float _1881 = _1869;
    if (_1827)
    {
        float _1883 = rint(_1865);
        float _1885 = precise::max(_1883, 0.0);
        uint _1887 = uint(_1885);
        uint _1889 = clamp(_1887, 0u, 65535u);
        _1881 = as_type<float>(_1889);
    }
    float _1891 = _1881;
    float _1893 = _1875 + _1575;
    float _1895 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1877);
    float _1897 = _1845 * 0.693147182464599609375;
    float _1899 = _1893 * _1703;
    float _1901 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1903 = _1895 * _1867;
    float _1905 = _1879 * _1867;
    float _1907 = fma(_1903, 0.5, 0.5);
    float _1909 = fma(_1905, -0.5, 0.5);
    float _1911 = _1865;
    if (!_1339)
    {
        float3 _5865 = float3(_1855, _1843, float(as_type<int>(_1797)));
        float3 _5869 = select(_5865, float3(0.0), isnan(_5865));
        float _1913 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5869.xy, uint(rint(_5869.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5869.xy, uint(rint(_5869.z)), level(0.0)).x;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = _1687;
    if (_1827)
    {
        float3 _5884 = float3(_1767, _1787, float(as_type<int>(_1891)));
        float3 _5886 = select(_5884, float3(0.0), isnan(_5884));
        float _1919 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5886.xy, uint(rint(_5886.z)), _1899, level(0.0));
        _1917 = _1919;
    }
    float _1921 = _1917;
    float3 _5896 = float3(_1907, _1909, _1901);
    float _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5896, float3(0.0), isnan(_5896)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5896, float3(0.0), isnan(_5896)), level(0.0)).x;
    float3 _5905 = float3(_1907, _1909, _1901);
    float4 _1926 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5905, float3(0.0), isnan(_5905)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5905, float3(0.0), isnan(_5905)), level(0.0)).xyzw;
    float _1928 = _1926.x;
    float _1930 = _1926.y;
    float _1932 = _1926.z;
    float _1934 = _1926.w;
    float _1936 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1339)
    {
        _1265 = 1.0;
    }
    float _1938 = _1265;
    bool _1940 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.5);
    bool _1948 = _1944 || _1946;
    float _1950 = _1938;
    if (_1948)
    {
        _1936 = 1.0;
    }
    float _1952 = _1936;
    float _1954 = _1952;
    if (!_1948)
    {
        float _1956 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1958 = _1956 * 0.15915493667125701904296875;
        float _1960 = _1958 * 6.283185482025146484375;
        float _1962 = cos(_1960);
        float _1964 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1966 = _1964 * 0.15915493667125701904296875;
        float _1968 = _1958 * 6.283185482025146484375;
        float _1970 = sin(_1968);
        float _1972 = 1.0 / _1962;
        float _1974 = _1966 * 6.283185482025146484375;
        float _1976 = cos(_1974);
        float _1978 = _1970 * _1972;
        float _1980 = _1966 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        float _1984 = _1976 * _1978;
        float _1986 = 1.0 / _1984;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1990 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1988;
        float _1992 = 1.0 / _1990;
        float _1994 = _1982 * _1986;
        float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1998 = fma(_1237, _1994, _1996);
        float _2000 = _1998 * _1992;
        float _2002 = precise::clamp(_2000, 0.0, 1.0);
        _1954 = _2002;
    }
    float _2004 = _1954;
    if (!_1339)
    {
        int _2006 = _1397 << 4;
        int _2008 = _2006 + 2048;
        uint _2010 = uint(int(uint(_2008) >> uint(2)));
        uint _2012 = uint(int(uint(int(_2010)) >> uint(2)));
        int _2014 = int(_2010) & 3;
        float _2016 = (*spvDescriptorSet0.vp_c15)._m0[int(_2012)][_2014];
        int _2018 = int(_2010) + 1;
        uint _2020 = uint(int(uint(_2018) >> uint(2)));
        int _2022 = _2018 & 3;
        float _2024 = (*spvDescriptorSet0.vp_c15)._m0[int(_2020)][_2022];
        int _2026 = _2008 + 8;
        uint _2028 = uint(int(uint(_2026) >> uint(2)));
        uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
        int _2032 = int(_2028) & 3;
        float _2034 = (*spvDescriptorSet0.vp_c15)._m0[int(_2030)][_2032];
        int _2036 = int(_2028) + 1;
        uint _2038 = uint(int(uint(_2036) >> uint(2)));
        int _2040 = _2036 & 3;
        float _2042 = (*spvDescriptorSet0.vp_c15)._m0[int(_2038)][_2040];
        float _2044 = _1221 * _2024;
        float _2046 = fma(_946, _2016, _2044);
        float _2048 = fma(_950, _2034, _2046);
        float _2050 = _2048 + _2042;
        float _2052 = precise::clamp(_2050, 0.0, 1.0);
        float _2054 = -_2052;
        float _2056 = _2054 + _1915;
        float _2058 = fma(_2056, 500.0, 1.5);
        float _2060 = exp2(_2058);
        float _2062 = 0.0 + _2060;
        float _2064 = precise::clamp(_2062, 0.0, 1.0);
        _1950 = _2064;
    }
    float _2066 = _1950;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2070 = _1755 + _2068;
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2074 = _1757 + _2072;
    float _2076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2078 = _1759 + _2076;
    float _2080 = _2070 * _2070;
    float _2082 = fma(_2074, _2074, _2080);
    float _2084 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2086 = fma(_2078, _2078, _2082);
    float _2088 = rsqrt(_2086);
    float _2090 = sqrt(_2086);
    float _2092 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2094 = _2074 * _2092;
    float _2096 = _2078 * _2092;
    float _2098 = _2094 * _2094;
    float _2100 = _2096 * _2096;
    float _2102 = _2098 + _2100;
    float _2104 = sqrt(_2102);
    bool _2106 = _2104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2110 = _2104 + _2108;
    float _2112 = _1843;
    float _2114 = _2102;
    float _2116 = _2110;
    float _2118 = _2070;
    float _2120 = _2092;
    float _2122 = _2094;
    float _2124 = _2096;
    float _2126 = _2098;
    float _2128 = _2100;
    if (_2106)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2112 = _2130;
    }
    float _2132 = _2112;
    if (_2106)
    {
        float _2134 = rsqrt(_2102);
        _2114 = _2134;
    }
    float _2136 = _2114;
    if (_2106)
    {
        float _2138 = _2110 * _2132;
        _2116 = _2138;
    }
    float _2140 = _2116;
    float _2142 = precise::max(0.0, _2084);
    float _2144 = _2142;
    if (_2106)
    {
        float _2146 = _2140 * 0.15915493667125701904296875;
        _1629 = _2146;
    }
    float _2148 = _1629;
    float _2150 = -_2092;
    float _2152 = -_2142;
    float _2154 = fma(_2070, _2150, _2152);
    float _2156 = _1901;
    if (_2106)
    {
        float _2158 = _2148 * 6.283185482025146484375;
        float _2160 = sin(_2158);
        _2156 = _2160;
    }
    float _2162 = _2156;
    if (_2106)
    {
        float _2164 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2118 = _2164;
    }
    float _2166 = _2118;
    float _2168 = _2140;
    float _2170 = _2166;
    if (_2106)
    {
        float _2172 = _2148 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        _2168 = _2174;
    }
    float _2176 = _2168;
    if (_2106)
    {
        float _2178 = fma(_2162, _2166, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2170 = _2178;
    }
    float _2180 = _2170;
    float _2182 = _2180;
    if (_2106)
    {
        float _2184 = _2136 * _2180;
        _2144 = _2184;
    }
    float _2186 = _2144;
    if (!_2106)
    {
        _2182 = _2154;
    }
    float _2188 = _2182;
    float _2190 = _2188;
    if (_2106)
    {
        float _2192 = _2176 + (-1.0);
        _2120 = _2192;
    }
    float _2194 = _2120;
    float _2196 = _2194;
    if (_2106)
    {
        float _2198 = _2094 * _2186;
        _2122 = _2198;
    }
    float _2200 = _2122;
    if (_2106)
    {
        float _2202 = _2096 * _2186;
        _2124 = _2202;
    }
    float _2204 = _2124;
    if (_2106)
    {
        float _2206 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2196 = _2206;
    }
    float _2208 = _2196;
    if (_2106)
    {
        float _2210 = _2200 * _2200;
        _2126 = _2210;
    }
    float _2212 = _2126;
    if (_2106)
    {
        float _2214 = _2204 * _2204;
        _2128 = _2214;
    }
    float _2216 = _2128;
    if (_2106)
    {
        float _2218 = fma(_2154, _2176, _2208);
        _2190 = _2218;
    }
    float _2220 = _2190;
    float _2222 = fma(_2220, _2220, _2212);
    float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2226 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2224);
    float _2228 = precise::clamp(_2226, 0.0, 1.0);
    float _2230 = _2222 + _2216;
    float _2232 = -_2228;
    float _2234 = _2232 + 1.0;
    float _2236 = rsqrt(_2230);
    float _2238 = abs(_2234);
    float _2240 = log2(_2238);
    float _2242 = _2236 * _2200;
    float _2244 = _2236 * _2220;
    float _2246 = _2236 * _2204;
    float _2248 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2250 = -_2248;
    float _2252 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2250);
    float _2254 = -_2246;
    float _2256 = fma(_2254, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2252);
    float _2258 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2260 = fma(_2256, -0.5, 0.5);
    float _2262 = exp2(_2258);
    float _2264 = fma(_2256, 0.5, 0.5);
    float _2266 = fma(_2264, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2268 = sqrt(_2260);
    float _2270 = fma(_2264, _2266, -0.212114393711090087890625);
    float _2272 = _2244 + 1.0;
    float _2274 = fma(_2264, _2270, 1.570728778839111328125);
    float _2276 = -_2244;
    float _2278 = fma(_2262, _2272, _2276);
    float _2280 = _2268 * 0.636619746685028076171875;
    float _2282 = -_2274;
    float _2284 = fma(_2280, _2282, 1.0);
    float _2286 = fma(_2278, 0.5, 0.5);
    float2 _6445 = float2(_2284, _2286);
    float3 _2290 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6445, float2(0.0), isnan(_6445)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6445, float2(0.0), isnan(_6445)), level(0.0)).xyz;
    float _2292 = _2290.x;
    float _2294 = _2290.y;
    float _2296 = _2290.z;
    float _2298 = _1453 * _288;
    float _2300 = _1479 * _288;
    float _2302 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2312 = _2308 || _2310;
    float _2314 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2316 = fma(_1577, _284, _2298);
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2320 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2318);
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2324 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2322);
    float _2326 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2314);
    float _2328 = fma(_1461, _284, _2300);
    float _2330 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2320);
    float _2332 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2324);
    float _2334 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2336 = -_1148;
    float _2338 = _2336 + 1.0;
    float _2340 = _946 + _2330;
    float _2342 = _950 + _2332;
    float _2344 = _1583 * _288;
    float _2346 = _2234;
    if (_2312)
    {
        float _2348 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2346 = _2348;
    }
    float _2350 = _2346;
    float _2352 = abs(_1237);
    float _2354 = log2(_2352);
    float _2356 = -_2340;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2360 = -_2342;
    float _2362 = _2360 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2364 = fma(_1457, _284, _2344);
    float _2366 = _2350;
    float _2368 = _2362;
    if (_2312)
    {
        float _2370 = precise::min(_2350, 20.0);
        _2366 = _2370;
    }
    float _2372 = _2366;
    out.m_93.x = _1757;
    out.m_93.y = _1755;
    out.m_93.z = _1759;
    float _2374 = precise::min(_2340, _2358);
    float _2376 = fma(_1585, _292, _2328);
    float _2378 = _946;
    if (_2312)
    {
        float _2380 = 1.0 / _2372;
        _2378 = _2380;
    }
    float _2382 = _2378;
    float _2384 = precise::min(_2342, _2362);
    if (!_2312)
    {
        _2368 = 1.0;
    }
    float _2386 = _2368;
    float _2388 = precise::min(_2374, _2384);
    float _2390 = _834 * _1583;
    float _2392 = _846 * _1583;
    float _2394 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2396 = _834 * _1453;
    float _2398 = _846 * _1453;
    float _2400 = fma(_822, _1457, _2392);
    float _2402 = exp2(_2334);
    float _2404 = fma(_958, _1577, _2396);
    float _2406 = fma(_822, _1577, _2398);
    float _2408 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2326);
    float _2410 = _2386;
    if (_2312)
    {
        float _2412 = _2388 * _2382;
        float _2414 = precise::clamp(_2412, 0.0, 1.0);
        _2410 = _2414;
    }
    float _2416 = _2410;
    float _2418 = _846 * _1479;
    float _2420 = fma(_1455, _292, _2316);
    float _2422 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2408);
    float _2424 = exp2(_2394);
    float _2426 = _1130 * _2416;
    float _2428 = fma(_822, _1461, _2418);
    float _2430 = fma(_958, _1457, _2390);
    float _2432 = fma(_1477, _292, _2364);
    float _2434 = fma(_854, _1455, _2406);
    float _2436 = fma(_854, _1477, _2400);
    float _2438 = fma(_854, _1585, _2428);
    bool _2440 = _1237 <= 8000.0;
    bool _2442 = isnan(_1237);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan(8000.0);
    bool _2448 = _2444 || _2446;
    float _2450 = float(_2448);
    float _2452 = _2422 + _1857;
    float _2454 = _834 * _1479;
    out.m_95.x = _2434;
    out.m_95.y = _2436;
    out.m_95.z = _2438;
    float _2456 = _2452 * 0.5;
    float _2458 = fma(_960, _1455, _2404);
    float _2460 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2462 = precise::clamp(_2460, 0.0, 1.0);
    float _2464 = fma(_958, _1461, _2454);
    float _2466 = fma(_960, _1477, _2430);
    out.m_97.z = _2456;
    out.m_97.w = _1857;
    float _2468 = fma(_2462, -2.0, 3.0);
    float _2470 = _2462 * _2462;
    float _2472 = fma(_960, _1585, _2464);
    out.m_99.x = _2420;
    out.m_99.y = _2432;
    out.m_99.z = _2376;
    bool _2474 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2476 = isnan(_2090);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2482 = _2478 || _2480;
    float _2484 = _2470 * _2468;
    float _2486 = -_2402;
    float _2488 = _2486 + 1.0;
    float _2490 = _2434;
    float _2492 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (!_1827)
    {
        _2490 = 1.0;
    }
    float _2494 = _2490;
    out.gl_Position.x = _1895;
    out.gl_Position.y = _1879;
    out.gl_Position.z = _2422;
    out.gl_Position.w = _1857;
    float _2496 = -_2484;
    float _2498 = _2496 + 1.0;
    float _2500 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2502 = _2494;
    if (_1827)
    {
        bool _2504 = _1921 >= _1899;
        bool _2506 = isnan(_1921);
        bool _2508 = _2504 || _2506;
        bool _2510 = isnan(_1899);
        bool _2512 = _2508 || _2510;
        float _2514 = float(_2512);
        _2502 = _2514;
    }
    float _2516 = _2502;
    out.m_101.x = _2458;
    out.m_101.y = _2466;
    out.m_101.z = _2472;
    float _2518 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2484);
    float _2520 = _2500 * _1923;
    float _2522 = -_2500;
    float _2524 = _2522 + 1.0;
    float _2526 = _2516 * _2066;
    float _2528 = _2450 * _2518;
    float _2530 = _1934 * _2520;
    float _2532 = _2426 * _2004;
    float _2534 = _2524;
    float _2536 = _2520;
    if (!_2482)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2538 = _1837;
    float _2540 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2542 = _2540;
    float _2544 = _2538;
    float _2546 = _2538;
    if (!_2482)
    {
        _2492 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2548 = _2492;
    float _2550 = _2532 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2552 = _2338 * _2540;
    float _2554 = precise::clamp(_2552, 0.0, 1.0);
    float _2556 = _2548;
    float _2558 = _2548;
    if (!_2482)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2560 = _2542;
    float _2562 = -_2554;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2566 = -_2526;
    float _2568 = fma(_2566, _2564, 1.0);
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = _1934 * _2524;
    float _2574 = _2560;
    float _2576 = _2560;
    if (!_2482)
    {
        _2534 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2578 = _2534;
    float _2580 = _2570 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_103.x = _2580;
    float _2582 = _2580;
    float _2584 = _2578;
    float _2586 = _2578;
    if (!_2482)
    {
        _2582 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2588 = _2582;
    float _2590 = _2296 * _2520;
    float _2592 = fma(_2292, _2530, _1928);
    float _2594 = fma(_2294, _2530, _1930);
    float _2596 = _2588;
    float _2598 = _2588;
    if (!_2482)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2600 = _2536;
    float _2602 = fma(_1934, _2590, _1932);
    out.m_105.x = _2592;
    out.m_105.y = _2594;
    out.m_105.z = _2602;
    out.m_105.w = _2572;
    bool _2604 = !_2482;
    float _2606 = _2600;
    float _2608 = _2600;
    if (!_2604)
    {
        bool _2610 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2612 = isnan(_2090);
        bool _2614 = _2610 || _2612;
        bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2618 = _2614 || _2616;
        if (!_2618)
        {
            float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2622 = _2090 + _2620;
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2626 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2624;
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2632 = 1.0 / _2626;
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2650 = _2622 * _2632;
            float _2652 = precise::clamp(_2650, 0.0, 1.0);
            float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2658 = fma(_2652, _2630, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2660 = fma(_2652, _2656, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2662 = fma(_2652, _2636, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2664 = fma(_2652, _2640, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2666 = fma(_2652, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2668 = fma(_2652, _2648, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2608 = _2662;
            _2576 = _2666;
            _2546 = _2658;
            _2586 = _2664;
            _2558 = _2660;
            _2598 = _2668;
            _2670 = true;
        }
        else
        {
            bool _2672 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2674 = isnan(_2090);
            bool _2676 = _2672 || _2674;
            bool _2678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2680 = _2676 || _2678;
            if (!_2680)
            {
                _2544 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2682 = _2544;
            _2546 = _2682;
            if (!_2680)
            {
                _2606 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2684 = _2606;
            _2608 = _2684;
            if (!_2680)
            {
                _2556 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2686 = _2556;
            _2558 = _2686;
            if (!_2680)
            {
                _2584 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2688 = _2584;
            _2586 = _2688;
            if (!_2680)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2690 = _2574;
            _2576 = _2690;
            if (!_2680)
            {
                _2596 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2692 = _2596;
            bool _2694 = !_2680;
            _2598 = _2692;
            if (!_2694)
            {
                bool _2696 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2698 = isnan(_2090);
                bool _2700 = _2696 || _2698;
                bool _2702 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2704 = _2700 || _2702;
                if (!_2704)
                {
                    float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2708 = _2090 + _2706;
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2712 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2710;
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2718 = 1.0 / _2712;
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2736 = _2708 * _2718;
                    float _2738 = precise::clamp(_2736, 0.0, 1.0);
                    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2744 = fma(_2738, _2716, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2746 = fma(_2738, _2742, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2748 = fma(_2738, _2722, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2750 = fma(_2738, _2726, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2752 = fma(_2738, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2754 = fma(_2738, _2734, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2608 = _2748;
                    _2576 = _2752;
                    _2546 = _2744;
                    _2586 = _2750;
                    _2558 = _2746;
                    _2598 = _2754;
                    _2670 = true;
                }
                else
                {
                    _2608 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2546 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2586 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2558 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2598 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2670 = false;
    float _2756 = _2608;
    float _2758 = _2576;
    float _2760 = _2546;
    float _2762 = _2586;
    float _2764 = _2558;
    float _2766 = _2598;
    float _2768 = fma(_2466, -0.5, 0.5);
    float _2770 = precise::clamp(_2768, 0.0, 1.0);
    float _2772 = -_2756;
    float _2774 = _2772 + _2758;
    float _2776 = _2550 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2778 = -_2760;
    float _2780 = _2778 + _2762;
    float _2782 = fma(_2770, _2774, _2756);
    out.m_107.x = 0.0;
    float _2784 = -_2764;
    float _2786 = _2784 + _2766;
    float _2788 = fma(_2770, _2780, _2760);
    float _2790 = _2782 * 0.586610972881317138671875;
    out.m_68.x = _2776;
    bool _2792 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2794 = fma(_2770, _2786, _2764);
    float _2796 = fma(_2788, 0.298911988735198974609375, _2790);
    bool _2798 = _2004 > 0.0;
    bool _2800 = isnan(_2004);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan(0.0);
    bool _2806 = _2802 || _2804;
    float _2808 = fma(_2794, 0.114477999508380889892578125, _2796);
    float _2810 = -_2808;
    float _2812 = _2788 + _2810;
    float _2814 = -_2808;
    float _2816 = _2782 + _2814;
    float _2818 = -_2808;
    float _2820 = _2794 + _2818;
    float _2822 = fma(_2812, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2808);
    float _2824 = fma(_2816, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2808);
    float _2826 = fma(_2820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2808);
    bool _2828 = !_2792;
    if (!_2828)
    {
        float _2830 = -_1755;
        float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2834 = -_1757;
        float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2838 = -_1759;
        float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2842 = _2832 * _2832;
        float _2844 = fma(_2836, _2836, _2842);
        float _2846 = fma(_2840, _2840, _2844);
        float _2848 = sqrt(_2846);
        float _2850 = rsqrt(_2846);
        float _2852 = -_2848;
        float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2856 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2858 = precise::clamp(_2856, 0.0, 1.0);
        float _2860 = _2836 * _2850;
        float _2862 = _2832 * _2850;
        float _2864 = abs(_2858);
        float _2866 = log2(_2864);
        float _2868 = _2840 * _2850;
        float _2870 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2872 = _2466 * _2862;
        float _2874 = -_2862;
        float _2876 = -_2870;
        float _2878 = fma(_2874, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2876);
        float _2880 = fma(_2458, _2860, _2872);
        float _2882 = -_2868;
        float _2884 = fma(_2882, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2878);
        float _2886 = fma(_2472, _2868, _2880);
        float _2888 = precise::clamp(_2886, 0.0, 1.0);
        float _2890 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2892 = _2884 + _2890;
        float _2894 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2896 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2898 = precise::clamp(_2896, 0.0, 1.0);
        float _2900 = exp2(_2894);
        float _2902 = _2900 * _2898;
        float _2904 = _2888 * _2902;
        float _2906 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2908 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2910 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2906;
        out.m_107.y = _2908;
        out.m_107.z = _2910;
    }
    out.m_109.x = _2822;
    out.m_109.y = _2824;
    out.m_109.z = _2826;
    if (_2806)
    {
        return out;
    }
    out.m_68.x = 0.0;
    float _2912 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2912;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2670 = false;
    bool _994 = false;
    bool _982 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_65.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_68.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2969 = as_type<float>(_144);
        out.gl_Position.z = _2969;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_70.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_158)
    {
        float _164 = float(_128);
        _138 = _164;
    }
    float _166 = _138;
    bool _168 = _162 >= _166;
    bool _170 = !_158;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_68.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _146 = as_type<int>(_178);
    }
    int _180 = _146;
    float _182 = as_type<float>(_180);
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_180);
        out.gl_Position.z = _3040;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _184 = in.m_72.x;
    float _186 = in.m_72.y;
    float _188 = in.m_72.z;
    float _190 = in.m_74.x;
    float _192 = in.m_74.y;
    float _194 = in.m_74.z;
    float _196 = in.m_76.x;
    float _198 = in.m_76.y;
    float _200 = in.m_76.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = fma(_190, _190, _202);
    float _208 = fma(_192, _192, _204);
    float _210 = fma(_196, _196, _206);
    float _212 = _188 * _188;
    float _214 = fma(_198, _198, _208);
    float _216 = sqrt(_210);
    float _218 = fma(_194, _194, _212);
    float _220 = fma(_200, _200, _218);
    float _222 = sqrt(_214);
    float _224 = sqrt(_220);
    bool _226 = _216 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = 0.0;
    float _232 = _216;
    float _234 = _222;
    float _236 = _210;
    float _238 = _220;
    float _240 = _214;
    if (_226)
    {
        float _242 = rsqrt(_210);
        _230 = _242;
    }
    float _244 = _230;
    if (!_226)
    {
        _232 = 0.0;
    }
    float _246 = _232;
    bool _248 = _224 > 0.0;
    float _250 = _224;
    float _252 = _246;
    if (!_226)
    {
        _250 = 0.0;
        _234 = 0.0;
    }
    float _254 = _250;
    float _256 = _234;
    float _258 = 0.0;
    float _260 = _254;
    float _262 = _256;
    if (!_228)
    {
        _258 = 0.0;
    }
    float _264 = _258;
    float _266 = 0.0;
    float _268 = _264;
    if (_228)
    {
        float _270 = rsqrt(_214);
        _266 = _270;
    }
    float _272 = _266;
    float _274 = 0.0;
    if (_248)
    {
        float _276 = rsqrt(_220);
        _274 = _276;
    }
    float _278 = _274;
    float _280 = _244;
    if (_226)
    {
        float _282 = _244 * _190;
        _252 = _282;
    }
    float _284 = _252;
    if (_226)
    {
        float _286 = _244 * _184;
        _260 = _286;
    }
    float _288 = _260;
    if (_226)
    {
        float _290 = _244 * _196;
        _262 = _290;
    }
    float _292 = _262;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_228)
    {
        _280 = 0.0;
        _182 = 0.0;
    }
    float _296 = _280;
    float _298 = _182;
    float _300 = _296;
    float _302 = _298;
    if (!_248)
    {
        _236 = 0.0;
    }
    float _304 = _236;
    float _306 = _304;
    if (_228)
    {
        float _308 = _272 * _192;
        _268 = _308;
    }
    float _310 = _268;
    if (!_248)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _312 = _238;
    float _314 = _240;
    float _316 = _312;
    float _318 = _314;
    if (_228)
    {
        float _320 = _272 * _186;
        _300 = _320;
    }
    float _322 = _300;
    if (_228)
    {
        float _324 = _272 * _198;
        _302 = _324;
    }
    float _326 = _302;
    if (_248)
    {
        float _328 = _278 * _194;
        _316 = _328;
    }
    float _330 = _316;
    if (_248)
    {
        float _332 = _278 * _188;
        _318 = _332;
    }
    float _334 = _318;
    if (_248)
    {
        float _336 = _278 * _200;
        _306 = _336;
    }
    float _338 = _306;
    bool _340 = !_294;
    float _358;
    if (!_340)
    {
        float _342 = in.m_78.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_128);
        float _364 = 1.0 / _362;
        float _366 = _162 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = as_type<float>(int(gl_VertexIndex));
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _374 = _368 + _372;
    float _376 = in.m_65.x;
    float _378 = in.m_65.y;
    float _380 = in.m_65.z;
    float _382 = in.m_78.x;
    float _384 = in.m_78.y;
    float _386 = in.m_78.z;
    float _388 = in.m_78.w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _396 = in.m_74.w;
    float _398 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _400 = _392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _402 = _394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = in.m_72.w;
    float _406 = in.m_76.w;
    int _408 = as_type<int>(_370) & 1;
    bool _410 = _408 != 0;
    int _412 = as_type<int>(_370) & 2;
    bool _414 = _412 != 0;
    out.m_83.x = _398;
    out.m_83.y = _400;
    out.m_83.z = _402;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    float _420 = _192 * _378;
    float _422 = _186 * _378;
    float _424 = _198 * _378;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = fma(_190, _376, _420);
    float _432 = fma(_184, _376, _422);
    float _434 = fma(_196, _376, _424);
    float _436 = _384 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _438 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _444 = _388 > 0.5;
    float _446 = fma(_436, -2.0, _440);
    float _448 = -_442;
    float _450 = fma(_438, 2.0, _448);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _462 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].z, _452);
    float _464 = 1.0 / _456;
    float _466 = fma(_194, _380, _430);
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _470 = _468 != 0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _478 = _476 != 0;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _482 = 1.0 / _460;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _486 = fma(_188, _380, _432);
    bool _488 = !_410;
    float _490 = _488 ? (-0.5) : 0.5;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _368 + _492;
    float _496 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[78].w, _484);
    float _498 = -_162;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[76].x, _450);
    float _502 = 1.0 / _474;
    bool _504 = _386 > 0.5;
    float _506 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[79].z, _480);
    bool _508 = !_414;
    float _510 = _508 ? (-0.5) : 0.5;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _520 = _382 > 0.5;
    float _522 = fma(_200, _380, _434);
    float _524 = -_510;
    int _526 = _444 ? as_type<int>(_524) : as_type<int>(_510);
    float _528 = _514 * _464;
    float _530 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[79].x, _506);
    bool _532 = _384 > 0.5;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _368 + _534;
    bool _538 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = isnan(_368);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _550;
    float _554 = _518 * _502;
    float _556 = fma(_528, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _558 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = isnan(_368);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _552 * _482;
    float _572 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _446);
    float _574 = in.m_85.x;
    float _576 = in.m_85.y;
    float _578 = fma(_554, _494, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = -_568;
    float _582 = _580 + 1.0;
    float _584 = fma(_570, _374, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _586 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = isnan(_368);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _462);
    float _600 = _548 * _582;
    float _602 = -_548;
    float _604 = _602 + 1.0;
    float _606 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _496);
    bool _608 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_368);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = _466 + _396;
    float _622 = _596 * _604;
    float _624 = -_596;
    float _626 = _624 + 1.0;
    float _628 = _486 + _404;
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _490);
    float _632 = _522 + _406;
    float _634 = _618 * _626;
    float _636 = -_490;
    int _638 = _504 ? as_type<int>(_636) : as_type<int>(_490);
    float _640 = _510 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _510);
    float _644 = _556 * _634;
    float _646 = -_510;
    int _648 = _532 ? as_type<int>(_646) : as_type<int>(_510);
    float _650 = _530 * (-0.15915493667125701904296875);
    bool _652 = !_478;
    float _654 = _652 ? _510 : as_type<float>(_526);
    float _656 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _658 = !_428;
    float _660 = _658 ? _510 : as_type<float>(_648);
    float _662 = _490 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _664 = !_470;
    float _666 = _664 ? _490 : as_type<float>(_638);
    float _668 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _670 = _640 * _322;
    float _672 = _640 * _310;
    float _674 = _640 * _326;
    float _676 = _668 * _630;
    float _678 = -_490;
    int _680 = _520 ? as_type<int>(_678) : as_type<int>(_490);
    float _682 = _576 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _684 = fma(_662, _288, _670);
    float _686 = fma(_662, _284, _672);
    bool _688 = !_418;
    float _690 = _688 ? _490 : as_type<float>(_680);
    float _692 = fma(_662, _292, _674);
    float _694 = _650 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _628 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _700 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _702 = -_618;
    float _704 = _702 + 1.0;
    float _706 = _620 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _708 = _698 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _710 = _700 * _642;
    float _712 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[115].x, _644);
    float _714 = _650 * 6.283185482025146484375;
    float _716 = cos(_714);
    float _718 = _632 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c12)._m0[6].x, _708);
    float _722 = _710 * _322;
    float _724 = _710 * _310;
    float _726 = _710 * _326;
    float _728 = fma(_718, (*spvDescriptorSet0.vp_c12)._m0[8].x, _720);
    float _730 = fma(_640, _640, 1.0);
    float _732 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _734 = fma(_676, _288, _722);
    float _736 = _698 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _738 = fma(_676, _284, _724);
    float _740 = fma(_676, _292, _726);
    float _742 = _660 * _696;
    float _744 = fma(_578, _622, _712);
    float _746 = _728 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _750 = _660 * _716;
    float _752 = fma(_706, (*spvDescriptorSet0.vp_c12)._m0[6].y, _736);
    float _754 = -_742;
    float _756 = fma(_690, _716, _754);
    float _758 = _698 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _760 = fma(_690, _696, _750);
    float _762 = fma(_584, _600, _744);
    float _764 = _666 + 0.5;
    float _766 = rsqrt(_730);
    float _768 = _746 * _732;
    float _770 = fma(_718, (*spvDescriptorSet0.vp_c12)._m0[8].y, _752);
    float _772 = fma(_706, (*spvDescriptorSet0.vp_c12)._m0[6].z, _758);
    float _774 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _776 = fma(_768, 0.5, 0.5);
    float _778 = _770 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _780 = fma(_718, (*spvDescriptorSet0.vp_c12)._m0[8].z, _772);
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _784 = fma(_774, _330, _738);
    float _786 = _778 * _748;
    float _788 = fma(_774, _334, _734);
    float _790 = _780 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _792 = _764 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _794 = fma(_786, 0.5, 0.5);
    float _796 = -_654;
    float _798 = _796 + 0.5;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _802 = _640 * _766;
    float _804 = _756 + 0.5;
    float _806 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[118].x, _762);
    float _808 = -_330;
    float _810 = _802 * _808;
    float _812 = -_598;
    float _814 = _812 + 1.0;
    float _816 = fma(_774, _338, _740);
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _820 = _790 * _782;
    float _822 = fma(_766, _310, _810);
    float _824 = _760 + (-0.5);
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _828 = fma(_820, 0.5, 0.5);
    float _830 = -_334;
    float _832 = _802 * _830;
    float _834 = _684 + _334;
    float _836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _838 = _800 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _840 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = -_338;
    float _844 = _802 * _842;
    float _846 = fma(_766, _322, _832);
    float _848 = -_838;
    float _850 = -_572;
    float _852 = fma(_848, _824, _850);
    float _854 = fma(_766, _326, _844);
    float _856 = floor(_794);
    float _858 = _818 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _860 = fma(_858, _804, _500);
    float _862 = floor(_776);
    float _864 = _792 * _836;
    float _866 = _798 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _868 = -_606;
    float _870 = _868 + 1.0;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _876 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _878 = floor(_828);
    float _880 = -_856;
    float _882 = _794 + _880;
    float _884 = fma(_760, _870, _852);
    float _886 = -_814;
    float _888 = fma(_756, _886, _860);
    float _890 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = fma(_882, 2.0, -1.0);
    float _896 = -_862;
    float _898 = _776 + _896;
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _902 = _894 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_87.x = _890;
    out.m_87.y = _892;
    out.m_87.z = _840;
    out.m_87.w = _876;
    float _904 = fma(_898, 2.0, -1.0);
    float _906 = _902 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _908 = _902 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _910 = -_878;
    float _912 = _828 + _910;
    float _914 = _904 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _916 = _902 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _918 = fma(_912, 2.0, -1.0);
    float _920 = _918 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c12)._m0[2].x, _906);
    float _924 = fma(_914, (*spvDescriptorSet0.vp_c12)._m0[2].y, _908);
    float _926 = fma(_914, (*spvDescriptorSet0.vp_c12)._m0[2].z, _916);
    bool _928 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _930 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _932 = _928 || _930;
    bool _934 = isnan(1.0);
    bool _936 = _932 || _934;
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c12)._m0[4].x, _922);
    float _940 = fma(_920, (*spvDescriptorSet0.vp_c12)._m0[4].y, _924);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c12)._m0[4].z, _926);
    float _944 = _866 * _900;
    float _946 = _938 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _948 = _940 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _950 = _942 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    out.m_89.x = _888;
    out.m_89.y = _884;
    out.m_89.z = _864;
    out.m_89.w = _944;
    float _952 = _784 + _946;
    float _954 = _788 + _948;
    float _956 = _816 + _950;
    float _958 = _686 + _330;
    float _960 = _692 + _338;
    float _962 = _882;
    float _964 = _882;
    float _966 = _904;
    float _968 = _894;
    float _970 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _972 = _918;
    float _974 = _692;
    float _976 = _948;
    float _986;
    float _988;
    float _990;
    float _992;
    if (!_936)
    {
        bool _978 = _948 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _980 = !_978;
        _982 = _980;
        if (!_982)
        {
            float _984 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _986 = _984;
            _988 = 0.0;
            _990 = 0.0;
            _992 = 0.0;
            _994 = true;
        }
    }
    if ((!_994) || _982)
    {
        bool _1036;
        if (!_982)
        {
            bool _996 = _948 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _998 = isnan(_948);
            bool _1000 = _996 || _998;
            bool _1002 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1004 = _1000 || _1002;
            bool _1006 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1008 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1010 = !_1004;
            bool _1012 = _1008 && _1010;
            float _1014 = 0.0;
            if (_1012)
            {
                _1014 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1016 = _1014;
            float _1018 = 0.0;
            float _1020 = _1016;
            if (_1012)
            {
                _1018 = 0.0;
            }
            float _1022 = _1018;
            float _1024 = 0.0;
            _988 = _1022;
            if (_1012)
            {
                _1024 = 0.0;
            }
            float _1026 = _1024;
            _990 = _1026;
            if (_1012)
            {
                float _1028 = _1016 * 5.0;
                _1020 = _1028;
            }
            float _1030 = _1020;
            _986 = _1030;
            if (_1012)
            {
                _962 = 0.0;
            }
            float _1032 = _962;
            bool _1034 = !_1004;
            _1036 = _1034 && _1006;
            _964 = _1032;
            _992 = _1032;
        }
        if ((!_1036) || _982)
        {
            _982 = false;
            float _1038 = _964;
            bool _1040 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1042 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1044 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1046 = _876;
            float _1048 = _1038;
            _986 = _956;
            _988 = _952;
            _990 = _954;
            if (_1040)
            {
                float _1050 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1046 = _1050;
            }
            float _1052 = _1046;
            if (_1040)
            {
                float _1054 = abs(_904);
                float _1056 = -_1054;
                float _1058 = _1056 + 1.0;
                _966 = _1058;
            }
            float _1060 = _966;
            if (_1042)
            {
                float _1062 = abs(_894);
                float _1064 = -_1062;
                float _1066 = _1064 + 1.0;
                _968 = _1066;
            }
            float _1068 = _968;
            if (!_1040)
            {
                _970 = 1.0;
            }
            float _1070 = _970;
            float _1072 = _1070;
            if (_1044)
            {
                float _1074 = abs(_918);
                float _1076 = -_1074;
                float _1078 = _1076 + 1.0;
                _972 = _1078;
            }
            float _1080 = _972;
            if (!_1042)
            {
                _974 = 1.0;
            }
            float _1082 = _974;
            float _1084 = _1082;
            if (!_1044)
            {
                _1048 = 1.0;
            }
            float _1086 = _1048;
            float _1088 = _938;
            float _1090 = _1086;
            if (_1042)
            {
                float _1092 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1088 = _1092;
            }
            float _1094 = _1088;
            float _1096 = _920;
            if (_1044)
            {
                float _1098 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1096 = _1098;
            }
            float _1100 = _1096;
            if (_1040)
            {
                float _1102 = _1060 * _1052;
                float _1104 = precise::clamp(_1102, 0.0, 1.0);
                _1072 = _1104;
            }
            float _1106 = _1072;
            if (_1042)
            {
                float _1108 = _1068 * _1094;
                float _1110 = precise::clamp(_1108, 0.0, 1.0);
                _1084 = _1110;
            }
            float _1112 = _1084;
            float _1114 = _1106 * _1112;
            if (_1044)
            {
                float _1116 = _1080 * _1100;
                float _1118 = precise::clamp(_1116, 0.0, 1.0);
                _1090 = _1118;
            }
            float _1120 = _1090;
            float _1122 = _1114 * _1120;
            _992 = _1122;
        }
    }
    _994 = false;
    float _1124 = _986;
    float _1126 = _988;
    float _1128 = _990;
    float _1130 = _992;
    float _1132 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1134 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1136 = floor(_1132);
    float _1138 = floor(_1134);
    float _1140 = -_1136;
    float _1142 = _1132 + _1140;
    float _1144 = -_1138;
    float _1146 = _1134 + _1144;
    float2 _4586 = float2(_1142, _1146);
    float _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4586, float2(0.0), isnan(_4586)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4586, float2(0.0), isnan(_4586)), level(0.0)).x;
    float _1150 = in.m_91.w;
    float _1152 = trunc(_1150);
    int _1154 = int(_1152);
    int _1156 = _1154 << 5;
    uint _1159 = uint(int(uint(_1156) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1159)];
    float _1161 = as_type<float>(_dmw0.x);
    int _1163 = _1156 + 4;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    float _1167 = as_type<float>(_dmw0.y);
    int _1169 = _1156 + 8;
    uint _1171 = uint(int(uint(_1169) >> uint(2)));
    float _1173 = as_type<float>(_dmw0.z);
    int _1175 = _1156 + 12;
    uint _1177 = uint(int(uint(_1175) >> uint(2)));
    float _1179 = as_type<float>(_dmw0.w);
    float _1181 = _948 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1185 = _1124 + _1183;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1189 = _1126 + _1187;
    float _1191 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1181);
    float _1193 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1191);
    float _1195 = _948 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1197 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1199 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1195);
    float _1201 = 1.0 / _1197;
    float _1203 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1199);
    float _1205 = _1203 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1207 = _1205 + _1197;
    float _1209 = _1207 * _1201;
    float _1211 = _1209 * 0.5;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1215 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1213);
    float _1217 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1219 = 1.0 / _1215;
    float _1221 = _948 + _1217;
    float _1223 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1225 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1227 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1223);
    float _1229 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1225);
    float _1231 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1227);
    float _1233 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1229);
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1237 = _1219 * _1235;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1241 = _1233 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1243 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1245 = trunc(_1239);
    int _1247 = int(_1245);
    bool _1249 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1251 = !_1243;
    int _1253 = _1251 ? 0 : 1;
    float _1255 = trunc(_1241);
    int _1257 = int(_1255);
    int _1259 = 2;
    float _1261 = _1126;
    float _1263 = _1124;
    float _1265 = _1241;
    if (!_1243)
    {
        _1259 = 1;
    }
    int _1267 = _1259;
    int _1269 = _1267;
    if (!_1249)
    {
        _1269 = _1253;
    }
    int _1271 = _1269;
    float _1273 = _1185 * _1185;
    int _1275 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1277 = _1247 + _1275;
    int _1279 = _1277 + 1;
    int _1281 = _1271 << 6;
    float _1283 = fma(_1189, _1189, _1273);
    bool _1285 = _1279 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1287 = _1281 + 48;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c15)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    float _1305 = sqrt(_1283);
    int _1307 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1309 = _1257 + _1307;
    int _1311 = _1309 + 1;
    int _1313 = _1279 | _1311;
    int _1315 = _1281 + 56;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    bool _1333 = _1313 < 0;
    bool _1335 = _1333 || _1285;
    bool _1337 = _1311 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1339 = _1337 || _1335;
    int _1341 = _1281 + 64;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    uint _1345 = uint(int(uint(int(_1343)) >> uint(2)));
    int _1347 = int(_1343) & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    int _1351 = int(_1343) + 1;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    int _1355 = _1351 & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    bool _1359 = _1305 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1361 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan(0.5);
    bool _1369 = _1365 || _1367;
    int _1371 = _1281 + 72;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    uint _1375 = uint(int(uint(int(_1373)) >> uint(2)));
    int _1377 = int(_1373) & 3;
    float _1379 = (*spvDescriptorSet0.vp_c15)._m0[int(_1375)][_1377];
    int _1381 = int(_1373) + 1;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    int _1385 = _1381 & 3;
    float _1387 = (*spvDescriptorSet0.vp_c15)._m0[int(_1383)][_1385];
    int _1389 = _1279;
    float _1391 = as_type<float>(_1271);
    if (!_1339)
    {
        int _1393 = _1311 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1395 = _1393 + _1279;
        _1389 = _1395;
    }
    int _1397 = _1389;
    int _1399 = _1281 + 96;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c15)._m0[int(_1411)][_1413];
    int _1417 = _1281 + 104;
    uint _1419 = uint(int(uint(_1417) >> uint(2)));
    uint _1421 = uint(int(uint(int(_1419)) >> uint(2)));
    int _1423 = int(_1419) & 3;
    float _1425 = (*spvDescriptorSet0.vp_c15)._m0[int(_1421)][_1423];
    int _1427 = int(_1419) + 1;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    int _1431 = _1427 & 3;
    float _1433 = (*spvDescriptorSet0.vp_c15)._m0[int(_1429)][_1431];
    float _1435 = _1179 * 2.0;
    float _1437 = _1161 * 2.0;
    float _1439 = _1167 * 2.0;
    float _1441 = _1173 * _1173;
    float _1443 = _1173 * _1435;
    float _1445 = _1167 * _1435;
    float _1447 = _1161 * _1435;
    float _1449 = _1161 * _1161;
    float _1451 = -_1443;
    float _1453 = fma(_1167, _1437, _1451);
    float _1455 = fma(_1173, _1437, _1445);
    float _1457 = fma(_1167, _1437, _1443);
    float _1459 = -_1445;
    float _1461 = fma(_1173, _1437, _1459);
    float _1463 = _1167 * _1167;
    int _1465 = as_type<int>(_1167);
    float _1467 = _1173;
    int _1469 = as_type<int>(_1439);
    if (!_1339)
    {
        int _1471 = _1397 << 2;
        _1465 = _1471;
    }
    int _1473 = _1465;
    float _1475 = -_1447;
    float _1477 = fma(_1173, _1439, _1475);
    float _1479 = fma(_1173, _1439, _1447);
    int _1481 = _1473;
    if (!_1359)
    {
        _1467 = _1126;
    }
    float _1483 = _1467;
    float _1485 = _1483;
    if (!_1339)
    {
        uint _1487 = uint(int(uint(_1397) >> uint(2)));
        _1469 = int(_1487);
    }
    int _1489 = _1469;
    float _1491 = as_type<float>(_1489);
    if (!_1339)
    {
        int _1493 = 12 & _1473;
        _1481 = _1493;
    }
    int _1495 = _1481;
    if (!_1359)
    {
        _1261 = _1128;
    }
    float _1497 = _1261;
    bool _1499 = !_1359;
    float _1501 = _1497;
    if (!_1499)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1507 = _1305 + _1505;
        float _1509 = rsqrt(_1283);
        float _1511 = _1507 * _1503;
        float _1513 = _1128 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1515 = _1511 * 0.15915493667125701904296875;
        float _1517 = _1515 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = _1515 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        float _1525 = fma(_1519, _1513, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1527 = _1509 * _1525;
        float _1529 = _1523 + (-1.0);
        float _1531 = fma(_1189, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1533 = fma(_1185, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1535 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = fma(_1523, _1128, _1535);
        _1485 = _1531;
        _1501 = _1537;
        _1263 = _1533;
    }
    float _1539 = _1485;
    float _1541 = _1501;
    float _1543 = _1263;
    if (!_1339)
    {
        int _1545 = _1489 << 4;
        int _1547 = _1545 + _1495;
        _1491 = as_type<float>(_1547);
    }
    float _1549 = _1491;
    float _1551 = fma(_1463, -2.0, 1.0);
    float _1553 = -_946;
    float _1555 = _1553 + _1539;
    float _1557 = fma(_1449, -2.0, 1.0);
    int _1559 = _1281 + 88;
    uint _1561 = uint(int(uint(_1559) >> uint(2)));
    uint _1563 = uint(int(uint(int(_1561)) >> uint(2)));
    int _1565 = int(_1561) & 3;
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[int(_1563)][_1565];
    int _1569 = int(_1561) + 1;
    uint _1571 = uint(int(uint(_1569) >> uint(2)));
    int _1573 = _1569 & 3;
    float _1575 = (*spvDescriptorSet0.vp_c15)._m0[int(_1571)][_1573];
    float _1577 = fma(_1441, -2.0, _1551);
    float _1579 = -_948;
    float _1581 = _1579 + _1541;
    float _1583 = fma(_1441, -2.0, _1557);
    float _1585 = fma(_1463, -2.0, _1557);
    float _1587 = -_950;
    float _1589 = _1587 + _1543;
    float _1591 = _1581 * _322;
    float _1593 = _1581 * _334;
    int _1595 = _1281 + 80;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    uint _1599 = uint(int(uint(int(_1597)) >> uint(2)));
    int _1601 = int(_1597) & 3;
    float _1603 = (*spvDescriptorSet0.vp_c15)._m0[int(_1599)][_1601];
    int _1605 = int(_1597) + 1;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    int _1609 = _1605 & 3;
    float _1611 = (*spvDescriptorSet0.vp_c15)._m0[int(_1607)][_1609];
    float _1613 = _1581 * _288;
    float _1615 = fma(_1555, _310, _1591);
    float _1617 = _1221 * _1415;
    float _1619 = fma(_1555, _330, _1593);
    float _1621 = _1221 * _1357;
    float _1623 = fma(_1589, _326, _1615);
    float _1625 = fma(_946, _1407, _1617);
    float _1627 = _1549;
    float _1629 = _1555;
    if (!_1339)
    {
        int _1631 = as_type<int>(_1549) + 400;
        uint _1633 = uint(int(uint(_1631) >> uint(2)));
        uint _1635 = uint(int(uint(int(_1633)) >> uint(2)));
        int _1637 = int(_1633) & 3;
        float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
        _1627 = _1639;
    }
    float _1641 = _1627;
    float _1643 = fma(_1555, _284, _1613);
    float _1645 = fma(_1589, _338, _1619);
    float _1647 = fma(_950, _1425, _1625);
    float _1649 = fma(_946, _1349, _1621);
    float _1651 = _1623 * _1453;
    float _1653 = _1623 * _1583;
    float _1655 = _1647 + _1433;
    float _1657 = fma(_1589, _292, _1643);
    float _1659 = _1623 * _1479;
    float _1661 = _1221 * _1303;
    float _1663 = _1407;
    if (!_1339)
    {
        float _1665 = floor(_1239);
        _1663 = _1665;
    }
    float _1667 = _1663;
    float _1669 = fma(_1657, _1577, _1651);
    float _1671 = fma(_1657, _1461, _1659);
    float _1673 = fma(_1657, _1457, _1653);
    float _1675 = fma(_946, _1295, _1661);
    float _1677 = fma(_1645, _1455, _1669);
    float _1679 = fma(_1645, _1585, _1671);
    float _1681 = fma(_1645, _1477, _1673);
    float _1683 = _1589;
    if (!_1339)
    {
        float _1685 = floor(_1241);
        _1683 = _1685;
    }
    float _1687 = _1683;
    float _1689 = fma(_950, _1323, _1675);
    float _1691 = _950 + _1679;
    float _1693 = fma(_950, _1379, _1649);
    float _1695 = _946 + _1677;
    float _1697 = _1689 + _1331;
    float _1699 = _948 + _1681;
    float _1701 = _1693 + _1387;
    float _1703 = 1.0 / _1655;
    float _1705 = _1689;
    float _1707 = _1699;
    float _1709 = _1695;
    float _1711 = _1693;
    if (_1369)
    {
        _1705 = _1691;
    }
    float _1713 = _1705;
    float _1715 = _1713;
    if (!_1369)
    {
        float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1719 = _948 + _1717;
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1723 = _946 + _1721;
        float _1725 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1727 = _1719 * _1719;
        float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1731 = _950 + _1729;
        float _1733 = fma(_1723, _1723, _1727);
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1737 = fma(_1731, _1731, _1733);
        float _1739 = sqrt(_1737);
        float _1741 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1743 = precise::min(_1739, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1745 = _1743 * _1735;
        float _1747 = _1741 * _1745;
        float _1749 = fma(_1681, _1747, _948);
        float _1751 = fma(_1677, _1747, _946);
        float _1753 = fma(_1679, _1747, _950);
        _1707 = _1749;
        _1709 = _1751;
        _1715 = _1753;
    }
    float _1755 = _1707;
    float _1757 = _1709;
    float _1759 = _1715;
    float _1761 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1765 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1767 = _1697 * _1703;
    float _1769 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1761);
    float _1771 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1763);
    float _1773 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1765);
    float _1775 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1777 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1769);
    float _1779 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1771);
    bool _1781 = _1767 >= 0.0;
    float _1783 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1773);
    float _1785 = _1777 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1787 = _1701 * _1703;
    if (!_1339)
    {
        float _1789 = rint(_1641);
        float _1791 = precise::max(_1789, 0.0);
        uint _1793 = uint(_1791);
        uint _1795 = clamp(_1793, 0u, 65535u);
        _1711 = as_type<float>(_1795);
    }
    float _1797 = _1711;
    float _1799 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1801 = _1767 <= 1.0;
    bool _1803 = _1801 && _1781;
    float _1805 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1775);
    float _1807 = _1783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1811 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1813 = _1787 >= 0.0;
    bool _1815 = _1813 && _1803;
    float _1817 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1805);
    float _1819 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1821 = -_1811;
    float _1823 = fma(_1821, _1809, 1.0);
    bool _1825 = _1787 <= 1.0;
    bool _1827 = _1825 && _1815;
    float _1829 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1831 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1819);
    float _1833 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1835 = _1833;
    float _1837 = _1799;
    if (!_1339)
    {
        float _1839 = -_1687;
        float _1841 = _1241 + _1839;
        _976 = _1841;
    }
    float _1843 = _976;
    float _1845 = log2(_1823);
    float _1847 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1831);
    float _1849 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1833);
    if (!_1339)
    {
        float _1851 = -_1667;
        float _1853 = _1239 + _1851;
        _1835 = _1853;
    }
    float _1855 = _1835;
    float _1857 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1847);
    float _1859 = _1221 * _1611;
    float _1861 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1827)
    {
        float _1863 = float(_1271);
        _1391 = _1863;
    }
    float _1865 = _1391;
    float _1867 = 1.0 / _1857;
    float _1869 = fma(_946, _1603, _1859);
    float _1871 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1861);
    float _1873 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1849);
    float _1875 = fma(_950, _1567, _1869);
    float _1877 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1871);
    float _1879 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1873);
    float _1881 = _1869;
    if (_1827)
    {
        float _1883 = rint(_1865);
        float _1885 = precise::max(_1883, 0.0);
        uint _1887 = uint(_1885);
        uint _1889 = clamp(_1887, 0u, 65535u);
        _1881 = as_type<float>(_1889);
    }
    float _1891 = _1881;
    float _1893 = _1875 + _1575;
    float _1895 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1877);
    float _1897 = _1845 * 0.693147182464599609375;
    float _1899 = _1893 * _1703;
    float _1901 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1903 = _1895 * _1867;
    float _1905 = _1879 * _1867;
    float _1907 = fma(_1903, 0.5, 0.5);
    float _1909 = fma(_1905, -0.5, 0.5);
    float _1911 = _1865;
    if (!_1339)
    {
        float3 _5865 = float3(_1855, _1843, float(as_type<int>(_1797)));
        float3 _5869 = select(_5865, float3(0.0), isnan(_5865));
        float _1913 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5869.xy, uint(rint(_5869.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5869.xy, uint(rint(_5869.z)), level(0.0)).x;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = _1687;
    if (_1827)
    {
        float3 _5884 = float3(_1767, _1787, float(as_type<int>(_1891)));
        float3 _5886 = select(_5884, float3(0.0), isnan(_5884));
        float _1919 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5886.xy, uint(rint(_5886.z)), _1899, level(0.0));
        _1917 = _1919;
    }
    float _1921 = _1917;
    float3 _5896 = float3(_1907, _1909, _1901);
    float _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5896, float3(0.0), isnan(_5896)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5896, float3(0.0), isnan(_5896)), level(0.0)).x;
    float3 _5905 = float3(_1907, _1909, _1901);
    float4 _1926 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5905, float3(0.0), isnan(_5905)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5905, float3(0.0), isnan(_5905)), level(0.0)).xyzw;
    float _1928 = _1926.x;
    float _1930 = _1926.y;
    float _1932 = _1926.z;
    float _1934 = _1926.w;
    float _1936 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1339)
    {
        _1265 = 1.0;
    }
    float _1938 = _1265;
    bool _1940 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.5);
    bool _1948 = _1944 || _1946;
    float _1950 = _1938;
    if (_1948)
    {
        _1936 = 1.0;
    }
    float _1952 = _1936;
    float _1954 = _1952;
    if (!_1948)
    {
        float _1956 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1958 = _1956 * 0.15915493667125701904296875;
        float _1960 = _1958 * 6.283185482025146484375;
        float _1962 = cos(_1960);
        float _1964 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1966 = _1964 * 0.15915493667125701904296875;
        float _1968 = _1958 * 6.283185482025146484375;
        float _1970 = sin(_1968);
        float _1972 = 1.0 / _1962;
        float _1974 = _1966 * 6.283185482025146484375;
        float _1976 = cos(_1974);
        float _1978 = _1970 * _1972;
        float _1980 = _1966 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        float _1984 = _1976 * _1978;
        float _1986 = 1.0 / _1984;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1990 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1988;
        float _1992 = 1.0 / _1990;
        float _1994 = _1982 * _1986;
        float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1998 = fma(_1237, _1994, _1996);
        float _2000 = _1998 * _1992;
        float _2002 = precise::clamp(_2000, 0.0, 1.0);
        _1954 = _2002;
    }
    float _2004 = _1954;
    if (!_1339)
    {
        int _2006 = _1397 << 4;
        int _2008 = _2006 + 2048;
        uint _2010 = uint(int(uint(_2008) >> uint(2)));
        uint _2012 = uint(int(uint(int(_2010)) >> uint(2)));
        int _2014 = int(_2010) & 3;
        float _2016 = (*spvDescriptorSet0.vp_c15)._m0[int(_2012)][_2014];
        int _2018 = int(_2010) + 1;
        uint _2020 = uint(int(uint(_2018) >> uint(2)));
        int _2022 = _2018 & 3;
        float _2024 = (*spvDescriptorSet0.vp_c15)._m0[int(_2020)][_2022];
        int _2026 = _2008 + 8;
        uint _2028 = uint(int(uint(_2026) >> uint(2)));
        uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
        int _2032 = int(_2028) & 3;
        float _2034 = (*spvDescriptorSet0.vp_c15)._m0[int(_2030)][_2032];
        int _2036 = int(_2028) + 1;
        uint _2038 = uint(int(uint(_2036) >> uint(2)));
        int _2040 = _2036 & 3;
        float _2042 = (*spvDescriptorSet0.vp_c15)._m0[int(_2038)][_2040];
        float _2044 = _1221 * _2024;
        float _2046 = fma(_946, _2016, _2044);
        float _2048 = fma(_950, _2034, _2046);
        float _2050 = _2048 + _2042;
        float _2052 = precise::clamp(_2050, 0.0, 1.0);
        float _2054 = -_2052;
        float _2056 = _2054 + _1915;
        float _2058 = fma(_2056, 500.0, 1.5);
        float _2060 = exp2(_2058);
        float _2062 = 0.0 + _2060;
        float _2064 = precise::clamp(_2062, 0.0, 1.0);
        _1950 = _2064;
    }
    float _2066 = _1950;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2070 = _1755 + _2068;
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2074 = _1757 + _2072;
    float _2076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2078 = _1759 + _2076;
    float _2080 = _2070 * _2070;
    float _2082 = fma(_2074, _2074, _2080);
    float _2084 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2086 = fma(_2078, _2078, _2082);
    float _2088 = rsqrt(_2086);
    float _2090 = sqrt(_2086);
    float _2092 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2094 = _2074 * _2092;
    float _2096 = _2078 * _2092;
    float _2098 = _2094 * _2094;
    float _2100 = _2096 * _2096;
    float _2102 = _2098 + _2100;
    float _2104 = sqrt(_2102);
    bool _2106 = _2104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2110 = _2104 + _2108;
    float _2112 = _1843;
    float _2114 = _2102;
    float _2116 = _2110;
    float _2118 = _2070;
    float _2120 = _2092;
    float _2122 = _2094;
    float _2124 = _2096;
    float _2126 = _2098;
    float _2128 = _2100;
    if (_2106)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2112 = _2130;
    }
    float _2132 = _2112;
    if (_2106)
    {
        float _2134 = rsqrt(_2102);
        _2114 = _2134;
    }
    float _2136 = _2114;
    if (_2106)
    {
        float _2138 = _2110 * _2132;
        _2116 = _2138;
    }
    float _2140 = _2116;
    float _2142 = precise::max(0.0, _2084);
    float _2144 = _2142;
    if (_2106)
    {
        float _2146 = _2140 * 0.15915493667125701904296875;
        _1629 = _2146;
    }
    float _2148 = _1629;
    float _2150 = -_2092;
    float _2152 = -_2142;
    float _2154 = fma(_2070, _2150, _2152);
    float _2156 = _1901;
    if (_2106)
    {
        float _2158 = _2148 * 6.283185482025146484375;
        float _2160 = sin(_2158);
        _2156 = _2160;
    }
    float _2162 = _2156;
    if (_2106)
    {
        float _2164 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2118 = _2164;
    }
    float _2166 = _2118;
    float _2168 = _2140;
    float _2170 = _2166;
    if (_2106)
    {
        float _2172 = _2148 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        _2168 = _2174;
    }
    float _2176 = _2168;
    if (_2106)
    {
        float _2178 = fma(_2162, _2166, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2170 = _2178;
    }
    float _2180 = _2170;
    float _2182 = _2180;
    if (_2106)
    {
        float _2184 = _2136 * _2180;
        _2144 = _2184;
    }
    float _2186 = _2144;
    if (!_2106)
    {
        _2182 = _2154;
    }
    float _2188 = _2182;
    float _2190 = _2188;
    if (_2106)
    {
        float _2192 = _2176 + (-1.0);
        _2120 = _2192;
    }
    float _2194 = _2120;
    float _2196 = _2194;
    if (_2106)
    {
        float _2198 = _2094 * _2186;
        _2122 = _2198;
    }
    float _2200 = _2122;
    if (_2106)
    {
        float _2202 = _2096 * _2186;
        _2124 = _2202;
    }
    float _2204 = _2124;
    if (_2106)
    {
        float _2206 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2196 = _2206;
    }
    float _2208 = _2196;
    if (_2106)
    {
        float _2210 = _2200 * _2200;
        _2126 = _2210;
    }
    float _2212 = _2126;
    if (_2106)
    {
        float _2214 = _2204 * _2204;
        _2128 = _2214;
    }
    float _2216 = _2128;
    if (_2106)
    {
        float _2218 = fma(_2154, _2176, _2208);
        _2190 = _2218;
    }
    float _2220 = _2190;
    float _2222 = fma(_2220, _2220, _2212);
    float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2226 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2224);
    float _2228 = precise::clamp(_2226, 0.0, 1.0);
    float _2230 = _2222 + _2216;
    float _2232 = -_2228;
    float _2234 = _2232 + 1.0;
    float _2236 = rsqrt(_2230);
    float _2238 = abs(_2234);
    float _2240 = log2(_2238);
    float _2242 = _2236 * _2200;
    float _2244 = _2236 * _2220;
    float _2246 = _2236 * _2204;
    float _2248 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2250 = -_2248;
    float _2252 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2250);
    float _2254 = -_2246;
    float _2256 = fma(_2254, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2252);
    float _2258 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2260 = fma(_2256, -0.5, 0.5);
    float _2262 = exp2(_2258);
    float _2264 = fma(_2256, 0.5, 0.5);
    float _2266 = fma(_2264, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2268 = sqrt(_2260);
    float _2270 = fma(_2264, _2266, -0.212114393711090087890625);
    float _2272 = _2244 + 1.0;
    float _2274 = fma(_2264, _2270, 1.570728778839111328125);
    float _2276 = -_2244;
    float _2278 = fma(_2262, _2272, _2276);
    float _2280 = _2268 * 0.636619746685028076171875;
    float _2282 = -_2274;
    float _2284 = fma(_2280, _2282, 1.0);
    float _2286 = fma(_2278, 0.5, 0.5);
    float2 _6445 = float2(_2284, _2286);
    float3 _2290 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6445, float2(0.0), isnan(_6445)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6445, float2(0.0), isnan(_6445)), level(0.0)).xyz;
    float _2292 = _2290.x;
    float _2294 = _2290.y;
    float _2296 = _2290.z;
    float _2298 = _1453 * _288;
    float _2300 = _1479 * _288;
    float _2302 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2312 = _2308 || _2310;
    float _2314 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2316 = fma(_1577, _284, _2298);
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2320 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2318);
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2324 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2322);
    float _2326 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2314);
    float _2328 = fma(_1461, _284, _2300);
    float _2330 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2320);
    float _2332 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2324);
    float _2334 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2336 = -_1148;
    float _2338 = _2336 + 1.0;
    float _2340 = _946 + _2330;
    float _2342 = _950 + _2332;
    float _2344 = _1583 * _288;
    float _2346 = _2234;
    if (_2312)
    {
        float _2348 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2346 = _2348;
    }
    float _2350 = _2346;
    float _2352 = abs(_1237);
    float _2354 = log2(_2352);
    float _2356 = -_2340;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2360 = -_2342;
    float _2362 = _2360 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2364 = fma(_1457, _284, _2344);
    float _2366 = _2350;
    float _2368 = _2362;
    if (_2312)
    {
        float _2370 = precise::min(_2350, 20.0);
        _2366 = _2370;
    }
    float _2372 = _2366;
    out.m_93.x = _1757;
    out.m_93.y = _1755;
    out.m_93.z = _1759;
    float _2374 = precise::min(_2340, _2358);
    float _2376 = fma(_1585, _292, _2328);
    float _2378 = _946;
    if (_2312)
    {
        float _2380 = 1.0 / _2372;
        _2378 = _2380;
    }
    float _2382 = _2378;
    float _2384 = precise::min(_2342, _2362);
    if (!_2312)
    {
        _2368 = 1.0;
    }
    float _2386 = _2368;
    float _2388 = precise::min(_2374, _2384);
    float _2390 = _834 * _1583;
    float _2392 = _846 * _1583;
    float _2394 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2396 = _834 * _1453;
    float _2398 = _846 * _1453;
    float _2400 = fma(_822, _1457, _2392);
    float _2402 = exp2(_2334);
    float _2404 = fma(_958, _1577, _2396);
    float _2406 = fma(_822, _1577, _2398);
    float _2408 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2326);
    float _2410 = _2386;
    if (_2312)
    {
        float _2412 = _2388 * _2382;
        float _2414 = precise::clamp(_2412, 0.0, 1.0);
        _2410 = _2414;
    }
    float _2416 = _2410;
    float _2418 = _846 * _1479;
    float _2420 = fma(_1455, _292, _2316);
    float _2422 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2408);
    float _2424 = exp2(_2394);
    float _2426 = _1130 * _2416;
    float _2428 = fma(_822, _1461, _2418);
    float _2430 = fma(_958, _1457, _2390);
    float _2432 = fma(_1477, _292, _2364);
    float _2434 = fma(_854, _1455, _2406);
    float _2436 = fma(_854, _1477, _2400);
    float _2438 = fma(_854, _1585, _2428);
    bool _2440 = _1237 <= 8000.0;
    bool _2442 = isnan(_1237);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan(8000.0);
    bool _2448 = _2444 || _2446;
    float _2450 = float(_2448);
    float _2452 = _2422 + _1857;
    float _2454 = _834 * _1479;
    out.m_95.x = _2434;
    out.m_95.y = _2436;
    out.m_95.z = _2438;
    float _2456 = _2452 * 0.5;
    float _2458 = fma(_960, _1455, _2404);
    float _2460 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2462 = precise::clamp(_2460, 0.0, 1.0);
    float _2464 = fma(_958, _1461, _2454);
    float _2466 = fma(_960, _1477, _2430);
    out.m_97.z = _2456;
    out.m_97.w = _1857;
    float _2468 = fma(_2462, -2.0, 3.0);
    float _2470 = _2462 * _2462;
    float _2472 = fma(_960, _1585, _2464);
    out.m_99.x = _2420;
    out.m_99.y = _2432;
    out.m_99.z = _2376;
    bool _2474 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2476 = isnan(_2090);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2482 = _2478 || _2480;
    float _2484 = _2470 * _2468;
    float _2486 = -_2402;
    float _2488 = _2486 + 1.0;
    float _2490 = _2434;
    float _2492 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (!_1827)
    {
        _2490 = 1.0;
    }
    float _2494 = _2490;
    out.gl_Position.x = _1895;
    out.gl_Position.y = _1879;
    out.gl_Position.z = _2422;
    out.gl_Position.w = _1857;
    float _2496 = -_2484;
    float _2498 = _2496 + 1.0;
    float _2500 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2502 = _2494;
    if (_1827)
    {
        bool _2504 = _1921 >= _1899;
        bool _2506 = isnan(_1921);
        bool _2508 = _2504 || _2506;
        bool _2510 = isnan(_1899);
        bool _2512 = _2508 || _2510;
        float _2514 = float(_2512);
        _2502 = _2514;
    }
    float _2516 = _2502;
    out.m_101.x = _2458;
    out.m_101.y = _2466;
    out.m_101.z = _2472;
    float _2518 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2484);
    float _2520 = _2500 * _1923;
    float _2522 = -_2500;
    float _2524 = _2522 + 1.0;
    float _2526 = _2516 * _2066;
    float _2528 = _2450 * _2518;
    float _2530 = _1934 * _2520;
    float _2532 = _2426 * _2004;
    float _2534 = _2524;
    float _2536 = _2520;
    if (!_2482)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2538 = _1837;
    float _2540 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2542 = _2540;
    float _2544 = _2538;
    float _2546 = _2538;
    if (!_2482)
    {
        _2492 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2548 = _2492;
    float _2550 = _2532 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2552 = _2338 * _2540;
    float _2554 = precise::clamp(_2552, 0.0, 1.0);
    float _2556 = _2548;
    float _2558 = _2548;
    if (!_2482)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2560 = _2542;
    float _2562 = -_2554;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2566 = -_2526;
    float _2568 = fma(_2566, _2564, 1.0);
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = _1934 * _2524;
    float _2574 = _2560;
    float _2576 = _2560;
    if (!_2482)
    {
        _2534 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2578 = _2534;
    float _2580 = _2570 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_103.x = _2580;
    float _2582 = _2580;
    float _2584 = _2578;
    float _2586 = _2578;
    if (!_2482)
    {
        _2582 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2588 = _2582;
    float _2590 = _2296 * _2520;
    float _2592 = fma(_2292, _2530, _1928);
    float _2594 = fma(_2294, _2530, _1930);
    float _2596 = _2588;
    float _2598 = _2588;
    if (!_2482)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2600 = _2536;
    float _2602 = fma(_1934, _2590, _1932);
    out.m_105.x = _2592;
    out.m_105.y = _2594;
    out.m_105.z = _2602;
    out.m_105.w = _2572;
    bool _2604 = !_2482;
    float _2606 = _2600;
    float _2608 = _2600;
    if (!_2604)
    {
        bool _2610 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2612 = isnan(_2090);
        bool _2614 = _2610 || _2612;
        bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2618 = _2614 || _2616;
        if (!_2618)
        {
            float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2622 = _2090 + _2620;
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2626 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2624;
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2632 = 1.0 / _2626;
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2650 = _2622 * _2632;
            float _2652 = precise::clamp(_2650, 0.0, 1.0);
            float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2658 = fma(_2652, _2630, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2660 = fma(_2652, _2656, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2662 = fma(_2652, _2636, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2664 = fma(_2652, _2640, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2666 = fma(_2652, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2668 = fma(_2652, _2648, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2608 = _2662;
            _2576 = _2666;
            _2546 = _2658;
            _2586 = _2664;
            _2558 = _2660;
            _2598 = _2668;
            _2670 = true;
        }
        else
        {
            bool _2672 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2674 = isnan(_2090);
            bool _2676 = _2672 || _2674;
            bool _2678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2680 = _2676 || _2678;
            if (!_2680)
            {
                _2544 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2682 = _2544;
            _2546 = _2682;
            if (!_2680)
            {
                _2606 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2684 = _2606;
            _2608 = _2684;
            if (!_2680)
            {
                _2556 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2686 = _2556;
            _2558 = _2686;
            if (!_2680)
            {
                _2584 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2688 = _2584;
            _2586 = _2688;
            if (!_2680)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2690 = _2574;
            _2576 = _2690;
            if (!_2680)
            {
                _2596 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2692 = _2596;
            bool _2694 = !_2680;
            _2598 = _2692;
            if (!_2694)
            {
                bool _2696 = _2090 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2698 = isnan(_2090);
                bool _2700 = _2696 || _2698;
                bool _2702 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2704 = _2700 || _2702;
                if (!_2704)
                {
                    float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2708 = _2090 + _2706;
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2712 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2710;
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2718 = 1.0 / _2712;
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2736 = _2708 * _2718;
                    float _2738 = precise::clamp(_2736, 0.0, 1.0);
                    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2744 = fma(_2738, _2716, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2746 = fma(_2738, _2742, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2748 = fma(_2738, _2722, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2750 = fma(_2738, _2726, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2752 = fma(_2738, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2754 = fma(_2738, _2734, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2608 = _2748;
                    _2576 = _2752;
                    _2546 = _2744;
                    _2586 = _2750;
                    _2558 = _2746;
                    _2598 = _2754;
                    _2670 = true;
                }
                else
                {
                    _2608 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2546 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2586 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2558 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2598 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2670 = false;
    float _2756 = _2608;
    float _2758 = _2576;
    float _2760 = _2546;
    float _2762 = _2586;
    float _2764 = _2558;
    float _2766 = _2598;
    float _2768 = fma(_2466, -0.5, 0.5);
    float _2770 = precise::clamp(_2768, 0.0, 1.0);
    float _2772 = -_2756;
    float _2774 = _2772 + _2758;
    float _2776 = _2550 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2778 = -_2760;
    float _2780 = _2778 + _2762;
    float _2782 = fma(_2770, _2774, _2756);
    out.m_107.x = 0.0;
    float _2784 = -_2764;
    float _2786 = _2784 + _2766;
    float _2788 = fma(_2770, _2780, _2760);
    float _2790 = _2782 * 0.586610972881317138671875;
    out.m_68.x = _2776;
    bool _2792 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2794 = fma(_2770, _2786, _2764);
    float _2796 = fma(_2788, 0.298911988735198974609375, _2790);
    bool _2798 = _2004 > 0.0;
    bool _2800 = isnan(_2004);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan(0.0);
    bool _2806 = _2802 || _2804;
    float _2808 = fma(_2794, 0.114477999508380889892578125, _2796);
    float _2810 = -_2808;
    float _2812 = _2788 + _2810;
    float _2814 = -_2808;
    float _2816 = _2782 + _2814;
    float _2818 = -_2808;
    float _2820 = _2794 + _2818;
    float _2822 = fma(_2812, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2808);
    float _2824 = fma(_2816, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2808);
    float _2826 = fma(_2820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2808);
    bool _2828 = !_2792;
    if (!_2828)
    {
        float _2830 = -_1755;
        float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2834 = -_1757;
        float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2838 = -_1759;
        float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2842 = _2832 * _2832;
        float _2844 = fma(_2836, _2836, _2842);
        float _2846 = fma(_2840, _2840, _2844);
        float _2848 = sqrt(_2846);
        float _2850 = rsqrt(_2846);
        float _2852 = -_2848;
        float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2856 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2858 = precise::clamp(_2856, 0.0, 1.0);
        float _2860 = _2836 * _2850;
        float _2862 = _2832 * _2850;
        float _2864 = abs(_2858);
        float _2866 = log2(_2864);
        float _2868 = _2840 * _2850;
        float _2870 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2872 = _2466 * _2862;
        float _2874 = -_2862;
        float _2876 = -_2870;
        float _2878 = fma(_2874, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2876);
        float _2880 = fma(_2458, _2860, _2872);
        float _2882 = -_2868;
        float _2884 = fma(_2882, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2878);
        float _2886 = fma(_2472, _2868, _2880);
        float _2888 = precise::clamp(_2886, 0.0, 1.0);
        float _2890 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2892 = _2884 + _2890;
        float _2894 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2896 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2898 = precise::clamp(_2896, 0.0, 1.0);
        float _2900 = exp2(_2894);
        float _2902 = _2900 * _2898;
        float _2904 = _2888 * _2902;
        float _2906 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2908 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2910 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2906;
        out.m_107.y = _2908;
        out.m_107.z = _2910;
    }
    out.m_109.x = _2822;
    out.m_109.y = _2824;
    out.m_109.z = _2826;
    if (_2806)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_68.x = 0.0;
    float _2912 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2912;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

