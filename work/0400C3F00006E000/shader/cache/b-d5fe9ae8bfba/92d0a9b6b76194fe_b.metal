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
    float4 m_95 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_101 [[user(locn7)]];
    float4 m_99 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
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
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2588 = false;
    bool _953 = false;
    bool _941 = false;
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
        float _2887 = as_type<float>(_138);
        out.gl_Position.z = _2887;
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
        float _2956 = as_type<float>(_174);
        out.gl_Position.z = _2956;
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
    float _270 = _264;
    float _272 = _266;
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
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _386 = as_type<float>(int(gl_VertexIndex));
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _390 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _384);
    float _392 = in.m_78.z;
    float _394 = in.m_74.w;
    float _396 = in.m_72.w;
    float _398 = _184 * _378;
    float _400 = _178 * _378;
    float _402 = _190 * _378;
    float _404 = in.m_76.w;
    float _406 = fma(_182, _376, _398);
    float _408 = fma(_176, _376, _400);
    float _410 = fma(_188, _376, _402);
    float _412 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _416 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _422 = as_type<int>(_386) & 1;
    bool _424 = _422 != 0;
    int _426 = as_type<int>(_386) & 2;
    bool _428 = _426 != 0;
    float _430 = fma(_416, -2.0, _418);
    float _432 = -_420;
    float _434 = fma(_412, 2.0, _432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _440 = _194 > 0.5;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _446 = fma(_180, _380, _408);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _452 = 1.0 / _438;
    float _454 = fma(_186, _380, _406);
    bool _456 = _382 > 0.5;
    float _458 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].w, _388);
    float _460 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[79].z, _414);
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _464 = _462 != 0;
    float _466 = fma(_192, _380, _410);
    float _468 = 1.0 / _444;
    float _470 = in.m_83.x;
    float _472 = in.m_83.y;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _476 = _474 != 0;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _482 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _430);
    float _484 = -_156;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _434);
    float _488 = 1.0 / _450;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _492 = _374 + _490;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _374 + _496;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _502 = _466 + _404;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _510;
    float _514 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = _512 * _468;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _374 + _522;
    float _526 = _480 * _488;
    float _528 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[79].x, _460);
    out.m_85.x = _514;
    out.m_85.y = _516;
    out.m_85.z = _518;
    float _530 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _390);
    float _532 = fma(_526, _524, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _534 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _536 = isnan(_374);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = fma(_520, _492, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _548 = _508 * _452;
    float _550 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _458);
    float _552 = _454 + _394;
    float _554 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _556 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _558 = isnan(_374);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -_544;
    float _570 = _568 + 1.0;
    float _572 = fma(_548, _498, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _574 = _446 + _396;
    float _576 = _470 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _578 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _580 = isnan(_374);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _566 * _570;
    bool _592 = !_424;
    float _594 = _592 ? (-0.5) : 0.5;
    float _596 = -_566;
    float _598 = _596 + 1.0;
    bool _600 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _602 = isnan(_374);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _614 = !_428;
    float _616 = _614 ? (-0.5) : 0.5;
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _594);
    float _620 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _622 = _610 * _598;
    float _624 = _528 * (-0.15915493667125701904296875);
    float _626 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _616);
    float _628 = _612 * _618;
    float _630 = -_616;
    int _632 = _456 ? as_type<int>(_630) : as_type<int>(_616);
    float _634 = _572 * _622;
    float _636 = _620 * _626;
    float _638 = -_594;
    int _640 = _440 ? as_type<int>(_638) : as_type<int>(_594);
    float _642 = -_610;
    float _644 = _642 + 1.0;
    bool _646 = !_476;
    float _648 = _646 ? _616 : as_type<float>(_632);
    float _650 = _616 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _652 = !_464;
    float _654 = _652 ? _594 : as_type<float>(_640);
    float _656 = _594 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _634);
    float _660 = _650 * _322;
    float _662 = _650 * _326;
    float _664 = _650 * _330;
    int _666 = _346 + 8;
    uint _669 = uint(int(uint(_666) >> uint(2)));
    uint _671 = uint(int(uint(int(_669)) >> uint(2)));
    int _673 = int(_669) & 3;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[int(_671)][_673];
    float _677 = fma(_656, _286, _660);
    float _679 = fma(_656, _290, _662);
    float _681 = fma(_656, _294, _664);
    float _683 = _624 * 6.283185482025146484375;
    float _685 = sin(_683);
    float _687 = _636 * _322;
    float _689 = _636 * _326;
    float _691 = _636 * _330;
    uint _693 = uint(int(uint(_346) >> uint(2)));
    uint _695 = uint(int(uint(int(_693)) >> uint(2)));
    int _697 = int(_693) & 3;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[int(_695)][_697];
    int _701 = int(_693) + 1;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    int _705 = _701 & 3;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[int(_703)][_705];
    float _709 = _574 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _711 = -_588;
    float _713 = _711 + 1.0;
    float _715 = fma(_628, _286, _687);
    float _717 = _624 * 6.283185482025146484375;
    float _719 = cos(_717);
    float _721 = fma(_628, _290, _689);
    float _723 = _552 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _725 = _709 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _727 = _544 * _713;
    float _729 = fma(_628, _294, _691);
    float _731 = _502 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[6].y, _725);
    float _735 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _737 = _709 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _739 = _709 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _741 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[8].y, _733);
    float _743 = fma(_532, _590, _658);
    float _745 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[6].x, _737);
    float _747 = _648 * _685;
    float _749 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[6].z, _739);
    float _751 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _753 = _648 * _719;
    float _755 = _741 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _757 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[8].x, _745);
    float _759 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[8].z, _749);
    float _761 = -_747;
    float _763 = fma(_654, _719, _761);
    float _765 = fma(_654, _685, _753);
    float _767 = _757 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _769 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _771 = _755 * _735;
    float _773 = _759 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _775 = fma(_546, _727, _743);
    float _777 = -_550;
    float _779 = _777 + 1.0;
    float _781 = fma(_771, 0.5, 0.5);
    float _783 = -_530;
    float _785 = _783 + 1.0;
    float _787 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _791 = _767 * _751;
    float _793 = _681 + _342;
    float _795 = fma(_787, _334, _715);
    float _797 = fma(_787, _338, _721);
    float _799 = fma(_791, 0.5, 0.5);
    float _801 = fma(_787, _342, _729);
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _805 = _773 * _769;
    float _807 = _765 + (-0.5);
    float _809 = _699 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _811 = fma(_805, 0.5, 0.5);
    float _813 = _707 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _815 = floor(_781);
    float _817 = _789 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _819 = _763 + 0.5;
    float _821 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _823 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = -_817;
    float _827 = -_482;
    float _829 = fma(_825, _807, _827);
    float _831 = _803 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _833 = floor(_799);
    float _835 = fma(_831, _819, _486);
    float _837 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[118].x, _775);
    float _839 = _675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _841 = -_815;
    float _843 = _781 + _841;
    float _845 = floor(_811);
    float _847 = fma(_765, _779, _829);
    float _849 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _837 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _853 = -_785;
    float _855 = fma(_763, _853, _835);
    float _857 = fma(_843, 2.0, -1.0);
    float _859 = _677 + _334;
    float _861 = _679 + _338;
    float _863 = -_833;
    float _865 = _799 + _863;
    float _867 = _857 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_87.x = _821;
    out.m_87.y = _823;
    out.m_87.z = _849;
    out.m_87.w = _851;
    float _869 = fma(_865, 2.0, -1.0);
    float _871 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    out.m_89.x = _855;
    out.m_89.y = _847;
    float _873 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _875 = -_845;
    float _877 = _811 + _875;
    float _879 = _869 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _881 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _883 = fma(_877, 2.0, -1.0);
    float _885 = fma(_879, (*spvDescriptorSet0.vp_c12)._m0[2].x, _871);
    float _887 = fma(_879, (*spvDescriptorSet0.vp_c12)._m0[2].y, _873);
    float _889 = _883 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _891 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _893 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _895 = _891 || _893;
    bool _897 = isnan(1.0);
    bool _899 = _895 || _897;
    float _901 = fma(_879, (*spvDescriptorSet0.vp_c12)._m0[2].z, _881);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].x, _885);
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].y, _887);
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].z, _901);
    float _909 = _903 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _911 = _905 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _913 = _907 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _915 = _795 + _909;
    float _917 = _797 + _911;
    float _919 = _801 + _913;
    float _921 = _907;
    float _923 = _624;
    float _925 = _624;
    float _927 = _869;
    float _929 = _857;
    float _931 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _933 = _883;
    float _935 = _903;
    float _945;
    float _947;
    float _949;
    float _951;
    if (!_899)
    {
        bool _937 = _911 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _939 = !_937;
        _941 = _939;
        if (!_941)
        {
            float _943 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _945 = 0.0;
            _947 = _943;
            _949 = 0.0;
            _951 = 0.0;
            _953 = true;
        }
    }
    if ((!_953) || _941)
    {
        bool _993;
        if (!_941)
        {
            bool _955 = _911 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _957 = isnan(_911);
            bool _959 = _955 || _957;
            bool _961 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _963 = _959 || _961;
            bool _965 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _967 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _969 = !_963;
            bool _971 = _967 && _969;
            float _973 = 0.0;
            if (_971)
            {
                _973 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _975 = _973;
            float _977 = 0.0;
            float _979 = _975;
            if (_971)
            {
                _977 = 0.0;
            }
            float _981 = _977;
            _945 = _981;
            if (_971)
            {
                _921 = 0.0;
            }
            float _983 = _921;
            _949 = _983;
            if (_971)
            {
                float _985 = _975 * 5.0;
                _979 = _985;
            }
            float _987 = _979;
            _947 = _987;
            if (_971)
            {
                _923 = 0.0;
            }
            float _989 = _923;
            bool _991 = !_963;
            _993 = _991 && _965;
            _925 = _989;
            _951 = _989;
        }
        if ((!_993) || _941)
        {
            _941 = false;
            float _995 = _925;
            bool _997 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _999 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1001 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1003 = _851;
            float _1005 = _995;
            _945 = _915;
            _947 = _919;
            _949 = _917;
            if (_997)
            {
                float _1007 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1003 = _1007;
            }
            float _1009 = _1003;
            if (_997)
            {
                float _1011 = abs(_869);
                float _1013 = -_1011;
                float _1015 = _1013 + 1.0;
                _927 = _1015;
            }
            float _1017 = _927;
            if (_999)
            {
                float _1019 = abs(_857);
                float _1021 = -_1019;
                float _1023 = _1021 + 1.0;
                _929 = _1023;
            }
            float _1025 = _929;
            if (!_997)
            {
                _931 = 1.0;
            }
            float _1027 = _931;
            float _1029 = _1027;
            if (_1001)
            {
                float _1031 = abs(_883);
                float _1033 = -_1031;
                float _1035 = _1033 + 1.0;
                _933 = _1035;
            }
            float _1037 = _933;
            if (!_999)
            {
                _935 = 1.0;
            }
            float _1039 = _935;
            float _1041 = _1039;
            if (!_1001)
            {
                _1005 = 1.0;
            }
            float _1043 = _1005;
            float _1045 = _905;
            float _1047 = _1043;
            if (_999)
            {
                float _1049 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1045 = _1049;
            }
            float _1051 = _1045;
            float _1053 = _889;
            if (_1001)
            {
                float _1055 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1053 = _1055;
            }
            float _1057 = _1053;
            if (_997)
            {
                float _1059 = _1017 * _1009;
                float _1061 = precise::clamp(_1059, 0.0, 1.0);
                _1029 = _1061;
            }
            float _1063 = _1029;
            if (_999)
            {
                float _1065 = _1025 * _1051;
                float _1067 = precise::clamp(_1065, 0.0, 1.0);
                _1041 = _1067;
            }
            float _1069 = _1041;
            float _1071 = _1063 * _1069;
            if (_1001)
            {
                float _1073 = _1037 * _1057;
                float _1075 = precise::clamp(_1073, 0.0, 1.0);
                _1047 = _1075;
            }
            float _1077 = _1047;
            float _1079 = _1071 * _1077;
            _951 = _1079;
        }
    }
    _953 = false;
    float _1081 = _945;
    float _1083 = _947;
    float _1085 = _949;
    float _1087 = _951;
    float _1089 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1091 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1093 = floor(_1089);
    float _1095 = floor(_1091);
    float _1097 = -_1093;
    float _1099 = _1089 + _1097;
    float _1101 = -_1095;
    float _1103 = _1091 + _1101;
    float2 _4442 = float2(_1099, _1103);
    float _1105 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4442, float2(0.0), isnan(_4442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4442, float2(0.0), isnan(_4442)), level(0.0)).x;
    float _1107 = in.m_91.w;
    float _1109 = trunc(_1107);
    int _1111 = int(_1109);
    int _1113 = _1111 << 5;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1115)];
    float _1117 = as_type<float>(_dmw0.x);
    int _1119 = _1113 + 4;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    float _1123 = as_type<float>(_dmw0.y);
    int _1125 = _1113 + 8;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    float _1129 = as_type<float>(_dmw0.z);
    int _1131 = _1113 + 12;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    float _1135 = as_type<float>(_dmw0.w);
    float _1137 = _911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1141 = _1081 + _1139;
    float _1143 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1137);
    float _1145 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1147 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1143);
    float _1149 = _911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = _911 + _1145;
    float _1153 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1155 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1161 = 1.0 / _1153;
    float _1163 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1155);
    float _1165 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1157);
    float _1167 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1159);
    float _1169 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1171 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1165);
    float _1173 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1167);
    float _1175 = _1169 + _1153;
    float _1177 = _1171 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1179 = _1173 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1083 + _1181;
    float _1185 = trunc(_1177);
    int _1187 = int(_1185);
    float _1189 = _1175 * _1161;
    float _1191 = _1189 * 0.5;
    float _1193 = _1183 * _1183;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1197 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1195);
    float _1199 = fma(_1141, _1141, _1193);
    float _1201 = trunc(_1179);
    int _1203 = int(_1201);
    float _1205 = 1.0 / _1197;
    int _1207 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1209 = _1187 + _1207;
    int _1211 = _1209 + 1;
    int _1213 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1215 = _1203 + _1213;
    int _1217 = _1215 + 1;
    float _1219 = sqrt(_1199);
    int _1221 = _1211 | _1217;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1225 = _1205 * _1223;
    bool _1227 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1229 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1231 = !_1227;
    int _1233 = _1231 ? 0 : 1;
    int _1235 = 2;
    int _1237 = _1211;
    int _1239 = as_type<int>(_1083);
    float _1241 = _1081;
    float _1243 = _1085;
    if (!_1227)
    {
        _1235 = 1;
    }
    int _1245 = _1235;
    int _1247 = _1245;
    if (!_1229)
    {
        _1247 = _1233;
    }
    int _1249 = _1247;
    bool _1251 = _1211 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1253 = _1249 << 6;
    bool _1255 = _1221 < 0;
    bool _1257 = _1255 || _1251;
    int _1259 = _1253 + 48;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    uint _1263 = uint(int(uint(int(_1261)) >> uint(2)));
    int _1265 = int(_1261) & 3;
    float _1267 = (*spvDescriptorSet0.vp_c15)._m0[int(_1263)][_1265];
    int _1269 = int(_1261) + 1;
    uint _1271 = uint(int(uint(_1269) >> uint(2)));
    int _1273 = _1269 & 3;
    float _1275 = (*spvDescriptorSet0.vp_c15)._m0[int(_1271)][_1273];
    bool _1277 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1279 = _1217 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1281 = _1279 || _1257;
    int _1283 = _1253 + 56;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
    int _1289 = int(_1285) & 3;
    float _1291 = (*spvDescriptorSet0.vp_c15)._m0[int(_1287)][_1289];
    int _1293 = int(_1285) + 1;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    int _1297 = _1293 & 3;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[int(_1295)][_1297];
    bool _1301 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan(0.5);
    bool _1309 = _1305 || _1307;
    int _1311 = _1253 + 64;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = as_type<float>(_1249);
    if (!_1281)
    {
        int _1331 = _1217 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1333 = _1331 + _1211;
        _1237 = _1333;
    }
    int _1335 = _1237;
    int _1337 = _1253 + 72;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    uint _1341 = uint(int(uint(int(_1339)) >> uint(2)));
    int _1343 = int(_1339) & 3;
    float _1345 = (*spvDescriptorSet0.vp_c15)._m0[int(_1341)][_1343];
    int _1347 = int(_1339) + 1;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    int _1351 = _1347 & 3;
    float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
    int _1355 = _1253 + 96;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    int _1373 = _1253 + 104;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    uint _1377 = uint(int(uint(int(_1375)) >> uint(2)));
    int _1379 = int(_1375) & 3;
    float _1381 = (*spvDescriptorSet0.vp_c15)._m0[int(_1377)][_1379];
    int _1383 = int(_1375) + 1;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    int _1387 = _1383 & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    float _1391 = _1135 * 2.0;
    float _1393 = _1117 * 2.0;
    float _1395 = _1123 * 2.0;
    float _1397 = _1123 * _1123;
    float _1399 = _1129 * _1391;
    float _1401 = _1123 * _1391;
    float _1403 = _1117 * _1391;
    float _1405 = _1117 * _1117;
    float _1407 = -_1399;
    float _1409 = fma(_1123, _1393, _1407);
    float _1411 = fma(_1123, _1393, _1399);
    float _1413 = fma(_1129, _1393, _1401);
    float _1415 = -_1401;
    float _1417 = fma(_1129, _1393, _1415);
    float _1419 = -_1403;
    float _1421 = fma(_1129, _1395, _1419);
    float _1423 = fma(_1129, _1395, _1403);
    int _1425 = as_type<int>(_1403);
    float _1427 = _1129;
    int _1429 = as_type<int>(_1123);
    float _1431 = as_type<float>(_1335);
    if (!_1281)
    {
        int _1433 = _1335 << 2;
        _1425 = _1433;
    }
    int _1435 = _1425;
    float _1437 = _1129 * _1129;
    float _1439 = as_type<float>(_1435);
    if (!_1277)
    {
        _1427 = _1083;
    }
    float _1441 = _1427;
    float _1443 = _1441;
    if (!_1281)
    {
        uint _1445 = uint(int(uint(_1335) >> uint(2)));
        _1429 = int(_1445);
    }
    int _1447 = _1429;
    if (!_1281)
    {
        int _1449 = 12 & _1435;
        _1239 = _1449;
    }
    int _1451 = _1239;
    bool _1453 = !_1277;
    if (!_1453)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1459 = _1219 + _1457;
        float _1461 = rsqrt(_1199);
        float _1463 = _1459 * _1455;
        float _1465 = _1085 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = _1463 * 0.15915493667125701904296875;
        float _1469 = _1467 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        float _1477 = _1471 + (-1.0);
        float _1479 = fma(_1475, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1481 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1483 = _1461 * _1479;
        float _1485 = fma(_1471, _1085, _1481);
        float _1487 = fma(_1141, _1483, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1489 = fma(_1183, _1483, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1241 = _1487;
        _1243 = _1485;
        _1443 = _1489;
        _1439 = _1471;
    }
    float _1491 = _1241;
    float _1493 = _1243;
    float _1495 = _1443;
    float _1497 = _1439;
    float _1499 = _1497;
    if (!_1281)
    {
        int _1501 = _1447 << 4;
        int _1503 = _1501 + _1451;
        _1499 = as_type<float>(_1503);
    }
    float _1505 = _1499;
    float _1507 = -_909;
    float _1509 = _1507 + _1491;
    float _1511 = fma(_1405, -2.0, 1.0);
    float _1513 = -_911;
    float _1515 = _1513 + _1493;
    int _1517 = _1253 + 80;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    float _1535 = fma(_1397, -2.0, 1.0);
    float _1537 = _1515 * _290;
    float _1539 = fma(_1397, -2.0, _1511);
    float _1541 = _1151 * _1371;
    float _1543 = _1515 * _326;
    float _1545 = _1515 * _338;
    int _1547 = _1253 + 88;
    uint _1549 = uint(int(uint(_1547) >> uint(2)));
    uint _1551 = uint(int(uint(int(_1549)) >> uint(2)));
    int _1553 = int(_1549) & 3;
    float _1555 = (*spvDescriptorSet0.vp_c15)._m0[int(_1551)][_1553];
    int _1557 = int(_1549) + 1;
    uint _1559 = uint(int(uint(_1557) >> uint(2)));
    int _1561 = _1557 & 3;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
    float _1565 = fma(_909, _1363, _1541);
    float _1567 = fma(_1509, _322, _1543);
    float _1569 = -_913;
    float _1571 = _1569 + _1495;
    float _1573 = fma(_1509, _286, _1537);
    float _1575 = fma(_913, _1381, _1565);
    float _1577 = fma(_1509, _334, _1545);
    float _1579 = fma(_1437, -2.0, _1535);
    float _1581 = _1505;
    if (!_1281)
    {
        int _1583 = as_type<int>(_1505) + 400;
        uint _1585 = uint(int(uint(_1583) >> uint(2)));
        uint _1587 = uint(int(uint(int(_1585)) >> uint(2)));
        int _1589 = int(_1585) & 3;
        float _1591 = (*spvDescriptorSet0.vp_c15)._m0[int(_1587)][_1589];
        _1581 = _1591;
    }
    float _1593 = _1581;
    float _1595 = _1575 + _1389;
    float _1597 = fma(_1571, _330, _1567);
    float _1599 = fma(_1437, -2.0, _1511);
    float _1601 = fma(_1571, _294, _1573);
    float _1603 = fma(_1571, _342, _1577);
    float _1605 = _1597 * _1409;
    float _1607 = _1151 * _1275;
    float _1609 = _334;
    float _1611 = _1597;
    if (!_1281)
    {
        float _1613 = floor(_1177);
        _1609 = _1613;
    }
    float _1615 = _1609;
    float _1617 = _1597 * _1599;
    float _1619 = _1597 * _1423;
    float _1621 = _1151 * _1327;
    float _1623 = fma(_1601, _1579, _1605);
    float _1625 = fma(_1601, _1411, _1617);
    float _1627 = fma(_1601, _1417, _1619);
    float _1629 = fma(_909, _1267, _1607);
    float _1631 = _342;
    if (!_1281)
    {
        float _1633 = floor(_1179);
        _1631 = _1633;
    }
    float _1635 = _1631;
    float _1637 = fma(_909, _1319, _1621);
    float _1639 = fma(_1603, _1413, _1623);
    float _1641 = fma(_1603, _1421, _1625);
    float _1643 = fma(_1603, _1539, _1627);
    float _1645 = fma(_913, _1291, _1629);
    float _1647 = fma(_913, _1345, _1637);
    float _1649 = _909 + _1639;
    float _1651 = 1.0 / _1595;
    float _1653 = _911 + _1641;
    float _1655 = _913 + _1643;
    float _1657 = _1645 + _1299;
    float _1659 = _1647 + _1353;
    float _1661 = _1653;
    float _1663 = _1649;
    float _1665 = _1655;
    float _1667 = _1643;
    float _1669 = _1635;
    if (!_1309)
    {
        float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1673 = _911 + _1671;
        float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1677 = _909 + _1675;
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = _1673 * _1673;
        float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1685 = _913 + _1683;
        float _1687 = fma(_1677, _1677, _1681);
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1691 = fma(_1685, _1685, _1687);
        float _1693 = sqrt(_1691);
        float _1695 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1697 = precise::min(_1693, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1699 = _1697 * _1689;
        float _1701 = _1695 * _1699;
        float _1703 = fma(_1641, _1701, _911);
        float _1705 = fma(_1639, _1701, _909);
        float _1707 = fma(_1643, _1701, _913);
        _1661 = _1703;
        _1663 = _1705;
        _1665 = _1707;
    }
    float _1709 = _1661;
    float _1711 = _1663;
    float _1713 = _1665;
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1717 = _1657 * _1651;
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1721 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1715);
    float _1725 = _1659 * _1651;
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1719);
    float _1729 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1721);
    float _1731 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1723);
    bool _1733 = _1717 >= 0.0;
    float _1735 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1737 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1727);
    float _1739 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_1281)
    {
        float _1741 = rint(_1593);
        float _1743 = precise::max(_1741, 0.0);
        uint _1745 = uint(_1743);
        uint _1747 = clamp(_1745, 0u, 65535u);
        _1667 = as_type<float>(_1747);
    }
    float _1749 = _1667;
    float _1751 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1729);
    bool _1753 = _1717 <= 1.0;
    bool _1755 = _1753 && _1733;
    float _1757 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1735);
    float _1759 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1761 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1763 = _1725 >= 0.0;
    bool _1765 = _1763 && _1755;
    float _1767 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1757);
    float _1769 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1771 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1773 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1775 = _1725 <= 1.0;
    bool _1777 = _1775 && _1765;
    float _1779 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1771);
    float _1783 = -_1773;
    float _1785 = fma(_1783, _1769, 1.0);
    float _1787 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1281)
    {
        float _1789 = -_1635;
        float _1791 = _1179 + _1789;
        _1611 = _1791;
    }
    float _1793 = _1611;
    float _1795 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1781);
    float _1797 = _1151 * _1533;
    float _1799 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1801 = log2(_1785);
    float _1803 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1795);
    float _1805 = fma(_909, _1525, _1797);
    float _1807 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1799);
    float _1809 = _1803;
    if (_1777)
    {
        float _1811 = float(_1249);
        _1329 = _1811;
    }
    float _1813 = _1329;
    float _1815 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1787);
    float _1817 = fma(_913, _1555, _1805);
    float _1819 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1807);
    float _1821 = 1.0 / _1803;
    float _1823 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1815);
    float _1825 = _1817 + _1563;
    float _1827 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1819);
    float _1829 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1823);
    float _1831 = _1823;
    float _1833 = _1813;
    float _1835 = _1829;
    if (!_1281)
    {
        float _1837 = -_1615;
        float _1839 = _1177 + _1837;
        _1831 = _1839;
    }
    float _1841 = _1831;
    float _1843 = _1825 * _1651;
    float _1845 = _1805;
    if (_1777)
    {
        float _1847 = rint(_1813);
        float _1849 = precise::max(_1847, 0.0);
        uint _1851 = uint(_1849);
        uint _1853 = clamp(_1851, 0u, 65535u);
        _1845 = as_type<float>(_1853);
    }
    float _1855 = _1845;
    float _1857 = _1801 * 0.693147182464599609375;
    float _1859 = _1827 * _1821;
    float _1861 = _1829 * _1821;
    float _1863 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1865 = fma(_1859, 0.5, 0.5);
    float _1867 = fma(_1861, -0.5, 0.5);
    float _1869 = _1793;
    if (!_1281)
    {
        float3 _5716 = float3(_1841, _1793, float(as_type<int>(_1749)));
        float3 _5720 = select(_5716, float3(0.0), isnan(_5716));
        float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5720.xy, uint(rint(_5720.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5720.xy, uint(rint(_5720.z)), level(0.0)).x;
        _1869 = _1871;
    }
    float _1873 = _1869;
    float _1875 = _1725;
    if (_1777)
    {
        float3 _5735 = float3(_1717, _1725, float(as_type<int>(_1855)));
        float3 _5737 = select(_5735, float3(0.0), isnan(_5735));
        float _1877 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5737.xy, uint(rint(_5737.z)), _1843, level(0.0));
        _1875 = _1877;
    }
    float _1879 = _1875;
    float3 _5747 = float3(_1865, _1867, _1863);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5747, float3(0.0), isnan(_5747)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5747, float3(0.0), isnan(_5747)), level(0.0)).x;
    float3 _5756 = float3(_1865, _1867, _1863);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5756, float3(0.0), isnan(_5756)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5756, float3(0.0), isnan(_5756)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1281)
    {
        _1833 = 1.0;
    }
    float _1896 = _1833;
    bool _1898 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.5);
    bool _1906 = _1902 || _1904;
    float _1908 = _1896;
    if (_1906)
    {
        _1894 = 1.0;
    }
    float _1910 = _1894;
    float _1912 = _1910;
    float _1914 = _1888;
    float _1916 = _1886;
    if (!_1906)
    {
        float _1918 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1920 = _1918 * 0.15915493667125701904296875;
        float _1922 = _1920 * 6.283185482025146484375;
        float _1924 = cos(_1922);
        float _1926 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1928 = _1926 * 0.15915493667125701904296875;
        float _1930 = _1920 * 6.283185482025146484375;
        float _1932 = sin(_1930);
        float _1934 = 1.0 / _1924;
        float _1936 = _1928 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = _1932 * _1934;
        float _1942 = _1928 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        float _1946 = _1938 * _1940;
        float _1948 = 1.0 / _1946;
        float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1952 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1950;
        float _1954 = 1.0 / _1952;
        float _1956 = _1944 * _1948;
        float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1960 = fma(_1225, _1956, _1958);
        float _1962 = _1960 * _1954;
        float _1964 = precise::clamp(_1962, 0.0, 1.0);
        _1912 = _1964;
    }
    float _1966 = _1912;
    if (!_1281)
    {
        int _1968 = _1335 << 4;
        int _1970 = _1968 + 2048;
        uint _1972 = uint(int(uint(_1970) >> uint(2)));
        uint _1974 = uint(int(uint(int(_1972)) >> uint(2)));
        int _1976 = int(_1972) & 3;
        float _1978 = (*spvDescriptorSet0.vp_c15)._m0[int(_1974)][_1976];
        int _1980 = int(_1972) + 1;
        uint _1982 = uint(int(uint(_1980) >> uint(2)));
        int _1984 = _1980 & 3;
        float _1986 = (*spvDescriptorSet0.vp_c15)._m0[int(_1982)][_1984];
        int _1988 = _1970 + 8;
        uint _1990 = uint(int(uint(_1988) >> uint(2)));
        uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
        int _1994 = int(_1990) & 3;
        float _1996 = (*spvDescriptorSet0.vp_c15)._m0[int(_1992)][_1994];
        int _1998 = int(_1990) + 1;
        uint _2000 = uint(int(uint(_1998) >> uint(2)));
        int _2002 = _1998 & 3;
        float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
        float _2006 = _1151 * _1986;
        float _2008 = fma(_909, _1978, _2006);
        float _2010 = fma(_913, _1996, _2008);
        float _2012 = _2010 + _2004;
        float _2014 = precise::clamp(_2012, 0.0, 1.0);
        float _2016 = -_2014;
        float _2018 = _2016 + _1873;
        float _2020 = fma(_2018, 500.0, 1.5);
        float _2022 = exp2(_2020);
        float _2024 = 0.0 + _2022;
        float _2026 = precise::clamp(_2024, 0.0, 1.0);
        _1431 = as_type<float>(_1970);
        _1908 = _2026;
    }
    float _2028 = _1431;
    float _2030 = _1908;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2034 = _1709 + _2032;
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2038 = _1711 + _2036;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _1713 + _2040;
    float _2044 = _2034 * _2034;
    float _2046 = fma(_2038, _2038, _2044);
    float _2048 = fma(_2042, _2042, _2046);
    float _2050 = rsqrt(_2048);
    float _2052 = sqrt(_2048);
    float _2054 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2056 = _2038 * _2054;
    float _2058 = _2042 * _2054;
    float _2060 = _2056 * _2056;
    float _2062 = _2058 * _2058;
    float _2064 = _2060 + _2062;
    float _2066 = sqrt(_2064);
    bool _2068 = _2066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2072 = _2066 + _2070;
    float _2074 = _2028;
    float _2076 = _2064;
    float _2078 = _2072;
    float _2080 = _2056;
    float _2082 = _2058;
    float _2084 = _2060;
    float _2086 = _2062;
    if (_2068)
    {
        float _2088 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2074 = _2088;
    }
    float _2090 = _2074;
    if (_2068)
    {
        float _2092 = rsqrt(_2064);
        _2076 = _2092;
    }
    float _2094 = _2076;
    if (_2068)
    {
        float _2096 = _2072 * _2090;
        _2078 = _2096;
    }
    float _2098 = _2078;
    if (_2068)
    {
        float _2100 = _2098 * 0.15915493667125701904296875;
        _1669 = _2100;
    }
    float _2102 = _1669;
    float _2104 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2106 = _1873;
    float _2108 = _2104;
    if (_2068)
    {
        float _2110 = _2102 * 6.283185482025146484375;
        float _2112 = sin(_2110);
        _2106 = _2112;
    }
    float _2114 = _2106;
    float _2116 = precise::max(0.0, _2104);
    float _2118 = _2098;
    float _2120 = _2116;
    if (_2068)
    {
        float _2122 = _2102 * 6.283185482025146484375;
        float _2124 = cos(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    float _2128 = -_2054;
    float _2130 = -_2116;
    float _2132 = fma(_2034, _2128, _2130);
    float _2134 = _2132;
    if (_2068)
    {
        float _2136 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2136;
    }
    float _2138 = _2120;
    float _2140 = _2138;
    if (_2068)
    {
        float _2142 = fma(_2114, _2138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2140 = _2142;
    }
    float _2144 = _2140;
    float _2146 = _2144;
    if (_2068)
    {
        float _2148 = _2094 * _2144;
        _2146 = _2148;
    }
    float _2150 = _2146;
    if (_2068)
    {
        float _2152 = _2126 + (-1.0);
        _2108 = _2152;
    }
    float _2154 = _2108;
    float _2156 = _2154;
    if (_2068)
    {
        float _2158 = _2056 * _2150;
        _2080 = _2158;
    }
    float _2160 = _2080;
    if (_2068)
    {
        float _2162 = _2058 * _2150;
        _2082 = _2162;
    }
    float _2164 = _2082;
    if (_2068)
    {
        float _2166 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2166;
    }
    float _2168 = _2156;
    if (_2068)
    {
        float _2170 = _2160 * _2160;
        _2084 = _2170;
    }
    float _2172 = _2084;
    if (_2068)
    {
        float _2174 = _2164 * _2164;
        _2086 = _2174;
    }
    float _2176 = _2086;
    if (_2068)
    {
        float _2178 = fma(_2132, _2126, _2168);
        _2134 = _2178;
    }
    float _2180 = _2134;
    float _2182 = fma(_2180, _2180, _2172);
    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2186 = fma(_2052, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2184);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = _2182 + _2176;
    float _2192 = -_2188;
    float _2194 = _2192 + 1.0;
    float _2196 = rsqrt(_2190);
    float _2198 = abs(_2194);
    float _2200 = log2(_2198);
    float _2202 = _2196 * _2160;
    float _2204 = _2196 * _2180;
    float _2206 = _2196 * _2164;
    float _2208 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2210 = -_2208;
    float _2212 = fma(_2204, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2210);
    float _2214 = -_2206;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2212);
    float _2218 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2220 = fma(_2216, -0.5, 0.5);
    float _2222 = fma(_2216, 0.5, 0.5);
    float _2224 = _2204 + 1.0;
    float _2226 = exp2(_2218);
    float _2228 = fma(_2222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2230 = fma(_2222, _2228, -0.212114393711090087890625);
    float _2232 = sqrt(_2220);
    float _2234 = fma(_2222, _2230, 1.570728778839111328125);
    float _2236 = -_2204;
    float _2238 = fma(_2226, _2224, _2236);
    float _2240 = fma(_2238, 0.5, 0.5);
    float _2242 = _2232 * 0.636619746685028076171875;
    float _2244 = -_2234;
    float _2246 = fma(_2242, _2244, 1.0);
    float2 _6294 = float2(_2246, _2240);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6294, float2(0.0), isnan(_6294)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6294, float2(0.0), isnan(_6294)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    bool _2258 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2266 = _2262 || _2264;
    float _2268 = abs(_1225);
    float _2270 = log2(_2268);
    float _2272 = _861 * _1423;
    float _2274 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2276 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _2278 = -_1105;
    float _2280 = _2278 + 1.0;
    bool _2282 = _1225 <= 8000.0;
    bool _2284 = isnan(_1225);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(8000.0);
    bool _2290 = _2286 || _2288;
    float _2292 = float(_2290);
    float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2296 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2294);
    float _2298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2300 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2298);
    float _2302 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    if (_2266)
    {
        float _2304 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2302 = _2304;
    }
    float _2306 = _2302;
    float _2308 = exp2(_2274);
    float _2310 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2296);
    float _2312 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2300);
    float _2314 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2316 = _2306;
    if (_2266)
    {
        float _2318 = precise::min(_2306, 20.0);
        _2316 = _2318;
    }
    float _2320 = _2316;
    float _2322 = _909 + _2310;
    float _2324 = _913 + _2312;
    float _2326 = -_2322;
    float _2328 = _2326 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2330 = _2320;
    if (_2266)
    {
        float _2332 = 1.0 / _2320;
        _2330 = _2332;
    }
    float _2334 = _2330;
    float _2336 = -_2324;
    float _2338 = _2336 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2340 = precise::min(_2322, _2328);
    float _2342 = precise::min(_2324, _2338);
    float _2344 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2346 = exp2(_2314);
    float _2348 = precise::min(_2340, _2342);
    float _2350 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2344);
    float _2352 = _2340;
    if (!_2266)
    {
        _2352 = 1.0;
    }
    float _2354 = _2352;
    float _2356 = _861 * _1599;
    float _2358 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2350);
    float _2360 = _2354;
    if (_2266)
    {
        float _2362 = _2348 * _2334;
        float _2364 = precise::clamp(_2362, 0.0, 1.0);
        _2360 = _2364;
    }
    float _2366 = _2360;
    float _2368 = fma(_859, _1411, _2356);
    bool _2370 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2372 = isnan(_2052);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2378 = _2374 || _2376;
    float _2380 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2358);
    float _2382 = _1087 * _2366;
    float _2384 = _861 * _1409;
    float _2386 = fma(_859, _1417, _2272);
    out.gl_Position.x = _1827;
    out.gl_Position.y = _1829;
    out.gl_Position.z = _2380;
    out.gl_Position.w = _1803;
    float _2388 = fma(_859, _1579, _2384);
    float _2390 = _2380 + _1803;
    float _2392 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2394 = precise::clamp(_2392, 0.0, 1.0);
    float _2396 = fma(_793, _1421, _2368);
    float _2398 = fma(_793, _1413, _2388);
    float _2400 = fma(_793, _1539, _2386);
    float _2402 = fma(_2394, -2.0, 3.0);
    float _2404 = _2394 * _2394;
    float _2406 = _2390 * 0.5;
    out.m_93.x = _2398;
    out.m_93.y = _2396;
    out.m_93.z = _2400;
    float _2408 = _2404 * _2402;
    float _2410 = _2382 * _1966;
    float _2412 = -_2308;
    float _2414 = _2412 + 1.0;
    if (!_1777)
    {
        _1835 = 1.0;
    }
    float _2416 = _1835;
    float _2418 = -_2408;
    float _2420 = _2418 + 1.0;
    float _2422 = _2416;
    if (_1777)
    {
        bool _2424 = _1879 >= _1843;
        bool _2426 = isnan(_1879);
        bool _2428 = _2424 || _2426;
        bool _2430 = isnan(_1843);
        bool _2432 = _2428 || _2430;
        float _2434 = float(_2432);
        _2422 = _2434;
    }
    float _2436 = _2422;
    float _2438 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.z = _2406;
    out.m_95.w = _1803;
    float _2440 = fma(_2420, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2408);
    float _2442 = _2410 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2444 = _2438 * _1881;
    float _2446 = _2436 * _2030;
    float _2448 = _2292 * _2440;
    if (!_2378)
    {
        _1809 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2450 = _1809;
    float _2452 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2454 = _2280 * _2452;
    float _2456 = precise::clamp(_2454, 0.0, 1.0);
    float _2458 = -_2456;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2462 = _1892 * _2444;
    float _2464 = -_2446;
    float _2466 = fma(_2464, _2460, 1.0);
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    float _2470 = _2256 * _2444;
    float _2472 = -_2438;
    float _2474 = _2472 + 1.0;
    float _2476 = fma(_2252, _2462, _1886);
    float _2478 = fma(_2254, _2462, _1888);
    float _2480 = fma(_1892, _2470, _1890);
    float _2482 = _1892 * _2474;
    float _2484 = _2468 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2486 = _2474;
    float _2488 = _2468;
    float _2490 = _2484;
    float _2492 = _2450;
    float _2494 = _2450;
    if (!_2378)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2496 = _1914;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2378)
    {
        _1916 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2502 = _1916;
    out.m_97.x = _2476;
    out.m_97.y = _2478;
    out.m_97.z = _2480;
    out.m_97.w = _2482;
    float _2504 = _2502;
    float _2506 = _2502;
    if (!_2378)
    {
        _2486 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2508 = _2486;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2378)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2514 = _2488;
    out.m_99.x = _2484;
    float _2516 = _2514;
    float _2518 = _2514;
    if (!_2378)
    {
        _2490 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2520 = _2490;
    bool _2522 = !_2378;
    float _2524 = _2520;
    float _2526 = _2520;
    if (!_2522)
    {
        bool _2528 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2530 = isnan(_2052);
        bool _2532 = _2528 || _2530;
        bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2536 = _2532 || _2534;
        if (!_2536)
        {
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = _2052 + _2538;
            float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2542;
            float _2546 = 1.0 / _2544;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2568 = _2540 * _2546;
            float _2570 = precise::clamp(_2568, 0.0, 1.0);
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2576 = fma(_2570, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2506 = _2578;
            _2518 = _2584;
            _2500 = _2576;
            _2512 = _2582;
            _2494 = _2580;
            _2526 = _2586;
            _2588 = true;
        }
        else
        {
            bool _2590 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2592 = isnan(_2052);
            bool _2594 = _2590 || _2592;
            bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2598 = _2594 || _2596;
            if (!_2598)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2600 = _2498;
            _2500 = _2600;
            if (!_2598)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2602 = _2504;
            _2506 = _2602;
            if (!_2598)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2604 = _2492;
            _2494 = _2604;
            if (!_2598)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2606 = _2510;
            _2512 = _2606;
            if (!_2598)
            {
                _2516 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2608 = _2516;
            _2518 = _2608;
            if (!_2598)
            {
                _2524 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2610 = _2524;
            bool _2612 = !_2598;
            _2526 = _2610;
            if (!_2612)
            {
                bool _2614 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2616 = isnan(_2052);
                bool _2618 = _2614 || _2616;
                bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2622 = _2618 || _2620;
                if (!_2622)
                {
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = _2052 + _2624;
                    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2628;
                    float _2632 = 1.0 / _2630;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2654 = _2626 * _2632;
                    float _2656 = precise::clamp(_2654, 0.0, 1.0);
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2662 = fma(_2656, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2506 = _2664;
                    _2518 = _2670;
                    _2500 = _2662;
                    _2512 = _2668;
                    _2494 = _2666;
                    _2526 = _2672;
                    _2588 = true;
                }
                else
                {
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2518 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2526 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2588 = false;
    float _2674 = _2506;
    float _2676 = _2518;
    float _2678 = _2500;
    float _2680 = _2512;
    float _2682 = _2494;
    float _2684 = _2526;
    float _2686 = fma(_2396, -0.5, 0.5);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = -_2674;
    float _2692 = _2690 + _2676;
    float _2694 = -_2678;
    float _2696 = _2694 + _2680;
    out.m_101.x = 0.0;
    float _2698 = fma(_2688, _2692, _2674);
    float _2700 = -_2682;
    float _2702 = _2700 + _2684;
    float _2704 = fma(_2688, _2696, _2678);
    float _2706 = _2698 * 0.586610972881317138671875;
    bool _2708 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2710 = fma(_2688, _2702, _2682);
    float _2712 = _2442 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2714 = fma(_2704, 0.298911988735198974609375, _2706);
    bool _2716 = _1966 > 0.0;
    bool _2718 = isnan(_1966);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan(0.0);
    bool _2724 = _2720 || _2722;
    float _2726 = fma(_2710, 0.114477999508380889892578125, _2714);
    out.m_68.x = _2712;
    float _2728 = -_2726;
    float _2730 = _2704 + _2728;
    float _2732 = -_2726;
    float _2734 = _2698 + _2732;
    float _2736 = -_2726;
    float _2738 = _2710 + _2736;
    float _2740 = fma(_2730, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2726);
    float _2742 = fma(_2734, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2726);
    float _2744 = fma(_2738, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2726);
    bool _2746 = !_2708;
    if (!_2746)
    {
        float _2748 = -_1709;
        float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2752 = -_1711;
        float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2756 = -_1713;
        float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2760 = _2750 * _2750;
        float _2762 = fma(_2754, _2754, _2760);
        float _2764 = fma(_2758, _2758, _2762);
        float _2766 = sqrt(_2764);
        float _2768 = rsqrt(_2764);
        float _2770 = -_2766;
        float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2774 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2776 = precise::clamp(_2774, 0.0, 1.0);
        float _2778 = _2754 * _2768;
        float _2780 = _2750 * _2768;
        float _2782 = abs(_2776);
        float _2784 = log2(_2782);
        float _2786 = _2758 * _2768;
        float _2788 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2790 = _2396 * _2780;
        float _2792 = -_2780;
        float _2794 = -_2788;
        float _2796 = fma(_2792, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2794);
        float _2798 = fma(_2398, _2778, _2790);
        float _2800 = -_2786;
        float _2802 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2796);
        float _2804 = fma(_2400, _2786, _2798);
        float _2806 = precise::clamp(_2804, 0.0, 1.0);
        float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2810 = _2802 + _2808;
        float _2812 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2814 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2816 = precise::clamp(_2814, 0.0, 1.0);
        float _2818 = exp2(_2812);
        float _2820 = _2818 * _2816;
        float _2822 = _2806 * _2820;
        float _2824 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2826 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2828 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2824;
        out.m_101.y = _2826;
        out.m_101.z = _2828;
    }
    out.m_103.x = _2740;
    out.m_103.y = _2742;
    out.m_103.z = _2744;
    if (_2724)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_68.x = 0.0;
    float _2830 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2830;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2588 = false;
    bool _953 = false;
    bool _941 = false;
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
        float _2887 = as_type<float>(_138);
        out.gl_Position.z = _2887;
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
        float _2956 = as_type<float>(_174);
        out.gl_Position.z = _2956;
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
    float _270 = _264;
    float _272 = _266;
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
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _386 = as_type<float>(int(gl_VertexIndex));
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _390 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _384);
    float _392 = in.m_78.z;
    float _394 = in.m_74.w;
    float _396 = in.m_72.w;
    float _398 = _184 * _378;
    float _400 = _178 * _378;
    float _402 = _190 * _378;
    float _404 = in.m_76.w;
    float _406 = fma(_182, _376, _398);
    float _408 = fma(_176, _376, _400);
    float _410 = fma(_188, _376, _402);
    float _412 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _416 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _422 = as_type<int>(_386) & 1;
    bool _424 = _422 != 0;
    int _426 = as_type<int>(_386) & 2;
    bool _428 = _426 != 0;
    float _430 = fma(_416, -2.0, _418);
    float _432 = -_420;
    float _434 = fma(_412, 2.0, _432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _440 = _194 > 0.5;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _446 = fma(_180, _380, _408);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _452 = 1.0 / _438;
    float _454 = fma(_186, _380, _406);
    bool _456 = _382 > 0.5;
    float _458 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].w, _388);
    float _460 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[79].z, _414);
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _464 = _462 != 0;
    float _466 = fma(_192, _380, _410);
    float _468 = 1.0 / _444;
    float _470 = in.m_83.x;
    float _472 = in.m_83.y;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _476 = _474 != 0;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _482 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _430);
    float _484 = -_156;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _434);
    float _488 = 1.0 / _450;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _492 = _374 + _490;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _374 + _496;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _502 = _466 + _404;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _510;
    float _514 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = _512 * _468;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _374 + _522;
    float _526 = _480 * _488;
    float _528 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[79].x, _460);
    out.m_85.x = _514;
    out.m_85.y = _516;
    out.m_85.z = _518;
    float _530 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _390);
    float _532 = fma(_526, _524, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _534 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _536 = isnan(_374);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = fma(_520, _492, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _548 = _508 * _452;
    float _550 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _458);
    float _552 = _454 + _394;
    float _554 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _556 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _558 = isnan(_374);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -_544;
    float _570 = _568 + 1.0;
    float _572 = fma(_548, _498, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _574 = _446 + _396;
    float _576 = _470 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _578 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _580 = isnan(_374);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _566 * _570;
    bool _592 = !_424;
    float _594 = _592 ? (-0.5) : 0.5;
    float _596 = -_566;
    float _598 = _596 + 1.0;
    bool _600 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _602 = isnan(_374);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _614 = !_428;
    float _616 = _614 ? (-0.5) : 0.5;
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _594);
    float _620 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _622 = _610 * _598;
    float _624 = _528 * (-0.15915493667125701904296875);
    float _626 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _616);
    float _628 = _612 * _618;
    float _630 = -_616;
    int _632 = _456 ? as_type<int>(_630) : as_type<int>(_616);
    float _634 = _572 * _622;
    float _636 = _620 * _626;
    float _638 = -_594;
    int _640 = _440 ? as_type<int>(_638) : as_type<int>(_594);
    float _642 = -_610;
    float _644 = _642 + 1.0;
    bool _646 = !_476;
    float _648 = _646 ? _616 : as_type<float>(_632);
    float _650 = _616 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _652 = !_464;
    float _654 = _652 ? _594 : as_type<float>(_640);
    float _656 = _594 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _634);
    float _660 = _650 * _322;
    float _662 = _650 * _326;
    float _664 = _650 * _330;
    int _666 = _346 + 8;
    uint _669 = uint(int(uint(_666) >> uint(2)));
    uint _671 = uint(int(uint(int(_669)) >> uint(2)));
    int _673 = int(_669) & 3;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[int(_671)][_673];
    float _677 = fma(_656, _286, _660);
    float _679 = fma(_656, _290, _662);
    float _681 = fma(_656, _294, _664);
    float _683 = _624 * 6.283185482025146484375;
    float _685 = sin(_683);
    float _687 = _636 * _322;
    float _689 = _636 * _326;
    float _691 = _636 * _330;
    uint _693 = uint(int(uint(_346) >> uint(2)));
    uint _695 = uint(int(uint(int(_693)) >> uint(2)));
    int _697 = int(_693) & 3;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[int(_695)][_697];
    int _701 = int(_693) + 1;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    int _705 = _701 & 3;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[int(_703)][_705];
    float _709 = _574 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _711 = -_588;
    float _713 = _711 + 1.0;
    float _715 = fma(_628, _286, _687);
    float _717 = _624 * 6.283185482025146484375;
    float _719 = cos(_717);
    float _721 = fma(_628, _290, _689);
    float _723 = _552 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _725 = _709 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _727 = _544 * _713;
    float _729 = fma(_628, _294, _691);
    float _731 = _502 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[6].y, _725);
    float _735 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _737 = _709 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _739 = _709 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _741 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[8].y, _733);
    float _743 = fma(_532, _590, _658);
    float _745 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[6].x, _737);
    float _747 = _648 * _685;
    float _749 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[6].z, _739);
    float _751 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _753 = _648 * _719;
    float _755 = _741 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _757 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[8].x, _745);
    float _759 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[8].z, _749);
    float _761 = -_747;
    float _763 = fma(_654, _719, _761);
    float _765 = fma(_654, _685, _753);
    float _767 = _757 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _769 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _771 = _755 * _735;
    float _773 = _759 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _775 = fma(_546, _727, _743);
    float _777 = -_550;
    float _779 = _777 + 1.0;
    float _781 = fma(_771, 0.5, 0.5);
    float _783 = -_530;
    float _785 = _783 + 1.0;
    float _787 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _791 = _767 * _751;
    float _793 = _681 + _342;
    float _795 = fma(_787, _334, _715);
    float _797 = fma(_787, _338, _721);
    float _799 = fma(_791, 0.5, 0.5);
    float _801 = fma(_787, _342, _729);
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _805 = _773 * _769;
    float _807 = _765 + (-0.5);
    float _809 = _699 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _811 = fma(_805, 0.5, 0.5);
    float _813 = _707 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _815 = floor(_781);
    float _817 = _789 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _819 = _763 + 0.5;
    float _821 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _823 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = -_817;
    float _827 = -_482;
    float _829 = fma(_825, _807, _827);
    float _831 = _803 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _833 = floor(_799);
    float _835 = fma(_831, _819, _486);
    float _837 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[118].x, _775);
    float _839 = _675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _841 = -_815;
    float _843 = _781 + _841;
    float _845 = floor(_811);
    float _847 = fma(_765, _779, _829);
    float _849 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _837 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _853 = -_785;
    float _855 = fma(_763, _853, _835);
    float _857 = fma(_843, 2.0, -1.0);
    float _859 = _677 + _334;
    float _861 = _679 + _338;
    float _863 = -_833;
    float _865 = _799 + _863;
    float _867 = _857 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_87.x = _821;
    out.m_87.y = _823;
    out.m_87.z = _849;
    out.m_87.w = _851;
    float _869 = fma(_865, 2.0, -1.0);
    float _871 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    out.m_89.x = _855;
    out.m_89.y = _847;
    float _873 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _875 = -_845;
    float _877 = _811 + _875;
    float _879 = _869 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _881 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _883 = fma(_877, 2.0, -1.0);
    float _885 = fma(_879, (*spvDescriptorSet0.vp_c12)._m0[2].x, _871);
    float _887 = fma(_879, (*spvDescriptorSet0.vp_c12)._m0[2].y, _873);
    float _889 = _883 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _891 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _893 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _895 = _891 || _893;
    bool _897 = isnan(1.0);
    bool _899 = _895 || _897;
    float _901 = fma(_879, (*spvDescriptorSet0.vp_c12)._m0[2].z, _881);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].x, _885);
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].y, _887);
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].z, _901);
    float _909 = _903 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _911 = _905 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _913 = _907 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _915 = _795 + _909;
    float _917 = _797 + _911;
    float _919 = _801 + _913;
    float _921 = _907;
    float _923 = _624;
    float _925 = _624;
    float _927 = _869;
    float _929 = _857;
    float _931 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _933 = _883;
    float _935 = _903;
    float _945;
    float _947;
    float _949;
    float _951;
    if (!_899)
    {
        bool _937 = _911 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _939 = !_937;
        _941 = _939;
        if (!_941)
        {
            float _943 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _945 = 0.0;
            _947 = _943;
            _949 = 0.0;
            _951 = 0.0;
            _953 = true;
        }
    }
    if ((!_953) || _941)
    {
        bool _993;
        if (!_941)
        {
            bool _955 = _911 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _957 = isnan(_911);
            bool _959 = _955 || _957;
            bool _961 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _963 = _959 || _961;
            bool _965 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _967 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _969 = !_963;
            bool _971 = _967 && _969;
            float _973 = 0.0;
            if (_971)
            {
                _973 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _975 = _973;
            float _977 = 0.0;
            float _979 = _975;
            if (_971)
            {
                _977 = 0.0;
            }
            float _981 = _977;
            _945 = _981;
            if (_971)
            {
                _921 = 0.0;
            }
            float _983 = _921;
            _949 = _983;
            if (_971)
            {
                float _985 = _975 * 5.0;
                _979 = _985;
            }
            float _987 = _979;
            _947 = _987;
            if (_971)
            {
                _923 = 0.0;
            }
            float _989 = _923;
            bool _991 = !_963;
            _993 = _991 && _965;
            _925 = _989;
            _951 = _989;
        }
        if ((!_993) || _941)
        {
            _941 = false;
            float _995 = _925;
            bool _997 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _999 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1001 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1003 = _851;
            float _1005 = _995;
            _945 = _915;
            _947 = _919;
            _949 = _917;
            if (_997)
            {
                float _1007 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1003 = _1007;
            }
            float _1009 = _1003;
            if (_997)
            {
                float _1011 = abs(_869);
                float _1013 = -_1011;
                float _1015 = _1013 + 1.0;
                _927 = _1015;
            }
            float _1017 = _927;
            if (_999)
            {
                float _1019 = abs(_857);
                float _1021 = -_1019;
                float _1023 = _1021 + 1.0;
                _929 = _1023;
            }
            float _1025 = _929;
            if (!_997)
            {
                _931 = 1.0;
            }
            float _1027 = _931;
            float _1029 = _1027;
            if (_1001)
            {
                float _1031 = abs(_883);
                float _1033 = -_1031;
                float _1035 = _1033 + 1.0;
                _933 = _1035;
            }
            float _1037 = _933;
            if (!_999)
            {
                _935 = 1.0;
            }
            float _1039 = _935;
            float _1041 = _1039;
            if (!_1001)
            {
                _1005 = 1.0;
            }
            float _1043 = _1005;
            float _1045 = _905;
            float _1047 = _1043;
            if (_999)
            {
                float _1049 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1045 = _1049;
            }
            float _1051 = _1045;
            float _1053 = _889;
            if (_1001)
            {
                float _1055 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1053 = _1055;
            }
            float _1057 = _1053;
            if (_997)
            {
                float _1059 = _1017 * _1009;
                float _1061 = precise::clamp(_1059, 0.0, 1.0);
                _1029 = _1061;
            }
            float _1063 = _1029;
            if (_999)
            {
                float _1065 = _1025 * _1051;
                float _1067 = precise::clamp(_1065, 0.0, 1.0);
                _1041 = _1067;
            }
            float _1069 = _1041;
            float _1071 = _1063 * _1069;
            if (_1001)
            {
                float _1073 = _1037 * _1057;
                float _1075 = precise::clamp(_1073, 0.0, 1.0);
                _1047 = _1075;
            }
            float _1077 = _1047;
            float _1079 = _1071 * _1077;
            _951 = _1079;
        }
    }
    _953 = false;
    float _1081 = _945;
    float _1083 = _947;
    float _1085 = _949;
    float _1087 = _951;
    float _1089 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1091 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1093 = floor(_1089);
    float _1095 = floor(_1091);
    float _1097 = -_1093;
    float _1099 = _1089 + _1097;
    float _1101 = -_1095;
    float _1103 = _1091 + _1101;
    float2 _4442 = float2(_1099, _1103);
    float _1105 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4442, float2(0.0), isnan(_4442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4442, float2(0.0), isnan(_4442)), level(0.0)).x;
    float _1107 = in.m_91.w;
    float _1109 = trunc(_1107);
    int _1111 = int(_1109);
    int _1113 = _1111 << 5;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1115)];
    float _1117 = as_type<float>(_dmw0.x);
    int _1119 = _1113 + 4;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    float _1123 = as_type<float>(_dmw0.y);
    int _1125 = _1113 + 8;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    float _1129 = as_type<float>(_dmw0.z);
    int _1131 = _1113 + 12;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    float _1135 = as_type<float>(_dmw0.w);
    float _1137 = _911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1141 = _1081 + _1139;
    float _1143 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1137);
    float _1145 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1147 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1143);
    float _1149 = _911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = _911 + _1145;
    float _1153 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1155 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1161 = 1.0 / _1153;
    float _1163 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1155);
    float _1165 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1157);
    float _1167 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1159);
    float _1169 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1171 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1165);
    float _1173 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1167);
    float _1175 = _1169 + _1153;
    float _1177 = _1171 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1179 = _1173 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1083 + _1181;
    float _1185 = trunc(_1177);
    int _1187 = int(_1185);
    float _1189 = _1175 * _1161;
    float _1191 = _1189 * 0.5;
    float _1193 = _1183 * _1183;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1197 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1195);
    float _1199 = fma(_1141, _1141, _1193);
    float _1201 = trunc(_1179);
    int _1203 = int(_1201);
    float _1205 = 1.0 / _1197;
    int _1207 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1209 = _1187 + _1207;
    int _1211 = _1209 + 1;
    int _1213 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1215 = _1203 + _1213;
    int _1217 = _1215 + 1;
    float _1219 = sqrt(_1199);
    int _1221 = _1211 | _1217;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1225 = _1205 * _1223;
    bool _1227 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1229 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1231 = !_1227;
    int _1233 = _1231 ? 0 : 1;
    int _1235 = 2;
    int _1237 = _1211;
    int _1239 = as_type<int>(_1083);
    float _1241 = _1081;
    float _1243 = _1085;
    if (!_1227)
    {
        _1235 = 1;
    }
    int _1245 = _1235;
    int _1247 = _1245;
    if (!_1229)
    {
        _1247 = _1233;
    }
    int _1249 = _1247;
    bool _1251 = _1211 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1253 = _1249 << 6;
    bool _1255 = _1221 < 0;
    bool _1257 = _1255 || _1251;
    int _1259 = _1253 + 48;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    uint _1263 = uint(int(uint(int(_1261)) >> uint(2)));
    int _1265 = int(_1261) & 3;
    float _1267 = (*spvDescriptorSet0.vp_c15)._m0[int(_1263)][_1265];
    int _1269 = int(_1261) + 1;
    uint _1271 = uint(int(uint(_1269) >> uint(2)));
    int _1273 = _1269 & 3;
    float _1275 = (*spvDescriptorSet0.vp_c15)._m0[int(_1271)][_1273];
    bool _1277 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1279 = _1217 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1281 = _1279 || _1257;
    int _1283 = _1253 + 56;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
    int _1289 = int(_1285) & 3;
    float _1291 = (*spvDescriptorSet0.vp_c15)._m0[int(_1287)][_1289];
    int _1293 = int(_1285) + 1;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    int _1297 = _1293 & 3;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[int(_1295)][_1297];
    bool _1301 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan(0.5);
    bool _1309 = _1305 || _1307;
    int _1311 = _1253 + 64;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = as_type<float>(_1249);
    if (!_1281)
    {
        int _1331 = _1217 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1333 = _1331 + _1211;
        _1237 = _1333;
    }
    int _1335 = _1237;
    int _1337 = _1253 + 72;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    uint _1341 = uint(int(uint(int(_1339)) >> uint(2)));
    int _1343 = int(_1339) & 3;
    float _1345 = (*spvDescriptorSet0.vp_c15)._m0[int(_1341)][_1343];
    int _1347 = int(_1339) + 1;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    int _1351 = _1347 & 3;
    float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
    int _1355 = _1253 + 96;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    int _1373 = _1253 + 104;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    uint _1377 = uint(int(uint(int(_1375)) >> uint(2)));
    int _1379 = int(_1375) & 3;
    float _1381 = (*spvDescriptorSet0.vp_c15)._m0[int(_1377)][_1379];
    int _1383 = int(_1375) + 1;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    int _1387 = _1383 & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    float _1391 = _1135 * 2.0;
    float _1393 = _1117 * 2.0;
    float _1395 = _1123 * 2.0;
    float _1397 = _1123 * _1123;
    float _1399 = _1129 * _1391;
    float _1401 = _1123 * _1391;
    float _1403 = _1117 * _1391;
    float _1405 = _1117 * _1117;
    float _1407 = -_1399;
    float _1409 = fma(_1123, _1393, _1407);
    float _1411 = fma(_1123, _1393, _1399);
    float _1413 = fma(_1129, _1393, _1401);
    float _1415 = -_1401;
    float _1417 = fma(_1129, _1393, _1415);
    float _1419 = -_1403;
    float _1421 = fma(_1129, _1395, _1419);
    float _1423 = fma(_1129, _1395, _1403);
    int _1425 = as_type<int>(_1403);
    float _1427 = _1129;
    int _1429 = as_type<int>(_1123);
    float _1431 = as_type<float>(_1335);
    if (!_1281)
    {
        int _1433 = _1335 << 2;
        _1425 = _1433;
    }
    int _1435 = _1425;
    float _1437 = _1129 * _1129;
    float _1439 = as_type<float>(_1435);
    if (!_1277)
    {
        _1427 = _1083;
    }
    float _1441 = _1427;
    float _1443 = _1441;
    if (!_1281)
    {
        uint _1445 = uint(int(uint(_1335) >> uint(2)));
        _1429 = int(_1445);
    }
    int _1447 = _1429;
    if (!_1281)
    {
        int _1449 = 12 & _1435;
        _1239 = _1449;
    }
    int _1451 = _1239;
    bool _1453 = !_1277;
    if (!_1453)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1459 = _1219 + _1457;
        float _1461 = rsqrt(_1199);
        float _1463 = _1459 * _1455;
        float _1465 = _1085 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = _1463 * 0.15915493667125701904296875;
        float _1469 = _1467 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        float _1477 = _1471 + (-1.0);
        float _1479 = fma(_1475, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1481 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1483 = _1461 * _1479;
        float _1485 = fma(_1471, _1085, _1481);
        float _1487 = fma(_1141, _1483, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1489 = fma(_1183, _1483, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1241 = _1487;
        _1243 = _1485;
        _1443 = _1489;
        _1439 = _1471;
    }
    float _1491 = _1241;
    float _1493 = _1243;
    float _1495 = _1443;
    float _1497 = _1439;
    float _1499 = _1497;
    if (!_1281)
    {
        int _1501 = _1447 << 4;
        int _1503 = _1501 + _1451;
        _1499 = as_type<float>(_1503);
    }
    float _1505 = _1499;
    float _1507 = -_909;
    float _1509 = _1507 + _1491;
    float _1511 = fma(_1405, -2.0, 1.0);
    float _1513 = -_911;
    float _1515 = _1513 + _1493;
    int _1517 = _1253 + 80;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    float _1535 = fma(_1397, -2.0, 1.0);
    float _1537 = _1515 * _290;
    float _1539 = fma(_1397, -2.0, _1511);
    float _1541 = _1151 * _1371;
    float _1543 = _1515 * _326;
    float _1545 = _1515 * _338;
    int _1547 = _1253 + 88;
    uint _1549 = uint(int(uint(_1547) >> uint(2)));
    uint _1551 = uint(int(uint(int(_1549)) >> uint(2)));
    int _1553 = int(_1549) & 3;
    float _1555 = (*spvDescriptorSet0.vp_c15)._m0[int(_1551)][_1553];
    int _1557 = int(_1549) + 1;
    uint _1559 = uint(int(uint(_1557) >> uint(2)));
    int _1561 = _1557 & 3;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
    float _1565 = fma(_909, _1363, _1541);
    float _1567 = fma(_1509, _322, _1543);
    float _1569 = -_913;
    float _1571 = _1569 + _1495;
    float _1573 = fma(_1509, _286, _1537);
    float _1575 = fma(_913, _1381, _1565);
    float _1577 = fma(_1509, _334, _1545);
    float _1579 = fma(_1437, -2.0, _1535);
    float _1581 = _1505;
    if (!_1281)
    {
        int _1583 = as_type<int>(_1505) + 400;
        uint _1585 = uint(int(uint(_1583) >> uint(2)));
        uint _1587 = uint(int(uint(int(_1585)) >> uint(2)));
        int _1589 = int(_1585) & 3;
        float _1591 = (*spvDescriptorSet0.vp_c15)._m0[int(_1587)][_1589];
        _1581 = _1591;
    }
    float _1593 = _1581;
    float _1595 = _1575 + _1389;
    float _1597 = fma(_1571, _330, _1567);
    float _1599 = fma(_1437, -2.0, _1511);
    float _1601 = fma(_1571, _294, _1573);
    float _1603 = fma(_1571, _342, _1577);
    float _1605 = _1597 * _1409;
    float _1607 = _1151 * _1275;
    float _1609 = _334;
    float _1611 = _1597;
    if (!_1281)
    {
        float _1613 = floor(_1177);
        _1609 = _1613;
    }
    float _1615 = _1609;
    float _1617 = _1597 * _1599;
    float _1619 = _1597 * _1423;
    float _1621 = _1151 * _1327;
    float _1623 = fma(_1601, _1579, _1605);
    float _1625 = fma(_1601, _1411, _1617);
    float _1627 = fma(_1601, _1417, _1619);
    float _1629 = fma(_909, _1267, _1607);
    float _1631 = _342;
    if (!_1281)
    {
        float _1633 = floor(_1179);
        _1631 = _1633;
    }
    float _1635 = _1631;
    float _1637 = fma(_909, _1319, _1621);
    float _1639 = fma(_1603, _1413, _1623);
    float _1641 = fma(_1603, _1421, _1625);
    float _1643 = fma(_1603, _1539, _1627);
    float _1645 = fma(_913, _1291, _1629);
    float _1647 = fma(_913, _1345, _1637);
    float _1649 = _909 + _1639;
    float _1651 = 1.0 / _1595;
    float _1653 = _911 + _1641;
    float _1655 = _913 + _1643;
    float _1657 = _1645 + _1299;
    float _1659 = _1647 + _1353;
    float _1661 = _1653;
    float _1663 = _1649;
    float _1665 = _1655;
    float _1667 = _1643;
    float _1669 = _1635;
    if (!_1309)
    {
        float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1673 = _911 + _1671;
        float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1677 = _909 + _1675;
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = _1673 * _1673;
        float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1685 = _913 + _1683;
        float _1687 = fma(_1677, _1677, _1681);
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1691 = fma(_1685, _1685, _1687);
        float _1693 = sqrt(_1691);
        float _1695 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1697 = precise::min(_1693, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1699 = _1697 * _1689;
        float _1701 = _1695 * _1699;
        float _1703 = fma(_1641, _1701, _911);
        float _1705 = fma(_1639, _1701, _909);
        float _1707 = fma(_1643, _1701, _913);
        _1661 = _1703;
        _1663 = _1705;
        _1665 = _1707;
    }
    float _1709 = _1661;
    float _1711 = _1663;
    float _1713 = _1665;
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1717 = _1657 * _1651;
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1721 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1715);
    float _1725 = _1659 * _1651;
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1719);
    float _1729 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1721);
    float _1731 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1723);
    bool _1733 = _1717 >= 0.0;
    float _1735 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1737 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1727);
    float _1739 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_1281)
    {
        float _1741 = rint(_1593);
        float _1743 = precise::max(_1741, 0.0);
        uint _1745 = uint(_1743);
        uint _1747 = clamp(_1745, 0u, 65535u);
        _1667 = as_type<float>(_1747);
    }
    float _1749 = _1667;
    float _1751 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1729);
    bool _1753 = _1717 <= 1.0;
    bool _1755 = _1753 && _1733;
    float _1757 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1735);
    float _1759 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1761 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1763 = _1725 >= 0.0;
    bool _1765 = _1763 && _1755;
    float _1767 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1757);
    float _1769 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1771 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1773 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1775 = _1725 <= 1.0;
    bool _1777 = _1775 && _1765;
    float _1779 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1771);
    float _1783 = -_1773;
    float _1785 = fma(_1783, _1769, 1.0);
    float _1787 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1281)
    {
        float _1789 = -_1635;
        float _1791 = _1179 + _1789;
        _1611 = _1791;
    }
    float _1793 = _1611;
    float _1795 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1781);
    float _1797 = _1151 * _1533;
    float _1799 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1801 = log2(_1785);
    float _1803 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1795);
    float _1805 = fma(_909, _1525, _1797);
    float _1807 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1799);
    float _1809 = _1803;
    if (_1777)
    {
        float _1811 = float(_1249);
        _1329 = _1811;
    }
    float _1813 = _1329;
    float _1815 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1787);
    float _1817 = fma(_913, _1555, _1805);
    float _1819 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1807);
    float _1821 = 1.0 / _1803;
    float _1823 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1815);
    float _1825 = _1817 + _1563;
    float _1827 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1819);
    float _1829 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1823);
    float _1831 = _1823;
    float _1833 = _1813;
    float _1835 = _1829;
    if (!_1281)
    {
        float _1837 = -_1615;
        float _1839 = _1177 + _1837;
        _1831 = _1839;
    }
    float _1841 = _1831;
    float _1843 = _1825 * _1651;
    float _1845 = _1805;
    if (_1777)
    {
        float _1847 = rint(_1813);
        float _1849 = precise::max(_1847, 0.0);
        uint _1851 = uint(_1849);
        uint _1853 = clamp(_1851, 0u, 65535u);
        _1845 = as_type<float>(_1853);
    }
    float _1855 = _1845;
    float _1857 = _1801 * 0.693147182464599609375;
    float _1859 = _1827 * _1821;
    float _1861 = _1829 * _1821;
    float _1863 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1865 = fma(_1859, 0.5, 0.5);
    float _1867 = fma(_1861, -0.5, 0.5);
    float _1869 = _1793;
    if (!_1281)
    {
        float3 _5716 = float3(_1841, _1793, float(as_type<int>(_1749)));
        float3 _5720 = select(_5716, float3(0.0), isnan(_5716));
        float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5720.xy, uint(rint(_5720.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5720.xy, uint(rint(_5720.z)), level(0.0)).x;
        _1869 = _1871;
    }
    float _1873 = _1869;
    float _1875 = _1725;
    if (_1777)
    {
        float3 _5735 = float3(_1717, _1725, float(as_type<int>(_1855)));
        float3 _5737 = select(_5735, float3(0.0), isnan(_5735));
        float _1877 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5737.xy, uint(rint(_5737.z)), _1843, level(0.0));
        _1875 = _1877;
    }
    float _1879 = _1875;
    float3 _5747 = float3(_1865, _1867, _1863);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5747, float3(0.0), isnan(_5747)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5747, float3(0.0), isnan(_5747)), level(0.0)).x;
    float3 _5756 = float3(_1865, _1867, _1863);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5756, float3(0.0), isnan(_5756)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5756, float3(0.0), isnan(_5756)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1281)
    {
        _1833 = 1.0;
    }
    float _1896 = _1833;
    bool _1898 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.5);
    bool _1906 = _1902 || _1904;
    float _1908 = _1896;
    if (_1906)
    {
        _1894 = 1.0;
    }
    float _1910 = _1894;
    float _1912 = _1910;
    float _1914 = _1888;
    float _1916 = _1886;
    if (!_1906)
    {
        float _1918 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1920 = _1918 * 0.15915493667125701904296875;
        float _1922 = _1920 * 6.283185482025146484375;
        float _1924 = cos(_1922);
        float _1926 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1928 = _1926 * 0.15915493667125701904296875;
        float _1930 = _1920 * 6.283185482025146484375;
        float _1932 = sin(_1930);
        float _1934 = 1.0 / _1924;
        float _1936 = _1928 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = _1932 * _1934;
        float _1942 = _1928 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        float _1946 = _1938 * _1940;
        float _1948 = 1.0 / _1946;
        float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1952 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1950;
        float _1954 = 1.0 / _1952;
        float _1956 = _1944 * _1948;
        float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1960 = fma(_1225, _1956, _1958);
        float _1962 = _1960 * _1954;
        float _1964 = precise::clamp(_1962, 0.0, 1.0);
        _1912 = _1964;
    }
    float _1966 = _1912;
    if (!_1281)
    {
        int _1968 = _1335 << 4;
        int _1970 = _1968 + 2048;
        uint _1972 = uint(int(uint(_1970) >> uint(2)));
        uint _1974 = uint(int(uint(int(_1972)) >> uint(2)));
        int _1976 = int(_1972) & 3;
        float _1978 = (*spvDescriptorSet0.vp_c15)._m0[int(_1974)][_1976];
        int _1980 = int(_1972) + 1;
        uint _1982 = uint(int(uint(_1980) >> uint(2)));
        int _1984 = _1980 & 3;
        float _1986 = (*spvDescriptorSet0.vp_c15)._m0[int(_1982)][_1984];
        int _1988 = _1970 + 8;
        uint _1990 = uint(int(uint(_1988) >> uint(2)));
        uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
        int _1994 = int(_1990) & 3;
        float _1996 = (*spvDescriptorSet0.vp_c15)._m0[int(_1992)][_1994];
        int _1998 = int(_1990) + 1;
        uint _2000 = uint(int(uint(_1998) >> uint(2)));
        int _2002 = _1998 & 3;
        float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
        float _2006 = _1151 * _1986;
        float _2008 = fma(_909, _1978, _2006);
        float _2010 = fma(_913, _1996, _2008);
        float _2012 = _2010 + _2004;
        float _2014 = precise::clamp(_2012, 0.0, 1.0);
        float _2016 = -_2014;
        float _2018 = _2016 + _1873;
        float _2020 = fma(_2018, 500.0, 1.5);
        float _2022 = exp2(_2020);
        float _2024 = 0.0 + _2022;
        float _2026 = precise::clamp(_2024, 0.0, 1.0);
        _1431 = as_type<float>(_1970);
        _1908 = _2026;
    }
    float _2028 = _1431;
    float _2030 = _1908;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2034 = _1709 + _2032;
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2038 = _1711 + _2036;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _1713 + _2040;
    float _2044 = _2034 * _2034;
    float _2046 = fma(_2038, _2038, _2044);
    float _2048 = fma(_2042, _2042, _2046);
    float _2050 = rsqrt(_2048);
    float _2052 = sqrt(_2048);
    float _2054 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2056 = _2038 * _2054;
    float _2058 = _2042 * _2054;
    float _2060 = _2056 * _2056;
    float _2062 = _2058 * _2058;
    float _2064 = _2060 + _2062;
    float _2066 = sqrt(_2064);
    bool _2068 = _2066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2072 = _2066 + _2070;
    float _2074 = _2028;
    float _2076 = _2064;
    float _2078 = _2072;
    float _2080 = _2056;
    float _2082 = _2058;
    float _2084 = _2060;
    float _2086 = _2062;
    if (_2068)
    {
        float _2088 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2074 = _2088;
    }
    float _2090 = _2074;
    if (_2068)
    {
        float _2092 = rsqrt(_2064);
        _2076 = _2092;
    }
    float _2094 = _2076;
    if (_2068)
    {
        float _2096 = _2072 * _2090;
        _2078 = _2096;
    }
    float _2098 = _2078;
    if (_2068)
    {
        float _2100 = _2098 * 0.15915493667125701904296875;
        _1669 = _2100;
    }
    float _2102 = _1669;
    float _2104 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2106 = _1873;
    float _2108 = _2104;
    if (_2068)
    {
        float _2110 = _2102 * 6.283185482025146484375;
        float _2112 = sin(_2110);
        _2106 = _2112;
    }
    float _2114 = _2106;
    float _2116 = precise::max(0.0, _2104);
    float _2118 = _2098;
    float _2120 = _2116;
    if (_2068)
    {
        float _2122 = _2102 * 6.283185482025146484375;
        float _2124 = cos(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    float _2128 = -_2054;
    float _2130 = -_2116;
    float _2132 = fma(_2034, _2128, _2130);
    float _2134 = _2132;
    if (_2068)
    {
        float _2136 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2136;
    }
    float _2138 = _2120;
    float _2140 = _2138;
    if (_2068)
    {
        float _2142 = fma(_2114, _2138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2140 = _2142;
    }
    float _2144 = _2140;
    float _2146 = _2144;
    if (_2068)
    {
        float _2148 = _2094 * _2144;
        _2146 = _2148;
    }
    float _2150 = _2146;
    if (_2068)
    {
        float _2152 = _2126 + (-1.0);
        _2108 = _2152;
    }
    float _2154 = _2108;
    float _2156 = _2154;
    if (_2068)
    {
        float _2158 = _2056 * _2150;
        _2080 = _2158;
    }
    float _2160 = _2080;
    if (_2068)
    {
        float _2162 = _2058 * _2150;
        _2082 = _2162;
    }
    float _2164 = _2082;
    if (_2068)
    {
        float _2166 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2166;
    }
    float _2168 = _2156;
    if (_2068)
    {
        float _2170 = _2160 * _2160;
        _2084 = _2170;
    }
    float _2172 = _2084;
    if (_2068)
    {
        float _2174 = _2164 * _2164;
        _2086 = _2174;
    }
    float _2176 = _2086;
    if (_2068)
    {
        float _2178 = fma(_2132, _2126, _2168);
        _2134 = _2178;
    }
    float _2180 = _2134;
    float _2182 = fma(_2180, _2180, _2172);
    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2186 = fma(_2052, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2184);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = _2182 + _2176;
    float _2192 = -_2188;
    float _2194 = _2192 + 1.0;
    float _2196 = rsqrt(_2190);
    float _2198 = abs(_2194);
    float _2200 = log2(_2198);
    float _2202 = _2196 * _2160;
    float _2204 = _2196 * _2180;
    float _2206 = _2196 * _2164;
    float _2208 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2210 = -_2208;
    float _2212 = fma(_2204, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2210);
    float _2214 = -_2206;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2212);
    float _2218 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2220 = fma(_2216, -0.5, 0.5);
    float _2222 = fma(_2216, 0.5, 0.5);
    float _2224 = _2204 + 1.0;
    float _2226 = exp2(_2218);
    float _2228 = fma(_2222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2230 = fma(_2222, _2228, -0.212114393711090087890625);
    float _2232 = sqrt(_2220);
    float _2234 = fma(_2222, _2230, 1.570728778839111328125);
    float _2236 = -_2204;
    float _2238 = fma(_2226, _2224, _2236);
    float _2240 = fma(_2238, 0.5, 0.5);
    float _2242 = _2232 * 0.636619746685028076171875;
    float _2244 = -_2234;
    float _2246 = fma(_2242, _2244, 1.0);
    float2 _6294 = float2(_2246, _2240);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6294, float2(0.0), isnan(_6294)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6294, float2(0.0), isnan(_6294)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    bool _2258 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2266 = _2262 || _2264;
    float _2268 = abs(_1225);
    float _2270 = log2(_2268);
    float _2272 = _861 * _1423;
    float _2274 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2276 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _2278 = -_1105;
    float _2280 = _2278 + 1.0;
    bool _2282 = _1225 <= 8000.0;
    bool _2284 = isnan(_1225);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(8000.0);
    bool _2290 = _2286 || _2288;
    float _2292 = float(_2290);
    float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2296 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2294);
    float _2298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2300 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2298);
    float _2302 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    if (_2266)
    {
        float _2304 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2302 = _2304;
    }
    float _2306 = _2302;
    float _2308 = exp2(_2274);
    float _2310 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2296);
    float _2312 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2300);
    float _2314 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2316 = _2306;
    if (_2266)
    {
        float _2318 = precise::min(_2306, 20.0);
        _2316 = _2318;
    }
    float _2320 = _2316;
    float _2322 = _909 + _2310;
    float _2324 = _913 + _2312;
    float _2326 = -_2322;
    float _2328 = _2326 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2330 = _2320;
    if (_2266)
    {
        float _2332 = 1.0 / _2320;
        _2330 = _2332;
    }
    float _2334 = _2330;
    float _2336 = -_2324;
    float _2338 = _2336 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2340 = precise::min(_2322, _2328);
    float _2342 = precise::min(_2324, _2338);
    float _2344 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2346 = exp2(_2314);
    float _2348 = precise::min(_2340, _2342);
    float _2350 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2344);
    float _2352 = _2340;
    if (!_2266)
    {
        _2352 = 1.0;
    }
    float _2354 = _2352;
    float _2356 = _861 * _1599;
    float _2358 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2350);
    float _2360 = _2354;
    if (_2266)
    {
        float _2362 = _2348 * _2334;
        float _2364 = precise::clamp(_2362, 0.0, 1.0);
        _2360 = _2364;
    }
    float _2366 = _2360;
    float _2368 = fma(_859, _1411, _2356);
    bool _2370 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2372 = isnan(_2052);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2378 = _2374 || _2376;
    float _2380 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2358);
    float _2382 = _1087 * _2366;
    float _2384 = _861 * _1409;
    float _2386 = fma(_859, _1417, _2272);
    out.gl_Position.x = _1827;
    out.gl_Position.y = _1829;
    out.gl_Position.z = _2380;
    out.gl_Position.w = _1803;
    float _2388 = fma(_859, _1579, _2384);
    float _2390 = _2380 + _1803;
    float _2392 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2394 = precise::clamp(_2392, 0.0, 1.0);
    float _2396 = fma(_793, _1421, _2368);
    float _2398 = fma(_793, _1413, _2388);
    float _2400 = fma(_793, _1539, _2386);
    float _2402 = fma(_2394, -2.0, 3.0);
    float _2404 = _2394 * _2394;
    float _2406 = _2390 * 0.5;
    out.m_93.x = _2398;
    out.m_93.y = _2396;
    out.m_93.z = _2400;
    float _2408 = _2404 * _2402;
    float _2410 = _2382 * _1966;
    float _2412 = -_2308;
    float _2414 = _2412 + 1.0;
    if (!_1777)
    {
        _1835 = 1.0;
    }
    float _2416 = _1835;
    float _2418 = -_2408;
    float _2420 = _2418 + 1.0;
    float _2422 = _2416;
    if (_1777)
    {
        bool _2424 = _1879 >= _1843;
        bool _2426 = isnan(_1879);
        bool _2428 = _2424 || _2426;
        bool _2430 = isnan(_1843);
        bool _2432 = _2428 || _2430;
        float _2434 = float(_2432);
        _2422 = _2434;
    }
    float _2436 = _2422;
    float _2438 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.z = _2406;
    out.m_95.w = _1803;
    float _2440 = fma(_2420, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2408);
    float _2442 = _2410 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2444 = _2438 * _1881;
    float _2446 = _2436 * _2030;
    float _2448 = _2292 * _2440;
    if (!_2378)
    {
        _1809 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2450 = _1809;
    float _2452 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2454 = _2280 * _2452;
    float _2456 = precise::clamp(_2454, 0.0, 1.0);
    float _2458 = -_2456;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2462 = _1892 * _2444;
    float _2464 = -_2446;
    float _2466 = fma(_2464, _2460, 1.0);
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    float _2470 = _2256 * _2444;
    float _2472 = -_2438;
    float _2474 = _2472 + 1.0;
    float _2476 = fma(_2252, _2462, _1886);
    float _2478 = fma(_2254, _2462, _1888);
    float _2480 = fma(_1892, _2470, _1890);
    float _2482 = _1892 * _2474;
    float _2484 = _2468 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2486 = _2474;
    float _2488 = _2468;
    float _2490 = _2484;
    float _2492 = _2450;
    float _2494 = _2450;
    if (!_2378)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2496 = _1914;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2378)
    {
        _1916 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2502 = _1916;
    out.m_97.x = _2476;
    out.m_97.y = _2478;
    out.m_97.z = _2480;
    out.m_97.w = _2482;
    float _2504 = _2502;
    float _2506 = _2502;
    if (!_2378)
    {
        _2486 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2508 = _2486;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2378)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2514 = _2488;
    out.m_99.x = _2484;
    float _2516 = _2514;
    float _2518 = _2514;
    if (!_2378)
    {
        _2490 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2520 = _2490;
    bool _2522 = !_2378;
    float _2524 = _2520;
    float _2526 = _2520;
    if (!_2522)
    {
        bool _2528 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2530 = isnan(_2052);
        bool _2532 = _2528 || _2530;
        bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2536 = _2532 || _2534;
        if (!_2536)
        {
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = _2052 + _2538;
            float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2542;
            float _2546 = 1.0 / _2544;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2568 = _2540 * _2546;
            float _2570 = precise::clamp(_2568, 0.0, 1.0);
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2576 = fma(_2570, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2506 = _2578;
            _2518 = _2584;
            _2500 = _2576;
            _2512 = _2582;
            _2494 = _2580;
            _2526 = _2586;
            _2588 = true;
        }
        else
        {
            bool _2590 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2592 = isnan(_2052);
            bool _2594 = _2590 || _2592;
            bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2598 = _2594 || _2596;
            if (!_2598)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2600 = _2498;
            _2500 = _2600;
            if (!_2598)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2602 = _2504;
            _2506 = _2602;
            if (!_2598)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2604 = _2492;
            _2494 = _2604;
            if (!_2598)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2606 = _2510;
            _2512 = _2606;
            if (!_2598)
            {
                _2516 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2608 = _2516;
            _2518 = _2608;
            if (!_2598)
            {
                _2524 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2610 = _2524;
            bool _2612 = !_2598;
            _2526 = _2610;
            if (!_2612)
            {
                bool _2614 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2616 = isnan(_2052);
                bool _2618 = _2614 || _2616;
                bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2622 = _2618 || _2620;
                if (!_2622)
                {
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = _2052 + _2624;
                    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2628;
                    float _2632 = 1.0 / _2630;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2654 = _2626 * _2632;
                    float _2656 = precise::clamp(_2654, 0.0, 1.0);
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2662 = fma(_2656, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2506 = _2664;
                    _2518 = _2670;
                    _2500 = _2662;
                    _2512 = _2668;
                    _2494 = _2666;
                    _2526 = _2672;
                    _2588 = true;
                }
                else
                {
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2518 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2526 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2588 = false;
    float _2674 = _2506;
    float _2676 = _2518;
    float _2678 = _2500;
    float _2680 = _2512;
    float _2682 = _2494;
    float _2684 = _2526;
    float _2686 = fma(_2396, -0.5, 0.5);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = -_2674;
    float _2692 = _2690 + _2676;
    float _2694 = -_2678;
    float _2696 = _2694 + _2680;
    out.m_101.x = 0.0;
    float _2698 = fma(_2688, _2692, _2674);
    float _2700 = -_2682;
    float _2702 = _2700 + _2684;
    float _2704 = fma(_2688, _2696, _2678);
    float _2706 = _2698 * 0.586610972881317138671875;
    bool _2708 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2710 = fma(_2688, _2702, _2682);
    float _2712 = _2442 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2714 = fma(_2704, 0.298911988735198974609375, _2706);
    bool _2716 = _1966 > 0.0;
    bool _2718 = isnan(_1966);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan(0.0);
    bool _2724 = _2720 || _2722;
    float _2726 = fma(_2710, 0.114477999508380889892578125, _2714);
    out.m_68.x = _2712;
    float _2728 = -_2726;
    float _2730 = _2704 + _2728;
    float _2732 = -_2726;
    float _2734 = _2698 + _2732;
    float _2736 = -_2726;
    float _2738 = _2710 + _2736;
    float _2740 = fma(_2730, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2726);
    float _2742 = fma(_2734, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2726);
    float _2744 = fma(_2738, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2726);
    bool _2746 = !_2708;
    if (!_2746)
    {
        float _2748 = -_1709;
        float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2752 = -_1711;
        float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2756 = -_1713;
        float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2760 = _2750 * _2750;
        float _2762 = fma(_2754, _2754, _2760);
        float _2764 = fma(_2758, _2758, _2762);
        float _2766 = sqrt(_2764);
        float _2768 = rsqrt(_2764);
        float _2770 = -_2766;
        float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2774 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2776 = precise::clamp(_2774, 0.0, 1.0);
        float _2778 = _2754 * _2768;
        float _2780 = _2750 * _2768;
        float _2782 = abs(_2776);
        float _2784 = log2(_2782);
        float _2786 = _2758 * _2768;
        float _2788 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2790 = _2396 * _2780;
        float _2792 = -_2780;
        float _2794 = -_2788;
        float _2796 = fma(_2792, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2794);
        float _2798 = fma(_2398, _2778, _2790);
        float _2800 = -_2786;
        float _2802 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2796);
        float _2804 = fma(_2400, _2786, _2798);
        float _2806 = precise::clamp(_2804, 0.0, 1.0);
        float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2810 = _2802 + _2808;
        float _2812 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2814 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2816 = precise::clamp(_2814, 0.0, 1.0);
        float _2818 = exp2(_2812);
        float _2820 = _2818 * _2816;
        float _2822 = _2806 * _2820;
        float _2824 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2826 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2828 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2824;
        out.m_101.y = _2826;
        out.m_101.z = _2828;
    }
    out.m_103.x = _2740;
    out.m_103.y = _2742;
    out.m_103.z = _2744;
    if (_2724)
    {
        return out;
    }
    out.m_68.x = 0.0;
    float _2830 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2830;
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
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2588 = false;
    bool _953 = false;
    bool _941 = false;
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
        float _2887 = as_type<float>(_138);
        out.gl_Position.z = _2887;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2956 = as_type<float>(_174);
        out.gl_Position.z = _2956;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _270 = _264;
    float _272 = _266;
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
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _386 = as_type<float>(int(gl_VertexIndex));
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _390 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _384);
    float _392 = in.m_78.z;
    float _394 = in.m_74.w;
    float _396 = in.m_72.w;
    float _398 = _184 * _378;
    float _400 = _178 * _378;
    float _402 = _190 * _378;
    float _404 = in.m_76.w;
    float _406 = fma(_182, _376, _398);
    float _408 = fma(_176, _376, _400);
    float _410 = fma(_188, _376, _402);
    float _412 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _416 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _422 = as_type<int>(_386) & 1;
    bool _424 = _422 != 0;
    int _426 = as_type<int>(_386) & 2;
    bool _428 = _426 != 0;
    float _430 = fma(_416, -2.0, _418);
    float _432 = -_420;
    float _434 = fma(_412, 2.0, _432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _440 = _194 > 0.5;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _446 = fma(_180, _380, _408);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _452 = 1.0 / _438;
    float _454 = fma(_186, _380, _406);
    bool _456 = _382 > 0.5;
    float _458 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].w, _388);
    float _460 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[79].z, _414);
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _464 = _462 != 0;
    float _466 = fma(_192, _380, _410);
    float _468 = 1.0 / _444;
    float _470 = in.m_83.x;
    float _472 = in.m_83.y;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _476 = _474 != 0;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _482 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _430);
    float _484 = -_156;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _434);
    float _488 = 1.0 / _450;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _492 = _374 + _490;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _374 + _496;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _502 = _466 + _404;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _510;
    float _514 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = _512 * _468;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _374 + _522;
    float _526 = _480 * _488;
    float _528 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[79].x, _460);
    out.m_85.x = _514;
    out.m_85.y = _516;
    out.m_85.z = _518;
    float _530 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _390);
    float _532 = fma(_526, _524, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _534 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _536 = isnan(_374);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = fma(_520, _492, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _548 = _508 * _452;
    float _550 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _458);
    float _552 = _454 + _394;
    float _554 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _556 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _558 = isnan(_374);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -_544;
    float _570 = _568 + 1.0;
    float _572 = fma(_548, _498, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _574 = _446 + _396;
    float _576 = _470 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _578 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _580 = isnan(_374);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _566 * _570;
    bool _592 = !_424;
    float _594 = _592 ? (-0.5) : 0.5;
    float _596 = -_566;
    float _598 = _596 + 1.0;
    bool _600 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _602 = isnan(_374);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _614 = !_428;
    float _616 = _614 ? (-0.5) : 0.5;
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _594);
    float _620 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _622 = _610 * _598;
    float _624 = _528 * (-0.15915493667125701904296875);
    float _626 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _616);
    float _628 = _612 * _618;
    float _630 = -_616;
    int _632 = _456 ? as_type<int>(_630) : as_type<int>(_616);
    float _634 = _572 * _622;
    float _636 = _620 * _626;
    float _638 = -_594;
    int _640 = _440 ? as_type<int>(_638) : as_type<int>(_594);
    float _642 = -_610;
    float _644 = _642 + 1.0;
    bool _646 = !_476;
    float _648 = _646 ? _616 : as_type<float>(_632);
    float _650 = _616 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _652 = !_464;
    float _654 = _652 ? _594 : as_type<float>(_640);
    float _656 = _594 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _634);
    float _660 = _650 * _322;
    float _662 = _650 * _326;
    float _664 = _650 * _330;
    int _666 = _346 + 8;
    uint _669 = uint(int(uint(_666) >> uint(2)));
    uint _671 = uint(int(uint(int(_669)) >> uint(2)));
    int _673 = int(_669) & 3;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[int(_671)][_673];
    float _677 = fma(_656, _286, _660);
    float _679 = fma(_656, _290, _662);
    float _681 = fma(_656, _294, _664);
    float _683 = _624 * 6.283185482025146484375;
    float _685 = sin(_683);
    float _687 = _636 * _322;
    float _689 = _636 * _326;
    float _691 = _636 * _330;
    uint _693 = uint(int(uint(_346) >> uint(2)));
    uint _695 = uint(int(uint(int(_693)) >> uint(2)));
    int _697 = int(_693) & 3;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[int(_695)][_697];
    int _701 = int(_693) + 1;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    int _705 = _701 & 3;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[int(_703)][_705];
    float _709 = _574 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _711 = -_588;
    float _713 = _711 + 1.0;
    float _715 = fma(_628, _286, _687);
    float _717 = _624 * 6.283185482025146484375;
    float _719 = cos(_717);
    float _721 = fma(_628, _290, _689);
    float _723 = _552 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _725 = _709 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _727 = _544 * _713;
    float _729 = fma(_628, _294, _691);
    float _731 = _502 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[6].y, _725);
    float _735 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _737 = _709 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _739 = _709 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _741 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[8].y, _733);
    float _743 = fma(_532, _590, _658);
    float _745 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[6].x, _737);
    float _747 = _648 * _685;
    float _749 = fma(_723, (*spvDescriptorSet0.vp_c12)._m0[6].z, _739);
    float _751 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _753 = _648 * _719;
    float _755 = _741 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _757 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[8].x, _745);
    float _759 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[8].z, _749);
    float _761 = -_747;
    float _763 = fma(_654, _719, _761);
    float _765 = fma(_654, _685, _753);
    float _767 = _757 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _769 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _771 = _755 * _735;
    float _773 = _759 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _775 = fma(_546, _727, _743);
    float _777 = -_550;
    float _779 = _777 + 1.0;
    float _781 = fma(_771, 0.5, 0.5);
    float _783 = -_530;
    float _785 = _783 + 1.0;
    float _787 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _791 = _767 * _751;
    float _793 = _681 + _342;
    float _795 = fma(_787, _334, _715);
    float _797 = fma(_787, _338, _721);
    float _799 = fma(_791, 0.5, 0.5);
    float _801 = fma(_787, _342, _729);
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _805 = _773 * _769;
    float _807 = _765 + (-0.5);
    float _809 = _699 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _811 = fma(_805, 0.5, 0.5);
    float _813 = _707 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _815 = floor(_781);
    float _817 = _789 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _819 = _763 + 0.5;
    float _821 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _823 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = -_817;
    float _827 = -_482;
    float _829 = fma(_825, _807, _827);
    float _831 = _803 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _833 = floor(_799);
    float _835 = fma(_831, _819, _486);
    float _837 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[118].x, _775);
    float _839 = _675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _841 = -_815;
    float _843 = _781 + _841;
    float _845 = floor(_811);
    float _847 = fma(_765, _779, _829);
    float _849 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _837 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _853 = -_785;
    float _855 = fma(_763, _853, _835);
    float _857 = fma(_843, 2.0, -1.0);
    float _859 = _677 + _334;
    float _861 = _679 + _338;
    float _863 = -_833;
    float _865 = _799 + _863;
    float _867 = _857 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_87.x = _821;
    out.m_87.y = _823;
    out.m_87.z = _849;
    out.m_87.w = _851;
    float _869 = fma(_865, 2.0, -1.0);
    float _871 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    out.m_89.x = _855;
    out.m_89.y = _847;
    float _873 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _875 = -_845;
    float _877 = _811 + _875;
    float _879 = _869 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _881 = _867 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _883 = fma(_877, 2.0, -1.0);
    float _885 = fma(_879, (*spvDescriptorSet0.vp_c12)._m0[2].x, _871);
    float _887 = fma(_879, (*spvDescriptorSet0.vp_c12)._m0[2].y, _873);
    float _889 = _883 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _891 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _893 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _895 = _891 || _893;
    bool _897 = isnan(1.0);
    bool _899 = _895 || _897;
    float _901 = fma(_879, (*spvDescriptorSet0.vp_c12)._m0[2].z, _881);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].x, _885);
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].y, _887);
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c12)._m0[4].z, _901);
    float _909 = _903 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _911 = _905 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _913 = _907 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _915 = _795 + _909;
    float _917 = _797 + _911;
    float _919 = _801 + _913;
    float _921 = _907;
    float _923 = _624;
    float _925 = _624;
    float _927 = _869;
    float _929 = _857;
    float _931 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _933 = _883;
    float _935 = _903;
    float _945;
    float _947;
    float _949;
    float _951;
    if (!_899)
    {
        bool _937 = _911 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _939 = !_937;
        _941 = _939;
        if (!_941)
        {
            float _943 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _945 = 0.0;
            _947 = _943;
            _949 = 0.0;
            _951 = 0.0;
            _953 = true;
        }
    }
    if ((!_953) || _941)
    {
        bool _993;
        if (!_941)
        {
            bool _955 = _911 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _957 = isnan(_911);
            bool _959 = _955 || _957;
            bool _961 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _963 = _959 || _961;
            bool _965 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _967 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _969 = !_963;
            bool _971 = _967 && _969;
            float _973 = 0.0;
            if (_971)
            {
                _973 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _975 = _973;
            float _977 = 0.0;
            float _979 = _975;
            if (_971)
            {
                _977 = 0.0;
            }
            float _981 = _977;
            _945 = _981;
            if (_971)
            {
                _921 = 0.0;
            }
            float _983 = _921;
            _949 = _983;
            if (_971)
            {
                float _985 = _975 * 5.0;
                _979 = _985;
            }
            float _987 = _979;
            _947 = _987;
            if (_971)
            {
                _923 = 0.0;
            }
            float _989 = _923;
            bool _991 = !_963;
            _993 = _991 && _965;
            _925 = _989;
            _951 = _989;
        }
        if ((!_993) || _941)
        {
            _941 = false;
            float _995 = _925;
            bool _997 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _999 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1001 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1003 = _851;
            float _1005 = _995;
            _945 = _915;
            _947 = _919;
            _949 = _917;
            if (_997)
            {
                float _1007 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1003 = _1007;
            }
            float _1009 = _1003;
            if (_997)
            {
                float _1011 = abs(_869);
                float _1013 = -_1011;
                float _1015 = _1013 + 1.0;
                _927 = _1015;
            }
            float _1017 = _927;
            if (_999)
            {
                float _1019 = abs(_857);
                float _1021 = -_1019;
                float _1023 = _1021 + 1.0;
                _929 = _1023;
            }
            float _1025 = _929;
            if (!_997)
            {
                _931 = 1.0;
            }
            float _1027 = _931;
            float _1029 = _1027;
            if (_1001)
            {
                float _1031 = abs(_883);
                float _1033 = -_1031;
                float _1035 = _1033 + 1.0;
                _933 = _1035;
            }
            float _1037 = _933;
            if (!_999)
            {
                _935 = 1.0;
            }
            float _1039 = _935;
            float _1041 = _1039;
            if (!_1001)
            {
                _1005 = 1.0;
            }
            float _1043 = _1005;
            float _1045 = _905;
            float _1047 = _1043;
            if (_999)
            {
                float _1049 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1045 = _1049;
            }
            float _1051 = _1045;
            float _1053 = _889;
            if (_1001)
            {
                float _1055 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1053 = _1055;
            }
            float _1057 = _1053;
            if (_997)
            {
                float _1059 = _1017 * _1009;
                float _1061 = precise::clamp(_1059, 0.0, 1.0);
                _1029 = _1061;
            }
            float _1063 = _1029;
            if (_999)
            {
                float _1065 = _1025 * _1051;
                float _1067 = precise::clamp(_1065, 0.0, 1.0);
                _1041 = _1067;
            }
            float _1069 = _1041;
            float _1071 = _1063 * _1069;
            if (_1001)
            {
                float _1073 = _1037 * _1057;
                float _1075 = precise::clamp(_1073, 0.0, 1.0);
                _1047 = _1075;
            }
            float _1077 = _1047;
            float _1079 = _1071 * _1077;
            _951 = _1079;
        }
    }
    _953 = false;
    float _1081 = _945;
    float _1083 = _947;
    float _1085 = _949;
    float _1087 = _951;
    float _1089 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1091 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1093 = floor(_1089);
    float _1095 = floor(_1091);
    float _1097 = -_1093;
    float _1099 = _1089 + _1097;
    float _1101 = -_1095;
    float _1103 = _1091 + _1101;
    float2 _4442 = float2(_1099, _1103);
    float _1105 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4442, float2(0.0), isnan(_4442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4442, float2(0.0), isnan(_4442)), level(0.0)).x;
    float _1107 = in.m_91.w;
    float _1109 = trunc(_1107);
    int _1111 = int(_1109);
    int _1113 = _1111 << 5;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1115)];
    float _1117 = as_type<float>(_dmw0.x);
    int _1119 = _1113 + 4;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    float _1123 = as_type<float>(_dmw0.y);
    int _1125 = _1113 + 8;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    float _1129 = as_type<float>(_dmw0.z);
    int _1131 = _1113 + 12;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    float _1135 = as_type<float>(_dmw0.w);
    float _1137 = _911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1141 = _1081 + _1139;
    float _1143 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1137);
    float _1145 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1147 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1143);
    float _1149 = _911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = _911 + _1145;
    float _1153 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1155 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1161 = 1.0 / _1153;
    float _1163 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1155);
    float _1165 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1157);
    float _1167 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1159);
    float _1169 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1171 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1165);
    float _1173 = fma(_913, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1167);
    float _1175 = _1169 + _1153;
    float _1177 = _1171 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1179 = _1173 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1083 + _1181;
    float _1185 = trunc(_1177);
    int _1187 = int(_1185);
    float _1189 = _1175 * _1161;
    float _1191 = _1189 * 0.5;
    float _1193 = _1183 * _1183;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1197 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1195);
    float _1199 = fma(_1141, _1141, _1193);
    float _1201 = trunc(_1179);
    int _1203 = int(_1201);
    float _1205 = 1.0 / _1197;
    int _1207 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1209 = _1187 + _1207;
    int _1211 = _1209 + 1;
    int _1213 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1215 = _1203 + _1213;
    int _1217 = _1215 + 1;
    float _1219 = sqrt(_1199);
    int _1221 = _1211 | _1217;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1225 = _1205 * _1223;
    bool _1227 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1229 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1231 = !_1227;
    int _1233 = _1231 ? 0 : 1;
    int _1235 = 2;
    int _1237 = _1211;
    int _1239 = as_type<int>(_1083);
    float _1241 = _1081;
    float _1243 = _1085;
    if (!_1227)
    {
        _1235 = 1;
    }
    int _1245 = _1235;
    int _1247 = _1245;
    if (!_1229)
    {
        _1247 = _1233;
    }
    int _1249 = _1247;
    bool _1251 = _1211 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1253 = _1249 << 6;
    bool _1255 = _1221 < 0;
    bool _1257 = _1255 || _1251;
    int _1259 = _1253 + 48;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    uint _1263 = uint(int(uint(int(_1261)) >> uint(2)));
    int _1265 = int(_1261) & 3;
    float _1267 = (*spvDescriptorSet0.vp_c15)._m0[int(_1263)][_1265];
    int _1269 = int(_1261) + 1;
    uint _1271 = uint(int(uint(_1269) >> uint(2)));
    int _1273 = _1269 & 3;
    float _1275 = (*spvDescriptorSet0.vp_c15)._m0[int(_1271)][_1273];
    bool _1277 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1279 = _1217 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1281 = _1279 || _1257;
    int _1283 = _1253 + 56;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
    int _1289 = int(_1285) & 3;
    float _1291 = (*spvDescriptorSet0.vp_c15)._m0[int(_1287)][_1289];
    int _1293 = int(_1285) + 1;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    int _1297 = _1293 & 3;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[int(_1295)][_1297];
    bool _1301 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan(0.5);
    bool _1309 = _1305 || _1307;
    int _1311 = _1253 + 64;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = as_type<float>(_1249);
    if (!_1281)
    {
        int _1331 = _1217 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1333 = _1331 + _1211;
        _1237 = _1333;
    }
    int _1335 = _1237;
    int _1337 = _1253 + 72;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    uint _1341 = uint(int(uint(int(_1339)) >> uint(2)));
    int _1343 = int(_1339) & 3;
    float _1345 = (*spvDescriptorSet0.vp_c15)._m0[int(_1341)][_1343];
    int _1347 = int(_1339) + 1;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    int _1351 = _1347 & 3;
    float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
    int _1355 = _1253 + 96;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    int _1373 = _1253 + 104;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    uint _1377 = uint(int(uint(int(_1375)) >> uint(2)));
    int _1379 = int(_1375) & 3;
    float _1381 = (*spvDescriptorSet0.vp_c15)._m0[int(_1377)][_1379];
    int _1383 = int(_1375) + 1;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    int _1387 = _1383 & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    float _1391 = _1135 * 2.0;
    float _1393 = _1117 * 2.0;
    float _1395 = _1123 * 2.0;
    float _1397 = _1123 * _1123;
    float _1399 = _1129 * _1391;
    float _1401 = _1123 * _1391;
    float _1403 = _1117 * _1391;
    float _1405 = _1117 * _1117;
    float _1407 = -_1399;
    float _1409 = fma(_1123, _1393, _1407);
    float _1411 = fma(_1123, _1393, _1399);
    float _1413 = fma(_1129, _1393, _1401);
    float _1415 = -_1401;
    float _1417 = fma(_1129, _1393, _1415);
    float _1419 = -_1403;
    float _1421 = fma(_1129, _1395, _1419);
    float _1423 = fma(_1129, _1395, _1403);
    int _1425 = as_type<int>(_1403);
    float _1427 = _1129;
    int _1429 = as_type<int>(_1123);
    float _1431 = as_type<float>(_1335);
    if (!_1281)
    {
        int _1433 = _1335 << 2;
        _1425 = _1433;
    }
    int _1435 = _1425;
    float _1437 = _1129 * _1129;
    float _1439 = as_type<float>(_1435);
    if (!_1277)
    {
        _1427 = _1083;
    }
    float _1441 = _1427;
    float _1443 = _1441;
    if (!_1281)
    {
        uint _1445 = uint(int(uint(_1335) >> uint(2)));
        _1429 = int(_1445);
    }
    int _1447 = _1429;
    if (!_1281)
    {
        int _1449 = 12 & _1435;
        _1239 = _1449;
    }
    int _1451 = _1239;
    bool _1453 = !_1277;
    if (!_1453)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1459 = _1219 + _1457;
        float _1461 = rsqrt(_1199);
        float _1463 = _1459 * _1455;
        float _1465 = _1085 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = _1463 * 0.15915493667125701904296875;
        float _1469 = _1467 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        float _1477 = _1471 + (-1.0);
        float _1479 = fma(_1475, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1481 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1483 = _1461 * _1479;
        float _1485 = fma(_1471, _1085, _1481);
        float _1487 = fma(_1141, _1483, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1489 = fma(_1183, _1483, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1241 = _1487;
        _1243 = _1485;
        _1443 = _1489;
        _1439 = _1471;
    }
    float _1491 = _1241;
    float _1493 = _1243;
    float _1495 = _1443;
    float _1497 = _1439;
    float _1499 = _1497;
    if (!_1281)
    {
        int _1501 = _1447 << 4;
        int _1503 = _1501 + _1451;
        _1499 = as_type<float>(_1503);
    }
    float _1505 = _1499;
    float _1507 = -_909;
    float _1509 = _1507 + _1491;
    float _1511 = fma(_1405, -2.0, 1.0);
    float _1513 = -_911;
    float _1515 = _1513 + _1493;
    int _1517 = _1253 + 80;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    float _1535 = fma(_1397, -2.0, 1.0);
    float _1537 = _1515 * _290;
    float _1539 = fma(_1397, -2.0, _1511);
    float _1541 = _1151 * _1371;
    float _1543 = _1515 * _326;
    float _1545 = _1515 * _338;
    int _1547 = _1253 + 88;
    uint _1549 = uint(int(uint(_1547) >> uint(2)));
    uint _1551 = uint(int(uint(int(_1549)) >> uint(2)));
    int _1553 = int(_1549) & 3;
    float _1555 = (*spvDescriptorSet0.vp_c15)._m0[int(_1551)][_1553];
    int _1557 = int(_1549) + 1;
    uint _1559 = uint(int(uint(_1557) >> uint(2)));
    int _1561 = _1557 & 3;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
    float _1565 = fma(_909, _1363, _1541);
    float _1567 = fma(_1509, _322, _1543);
    float _1569 = -_913;
    float _1571 = _1569 + _1495;
    float _1573 = fma(_1509, _286, _1537);
    float _1575 = fma(_913, _1381, _1565);
    float _1577 = fma(_1509, _334, _1545);
    float _1579 = fma(_1437, -2.0, _1535);
    float _1581 = _1505;
    if (!_1281)
    {
        int _1583 = as_type<int>(_1505) + 400;
        uint _1585 = uint(int(uint(_1583) >> uint(2)));
        uint _1587 = uint(int(uint(int(_1585)) >> uint(2)));
        int _1589 = int(_1585) & 3;
        float _1591 = (*spvDescriptorSet0.vp_c15)._m0[int(_1587)][_1589];
        _1581 = _1591;
    }
    float _1593 = _1581;
    float _1595 = _1575 + _1389;
    float _1597 = fma(_1571, _330, _1567);
    float _1599 = fma(_1437, -2.0, _1511);
    float _1601 = fma(_1571, _294, _1573);
    float _1603 = fma(_1571, _342, _1577);
    float _1605 = _1597 * _1409;
    float _1607 = _1151 * _1275;
    float _1609 = _334;
    float _1611 = _1597;
    if (!_1281)
    {
        float _1613 = floor(_1177);
        _1609 = _1613;
    }
    float _1615 = _1609;
    float _1617 = _1597 * _1599;
    float _1619 = _1597 * _1423;
    float _1621 = _1151 * _1327;
    float _1623 = fma(_1601, _1579, _1605);
    float _1625 = fma(_1601, _1411, _1617);
    float _1627 = fma(_1601, _1417, _1619);
    float _1629 = fma(_909, _1267, _1607);
    float _1631 = _342;
    if (!_1281)
    {
        float _1633 = floor(_1179);
        _1631 = _1633;
    }
    float _1635 = _1631;
    float _1637 = fma(_909, _1319, _1621);
    float _1639 = fma(_1603, _1413, _1623);
    float _1641 = fma(_1603, _1421, _1625);
    float _1643 = fma(_1603, _1539, _1627);
    float _1645 = fma(_913, _1291, _1629);
    float _1647 = fma(_913, _1345, _1637);
    float _1649 = _909 + _1639;
    float _1651 = 1.0 / _1595;
    float _1653 = _911 + _1641;
    float _1655 = _913 + _1643;
    float _1657 = _1645 + _1299;
    float _1659 = _1647 + _1353;
    float _1661 = _1653;
    float _1663 = _1649;
    float _1665 = _1655;
    float _1667 = _1643;
    float _1669 = _1635;
    if (!_1309)
    {
        float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1673 = _911 + _1671;
        float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1677 = _909 + _1675;
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = _1673 * _1673;
        float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1685 = _913 + _1683;
        float _1687 = fma(_1677, _1677, _1681);
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1691 = fma(_1685, _1685, _1687);
        float _1693 = sqrt(_1691);
        float _1695 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1697 = precise::min(_1693, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1699 = _1697 * _1689;
        float _1701 = _1695 * _1699;
        float _1703 = fma(_1641, _1701, _911);
        float _1705 = fma(_1639, _1701, _909);
        float _1707 = fma(_1643, _1701, _913);
        _1661 = _1703;
        _1663 = _1705;
        _1665 = _1707;
    }
    float _1709 = _1661;
    float _1711 = _1663;
    float _1713 = _1665;
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1717 = _1657 * _1651;
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1721 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1715);
    float _1725 = _1659 * _1651;
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1719);
    float _1729 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1721);
    float _1731 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1723);
    bool _1733 = _1717 >= 0.0;
    float _1735 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1737 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1727);
    float _1739 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_1281)
    {
        float _1741 = rint(_1593);
        float _1743 = precise::max(_1741, 0.0);
        uint _1745 = uint(_1743);
        uint _1747 = clamp(_1745, 0u, 65535u);
        _1667 = as_type<float>(_1747);
    }
    float _1749 = _1667;
    float _1751 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1729);
    bool _1753 = _1717 <= 1.0;
    bool _1755 = _1753 && _1733;
    float _1757 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1735);
    float _1759 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1761 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1763 = _1725 >= 0.0;
    bool _1765 = _1763 && _1755;
    float _1767 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1757);
    float _1769 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1771 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1773 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1775 = _1725 <= 1.0;
    bool _1777 = _1775 && _1765;
    float _1779 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1771);
    float _1783 = -_1773;
    float _1785 = fma(_1783, _1769, 1.0);
    float _1787 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1281)
    {
        float _1789 = -_1635;
        float _1791 = _1179 + _1789;
        _1611 = _1791;
    }
    float _1793 = _1611;
    float _1795 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1781);
    float _1797 = _1151 * _1533;
    float _1799 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1801 = log2(_1785);
    float _1803 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1795);
    float _1805 = fma(_909, _1525, _1797);
    float _1807 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1799);
    float _1809 = _1803;
    if (_1777)
    {
        float _1811 = float(_1249);
        _1329 = _1811;
    }
    float _1813 = _1329;
    float _1815 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1787);
    float _1817 = fma(_913, _1555, _1805);
    float _1819 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1807);
    float _1821 = 1.0 / _1803;
    float _1823 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1815);
    float _1825 = _1817 + _1563;
    float _1827 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1819);
    float _1829 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1823);
    float _1831 = _1823;
    float _1833 = _1813;
    float _1835 = _1829;
    if (!_1281)
    {
        float _1837 = -_1615;
        float _1839 = _1177 + _1837;
        _1831 = _1839;
    }
    float _1841 = _1831;
    float _1843 = _1825 * _1651;
    float _1845 = _1805;
    if (_1777)
    {
        float _1847 = rint(_1813);
        float _1849 = precise::max(_1847, 0.0);
        uint _1851 = uint(_1849);
        uint _1853 = clamp(_1851, 0u, 65535u);
        _1845 = as_type<float>(_1853);
    }
    float _1855 = _1845;
    float _1857 = _1801 * 0.693147182464599609375;
    float _1859 = _1827 * _1821;
    float _1861 = _1829 * _1821;
    float _1863 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1865 = fma(_1859, 0.5, 0.5);
    float _1867 = fma(_1861, -0.5, 0.5);
    float _1869 = _1793;
    if (!_1281)
    {
        float3 _5716 = float3(_1841, _1793, float(as_type<int>(_1749)));
        float3 _5720 = select(_5716, float3(0.0), isnan(_5716));
        float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5720.xy, uint(rint(_5720.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5720.xy, uint(rint(_5720.z)), level(0.0)).x;
        _1869 = _1871;
    }
    float _1873 = _1869;
    float _1875 = _1725;
    if (_1777)
    {
        float3 _5735 = float3(_1717, _1725, float(as_type<int>(_1855)));
        float3 _5737 = select(_5735, float3(0.0), isnan(_5735));
        float _1877 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5737.xy, uint(rint(_5737.z)), _1843, level(0.0));
        _1875 = _1877;
    }
    float _1879 = _1875;
    float3 _5747 = float3(_1865, _1867, _1863);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5747, float3(0.0), isnan(_5747)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5747, float3(0.0), isnan(_5747)), level(0.0)).x;
    float3 _5756 = float3(_1865, _1867, _1863);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5756, float3(0.0), isnan(_5756)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5756, float3(0.0), isnan(_5756)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1281)
    {
        _1833 = 1.0;
    }
    float _1896 = _1833;
    bool _1898 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.5);
    bool _1906 = _1902 || _1904;
    float _1908 = _1896;
    if (_1906)
    {
        _1894 = 1.0;
    }
    float _1910 = _1894;
    float _1912 = _1910;
    float _1914 = _1888;
    float _1916 = _1886;
    if (!_1906)
    {
        float _1918 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1920 = _1918 * 0.15915493667125701904296875;
        float _1922 = _1920 * 6.283185482025146484375;
        float _1924 = cos(_1922);
        float _1926 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1928 = _1926 * 0.15915493667125701904296875;
        float _1930 = _1920 * 6.283185482025146484375;
        float _1932 = sin(_1930);
        float _1934 = 1.0 / _1924;
        float _1936 = _1928 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = _1932 * _1934;
        float _1942 = _1928 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        float _1946 = _1938 * _1940;
        float _1948 = 1.0 / _1946;
        float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1952 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1950;
        float _1954 = 1.0 / _1952;
        float _1956 = _1944 * _1948;
        float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1960 = fma(_1225, _1956, _1958);
        float _1962 = _1960 * _1954;
        float _1964 = precise::clamp(_1962, 0.0, 1.0);
        _1912 = _1964;
    }
    float _1966 = _1912;
    if (!_1281)
    {
        int _1968 = _1335 << 4;
        int _1970 = _1968 + 2048;
        uint _1972 = uint(int(uint(_1970) >> uint(2)));
        uint _1974 = uint(int(uint(int(_1972)) >> uint(2)));
        int _1976 = int(_1972) & 3;
        float _1978 = (*spvDescriptorSet0.vp_c15)._m0[int(_1974)][_1976];
        int _1980 = int(_1972) + 1;
        uint _1982 = uint(int(uint(_1980) >> uint(2)));
        int _1984 = _1980 & 3;
        float _1986 = (*spvDescriptorSet0.vp_c15)._m0[int(_1982)][_1984];
        int _1988 = _1970 + 8;
        uint _1990 = uint(int(uint(_1988) >> uint(2)));
        uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
        int _1994 = int(_1990) & 3;
        float _1996 = (*spvDescriptorSet0.vp_c15)._m0[int(_1992)][_1994];
        int _1998 = int(_1990) + 1;
        uint _2000 = uint(int(uint(_1998) >> uint(2)));
        int _2002 = _1998 & 3;
        float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
        float _2006 = _1151 * _1986;
        float _2008 = fma(_909, _1978, _2006);
        float _2010 = fma(_913, _1996, _2008);
        float _2012 = _2010 + _2004;
        float _2014 = precise::clamp(_2012, 0.0, 1.0);
        float _2016 = -_2014;
        float _2018 = _2016 + _1873;
        float _2020 = fma(_2018, 500.0, 1.5);
        float _2022 = exp2(_2020);
        float _2024 = 0.0 + _2022;
        float _2026 = precise::clamp(_2024, 0.0, 1.0);
        _1431 = as_type<float>(_1970);
        _1908 = _2026;
    }
    float _2028 = _1431;
    float _2030 = _1908;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2034 = _1709 + _2032;
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2038 = _1711 + _2036;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _1713 + _2040;
    float _2044 = _2034 * _2034;
    float _2046 = fma(_2038, _2038, _2044);
    float _2048 = fma(_2042, _2042, _2046);
    float _2050 = rsqrt(_2048);
    float _2052 = sqrt(_2048);
    float _2054 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2056 = _2038 * _2054;
    float _2058 = _2042 * _2054;
    float _2060 = _2056 * _2056;
    float _2062 = _2058 * _2058;
    float _2064 = _2060 + _2062;
    float _2066 = sqrt(_2064);
    bool _2068 = _2066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2072 = _2066 + _2070;
    float _2074 = _2028;
    float _2076 = _2064;
    float _2078 = _2072;
    float _2080 = _2056;
    float _2082 = _2058;
    float _2084 = _2060;
    float _2086 = _2062;
    if (_2068)
    {
        float _2088 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2074 = _2088;
    }
    float _2090 = _2074;
    if (_2068)
    {
        float _2092 = rsqrt(_2064);
        _2076 = _2092;
    }
    float _2094 = _2076;
    if (_2068)
    {
        float _2096 = _2072 * _2090;
        _2078 = _2096;
    }
    float _2098 = _2078;
    if (_2068)
    {
        float _2100 = _2098 * 0.15915493667125701904296875;
        _1669 = _2100;
    }
    float _2102 = _1669;
    float _2104 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2106 = _1873;
    float _2108 = _2104;
    if (_2068)
    {
        float _2110 = _2102 * 6.283185482025146484375;
        float _2112 = sin(_2110);
        _2106 = _2112;
    }
    float _2114 = _2106;
    float _2116 = precise::max(0.0, _2104);
    float _2118 = _2098;
    float _2120 = _2116;
    if (_2068)
    {
        float _2122 = _2102 * 6.283185482025146484375;
        float _2124 = cos(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    float _2128 = -_2054;
    float _2130 = -_2116;
    float _2132 = fma(_2034, _2128, _2130);
    float _2134 = _2132;
    if (_2068)
    {
        float _2136 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2136;
    }
    float _2138 = _2120;
    float _2140 = _2138;
    if (_2068)
    {
        float _2142 = fma(_2114, _2138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2140 = _2142;
    }
    float _2144 = _2140;
    float _2146 = _2144;
    if (_2068)
    {
        float _2148 = _2094 * _2144;
        _2146 = _2148;
    }
    float _2150 = _2146;
    if (_2068)
    {
        float _2152 = _2126 + (-1.0);
        _2108 = _2152;
    }
    float _2154 = _2108;
    float _2156 = _2154;
    if (_2068)
    {
        float _2158 = _2056 * _2150;
        _2080 = _2158;
    }
    float _2160 = _2080;
    if (_2068)
    {
        float _2162 = _2058 * _2150;
        _2082 = _2162;
    }
    float _2164 = _2082;
    if (_2068)
    {
        float _2166 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2166;
    }
    float _2168 = _2156;
    if (_2068)
    {
        float _2170 = _2160 * _2160;
        _2084 = _2170;
    }
    float _2172 = _2084;
    if (_2068)
    {
        float _2174 = _2164 * _2164;
        _2086 = _2174;
    }
    float _2176 = _2086;
    if (_2068)
    {
        float _2178 = fma(_2132, _2126, _2168);
        _2134 = _2178;
    }
    float _2180 = _2134;
    float _2182 = fma(_2180, _2180, _2172);
    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2186 = fma(_2052, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2184);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = _2182 + _2176;
    float _2192 = -_2188;
    float _2194 = _2192 + 1.0;
    float _2196 = rsqrt(_2190);
    float _2198 = abs(_2194);
    float _2200 = log2(_2198);
    float _2202 = _2196 * _2160;
    float _2204 = _2196 * _2180;
    float _2206 = _2196 * _2164;
    float _2208 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2210 = -_2208;
    float _2212 = fma(_2204, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2210);
    float _2214 = -_2206;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2212);
    float _2218 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2220 = fma(_2216, -0.5, 0.5);
    float _2222 = fma(_2216, 0.5, 0.5);
    float _2224 = _2204 + 1.0;
    float _2226 = exp2(_2218);
    float _2228 = fma(_2222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2230 = fma(_2222, _2228, -0.212114393711090087890625);
    float _2232 = sqrt(_2220);
    float _2234 = fma(_2222, _2230, 1.570728778839111328125);
    float _2236 = -_2204;
    float _2238 = fma(_2226, _2224, _2236);
    float _2240 = fma(_2238, 0.5, 0.5);
    float _2242 = _2232 * 0.636619746685028076171875;
    float _2244 = -_2234;
    float _2246 = fma(_2242, _2244, 1.0);
    float2 _6294 = float2(_2246, _2240);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6294, float2(0.0), isnan(_6294)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6294, float2(0.0), isnan(_6294)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    bool _2258 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2266 = _2262 || _2264;
    float _2268 = abs(_1225);
    float _2270 = log2(_2268);
    float _2272 = _861 * _1423;
    float _2274 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2276 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _2278 = -_1105;
    float _2280 = _2278 + 1.0;
    bool _2282 = _1225 <= 8000.0;
    bool _2284 = isnan(_1225);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(8000.0);
    bool _2290 = _2286 || _2288;
    float _2292 = float(_2290);
    float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2296 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2294);
    float _2298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2300 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2298);
    float _2302 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    if (_2266)
    {
        float _2304 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2302 = _2304;
    }
    float _2306 = _2302;
    float _2308 = exp2(_2274);
    float _2310 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2296);
    float _2312 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2300);
    float _2314 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2316 = _2306;
    if (_2266)
    {
        float _2318 = precise::min(_2306, 20.0);
        _2316 = _2318;
    }
    float _2320 = _2316;
    float _2322 = _909 + _2310;
    float _2324 = _913 + _2312;
    float _2326 = -_2322;
    float _2328 = _2326 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2330 = _2320;
    if (_2266)
    {
        float _2332 = 1.0 / _2320;
        _2330 = _2332;
    }
    float _2334 = _2330;
    float _2336 = -_2324;
    float _2338 = _2336 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2340 = precise::min(_2322, _2328);
    float _2342 = precise::min(_2324, _2338);
    float _2344 = _1739 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2346 = exp2(_2314);
    float _2348 = precise::min(_2340, _2342);
    float _2350 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2344);
    float _2352 = _2340;
    if (!_2266)
    {
        _2352 = 1.0;
    }
    float _2354 = _2352;
    float _2356 = _861 * _1599;
    float _2358 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2350);
    float _2360 = _2354;
    if (_2266)
    {
        float _2362 = _2348 * _2334;
        float _2364 = precise::clamp(_2362, 0.0, 1.0);
        _2360 = _2364;
    }
    float _2366 = _2360;
    float _2368 = fma(_859, _1411, _2356);
    bool _2370 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2372 = isnan(_2052);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2378 = _2374 || _2376;
    float _2380 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2358);
    float _2382 = _1087 * _2366;
    float _2384 = _861 * _1409;
    float _2386 = fma(_859, _1417, _2272);
    out.gl_Position.x = _1827;
    out.gl_Position.y = _1829;
    out.gl_Position.z = _2380;
    out.gl_Position.w = _1803;
    float _2388 = fma(_859, _1579, _2384);
    float _2390 = _2380 + _1803;
    float _2392 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2394 = precise::clamp(_2392, 0.0, 1.0);
    float _2396 = fma(_793, _1421, _2368);
    float _2398 = fma(_793, _1413, _2388);
    float _2400 = fma(_793, _1539, _2386);
    float _2402 = fma(_2394, -2.0, 3.0);
    float _2404 = _2394 * _2394;
    float _2406 = _2390 * 0.5;
    out.m_93.x = _2398;
    out.m_93.y = _2396;
    out.m_93.z = _2400;
    float _2408 = _2404 * _2402;
    float _2410 = _2382 * _1966;
    float _2412 = -_2308;
    float _2414 = _2412 + 1.0;
    if (!_1777)
    {
        _1835 = 1.0;
    }
    float _2416 = _1835;
    float _2418 = -_2408;
    float _2420 = _2418 + 1.0;
    float _2422 = _2416;
    if (_1777)
    {
        bool _2424 = _1879 >= _1843;
        bool _2426 = isnan(_1879);
        bool _2428 = _2424 || _2426;
        bool _2430 = isnan(_1843);
        bool _2432 = _2428 || _2430;
        float _2434 = float(_2432);
        _2422 = _2434;
    }
    float _2436 = _2422;
    float _2438 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.z = _2406;
    out.m_95.w = _1803;
    float _2440 = fma(_2420, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2408);
    float _2442 = _2410 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2444 = _2438 * _1881;
    float _2446 = _2436 * _2030;
    float _2448 = _2292 * _2440;
    if (!_2378)
    {
        _1809 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2450 = _1809;
    float _2452 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2454 = _2280 * _2452;
    float _2456 = precise::clamp(_2454, 0.0, 1.0);
    float _2458 = -_2456;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2462 = _1892 * _2444;
    float _2464 = -_2446;
    float _2466 = fma(_2464, _2460, 1.0);
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    float _2470 = _2256 * _2444;
    float _2472 = -_2438;
    float _2474 = _2472 + 1.0;
    float _2476 = fma(_2252, _2462, _1886);
    float _2478 = fma(_2254, _2462, _1888);
    float _2480 = fma(_1892, _2470, _1890);
    float _2482 = _1892 * _2474;
    float _2484 = _2468 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2486 = _2474;
    float _2488 = _2468;
    float _2490 = _2484;
    float _2492 = _2450;
    float _2494 = _2450;
    if (!_2378)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2496 = _1914;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2378)
    {
        _1916 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2502 = _1916;
    out.m_97.x = _2476;
    out.m_97.y = _2478;
    out.m_97.z = _2480;
    out.m_97.w = _2482;
    float _2504 = _2502;
    float _2506 = _2502;
    if (!_2378)
    {
        _2486 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2508 = _2486;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2378)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2514 = _2488;
    out.m_99.x = _2484;
    float _2516 = _2514;
    float _2518 = _2514;
    if (!_2378)
    {
        _2490 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2520 = _2490;
    bool _2522 = !_2378;
    float _2524 = _2520;
    float _2526 = _2520;
    if (!_2522)
    {
        bool _2528 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2530 = isnan(_2052);
        bool _2532 = _2528 || _2530;
        bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2536 = _2532 || _2534;
        if (!_2536)
        {
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = _2052 + _2538;
            float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2542;
            float _2546 = 1.0 / _2544;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2568 = _2540 * _2546;
            float _2570 = precise::clamp(_2568, 0.0, 1.0);
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2576 = fma(_2570, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2506 = _2578;
            _2518 = _2584;
            _2500 = _2576;
            _2512 = _2582;
            _2494 = _2580;
            _2526 = _2586;
            _2588 = true;
        }
        else
        {
            bool _2590 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2592 = isnan(_2052);
            bool _2594 = _2590 || _2592;
            bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2598 = _2594 || _2596;
            if (!_2598)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2600 = _2498;
            _2500 = _2600;
            if (!_2598)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2602 = _2504;
            _2506 = _2602;
            if (!_2598)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2604 = _2492;
            _2494 = _2604;
            if (!_2598)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2606 = _2510;
            _2512 = _2606;
            if (!_2598)
            {
                _2516 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2608 = _2516;
            _2518 = _2608;
            if (!_2598)
            {
                _2524 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2610 = _2524;
            bool _2612 = !_2598;
            _2526 = _2610;
            if (!_2612)
            {
                bool _2614 = _2052 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2616 = isnan(_2052);
                bool _2618 = _2614 || _2616;
                bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2622 = _2618 || _2620;
                if (!_2622)
                {
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = _2052 + _2624;
                    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2628;
                    float _2632 = 1.0 / _2630;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2654 = _2626 * _2632;
                    float _2656 = precise::clamp(_2654, 0.0, 1.0);
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2662 = fma(_2656, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2506 = _2664;
                    _2518 = _2670;
                    _2500 = _2662;
                    _2512 = _2668;
                    _2494 = _2666;
                    _2526 = _2672;
                    _2588 = true;
                }
                else
                {
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2518 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2526 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2588 = false;
    float _2674 = _2506;
    float _2676 = _2518;
    float _2678 = _2500;
    float _2680 = _2512;
    float _2682 = _2494;
    float _2684 = _2526;
    float _2686 = fma(_2396, -0.5, 0.5);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = -_2674;
    float _2692 = _2690 + _2676;
    float _2694 = -_2678;
    float _2696 = _2694 + _2680;
    out.m_101.x = 0.0;
    float _2698 = fma(_2688, _2692, _2674);
    float _2700 = -_2682;
    float _2702 = _2700 + _2684;
    float _2704 = fma(_2688, _2696, _2678);
    float _2706 = _2698 * 0.586610972881317138671875;
    bool _2708 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2710 = fma(_2688, _2702, _2682);
    float _2712 = _2442 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2714 = fma(_2704, 0.298911988735198974609375, _2706);
    bool _2716 = _1966 > 0.0;
    bool _2718 = isnan(_1966);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan(0.0);
    bool _2724 = _2720 || _2722;
    float _2726 = fma(_2710, 0.114477999508380889892578125, _2714);
    out.m_68.x = _2712;
    float _2728 = -_2726;
    float _2730 = _2704 + _2728;
    float _2732 = -_2726;
    float _2734 = _2698 + _2732;
    float _2736 = -_2726;
    float _2738 = _2710 + _2736;
    float _2740 = fma(_2730, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2726);
    float _2742 = fma(_2734, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2726);
    float _2744 = fma(_2738, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2726);
    bool _2746 = !_2708;
    if (!_2746)
    {
        float _2748 = -_1709;
        float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2752 = -_1711;
        float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2756 = -_1713;
        float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2760 = _2750 * _2750;
        float _2762 = fma(_2754, _2754, _2760);
        float _2764 = fma(_2758, _2758, _2762);
        float _2766 = sqrt(_2764);
        float _2768 = rsqrt(_2764);
        float _2770 = -_2766;
        float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2774 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2776 = precise::clamp(_2774, 0.0, 1.0);
        float _2778 = _2754 * _2768;
        float _2780 = _2750 * _2768;
        float _2782 = abs(_2776);
        float _2784 = log2(_2782);
        float _2786 = _2758 * _2768;
        float _2788 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2790 = _2396 * _2780;
        float _2792 = -_2780;
        float _2794 = -_2788;
        float _2796 = fma(_2792, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2794);
        float _2798 = fma(_2398, _2778, _2790);
        float _2800 = -_2786;
        float _2802 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2796);
        float _2804 = fma(_2400, _2786, _2798);
        float _2806 = precise::clamp(_2804, 0.0, 1.0);
        float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2810 = _2802 + _2808;
        float _2812 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2814 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2816 = precise::clamp(_2814, 0.0, 1.0);
        float _2818 = exp2(_2812);
        float _2820 = _2818 * _2816;
        float _2822 = _2806 * _2820;
        float _2824 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2826 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2828 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2824;
        out.m_101.y = _2826;
        out.m_101.z = _2828;
    }
    out.m_103.x = _2740;
    out.m_103.y = _2742;
    out.m_103.z = _2744;
    if (_2724)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_68.x = 0.0;
    float _2830 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2830;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

