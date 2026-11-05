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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
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
    float4 m_85 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_101 [[user(locn7)]];
    float4 m_97 [[user(locn8)]];
    float4 m_99 [[user(locn9)]];
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
    float4 m_83 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2558 = false;
    bool _957 = false;
    bool _945 = false;
    bool _366 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_65.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_68.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_138);
        out.gl_Position.z = _2805;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_70.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_152)
    {
        float _158 = float(_122);
        _132 = _158;
    }
    float _160 = _132;
    bool _162 = _156 >= _160;
    bool _164 = !_152;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_68.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _140 = as_type<int>(_172);
    }
    int _174 = _140;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2874 = as_type<float>(_174);
        out.gl_Position.z = _2874;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_72.x;
    float _178 = in.m_72.y;
    float _180 = in.m_72.z;
    float _182 = in.m_74.x;
    float _184 = in.m_74.y;
    float _186 = in.m_74.z;
    float _188 = in.m_76.x;
    float _190 = in.m_76.y;
    float _192 = in.m_76.z;
    float _194 = in.m_78.x;
    float _196 = _176 * _176;
    float _198 = _178 * _178;
    float _200 = _180 * _180;
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = _208;
    if (_220)
    {
        float _226 = rsqrt(_208);
        _224 = _226;
    }
    float _228 = _224;
    float _230 = 0.0;
    if (!_220)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _218 > 0.0;
    float _236 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _238 = 0.0;
    float _240 = _232;
    if (!_220)
    {
        _238 = 0.0;
    }
    float _242 = _238;
    float _244 = 0.0;
    float _246 = _242;
    if (_222)
    {
        float _248 = rsqrt(_210);
        _244 = _248;
    }
    float _250 = _244;
    float _252 = 0.0;
    if (!_220)
    {
        _252 = 0.0;
    }
    float _254 = _252;
    float _256 = _236 * _194;
    float _258 = 0.0;
    float _260 = 0.0;
    float _262 = _254;
    if (!_222)
    {
        _258 = 0.0;
        _260 = 0.0;
    }
    float _264 = _258;
    float _266 = _260;
    float _268 = 0.0;
    float _270 = _266;
    float _272 = _264;
    if (!_222)
    {
        _268 = 0.0;
    }
    float _274 = _268;
    float _276 = _216;
    float _278 = _274;
    if (_234)
    {
        float _280 = rsqrt(_212);
        _276 = _280;
    }
    float _282 = _276;
    if (_220)
    {
        float _284 = _228 * _182;
        _240 = _284;
    }
    float _286 = _240;
    if (_220)
    {
        float _288 = _228 * _176;
        _246 = _288;
    }
    float _290 = _246;
    if (_220)
    {
        float _292 = _228 * _188;
        _262 = _292;
    }
    float _294 = _262;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _298 = 0.0;
    float _300 = 0.0;
    if (!_234)
    {
        _298 = 0.0;
        _300 = 0.0;
    }
    float _302 = _298;
    float _304 = _300;
    float _306 = 0.0;
    float _308 = _302;
    float _310 = _304;
    if (!_234)
    {
        _306 = 0.0;
    }
    float _312 = _306;
    float _314 = trunc(_256);
    int _316 = int(_314);
    float _318 = _312;
    if (_222)
    {
        float _320 = _250 * _184;
        _278 = _320;
    }
    float _322 = _278;
    if (_222)
    {
        float _324 = _250 * _178;
        _270 = _324;
    }
    float _326 = _270;
    if (_222)
    {
        float _328 = _250 * _190;
        _272 = _328;
    }
    float _330 = _272;
    if (_234)
    {
        float _332 = _282 * _186;
        _308 = _332;
    }
    float _334 = _308;
    if (_234)
    {
        float _336 = _282 * _180;
        _310 = _336;
    }
    float _338 = _310;
    if (_234)
    {
        float _340 = _282 * _192;
        _318 = _340;
    }
    float _342 = _318;
    int _344 = _316 << 4;
    int _346 = _344 + 1712;
    bool _348 = !_296;
    float _364;
    if (!_348)
    {
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _352 = _194 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_122);
        float _370 = 1.0 / _368;
        float _372 = _156 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_65.x;
    float _378 = in.m_65.y;
    float _380 = in.m_65.z;
    float _382 = in.m_78.y;
    float _384 = as_type<float>(int(gl_VertexIndex));
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _390 = in.m_78.z;
    float _392 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _386);
    float _394 = in.m_72.w;
    float _396 = in.m_74.w;
    float _398 = _184 * _378;
    float _400 = _178 * _378;
    float _402 = _190 * _378;
    float _404 = fma(_182, _376, _398);
    float _406 = fma(_176, _376, _400);
    float _408 = fma(_188, _376, _402);
    float _410 = fma(_180, _380, _406);
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _414 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _424 = fma(_414, -2.0, _416);
    float _426 = 1.0 / _420;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _430 = as_type<int>(_384) & 1;
    bool _432 = _430 != 0;
    int _434 = as_type<int>(_384) & 2;
    bool _436 = _434 != 0;
    float _438 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[79].z, _412);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _446 = _444 != 0;
    float _448 = -_428;
    float _450 = fma(_422, 2.0, _448);
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _454 = _452 != 0;
    float _456 = 1.0 / _442;
    float _458 = in.m_83.x;
    float _460 = in.m_83.y;
    float _462 = fma(_186, _380, _404);
    float _464 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].w, _388);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _470 = _194 > 0.5;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _478 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _480 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = 1.0 / _476;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _486;
    bool _490 = _382 > 0.5;
    out.m_85.x = _478;
    out.m_85.y = _480;
    out.m_85.z = _482;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _496 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[79].x, _438);
    float _498 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _392);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _500;
    float _504 = _488 * _456;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _508 = _374 + _506;
    float _510 = _496 * (-0.15915493667125701904296875);
    float _512 = _502 * _426;
    float _514 = -_498;
    float _516 = _514 + 1.0;
    float _518 = fma(_192, _380, _408);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _522 = _374 + _520;
    float _524 = -_156;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _450);
    bool _528 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_374);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    float _542 = fma(_504, _522, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _544 = _410 + _394;
    float _546 = _462 + _396;
    float _548 = _460 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _550 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _552 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = isnan(_374);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _566 = _374 + _564;
    float _568 = -_538;
    float _570 = _568 + 1.0;
    float _572 = _494 * _484;
    float _574 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _464);
    float _576 = fma(_512, _566, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _578 = _562 * _570;
    float _580 = in.m_76.w;
    bool _582 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _584 = isnan(_374);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_562;
    float _596 = _594 + 1.0;
    bool _598 = !_432;
    float _600 = _598 ? (-0.5) : 0.5;
    float _602 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _604 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _606 = isnan(_374);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _618 = !_436;
    float _620 = _618 ? (-0.5) : 0.5;
    float _622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _600);
    float _624 = _600 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _626 = _614 * _596;
    float _628 = fma(_572, _508, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _620);
    float _632 = _602 * _622;
    float _634 = -_620;
    int _636 = _490 ? as_type<int>(_634) : as_type<int>(_620);
    float _638 = _576 * _626;
    float _640 = _616 * _630;
    float _642 = -_600;
    int _644 = _470 ? as_type<int>(_642) : as_type<int>(_600);
    float _646 = _620 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _648 = !_454;
    float _650 = _648 ? _620 : as_type<float>(_636);
    float _652 = _640 * _330;
    bool _654 = !_446;
    float _656 = _654 ? _600 : as_type<float>(_644);
    float _658 = _646 * _330;
    float _660 = -_614;
    float _662 = _660 + 1.0;
    float _664 = _646 * _326;
    float _666 = _646 * _322;
    float _668 = fma(_624, _294, _658);
    float _670 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[115].x, _638);
    int _672 = _346 + 8;
    uint _675 = uint(int(uint(_672) >> uint(2)));
    uint _677 = uint(int(uint(int(_675)) >> uint(2)));
    int _679 = int(_675) & 3;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[int(_677)][_679];
    float _683 = _518 + _580;
    float _685 = fma(_624, _290, _664);
    float _687 = _640 * _322;
    float _689 = _640 * _326;
    float _691 = _544 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _693 = _510 * 6.283185482025146484375;
    float _695 = sin(_693);
    float _697 = fma(_624, _286, _666);
    uint _699 = uint(int(uint(_346) >> uint(2)));
    uint _701 = uint(int(uint(int(_699)) >> uint(2)));
    int _703 = int(_699) & 3;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[int(_701)][_703];
    int _707 = int(_699) + 1;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    int _711 = _707 & 3;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[int(_709)][_711];
    float _715 = -_592;
    float _717 = _715 + 1.0;
    float _719 = _546 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _721 = _691 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _723 = _683 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _725 = _538 * _717;
    float _727 = _510 * 6.283185482025146484375;
    float _729 = cos(_727);
    float _731 = fma(_719, (*spvDescriptorSet0.vp_c12)._m0[6].y, _721);
    float _733 = _691 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _735 = fma(_632, _286, _687);
    float _737 = fma(_632, _290, _689);
    float _739 = fma(_632, _294, _652);
    float _741 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[8].y, _731);
    float _743 = _691 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _745 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _747 = fma(_719, (*spvDescriptorSet0.vp_c12)._m0[6].x, _733);
    float _749 = _741 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _751 = fma(_719, (*spvDescriptorSet0.vp_c12)._m0[6].z, _743);
    float _753 = fma(_628, _578, _670);
    float _755 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[8].x, _747);
    float _757 = _650 * _695;
    float _759 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[8].z, _751);
    float _761 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _763 = _650 * _729;
    float _765 = _755 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _767 = -_757;
    float _769 = fma(_656, _729, _767);
    float _771 = _759 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _773 = fma(_656, _695, _763);
    float _775 = fma(_542, _725, _753);
    float _777 = -_574;
    float _779 = _777 + 1.0;
    float _781 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _783 = _749 * _745;
    float _785 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _787 = _697 + _334;
    float _789 = _685 + _338;
    float _791 = fma(_783, 0.5, 0.5);
    float _793 = _773 + (-0.5);
    float _795 = fma(_785, _338, _737);
    float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _799 = _765 * _761;
    float _801 = fma(_785, _334, _735);
    float _803 = fma(_785, _342, _739);
    float _805 = fma(_799, 0.5, 0.5);
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _809 = _771 * _781;
    float _811 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _813 = _713 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _815 = fma(_809, 0.5, 0.5);
    float _817 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = floor(_791);
    float _823 = _797 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _825 = _769 + 0.5;
    float _827 = -_823;
    float _829 = -_540;
    float _831 = fma(_827, _793, _829);
    float _833 = _668 + _342;
    float _835 = _807 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _837 = floor(_805);
    float _839 = fma(_773, _779, _831);
    float _841 = fma(_835, _825, _526);
    float _843 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[118].x, _775);
    float _845 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _847 = -_821;
    float _849 = _791 + _847;
    float _851 = floor(_815);
    float _853 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _843 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _857 = -_516;
    float _859 = fma(_769, _857, _841);
    float _861 = fma(_849, 2.0, -1.0);
    out.m_87.x = _817;
    out.m_87.y = _819;
    out.m_87.z = _853;
    out.m_87.w = _855;
    float _863 = -_837;
    float _865 = _805 + _863;
    float _867 = _861 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_89.x = _859;
    out.m_89.y = _839;
    float _869 = fma(_865, 2.0, -1.0);
    float _871 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _873 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _875 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _877 = -_851;
    float _879 = _815 + _877;
    float _881 = _869 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _883 = fma(_879, 2.0, -1.0);
    float _885 = fma(_881, (*spvDescriptorSet0.vp_c12)._m0[2].x, _871);
    float _887 = fma(_881, (*spvDescriptorSet0.vp_c12)._m0[2].y, _873);
    float _889 = _883 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _891 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _893 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _895 = _891 || _893;
    bool _897 = isnan(1.0);
    bool _899 = _895 || _897;
    float _901 = fma(_881, (*spvDescriptorSet0.vp_c12)._m0[2].z, _875);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].x, _885);
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].y, _887);
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].z, _901);
    float _909 = _903 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _911 = _905 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _913 = _907 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _915 = _801 + _909;
    float _917 = _795 + _911;
    float _919 = _803 + _913;
    float _921 = _881;
    float _923 = _821;
    float _925 = _881;
    float _927 = _821;
    float _929 = _869;
    float _931 = _861;
    float _933 = _819;
    float _935 = _883;
    float _937 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _939 = _911;
    float _949;
    float _951;
    float _953;
    float _955;
    if (!_899)
    {
        bool _941 = _911 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _943 = !_941;
        _945 = _943;
        if (!_945)
        {
            float _947 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _949 = 0.0;
            _951 = _947;
            _953 = 0.0;
            _955 = 0.0;
            _957 = true;
        }
    }
    if ((!_957) || _945)
    {
        bool _997;
        if (!_945)
        {
            bool _959 = _911 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _961 = isnan(_911);
            bool _963 = _959 || _961;
            bool _965 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _967 = _963 || _965;
            bool _969 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _971 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _973 = !_967;
            bool _975 = _971 && _973;
            float _977 = 0.0;
            if (_975)
            {
                _977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _979 = _977;
            float _981 = 0.0;
            float _983 = _979;
            if (_975)
            {
                _981 = 0.0;
            }
            float _985 = _981;
            _949 = _985;
            if (_975)
            {
                _921 = 0.0;
            }
            float _987 = _921;
            _925 = _987;
            _953 = _987;
            if (_975)
            {
                float _989 = _979 * 5.0;
                _983 = _989;
            }
            float _991 = _983;
            _951 = _991;
            if (_975)
            {
                _923 = 0.0;
            }
            float _993 = _923;
            bool _995 = !_967;
            _997 = _995 && _969;
            _927 = _993;
            _955 = _993;
        }
        if ((!_997) || _945)
        {
            _945 = false;
            float _999 = _925;
            float _1001 = _927;
            bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1005 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1007 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1009 = _853;
            float _1011 = _1001;
            _949 = _915;
            _951 = _919;
            if (_1003)
            {
                float _1013 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1009 = _1013;
            }
            float _1015 = _1009;
            if (_1003)
            {
                float _1017 = abs(_869);
                float _1019 = -_1017;
                float _1021 = _1019 + 1.0;
                _929 = _1021;
            }
            float _1023 = _929;
            if (_1005)
            {
                float _1025 = abs(_861);
                float _1027 = -_1025;
                float _1029 = _1027 + 1.0;
                _931 = _1029;
            }
            float _1031 = _931;
            if (!_1003)
            {
                _933 = 1.0;
            }
            float _1033 = _933;
            float _1035 = _1033;
            if (_1007)
            {
                float _1037 = abs(_883);
                float _1039 = -_1037;
                float _1041 = _1039 + 1.0;
                _935 = _1041;
            }
            float _1043 = _935;
            if (!_1005)
            {
                _937 = 1.0;
            }
            float _1045 = _937;
            float _1047 = _1045;
            if (!_1007)
            {
                _1011 = 1.0;
            }
            float _1049 = _1011;
            float _1051 = _999;
            float _1053 = _1049;
            if (_1005)
            {
                float _1055 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1051 = _1055;
            }
            float _1057 = _1051;
            float _1059 = _859;
            if (_1007)
            {
                float _1061 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1059 = _1061;
            }
            float _1063 = _1059;
            if (_1003)
            {
                float _1065 = _1023 * _1015;
                float _1067 = precise::clamp(_1065, 0.0, 1.0);
                _1035 = _1067;
            }
            float _1069 = _1035;
            if (_1005)
            {
                float _1071 = _1031 * _1057;
                float _1073 = precise::clamp(_1071, 0.0, 1.0);
                _1047 = _1073;
            }
            float _1075 = _1047;
            float _1077 = _1069 * _1075;
            _953 = _917;
            if (_1007)
            {
                float _1079 = _1043 * _1063;
                float _1081 = precise::clamp(_1079, 0.0, 1.0);
                _1053 = _1081;
            }
            float _1083 = _1053;
            float _1085 = _1077 * _1083;
            _955 = _1085;
        }
    }
    _957 = false;
    float _1087 = _949;
    float _1089 = _951;
    float _1091 = _953;
    float _1093 = _955;
    float _1095 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1097 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1099 = floor(_1095);
    float _1101 = floor(_1097);
    float _1103 = -_1099;
    float _1105 = _1095 + _1103;
    float _1107 = -_1101;
    float _1109 = _1097 + _1107;
    float2 _4364 = float2(_1105, _1109);
    float _1111 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4364, float2(0.0), isnan(_4364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4364, float2(0.0), isnan(_4364)), level(0.0)).x;
    float _1113 = in.m_91.w;
    float _1115 = trunc(_1113);
    int _1117 = int(_1115);
    int _1119 = _1117 << 5;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1121)];
    float _1123 = as_type<float>(_dmw0.x);
    int _1125 = _1119 + 4;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    float _1129 = as_type<float>(_dmw0.y);
    int _1131 = _1119 + 8;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    float _1135 = as_type<float>(_dmw0.z);
    int _1137 = _1119 + 12;
    uint _1139 = uint(int(uint(_1137) >> uint(2)));
    float _1141 = as_type<float>(_dmw0.w);
    float _1143 = _911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1147 = _1087 + _1145;
    float _1149 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1143);
    float _1151 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1149);
    float _1153 = _911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1155 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1157 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1159 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1153);
    float _1161 = _911 + _1155;
    float _1163 = 1.0 / _1157;
    float _1165 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1159);
    float _1167 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1169 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1171 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1173 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1167);
    float _1175 = _1169 + _1157;
    float _1177 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1171);
    float _1179 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1173);
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1089 + _1181;
    float _1185 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1177);
    float _1187 = _1179 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1189 = _1175 * _1163;
    float _1191 = _1189 * 0.5;
    float _1193 = _1183 * _1183;
    float _1195 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1197 = trunc(_1187);
    int _1199 = int(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1201);
    float _1205 = fma(_1147, _1147, _1193);
    float _1207 = 1.0 / _1203;
    float _1209 = trunc(_1195);
    int _1211 = int(_1209);
    int _1213 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1215 = _1199 + _1213;
    int _1217 = _1215 + 1;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1221 = _1207 * _1219;
    float _1223 = sqrt(_1205);
    bool _1225 = _1221 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1227 = _1221 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1229 = !_1225;
    int _1231 = _1229 ? 0 : 1;
    int _1233 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1235 = _1211 + _1233;
    int _1237 = _1235 + 1;
    int _1239 = _1237 | _1217;
    int _1241 = 2;
    int _1243 = _1237;
    float _1245 = _1091;
    float _1247 = _1205;
    if (!_1225)
    {
        _1241 = 1;
    }
    int _1249 = _1241;
    int _1251 = _1249;
    if (!_1227)
    {
        _1251 = _1231;
    }
    int _1253 = _1251;
    bool _1255 = _1237 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1257 = _1253 << 6;
    bool _1259 = _1239 < 0;
    bool _1261 = _1259 || _1255;
    int _1263 = _1257 + 48;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
    int _1269 = int(_1265) & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    int _1273 = int(_1265) + 1;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    int _1277 = _1273 & 3;
    float _1279 = (*spvDescriptorSet0.vp_c15)._m0[int(_1275)][_1277];
    bool _1281 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1283 = _1217 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1285 = _1283 || _1261;
    int _1287 = _1257 + 56;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c15)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    bool _1305 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(0.5);
    bool _1313 = _1309 || _1311;
    int _1315 = _1257 + 64;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    float _1333 = as_type<float>(_1253);
    if (!_1285)
    {
        int _1335 = _1217 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1337 = _1335 + _1237;
        _1243 = _1337;
    }
    int _1339 = _1243;
    int _1341 = _1257 + 72;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    uint _1345 = uint(int(uint(int(_1343)) >> uint(2)));
    int _1347 = int(_1343) & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    int _1351 = int(_1343) + 1;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    int _1355 = _1351 & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    int _1359 = _1257 + 96;
    uint _1361 = uint(int(uint(_1359) >> uint(2)));
    uint _1363 = uint(int(uint(int(_1361)) >> uint(2)));
    int _1365 = int(_1361) & 3;
    float _1367 = (*spvDescriptorSet0.vp_c15)._m0[int(_1363)][_1365];
    int _1369 = int(_1361) + 1;
    uint _1371 = uint(int(uint(_1369) >> uint(2)));
    int _1373 = _1369 & 3;
    float _1375 = (*spvDescriptorSet0.vp_c15)._m0[int(_1371)][_1373];
    int _1377 = _1257 + 104;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    uint _1381 = uint(int(uint(int(_1379)) >> uint(2)));
    int _1383 = int(_1379) & 3;
    float _1385 = (*spvDescriptorSet0.vp_c15)._m0[int(_1381)][_1383];
    int _1387 = int(_1379) + 1;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    int _1391 = _1387 & 3;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[int(_1389)][_1391];
    float _1395 = _1141 * 2.0;
    float _1397 = _1123 * 2.0;
    float _1399 = _1129 * 2.0;
    float _1401 = _1123 * _1123;
    float _1403 = _1135 * _1395;
    float _1405 = _1129 * _1395;
    float _1407 = _1123 * _1395;
    float _1409 = _1135 * _1135;
    float _1411 = -_1403;
    float _1413 = fma(_1129, _1397, _1411);
    float _1415 = fma(_1129, _1397, _1403);
    float _1417 = fma(_1135, _1397, _1405);
    float _1419 = -_1405;
    float _1421 = fma(_1135, _1397, _1419);
    float _1423 = -_1407;
    float _1425 = fma(_1135, _1399, _1423);
    float _1427 = fma(_1135, _1399, _1407);
    float _1429 = _1129 * _1129;
    int _1431 = as_type<int>(_1129);
    float _1433 = _1399;
    float _1435 = _1135;
    int _1437 = as_type<int>(_1123);
    if (!_1285)
    {
        int _1439 = _1339 << 2;
        _1431 = _1439;
    }
    int _1441 = _1431;
    int _1443 = _1441;
    if (!_1281)
    {
        _1433 = _1087;
    }
    float _1445 = _1433;
    float _1447 = _1445;
    if (!_1281)
    {
        _1435 = _1089;
    }
    float _1449 = _1435;
    float _1451 = _1449;
    if (!_1285)
    {
        uint _1453 = uint(int(uint(_1339) >> uint(2)));
        _1437 = int(_1453);
    }
    int _1455 = _1437;
    if (!_1285)
    {
        int _1457 = 12 & _1441;
        _1443 = _1457;
    }
    int _1459 = _1443;
    bool _1461 = !_1281;
    if (!_1461)
    {
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1467 = _1223 + _1465;
        float _1469 = _1091 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1471 = rsqrt(_1205);
        float _1473 = _1467 * _1463;
        float _1475 = _1473 * 0.15915493667125701904296875;
        float _1477 = _1475 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = _1475 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = fma(_1479, _1469, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1487 = _1471 * _1485;
        float _1489 = _1483 + (-1.0);
        float _1491 = fma(_1147, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1493 = fma(_1183, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1495 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1497 = fma(_1483, _1091, _1495);
        _1447 = _1491;
        _1245 = _1497;
        _1451 = _1493;
        _1247 = _1471;
    }
    float _1499 = _1447;
    float _1501 = _1245;
    float _1503 = _1451;
    float _1505 = _1247;
    float _1507 = _1505;
    if (!_1285)
    {
        int _1509 = _1455 << 4;
        int _1511 = _1509 + _1459;
        _1507 = as_type<float>(_1511);
    }
    float _1513 = _1507;
    float _1515 = -_909;
    float _1517 = _1515 + _1499;
    float _1519 = -_911;
    float _1521 = _1519 + _1501;
    int _1523 = _1257 + 88;
    uint _1525 = uint(int(uint(_1523) >> uint(2)));
    uint _1527 = uint(int(uint(int(_1525)) >> uint(2)));
    int _1529 = int(_1525) & 3;
    float _1531 = (*spvDescriptorSet0.vp_c15)._m0[int(_1527)][_1529];
    int _1533 = int(_1525) + 1;
    uint _1535 = uint(int(uint(_1533) >> uint(2)));
    int _1537 = _1533 & 3;
    float _1539 = (*spvDescriptorSet0.vp_c15)._m0[int(_1535)][_1537];
    float _1541 = fma(_1429, -2.0, 1.0);
    float _1543 = fma(_1401, -2.0, 1.0);
    float _1545 = _1521 * _290;
    float _1547 = _1521 * _326;
    float _1549 = fma(_1409, -2.0, _1541);
    float _1551 = fma(_1409, -2.0, _1543);
    float _1553 = fma(_1429, -2.0, _1543);
    int _1555 = _1257 + 80;
    uint _1557 = uint(int(uint(_1555) >> uint(2)));
    uint _1559 = uint(int(uint(int(_1557)) >> uint(2)));
    int _1561 = int(_1557) & 3;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
    int _1565 = int(_1557) + 1;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    int _1569 = _1565 & 3;
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[int(_1567)][_1569];
    float _1573 = _1161 * _1375;
    float _1575 = fma(_1517, _322, _1547);
    float _1577 = -_913;
    float _1579 = _1577 + _1503;
    float _1581 = _1521 * _338;
    float _1583 = fma(_909, _1367, _1573);
    float _1585 = fma(_1517, _286, _1545);
    float _1587 = fma(_1579, _330, _1575);
    float _1589 = _1513;
    if (!_1285)
    {
        int _1591 = as_type<int>(_1513) + 400;
        uint _1593 = uint(int(uint(_1591) >> uint(2)));
        uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
        int _1597 = int(_1593) & 3;
        float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
        _1589 = _1599;
    }
    float _1601 = _1589;
    float _1603 = fma(_913, _1385, _1583);
    float _1605 = fma(_1517, _334, _1581);
    float _1607 = fma(_1579, _294, _1585);
    float _1609 = _1587 * _1413;
    float _1611 = _1603 + _1393;
    float _1613 = fma(_1579, _342, _1605);
    float _1615 = _1587 * _1551;
    float _1617 = fma(_1607, _1549, _1609);
    float _1619 = _1375;
    if (!_1285)
    {
        float _1621 = floor(_1195);
        _1619 = _1621;
    }
    float _1623 = _1619;
    float _1625 = _1587 * _1427;
    float _1627 = _1161 * _1279;
    float _1629 = _1161 * _1331;
    float _1631 = fma(_1607, _1415, _1615);
    float _1633 = fma(_1607, _1421, _1625);
    float _1635 = fma(_909, _1271, _1627);
    float _1637 = fma(_909, _1323, _1629);
    float _1639 = _330;
    if (!_1285)
    {
        float _1641 = floor(_1187);
        _1639 = _1641;
    }
    float _1643 = _1639;
    float _1645 = fma(_1613, _1417, _1617);
    float _1647 = fma(_1613, _1425, _1631);
    float _1649 = fma(_1613, _1553, _1633);
    float _1651 = fma(_913, _1295, _1635);
    float _1653 = fma(_913, _1349, _1637);
    float _1655 = _909 + _1645;
    float _1657 = _911 + _1647;
    float _1659 = 1.0 / _1611;
    float _1661 = _913 + _1649;
    float _1663 = _1651 + _1303;
    float _1665 = _1653 + _1357;
    float _1667 = _1657;
    float _1669 = _1655;
    float _1671 = _1661;
    float _1673 = _1643;
    float _1675 = _1623;
    if (!_1313)
    {
        float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1679 = _911 + _1677;
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1683 = _909 + _1681;
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1687 = _1679 * _1679;
        float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1691 = _913 + _1689;
        float _1693 = fma(_1683, _1683, _1687);
        float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1697 = fma(_1691, _1691, _1693);
        float _1699 = sqrt(_1697);
        float _1701 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1703 = precise::min(_1699, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1705 = _1703 * _1695;
        float _1707 = _1701 * _1705;
        float _1709 = fma(_1647, _1707, _911);
        float _1711 = fma(_1645, _1707, _909);
        float _1713 = fma(_1649, _1707, _913);
        _1667 = _1709;
        _1669 = _1711;
        _1671 = _1713;
    }
    float _1715 = _1667;
    float _1717 = _1669;
    float _1719 = _1671;
    float _1721 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1723 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1725 = _1663 * _1659;
    float _1727 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1729 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1721);
    float _1731 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1733 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1723);
    bool _1735 = _1725 >= 0.0;
    float _1737 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1729);
    float _1739 = _1665 * _1659;
    float _1741 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1727);
    float _1743 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1731);
    float _1745 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1733);
    float _1747 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1749 = _1725 <= 1.0;
    bool _1751 = _1749 && _1735;
    float _1753 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1741);
    float _1755 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1757 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1759 = _1739 >= 0.0;
    bool _1761 = _1759 && _1751;
    float _1763 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1765 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1767 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1757);
    bool _1769 = _1739 <= 1.0;
    bool _1771 = _1769 && _1761;
    float _1773 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1775 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1777 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1779 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1767);
    float _1781 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1783 = -_1775;
    float _1785 = fma(_1783, _1773, 1.0);
    float _1787 = _1161 * _1571;
    float _1789 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1779);
    float _1791 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1793 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1781);
    float _1795 = fma(_909, _1563, _1787);
    float _1797 = log2(_1785);
    float _1799 = _1781;
    if (_1771)
    {
        float _1801 = float(_1253);
        _1799 = _1801;
    }
    float _1803 = _1799;
    float _1805 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1791);
    float _1807 = fma(_913, _1531, _1795);
    float _1809 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1793);
    if (!_1285)
    {
        float _1811 = -_1643;
        float _1813 = _1187 + _1811;
        _1673 = _1813;
    }
    float _1815 = _1673;
    float _1817 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1805);
    float _1819 = _1807 + _1539;
    float _1821 = 1.0 / _1789;
    float _1823 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1809);
    float _1825 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1817);
    float _1827 = _1825;
    if (!_1285)
    {
        float _1829 = -_1623;
        float _1831 = _1195 + _1829;
        _1675 = _1831;
    }
    float _1833 = _1675;
    float _1835 = _1819 * _1659;
    float _1837 = _1649;
    if (!_1285)
    {
        float _1839 = rint(_1601);
        float _1841 = precise::max(_1839, 0.0);
        uint _1843 = uint(_1841);
        uint _1845 = clamp(_1843, 0u, 65535u);
        _1837 = as_type<float>(_1845);
    }
    float _1847 = _1837;
    float _1849 = _1797 * 0.693147182464599609375;
    float _1851 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1853 = _1803;
    float _1855 = _1851;
    if (_1771)
    {
        float _1857 = rint(_1803);
        float _1859 = precise::max(_1857, 0.0);
        uint _1861 = uint(_1859);
        uint _1863 = clamp(_1861, 0u, 65535u);
        _1853 = as_type<float>(_1863);
    }
    float _1865 = _1853;
    float _1867 = _1823 * _1821;
    float _1869 = _1825 * _1821;
    float _1871 = fma(_1867, 0.5, 0.5);
    float _1873 = fma(_1869, -0.5, 0.5);
    float _1875 = _1815;
    if (!_1285)
    {
        float3 _5640 = float3(_1833, _1815, float(as_type<int>(_1847)));
        float3 _5644 = select(_5640, float3(0.0), isnan(_5640));
        float _1877 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5644.xy, uint(rint(_5644.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5644.xy, uint(rint(_5644.z)), level(0.0)).x;
        _1875 = _1877;
    }
    float _1879 = _1875;
    float _1881 = _1739;
    if (_1771)
    {
        float3 _5659 = float3(_1725, _1739, float(as_type<int>(_1865)));
        float3 _5661 = select(_5659, float3(0.0), isnan(_5659));
        float _1883 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5661.xy, uint(rint(_5661.z)), _1835, level(0.0));
        _1881 = _1883;
    }
    float _1885 = _1881;
    float3 _5671 = float3(_1871, _1873, _1851);
    float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5671, float3(0.0), isnan(_5671)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5671, float3(0.0), isnan(_5671)), level(0.0)).x;
    float3 _5680 = float3(_1871, _1873, _1851);
    float4 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5680, float3(0.0), isnan(_5680)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5680, float3(0.0), isnan(_5680)), level(0.0)).xyzw;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    float _1898 = _1890.w;
    float _1900 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1285)
    {
        _1333 = 1.0;
    }
    float _1902 = _1333;
    bool _1904 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.5);
    bool _1912 = _1908 || _1910;
    float _1914 = _1902;
    if (_1912)
    {
        _1900 = 1.0;
    }
    float _1916 = _1900;
    float _1918 = _1916;
    if (!_1912)
    {
        float _1920 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1922 = _1920 * 0.15915493667125701904296875;
        float _1924 = _1922 * 6.283185482025146484375;
        float _1926 = cos(_1924);
        float _1928 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1930 = _1928 * 0.15915493667125701904296875;
        float _1932 = _1922 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = 1.0 / _1926;
        float _1938 = _1930 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1934 * _1936;
        float _1944 = _1930 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = _1940 * _1942;
        float _1950 = 1.0 / _1948;
        float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1954 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1952;
        float _1956 = 1.0 / _1954;
        float _1958 = _1946 * _1950;
        float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1962 = fma(_1221, _1958, _1960);
        float _1964 = _1962 * _1956;
        float _1966 = precise::clamp(_1964, 0.0, 1.0);
        _1918 = _1966;
    }
    float _1968 = _1918;
    if (!_1285)
    {
        int _1970 = _1339 << 4;
        int _1972 = _1970 + 2048;
        uint _1974 = uint(int(uint(_1972) >> uint(2)));
        uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
        int _1978 = int(_1974) & 3;
        float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
        int _1982 = int(_1974) + 1;
        uint _1984 = uint(int(uint(_1982) >> uint(2)));
        int _1986 = _1982 & 3;
        float _1988 = (*spvDescriptorSet0.vp_c15)._m0[int(_1984)][_1986];
        int _1990 = _1972 + 8;
        uint _1992 = uint(int(uint(_1990) >> uint(2)));
        uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
        int _1996 = int(_1992) & 3;
        float _1998 = (*spvDescriptorSet0.vp_c15)._m0[int(_1994)][_1996];
        int _2000 = int(_1992) + 1;
        uint _2002 = uint(int(uint(_2000) >> uint(2)));
        int _2004 = _2000 & 3;
        float _2006 = (*spvDescriptorSet0.vp_c15)._m0[int(_2002)][_2004];
        float _2008 = _1161 * _1988;
        float _2010 = fma(_909, _1980, _2008);
        float _2012 = fma(_913, _1998, _2010);
        float _2014 = _2012 + _2006;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        float _2018 = -_2016;
        float _2020 = _2018 + _1879;
        float _2022 = fma(_2020, 500.0, 1.5);
        float _2024 = exp2(_2022);
        float _2026 = 0.0 + _2024;
        float _2028 = precise::clamp(_2026, 0.0, 1.0);
        _1914 = _2028;
    }
    float _2030 = _1914;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2034 = _1715 + _2032;
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2038 = _1717 + _2036;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _1719 + _2040;
    float _2044 = _2034 * _2034;
    float _2046 = fma(_2038, _2038, _2044);
    float _2048 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2050 = fma(_2042, _2042, _2046);
    float _2052 = precise::max(0.0, _2048);
    float _2054 = rsqrt(_2050);
    float _2056 = sqrt(_2050);
    float _2058 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2060 = _2038 * _2058;
    float _2062 = _2042 * _2058;
    float _2064 = -_2058;
    float _2066 = -_2052;
    float _2068 = fma(_2034, _2064, _2066);
    float _2070 = _2060 * _2060;
    float _2072 = _2062 * _2062;
    float _2074 = _2070 + _2072;
    float _2076 = sqrt(_2074);
    bool _2078 = _2076 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2082 = _2076 + _2080;
    float _2084 = _1879;
    float _2086 = _2052;
    float _2088 = _2074;
    float _2090 = _2082;
    float _2092 = _2034;
    float _2094 = _2060;
    float _2096 = _2070;
    float _2098 = _2072;
    if (_2078)
    {
        float _2100 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2084 = _2100;
    }
    float _2102 = _2084;
    if (_2078)
    {
        float _2104 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2086 = _2104;
    }
    float _2106 = _2086;
    float _2108 = _2106;
    if (_2078)
    {
        float _2110 = rsqrt(_2074);
        _2088 = _2110;
    }
    float _2112 = _2088;
    if (_2078)
    {
        float _2114 = _2082 * _2102;
        _2090 = _2114;
    }
    float _2116 = _2090;
    if (_2078)
    {
        float _2118 = _2116 * 0.15915493667125701904296875;
        _1855 = _2118;
    }
    float _2120 = _1855;
    float _2122 = _2102;
    if (_2078)
    {
        float _2124 = _2120 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        _2122 = _2126;
    }
    float _2128 = _2122;
    float _2130 = _2116;
    if (_2078)
    {
        float _2132 = _2120 * 6.283185482025146484375;
        float _2134 = cos(_2132);
        _2130 = _2134;
    }
    float _2136 = _2130;
    float _2138 = _2128;
    if (_2078)
    {
        float _2140 = fma(_2128, _2106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2138 = _2140;
    }
    float _2142 = _2138;
    float _2144 = _2142;
    if (!_2078)
    {
        _2108 = _2068;
    }
    float _2146 = _2108;
    float _2148 = _2146;
    if (_2078)
    {
        float _2150 = _2112 * _2142;
        _939 = _2150;
    }
    float _2152 = _939;
    if (_2078)
    {
        float _2154 = _2136 + (-1.0);
        _2092 = _2154;
    }
    float _2156 = _2092;
    float _2158 = _2156;
    if (_2078)
    {
        float _2160 = _2060 * _2152;
        _2094 = _2160;
    }
    float _2162 = _2094;
    if (_2078)
    {
        float _2164 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2164;
    }
    float _2166 = _2144;
    if (!_2078)
    {
        _2158 = _2062;
    }
    float _2168 = _2158;
    float _2170 = _2168;
    if (_2078)
    {
        float _2172 = _2062 * _2152;
        _2170 = _2172;
    }
    float _2174 = _2170;
    if (_2078)
    {
        float _2176 = _2162 * _2162;
        _2096 = _2176;
    }
    float _2178 = _2096;
    if (_2078)
    {
        float _2180 = fma(_2068, _2136, _2166);
        _2148 = _2180;
    }
    float _2182 = _2148;
    if (_2078)
    {
        float _2184 = _2174 * _2174;
        _2098 = _2184;
    }
    float _2186 = _2098;
    float _2188 = fma(_2182, _2182, _2178);
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2192 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2190);
    float _2194 = precise::clamp(_2192, 0.0, 1.0);
    float _2196 = _2188 + _2186;
    float _2198 = -_2194;
    float _2200 = _2198 + 1.0;
    float _2202 = rsqrt(_2196);
    float _2204 = abs(_2200);
    float _2206 = log2(_2204);
    float _2208 = _2202 * _2162;
    float _2210 = _2202 * _2182;
    float _2212 = _2202 * _2174;
    float _2214 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2216 = -_2214;
    float _2218 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2216);
    float _2220 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2222 = -_2212;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2218);
    float _2226 = exp2(_2220);
    float _2228 = fma(_2224, -0.5, 0.5);
    float _2230 = fma(_2224, 0.5, 0.5);
    float _2232 = _2210 + 1.0;
    float _2234 = fma(_2230, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2236 = sqrt(_2228);
    float _2238 = fma(_2230, _2234, -0.212114393711090087890625);
    float _2240 = -_2210;
    float _2242 = fma(_2226, _2232, _2240);
    float _2244 = fma(_2230, _2238, 1.570728778839111328125);
    float _2246 = fma(_2242, 0.5, 0.5);
    float _2248 = _2236 * 0.636619746685028076171875;
    float _2250 = -_2244;
    float _2252 = fma(_2248, _2250, 1.0);
    float2 _6226 = float2(_2252, _2246);
    float3 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6226, float2(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6226, float2(0.0), isnan(_6226)), level(0.0)).xyz;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    bool _2264 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2266 = isnan(0.0);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2272 = _2268 || _2270;
    float _2274 = _789 * _1427;
    float _2276 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2278 = -_1111;
    float _2280 = _2278 + 1.0;
    float _2282 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _2284 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2276);
    float _2286 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2288 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2286);
    float _2290 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2292 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2290);
    float _2294 = _2210;
    if (_2272)
    {
        float _2296 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = abs(_1221);
    float _2302 = log2(_2300);
    float _2304 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2288);
    float _2306 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2292);
    float _2308 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2284);
    float _2310 = _2298;
    if (_2272)
    {
        float _2312 = precise::min(_2298, 20.0);
        _2310 = _2312;
    }
    float _2314 = _2310;
    float _2316 = _909 + _2304;
    float _2318 = _913 + _2306;
    float _2320 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2308);
    float _2322 = _913;
    if (_2272)
    {
        float _2324 = 1.0 / _2314;
        _2322 = _2324;
    }
    float _2326 = _2322;
    float _2328 = -_2316;
    float _2330 = _2328 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2332 = -_2318;
    float _2334 = _2332 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2336 = _1221 <= 8000.0;
    bool _2338 = isnan(_1221);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(8000.0);
    bool _2344 = _2340 || _2342;
    float _2346 = float(_2344);
    out.gl_Position.x = _1823;
    out.gl_Position.y = _1825;
    out.gl_Position.z = _2320;
    out.gl_Position.w = _1789;
    float _2348 = precise::min(_2316, _2330);
    float _2350 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2352 = precise::min(_2318, _2334);
    float _2354 = _2334;
    if (!_2272)
    {
        _2354 = 1.0;
    }
    float _2356 = _2354;
    float _2358 = precise::min(_2348, _2352);
    float _2360 = exp2(_2350);
    float _2362 = _2356;
    if (_2272)
    {
        float _2364 = _2358 * _2326;
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        _2362 = _2366;
    }
    float _2368 = _2362;
    float _2370 = _789 * _1413;
    if (!_1771)
    {
        _1827 = 1.0;
    }
    float _2372 = _1827;
    float _2374 = _1093 * _2368;
    float _2376 = _789 * _1551;
    float _2378 = fma(_787, _1549, _2370);
    float _2380 = _2320 + _1789;
    float _2382 = fma(_787, _1415, _2376);
    float _2384 = fma(_787, _1421, _2274);
    float _2386 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2388 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2390 = precise::clamp(_2388, 0.0, 1.0);
    float _2392 = _2372;
    if (_1771)
    {
        bool _2394 = _1885 >= _1835;
        bool _2396 = isnan(_1885);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan(_1835);
        bool _2402 = _2398 || _2400;
        float _2404 = float(_2402);
        _2392 = _2404;
    }
    float _2406 = _2392;
    float _2408 = fma(_833, _1417, _2378);
    float _2410 = _2380 * 0.5;
    float _2412 = fma(_2390, -2.0, 3.0);
    float _2414 = _2390 * _2390;
    float _2416 = exp2(_2386);
    float _2418 = _2406 * _2030;
    float _2420 = fma(_833, _1425, _2382);
    float _2422 = _2414 * _2412;
    float _2424 = fma(_833, _1553, _2384);
    out.m_93.z = _2410;
    out.m_93.w = _1789;
    bool _2426 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2428 = isnan(_2056);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2434 = _2430 || _2432;
    float _2436 = -_2422;
    float _2438 = _2436 + 1.0;
    float _2440 = _2374 * _1968;
    out.m_95.x = _2408;
    out.m_95.y = _2420;
    out.m_95.z = _2424;
    float _2442 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2422);
    float _2444 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2446 = _2346 * _2442;
    float _2448 = -_2416;
    float _2450 = _2448 + 1.0;
    float _2452 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2456 = _2280 * _2452;
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = _2454 * _1887;
    float _2462 = -_2454;
    float _2464 = _2462 + 1.0;
    float _2466 = -_2458;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2470 = _1898 * _2460;
    float _2472 = _1898 * _2464;
    float _2474 = _2464;
    float _2476 = _2470;
    if (!_2434)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2478 = _2474;
    float _2480 = -_2418;
    float _2482 = fma(_2480, _2468, 1.0);
    float _2484 = precise::clamp(_2482, 0.0, 1.0);
    float _2486 = _2484 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2488 = _2484;
    float _2490 = _2478;
    float _2492 = _2478;
    if (!_2434)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2494 = _2488;
    out.m_97.x = _2486;
    float _2496 = _2262 * _2460;
    float _2498 = fma(_2258, _2470, _1892);
    float _2500 = fma(_2260, _2470, _1894);
    float _2502 = _2494;
    float _2504 = _2494;
    if (!_2434)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2506 = _2476;
    float _2508 = fma(_1898, _2496, _1896);
    out.m_99.x = _2498;
    out.m_99.y = _2500;
    out.m_99.z = _2508;
    out.m_99.w = _2472;
    bool _2510 = !_2434;
    float _2512 = _2506;
    float _2514 = _2506;
    if (!_2510)
    {
        bool _2516 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2518 = isnan(_2056);
        bool _2520 = _2516 || _2518;
        bool _2522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2524 = _2520 || _2522;
        if (!_2524)
        {
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2528 = _2056 + _2526;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2532 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2530;
            float _2534 = 1.0 / _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2544 = _2528 * _2534;
            float _2546 = precise::clamp(_2544, 0.0, 1.0);
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2552 = fma(_2546, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2554 = fma(_2546, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2556 = fma(_2546, _2538, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2504 = _2556;
            _2514 = _2554;
            _2492 = _2552;
            _2558 = true;
        }
        else
        {
            bool _2560 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2562 = isnan(_2056);
            bool _2564 = _2560 || _2562;
            bool _2566 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2568 = _2564 || _2566;
            if (!_2568)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2570 = _2512;
            _2514 = _2570;
            if (!_2568)
            {
                _2502 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2572 = _2502;
            _2504 = _2572;
            if (!_2568)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2574 = _2490;
            bool _2576 = !_2568;
            _2492 = _2574;
            if (!_2576)
            {
                bool _2578 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2580 = isnan(_2056);
                bool _2582 = _2578 || _2580;
                bool _2584 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2586 = _2582 || _2584;
                if (!_2586)
                {
                    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2590 = _2056 + _2588;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2592;
                    float _2596 = 1.0 / _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2606 = _2590 * _2596;
                    float _2608 = precise::clamp(_2606, 0.0, 1.0);
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2614 = fma(_2608, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2616 = fma(_2608, _2612, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2618 = fma(_2608, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2504 = _2618;
                    _2514 = _2616;
                    _2492 = _2614;
                    _2558 = true;
                }
                else
                {
                    _2504 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2558 = false;
    float _2620 = _2504;
    float _2622 = _2514;
    float _2624 = _2492;
    float _2626 = _2444 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_101.x = 0.0;
    float _2628 = _2620 * 0.586610972881317138671875;
    bool _2630 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_68.x = _2626;
    float _2632 = fma(_2622, 0.298911988735198974609375, _2628);
    bool _2634 = _1968 > 0.0;
    bool _2636 = isnan(_1968);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan(0.0);
    bool _2642 = _2638 || _2640;
    float _2644 = fma(_2624, 0.114477999508380889892578125, _2632);
    float _2646 = -_2644;
    float _2648 = _2646 + _2622;
    float _2650 = -_2644;
    float _2652 = _2650 + _2620;
    float _2654 = -_2644;
    float _2656 = _2654 + _2624;
    float _2658 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2660 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2662 = fma(_2656, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    bool _2664 = !_2630;
    if (!_2664)
    {
        float _2666 = -_1715;
        float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2670 = -_1717;
        float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2674 = -_1719;
        float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2678 = _2668 * _2668;
        float _2680 = fma(_2672, _2672, _2678);
        float _2682 = fma(_2676, _2676, _2680);
        float _2684 = sqrt(_2682);
        float _2686 = rsqrt(_2682);
        float _2688 = -_2684;
        float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2692 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2694 = precise::clamp(_2692, 0.0, 1.0);
        float _2696 = _2672 * _2686;
        float _2698 = _2668 * _2686;
        float _2700 = abs(_2694);
        float _2702 = log2(_2700);
        float _2704 = _2676 * _2686;
        float _2706 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2708 = _2420 * _2698;
        float _2710 = -_2698;
        float _2712 = -_2706;
        float _2714 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2712);
        float _2716 = fma(_2408, _2696, _2708);
        float _2718 = -_2704;
        float _2720 = fma(_2718, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2714);
        float _2722 = fma(_2424, _2704, _2716);
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2728 = _2720 + _2726;
        float _2730 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2732 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2734 = precise::clamp(_2732, 0.0, 1.0);
        float _2736 = exp2(_2730);
        float _2738 = _2736 * _2734;
        float _2740 = _2724 * _2738;
        float _2742 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2744 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2746 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2742;
        out.m_101.y = _2744;
        out.m_101.z = _2746;
    }
    out.m_103.x = _2658;
    out.m_103.y = _2660;
    out.m_103.z = _2662;
    if (_2642)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_68.x = 0.0;
    float _2748 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2748;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2558 = false;
    bool _957 = false;
    bool _945 = false;
    bool _366 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_65.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_68.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_138);
        out.gl_Position.z = _2805;
    }
    if (!_126)
    {
        return out;
    }
    float _142 = in.m_70.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_152)
    {
        float _158 = float(_122);
        _132 = _158;
    }
    float _160 = _132;
    bool _162 = _156 >= _160;
    bool _164 = !_152;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_68.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _140 = as_type<int>(_172);
    }
    int _174 = _140;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2874 = as_type<float>(_174);
        out.gl_Position.z = _2874;
    }
    if (_166)
    {
        return out;
    }
    float _176 = in.m_72.x;
    float _178 = in.m_72.y;
    float _180 = in.m_72.z;
    float _182 = in.m_74.x;
    float _184 = in.m_74.y;
    float _186 = in.m_74.z;
    float _188 = in.m_76.x;
    float _190 = in.m_76.y;
    float _192 = in.m_76.z;
    float _194 = in.m_78.x;
    float _196 = _176 * _176;
    float _198 = _178 * _178;
    float _200 = _180 * _180;
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = _208;
    if (_220)
    {
        float _226 = rsqrt(_208);
        _224 = _226;
    }
    float _228 = _224;
    float _230 = 0.0;
    if (!_220)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _218 > 0.0;
    float _236 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _238 = 0.0;
    float _240 = _232;
    if (!_220)
    {
        _238 = 0.0;
    }
    float _242 = _238;
    float _244 = 0.0;
    float _246 = _242;
    if (_222)
    {
        float _248 = rsqrt(_210);
        _244 = _248;
    }
    float _250 = _244;
    float _252 = 0.0;
    if (!_220)
    {
        _252 = 0.0;
    }
    float _254 = _252;
    float _256 = _236 * _194;
    float _258 = 0.0;
    float _260 = 0.0;
    float _262 = _254;
    if (!_222)
    {
        _258 = 0.0;
        _260 = 0.0;
    }
    float _264 = _258;
    float _266 = _260;
    float _268 = 0.0;
    float _270 = _266;
    float _272 = _264;
    if (!_222)
    {
        _268 = 0.0;
    }
    float _274 = _268;
    float _276 = _216;
    float _278 = _274;
    if (_234)
    {
        float _280 = rsqrt(_212);
        _276 = _280;
    }
    float _282 = _276;
    if (_220)
    {
        float _284 = _228 * _182;
        _240 = _284;
    }
    float _286 = _240;
    if (_220)
    {
        float _288 = _228 * _176;
        _246 = _288;
    }
    float _290 = _246;
    if (_220)
    {
        float _292 = _228 * _188;
        _262 = _292;
    }
    float _294 = _262;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _298 = 0.0;
    float _300 = 0.0;
    if (!_234)
    {
        _298 = 0.0;
        _300 = 0.0;
    }
    float _302 = _298;
    float _304 = _300;
    float _306 = 0.0;
    float _308 = _302;
    float _310 = _304;
    if (!_234)
    {
        _306 = 0.0;
    }
    float _312 = _306;
    float _314 = trunc(_256);
    int _316 = int(_314);
    float _318 = _312;
    if (_222)
    {
        float _320 = _250 * _184;
        _278 = _320;
    }
    float _322 = _278;
    if (_222)
    {
        float _324 = _250 * _178;
        _270 = _324;
    }
    float _326 = _270;
    if (_222)
    {
        float _328 = _250 * _190;
        _272 = _328;
    }
    float _330 = _272;
    if (_234)
    {
        float _332 = _282 * _186;
        _308 = _332;
    }
    float _334 = _308;
    if (_234)
    {
        float _336 = _282 * _180;
        _310 = _336;
    }
    float _338 = _310;
    if (_234)
    {
        float _340 = _282 * _192;
        _318 = _340;
    }
    float _342 = _318;
    int _344 = _316 << 4;
    int _346 = _344 + 1712;
    bool _348 = !_296;
    float _364;
    if (!_348)
    {
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _352 = _194 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_122);
        float _370 = 1.0 / _368;
        float _372 = _156 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_65.x;
    float _378 = in.m_65.y;
    float _380 = in.m_65.z;
    float _382 = in.m_78.y;
    float _384 = as_type<float>(int(gl_VertexIndex));
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _390 = in.m_78.z;
    float _392 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _386);
    float _394 = in.m_72.w;
    float _396 = in.m_74.w;
    float _398 = _184 * _378;
    float _400 = _178 * _378;
    float _402 = _190 * _378;
    float _404 = fma(_182, _376, _398);
    float _406 = fma(_176, _376, _400);
    float _408 = fma(_188, _376, _402);
    float _410 = fma(_180, _380, _406);
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _414 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _424 = fma(_414, -2.0, _416);
    float _426 = 1.0 / _420;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _430 = as_type<int>(_384) & 1;
    bool _432 = _430 != 0;
    int _434 = as_type<int>(_384) & 2;
    bool _436 = _434 != 0;
    float _438 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[79].z, _412);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _446 = _444 != 0;
    float _448 = -_428;
    float _450 = fma(_422, 2.0, _448);
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _454 = _452 != 0;
    float _456 = 1.0 / _442;
    float _458 = in.m_83.x;
    float _460 = in.m_83.y;
    float _462 = fma(_186, _380, _404);
    float _464 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].w, _388);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _470 = _194 > 0.5;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _478 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _480 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = 1.0 / _476;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _486;
    bool _490 = _382 > 0.5;
    out.m_85.x = _478;
    out.m_85.y = _480;
    out.m_85.z = _482;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _496 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[79].x, _438);
    float _498 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _392);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _500;
    float _504 = _488 * _456;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _508 = _374 + _506;
    float _510 = _496 * (-0.15915493667125701904296875);
    float _512 = _502 * _426;
    float _514 = -_498;
    float _516 = _514 + 1.0;
    float _518 = fma(_192, _380, _408);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _522 = _374 + _520;
    float _524 = -_156;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _450);
    bool _528 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_374);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    float _542 = fma(_504, _522, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _544 = _410 + _394;
    float _546 = _462 + _396;
    float _548 = _460 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _550 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _552 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = isnan(_374);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _566 = _374 + _564;
    float _568 = -_538;
    float _570 = _568 + 1.0;
    float _572 = _494 * _484;
    float _574 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _464);
    float _576 = fma(_512, _566, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _578 = _562 * _570;
    float _580 = in.m_76.w;
    bool _582 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _584 = isnan(_374);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_562;
    float _596 = _594 + 1.0;
    bool _598 = !_432;
    float _600 = _598 ? (-0.5) : 0.5;
    float _602 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _604 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _606 = isnan(_374);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _618 = !_436;
    float _620 = _618 ? (-0.5) : 0.5;
    float _622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _600);
    float _624 = _600 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _626 = _614 * _596;
    float _628 = fma(_572, _508, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _620);
    float _632 = _602 * _622;
    float _634 = -_620;
    int _636 = _490 ? as_type<int>(_634) : as_type<int>(_620);
    float _638 = _576 * _626;
    float _640 = _616 * _630;
    float _642 = -_600;
    int _644 = _470 ? as_type<int>(_642) : as_type<int>(_600);
    float _646 = _620 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _648 = !_454;
    float _650 = _648 ? _620 : as_type<float>(_636);
    float _652 = _640 * _330;
    bool _654 = !_446;
    float _656 = _654 ? _600 : as_type<float>(_644);
    float _658 = _646 * _330;
    float _660 = -_614;
    float _662 = _660 + 1.0;
    float _664 = _646 * _326;
    float _666 = _646 * _322;
    float _668 = fma(_624, _294, _658);
    float _670 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[115].x, _638);
    int _672 = _346 + 8;
    uint _675 = uint(int(uint(_672) >> uint(2)));
    uint _677 = uint(int(uint(int(_675)) >> uint(2)));
    int _679 = int(_675) & 3;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[int(_677)][_679];
    float _683 = _518 + _580;
    float _685 = fma(_624, _290, _664);
    float _687 = _640 * _322;
    float _689 = _640 * _326;
    float _691 = _544 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _693 = _510 * 6.283185482025146484375;
    float _695 = sin(_693);
    float _697 = fma(_624, _286, _666);
    uint _699 = uint(int(uint(_346) >> uint(2)));
    uint _701 = uint(int(uint(int(_699)) >> uint(2)));
    int _703 = int(_699) & 3;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[int(_701)][_703];
    int _707 = int(_699) + 1;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    int _711 = _707 & 3;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[int(_709)][_711];
    float _715 = -_592;
    float _717 = _715 + 1.0;
    float _719 = _546 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _721 = _691 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _723 = _683 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _725 = _538 * _717;
    float _727 = _510 * 6.283185482025146484375;
    float _729 = cos(_727);
    float _731 = fma(_719, (*spvDescriptorSet0.vp_c12)._m0[6].y, _721);
    float _733 = _691 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _735 = fma(_632, _286, _687);
    float _737 = fma(_632, _290, _689);
    float _739 = fma(_632, _294, _652);
    float _741 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[8].y, _731);
    float _743 = _691 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _745 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _747 = fma(_719, (*spvDescriptorSet0.vp_c12)._m0[6].x, _733);
    float _749 = _741 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _751 = fma(_719, (*spvDescriptorSet0.vp_c12)._m0[6].z, _743);
    float _753 = fma(_628, _578, _670);
    float _755 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[8].x, _747);
    float _757 = _650 * _695;
    float _759 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[8].z, _751);
    float _761 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _763 = _650 * _729;
    float _765 = _755 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _767 = -_757;
    float _769 = fma(_656, _729, _767);
    float _771 = _759 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _773 = fma(_656, _695, _763);
    float _775 = fma(_542, _725, _753);
    float _777 = -_574;
    float _779 = _777 + 1.0;
    float _781 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _783 = _749 * _745;
    float _785 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _787 = _697 + _334;
    float _789 = _685 + _338;
    float _791 = fma(_783, 0.5, 0.5);
    float _793 = _773 + (-0.5);
    float _795 = fma(_785, _338, _737);
    float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _799 = _765 * _761;
    float _801 = fma(_785, _334, _735);
    float _803 = fma(_785, _342, _739);
    float _805 = fma(_799, 0.5, 0.5);
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _809 = _771 * _781;
    float _811 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _813 = _713 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _815 = fma(_809, 0.5, 0.5);
    float _817 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = floor(_791);
    float _823 = _797 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _825 = _769 + 0.5;
    float _827 = -_823;
    float _829 = -_540;
    float _831 = fma(_827, _793, _829);
    float _833 = _668 + _342;
    float _835 = _807 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _837 = floor(_805);
    float _839 = fma(_773, _779, _831);
    float _841 = fma(_835, _825, _526);
    float _843 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[118].x, _775);
    float _845 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _847 = -_821;
    float _849 = _791 + _847;
    float _851 = floor(_815);
    float _853 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _843 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _857 = -_516;
    float _859 = fma(_769, _857, _841);
    float _861 = fma(_849, 2.0, -1.0);
    out.m_87.x = _817;
    out.m_87.y = _819;
    out.m_87.z = _853;
    out.m_87.w = _855;
    float _863 = -_837;
    float _865 = _805 + _863;
    float _867 = _861 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_89.x = _859;
    out.m_89.y = _839;
    float _869 = fma(_865, 2.0, -1.0);
    float _871 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _873 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _875 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _877 = -_851;
    float _879 = _815 + _877;
    float _881 = _869 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _883 = fma(_879, 2.0, -1.0);
    float _885 = fma(_881, (*spvDescriptorSet0.vp_c12)._m0[2].x, _871);
    float _887 = fma(_881, (*spvDescriptorSet0.vp_c12)._m0[2].y, _873);
    float _889 = _883 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _891 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _893 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _895 = _891 || _893;
    bool _897 = isnan(1.0);
    bool _899 = _895 || _897;
    float _901 = fma(_881, (*spvDescriptorSet0.vp_c12)._m0[2].z, _875);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].x, _885);
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].y, _887);
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].z, _901);
    float _909 = _903 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _911 = _905 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _913 = _907 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _915 = _801 + _909;
    float _917 = _795 + _911;
    float _919 = _803 + _913;
    float _921 = _881;
    float _923 = _821;
    float _925 = _881;
    float _927 = _821;
    float _929 = _869;
    float _931 = _861;
    float _933 = _819;
    float _935 = _883;
    float _937 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _939 = _911;
    float _949;
    float _951;
    float _953;
    float _955;
    if (!_899)
    {
        bool _941 = _911 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _943 = !_941;
        _945 = _943;
        if (!_945)
        {
            float _947 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _949 = 0.0;
            _951 = _947;
            _953 = 0.0;
            _955 = 0.0;
            _957 = true;
        }
    }
    if ((!_957) || _945)
    {
        bool _997;
        if (!_945)
        {
            bool _959 = _911 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _961 = isnan(_911);
            bool _963 = _959 || _961;
            bool _965 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _967 = _963 || _965;
            bool _969 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _971 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _973 = !_967;
            bool _975 = _971 && _973;
            float _977 = 0.0;
            if (_975)
            {
                _977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _979 = _977;
            float _981 = 0.0;
            float _983 = _979;
            if (_975)
            {
                _981 = 0.0;
            }
            float _985 = _981;
            _949 = _985;
            if (_975)
            {
                _921 = 0.0;
            }
            float _987 = _921;
            _925 = _987;
            _953 = _987;
            if (_975)
            {
                float _989 = _979 * 5.0;
                _983 = _989;
            }
            float _991 = _983;
            _951 = _991;
            if (_975)
            {
                _923 = 0.0;
            }
            float _993 = _923;
            bool _995 = !_967;
            _997 = _995 && _969;
            _927 = _993;
            _955 = _993;
        }
        if ((!_997) || _945)
        {
            _945 = false;
            float _999 = _925;
            float _1001 = _927;
            bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1005 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1007 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1009 = _853;
            float _1011 = _1001;
            _949 = _915;
            _951 = _919;
            if (_1003)
            {
                float _1013 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1009 = _1013;
            }
            float _1015 = _1009;
            if (_1003)
            {
                float _1017 = abs(_869);
                float _1019 = -_1017;
                float _1021 = _1019 + 1.0;
                _929 = _1021;
            }
            float _1023 = _929;
            if (_1005)
            {
                float _1025 = abs(_861);
                float _1027 = -_1025;
                float _1029 = _1027 + 1.0;
                _931 = _1029;
            }
            float _1031 = _931;
            if (!_1003)
            {
                _933 = 1.0;
            }
            float _1033 = _933;
            float _1035 = _1033;
            if (_1007)
            {
                float _1037 = abs(_883);
                float _1039 = -_1037;
                float _1041 = _1039 + 1.0;
                _935 = _1041;
            }
            float _1043 = _935;
            if (!_1005)
            {
                _937 = 1.0;
            }
            float _1045 = _937;
            float _1047 = _1045;
            if (!_1007)
            {
                _1011 = 1.0;
            }
            float _1049 = _1011;
            float _1051 = _999;
            float _1053 = _1049;
            if (_1005)
            {
                float _1055 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1051 = _1055;
            }
            float _1057 = _1051;
            float _1059 = _859;
            if (_1007)
            {
                float _1061 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1059 = _1061;
            }
            float _1063 = _1059;
            if (_1003)
            {
                float _1065 = _1023 * _1015;
                float _1067 = precise::clamp(_1065, 0.0, 1.0);
                _1035 = _1067;
            }
            float _1069 = _1035;
            if (_1005)
            {
                float _1071 = _1031 * _1057;
                float _1073 = precise::clamp(_1071, 0.0, 1.0);
                _1047 = _1073;
            }
            float _1075 = _1047;
            float _1077 = _1069 * _1075;
            _953 = _917;
            if (_1007)
            {
                float _1079 = _1043 * _1063;
                float _1081 = precise::clamp(_1079, 0.0, 1.0);
                _1053 = _1081;
            }
            float _1083 = _1053;
            float _1085 = _1077 * _1083;
            _955 = _1085;
        }
    }
    _957 = false;
    float _1087 = _949;
    float _1089 = _951;
    float _1091 = _953;
    float _1093 = _955;
    float _1095 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1097 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1099 = floor(_1095);
    float _1101 = floor(_1097);
    float _1103 = -_1099;
    float _1105 = _1095 + _1103;
    float _1107 = -_1101;
    float _1109 = _1097 + _1107;
    float2 _4364 = float2(_1105, _1109);
    float _1111 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4364, float2(0.0), isnan(_4364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4364, float2(0.0), isnan(_4364)), level(0.0)).x;
    float _1113 = in.m_91.w;
    float _1115 = trunc(_1113);
    int _1117 = int(_1115);
    int _1119 = _1117 << 5;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1121)];
    float _1123 = as_type<float>(_dmw0.x);
    int _1125 = _1119 + 4;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    float _1129 = as_type<float>(_dmw0.y);
    int _1131 = _1119 + 8;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    float _1135 = as_type<float>(_dmw0.z);
    int _1137 = _1119 + 12;
    uint _1139 = uint(int(uint(_1137) >> uint(2)));
    float _1141 = as_type<float>(_dmw0.w);
    float _1143 = _911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1147 = _1087 + _1145;
    float _1149 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1143);
    float _1151 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1149);
    float _1153 = _911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1155 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1157 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1159 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1153);
    float _1161 = _911 + _1155;
    float _1163 = 1.0 / _1157;
    float _1165 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1159);
    float _1167 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1169 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1171 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1173 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1167);
    float _1175 = _1169 + _1157;
    float _1177 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1171);
    float _1179 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1173);
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1089 + _1181;
    float _1185 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1177);
    float _1187 = _1179 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1189 = _1175 * _1163;
    float _1191 = _1189 * 0.5;
    float _1193 = _1183 * _1183;
    float _1195 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1197 = trunc(_1187);
    int _1199 = int(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1201);
    float _1205 = fma(_1147, _1147, _1193);
    float _1207 = 1.0 / _1203;
    float _1209 = trunc(_1195);
    int _1211 = int(_1209);
    int _1213 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1215 = _1199 + _1213;
    int _1217 = _1215 + 1;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1221 = _1207 * _1219;
    float _1223 = sqrt(_1205);
    bool _1225 = _1221 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1227 = _1221 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1229 = !_1225;
    int _1231 = _1229 ? 0 : 1;
    int _1233 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1235 = _1211 + _1233;
    int _1237 = _1235 + 1;
    int _1239 = _1237 | _1217;
    int _1241 = 2;
    int _1243 = _1237;
    float _1245 = _1091;
    float _1247 = _1205;
    if (!_1225)
    {
        _1241 = 1;
    }
    int _1249 = _1241;
    int _1251 = _1249;
    if (!_1227)
    {
        _1251 = _1231;
    }
    int _1253 = _1251;
    bool _1255 = _1237 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1257 = _1253 << 6;
    bool _1259 = _1239 < 0;
    bool _1261 = _1259 || _1255;
    int _1263 = _1257 + 48;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
    int _1269 = int(_1265) & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    int _1273 = int(_1265) + 1;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    int _1277 = _1273 & 3;
    float _1279 = (*spvDescriptorSet0.vp_c15)._m0[int(_1275)][_1277];
    bool _1281 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1283 = _1217 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1285 = _1283 || _1261;
    int _1287 = _1257 + 56;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c15)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    bool _1305 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(0.5);
    bool _1313 = _1309 || _1311;
    int _1315 = _1257 + 64;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    float _1333 = as_type<float>(_1253);
    if (!_1285)
    {
        int _1335 = _1217 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1337 = _1335 + _1237;
        _1243 = _1337;
    }
    int _1339 = _1243;
    int _1341 = _1257 + 72;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    uint _1345 = uint(int(uint(int(_1343)) >> uint(2)));
    int _1347 = int(_1343) & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    int _1351 = int(_1343) + 1;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    int _1355 = _1351 & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    int _1359 = _1257 + 96;
    uint _1361 = uint(int(uint(_1359) >> uint(2)));
    uint _1363 = uint(int(uint(int(_1361)) >> uint(2)));
    int _1365 = int(_1361) & 3;
    float _1367 = (*spvDescriptorSet0.vp_c15)._m0[int(_1363)][_1365];
    int _1369 = int(_1361) + 1;
    uint _1371 = uint(int(uint(_1369) >> uint(2)));
    int _1373 = _1369 & 3;
    float _1375 = (*spvDescriptorSet0.vp_c15)._m0[int(_1371)][_1373];
    int _1377 = _1257 + 104;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    uint _1381 = uint(int(uint(int(_1379)) >> uint(2)));
    int _1383 = int(_1379) & 3;
    float _1385 = (*spvDescriptorSet0.vp_c15)._m0[int(_1381)][_1383];
    int _1387 = int(_1379) + 1;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    int _1391 = _1387 & 3;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[int(_1389)][_1391];
    float _1395 = _1141 * 2.0;
    float _1397 = _1123 * 2.0;
    float _1399 = _1129 * 2.0;
    float _1401 = _1123 * _1123;
    float _1403 = _1135 * _1395;
    float _1405 = _1129 * _1395;
    float _1407 = _1123 * _1395;
    float _1409 = _1135 * _1135;
    float _1411 = -_1403;
    float _1413 = fma(_1129, _1397, _1411);
    float _1415 = fma(_1129, _1397, _1403);
    float _1417 = fma(_1135, _1397, _1405);
    float _1419 = -_1405;
    float _1421 = fma(_1135, _1397, _1419);
    float _1423 = -_1407;
    float _1425 = fma(_1135, _1399, _1423);
    float _1427 = fma(_1135, _1399, _1407);
    float _1429 = _1129 * _1129;
    int _1431 = as_type<int>(_1129);
    float _1433 = _1399;
    float _1435 = _1135;
    int _1437 = as_type<int>(_1123);
    if (!_1285)
    {
        int _1439 = _1339 << 2;
        _1431 = _1439;
    }
    int _1441 = _1431;
    int _1443 = _1441;
    if (!_1281)
    {
        _1433 = _1087;
    }
    float _1445 = _1433;
    float _1447 = _1445;
    if (!_1281)
    {
        _1435 = _1089;
    }
    float _1449 = _1435;
    float _1451 = _1449;
    if (!_1285)
    {
        uint _1453 = uint(int(uint(_1339) >> uint(2)));
        _1437 = int(_1453);
    }
    int _1455 = _1437;
    if (!_1285)
    {
        int _1457 = 12 & _1441;
        _1443 = _1457;
    }
    int _1459 = _1443;
    bool _1461 = !_1281;
    if (!_1461)
    {
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1467 = _1223 + _1465;
        float _1469 = _1091 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1471 = rsqrt(_1205);
        float _1473 = _1467 * _1463;
        float _1475 = _1473 * 0.15915493667125701904296875;
        float _1477 = _1475 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = _1475 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = fma(_1479, _1469, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1487 = _1471 * _1485;
        float _1489 = _1483 + (-1.0);
        float _1491 = fma(_1147, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1493 = fma(_1183, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1495 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1497 = fma(_1483, _1091, _1495);
        _1447 = _1491;
        _1245 = _1497;
        _1451 = _1493;
        _1247 = _1471;
    }
    float _1499 = _1447;
    float _1501 = _1245;
    float _1503 = _1451;
    float _1505 = _1247;
    float _1507 = _1505;
    if (!_1285)
    {
        int _1509 = _1455 << 4;
        int _1511 = _1509 + _1459;
        _1507 = as_type<float>(_1511);
    }
    float _1513 = _1507;
    float _1515 = -_909;
    float _1517 = _1515 + _1499;
    float _1519 = -_911;
    float _1521 = _1519 + _1501;
    int _1523 = _1257 + 88;
    uint _1525 = uint(int(uint(_1523) >> uint(2)));
    uint _1527 = uint(int(uint(int(_1525)) >> uint(2)));
    int _1529 = int(_1525) & 3;
    float _1531 = (*spvDescriptorSet0.vp_c15)._m0[int(_1527)][_1529];
    int _1533 = int(_1525) + 1;
    uint _1535 = uint(int(uint(_1533) >> uint(2)));
    int _1537 = _1533 & 3;
    float _1539 = (*spvDescriptorSet0.vp_c15)._m0[int(_1535)][_1537];
    float _1541 = fma(_1429, -2.0, 1.0);
    float _1543 = fma(_1401, -2.0, 1.0);
    float _1545 = _1521 * _290;
    float _1547 = _1521 * _326;
    float _1549 = fma(_1409, -2.0, _1541);
    float _1551 = fma(_1409, -2.0, _1543);
    float _1553 = fma(_1429, -2.0, _1543);
    int _1555 = _1257 + 80;
    uint _1557 = uint(int(uint(_1555) >> uint(2)));
    uint _1559 = uint(int(uint(int(_1557)) >> uint(2)));
    int _1561 = int(_1557) & 3;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
    int _1565 = int(_1557) + 1;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    int _1569 = _1565 & 3;
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[int(_1567)][_1569];
    float _1573 = _1161 * _1375;
    float _1575 = fma(_1517, _322, _1547);
    float _1577 = -_913;
    float _1579 = _1577 + _1503;
    float _1581 = _1521 * _338;
    float _1583 = fma(_909, _1367, _1573);
    float _1585 = fma(_1517, _286, _1545);
    float _1587 = fma(_1579, _330, _1575);
    float _1589 = _1513;
    if (!_1285)
    {
        int _1591 = as_type<int>(_1513) + 400;
        uint _1593 = uint(int(uint(_1591) >> uint(2)));
        uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
        int _1597 = int(_1593) & 3;
        float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
        _1589 = _1599;
    }
    float _1601 = _1589;
    float _1603 = fma(_913, _1385, _1583);
    float _1605 = fma(_1517, _334, _1581);
    float _1607 = fma(_1579, _294, _1585);
    float _1609 = _1587 * _1413;
    float _1611 = _1603 + _1393;
    float _1613 = fma(_1579, _342, _1605);
    float _1615 = _1587 * _1551;
    float _1617 = fma(_1607, _1549, _1609);
    float _1619 = _1375;
    if (!_1285)
    {
        float _1621 = floor(_1195);
        _1619 = _1621;
    }
    float _1623 = _1619;
    float _1625 = _1587 * _1427;
    float _1627 = _1161 * _1279;
    float _1629 = _1161 * _1331;
    float _1631 = fma(_1607, _1415, _1615);
    float _1633 = fma(_1607, _1421, _1625);
    float _1635 = fma(_909, _1271, _1627);
    float _1637 = fma(_909, _1323, _1629);
    float _1639 = _330;
    if (!_1285)
    {
        float _1641 = floor(_1187);
        _1639 = _1641;
    }
    float _1643 = _1639;
    float _1645 = fma(_1613, _1417, _1617);
    float _1647 = fma(_1613, _1425, _1631);
    float _1649 = fma(_1613, _1553, _1633);
    float _1651 = fma(_913, _1295, _1635);
    float _1653 = fma(_913, _1349, _1637);
    float _1655 = _909 + _1645;
    float _1657 = _911 + _1647;
    float _1659 = 1.0 / _1611;
    float _1661 = _913 + _1649;
    float _1663 = _1651 + _1303;
    float _1665 = _1653 + _1357;
    float _1667 = _1657;
    float _1669 = _1655;
    float _1671 = _1661;
    float _1673 = _1643;
    float _1675 = _1623;
    if (!_1313)
    {
        float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1679 = _911 + _1677;
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1683 = _909 + _1681;
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1687 = _1679 * _1679;
        float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1691 = _913 + _1689;
        float _1693 = fma(_1683, _1683, _1687);
        float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1697 = fma(_1691, _1691, _1693);
        float _1699 = sqrt(_1697);
        float _1701 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1703 = precise::min(_1699, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1705 = _1703 * _1695;
        float _1707 = _1701 * _1705;
        float _1709 = fma(_1647, _1707, _911);
        float _1711 = fma(_1645, _1707, _909);
        float _1713 = fma(_1649, _1707, _913);
        _1667 = _1709;
        _1669 = _1711;
        _1671 = _1713;
    }
    float _1715 = _1667;
    float _1717 = _1669;
    float _1719 = _1671;
    float _1721 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1723 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1725 = _1663 * _1659;
    float _1727 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1729 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1721);
    float _1731 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1733 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1723);
    bool _1735 = _1725 >= 0.0;
    float _1737 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1729);
    float _1739 = _1665 * _1659;
    float _1741 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1727);
    float _1743 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1731);
    float _1745 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1733);
    float _1747 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1749 = _1725 <= 1.0;
    bool _1751 = _1749 && _1735;
    float _1753 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1741);
    float _1755 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1757 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1759 = _1739 >= 0.0;
    bool _1761 = _1759 && _1751;
    float _1763 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1765 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1767 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1757);
    bool _1769 = _1739 <= 1.0;
    bool _1771 = _1769 && _1761;
    float _1773 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1775 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1777 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1779 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1767);
    float _1781 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1783 = -_1775;
    float _1785 = fma(_1783, _1773, 1.0);
    float _1787 = _1161 * _1571;
    float _1789 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1779);
    float _1791 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1793 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1781);
    float _1795 = fma(_909, _1563, _1787);
    float _1797 = log2(_1785);
    float _1799 = _1781;
    if (_1771)
    {
        float _1801 = float(_1253);
        _1799 = _1801;
    }
    float _1803 = _1799;
    float _1805 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1791);
    float _1807 = fma(_913, _1531, _1795);
    float _1809 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1793);
    if (!_1285)
    {
        float _1811 = -_1643;
        float _1813 = _1187 + _1811;
        _1673 = _1813;
    }
    float _1815 = _1673;
    float _1817 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1805);
    float _1819 = _1807 + _1539;
    float _1821 = 1.0 / _1789;
    float _1823 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1809);
    float _1825 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1817);
    float _1827 = _1825;
    if (!_1285)
    {
        float _1829 = -_1623;
        float _1831 = _1195 + _1829;
        _1675 = _1831;
    }
    float _1833 = _1675;
    float _1835 = _1819 * _1659;
    float _1837 = _1649;
    if (!_1285)
    {
        float _1839 = rint(_1601);
        float _1841 = precise::max(_1839, 0.0);
        uint _1843 = uint(_1841);
        uint _1845 = clamp(_1843, 0u, 65535u);
        _1837 = as_type<float>(_1845);
    }
    float _1847 = _1837;
    float _1849 = _1797 * 0.693147182464599609375;
    float _1851 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1853 = _1803;
    float _1855 = _1851;
    if (_1771)
    {
        float _1857 = rint(_1803);
        float _1859 = precise::max(_1857, 0.0);
        uint _1861 = uint(_1859);
        uint _1863 = clamp(_1861, 0u, 65535u);
        _1853 = as_type<float>(_1863);
    }
    float _1865 = _1853;
    float _1867 = _1823 * _1821;
    float _1869 = _1825 * _1821;
    float _1871 = fma(_1867, 0.5, 0.5);
    float _1873 = fma(_1869, -0.5, 0.5);
    float _1875 = _1815;
    if (!_1285)
    {
        float3 _5640 = float3(_1833, _1815, float(as_type<int>(_1847)));
        float3 _5644 = select(_5640, float3(0.0), isnan(_5640));
        float _1877 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5644.xy, uint(rint(_5644.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5644.xy, uint(rint(_5644.z)), level(0.0)).x;
        _1875 = _1877;
    }
    float _1879 = _1875;
    float _1881 = _1739;
    if (_1771)
    {
        float3 _5659 = float3(_1725, _1739, float(as_type<int>(_1865)));
        float3 _5661 = select(_5659, float3(0.0), isnan(_5659));
        float _1883 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5661.xy, uint(rint(_5661.z)), _1835, level(0.0));
        _1881 = _1883;
    }
    float _1885 = _1881;
    float3 _5671 = float3(_1871, _1873, _1851);
    float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5671, float3(0.0), isnan(_5671)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5671, float3(0.0), isnan(_5671)), level(0.0)).x;
    float3 _5680 = float3(_1871, _1873, _1851);
    float4 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5680, float3(0.0), isnan(_5680)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5680, float3(0.0), isnan(_5680)), level(0.0)).xyzw;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    float _1898 = _1890.w;
    float _1900 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1285)
    {
        _1333 = 1.0;
    }
    float _1902 = _1333;
    bool _1904 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.5);
    bool _1912 = _1908 || _1910;
    float _1914 = _1902;
    if (_1912)
    {
        _1900 = 1.0;
    }
    float _1916 = _1900;
    float _1918 = _1916;
    if (!_1912)
    {
        float _1920 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1922 = _1920 * 0.15915493667125701904296875;
        float _1924 = _1922 * 6.283185482025146484375;
        float _1926 = cos(_1924);
        float _1928 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1930 = _1928 * 0.15915493667125701904296875;
        float _1932 = _1922 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = 1.0 / _1926;
        float _1938 = _1930 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1934 * _1936;
        float _1944 = _1930 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = _1940 * _1942;
        float _1950 = 1.0 / _1948;
        float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1954 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1952;
        float _1956 = 1.0 / _1954;
        float _1958 = _1946 * _1950;
        float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1962 = fma(_1221, _1958, _1960);
        float _1964 = _1962 * _1956;
        float _1966 = precise::clamp(_1964, 0.0, 1.0);
        _1918 = _1966;
    }
    float _1968 = _1918;
    if (!_1285)
    {
        int _1970 = _1339 << 4;
        int _1972 = _1970 + 2048;
        uint _1974 = uint(int(uint(_1972) >> uint(2)));
        uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
        int _1978 = int(_1974) & 3;
        float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
        int _1982 = int(_1974) + 1;
        uint _1984 = uint(int(uint(_1982) >> uint(2)));
        int _1986 = _1982 & 3;
        float _1988 = (*spvDescriptorSet0.vp_c15)._m0[int(_1984)][_1986];
        int _1990 = _1972 + 8;
        uint _1992 = uint(int(uint(_1990) >> uint(2)));
        uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
        int _1996 = int(_1992) & 3;
        float _1998 = (*spvDescriptorSet0.vp_c15)._m0[int(_1994)][_1996];
        int _2000 = int(_1992) + 1;
        uint _2002 = uint(int(uint(_2000) >> uint(2)));
        int _2004 = _2000 & 3;
        float _2006 = (*spvDescriptorSet0.vp_c15)._m0[int(_2002)][_2004];
        float _2008 = _1161 * _1988;
        float _2010 = fma(_909, _1980, _2008);
        float _2012 = fma(_913, _1998, _2010);
        float _2014 = _2012 + _2006;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        float _2018 = -_2016;
        float _2020 = _2018 + _1879;
        float _2022 = fma(_2020, 500.0, 1.5);
        float _2024 = exp2(_2022);
        float _2026 = 0.0 + _2024;
        float _2028 = precise::clamp(_2026, 0.0, 1.0);
        _1914 = _2028;
    }
    float _2030 = _1914;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2034 = _1715 + _2032;
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2038 = _1717 + _2036;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _1719 + _2040;
    float _2044 = _2034 * _2034;
    float _2046 = fma(_2038, _2038, _2044);
    float _2048 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2050 = fma(_2042, _2042, _2046);
    float _2052 = precise::max(0.0, _2048);
    float _2054 = rsqrt(_2050);
    float _2056 = sqrt(_2050);
    float _2058 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2060 = _2038 * _2058;
    float _2062 = _2042 * _2058;
    float _2064 = -_2058;
    float _2066 = -_2052;
    float _2068 = fma(_2034, _2064, _2066);
    float _2070 = _2060 * _2060;
    float _2072 = _2062 * _2062;
    float _2074 = _2070 + _2072;
    float _2076 = sqrt(_2074);
    bool _2078 = _2076 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2082 = _2076 + _2080;
    float _2084 = _1879;
    float _2086 = _2052;
    float _2088 = _2074;
    float _2090 = _2082;
    float _2092 = _2034;
    float _2094 = _2060;
    float _2096 = _2070;
    float _2098 = _2072;
    if (_2078)
    {
        float _2100 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2084 = _2100;
    }
    float _2102 = _2084;
    if (_2078)
    {
        float _2104 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2086 = _2104;
    }
    float _2106 = _2086;
    float _2108 = _2106;
    if (_2078)
    {
        float _2110 = rsqrt(_2074);
        _2088 = _2110;
    }
    float _2112 = _2088;
    if (_2078)
    {
        float _2114 = _2082 * _2102;
        _2090 = _2114;
    }
    float _2116 = _2090;
    if (_2078)
    {
        float _2118 = _2116 * 0.15915493667125701904296875;
        _1855 = _2118;
    }
    float _2120 = _1855;
    float _2122 = _2102;
    if (_2078)
    {
        float _2124 = _2120 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        _2122 = _2126;
    }
    float _2128 = _2122;
    float _2130 = _2116;
    if (_2078)
    {
        float _2132 = _2120 * 6.283185482025146484375;
        float _2134 = cos(_2132);
        _2130 = _2134;
    }
    float _2136 = _2130;
    float _2138 = _2128;
    if (_2078)
    {
        float _2140 = fma(_2128, _2106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2138 = _2140;
    }
    float _2142 = _2138;
    float _2144 = _2142;
    if (!_2078)
    {
        _2108 = _2068;
    }
    float _2146 = _2108;
    float _2148 = _2146;
    if (_2078)
    {
        float _2150 = _2112 * _2142;
        _939 = _2150;
    }
    float _2152 = _939;
    if (_2078)
    {
        float _2154 = _2136 + (-1.0);
        _2092 = _2154;
    }
    float _2156 = _2092;
    float _2158 = _2156;
    if (_2078)
    {
        float _2160 = _2060 * _2152;
        _2094 = _2160;
    }
    float _2162 = _2094;
    if (_2078)
    {
        float _2164 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2164;
    }
    float _2166 = _2144;
    if (!_2078)
    {
        _2158 = _2062;
    }
    float _2168 = _2158;
    float _2170 = _2168;
    if (_2078)
    {
        float _2172 = _2062 * _2152;
        _2170 = _2172;
    }
    float _2174 = _2170;
    if (_2078)
    {
        float _2176 = _2162 * _2162;
        _2096 = _2176;
    }
    float _2178 = _2096;
    if (_2078)
    {
        float _2180 = fma(_2068, _2136, _2166);
        _2148 = _2180;
    }
    float _2182 = _2148;
    if (_2078)
    {
        float _2184 = _2174 * _2174;
        _2098 = _2184;
    }
    float _2186 = _2098;
    float _2188 = fma(_2182, _2182, _2178);
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2192 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2190);
    float _2194 = precise::clamp(_2192, 0.0, 1.0);
    float _2196 = _2188 + _2186;
    float _2198 = -_2194;
    float _2200 = _2198 + 1.0;
    float _2202 = rsqrt(_2196);
    float _2204 = abs(_2200);
    float _2206 = log2(_2204);
    float _2208 = _2202 * _2162;
    float _2210 = _2202 * _2182;
    float _2212 = _2202 * _2174;
    float _2214 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2216 = -_2214;
    float _2218 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2216);
    float _2220 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2222 = -_2212;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2218);
    float _2226 = exp2(_2220);
    float _2228 = fma(_2224, -0.5, 0.5);
    float _2230 = fma(_2224, 0.5, 0.5);
    float _2232 = _2210 + 1.0;
    float _2234 = fma(_2230, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2236 = sqrt(_2228);
    float _2238 = fma(_2230, _2234, -0.212114393711090087890625);
    float _2240 = -_2210;
    float _2242 = fma(_2226, _2232, _2240);
    float _2244 = fma(_2230, _2238, 1.570728778839111328125);
    float _2246 = fma(_2242, 0.5, 0.5);
    float _2248 = _2236 * 0.636619746685028076171875;
    float _2250 = -_2244;
    float _2252 = fma(_2248, _2250, 1.0);
    float2 _6226 = float2(_2252, _2246);
    float3 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6226, float2(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6226, float2(0.0), isnan(_6226)), level(0.0)).xyz;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    bool _2264 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2266 = isnan(0.0);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2272 = _2268 || _2270;
    float _2274 = _789 * _1427;
    float _2276 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2278 = -_1111;
    float _2280 = _2278 + 1.0;
    float _2282 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _2284 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2276);
    float _2286 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2288 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2286);
    float _2290 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2292 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2290);
    float _2294 = _2210;
    if (_2272)
    {
        float _2296 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = abs(_1221);
    float _2302 = log2(_2300);
    float _2304 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2288);
    float _2306 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2292);
    float _2308 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2284);
    float _2310 = _2298;
    if (_2272)
    {
        float _2312 = precise::min(_2298, 20.0);
        _2310 = _2312;
    }
    float _2314 = _2310;
    float _2316 = _909 + _2304;
    float _2318 = _913 + _2306;
    float _2320 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2308);
    float _2322 = _913;
    if (_2272)
    {
        float _2324 = 1.0 / _2314;
        _2322 = _2324;
    }
    float _2326 = _2322;
    float _2328 = -_2316;
    float _2330 = _2328 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2332 = -_2318;
    float _2334 = _2332 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2336 = _1221 <= 8000.0;
    bool _2338 = isnan(_1221);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(8000.0);
    bool _2344 = _2340 || _2342;
    float _2346 = float(_2344);
    out.gl_Position.x = _1823;
    out.gl_Position.y = _1825;
    out.gl_Position.z = _2320;
    out.gl_Position.w = _1789;
    float _2348 = precise::min(_2316, _2330);
    float _2350 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2352 = precise::min(_2318, _2334);
    float _2354 = _2334;
    if (!_2272)
    {
        _2354 = 1.0;
    }
    float _2356 = _2354;
    float _2358 = precise::min(_2348, _2352);
    float _2360 = exp2(_2350);
    float _2362 = _2356;
    if (_2272)
    {
        float _2364 = _2358 * _2326;
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        _2362 = _2366;
    }
    float _2368 = _2362;
    float _2370 = _789 * _1413;
    if (!_1771)
    {
        _1827 = 1.0;
    }
    float _2372 = _1827;
    float _2374 = _1093 * _2368;
    float _2376 = _789 * _1551;
    float _2378 = fma(_787, _1549, _2370);
    float _2380 = _2320 + _1789;
    float _2382 = fma(_787, _1415, _2376);
    float _2384 = fma(_787, _1421, _2274);
    float _2386 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2388 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2390 = precise::clamp(_2388, 0.0, 1.0);
    float _2392 = _2372;
    if (_1771)
    {
        bool _2394 = _1885 >= _1835;
        bool _2396 = isnan(_1885);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan(_1835);
        bool _2402 = _2398 || _2400;
        float _2404 = float(_2402);
        _2392 = _2404;
    }
    float _2406 = _2392;
    float _2408 = fma(_833, _1417, _2378);
    float _2410 = _2380 * 0.5;
    float _2412 = fma(_2390, -2.0, 3.0);
    float _2414 = _2390 * _2390;
    float _2416 = exp2(_2386);
    float _2418 = _2406 * _2030;
    float _2420 = fma(_833, _1425, _2382);
    float _2422 = _2414 * _2412;
    float _2424 = fma(_833, _1553, _2384);
    out.m_93.z = _2410;
    out.m_93.w = _1789;
    bool _2426 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2428 = isnan(_2056);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2434 = _2430 || _2432;
    float _2436 = -_2422;
    float _2438 = _2436 + 1.0;
    float _2440 = _2374 * _1968;
    out.m_95.x = _2408;
    out.m_95.y = _2420;
    out.m_95.z = _2424;
    float _2442 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2422);
    float _2444 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2446 = _2346 * _2442;
    float _2448 = -_2416;
    float _2450 = _2448 + 1.0;
    float _2452 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2456 = _2280 * _2452;
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = _2454 * _1887;
    float _2462 = -_2454;
    float _2464 = _2462 + 1.0;
    float _2466 = -_2458;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2470 = _1898 * _2460;
    float _2472 = _1898 * _2464;
    float _2474 = _2464;
    float _2476 = _2470;
    if (!_2434)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2478 = _2474;
    float _2480 = -_2418;
    float _2482 = fma(_2480, _2468, 1.0);
    float _2484 = precise::clamp(_2482, 0.0, 1.0);
    float _2486 = _2484 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2488 = _2484;
    float _2490 = _2478;
    float _2492 = _2478;
    if (!_2434)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2494 = _2488;
    out.m_97.x = _2486;
    float _2496 = _2262 * _2460;
    float _2498 = fma(_2258, _2470, _1892);
    float _2500 = fma(_2260, _2470, _1894);
    float _2502 = _2494;
    float _2504 = _2494;
    if (!_2434)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2506 = _2476;
    float _2508 = fma(_1898, _2496, _1896);
    out.m_99.x = _2498;
    out.m_99.y = _2500;
    out.m_99.z = _2508;
    out.m_99.w = _2472;
    bool _2510 = !_2434;
    float _2512 = _2506;
    float _2514 = _2506;
    if (!_2510)
    {
        bool _2516 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2518 = isnan(_2056);
        bool _2520 = _2516 || _2518;
        bool _2522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2524 = _2520 || _2522;
        if (!_2524)
        {
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2528 = _2056 + _2526;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2532 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2530;
            float _2534 = 1.0 / _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2544 = _2528 * _2534;
            float _2546 = precise::clamp(_2544, 0.0, 1.0);
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2552 = fma(_2546, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2554 = fma(_2546, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2556 = fma(_2546, _2538, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2504 = _2556;
            _2514 = _2554;
            _2492 = _2552;
            _2558 = true;
        }
        else
        {
            bool _2560 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2562 = isnan(_2056);
            bool _2564 = _2560 || _2562;
            bool _2566 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2568 = _2564 || _2566;
            if (!_2568)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2570 = _2512;
            _2514 = _2570;
            if (!_2568)
            {
                _2502 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2572 = _2502;
            _2504 = _2572;
            if (!_2568)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2574 = _2490;
            bool _2576 = !_2568;
            _2492 = _2574;
            if (!_2576)
            {
                bool _2578 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2580 = isnan(_2056);
                bool _2582 = _2578 || _2580;
                bool _2584 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2586 = _2582 || _2584;
                if (!_2586)
                {
                    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2590 = _2056 + _2588;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2592;
                    float _2596 = 1.0 / _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2606 = _2590 * _2596;
                    float _2608 = precise::clamp(_2606, 0.0, 1.0);
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2614 = fma(_2608, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2616 = fma(_2608, _2612, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2618 = fma(_2608, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2504 = _2618;
                    _2514 = _2616;
                    _2492 = _2614;
                    _2558 = true;
                }
                else
                {
                    _2504 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2558 = false;
    float _2620 = _2504;
    float _2622 = _2514;
    float _2624 = _2492;
    float _2626 = _2444 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_101.x = 0.0;
    float _2628 = _2620 * 0.586610972881317138671875;
    bool _2630 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_68.x = _2626;
    float _2632 = fma(_2622, 0.298911988735198974609375, _2628);
    bool _2634 = _1968 > 0.0;
    bool _2636 = isnan(_1968);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan(0.0);
    bool _2642 = _2638 || _2640;
    float _2644 = fma(_2624, 0.114477999508380889892578125, _2632);
    float _2646 = -_2644;
    float _2648 = _2646 + _2622;
    float _2650 = -_2644;
    float _2652 = _2650 + _2620;
    float _2654 = -_2644;
    float _2656 = _2654 + _2624;
    float _2658 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2660 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2662 = fma(_2656, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    bool _2664 = !_2630;
    if (!_2664)
    {
        float _2666 = -_1715;
        float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2670 = -_1717;
        float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2674 = -_1719;
        float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2678 = _2668 * _2668;
        float _2680 = fma(_2672, _2672, _2678);
        float _2682 = fma(_2676, _2676, _2680);
        float _2684 = sqrt(_2682);
        float _2686 = rsqrt(_2682);
        float _2688 = -_2684;
        float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2692 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2694 = precise::clamp(_2692, 0.0, 1.0);
        float _2696 = _2672 * _2686;
        float _2698 = _2668 * _2686;
        float _2700 = abs(_2694);
        float _2702 = log2(_2700);
        float _2704 = _2676 * _2686;
        float _2706 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2708 = _2420 * _2698;
        float _2710 = -_2698;
        float _2712 = -_2706;
        float _2714 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2712);
        float _2716 = fma(_2408, _2696, _2708);
        float _2718 = -_2704;
        float _2720 = fma(_2718, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2714);
        float _2722 = fma(_2424, _2704, _2716);
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2728 = _2720 + _2726;
        float _2730 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2732 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2734 = precise::clamp(_2732, 0.0, 1.0);
        float _2736 = exp2(_2730);
        float _2738 = _2736 * _2734;
        float _2740 = _2724 * _2738;
        float _2742 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2744 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2746 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2742;
        out.m_101.y = _2744;
        out.m_101.z = _2746;
    }
    out.m_103.x = _2658;
    out.m_103.y = _2660;
    out.m_103.z = _2662;
    if (_2642)
    {
        return out;
    }
    out.m_68.x = 0.0;
    float _2748 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2748;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2558 = false;
    bool _957 = false;
    bool _945 = false;
    bool _366 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_65.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_68.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_138);
        out.gl_Position.z = _2805;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_70.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_152)
    {
        float _158 = float(_122);
        _132 = _158;
    }
    float _160 = _132;
    bool _162 = _156 >= _160;
    bool _164 = !_152;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_68.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _140 = as_type<int>(_172);
    }
    int _174 = _140;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2874 = as_type<float>(_174);
        out.gl_Position.z = _2874;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_72.x;
    float _178 = in.m_72.y;
    float _180 = in.m_72.z;
    float _182 = in.m_74.x;
    float _184 = in.m_74.y;
    float _186 = in.m_74.z;
    float _188 = in.m_76.x;
    float _190 = in.m_76.y;
    float _192 = in.m_76.z;
    float _194 = in.m_78.x;
    float _196 = _176 * _176;
    float _198 = _178 * _178;
    float _200 = _180 * _180;
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = _208;
    if (_220)
    {
        float _226 = rsqrt(_208);
        _224 = _226;
    }
    float _228 = _224;
    float _230 = 0.0;
    if (!_220)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _218 > 0.0;
    float _236 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _238 = 0.0;
    float _240 = _232;
    if (!_220)
    {
        _238 = 0.0;
    }
    float _242 = _238;
    float _244 = 0.0;
    float _246 = _242;
    if (_222)
    {
        float _248 = rsqrt(_210);
        _244 = _248;
    }
    float _250 = _244;
    float _252 = 0.0;
    if (!_220)
    {
        _252 = 0.0;
    }
    float _254 = _252;
    float _256 = _236 * _194;
    float _258 = 0.0;
    float _260 = 0.0;
    float _262 = _254;
    if (!_222)
    {
        _258 = 0.0;
        _260 = 0.0;
    }
    float _264 = _258;
    float _266 = _260;
    float _268 = 0.0;
    float _270 = _266;
    float _272 = _264;
    if (!_222)
    {
        _268 = 0.0;
    }
    float _274 = _268;
    float _276 = _216;
    float _278 = _274;
    if (_234)
    {
        float _280 = rsqrt(_212);
        _276 = _280;
    }
    float _282 = _276;
    if (_220)
    {
        float _284 = _228 * _182;
        _240 = _284;
    }
    float _286 = _240;
    if (_220)
    {
        float _288 = _228 * _176;
        _246 = _288;
    }
    float _290 = _246;
    if (_220)
    {
        float _292 = _228 * _188;
        _262 = _292;
    }
    float _294 = _262;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _298 = 0.0;
    float _300 = 0.0;
    if (!_234)
    {
        _298 = 0.0;
        _300 = 0.0;
    }
    float _302 = _298;
    float _304 = _300;
    float _306 = 0.0;
    float _308 = _302;
    float _310 = _304;
    if (!_234)
    {
        _306 = 0.0;
    }
    float _312 = _306;
    float _314 = trunc(_256);
    int _316 = int(_314);
    float _318 = _312;
    if (_222)
    {
        float _320 = _250 * _184;
        _278 = _320;
    }
    float _322 = _278;
    if (_222)
    {
        float _324 = _250 * _178;
        _270 = _324;
    }
    float _326 = _270;
    if (_222)
    {
        float _328 = _250 * _190;
        _272 = _328;
    }
    float _330 = _272;
    if (_234)
    {
        float _332 = _282 * _186;
        _308 = _332;
    }
    float _334 = _308;
    if (_234)
    {
        float _336 = _282 * _180;
        _310 = _336;
    }
    float _338 = _310;
    if (_234)
    {
        float _340 = _282 * _192;
        _318 = _340;
    }
    float _342 = _318;
    int _344 = _316 << 4;
    int _346 = _344 + 1712;
    bool _348 = !_296;
    float _364;
    if (!_348)
    {
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _352 = _194 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_122);
        float _370 = 1.0 / _368;
        float _372 = _156 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_65.x;
    float _378 = in.m_65.y;
    float _380 = in.m_65.z;
    float _382 = in.m_78.y;
    float _384 = as_type<float>(int(gl_VertexIndex));
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _390 = in.m_78.z;
    float _392 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _386);
    float _394 = in.m_72.w;
    float _396 = in.m_74.w;
    float _398 = _184 * _378;
    float _400 = _178 * _378;
    float _402 = _190 * _378;
    float _404 = fma(_182, _376, _398);
    float _406 = fma(_176, _376, _400);
    float _408 = fma(_188, _376, _402);
    float _410 = fma(_180, _380, _406);
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _414 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _424 = fma(_414, -2.0, _416);
    float _426 = 1.0 / _420;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _430 = as_type<int>(_384) & 1;
    bool _432 = _430 != 0;
    int _434 = as_type<int>(_384) & 2;
    bool _436 = _434 != 0;
    float _438 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[79].z, _412);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _446 = _444 != 0;
    float _448 = -_428;
    float _450 = fma(_422, 2.0, _448);
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _454 = _452 != 0;
    float _456 = 1.0 / _442;
    float _458 = in.m_83.x;
    float _460 = in.m_83.y;
    float _462 = fma(_186, _380, _404);
    float _464 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].w, _388);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _470 = _194 > 0.5;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _478 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _480 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = 1.0 / _476;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _486;
    bool _490 = _382 > 0.5;
    out.m_85.x = _478;
    out.m_85.y = _480;
    out.m_85.z = _482;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _496 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[79].x, _438);
    float _498 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _392);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _500;
    float _504 = _488 * _456;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _508 = _374 + _506;
    float _510 = _496 * (-0.15915493667125701904296875);
    float _512 = _502 * _426;
    float _514 = -_498;
    float _516 = _514 + 1.0;
    float _518 = fma(_192, _380, _408);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _522 = _374 + _520;
    float _524 = -_156;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _450);
    bool _528 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_374);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    float _542 = fma(_504, _522, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _544 = _410 + _394;
    float _546 = _462 + _396;
    float _548 = _460 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _550 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _552 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = isnan(_374);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _566 = _374 + _564;
    float _568 = -_538;
    float _570 = _568 + 1.0;
    float _572 = _494 * _484;
    float _574 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _464);
    float _576 = fma(_512, _566, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _578 = _562 * _570;
    float _580 = in.m_76.w;
    bool _582 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _584 = isnan(_374);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_562;
    float _596 = _594 + 1.0;
    bool _598 = !_432;
    float _600 = _598 ? (-0.5) : 0.5;
    float _602 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _604 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _606 = isnan(_374);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _618 = !_436;
    float _620 = _618 ? (-0.5) : 0.5;
    float _622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _600);
    float _624 = _600 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _626 = _614 * _596;
    float _628 = fma(_572, _508, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _620);
    float _632 = _602 * _622;
    float _634 = -_620;
    int _636 = _490 ? as_type<int>(_634) : as_type<int>(_620);
    float _638 = _576 * _626;
    float _640 = _616 * _630;
    float _642 = -_600;
    int _644 = _470 ? as_type<int>(_642) : as_type<int>(_600);
    float _646 = _620 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _648 = !_454;
    float _650 = _648 ? _620 : as_type<float>(_636);
    float _652 = _640 * _330;
    bool _654 = !_446;
    float _656 = _654 ? _600 : as_type<float>(_644);
    float _658 = _646 * _330;
    float _660 = -_614;
    float _662 = _660 + 1.0;
    float _664 = _646 * _326;
    float _666 = _646 * _322;
    float _668 = fma(_624, _294, _658);
    float _670 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[115].x, _638);
    int _672 = _346 + 8;
    uint _675 = uint(int(uint(_672) >> uint(2)));
    uint _677 = uint(int(uint(int(_675)) >> uint(2)));
    int _679 = int(_675) & 3;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[int(_677)][_679];
    float _683 = _518 + _580;
    float _685 = fma(_624, _290, _664);
    float _687 = _640 * _322;
    float _689 = _640 * _326;
    float _691 = _544 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _693 = _510 * 6.283185482025146484375;
    float _695 = sin(_693);
    float _697 = fma(_624, _286, _666);
    uint _699 = uint(int(uint(_346) >> uint(2)));
    uint _701 = uint(int(uint(int(_699)) >> uint(2)));
    int _703 = int(_699) & 3;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[int(_701)][_703];
    int _707 = int(_699) + 1;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    int _711 = _707 & 3;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[int(_709)][_711];
    float _715 = -_592;
    float _717 = _715 + 1.0;
    float _719 = _546 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _721 = _691 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _723 = _683 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _725 = _538 * _717;
    float _727 = _510 * 6.283185482025146484375;
    float _729 = cos(_727);
    float _731 = fma(_719, (*spvDescriptorSet0.vp_c12)._m0[6].y, _721);
    float _733 = _691 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _735 = fma(_632, _286, _687);
    float _737 = fma(_632, _290, _689);
    float _739 = fma(_632, _294, _652);
    float _741 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[8].y, _731);
    float _743 = _691 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _745 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _747 = fma(_719, (*spvDescriptorSet0.vp_c12)._m0[6].x, _733);
    float _749 = _741 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _751 = fma(_719, (*spvDescriptorSet0.vp_c12)._m0[6].z, _743);
    float _753 = fma(_628, _578, _670);
    float _755 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[8].x, _747);
    float _757 = _650 * _695;
    float _759 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[8].z, _751);
    float _761 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _763 = _650 * _729;
    float _765 = _755 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _767 = -_757;
    float _769 = fma(_656, _729, _767);
    float _771 = _759 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _773 = fma(_656, _695, _763);
    float _775 = fma(_542, _725, _753);
    float _777 = -_574;
    float _779 = _777 + 1.0;
    float _781 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _783 = _749 * _745;
    float _785 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _787 = _697 + _334;
    float _789 = _685 + _338;
    float _791 = fma(_783, 0.5, 0.5);
    float _793 = _773 + (-0.5);
    float _795 = fma(_785, _338, _737);
    float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _799 = _765 * _761;
    float _801 = fma(_785, _334, _735);
    float _803 = fma(_785, _342, _739);
    float _805 = fma(_799, 0.5, 0.5);
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _809 = _771 * _781;
    float _811 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _813 = _713 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _815 = fma(_809, 0.5, 0.5);
    float _817 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = floor(_791);
    float _823 = _797 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _825 = _769 + 0.5;
    float _827 = -_823;
    float _829 = -_540;
    float _831 = fma(_827, _793, _829);
    float _833 = _668 + _342;
    float _835 = _807 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _837 = floor(_805);
    float _839 = fma(_773, _779, _831);
    float _841 = fma(_835, _825, _526);
    float _843 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[118].x, _775);
    float _845 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _847 = -_821;
    float _849 = _791 + _847;
    float _851 = floor(_815);
    float _853 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _843 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _857 = -_516;
    float _859 = fma(_769, _857, _841);
    float _861 = fma(_849, 2.0, -1.0);
    out.m_87.x = _817;
    out.m_87.y = _819;
    out.m_87.z = _853;
    out.m_87.w = _855;
    float _863 = -_837;
    float _865 = _805 + _863;
    float _867 = _861 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_89.x = _859;
    out.m_89.y = _839;
    float _869 = fma(_865, 2.0, -1.0);
    float _871 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _873 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _875 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _877 = -_851;
    float _879 = _815 + _877;
    float _881 = _869 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _883 = fma(_879, 2.0, -1.0);
    float _885 = fma(_881, (*spvDescriptorSet0.vp_c12)._m0[2].x, _871);
    float _887 = fma(_881, (*spvDescriptorSet0.vp_c12)._m0[2].y, _873);
    float _889 = _883 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _891 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _893 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _895 = _891 || _893;
    bool _897 = isnan(1.0);
    bool _899 = _895 || _897;
    float _901 = fma(_881, (*spvDescriptorSet0.vp_c12)._m0[2].z, _875);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].x, _885);
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].y, _887);
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].z, _901);
    float _909 = _903 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _911 = _905 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _913 = _907 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _915 = _801 + _909;
    float _917 = _795 + _911;
    float _919 = _803 + _913;
    float _921 = _881;
    float _923 = _821;
    float _925 = _881;
    float _927 = _821;
    float _929 = _869;
    float _931 = _861;
    float _933 = _819;
    float _935 = _883;
    float _937 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _939 = _911;
    float _949;
    float _951;
    float _953;
    float _955;
    if (!_899)
    {
        bool _941 = _911 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _943 = !_941;
        _945 = _943;
        if (!_945)
        {
            float _947 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _949 = 0.0;
            _951 = _947;
            _953 = 0.0;
            _955 = 0.0;
            _957 = true;
        }
    }
    if ((!_957) || _945)
    {
        bool _997;
        if (!_945)
        {
            bool _959 = _911 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _961 = isnan(_911);
            bool _963 = _959 || _961;
            bool _965 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _967 = _963 || _965;
            bool _969 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _971 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _973 = !_967;
            bool _975 = _971 && _973;
            float _977 = 0.0;
            if (_975)
            {
                _977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _979 = _977;
            float _981 = 0.0;
            float _983 = _979;
            if (_975)
            {
                _981 = 0.0;
            }
            float _985 = _981;
            _949 = _985;
            if (_975)
            {
                _921 = 0.0;
            }
            float _987 = _921;
            _925 = _987;
            _953 = _987;
            if (_975)
            {
                float _989 = _979 * 5.0;
                _983 = _989;
            }
            float _991 = _983;
            _951 = _991;
            if (_975)
            {
                _923 = 0.0;
            }
            float _993 = _923;
            bool _995 = !_967;
            _997 = _995 && _969;
            _927 = _993;
            _955 = _993;
        }
        if ((!_997) || _945)
        {
            _945 = false;
            float _999 = _925;
            float _1001 = _927;
            bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1005 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1007 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1009 = _853;
            float _1011 = _1001;
            _949 = _915;
            _951 = _919;
            if (_1003)
            {
                float _1013 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1009 = _1013;
            }
            float _1015 = _1009;
            if (_1003)
            {
                float _1017 = abs(_869);
                float _1019 = -_1017;
                float _1021 = _1019 + 1.0;
                _929 = _1021;
            }
            float _1023 = _929;
            if (_1005)
            {
                float _1025 = abs(_861);
                float _1027 = -_1025;
                float _1029 = _1027 + 1.0;
                _931 = _1029;
            }
            float _1031 = _931;
            if (!_1003)
            {
                _933 = 1.0;
            }
            float _1033 = _933;
            float _1035 = _1033;
            if (_1007)
            {
                float _1037 = abs(_883);
                float _1039 = -_1037;
                float _1041 = _1039 + 1.0;
                _935 = _1041;
            }
            float _1043 = _935;
            if (!_1005)
            {
                _937 = 1.0;
            }
            float _1045 = _937;
            float _1047 = _1045;
            if (!_1007)
            {
                _1011 = 1.0;
            }
            float _1049 = _1011;
            float _1051 = _999;
            float _1053 = _1049;
            if (_1005)
            {
                float _1055 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1051 = _1055;
            }
            float _1057 = _1051;
            float _1059 = _859;
            if (_1007)
            {
                float _1061 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1059 = _1061;
            }
            float _1063 = _1059;
            if (_1003)
            {
                float _1065 = _1023 * _1015;
                float _1067 = precise::clamp(_1065, 0.0, 1.0);
                _1035 = _1067;
            }
            float _1069 = _1035;
            if (_1005)
            {
                float _1071 = _1031 * _1057;
                float _1073 = precise::clamp(_1071, 0.0, 1.0);
                _1047 = _1073;
            }
            float _1075 = _1047;
            float _1077 = _1069 * _1075;
            _953 = _917;
            if (_1007)
            {
                float _1079 = _1043 * _1063;
                float _1081 = precise::clamp(_1079, 0.0, 1.0);
                _1053 = _1081;
            }
            float _1083 = _1053;
            float _1085 = _1077 * _1083;
            _955 = _1085;
        }
    }
    _957 = false;
    float _1087 = _949;
    float _1089 = _951;
    float _1091 = _953;
    float _1093 = _955;
    float _1095 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1097 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1099 = floor(_1095);
    float _1101 = floor(_1097);
    float _1103 = -_1099;
    float _1105 = _1095 + _1103;
    float _1107 = -_1101;
    float _1109 = _1097 + _1107;
    float2 _4364 = float2(_1105, _1109);
    float _1111 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4364, float2(0.0), isnan(_4364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4364, float2(0.0), isnan(_4364)), level(0.0)).x;
    float _1113 = in.m_91.w;
    float _1115 = trunc(_1113);
    int _1117 = int(_1115);
    int _1119 = _1117 << 5;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1121)];
    float _1123 = as_type<float>(_dmw0.x);
    int _1125 = _1119 + 4;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    float _1129 = as_type<float>(_dmw0.y);
    int _1131 = _1119 + 8;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    float _1135 = as_type<float>(_dmw0.z);
    int _1137 = _1119 + 12;
    uint _1139 = uint(int(uint(_1137) >> uint(2)));
    float _1141 = as_type<float>(_dmw0.w);
    float _1143 = _911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1147 = _1087 + _1145;
    float _1149 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1143);
    float _1151 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1149);
    float _1153 = _911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1155 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1157 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1159 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1153);
    float _1161 = _911 + _1155;
    float _1163 = 1.0 / _1157;
    float _1165 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1159);
    float _1167 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1169 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1171 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1173 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1167);
    float _1175 = _1169 + _1157;
    float _1177 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1171);
    float _1179 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1173);
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1089 + _1181;
    float _1185 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1177);
    float _1187 = _1179 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1189 = _1175 * _1163;
    float _1191 = _1189 * 0.5;
    float _1193 = _1183 * _1183;
    float _1195 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1197 = trunc(_1187);
    int _1199 = int(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1201);
    float _1205 = fma(_1147, _1147, _1193);
    float _1207 = 1.0 / _1203;
    float _1209 = trunc(_1195);
    int _1211 = int(_1209);
    int _1213 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1215 = _1199 + _1213;
    int _1217 = _1215 + 1;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1221 = _1207 * _1219;
    float _1223 = sqrt(_1205);
    bool _1225 = _1221 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1227 = _1221 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1229 = !_1225;
    int _1231 = _1229 ? 0 : 1;
    int _1233 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1235 = _1211 + _1233;
    int _1237 = _1235 + 1;
    int _1239 = _1237 | _1217;
    int _1241 = 2;
    int _1243 = _1237;
    float _1245 = _1091;
    float _1247 = _1205;
    if (!_1225)
    {
        _1241 = 1;
    }
    int _1249 = _1241;
    int _1251 = _1249;
    if (!_1227)
    {
        _1251 = _1231;
    }
    int _1253 = _1251;
    bool _1255 = _1237 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1257 = _1253 << 6;
    bool _1259 = _1239 < 0;
    bool _1261 = _1259 || _1255;
    int _1263 = _1257 + 48;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
    int _1269 = int(_1265) & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    int _1273 = int(_1265) + 1;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    int _1277 = _1273 & 3;
    float _1279 = (*spvDescriptorSet0.vp_c15)._m0[int(_1275)][_1277];
    bool _1281 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1283 = _1217 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1285 = _1283 || _1261;
    int _1287 = _1257 + 56;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c15)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    bool _1305 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(0.5);
    bool _1313 = _1309 || _1311;
    int _1315 = _1257 + 64;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    float _1333 = as_type<float>(_1253);
    if (!_1285)
    {
        int _1335 = _1217 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1337 = _1335 + _1237;
        _1243 = _1337;
    }
    int _1339 = _1243;
    int _1341 = _1257 + 72;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    uint _1345 = uint(int(uint(int(_1343)) >> uint(2)));
    int _1347 = int(_1343) & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    int _1351 = int(_1343) + 1;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    int _1355 = _1351 & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    int _1359 = _1257 + 96;
    uint _1361 = uint(int(uint(_1359) >> uint(2)));
    uint _1363 = uint(int(uint(int(_1361)) >> uint(2)));
    int _1365 = int(_1361) & 3;
    float _1367 = (*spvDescriptorSet0.vp_c15)._m0[int(_1363)][_1365];
    int _1369 = int(_1361) + 1;
    uint _1371 = uint(int(uint(_1369) >> uint(2)));
    int _1373 = _1369 & 3;
    float _1375 = (*spvDescriptorSet0.vp_c15)._m0[int(_1371)][_1373];
    int _1377 = _1257 + 104;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    uint _1381 = uint(int(uint(int(_1379)) >> uint(2)));
    int _1383 = int(_1379) & 3;
    float _1385 = (*spvDescriptorSet0.vp_c15)._m0[int(_1381)][_1383];
    int _1387 = int(_1379) + 1;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    int _1391 = _1387 & 3;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[int(_1389)][_1391];
    float _1395 = _1141 * 2.0;
    float _1397 = _1123 * 2.0;
    float _1399 = _1129 * 2.0;
    float _1401 = _1123 * _1123;
    float _1403 = _1135 * _1395;
    float _1405 = _1129 * _1395;
    float _1407 = _1123 * _1395;
    float _1409 = _1135 * _1135;
    float _1411 = -_1403;
    float _1413 = fma(_1129, _1397, _1411);
    float _1415 = fma(_1129, _1397, _1403);
    float _1417 = fma(_1135, _1397, _1405);
    float _1419 = -_1405;
    float _1421 = fma(_1135, _1397, _1419);
    float _1423 = -_1407;
    float _1425 = fma(_1135, _1399, _1423);
    float _1427 = fma(_1135, _1399, _1407);
    float _1429 = _1129 * _1129;
    int _1431 = as_type<int>(_1129);
    float _1433 = _1399;
    float _1435 = _1135;
    int _1437 = as_type<int>(_1123);
    if (!_1285)
    {
        int _1439 = _1339 << 2;
        _1431 = _1439;
    }
    int _1441 = _1431;
    int _1443 = _1441;
    if (!_1281)
    {
        _1433 = _1087;
    }
    float _1445 = _1433;
    float _1447 = _1445;
    if (!_1281)
    {
        _1435 = _1089;
    }
    float _1449 = _1435;
    float _1451 = _1449;
    if (!_1285)
    {
        uint _1453 = uint(int(uint(_1339) >> uint(2)));
        _1437 = int(_1453);
    }
    int _1455 = _1437;
    if (!_1285)
    {
        int _1457 = 12 & _1441;
        _1443 = _1457;
    }
    int _1459 = _1443;
    bool _1461 = !_1281;
    if (!_1461)
    {
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1467 = _1223 + _1465;
        float _1469 = _1091 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1471 = rsqrt(_1205);
        float _1473 = _1467 * _1463;
        float _1475 = _1473 * 0.15915493667125701904296875;
        float _1477 = _1475 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = _1475 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = fma(_1479, _1469, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1487 = _1471 * _1485;
        float _1489 = _1483 + (-1.0);
        float _1491 = fma(_1147, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1493 = fma(_1183, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1495 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1497 = fma(_1483, _1091, _1495);
        _1447 = _1491;
        _1245 = _1497;
        _1451 = _1493;
        _1247 = _1471;
    }
    float _1499 = _1447;
    float _1501 = _1245;
    float _1503 = _1451;
    float _1505 = _1247;
    float _1507 = _1505;
    if (!_1285)
    {
        int _1509 = _1455 << 4;
        int _1511 = _1509 + _1459;
        _1507 = as_type<float>(_1511);
    }
    float _1513 = _1507;
    float _1515 = -_909;
    float _1517 = _1515 + _1499;
    float _1519 = -_911;
    float _1521 = _1519 + _1501;
    int _1523 = _1257 + 88;
    uint _1525 = uint(int(uint(_1523) >> uint(2)));
    uint _1527 = uint(int(uint(int(_1525)) >> uint(2)));
    int _1529 = int(_1525) & 3;
    float _1531 = (*spvDescriptorSet0.vp_c15)._m0[int(_1527)][_1529];
    int _1533 = int(_1525) + 1;
    uint _1535 = uint(int(uint(_1533) >> uint(2)));
    int _1537 = _1533 & 3;
    float _1539 = (*spvDescriptorSet0.vp_c15)._m0[int(_1535)][_1537];
    float _1541 = fma(_1429, -2.0, 1.0);
    float _1543 = fma(_1401, -2.0, 1.0);
    float _1545 = _1521 * _290;
    float _1547 = _1521 * _326;
    float _1549 = fma(_1409, -2.0, _1541);
    float _1551 = fma(_1409, -2.0, _1543);
    float _1553 = fma(_1429, -2.0, _1543);
    int _1555 = _1257 + 80;
    uint _1557 = uint(int(uint(_1555) >> uint(2)));
    uint _1559 = uint(int(uint(int(_1557)) >> uint(2)));
    int _1561 = int(_1557) & 3;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
    int _1565 = int(_1557) + 1;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    int _1569 = _1565 & 3;
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[int(_1567)][_1569];
    float _1573 = _1161 * _1375;
    float _1575 = fma(_1517, _322, _1547);
    float _1577 = -_913;
    float _1579 = _1577 + _1503;
    float _1581 = _1521 * _338;
    float _1583 = fma(_909, _1367, _1573);
    float _1585 = fma(_1517, _286, _1545);
    float _1587 = fma(_1579, _330, _1575);
    float _1589 = _1513;
    if (!_1285)
    {
        int _1591 = as_type<int>(_1513) + 400;
        uint _1593 = uint(int(uint(_1591) >> uint(2)));
        uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
        int _1597 = int(_1593) & 3;
        float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
        _1589 = _1599;
    }
    float _1601 = _1589;
    float _1603 = fma(_913, _1385, _1583);
    float _1605 = fma(_1517, _334, _1581);
    float _1607 = fma(_1579, _294, _1585);
    float _1609 = _1587 * _1413;
    float _1611 = _1603 + _1393;
    float _1613 = fma(_1579, _342, _1605);
    float _1615 = _1587 * _1551;
    float _1617 = fma(_1607, _1549, _1609);
    float _1619 = _1375;
    if (!_1285)
    {
        float _1621 = floor(_1195);
        _1619 = _1621;
    }
    float _1623 = _1619;
    float _1625 = _1587 * _1427;
    float _1627 = _1161 * _1279;
    float _1629 = _1161 * _1331;
    float _1631 = fma(_1607, _1415, _1615);
    float _1633 = fma(_1607, _1421, _1625);
    float _1635 = fma(_909, _1271, _1627);
    float _1637 = fma(_909, _1323, _1629);
    float _1639 = _330;
    if (!_1285)
    {
        float _1641 = floor(_1187);
        _1639 = _1641;
    }
    float _1643 = _1639;
    float _1645 = fma(_1613, _1417, _1617);
    float _1647 = fma(_1613, _1425, _1631);
    float _1649 = fma(_1613, _1553, _1633);
    float _1651 = fma(_913, _1295, _1635);
    float _1653 = fma(_913, _1349, _1637);
    float _1655 = _909 + _1645;
    float _1657 = _911 + _1647;
    float _1659 = 1.0 / _1611;
    float _1661 = _913 + _1649;
    float _1663 = _1651 + _1303;
    float _1665 = _1653 + _1357;
    float _1667 = _1657;
    float _1669 = _1655;
    float _1671 = _1661;
    float _1673 = _1643;
    float _1675 = _1623;
    if (!_1313)
    {
        float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1679 = _911 + _1677;
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1683 = _909 + _1681;
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1687 = _1679 * _1679;
        float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1691 = _913 + _1689;
        float _1693 = fma(_1683, _1683, _1687);
        float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1697 = fma(_1691, _1691, _1693);
        float _1699 = sqrt(_1697);
        float _1701 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1703 = precise::min(_1699, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1705 = _1703 * _1695;
        float _1707 = _1701 * _1705;
        float _1709 = fma(_1647, _1707, _911);
        float _1711 = fma(_1645, _1707, _909);
        float _1713 = fma(_1649, _1707, _913);
        _1667 = _1709;
        _1669 = _1711;
        _1671 = _1713;
    }
    float _1715 = _1667;
    float _1717 = _1669;
    float _1719 = _1671;
    float _1721 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1723 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1725 = _1663 * _1659;
    float _1727 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1729 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1721);
    float _1731 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1733 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1723);
    bool _1735 = _1725 >= 0.0;
    float _1737 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1729);
    float _1739 = _1665 * _1659;
    float _1741 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1727);
    float _1743 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1731);
    float _1745 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1733);
    float _1747 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1749 = _1725 <= 1.0;
    bool _1751 = _1749 && _1735;
    float _1753 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1741);
    float _1755 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1757 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1759 = _1739 >= 0.0;
    bool _1761 = _1759 && _1751;
    float _1763 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1765 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1767 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1757);
    bool _1769 = _1739 <= 1.0;
    bool _1771 = _1769 && _1761;
    float _1773 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1775 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1777 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1779 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1767);
    float _1781 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1783 = -_1775;
    float _1785 = fma(_1783, _1773, 1.0);
    float _1787 = _1161 * _1571;
    float _1789 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1779);
    float _1791 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1793 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1781);
    float _1795 = fma(_909, _1563, _1787);
    float _1797 = log2(_1785);
    float _1799 = _1781;
    if (_1771)
    {
        float _1801 = float(_1253);
        _1799 = _1801;
    }
    float _1803 = _1799;
    float _1805 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1791);
    float _1807 = fma(_913, _1531, _1795);
    float _1809 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1793);
    if (!_1285)
    {
        float _1811 = -_1643;
        float _1813 = _1187 + _1811;
        _1673 = _1813;
    }
    float _1815 = _1673;
    float _1817 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1805);
    float _1819 = _1807 + _1539;
    float _1821 = 1.0 / _1789;
    float _1823 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1809);
    float _1825 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1817);
    float _1827 = _1825;
    if (!_1285)
    {
        float _1829 = -_1623;
        float _1831 = _1195 + _1829;
        _1675 = _1831;
    }
    float _1833 = _1675;
    float _1835 = _1819 * _1659;
    float _1837 = _1649;
    if (!_1285)
    {
        float _1839 = rint(_1601);
        float _1841 = precise::max(_1839, 0.0);
        uint _1843 = uint(_1841);
        uint _1845 = clamp(_1843, 0u, 65535u);
        _1837 = as_type<float>(_1845);
    }
    float _1847 = _1837;
    float _1849 = _1797 * 0.693147182464599609375;
    float _1851 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1853 = _1803;
    float _1855 = _1851;
    if (_1771)
    {
        float _1857 = rint(_1803);
        float _1859 = precise::max(_1857, 0.0);
        uint _1861 = uint(_1859);
        uint _1863 = clamp(_1861, 0u, 65535u);
        _1853 = as_type<float>(_1863);
    }
    float _1865 = _1853;
    float _1867 = _1823 * _1821;
    float _1869 = _1825 * _1821;
    float _1871 = fma(_1867, 0.5, 0.5);
    float _1873 = fma(_1869, -0.5, 0.5);
    float _1875 = _1815;
    if (!_1285)
    {
        float3 _5640 = float3(_1833, _1815, float(as_type<int>(_1847)));
        float3 _5644 = select(_5640, float3(0.0), isnan(_5640));
        float _1877 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5644.xy, uint(rint(_5644.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5644.xy, uint(rint(_5644.z)), level(0.0)).x;
        _1875 = _1877;
    }
    float _1879 = _1875;
    float _1881 = _1739;
    if (_1771)
    {
        float3 _5659 = float3(_1725, _1739, float(as_type<int>(_1865)));
        float3 _5661 = select(_5659, float3(0.0), isnan(_5659));
        float _1883 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5661.xy, uint(rint(_5661.z)), _1835, level(0.0));
        _1881 = _1883;
    }
    float _1885 = _1881;
    float3 _5671 = float3(_1871, _1873, _1851);
    float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5671, float3(0.0), isnan(_5671)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5671, float3(0.0), isnan(_5671)), level(0.0)).x;
    float3 _5680 = float3(_1871, _1873, _1851);
    float4 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5680, float3(0.0), isnan(_5680)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5680, float3(0.0), isnan(_5680)), level(0.0)).xyzw;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    float _1898 = _1890.w;
    float _1900 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1285)
    {
        _1333 = 1.0;
    }
    float _1902 = _1333;
    bool _1904 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.5);
    bool _1912 = _1908 || _1910;
    float _1914 = _1902;
    if (_1912)
    {
        _1900 = 1.0;
    }
    float _1916 = _1900;
    float _1918 = _1916;
    if (!_1912)
    {
        float _1920 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1922 = _1920 * 0.15915493667125701904296875;
        float _1924 = _1922 * 6.283185482025146484375;
        float _1926 = cos(_1924);
        float _1928 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1930 = _1928 * 0.15915493667125701904296875;
        float _1932 = _1922 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = 1.0 / _1926;
        float _1938 = _1930 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1934 * _1936;
        float _1944 = _1930 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = _1940 * _1942;
        float _1950 = 1.0 / _1948;
        float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1954 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1952;
        float _1956 = 1.0 / _1954;
        float _1958 = _1946 * _1950;
        float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1962 = fma(_1221, _1958, _1960);
        float _1964 = _1962 * _1956;
        float _1966 = precise::clamp(_1964, 0.0, 1.0);
        _1918 = _1966;
    }
    float _1968 = _1918;
    if (!_1285)
    {
        int _1970 = _1339 << 4;
        int _1972 = _1970 + 2048;
        uint _1974 = uint(int(uint(_1972) >> uint(2)));
        uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
        int _1978 = int(_1974) & 3;
        float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
        int _1982 = int(_1974) + 1;
        uint _1984 = uint(int(uint(_1982) >> uint(2)));
        int _1986 = _1982 & 3;
        float _1988 = (*spvDescriptorSet0.vp_c15)._m0[int(_1984)][_1986];
        int _1990 = _1972 + 8;
        uint _1992 = uint(int(uint(_1990) >> uint(2)));
        uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
        int _1996 = int(_1992) & 3;
        float _1998 = (*spvDescriptorSet0.vp_c15)._m0[int(_1994)][_1996];
        int _2000 = int(_1992) + 1;
        uint _2002 = uint(int(uint(_2000) >> uint(2)));
        int _2004 = _2000 & 3;
        float _2006 = (*spvDescriptorSet0.vp_c15)._m0[int(_2002)][_2004];
        float _2008 = _1161 * _1988;
        float _2010 = fma(_909, _1980, _2008);
        float _2012 = fma(_913, _1998, _2010);
        float _2014 = _2012 + _2006;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        float _2018 = -_2016;
        float _2020 = _2018 + _1879;
        float _2022 = fma(_2020, 500.0, 1.5);
        float _2024 = exp2(_2022);
        float _2026 = 0.0 + _2024;
        float _2028 = precise::clamp(_2026, 0.0, 1.0);
        _1914 = _2028;
    }
    float _2030 = _1914;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2034 = _1715 + _2032;
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2038 = _1717 + _2036;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _1719 + _2040;
    float _2044 = _2034 * _2034;
    float _2046 = fma(_2038, _2038, _2044);
    float _2048 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2050 = fma(_2042, _2042, _2046);
    float _2052 = precise::max(0.0, _2048);
    float _2054 = rsqrt(_2050);
    float _2056 = sqrt(_2050);
    float _2058 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2060 = _2038 * _2058;
    float _2062 = _2042 * _2058;
    float _2064 = -_2058;
    float _2066 = -_2052;
    float _2068 = fma(_2034, _2064, _2066);
    float _2070 = _2060 * _2060;
    float _2072 = _2062 * _2062;
    float _2074 = _2070 + _2072;
    float _2076 = sqrt(_2074);
    bool _2078 = _2076 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2082 = _2076 + _2080;
    float _2084 = _1879;
    float _2086 = _2052;
    float _2088 = _2074;
    float _2090 = _2082;
    float _2092 = _2034;
    float _2094 = _2060;
    float _2096 = _2070;
    float _2098 = _2072;
    if (_2078)
    {
        float _2100 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2084 = _2100;
    }
    float _2102 = _2084;
    if (_2078)
    {
        float _2104 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2086 = _2104;
    }
    float _2106 = _2086;
    float _2108 = _2106;
    if (_2078)
    {
        float _2110 = rsqrt(_2074);
        _2088 = _2110;
    }
    float _2112 = _2088;
    if (_2078)
    {
        float _2114 = _2082 * _2102;
        _2090 = _2114;
    }
    float _2116 = _2090;
    if (_2078)
    {
        float _2118 = _2116 * 0.15915493667125701904296875;
        _1855 = _2118;
    }
    float _2120 = _1855;
    float _2122 = _2102;
    if (_2078)
    {
        float _2124 = _2120 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        _2122 = _2126;
    }
    float _2128 = _2122;
    float _2130 = _2116;
    if (_2078)
    {
        float _2132 = _2120 * 6.283185482025146484375;
        float _2134 = cos(_2132);
        _2130 = _2134;
    }
    float _2136 = _2130;
    float _2138 = _2128;
    if (_2078)
    {
        float _2140 = fma(_2128, _2106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2138 = _2140;
    }
    float _2142 = _2138;
    float _2144 = _2142;
    if (!_2078)
    {
        _2108 = _2068;
    }
    float _2146 = _2108;
    float _2148 = _2146;
    if (_2078)
    {
        float _2150 = _2112 * _2142;
        _939 = _2150;
    }
    float _2152 = _939;
    if (_2078)
    {
        float _2154 = _2136 + (-1.0);
        _2092 = _2154;
    }
    float _2156 = _2092;
    float _2158 = _2156;
    if (_2078)
    {
        float _2160 = _2060 * _2152;
        _2094 = _2160;
    }
    float _2162 = _2094;
    if (_2078)
    {
        float _2164 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2164;
    }
    float _2166 = _2144;
    if (!_2078)
    {
        _2158 = _2062;
    }
    float _2168 = _2158;
    float _2170 = _2168;
    if (_2078)
    {
        float _2172 = _2062 * _2152;
        _2170 = _2172;
    }
    float _2174 = _2170;
    if (_2078)
    {
        float _2176 = _2162 * _2162;
        _2096 = _2176;
    }
    float _2178 = _2096;
    if (_2078)
    {
        float _2180 = fma(_2068, _2136, _2166);
        _2148 = _2180;
    }
    float _2182 = _2148;
    if (_2078)
    {
        float _2184 = _2174 * _2174;
        _2098 = _2184;
    }
    float _2186 = _2098;
    float _2188 = fma(_2182, _2182, _2178);
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2192 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2190);
    float _2194 = precise::clamp(_2192, 0.0, 1.0);
    float _2196 = _2188 + _2186;
    float _2198 = -_2194;
    float _2200 = _2198 + 1.0;
    float _2202 = rsqrt(_2196);
    float _2204 = abs(_2200);
    float _2206 = log2(_2204);
    float _2208 = _2202 * _2162;
    float _2210 = _2202 * _2182;
    float _2212 = _2202 * _2174;
    float _2214 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2216 = -_2214;
    float _2218 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2216);
    float _2220 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2222 = -_2212;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2218);
    float _2226 = exp2(_2220);
    float _2228 = fma(_2224, -0.5, 0.5);
    float _2230 = fma(_2224, 0.5, 0.5);
    float _2232 = _2210 + 1.0;
    float _2234 = fma(_2230, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2236 = sqrt(_2228);
    float _2238 = fma(_2230, _2234, -0.212114393711090087890625);
    float _2240 = -_2210;
    float _2242 = fma(_2226, _2232, _2240);
    float _2244 = fma(_2230, _2238, 1.570728778839111328125);
    float _2246 = fma(_2242, 0.5, 0.5);
    float _2248 = _2236 * 0.636619746685028076171875;
    float _2250 = -_2244;
    float _2252 = fma(_2248, _2250, 1.0);
    float2 _6226 = float2(_2252, _2246);
    float3 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6226, float2(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6226, float2(0.0), isnan(_6226)), level(0.0)).xyz;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    bool _2264 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2266 = isnan(0.0);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2272 = _2268 || _2270;
    float _2274 = _789 * _1427;
    float _2276 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2278 = -_1111;
    float _2280 = _2278 + 1.0;
    float _2282 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _2284 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2276);
    float _2286 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2288 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2286);
    float _2290 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2292 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2290);
    float _2294 = _2210;
    if (_2272)
    {
        float _2296 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = abs(_1221);
    float _2302 = log2(_2300);
    float _2304 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2288);
    float _2306 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2292);
    float _2308 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2284);
    float _2310 = _2298;
    if (_2272)
    {
        float _2312 = precise::min(_2298, 20.0);
        _2310 = _2312;
    }
    float _2314 = _2310;
    float _2316 = _909 + _2304;
    float _2318 = _913 + _2306;
    float _2320 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2308);
    float _2322 = _913;
    if (_2272)
    {
        float _2324 = 1.0 / _2314;
        _2322 = _2324;
    }
    float _2326 = _2322;
    float _2328 = -_2316;
    float _2330 = _2328 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2332 = -_2318;
    float _2334 = _2332 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2336 = _1221 <= 8000.0;
    bool _2338 = isnan(_1221);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(8000.0);
    bool _2344 = _2340 || _2342;
    float _2346 = float(_2344);
    out.gl_Position.x = _1823;
    out.gl_Position.y = _1825;
    out.gl_Position.z = _2320;
    out.gl_Position.w = _1789;
    float _2348 = precise::min(_2316, _2330);
    float _2350 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2352 = precise::min(_2318, _2334);
    float _2354 = _2334;
    if (!_2272)
    {
        _2354 = 1.0;
    }
    float _2356 = _2354;
    float _2358 = precise::min(_2348, _2352);
    float _2360 = exp2(_2350);
    float _2362 = _2356;
    if (_2272)
    {
        float _2364 = _2358 * _2326;
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        _2362 = _2366;
    }
    float _2368 = _2362;
    float _2370 = _789 * _1413;
    if (!_1771)
    {
        _1827 = 1.0;
    }
    float _2372 = _1827;
    float _2374 = _1093 * _2368;
    float _2376 = _789 * _1551;
    float _2378 = fma(_787, _1549, _2370);
    float _2380 = _2320 + _1789;
    float _2382 = fma(_787, _1415, _2376);
    float _2384 = fma(_787, _1421, _2274);
    float _2386 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2388 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2390 = precise::clamp(_2388, 0.0, 1.0);
    float _2392 = _2372;
    if (_1771)
    {
        bool _2394 = _1885 >= _1835;
        bool _2396 = isnan(_1885);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan(_1835);
        bool _2402 = _2398 || _2400;
        float _2404 = float(_2402);
        _2392 = _2404;
    }
    float _2406 = _2392;
    float _2408 = fma(_833, _1417, _2378);
    float _2410 = _2380 * 0.5;
    float _2412 = fma(_2390, -2.0, 3.0);
    float _2414 = _2390 * _2390;
    float _2416 = exp2(_2386);
    float _2418 = _2406 * _2030;
    float _2420 = fma(_833, _1425, _2382);
    float _2422 = _2414 * _2412;
    float _2424 = fma(_833, _1553, _2384);
    out.m_93.z = _2410;
    out.m_93.w = _1789;
    bool _2426 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2428 = isnan(_2056);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2434 = _2430 || _2432;
    float _2436 = -_2422;
    float _2438 = _2436 + 1.0;
    float _2440 = _2374 * _1968;
    out.m_95.x = _2408;
    out.m_95.y = _2420;
    out.m_95.z = _2424;
    float _2442 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2422);
    float _2444 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2446 = _2346 * _2442;
    float _2448 = -_2416;
    float _2450 = _2448 + 1.0;
    float _2452 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2456 = _2280 * _2452;
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = _2454 * _1887;
    float _2462 = -_2454;
    float _2464 = _2462 + 1.0;
    float _2466 = -_2458;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2470 = _1898 * _2460;
    float _2472 = _1898 * _2464;
    float _2474 = _2464;
    float _2476 = _2470;
    if (!_2434)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2478 = _2474;
    float _2480 = -_2418;
    float _2482 = fma(_2480, _2468, 1.0);
    float _2484 = precise::clamp(_2482, 0.0, 1.0);
    float _2486 = _2484 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2488 = _2484;
    float _2490 = _2478;
    float _2492 = _2478;
    if (!_2434)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2494 = _2488;
    out.m_97.x = _2486;
    float _2496 = _2262 * _2460;
    float _2498 = fma(_2258, _2470, _1892);
    float _2500 = fma(_2260, _2470, _1894);
    float _2502 = _2494;
    float _2504 = _2494;
    if (!_2434)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2506 = _2476;
    float _2508 = fma(_1898, _2496, _1896);
    out.m_99.x = _2498;
    out.m_99.y = _2500;
    out.m_99.z = _2508;
    out.m_99.w = _2472;
    bool _2510 = !_2434;
    float _2512 = _2506;
    float _2514 = _2506;
    if (!_2510)
    {
        bool _2516 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2518 = isnan(_2056);
        bool _2520 = _2516 || _2518;
        bool _2522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2524 = _2520 || _2522;
        if (!_2524)
        {
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2528 = _2056 + _2526;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2532 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2530;
            float _2534 = 1.0 / _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2544 = _2528 * _2534;
            float _2546 = precise::clamp(_2544, 0.0, 1.0);
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2552 = fma(_2546, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2554 = fma(_2546, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2556 = fma(_2546, _2538, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2504 = _2556;
            _2514 = _2554;
            _2492 = _2552;
            _2558 = true;
        }
        else
        {
            bool _2560 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2562 = isnan(_2056);
            bool _2564 = _2560 || _2562;
            bool _2566 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2568 = _2564 || _2566;
            if (!_2568)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2570 = _2512;
            _2514 = _2570;
            if (!_2568)
            {
                _2502 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2572 = _2502;
            _2504 = _2572;
            if (!_2568)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2574 = _2490;
            bool _2576 = !_2568;
            _2492 = _2574;
            if (!_2576)
            {
                bool _2578 = _2056 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2580 = isnan(_2056);
                bool _2582 = _2578 || _2580;
                bool _2584 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2586 = _2582 || _2584;
                if (!_2586)
                {
                    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2590 = _2056 + _2588;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2592;
                    float _2596 = 1.0 / _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2606 = _2590 * _2596;
                    float _2608 = precise::clamp(_2606, 0.0, 1.0);
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2614 = fma(_2608, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2616 = fma(_2608, _2612, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2618 = fma(_2608, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2504 = _2618;
                    _2514 = _2616;
                    _2492 = _2614;
                    _2558 = true;
                }
                else
                {
                    _2504 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2558 = false;
    float _2620 = _2504;
    float _2622 = _2514;
    float _2624 = _2492;
    float _2626 = _2444 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_101.x = 0.0;
    float _2628 = _2620 * 0.586610972881317138671875;
    bool _2630 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_68.x = _2626;
    float _2632 = fma(_2622, 0.298911988735198974609375, _2628);
    bool _2634 = _1968 > 0.0;
    bool _2636 = isnan(_1968);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan(0.0);
    bool _2642 = _2638 || _2640;
    float _2644 = fma(_2624, 0.114477999508380889892578125, _2632);
    float _2646 = -_2644;
    float _2648 = _2646 + _2622;
    float _2650 = -_2644;
    float _2652 = _2650 + _2620;
    float _2654 = -_2644;
    float _2656 = _2654 + _2624;
    float _2658 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2660 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2662 = fma(_2656, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    bool _2664 = !_2630;
    if (!_2664)
    {
        float _2666 = -_1715;
        float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2670 = -_1717;
        float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2674 = -_1719;
        float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2678 = _2668 * _2668;
        float _2680 = fma(_2672, _2672, _2678);
        float _2682 = fma(_2676, _2676, _2680);
        float _2684 = sqrt(_2682);
        float _2686 = rsqrt(_2682);
        float _2688 = -_2684;
        float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2692 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2694 = precise::clamp(_2692, 0.0, 1.0);
        float _2696 = _2672 * _2686;
        float _2698 = _2668 * _2686;
        float _2700 = abs(_2694);
        float _2702 = log2(_2700);
        float _2704 = _2676 * _2686;
        float _2706 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2708 = _2420 * _2698;
        float _2710 = -_2698;
        float _2712 = -_2706;
        float _2714 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2712);
        float _2716 = fma(_2408, _2696, _2708);
        float _2718 = -_2704;
        float _2720 = fma(_2718, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2714);
        float _2722 = fma(_2424, _2704, _2716);
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2728 = _2720 + _2726;
        float _2730 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2732 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2734 = precise::clamp(_2732, 0.0, 1.0);
        float _2736 = exp2(_2730);
        float _2738 = _2736 * _2734;
        float _2740 = _2724 * _2738;
        float _2742 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2744 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2746 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2742;
        out.m_101.y = _2744;
        out.m_101.z = _2746;
    }
    out.m_103.x = _2658;
    out.m_103.y = _2660;
    out.m_103.z = _2662;
    if (_2642)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_68.x = 0.0;
    float _2748 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2748;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

