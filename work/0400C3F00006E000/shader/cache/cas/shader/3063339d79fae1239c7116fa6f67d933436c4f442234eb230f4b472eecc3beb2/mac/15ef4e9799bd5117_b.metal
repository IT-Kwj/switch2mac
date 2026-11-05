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
    constant _16* vp_c12 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c10 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    const device _35* vp_s0 [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_14 [[id(10)]];
    sampler vp_t_tcb_14Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_16 [[id(12)]];
    sampler vp_t_tcb_16Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_32 [[id(14)]];
    sampler vp_t_tcb_32Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_30 [[id(16)]];
    sampler vp_t_tcb_30Smplr [[id(17)]];
    texture2d<float> vp_t_tcb_1C [[id(18)]];
    sampler vp_t_tcb_1CSmplr [[id(19)]];
    sampler vp_t_tcb_24Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_32Smplr_w [[id(22)]];
    sampler vp_t_tcb_30Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_92 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_88 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3065 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = as_type<float>(int(gl_VertexIndex));
    float _110 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    int _117 = as_type<int>(_108) >> 2;
    int _119 = _117 + _115;
    int _121 = _119 * 96;
    int _123 = _121 + 32;
    uint _126 = uint(int(uint(_121) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_126)];
    float _128 = as_type<float>(_dmw0.x);
    int _130 = _121 + 4;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw0.y);
    int _136 = _121 + 8;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw0.z);
    int _142 = _121 + 12;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw0.w);
    uint _148 = uint(int(uint(_123) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_148)];
    float _150 = as_type<float>(_dmw2.x);
    int _152 = _123 + 4;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw2.y);
    int _158 = _123 + 8;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>(_dmw2.z);
    int _164 = _121 + 16;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_166)];
    float _168 = as_type<float>(_dmw1.x);
    int _170 = _164 + 4;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>(_dmw1.y);
    int _176 = _164 + 8;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>(_dmw1.z);
    float _182 = float(_117);
    int _184 = as_type<int>(_108) & 1;
    bool _188 = _184 != 0;
    int _190 = as_type<int>(_108) & 2;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _196 = _194 != 0;
    float _198 = -_134;
    float _200 = _198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _202 = -_128;
    float _204 = _202 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _206 = -_140;
    float _208 = _206 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _210 = _200 * _200;
    float _212 = _156 * _156;
    float _214 = fma(_204, _204, _210);
    float _216 = fma(_150, _150, _212);
    float _218 = fma(_208, _208, _214);
    float _220 = fma(_162, _162, _216);
    float _222 = rsqrt(_218);
    float _224 = rsqrt(_220);
    float _226 = _204 * _222;
    float _228 = _200 * _222;
    float _230 = _208 * _222;
    float _232 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _234 = _174 * _174;
    float _236 = _162 * _224;
    float _238 = _156 * _224;
    float _240 = _150 * _224;
    float _242 = 1.0 / _232;
    float _244 = _226 * _236;
    float _246 = _230 * _238;
    float _248 = fma(_168, _168, _234);
    float _250 = -_244;
    float _252 = fma(_230, _240, _250);
    float _254 = _228 * _240;
    float _256 = -_246;
    float _258 = fma(_228, _236, _256);
    float _260 = fma(_180, _180, _248);
    float _262 = _252 * _252;
    float _264 = -_254;
    float _266 = fma(_226, _238, _264);
    float _268 = fma(_258, _258, _262);
    float _270 = rsqrt(_260);
    float _272 = _182 * _242;
    float _274 = fma(_266, _266, _268);
    bool _276 = !_192;
    float _278 = _276 ? 1.0 : (-1.0);
    float _280 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _282 = _280 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    int _284 = _121 + 48;
    float _286 = rsqrt(_274);
    float _288 = abs(_146);
    float _290 = _288 * _278;
    float _292 = _290 * 0.5;
    float _294 = fma(_272, _282, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _296 = _294 * _292;
    float _298 = _168 * _270;
    float _300 = _174 * _270;
    float _302 = _180 * _270;
    float _304 = _292;
    float _306 = _266;
    float _308 = _258;
    float _310 = _270;
    float _312 = _294;
    if (_196)
    {
        _304 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _314 = _304;
    float _316 = _258 * _286;
    float _318 = _252 * _286;
    float _320 = _266 * _286;
    uint _322 = uint(int(uint(_284) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_322)];
    float _324 = as_type<float>(_dmw3.x);
    int _326 = _284 + 4;
    uint _328 = uint(int(uint(_326) >> uint(2)));
    float _330 = as_type<float>(_dmw3.y);
    int _332 = _284 + 8;
    uint _334 = uint(int(uint(_332) >> uint(2)));
    float _336 = as_type<float>(_dmw3.z);
    int _338 = _284 + 12;
    uint _340 = uint(int(uint(_338) >> uint(2)));
    float _342 = as_type<float>(_dmw3.w);
    bool _344 = !_188;
    float _346 = _320;
    float _348 = _316;
    float _350 = _318;
    float _352 = _314;
    float _354 = _342;
    float _356 = _330;
    float _358 = _336;
    if (!_344)
    {
        float _360 = _302 * _316;
        float _362 = _300 * _320;
        float _364 = _298 * _318;
        float _366 = -_360;
        float _368 = fma(_298, _320, _366);
        float _370 = -_362;
        float _372 = fma(_302, _318, _370);
        float _374 = -_364;
        float _376 = fma(_300, _316, _374);
        float _378 = _368 * _368;
        float _380 = fma(_372, _372, _378);
        float _382 = fma(_376, _376, _380);
        float _384 = rsqrt(_382);
        float _386 = _372 * _384;
        float _388 = _368 * _384;
        float _390 = _376 * _384;
        _346 = _390;
        _348 = _386;
        _306 = _384;
        _308 = _382;
        _350 = _388;
        _310 = _368;
        _312 = _372;
    }
    float _392 = _346;
    float _394 = _348;
    float _396 = _306;
    float _398 = _308;
    float _400 = _350;
    float _402 = _310;
    float _404 = _312;
    float _406 = -_296;
    float _408 = fma(_392, _406, _140);
    float _410 = -_296;
    float _412 = fma(_394, _410, _128);
    float _414 = _396;
    float _416 = _398;
    float _418 = _402;
    float _420 = _404;
    float _422 = _408;
    float _424 = _412;
    if (_196)
    {
        _414 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _426 = _414;
    float _428 = _426;
    if (_196)
    {
        float _430 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _432 = _314 + _430;
        _416 = _432;
    }
    float _434 = _416;
    float _436 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _438 = _408 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _442 = _412 + _440;
    if (_196)
    {
        _418 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _444 = _418;
    float _446 = _444;
    if (_196)
    {
        float _448 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _450 = _426 + _448;
        _428 = _450;
    }
    float _452 = _428;
    float _454 = _438 * _438;
    float _456 = _454;
    if (_196)
    {
        float _458 = _434 * _434;
        _420 = _458;
    }
    float _460 = _420;
    float _462 = -_296;
    float _464 = fma(_400, _462, _134);
    float _466 = _460;
    if (_196)
    {
        float _468 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _470 = _444 + _468;
        _352 = _470;
    }
    float _472 = _352;
    float _474 = fma(_442, _442, _454);
    if (_196)
    {
        float _476 = fma(_452, _452, _460);
        _466 = _476;
    }
    float _478 = _466;
    float _480 = _478;
    if (!_196)
    {
        _446 = 0.0;
        _456 = 0.0;
    }
    float _482 = _446;
    float _484 = _456;
    float _486 = sqrt(_474);
    float _488 = _484;
    float _490 = _482;
    if (_196)
    {
        float _492 = fma(_472, _472, _478);
        _354 = _492;
    }
    float _494 = _354;
    if (!_196)
    {
        _480 = 0.0;
    }
    float _496 = _480;
    float _498 = _494;
    float _500 = _496;
    if (_196)
    {
        float _502 = rsqrt(_494);
        _498 = _502;
    }
    float _504 = _498;
    bool _506 = _486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _508 = 0.0;
    if (_196)
    {
        float _510 = _504 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _508 = _510;
    }
    float _512 = _508;
    if (_196)
    {
        float _514 = _452 * _512;
        _488 = _514;
    }
    float _516 = _488;
    if (_196)
    {
        float _518 = _434 * _512;
        _490 = _518;
    }
    float _520 = _490;
    if (_196)
    {
        float _522 = _472 * _512;
        _500 = _522;
    }
    float _524 = _500;
    float _526 = 0.0;
    if (!_506)
    {
        _526 = _464;
    }
    float _528 = _526;
    bool _530 = !_506;
    float _532 = _528;
    if (!_530)
    {
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _536 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _538 = _486 + _536;
        float _540 = _464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = rsqrt(_474);
        float _544 = _538 * _534;
        float _546 = _544 * 0.15915493667125701904296875;
        float _548 = _546 * 6.283185482025146484375;
        float _550 = cos(_548);
        float _552 = _546 * 6.283185482025146484375;
        float _554 = sin(_552);
        float _556 = _550 + (-1.0);
        float _558 = fma(_554, _540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _560 = _556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _562 = _542 * _558;
        float _564 = fma(_464, _550, _560);
        float _566 = fma(_442, _562, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _568 = fma(_438, _562, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _532 = _564;
        _422 = _568;
        _424 = _566;
    }
    float _570 = _532;
    float _572 = _422;
    float _574 = _424;
    float _576 = _520 + _570;
    float _578 = _134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _580 = _524 + _572;
    float _582 = _134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _584 = _134 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _586 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[1].x, _578);
    float _588 = _134 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _590 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[0].x, _582);
    float _592 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[2].x, _584);
    float _594 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _586);
    float _596 = _516 + _574;
    float _598 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _590);
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _602 = _576 + _600;
    float _604 = _594 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _606 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[3].x, _588);
    float _608 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _592);
    float _610 = _598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _612 = _604 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _616 = _596 + _614;
    float _618 = _602 * _602;
    float _620 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _606);
    float _622 = _608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[7].x, _612);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _628 = _580 + _626;
    float _630 = fma(_616, _616, _618);
    float _632 = _620 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _634 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[7].z, _624);
    float _636 = _604 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _638 = fma(_628, _628, _630);
    float _640 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _634);
    float _642 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[6].x, _636);
    float _644 = rsqrt(_638);
    float _646 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _648 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[6].z, _642);
    float _650 = _646 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _652 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _648);
    float _654 = 1.0 / _640;
    float _656 = _652 + _640;
    float _658 = _644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _660 = _650 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _662 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _664 = _616 * _658;
    float _666 = _628 * _658;
    float _668 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _660);
    float _670 = floor(_662);
    float _672 = _656 * _654;
    float _674 = _672 * 0.5;
    float _676 = _664 * _664;
    float _678 = _666 * _666;
    float _680 = _650 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[30].w, _682);
    float _686 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _668);
    float _688 = _676 + _678;
    float _690 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _680);
    float _692 = _686 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _694 = 1.0 / _684;
    float _696 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _690);
    float _698 = _696 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _700 = -_670;
    float _702 = _662 + _700;
    float _704 = sqrt(_688);
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _708 = _694 * _706;
    float _710 = trunc(_698);
    int _712 = int(_710);
    bool _714 = _708 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _716 = _708 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _718 = _704 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _720 = trunc(_692);
    int _722 = int(_720);
    bool _724 = !_714;
    int _726 = _724 ? 0 : 1;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _730 = _704 + _728;
    int _732 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _734 = _712 + _732;
    int _736 = _734 + 1;
    int _738 = 2;
    float _740 = _688;
    float _742 = _730;
    float _744 = (*spvDescriptorSet0.vp_c12)._m0[5].z;
    int _746 = _736;
    float _748 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    float _750 = (*spvDescriptorSet0.vp_c12)._m0[5].x;
    int _752 = as_type<int>(_664);
    int _754 = as_type<int>(_670);
    float _756 = _698;
    float _758 = _616;
    if (!_714)
    {
        _738 = 1;
    }
    int _760 = _738;
    int _762 = _760;
    if (!_716)
    {
        _762 = _726;
    }
    int _764 = _762;
    float _766 = _140;
    if (_718)
    {
        float _768 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _766 = _768;
    }
    float _770 = _766;
    int _772 = _764 << 6;
    bool _774 = _736 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _778 = _772 + 96;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    uint _782 = uint(int(uint(int(_780)) >> uint(2)));
    int _784 = int(_780) & 3;
    float _786 = (*spvDescriptorSet0.vp_c15)._m0[int(_782)][_784];
    int _788 = int(_780) + 1;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    int _792 = _788 & 3;
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[int(_790)][_792];
    if (_718)
    {
        float _796 = rsqrt(_688);
        _740 = _796;
    }
    float _798 = _740;
    float _800 = precise::max(0.0, _776);
    int _802 = _772 + 48;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    uint _806 = uint(int(uint(int(_804)) >> uint(2)));
    int _808 = int(_804) & 3;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[int(_806)][_808];
    int _812 = int(_804) + 1;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    int _816 = _812 & 3;
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[int(_814)][_816];
    float _820 = _798;
    if (_718)
    {
        float _822 = _730 * _770;
        _742 = _822;
    }
    float _824 = _742;
    int _826 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _828 = _722 + _826;
    int _830 = _828 + 1;
    float _832 = -_658;
    float _834 = -_800;
    float _836 = fma(_602, _832, _834);
    float _838 = 0.0;
    if (_718)
    {
        float _840 = _824 * 0.15915493667125701904296875;
        _838 = _840;
    }
    float _842 = _838;
    int _844 = _736 | _830;
    int _846 = _772 + 104;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c15)._m0[int(_858)][_860];
    float _864 = 0.0;
    float _866 = as_type<float>(_844);
    if (_718)
    {
        float _868 = _842 * 6.283185482025146484375;
        float _870 = sin(_868);
        _864 = _870;
    }
    float _872 = _864;
    bool _874 = _844 < 0;
    bool _876 = _874 || _774;
    if (_718)
    {
        float _878 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _866 = _878;
    }
    float _880 = _866;
    bool _882 = _830 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _884 = _882 || _876;
    int _886 = _772 + 64;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    uint _890 = uint(int(uint(int(_888)) >> uint(2)));
    int _892 = int(_888) & 3;
    float _894 = (*spvDescriptorSet0.vp_c15)._m0[int(_890)][_892];
    int _896 = int(_888) + 1;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    int _900 = _896 & 3;
    float _902 = (*spvDescriptorSet0.vp_c15)._m0[int(_898)][_900];
    float _904 = 0.0;
    float _906 = _880;
    if (_718)
    {
        float _908 = _842 * 6.283185482025146484375;
        float _910 = cos(_908);
        _904 = _910;
    }
    float _912 = _904;
    int _914 = _772 + 56;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    float _932 = _872;
    if (_718)
    {
        float _934 = fma(_872, _880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _932 = _934;
    }
    float _936 = _932;
    float _938 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_718)
    {
        _744 = _664;
    }
    float _940 = _744;
    float _942 = _940;
    if (!_884)
    {
        int _944 = _830 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _946 = _944 + _736;
        _746 = _946;
    }
    int _948 = _746;
    float _950 = 0.0;
    if (_718)
    {
        float _952 = _798 * _936;
        _950 = _952;
    }
    float _954 = _950;
    if (!_718)
    {
        _748 = _836;
    }
    float _956 = _748;
    float _958 = floor(_938);
    int _960 = _772 + 72;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    uint _964 = uint(int(uint(int(_962)) >> uint(2)));
    int _966 = int(_962) & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    int _970 = int(_962) + 1;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    int _974 = _970 & 3;
    float _976 = (*spvDescriptorSet0.vp_c15)._m0[int(_972)][_974];
    float _978 = _956;
    float _980 = _912;
    if (_718)
    {
        float _982 = _912 + (-1.0);
        _750 = _982;
    }
    float _984 = _750;
    float _986 = _984;
    if (_718)
    {
        float _988 = _664 * _954;
        _942 = _988;
    }
    float _990 = _942;
    if (!_718)
    {
        _820 = _678;
    }
    float _992 = _820;
    float _994 = _992;
    if (_718)
    {
        float _996 = _984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _996;
    }
    float _998 = _906;
    if (!_718)
    {
        _986 = _666;
    }
    float _1000 = _986;
    float _1002 = _1000;
    if (_718)
    {
        float _1004 = _666 * _954;
        _1002 = _1004;
    }
    float _1006 = _1002;
    float _1008 = _650 * _794;
    if (_718)
    {
        float _1010 = fma(_836, _912, _998);
        _978 = _1010;
    }
    float _1012 = _978;
    if (!_718)
    {
        _980 = _676;
    }
    float _1014 = _980;
    float _1016 = _1014;
    if (_718)
    {
        float _1018 = _990 * _990;
        _1016 = _1018;
    }
    float _1020 = _1016;
    if (_718)
    {
        float _1022 = _1006 * _1006;
        _994 = _1022;
    }
    float _1024 = _994;
    int _1026 = _772 + 80;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    if (!_884)
    {
        int _1044 = _948 << 2;
        _752 = _1044;
    }
    int _1046 = _752;
    float _1048 = fma(_1012, _1012, _1020);
    float _1050 = _650 * _818;
    float _1052 = sqrt(_638);
    int _1054 = _1046;
    if (!_884)
    {
        uint _1056 = uint(int(uint(_948) >> uint(2)));
        _754 = int(_1056);
    }
    int _1058 = _754;
    float _1060 = _1048 + _1024;
    float _1062 = fma(_786, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1008);
    float _1064 = fma(_810, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1050);
    float _1066 = as_type<float>(_1058);
    if (!_884)
    {
        int _1068 = 12 & _1046;
        _1054 = _1068;
    }
    int _1070 = _1054;
    float _1072 = fma(_854, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1062);
    float _1074 = rsqrt(_1060);
    if (!_884)
    {
        int _1076 = _1058 << 4;
        int _1078 = _1076 + _1070;
        _1066 = as_type<float>(_1078);
    }
    float _1080 = _1066;
    float _1082 = _1072 + _862;
    int _1084 = _772 + 88;
    uint _1086 = uint(int(uint(_1084) >> uint(2)));
    uint _1088 = uint(int(uint(int(_1086)) >> uint(2)));
    int _1090 = int(_1086) & 3;
    float _1092 = (*spvDescriptorSet0.vp_c15)._m0[int(_1088)][_1090];
    int _1094 = int(_1086) + 1;
    uint _1096 = uint(int(uint(_1094) >> uint(2)));
    int _1098 = _1094 & 3;
    float _1100 = (*spvDescriptorSet0.vp_c15)._m0[int(_1096)][_1098];
    float _1102 = _650 * _902;
    float _1104 = 1.0 / _1082;
    float _1106 = fma(_894, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1102);
    float _1108 = _1080;
    if (!_884)
    {
        int _1110 = as_type<int>(_1080) + 400;
        uint _1112 = uint(int(uint(_1110) >> uint(2)));
        uint _1114 = uint(int(uint(int(_1112)) >> uint(2)));
        int _1116 = int(_1112) & 3;
        float _1118 = (*spvDescriptorSet0.vp_c15)._m0[int(_1114)][_1116];
        _1108 = _1118;
    }
    float _1120 = _1108;
    float _1122 = -_958;
    float _1124 = _938 + _1122;
    float _1126 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1064);
    float _1128 = _576 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1130 = _1074 * _990;
    float _1132 = _1126 + _930;
    float _1134 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1128);
    float _1136 = _576 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1138 = _1130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1140 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1106);
    float _1142 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1134);
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1146 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1144);
    float _1148 = precise::clamp(_1146, 0.0, 1.0);
    float _1150 = _1132 * _1104;
    float _1152 = _1140 + _976;
    float _1154 = _576 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1156 = -_1148;
    float _1158 = _1156 + 1.0;
    float _1160 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1162 = _1074 * _1012;
    float _1164 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1154);
    float _1166 = _1074 * _1006;
    float _1168 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1170 = abs(_1158);
    float _1172 = log2(_1170);
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1176 = _1152 * _1104;
    bool _1178 = _1150 >= 0.0;
    float _1180 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1136);
    float _1182 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1164);
    float _1184 = -_1174;
    float _1186 = fma(_1184, _1168, 1.0);
    float _1188 = _576 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1190 = _1150 <= 1.0;
    bool _1192 = _1190 && _1178;
    float _1194 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1180);
    float _1196 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1198 = _638;
    float _1200 = _958;
    if (!_884)
    {
        float _1202 = floor(_692);
        _1198 = _1202;
    }
    float _1204 = _1198;
    float _1206 = -_1138;
    float _1208 = fma(_1162, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1206);
    float _1210 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1188);
    float _1212 = _650 * _1042;
    float _1214 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1216 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1218 = _1176 >= 0.0;
    bool _1220 = _1218 && _1192;
    float _1222 = -_1166;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1208);
    float _1226 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1210);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1216);
    bool _1230 = _1176 <= 1.0;
    bool _1232 = _1230 && _1220;
    float _1234 = fma(_1034, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1212);
    float _1236 = fma(_1224, -0.5, 0.5);
    float _1238 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1240 = fma(_1224, 0.5, 0.5);
    float _1242 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1244 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1228);
    float _1246 = exp2(_1238);
    float _1248 = fma(_1240, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1250 = fma(_1092, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1234);
    float _1252 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1244);
    float _1254 = _1238;
    float _1256 = _1252;
    if (_1232)
    {
        float _1258 = float(_764);
        _1200 = _1258;
    }
    float _1260 = _1200;
    float _1262 = _1250 + _1100;
    float _1264 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1266 = sqrt(_1236);
    if (!_884)
    {
        float _1268 = -_1204;
        float _1270 = _692 + _1268;
        _1254 = _1270;
    }
    float _1272 = _1254;
    float _1274 = fma(_1240, _1248, -0.212114393711090087890625);
    float _1276 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1278 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1264);
    float _1280 = _1262 * _1104;
    float _1282 = fma(_1240, _1274, 1.570728778839111328125);
    float _1284 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1276);
    float _1286 = log2(_1186);
    float _1288 = _1162 + 1.0;
    float _1290 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1278);
    float _1292 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1284);
    float _1294 = -_1162;
    float _1296 = fma(_1246, _1288, _1294);
    float _1298 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1292);
    float _1300 = 1.0 / _1252;
    float _1302 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1304 = _1266 * 0.636619746685028076171875;
    float _1306 = _936;
    float _1308 = _1302;
    if (!_884)
    {
        float _1310 = floor(_698);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = _1286 * 0.693147182464599609375;
    float _1316 = -_1282;
    float _1318 = fma(_1304, _1316, 1.0);
    float _1320 = fma(_1296, 0.5, 0.5);
    float _1322 = _1120;
    if (!_884)
    {
        float _1324 = rint(_1120);
        float _1326 = precise::max(_1324, 0.0);
        uint _1328 = uint(_1326);
        uint _1330 = clamp(_1328, 0u, 65535u);
        _1322 = as_type<float>(_1330);
    }
    float _1332 = _1322;
    float _1334 = _1298 * _1300;
    float _1336 = _1302 * _1300;
    float _1338 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _5319 = float2(_702, _1124);
    float _1340 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5319, float2(0.0), isnan(_5319)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5319, float2(0.0), isnan(_5319)), level(0.0)).x;
    float _1342 = fma(_1334, 0.5, 0.5);
    float _1344 = fma(_1336, -0.5, 0.5);
    float _1346 = _1260;
    if (_1232)
    {
        float _1348 = rint(_1260);
        float _1350 = precise::max(_1348, 0.0);
        uint _1352 = uint(_1350);
        uint _1354 = clamp(_1352, 0u, 65535u);
        _1346 = as_type<float>(_1354);
    }
    float _1356 = _1346;
    if (!_884)
    {
        float _1358 = -_1312;
        float _1360 = _698 + _1358;
        _756 = _1360;
    }
    float _1362 = _756;
    float _1364 = _1272;
    if (!_884)
    {
        float3 _5366 = float3(_1362, _1272, float(as_type<int>(_1332)));
        float3 _5370 = select(_5366, float3(0.0), isnan(_5366));
        float _1366 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5370.xy, uint(rint(_5370.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5370.xy, uint(rint(_5370.z)), level(0.0)).x;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1176;
    float _1372 = _1356;
    if (_1232)
    {
        float3 _5386 = float3(_1150, _1176, float(as_type<int>(_1356)));
        float3 _5388 = select(_5386, float3(0.0), isnan(_5386));
        float _1374 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5388.xy, uint(rint(_5388.z)), _1280, level(0.0));
        _1370 = _1374;
    }
    float _1376 = _1370;
    float3 _5398 = float3(_1342, _1344, _1338);
    float _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float3 _5407 = float3(_1342, _1344, _1338);
    float4 _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5407, float3(0.0), isnan(_5407)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5407, float3(0.0), isnan(_5407)), level(0.0)).xyzw;
    float _1383 = _1381.x;
    float _1385 = _1381.y;
    float _1387 = _1381.z;
    float _1389 = _1381.w;
    float2 _5423 = float2(_1318, _1320);
    float3 _1393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5423, float2(0.0), isnan(_5423)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5423, float2(0.0), isnan(_5423)), level(0.0)).xyz;
    float _1395 = _1393.x;
    float _1397 = _1393.y;
    float _1399 = _1393.z;
    bool _1401 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1403 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1407 = _1405 != 0;
    float _1409 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1411 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1403);
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    bool _1417 = !_192;
    float _1419 = _1417 ? 0.0 : 1.0;
    float _1421 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1411);
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1425 = _1423 != 0;
    float _1427 = _1150;
    float _1429 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1431 = _1407;
    bool _1433 = _1425;
    bool _1435 = _1401;
    if (_1401)
    {
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1427 = _1437;
    }
    float _1439 = _1427;
    if (_1401)
    {
        _1372 = (*spvDescriptorSet0.vp_c9)._m0[14].x;
    }
    float _1441 = _1372;
    float _1443 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1421);
    bool _1445 = false;
    float _1447 = _1441;
    if (_1407)
    {
        bool _1449 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _1445 = _1449;
    }
    bool _1451 = _1445;
    if (_1401)
    {
        _1429 = (*spvDescriptorSet0.vp_c9)._m0[15].x;
    }
    float _1453 = _1429;
    float _1455 = 0.0;
    float _1457 = _1453;
    if (!_1407)
    {
        _1455 = _1419;
    }
    float _1459 = _1455;
    float _1461 = _1459;
    if (_1407)
    {
        float _1463 = -_1419;
        float _1465 = _1451 ? _1463 : _1419;
        _1461 = _1465;
    }
    float _1467 = _1461;
    if (_1401)
    {
        float _1469 = _1453 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1457 = _1469;
    }
    float _1471 = _1457;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1475 = _1473 != 0;
    float _1477 = _1471;
    if (_1415)
    {
        bool _1479 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1431 = _1479;
    }
    bool _1481 = _1431;
    bool _1483 = _1481;
    if (_1401)
    {
        float _1485 = fma(_1471, _1441, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1447 = _1485;
    }
    float _1487 = _1447;
    float _1489 = 0.0;
    float _1491 = _1487;
    if (!_1415)
    {
        _1489 = _1419;
    }
    float _1493 = _1489;
    float _1495 = _1493;
    if (_1401)
    {
        float _1497 = _1487 * _1439;
        _1491 = _1497;
    }
    float _1499 = _1491;
    if (_1415)
    {
        float _1501 = -_1419;
        float _1503 = _1481 ? _1501 : _1419;
        _1495 = _1503;
    }
    float _1505 = _1495;
    if (_1425)
    {
        bool _1507 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1483 = _1507;
    }
    bool _1509 = _1483;
    float _1511 = _1439;
    if (_1401)
    {
        float _1513 = floor(_1499);
        _1511 = _1513;
    }
    float _1515 = _1511;
    if (!_1425)
    {
        _1477 = _1419;
    }
    float _1517 = _1477;
    float _1519 = 0.0;
    float _1521 = _1517;
    if (!_1475)
    {
        float _1523 = -_324;
        float _1525 = (-0.0) + _1523;
        _1519 = _1525;
    }
    float _1527 = _1519;
    float _1529 = _1527;
    if (_1425)
    {
        float _1531 = -_1419;
        float _1533 = _1509 ? _1531 : _1419;
        _1521 = _1533;
    }
    float _1535 = _1521;
    float _1537 = _1505 + (-0.5);
    if (_1475)
    {
        bool _1539 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1433 = _1539;
    }
    bool _1541 = _1433;
    bool _1543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1545 = _1342;
    bool _1547 = _1543;
    if (!_1401)
    {
        float _1549 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _1545 = _1549;
    }
    float _1551 = _1545;
    if (_1475)
    {
        float _1553 = -_324;
        float _1555 = _1541 ? _324 : _1553;
        _1529 = _1555;
    }
    float _1557 = _1529;
    float _1559 = _1535 + (-0.5);
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1563 = _1561 != 0;
    float _1565 = _1557 + 0.5;
    float _1567 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1569 = 0.0;
    if (_1401)
    {
        float _1571 = -_1515;
        float _1573 = _1499 + _1571;
        _1569 = _1573;
    }
    float _1575 = _1569;
    out.m_68.w = _1567;
    float _1577 = _1344;
    float _1579 = _1575;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (_1543)
    {
        float _1583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1577 = _1583;
    }
    float _1585 = _1577;
    if (!_1401)
    {
        float _1587 = _1551 * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1579 = _1587;
    }
    float _1589 = _1579;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1593 = _1591 != 0;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1601 = _1599 != 0;
    float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1605 = _1603 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1607 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1609 = 1.0 / _1605;
    float _1611 = _1605;
    float _1613 = _1609;
    if (_1563)
    {
        bool _1615 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1435 = _1615;
    }
    bool _1617 = _1435;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1625 = _1623 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1627 = 1.0 / _1597;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (_1543)
    {
        _1611 = (*spvDescriptorSet0.vp_c9)._m0[15].y;
    }
    float _1631 = _1611;
    out.m_70.w = _1607;
    float _1633 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1619);
    float _1635 = _1631;
    if (_1543)
    {
        _1581 = (*spvDescriptorSet0.vp_c9)._m0[14].y;
    }
    float _1637 = _1581;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_1543)
    {
        float _1641 = _1631 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1635 = _1641;
    }
    float _1643 = _1635;
    float _1645 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1621);
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1655 = _1643;
    if (_1543)
    {
        float _1657 = fma(_1643, _1637, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1655 = _1657;
    }
    float _1659 = _1655;
    float _1661 = -_1639;
    float _1663 = fma(_1647, 2.0, _1661);
    float _1665 = 1.0 / _1625;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1673 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1649);
    if (_1543)
    {
        float _1675 = _1659 * _1585;
        _1629 = _1675;
    }
    float _1677 = _1629;
    float _1679 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1671);
    float _1681 = 1.0 / _1653;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1687 = _1589 + _1685;
    float _1689 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1683);
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1693 = 1.0 / _1669;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1701 = _1589 + _1699;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1705 = _1703 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1707 = fma(_1695, -2.0, _1691);
    float _1709 = _1637;
    float _1711 = _1677;
    float _1713 = _1681;
    if (_1543)
    {
        float _1715 = floor(_1677);
        _1709 = _1715;
    }
    float _1717 = _1709;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1725 = _1589 + _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1729 = _1589 + _1727;
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1731;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[88].w);
    if (!_1543)
    {
        float _1737 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _1735 = as_type<int>(_1737);
    }
    int _1739 = _1735;
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1745 = _1733 * _1627;
    float _1747 = _1743 * _1665;
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1751 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1755 = _1753 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1757 = 1.0 / _1705;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[84].z;
    if (_1543)
    {
        float _1761 = -_1717;
        float _1763 = _1677 + _1761;
        _1711 = _1763;
    }
    float _1765 = _1711;
    float _1767 = _1751 * _1681;
    float _1769 = _1755 * _1609;
    float _1771 = _1765;
    if (!_1593)
    {
        _1613 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1773 = _1613;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1775;
    float _1779 = _1773;
    if (_1593)
    {
        _1779 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1781 = _1779;
    float _1783 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1785 = 1.0 / _1721;
    int _1787 = _1739;
    float _1789 = _1783;
    if (!_1543)
    {
        float _1791 = as_type<float>(_1739) * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1771 = _1791;
    }
    float _1793 = _1771;
    if (_1601)
    {
        _1713 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1795 = _1713;
    float _1797 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1783);
    float _1799 = _1795;
    if (_1593)
    {
        _1787 = 0;
    }
    int _1801 = _1787;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1805 = _1793 + _1803;
    int _1807 = _1801;
    if (!_1593)
    {
        _1807 = 2;
    }
    int _1809 = _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1817 = _1815 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    if (_1601)
    {
        bool _1819 = _1795 > 0.5;
        _1547 = _1819;
    }
    bool _1821 = _1547;
    if (!_1593)
    {
        _1759 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1823 = _1759;
    float _1825 = _1817 * _1757;
    float _1827 = _1757;
    float _1829 = _1823;
    if (!_1593)
    {
        _1799 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1831 = _1799;
    float _1833 = _1813 * _1693;
    float _1835 = _1831;
    if (!_1593)
    {
        _1789 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1837 = _1789;
    float _1839 = _1777 * _1785;
    float _1841 = _1837;
    if (!_1593)
    {
        _1827 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1843 = _1827;
    float _1845 = _1843;
    if (_1593)
    {
        _1829 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1847 = _1829;
    if (_1593)
    {
        _1835 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1849 = _1835;
    if (_1593)
    {
        _1841 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1851 = _1841;
    if (_1593)
    {
        _1845 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1853 = _1845;
    float _1855 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1697);
    float _1857 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1859 = _1809 != 2;
    float _1861 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1865;
    float _1869 = fma(_1853, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1863);
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1873 = 1.0 / _1867;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1879 = 0.0;
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[89].z;
    float _1883 = _1861;
    if (_1859)
    {
        _1879 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1885 = _1879;
    float _1887 = -_1871;
    float _1889 = fma(_1857, 2.0, _1887);
    float _1891 = _1885;
    if (!_1859)
    {
        _1891 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1893 = _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1895;
    float _1899 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1797);
    float _1901 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1869);
    float _1903 = 1.0 / _1877;
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (!_1601)
    {
        float _1909 = -_330;
        float _1911 = (-0.0) + _1909;
        _1881 = _1911;
    }
    float _1913 = _1881;
    float _1915 = _1913;
    if (_1601)
    {
        float _1917 = -_330;
        float _1919 = _1821 ? _330 : _1917;
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = fma(_1861, -2.0, _1905);
    if (_1859)
    {
        _356 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1925 = _356;
    float _1927 = _1925;
    if (!_1563)
    {
        float _1929 = -_336;
        float _1931 = (-0.0) + _1929;
        _1883 = _1931;
    }
    float _1933 = _1883;
    float _1935 = _1933;
    if (!_1859)
    {
        _1927 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1937 = _1927;
    float _1939 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1907);
    if (_1563)
    {
        float _1941 = -_336;
        float _1943 = _1617 ? _336 : _1941;
        _1935 = _1943;
    }
    float _1945 = _1935;
    float _1947 = 1.0 / _1897;
    if (_1859)
    {
        _358 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1949 = _358;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1955 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1957 = _1949;
    if (!_1859)
    {
        _1957 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1959 = _1957;
    float _1961 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1889);
    float _1963 = 1.0 / _1953;
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1965;
    float _1969 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1923);
    float _1971 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1971;
    float _1975 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1663);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1979 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1633);
    float _1981 = 1.0 / _1967;
    float _1983 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1993 = _1589 + _1991;
    float _1995 = -_1977;
    float _1997 = fma(_1983, 2.0, _1995);
    float _1999 = _1725 * _1947;
    float _2001 = fma(_1955, -2.0, _1989);
    float _2003 = 1.0 / _1987;
    float _2005 = _1993 * _1873;
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2009 = _1793 + _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2013 = _1589 + _2011;
    float _2015 = _1701 * _1963;
    float _2017 = fma(_1747, _2009, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2019 = _2013 * _1903;
    float _2021 = 1.0 / _1973;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2025 = _1793 + _2023;
    float _2027 = _1687 * _1981;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2031 = _1793 + _2029;
    float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2035 = _1793 + _2033;
    float _2037 = fma(_1745, _2025, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2039 = fma(_1769, _1805, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2043 = _1589 + _2041;
    float _2045 = fma(_1767, _2031, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2047 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2049 = _1793 + _2047;
    float _2051 = fma(_1825, _2035, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2053 = _1729 * _2003;
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2055;
    float _2059 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1645);
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2065 = _2043 * _2021;
    float _2067 = fma(_1833, _2049, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2069 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2001);
    float _2071 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1855);
    float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2073;
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2081 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1707);
    float _2083 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1679);
    float _2085 = fma(_2075, _2005, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2087 = fma(_2057, _2005, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2089 = fma(_2079, _2019, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2091 = fma(_2063, _2019, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2093 = _2059 * (-0.15915493667125701904296875);
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2099;
    float _2103 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1673);
    float _2105 = _2093 * 6.283185482025146484375;
    float _2107 = sin(_2105);
    float _2109 = fma(_2097, _1999, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2111 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1689);
    float _2113 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1939);
    float _2115 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1997);
    float _2117 = fma(_2101, _1999, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2123 = _2093 * 6.283185482025146484375;
    float _2125 = cos(_2123);
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2131 = fma(_2121, _2015, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2133;
    float _2137 = fma(_2129, _2015, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2141 = _2139 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2145 = _2143 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2147 = fma(_2141, _2053, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2149 = _1899 * (-0.15915493667125701904296875);
    float _2151 = fma(_2145, _2053, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _2153 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2153;
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2159 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2157;
    float _2161 = _1467 + (-0.5);
    float _2163 = _1565 * _2107;
    float _2165 = _1565 * _2125;
    float _2167 = fma(_2155, _2065, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2169 = fma(_2159, _2065, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    bool _2171 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2173 = isnan(_1589);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2179 = _2175 || _2177;
    float _2181 = float(_2179);
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2183;
    bool _2187 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2189 = isnan(_1793);
    bool _2191 = _2187 || _2189;
    bool _2193 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2195 = _2191 || _2193;
    float _2197 = float(_2195);
    float _2199 = -_2163;
    float _2201 = fma(_2161, _2125, _2199);
    bool _2203 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2205 = isnan(_1589);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = fma(_2161, _2107, _2165);
    bool _2217 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2219 = isnan(_1793);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2225 = _2221 || _2223;
    float _2227 = float(_2225);
    float _2229 = -_2181;
    float _2231 = _2229 + 1.0;
    bool _2233 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2235 = isnan(_1589);
    bool _2237 = _2233 || _2235;
    bool _2239 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2241 = _2237 || _2239;
    float _2243 = float(_2241);
    float _2245 = -_2197;
    float _2247 = _2245 + 1.0;
    float _2249 = -_2213;
    float _2251 = _2249 + 1.0;
    bool _2253 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2255 = isnan(_1793);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2261 = _2257 || _2259;
    float _2263 = float(_2261);
    float _2265 = -_2227;
    float _2267 = _2265 + 1.0;
    bool _2269 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2271 = isnan(_1589);
    bool _2273 = _2269 || _2271;
    bool _2275 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2277 = _2273 || _2275;
    float _2279 = float(_2277);
    float _2281 = _2149 * 6.283185482025146484375;
    float _2283 = sin(_2281);
    bool _2285 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2287 = isnan(_1589);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2299 = _1793 + _2297;
    bool _2301 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2303 = isnan(_1589);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = _2113 * (-0.15915493667125701904296875);
    bool _2315 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2317 = isnan(_1589);
    bool _2319 = _2315 || _2317;
    bool _2321 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2323 = _2319 || _2321;
    float _2325 = float(_2323);
    float _2327 = fma(_1839, _2299, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2329 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2331 = isnan(_1589);
    bool _2333 = _2329 || _2331;
    bool _2335 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2337 = _2333 || _2335;
    float _2339 = float(_2337);
    float _2341 = _2213 * _2231;
    float _2343 = _2227 * _2247;
    float _2345 = _2243 * _2251;
    float _2347 = -_2243;
    float _2349 = _2347 + 1.0;
    float _2351 = _2263 * _2267;
    float _2353 = -_2263;
    float _2355 = _2353 + 1.0;
    bool _2357 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2359 = isnan(_1793);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2365 = _2361 || _2363;
    float _2367 = float(_2365);
    float _2369 = _2149 * 6.283185482025146484375;
    float _2371 = cos(_2369);
    bool _2373 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2375 = isnan(_1793);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2381 = _2377 || _2379;
    float _2383 = float(_2381);
    float _2385 = _2339 * _2349;
    bool _2387 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2389 = isnan(_1793);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2395 = _2391 || _2393;
    float _2397 = float(_2395);
    float _2399 = -_2325;
    float _2401 = _2399 + 1.0;
    bool _2403 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2405 = isnan(_1793);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2411 = _2407 || _2409;
    float _2413 = float(_2411);
    float _2415 = -_2367;
    float _2417 = _2415 + 1.0;
    float _2419 = -_2339;
    float _2421 = _2419 + 1.0;
    float _2423 = _2311 * _2401;
    bool _2425 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2427 = isnan(_1793);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2433 = _2429 || _2431;
    float _2435 = float(_2433);
    float _2437 = _2383 * _2355;
    float _2439 = -_2383;
    float _2441 = _2439 + 1.0;
    float _2443 = -_2311;
    float _2445 = _2443 + 1.0;
    float _2447 = _2397 * _2417;
    float _2449 = _2325 * _2421;
    float _2451 = -_2397;
    float _2453 = _2451 + 1.0;
    float _2455 = _2367 * _2441;
    float _2457 = _1921 + 0.5;
    float _2459 = _2313 * 6.283185482025146484375;
    float _2461 = sin(_2459);
    float _2463 = _2295 * _2445;
    float _2465 = -_2295;
    float _2467 = _2465 + 1.0;
    float _2469 = _2435 * _2453;
    float _2471 = -_2435;
    float _2473 = _2471 + 1.0;
    float _2475 = _2457 * _2283;
    float _2477 = _2457 * _2371;
    float _2479 = _2279 * _2467;
    float _2481 = _2313 * 6.283185482025146484375;
    float _2483 = cos(_2481);
    float _2485 = _2413 * _2473;
    float _2487 = -_2279;
    float _2489 = _2487 + 1.0;
    float _2491 = _2085 * _2479;
    float _2493 = _2087 * _2479;
    float _2495 = _2037 * _2485;
    float _2497 = _1945 + 0.5;
    float _2499 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2491);
    float _2501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2503 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2493);
    float _2505 = _2497 * _2461;
    float _2507 = fma(_2089, _2463, _2499);
    float _2509 = fma(_2135, _2027, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2511 = fma(_2091, _2463, _2503);
    float _2513 = _2215 + (-0.5);
    float _2515 = fma(_2185, _2027, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2519 = _2497 * _2483;
    float _2521 = -_2505;
    float _2523 = fma(_1559, _2483, _2521);
    float _2525 = -_2413;
    float _2527 = _2525 + 1.0;
    float _2529 = -_2475;
    float _2531 = fma(_1537, _2371, _2529);
    float _2533 = fma(_1559, _2461, _2519);
    float _2535 = _2201 + 0.5;
    float _2537 = fma(_2527, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2495);
    float _2539 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2543 = fma(_1537, _2283, _2477);
    float _2545 = fma(_2017, _2469, _2537);
    float _2547 = fma(_2539, _2535, _1975);
    float _2549 = fma(_2109, _2423, _2507);
    float _2551 = fma(_2117, _2423, _2511);
    float _2553 = fma(_2045, _2447, _2545);
    float _2555 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2559 = _2531 + 0.5;
    float _2561 = fma(_2131, _2449, _2549);
    float _2563 = -_2555;
    float _2565 = -_2081;
    float _2567 = fma(_2563, _2513, _2565);
    float _2569 = _2533 + (-0.5);
    float _2571 = fma(_2137, _2449, _2551);
    float _2573 = fma(_2039, _2455, _2553);
    float _2575 = -_2083;
    float _2577 = _2575 + 1.0;
    float _2579 = abs(_708);
    float _2581 = log2(_2579);
    float _2583 = _2541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2585 = _2543 + (-0.5);
    float _2587 = -_2071;
    float _2589 = _2587 + 1.0;
    float _2591 = -_1901;
    float _2593 = _2591 + 1.0;
    float _2595 = fma(_2509, _2385, _2561);
    float _2597 = -_2583;
    float _2599 = -_1969;
    float _2601 = fma(_2597, _2585, _2599);
    float _2603 = fma(_2515, _2385, _2571);
    float _2605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2607 = _2557 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2609 = fma(_2067, _2437, _2573);
    float _2611 = fma(_2215, _2577, _2567);
    float _2613 = fma(_2543, _2593, _2601);
    float _2615 = -_2607;
    float _2617 = -_2069;
    float _2619 = fma(_2615, _2569, _2617);
    float _2621 = -_1979;
    float _2623 = _2621 + 1.0;
    float _2625 = fma(_2147, _2345, _2595);
    float _2627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2629 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2631 = -_2623;
    float _2633 = fma(_2201, _2631, _2547);
    float _2635 = _2523 + 0.5;
    float _2637 = fma(_2151, _2345, _2603);
    float _2639 = fma(_2051, _2351, _2609);
    float _2641 = fma(_2167, _2341, _2625);
    float _2643 = exp2(_2629);
    float _2645 = _2605 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2647 = -_2111;
    float _2649 = _2647 + 1.0;
    float _2651 = -_2103;
    float _2653 = _2651 + 1.0;
    float _2655 = fma(_2169, _2341, _2637);
    float _2657 = fma(_2645, _2559, _1961);
    float _2659 = fma(_2327, _2343, _2639);
    float _2661 = fma(_2533, _2649, _2619);
    float _2663 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2665 = -_2589;
    float _2667 = fma(_2531, _2665, _2657);
    float _2669 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2641);
    float _2671 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2655);
    float _2673 = fma(_2663, _2635, _2115);
    float _2675 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2659);
    out.m_72.x = _2633;
    out.m_72.y = _2611;
    out.m_72.z = _2667;
    out.m_72.w = _2613;
    float _2677 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2679 = precise::clamp(_2677, 0.0, 1.0);
    float _2681 = -_2653;
    float _2683 = fma(_2523, _2681, _2673);
    out.m_74.x = _2669;
    out.m_74.y = _2671;
    out.m_76.x = _2683;
    out.m_76.y = _2661;
    out.m_78.x = _2675;
    float _2685 = fma(_2679, -2.0, 3.0);
    float _2687 = _2679 * _2679;
    bool _2689 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2691 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan(0.5);
    bool _2697 = _2693 || _2695;
    bool _2699 = _708 <= 8000.0;
    bool _2701 = isnan(_708);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(8000.0);
    bool _2707 = _2703 || _2705;
    float _2709 = float(_2707);
    float _2711 = _2687 * _2685;
    float _2713 = -_2711;
    float _2715 = _2713 + 1.0;
    float _2717 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _2721 = fma(_2715, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2711);
    float _2723 = fma(_272, _2719, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _2725 = _2709 * _2721;
    float _2727 = _1443 + _1252;
    float _2729 = _2727 * 0.5;
    float _2731 = _2727;
    float _2733 = _1298;
    if (_2697)
    {
        _2731 = 1.0;
    }
    float _2735 = _2731;
    float _2737 = _2735;
    if (!_2697)
    {
        float _2739 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2741 = _2739 * 0.15915493667125701904296875;
        float _2743 = _2741 * 6.283185482025146484375;
        float _2745 = cos(_2743);
        float _2747 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2749 = _2747 * 0.15915493667125701904296875;
        float _2751 = _2741 * 6.283185482025146484375;
        float _2753 = sin(_2751);
        float _2755 = 1.0 / _2745;
        float _2757 = _2749 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2753 * _2755;
        float _2763 = _2749 * 6.283185482025146484375;
        float _2765 = sin(_2763);
        float _2767 = _2759 * _2761;
        float _2769 = 1.0 / _2767;
        float _2771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2771;
        float _2775 = 1.0 / _2773;
        float _2777 = _2765 * _2769;
        float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2781 = fma(_708, _2777, _2779);
        float _2783 = _2781 * _2775;
        float _2785 = precise::clamp(_2783, 0.0, 1.0);
        _2737 = _2785;
    }
    float _2787 = _2737;
    float _2789 = exp2(_1409);
    out.m_80.z = _2729;
    out.m_80.w = _1252;
    float _2791 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2793 = -_1340;
    float _2795 = _2793 + 1.0;
    float _2797 = _302 * _400;
    float _2799 = _298 * _392;
    float _2801 = _300 * _394;
    float _2803 = _2795 * _2791;
    float _2805 = precise::clamp(_2803, 0.0, 1.0);
    out.gl_Position.x = _1298;
    out.gl_Position.y = _1302;
    out.gl_Position.z = _1443;
    out.gl_Position.w = _1252;
    float _2807 = _2723 * _2787;
    float _2809 = -_2797;
    float _2811 = fma(_300, _392, _2809);
    float _2813 = -_2799;
    float _2815 = fma(_302, _394, _2813);
    out.m_82.x = _616;
    out.m_82.y = _602;
    out.m_82.z = _628;
    float _2817 = -_2801;
    float _2819 = fma(_298, _400, _2817);
    float _2821 = -_2805;
    float _2823 = fma(_2821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2825 = -_2789;
    float _2827 = _2825 + 1.0;
    if (!_1232)
    {
        _1308 = 1.0;
    }
    float _2829 = _1308;
    float _2831 = _2829;
    if (_1232)
    {
        bool _2833 = _1376 >= _1280;
        bool _2835 = isnan(_1376);
        bool _2837 = _2833 || _2835;
        bool _2839 = isnan(_1280);
        bool _2841 = _2837 || _2839;
        float _2843 = float(_2841);
        _2831 = _2843;
    }
    float _2845 = _2831;
    float _2847 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2849 = _2847;
    float _2851 = _2845;
    if (_884)
    {
        _2733 = 1.0;
    }
    float _2853 = _2733;
    float _2855 = _2853;
    if (!_884)
    {
        int _2857 = _948 << 4;
        int _2859 = _2857 + 2048;
        uint _2861 = uint(int(uint(_2859) >> uint(2)));
        uint _2863 = uint(int(uint(int(_2861)) >> uint(2)));
        int _2865 = int(_2861) & 3;
        float _2867 = (*spvDescriptorSet0.vp_c15)._m0[int(_2863)][_2865];
        int _2869 = int(_2861) + 1;
        uint _2871 = uint(int(uint(_2869) >> uint(2)));
        int _2873 = _2869 & 3;
        float _2875 = (*spvDescriptorSet0.vp_c15)._m0[int(_2871)][_2873];
        int _2877 = _2859 + 8;
        uint _2879 = uint(int(uint(_2877) >> uint(2)));
        uint _2881 = uint(int(uint(int(_2879)) >> uint(2)));
        int _2883 = int(_2879) & 3;
        float _2885 = (*spvDescriptorSet0.vp_c15)._m0[int(_2881)][_2883];
        int _2887 = int(_2879) + 1;
        uint _2889 = uint(int(uint(_2887) >> uint(2)));
        int _2891 = _2887 & 3;
        float _2893 = (*spvDescriptorSet0.vp_c15)._m0[int(_2889)][_2891];
        float _2895 = _650 * _2875;
        float _2897 = fma(_2867, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2895);
        float _2899 = fma(_2885, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2897);
        float _2901 = _2899 + _2893;
        float _2903 = precise::clamp(_2901, 0.0, 1.0);
        float _2905 = -_2903;
        float _2907 = _2905 + _1368;
        float _2909 = fma(_2907, 500.0, 1.5);
        float _2911 = exp2(_2909);
        float _2913 = 0.0 + _2911;
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        _2855 = _2915;
        _1256 = 500.0;
    }
    float _2917 = _2855;
    float _2919 = _1256;
    float _2921 = _2847 * _1378;
    float _2923 = _2845 * _2917;
    float _2925 = -_2847;
    float _2927 = _2925 + 1.0;
    out.m_84.x = _2811;
    out.m_84.y = _2815;
    out.m_84.z = _2819;
    float _2929 = _1389 * _2921;
    float _2931 = -_2923;
    float _2933 = fma(_2931, _2823, 1.0);
    float _2935 = precise::clamp(_2933, 0.0, 1.0);
    float _2937 = _1399 * _2921;
    bool _2939 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2941 = isnan(_1052);
    bool _2943 = _2939 || _2941;
    bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2947 = _2943 || _2945;
    float _2949 = fma(_1395, _2929, _1383);
    float _2951 = fma(_1397, _2929, _1385);
    float _2953 = _2935 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2955 = _1389 * _2927;
    float _2957 = fma(_1389, _2937, _1387);
    float _2959 = _2807 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.x = _2953;
    out.m_88.x = _2949;
    out.m_88.y = _2951;
    out.m_88.z = _2957;
    out.m_88.w = _2955;
    float _2961 = _2919;
    float _2963 = _2927;
    float _2965 = _2935;
    if (!_2947)
    {
        _2849 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2967 = _2849;
    float _2969 = _2967;
    float _2971 = _2967;
    if (!_2947)
    {
        _758 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2973 = _758;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2947)
    {
        _2961 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2979 = _2961;
    float _2981 = _2979;
    float _2983 = _2979;
    if (!_2947)
    {
        _2963 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2985 = _2963;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2947)
    {
        _2851 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2991 = _2851;
    float _2993 = _2991;
    float _2995 = _2991;
    if (!_2947)
    {
        _2965 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2997 = _2965;
    bool _2999 = !_2947;
    float _3001 = _2997;
    float _3003 = _2997;
    if (!_2999)
    {
        bool _3005 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3007 = isnan(_1052);
        bool _3009 = _3005 || _3007;
        bool _3011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3013 = _3009 || _3011;
        if (!_3013)
        {
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3017 = _1052 + _3015;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3021 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3019;
            float _3023 = 1.0 / _3021;
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3045 = _3017 * _3023;
            float _3047 = precise::clamp(_3045, 0.0, 1.0);
            float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3053 = fma(_3047, _3027, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3055 = fma(_3047, _3051, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3057 = fma(_3047, _3031, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3059 = fma(_3047, _3035, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3061 = fma(_3047, _3039, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3063 = fma(_3047, _3043, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2977 = _3055;
            _2995 = _3061;
            _2971 = _3053;
            _2989 = _3059;
            _2983 = _3057;
            _3003 = _3063;
            _3065 = true;
        }
        else
        {
            bool _3067 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3069 = isnan(_1052);
            bool _3071 = _3067 || _3069;
            bool _3073 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3075 = _3071 || _3073;
            if (!_3075)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3077 = _2969;
            _2971 = _3077;
            if (!_3075)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3079 = _2975;
            _2977 = _3079;
            if (!_3075)
            {
                _2981 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3081 = _2981;
            _2983 = _3081;
            if (!_3075)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3083 = _2987;
            _2989 = _3083;
            if (!_3075)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3085 = _2993;
            _2995 = _3085;
            if (!_3075)
            {
                _3001 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3087 = _3001;
            bool _3089 = !_3075;
            _3003 = _3087;
            if (!_3089)
            {
                bool _3091 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3093 = isnan(_1052);
                bool _3095 = _3091 || _3093;
                bool _3097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3099 = _3095 || _3097;
                if (!_3099)
                {
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3103 = _1052 + _3101;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3107 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3105;
                    float _3109 = 1.0 / _3107;
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3131 = _3103 * _3109;
                    float _3133 = precise::clamp(_3131, 0.0, 1.0);
                    float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3137 = _3135 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3139 = fma(_3133, _3113, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3141 = fma(_3133, _3137, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3143 = fma(_3133, _3117, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3145 = fma(_3133, _3121, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3147 = fma(_3133, _3125, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3149 = fma(_3133, _3129, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2977 = _3141;
                    _2995 = _3147;
                    _2971 = _3139;
                    _2989 = _3145;
                    _2983 = _3143;
                    _3003 = _3149;
                    _3065 = true;
                }
                else
                {
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2983 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3003 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3065 = false;
    float _3151 = _2977;
    float _3153 = _2995;
    float _3155 = _2971;
    float _3157 = _2989;
    float _3159 = _2983;
    float _3161 = _3003;
    float _3163 = fma(_2815, -0.5, 0.5);
    float _3165 = precise::clamp(_3163, 0.0, 1.0);
    float _3167 = -_3151;
    float _3169 = _3167 + _3153;
    float _3171 = -_3155;
    float _3173 = _3171 + _3157;
    float _3175 = -_3159;
    float _3177 = _3175 + _3161;
    bool _3179 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3181 = fma(_3165, _3169, _3151);
    float _3183 = fma(_3165, _3173, _3155);
    float _3185 = fma(_3165, _3177, _3159);
    float _3187 = _2959 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3189 = _3181 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _3191 = fma(_3183, 0.298911988735198974609375, _3189);
    out.m_92.x = _3187;
    float _3193 = fma(_3185, 0.114477999508380889892578125, _3191);
    float _3195 = -_3193;
    float _3197 = _3183 + _3195;
    float _3199 = -_3193;
    float _3201 = _3181 + _3199;
    float _3203 = -_3193;
    float _3205 = _3185 + _3203;
    float _3207 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3193);
    float _3209 = fma(_3201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3193);
    float _3211 = fma(_3205, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3193);
    out.m_94.x = _3207;
    out.m_94.y = _3209;
    out.m_94.z = _3211;
    if (!_3179)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3213 = -_576;
    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3217 = -_596;
    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3221 = -_580;
    float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3225 = _3215 * _3215;
    float _3227 = fma(_3219, _3219, _3225);
    float _3229 = fma(_3223, _3223, _3227);
    float _3231 = sqrt(_3229);
    float _3233 = rsqrt(_3229);
    float _3235 = -_3231;
    float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3239 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3241 = precise::clamp(_3239, 0.0, 1.0);
    float _3243 = _3219 * _3233;
    float _3245 = _3215 * _3233;
    float _3247 = abs(_3241);
    float _3249 = log2(_3247);
    float _3251 = _3223 * _3233;
    float _3253 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3255 = _2815 * _3245;
    float _3257 = -_3245;
    float _3259 = -_3253;
    float _3261 = fma(_3257, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3259);
    float _3263 = fma(_2811, _3243, _3255);
    float _3265 = -_3251;
    float _3267 = fma(_3265, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3261);
    float _3269 = fma(_2819, _3251, _3263);
    float _3271 = precise::clamp(_3269, 0.0, 1.0);
    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3275 = _3267 + _3273;
    float _3277 = _3249 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3279 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = exp2(_3277);
    float _3285 = _3283 * _3281;
    float _3287 = _3271 * _3285;
    float _3289 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3291 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3293 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3289;
    out.m_90.y = _3291;
    out.m_90.z = _3293;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3065 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = as_type<float>(int(gl_VertexIndex));
    float _110 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    int _117 = as_type<int>(_108) >> 2;
    int _119 = _117 + _115;
    int _121 = _119 * 96;
    int _123 = _121 + 32;
    uint _126 = uint(int(uint(_121) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_126)];
    float _128 = as_type<float>(_dmw0.x);
    int _130 = _121 + 4;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw0.y);
    int _136 = _121 + 8;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw0.z);
    int _142 = _121 + 12;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw0.w);
    uint _148 = uint(int(uint(_123) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_148)];
    float _150 = as_type<float>(_dmw2.x);
    int _152 = _123 + 4;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw2.y);
    int _158 = _123 + 8;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>(_dmw2.z);
    int _164 = _121 + 16;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_166)];
    float _168 = as_type<float>(_dmw1.x);
    int _170 = _164 + 4;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>(_dmw1.y);
    int _176 = _164 + 8;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>(_dmw1.z);
    float _182 = float(_117);
    int _184 = as_type<int>(_108) & 1;
    bool _188 = _184 != 0;
    int _190 = as_type<int>(_108) & 2;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _196 = _194 != 0;
    float _198 = -_134;
    float _200 = _198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _202 = -_128;
    float _204 = _202 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _206 = -_140;
    float _208 = _206 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _210 = _200 * _200;
    float _212 = _156 * _156;
    float _214 = fma(_204, _204, _210);
    float _216 = fma(_150, _150, _212);
    float _218 = fma(_208, _208, _214);
    float _220 = fma(_162, _162, _216);
    float _222 = rsqrt(_218);
    float _224 = rsqrt(_220);
    float _226 = _204 * _222;
    float _228 = _200 * _222;
    float _230 = _208 * _222;
    float _232 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _234 = _174 * _174;
    float _236 = _162 * _224;
    float _238 = _156 * _224;
    float _240 = _150 * _224;
    float _242 = 1.0 / _232;
    float _244 = _226 * _236;
    float _246 = _230 * _238;
    float _248 = fma(_168, _168, _234);
    float _250 = -_244;
    float _252 = fma(_230, _240, _250);
    float _254 = _228 * _240;
    float _256 = -_246;
    float _258 = fma(_228, _236, _256);
    float _260 = fma(_180, _180, _248);
    float _262 = _252 * _252;
    float _264 = -_254;
    float _266 = fma(_226, _238, _264);
    float _268 = fma(_258, _258, _262);
    float _270 = rsqrt(_260);
    float _272 = _182 * _242;
    float _274 = fma(_266, _266, _268);
    bool _276 = !_192;
    float _278 = _276 ? 1.0 : (-1.0);
    float _280 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _282 = _280 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    int _284 = _121 + 48;
    float _286 = rsqrt(_274);
    float _288 = abs(_146);
    float _290 = _288 * _278;
    float _292 = _290 * 0.5;
    float _294 = fma(_272, _282, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _296 = _294 * _292;
    float _298 = _168 * _270;
    float _300 = _174 * _270;
    float _302 = _180 * _270;
    float _304 = _292;
    float _306 = _266;
    float _308 = _258;
    float _310 = _270;
    float _312 = _294;
    if (_196)
    {
        _304 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _314 = _304;
    float _316 = _258 * _286;
    float _318 = _252 * _286;
    float _320 = _266 * _286;
    uint _322 = uint(int(uint(_284) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_322)];
    float _324 = as_type<float>(_dmw3.x);
    int _326 = _284 + 4;
    uint _328 = uint(int(uint(_326) >> uint(2)));
    float _330 = as_type<float>(_dmw3.y);
    int _332 = _284 + 8;
    uint _334 = uint(int(uint(_332) >> uint(2)));
    float _336 = as_type<float>(_dmw3.z);
    int _338 = _284 + 12;
    uint _340 = uint(int(uint(_338) >> uint(2)));
    float _342 = as_type<float>(_dmw3.w);
    bool _344 = !_188;
    float _346 = _320;
    float _348 = _316;
    float _350 = _318;
    float _352 = _314;
    float _354 = _342;
    float _356 = _330;
    float _358 = _336;
    if (!_344)
    {
        float _360 = _302 * _316;
        float _362 = _300 * _320;
        float _364 = _298 * _318;
        float _366 = -_360;
        float _368 = fma(_298, _320, _366);
        float _370 = -_362;
        float _372 = fma(_302, _318, _370);
        float _374 = -_364;
        float _376 = fma(_300, _316, _374);
        float _378 = _368 * _368;
        float _380 = fma(_372, _372, _378);
        float _382 = fma(_376, _376, _380);
        float _384 = rsqrt(_382);
        float _386 = _372 * _384;
        float _388 = _368 * _384;
        float _390 = _376 * _384;
        _346 = _390;
        _348 = _386;
        _306 = _384;
        _308 = _382;
        _350 = _388;
        _310 = _368;
        _312 = _372;
    }
    float _392 = _346;
    float _394 = _348;
    float _396 = _306;
    float _398 = _308;
    float _400 = _350;
    float _402 = _310;
    float _404 = _312;
    float _406 = -_296;
    float _408 = fma(_392, _406, _140);
    float _410 = -_296;
    float _412 = fma(_394, _410, _128);
    float _414 = _396;
    float _416 = _398;
    float _418 = _402;
    float _420 = _404;
    float _422 = _408;
    float _424 = _412;
    if (_196)
    {
        _414 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _426 = _414;
    float _428 = _426;
    if (_196)
    {
        float _430 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _432 = _314 + _430;
        _416 = _432;
    }
    float _434 = _416;
    float _436 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _438 = _408 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _442 = _412 + _440;
    if (_196)
    {
        _418 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _444 = _418;
    float _446 = _444;
    if (_196)
    {
        float _448 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _450 = _426 + _448;
        _428 = _450;
    }
    float _452 = _428;
    float _454 = _438 * _438;
    float _456 = _454;
    if (_196)
    {
        float _458 = _434 * _434;
        _420 = _458;
    }
    float _460 = _420;
    float _462 = -_296;
    float _464 = fma(_400, _462, _134);
    float _466 = _460;
    if (_196)
    {
        float _468 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _470 = _444 + _468;
        _352 = _470;
    }
    float _472 = _352;
    float _474 = fma(_442, _442, _454);
    if (_196)
    {
        float _476 = fma(_452, _452, _460);
        _466 = _476;
    }
    float _478 = _466;
    float _480 = _478;
    if (!_196)
    {
        _446 = 0.0;
        _456 = 0.0;
    }
    float _482 = _446;
    float _484 = _456;
    float _486 = sqrt(_474);
    float _488 = _484;
    float _490 = _482;
    if (_196)
    {
        float _492 = fma(_472, _472, _478);
        _354 = _492;
    }
    float _494 = _354;
    if (!_196)
    {
        _480 = 0.0;
    }
    float _496 = _480;
    float _498 = _494;
    float _500 = _496;
    if (_196)
    {
        float _502 = rsqrt(_494);
        _498 = _502;
    }
    float _504 = _498;
    bool _506 = _486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _508 = 0.0;
    if (_196)
    {
        float _510 = _504 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _508 = _510;
    }
    float _512 = _508;
    if (_196)
    {
        float _514 = _452 * _512;
        _488 = _514;
    }
    float _516 = _488;
    if (_196)
    {
        float _518 = _434 * _512;
        _490 = _518;
    }
    float _520 = _490;
    if (_196)
    {
        float _522 = _472 * _512;
        _500 = _522;
    }
    float _524 = _500;
    float _526 = 0.0;
    if (!_506)
    {
        _526 = _464;
    }
    float _528 = _526;
    bool _530 = !_506;
    float _532 = _528;
    if (!_530)
    {
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _536 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _538 = _486 + _536;
        float _540 = _464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = rsqrt(_474);
        float _544 = _538 * _534;
        float _546 = _544 * 0.15915493667125701904296875;
        float _548 = _546 * 6.283185482025146484375;
        float _550 = cos(_548);
        float _552 = _546 * 6.283185482025146484375;
        float _554 = sin(_552);
        float _556 = _550 + (-1.0);
        float _558 = fma(_554, _540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _560 = _556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _562 = _542 * _558;
        float _564 = fma(_464, _550, _560);
        float _566 = fma(_442, _562, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _568 = fma(_438, _562, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _532 = _564;
        _422 = _568;
        _424 = _566;
    }
    float _570 = _532;
    float _572 = _422;
    float _574 = _424;
    float _576 = _520 + _570;
    float _578 = _134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _580 = _524 + _572;
    float _582 = _134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _584 = _134 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _586 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[1].x, _578);
    float _588 = _134 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _590 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[0].x, _582);
    float _592 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[2].x, _584);
    float _594 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _586);
    float _596 = _516 + _574;
    float _598 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _590);
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _602 = _576 + _600;
    float _604 = _594 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _606 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[3].x, _588);
    float _608 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _592);
    float _610 = _598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _612 = _604 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _616 = _596 + _614;
    float _618 = _602 * _602;
    float _620 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _606);
    float _622 = _608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[7].x, _612);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _628 = _580 + _626;
    float _630 = fma(_616, _616, _618);
    float _632 = _620 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _634 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[7].z, _624);
    float _636 = _604 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _638 = fma(_628, _628, _630);
    float _640 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _634);
    float _642 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[6].x, _636);
    float _644 = rsqrt(_638);
    float _646 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _648 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[6].z, _642);
    float _650 = _646 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _652 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _648);
    float _654 = 1.0 / _640;
    float _656 = _652 + _640;
    float _658 = _644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _660 = _650 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _662 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _664 = _616 * _658;
    float _666 = _628 * _658;
    float _668 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _660);
    float _670 = floor(_662);
    float _672 = _656 * _654;
    float _674 = _672 * 0.5;
    float _676 = _664 * _664;
    float _678 = _666 * _666;
    float _680 = _650 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[30].w, _682);
    float _686 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _668);
    float _688 = _676 + _678;
    float _690 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _680);
    float _692 = _686 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _694 = 1.0 / _684;
    float _696 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _690);
    float _698 = _696 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _700 = -_670;
    float _702 = _662 + _700;
    float _704 = sqrt(_688);
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _708 = _694 * _706;
    float _710 = trunc(_698);
    int _712 = int(_710);
    bool _714 = _708 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _716 = _708 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _718 = _704 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _720 = trunc(_692);
    int _722 = int(_720);
    bool _724 = !_714;
    int _726 = _724 ? 0 : 1;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _730 = _704 + _728;
    int _732 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _734 = _712 + _732;
    int _736 = _734 + 1;
    int _738 = 2;
    float _740 = _688;
    float _742 = _730;
    float _744 = (*spvDescriptorSet0.vp_c12)._m0[5].z;
    int _746 = _736;
    float _748 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    float _750 = (*spvDescriptorSet0.vp_c12)._m0[5].x;
    int _752 = as_type<int>(_664);
    int _754 = as_type<int>(_670);
    float _756 = _698;
    float _758 = _616;
    if (!_714)
    {
        _738 = 1;
    }
    int _760 = _738;
    int _762 = _760;
    if (!_716)
    {
        _762 = _726;
    }
    int _764 = _762;
    float _766 = _140;
    if (_718)
    {
        float _768 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _766 = _768;
    }
    float _770 = _766;
    int _772 = _764 << 6;
    bool _774 = _736 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _778 = _772 + 96;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    uint _782 = uint(int(uint(int(_780)) >> uint(2)));
    int _784 = int(_780) & 3;
    float _786 = (*spvDescriptorSet0.vp_c15)._m0[int(_782)][_784];
    int _788 = int(_780) + 1;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    int _792 = _788 & 3;
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[int(_790)][_792];
    if (_718)
    {
        float _796 = rsqrt(_688);
        _740 = _796;
    }
    float _798 = _740;
    float _800 = precise::max(0.0, _776);
    int _802 = _772 + 48;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    uint _806 = uint(int(uint(int(_804)) >> uint(2)));
    int _808 = int(_804) & 3;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[int(_806)][_808];
    int _812 = int(_804) + 1;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    int _816 = _812 & 3;
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[int(_814)][_816];
    float _820 = _798;
    if (_718)
    {
        float _822 = _730 * _770;
        _742 = _822;
    }
    float _824 = _742;
    int _826 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _828 = _722 + _826;
    int _830 = _828 + 1;
    float _832 = -_658;
    float _834 = -_800;
    float _836 = fma(_602, _832, _834);
    float _838 = 0.0;
    if (_718)
    {
        float _840 = _824 * 0.15915493667125701904296875;
        _838 = _840;
    }
    float _842 = _838;
    int _844 = _736 | _830;
    int _846 = _772 + 104;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c15)._m0[int(_858)][_860];
    float _864 = 0.0;
    float _866 = as_type<float>(_844);
    if (_718)
    {
        float _868 = _842 * 6.283185482025146484375;
        float _870 = sin(_868);
        _864 = _870;
    }
    float _872 = _864;
    bool _874 = _844 < 0;
    bool _876 = _874 || _774;
    if (_718)
    {
        float _878 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _866 = _878;
    }
    float _880 = _866;
    bool _882 = _830 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _884 = _882 || _876;
    int _886 = _772 + 64;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    uint _890 = uint(int(uint(int(_888)) >> uint(2)));
    int _892 = int(_888) & 3;
    float _894 = (*spvDescriptorSet0.vp_c15)._m0[int(_890)][_892];
    int _896 = int(_888) + 1;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    int _900 = _896 & 3;
    float _902 = (*spvDescriptorSet0.vp_c15)._m0[int(_898)][_900];
    float _904 = 0.0;
    float _906 = _880;
    if (_718)
    {
        float _908 = _842 * 6.283185482025146484375;
        float _910 = cos(_908);
        _904 = _910;
    }
    float _912 = _904;
    int _914 = _772 + 56;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    float _932 = _872;
    if (_718)
    {
        float _934 = fma(_872, _880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _932 = _934;
    }
    float _936 = _932;
    float _938 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_718)
    {
        _744 = _664;
    }
    float _940 = _744;
    float _942 = _940;
    if (!_884)
    {
        int _944 = _830 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _946 = _944 + _736;
        _746 = _946;
    }
    int _948 = _746;
    float _950 = 0.0;
    if (_718)
    {
        float _952 = _798 * _936;
        _950 = _952;
    }
    float _954 = _950;
    if (!_718)
    {
        _748 = _836;
    }
    float _956 = _748;
    float _958 = floor(_938);
    int _960 = _772 + 72;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    uint _964 = uint(int(uint(int(_962)) >> uint(2)));
    int _966 = int(_962) & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    int _970 = int(_962) + 1;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    int _974 = _970 & 3;
    float _976 = (*spvDescriptorSet0.vp_c15)._m0[int(_972)][_974];
    float _978 = _956;
    float _980 = _912;
    if (_718)
    {
        float _982 = _912 + (-1.0);
        _750 = _982;
    }
    float _984 = _750;
    float _986 = _984;
    if (_718)
    {
        float _988 = _664 * _954;
        _942 = _988;
    }
    float _990 = _942;
    if (!_718)
    {
        _820 = _678;
    }
    float _992 = _820;
    float _994 = _992;
    if (_718)
    {
        float _996 = _984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _996;
    }
    float _998 = _906;
    if (!_718)
    {
        _986 = _666;
    }
    float _1000 = _986;
    float _1002 = _1000;
    if (_718)
    {
        float _1004 = _666 * _954;
        _1002 = _1004;
    }
    float _1006 = _1002;
    float _1008 = _650 * _794;
    if (_718)
    {
        float _1010 = fma(_836, _912, _998);
        _978 = _1010;
    }
    float _1012 = _978;
    if (!_718)
    {
        _980 = _676;
    }
    float _1014 = _980;
    float _1016 = _1014;
    if (_718)
    {
        float _1018 = _990 * _990;
        _1016 = _1018;
    }
    float _1020 = _1016;
    if (_718)
    {
        float _1022 = _1006 * _1006;
        _994 = _1022;
    }
    float _1024 = _994;
    int _1026 = _772 + 80;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    if (!_884)
    {
        int _1044 = _948 << 2;
        _752 = _1044;
    }
    int _1046 = _752;
    float _1048 = fma(_1012, _1012, _1020);
    float _1050 = _650 * _818;
    float _1052 = sqrt(_638);
    int _1054 = _1046;
    if (!_884)
    {
        uint _1056 = uint(int(uint(_948) >> uint(2)));
        _754 = int(_1056);
    }
    int _1058 = _754;
    float _1060 = _1048 + _1024;
    float _1062 = fma(_786, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1008);
    float _1064 = fma(_810, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1050);
    float _1066 = as_type<float>(_1058);
    if (!_884)
    {
        int _1068 = 12 & _1046;
        _1054 = _1068;
    }
    int _1070 = _1054;
    float _1072 = fma(_854, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1062);
    float _1074 = rsqrt(_1060);
    if (!_884)
    {
        int _1076 = _1058 << 4;
        int _1078 = _1076 + _1070;
        _1066 = as_type<float>(_1078);
    }
    float _1080 = _1066;
    float _1082 = _1072 + _862;
    int _1084 = _772 + 88;
    uint _1086 = uint(int(uint(_1084) >> uint(2)));
    uint _1088 = uint(int(uint(int(_1086)) >> uint(2)));
    int _1090 = int(_1086) & 3;
    float _1092 = (*spvDescriptorSet0.vp_c15)._m0[int(_1088)][_1090];
    int _1094 = int(_1086) + 1;
    uint _1096 = uint(int(uint(_1094) >> uint(2)));
    int _1098 = _1094 & 3;
    float _1100 = (*spvDescriptorSet0.vp_c15)._m0[int(_1096)][_1098];
    float _1102 = _650 * _902;
    float _1104 = 1.0 / _1082;
    float _1106 = fma(_894, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1102);
    float _1108 = _1080;
    if (!_884)
    {
        int _1110 = as_type<int>(_1080) + 400;
        uint _1112 = uint(int(uint(_1110) >> uint(2)));
        uint _1114 = uint(int(uint(int(_1112)) >> uint(2)));
        int _1116 = int(_1112) & 3;
        float _1118 = (*spvDescriptorSet0.vp_c15)._m0[int(_1114)][_1116];
        _1108 = _1118;
    }
    float _1120 = _1108;
    float _1122 = -_958;
    float _1124 = _938 + _1122;
    float _1126 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1064);
    float _1128 = _576 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1130 = _1074 * _990;
    float _1132 = _1126 + _930;
    float _1134 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1128);
    float _1136 = _576 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1138 = _1130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1140 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1106);
    float _1142 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1134);
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1146 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1144);
    float _1148 = precise::clamp(_1146, 0.0, 1.0);
    float _1150 = _1132 * _1104;
    float _1152 = _1140 + _976;
    float _1154 = _576 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1156 = -_1148;
    float _1158 = _1156 + 1.0;
    float _1160 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1162 = _1074 * _1012;
    float _1164 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1154);
    float _1166 = _1074 * _1006;
    float _1168 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1170 = abs(_1158);
    float _1172 = log2(_1170);
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1176 = _1152 * _1104;
    bool _1178 = _1150 >= 0.0;
    float _1180 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1136);
    float _1182 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1164);
    float _1184 = -_1174;
    float _1186 = fma(_1184, _1168, 1.0);
    float _1188 = _576 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1190 = _1150 <= 1.0;
    bool _1192 = _1190 && _1178;
    float _1194 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1180);
    float _1196 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1198 = _638;
    float _1200 = _958;
    if (!_884)
    {
        float _1202 = floor(_692);
        _1198 = _1202;
    }
    float _1204 = _1198;
    float _1206 = -_1138;
    float _1208 = fma(_1162, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1206);
    float _1210 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1188);
    float _1212 = _650 * _1042;
    float _1214 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1216 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1218 = _1176 >= 0.0;
    bool _1220 = _1218 && _1192;
    float _1222 = -_1166;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1208);
    float _1226 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1210);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1216);
    bool _1230 = _1176 <= 1.0;
    bool _1232 = _1230 && _1220;
    float _1234 = fma(_1034, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1212);
    float _1236 = fma(_1224, -0.5, 0.5);
    float _1238 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1240 = fma(_1224, 0.5, 0.5);
    float _1242 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1244 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1228);
    float _1246 = exp2(_1238);
    float _1248 = fma(_1240, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1250 = fma(_1092, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1234);
    float _1252 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1244);
    float _1254 = _1238;
    float _1256 = _1252;
    if (_1232)
    {
        float _1258 = float(_764);
        _1200 = _1258;
    }
    float _1260 = _1200;
    float _1262 = _1250 + _1100;
    float _1264 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1266 = sqrt(_1236);
    if (!_884)
    {
        float _1268 = -_1204;
        float _1270 = _692 + _1268;
        _1254 = _1270;
    }
    float _1272 = _1254;
    float _1274 = fma(_1240, _1248, -0.212114393711090087890625);
    float _1276 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1278 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1264);
    float _1280 = _1262 * _1104;
    float _1282 = fma(_1240, _1274, 1.570728778839111328125);
    float _1284 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1276);
    float _1286 = log2(_1186);
    float _1288 = _1162 + 1.0;
    float _1290 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1278);
    float _1292 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1284);
    float _1294 = -_1162;
    float _1296 = fma(_1246, _1288, _1294);
    float _1298 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1292);
    float _1300 = 1.0 / _1252;
    float _1302 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1304 = _1266 * 0.636619746685028076171875;
    float _1306 = _936;
    float _1308 = _1302;
    if (!_884)
    {
        float _1310 = floor(_698);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = _1286 * 0.693147182464599609375;
    float _1316 = -_1282;
    float _1318 = fma(_1304, _1316, 1.0);
    float _1320 = fma(_1296, 0.5, 0.5);
    float _1322 = _1120;
    if (!_884)
    {
        float _1324 = rint(_1120);
        float _1326 = precise::max(_1324, 0.0);
        uint _1328 = uint(_1326);
        uint _1330 = clamp(_1328, 0u, 65535u);
        _1322 = as_type<float>(_1330);
    }
    float _1332 = _1322;
    float _1334 = _1298 * _1300;
    float _1336 = _1302 * _1300;
    float _1338 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _5319 = float2(_702, _1124);
    float _1340 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5319, float2(0.0), isnan(_5319)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5319, float2(0.0), isnan(_5319)), level(0.0)).x;
    float _1342 = fma(_1334, 0.5, 0.5);
    float _1344 = fma(_1336, -0.5, 0.5);
    float _1346 = _1260;
    if (_1232)
    {
        float _1348 = rint(_1260);
        float _1350 = precise::max(_1348, 0.0);
        uint _1352 = uint(_1350);
        uint _1354 = clamp(_1352, 0u, 65535u);
        _1346 = as_type<float>(_1354);
    }
    float _1356 = _1346;
    if (!_884)
    {
        float _1358 = -_1312;
        float _1360 = _698 + _1358;
        _756 = _1360;
    }
    float _1362 = _756;
    float _1364 = _1272;
    if (!_884)
    {
        float3 _5366 = float3(_1362, _1272, float(as_type<int>(_1332)));
        float3 _5370 = select(_5366, float3(0.0), isnan(_5366));
        float _1366 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5370.xy, uint(rint(_5370.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5370.xy, uint(rint(_5370.z)), level(0.0)).x;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1176;
    float _1372 = _1356;
    if (_1232)
    {
        float3 _5386 = float3(_1150, _1176, float(as_type<int>(_1356)));
        float3 _5388 = select(_5386, float3(0.0), isnan(_5386));
        float _1374 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5388.xy, uint(rint(_5388.z)), _1280, level(0.0));
        _1370 = _1374;
    }
    float _1376 = _1370;
    float3 _5398 = float3(_1342, _1344, _1338);
    float _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float3 _5407 = float3(_1342, _1344, _1338);
    float4 _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5407, float3(0.0), isnan(_5407)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5407, float3(0.0), isnan(_5407)), level(0.0)).xyzw;
    float _1383 = _1381.x;
    float _1385 = _1381.y;
    float _1387 = _1381.z;
    float _1389 = _1381.w;
    float2 _5423 = float2(_1318, _1320);
    float3 _1393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5423, float2(0.0), isnan(_5423)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5423, float2(0.0), isnan(_5423)), level(0.0)).xyz;
    float _1395 = _1393.x;
    float _1397 = _1393.y;
    float _1399 = _1393.z;
    bool _1401 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1403 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1407 = _1405 != 0;
    float _1409 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1411 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1403);
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    bool _1417 = !_192;
    float _1419 = _1417 ? 0.0 : 1.0;
    float _1421 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1411);
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1425 = _1423 != 0;
    float _1427 = _1150;
    float _1429 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1431 = _1407;
    bool _1433 = _1425;
    bool _1435 = _1401;
    if (_1401)
    {
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1427 = _1437;
    }
    float _1439 = _1427;
    if (_1401)
    {
        _1372 = (*spvDescriptorSet0.vp_c9)._m0[14].x;
    }
    float _1441 = _1372;
    float _1443 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1421);
    bool _1445 = false;
    float _1447 = _1441;
    if (_1407)
    {
        bool _1449 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _1445 = _1449;
    }
    bool _1451 = _1445;
    if (_1401)
    {
        _1429 = (*spvDescriptorSet0.vp_c9)._m0[15].x;
    }
    float _1453 = _1429;
    float _1455 = 0.0;
    float _1457 = _1453;
    if (!_1407)
    {
        _1455 = _1419;
    }
    float _1459 = _1455;
    float _1461 = _1459;
    if (_1407)
    {
        float _1463 = -_1419;
        float _1465 = _1451 ? _1463 : _1419;
        _1461 = _1465;
    }
    float _1467 = _1461;
    if (_1401)
    {
        float _1469 = _1453 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1457 = _1469;
    }
    float _1471 = _1457;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1475 = _1473 != 0;
    float _1477 = _1471;
    if (_1415)
    {
        bool _1479 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1431 = _1479;
    }
    bool _1481 = _1431;
    bool _1483 = _1481;
    if (_1401)
    {
        float _1485 = fma(_1471, _1441, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1447 = _1485;
    }
    float _1487 = _1447;
    float _1489 = 0.0;
    float _1491 = _1487;
    if (!_1415)
    {
        _1489 = _1419;
    }
    float _1493 = _1489;
    float _1495 = _1493;
    if (_1401)
    {
        float _1497 = _1487 * _1439;
        _1491 = _1497;
    }
    float _1499 = _1491;
    if (_1415)
    {
        float _1501 = -_1419;
        float _1503 = _1481 ? _1501 : _1419;
        _1495 = _1503;
    }
    float _1505 = _1495;
    if (_1425)
    {
        bool _1507 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1483 = _1507;
    }
    bool _1509 = _1483;
    float _1511 = _1439;
    if (_1401)
    {
        float _1513 = floor(_1499);
        _1511 = _1513;
    }
    float _1515 = _1511;
    if (!_1425)
    {
        _1477 = _1419;
    }
    float _1517 = _1477;
    float _1519 = 0.0;
    float _1521 = _1517;
    if (!_1475)
    {
        float _1523 = -_324;
        float _1525 = (-0.0) + _1523;
        _1519 = _1525;
    }
    float _1527 = _1519;
    float _1529 = _1527;
    if (_1425)
    {
        float _1531 = -_1419;
        float _1533 = _1509 ? _1531 : _1419;
        _1521 = _1533;
    }
    float _1535 = _1521;
    float _1537 = _1505 + (-0.5);
    if (_1475)
    {
        bool _1539 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1433 = _1539;
    }
    bool _1541 = _1433;
    bool _1543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1545 = _1342;
    bool _1547 = _1543;
    if (!_1401)
    {
        float _1549 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _1545 = _1549;
    }
    float _1551 = _1545;
    if (_1475)
    {
        float _1553 = -_324;
        float _1555 = _1541 ? _324 : _1553;
        _1529 = _1555;
    }
    float _1557 = _1529;
    float _1559 = _1535 + (-0.5);
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1563 = _1561 != 0;
    float _1565 = _1557 + 0.5;
    float _1567 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1569 = 0.0;
    if (_1401)
    {
        float _1571 = -_1515;
        float _1573 = _1499 + _1571;
        _1569 = _1573;
    }
    float _1575 = _1569;
    out.m_68.w = _1567;
    float _1577 = _1344;
    float _1579 = _1575;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (_1543)
    {
        float _1583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1577 = _1583;
    }
    float _1585 = _1577;
    if (!_1401)
    {
        float _1587 = _1551 * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1579 = _1587;
    }
    float _1589 = _1579;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1593 = _1591 != 0;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1601 = _1599 != 0;
    float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1605 = _1603 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1607 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1609 = 1.0 / _1605;
    float _1611 = _1605;
    float _1613 = _1609;
    if (_1563)
    {
        bool _1615 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1435 = _1615;
    }
    bool _1617 = _1435;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1625 = _1623 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1627 = 1.0 / _1597;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (_1543)
    {
        _1611 = (*spvDescriptorSet0.vp_c9)._m0[15].y;
    }
    float _1631 = _1611;
    out.m_70.w = _1607;
    float _1633 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1619);
    float _1635 = _1631;
    if (_1543)
    {
        _1581 = (*spvDescriptorSet0.vp_c9)._m0[14].y;
    }
    float _1637 = _1581;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_1543)
    {
        float _1641 = _1631 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1635 = _1641;
    }
    float _1643 = _1635;
    float _1645 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1621);
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1655 = _1643;
    if (_1543)
    {
        float _1657 = fma(_1643, _1637, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1655 = _1657;
    }
    float _1659 = _1655;
    float _1661 = -_1639;
    float _1663 = fma(_1647, 2.0, _1661);
    float _1665 = 1.0 / _1625;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1673 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1649);
    if (_1543)
    {
        float _1675 = _1659 * _1585;
        _1629 = _1675;
    }
    float _1677 = _1629;
    float _1679 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1671);
    float _1681 = 1.0 / _1653;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1687 = _1589 + _1685;
    float _1689 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1683);
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1693 = 1.0 / _1669;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1701 = _1589 + _1699;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1705 = _1703 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1707 = fma(_1695, -2.0, _1691);
    float _1709 = _1637;
    float _1711 = _1677;
    float _1713 = _1681;
    if (_1543)
    {
        float _1715 = floor(_1677);
        _1709 = _1715;
    }
    float _1717 = _1709;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1725 = _1589 + _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1729 = _1589 + _1727;
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1731;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[88].w);
    if (!_1543)
    {
        float _1737 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _1735 = as_type<int>(_1737);
    }
    int _1739 = _1735;
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1745 = _1733 * _1627;
    float _1747 = _1743 * _1665;
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1751 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1755 = _1753 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1757 = 1.0 / _1705;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[84].z;
    if (_1543)
    {
        float _1761 = -_1717;
        float _1763 = _1677 + _1761;
        _1711 = _1763;
    }
    float _1765 = _1711;
    float _1767 = _1751 * _1681;
    float _1769 = _1755 * _1609;
    float _1771 = _1765;
    if (!_1593)
    {
        _1613 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1773 = _1613;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1775;
    float _1779 = _1773;
    if (_1593)
    {
        _1779 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1781 = _1779;
    float _1783 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1785 = 1.0 / _1721;
    int _1787 = _1739;
    float _1789 = _1783;
    if (!_1543)
    {
        float _1791 = as_type<float>(_1739) * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1771 = _1791;
    }
    float _1793 = _1771;
    if (_1601)
    {
        _1713 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1795 = _1713;
    float _1797 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1783);
    float _1799 = _1795;
    if (_1593)
    {
        _1787 = 0;
    }
    int _1801 = _1787;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1805 = _1793 + _1803;
    int _1807 = _1801;
    if (!_1593)
    {
        _1807 = 2;
    }
    int _1809 = _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1817 = _1815 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    if (_1601)
    {
        bool _1819 = _1795 > 0.5;
        _1547 = _1819;
    }
    bool _1821 = _1547;
    if (!_1593)
    {
        _1759 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1823 = _1759;
    float _1825 = _1817 * _1757;
    float _1827 = _1757;
    float _1829 = _1823;
    if (!_1593)
    {
        _1799 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1831 = _1799;
    float _1833 = _1813 * _1693;
    float _1835 = _1831;
    if (!_1593)
    {
        _1789 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1837 = _1789;
    float _1839 = _1777 * _1785;
    float _1841 = _1837;
    if (!_1593)
    {
        _1827 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1843 = _1827;
    float _1845 = _1843;
    if (_1593)
    {
        _1829 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1847 = _1829;
    if (_1593)
    {
        _1835 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1849 = _1835;
    if (_1593)
    {
        _1841 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1851 = _1841;
    if (_1593)
    {
        _1845 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1853 = _1845;
    float _1855 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1697);
    float _1857 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1859 = _1809 != 2;
    float _1861 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1865;
    float _1869 = fma(_1853, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1863);
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1873 = 1.0 / _1867;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1879 = 0.0;
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[89].z;
    float _1883 = _1861;
    if (_1859)
    {
        _1879 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1885 = _1879;
    float _1887 = -_1871;
    float _1889 = fma(_1857, 2.0, _1887);
    float _1891 = _1885;
    if (!_1859)
    {
        _1891 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1893 = _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1895;
    float _1899 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1797);
    float _1901 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1869);
    float _1903 = 1.0 / _1877;
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (!_1601)
    {
        float _1909 = -_330;
        float _1911 = (-0.0) + _1909;
        _1881 = _1911;
    }
    float _1913 = _1881;
    float _1915 = _1913;
    if (_1601)
    {
        float _1917 = -_330;
        float _1919 = _1821 ? _330 : _1917;
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = fma(_1861, -2.0, _1905);
    if (_1859)
    {
        _356 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1925 = _356;
    float _1927 = _1925;
    if (!_1563)
    {
        float _1929 = -_336;
        float _1931 = (-0.0) + _1929;
        _1883 = _1931;
    }
    float _1933 = _1883;
    float _1935 = _1933;
    if (!_1859)
    {
        _1927 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1937 = _1927;
    float _1939 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1907);
    if (_1563)
    {
        float _1941 = -_336;
        float _1943 = _1617 ? _336 : _1941;
        _1935 = _1943;
    }
    float _1945 = _1935;
    float _1947 = 1.0 / _1897;
    if (_1859)
    {
        _358 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1949 = _358;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1955 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1957 = _1949;
    if (!_1859)
    {
        _1957 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1959 = _1957;
    float _1961 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1889);
    float _1963 = 1.0 / _1953;
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1965;
    float _1969 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1923);
    float _1971 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1971;
    float _1975 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1663);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1979 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1633);
    float _1981 = 1.0 / _1967;
    float _1983 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1993 = _1589 + _1991;
    float _1995 = -_1977;
    float _1997 = fma(_1983, 2.0, _1995);
    float _1999 = _1725 * _1947;
    float _2001 = fma(_1955, -2.0, _1989);
    float _2003 = 1.0 / _1987;
    float _2005 = _1993 * _1873;
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2009 = _1793 + _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2013 = _1589 + _2011;
    float _2015 = _1701 * _1963;
    float _2017 = fma(_1747, _2009, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2019 = _2013 * _1903;
    float _2021 = 1.0 / _1973;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2025 = _1793 + _2023;
    float _2027 = _1687 * _1981;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2031 = _1793 + _2029;
    float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2035 = _1793 + _2033;
    float _2037 = fma(_1745, _2025, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2039 = fma(_1769, _1805, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2043 = _1589 + _2041;
    float _2045 = fma(_1767, _2031, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2047 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2049 = _1793 + _2047;
    float _2051 = fma(_1825, _2035, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2053 = _1729 * _2003;
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2055;
    float _2059 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1645);
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2065 = _2043 * _2021;
    float _2067 = fma(_1833, _2049, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2069 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2001);
    float _2071 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1855);
    float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2073;
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2081 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1707);
    float _2083 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1679);
    float _2085 = fma(_2075, _2005, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2087 = fma(_2057, _2005, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2089 = fma(_2079, _2019, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2091 = fma(_2063, _2019, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2093 = _2059 * (-0.15915493667125701904296875);
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2099;
    float _2103 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1673);
    float _2105 = _2093 * 6.283185482025146484375;
    float _2107 = sin(_2105);
    float _2109 = fma(_2097, _1999, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2111 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1689);
    float _2113 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1939);
    float _2115 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1997);
    float _2117 = fma(_2101, _1999, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2123 = _2093 * 6.283185482025146484375;
    float _2125 = cos(_2123);
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2131 = fma(_2121, _2015, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2133;
    float _2137 = fma(_2129, _2015, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2141 = _2139 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2145 = _2143 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2147 = fma(_2141, _2053, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2149 = _1899 * (-0.15915493667125701904296875);
    float _2151 = fma(_2145, _2053, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _2153 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2153;
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2159 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2157;
    float _2161 = _1467 + (-0.5);
    float _2163 = _1565 * _2107;
    float _2165 = _1565 * _2125;
    float _2167 = fma(_2155, _2065, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2169 = fma(_2159, _2065, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    bool _2171 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2173 = isnan(_1589);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2179 = _2175 || _2177;
    float _2181 = float(_2179);
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2183;
    bool _2187 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2189 = isnan(_1793);
    bool _2191 = _2187 || _2189;
    bool _2193 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2195 = _2191 || _2193;
    float _2197 = float(_2195);
    float _2199 = -_2163;
    float _2201 = fma(_2161, _2125, _2199);
    bool _2203 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2205 = isnan(_1589);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = fma(_2161, _2107, _2165);
    bool _2217 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2219 = isnan(_1793);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2225 = _2221 || _2223;
    float _2227 = float(_2225);
    float _2229 = -_2181;
    float _2231 = _2229 + 1.0;
    bool _2233 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2235 = isnan(_1589);
    bool _2237 = _2233 || _2235;
    bool _2239 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2241 = _2237 || _2239;
    float _2243 = float(_2241);
    float _2245 = -_2197;
    float _2247 = _2245 + 1.0;
    float _2249 = -_2213;
    float _2251 = _2249 + 1.0;
    bool _2253 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2255 = isnan(_1793);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2261 = _2257 || _2259;
    float _2263 = float(_2261);
    float _2265 = -_2227;
    float _2267 = _2265 + 1.0;
    bool _2269 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2271 = isnan(_1589);
    bool _2273 = _2269 || _2271;
    bool _2275 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2277 = _2273 || _2275;
    float _2279 = float(_2277);
    float _2281 = _2149 * 6.283185482025146484375;
    float _2283 = sin(_2281);
    bool _2285 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2287 = isnan(_1589);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2299 = _1793 + _2297;
    bool _2301 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2303 = isnan(_1589);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = _2113 * (-0.15915493667125701904296875);
    bool _2315 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2317 = isnan(_1589);
    bool _2319 = _2315 || _2317;
    bool _2321 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2323 = _2319 || _2321;
    float _2325 = float(_2323);
    float _2327 = fma(_1839, _2299, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2329 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2331 = isnan(_1589);
    bool _2333 = _2329 || _2331;
    bool _2335 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2337 = _2333 || _2335;
    float _2339 = float(_2337);
    float _2341 = _2213 * _2231;
    float _2343 = _2227 * _2247;
    float _2345 = _2243 * _2251;
    float _2347 = -_2243;
    float _2349 = _2347 + 1.0;
    float _2351 = _2263 * _2267;
    float _2353 = -_2263;
    float _2355 = _2353 + 1.0;
    bool _2357 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2359 = isnan(_1793);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2365 = _2361 || _2363;
    float _2367 = float(_2365);
    float _2369 = _2149 * 6.283185482025146484375;
    float _2371 = cos(_2369);
    bool _2373 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2375 = isnan(_1793);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2381 = _2377 || _2379;
    float _2383 = float(_2381);
    float _2385 = _2339 * _2349;
    bool _2387 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2389 = isnan(_1793);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2395 = _2391 || _2393;
    float _2397 = float(_2395);
    float _2399 = -_2325;
    float _2401 = _2399 + 1.0;
    bool _2403 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2405 = isnan(_1793);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2411 = _2407 || _2409;
    float _2413 = float(_2411);
    float _2415 = -_2367;
    float _2417 = _2415 + 1.0;
    float _2419 = -_2339;
    float _2421 = _2419 + 1.0;
    float _2423 = _2311 * _2401;
    bool _2425 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2427 = isnan(_1793);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2433 = _2429 || _2431;
    float _2435 = float(_2433);
    float _2437 = _2383 * _2355;
    float _2439 = -_2383;
    float _2441 = _2439 + 1.0;
    float _2443 = -_2311;
    float _2445 = _2443 + 1.0;
    float _2447 = _2397 * _2417;
    float _2449 = _2325 * _2421;
    float _2451 = -_2397;
    float _2453 = _2451 + 1.0;
    float _2455 = _2367 * _2441;
    float _2457 = _1921 + 0.5;
    float _2459 = _2313 * 6.283185482025146484375;
    float _2461 = sin(_2459);
    float _2463 = _2295 * _2445;
    float _2465 = -_2295;
    float _2467 = _2465 + 1.0;
    float _2469 = _2435 * _2453;
    float _2471 = -_2435;
    float _2473 = _2471 + 1.0;
    float _2475 = _2457 * _2283;
    float _2477 = _2457 * _2371;
    float _2479 = _2279 * _2467;
    float _2481 = _2313 * 6.283185482025146484375;
    float _2483 = cos(_2481);
    float _2485 = _2413 * _2473;
    float _2487 = -_2279;
    float _2489 = _2487 + 1.0;
    float _2491 = _2085 * _2479;
    float _2493 = _2087 * _2479;
    float _2495 = _2037 * _2485;
    float _2497 = _1945 + 0.5;
    float _2499 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2491);
    float _2501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2503 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2493);
    float _2505 = _2497 * _2461;
    float _2507 = fma(_2089, _2463, _2499);
    float _2509 = fma(_2135, _2027, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2511 = fma(_2091, _2463, _2503);
    float _2513 = _2215 + (-0.5);
    float _2515 = fma(_2185, _2027, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2519 = _2497 * _2483;
    float _2521 = -_2505;
    float _2523 = fma(_1559, _2483, _2521);
    float _2525 = -_2413;
    float _2527 = _2525 + 1.0;
    float _2529 = -_2475;
    float _2531 = fma(_1537, _2371, _2529);
    float _2533 = fma(_1559, _2461, _2519);
    float _2535 = _2201 + 0.5;
    float _2537 = fma(_2527, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2495);
    float _2539 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2543 = fma(_1537, _2283, _2477);
    float _2545 = fma(_2017, _2469, _2537);
    float _2547 = fma(_2539, _2535, _1975);
    float _2549 = fma(_2109, _2423, _2507);
    float _2551 = fma(_2117, _2423, _2511);
    float _2553 = fma(_2045, _2447, _2545);
    float _2555 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2559 = _2531 + 0.5;
    float _2561 = fma(_2131, _2449, _2549);
    float _2563 = -_2555;
    float _2565 = -_2081;
    float _2567 = fma(_2563, _2513, _2565);
    float _2569 = _2533 + (-0.5);
    float _2571 = fma(_2137, _2449, _2551);
    float _2573 = fma(_2039, _2455, _2553);
    float _2575 = -_2083;
    float _2577 = _2575 + 1.0;
    float _2579 = abs(_708);
    float _2581 = log2(_2579);
    float _2583 = _2541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2585 = _2543 + (-0.5);
    float _2587 = -_2071;
    float _2589 = _2587 + 1.0;
    float _2591 = -_1901;
    float _2593 = _2591 + 1.0;
    float _2595 = fma(_2509, _2385, _2561);
    float _2597 = -_2583;
    float _2599 = -_1969;
    float _2601 = fma(_2597, _2585, _2599);
    float _2603 = fma(_2515, _2385, _2571);
    float _2605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2607 = _2557 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2609 = fma(_2067, _2437, _2573);
    float _2611 = fma(_2215, _2577, _2567);
    float _2613 = fma(_2543, _2593, _2601);
    float _2615 = -_2607;
    float _2617 = -_2069;
    float _2619 = fma(_2615, _2569, _2617);
    float _2621 = -_1979;
    float _2623 = _2621 + 1.0;
    float _2625 = fma(_2147, _2345, _2595);
    float _2627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2629 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2631 = -_2623;
    float _2633 = fma(_2201, _2631, _2547);
    float _2635 = _2523 + 0.5;
    float _2637 = fma(_2151, _2345, _2603);
    float _2639 = fma(_2051, _2351, _2609);
    float _2641 = fma(_2167, _2341, _2625);
    float _2643 = exp2(_2629);
    float _2645 = _2605 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2647 = -_2111;
    float _2649 = _2647 + 1.0;
    float _2651 = -_2103;
    float _2653 = _2651 + 1.0;
    float _2655 = fma(_2169, _2341, _2637);
    float _2657 = fma(_2645, _2559, _1961);
    float _2659 = fma(_2327, _2343, _2639);
    float _2661 = fma(_2533, _2649, _2619);
    float _2663 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2665 = -_2589;
    float _2667 = fma(_2531, _2665, _2657);
    float _2669 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2641);
    float _2671 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2655);
    float _2673 = fma(_2663, _2635, _2115);
    float _2675 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2659);
    out.m_72.x = _2633;
    out.m_72.y = _2611;
    out.m_72.z = _2667;
    out.m_72.w = _2613;
    float _2677 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2679 = precise::clamp(_2677, 0.0, 1.0);
    float _2681 = -_2653;
    float _2683 = fma(_2523, _2681, _2673);
    out.m_74.x = _2669;
    out.m_74.y = _2671;
    out.m_76.x = _2683;
    out.m_76.y = _2661;
    out.m_78.x = _2675;
    float _2685 = fma(_2679, -2.0, 3.0);
    float _2687 = _2679 * _2679;
    bool _2689 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2691 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan(0.5);
    bool _2697 = _2693 || _2695;
    bool _2699 = _708 <= 8000.0;
    bool _2701 = isnan(_708);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(8000.0);
    bool _2707 = _2703 || _2705;
    float _2709 = float(_2707);
    float _2711 = _2687 * _2685;
    float _2713 = -_2711;
    float _2715 = _2713 + 1.0;
    float _2717 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _2721 = fma(_2715, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2711);
    float _2723 = fma(_272, _2719, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _2725 = _2709 * _2721;
    float _2727 = _1443 + _1252;
    float _2729 = _2727 * 0.5;
    float _2731 = _2727;
    float _2733 = _1298;
    if (_2697)
    {
        _2731 = 1.0;
    }
    float _2735 = _2731;
    float _2737 = _2735;
    if (!_2697)
    {
        float _2739 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2741 = _2739 * 0.15915493667125701904296875;
        float _2743 = _2741 * 6.283185482025146484375;
        float _2745 = cos(_2743);
        float _2747 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2749 = _2747 * 0.15915493667125701904296875;
        float _2751 = _2741 * 6.283185482025146484375;
        float _2753 = sin(_2751);
        float _2755 = 1.0 / _2745;
        float _2757 = _2749 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2753 * _2755;
        float _2763 = _2749 * 6.283185482025146484375;
        float _2765 = sin(_2763);
        float _2767 = _2759 * _2761;
        float _2769 = 1.0 / _2767;
        float _2771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2771;
        float _2775 = 1.0 / _2773;
        float _2777 = _2765 * _2769;
        float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2781 = fma(_708, _2777, _2779);
        float _2783 = _2781 * _2775;
        float _2785 = precise::clamp(_2783, 0.0, 1.0);
        _2737 = _2785;
    }
    float _2787 = _2737;
    float _2789 = exp2(_1409);
    out.m_80.z = _2729;
    out.m_80.w = _1252;
    float _2791 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2793 = -_1340;
    float _2795 = _2793 + 1.0;
    float _2797 = _302 * _400;
    float _2799 = _298 * _392;
    float _2801 = _300 * _394;
    float _2803 = _2795 * _2791;
    float _2805 = precise::clamp(_2803, 0.0, 1.0);
    out.gl_Position.x = _1298;
    out.gl_Position.y = _1302;
    out.gl_Position.z = _1443;
    out.gl_Position.w = _1252;
    float _2807 = _2723 * _2787;
    float _2809 = -_2797;
    float _2811 = fma(_300, _392, _2809);
    float _2813 = -_2799;
    float _2815 = fma(_302, _394, _2813);
    out.m_82.x = _616;
    out.m_82.y = _602;
    out.m_82.z = _628;
    float _2817 = -_2801;
    float _2819 = fma(_298, _400, _2817);
    float _2821 = -_2805;
    float _2823 = fma(_2821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2825 = -_2789;
    float _2827 = _2825 + 1.0;
    if (!_1232)
    {
        _1308 = 1.0;
    }
    float _2829 = _1308;
    float _2831 = _2829;
    if (_1232)
    {
        bool _2833 = _1376 >= _1280;
        bool _2835 = isnan(_1376);
        bool _2837 = _2833 || _2835;
        bool _2839 = isnan(_1280);
        bool _2841 = _2837 || _2839;
        float _2843 = float(_2841);
        _2831 = _2843;
    }
    float _2845 = _2831;
    float _2847 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2849 = _2847;
    float _2851 = _2845;
    if (_884)
    {
        _2733 = 1.0;
    }
    float _2853 = _2733;
    float _2855 = _2853;
    if (!_884)
    {
        int _2857 = _948 << 4;
        int _2859 = _2857 + 2048;
        uint _2861 = uint(int(uint(_2859) >> uint(2)));
        uint _2863 = uint(int(uint(int(_2861)) >> uint(2)));
        int _2865 = int(_2861) & 3;
        float _2867 = (*spvDescriptorSet0.vp_c15)._m0[int(_2863)][_2865];
        int _2869 = int(_2861) + 1;
        uint _2871 = uint(int(uint(_2869) >> uint(2)));
        int _2873 = _2869 & 3;
        float _2875 = (*spvDescriptorSet0.vp_c15)._m0[int(_2871)][_2873];
        int _2877 = _2859 + 8;
        uint _2879 = uint(int(uint(_2877) >> uint(2)));
        uint _2881 = uint(int(uint(int(_2879)) >> uint(2)));
        int _2883 = int(_2879) & 3;
        float _2885 = (*spvDescriptorSet0.vp_c15)._m0[int(_2881)][_2883];
        int _2887 = int(_2879) + 1;
        uint _2889 = uint(int(uint(_2887) >> uint(2)));
        int _2891 = _2887 & 3;
        float _2893 = (*spvDescriptorSet0.vp_c15)._m0[int(_2889)][_2891];
        float _2895 = _650 * _2875;
        float _2897 = fma(_2867, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2895);
        float _2899 = fma(_2885, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2897);
        float _2901 = _2899 + _2893;
        float _2903 = precise::clamp(_2901, 0.0, 1.0);
        float _2905 = -_2903;
        float _2907 = _2905 + _1368;
        float _2909 = fma(_2907, 500.0, 1.5);
        float _2911 = exp2(_2909);
        float _2913 = 0.0 + _2911;
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        _2855 = _2915;
        _1256 = 500.0;
    }
    float _2917 = _2855;
    float _2919 = _1256;
    float _2921 = _2847 * _1378;
    float _2923 = _2845 * _2917;
    float _2925 = -_2847;
    float _2927 = _2925 + 1.0;
    out.m_84.x = _2811;
    out.m_84.y = _2815;
    out.m_84.z = _2819;
    float _2929 = _1389 * _2921;
    float _2931 = -_2923;
    float _2933 = fma(_2931, _2823, 1.0);
    float _2935 = precise::clamp(_2933, 0.0, 1.0);
    float _2937 = _1399 * _2921;
    bool _2939 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2941 = isnan(_1052);
    bool _2943 = _2939 || _2941;
    bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2947 = _2943 || _2945;
    float _2949 = fma(_1395, _2929, _1383);
    float _2951 = fma(_1397, _2929, _1385);
    float _2953 = _2935 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2955 = _1389 * _2927;
    float _2957 = fma(_1389, _2937, _1387);
    float _2959 = _2807 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.x = _2953;
    out.m_88.x = _2949;
    out.m_88.y = _2951;
    out.m_88.z = _2957;
    out.m_88.w = _2955;
    float _2961 = _2919;
    float _2963 = _2927;
    float _2965 = _2935;
    if (!_2947)
    {
        _2849 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2967 = _2849;
    float _2969 = _2967;
    float _2971 = _2967;
    if (!_2947)
    {
        _758 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2973 = _758;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2947)
    {
        _2961 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2979 = _2961;
    float _2981 = _2979;
    float _2983 = _2979;
    if (!_2947)
    {
        _2963 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2985 = _2963;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2947)
    {
        _2851 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2991 = _2851;
    float _2993 = _2991;
    float _2995 = _2991;
    if (!_2947)
    {
        _2965 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2997 = _2965;
    bool _2999 = !_2947;
    float _3001 = _2997;
    float _3003 = _2997;
    if (!_2999)
    {
        bool _3005 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3007 = isnan(_1052);
        bool _3009 = _3005 || _3007;
        bool _3011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3013 = _3009 || _3011;
        if (!_3013)
        {
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3017 = _1052 + _3015;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3021 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3019;
            float _3023 = 1.0 / _3021;
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3045 = _3017 * _3023;
            float _3047 = precise::clamp(_3045, 0.0, 1.0);
            float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3053 = fma(_3047, _3027, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3055 = fma(_3047, _3051, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3057 = fma(_3047, _3031, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3059 = fma(_3047, _3035, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3061 = fma(_3047, _3039, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3063 = fma(_3047, _3043, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2977 = _3055;
            _2995 = _3061;
            _2971 = _3053;
            _2989 = _3059;
            _2983 = _3057;
            _3003 = _3063;
            _3065 = true;
        }
        else
        {
            bool _3067 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3069 = isnan(_1052);
            bool _3071 = _3067 || _3069;
            bool _3073 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3075 = _3071 || _3073;
            if (!_3075)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3077 = _2969;
            _2971 = _3077;
            if (!_3075)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3079 = _2975;
            _2977 = _3079;
            if (!_3075)
            {
                _2981 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3081 = _2981;
            _2983 = _3081;
            if (!_3075)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3083 = _2987;
            _2989 = _3083;
            if (!_3075)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3085 = _2993;
            _2995 = _3085;
            if (!_3075)
            {
                _3001 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3087 = _3001;
            bool _3089 = !_3075;
            _3003 = _3087;
            if (!_3089)
            {
                bool _3091 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3093 = isnan(_1052);
                bool _3095 = _3091 || _3093;
                bool _3097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3099 = _3095 || _3097;
                if (!_3099)
                {
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3103 = _1052 + _3101;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3107 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3105;
                    float _3109 = 1.0 / _3107;
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3131 = _3103 * _3109;
                    float _3133 = precise::clamp(_3131, 0.0, 1.0);
                    float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3137 = _3135 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3139 = fma(_3133, _3113, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3141 = fma(_3133, _3137, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3143 = fma(_3133, _3117, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3145 = fma(_3133, _3121, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3147 = fma(_3133, _3125, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3149 = fma(_3133, _3129, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2977 = _3141;
                    _2995 = _3147;
                    _2971 = _3139;
                    _2989 = _3145;
                    _2983 = _3143;
                    _3003 = _3149;
                    _3065 = true;
                }
                else
                {
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2983 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3003 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3065 = false;
    float _3151 = _2977;
    float _3153 = _2995;
    float _3155 = _2971;
    float _3157 = _2989;
    float _3159 = _2983;
    float _3161 = _3003;
    float _3163 = fma(_2815, -0.5, 0.5);
    float _3165 = precise::clamp(_3163, 0.0, 1.0);
    float _3167 = -_3151;
    float _3169 = _3167 + _3153;
    float _3171 = -_3155;
    float _3173 = _3171 + _3157;
    float _3175 = -_3159;
    float _3177 = _3175 + _3161;
    bool _3179 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3181 = fma(_3165, _3169, _3151);
    float _3183 = fma(_3165, _3173, _3155);
    float _3185 = fma(_3165, _3177, _3159);
    float _3187 = _2959 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3189 = _3181 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _3191 = fma(_3183, 0.298911988735198974609375, _3189);
    out.m_92.x = _3187;
    float _3193 = fma(_3185, 0.114477999508380889892578125, _3191);
    float _3195 = -_3193;
    float _3197 = _3183 + _3195;
    float _3199 = -_3193;
    float _3201 = _3181 + _3199;
    float _3203 = -_3193;
    float _3205 = _3185 + _3203;
    float _3207 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3193);
    float _3209 = fma(_3201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3193);
    float _3211 = fma(_3205, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3193);
    out.m_94.x = _3207;
    out.m_94.y = _3209;
    out.m_94.z = _3211;
    if (!_3179)
    {
        return out;
    }
    float _3213 = -_576;
    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3217 = -_596;
    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3221 = -_580;
    float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3225 = _3215 * _3215;
    float _3227 = fma(_3219, _3219, _3225);
    float _3229 = fma(_3223, _3223, _3227);
    float _3231 = sqrt(_3229);
    float _3233 = rsqrt(_3229);
    float _3235 = -_3231;
    float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3239 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3241 = precise::clamp(_3239, 0.0, 1.0);
    float _3243 = _3219 * _3233;
    float _3245 = _3215 * _3233;
    float _3247 = abs(_3241);
    float _3249 = log2(_3247);
    float _3251 = _3223 * _3233;
    float _3253 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3255 = _2815 * _3245;
    float _3257 = -_3245;
    float _3259 = -_3253;
    float _3261 = fma(_3257, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3259);
    float _3263 = fma(_2811, _3243, _3255);
    float _3265 = -_3251;
    float _3267 = fma(_3265, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3261);
    float _3269 = fma(_2819, _3251, _3263);
    float _3271 = precise::clamp(_3269, 0.0, 1.0);
    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3275 = _3267 + _3273;
    float _3277 = _3249 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3279 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = exp2(_3277);
    float _3285 = _3283 * _3281;
    float _3287 = _3271 * _3285;
    float _3289 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3291 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3293 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3289;
    out.m_90.y = _3291;
    out.m_90.z = _3293;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3065 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = as_type<float>(int(gl_VertexIndex));
    float _110 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    int _117 = as_type<int>(_108) >> 2;
    int _119 = _117 + _115;
    int _121 = _119 * 96;
    int _123 = _121 + 32;
    uint _126 = uint(int(uint(_121) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_126)];
    float _128 = as_type<float>(_dmw0.x);
    int _130 = _121 + 4;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw0.y);
    int _136 = _121 + 8;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw0.z);
    int _142 = _121 + 12;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw0.w);
    uint _148 = uint(int(uint(_123) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_148)];
    float _150 = as_type<float>(_dmw2.x);
    int _152 = _123 + 4;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw2.y);
    int _158 = _123 + 8;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>(_dmw2.z);
    int _164 = _121 + 16;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_166)];
    float _168 = as_type<float>(_dmw1.x);
    int _170 = _164 + 4;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>(_dmw1.y);
    int _176 = _164 + 8;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>(_dmw1.z);
    float _182 = float(_117);
    int _184 = as_type<int>(_108) & 1;
    bool _188 = _184 != 0;
    int _190 = as_type<int>(_108) & 2;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _196 = _194 != 0;
    float _198 = -_134;
    float _200 = _198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _202 = -_128;
    float _204 = _202 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _206 = -_140;
    float _208 = _206 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _210 = _200 * _200;
    float _212 = _156 * _156;
    float _214 = fma(_204, _204, _210);
    float _216 = fma(_150, _150, _212);
    float _218 = fma(_208, _208, _214);
    float _220 = fma(_162, _162, _216);
    float _222 = rsqrt(_218);
    float _224 = rsqrt(_220);
    float _226 = _204 * _222;
    float _228 = _200 * _222;
    float _230 = _208 * _222;
    float _232 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _234 = _174 * _174;
    float _236 = _162 * _224;
    float _238 = _156 * _224;
    float _240 = _150 * _224;
    float _242 = 1.0 / _232;
    float _244 = _226 * _236;
    float _246 = _230 * _238;
    float _248 = fma(_168, _168, _234);
    float _250 = -_244;
    float _252 = fma(_230, _240, _250);
    float _254 = _228 * _240;
    float _256 = -_246;
    float _258 = fma(_228, _236, _256);
    float _260 = fma(_180, _180, _248);
    float _262 = _252 * _252;
    float _264 = -_254;
    float _266 = fma(_226, _238, _264);
    float _268 = fma(_258, _258, _262);
    float _270 = rsqrt(_260);
    float _272 = _182 * _242;
    float _274 = fma(_266, _266, _268);
    bool _276 = !_192;
    float _278 = _276 ? 1.0 : (-1.0);
    float _280 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _282 = _280 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    int _284 = _121 + 48;
    float _286 = rsqrt(_274);
    float _288 = abs(_146);
    float _290 = _288 * _278;
    float _292 = _290 * 0.5;
    float _294 = fma(_272, _282, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _296 = _294 * _292;
    float _298 = _168 * _270;
    float _300 = _174 * _270;
    float _302 = _180 * _270;
    float _304 = _292;
    float _306 = _266;
    float _308 = _258;
    float _310 = _270;
    float _312 = _294;
    if (_196)
    {
        _304 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _314 = _304;
    float _316 = _258 * _286;
    float _318 = _252 * _286;
    float _320 = _266 * _286;
    uint _322 = uint(int(uint(_284) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_322)];
    float _324 = as_type<float>(_dmw3.x);
    int _326 = _284 + 4;
    uint _328 = uint(int(uint(_326) >> uint(2)));
    float _330 = as_type<float>(_dmw3.y);
    int _332 = _284 + 8;
    uint _334 = uint(int(uint(_332) >> uint(2)));
    float _336 = as_type<float>(_dmw3.z);
    int _338 = _284 + 12;
    uint _340 = uint(int(uint(_338) >> uint(2)));
    float _342 = as_type<float>(_dmw3.w);
    bool _344 = !_188;
    float _346 = _320;
    float _348 = _316;
    float _350 = _318;
    float _352 = _314;
    float _354 = _342;
    float _356 = _330;
    float _358 = _336;
    if (!_344)
    {
        float _360 = _302 * _316;
        float _362 = _300 * _320;
        float _364 = _298 * _318;
        float _366 = -_360;
        float _368 = fma(_298, _320, _366);
        float _370 = -_362;
        float _372 = fma(_302, _318, _370);
        float _374 = -_364;
        float _376 = fma(_300, _316, _374);
        float _378 = _368 * _368;
        float _380 = fma(_372, _372, _378);
        float _382 = fma(_376, _376, _380);
        float _384 = rsqrt(_382);
        float _386 = _372 * _384;
        float _388 = _368 * _384;
        float _390 = _376 * _384;
        _346 = _390;
        _348 = _386;
        _306 = _384;
        _308 = _382;
        _350 = _388;
        _310 = _368;
        _312 = _372;
    }
    float _392 = _346;
    float _394 = _348;
    float _396 = _306;
    float _398 = _308;
    float _400 = _350;
    float _402 = _310;
    float _404 = _312;
    float _406 = -_296;
    float _408 = fma(_392, _406, _140);
    float _410 = -_296;
    float _412 = fma(_394, _410, _128);
    float _414 = _396;
    float _416 = _398;
    float _418 = _402;
    float _420 = _404;
    float _422 = _408;
    float _424 = _412;
    if (_196)
    {
        _414 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _426 = _414;
    float _428 = _426;
    if (_196)
    {
        float _430 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _432 = _314 + _430;
        _416 = _432;
    }
    float _434 = _416;
    float _436 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _438 = _408 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _442 = _412 + _440;
    if (_196)
    {
        _418 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _444 = _418;
    float _446 = _444;
    if (_196)
    {
        float _448 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _450 = _426 + _448;
        _428 = _450;
    }
    float _452 = _428;
    float _454 = _438 * _438;
    float _456 = _454;
    if (_196)
    {
        float _458 = _434 * _434;
        _420 = _458;
    }
    float _460 = _420;
    float _462 = -_296;
    float _464 = fma(_400, _462, _134);
    float _466 = _460;
    if (_196)
    {
        float _468 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _470 = _444 + _468;
        _352 = _470;
    }
    float _472 = _352;
    float _474 = fma(_442, _442, _454);
    if (_196)
    {
        float _476 = fma(_452, _452, _460);
        _466 = _476;
    }
    float _478 = _466;
    float _480 = _478;
    if (!_196)
    {
        _446 = 0.0;
        _456 = 0.0;
    }
    float _482 = _446;
    float _484 = _456;
    float _486 = sqrt(_474);
    float _488 = _484;
    float _490 = _482;
    if (_196)
    {
        float _492 = fma(_472, _472, _478);
        _354 = _492;
    }
    float _494 = _354;
    if (!_196)
    {
        _480 = 0.0;
    }
    float _496 = _480;
    float _498 = _494;
    float _500 = _496;
    if (_196)
    {
        float _502 = rsqrt(_494);
        _498 = _502;
    }
    float _504 = _498;
    bool _506 = _486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _508 = 0.0;
    if (_196)
    {
        float _510 = _504 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _508 = _510;
    }
    float _512 = _508;
    if (_196)
    {
        float _514 = _452 * _512;
        _488 = _514;
    }
    float _516 = _488;
    if (_196)
    {
        float _518 = _434 * _512;
        _490 = _518;
    }
    float _520 = _490;
    if (_196)
    {
        float _522 = _472 * _512;
        _500 = _522;
    }
    float _524 = _500;
    float _526 = 0.0;
    if (!_506)
    {
        _526 = _464;
    }
    float _528 = _526;
    bool _530 = !_506;
    float _532 = _528;
    if (!_530)
    {
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _536 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _538 = _486 + _536;
        float _540 = _464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = rsqrt(_474);
        float _544 = _538 * _534;
        float _546 = _544 * 0.15915493667125701904296875;
        float _548 = _546 * 6.283185482025146484375;
        float _550 = cos(_548);
        float _552 = _546 * 6.283185482025146484375;
        float _554 = sin(_552);
        float _556 = _550 + (-1.0);
        float _558 = fma(_554, _540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _560 = _556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _562 = _542 * _558;
        float _564 = fma(_464, _550, _560);
        float _566 = fma(_442, _562, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _568 = fma(_438, _562, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _532 = _564;
        _422 = _568;
        _424 = _566;
    }
    float _570 = _532;
    float _572 = _422;
    float _574 = _424;
    float _576 = _520 + _570;
    float _578 = _134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _580 = _524 + _572;
    float _582 = _134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _584 = _134 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _586 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[1].x, _578);
    float _588 = _134 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _590 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[0].x, _582);
    float _592 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[2].x, _584);
    float _594 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _586);
    float _596 = _516 + _574;
    float _598 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _590);
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _602 = _576 + _600;
    float _604 = _594 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _606 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[3].x, _588);
    float _608 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _592);
    float _610 = _598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _612 = _604 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _616 = _596 + _614;
    float _618 = _602 * _602;
    float _620 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _606);
    float _622 = _608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[7].x, _612);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _628 = _580 + _626;
    float _630 = fma(_616, _616, _618);
    float _632 = _620 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _634 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[7].z, _624);
    float _636 = _604 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _638 = fma(_628, _628, _630);
    float _640 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _634);
    float _642 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[6].x, _636);
    float _644 = rsqrt(_638);
    float _646 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _648 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[6].z, _642);
    float _650 = _646 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _652 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _648);
    float _654 = 1.0 / _640;
    float _656 = _652 + _640;
    float _658 = _644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _660 = _650 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _662 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _664 = _616 * _658;
    float _666 = _628 * _658;
    float _668 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _660);
    float _670 = floor(_662);
    float _672 = _656 * _654;
    float _674 = _672 * 0.5;
    float _676 = _664 * _664;
    float _678 = _666 * _666;
    float _680 = _650 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[30].w, _682);
    float _686 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _668);
    float _688 = _676 + _678;
    float _690 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _680);
    float _692 = _686 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _694 = 1.0 / _684;
    float _696 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _690);
    float _698 = _696 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _700 = -_670;
    float _702 = _662 + _700;
    float _704 = sqrt(_688);
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _708 = _694 * _706;
    float _710 = trunc(_698);
    int _712 = int(_710);
    bool _714 = _708 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _716 = _708 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _718 = _704 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _720 = trunc(_692);
    int _722 = int(_720);
    bool _724 = !_714;
    int _726 = _724 ? 0 : 1;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _730 = _704 + _728;
    int _732 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _734 = _712 + _732;
    int _736 = _734 + 1;
    int _738 = 2;
    float _740 = _688;
    float _742 = _730;
    float _744 = (*spvDescriptorSet0.vp_c12)._m0[5].z;
    int _746 = _736;
    float _748 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    float _750 = (*spvDescriptorSet0.vp_c12)._m0[5].x;
    int _752 = as_type<int>(_664);
    int _754 = as_type<int>(_670);
    float _756 = _698;
    float _758 = _616;
    if (!_714)
    {
        _738 = 1;
    }
    int _760 = _738;
    int _762 = _760;
    if (!_716)
    {
        _762 = _726;
    }
    int _764 = _762;
    float _766 = _140;
    if (_718)
    {
        float _768 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _766 = _768;
    }
    float _770 = _766;
    int _772 = _764 << 6;
    bool _774 = _736 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _778 = _772 + 96;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    uint _782 = uint(int(uint(int(_780)) >> uint(2)));
    int _784 = int(_780) & 3;
    float _786 = (*spvDescriptorSet0.vp_c15)._m0[int(_782)][_784];
    int _788 = int(_780) + 1;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    int _792 = _788 & 3;
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[int(_790)][_792];
    if (_718)
    {
        float _796 = rsqrt(_688);
        _740 = _796;
    }
    float _798 = _740;
    float _800 = precise::max(0.0, _776);
    int _802 = _772 + 48;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    uint _806 = uint(int(uint(int(_804)) >> uint(2)));
    int _808 = int(_804) & 3;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[int(_806)][_808];
    int _812 = int(_804) + 1;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    int _816 = _812 & 3;
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[int(_814)][_816];
    float _820 = _798;
    if (_718)
    {
        float _822 = _730 * _770;
        _742 = _822;
    }
    float _824 = _742;
    int _826 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _828 = _722 + _826;
    int _830 = _828 + 1;
    float _832 = -_658;
    float _834 = -_800;
    float _836 = fma(_602, _832, _834);
    float _838 = 0.0;
    if (_718)
    {
        float _840 = _824 * 0.15915493667125701904296875;
        _838 = _840;
    }
    float _842 = _838;
    int _844 = _736 | _830;
    int _846 = _772 + 104;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c15)._m0[int(_858)][_860];
    float _864 = 0.0;
    float _866 = as_type<float>(_844);
    if (_718)
    {
        float _868 = _842 * 6.283185482025146484375;
        float _870 = sin(_868);
        _864 = _870;
    }
    float _872 = _864;
    bool _874 = _844 < 0;
    bool _876 = _874 || _774;
    if (_718)
    {
        float _878 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _866 = _878;
    }
    float _880 = _866;
    bool _882 = _830 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _884 = _882 || _876;
    int _886 = _772 + 64;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    uint _890 = uint(int(uint(int(_888)) >> uint(2)));
    int _892 = int(_888) & 3;
    float _894 = (*spvDescriptorSet0.vp_c15)._m0[int(_890)][_892];
    int _896 = int(_888) + 1;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    int _900 = _896 & 3;
    float _902 = (*spvDescriptorSet0.vp_c15)._m0[int(_898)][_900];
    float _904 = 0.0;
    float _906 = _880;
    if (_718)
    {
        float _908 = _842 * 6.283185482025146484375;
        float _910 = cos(_908);
        _904 = _910;
    }
    float _912 = _904;
    int _914 = _772 + 56;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    float _932 = _872;
    if (_718)
    {
        float _934 = fma(_872, _880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _932 = _934;
    }
    float _936 = _932;
    float _938 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_718)
    {
        _744 = _664;
    }
    float _940 = _744;
    float _942 = _940;
    if (!_884)
    {
        int _944 = _830 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _946 = _944 + _736;
        _746 = _946;
    }
    int _948 = _746;
    float _950 = 0.0;
    if (_718)
    {
        float _952 = _798 * _936;
        _950 = _952;
    }
    float _954 = _950;
    if (!_718)
    {
        _748 = _836;
    }
    float _956 = _748;
    float _958 = floor(_938);
    int _960 = _772 + 72;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    uint _964 = uint(int(uint(int(_962)) >> uint(2)));
    int _966 = int(_962) & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    int _970 = int(_962) + 1;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    int _974 = _970 & 3;
    float _976 = (*spvDescriptorSet0.vp_c15)._m0[int(_972)][_974];
    float _978 = _956;
    float _980 = _912;
    if (_718)
    {
        float _982 = _912 + (-1.0);
        _750 = _982;
    }
    float _984 = _750;
    float _986 = _984;
    if (_718)
    {
        float _988 = _664 * _954;
        _942 = _988;
    }
    float _990 = _942;
    if (!_718)
    {
        _820 = _678;
    }
    float _992 = _820;
    float _994 = _992;
    if (_718)
    {
        float _996 = _984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _996;
    }
    float _998 = _906;
    if (!_718)
    {
        _986 = _666;
    }
    float _1000 = _986;
    float _1002 = _1000;
    if (_718)
    {
        float _1004 = _666 * _954;
        _1002 = _1004;
    }
    float _1006 = _1002;
    float _1008 = _650 * _794;
    if (_718)
    {
        float _1010 = fma(_836, _912, _998);
        _978 = _1010;
    }
    float _1012 = _978;
    if (!_718)
    {
        _980 = _676;
    }
    float _1014 = _980;
    float _1016 = _1014;
    if (_718)
    {
        float _1018 = _990 * _990;
        _1016 = _1018;
    }
    float _1020 = _1016;
    if (_718)
    {
        float _1022 = _1006 * _1006;
        _994 = _1022;
    }
    float _1024 = _994;
    int _1026 = _772 + 80;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    if (!_884)
    {
        int _1044 = _948 << 2;
        _752 = _1044;
    }
    int _1046 = _752;
    float _1048 = fma(_1012, _1012, _1020);
    float _1050 = _650 * _818;
    float _1052 = sqrt(_638);
    int _1054 = _1046;
    if (!_884)
    {
        uint _1056 = uint(int(uint(_948) >> uint(2)));
        _754 = int(_1056);
    }
    int _1058 = _754;
    float _1060 = _1048 + _1024;
    float _1062 = fma(_786, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1008);
    float _1064 = fma(_810, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1050);
    float _1066 = as_type<float>(_1058);
    if (!_884)
    {
        int _1068 = 12 & _1046;
        _1054 = _1068;
    }
    int _1070 = _1054;
    float _1072 = fma(_854, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1062);
    float _1074 = rsqrt(_1060);
    if (!_884)
    {
        int _1076 = _1058 << 4;
        int _1078 = _1076 + _1070;
        _1066 = as_type<float>(_1078);
    }
    float _1080 = _1066;
    float _1082 = _1072 + _862;
    int _1084 = _772 + 88;
    uint _1086 = uint(int(uint(_1084) >> uint(2)));
    uint _1088 = uint(int(uint(int(_1086)) >> uint(2)));
    int _1090 = int(_1086) & 3;
    float _1092 = (*spvDescriptorSet0.vp_c15)._m0[int(_1088)][_1090];
    int _1094 = int(_1086) + 1;
    uint _1096 = uint(int(uint(_1094) >> uint(2)));
    int _1098 = _1094 & 3;
    float _1100 = (*spvDescriptorSet0.vp_c15)._m0[int(_1096)][_1098];
    float _1102 = _650 * _902;
    float _1104 = 1.0 / _1082;
    float _1106 = fma(_894, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1102);
    float _1108 = _1080;
    if (!_884)
    {
        int _1110 = as_type<int>(_1080) + 400;
        uint _1112 = uint(int(uint(_1110) >> uint(2)));
        uint _1114 = uint(int(uint(int(_1112)) >> uint(2)));
        int _1116 = int(_1112) & 3;
        float _1118 = (*spvDescriptorSet0.vp_c15)._m0[int(_1114)][_1116];
        _1108 = _1118;
    }
    float _1120 = _1108;
    float _1122 = -_958;
    float _1124 = _938 + _1122;
    float _1126 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1064);
    float _1128 = _576 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1130 = _1074 * _990;
    float _1132 = _1126 + _930;
    float _1134 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1128);
    float _1136 = _576 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1138 = _1130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1140 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1106);
    float _1142 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1134);
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1146 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1144);
    float _1148 = precise::clamp(_1146, 0.0, 1.0);
    float _1150 = _1132 * _1104;
    float _1152 = _1140 + _976;
    float _1154 = _576 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1156 = -_1148;
    float _1158 = _1156 + 1.0;
    float _1160 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1162 = _1074 * _1012;
    float _1164 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1154);
    float _1166 = _1074 * _1006;
    float _1168 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1170 = abs(_1158);
    float _1172 = log2(_1170);
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1176 = _1152 * _1104;
    bool _1178 = _1150 >= 0.0;
    float _1180 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1136);
    float _1182 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1164);
    float _1184 = -_1174;
    float _1186 = fma(_1184, _1168, 1.0);
    float _1188 = _576 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1190 = _1150 <= 1.0;
    bool _1192 = _1190 && _1178;
    float _1194 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1180);
    float _1196 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1198 = _638;
    float _1200 = _958;
    if (!_884)
    {
        float _1202 = floor(_692);
        _1198 = _1202;
    }
    float _1204 = _1198;
    float _1206 = -_1138;
    float _1208 = fma(_1162, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1206);
    float _1210 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1188);
    float _1212 = _650 * _1042;
    float _1214 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1216 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1218 = _1176 >= 0.0;
    bool _1220 = _1218 && _1192;
    float _1222 = -_1166;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1208);
    float _1226 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1210);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1216);
    bool _1230 = _1176 <= 1.0;
    bool _1232 = _1230 && _1220;
    float _1234 = fma(_1034, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1212);
    float _1236 = fma(_1224, -0.5, 0.5);
    float _1238 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1240 = fma(_1224, 0.5, 0.5);
    float _1242 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1244 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1228);
    float _1246 = exp2(_1238);
    float _1248 = fma(_1240, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1250 = fma(_1092, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1234);
    float _1252 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1244);
    float _1254 = _1238;
    float _1256 = _1252;
    if (_1232)
    {
        float _1258 = float(_764);
        _1200 = _1258;
    }
    float _1260 = _1200;
    float _1262 = _1250 + _1100;
    float _1264 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1266 = sqrt(_1236);
    if (!_884)
    {
        float _1268 = -_1204;
        float _1270 = _692 + _1268;
        _1254 = _1270;
    }
    float _1272 = _1254;
    float _1274 = fma(_1240, _1248, -0.212114393711090087890625);
    float _1276 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1278 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1264);
    float _1280 = _1262 * _1104;
    float _1282 = fma(_1240, _1274, 1.570728778839111328125);
    float _1284 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1276);
    float _1286 = log2(_1186);
    float _1288 = _1162 + 1.0;
    float _1290 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1278);
    float _1292 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1284);
    float _1294 = -_1162;
    float _1296 = fma(_1246, _1288, _1294);
    float _1298 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1292);
    float _1300 = 1.0 / _1252;
    float _1302 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1304 = _1266 * 0.636619746685028076171875;
    float _1306 = _936;
    float _1308 = _1302;
    if (!_884)
    {
        float _1310 = floor(_698);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = _1286 * 0.693147182464599609375;
    float _1316 = -_1282;
    float _1318 = fma(_1304, _1316, 1.0);
    float _1320 = fma(_1296, 0.5, 0.5);
    float _1322 = _1120;
    if (!_884)
    {
        float _1324 = rint(_1120);
        float _1326 = precise::max(_1324, 0.0);
        uint _1328 = uint(_1326);
        uint _1330 = clamp(_1328, 0u, 65535u);
        _1322 = as_type<float>(_1330);
    }
    float _1332 = _1322;
    float _1334 = _1298 * _1300;
    float _1336 = _1302 * _1300;
    float _1338 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _5319 = float2(_702, _1124);
    float _1340 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5319, float2(0.0), isnan(_5319)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5319, float2(0.0), isnan(_5319)), level(0.0)).x;
    float _1342 = fma(_1334, 0.5, 0.5);
    float _1344 = fma(_1336, -0.5, 0.5);
    float _1346 = _1260;
    if (_1232)
    {
        float _1348 = rint(_1260);
        float _1350 = precise::max(_1348, 0.0);
        uint _1352 = uint(_1350);
        uint _1354 = clamp(_1352, 0u, 65535u);
        _1346 = as_type<float>(_1354);
    }
    float _1356 = _1346;
    if (!_884)
    {
        float _1358 = -_1312;
        float _1360 = _698 + _1358;
        _756 = _1360;
    }
    float _1362 = _756;
    float _1364 = _1272;
    if (!_884)
    {
        float3 _5366 = float3(_1362, _1272, float(as_type<int>(_1332)));
        float3 _5370 = select(_5366, float3(0.0), isnan(_5366));
        float _1366 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5370.xy, uint(rint(_5370.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5370.xy, uint(rint(_5370.z)), level(0.0)).x;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1176;
    float _1372 = _1356;
    if (_1232)
    {
        float3 _5386 = float3(_1150, _1176, float(as_type<int>(_1356)));
        float3 _5388 = select(_5386, float3(0.0), isnan(_5386));
        float _1374 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5388.xy, uint(rint(_5388.z)), _1280, level(0.0));
        _1370 = _1374;
    }
    float _1376 = _1370;
    float3 _5398 = float3(_1342, _1344, _1338);
    float _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float3 _5407 = float3(_1342, _1344, _1338);
    float4 _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5407, float3(0.0), isnan(_5407)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5407, float3(0.0), isnan(_5407)), level(0.0)).xyzw;
    float _1383 = _1381.x;
    float _1385 = _1381.y;
    float _1387 = _1381.z;
    float _1389 = _1381.w;
    float2 _5423 = float2(_1318, _1320);
    float3 _1393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5423, float2(0.0), isnan(_5423)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5423, float2(0.0), isnan(_5423)), level(0.0)).xyz;
    float _1395 = _1393.x;
    float _1397 = _1393.y;
    float _1399 = _1393.z;
    bool _1401 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1403 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1407 = _1405 != 0;
    float _1409 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1411 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1403);
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    bool _1417 = !_192;
    float _1419 = _1417 ? 0.0 : 1.0;
    float _1421 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1411);
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1425 = _1423 != 0;
    float _1427 = _1150;
    float _1429 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1431 = _1407;
    bool _1433 = _1425;
    bool _1435 = _1401;
    if (_1401)
    {
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1427 = _1437;
    }
    float _1439 = _1427;
    if (_1401)
    {
        _1372 = (*spvDescriptorSet0.vp_c9)._m0[14].x;
    }
    float _1441 = _1372;
    float _1443 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1421);
    bool _1445 = false;
    float _1447 = _1441;
    if (_1407)
    {
        bool _1449 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _1445 = _1449;
    }
    bool _1451 = _1445;
    if (_1401)
    {
        _1429 = (*spvDescriptorSet0.vp_c9)._m0[15].x;
    }
    float _1453 = _1429;
    float _1455 = 0.0;
    float _1457 = _1453;
    if (!_1407)
    {
        _1455 = _1419;
    }
    float _1459 = _1455;
    float _1461 = _1459;
    if (_1407)
    {
        float _1463 = -_1419;
        float _1465 = _1451 ? _1463 : _1419;
        _1461 = _1465;
    }
    float _1467 = _1461;
    if (_1401)
    {
        float _1469 = _1453 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1457 = _1469;
    }
    float _1471 = _1457;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1475 = _1473 != 0;
    float _1477 = _1471;
    if (_1415)
    {
        bool _1479 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1431 = _1479;
    }
    bool _1481 = _1431;
    bool _1483 = _1481;
    if (_1401)
    {
        float _1485 = fma(_1471, _1441, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1447 = _1485;
    }
    float _1487 = _1447;
    float _1489 = 0.0;
    float _1491 = _1487;
    if (!_1415)
    {
        _1489 = _1419;
    }
    float _1493 = _1489;
    float _1495 = _1493;
    if (_1401)
    {
        float _1497 = _1487 * _1439;
        _1491 = _1497;
    }
    float _1499 = _1491;
    if (_1415)
    {
        float _1501 = -_1419;
        float _1503 = _1481 ? _1501 : _1419;
        _1495 = _1503;
    }
    float _1505 = _1495;
    if (_1425)
    {
        bool _1507 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1483 = _1507;
    }
    bool _1509 = _1483;
    float _1511 = _1439;
    if (_1401)
    {
        float _1513 = floor(_1499);
        _1511 = _1513;
    }
    float _1515 = _1511;
    if (!_1425)
    {
        _1477 = _1419;
    }
    float _1517 = _1477;
    float _1519 = 0.0;
    float _1521 = _1517;
    if (!_1475)
    {
        float _1523 = -_324;
        float _1525 = (-0.0) + _1523;
        _1519 = _1525;
    }
    float _1527 = _1519;
    float _1529 = _1527;
    if (_1425)
    {
        float _1531 = -_1419;
        float _1533 = _1509 ? _1531 : _1419;
        _1521 = _1533;
    }
    float _1535 = _1521;
    float _1537 = _1505 + (-0.5);
    if (_1475)
    {
        bool _1539 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1433 = _1539;
    }
    bool _1541 = _1433;
    bool _1543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1545 = _1342;
    bool _1547 = _1543;
    if (!_1401)
    {
        float _1549 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _1545 = _1549;
    }
    float _1551 = _1545;
    if (_1475)
    {
        float _1553 = -_324;
        float _1555 = _1541 ? _324 : _1553;
        _1529 = _1555;
    }
    float _1557 = _1529;
    float _1559 = _1535 + (-0.5);
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1563 = _1561 != 0;
    float _1565 = _1557 + 0.5;
    float _1567 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1569 = 0.0;
    if (_1401)
    {
        float _1571 = -_1515;
        float _1573 = _1499 + _1571;
        _1569 = _1573;
    }
    float _1575 = _1569;
    out.m_68.w = _1567;
    float _1577 = _1344;
    float _1579 = _1575;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (_1543)
    {
        float _1583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1577 = _1583;
    }
    float _1585 = _1577;
    if (!_1401)
    {
        float _1587 = _1551 * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1579 = _1587;
    }
    float _1589 = _1579;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1593 = _1591 != 0;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1601 = _1599 != 0;
    float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1605 = _1603 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1607 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1609 = 1.0 / _1605;
    float _1611 = _1605;
    float _1613 = _1609;
    if (_1563)
    {
        bool _1615 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1435 = _1615;
    }
    bool _1617 = _1435;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1625 = _1623 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1627 = 1.0 / _1597;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (_1543)
    {
        _1611 = (*spvDescriptorSet0.vp_c9)._m0[15].y;
    }
    float _1631 = _1611;
    out.m_70.w = _1607;
    float _1633 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1619);
    float _1635 = _1631;
    if (_1543)
    {
        _1581 = (*spvDescriptorSet0.vp_c9)._m0[14].y;
    }
    float _1637 = _1581;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_1543)
    {
        float _1641 = _1631 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1635 = _1641;
    }
    float _1643 = _1635;
    float _1645 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1621);
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1655 = _1643;
    if (_1543)
    {
        float _1657 = fma(_1643, _1637, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1655 = _1657;
    }
    float _1659 = _1655;
    float _1661 = -_1639;
    float _1663 = fma(_1647, 2.0, _1661);
    float _1665 = 1.0 / _1625;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1673 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1649);
    if (_1543)
    {
        float _1675 = _1659 * _1585;
        _1629 = _1675;
    }
    float _1677 = _1629;
    float _1679 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1671);
    float _1681 = 1.0 / _1653;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1687 = _1589 + _1685;
    float _1689 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1683);
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1693 = 1.0 / _1669;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1701 = _1589 + _1699;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1705 = _1703 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1707 = fma(_1695, -2.0, _1691);
    float _1709 = _1637;
    float _1711 = _1677;
    float _1713 = _1681;
    if (_1543)
    {
        float _1715 = floor(_1677);
        _1709 = _1715;
    }
    float _1717 = _1709;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1725 = _1589 + _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1729 = _1589 + _1727;
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1731;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[88].w);
    if (!_1543)
    {
        float _1737 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _1735 = as_type<int>(_1737);
    }
    int _1739 = _1735;
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1745 = _1733 * _1627;
    float _1747 = _1743 * _1665;
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1751 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1755 = _1753 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1757 = 1.0 / _1705;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[84].z;
    if (_1543)
    {
        float _1761 = -_1717;
        float _1763 = _1677 + _1761;
        _1711 = _1763;
    }
    float _1765 = _1711;
    float _1767 = _1751 * _1681;
    float _1769 = _1755 * _1609;
    float _1771 = _1765;
    if (!_1593)
    {
        _1613 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1773 = _1613;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1775;
    float _1779 = _1773;
    if (_1593)
    {
        _1779 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1781 = _1779;
    float _1783 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1785 = 1.0 / _1721;
    int _1787 = _1739;
    float _1789 = _1783;
    if (!_1543)
    {
        float _1791 = as_type<float>(_1739) * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1771 = _1791;
    }
    float _1793 = _1771;
    if (_1601)
    {
        _1713 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1795 = _1713;
    float _1797 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1783);
    float _1799 = _1795;
    if (_1593)
    {
        _1787 = 0;
    }
    int _1801 = _1787;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1805 = _1793 + _1803;
    int _1807 = _1801;
    if (!_1593)
    {
        _1807 = 2;
    }
    int _1809 = _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1817 = _1815 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    if (_1601)
    {
        bool _1819 = _1795 > 0.5;
        _1547 = _1819;
    }
    bool _1821 = _1547;
    if (!_1593)
    {
        _1759 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1823 = _1759;
    float _1825 = _1817 * _1757;
    float _1827 = _1757;
    float _1829 = _1823;
    if (!_1593)
    {
        _1799 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1831 = _1799;
    float _1833 = _1813 * _1693;
    float _1835 = _1831;
    if (!_1593)
    {
        _1789 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1837 = _1789;
    float _1839 = _1777 * _1785;
    float _1841 = _1837;
    if (!_1593)
    {
        _1827 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1843 = _1827;
    float _1845 = _1843;
    if (_1593)
    {
        _1829 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1847 = _1829;
    if (_1593)
    {
        _1835 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1849 = _1835;
    if (_1593)
    {
        _1841 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1851 = _1841;
    if (_1593)
    {
        _1845 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1853 = _1845;
    float _1855 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1697);
    float _1857 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1859 = _1809 != 2;
    float _1861 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1865;
    float _1869 = fma(_1853, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1863);
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1873 = 1.0 / _1867;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1879 = 0.0;
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[89].z;
    float _1883 = _1861;
    if (_1859)
    {
        _1879 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1885 = _1879;
    float _1887 = -_1871;
    float _1889 = fma(_1857, 2.0, _1887);
    float _1891 = _1885;
    if (!_1859)
    {
        _1891 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1893 = _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1895;
    float _1899 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1797);
    float _1901 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1869);
    float _1903 = 1.0 / _1877;
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (!_1601)
    {
        float _1909 = -_330;
        float _1911 = (-0.0) + _1909;
        _1881 = _1911;
    }
    float _1913 = _1881;
    float _1915 = _1913;
    if (_1601)
    {
        float _1917 = -_330;
        float _1919 = _1821 ? _330 : _1917;
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = fma(_1861, -2.0, _1905);
    if (_1859)
    {
        _356 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1925 = _356;
    float _1927 = _1925;
    if (!_1563)
    {
        float _1929 = -_336;
        float _1931 = (-0.0) + _1929;
        _1883 = _1931;
    }
    float _1933 = _1883;
    float _1935 = _1933;
    if (!_1859)
    {
        _1927 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1937 = _1927;
    float _1939 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1907);
    if (_1563)
    {
        float _1941 = -_336;
        float _1943 = _1617 ? _336 : _1941;
        _1935 = _1943;
    }
    float _1945 = _1935;
    float _1947 = 1.0 / _1897;
    if (_1859)
    {
        _358 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1949 = _358;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1955 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1957 = _1949;
    if (!_1859)
    {
        _1957 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1959 = _1957;
    float _1961 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1889);
    float _1963 = 1.0 / _1953;
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1965;
    float _1969 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1923);
    float _1971 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1971;
    float _1975 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1663);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1979 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1633);
    float _1981 = 1.0 / _1967;
    float _1983 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1993 = _1589 + _1991;
    float _1995 = -_1977;
    float _1997 = fma(_1983, 2.0, _1995);
    float _1999 = _1725 * _1947;
    float _2001 = fma(_1955, -2.0, _1989);
    float _2003 = 1.0 / _1987;
    float _2005 = _1993 * _1873;
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2009 = _1793 + _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2013 = _1589 + _2011;
    float _2015 = _1701 * _1963;
    float _2017 = fma(_1747, _2009, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2019 = _2013 * _1903;
    float _2021 = 1.0 / _1973;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2025 = _1793 + _2023;
    float _2027 = _1687 * _1981;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2031 = _1793 + _2029;
    float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2035 = _1793 + _2033;
    float _2037 = fma(_1745, _2025, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2039 = fma(_1769, _1805, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2043 = _1589 + _2041;
    float _2045 = fma(_1767, _2031, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2047 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2049 = _1793 + _2047;
    float _2051 = fma(_1825, _2035, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2053 = _1729 * _2003;
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2055;
    float _2059 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1645);
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2065 = _2043 * _2021;
    float _2067 = fma(_1833, _2049, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2069 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2001);
    float _2071 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1855);
    float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2073;
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2081 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1707);
    float _2083 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1679);
    float _2085 = fma(_2075, _2005, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2087 = fma(_2057, _2005, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2089 = fma(_2079, _2019, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2091 = fma(_2063, _2019, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2093 = _2059 * (-0.15915493667125701904296875);
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2099;
    float _2103 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1673);
    float _2105 = _2093 * 6.283185482025146484375;
    float _2107 = sin(_2105);
    float _2109 = fma(_2097, _1999, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2111 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1689);
    float _2113 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1939);
    float _2115 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1997);
    float _2117 = fma(_2101, _1999, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2123 = _2093 * 6.283185482025146484375;
    float _2125 = cos(_2123);
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2131 = fma(_2121, _2015, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2133;
    float _2137 = fma(_2129, _2015, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2141 = _2139 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2145 = _2143 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2147 = fma(_2141, _2053, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2149 = _1899 * (-0.15915493667125701904296875);
    float _2151 = fma(_2145, _2053, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _2153 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2153;
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2159 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2157;
    float _2161 = _1467 + (-0.5);
    float _2163 = _1565 * _2107;
    float _2165 = _1565 * _2125;
    float _2167 = fma(_2155, _2065, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2169 = fma(_2159, _2065, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    bool _2171 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2173 = isnan(_1589);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2179 = _2175 || _2177;
    float _2181 = float(_2179);
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2183;
    bool _2187 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2189 = isnan(_1793);
    bool _2191 = _2187 || _2189;
    bool _2193 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2195 = _2191 || _2193;
    float _2197 = float(_2195);
    float _2199 = -_2163;
    float _2201 = fma(_2161, _2125, _2199);
    bool _2203 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2205 = isnan(_1589);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = fma(_2161, _2107, _2165);
    bool _2217 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2219 = isnan(_1793);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2225 = _2221 || _2223;
    float _2227 = float(_2225);
    float _2229 = -_2181;
    float _2231 = _2229 + 1.0;
    bool _2233 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2235 = isnan(_1589);
    bool _2237 = _2233 || _2235;
    bool _2239 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2241 = _2237 || _2239;
    float _2243 = float(_2241);
    float _2245 = -_2197;
    float _2247 = _2245 + 1.0;
    float _2249 = -_2213;
    float _2251 = _2249 + 1.0;
    bool _2253 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2255 = isnan(_1793);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2261 = _2257 || _2259;
    float _2263 = float(_2261);
    float _2265 = -_2227;
    float _2267 = _2265 + 1.0;
    bool _2269 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2271 = isnan(_1589);
    bool _2273 = _2269 || _2271;
    bool _2275 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2277 = _2273 || _2275;
    float _2279 = float(_2277);
    float _2281 = _2149 * 6.283185482025146484375;
    float _2283 = sin(_2281);
    bool _2285 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2287 = isnan(_1589);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2299 = _1793 + _2297;
    bool _2301 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2303 = isnan(_1589);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = _2113 * (-0.15915493667125701904296875);
    bool _2315 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2317 = isnan(_1589);
    bool _2319 = _2315 || _2317;
    bool _2321 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2323 = _2319 || _2321;
    float _2325 = float(_2323);
    float _2327 = fma(_1839, _2299, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2329 = _1589 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2331 = isnan(_1589);
    bool _2333 = _2329 || _2331;
    bool _2335 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2337 = _2333 || _2335;
    float _2339 = float(_2337);
    float _2341 = _2213 * _2231;
    float _2343 = _2227 * _2247;
    float _2345 = _2243 * _2251;
    float _2347 = -_2243;
    float _2349 = _2347 + 1.0;
    float _2351 = _2263 * _2267;
    float _2353 = -_2263;
    float _2355 = _2353 + 1.0;
    bool _2357 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2359 = isnan(_1793);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2365 = _2361 || _2363;
    float _2367 = float(_2365);
    float _2369 = _2149 * 6.283185482025146484375;
    float _2371 = cos(_2369);
    bool _2373 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2375 = isnan(_1793);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2381 = _2377 || _2379;
    float _2383 = float(_2381);
    float _2385 = _2339 * _2349;
    bool _2387 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2389 = isnan(_1793);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2395 = _2391 || _2393;
    float _2397 = float(_2395);
    float _2399 = -_2325;
    float _2401 = _2399 + 1.0;
    bool _2403 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2405 = isnan(_1793);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2411 = _2407 || _2409;
    float _2413 = float(_2411);
    float _2415 = -_2367;
    float _2417 = _2415 + 1.0;
    float _2419 = -_2339;
    float _2421 = _2419 + 1.0;
    float _2423 = _2311 * _2401;
    bool _2425 = _1793 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2427 = isnan(_1793);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2433 = _2429 || _2431;
    float _2435 = float(_2433);
    float _2437 = _2383 * _2355;
    float _2439 = -_2383;
    float _2441 = _2439 + 1.0;
    float _2443 = -_2311;
    float _2445 = _2443 + 1.0;
    float _2447 = _2397 * _2417;
    float _2449 = _2325 * _2421;
    float _2451 = -_2397;
    float _2453 = _2451 + 1.0;
    float _2455 = _2367 * _2441;
    float _2457 = _1921 + 0.5;
    float _2459 = _2313 * 6.283185482025146484375;
    float _2461 = sin(_2459);
    float _2463 = _2295 * _2445;
    float _2465 = -_2295;
    float _2467 = _2465 + 1.0;
    float _2469 = _2435 * _2453;
    float _2471 = -_2435;
    float _2473 = _2471 + 1.0;
    float _2475 = _2457 * _2283;
    float _2477 = _2457 * _2371;
    float _2479 = _2279 * _2467;
    float _2481 = _2313 * 6.283185482025146484375;
    float _2483 = cos(_2481);
    float _2485 = _2413 * _2473;
    float _2487 = -_2279;
    float _2489 = _2487 + 1.0;
    float _2491 = _2085 * _2479;
    float _2493 = _2087 * _2479;
    float _2495 = _2037 * _2485;
    float _2497 = _1945 + 0.5;
    float _2499 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2491);
    float _2501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2503 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2493);
    float _2505 = _2497 * _2461;
    float _2507 = fma(_2089, _2463, _2499);
    float _2509 = fma(_2135, _2027, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2511 = fma(_2091, _2463, _2503);
    float _2513 = _2215 + (-0.5);
    float _2515 = fma(_2185, _2027, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2519 = _2497 * _2483;
    float _2521 = -_2505;
    float _2523 = fma(_1559, _2483, _2521);
    float _2525 = -_2413;
    float _2527 = _2525 + 1.0;
    float _2529 = -_2475;
    float _2531 = fma(_1537, _2371, _2529);
    float _2533 = fma(_1559, _2461, _2519);
    float _2535 = _2201 + 0.5;
    float _2537 = fma(_2527, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2495);
    float _2539 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2543 = fma(_1537, _2283, _2477);
    float _2545 = fma(_2017, _2469, _2537);
    float _2547 = fma(_2539, _2535, _1975);
    float _2549 = fma(_2109, _2423, _2507);
    float _2551 = fma(_2117, _2423, _2511);
    float _2553 = fma(_2045, _2447, _2545);
    float _2555 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2559 = _2531 + 0.5;
    float _2561 = fma(_2131, _2449, _2549);
    float _2563 = -_2555;
    float _2565 = -_2081;
    float _2567 = fma(_2563, _2513, _2565);
    float _2569 = _2533 + (-0.5);
    float _2571 = fma(_2137, _2449, _2551);
    float _2573 = fma(_2039, _2455, _2553);
    float _2575 = -_2083;
    float _2577 = _2575 + 1.0;
    float _2579 = abs(_708);
    float _2581 = log2(_2579);
    float _2583 = _2541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2585 = _2543 + (-0.5);
    float _2587 = -_2071;
    float _2589 = _2587 + 1.0;
    float _2591 = -_1901;
    float _2593 = _2591 + 1.0;
    float _2595 = fma(_2509, _2385, _2561);
    float _2597 = -_2583;
    float _2599 = -_1969;
    float _2601 = fma(_2597, _2585, _2599);
    float _2603 = fma(_2515, _2385, _2571);
    float _2605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2607 = _2557 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2609 = fma(_2067, _2437, _2573);
    float _2611 = fma(_2215, _2577, _2567);
    float _2613 = fma(_2543, _2593, _2601);
    float _2615 = -_2607;
    float _2617 = -_2069;
    float _2619 = fma(_2615, _2569, _2617);
    float _2621 = -_1979;
    float _2623 = _2621 + 1.0;
    float _2625 = fma(_2147, _2345, _2595);
    float _2627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2629 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2631 = -_2623;
    float _2633 = fma(_2201, _2631, _2547);
    float _2635 = _2523 + 0.5;
    float _2637 = fma(_2151, _2345, _2603);
    float _2639 = fma(_2051, _2351, _2609);
    float _2641 = fma(_2167, _2341, _2625);
    float _2643 = exp2(_2629);
    float _2645 = _2605 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2647 = -_2111;
    float _2649 = _2647 + 1.0;
    float _2651 = -_2103;
    float _2653 = _2651 + 1.0;
    float _2655 = fma(_2169, _2341, _2637);
    float _2657 = fma(_2645, _2559, _1961);
    float _2659 = fma(_2327, _2343, _2639);
    float _2661 = fma(_2533, _2649, _2619);
    float _2663 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2665 = -_2589;
    float _2667 = fma(_2531, _2665, _2657);
    float _2669 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2641);
    float _2671 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2655);
    float _2673 = fma(_2663, _2635, _2115);
    float _2675 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2659);
    out.m_72.x = _2633;
    out.m_72.y = _2611;
    out.m_72.z = _2667;
    out.m_72.w = _2613;
    float _2677 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2679 = precise::clamp(_2677, 0.0, 1.0);
    float _2681 = -_2653;
    float _2683 = fma(_2523, _2681, _2673);
    out.m_74.x = _2669;
    out.m_74.y = _2671;
    out.m_76.x = _2683;
    out.m_76.y = _2661;
    out.m_78.x = _2675;
    float _2685 = fma(_2679, -2.0, 3.0);
    float _2687 = _2679 * _2679;
    bool _2689 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2691 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan(0.5);
    bool _2697 = _2693 || _2695;
    bool _2699 = _708 <= 8000.0;
    bool _2701 = isnan(_708);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(8000.0);
    bool _2707 = _2703 || _2705;
    float _2709 = float(_2707);
    float _2711 = _2687 * _2685;
    float _2713 = -_2711;
    float _2715 = _2713 + 1.0;
    float _2717 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _2721 = fma(_2715, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2711);
    float _2723 = fma(_272, _2719, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _2725 = _2709 * _2721;
    float _2727 = _1443 + _1252;
    float _2729 = _2727 * 0.5;
    float _2731 = _2727;
    float _2733 = _1298;
    if (_2697)
    {
        _2731 = 1.0;
    }
    float _2735 = _2731;
    float _2737 = _2735;
    if (!_2697)
    {
        float _2739 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2741 = _2739 * 0.15915493667125701904296875;
        float _2743 = _2741 * 6.283185482025146484375;
        float _2745 = cos(_2743);
        float _2747 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2749 = _2747 * 0.15915493667125701904296875;
        float _2751 = _2741 * 6.283185482025146484375;
        float _2753 = sin(_2751);
        float _2755 = 1.0 / _2745;
        float _2757 = _2749 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2753 * _2755;
        float _2763 = _2749 * 6.283185482025146484375;
        float _2765 = sin(_2763);
        float _2767 = _2759 * _2761;
        float _2769 = 1.0 / _2767;
        float _2771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2771;
        float _2775 = 1.0 / _2773;
        float _2777 = _2765 * _2769;
        float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2781 = fma(_708, _2777, _2779);
        float _2783 = _2781 * _2775;
        float _2785 = precise::clamp(_2783, 0.0, 1.0);
        _2737 = _2785;
    }
    float _2787 = _2737;
    float _2789 = exp2(_1409);
    out.m_80.z = _2729;
    out.m_80.w = _1252;
    float _2791 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2793 = -_1340;
    float _2795 = _2793 + 1.0;
    float _2797 = _302 * _400;
    float _2799 = _298 * _392;
    float _2801 = _300 * _394;
    float _2803 = _2795 * _2791;
    float _2805 = precise::clamp(_2803, 0.0, 1.0);
    out.gl_Position.x = _1298;
    out.gl_Position.y = _1302;
    out.gl_Position.z = _1443;
    out.gl_Position.w = _1252;
    float _2807 = _2723 * _2787;
    float _2809 = -_2797;
    float _2811 = fma(_300, _392, _2809);
    float _2813 = -_2799;
    float _2815 = fma(_302, _394, _2813);
    out.m_82.x = _616;
    out.m_82.y = _602;
    out.m_82.z = _628;
    float _2817 = -_2801;
    float _2819 = fma(_298, _400, _2817);
    float _2821 = -_2805;
    float _2823 = fma(_2821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2825 = -_2789;
    float _2827 = _2825 + 1.0;
    if (!_1232)
    {
        _1308 = 1.0;
    }
    float _2829 = _1308;
    float _2831 = _2829;
    if (_1232)
    {
        bool _2833 = _1376 >= _1280;
        bool _2835 = isnan(_1376);
        bool _2837 = _2833 || _2835;
        bool _2839 = isnan(_1280);
        bool _2841 = _2837 || _2839;
        float _2843 = float(_2841);
        _2831 = _2843;
    }
    float _2845 = _2831;
    float _2847 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2849 = _2847;
    float _2851 = _2845;
    if (_884)
    {
        _2733 = 1.0;
    }
    float _2853 = _2733;
    float _2855 = _2853;
    if (!_884)
    {
        int _2857 = _948 << 4;
        int _2859 = _2857 + 2048;
        uint _2861 = uint(int(uint(_2859) >> uint(2)));
        uint _2863 = uint(int(uint(int(_2861)) >> uint(2)));
        int _2865 = int(_2861) & 3;
        float _2867 = (*spvDescriptorSet0.vp_c15)._m0[int(_2863)][_2865];
        int _2869 = int(_2861) + 1;
        uint _2871 = uint(int(uint(_2869) >> uint(2)));
        int _2873 = _2869 & 3;
        float _2875 = (*spvDescriptorSet0.vp_c15)._m0[int(_2871)][_2873];
        int _2877 = _2859 + 8;
        uint _2879 = uint(int(uint(_2877) >> uint(2)));
        uint _2881 = uint(int(uint(int(_2879)) >> uint(2)));
        int _2883 = int(_2879) & 3;
        float _2885 = (*spvDescriptorSet0.vp_c15)._m0[int(_2881)][_2883];
        int _2887 = int(_2879) + 1;
        uint _2889 = uint(int(uint(_2887) >> uint(2)));
        int _2891 = _2887 & 3;
        float _2893 = (*spvDescriptorSet0.vp_c15)._m0[int(_2889)][_2891];
        float _2895 = _650 * _2875;
        float _2897 = fma(_2867, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2895);
        float _2899 = fma(_2885, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2897);
        float _2901 = _2899 + _2893;
        float _2903 = precise::clamp(_2901, 0.0, 1.0);
        float _2905 = -_2903;
        float _2907 = _2905 + _1368;
        float _2909 = fma(_2907, 500.0, 1.5);
        float _2911 = exp2(_2909);
        float _2913 = 0.0 + _2911;
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        _2855 = _2915;
        _1256 = 500.0;
    }
    float _2917 = _2855;
    float _2919 = _1256;
    float _2921 = _2847 * _1378;
    float _2923 = _2845 * _2917;
    float _2925 = -_2847;
    float _2927 = _2925 + 1.0;
    out.m_84.x = _2811;
    out.m_84.y = _2815;
    out.m_84.z = _2819;
    float _2929 = _1389 * _2921;
    float _2931 = -_2923;
    float _2933 = fma(_2931, _2823, 1.0);
    float _2935 = precise::clamp(_2933, 0.0, 1.0);
    float _2937 = _1399 * _2921;
    bool _2939 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2941 = isnan(_1052);
    bool _2943 = _2939 || _2941;
    bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2947 = _2943 || _2945;
    float _2949 = fma(_1395, _2929, _1383);
    float _2951 = fma(_1397, _2929, _1385);
    float _2953 = _2935 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2955 = _1389 * _2927;
    float _2957 = fma(_1389, _2937, _1387);
    float _2959 = _2807 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.x = _2953;
    out.m_88.x = _2949;
    out.m_88.y = _2951;
    out.m_88.z = _2957;
    out.m_88.w = _2955;
    float _2961 = _2919;
    float _2963 = _2927;
    float _2965 = _2935;
    if (!_2947)
    {
        _2849 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2967 = _2849;
    float _2969 = _2967;
    float _2971 = _2967;
    if (!_2947)
    {
        _758 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2973 = _758;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2947)
    {
        _2961 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2979 = _2961;
    float _2981 = _2979;
    float _2983 = _2979;
    if (!_2947)
    {
        _2963 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2985 = _2963;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2947)
    {
        _2851 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2991 = _2851;
    float _2993 = _2991;
    float _2995 = _2991;
    if (!_2947)
    {
        _2965 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2997 = _2965;
    bool _2999 = !_2947;
    float _3001 = _2997;
    float _3003 = _2997;
    if (!_2999)
    {
        bool _3005 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3007 = isnan(_1052);
        bool _3009 = _3005 || _3007;
        bool _3011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3013 = _3009 || _3011;
        if (!_3013)
        {
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3017 = _1052 + _3015;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3021 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3019;
            float _3023 = 1.0 / _3021;
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3045 = _3017 * _3023;
            float _3047 = precise::clamp(_3045, 0.0, 1.0);
            float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3053 = fma(_3047, _3027, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3055 = fma(_3047, _3051, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3057 = fma(_3047, _3031, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3059 = fma(_3047, _3035, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3061 = fma(_3047, _3039, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3063 = fma(_3047, _3043, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2977 = _3055;
            _2995 = _3061;
            _2971 = _3053;
            _2989 = _3059;
            _2983 = _3057;
            _3003 = _3063;
            _3065 = true;
        }
        else
        {
            bool _3067 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3069 = isnan(_1052);
            bool _3071 = _3067 || _3069;
            bool _3073 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3075 = _3071 || _3073;
            if (!_3075)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3077 = _2969;
            _2971 = _3077;
            if (!_3075)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3079 = _2975;
            _2977 = _3079;
            if (!_3075)
            {
                _2981 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3081 = _2981;
            _2983 = _3081;
            if (!_3075)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3083 = _2987;
            _2989 = _3083;
            if (!_3075)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3085 = _2993;
            _2995 = _3085;
            if (!_3075)
            {
                _3001 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3087 = _3001;
            bool _3089 = !_3075;
            _3003 = _3087;
            if (!_3089)
            {
                bool _3091 = _1052 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3093 = isnan(_1052);
                bool _3095 = _3091 || _3093;
                bool _3097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3099 = _3095 || _3097;
                if (!_3099)
                {
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3103 = _1052 + _3101;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3107 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3105;
                    float _3109 = 1.0 / _3107;
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3131 = _3103 * _3109;
                    float _3133 = precise::clamp(_3131, 0.0, 1.0);
                    float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3137 = _3135 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3139 = fma(_3133, _3113, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3141 = fma(_3133, _3137, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3143 = fma(_3133, _3117, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3145 = fma(_3133, _3121, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3147 = fma(_3133, _3125, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3149 = fma(_3133, _3129, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2977 = _3141;
                    _2995 = _3147;
                    _2971 = _3139;
                    _2989 = _3145;
                    _2983 = _3143;
                    _3003 = _3149;
                    _3065 = true;
                }
                else
                {
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2983 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3003 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3065 = false;
    float _3151 = _2977;
    float _3153 = _2995;
    float _3155 = _2971;
    float _3157 = _2989;
    float _3159 = _2983;
    float _3161 = _3003;
    float _3163 = fma(_2815, -0.5, 0.5);
    float _3165 = precise::clamp(_3163, 0.0, 1.0);
    float _3167 = -_3151;
    float _3169 = _3167 + _3153;
    float _3171 = -_3155;
    float _3173 = _3171 + _3157;
    float _3175 = -_3159;
    float _3177 = _3175 + _3161;
    bool _3179 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3181 = fma(_3165, _3169, _3151);
    float _3183 = fma(_3165, _3173, _3155);
    float _3185 = fma(_3165, _3177, _3159);
    float _3187 = _2959 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3189 = _3181 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _3191 = fma(_3183, 0.298911988735198974609375, _3189);
    out.m_92.x = _3187;
    float _3193 = fma(_3185, 0.114477999508380889892578125, _3191);
    float _3195 = -_3193;
    float _3197 = _3183 + _3195;
    float _3199 = -_3193;
    float _3201 = _3181 + _3199;
    float _3203 = -_3193;
    float _3205 = _3185 + _3203;
    float _3207 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3193);
    float _3209 = fma(_3201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3193);
    float _3211 = fma(_3205, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3193);
    out.m_94.x = _3207;
    out.m_94.y = _3209;
    out.m_94.z = _3211;
    if (!_3179)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3213 = -_576;
    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3217 = -_596;
    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3221 = -_580;
    float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3225 = _3215 * _3215;
    float _3227 = fma(_3219, _3219, _3225);
    float _3229 = fma(_3223, _3223, _3227);
    float _3231 = sqrt(_3229);
    float _3233 = rsqrt(_3229);
    float _3235 = -_3231;
    float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3239 = _3237 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3241 = precise::clamp(_3239, 0.0, 1.0);
    float _3243 = _3219 * _3233;
    float _3245 = _3215 * _3233;
    float _3247 = abs(_3241);
    float _3249 = log2(_3247);
    float _3251 = _3223 * _3233;
    float _3253 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3255 = _2815 * _3245;
    float _3257 = -_3245;
    float _3259 = -_3253;
    float _3261 = fma(_3257, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3259);
    float _3263 = fma(_2811, _3243, _3255);
    float _3265 = -_3251;
    float _3267 = fma(_3265, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3261);
    float _3269 = fma(_2819, _3251, _3263);
    float _3271 = precise::clamp(_3269, 0.0, 1.0);
    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3275 = _3267 + _3273;
    float _3277 = _3249 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3279 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = exp2(_3277);
    float _3285 = _3283 * _3281;
    float _3287 = _3271 * _3285;
    float _3289 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3291 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3293 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3289;
    out.m_90.y = _3291;
    out.m_90.z = _3293;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

