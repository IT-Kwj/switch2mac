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
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_92 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2911 = false;
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
    int _121 = _119 * 48;
    int _123 = _121 + 16;
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
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_148)];
    float _150 = as_type<float>(_dmw1.x);
    int _152 = _123 + 4;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw1.y);
    int _158 = _123 + 8;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>(_dmw1.z);
    int _164 = _123 + 12;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>(_dmw1.w);
    int _170 = as_type<int>(_108) & 2;
    bool _174 = _170 != 0;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _178 = _176 != 0;
    float _180 = _156 * _156;
    float _182 = fma(_150, _150, _180);
    float _184 = fma(_162, _162, _182);
    float _186 = rsqrt(_184);
    float _188 = _162 * _186;
    float _190 = _150 * _186;
    float _192 = _156 * _186;
    float _194 = _188 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _196 = _192 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _198 = -_194;
    float _200 = fma(_190, (*spvDescriptorSet0.vp_c8)._m0[28].z, _198);
    float _202 = _190 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _204 = -_196;
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c8)._m0[28].y, _204);
    float _208 = _200 * _200;
    float _210 = -_202;
    float _212 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[28].x, _210);
    float _214 = fma(_206, _206, _208);
    float _216 = fma(_212, _212, _214);
    float _218 = rsqrt(_216);
    bool _220 = !_174;
    float _222 = _220 ? 1.0 : (-1.0);
    float _224 = abs(_146);
    float _226 = _224 * _222;
    float _228 = _226 * 0.5;
    float _230 = _222;
    float _232 = _216;
    float _234 = _206;
    float _236 = _162;
    float _238 = _146;
    bool _240 = _174;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _244 = _168;
    if (_178)
    {
        _230 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _246 = _230;
    float _248 = _212 * _218;
    float _250 = _206 * _218;
    float _252 = -_228;
    float _254 = fma(_248, _252, _140);
    float _256 = -_228;
    float _258 = fma(_250, _256, _128);
    float _260 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _262 = _254 + _260;
    float _264 = _246;
    float _266 = _218;
    float _268 = _258;
    float _270 = _254;
    if (_178)
    {
        _232 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _272 = _232;
    float _274 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _276 = _258 + _274;
    float _278 = _272;
    if (_178)
    {
        float _280 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _282 = _246 + _280;
        _234 = _282;
    }
    float _284 = _234;
    float _286 = _262 * _262;
    float _288 = _286;
    if (_178)
    {
        _236 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _290 = _236;
    float _292 = _290;
    if (_178)
    {
        float _294 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _296 = _272 + _294;
        _278 = _296;
    }
    float _298 = _278;
    if (_178)
    {
        float _300 = _284 * _284;
        _264 = _300;
    }
    float _302 = _264;
    float _304 = fma(_276, _276, _286);
    float _306 = _302;
    if (_178)
    {
        float _308 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _310 = _290 + _308;
        _292 = _310;
    }
    float _312 = _292;
    if (_178)
    {
        float _314 = fma(_298, _298, _302);
        _288 = _314;
    }
    float _316 = _288;
    float _318 = sqrt(_304);
    float _320 = _316;
    if (_178)
    {
        float _322 = fma(_312, _312, _316);
        _238 = _322;
    }
    float _324 = _238;
    float _326 = _324;
    if (_178)
    {
        float _328 = rsqrt(_324);
        _326 = _328;
    }
    float _330 = _326;
    bool _332 = _318 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _334 = _200 * _218;
    if (!_178)
    {
        _320 = 0.0;
        _306 = 0.0;
    }
    float _336 = _320;
    float _338 = _306;
    float _340 = _336;
    float _342 = _338;
    if (!_178)
    {
        _266 = 0.0;
    }
    float _344 = _266;
    float _346 = -_228;
    float _348 = fma(_334, _346, _134);
    float _350 = 0.0;
    float _352 = _344;
    float _354 = _348;
    if (_178)
    {
        float _356 = _330 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _350 = _356;
    }
    float _358 = _350;
    if (_178)
    {
        float _360 = _298 * _358;
        _352 = _360;
    }
    float _362 = _352;
    if (_178)
    {
        float _364 = _284 * _358;
        _340 = _364;
    }
    float _366 = _340;
    if (_178)
    {
        float _368 = _312 * _358;
        _342 = _368;
    }
    float _370 = _342;
    bool _372 = !_332;
    if (!_372)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _378 = _318 + _376;
        float _380 = rsqrt(_304);
        float _382 = _378 * _374;
        float _384 = _348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = _382 * 0.15915493667125701904296875;
        float _388 = _386 * 6.283185482025146484375;
        float _390 = cos(_388);
        float _392 = _386 * 6.283185482025146484375;
        float _394 = sin(_392);
        float _396 = _390 + (-1.0);
        float _398 = _396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = fma(_394, _384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _402 = fma(_348, _390, _398);
        float _404 = _380 * _400;
        float _406 = fma(_276, _404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _408 = fma(_262, _404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _354 = _402;
        _268 = _406;
        _270 = _408;
    }
    float _410 = _354;
    float _412 = _268;
    float _414 = _270;
    float _416 = _134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _418 = _366 + _410;
    float _420 = _134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _422 = _134 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _424 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[1].x, _416);
    float _426 = _362 + _412;
    float _428 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[0].x, _420);
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _418 + _430;
    float _434 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _424);
    float _436 = _134 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _438 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[2].x, _422);
    float _440 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _428);
    float _442 = _434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _444 = _370 + _414;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _448 = _426 + _446;
    float _450 = _432 * _432;
    float _452 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[3].x, _436);
    float _454 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _438);
    float _456 = _440 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _458 = _442 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _462 = _444 + _460;
    float _464 = fma(_448, _448, _450);
    float _466 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _452);
    float _468 = _454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[7].x, _458);
    float _472 = fma(_462, _462, _464);
    float _474 = _466 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _476 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _470);
    float _478 = rsqrt(_472);
    float _480 = _442 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _482 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _476);
    float _484 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _486 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[6].x, _480);
    float _488 = 1.0 / _482;
    float _490 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _486);
    float _492 = _484 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _494 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _490);
    float _496 = _478 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _498 = _494 + _482;
    float _500 = sqrt(_472);
    float _502 = _448 * _496;
    float _504 = _462 * _496;
    float _506 = _498 * _488;
    float _508 = _506 * 0.5;
    float _510 = _502 * _502;
    float _512 = _504 * _504;
    float _514 = _492 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _518 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[30].w, _516);
    float _520 = _492 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _522 = _510 + _512;
    float _524 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _514);
    float _526 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _520);
    float _528 = 1.0 / _518;
    float _530 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _524);
    float _532 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _526);
    float _534 = _530 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _536 = _532 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _538 = sqrt(_522);
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _542 = _528 * _540;
    float _544 = trunc(_536);
    int _546 = int(_544);
    bool _548 = _542 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _550 = _542 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _552 = _538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _554 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _556 = _538 + _554;
    bool _558 = !_548;
    int _560 = _558 ? 0 : 1;
    float _562 = trunc(_534);
    int _564 = int(_562);
    int _566 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _568 = _546 + _566;
    int _570 = _568 + 1;
    int _572 = 2;
    float _574 = _522;
    float _576 = _556;
    float _578 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    int _580 = _570;
    float _582 = _510;
    if (!_548)
    {
        _572 = 1;
    }
    int _584 = _572;
    int _586 = _584;
    if (!_550)
    {
        _586 = _560;
    }
    int _588 = _586;
    float _590 = _140;
    if (_552)
    {
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _592;
    }
    float _594 = _590;
    int _596 = _588 << 6;
    float _598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _600 = _596 + 48;
    uint _602 = uint(int(uint(_600) >> uint(2)));
    uint _604 = uint(int(uint(int(_602)) >> uint(2)));
    int _606 = int(_602) & 3;
    float _608 = (*spvDescriptorSet0.vp_c15)._m0[int(_604)][_606];
    int _610 = int(_602) + 1;
    uint _612 = uint(int(uint(_610) >> uint(2)));
    int _614 = _610 & 3;
    float _616 = (*spvDescriptorSet0.vp_c15)._m0[int(_612)][_614];
    int _618 = _596;
    if (_552)
    {
        float _620 = rsqrt(_522);
        _574 = _620;
    }
    float _622 = _574;
    int _624 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _626 = _564 + _624;
    int _628 = _626 + 1;
    float _630 = precise::max(0.0, _598);
    bool _632 = _628 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _634 = _596 + 96;
    uint _636 = uint(int(uint(_634) >> uint(2)));
    uint _638 = uint(int(uint(int(_636)) >> uint(2)));
    int _640 = int(_636) & 3;
    float _642 = (*spvDescriptorSet0.vp_c15)._m0[int(_638)][_640];
    int _644 = int(_636) + 1;
    uint _646 = uint(int(uint(_644) >> uint(2)));
    int _648 = _644 & 3;
    float _650 = (*spvDescriptorSet0.vp_c15)._m0[int(_646)][_648];
    float _652 = _622;
    float _654 = as_type<float>(_628);
    if (_552)
    {
        float _656 = _556 * _594;
        _576 = _656;
    }
    float _658 = _576;
    float _660 = -_496;
    float _662 = -_630;
    float _664 = fma(_432, _660, _662);
    int _666 = _628 | _570;
    float _668 = 0.0;
    float _670 = as_type<float>(_666);
    if (_552)
    {
        float _672 = _658 * 0.15915493667125701904296875;
        _668 = _672;
    }
    float _674 = _668;
    float _676 = 0.0;
    if (_552)
    {
        float _678 = _664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _676 = _678;
    }
    float _680 = _676;
    int _682 = _596 + 56;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    uint _686 = uint(int(uint(int(_684)) >> uint(2)));
    int _688 = int(_684) & 3;
    float _690 = (*spvDescriptorSet0.vp_c15)._m0[int(_686)][_688];
    int _692 = int(_684) + 1;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    int _696 = _692 & 3;
    float _698 = (*spvDescriptorSet0.vp_c15)._m0[int(_694)][_696];
    float _700 = 0.0;
    float _702 = _680;
    if (_552)
    {
        float _704 = _674 * 6.283185482025146484375;
        float _706 = sin(_704);
        _700 = _706;
    }
    float _708 = _700;
    bool _710 = _666 < 0;
    bool _712 = _710 || _632;
    float _714 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_552)
    {
        _670 = _502;
    }
    float _716 = _670;
    bool _718 = _570 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _720 = _718 || _712;
    int _722 = _596 + 80;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c15)._m0[int(_726)][_728];
    int _732 = int(_724) + 1;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    int _736 = _732 & 3;
    float _738 = (*spvDescriptorSet0.vp_c15)._m0[int(_734)][_736];
    float _740 = 0.0;
    float _742 = _716;
    if (_552)
    {
        float _744 = _674 * 6.283185482025146484375;
        float _746 = cos(_744);
        _740 = _746;
    }
    float _748 = _740;
    int _750 = _596 + 104;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.vp_c15)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.vp_c15)._m0[int(_762)][_764];
    float _768 = _708;
    if (_552)
    {
        float _770 = fma(_708, _680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _702 = _770;
    }
    float _772 = _702;
    float _774 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _776 = floor(_714);
    float _778 = 0.0;
    float _780 = _772;
    int _782 = as_type<int>(_774);
    if (_552)
    {
        float _784 = _622 * _772;
        _778 = _784;
    }
    float _786 = _778;
    if (!_552)
    {
        _780 = _664;
    }
    float _788 = _780;
    int _790 = _596 + 88;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    uint _794 = uint(int(uint(int(_792)) >> uint(2)));
    int _796 = int(_792) & 3;
    float _798 = (*spvDescriptorSet0.vp_c15)._m0[int(_794)][_796];
    int _800 = int(_792) + 1;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    int _804 = _800 & 3;
    float _806 = (*spvDescriptorSet0.vp_c15)._m0[int(_802)][_804];
    float _808 = _788;
    float _810 = _748;
    if (_552)
    {
        float _812 = _748 + (-1.0);
        _768 = _812;
    }
    float _814 = _768;
    float _816 = _814;
    if (_552)
    {
        float _818 = _502 * _786;
        _742 = _818;
    }
    float _820 = _742;
    if (!_552)
    {
        _652 = _510;
    }
    float _822 = _652;
    float _824 = floor(_774);
    float _826 = _822;
    if (_552)
    {
        float _828 = _814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _578 = _828;
    }
    float _830 = _578;
    if (!_552)
    {
        _816 = _504;
    }
    float _832 = _816;
    float _834 = _832;
    if (_552)
    {
        float _836 = _504 * _786;
        _834 = _836;
    }
    float _838 = _834;
    int _840 = _596 + 64;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    uint _844 = uint(int(uint(int(_842)) >> uint(2)));
    int _846 = int(_842) & 3;
    float _848 = (*spvDescriptorSet0.vp_c15)._m0[int(_844)][_846];
    int _850 = int(_842) + 1;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    int _854 = _850 & 3;
    float _856 = (*spvDescriptorSet0.vp_c15)._m0[int(_852)][_854];
    if (_552)
    {
        float _858 = fma(_664, _748, _830);
        _808 = _858;
    }
    float _860 = _808;
    if (_552)
    {
        float _862 = _820 * _820;
        _826 = _862;
    }
    float _864 = _826;
    if (!_552)
    {
        _810 = _512;
    }
    float _866 = _810;
    float _868 = _866;
    if (_552)
    {
        float _870 = _838 * _838;
        _868 = _870;
    }
    float _872 = _868;
    float _874 = _492 * _616;
    float _876 = fma(_860, _860, _864);
    float _878 = -_776;
    float _880 = _714 + _878;
    int _882 = _596 + 72;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    uint _886 = uint(int(uint(int(_884)) >> uint(2)));
    int _888 = int(_884) & 3;
    float _890 = (*spvDescriptorSet0.vp_c15)._m0[int(_886)][_888];
    int _892 = int(_884) + 1;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    int _896 = _892 & 3;
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[int(_894)][_896];
    float _900 = _492 * _650;
    float _902 = _876 + _872;
    float _904 = fma(_608, (*spvDescriptorSet0.vp_c12)._m0[5].x, _874);
    float _906 = -_824;
    float _908 = _774 + _906;
    float _910 = fma(_642, (*spvDescriptorSet0.vp_c12)._m0[5].x, _900);
    float _912 = rsqrt(_902);
    float _914 = fma(_690, (*spvDescriptorSet0.vp_c12)._m0[5].z, _904);
    float _916 = _418 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _918 = as_type<int>(_872);
    float _920 = _908;
    if (!_720)
    {
        int _922 = _570 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _924 = _922 + _628;
        _618 = _924;
    }
    int _926 = _618;
    float _928 = _914 + _698;
    float _930 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].x, _916);
    float _932 = _492 * _738;
    if (!_720)
    {
        int _934 = _926 << 2;
        _580 = _934;
    }
    int _936 = _580;
    float _938 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _930);
    float _940 = as_type<float>(_936);
    if (!_720)
    {
        uint _942 = uint(int(uint(_926) >> uint(2)));
        _918 = int(_942);
    }
    int _944 = _918;
    float _946 = fma(_730, (*spvDescriptorSet0.vp_c12)._m0[5].x, _932);
    float _948 = as_type<float>(_944);
    if (!_720)
    {
        int _950 = 12 & _936;
        _782 = _950;
    }
    int _952 = _782;
    if (!_720)
    {
        float _954 = floor(_534);
        _654 = _954;
    }
    float _956 = _654;
    float _958 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[5].z, _910);
    float _960 = _912 * _860;
    if (!_720)
    {
        int _962 = _944 << 4;
        int _964 = _962 + _952;
        _948 = as_type<float>(_964);
    }
    float _966 = _948;
    float _968 = _912 * _838;
    float _970 = _958 + _766;
    float _972 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (!_720)
    {
        float _974 = floor(_536);
        _940 = _974;
    }
    float _976 = _940;
    float _978 = fma(_798, (*spvDescriptorSet0.vp_c12)._m0[5].z, _946);
    float _980 = _912 * _820;
    float _982 = _938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _984 = _966;
    if (!_720)
    {
        int _986 = as_type<int>(_966) + 400;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        uint _990 = uint(int(uint(int(_988)) >> uint(2)));
        int _992 = int(_988) & 3;
        float _994 = (*spvDescriptorSet0.vp_c15)._m0[int(_990)][_992];
        _984 = _994;
    }
    float _996 = _984;
    float _998 = _980 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1000 = 1.0 / _970;
    float _1002 = _982 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1004 = _492 * _856;
    float _1006 = -_998;
    float _1008 = fma(_960, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1006);
    float _1010 = -_1002;
    float _1012 = fma(_1010, _972, 1.0);
    float _1014 = fma(_848, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1004);
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1018 = fma(_500, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1016);
    float _1020 = precise::clamp(_1018, 0.0, 1.0);
    float _1022 = _418 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1024 = _418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1026 = fma(_890, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1014);
    float _1028 = -_1020;
    float _1030 = _1028 + 1.0;
    float _1032 = _418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1034 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1024);
    float _1036 = _1026 + _898;
    float _1038 = -_968;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1008);
    float _1042 = _928 * _1000;
    float _1044 = abs(_1030);
    float _1046 = log2(_1044);
    float _1048 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1032);
    float _1050 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1034);
    float _1052 = _1036 * _1000;
    bool _1054 = _1042 >= 0.0;
    float _1056 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1048);
    float _1058 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1060 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1022);
    bool _1062 = _1042 <= 1.0;
    bool _1064 = _1062 && _1054;
    float _1066 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1068 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1070 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1060);
    bool _1072 = _1052 >= 0.0;
    bool _1074 = _1072 && _1064;
    float _1076 = _1026;
    float _1078 = _996;
    float _1080 = _1042;
    if (!_720)
    {
        float _1082 = rint(_996);
        float _1084 = precise::max(_1082, 0.0);
        uint _1086 = uint(_1084);
        uint _1088 = clamp(_1086, 0u, 65535u);
        _1076 = as_type<float>(_1088);
    }
    float _1090 = _1076;
    float _1092 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1068);
    bool _1094 = _1052 <= 1.0;
    bool _1096 = _1094 && _1074;
    float _1098 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1100 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1102 = fma(_1040, -0.5, 0.5);
    float _1104 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1092);
    float _1106 = fma(_1040, 0.5, 0.5);
    float _1108 = _1090;
    if (!_720)
    {
        float _1110 = -_976;
        float _1112 = _536 + _1110;
        _1078 = _1112;
    }
    float _1114 = _1078;
    float _1116 = exp2(_1100);
    float _1118 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1104);
    float _1120 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1122 = _978 + _806;
    float _1124 = fma(_1106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1126 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1120);
    float _1128 = _960 + 1.0;
    float _1130 = sqrt(_1102);
    float _1132 = fma(_1106, _1124, -0.212114393711090087890625);
    float _1134 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1126);
    float _1136 = _1122 * _1000;
    float _1138 = fma(_1106, _1132, 1.570728778839111328125);
    float _1140 = log2(_1012);
    float _1142 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1144 = -_960;
    float _1146 = fma(_1116, _1128, _1144);
    float _1148 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1134);
    float _1150 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1142);
    float _1152 = _1142;
    float _1154 = _1118;
    if (_1096)
    {
        float _1156 = float(_588);
        _1152 = _1156;
    }
    float _1158 = _1152;
    float _1160 = fma(_1146, 0.5, 0.5);
    float _1162 = 1.0 / _1118;
    float _1164 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1150);
    float _1166 = _1130 * 0.636619746685028076171875;
    float _1168 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1164);
    float _1170 = _1164;
    float _1172 = _1168;
    if (!_720)
    {
        float _1174 = -_956;
        float _1176 = _534 + _1174;
        _1170 = _1176;
    }
    float _1178 = _1170;
    float _1180 = -_1138;
    float _1182 = fma(_1166, _1180, 1.0);
    float _1184 = _1158;
    if (_1096)
    {
        float _1186 = rint(_1158);
        float _1188 = precise::max(_1186, 0.0);
        uint _1190 = uint(_1188);
        uint _1192 = clamp(_1190, 0u, 65535u);
        _1184 = as_type<float>(_1192);
    }
    float _1194 = _1184;
    float _1196 = _1140 * 0.693147182464599609375;
    float2 _4957 = float2(_880, _908);
    float _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4957, float2(0.0), isnan(_4957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4957, float2(0.0), isnan(_4957)), level(0.0)).x;
    float _1200 = _1114;
    if (!_720)
    {
        float3 _4974 = float3(_1178, _1114, float(as_type<int>(_1090)));
        float3 _4978 = select(_4974, float3(0.0), isnan(_4974));
        float _1202 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4978.xy, uint(rint(_4978.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4978.xy, uint(rint(_4978.z)), level(0.0)).x;
        _1200 = _1202;
    }
    float _1204 = _1200;
    float _1206 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1208 = _1148 * _1162;
    float _1210 = _1168 * _1162;
    float _1212 = fma(_1208, 0.5, 0.5);
    float _1214 = fma(_1210, -0.5, 0.5);
    float _1216 = _1052;
    float _1218 = _1194;
    if (_1096)
    {
        float3 _5008 = float3(_1042, _1052, float(as_type<int>(_1194)));
        float3 _5010 = select(_5008, float3(0.0), isnan(_5008));
        float _1220 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5010.xy, uint(rint(_5010.z)), _1136, level(0.0));
        _1216 = _1220;
    }
    float _1222 = _1216;
    float3 _5020 = float3(_1212, _1214, _1206);
    float _1224 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5020, float3(0.0), isnan(_5020)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5020, float3(0.0), isnan(_5020)), level(0.0)).x;
    float3 _5029 = float3(_1212, _1214, _1206);
    float4 _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5029, float3(0.0), isnan(_5029)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5029, float3(0.0), isnan(_5029)), level(0.0)).xyzw;
    float _1229 = _1227.x;
    float _1231 = _1227.y;
    float _1233 = _1227.z;
    float _1235 = _1227.w;
    float2 _5045 = float2(_1182, _1160);
    float3 _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5045, float2(0.0), isnan(_5045)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5045, float2(0.0), isnan(_5045)), level(0.0)).xyz;
    float _1241 = _1239.x;
    float _1243 = _1239.y;
    float _1245 = _1239.z;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1249 = _1247 != 0;
    float _1251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1255 = _1253 != 0;
    out.m_68.x = _448;
    out.m_68.y = _432;
    out.m_68.z = _462;
    bool _1257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    bool _1259 = !_174;
    float _1261 = _1259 ? 0.0 : 1.0;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1265 = _1263 != 0;
    float _1267 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1269 = _1249;
    bool _1271 = _1257;
    if (_1249)
    {
        bool _1273 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _240 = _1273;
    }
    bool _1275 = _240;
    if (!_1255)
    {
        float _1277 = -_168;
        float _1279 = (-0.0) + _1277;
        _1218 = _1279;
    }
    float _1281 = _1218;
    float _1283 = _1281;
    if (!_1249)
    {
        _1267 = _1261;
    }
    float _1285 = _1267;
    float _1287 = _1162;
    float _1289 = _1285;
    if (_1257)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1287 = _1291;
    }
    float _1293 = _1287;
    if (_1249)
    {
        float _1295 = -_1261;
        float _1297 = _1275 ? _1295 : _1261;
        _1289 = _1297;
    }
    float _1299 = _1289;
    if (_1255)
    {
        bool _1301 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1269 = _1301;
    }
    bool _1303 = _1269;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1307 = _1305 != 0;
    bool _1309 = _1303;
    if (_1255)
    {
        float _1311 = -_168;
        float _1313 = _1303 ? _168 : _1311;
        _1283 = _1313;
    }
    float _1315 = _1283;
    if (!_1257)
    {
        float _1317 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _582 = _1317;
    }
    float _1319 = _582;
    if (_1257)
    {
        _1080 = (*spvDescriptorSet0.vp_c9)._m0[15].x;
    }
    float _1321 = _1080;
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1325 = _1323 != 0;
    float _1327 = _1321;
    if (_1257)
    {
        float _1329 = _1321 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1327 = _1329;
    }
    float _1331 = _1327;
    float _1333 = _1331;
    if (_1257)
    {
        _1108 = (*spvDescriptorSet0.vp_c9)._m0[14].x;
    }
    float _1335 = _1108;
    float _1337 = _1335;
    if (_1265)
    {
        bool _1339 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1309 = _1339;
    }
    bool _1341 = _1309;
    bool _1343 = _1341;
    if (!_1265)
    {
        _920 = _1261;
    }
    float _1345 = _920;
    float _1347 = _1345;
    if (_1257)
    {
        float _1349 = fma(_1331, _1335, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1337 = _1349;
    }
    float _1351 = _1337;
    float _1353 = _1351;
    if (_1265)
    {
        float _1355 = -_1261;
        float _1357 = _1341 ? _1355 : _1261;
        _1347 = _1357;
    }
    float _1359 = _1347;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1363 = _1361 != 0;
    if (_1257)
    {
        float _1365 = _1351 * _1293;
        _242 = _1365;
    }
    float _1367 = _242;
    float _1369 = _1367;
    if (_1307)
    {
        bool _1371 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1343 = _1371;
    }
    bool _1373 = _1343;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1379 = _1373;
    float _1381 = _1377;
    if (_1325)
    {
        _1353 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1383 = _1353;
    float _1385 = _1359 + (-0.5);
    float _1387 = 1.0 / _1377;
    if (!_1307)
    {
        _1333 = _1261;
    }
    float _1389 = _1333;
    float _1391 = _1389;
    if (_1307)
    {
        float _1393 = -_1261;
        float _1395 = _1373 ? _1393 : _1261;
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    if (_1325)
    {
        bool _1403 = _1383 > 0.5;
        _1379 = _1403;
    }
    bool _1405 = _1379;
    float _1407 = _1261;
    if (_1257)
    {
        float _1409 = floor(_1367);
        _1407 = _1409;
    }
    float _1411 = _1407;
    if (!_1325)
    {
        float _1413 = -_168;
        float _1415 = (-0.0) + _1413;
        _1381 = _1415;
    }
    float _1417 = _1381;
    float _1419 = _1417;
    if (_1325)
    {
        float _1421 = -_168;
        float _1423 = _1405 ? _168 : _1421;
        _1419 = _1423;
    }
    float _1425 = _1419;
    float _1427 = _1397 + (-0.5);
    bool _1429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1431 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1433 = 1.0 / _1401;
    out.m_70.w = _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1439 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan(0.5);
    bool _1447 = _1443 || _1445;
    float _1449 = _1431;
    if (_1257)
    {
        float _1451 = -_1411;
        float _1453 = _1367 + _1451;
        _1369 = _1453;
    }
    float _1455 = _1369;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1461 = _1455;
    if (!_1257)
    {
        float _1463 = _1319 * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1461 = _1463;
    }
    float _1465 = _1461;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1469 = _1467 != 0;
    float _1471 = 1.0 / _1437;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    if (_1429)
    {
        _1449 = (*spvDescriptorSet0.vp_c9)._m0[15].y;
    }
    float _1477 = _1449;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1481 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1483 = 0.0;
    float _1485 = _1477;
    if (_1429)
    {
        _1483 = (*spvDescriptorSet0.vp_c9)._m0[14].y;
    }
    float _1487 = _1483;
    float _1489 = 1.0 / _1459;
    if (_1429)
    {
        float _1491 = _1477 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1485 = _1491;
    }
    float _1493 = _1485;
    out.m_72.w = _1481;
    float _1495 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1479);
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1501 = _1493;
    if (_1429)
    {
        float _1503 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1501 = _1503;
    }
    float _1505 = _1501;
    float _1507 = _1487;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1511 = _1505;
    if (_1429)
    {
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    if (_1363)
    {
        bool _1521 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1271 = _1521;
    }
    bool _1523 = _1271;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1527;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1535 = 1.0 / _1519;
    float _1537 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1525);
    float _1539 = _1529 * _1433;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1541;
    float _1545 = _1533 * _1387;
    int _1547 = as_type<int>(_1535);
    if (!_1469)
    {
        _1509 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1549 = _1509;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1555 = _1543 * _1471;
    float _1557 = 1.0 / _1499;
    float _1559 = _1515;
    float _1561 = _1549;
    if (_1429)
    {
        float _1563 = _1505 * _1515;
        _1559 = _1563;
    }
    float _1565 = _1559;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[84].z;
    if (_1469)
    {
        _1561 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1571 = _1561;
    float _1573 = _1553 * _1489;
    if (!_1469)
    {
        _1511 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1575 = _1511;
    float _1577 = 1.0 / _1475;
    float _1579 = _1575;
    if (_1469)
    {
        _1579 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1581 = _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1587 = 0.0;
    float _1589 = _1581;
    if (_1429)
    {
        float _1591 = floor(_1565);
        _1587 = _1591;
    }
    float _1593 = _1587;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1599;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1605 = _1585 * _1557;
    float _1607 = _1557;
    float _1609 = _1603;
    if (!_1469)
    {
        _1607 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1611 = _1607;
    float _1613 = _1601 * _1535;
    float _1615 = _1611;
    if (_1469)
    {
        _1547 = 0;
    }
    int _1617 = _1547;
    float _1619 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1603);
    int _1621 = _1617;
    if (!_1469)
    {
        _1621 = 2;
    }
    int _1623 = _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1625;
    if (!_1469)
    {
        _1609 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1629 = _1609;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1635 = _1629;
    float _1637 = _1633;
    if (!_1469)
    {
        _1569 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1639 = _1569;
    float _1641 = _1597 * _1577;
    float _1643 = _1639;
    if (_1469)
    {
        _1615 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1645 = _1615;
    float _1647 = 1.0 / _1633;
    if (_1469)
    {
        _1635 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1649 = _1635;
    float _1651 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1653 = _1649;
    if (_1469)
    {
        _1643 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1655 = _1643;
    float _1657 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1567);
    bool _1659 = _1623 != 2;
    if (_1429)
    {
        float _1661 = -_1593;
        float _1663 = _1565 + _1661;
        _1589 = _1663;
    }
    float _1665 = _1589;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1669 = 0.0;
    float _1671 = _1665;
    if (!_1429)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _1669 = _1673;
    }
    float _1675 = _1669;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1667);
    float _1683 = -_1677;
    float _1685 = fma(_1651, 2.0, _1683);
    float _1687 = 1.0 / _1627;
    if (_1659)
    {
        _1637 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1689 = _1637;
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1693 = _1691 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1695 = _1689;
    if (!_1659)
    {
        _1695 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1697 = _1695;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1701 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1703 = _1697;
    if (!_1363)
    {
        float _1705 = -_168;
        float _1707 = (-0.0) + _1705;
        _1653 = _1707;
    }
    float _1709 = _1653;
    float _1711 = _1709;
    if (_1363)
    {
        float _1713 = -_168;
        float _1715 = _1523 ? _168 : _1713;
        _1711 = _1715;
    }
    float _1717 = _1711;
    float _1719 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1679);
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1721;
    if (_1659)
    {
        _1703 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1725 = _1703;
    float _1727 = 1.0 / _1693;
    float _1729 = _1725;
    if (!_1659)
    {
        _1729 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1731 = _1729;
    if (!_1429)
    {
        float _1733 = _1675 * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1671 = _1733;
    }
    float _1735 = _1671;
    if (_1659)
    {
        _244 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1737 = _244;
    float _1739 = _1737;
    if (!_1659)
    {
        _1739 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1741 = _1739;
    float _1743 = 1.0 / _1723;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1751 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1753 = isnan(_1465);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    bool _1763 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1765 = isnan(_1465);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = 1.0 / _1747;
    float _1777 = fma(_1701, -2.0, _1699);
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1779;
    float _1783 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1787 = _1465 + _1785;
    bool _1789 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1791 = isnan(_1465);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = 1.0 / _1781;
    float _1803 = _1787 * _1647;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1809 = _1735 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1811;
    float _1815 = -_1805;
    float _1817 = fma(_1783, 2.0, _1815);
    float _1819 = _1741 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1823 = _1465 + _1821;
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1827 = _1735 + _1825;
    float _1829 = fma(_1573, _1809, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1831 = fma(_1819, -2.0, _1749);
    float _1833 = _1823 * _1687;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1837 = _1465 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1841 = _1735 + _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1845 = _1465 + _1843;
    float _1847 = _1837 * _1743;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1851 = _1735 + _1849;
    float _1853 = 1.0 / _1813;
    float _1855 = fma(_1539, _1841, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1859 = _1735 + _1857;
    float _1861 = fma(_1545, _1851, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1865 = _1735 + _1863;
    float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1869 = _1465 + _1867;
    float _1871 = _1845 * _1801;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1873;
    float _1877 = fma(_1555, _1865, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1879 = fma(_1641, _1827, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1881 = fma(_1605, _1859, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1885 = _1465 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1889 = _1735 + _1887;
    float _1891 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1619);
    float _1893 = _1869 * _1727;
    float _1895 = _1885 * _1853;
    float _1897 = fma(_1613, _1889, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1899;
    float _1903 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1657);
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1909 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1685);
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1915 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1681);
    float _1917 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1777);
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1921 = _1465 + _1919;
    float _1923 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1495);
    float _1925 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1537);
    float _1927 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1719);
    float _1929 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1817);
    float _1931 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1831);
    float _1933 = fma(_1875, _1833, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1935 = fma(_1901, _1833, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1937 = fma(_1907, _1803, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1939 = fma(_1913, _1803, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1941 = _1891 * (-0.15915493667125701904296875);
    float _1943 = _1921 * _1775;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1949;
    float _1953 = _1941 * 6.283185482025146484375;
    float _1955 = sin(_1953);
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1957;
    float _1961 = fma(_1947, _1847, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1963 = fma(_1951, _1847, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1965;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _1977 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1979 = isnan(_1465);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = _1941 * 6.283185482025146484375;
    float _1991 = cos(_1989);
    float _1993 = fma(_1967, _1871, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1995 = fma(_1959, _1871, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2001 = fma(_1971, _1893, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2005 = _2003 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2007 = fma(_1975, _1893, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2009 = _1425 + 0.5;
    float _2011 = fma(_1999, _1943, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2013 = fma(_2005, _1943, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2015 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2017 = isnan(_1465);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2023 = _2019 || _2021;
    float _2025 = float(_2023);
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2027;
    float _2031 = _2009 * _1955;
    bool _2033 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2035 = isnan(_1465);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2041 = _2037 || _2039;
    float _2043 = float(_2041);
    float _2045 = _1927 * (-0.15915493667125701904296875);
    float _2047 = fma(_2029, _1895, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2049 = -_2031;
    float _2051 = fma(_1385, _1991, _2049);
    bool _2053 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2055 = isnan(_1465);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    float _2065 = _2009 * _1991;
    bool _2067 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2069 = isnan(_1465);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2075 = _2071 || _2073;
    float _2077 = float(_2075);
    float _2079 = _2045 * 6.283185482025146484375;
    float _2081 = sin(_2079);
    bool _2083 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2085 = isnan(_1735);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = -_2063;
    float _2097 = _2095 + 1.0;
    float _2099 = -_2077;
    float _2101 = _2099 + 1.0;
    bool _2103 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2105 = isnan(_1735);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = -_2093;
    float _2117 = _2115 + 1.0;
    float _2119 = _2077 * _2097;
    float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2121;
    bool _2125 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2127 = isnan(_1735);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = -_2113;
    float _2139 = _2137 + 1.0;
    float _2141 = _2113 * _2117;
    float _2143 = -_2043;
    float _2145 = _2143 + 1.0;
    float _2147 = _2043 * _2101;
    bool _2149 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2151 = isnan(_1735);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2157 = _2153 || _2155;
    float _2159 = float(_2157);
    float _2161 = _2135 * _2139;
    float _2163 = -_2135;
    float _2165 = _2163 + 1.0;
    float _2167 = _2025 * _2145;
    float _2169 = -_2025;
    float _2171 = _2169 + 1.0;
    bool _2173 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2175 = isnan(_1735);
    bool _2177 = _2173 || _2175;
    bool _2179 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2181 = _2177 || _2179;
    float _2183 = float(_2181);
    float _2185 = _2159 * _2165;
    float _2187 = -_2159;
    float _2189 = _2187 + 1.0;
    float _2191 = _1987 * _2171;
    bool _2193 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2195 = isnan(_1735);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = -_1987;
    float _2207 = _2205 + 1.0;
    float _2209 = -_2183;
    float _2211 = _2209 + 1.0;
    float _2213 = _2183 * _2189;
    float _2215 = -_1799;
    float _2217 = _2215 + 1.0;
    float _2219 = _1799 * _2207;
    float _2221 = _2203 * _2211;
    float _2223 = -_2203;
    float _2225 = _2223 + 1.0;
    float _2227 = _2045 * 6.283185482025146484375;
    float _2229 = cos(_2227);
    bool _2231 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2233 = isnan(_1735);
    bool _2235 = _2231 || _2233;
    bool _2237 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2239 = _2235 || _2237;
    float _2241 = float(_2239);
    float _2243 = fma(_1385, _1955, _2065);
    bool _2245 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2247 = isnan(_1735);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2253 = _2249 || _2251;
    float _2255 = float(_2253);
    float _2257 = _1773 * _2217;
    float _2259 = -_1773;
    float _2261 = _2259 + 1.0;
    float _2263 = _2241 * _2225;
    float _2265 = -_2241;
    float _2267 = _2265 + 1.0;
    float _2269 = _1717 + 0.5;
    float _2271 = _1761 * _2261;
    float _2273 = -_1761;
    float _2275 = _2273 + 1.0;
    float _2277 = _2255 * _2267;
    float _2279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2281 = _1933 * _2271;
    float _2283 = _1935 * _2271;
    float _2285 = _2269 * _2081;
    float _2287 = _2269 * _2229;
    float _2289 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2281);
    float _2291 = _1855 * _2277;
    float _2293 = -_2285;
    float _2295 = fma(_1427, _2229, _2293);
    float _2297 = -_2255;
    float _2299 = _2297 + 1.0;
    float _2301 = fma(_1937, _2257, _2289);
    float _2303 = fma(_1427, _2081, _2287);
    float _2305 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2283);
    float _2307 = _2051 + 0.5;
    float _2309 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2311 = fma(_2299, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2291);
    float _2313 = fma(_1939, _2257, _2305);
    float _2315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2317 = fma(_2309, _2307, _1909);
    float _2319 = fma(_1861, _2263, _2311);
    float _2321 = _2279 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2323 = _2295 + 0.5;
    float _2325 = fma(_2123, _1895, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2327 = fma(_1877, _2221, _2319);
    float _2329 = _2243 + (-0.5);
    float _2331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2333 = fma(_2321, _2323, _1929);
    float _2335 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2337 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2339 = fma(_1961, _2219, _2301);
    float _2341 = fma(_1963, _2219, _2313);
    float _2343 = fma(_1829, _2213, _2327);
    float _2345 = -_1903;
    float _2347 = _2345 + 1.0;
    float _2349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2351 = _2335 * _2315;
    float _2353 = fma(_2001, _2191, _2339);
    float _2355 = -_1915;
    float _2357 = _2355 + 1.0;
    float _2359 = fma(_2007, _2191, _2341);
    float _2361 = -_2347;
    float _2363 = fma(_2051, _2361, _2317);
    float _2365 = fma(_1993, _2167, _2353);
    float _2367 = fma(_1879, _2185, _2343);
    float _2369 = -_2337;
    float _2371 = fma(_2369, _2331, -0.0);
    float _2373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2375 = fma(_1995, _2167, _2359);
    float _2377 = fma(_2011, _2147, _2365);
    float _2379 = fma(_1881, _2161, _2367);
    float _2381 = -_1923;
    float _2383 = _2381 + 1.0;
    float _2385 = fma(_2013, _2147, _2375);
    float _2387 = fma(_2047, _2119, _2377);
    float _2389 = _2349 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2391 = abs(_542);
    float _2393 = log2(_2391);
    float _2395 = -_1925;
    float _2397 = _2395 + 1.0;
    float _2399 = fma(_2325, _2119, _2385);
    float _2401 = -_2389;
    float _2403 = -_1917;
    float _2405 = fma(_2401, _2329, _2403);
    float _2407 = _2303 + (-0.5);
    float _2409 = fma(_1897, _2141, _2379);
    float _2411 = _188 * _334;
    float _2413 = fma(_2243, _2357, _2405);
    float _2415 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2417 = -_2383;
    float _2419 = fma(_2295, _2417, _2333);
    float _2421 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2387);
    float _2423 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2399);
    out.m_74.x = _2351;
    out.m_74.y = _2371;
    out.m_74.z = _2363;
    out.m_74.w = _2413;
    float _2425 = -_2415;
    float _2427 = -_1931;
    float _2429 = fma(_2425, _2407, _2427);
    float _2431 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2409);
    float _2433 = -_2411;
    float _2435 = fma(_192, _248, _2433);
    float _2437 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2439 = _192 * _250;
    float _2441 = fma(_2303, _2397, _2429);
    out.m_76.x = _2421;
    out.m_76.y = _2423;
    float _2443 = exp2(_2437);
    out.m_78.x = _2419;
    out.m_78.y = _2441;
    float _2445 = _190 * _248;
    float _2447 = -_2439;
    float _2449 = fma(_190, _334, _2447);
    float _2451 = -_2445;
    float _2453 = fma(_188, _250, _2451);
    out.m_80.x = _2431;
    float _2455 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _2457 = _2453 * _2453;
    float _2459 = float(_117);
    float _2461 = 1.0 / _2455;
    float _2463 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2465 = fma(_2435, _2435, _2457);
    float _2467 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2469 = precise::clamp(_2467, 0.0, 1.0);
    float _2471 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2463);
    float _2473 = fma(_2449, _2449, _2465);
    float _2475 = fma(_2469, -2.0, 3.0);
    float _2477 = _2469 * _2469;
    float _2479 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _2481 = (*spvDescriptorSet0.vp_c12)._m0[1].y + _2479;
    float _2483 = rsqrt(_2473);
    float _2485 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2471);
    float _2487 = _2477 * _2475;
    float _2489 = _2459 * _2461;
    float _2491 = -_2487;
    float _2493 = _2491 + 1.0;
    float _2495 = fma(_2481, _2489, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _2497 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2487);
    float _2499 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2485);
    float _2501 = _2493;
    float _2503 = _2489;
    float _2505 = _2435;
    if (_1447)
    {
        _2501 = 1.0;
    }
    float _2507 = _2501;
    float _2509 = _2507;
    if (_1447)
    {
        _2503 = 1.0;
    }
    float _2511 = _2503;
    float _2513 = _2511;
    if (!_1447)
    {
        float _2515 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2517 = _2515 * 0.15915493667125701904296875;
        float _2519 = _2517 * 6.283185482025146484375;
        float _2521 = cos(_2519);
        float _2523 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2525 = _2523 * 0.15915493667125701904296875;
        float _2527 = _2517 * 6.283185482025146484375;
        float _2529 = sin(_2527);
        float _2531 = 1.0 / _2521;
        float _2533 = _2525 * 6.283185482025146484375;
        float _2535 = cos(_2533);
        float _2537 = _2529 * _2531;
        float _2539 = _2525 * 6.283185482025146484375;
        float _2541 = sin(_2539);
        float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2545 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2543;
        float _2547 = _2535 * _2537;
        float _2549 = 1.0 / _2545;
        float _2551 = 1.0 / _2547;
        float _2553 = _2541 * _2551;
        float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2557 = fma(_542, _2553, _2555);
        float _2559 = _2557 * _2549;
        float _2561 = precise::clamp(_2559, 0.0, 1.0);
        _2513 = _2561;
    }
    float _2563 = _2513;
    if (!_1447)
    {
        float _2565 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2567 = _2565 * 0.15915493667125701904296875;
        float _2569 = _2567 * 6.283185482025146484375;
        float _2571 = cos(_2569);
        float _2573 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2575 = _2573 * 0.15915493667125701904296875;
        float _2577 = _2567 * 6.283185482025146484375;
        float _2579 = sin(_2577);
        float _2581 = 1.0 / _2571;
        float _2583 = _2575 * 6.283185482025146484375;
        float _2585 = cos(_2583);
        float _2587 = _2579 * _2581;
        float _2589 = _2575 * 6.283185482025146484375;
        float _2591 = sin(_2589);
        float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2595 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2593;
        float _2597 = _2585 * _2587;
        float _2599 = 1.0 / _2595;
        float _2601 = 1.0 / _2597;
        float _2603 = _2591 * _2601;
        float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2607 = fma(_542, _2603, _2605);
        float _2609 = _2607 * _2599;
        float _2611 = precise::clamp(_2609, 0.0, 1.0);
        float _2613 = -_2611;
        float _2615 = _2613 + 1.0;
        _2509 = _2615;
    }
    float _2617 = _2509;
    float _2619 = _2499 + _1118;
    float _2621 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2623 = _2563 * _2617;
    float _2625 = _2619 * 0.5;
    bool _2627 = _542 <= 8000.0;
    bool _2629 = isnan(_542);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan(8000.0);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = _2453 * _2483;
    float _2641 = exp2(_2621);
    float _2643 = _2623 * _2495;
    out.m_82.z = _2625;
    out.m_82.w = _1118;
    float _2645 = _2637 * _2497;
    float _2647 = _2435 * _2483;
    float _2649 = _2449 * _2483;
    float _2651 = -_1198;
    float _2653 = _2651 + 1.0;
    float _2655 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2657 = _1148;
    float _2659 = _2655;
    if (!_1096)
    {
        _2505 = 1.0;
    }
    float _2661 = _2505;
    float _2663 = _2653 * _2655;
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = _2661;
    if (_1096)
    {
        bool _2669 = _1222 >= _1136;
        bool _2671 = isnan(_1222);
        bool _2673 = _2669 || _2671;
        bool _2675 = isnan(_1136);
        bool _2677 = _2673 || _2675;
        float _2679 = float(_2677);
        _2667 = _2679;
    }
    float _2681 = _2667;
    out.gl_Position.x = _1148;
    out.gl_Position.y = _1168;
    out.gl_Position.z = _2499;
    out.gl_Position.w = _1118;
    float _2683 = -_2665;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2687 = -_2641;
    float _2689 = _2687 + 1.0;
    float _2691 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2693 = _2681;
    if (_720)
    {
        _2657 = 1.0;
    }
    float _2695 = _2657;
    float _2697 = _2695;
    if (!_720)
    {
        int _2699 = _926 << 4;
        int _2701 = _2699 + 2048;
        uint _2703 = uint(int(uint(_2701) >> uint(2)));
        uint _2705 = uint(int(uint(int(_2703)) >> uint(2)));
        int _2707 = int(_2703) & 3;
        float _2709 = (*spvDescriptorSet0.vp_c15)._m0[int(_2705)][_2707];
        int _2711 = int(_2703) + 1;
        uint _2713 = uint(int(uint(_2711) >> uint(2)));
        int _2715 = _2711 & 3;
        float _2717 = (*spvDescriptorSet0.vp_c15)._m0[int(_2713)][_2715];
        int _2719 = _2701 + 8;
        uint _2721 = uint(int(uint(_2719) >> uint(2)));
        uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
        int _2725 = int(_2721) & 3;
        float _2727 = (*spvDescriptorSet0.vp_c15)._m0[int(_2723)][_2725];
        int _2729 = int(_2721) + 1;
        uint _2731 = uint(int(uint(_2729) >> uint(2)));
        int _2733 = _2729 & 3;
        float _2735 = (*spvDescriptorSet0.vp_c15)._m0[int(_2731)][_2733];
        float _2737 = _492 * _2717;
        float _2739 = fma(_2709, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2737);
        float _2741 = fma(_2727, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2739);
        float _2743 = _2741 + _2735;
        float _2745 = precise::clamp(_2743, 0.0, 1.0);
        float _2747 = -_2745;
        float _2749 = _2747 + _1204;
        float _2751 = fma(_2749, 500.0, 1.5);
        float _2753 = exp2(_2751);
        float _2755 = 0.0 + _2753;
        float _2757 = precise::clamp(_2755, 0.0, 1.0);
        _2697 = _2757;
        _2659 = _2727;
        _1172 = _2753;
    }
    float _2759 = _2697;
    float _2761 = _2659;
    float _2763 = _1172;
    float _2765 = _2691 * _1224;
    float _2767 = _2681 * _2759;
    float _2769 = -_2691;
    float _2771 = _2769 + 1.0;
    out.m_84.x = _2647;
    out.m_84.y = _2639;
    out.m_84.z = _2649;
    float _2773 = _1235 * _2765;
    float _2775 = -_2767;
    float _2777 = fma(_2775, _2685, 1.0);
    float _2779 = precise::clamp(_2777, 0.0, 1.0);
    float _2781 = _1245 * _2765;
    bool _2783 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2785 = isnan(_500);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2791 = _2787 || _2789;
    float _2793 = fma(_1241, _2773, _1229);
    float _2795 = fma(_1243, _2773, _1231);
    float _2797 = _2779 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2799 = _1235 * _2771;
    float _2801 = fma(_1235, _2781, _1233);
    float _2803 = _2643 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.x = _2797;
    out.m_88.x = _2793;
    out.m_88.y = _2795;
    out.m_88.z = _2801;
    out.m_88.w = _2799;
    float _2805 = _2761;
    float _2807 = _2771;
    float _2809 = _2763;
    float _2811 = _2779;
    if (!_2791)
    {
        _2693 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2813 = _2693;
    float _2815 = _2813;
    float _2817 = _2813;
    if (!_2791)
    {
        _2805 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2819 = _2805;
    float _2821 = _2819;
    float _2823 = _2819;
    if (!_2791)
    {
        _1154 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2825 = _1154;
    float _2827 = _2825;
    float _2829 = _2825;
    if (!_2791)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2831 = _2807;
    float _2833 = _2831;
    float _2835 = _2831;
    if (!_2791)
    {
        _2809 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2837 = _2809;
    float _2839 = _2837;
    float _2841 = _2837;
    if (!_2791)
    {
        _2811 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2843 = _2811;
    bool _2845 = !_2791;
    float _2847 = _2843;
    float _2849 = _2843;
    if (!_2845)
    {
        bool _2851 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2853 = isnan(_500);
        bool _2855 = _2851 || _2853;
        bool _2857 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2859 = _2855 || _2857;
        if (!_2859)
        {
            float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2863 = _500 + _2861;
            float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2867 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2865;
            float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2873 = 1.0 / _2867;
            float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2891 = _2863 * _2873;
            float _2893 = precise::clamp(_2891, 0.0, 1.0);
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2899 = fma(_2893, _2871, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2901 = fma(_2893, _2897, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2903 = fma(_2893, _2877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2905 = fma(_2893, _2881, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2907 = fma(_2893, _2885, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2909 = fma(_2893, _2889, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2823 = _2903;
            _2841 = _2907;
            _2817 = _2899;
            _2835 = _2905;
            _2829 = _2901;
            _2849 = _2909;
            _2911 = true;
        }
        else
        {
            bool _2913 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2915 = isnan(_500);
            bool _2917 = _2913 || _2915;
            bool _2919 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2921 = _2917 || _2919;
            if (!_2921)
            {
                _2815 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2923 = _2815;
            _2817 = _2923;
            if (!_2921)
            {
                _2821 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2925 = _2821;
            _2823 = _2925;
            if (!_2921)
            {
                _2827 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2927 = _2827;
            _2829 = _2927;
            if (!_2921)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2929 = _2833;
            _2835 = _2929;
            if (!_2921)
            {
                _2839 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2931 = _2839;
            _2841 = _2931;
            if (!_2921)
            {
                _2847 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2933 = _2847;
            bool _2935 = !_2921;
            _2849 = _2933;
            if (!_2935)
            {
                bool _2937 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2939 = isnan(_500);
                bool _2941 = _2937 || _2939;
                bool _2943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2945 = _2941 || _2943;
                if (!_2945)
                {
                    float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2949 = _500 + _2947;
                    float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2953 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2951;
                    float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2959 = 1.0 / _2953;
                    float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2971 = _2969 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2977 = _2949 * _2959;
                    float _2979 = precise::clamp(_2977, 0.0, 1.0);
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2985 = fma(_2979, _2957, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2987 = fma(_2979, _2983, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2989 = fma(_2979, _2963, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2991 = fma(_2979, _2967, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2993 = fma(_2979, _2971, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2995 = fma(_2979, _2975, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2823 = _2989;
                    _2841 = _2993;
                    _2817 = _2985;
                    _2835 = _2991;
                    _2829 = _2987;
                    _2849 = _2995;
                    _2911 = true;
                }
                else
                {
                    _2823 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2841 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2817 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2829 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2849 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2911 = false;
    float _2997 = _2823;
    float _2999 = _2841;
    float _3001 = _2817;
    float _3003 = _2835;
    float _3005 = _2829;
    float _3007 = _2849;
    float _3009 = fma(_2639, -0.5, 0.5);
    float _3011 = precise::clamp(_3009, 0.0, 1.0);
    float _3013 = -_2997;
    float _3015 = _3013 + _2999;
    float _3017 = -_3001;
    float _3019 = _3017 + _3003;
    float _3021 = -_3005;
    float _3023 = _3021 + _3007;
    bool _3025 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3027 = fma(_3011, _3015, _2997);
    float _3029 = fma(_3011, _3019, _3001);
    float _3031 = fma(_3011, _3023, _3005);
    float _3033 = _2803 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3035 = _3027 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _3037 = fma(_3029, 0.298911988735198974609375, _3035);
    out.m_92.x = _3033;
    float _3039 = fma(_3031, 0.114477999508380889892578125, _3037);
    float _3041 = -_3039;
    float _3043 = _3029 + _3041;
    float _3045 = -_3039;
    float _3047 = _3027 + _3045;
    float _3049 = -_3039;
    float _3051 = _3031 + _3049;
    float _3053 = fma(_3043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3039);
    float _3055 = fma(_3047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3039);
    float _3057 = fma(_3051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3039);
    out.m_94.x = _3053;
    out.m_94.y = _3055;
    out.m_94.z = _3057;
    if (!_3025)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3059 = -_418;
    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3063 = -_426;
    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3067 = -_444;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3071 = _3061 * _3061;
    float _3073 = fma(_3065, _3065, _3071);
    float _3075 = fma(_3069, _3069, _3073);
    float _3077 = sqrt(_3075);
    float _3079 = rsqrt(_3075);
    float _3081 = -_3077;
    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3085 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = _3065 * _3079;
    float _3091 = _3061 * _3079;
    float _3093 = abs(_3087);
    float _3095 = log2(_3093);
    float _3097 = _3069 * _3079;
    float _3099 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3101 = _2639 * _3091;
    float _3103 = -_3091;
    float _3105 = -_3099;
    float _3107 = fma(_3103, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3105);
    float _3109 = fma(_2647, _3089, _3101);
    float _3111 = -_3097;
    float _3113 = fma(_3111, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3107);
    float _3115 = fma(_2649, _3097, _3109);
    float _3117 = precise::clamp(_3115, 0.0, 1.0);
    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3121 = _3113 + _3119;
    float _3123 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3125 = _3121 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3127 = precise::clamp(_3125, 0.0, 1.0);
    float _3129 = exp2(_3123);
    float _3131 = _3129 * _3127;
    float _3133 = _3117 * _3131;
    float _3135 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3137 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3139 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3135;
    out.m_90.y = _3137;
    out.m_90.z = _3139;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2911 = false;
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
    int _121 = _119 * 48;
    int _123 = _121 + 16;
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
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_148)];
    float _150 = as_type<float>(_dmw1.x);
    int _152 = _123 + 4;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw1.y);
    int _158 = _123 + 8;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>(_dmw1.z);
    int _164 = _123 + 12;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>(_dmw1.w);
    int _170 = as_type<int>(_108) & 2;
    bool _174 = _170 != 0;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _178 = _176 != 0;
    float _180 = _156 * _156;
    float _182 = fma(_150, _150, _180);
    float _184 = fma(_162, _162, _182);
    float _186 = rsqrt(_184);
    float _188 = _162 * _186;
    float _190 = _150 * _186;
    float _192 = _156 * _186;
    float _194 = _188 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _196 = _192 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _198 = -_194;
    float _200 = fma(_190, (*spvDescriptorSet0.vp_c8)._m0[28].z, _198);
    float _202 = _190 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _204 = -_196;
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c8)._m0[28].y, _204);
    float _208 = _200 * _200;
    float _210 = -_202;
    float _212 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[28].x, _210);
    float _214 = fma(_206, _206, _208);
    float _216 = fma(_212, _212, _214);
    float _218 = rsqrt(_216);
    bool _220 = !_174;
    float _222 = _220 ? 1.0 : (-1.0);
    float _224 = abs(_146);
    float _226 = _224 * _222;
    float _228 = _226 * 0.5;
    float _230 = _222;
    float _232 = _216;
    float _234 = _206;
    float _236 = _162;
    float _238 = _146;
    bool _240 = _174;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _244 = _168;
    if (_178)
    {
        _230 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _246 = _230;
    float _248 = _212 * _218;
    float _250 = _206 * _218;
    float _252 = -_228;
    float _254 = fma(_248, _252, _140);
    float _256 = -_228;
    float _258 = fma(_250, _256, _128);
    float _260 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _262 = _254 + _260;
    float _264 = _246;
    float _266 = _218;
    float _268 = _258;
    float _270 = _254;
    if (_178)
    {
        _232 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _272 = _232;
    float _274 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _276 = _258 + _274;
    float _278 = _272;
    if (_178)
    {
        float _280 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _282 = _246 + _280;
        _234 = _282;
    }
    float _284 = _234;
    float _286 = _262 * _262;
    float _288 = _286;
    if (_178)
    {
        _236 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _290 = _236;
    float _292 = _290;
    if (_178)
    {
        float _294 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _296 = _272 + _294;
        _278 = _296;
    }
    float _298 = _278;
    if (_178)
    {
        float _300 = _284 * _284;
        _264 = _300;
    }
    float _302 = _264;
    float _304 = fma(_276, _276, _286);
    float _306 = _302;
    if (_178)
    {
        float _308 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _310 = _290 + _308;
        _292 = _310;
    }
    float _312 = _292;
    if (_178)
    {
        float _314 = fma(_298, _298, _302);
        _288 = _314;
    }
    float _316 = _288;
    float _318 = sqrt(_304);
    float _320 = _316;
    if (_178)
    {
        float _322 = fma(_312, _312, _316);
        _238 = _322;
    }
    float _324 = _238;
    float _326 = _324;
    if (_178)
    {
        float _328 = rsqrt(_324);
        _326 = _328;
    }
    float _330 = _326;
    bool _332 = _318 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _334 = _200 * _218;
    if (!_178)
    {
        _320 = 0.0;
        _306 = 0.0;
    }
    float _336 = _320;
    float _338 = _306;
    float _340 = _336;
    float _342 = _338;
    if (!_178)
    {
        _266 = 0.0;
    }
    float _344 = _266;
    float _346 = -_228;
    float _348 = fma(_334, _346, _134);
    float _350 = 0.0;
    float _352 = _344;
    float _354 = _348;
    if (_178)
    {
        float _356 = _330 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _350 = _356;
    }
    float _358 = _350;
    if (_178)
    {
        float _360 = _298 * _358;
        _352 = _360;
    }
    float _362 = _352;
    if (_178)
    {
        float _364 = _284 * _358;
        _340 = _364;
    }
    float _366 = _340;
    if (_178)
    {
        float _368 = _312 * _358;
        _342 = _368;
    }
    float _370 = _342;
    bool _372 = !_332;
    if (!_372)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _378 = _318 + _376;
        float _380 = rsqrt(_304);
        float _382 = _378 * _374;
        float _384 = _348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = _382 * 0.15915493667125701904296875;
        float _388 = _386 * 6.283185482025146484375;
        float _390 = cos(_388);
        float _392 = _386 * 6.283185482025146484375;
        float _394 = sin(_392);
        float _396 = _390 + (-1.0);
        float _398 = _396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = fma(_394, _384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _402 = fma(_348, _390, _398);
        float _404 = _380 * _400;
        float _406 = fma(_276, _404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _408 = fma(_262, _404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _354 = _402;
        _268 = _406;
        _270 = _408;
    }
    float _410 = _354;
    float _412 = _268;
    float _414 = _270;
    float _416 = _134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _418 = _366 + _410;
    float _420 = _134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _422 = _134 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _424 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[1].x, _416);
    float _426 = _362 + _412;
    float _428 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[0].x, _420);
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _418 + _430;
    float _434 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _424);
    float _436 = _134 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _438 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[2].x, _422);
    float _440 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _428);
    float _442 = _434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _444 = _370 + _414;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _448 = _426 + _446;
    float _450 = _432 * _432;
    float _452 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[3].x, _436);
    float _454 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _438);
    float _456 = _440 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _458 = _442 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _462 = _444 + _460;
    float _464 = fma(_448, _448, _450);
    float _466 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _452);
    float _468 = _454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[7].x, _458);
    float _472 = fma(_462, _462, _464);
    float _474 = _466 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _476 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _470);
    float _478 = rsqrt(_472);
    float _480 = _442 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _482 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _476);
    float _484 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _486 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[6].x, _480);
    float _488 = 1.0 / _482;
    float _490 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _486);
    float _492 = _484 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _494 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _490);
    float _496 = _478 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _498 = _494 + _482;
    float _500 = sqrt(_472);
    float _502 = _448 * _496;
    float _504 = _462 * _496;
    float _506 = _498 * _488;
    float _508 = _506 * 0.5;
    float _510 = _502 * _502;
    float _512 = _504 * _504;
    float _514 = _492 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _518 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[30].w, _516);
    float _520 = _492 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _522 = _510 + _512;
    float _524 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _514);
    float _526 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _520);
    float _528 = 1.0 / _518;
    float _530 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _524);
    float _532 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _526);
    float _534 = _530 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _536 = _532 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _538 = sqrt(_522);
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _542 = _528 * _540;
    float _544 = trunc(_536);
    int _546 = int(_544);
    bool _548 = _542 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _550 = _542 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _552 = _538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _554 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _556 = _538 + _554;
    bool _558 = !_548;
    int _560 = _558 ? 0 : 1;
    float _562 = trunc(_534);
    int _564 = int(_562);
    int _566 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _568 = _546 + _566;
    int _570 = _568 + 1;
    int _572 = 2;
    float _574 = _522;
    float _576 = _556;
    float _578 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    int _580 = _570;
    float _582 = _510;
    if (!_548)
    {
        _572 = 1;
    }
    int _584 = _572;
    int _586 = _584;
    if (!_550)
    {
        _586 = _560;
    }
    int _588 = _586;
    float _590 = _140;
    if (_552)
    {
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _592;
    }
    float _594 = _590;
    int _596 = _588 << 6;
    float _598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _600 = _596 + 48;
    uint _602 = uint(int(uint(_600) >> uint(2)));
    uint _604 = uint(int(uint(int(_602)) >> uint(2)));
    int _606 = int(_602) & 3;
    float _608 = (*spvDescriptorSet0.vp_c15)._m0[int(_604)][_606];
    int _610 = int(_602) + 1;
    uint _612 = uint(int(uint(_610) >> uint(2)));
    int _614 = _610 & 3;
    float _616 = (*spvDescriptorSet0.vp_c15)._m0[int(_612)][_614];
    int _618 = _596;
    if (_552)
    {
        float _620 = rsqrt(_522);
        _574 = _620;
    }
    float _622 = _574;
    int _624 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _626 = _564 + _624;
    int _628 = _626 + 1;
    float _630 = precise::max(0.0, _598);
    bool _632 = _628 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _634 = _596 + 96;
    uint _636 = uint(int(uint(_634) >> uint(2)));
    uint _638 = uint(int(uint(int(_636)) >> uint(2)));
    int _640 = int(_636) & 3;
    float _642 = (*spvDescriptorSet0.vp_c15)._m0[int(_638)][_640];
    int _644 = int(_636) + 1;
    uint _646 = uint(int(uint(_644) >> uint(2)));
    int _648 = _644 & 3;
    float _650 = (*spvDescriptorSet0.vp_c15)._m0[int(_646)][_648];
    float _652 = _622;
    float _654 = as_type<float>(_628);
    if (_552)
    {
        float _656 = _556 * _594;
        _576 = _656;
    }
    float _658 = _576;
    float _660 = -_496;
    float _662 = -_630;
    float _664 = fma(_432, _660, _662);
    int _666 = _628 | _570;
    float _668 = 0.0;
    float _670 = as_type<float>(_666);
    if (_552)
    {
        float _672 = _658 * 0.15915493667125701904296875;
        _668 = _672;
    }
    float _674 = _668;
    float _676 = 0.0;
    if (_552)
    {
        float _678 = _664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _676 = _678;
    }
    float _680 = _676;
    int _682 = _596 + 56;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    uint _686 = uint(int(uint(int(_684)) >> uint(2)));
    int _688 = int(_684) & 3;
    float _690 = (*spvDescriptorSet0.vp_c15)._m0[int(_686)][_688];
    int _692 = int(_684) + 1;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    int _696 = _692 & 3;
    float _698 = (*spvDescriptorSet0.vp_c15)._m0[int(_694)][_696];
    float _700 = 0.0;
    float _702 = _680;
    if (_552)
    {
        float _704 = _674 * 6.283185482025146484375;
        float _706 = sin(_704);
        _700 = _706;
    }
    float _708 = _700;
    bool _710 = _666 < 0;
    bool _712 = _710 || _632;
    float _714 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_552)
    {
        _670 = _502;
    }
    float _716 = _670;
    bool _718 = _570 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _720 = _718 || _712;
    int _722 = _596 + 80;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c15)._m0[int(_726)][_728];
    int _732 = int(_724) + 1;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    int _736 = _732 & 3;
    float _738 = (*spvDescriptorSet0.vp_c15)._m0[int(_734)][_736];
    float _740 = 0.0;
    float _742 = _716;
    if (_552)
    {
        float _744 = _674 * 6.283185482025146484375;
        float _746 = cos(_744);
        _740 = _746;
    }
    float _748 = _740;
    int _750 = _596 + 104;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.vp_c15)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.vp_c15)._m0[int(_762)][_764];
    float _768 = _708;
    if (_552)
    {
        float _770 = fma(_708, _680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _702 = _770;
    }
    float _772 = _702;
    float _774 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _776 = floor(_714);
    float _778 = 0.0;
    float _780 = _772;
    int _782 = as_type<int>(_774);
    if (_552)
    {
        float _784 = _622 * _772;
        _778 = _784;
    }
    float _786 = _778;
    if (!_552)
    {
        _780 = _664;
    }
    float _788 = _780;
    int _790 = _596 + 88;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    uint _794 = uint(int(uint(int(_792)) >> uint(2)));
    int _796 = int(_792) & 3;
    float _798 = (*spvDescriptorSet0.vp_c15)._m0[int(_794)][_796];
    int _800 = int(_792) + 1;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    int _804 = _800 & 3;
    float _806 = (*spvDescriptorSet0.vp_c15)._m0[int(_802)][_804];
    float _808 = _788;
    float _810 = _748;
    if (_552)
    {
        float _812 = _748 + (-1.0);
        _768 = _812;
    }
    float _814 = _768;
    float _816 = _814;
    if (_552)
    {
        float _818 = _502 * _786;
        _742 = _818;
    }
    float _820 = _742;
    if (!_552)
    {
        _652 = _510;
    }
    float _822 = _652;
    float _824 = floor(_774);
    float _826 = _822;
    if (_552)
    {
        float _828 = _814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _578 = _828;
    }
    float _830 = _578;
    if (!_552)
    {
        _816 = _504;
    }
    float _832 = _816;
    float _834 = _832;
    if (_552)
    {
        float _836 = _504 * _786;
        _834 = _836;
    }
    float _838 = _834;
    int _840 = _596 + 64;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    uint _844 = uint(int(uint(int(_842)) >> uint(2)));
    int _846 = int(_842) & 3;
    float _848 = (*spvDescriptorSet0.vp_c15)._m0[int(_844)][_846];
    int _850 = int(_842) + 1;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    int _854 = _850 & 3;
    float _856 = (*spvDescriptorSet0.vp_c15)._m0[int(_852)][_854];
    if (_552)
    {
        float _858 = fma(_664, _748, _830);
        _808 = _858;
    }
    float _860 = _808;
    if (_552)
    {
        float _862 = _820 * _820;
        _826 = _862;
    }
    float _864 = _826;
    if (!_552)
    {
        _810 = _512;
    }
    float _866 = _810;
    float _868 = _866;
    if (_552)
    {
        float _870 = _838 * _838;
        _868 = _870;
    }
    float _872 = _868;
    float _874 = _492 * _616;
    float _876 = fma(_860, _860, _864);
    float _878 = -_776;
    float _880 = _714 + _878;
    int _882 = _596 + 72;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    uint _886 = uint(int(uint(int(_884)) >> uint(2)));
    int _888 = int(_884) & 3;
    float _890 = (*spvDescriptorSet0.vp_c15)._m0[int(_886)][_888];
    int _892 = int(_884) + 1;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    int _896 = _892 & 3;
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[int(_894)][_896];
    float _900 = _492 * _650;
    float _902 = _876 + _872;
    float _904 = fma(_608, (*spvDescriptorSet0.vp_c12)._m0[5].x, _874);
    float _906 = -_824;
    float _908 = _774 + _906;
    float _910 = fma(_642, (*spvDescriptorSet0.vp_c12)._m0[5].x, _900);
    float _912 = rsqrt(_902);
    float _914 = fma(_690, (*spvDescriptorSet0.vp_c12)._m0[5].z, _904);
    float _916 = _418 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _918 = as_type<int>(_872);
    float _920 = _908;
    if (!_720)
    {
        int _922 = _570 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _924 = _922 + _628;
        _618 = _924;
    }
    int _926 = _618;
    float _928 = _914 + _698;
    float _930 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].x, _916);
    float _932 = _492 * _738;
    if (!_720)
    {
        int _934 = _926 << 2;
        _580 = _934;
    }
    int _936 = _580;
    float _938 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _930);
    float _940 = as_type<float>(_936);
    if (!_720)
    {
        uint _942 = uint(int(uint(_926) >> uint(2)));
        _918 = int(_942);
    }
    int _944 = _918;
    float _946 = fma(_730, (*spvDescriptorSet0.vp_c12)._m0[5].x, _932);
    float _948 = as_type<float>(_944);
    if (!_720)
    {
        int _950 = 12 & _936;
        _782 = _950;
    }
    int _952 = _782;
    if (!_720)
    {
        float _954 = floor(_534);
        _654 = _954;
    }
    float _956 = _654;
    float _958 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[5].z, _910);
    float _960 = _912 * _860;
    if (!_720)
    {
        int _962 = _944 << 4;
        int _964 = _962 + _952;
        _948 = as_type<float>(_964);
    }
    float _966 = _948;
    float _968 = _912 * _838;
    float _970 = _958 + _766;
    float _972 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (!_720)
    {
        float _974 = floor(_536);
        _940 = _974;
    }
    float _976 = _940;
    float _978 = fma(_798, (*spvDescriptorSet0.vp_c12)._m0[5].z, _946);
    float _980 = _912 * _820;
    float _982 = _938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _984 = _966;
    if (!_720)
    {
        int _986 = as_type<int>(_966) + 400;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        uint _990 = uint(int(uint(int(_988)) >> uint(2)));
        int _992 = int(_988) & 3;
        float _994 = (*spvDescriptorSet0.vp_c15)._m0[int(_990)][_992];
        _984 = _994;
    }
    float _996 = _984;
    float _998 = _980 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1000 = 1.0 / _970;
    float _1002 = _982 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1004 = _492 * _856;
    float _1006 = -_998;
    float _1008 = fma(_960, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1006);
    float _1010 = -_1002;
    float _1012 = fma(_1010, _972, 1.0);
    float _1014 = fma(_848, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1004);
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1018 = fma(_500, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1016);
    float _1020 = precise::clamp(_1018, 0.0, 1.0);
    float _1022 = _418 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1024 = _418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1026 = fma(_890, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1014);
    float _1028 = -_1020;
    float _1030 = _1028 + 1.0;
    float _1032 = _418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1034 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1024);
    float _1036 = _1026 + _898;
    float _1038 = -_968;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1008);
    float _1042 = _928 * _1000;
    float _1044 = abs(_1030);
    float _1046 = log2(_1044);
    float _1048 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1032);
    float _1050 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1034);
    float _1052 = _1036 * _1000;
    bool _1054 = _1042 >= 0.0;
    float _1056 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1048);
    float _1058 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1060 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1022);
    bool _1062 = _1042 <= 1.0;
    bool _1064 = _1062 && _1054;
    float _1066 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1068 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1070 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1060);
    bool _1072 = _1052 >= 0.0;
    bool _1074 = _1072 && _1064;
    float _1076 = _1026;
    float _1078 = _996;
    float _1080 = _1042;
    if (!_720)
    {
        float _1082 = rint(_996);
        float _1084 = precise::max(_1082, 0.0);
        uint _1086 = uint(_1084);
        uint _1088 = clamp(_1086, 0u, 65535u);
        _1076 = as_type<float>(_1088);
    }
    float _1090 = _1076;
    float _1092 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1068);
    bool _1094 = _1052 <= 1.0;
    bool _1096 = _1094 && _1074;
    float _1098 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1100 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1102 = fma(_1040, -0.5, 0.5);
    float _1104 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1092);
    float _1106 = fma(_1040, 0.5, 0.5);
    float _1108 = _1090;
    if (!_720)
    {
        float _1110 = -_976;
        float _1112 = _536 + _1110;
        _1078 = _1112;
    }
    float _1114 = _1078;
    float _1116 = exp2(_1100);
    float _1118 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1104);
    float _1120 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1122 = _978 + _806;
    float _1124 = fma(_1106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1126 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1120);
    float _1128 = _960 + 1.0;
    float _1130 = sqrt(_1102);
    float _1132 = fma(_1106, _1124, -0.212114393711090087890625);
    float _1134 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1126);
    float _1136 = _1122 * _1000;
    float _1138 = fma(_1106, _1132, 1.570728778839111328125);
    float _1140 = log2(_1012);
    float _1142 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1144 = -_960;
    float _1146 = fma(_1116, _1128, _1144);
    float _1148 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1134);
    float _1150 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1142);
    float _1152 = _1142;
    float _1154 = _1118;
    if (_1096)
    {
        float _1156 = float(_588);
        _1152 = _1156;
    }
    float _1158 = _1152;
    float _1160 = fma(_1146, 0.5, 0.5);
    float _1162 = 1.0 / _1118;
    float _1164 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1150);
    float _1166 = _1130 * 0.636619746685028076171875;
    float _1168 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1164);
    float _1170 = _1164;
    float _1172 = _1168;
    if (!_720)
    {
        float _1174 = -_956;
        float _1176 = _534 + _1174;
        _1170 = _1176;
    }
    float _1178 = _1170;
    float _1180 = -_1138;
    float _1182 = fma(_1166, _1180, 1.0);
    float _1184 = _1158;
    if (_1096)
    {
        float _1186 = rint(_1158);
        float _1188 = precise::max(_1186, 0.0);
        uint _1190 = uint(_1188);
        uint _1192 = clamp(_1190, 0u, 65535u);
        _1184 = as_type<float>(_1192);
    }
    float _1194 = _1184;
    float _1196 = _1140 * 0.693147182464599609375;
    float2 _4957 = float2(_880, _908);
    float _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4957, float2(0.0), isnan(_4957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4957, float2(0.0), isnan(_4957)), level(0.0)).x;
    float _1200 = _1114;
    if (!_720)
    {
        float3 _4974 = float3(_1178, _1114, float(as_type<int>(_1090)));
        float3 _4978 = select(_4974, float3(0.0), isnan(_4974));
        float _1202 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4978.xy, uint(rint(_4978.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4978.xy, uint(rint(_4978.z)), level(0.0)).x;
        _1200 = _1202;
    }
    float _1204 = _1200;
    float _1206 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1208 = _1148 * _1162;
    float _1210 = _1168 * _1162;
    float _1212 = fma(_1208, 0.5, 0.5);
    float _1214 = fma(_1210, -0.5, 0.5);
    float _1216 = _1052;
    float _1218 = _1194;
    if (_1096)
    {
        float3 _5008 = float3(_1042, _1052, float(as_type<int>(_1194)));
        float3 _5010 = select(_5008, float3(0.0), isnan(_5008));
        float _1220 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5010.xy, uint(rint(_5010.z)), _1136, level(0.0));
        _1216 = _1220;
    }
    float _1222 = _1216;
    float3 _5020 = float3(_1212, _1214, _1206);
    float _1224 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5020, float3(0.0), isnan(_5020)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5020, float3(0.0), isnan(_5020)), level(0.0)).x;
    float3 _5029 = float3(_1212, _1214, _1206);
    float4 _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5029, float3(0.0), isnan(_5029)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5029, float3(0.0), isnan(_5029)), level(0.0)).xyzw;
    float _1229 = _1227.x;
    float _1231 = _1227.y;
    float _1233 = _1227.z;
    float _1235 = _1227.w;
    float2 _5045 = float2(_1182, _1160);
    float3 _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5045, float2(0.0), isnan(_5045)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5045, float2(0.0), isnan(_5045)), level(0.0)).xyz;
    float _1241 = _1239.x;
    float _1243 = _1239.y;
    float _1245 = _1239.z;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1249 = _1247 != 0;
    float _1251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1255 = _1253 != 0;
    out.m_68.x = _448;
    out.m_68.y = _432;
    out.m_68.z = _462;
    bool _1257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    bool _1259 = !_174;
    float _1261 = _1259 ? 0.0 : 1.0;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1265 = _1263 != 0;
    float _1267 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1269 = _1249;
    bool _1271 = _1257;
    if (_1249)
    {
        bool _1273 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _240 = _1273;
    }
    bool _1275 = _240;
    if (!_1255)
    {
        float _1277 = -_168;
        float _1279 = (-0.0) + _1277;
        _1218 = _1279;
    }
    float _1281 = _1218;
    float _1283 = _1281;
    if (!_1249)
    {
        _1267 = _1261;
    }
    float _1285 = _1267;
    float _1287 = _1162;
    float _1289 = _1285;
    if (_1257)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1287 = _1291;
    }
    float _1293 = _1287;
    if (_1249)
    {
        float _1295 = -_1261;
        float _1297 = _1275 ? _1295 : _1261;
        _1289 = _1297;
    }
    float _1299 = _1289;
    if (_1255)
    {
        bool _1301 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1269 = _1301;
    }
    bool _1303 = _1269;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1307 = _1305 != 0;
    bool _1309 = _1303;
    if (_1255)
    {
        float _1311 = -_168;
        float _1313 = _1303 ? _168 : _1311;
        _1283 = _1313;
    }
    float _1315 = _1283;
    if (!_1257)
    {
        float _1317 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _582 = _1317;
    }
    float _1319 = _582;
    if (_1257)
    {
        _1080 = (*spvDescriptorSet0.vp_c9)._m0[15].x;
    }
    float _1321 = _1080;
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1325 = _1323 != 0;
    float _1327 = _1321;
    if (_1257)
    {
        float _1329 = _1321 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1327 = _1329;
    }
    float _1331 = _1327;
    float _1333 = _1331;
    if (_1257)
    {
        _1108 = (*spvDescriptorSet0.vp_c9)._m0[14].x;
    }
    float _1335 = _1108;
    float _1337 = _1335;
    if (_1265)
    {
        bool _1339 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1309 = _1339;
    }
    bool _1341 = _1309;
    bool _1343 = _1341;
    if (!_1265)
    {
        _920 = _1261;
    }
    float _1345 = _920;
    float _1347 = _1345;
    if (_1257)
    {
        float _1349 = fma(_1331, _1335, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1337 = _1349;
    }
    float _1351 = _1337;
    float _1353 = _1351;
    if (_1265)
    {
        float _1355 = -_1261;
        float _1357 = _1341 ? _1355 : _1261;
        _1347 = _1357;
    }
    float _1359 = _1347;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1363 = _1361 != 0;
    if (_1257)
    {
        float _1365 = _1351 * _1293;
        _242 = _1365;
    }
    float _1367 = _242;
    float _1369 = _1367;
    if (_1307)
    {
        bool _1371 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1343 = _1371;
    }
    bool _1373 = _1343;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1379 = _1373;
    float _1381 = _1377;
    if (_1325)
    {
        _1353 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1383 = _1353;
    float _1385 = _1359 + (-0.5);
    float _1387 = 1.0 / _1377;
    if (!_1307)
    {
        _1333 = _1261;
    }
    float _1389 = _1333;
    float _1391 = _1389;
    if (_1307)
    {
        float _1393 = -_1261;
        float _1395 = _1373 ? _1393 : _1261;
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    if (_1325)
    {
        bool _1403 = _1383 > 0.5;
        _1379 = _1403;
    }
    bool _1405 = _1379;
    float _1407 = _1261;
    if (_1257)
    {
        float _1409 = floor(_1367);
        _1407 = _1409;
    }
    float _1411 = _1407;
    if (!_1325)
    {
        float _1413 = -_168;
        float _1415 = (-0.0) + _1413;
        _1381 = _1415;
    }
    float _1417 = _1381;
    float _1419 = _1417;
    if (_1325)
    {
        float _1421 = -_168;
        float _1423 = _1405 ? _168 : _1421;
        _1419 = _1423;
    }
    float _1425 = _1419;
    float _1427 = _1397 + (-0.5);
    bool _1429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1431 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1433 = 1.0 / _1401;
    out.m_70.w = _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1439 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan(0.5);
    bool _1447 = _1443 || _1445;
    float _1449 = _1431;
    if (_1257)
    {
        float _1451 = -_1411;
        float _1453 = _1367 + _1451;
        _1369 = _1453;
    }
    float _1455 = _1369;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1461 = _1455;
    if (!_1257)
    {
        float _1463 = _1319 * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1461 = _1463;
    }
    float _1465 = _1461;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1469 = _1467 != 0;
    float _1471 = 1.0 / _1437;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    if (_1429)
    {
        _1449 = (*spvDescriptorSet0.vp_c9)._m0[15].y;
    }
    float _1477 = _1449;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1481 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1483 = 0.0;
    float _1485 = _1477;
    if (_1429)
    {
        _1483 = (*spvDescriptorSet0.vp_c9)._m0[14].y;
    }
    float _1487 = _1483;
    float _1489 = 1.0 / _1459;
    if (_1429)
    {
        float _1491 = _1477 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1485 = _1491;
    }
    float _1493 = _1485;
    out.m_72.w = _1481;
    float _1495 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1479);
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1501 = _1493;
    if (_1429)
    {
        float _1503 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1501 = _1503;
    }
    float _1505 = _1501;
    float _1507 = _1487;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1511 = _1505;
    if (_1429)
    {
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    if (_1363)
    {
        bool _1521 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1271 = _1521;
    }
    bool _1523 = _1271;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1527;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1535 = 1.0 / _1519;
    float _1537 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1525);
    float _1539 = _1529 * _1433;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1541;
    float _1545 = _1533 * _1387;
    int _1547 = as_type<int>(_1535);
    if (!_1469)
    {
        _1509 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1549 = _1509;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1555 = _1543 * _1471;
    float _1557 = 1.0 / _1499;
    float _1559 = _1515;
    float _1561 = _1549;
    if (_1429)
    {
        float _1563 = _1505 * _1515;
        _1559 = _1563;
    }
    float _1565 = _1559;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[84].z;
    if (_1469)
    {
        _1561 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1571 = _1561;
    float _1573 = _1553 * _1489;
    if (!_1469)
    {
        _1511 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1575 = _1511;
    float _1577 = 1.0 / _1475;
    float _1579 = _1575;
    if (_1469)
    {
        _1579 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1581 = _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1587 = 0.0;
    float _1589 = _1581;
    if (_1429)
    {
        float _1591 = floor(_1565);
        _1587 = _1591;
    }
    float _1593 = _1587;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1599;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1605 = _1585 * _1557;
    float _1607 = _1557;
    float _1609 = _1603;
    if (!_1469)
    {
        _1607 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1611 = _1607;
    float _1613 = _1601 * _1535;
    float _1615 = _1611;
    if (_1469)
    {
        _1547 = 0;
    }
    int _1617 = _1547;
    float _1619 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1603);
    int _1621 = _1617;
    if (!_1469)
    {
        _1621 = 2;
    }
    int _1623 = _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1625;
    if (!_1469)
    {
        _1609 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1629 = _1609;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1635 = _1629;
    float _1637 = _1633;
    if (!_1469)
    {
        _1569 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1639 = _1569;
    float _1641 = _1597 * _1577;
    float _1643 = _1639;
    if (_1469)
    {
        _1615 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1645 = _1615;
    float _1647 = 1.0 / _1633;
    if (_1469)
    {
        _1635 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1649 = _1635;
    float _1651 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1653 = _1649;
    if (_1469)
    {
        _1643 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1655 = _1643;
    float _1657 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1567);
    bool _1659 = _1623 != 2;
    if (_1429)
    {
        float _1661 = -_1593;
        float _1663 = _1565 + _1661;
        _1589 = _1663;
    }
    float _1665 = _1589;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1669 = 0.0;
    float _1671 = _1665;
    if (!_1429)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _1669 = _1673;
    }
    float _1675 = _1669;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1667);
    float _1683 = -_1677;
    float _1685 = fma(_1651, 2.0, _1683);
    float _1687 = 1.0 / _1627;
    if (_1659)
    {
        _1637 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1689 = _1637;
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1693 = _1691 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1695 = _1689;
    if (!_1659)
    {
        _1695 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1697 = _1695;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1701 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1703 = _1697;
    if (!_1363)
    {
        float _1705 = -_168;
        float _1707 = (-0.0) + _1705;
        _1653 = _1707;
    }
    float _1709 = _1653;
    float _1711 = _1709;
    if (_1363)
    {
        float _1713 = -_168;
        float _1715 = _1523 ? _168 : _1713;
        _1711 = _1715;
    }
    float _1717 = _1711;
    float _1719 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1679);
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1721;
    if (_1659)
    {
        _1703 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1725 = _1703;
    float _1727 = 1.0 / _1693;
    float _1729 = _1725;
    if (!_1659)
    {
        _1729 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1731 = _1729;
    if (!_1429)
    {
        float _1733 = _1675 * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1671 = _1733;
    }
    float _1735 = _1671;
    if (_1659)
    {
        _244 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1737 = _244;
    float _1739 = _1737;
    if (!_1659)
    {
        _1739 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1741 = _1739;
    float _1743 = 1.0 / _1723;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1751 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1753 = isnan(_1465);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    bool _1763 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1765 = isnan(_1465);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = 1.0 / _1747;
    float _1777 = fma(_1701, -2.0, _1699);
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1779;
    float _1783 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1787 = _1465 + _1785;
    bool _1789 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1791 = isnan(_1465);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = 1.0 / _1781;
    float _1803 = _1787 * _1647;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1809 = _1735 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1811;
    float _1815 = -_1805;
    float _1817 = fma(_1783, 2.0, _1815);
    float _1819 = _1741 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1823 = _1465 + _1821;
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1827 = _1735 + _1825;
    float _1829 = fma(_1573, _1809, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1831 = fma(_1819, -2.0, _1749);
    float _1833 = _1823 * _1687;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1837 = _1465 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1841 = _1735 + _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1845 = _1465 + _1843;
    float _1847 = _1837 * _1743;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1851 = _1735 + _1849;
    float _1853 = 1.0 / _1813;
    float _1855 = fma(_1539, _1841, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1859 = _1735 + _1857;
    float _1861 = fma(_1545, _1851, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1865 = _1735 + _1863;
    float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1869 = _1465 + _1867;
    float _1871 = _1845 * _1801;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1873;
    float _1877 = fma(_1555, _1865, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1879 = fma(_1641, _1827, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1881 = fma(_1605, _1859, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1885 = _1465 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1889 = _1735 + _1887;
    float _1891 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1619);
    float _1893 = _1869 * _1727;
    float _1895 = _1885 * _1853;
    float _1897 = fma(_1613, _1889, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1899;
    float _1903 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1657);
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1909 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1685);
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1915 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1681);
    float _1917 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1777);
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1921 = _1465 + _1919;
    float _1923 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1495);
    float _1925 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1537);
    float _1927 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1719);
    float _1929 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1817);
    float _1931 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1831);
    float _1933 = fma(_1875, _1833, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1935 = fma(_1901, _1833, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1937 = fma(_1907, _1803, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1939 = fma(_1913, _1803, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1941 = _1891 * (-0.15915493667125701904296875);
    float _1943 = _1921 * _1775;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1949;
    float _1953 = _1941 * 6.283185482025146484375;
    float _1955 = sin(_1953);
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1957;
    float _1961 = fma(_1947, _1847, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1963 = fma(_1951, _1847, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1965;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _1977 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1979 = isnan(_1465);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = _1941 * 6.283185482025146484375;
    float _1991 = cos(_1989);
    float _1993 = fma(_1967, _1871, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1995 = fma(_1959, _1871, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2001 = fma(_1971, _1893, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2005 = _2003 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2007 = fma(_1975, _1893, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2009 = _1425 + 0.5;
    float _2011 = fma(_1999, _1943, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2013 = fma(_2005, _1943, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2015 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2017 = isnan(_1465);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2023 = _2019 || _2021;
    float _2025 = float(_2023);
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2027;
    float _2031 = _2009 * _1955;
    bool _2033 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2035 = isnan(_1465);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2041 = _2037 || _2039;
    float _2043 = float(_2041);
    float _2045 = _1927 * (-0.15915493667125701904296875);
    float _2047 = fma(_2029, _1895, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2049 = -_2031;
    float _2051 = fma(_1385, _1991, _2049);
    bool _2053 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2055 = isnan(_1465);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    float _2065 = _2009 * _1991;
    bool _2067 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2069 = isnan(_1465);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2075 = _2071 || _2073;
    float _2077 = float(_2075);
    float _2079 = _2045 * 6.283185482025146484375;
    float _2081 = sin(_2079);
    bool _2083 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2085 = isnan(_1735);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = -_2063;
    float _2097 = _2095 + 1.0;
    float _2099 = -_2077;
    float _2101 = _2099 + 1.0;
    bool _2103 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2105 = isnan(_1735);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = -_2093;
    float _2117 = _2115 + 1.0;
    float _2119 = _2077 * _2097;
    float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2121;
    bool _2125 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2127 = isnan(_1735);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = -_2113;
    float _2139 = _2137 + 1.0;
    float _2141 = _2113 * _2117;
    float _2143 = -_2043;
    float _2145 = _2143 + 1.0;
    float _2147 = _2043 * _2101;
    bool _2149 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2151 = isnan(_1735);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2157 = _2153 || _2155;
    float _2159 = float(_2157);
    float _2161 = _2135 * _2139;
    float _2163 = -_2135;
    float _2165 = _2163 + 1.0;
    float _2167 = _2025 * _2145;
    float _2169 = -_2025;
    float _2171 = _2169 + 1.0;
    bool _2173 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2175 = isnan(_1735);
    bool _2177 = _2173 || _2175;
    bool _2179 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2181 = _2177 || _2179;
    float _2183 = float(_2181);
    float _2185 = _2159 * _2165;
    float _2187 = -_2159;
    float _2189 = _2187 + 1.0;
    float _2191 = _1987 * _2171;
    bool _2193 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2195 = isnan(_1735);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = -_1987;
    float _2207 = _2205 + 1.0;
    float _2209 = -_2183;
    float _2211 = _2209 + 1.0;
    float _2213 = _2183 * _2189;
    float _2215 = -_1799;
    float _2217 = _2215 + 1.0;
    float _2219 = _1799 * _2207;
    float _2221 = _2203 * _2211;
    float _2223 = -_2203;
    float _2225 = _2223 + 1.0;
    float _2227 = _2045 * 6.283185482025146484375;
    float _2229 = cos(_2227);
    bool _2231 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2233 = isnan(_1735);
    bool _2235 = _2231 || _2233;
    bool _2237 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2239 = _2235 || _2237;
    float _2241 = float(_2239);
    float _2243 = fma(_1385, _1955, _2065);
    bool _2245 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2247 = isnan(_1735);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2253 = _2249 || _2251;
    float _2255 = float(_2253);
    float _2257 = _1773 * _2217;
    float _2259 = -_1773;
    float _2261 = _2259 + 1.0;
    float _2263 = _2241 * _2225;
    float _2265 = -_2241;
    float _2267 = _2265 + 1.0;
    float _2269 = _1717 + 0.5;
    float _2271 = _1761 * _2261;
    float _2273 = -_1761;
    float _2275 = _2273 + 1.0;
    float _2277 = _2255 * _2267;
    float _2279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2281 = _1933 * _2271;
    float _2283 = _1935 * _2271;
    float _2285 = _2269 * _2081;
    float _2287 = _2269 * _2229;
    float _2289 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2281);
    float _2291 = _1855 * _2277;
    float _2293 = -_2285;
    float _2295 = fma(_1427, _2229, _2293);
    float _2297 = -_2255;
    float _2299 = _2297 + 1.0;
    float _2301 = fma(_1937, _2257, _2289);
    float _2303 = fma(_1427, _2081, _2287);
    float _2305 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2283);
    float _2307 = _2051 + 0.5;
    float _2309 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2311 = fma(_2299, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2291);
    float _2313 = fma(_1939, _2257, _2305);
    float _2315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2317 = fma(_2309, _2307, _1909);
    float _2319 = fma(_1861, _2263, _2311);
    float _2321 = _2279 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2323 = _2295 + 0.5;
    float _2325 = fma(_2123, _1895, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2327 = fma(_1877, _2221, _2319);
    float _2329 = _2243 + (-0.5);
    float _2331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2333 = fma(_2321, _2323, _1929);
    float _2335 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2337 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2339 = fma(_1961, _2219, _2301);
    float _2341 = fma(_1963, _2219, _2313);
    float _2343 = fma(_1829, _2213, _2327);
    float _2345 = -_1903;
    float _2347 = _2345 + 1.0;
    float _2349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2351 = _2335 * _2315;
    float _2353 = fma(_2001, _2191, _2339);
    float _2355 = -_1915;
    float _2357 = _2355 + 1.0;
    float _2359 = fma(_2007, _2191, _2341);
    float _2361 = -_2347;
    float _2363 = fma(_2051, _2361, _2317);
    float _2365 = fma(_1993, _2167, _2353);
    float _2367 = fma(_1879, _2185, _2343);
    float _2369 = -_2337;
    float _2371 = fma(_2369, _2331, -0.0);
    float _2373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2375 = fma(_1995, _2167, _2359);
    float _2377 = fma(_2011, _2147, _2365);
    float _2379 = fma(_1881, _2161, _2367);
    float _2381 = -_1923;
    float _2383 = _2381 + 1.0;
    float _2385 = fma(_2013, _2147, _2375);
    float _2387 = fma(_2047, _2119, _2377);
    float _2389 = _2349 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2391 = abs(_542);
    float _2393 = log2(_2391);
    float _2395 = -_1925;
    float _2397 = _2395 + 1.0;
    float _2399 = fma(_2325, _2119, _2385);
    float _2401 = -_2389;
    float _2403 = -_1917;
    float _2405 = fma(_2401, _2329, _2403);
    float _2407 = _2303 + (-0.5);
    float _2409 = fma(_1897, _2141, _2379);
    float _2411 = _188 * _334;
    float _2413 = fma(_2243, _2357, _2405);
    float _2415 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2417 = -_2383;
    float _2419 = fma(_2295, _2417, _2333);
    float _2421 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2387);
    float _2423 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2399);
    out.m_74.x = _2351;
    out.m_74.y = _2371;
    out.m_74.z = _2363;
    out.m_74.w = _2413;
    float _2425 = -_2415;
    float _2427 = -_1931;
    float _2429 = fma(_2425, _2407, _2427);
    float _2431 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2409);
    float _2433 = -_2411;
    float _2435 = fma(_192, _248, _2433);
    float _2437 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2439 = _192 * _250;
    float _2441 = fma(_2303, _2397, _2429);
    out.m_76.x = _2421;
    out.m_76.y = _2423;
    float _2443 = exp2(_2437);
    out.m_78.x = _2419;
    out.m_78.y = _2441;
    float _2445 = _190 * _248;
    float _2447 = -_2439;
    float _2449 = fma(_190, _334, _2447);
    float _2451 = -_2445;
    float _2453 = fma(_188, _250, _2451);
    out.m_80.x = _2431;
    float _2455 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _2457 = _2453 * _2453;
    float _2459 = float(_117);
    float _2461 = 1.0 / _2455;
    float _2463 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2465 = fma(_2435, _2435, _2457);
    float _2467 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2469 = precise::clamp(_2467, 0.0, 1.0);
    float _2471 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2463);
    float _2473 = fma(_2449, _2449, _2465);
    float _2475 = fma(_2469, -2.0, 3.0);
    float _2477 = _2469 * _2469;
    float _2479 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _2481 = (*spvDescriptorSet0.vp_c12)._m0[1].y + _2479;
    float _2483 = rsqrt(_2473);
    float _2485 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2471);
    float _2487 = _2477 * _2475;
    float _2489 = _2459 * _2461;
    float _2491 = -_2487;
    float _2493 = _2491 + 1.0;
    float _2495 = fma(_2481, _2489, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _2497 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2487);
    float _2499 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2485);
    float _2501 = _2493;
    float _2503 = _2489;
    float _2505 = _2435;
    if (_1447)
    {
        _2501 = 1.0;
    }
    float _2507 = _2501;
    float _2509 = _2507;
    if (_1447)
    {
        _2503 = 1.0;
    }
    float _2511 = _2503;
    float _2513 = _2511;
    if (!_1447)
    {
        float _2515 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2517 = _2515 * 0.15915493667125701904296875;
        float _2519 = _2517 * 6.283185482025146484375;
        float _2521 = cos(_2519);
        float _2523 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2525 = _2523 * 0.15915493667125701904296875;
        float _2527 = _2517 * 6.283185482025146484375;
        float _2529 = sin(_2527);
        float _2531 = 1.0 / _2521;
        float _2533 = _2525 * 6.283185482025146484375;
        float _2535 = cos(_2533);
        float _2537 = _2529 * _2531;
        float _2539 = _2525 * 6.283185482025146484375;
        float _2541 = sin(_2539);
        float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2545 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2543;
        float _2547 = _2535 * _2537;
        float _2549 = 1.0 / _2545;
        float _2551 = 1.0 / _2547;
        float _2553 = _2541 * _2551;
        float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2557 = fma(_542, _2553, _2555);
        float _2559 = _2557 * _2549;
        float _2561 = precise::clamp(_2559, 0.0, 1.0);
        _2513 = _2561;
    }
    float _2563 = _2513;
    if (!_1447)
    {
        float _2565 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2567 = _2565 * 0.15915493667125701904296875;
        float _2569 = _2567 * 6.283185482025146484375;
        float _2571 = cos(_2569);
        float _2573 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2575 = _2573 * 0.15915493667125701904296875;
        float _2577 = _2567 * 6.283185482025146484375;
        float _2579 = sin(_2577);
        float _2581 = 1.0 / _2571;
        float _2583 = _2575 * 6.283185482025146484375;
        float _2585 = cos(_2583);
        float _2587 = _2579 * _2581;
        float _2589 = _2575 * 6.283185482025146484375;
        float _2591 = sin(_2589);
        float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2595 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2593;
        float _2597 = _2585 * _2587;
        float _2599 = 1.0 / _2595;
        float _2601 = 1.0 / _2597;
        float _2603 = _2591 * _2601;
        float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2607 = fma(_542, _2603, _2605);
        float _2609 = _2607 * _2599;
        float _2611 = precise::clamp(_2609, 0.0, 1.0);
        float _2613 = -_2611;
        float _2615 = _2613 + 1.0;
        _2509 = _2615;
    }
    float _2617 = _2509;
    float _2619 = _2499 + _1118;
    float _2621 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2623 = _2563 * _2617;
    float _2625 = _2619 * 0.5;
    bool _2627 = _542 <= 8000.0;
    bool _2629 = isnan(_542);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan(8000.0);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = _2453 * _2483;
    float _2641 = exp2(_2621);
    float _2643 = _2623 * _2495;
    out.m_82.z = _2625;
    out.m_82.w = _1118;
    float _2645 = _2637 * _2497;
    float _2647 = _2435 * _2483;
    float _2649 = _2449 * _2483;
    float _2651 = -_1198;
    float _2653 = _2651 + 1.0;
    float _2655 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2657 = _1148;
    float _2659 = _2655;
    if (!_1096)
    {
        _2505 = 1.0;
    }
    float _2661 = _2505;
    float _2663 = _2653 * _2655;
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = _2661;
    if (_1096)
    {
        bool _2669 = _1222 >= _1136;
        bool _2671 = isnan(_1222);
        bool _2673 = _2669 || _2671;
        bool _2675 = isnan(_1136);
        bool _2677 = _2673 || _2675;
        float _2679 = float(_2677);
        _2667 = _2679;
    }
    float _2681 = _2667;
    out.gl_Position.x = _1148;
    out.gl_Position.y = _1168;
    out.gl_Position.z = _2499;
    out.gl_Position.w = _1118;
    float _2683 = -_2665;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2687 = -_2641;
    float _2689 = _2687 + 1.0;
    float _2691 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2693 = _2681;
    if (_720)
    {
        _2657 = 1.0;
    }
    float _2695 = _2657;
    float _2697 = _2695;
    if (!_720)
    {
        int _2699 = _926 << 4;
        int _2701 = _2699 + 2048;
        uint _2703 = uint(int(uint(_2701) >> uint(2)));
        uint _2705 = uint(int(uint(int(_2703)) >> uint(2)));
        int _2707 = int(_2703) & 3;
        float _2709 = (*spvDescriptorSet0.vp_c15)._m0[int(_2705)][_2707];
        int _2711 = int(_2703) + 1;
        uint _2713 = uint(int(uint(_2711) >> uint(2)));
        int _2715 = _2711 & 3;
        float _2717 = (*spvDescriptorSet0.vp_c15)._m0[int(_2713)][_2715];
        int _2719 = _2701 + 8;
        uint _2721 = uint(int(uint(_2719) >> uint(2)));
        uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
        int _2725 = int(_2721) & 3;
        float _2727 = (*spvDescriptorSet0.vp_c15)._m0[int(_2723)][_2725];
        int _2729 = int(_2721) + 1;
        uint _2731 = uint(int(uint(_2729) >> uint(2)));
        int _2733 = _2729 & 3;
        float _2735 = (*spvDescriptorSet0.vp_c15)._m0[int(_2731)][_2733];
        float _2737 = _492 * _2717;
        float _2739 = fma(_2709, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2737);
        float _2741 = fma(_2727, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2739);
        float _2743 = _2741 + _2735;
        float _2745 = precise::clamp(_2743, 0.0, 1.0);
        float _2747 = -_2745;
        float _2749 = _2747 + _1204;
        float _2751 = fma(_2749, 500.0, 1.5);
        float _2753 = exp2(_2751);
        float _2755 = 0.0 + _2753;
        float _2757 = precise::clamp(_2755, 0.0, 1.0);
        _2697 = _2757;
        _2659 = _2727;
        _1172 = _2753;
    }
    float _2759 = _2697;
    float _2761 = _2659;
    float _2763 = _1172;
    float _2765 = _2691 * _1224;
    float _2767 = _2681 * _2759;
    float _2769 = -_2691;
    float _2771 = _2769 + 1.0;
    out.m_84.x = _2647;
    out.m_84.y = _2639;
    out.m_84.z = _2649;
    float _2773 = _1235 * _2765;
    float _2775 = -_2767;
    float _2777 = fma(_2775, _2685, 1.0);
    float _2779 = precise::clamp(_2777, 0.0, 1.0);
    float _2781 = _1245 * _2765;
    bool _2783 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2785 = isnan(_500);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2791 = _2787 || _2789;
    float _2793 = fma(_1241, _2773, _1229);
    float _2795 = fma(_1243, _2773, _1231);
    float _2797 = _2779 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2799 = _1235 * _2771;
    float _2801 = fma(_1235, _2781, _1233);
    float _2803 = _2643 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.x = _2797;
    out.m_88.x = _2793;
    out.m_88.y = _2795;
    out.m_88.z = _2801;
    out.m_88.w = _2799;
    float _2805 = _2761;
    float _2807 = _2771;
    float _2809 = _2763;
    float _2811 = _2779;
    if (!_2791)
    {
        _2693 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2813 = _2693;
    float _2815 = _2813;
    float _2817 = _2813;
    if (!_2791)
    {
        _2805 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2819 = _2805;
    float _2821 = _2819;
    float _2823 = _2819;
    if (!_2791)
    {
        _1154 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2825 = _1154;
    float _2827 = _2825;
    float _2829 = _2825;
    if (!_2791)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2831 = _2807;
    float _2833 = _2831;
    float _2835 = _2831;
    if (!_2791)
    {
        _2809 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2837 = _2809;
    float _2839 = _2837;
    float _2841 = _2837;
    if (!_2791)
    {
        _2811 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2843 = _2811;
    bool _2845 = !_2791;
    float _2847 = _2843;
    float _2849 = _2843;
    if (!_2845)
    {
        bool _2851 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2853 = isnan(_500);
        bool _2855 = _2851 || _2853;
        bool _2857 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2859 = _2855 || _2857;
        if (!_2859)
        {
            float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2863 = _500 + _2861;
            float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2867 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2865;
            float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2873 = 1.0 / _2867;
            float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2891 = _2863 * _2873;
            float _2893 = precise::clamp(_2891, 0.0, 1.0);
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2899 = fma(_2893, _2871, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2901 = fma(_2893, _2897, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2903 = fma(_2893, _2877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2905 = fma(_2893, _2881, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2907 = fma(_2893, _2885, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2909 = fma(_2893, _2889, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2823 = _2903;
            _2841 = _2907;
            _2817 = _2899;
            _2835 = _2905;
            _2829 = _2901;
            _2849 = _2909;
            _2911 = true;
        }
        else
        {
            bool _2913 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2915 = isnan(_500);
            bool _2917 = _2913 || _2915;
            bool _2919 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2921 = _2917 || _2919;
            if (!_2921)
            {
                _2815 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2923 = _2815;
            _2817 = _2923;
            if (!_2921)
            {
                _2821 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2925 = _2821;
            _2823 = _2925;
            if (!_2921)
            {
                _2827 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2927 = _2827;
            _2829 = _2927;
            if (!_2921)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2929 = _2833;
            _2835 = _2929;
            if (!_2921)
            {
                _2839 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2931 = _2839;
            _2841 = _2931;
            if (!_2921)
            {
                _2847 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2933 = _2847;
            bool _2935 = !_2921;
            _2849 = _2933;
            if (!_2935)
            {
                bool _2937 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2939 = isnan(_500);
                bool _2941 = _2937 || _2939;
                bool _2943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2945 = _2941 || _2943;
                if (!_2945)
                {
                    float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2949 = _500 + _2947;
                    float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2953 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2951;
                    float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2959 = 1.0 / _2953;
                    float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2971 = _2969 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2977 = _2949 * _2959;
                    float _2979 = precise::clamp(_2977, 0.0, 1.0);
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2985 = fma(_2979, _2957, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2987 = fma(_2979, _2983, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2989 = fma(_2979, _2963, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2991 = fma(_2979, _2967, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2993 = fma(_2979, _2971, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2995 = fma(_2979, _2975, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2823 = _2989;
                    _2841 = _2993;
                    _2817 = _2985;
                    _2835 = _2991;
                    _2829 = _2987;
                    _2849 = _2995;
                    _2911 = true;
                }
                else
                {
                    _2823 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2841 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2817 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2829 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2849 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2911 = false;
    float _2997 = _2823;
    float _2999 = _2841;
    float _3001 = _2817;
    float _3003 = _2835;
    float _3005 = _2829;
    float _3007 = _2849;
    float _3009 = fma(_2639, -0.5, 0.5);
    float _3011 = precise::clamp(_3009, 0.0, 1.0);
    float _3013 = -_2997;
    float _3015 = _3013 + _2999;
    float _3017 = -_3001;
    float _3019 = _3017 + _3003;
    float _3021 = -_3005;
    float _3023 = _3021 + _3007;
    bool _3025 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3027 = fma(_3011, _3015, _2997);
    float _3029 = fma(_3011, _3019, _3001);
    float _3031 = fma(_3011, _3023, _3005);
    float _3033 = _2803 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3035 = _3027 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _3037 = fma(_3029, 0.298911988735198974609375, _3035);
    out.m_92.x = _3033;
    float _3039 = fma(_3031, 0.114477999508380889892578125, _3037);
    float _3041 = -_3039;
    float _3043 = _3029 + _3041;
    float _3045 = -_3039;
    float _3047 = _3027 + _3045;
    float _3049 = -_3039;
    float _3051 = _3031 + _3049;
    float _3053 = fma(_3043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3039);
    float _3055 = fma(_3047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3039);
    float _3057 = fma(_3051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3039);
    out.m_94.x = _3053;
    out.m_94.y = _3055;
    out.m_94.z = _3057;
    if (!_3025)
    {
        return out;
    }
    float _3059 = -_418;
    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3063 = -_426;
    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3067 = -_444;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3071 = _3061 * _3061;
    float _3073 = fma(_3065, _3065, _3071);
    float _3075 = fma(_3069, _3069, _3073);
    float _3077 = sqrt(_3075);
    float _3079 = rsqrt(_3075);
    float _3081 = -_3077;
    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3085 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = _3065 * _3079;
    float _3091 = _3061 * _3079;
    float _3093 = abs(_3087);
    float _3095 = log2(_3093);
    float _3097 = _3069 * _3079;
    float _3099 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3101 = _2639 * _3091;
    float _3103 = -_3091;
    float _3105 = -_3099;
    float _3107 = fma(_3103, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3105);
    float _3109 = fma(_2647, _3089, _3101);
    float _3111 = -_3097;
    float _3113 = fma(_3111, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3107);
    float _3115 = fma(_2649, _3097, _3109);
    float _3117 = precise::clamp(_3115, 0.0, 1.0);
    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3121 = _3113 + _3119;
    float _3123 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3125 = _3121 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3127 = precise::clamp(_3125, 0.0, 1.0);
    float _3129 = exp2(_3123);
    float _3131 = _3129 * _3127;
    float _3133 = _3117 * _3131;
    float _3135 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3137 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3139 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3135;
    out.m_90.y = _3137;
    out.m_90.z = _3139;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2911 = false;
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
    int _121 = _119 * 48;
    int _123 = _121 + 16;
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
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_148)];
    float _150 = as_type<float>(_dmw1.x);
    int _152 = _123 + 4;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw1.y);
    int _158 = _123 + 8;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>(_dmw1.z);
    int _164 = _123 + 12;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>(_dmw1.w);
    int _170 = as_type<int>(_108) & 2;
    bool _174 = _170 != 0;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _178 = _176 != 0;
    float _180 = _156 * _156;
    float _182 = fma(_150, _150, _180);
    float _184 = fma(_162, _162, _182);
    float _186 = rsqrt(_184);
    float _188 = _162 * _186;
    float _190 = _150 * _186;
    float _192 = _156 * _186;
    float _194 = _188 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _196 = _192 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _198 = -_194;
    float _200 = fma(_190, (*spvDescriptorSet0.vp_c8)._m0[28].z, _198);
    float _202 = _190 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _204 = -_196;
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c8)._m0[28].y, _204);
    float _208 = _200 * _200;
    float _210 = -_202;
    float _212 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[28].x, _210);
    float _214 = fma(_206, _206, _208);
    float _216 = fma(_212, _212, _214);
    float _218 = rsqrt(_216);
    bool _220 = !_174;
    float _222 = _220 ? 1.0 : (-1.0);
    float _224 = abs(_146);
    float _226 = _224 * _222;
    float _228 = _226 * 0.5;
    float _230 = _222;
    float _232 = _216;
    float _234 = _206;
    float _236 = _162;
    float _238 = _146;
    bool _240 = _174;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _244 = _168;
    if (_178)
    {
        _230 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _246 = _230;
    float _248 = _212 * _218;
    float _250 = _206 * _218;
    float _252 = -_228;
    float _254 = fma(_248, _252, _140);
    float _256 = -_228;
    float _258 = fma(_250, _256, _128);
    float _260 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _262 = _254 + _260;
    float _264 = _246;
    float _266 = _218;
    float _268 = _258;
    float _270 = _254;
    if (_178)
    {
        _232 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _272 = _232;
    float _274 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _276 = _258 + _274;
    float _278 = _272;
    if (_178)
    {
        float _280 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _282 = _246 + _280;
        _234 = _282;
    }
    float _284 = _234;
    float _286 = _262 * _262;
    float _288 = _286;
    if (_178)
    {
        _236 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _290 = _236;
    float _292 = _290;
    if (_178)
    {
        float _294 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _296 = _272 + _294;
        _278 = _296;
    }
    float _298 = _278;
    if (_178)
    {
        float _300 = _284 * _284;
        _264 = _300;
    }
    float _302 = _264;
    float _304 = fma(_276, _276, _286);
    float _306 = _302;
    if (_178)
    {
        float _308 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _310 = _290 + _308;
        _292 = _310;
    }
    float _312 = _292;
    if (_178)
    {
        float _314 = fma(_298, _298, _302);
        _288 = _314;
    }
    float _316 = _288;
    float _318 = sqrt(_304);
    float _320 = _316;
    if (_178)
    {
        float _322 = fma(_312, _312, _316);
        _238 = _322;
    }
    float _324 = _238;
    float _326 = _324;
    if (_178)
    {
        float _328 = rsqrt(_324);
        _326 = _328;
    }
    float _330 = _326;
    bool _332 = _318 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _334 = _200 * _218;
    if (!_178)
    {
        _320 = 0.0;
        _306 = 0.0;
    }
    float _336 = _320;
    float _338 = _306;
    float _340 = _336;
    float _342 = _338;
    if (!_178)
    {
        _266 = 0.0;
    }
    float _344 = _266;
    float _346 = -_228;
    float _348 = fma(_334, _346, _134);
    float _350 = 0.0;
    float _352 = _344;
    float _354 = _348;
    if (_178)
    {
        float _356 = _330 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _350 = _356;
    }
    float _358 = _350;
    if (_178)
    {
        float _360 = _298 * _358;
        _352 = _360;
    }
    float _362 = _352;
    if (_178)
    {
        float _364 = _284 * _358;
        _340 = _364;
    }
    float _366 = _340;
    if (_178)
    {
        float _368 = _312 * _358;
        _342 = _368;
    }
    float _370 = _342;
    bool _372 = !_332;
    if (!_372)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _378 = _318 + _376;
        float _380 = rsqrt(_304);
        float _382 = _378 * _374;
        float _384 = _348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = _382 * 0.15915493667125701904296875;
        float _388 = _386 * 6.283185482025146484375;
        float _390 = cos(_388);
        float _392 = _386 * 6.283185482025146484375;
        float _394 = sin(_392);
        float _396 = _390 + (-1.0);
        float _398 = _396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = fma(_394, _384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _402 = fma(_348, _390, _398);
        float _404 = _380 * _400;
        float _406 = fma(_276, _404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _408 = fma(_262, _404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _354 = _402;
        _268 = _406;
        _270 = _408;
    }
    float _410 = _354;
    float _412 = _268;
    float _414 = _270;
    float _416 = _134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _418 = _366 + _410;
    float _420 = _134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _422 = _134 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _424 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[1].x, _416);
    float _426 = _362 + _412;
    float _428 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[0].x, _420);
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _418 + _430;
    float _434 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _424);
    float _436 = _134 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _438 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[2].x, _422);
    float _440 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _428);
    float _442 = _434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _444 = _370 + _414;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _448 = _426 + _446;
    float _450 = _432 * _432;
    float _452 = fma(_128, (*spvDescriptorSet0.vp_c8)._m0[3].x, _436);
    float _454 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _438);
    float _456 = _440 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _458 = _442 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _462 = _444 + _460;
    float _464 = fma(_448, _448, _450);
    float _466 = fma(_140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _452);
    float _468 = _454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[7].x, _458);
    float _472 = fma(_462, _462, _464);
    float _474 = _466 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _476 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _470);
    float _478 = rsqrt(_472);
    float _480 = _442 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _482 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _476);
    float _484 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _486 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[6].x, _480);
    float _488 = 1.0 / _482;
    float _490 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _486);
    float _492 = _484 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _494 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _490);
    float _496 = _478 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _498 = _494 + _482;
    float _500 = sqrt(_472);
    float _502 = _448 * _496;
    float _504 = _462 * _496;
    float _506 = _498 * _488;
    float _508 = _506 * 0.5;
    float _510 = _502 * _502;
    float _512 = _504 * _504;
    float _514 = _492 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _518 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[30].w, _516);
    float _520 = _492 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _522 = _510 + _512;
    float _524 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _514);
    float _526 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _520);
    float _528 = 1.0 / _518;
    float _530 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _524);
    float _532 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _526);
    float _534 = _530 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _536 = _532 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _538 = sqrt(_522);
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _542 = _528 * _540;
    float _544 = trunc(_536);
    int _546 = int(_544);
    bool _548 = _542 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _550 = _542 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _552 = _538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _554 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _556 = _538 + _554;
    bool _558 = !_548;
    int _560 = _558 ? 0 : 1;
    float _562 = trunc(_534);
    int _564 = int(_562);
    int _566 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _568 = _546 + _566;
    int _570 = _568 + 1;
    int _572 = 2;
    float _574 = _522;
    float _576 = _556;
    float _578 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    int _580 = _570;
    float _582 = _510;
    if (!_548)
    {
        _572 = 1;
    }
    int _584 = _572;
    int _586 = _584;
    if (!_550)
    {
        _586 = _560;
    }
    int _588 = _586;
    float _590 = _140;
    if (_552)
    {
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _592;
    }
    float _594 = _590;
    int _596 = _588 << 6;
    float _598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _600 = _596 + 48;
    uint _602 = uint(int(uint(_600) >> uint(2)));
    uint _604 = uint(int(uint(int(_602)) >> uint(2)));
    int _606 = int(_602) & 3;
    float _608 = (*spvDescriptorSet0.vp_c15)._m0[int(_604)][_606];
    int _610 = int(_602) + 1;
    uint _612 = uint(int(uint(_610) >> uint(2)));
    int _614 = _610 & 3;
    float _616 = (*spvDescriptorSet0.vp_c15)._m0[int(_612)][_614];
    int _618 = _596;
    if (_552)
    {
        float _620 = rsqrt(_522);
        _574 = _620;
    }
    float _622 = _574;
    int _624 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _626 = _564 + _624;
    int _628 = _626 + 1;
    float _630 = precise::max(0.0, _598);
    bool _632 = _628 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _634 = _596 + 96;
    uint _636 = uint(int(uint(_634) >> uint(2)));
    uint _638 = uint(int(uint(int(_636)) >> uint(2)));
    int _640 = int(_636) & 3;
    float _642 = (*spvDescriptorSet0.vp_c15)._m0[int(_638)][_640];
    int _644 = int(_636) + 1;
    uint _646 = uint(int(uint(_644) >> uint(2)));
    int _648 = _644 & 3;
    float _650 = (*spvDescriptorSet0.vp_c15)._m0[int(_646)][_648];
    float _652 = _622;
    float _654 = as_type<float>(_628);
    if (_552)
    {
        float _656 = _556 * _594;
        _576 = _656;
    }
    float _658 = _576;
    float _660 = -_496;
    float _662 = -_630;
    float _664 = fma(_432, _660, _662);
    int _666 = _628 | _570;
    float _668 = 0.0;
    float _670 = as_type<float>(_666);
    if (_552)
    {
        float _672 = _658 * 0.15915493667125701904296875;
        _668 = _672;
    }
    float _674 = _668;
    float _676 = 0.0;
    if (_552)
    {
        float _678 = _664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _676 = _678;
    }
    float _680 = _676;
    int _682 = _596 + 56;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    uint _686 = uint(int(uint(int(_684)) >> uint(2)));
    int _688 = int(_684) & 3;
    float _690 = (*spvDescriptorSet0.vp_c15)._m0[int(_686)][_688];
    int _692 = int(_684) + 1;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    int _696 = _692 & 3;
    float _698 = (*spvDescriptorSet0.vp_c15)._m0[int(_694)][_696];
    float _700 = 0.0;
    float _702 = _680;
    if (_552)
    {
        float _704 = _674 * 6.283185482025146484375;
        float _706 = sin(_704);
        _700 = _706;
    }
    float _708 = _700;
    bool _710 = _666 < 0;
    bool _712 = _710 || _632;
    float _714 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_552)
    {
        _670 = _502;
    }
    float _716 = _670;
    bool _718 = _570 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _720 = _718 || _712;
    int _722 = _596 + 80;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c15)._m0[int(_726)][_728];
    int _732 = int(_724) + 1;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    int _736 = _732 & 3;
    float _738 = (*spvDescriptorSet0.vp_c15)._m0[int(_734)][_736];
    float _740 = 0.0;
    float _742 = _716;
    if (_552)
    {
        float _744 = _674 * 6.283185482025146484375;
        float _746 = cos(_744);
        _740 = _746;
    }
    float _748 = _740;
    int _750 = _596 + 104;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.vp_c15)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.vp_c15)._m0[int(_762)][_764];
    float _768 = _708;
    if (_552)
    {
        float _770 = fma(_708, _680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _702 = _770;
    }
    float _772 = _702;
    float _774 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _776 = floor(_714);
    float _778 = 0.0;
    float _780 = _772;
    int _782 = as_type<int>(_774);
    if (_552)
    {
        float _784 = _622 * _772;
        _778 = _784;
    }
    float _786 = _778;
    if (!_552)
    {
        _780 = _664;
    }
    float _788 = _780;
    int _790 = _596 + 88;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    uint _794 = uint(int(uint(int(_792)) >> uint(2)));
    int _796 = int(_792) & 3;
    float _798 = (*spvDescriptorSet0.vp_c15)._m0[int(_794)][_796];
    int _800 = int(_792) + 1;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    int _804 = _800 & 3;
    float _806 = (*spvDescriptorSet0.vp_c15)._m0[int(_802)][_804];
    float _808 = _788;
    float _810 = _748;
    if (_552)
    {
        float _812 = _748 + (-1.0);
        _768 = _812;
    }
    float _814 = _768;
    float _816 = _814;
    if (_552)
    {
        float _818 = _502 * _786;
        _742 = _818;
    }
    float _820 = _742;
    if (!_552)
    {
        _652 = _510;
    }
    float _822 = _652;
    float _824 = floor(_774);
    float _826 = _822;
    if (_552)
    {
        float _828 = _814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _578 = _828;
    }
    float _830 = _578;
    if (!_552)
    {
        _816 = _504;
    }
    float _832 = _816;
    float _834 = _832;
    if (_552)
    {
        float _836 = _504 * _786;
        _834 = _836;
    }
    float _838 = _834;
    int _840 = _596 + 64;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    uint _844 = uint(int(uint(int(_842)) >> uint(2)));
    int _846 = int(_842) & 3;
    float _848 = (*spvDescriptorSet0.vp_c15)._m0[int(_844)][_846];
    int _850 = int(_842) + 1;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    int _854 = _850 & 3;
    float _856 = (*spvDescriptorSet0.vp_c15)._m0[int(_852)][_854];
    if (_552)
    {
        float _858 = fma(_664, _748, _830);
        _808 = _858;
    }
    float _860 = _808;
    if (_552)
    {
        float _862 = _820 * _820;
        _826 = _862;
    }
    float _864 = _826;
    if (!_552)
    {
        _810 = _512;
    }
    float _866 = _810;
    float _868 = _866;
    if (_552)
    {
        float _870 = _838 * _838;
        _868 = _870;
    }
    float _872 = _868;
    float _874 = _492 * _616;
    float _876 = fma(_860, _860, _864);
    float _878 = -_776;
    float _880 = _714 + _878;
    int _882 = _596 + 72;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    uint _886 = uint(int(uint(int(_884)) >> uint(2)));
    int _888 = int(_884) & 3;
    float _890 = (*spvDescriptorSet0.vp_c15)._m0[int(_886)][_888];
    int _892 = int(_884) + 1;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    int _896 = _892 & 3;
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[int(_894)][_896];
    float _900 = _492 * _650;
    float _902 = _876 + _872;
    float _904 = fma(_608, (*spvDescriptorSet0.vp_c12)._m0[5].x, _874);
    float _906 = -_824;
    float _908 = _774 + _906;
    float _910 = fma(_642, (*spvDescriptorSet0.vp_c12)._m0[5].x, _900);
    float _912 = rsqrt(_902);
    float _914 = fma(_690, (*spvDescriptorSet0.vp_c12)._m0[5].z, _904);
    float _916 = _418 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _918 = as_type<int>(_872);
    float _920 = _908;
    if (!_720)
    {
        int _922 = _570 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _924 = _922 + _628;
        _618 = _924;
    }
    int _926 = _618;
    float _928 = _914 + _698;
    float _930 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].x, _916);
    float _932 = _492 * _738;
    if (!_720)
    {
        int _934 = _926 << 2;
        _580 = _934;
    }
    int _936 = _580;
    float _938 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _930);
    float _940 = as_type<float>(_936);
    if (!_720)
    {
        uint _942 = uint(int(uint(_926) >> uint(2)));
        _918 = int(_942);
    }
    int _944 = _918;
    float _946 = fma(_730, (*spvDescriptorSet0.vp_c12)._m0[5].x, _932);
    float _948 = as_type<float>(_944);
    if (!_720)
    {
        int _950 = 12 & _936;
        _782 = _950;
    }
    int _952 = _782;
    if (!_720)
    {
        float _954 = floor(_534);
        _654 = _954;
    }
    float _956 = _654;
    float _958 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[5].z, _910);
    float _960 = _912 * _860;
    if (!_720)
    {
        int _962 = _944 << 4;
        int _964 = _962 + _952;
        _948 = as_type<float>(_964);
    }
    float _966 = _948;
    float _968 = _912 * _838;
    float _970 = _958 + _766;
    float _972 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (!_720)
    {
        float _974 = floor(_536);
        _940 = _974;
    }
    float _976 = _940;
    float _978 = fma(_798, (*spvDescriptorSet0.vp_c12)._m0[5].z, _946);
    float _980 = _912 * _820;
    float _982 = _938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _984 = _966;
    if (!_720)
    {
        int _986 = as_type<int>(_966) + 400;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        uint _990 = uint(int(uint(int(_988)) >> uint(2)));
        int _992 = int(_988) & 3;
        float _994 = (*spvDescriptorSet0.vp_c15)._m0[int(_990)][_992];
        _984 = _994;
    }
    float _996 = _984;
    float _998 = _980 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1000 = 1.0 / _970;
    float _1002 = _982 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1004 = _492 * _856;
    float _1006 = -_998;
    float _1008 = fma(_960, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1006);
    float _1010 = -_1002;
    float _1012 = fma(_1010, _972, 1.0);
    float _1014 = fma(_848, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1004);
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1018 = fma(_500, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1016);
    float _1020 = precise::clamp(_1018, 0.0, 1.0);
    float _1022 = _418 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1024 = _418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1026 = fma(_890, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1014);
    float _1028 = -_1020;
    float _1030 = _1028 + 1.0;
    float _1032 = _418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1034 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1024);
    float _1036 = _1026 + _898;
    float _1038 = -_968;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1008);
    float _1042 = _928 * _1000;
    float _1044 = abs(_1030);
    float _1046 = log2(_1044);
    float _1048 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1032);
    float _1050 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1034);
    float _1052 = _1036 * _1000;
    bool _1054 = _1042 >= 0.0;
    float _1056 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1048);
    float _1058 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1060 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1022);
    bool _1062 = _1042 <= 1.0;
    bool _1064 = _1062 && _1054;
    float _1066 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1068 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1070 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1060);
    bool _1072 = _1052 >= 0.0;
    bool _1074 = _1072 && _1064;
    float _1076 = _1026;
    float _1078 = _996;
    float _1080 = _1042;
    if (!_720)
    {
        float _1082 = rint(_996);
        float _1084 = precise::max(_1082, 0.0);
        uint _1086 = uint(_1084);
        uint _1088 = clamp(_1086, 0u, 65535u);
        _1076 = as_type<float>(_1088);
    }
    float _1090 = _1076;
    float _1092 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1068);
    bool _1094 = _1052 <= 1.0;
    bool _1096 = _1094 && _1074;
    float _1098 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1100 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1102 = fma(_1040, -0.5, 0.5);
    float _1104 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1092);
    float _1106 = fma(_1040, 0.5, 0.5);
    float _1108 = _1090;
    if (!_720)
    {
        float _1110 = -_976;
        float _1112 = _536 + _1110;
        _1078 = _1112;
    }
    float _1114 = _1078;
    float _1116 = exp2(_1100);
    float _1118 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1104);
    float _1120 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1122 = _978 + _806;
    float _1124 = fma(_1106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1126 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1120);
    float _1128 = _960 + 1.0;
    float _1130 = sqrt(_1102);
    float _1132 = fma(_1106, _1124, -0.212114393711090087890625);
    float _1134 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1126);
    float _1136 = _1122 * _1000;
    float _1138 = fma(_1106, _1132, 1.570728778839111328125);
    float _1140 = log2(_1012);
    float _1142 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1144 = -_960;
    float _1146 = fma(_1116, _1128, _1144);
    float _1148 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1134);
    float _1150 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1142);
    float _1152 = _1142;
    float _1154 = _1118;
    if (_1096)
    {
        float _1156 = float(_588);
        _1152 = _1156;
    }
    float _1158 = _1152;
    float _1160 = fma(_1146, 0.5, 0.5);
    float _1162 = 1.0 / _1118;
    float _1164 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1150);
    float _1166 = _1130 * 0.636619746685028076171875;
    float _1168 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1164);
    float _1170 = _1164;
    float _1172 = _1168;
    if (!_720)
    {
        float _1174 = -_956;
        float _1176 = _534 + _1174;
        _1170 = _1176;
    }
    float _1178 = _1170;
    float _1180 = -_1138;
    float _1182 = fma(_1166, _1180, 1.0);
    float _1184 = _1158;
    if (_1096)
    {
        float _1186 = rint(_1158);
        float _1188 = precise::max(_1186, 0.0);
        uint _1190 = uint(_1188);
        uint _1192 = clamp(_1190, 0u, 65535u);
        _1184 = as_type<float>(_1192);
    }
    float _1194 = _1184;
    float _1196 = _1140 * 0.693147182464599609375;
    float2 _4957 = float2(_880, _908);
    float _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4957, float2(0.0), isnan(_4957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4957, float2(0.0), isnan(_4957)), level(0.0)).x;
    float _1200 = _1114;
    if (!_720)
    {
        float3 _4974 = float3(_1178, _1114, float(as_type<int>(_1090)));
        float3 _4978 = select(_4974, float3(0.0), isnan(_4974));
        float _1202 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4978.xy, uint(rint(_4978.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4978.xy, uint(rint(_4978.z)), level(0.0)).x;
        _1200 = _1202;
    }
    float _1204 = _1200;
    float _1206 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1208 = _1148 * _1162;
    float _1210 = _1168 * _1162;
    float _1212 = fma(_1208, 0.5, 0.5);
    float _1214 = fma(_1210, -0.5, 0.5);
    float _1216 = _1052;
    float _1218 = _1194;
    if (_1096)
    {
        float3 _5008 = float3(_1042, _1052, float(as_type<int>(_1194)));
        float3 _5010 = select(_5008, float3(0.0), isnan(_5008));
        float _1220 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5010.xy, uint(rint(_5010.z)), _1136, level(0.0));
        _1216 = _1220;
    }
    float _1222 = _1216;
    float3 _5020 = float3(_1212, _1214, _1206);
    float _1224 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5020, float3(0.0), isnan(_5020)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5020, float3(0.0), isnan(_5020)), level(0.0)).x;
    float3 _5029 = float3(_1212, _1214, _1206);
    float4 _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5029, float3(0.0), isnan(_5029)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5029, float3(0.0), isnan(_5029)), level(0.0)).xyzw;
    float _1229 = _1227.x;
    float _1231 = _1227.y;
    float _1233 = _1227.z;
    float _1235 = _1227.w;
    float2 _5045 = float2(_1182, _1160);
    float3 _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5045, float2(0.0), isnan(_5045)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5045, float2(0.0), isnan(_5045)), level(0.0)).xyz;
    float _1241 = _1239.x;
    float _1243 = _1239.y;
    float _1245 = _1239.z;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1249 = _1247 != 0;
    float _1251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1255 = _1253 != 0;
    out.m_68.x = _448;
    out.m_68.y = _432;
    out.m_68.z = _462;
    bool _1257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    bool _1259 = !_174;
    float _1261 = _1259 ? 0.0 : 1.0;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1265 = _1263 != 0;
    float _1267 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1269 = _1249;
    bool _1271 = _1257;
    if (_1249)
    {
        bool _1273 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _240 = _1273;
    }
    bool _1275 = _240;
    if (!_1255)
    {
        float _1277 = -_168;
        float _1279 = (-0.0) + _1277;
        _1218 = _1279;
    }
    float _1281 = _1218;
    float _1283 = _1281;
    if (!_1249)
    {
        _1267 = _1261;
    }
    float _1285 = _1267;
    float _1287 = _1162;
    float _1289 = _1285;
    if (_1257)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1287 = _1291;
    }
    float _1293 = _1287;
    if (_1249)
    {
        float _1295 = -_1261;
        float _1297 = _1275 ? _1295 : _1261;
        _1289 = _1297;
    }
    float _1299 = _1289;
    if (_1255)
    {
        bool _1301 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1269 = _1301;
    }
    bool _1303 = _1269;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1307 = _1305 != 0;
    bool _1309 = _1303;
    if (_1255)
    {
        float _1311 = -_168;
        float _1313 = _1303 ? _168 : _1311;
        _1283 = _1313;
    }
    float _1315 = _1283;
    if (!_1257)
    {
        float _1317 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _582 = _1317;
    }
    float _1319 = _582;
    if (_1257)
    {
        _1080 = (*spvDescriptorSet0.vp_c9)._m0[15].x;
    }
    float _1321 = _1080;
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1325 = _1323 != 0;
    float _1327 = _1321;
    if (_1257)
    {
        float _1329 = _1321 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1327 = _1329;
    }
    float _1331 = _1327;
    float _1333 = _1331;
    if (_1257)
    {
        _1108 = (*spvDescriptorSet0.vp_c9)._m0[14].x;
    }
    float _1335 = _1108;
    float _1337 = _1335;
    if (_1265)
    {
        bool _1339 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1309 = _1339;
    }
    bool _1341 = _1309;
    bool _1343 = _1341;
    if (!_1265)
    {
        _920 = _1261;
    }
    float _1345 = _920;
    float _1347 = _1345;
    if (_1257)
    {
        float _1349 = fma(_1331, _1335, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1337 = _1349;
    }
    float _1351 = _1337;
    float _1353 = _1351;
    if (_1265)
    {
        float _1355 = -_1261;
        float _1357 = _1341 ? _1355 : _1261;
        _1347 = _1357;
    }
    float _1359 = _1347;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1363 = _1361 != 0;
    if (_1257)
    {
        float _1365 = _1351 * _1293;
        _242 = _1365;
    }
    float _1367 = _242;
    float _1369 = _1367;
    if (_1307)
    {
        bool _1371 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1343 = _1371;
    }
    bool _1373 = _1343;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1379 = _1373;
    float _1381 = _1377;
    if (_1325)
    {
        _1353 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1383 = _1353;
    float _1385 = _1359 + (-0.5);
    float _1387 = 1.0 / _1377;
    if (!_1307)
    {
        _1333 = _1261;
    }
    float _1389 = _1333;
    float _1391 = _1389;
    if (_1307)
    {
        float _1393 = -_1261;
        float _1395 = _1373 ? _1393 : _1261;
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    if (_1325)
    {
        bool _1403 = _1383 > 0.5;
        _1379 = _1403;
    }
    bool _1405 = _1379;
    float _1407 = _1261;
    if (_1257)
    {
        float _1409 = floor(_1367);
        _1407 = _1409;
    }
    float _1411 = _1407;
    if (!_1325)
    {
        float _1413 = -_168;
        float _1415 = (-0.0) + _1413;
        _1381 = _1415;
    }
    float _1417 = _1381;
    float _1419 = _1417;
    if (_1325)
    {
        float _1421 = -_168;
        float _1423 = _1405 ? _168 : _1421;
        _1419 = _1423;
    }
    float _1425 = _1419;
    float _1427 = _1397 + (-0.5);
    bool _1429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1431 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1433 = 1.0 / _1401;
    out.m_70.w = _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1439 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan(0.5);
    bool _1447 = _1443 || _1445;
    float _1449 = _1431;
    if (_1257)
    {
        float _1451 = -_1411;
        float _1453 = _1367 + _1451;
        _1369 = _1453;
    }
    float _1455 = _1369;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1461 = _1455;
    if (!_1257)
    {
        float _1463 = _1319 * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1461 = _1463;
    }
    float _1465 = _1461;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1469 = _1467 != 0;
    float _1471 = 1.0 / _1437;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    if (_1429)
    {
        _1449 = (*spvDescriptorSet0.vp_c9)._m0[15].y;
    }
    float _1477 = _1449;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1481 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1483 = 0.0;
    float _1485 = _1477;
    if (_1429)
    {
        _1483 = (*spvDescriptorSet0.vp_c9)._m0[14].y;
    }
    float _1487 = _1483;
    float _1489 = 1.0 / _1459;
    if (_1429)
    {
        float _1491 = _1477 * (*spvDescriptorSet0.vp_c12)._m0[0].x;
        _1485 = _1491;
    }
    float _1493 = _1485;
    out.m_72.w = _1481;
    float _1495 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1479);
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1501 = _1493;
    if (_1429)
    {
        float _1503 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c12)._m0[4].x);
        _1501 = _1503;
    }
    float _1505 = _1501;
    float _1507 = _1487;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1511 = _1505;
    if (_1429)
    {
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    if (_1363)
    {
        bool _1521 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1271 = _1521;
    }
    bool _1523 = _1271;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1527;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1535 = 1.0 / _1519;
    float _1537 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1525);
    float _1539 = _1529 * _1433;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1541;
    float _1545 = _1533 * _1387;
    int _1547 = as_type<int>(_1535);
    if (!_1469)
    {
        _1509 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1549 = _1509;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1555 = _1543 * _1471;
    float _1557 = 1.0 / _1499;
    float _1559 = _1515;
    float _1561 = _1549;
    if (_1429)
    {
        float _1563 = _1505 * _1515;
        _1559 = _1563;
    }
    float _1565 = _1559;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[84].z;
    if (_1469)
    {
        _1561 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1571 = _1561;
    float _1573 = _1553 * _1489;
    if (!_1469)
    {
        _1511 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1575 = _1511;
    float _1577 = 1.0 / _1475;
    float _1579 = _1575;
    if (_1469)
    {
        _1579 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1581 = _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1587 = 0.0;
    float _1589 = _1581;
    if (_1429)
    {
        float _1591 = floor(_1565);
        _1587 = _1591;
    }
    float _1593 = _1587;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1599;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1605 = _1585 * _1557;
    float _1607 = _1557;
    float _1609 = _1603;
    if (!_1469)
    {
        _1607 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1611 = _1607;
    float _1613 = _1601 * _1535;
    float _1615 = _1611;
    if (_1469)
    {
        _1547 = 0;
    }
    int _1617 = _1547;
    float _1619 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1603);
    int _1621 = _1617;
    if (!_1469)
    {
        _1621 = 2;
    }
    int _1623 = _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1625;
    if (!_1469)
    {
        _1609 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1629 = _1609;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1635 = _1629;
    float _1637 = _1633;
    if (!_1469)
    {
        _1569 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1639 = _1569;
    float _1641 = _1597 * _1577;
    float _1643 = _1639;
    if (_1469)
    {
        _1615 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1645 = _1615;
    float _1647 = 1.0 / _1633;
    if (_1469)
    {
        _1635 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1649 = _1635;
    float _1651 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1653 = _1649;
    if (_1469)
    {
        _1643 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1655 = _1643;
    float _1657 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1567);
    bool _1659 = _1623 != 2;
    if (_1429)
    {
        float _1661 = -_1593;
        float _1663 = _1565 + _1661;
        _1589 = _1663;
    }
    float _1665 = _1589;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1669 = 0.0;
    float _1671 = _1665;
    if (!_1429)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[4].w;
        _1669 = _1673;
    }
    float _1675 = _1669;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1667);
    float _1683 = -_1677;
    float _1685 = fma(_1651, 2.0, _1683);
    float _1687 = 1.0 / _1627;
    if (_1659)
    {
        _1637 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1689 = _1637;
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1693 = _1691 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1695 = _1689;
    if (!_1659)
    {
        _1695 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1697 = _1695;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1701 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1703 = _1697;
    if (!_1363)
    {
        float _1705 = -_168;
        float _1707 = (-0.0) + _1705;
        _1653 = _1707;
    }
    float _1709 = _1653;
    float _1711 = _1709;
    if (_1363)
    {
        float _1713 = -_168;
        float _1715 = _1523 ? _168 : _1713;
        _1711 = _1715;
    }
    float _1717 = _1711;
    float _1719 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1679);
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1721;
    if (_1659)
    {
        _1703 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1725 = _1703;
    float _1727 = 1.0 / _1693;
    float _1729 = _1725;
    if (!_1659)
    {
        _1729 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1731 = _1729;
    if (!_1429)
    {
        float _1733 = _1675 * (*spvDescriptorSet0.vp_c12)._m0[4].x;
        _1671 = _1733;
    }
    float _1735 = _1671;
    if (_1659)
    {
        _244 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1737 = _244;
    float _1739 = _1737;
    if (!_1659)
    {
        _1739 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1741 = _1739;
    float _1743 = 1.0 / _1723;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1751 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1753 = isnan(_1465);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    bool _1763 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1765 = isnan(_1465);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = 1.0 / _1747;
    float _1777 = fma(_1701, -2.0, _1699);
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1779;
    float _1783 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1787 = _1465 + _1785;
    bool _1789 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1791 = isnan(_1465);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = 1.0 / _1781;
    float _1803 = _1787 * _1647;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1809 = _1735 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1811;
    float _1815 = -_1805;
    float _1817 = fma(_1783, 2.0, _1815);
    float _1819 = _1741 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1823 = _1465 + _1821;
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1827 = _1735 + _1825;
    float _1829 = fma(_1573, _1809, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1831 = fma(_1819, -2.0, _1749);
    float _1833 = _1823 * _1687;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1837 = _1465 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1841 = _1735 + _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1845 = _1465 + _1843;
    float _1847 = _1837 * _1743;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1851 = _1735 + _1849;
    float _1853 = 1.0 / _1813;
    float _1855 = fma(_1539, _1841, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1859 = _1735 + _1857;
    float _1861 = fma(_1545, _1851, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1865 = _1735 + _1863;
    float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1869 = _1465 + _1867;
    float _1871 = _1845 * _1801;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1873;
    float _1877 = fma(_1555, _1865, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1879 = fma(_1641, _1827, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1881 = fma(_1605, _1859, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1885 = _1465 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1889 = _1735 + _1887;
    float _1891 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1619);
    float _1893 = _1869 * _1727;
    float _1895 = _1885 * _1853;
    float _1897 = fma(_1613, _1889, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1899;
    float _1903 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1657);
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1909 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1685);
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1915 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1681);
    float _1917 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1777);
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1921 = _1465 + _1919;
    float _1923 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1495);
    float _1925 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1537);
    float _1927 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1719);
    float _1929 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1817);
    float _1931 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1831);
    float _1933 = fma(_1875, _1833, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1935 = fma(_1901, _1833, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1937 = fma(_1907, _1803, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1939 = fma(_1913, _1803, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1941 = _1891 * (-0.15915493667125701904296875);
    float _1943 = _1921 * _1775;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1949;
    float _1953 = _1941 * 6.283185482025146484375;
    float _1955 = sin(_1953);
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1957;
    float _1961 = fma(_1947, _1847, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1963 = fma(_1951, _1847, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1965;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _1977 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1979 = isnan(_1465);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = _1941 * 6.283185482025146484375;
    float _1991 = cos(_1989);
    float _1993 = fma(_1967, _1871, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1995 = fma(_1959, _1871, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2001 = fma(_1971, _1893, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2005 = _2003 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2007 = fma(_1975, _1893, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _2009 = _1425 + 0.5;
    float _2011 = fma(_1999, _1943, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2013 = fma(_2005, _1943, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2015 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2017 = isnan(_1465);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2023 = _2019 || _2021;
    float _2025 = float(_2023);
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2027;
    float _2031 = _2009 * _1955;
    bool _2033 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2035 = isnan(_1465);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2041 = _2037 || _2039;
    float _2043 = float(_2041);
    float _2045 = _1927 * (-0.15915493667125701904296875);
    float _2047 = fma(_2029, _1895, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2049 = -_2031;
    float _2051 = fma(_1385, _1991, _2049);
    bool _2053 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2055 = isnan(_1465);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    float _2065 = _2009 * _1991;
    bool _2067 = _1465 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2069 = isnan(_1465);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2075 = _2071 || _2073;
    float _2077 = float(_2075);
    float _2079 = _2045 * 6.283185482025146484375;
    float _2081 = sin(_2079);
    bool _2083 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2085 = isnan(_1735);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = -_2063;
    float _2097 = _2095 + 1.0;
    float _2099 = -_2077;
    float _2101 = _2099 + 1.0;
    bool _2103 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2105 = isnan(_1735);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = -_2093;
    float _2117 = _2115 + 1.0;
    float _2119 = _2077 * _2097;
    float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2121;
    bool _2125 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2127 = isnan(_1735);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = -_2113;
    float _2139 = _2137 + 1.0;
    float _2141 = _2113 * _2117;
    float _2143 = -_2043;
    float _2145 = _2143 + 1.0;
    float _2147 = _2043 * _2101;
    bool _2149 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2151 = isnan(_1735);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2157 = _2153 || _2155;
    float _2159 = float(_2157);
    float _2161 = _2135 * _2139;
    float _2163 = -_2135;
    float _2165 = _2163 + 1.0;
    float _2167 = _2025 * _2145;
    float _2169 = -_2025;
    float _2171 = _2169 + 1.0;
    bool _2173 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2175 = isnan(_1735);
    bool _2177 = _2173 || _2175;
    bool _2179 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2181 = _2177 || _2179;
    float _2183 = float(_2181);
    float _2185 = _2159 * _2165;
    float _2187 = -_2159;
    float _2189 = _2187 + 1.0;
    float _2191 = _1987 * _2171;
    bool _2193 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2195 = isnan(_1735);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = -_1987;
    float _2207 = _2205 + 1.0;
    float _2209 = -_2183;
    float _2211 = _2209 + 1.0;
    float _2213 = _2183 * _2189;
    float _2215 = -_1799;
    float _2217 = _2215 + 1.0;
    float _2219 = _1799 * _2207;
    float _2221 = _2203 * _2211;
    float _2223 = -_2203;
    float _2225 = _2223 + 1.0;
    float _2227 = _2045 * 6.283185482025146484375;
    float _2229 = cos(_2227);
    bool _2231 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2233 = isnan(_1735);
    bool _2235 = _2231 || _2233;
    bool _2237 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2239 = _2235 || _2237;
    float _2241 = float(_2239);
    float _2243 = fma(_1385, _1955, _2065);
    bool _2245 = _1735 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2247 = isnan(_1735);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2253 = _2249 || _2251;
    float _2255 = float(_2253);
    float _2257 = _1773 * _2217;
    float _2259 = -_1773;
    float _2261 = _2259 + 1.0;
    float _2263 = _2241 * _2225;
    float _2265 = -_2241;
    float _2267 = _2265 + 1.0;
    float _2269 = _1717 + 0.5;
    float _2271 = _1761 * _2261;
    float _2273 = -_1761;
    float _2275 = _2273 + 1.0;
    float _2277 = _2255 * _2267;
    float _2279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2281 = _1933 * _2271;
    float _2283 = _1935 * _2271;
    float _2285 = _2269 * _2081;
    float _2287 = _2269 * _2229;
    float _2289 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2281);
    float _2291 = _1855 * _2277;
    float _2293 = -_2285;
    float _2295 = fma(_1427, _2229, _2293);
    float _2297 = -_2255;
    float _2299 = _2297 + 1.0;
    float _2301 = fma(_1937, _2257, _2289);
    float _2303 = fma(_1427, _2081, _2287);
    float _2305 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2283);
    float _2307 = _2051 + 0.5;
    float _2309 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2311 = fma(_2299, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2291);
    float _2313 = fma(_1939, _2257, _2305);
    float _2315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2317 = fma(_2309, _2307, _1909);
    float _2319 = fma(_1861, _2263, _2311);
    float _2321 = _2279 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2323 = _2295 + 0.5;
    float _2325 = fma(_2123, _1895, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2327 = fma(_1877, _2221, _2319);
    float _2329 = _2243 + (-0.5);
    float _2331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2333 = fma(_2321, _2323, _1929);
    float _2335 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2337 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2339 = fma(_1961, _2219, _2301);
    float _2341 = fma(_1963, _2219, _2313);
    float _2343 = fma(_1829, _2213, _2327);
    float _2345 = -_1903;
    float _2347 = _2345 + 1.0;
    float _2349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2351 = _2335 * _2315;
    float _2353 = fma(_2001, _2191, _2339);
    float _2355 = -_1915;
    float _2357 = _2355 + 1.0;
    float _2359 = fma(_2007, _2191, _2341);
    float _2361 = -_2347;
    float _2363 = fma(_2051, _2361, _2317);
    float _2365 = fma(_1993, _2167, _2353);
    float _2367 = fma(_1879, _2185, _2343);
    float _2369 = -_2337;
    float _2371 = fma(_2369, _2331, -0.0);
    float _2373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2375 = fma(_1995, _2167, _2359);
    float _2377 = fma(_2011, _2147, _2365);
    float _2379 = fma(_1881, _2161, _2367);
    float _2381 = -_1923;
    float _2383 = _2381 + 1.0;
    float _2385 = fma(_2013, _2147, _2375);
    float _2387 = fma(_2047, _2119, _2377);
    float _2389 = _2349 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2391 = abs(_542);
    float _2393 = log2(_2391);
    float _2395 = -_1925;
    float _2397 = _2395 + 1.0;
    float _2399 = fma(_2325, _2119, _2385);
    float _2401 = -_2389;
    float _2403 = -_1917;
    float _2405 = fma(_2401, _2329, _2403);
    float _2407 = _2303 + (-0.5);
    float _2409 = fma(_1897, _2141, _2379);
    float _2411 = _188 * _334;
    float _2413 = fma(_2243, _2357, _2405);
    float _2415 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2417 = -_2383;
    float _2419 = fma(_2295, _2417, _2333);
    float _2421 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2387);
    float _2423 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2399);
    out.m_74.x = _2351;
    out.m_74.y = _2371;
    out.m_74.z = _2363;
    out.m_74.w = _2413;
    float _2425 = -_2415;
    float _2427 = -_1931;
    float _2429 = fma(_2425, _2407, _2427);
    float _2431 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2409);
    float _2433 = -_2411;
    float _2435 = fma(_192, _248, _2433);
    float _2437 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2439 = _192 * _250;
    float _2441 = fma(_2303, _2397, _2429);
    out.m_76.x = _2421;
    out.m_76.y = _2423;
    float _2443 = exp2(_2437);
    out.m_78.x = _2419;
    out.m_78.y = _2441;
    float _2445 = _190 * _248;
    float _2447 = -_2439;
    float _2449 = fma(_190, _334, _2447);
    float _2451 = -_2445;
    float _2453 = fma(_188, _250, _2451);
    out.m_80.x = _2431;
    float _2455 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _2457 = _2453 * _2453;
    float _2459 = float(_117);
    float _2461 = 1.0 / _2455;
    float _2463 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2465 = fma(_2435, _2435, _2457);
    float _2467 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2469 = precise::clamp(_2467, 0.0, 1.0);
    float _2471 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2463);
    float _2473 = fma(_2449, _2449, _2465);
    float _2475 = fma(_2469, -2.0, 3.0);
    float _2477 = _2469 * _2469;
    float _2479 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _2481 = (*spvDescriptorSet0.vp_c12)._m0[1].y + _2479;
    float _2483 = rsqrt(_2473);
    float _2485 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2471);
    float _2487 = _2477 * _2475;
    float _2489 = _2459 * _2461;
    float _2491 = -_2487;
    float _2493 = _2491 + 1.0;
    float _2495 = fma(_2481, _2489, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _2497 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2487);
    float _2499 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2485);
    float _2501 = _2493;
    float _2503 = _2489;
    float _2505 = _2435;
    if (_1447)
    {
        _2501 = 1.0;
    }
    float _2507 = _2501;
    float _2509 = _2507;
    if (_1447)
    {
        _2503 = 1.0;
    }
    float _2511 = _2503;
    float _2513 = _2511;
    if (!_1447)
    {
        float _2515 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2517 = _2515 * 0.15915493667125701904296875;
        float _2519 = _2517 * 6.283185482025146484375;
        float _2521 = cos(_2519);
        float _2523 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2525 = _2523 * 0.15915493667125701904296875;
        float _2527 = _2517 * 6.283185482025146484375;
        float _2529 = sin(_2527);
        float _2531 = 1.0 / _2521;
        float _2533 = _2525 * 6.283185482025146484375;
        float _2535 = cos(_2533);
        float _2537 = _2529 * _2531;
        float _2539 = _2525 * 6.283185482025146484375;
        float _2541 = sin(_2539);
        float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2545 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2543;
        float _2547 = _2535 * _2537;
        float _2549 = 1.0 / _2545;
        float _2551 = 1.0 / _2547;
        float _2553 = _2541 * _2551;
        float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2557 = fma(_542, _2553, _2555);
        float _2559 = _2557 * _2549;
        float _2561 = precise::clamp(_2559, 0.0, 1.0);
        _2513 = _2561;
    }
    float _2563 = _2513;
    if (!_1447)
    {
        float _2565 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2567 = _2565 * 0.15915493667125701904296875;
        float _2569 = _2567 * 6.283185482025146484375;
        float _2571 = cos(_2569);
        float _2573 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2575 = _2573 * 0.15915493667125701904296875;
        float _2577 = _2567 * 6.283185482025146484375;
        float _2579 = sin(_2577);
        float _2581 = 1.0 / _2571;
        float _2583 = _2575 * 6.283185482025146484375;
        float _2585 = cos(_2583);
        float _2587 = _2579 * _2581;
        float _2589 = _2575 * 6.283185482025146484375;
        float _2591 = sin(_2589);
        float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2595 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2593;
        float _2597 = _2585 * _2587;
        float _2599 = 1.0 / _2595;
        float _2601 = 1.0 / _2597;
        float _2603 = _2591 * _2601;
        float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2607 = fma(_542, _2603, _2605);
        float _2609 = _2607 * _2599;
        float _2611 = precise::clamp(_2609, 0.0, 1.0);
        float _2613 = -_2611;
        float _2615 = _2613 + 1.0;
        _2509 = _2615;
    }
    float _2617 = _2509;
    float _2619 = _2499 + _1118;
    float _2621 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2623 = _2563 * _2617;
    float _2625 = _2619 * 0.5;
    bool _2627 = _542 <= 8000.0;
    bool _2629 = isnan(_542);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan(8000.0);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = _2453 * _2483;
    float _2641 = exp2(_2621);
    float _2643 = _2623 * _2495;
    out.m_82.z = _2625;
    out.m_82.w = _1118;
    float _2645 = _2637 * _2497;
    float _2647 = _2435 * _2483;
    float _2649 = _2449 * _2483;
    float _2651 = -_1198;
    float _2653 = _2651 + 1.0;
    float _2655 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2657 = _1148;
    float _2659 = _2655;
    if (!_1096)
    {
        _2505 = 1.0;
    }
    float _2661 = _2505;
    float _2663 = _2653 * _2655;
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = _2661;
    if (_1096)
    {
        bool _2669 = _1222 >= _1136;
        bool _2671 = isnan(_1222);
        bool _2673 = _2669 || _2671;
        bool _2675 = isnan(_1136);
        bool _2677 = _2673 || _2675;
        float _2679 = float(_2677);
        _2667 = _2679;
    }
    float _2681 = _2667;
    out.gl_Position.x = _1148;
    out.gl_Position.y = _1168;
    out.gl_Position.z = _2499;
    out.gl_Position.w = _1118;
    float _2683 = -_2665;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2687 = -_2641;
    float _2689 = _2687 + 1.0;
    float _2691 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2693 = _2681;
    if (_720)
    {
        _2657 = 1.0;
    }
    float _2695 = _2657;
    float _2697 = _2695;
    if (!_720)
    {
        int _2699 = _926 << 4;
        int _2701 = _2699 + 2048;
        uint _2703 = uint(int(uint(_2701) >> uint(2)));
        uint _2705 = uint(int(uint(int(_2703)) >> uint(2)));
        int _2707 = int(_2703) & 3;
        float _2709 = (*spvDescriptorSet0.vp_c15)._m0[int(_2705)][_2707];
        int _2711 = int(_2703) + 1;
        uint _2713 = uint(int(uint(_2711) >> uint(2)));
        int _2715 = _2711 & 3;
        float _2717 = (*spvDescriptorSet0.vp_c15)._m0[int(_2713)][_2715];
        int _2719 = _2701 + 8;
        uint _2721 = uint(int(uint(_2719) >> uint(2)));
        uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
        int _2725 = int(_2721) & 3;
        float _2727 = (*spvDescriptorSet0.vp_c15)._m0[int(_2723)][_2725];
        int _2729 = int(_2721) + 1;
        uint _2731 = uint(int(uint(_2729) >> uint(2)));
        int _2733 = _2729 & 3;
        float _2735 = (*spvDescriptorSet0.vp_c15)._m0[int(_2731)][_2733];
        float _2737 = _492 * _2717;
        float _2739 = fma(_2709, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2737);
        float _2741 = fma(_2727, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2739);
        float _2743 = _2741 + _2735;
        float _2745 = precise::clamp(_2743, 0.0, 1.0);
        float _2747 = -_2745;
        float _2749 = _2747 + _1204;
        float _2751 = fma(_2749, 500.0, 1.5);
        float _2753 = exp2(_2751);
        float _2755 = 0.0 + _2753;
        float _2757 = precise::clamp(_2755, 0.0, 1.0);
        _2697 = _2757;
        _2659 = _2727;
        _1172 = _2753;
    }
    float _2759 = _2697;
    float _2761 = _2659;
    float _2763 = _1172;
    float _2765 = _2691 * _1224;
    float _2767 = _2681 * _2759;
    float _2769 = -_2691;
    float _2771 = _2769 + 1.0;
    out.m_84.x = _2647;
    out.m_84.y = _2639;
    out.m_84.z = _2649;
    float _2773 = _1235 * _2765;
    float _2775 = -_2767;
    float _2777 = fma(_2775, _2685, 1.0);
    float _2779 = precise::clamp(_2777, 0.0, 1.0);
    float _2781 = _1245 * _2765;
    bool _2783 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2785 = isnan(_500);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2791 = _2787 || _2789;
    float _2793 = fma(_1241, _2773, _1229);
    float _2795 = fma(_1243, _2773, _1231);
    float _2797 = _2779 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2799 = _1235 * _2771;
    float _2801 = fma(_1235, _2781, _1233);
    float _2803 = _2643 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_86.x = _2797;
    out.m_88.x = _2793;
    out.m_88.y = _2795;
    out.m_88.z = _2801;
    out.m_88.w = _2799;
    float _2805 = _2761;
    float _2807 = _2771;
    float _2809 = _2763;
    float _2811 = _2779;
    if (!_2791)
    {
        _2693 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2813 = _2693;
    float _2815 = _2813;
    float _2817 = _2813;
    if (!_2791)
    {
        _2805 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2819 = _2805;
    float _2821 = _2819;
    float _2823 = _2819;
    if (!_2791)
    {
        _1154 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2825 = _1154;
    float _2827 = _2825;
    float _2829 = _2825;
    if (!_2791)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2831 = _2807;
    float _2833 = _2831;
    float _2835 = _2831;
    if (!_2791)
    {
        _2809 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2837 = _2809;
    float _2839 = _2837;
    float _2841 = _2837;
    if (!_2791)
    {
        _2811 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2843 = _2811;
    bool _2845 = !_2791;
    float _2847 = _2843;
    float _2849 = _2843;
    if (!_2845)
    {
        bool _2851 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2853 = isnan(_500);
        bool _2855 = _2851 || _2853;
        bool _2857 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2859 = _2855 || _2857;
        if (!_2859)
        {
            float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2863 = _500 + _2861;
            float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2867 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2865;
            float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2873 = 1.0 / _2867;
            float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2891 = _2863 * _2873;
            float _2893 = precise::clamp(_2891, 0.0, 1.0);
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2899 = fma(_2893, _2871, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2901 = fma(_2893, _2897, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2903 = fma(_2893, _2877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2905 = fma(_2893, _2881, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2907 = fma(_2893, _2885, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2909 = fma(_2893, _2889, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2823 = _2903;
            _2841 = _2907;
            _2817 = _2899;
            _2835 = _2905;
            _2829 = _2901;
            _2849 = _2909;
            _2911 = true;
        }
        else
        {
            bool _2913 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2915 = isnan(_500);
            bool _2917 = _2913 || _2915;
            bool _2919 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2921 = _2917 || _2919;
            if (!_2921)
            {
                _2815 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2923 = _2815;
            _2817 = _2923;
            if (!_2921)
            {
                _2821 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2925 = _2821;
            _2823 = _2925;
            if (!_2921)
            {
                _2827 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2927 = _2827;
            _2829 = _2927;
            if (!_2921)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2929 = _2833;
            _2835 = _2929;
            if (!_2921)
            {
                _2839 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2931 = _2839;
            _2841 = _2931;
            if (!_2921)
            {
                _2847 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2933 = _2847;
            bool _2935 = !_2921;
            _2849 = _2933;
            if (!_2935)
            {
                bool _2937 = _500 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2939 = isnan(_500);
                bool _2941 = _2937 || _2939;
                bool _2943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2945 = _2941 || _2943;
                if (!_2945)
                {
                    float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2949 = _500 + _2947;
                    float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2953 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2951;
                    float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2959 = 1.0 / _2953;
                    float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2971 = _2969 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2977 = _2949 * _2959;
                    float _2979 = precise::clamp(_2977, 0.0, 1.0);
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2985 = fma(_2979, _2957, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2987 = fma(_2979, _2983, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2989 = fma(_2979, _2963, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2991 = fma(_2979, _2967, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2993 = fma(_2979, _2971, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2995 = fma(_2979, _2975, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2823 = _2989;
                    _2841 = _2993;
                    _2817 = _2985;
                    _2835 = _2991;
                    _2829 = _2987;
                    _2849 = _2995;
                    _2911 = true;
                }
                else
                {
                    _2823 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2841 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2817 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2829 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2849 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2911 = false;
    float _2997 = _2823;
    float _2999 = _2841;
    float _3001 = _2817;
    float _3003 = _2835;
    float _3005 = _2829;
    float _3007 = _2849;
    float _3009 = fma(_2639, -0.5, 0.5);
    float _3011 = precise::clamp(_3009, 0.0, 1.0);
    float _3013 = -_2997;
    float _3015 = _3013 + _2999;
    float _3017 = -_3001;
    float _3019 = _3017 + _3003;
    float _3021 = -_3005;
    float _3023 = _3021 + _3007;
    bool _3025 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3027 = fma(_3011, _3015, _2997);
    float _3029 = fma(_3011, _3019, _3001);
    float _3031 = fma(_3011, _3023, _3005);
    float _3033 = _2803 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3035 = _3027 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _3037 = fma(_3029, 0.298911988735198974609375, _3035);
    out.m_92.x = _3033;
    float _3039 = fma(_3031, 0.114477999508380889892578125, _3037);
    float _3041 = -_3039;
    float _3043 = _3029 + _3041;
    float _3045 = -_3039;
    float _3047 = _3027 + _3045;
    float _3049 = -_3039;
    float _3051 = _3031 + _3049;
    float _3053 = fma(_3043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3039);
    float _3055 = fma(_3047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3039);
    float _3057 = fma(_3051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3039);
    out.m_94.x = _3053;
    out.m_94.y = _3055;
    out.m_94.z = _3057;
    if (!_3025)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3059 = -_418;
    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3063 = -_426;
    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3067 = -_444;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3071 = _3061 * _3061;
    float _3073 = fma(_3065, _3065, _3071);
    float _3075 = fma(_3069, _3069, _3073);
    float _3077 = sqrt(_3075);
    float _3079 = rsqrt(_3075);
    float _3081 = -_3077;
    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3085 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = _3065 * _3079;
    float _3091 = _3061 * _3079;
    float _3093 = abs(_3087);
    float _3095 = log2(_3093);
    float _3097 = _3069 * _3079;
    float _3099 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3101 = _2639 * _3091;
    float _3103 = -_3091;
    float _3105 = -_3099;
    float _3107 = fma(_3103, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3105);
    float _3109 = fma(_2647, _3089, _3101);
    float _3111 = -_3097;
    float _3113 = fma(_3111, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3107);
    float _3115 = fma(_2649, _3097, _3109);
    float _3117 = precise::clamp(_3115, 0.0, 1.0);
    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3121 = _3113 + _3119;
    float _3123 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3125 = _3121 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3127 = precise::clamp(_3125, 0.0, 1.0);
    float _3129 = exp2(_3123);
    float _3131 = _3129 * _3127;
    float _3133 = _3117 * _3131;
    float _3135 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3137 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3139 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3135;
    out.m_90.y = _3137;
    out.m_90.z = _3139;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

