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

struct _37
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c12 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c10 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    constant _16* vp_c7 [[id(7)]];
    const device _37* vp_s0 [[id(8)]];
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
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2259 = false;
    bool _668 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = as_type<float>(int(gl_VertexIndex));
    float _104 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    int _111 = as_type<int>(_102) >> 2;
    int _113 = _111 + _109;
    int _115 = _113 * 96;
    int _117 = _115 + 32;
    uint _120 = uint(int(uint(_115) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_120)];
    float _122 = as_type<float>(_dmw0.x);
    int _124 = _115 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw0.y);
    int _130 = _115 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw0.z);
    int _136 = _115 + 12;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw0.w);
    uint _142 = uint(int(uint(_117) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_142)];
    float _144 = as_type<float>(_dmw2.x);
    int _146 = _117 + 4;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw2.y);
    int _152 = _117 + 8;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw2.z);
    int _158 = _115 + 16;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_160)];
    float _162 = as_type<float>(_dmw1.x);
    int _164 = _158 + 4;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>(_dmw1.y);
    int _170 = _158 + 8;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>(_dmw1.z);
    int _176 = _115 + 48;
    int _178 = as_type<int>(_102) & 2;
    bool _182 = _178 != 0;
    int _184 = as_type<int>(_102) & 1;
    bool _186 = _184 != 0;
    uint _188 = uint(int(uint(_176) >> uint(2)));
    packed_uint2 _dmw3 = *(const device packed_uint2*)&(*spvDescriptorSet0.vp_s0)._m0[int(_188)];
    float _190 = as_type<float>(_dmw3.x);
    int _192 = _176 + 4;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>(_dmw3.y);
    float _198 = -_128;
    float _200 = _198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _202 = _200 * _200;
    float _204 = _150 * _150;
    float _206 = -_122;
    float _208 = _206 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _210 = fma(_144, _144, _204);
    float _212 = -_134;
    float _214 = _212 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _216 = fma(_208, _208, _202);
    float _218 = fma(_156, _156, _210);
    float _220 = fma(_214, _214, _216);
    float _222 = rsqrt(_218);
    float _224 = rsqrt(_220);
    float _226 = _156 * _222;
    float _228 = _150 * _222;
    float _230 = _144 * _222;
    float _232 = _208 * _224;
    float _234 = _214 * _224;
    float _236 = _200 * _224;
    float _238 = _232 * _226;
    float _240 = _234 * _228;
    float _242 = -_238;
    float _244 = fma(_234, _230, _242);
    float _246 = _236 * _230;
    float _248 = -_240;
    float _250 = fma(_236, _226, _248);
    float _252 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _254 = _244 * _244;
    float _256 = -_246;
    float _258 = fma(_232, _228, _256);
    float _260 = _168 * _168;
    float _262 = fma(_250, _250, _254);
    float _264 = 1.0 / _252;
    float _266 = fma(_258, _258, _262);
    float _268 = fma(_162, _162, _260);
    float _270 = fma(_174, _174, _268);
    float _272 = rsqrt(_266);
    float _274 = float(_111);
    float _276 = rsqrt(_270);
    bool _278 = !_182;
    float _280 = _278 ? 1.0 : (-1.0);
    float _282 = _274 * _264;
    float _284 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _286 = _284 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _288 = abs(_140);
    float _290 = _288 * _280;
    float _292 = _290 * 0.5;
    float _294 = fma(_282, _286, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _296 = _244 * _272;
    float _298 = _258 * _272;
    float _300 = _294 * _292;
    float _302 = _250 * _272;
    float _304 = _162 * _276;
    float _306 = _168 * _276;
    float _308 = _174 * _276;
    float _310 = _272;
    float _312 = _174;
    float _314 = _276;
    float _316 = _102;
    float _318 = _308;
    float _320 = _304;
    if (!_186)
    {
        _310 = _302;
    }
    float _322 = _310;
    float _324 = _322;
    if (!_186)
    {
        _312 = _296;
    }
    float _326 = _312;
    float _328 = _326;
    if (!_186)
    {
        _314 = _298;
    }
    float _330 = _314;
    bool _332 = !_186;
    float _334 = _330;
    if (!_332)
    {
        float _336 = _308 * _302;
        float _338 = _306 * _298;
        float _340 = _304 * _296;
        float _342 = -_336;
        float _344 = fma(_304, _298, _342);
        float _346 = -_338;
        float _348 = fma(_308, _296, _346);
        float _350 = -_340;
        float _352 = fma(_306, _302, _350);
        float _354 = _344 * _344;
        float _356 = fma(_348, _348, _354);
        float _358 = fma(_352, _352, _356);
        float _360 = rsqrt(_358);
        float _362 = _348 * _360;
        float _364 = _344 * _360;
        float _366 = _352 * _360;
        _324 = _362;
        _334 = _366;
        _328 = _364;
    }
    float _368 = _324;
    float _370 = _334;
    float _372 = _328;
    float _374 = -_300;
    float _376 = fma(_368, _374, _122);
    float _378 = -_300;
    float _380 = fma(_370, _378, _134);
    float _382 = -_300;
    float _384 = fma(_372, _382, _128);
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _388 = _376 + _386;
    float _390 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _392 = _380 + _390;
    float _394 = _388 * _388;
    float _396 = _392 * _392;
    float _398 = _394 + _396;
    float _400 = sqrt(_398);
    bool _402 = _400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _404 = _394;
    float _406 = _396;
    float _408 = _376;
    float _410 = _380;
    float _412 = _388;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_402)
    {
        _316 = _384;
    }
    float _416 = _316;
    bool _418 = !_402;
    float _420 = _416;
    float _422 = 0.0;
    if (!_418)
    {
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _428 = _400 + _426;
        float _430 = _384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _432 = rsqrt(_398);
        float _434 = _428 * _424;
        float _436 = _434 * 0.15915493667125701904296875;
        float _438 = _436 * 6.283185482025146484375;
        float _440 = sin(_438);
        float _442 = _436 * 6.283185482025146484375;
        float _444 = cos(_442);
        float _446 = fma(_440, _430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _448 = _432 * _446;
        float _450 = _444 + (-1.0);
        float _452 = fma(_388, _448, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _454 = fma(_392, _448, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _456 = _450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _460 = _452 + _458;
        float _462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _464 = _454 + _462;
        float _466 = fma(_384, _444, _456);
        float _468 = _460 * _460;
        float _470 = _464 * _464;
        _420 = _466;
        _404 = _468;
        _406 = _470;
        _422 = _448;
        _408 = _452;
        _410 = _454;
    }
    float _472 = _420;
    float _474 = _404;
    float _476 = _406;
    float _478 = _422;
    float _480 = _408;
    float _482 = _410;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _486 = _484 != 0;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _490 = _472 + _488;
    float _492 = _308 * _372;
    float _494 = _306 * _368;
    float _496 = fma(_490, _490, _474);
    float _498 = _304 * _370;
    float _500 = -_492;
    float _502 = fma(_306, _370, _500);
    float _504 = _496 + _476;
    float _506 = -_498;
    float _508 = fma(_308, _368, _506);
    float _510 = -_494;
    float _512 = fma(_304, _372, _510);
    float _514 = 0.0;
    float _516 = _478;
    float _518 = _494;
    float _520 = _504;
    float _522 = (*spvDescriptorSet0.vp_c12)._m0[3].z;
    if (_486)
    {
        _514 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _524 = _514;
    float _526 = sqrt(_504);
    float _528 = _524;
    if (_486)
    {
        _516 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _530 = _516;
    float _532 = 0.0;
    float _534 = _530;
    if (_486)
    {
        _532 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _536 = _532;
    float _538 = _536;
    if (_486)
    {
        float _540 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _542 = _524 + _540;
        _528 = _542;
    }
    float _544 = _528;
    if (_486)
    {
        float _546 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _548 = _530 + _546;
        _534 = _548;
    }
    float _550 = _534;
    if (_486)
    {
        float _552 = _544 * _544;
        _318 = _552;
    }
    float _554 = _318;
    if (_486)
    {
        float _556 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _558 = _536 + _556;
        _538 = _558;
    }
    float _560 = _538;
    if (_486)
    {
        float _562 = fma(_550, _550, _554);
        _412 = _562;
    }
    float _564 = _412;
    float _566 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _570 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _572 = 0.0;
    if (_486)
    {
        float _574 = fma(_560, _560, _564);
        _572 = _574;
    }
    float _576 = _572;
    float _578 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _580 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _582 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _584 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _586 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _588 = _576;
    if (_486)
    {
        float _590 = rsqrt(_576);
        _588 = _590;
    }
    float _592 = _588;
    out.m_70.x = _502;
    out.m_70.y = _508;
    out.m_70.z = _512;
    bool _594 = _526 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _596 = isnan(_526);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _602 = _598 || _600;
    if (!_486)
    {
        _518 = 0.0;
        _520 = 0.0;
    }
    float _604 = _518;
    float _606 = _520;
    float _608 = _604;
    float _610 = _606;
    if (!_486)
    {
        _522 = 0.0;
    }
    float _612 = _522;
    out.m_72.x = _580;
    out.m_72.y = _582;
    out.m_72.z = _566;
    out.m_72.w = _568;
    out.m_74.x = _570;
    out.m_74.y = _578;
    out.m_74.z = _584;
    out.m_74.w = _586;
    float _614 = _612;
    if (!_602)
    {
        _320 = 1.0;
    }
    float _616 = _320;
    float _618 = 0.0;
    float _620 = _616;
    if (_486)
    {
        float _622 = _592 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _618 = _622;
    }
    float _624 = _618;
    if (_486)
    {
        float _626 = _550 * _624;
        _614 = _626;
    }
    float _628 = _614;
    if (_486)
    {
        float _630 = _544 * _624;
        _608 = _630;
    }
    float _632 = _608;
    if (_486)
    {
        float _634 = _560 * _624;
        _610 = _634;
    }
    float _636 = _610;
    bool _638 = !_602;
    if (!_638)
    {
        bool _640 = _526 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _642 = isnan(_526);
        bool _644 = _640 || _642;
        bool _646 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _648 = _644 || _646;
        if (!_648)
        {
            float _650 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _652 = _526 + _650;
            float _654 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _656 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _654;
            float _658 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _660 = _658 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _662 = 1.0 / _656;
            float _664 = _652 * _662;
            float _666 = fma(_664, _660, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _620 = _666;
            _668 = true;
        }
        else
        {
            bool _670 = _526 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _672 = isnan(_526);
            bool _674 = _670 || _672;
            bool _676 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _678 = _674 || _676;
            if (!_678)
            {
                float _680 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _682 = _526 + _680;
                float _684 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _686 = _684 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _688 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _690 = _688 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _692 = 1.0 / _686;
                float _694 = _682 * _692;
                float _696 = fma(_694, _690, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _620 = _696;
                _668 = true;
            }
            else
            {
                _620 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _668 = false;
    float _698 = _620;
    float _700 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _702 = _472 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _706 = _480 + _704;
    float _708 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _710 = _482 + _708;
    float _712 = _128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _714 = fma(_702, _698, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _716 = fma(_706, _698, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _718 = fma(_710, _698, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _720 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[2].x, _712);
    float _722 = _714 + _632;
    float _724 = _716 + _628;
    float _726 = _718 + _636;
    float _728 = _128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = _722 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _736 = _724 + _734;
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _740 = _726 + _738;
    float _742 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[1].x, _728);
    float _744 = _732 * _732;
    float _746 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[2].z, _720);
    float _748 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[1].z, _742);
    float _750 = fma(_736, _736, _744);
    float _752 = _746 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _754 = _748 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _756 = fma(_740, _740, _750);
    float _758 = _128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _760 = _128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _762 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _764 = rsqrt(_756);
    float _766 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[0].x, _758);
    float _768 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[3].x, _760);
    float _770 = _762 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _772 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[0].z, _766);
    float _774 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[3].z, _768);
    float _776 = sqrt(_756);
    float _778 = _772 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _780 = _774 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _782 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _784 = _764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _786 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _788 = floor(_782);
    float _790 = _740 * _784;
    float _792 = _754 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _794 = _736 * _784;
    float _796 = _790 * _790;
    float _798 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[7].x, _792);
    float _800 = _794 * _794;
    float _802 = floor(_786);
    float _804 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _798);
    float _806 = _754 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _808 = _800 + _796;
    float _810 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _804);
    float _812 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[6].x, _806);
    float _814 = sqrt(_808);
    float _816 = -_788;
    float _818 = _782 + _816;
    float _820 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _812);
    float _822 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _820);
    float _824 = 1.0 / _810;
    float _826 = _822 + _810;
    bool _828 = _814 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _830 = _770 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _832 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _830);
    float _834 = _826 * _824;
    float _836 = _834 * 0.5;
    float _838 = _770 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _840 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _832);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _844 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[30].w, _842);
    float _846 = _804;
    float _848 = _814;
    float _850 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _852 = _794;
    float _854 = _790;
    float _856 = _796;
    float _858 = _782;
    bool _860 = _828;
    if (_828)
    {
        float _862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _862;
    }
    float _864 = _846;
    float _866 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _838);
    float _868 = _840 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _870 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _866);
    float _872 = 1.0 / _844;
    float _874 = _870 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _878 = _814 + _876;
    float _880 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _882 = _878;
    if (_828)
    {
        float _884 = _878 * _864;
        _882 = _884;
    }
    float _886 = _882;
    float _888 = precise::max(0.0, _880);
    float _890 = trunc(_874);
    int _892 = int(_890);
    if (_828)
    {
        float _894 = _886 * 0.15915493667125701904296875;
        _848 = _894;
    }
    float _896 = _848;
    float _898 = _722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _900 = -_784;
    float _902 = -_888;
    float _904 = fma(_732, _900, _902);
    float _906 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _910 = _872 * _908;
    float _912 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[2].x, _898);
    float _914 = _864;
    int _916 = 2;
    float _918 = _904;
    if (_828)
    {
        float _920 = _896 * 6.283185482025146484375;
        float _922 = sin(_920);
        _914 = _922;
    }
    float _924 = _914;
    if (_828)
    {
        float _926 = _904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _850 = _926;
    }
    float _928 = _850;
    bool _930 = _910 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _932 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _912);
    bool _934 = _910 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _936 = !_930;
    int _938 = _936 ? 0 : 1;
    float _940 = _932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _942 = trunc(_868);
    int _944 = int(_942);
    int _946 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _948 = _892 + _946;
    int _950 = _948 + 1;
    float _952 = _940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _954 = _928;
    float _956 = as_type<float>(_938);
    if (!_930)
    {
        _916 = 1;
    }
    int _958 = _916;
    float _960 = _932;
    int _962 = _958;
    if (_828)
    {
        float _964 = _896 * 6.283185482025146484375;
        float _966 = cos(_964);
        _960 = _966;
    }
    float _968 = _960;
    if (!_934)
    {
        _962 = _938;
    }
    int _970 = _962;
    float _972 = -_952;
    float _974 = fma(_972, _906, 1.0);
    float _976 = _722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_828)
    {
        float _978 = fma(_924, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _954 = _978;
    }
    float _980 = _954;
    int _982 = _970 << 6;
    bool _984 = _950 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _986 = _808;
    float _988 = _980;
    float _990 = as_type<float>(_982);
    if (_828)
    {
        float _992 = rsqrt(_808);
        _986 = _992;
    }
    float _994 = _986;
    int _996 = _982 + 96;
    uint _998 = uint(int(uint(_996) >> uint(2)));
    uint _1000 = uint(int(uint(int(_998)) >> uint(2)));
    int _1002 = int(_998) & 3;
    float _1004 = (*spvDescriptorSet0.vp_c15)._m0[int(_1000)][_1002];
    int _1006 = int(_998) + 1;
    uint _1008 = uint(int(uint(_1006) >> uint(2)));
    int _1010 = _1006 & 3;
    float _1012 = (*spvDescriptorSet0.vp_c15)._m0[int(_1008)][_1010];
    int _1014 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1016 = _944 + _1014;
    int _1018 = _1016 + 1;
    float _1020 = as_type<float>(_1018);
    if (_828)
    {
        float _1022 = _968 + (-1.0);
        _956 = _1022;
    }
    float _1024 = _956;
    int _1026 = _982 + 48;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    float _1044 = log2(_974);
    float _1046 = _1024;
    if (_828)
    {
        float _1048 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1046 = _1048;
    }
    float _1050 = _1046;
    if (_828)
    {
        float _1052 = fma(_904, _968, _1050);
        _918 = _1052;
    }
    float _1054 = _918;
    int _1056 = _982 + 104;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    uint _1060 = uint(int(uint(int(_1058)) >> uint(2)));
    int _1062 = int(_1058) & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    int _1066 = int(_1058) + 1;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    int _1070 = _1066 & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    float _1074 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[1].x, _976);
    if (_828)
    {
        float _1076 = _994 * _980;
        _988 = _1076;
    }
    float _1078 = _988;
    int _1080 = _950 | _1018;
    float _1082 = _722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1084 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1074);
    if (_828)
    {
        float _1086 = _794 * _1078;
        _852 = _1086;
    }
    float _1088 = _852;
    bool _1090 = _1080 < 0;
    bool _1092 = _1090 || _984;
    int _1094 = _982 + 64;
    uint _1096 = uint(int(uint(_1094) >> uint(2)));
    uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
    int _1100 = int(_1096) & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = int(_1096) + 1;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    int _1108 = _1104 & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    float _1112 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1082);
    float _1114 = _1112;
    if (_828)
    {
        float _1116 = _790 * _1078;
        _854 = _1116;
    }
    float _1118 = _854;
    float _1120 = _722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1122 = _1018 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1124 = _1122 || _1092;
    float _1126 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1112);
    if (!_828)
    {
        _1114 = _800;
    }
    float _1128 = _1114;
    float _1130 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1132 = _982 + 56;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
    int _1138 = int(_1134) & 3;
    float _1140 = (*spvDescriptorSet0.vp_c15)._m0[int(_1136)][_1138];
    int _1142 = int(_1134) + 1;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    int _1146 = _1142 & 3;
    float _1148 = (*spvDescriptorSet0.vp_c15)._m0[int(_1144)][_1146];
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1152 = fma(_776, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1150);
    float _1154 = precise::clamp(_1152, 0.0, 1.0);
    float _1156 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1120);
    float _1158 = _1128;
    if (_828)
    {
        float _1160 = _1088 * _1088;
        _1158 = _1160;
    }
    float _1162 = _1158;
    if (_828)
    {
        float _1164 = _1118 * _1118;
        _856 = _1164;
    }
    float _1166 = _856;
    float _1168 = -_1154;
    float _1170 = _1168 + 1.0;
    float _1172 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1156);
    float _1174 = fma(_1054, _1054, _1162);
    int _1176 = _982 + 72;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
    int _1182 = int(_1178) & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    int _1186 = int(_1178) + 1;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    int _1190 = _1186 & 3;
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[int(_1188)][_1190];
    float _1194 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1196 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1198 = _1174 + _1166;
    float _1200 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1202 = abs(_1170);
    float _1204 = log2(_1202);
    float _1206 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1194);
    float _1208 = _1044 * 0.693147182464599609375;
    int _1210 = _982 + 80;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    uint _1214 = uint(int(uint(int(_1212)) >> uint(2)));
    int _1216 = int(_1212) & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    int _1220 = int(_1212) + 1;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    int _1224 = _1220 & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    float _1228 = _770 * _1012;
    float _1230 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1206);
    float _1232 = fma(_1004, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1228);
    float _1234 = rsqrt(_1198);
    float _1236 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1230);
    float _1238 = _770 * _1042;
    int _1240 = _982 + 88;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    uint _1244 = uint(int(uint(int(_1242)) >> uint(2)));
    int _1246 = int(_1242) & 3;
    float _1248 = (*spvDescriptorSet0.vp_c15)._m0[int(_1244)][_1246];
    int _1250 = int(_1242) + 1;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    int _1254 = _1250 & 3;
    float _1256 = (*spvDescriptorSet0.vp_c15)._m0[int(_1252)][_1254];
    float _1258 = fma(_1034, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1238);
    int _1260 = as_type<int>(_1034);
    int _1262 = as_type<int>(_1072);
    int _1264 = as_type<int>(_1258);
    float _1266 = _1236;
    if (!_1124)
    {
        int _1268 = _1018 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1270 = _1268 + _950;
        _1260 = _1270;
    }
    int _1272 = _1260;
    float _1274 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1276 = 1.0 / _1236;
    float _1278 = fma(_1064, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1232);
    float _1280 = _1278 + _1072;
    if (!_1124)
    {
        int _1282 = _1272 << 2;
        _1262 = _1282;
    }
    int _1284 = _1262;
    float _1286 = _1234 * _1088;
    float _1288 = _1234 * _1054;
    float _1290 = _770 * _1110;
    float _1292 = _1234 * _1118;
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _1296 = as_type<int>(_1286);
    float _1298 = _1234;
    if (!_1124)
    {
        int _1300 = 12 & _1284;
        _1296 = _1300;
    }
    int _1302 = _1296;
    float _1304 = fma(_1102, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1290);
    float _1306 = exp2(_1274);
    float _1308 = -_1294;
    float _1310 = fma(_1288, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1308);
    float _1312 = fma(_1140, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1258);
    int _1314 = _1302;
    float _1316 = _1310;
    if (!_1124)
    {
        uint _1318 = uint(int(uint(_1272) >> uint(2)));
        _1264 = int(_1318);
    }
    int _1320 = _1264;
    float _1322 = _1312 + _1148;
    float _1324 = 1.0 / _1280;
    if (!_1124)
    {
        int _1326 = _1320 << 4;
        int _1328 = _1326 + _1302;
        _1314 = _1328;
    }
    int _1330 = _1314;
    float _1332 = -_802;
    float _1334 = _786 + _1332;
    float _1336 = fma(_1184, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1304);
    float _1338 = -_1292;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1310);
    float _1342 = _1336 + _1192;
    float _1344 = _1292;
    if (!_1124)
    {
        float _1346 = floor(_868);
        _1344 = _1346;
    }
    float _1348 = _1344;
    float _1350 = fma(_1340, -0.5, 0.5);
    float _1352 = _770 * _1226;
    float _1354 = fma(_1340, 0.5, 0.5);
    float _1356 = fma(_1218, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1352);
    float _1358 = _1322 * _1324;
    float _1360 = _1342 * _1324;
    float _1362 = _1322;
    float _1364 = _1350;
    float _1366 = _1360;
    if (!_1124)
    {
        int _1368 = _1330 + 400;
        uint _1370 = uint(int(uint(_1368) >> uint(2)));
        uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
        int _1374 = int(_1370) & 3;
        float _1376 = (*spvDescriptorSet0.vp_c15)._m0[int(_1372)][_1374];
        _1362 = _1376;
    }
    float _1378 = _1362;
    float _1380 = sqrt(_1350);
    float _1382 = fma(_1248, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1356);
    bool _1384 = _1358 >= 0.0;
    float _1386 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1388 = _1382 + _1256;
    bool _1390 = _1358 <= 1.0;
    bool _1392 = _1390 && _1384;
    float _1394 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1396 = _802;
    float _1398 = _1348;
    if (!_1124)
    {
        float _1400 = floor(_874);
        _1396 = _1400;
    }
    float _1402 = _1396;
    bool _1404 = _1360 >= 0.0;
    bool _1406 = _1404 && _1392;
    float _1408 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1386);
    float _1410 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1394);
    float _1412 = fma(_1354, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _1414 = _1360 <= 1.0;
    bool _1416 = _1414 && _1406;
    if (!_1124)
    {
        float _1418 = -_1348;
        float _1420 = _868 + _1418;
        _1398 = _1420;
    }
    float _1422 = _1398;
    float _1424 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1408);
    float _1426 = fma(_1354, _1412, -0.212114393711090087890625);
    float _1428 = _1288 + 1.0;
    float _1430 = _1380 * 0.636619746685028076171875;
    float _1432 = fma(_1354, _1426, 1.570728778839111328125);
    float _1434 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1424);
    float _1436 = _868;
    if (!_1124)
    {
        float _1438 = rint(_1378);
        float _1440 = precise::max(_1438, 0.0);
        uint _1442 = uint(_1440);
        uint _1444 = clamp(_1442, 0u, 65535u);
        _1436 = as_type<float>(_1444);
    }
    float _1446 = _1436;
    float _1448 = -_1288;
    float _1450 = fma(_1306, _1428, _1448);
    float _1452 = _1402;
    float _1454 = _1450;
    if (!_1124)
    {
        float _1456 = -_1402;
        float _1458 = _874 + _1456;
        _858 = _1458;
    }
    float _1460 = _858;
    float _1462 = _1388 * _1324;
    if (_1416)
    {
        float _1464 = float(_970);
        _1364 = _1464;
    }
    float _1466 = _1364;
    float _1468 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1410);
    float _1470 = _1434 * _1276;
    float _1472 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1474 = -_1432;
    float _1476 = fma(_1430, _1474, 1.0);
    float _1478 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1468);
    float _1480 = _1466;
    if (_1416)
    {
        float _1482 = rint(_1466);
        float _1484 = precise::max(_1482, 0.0);
        uint _1486 = uint(_1484);
        uint _1488 = clamp(_1486, 0u, 65535u);
        _1480 = as_type<float>(_1488);
    }
    float _1490 = _1480;
    float _1492 = fma(_1470, 0.5, 0.5);
    float _1494 = fma(_1450, 0.5, 0.5);
    float _1496 = _1478 * _1276;
    float2 _4809 = float2(_1334, _818);
    float _1498 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4809, float2(0.0), isnan(_4809)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4809, float2(0.0), isnan(_4809)), level(0.0)).x;
    float _1500 = fma(_1496, -0.5, 0.5);
    float _1502 = _874;
    if (!_1124)
    {
        float3 _4828 = float3(_1460, _1422, float(as_type<int>(_1446)));
        float3 _4832 = select(_4828, float3(0.0), isnan(_4828));
        float _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4832.xy, uint(rint(_4832.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4832.xy, uint(rint(_4832.z)), level(0.0)).x;
        _1502 = _1504;
    }
    float _1506 = _1502;
    float _1508 = _1490;
    if (_1416)
    {
        float3 _4847 = float3(_1358, _1360, float(as_type<int>(_1490)));
        float3 _4849 = select(_4847, float3(0.0), isnan(_4847));
        float _1510 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4849.xy, uint(rint(_4849.z)), _1462, level(0.0));
        _1508 = _1510;
    }
    float _1512 = _1508;
    float3 _4859 = float3(_1492, _1500, _1472);
    float _1514 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4859, float3(0.0), isnan(_4859)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4859, float3(0.0), isnan(_4859)), level(0.0)).x;
    float3 _4868 = float3(_1492, _1500, _1472);
    float4 _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4868, float3(0.0), isnan(_4868)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4868, float3(0.0), isnan(_4868)), level(0.0)).xyzw;
    float _1519 = _1517.x;
    float _1521 = _1517.y;
    float _1523 = _1517.z;
    float _1525 = _1517.w;
    float2 _4884 = float2(_1476, _1494);
    float3 _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4884, float2(0.0), isnan(_4884)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4884, float2(0.0), isnan(_4884)), level(0.0)).xyz;
    float _1531 = _1529.x;
    float _1533 = _1529.y;
    float _1535 = _1529.z;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1539 = _1537 != 0;
    float _1541 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1545 = _1543 != 0;
    float _1547 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1551 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1541);
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1555 = _1545;
    if (_1539)
    {
        _1452 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1557 = _1452;
    if (!_1539)
    {
        float _1559 = -_190;
        float _1561 = (-0.0) + _1559;
        _1020 = _1561;
    }
    float _1563 = _1020;
    float _1565 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1553);
    float _1567 = _1563;
    if (_1539)
    {
        bool _1569 = _1557 > 0.5;
        _860 = _1569;
    }
    bool _1571 = _860;
    if (_1545)
    {
        _1366 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1573 = _1366;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1577 = _1573;
    if (_1539)
    {
        float _1579 = -_190;
        float _1581 = _1571 ? _190 : _1579;
        _1567 = _1581;
    }
    float _1583 = _1567;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1589 = _1587 != 0;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1593 = !_182;
    float _1595 = _1593 ? 0.0 : 1.0;
    float _1597 = fma(_1585, -2.0, _1575);
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1601 = _1599 != 0;
    float _1603 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1591);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1607 = _1605 != 0;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1611 = abs(_910);
    float _1613 = log2(_1611);
    bool _1615 = false;
    float _1617 = _1595;
    if (_1545)
    {
        bool _1619 = _1573 > 0.5;
        _1615 = _1619;
    }
    bool _1621 = _1615;
    float _1623 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1551);
    bool _1625 = _1621;
    if (!_1545)
    {
        _990 = _1595;
    }
    float _1627 = _990;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1631 = _1627;
    if (_1589)
    {
        _414 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1633 = _414;
    float _1635 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1623);
    float _1637 = _1633;
    if (_1545)
    {
        float _1639 = -_1595;
        float _1641 = _1621 ? _1639 : _1595;
        _1631 = _1641;
    }
    float _1643 = _1631;
    float _1645 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1629);
    if (_1589)
    {
        bool _1647 = _1633 > 0.5;
        _1625 = _1647;
    }
    bool _1649 = _1625;
    if (!_1589)
    {
        float _1651 = -_196;
        float _1653 = (-0.0) + _1651;
        _1637 = _1653;
    }
    float _1655 = _1637;
    float _1657 = exp2(_1547);
    float _1659 = _1655;
    if (!_1601)
    {
        _1316 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1661 = _1316;
    float _1663 = _1661;
    if (_1589)
    {
        float _1665 = -_196;
        float _1667 = _1649 ? _196 : _1665;
        _1659 = _1667;
    }
    float _1669 = _1659;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1673 = _1671;
    if (_1601)
    {
        _1663 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1675 = _1663;
    float _1677 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1645);
    float _1679 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1597);
    if (!_1601)
    {
        _1298 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1681 = _1298;
    float _1683 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1671);
    float _1685 = _1681;
    if (_1601)
    {
        _1685 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1687 = _1685;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (!_1601)
    {
        _1673 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1691 = _1673;
    float _1693 = _1677 * (-0.15915493667125701904296875);
    float _1695 = _1691;
    if (_1601)
    {
        _1695 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1697 = _1695;
    float _1699 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1689);
    if (!_1601)
    {
        _1454 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1701 = _1454;
    float _1703 = _1693 * 6.283185482025146484375;
    float _1705 = sin(_1703);
    float _1707 = _1701;
    if (_1601)
    {
        _1707 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1709 = _1707;
    float _1711 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1713 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1699);
    float _1715 = 0.0;
    if (!_1601)
    {
        _1715 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1717 = _1715;
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1721 = _1693 * 6.283185482025146484375;
    float _1723 = cos(_1721);
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1727 = _1717;
    if (_1601)
    {
        _1727 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1729 = _1727;
    float _1731 = _1713 * (-0.15915493667125701904296875);
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1735 = fma(_1719, -2.0, _1725);
    if (_1607)
    {
        _1577 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1737 = _1577;
    float _1739 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1609);
    float _1741 = _1731 * 6.283185482025146484375;
    float _1743 = cos(_1741);
    float _1745 = _1583 + 0.5;
    float _1747 = -_1733;
    float _1749 = fma(_1711, 2.0, _1747);
    float _1751 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1603);
    float _1753 = _1643 + (-0.5);
    float _1755 = _1745 * _1705;
    if (_1607)
    {
        bool _1757 = _1737 > 0.5;
        _1555 = _1757;
    }
    bool _1759 = _1555;
    float _1761 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1565);
    float _1763 = _1731 * 6.283185482025146484375;
    float _1765 = sin(_1763);
    float _1767 = _1745 * _1723;
    float _1769 = -_1755;
    float _1771 = fma(_1753, _1723, _1769);
    if (_1607)
    {
        float _1773 = -_1595;
        float _1775 = _1759 ? _1773 : _1595;
        _1617 = _1775;
    }
    float _1777 = _1617;
    float _1779 = fma(_1753, _1705, _1767);
    float _1781 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1783 = _1669 + 0.5;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1791 = _1783 * _1743;
    float _1793 = _1777 + (-0.5);
    float _1795 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1683);
    float _1797 = -_1785;
    float _1799 = fma(_1789, 2.0, _1797);
    float _1801 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1739);
    float _1803 = _1783 * _1765;
    float _1805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1807 = fma(_1793, _1765, _1791);
    float _1809 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1799);
    float _1811 = -_1803;
    float _1813 = fma(_1793, _1743, _1811);
    float _1815 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1817 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1749);
    float _1819 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1735);
    float _1821 = _1771 + 0.5;
    float _1823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1825 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1827 = _1779 + (-0.5);
    float _1829 = _1813 + 0.5;
    float _1831 = _1635 + _1236;
    float _1833 = fma(_1825, _1821, _1809);
    float _1835 = -_1781;
    float _1837 = -_1679;
    float _1839 = fma(_1835, _1827, _1837);
    float _1841 = _1807 + (-0.5);
    float _1843 = exp2(_1815);
    float _1845 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1847 = _1831 * 0.5;
    float _1849 = fma(_1845, _1829, _1817);
    float _1851 = -_1801;
    float _1853 = _1851 + 1.0;
    float _1855 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1857 = -_1751;
    float _1859 = _1857 + 1.0;
    float _1861 = -_1761;
    float _1863 = _1861 + 1.0;
    out.m_76.z = _1847;
    out.m_76.w = _1236;
    float _1865 = -_1855;
    float _1867 = -_1819;
    float _1869 = fma(_1865, _1841, _1867);
    float _1871 = -_1795;
    float _1873 = _1871 + 1.0;
    out.gl_Position.x = _1434;
    out.gl_Position.y = _1478;
    out.gl_Position.z = _1635;
    out.gl_Position.w = _1236;
    float _1875 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = fma(_1807, _1853, _1869);
    float _1881 = -_1859;
    float _1883 = fma(_1771, _1881, _1833);
    float _1885 = fma(_1877, -2.0, 3.0);
    float _1887 = _1877 * _1877;
    bool _1889 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan(0.5);
    bool _1897 = _1893 || _1895;
    float _1899 = fma(_1779, _1863, _1839);
    float _1901 = -_1873;
    float _1903 = fma(_1813, _1901, _1849);
    float _1905 = _1887 * _1885;
    float _1907 = -_1905;
    float _1909 = _1907 + 1.0;
    bool _1911 = _910 <= 8000.0;
    bool _1913 = isnan(_910);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(8000.0);
    bool _1919 = _1915 || _1917;
    float _1921 = float(_1919);
    out.m_78.x = _1883;
    out.m_78.y = _1899;
    out.m_78.z = _1903;
    out.m_78.w = _1879;
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1905);
    float _1925 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1927 = _1925 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1929 = _1921 * _1923;
    float _1931 = _1921;
    float _1933 = _1927;
    if (_1897)
    {
        _1931 = 1.0;
    }
    float _1935 = _1931;
    float _1937 = fma(_282, _1927, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1939 = _1935;
    if (!_1897)
    {
        float _1941 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1943 = _1941 * 0.15915493667125701904296875;
        float _1945 = _1943 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        float _1949 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1951 = _1949 * 0.15915493667125701904296875;
        float _1953 = _1943 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        float _1957 = 1.0 / _1947;
        float _1959 = _1951 * 6.283185482025146484375;
        float _1961 = cos(_1959);
        float _1963 = _1955 * _1957;
        float _1965 = _1951 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1961 * _1963;
        float _1971 = 1.0 / _1969;
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1975 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1973;
        float _1977 = 1.0 / _1975;
        float _1979 = _1967 * _1971;
        float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1983 = fma(_910, _1979, _1981);
        float _1985 = _1983 * _1977;
        float _1987 = precise::clamp(_1985, 0.0, 1.0);
        float _1989 = -_1987;
        float _1991 = _1989 + 1.0;
        _1939 = _1991;
        _1933 = _1971;
        _1266 = _1957;
    }
    float _1993 = _1939;
    float _1995 = _1933;
    float _1997 = _1266;
    float _1999 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2001 = -_1498;
    float _2003 = _2001 + 1.0;
    float _2005 = -_1657;
    float _2007 = _2005 + 1.0;
    float _2009 = _1937 * _1993;
    float _2011 = _2003 * _1999;
    float _2013 = precise::clamp(_2011, 0.0, 1.0);
    float _2015 = _1999;
    float _2017 = _2013;
    float _2019 = _1997;
    float _2021 = _1995;
    if (!_1416)
    {
        _2015 = 1.0;
    }
    float _2023 = _2015;
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2027 = _2023;
    if (_1416)
    {
        bool _2029 = _1512 >= _1462;
        bool _2031 = isnan(_1512);
        bool _2033 = _2029 || _2031;
        bool _2035 = isnan(_1462);
        bool _2037 = _2033 || _2035;
        float _2039 = float(_2037);
        _2027 = _2039;
    }
    float _2041 = _2027;
    float _2043 = -_2013;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2047 = _2045;
    float _2049 = 1.0;
    if (!_1124)
    {
        int _2051 = _1272 << 4;
        int _2053 = _2051 + 2048;
        uint _2055 = uint(int(uint(_2053) >> uint(2)));
        uint _2057 = uint(int(uint(int(_2055)) >> uint(2)));
        int _2059 = int(_2055) & 3;
        float _2061 = (*spvDescriptorSet0.vp_c15)._m0[int(_2057)][_2059];
        int _2063 = int(_2055) + 1;
        uint _2065 = uint(int(uint(_2063) >> uint(2)));
        int _2067 = _2063 & 3;
        float _2069 = (*spvDescriptorSet0.vp_c15)._m0[int(_2065)][_2067];
        int _2071 = _2053 + 8;
        uint _2073 = uint(int(uint(_2071) >> uint(2)));
        uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
        int _2077 = int(_2073) & 3;
        float _2079 = (*spvDescriptorSet0.vp_c15)._m0[int(_2075)][_2077];
        int _2081 = int(_2073) + 1;
        uint _2083 = uint(int(uint(_2081) >> uint(2)));
        int _2085 = _2081 & 3;
        float _2087 = (*spvDescriptorSet0.vp_c15)._m0[int(_2083)][_2085];
        float _2089 = _770 * _2069;
        float _2091 = fma(_2061, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2089);
        float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2091);
        float _2095 = _2093 + _2087;
        float _2097 = precise::clamp(_2095, 0.0, 1.0);
        float _2099 = -_2097;
        float _2101 = _2099 + _1506;
        float _2103 = fma(_2101, 500.0, 1.5);
        float _2105 = exp2(_2103);
        float _2107 = 0.0 + _2105;
        float _2109 = precise::clamp(_2107, 0.0, 1.0);
        _2049 = _2109;
        _2017 = _2105;
    }
    float _2111 = _2049;
    float _2113 = _2017;
    float _2115 = _2025 * _1514;
    float _2117 = _2041 * _2111;
    float _2119 = -_2025;
    float _2121 = _2119 + 1.0;
    bool _2123 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2125 = isnan(_776);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2131 = _2127 || _2129;
    float _2133 = _1525 * _2115;
    float _2135 = -_2117;
    float _2137 = fma(_2135, _2045, 1.0);
    float _2139 = precise::clamp(_2137, 0.0, 1.0);
    float _2141 = _1535 * _2115;
    float _2143 = fma(_1531, _2133, _1519);
    float _2145 = fma(_1533, _2133, _1521);
    float _2147 = _1525 * _2121;
    float _2149 = _2139 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2151 = fma(_1525, _2141, _1523);
    float _2153 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_80.x = _2149;
    float _2155 = _2113;
    float _2157 = _2121;
    float _2159 = _2139;
    if (!_2131)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2161 = _2019;
    float _2163 = _2161;
    float _2165 = _2161;
    if (!_2131)
    {
        _2047 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2167 = _2047;
    out.m_82.x = _2143;
    out.m_82.y = _2145;
    out.m_82.z = _2151;
    out.m_82.w = _2147;
    float _2169 = _2167;
    float _2171 = _2167;
    if (!_2131)
    {
        _2155 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2173 = _2155;
    float _2175 = _2173;
    float _2177 = _2173;
    if (!_2131)
    {
        _2157 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2179 = _2157;
    float _2181 = _2179;
    float _2183 = _2179;
    if (!_2131)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2185 = _2021;
    float _2187 = _2185;
    float _2189 = _2185;
    if (!_2131)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2191 = _2159;
    bool _2193 = !_2131;
    float _2195 = _2191;
    float _2197 = _2191;
    if (!_2193)
    {
        bool _2199 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2201 = isnan(_776);
        bool _2203 = _2199 || _2201;
        bool _2205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2207 = _2203 || _2205;
        if (!_2207)
        {
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2211 = _776 + _2209;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2215 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2213;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2221 = 1.0 / _2215;
            float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2239 = _2211 * _2221;
            float _2241 = precise::clamp(_2239, 0.0, 1.0);
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2247 = fma(_2241, _2219, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2249 = fma(_2241, _2245, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2251 = fma(_2241, _2225, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2253 = fma(_2241, _2229, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2255 = fma(_2241, _2233, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2257 = fma(_2241, _2237, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2171 = _2247;
            _2189 = _2255;
            _2165 = _2251;
            _2183 = _2253;
            _2177 = _2249;
            _2197 = _2257;
            _2259 = true;
        }
        else
        {
            bool _2261 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2263 = isnan(_776);
            bool _2265 = _2261 || _2263;
            bool _2267 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2269 = _2265 || _2267;
            if (!_2269)
            {
                _2163 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2271 = _2163;
            _2165 = _2271;
            if (!_2269)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2273 = _2169;
            _2171 = _2273;
            if (!_2269)
            {
                _2175 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2275 = _2175;
            _2177 = _2275;
            if (!_2269)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2277 = _2181;
            _2183 = _2277;
            if (!_2269)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2279 = _2187;
            _2189 = _2279;
            if (!_2269)
            {
                _2195 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2281 = _2195;
            bool _2283 = !_2269;
            _2197 = _2281;
            if (!_2283)
            {
                bool _2285 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2287 = isnan(_776);
                bool _2289 = _2285 || _2287;
                bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2293 = _2289 || _2291;
                if (!_2293)
                {
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2297 = _776 + _2295;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2301 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2299;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2307 = 1.0 / _2301;
                    float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2325 = _2297 * _2307;
                    float _2327 = precise::clamp(_2325, 0.0, 1.0);
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2333 = fma(_2327, _2305, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2335 = fma(_2327, _2331, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2337 = fma(_2327, _2311, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2339 = fma(_2327, _2315, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2341 = fma(_2327, _2319, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2343 = fma(_2327, _2323, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2171 = _2333;
                    _2189 = _2341;
                    _2165 = _2337;
                    _2183 = _2339;
                    _2177 = _2335;
                    _2197 = _2343;
                    _2259 = true;
                }
                else
                {
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2165 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2177 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2197 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2259 = false;
    float _2345 = _2171;
    float _2347 = _2189;
    float _2349 = _2165;
    float _2351 = _2183;
    float _2353 = _2177;
    float _2355 = _2197;
    float _2357 = fma(_508, -0.5, 0.5);
    float _2359 = precise::clamp(_2357, 0.0, 1.0);
    float _2361 = -_2345;
    float _2363 = _2361 + _2347;
    float _2365 = -_2349;
    float _2367 = _2365 + _2351;
    float _2369 = -_2353;
    float _2371 = _2369 + _2355;
    bool _2373 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2375 = fma(_2359, _2363, _2345);
    float _2377 = fma(_2359, _2367, _2349);
    float _2379 = fma(_2359, _2371, _2353);
    float _2381 = _2153 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2383 = _2375 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _2385 = fma(_2377, 0.298911988735198974609375, _2383);
    out.m_86.x = _2381;
    float _2387 = fma(_2379, 0.114477999508380889892578125, _2385);
    float _2389 = -_2387;
    float _2391 = _2377 + _2389;
    float _2393 = -_2387;
    float _2395 = _2375 + _2393;
    float _2397 = -_2387;
    float _2399 = _2379 + _2397;
    float _2401 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2387);
    float _2403 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2387);
    float _2405 = fma(_2399, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2387);
    out.m_88.x = _2401;
    out.m_88.y = _2403;
    out.m_88.z = _2405;
    if (!_2373)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2407 = -_722;
    float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2411 = -_724;
    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2415 = -_726;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2419 = _2409 * _2409;
    float _2421 = fma(_2413, _2413, _2419);
    float _2423 = fma(_2417, _2417, _2421);
    float _2425 = sqrt(_2423);
    float _2427 = rsqrt(_2423);
    float _2429 = -_2425;
    float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2433 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2435 = precise::clamp(_2433, 0.0, 1.0);
    float _2437 = _2413 * _2427;
    float _2439 = _2409 * _2427;
    float _2441 = abs(_2435);
    float _2443 = log2(_2441);
    float _2445 = _2417 * _2427;
    float _2447 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2449 = _508 * _2439;
    float _2451 = -_2439;
    float _2453 = -_2447;
    float _2455 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2453);
    float _2457 = fma(_502, _2437, _2449);
    float _2459 = -_2445;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2455);
    float _2463 = fma(_512, _2445, _2457);
    float _2465 = precise::clamp(_2463, 0.0, 1.0);
    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2469 = _2461 + _2467;
    float _2471 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2473 = _2469 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = exp2(_2471);
    float _2479 = _2477 * _2475;
    float _2481 = _2465 * _2479;
    float _2483 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2485 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2487 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2483;
    out.m_84.y = _2485;
    out.m_84.z = _2487;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2259 = false;
    bool _668 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = as_type<float>(int(gl_VertexIndex));
    float _104 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    int _111 = as_type<int>(_102) >> 2;
    int _113 = _111 + _109;
    int _115 = _113 * 96;
    int _117 = _115 + 32;
    uint _120 = uint(int(uint(_115) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_120)];
    float _122 = as_type<float>(_dmw0.x);
    int _124 = _115 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw0.y);
    int _130 = _115 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw0.z);
    int _136 = _115 + 12;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw0.w);
    uint _142 = uint(int(uint(_117) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_142)];
    float _144 = as_type<float>(_dmw2.x);
    int _146 = _117 + 4;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw2.y);
    int _152 = _117 + 8;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw2.z);
    int _158 = _115 + 16;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_160)];
    float _162 = as_type<float>(_dmw1.x);
    int _164 = _158 + 4;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>(_dmw1.y);
    int _170 = _158 + 8;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>(_dmw1.z);
    int _176 = _115 + 48;
    int _178 = as_type<int>(_102) & 2;
    bool _182 = _178 != 0;
    int _184 = as_type<int>(_102) & 1;
    bool _186 = _184 != 0;
    uint _188 = uint(int(uint(_176) >> uint(2)));
    packed_uint2 _dmw3 = *(const device packed_uint2*)&(*spvDescriptorSet0.vp_s0)._m0[int(_188)];
    float _190 = as_type<float>(_dmw3.x);
    int _192 = _176 + 4;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>(_dmw3.y);
    float _198 = -_128;
    float _200 = _198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _202 = _200 * _200;
    float _204 = _150 * _150;
    float _206 = -_122;
    float _208 = _206 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _210 = fma(_144, _144, _204);
    float _212 = -_134;
    float _214 = _212 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _216 = fma(_208, _208, _202);
    float _218 = fma(_156, _156, _210);
    float _220 = fma(_214, _214, _216);
    float _222 = rsqrt(_218);
    float _224 = rsqrt(_220);
    float _226 = _156 * _222;
    float _228 = _150 * _222;
    float _230 = _144 * _222;
    float _232 = _208 * _224;
    float _234 = _214 * _224;
    float _236 = _200 * _224;
    float _238 = _232 * _226;
    float _240 = _234 * _228;
    float _242 = -_238;
    float _244 = fma(_234, _230, _242);
    float _246 = _236 * _230;
    float _248 = -_240;
    float _250 = fma(_236, _226, _248);
    float _252 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _254 = _244 * _244;
    float _256 = -_246;
    float _258 = fma(_232, _228, _256);
    float _260 = _168 * _168;
    float _262 = fma(_250, _250, _254);
    float _264 = 1.0 / _252;
    float _266 = fma(_258, _258, _262);
    float _268 = fma(_162, _162, _260);
    float _270 = fma(_174, _174, _268);
    float _272 = rsqrt(_266);
    float _274 = float(_111);
    float _276 = rsqrt(_270);
    bool _278 = !_182;
    float _280 = _278 ? 1.0 : (-1.0);
    float _282 = _274 * _264;
    float _284 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _286 = _284 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _288 = abs(_140);
    float _290 = _288 * _280;
    float _292 = _290 * 0.5;
    float _294 = fma(_282, _286, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _296 = _244 * _272;
    float _298 = _258 * _272;
    float _300 = _294 * _292;
    float _302 = _250 * _272;
    float _304 = _162 * _276;
    float _306 = _168 * _276;
    float _308 = _174 * _276;
    float _310 = _272;
    float _312 = _174;
    float _314 = _276;
    float _316 = _102;
    float _318 = _308;
    float _320 = _304;
    if (!_186)
    {
        _310 = _302;
    }
    float _322 = _310;
    float _324 = _322;
    if (!_186)
    {
        _312 = _296;
    }
    float _326 = _312;
    float _328 = _326;
    if (!_186)
    {
        _314 = _298;
    }
    float _330 = _314;
    bool _332 = !_186;
    float _334 = _330;
    if (!_332)
    {
        float _336 = _308 * _302;
        float _338 = _306 * _298;
        float _340 = _304 * _296;
        float _342 = -_336;
        float _344 = fma(_304, _298, _342);
        float _346 = -_338;
        float _348 = fma(_308, _296, _346);
        float _350 = -_340;
        float _352 = fma(_306, _302, _350);
        float _354 = _344 * _344;
        float _356 = fma(_348, _348, _354);
        float _358 = fma(_352, _352, _356);
        float _360 = rsqrt(_358);
        float _362 = _348 * _360;
        float _364 = _344 * _360;
        float _366 = _352 * _360;
        _324 = _362;
        _334 = _366;
        _328 = _364;
    }
    float _368 = _324;
    float _370 = _334;
    float _372 = _328;
    float _374 = -_300;
    float _376 = fma(_368, _374, _122);
    float _378 = -_300;
    float _380 = fma(_370, _378, _134);
    float _382 = -_300;
    float _384 = fma(_372, _382, _128);
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _388 = _376 + _386;
    float _390 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _392 = _380 + _390;
    float _394 = _388 * _388;
    float _396 = _392 * _392;
    float _398 = _394 + _396;
    float _400 = sqrt(_398);
    bool _402 = _400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _404 = _394;
    float _406 = _396;
    float _408 = _376;
    float _410 = _380;
    float _412 = _388;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_402)
    {
        _316 = _384;
    }
    float _416 = _316;
    bool _418 = !_402;
    float _420 = _416;
    float _422 = 0.0;
    if (!_418)
    {
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _428 = _400 + _426;
        float _430 = _384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _432 = rsqrt(_398);
        float _434 = _428 * _424;
        float _436 = _434 * 0.15915493667125701904296875;
        float _438 = _436 * 6.283185482025146484375;
        float _440 = sin(_438);
        float _442 = _436 * 6.283185482025146484375;
        float _444 = cos(_442);
        float _446 = fma(_440, _430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _448 = _432 * _446;
        float _450 = _444 + (-1.0);
        float _452 = fma(_388, _448, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _454 = fma(_392, _448, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _456 = _450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _460 = _452 + _458;
        float _462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _464 = _454 + _462;
        float _466 = fma(_384, _444, _456);
        float _468 = _460 * _460;
        float _470 = _464 * _464;
        _420 = _466;
        _404 = _468;
        _406 = _470;
        _422 = _448;
        _408 = _452;
        _410 = _454;
    }
    float _472 = _420;
    float _474 = _404;
    float _476 = _406;
    float _478 = _422;
    float _480 = _408;
    float _482 = _410;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _486 = _484 != 0;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _490 = _472 + _488;
    float _492 = _308 * _372;
    float _494 = _306 * _368;
    float _496 = fma(_490, _490, _474);
    float _498 = _304 * _370;
    float _500 = -_492;
    float _502 = fma(_306, _370, _500);
    float _504 = _496 + _476;
    float _506 = -_498;
    float _508 = fma(_308, _368, _506);
    float _510 = -_494;
    float _512 = fma(_304, _372, _510);
    float _514 = 0.0;
    float _516 = _478;
    float _518 = _494;
    float _520 = _504;
    float _522 = (*spvDescriptorSet0.vp_c12)._m0[3].z;
    if (_486)
    {
        _514 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _524 = _514;
    float _526 = sqrt(_504);
    float _528 = _524;
    if (_486)
    {
        _516 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _530 = _516;
    float _532 = 0.0;
    float _534 = _530;
    if (_486)
    {
        _532 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _536 = _532;
    float _538 = _536;
    if (_486)
    {
        float _540 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _542 = _524 + _540;
        _528 = _542;
    }
    float _544 = _528;
    if (_486)
    {
        float _546 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _548 = _530 + _546;
        _534 = _548;
    }
    float _550 = _534;
    if (_486)
    {
        float _552 = _544 * _544;
        _318 = _552;
    }
    float _554 = _318;
    if (_486)
    {
        float _556 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _558 = _536 + _556;
        _538 = _558;
    }
    float _560 = _538;
    if (_486)
    {
        float _562 = fma(_550, _550, _554);
        _412 = _562;
    }
    float _564 = _412;
    float _566 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _570 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _572 = 0.0;
    if (_486)
    {
        float _574 = fma(_560, _560, _564);
        _572 = _574;
    }
    float _576 = _572;
    float _578 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _580 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _582 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _584 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _586 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _588 = _576;
    if (_486)
    {
        float _590 = rsqrt(_576);
        _588 = _590;
    }
    float _592 = _588;
    out.m_70.x = _502;
    out.m_70.y = _508;
    out.m_70.z = _512;
    bool _594 = _526 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _596 = isnan(_526);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _602 = _598 || _600;
    if (!_486)
    {
        _518 = 0.0;
        _520 = 0.0;
    }
    float _604 = _518;
    float _606 = _520;
    float _608 = _604;
    float _610 = _606;
    if (!_486)
    {
        _522 = 0.0;
    }
    float _612 = _522;
    out.m_72.x = _580;
    out.m_72.y = _582;
    out.m_72.z = _566;
    out.m_72.w = _568;
    out.m_74.x = _570;
    out.m_74.y = _578;
    out.m_74.z = _584;
    out.m_74.w = _586;
    float _614 = _612;
    if (!_602)
    {
        _320 = 1.0;
    }
    float _616 = _320;
    float _618 = 0.0;
    float _620 = _616;
    if (_486)
    {
        float _622 = _592 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _618 = _622;
    }
    float _624 = _618;
    if (_486)
    {
        float _626 = _550 * _624;
        _614 = _626;
    }
    float _628 = _614;
    if (_486)
    {
        float _630 = _544 * _624;
        _608 = _630;
    }
    float _632 = _608;
    if (_486)
    {
        float _634 = _560 * _624;
        _610 = _634;
    }
    float _636 = _610;
    bool _638 = !_602;
    if (!_638)
    {
        bool _640 = _526 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _642 = isnan(_526);
        bool _644 = _640 || _642;
        bool _646 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _648 = _644 || _646;
        if (!_648)
        {
            float _650 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _652 = _526 + _650;
            float _654 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _656 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _654;
            float _658 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _660 = _658 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _662 = 1.0 / _656;
            float _664 = _652 * _662;
            float _666 = fma(_664, _660, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _620 = _666;
            _668 = true;
        }
        else
        {
            bool _670 = _526 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _672 = isnan(_526);
            bool _674 = _670 || _672;
            bool _676 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _678 = _674 || _676;
            if (!_678)
            {
                float _680 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _682 = _526 + _680;
                float _684 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _686 = _684 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _688 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _690 = _688 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _692 = 1.0 / _686;
                float _694 = _682 * _692;
                float _696 = fma(_694, _690, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _620 = _696;
                _668 = true;
            }
            else
            {
                _620 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _668 = false;
    float _698 = _620;
    float _700 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _702 = _472 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _706 = _480 + _704;
    float _708 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _710 = _482 + _708;
    float _712 = _128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _714 = fma(_702, _698, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _716 = fma(_706, _698, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _718 = fma(_710, _698, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _720 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[2].x, _712);
    float _722 = _714 + _632;
    float _724 = _716 + _628;
    float _726 = _718 + _636;
    float _728 = _128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = _722 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _736 = _724 + _734;
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _740 = _726 + _738;
    float _742 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[1].x, _728);
    float _744 = _732 * _732;
    float _746 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[2].z, _720);
    float _748 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[1].z, _742);
    float _750 = fma(_736, _736, _744);
    float _752 = _746 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _754 = _748 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _756 = fma(_740, _740, _750);
    float _758 = _128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _760 = _128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _762 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _764 = rsqrt(_756);
    float _766 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[0].x, _758);
    float _768 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[3].x, _760);
    float _770 = _762 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _772 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[0].z, _766);
    float _774 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[3].z, _768);
    float _776 = sqrt(_756);
    float _778 = _772 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _780 = _774 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _782 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _784 = _764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _786 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _788 = floor(_782);
    float _790 = _740 * _784;
    float _792 = _754 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _794 = _736 * _784;
    float _796 = _790 * _790;
    float _798 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[7].x, _792);
    float _800 = _794 * _794;
    float _802 = floor(_786);
    float _804 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _798);
    float _806 = _754 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _808 = _800 + _796;
    float _810 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _804);
    float _812 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[6].x, _806);
    float _814 = sqrt(_808);
    float _816 = -_788;
    float _818 = _782 + _816;
    float _820 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _812);
    float _822 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _820);
    float _824 = 1.0 / _810;
    float _826 = _822 + _810;
    bool _828 = _814 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _830 = _770 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _832 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _830);
    float _834 = _826 * _824;
    float _836 = _834 * 0.5;
    float _838 = _770 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _840 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _832);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _844 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[30].w, _842);
    float _846 = _804;
    float _848 = _814;
    float _850 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _852 = _794;
    float _854 = _790;
    float _856 = _796;
    float _858 = _782;
    bool _860 = _828;
    if (_828)
    {
        float _862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _862;
    }
    float _864 = _846;
    float _866 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _838);
    float _868 = _840 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _870 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _866);
    float _872 = 1.0 / _844;
    float _874 = _870 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _878 = _814 + _876;
    float _880 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _882 = _878;
    if (_828)
    {
        float _884 = _878 * _864;
        _882 = _884;
    }
    float _886 = _882;
    float _888 = precise::max(0.0, _880);
    float _890 = trunc(_874);
    int _892 = int(_890);
    if (_828)
    {
        float _894 = _886 * 0.15915493667125701904296875;
        _848 = _894;
    }
    float _896 = _848;
    float _898 = _722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _900 = -_784;
    float _902 = -_888;
    float _904 = fma(_732, _900, _902);
    float _906 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _910 = _872 * _908;
    float _912 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[2].x, _898);
    float _914 = _864;
    int _916 = 2;
    float _918 = _904;
    if (_828)
    {
        float _920 = _896 * 6.283185482025146484375;
        float _922 = sin(_920);
        _914 = _922;
    }
    float _924 = _914;
    if (_828)
    {
        float _926 = _904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _850 = _926;
    }
    float _928 = _850;
    bool _930 = _910 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _932 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _912);
    bool _934 = _910 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _936 = !_930;
    int _938 = _936 ? 0 : 1;
    float _940 = _932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _942 = trunc(_868);
    int _944 = int(_942);
    int _946 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _948 = _892 + _946;
    int _950 = _948 + 1;
    float _952 = _940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _954 = _928;
    float _956 = as_type<float>(_938);
    if (!_930)
    {
        _916 = 1;
    }
    int _958 = _916;
    float _960 = _932;
    int _962 = _958;
    if (_828)
    {
        float _964 = _896 * 6.283185482025146484375;
        float _966 = cos(_964);
        _960 = _966;
    }
    float _968 = _960;
    if (!_934)
    {
        _962 = _938;
    }
    int _970 = _962;
    float _972 = -_952;
    float _974 = fma(_972, _906, 1.0);
    float _976 = _722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_828)
    {
        float _978 = fma(_924, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _954 = _978;
    }
    float _980 = _954;
    int _982 = _970 << 6;
    bool _984 = _950 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _986 = _808;
    float _988 = _980;
    float _990 = as_type<float>(_982);
    if (_828)
    {
        float _992 = rsqrt(_808);
        _986 = _992;
    }
    float _994 = _986;
    int _996 = _982 + 96;
    uint _998 = uint(int(uint(_996) >> uint(2)));
    uint _1000 = uint(int(uint(int(_998)) >> uint(2)));
    int _1002 = int(_998) & 3;
    float _1004 = (*spvDescriptorSet0.vp_c15)._m0[int(_1000)][_1002];
    int _1006 = int(_998) + 1;
    uint _1008 = uint(int(uint(_1006) >> uint(2)));
    int _1010 = _1006 & 3;
    float _1012 = (*spvDescriptorSet0.vp_c15)._m0[int(_1008)][_1010];
    int _1014 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1016 = _944 + _1014;
    int _1018 = _1016 + 1;
    float _1020 = as_type<float>(_1018);
    if (_828)
    {
        float _1022 = _968 + (-1.0);
        _956 = _1022;
    }
    float _1024 = _956;
    int _1026 = _982 + 48;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    float _1044 = log2(_974);
    float _1046 = _1024;
    if (_828)
    {
        float _1048 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1046 = _1048;
    }
    float _1050 = _1046;
    if (_828)
    {
        float _1052 = fma(_904, _968, _1050);
        _918 = _1052;
    }
    float _1054 = _918;
    int _1056 = _982 + 104;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    uint _1060 = uint(int(uint(int(_1058)) >> uint(2)));
    int _1062 = int(_1058) & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    int _1066 = int(_1058) + 1;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    int _1070 = _1066 & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    float _1074 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[1].x, _976);
    if (_828)
    {
        float _1076 = _994 * _980;
        _988 = _1076;
    }
    float _1078 = _988;
    int _1080 = _950 | _1018;
    float _1082 = _722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1084 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1074);
    if (_828)
    {
        float _1086 = _794 * _1078;
        _852 = _1086;
    }
    float _1088 = _852;
    bool _1090 = _1080 < 0;
    bool _1092 = _1090 || _984;
    int _1094 = _982 + 64;
    uint _1096 = uint(int(uint(_1094) >> uint(2)));
    uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
    int _1100 = int(_1096) & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = int(_1096) + 1;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    int _1108 = _1104 & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    float _1112 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1082);
    float _1114 = _1112;
    if (_828)
    {
        float _1116 = _790 * _1078;
        _854 = _1116;
    }
    float _1118 = _854;
    float _1120 = _722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1122 = _1018 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1124 = _1122 || _1092;
    float _1126 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1112);
    if (!_828)
    {
        _1114 = _800;
    }
    float _1128 = _1114;
    float _1130 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1132 = _982 + 56;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
    int _1138 = int(_1134) & 3;
    float _1140 = (*spvDescriptorSet0.vp_c15)._m0[int(_1136)][_1138];
    int _1142 = int(_1134) + 1;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    int _1146 = _1142 & 3;
    float _1148 = (*spvDescriptorSet0.vp_c15)._m0[int(_1144)][_1146];
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1152 = fma(_776, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1150);
    float _1154 = precise::clamp(_1152, 0.0, 1.0);
    float _1156 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1120);
    float _1158 = _1128;
    if (_828)
    {
        float _1160 = _1088 * _1088;
        _1158 = _1160;
    }
    float _1162 = _1158;
    if (_828)
    {
        float _1164 = _1118 * _1118;
        _856 = _1164;
    }
    float _1166 = _856;
    float _1168 = -_1154;
    float _1170 = _1168 + 1.0;
    float _1172 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1156);
    float _1174 = fma(_1054, _1054, _1162);
    int _1176 = _982 + 72;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
    int _1182 = int(_1178) & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    int _1186 = int(_1178) + 1;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    int _1190 = _1186 & 3;
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[int(_1188)][_1190];
    float _1194 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1196 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1198 = _1174 + _1166;
    float _1200 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1202 = abs(_1170);
    float _1204 = log2(_1202);
    float _1206 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1194);
    float _1208 = _1044 * 0.693147182464599609375;
    int _1210 = _982 + 80;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    uint _1214 = uint(int(uint(int(_1212)) >> uint(2)));
    int _1216 = int(_1212) & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    int _1220 = int(_1212) + 1;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    int _1224 = _1220 & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    float _1228 = _770 * _1012;
    float _1230 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1206);
    float _1232 = fma(_1004, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1228);
    float _1234 = rsqrt(_1198);
    float _1236 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1230);
    float _1238 = _770 * _1042;
    int _1240 = _982 + 88;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    uint _1244 = uint(int(uint(int(_1242)) >> uint(2)));
    int _1246 = int(_1242) & 3;
    float _1248 = (*spvDescriptorSet0.vp_c15)._m0[int(_1244)][_1246];
    int _1250 = int(_1242) + 1;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    int _1254 = _1250 & 3;
    float _1256 = (*spvDescriptorSet0.vp_c15)._m0[int(_1252)][_1254];
    float _1258 = fma(_1034, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1238);
    int _1260 = as_type<int>(_1034);
    int _1262 = as_type<int>(_1072);
    int _1264 = as_type<int>(_1258);
    float _1266 = _1236;
    if (!_1124)
    {
        int _1268 = _1018 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1270 = _1268 + _950;
        _1260 = _1270;
    }
    int _1272 = _1260;
    float _1274 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1276 = 1.0 / _1236;
    float _1278 = fma(_1064, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1232);
    float _1280 = _1278 + _1072;
    if (!_1124)
    {
        int _1282 = _1272 << 2;
        _1262 = _1282;
    }
    int _1284 = _1262;
    float _1286 = _1234 * _1088;
    float _1288 = _1234 * _1054;
    float _1290 = _770 * _1110;
    float _1292 = _1234 * _1118;
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _1296 = as_type<int>(_1286);
    float _1298 = _1234;
    if (!_1124)
    {
        int _1300 = 12 & _1284;
        _1296 = _1300;
    }
    int _1302 = _1296;
    float _1304 = fma(_1102, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1290);
    float _1306 = exp2(_1274);
    float _1308 = -_1294;
    float _1310 = fma(_1288, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1308);
    float _1312 = fma(_1140, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1258);
    int _1314 = _1302;
    float _1316 = _1310;
    if (!_1124)
    {
        uint _1318 = uint(int(uint(_1272) >> uint(2)));
        _1264 = int(_1318);
    }
    int _1320 = _1264;
    float _1322 = _1312 + _1148;
    float _1324 = 1.0 / _1280;
    if (!_1124)
    {
        int _1326 = _1320 << 4;
        int _1328 = _1326 + _1302;
        _1314 = _1328;
    }
    int _1330 = _1314;
    float _1332 = -_802;
    float _1334 = _786 + _1332;
    float _1336 = fma(_1184, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1304);
    float _1338 = -_1292;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1310);
    float _1342 = _1336 + _1192;
    float _1344 = _1292;
    if (!_1124)
    {
        float _1346 = floor(_868);
        _1344 = _1346;
    }
    float _1348 = _1344;
    float _1350 = fma(_1340, -0.5, 0.5);
    float _1352 = _770 * _1226;
    float _1354 = fma(_1340, 0.5, 0.5);
    float _1356 = fma(_1218, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1352);
    float _1358 = _1322 * _1324;
    float _1360 = _1342 * _1324;
    float _1362 = _1322;
    float _1364 = _1350;
    float _1366 = _1360;
    if (!_1124)
    {
        int _1368 = _1330 + 400;
        uint _1370 = uint(int(uint(_1368) >> uint(2)));
        uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
        int _1374 = int(_1370) & 3;
        float _1376 = (*spvDescriptorSet0.vp_c15)._m0[int(_1372)][_1374];
        _1362 = _1376;
    }
    float _1378 = _1362;
    float _1380 = sqrt(_1350);
    float _1382 = fma(_1248, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1356);
    bool _1384 = _1358 >= 0.0;
    float _1386 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1388 = _1382 + _1256;
    bool _1390 = _1358 <= 1.0;
    bool _1392 = _1390 && _1384;
    float _1394 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1396 = _802;
    float _1398 = _1348;
    if (!_1124)
    {
        float _1400 = floor(_874);
        _1396 = _1400;
    }
    float _1402 = _1396;
    bool _1404 = _1360 >= 0.0;
    bool _1406 = _1404 && _1392;
    float _1408 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1386);
    float _1410 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1394);
    float _1412 = fma(_1354, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _1414 = _1360 <= 1.0;
    bool _1416 = _1414 && _1406;
    if (!_1124)
    {
        float _1418 = -_1348;
        float _1420 = _868 + _1418;
        _1398 = _1420;
    }
    float _1422 = _1398;
    float _1424 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1408);
    float _1426 = fma(_1354, _1412, -0.212114393711090087890625);
    float _1428 = _1288 + 1.0;
    float _1430 = _1380 * 0.636619746685028076171875;
    float _1432 = fma(_1354, _1426, 1.570728778839111328125);
    float _1434 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1424);
    float _1436 = _868;
    if (!_1124)
    {
        float _1438 = rint(_1378);
        float _1440 = precise::max(_1438, 0.0);
        uint _1442 = uint(_1440);
        uint _1444 = clamp(_1442, 0u, 65535u);
        _1436 = as_type<float>(_1444);
    }
    float _1446 = _1436;
    float _1448 = -_1288;
    float _1450 = fma(_1306, _1428, _1448);
    float _1452 = _1402;
    float _1454 = _1450;
    if (!_1124)
    {
        float _1456 = -_1402;
        float _1458 = _874 + _1456;
        _858 = _1458;
    }
    float _1460 = _858;
    float _1462 = _1388 * _1324;
    if (_1416)
    {
        float _1464 = float(_970);
        _1364 = _1464;
    }
    float _1466 = _1364;
    float _1468 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1410);
    float _1470 = _1434 * _1276;
    float _1472 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1474 = -_1432;
    float _1476 = fma(_1430, _1474, 1.0);
    float _1478 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1468);
    float _1480 = _1466;
    if (_1416)
    {
        float _1482 = rint(_1466);
        float _1484 = precise::max(_1482, 0.0);
        uint _1486 = uint(_1484);
        uint _1488 = clamp(_1486, 0u, 65535u);
        _1480 = as_type<float>(_1488);
    }
    float _1490 = _1480;
    float _1492 = fma(_1470, 0.5, 0.5);
    float _1494 = fma(_1450, 0.5, 0.5);
    float _1496 = _1478 * _1276;
    float2 _4809 = float2(_1334, _818);
    float _1498 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4809, float2(0.0), isnan(_4809)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4809, float2(0.0), isnan(_4809)), level(0.0)).x;
    float _1500 = fma(_1496, -0.5, 0.5);
    float _1502 = _874;
    if (!_1124)
    {
        float3 _4828 = float3(_1460, _1422, float(as_type<int>(_1446)));
        float3 _4832 = select(_4828, float3(0.0), isnan(_4828));
        float _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4832.xy, uint(rint(_4832.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4832.xy, uint(rint(_4832.z)), level(0.0)).x;
        _1502 = _1504;
    }
    float _1506 = _1502;
    float _1508 = _1490;
    if (_1416)
    {
        float3 _4847 = float3(_1358, _1360, float(as_type<int>(_1490)));
        float3 _4849 = select(_4847, float3(0.0), isnan(_4847));
        float _1510 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4849.xy, uint(rint(_4849.z)), _1462, level(0.0));
        _1508 = _1510;
    }
    float _1512 = _1508;
    float3 _4859 = float3(_1492, _1500, _1472);
    float _1514 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4859, float3(0.0), isnan(_4859)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4859, float3(0.0), isnan(_4859)), level(0.0)).x;
    float3 _4868 = float3(_1492, _1500, _1472);
    float4 _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4868, float3(0.0), isnan(_4868)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4868, float3(0.0), isnan(_4868)), level(0.0)).xyzw;
    float _1519 = _1517.x;
    float _1521 = _1517.y;
    float _1523 = _1517.z;
    float _1525 = _1517.w;
    float2 _4884 = float2(_1476, _1494);
    float3 _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4884, float2(0.0), isnan(_4884)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4884, float2(0.0), isnan(_4884)), level(0.0)).xyz;
    float _1531 = _1529.x;
    float _1533 = _1529.y;
    float _1535 = _1529.z;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1539 = _1537 != 0;
    float _1541 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1545 = _1543 != 0;
    float _1547 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1551 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1541);
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1555 = _1545;
    if (_1539)
    {
        _1452 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1557 = _1452;
    if (!_1539)
    {
        float _1559 = -_190;
        float _1561 = (-0.0) + _1559;
        _1020 = _1561;
    }
    float _1563 = _1020;
    float _1565 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1553);
    float _1567 = _1563;
    if (_1539)
    {
        bool _1569 = _1557 > 0.5;
        _860 = _1569;
    }
    bool _1571 = _860;
    if (_1545)
    {
        _1366 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1573 = _1366;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1577 = _1573;
    if (_1539)
    {
        float _1579 = -_190;
        float _1581 = _1571 ? _190 : _1579;
        _1567 = _1581;
    }
    float _1583 = _1567;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1589 = _1587 != 0;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1593 = !_182;
    float _1595 = _1593 ? 0.0 : 1.0;
    float _1597 = fma(_1585, -2.0, _1575);
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1601 = _1599 != 0;
    float _1603 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1591);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1607 = _1605 != 0;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1611 = abs(_910);
    float _1613 = log2(_1611);
    bool _1615 = false;
    float _1617 = _1595;
    if (_1545)
    {
        bool _1619 = _1573 > 0.5;
        _1615 = _1619;
    }
    bool _1621 = _1615;
    float _1623 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1551);
    bool _1625 = _1621;
    if (!_1545)
    {
        _990 = _1595;
    }
    float _1627 = _990;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1631 = _1627;
    if (_1589)
    {
        _414 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1633 = _414;
    float _1635 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1623);
    float _1637 = _1633;
    if (_1545)
    {
        float _1639 = -_1595;
        float _1641 = _1621 ? _1639 : _1595;
        _1631 = _1641;
    }
    float _1643 = _1631;
    float _1645 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1629);
    if (_1589)
    {
        bool _1647 = _1633 > 0.5;
        _1625 = _1647;
    }
    bool _1649 = _1625;
    if (!_1589)
    {
        float _1651 = -_196;
        float _1653 = (-0.0) + _1651;
        _1637 = _1653;
    }
    float _1655 = _1637;
    float _1657 = exp2(_1547);
    float _1659 = _1655;
    if (!_1601)
    {
        _1316 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1661 = _1316;
    float _1663 = _1661;
    if (_1589)
    {
        float _1665 = -_196;
        float _1667 = _1649 ? _196 : _1665;
        _1659 = _1667;
    }
    float _1669 = _1659;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1673 = _1671;
    if (_1601)
    {
        _1663 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1675 = _1663;
    float _1677 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1645);
    float _1679 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1597);
    if (!_1601)
    {
        _1298 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1681 = _1298;
    float _1683 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1671);
    float _1685 = _1681;
    if (_1601)
    {
        _1685 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1687 = _1685;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (!_1601)
    {
        _1673 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1691 = _1673;
    float _1693 = _1677 * (-0.15915493667125701904296875);
    float _1695 = _1691;
    if (_1601)
    {
        _1695 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1697 = _1695;
    float _1699 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1689);
    if (!_1601)
    {
        _1454 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1701 = _1454;
    float _1703 = _1693 * 6.283185482025146484375;
    float _1705 = sin(_1703);
    float _1707 = _1701;
    if (_1601)
    {
        _1707 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1709 = _1707;
    float _1711 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1713 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1699);
    float _1715 = 0.0;
    if (!_1601)
    {
        _1715 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1717 = _1715;
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1721 = _1693 * 6.283185482025146484375;
    float _1723 = cos(_1721);
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1727 = _1717;
    if (_1601)
    {
        _1727 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1729 = _1727;
    float _1731 = _1713 * (-0.15915493667125701904296875);
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1735 = fma(_1719, -2.0, _1725);
    if (_1607)
    {
        _1577 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1737 = _1577;
    float _1739 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1609);
    float _1741 = _1731 * 6.283185482025146484375;
    float _1743 = cos(_1741);
    float _1745 = _1583 + 0.5;
    float _1747 = -_1733;
    float _1749 = fma(_1711, 2.0, _1747);
    float _1751 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1603);
    float _1753 = _1643 + (-0.5);
    float _1755 = _1745 * _1705;
    if (_1607)
    {
        bool _1757 = _1737 > 0.5;
        _1555 = _1757;
    }
    bool _1759 = _1555;
    float _1761 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1565);
    float _1763 = _1731 * 6.283185482025146484375;
    float _1765 = sin(_1763);
    float _1767 = _1745 * _1723;
    float _1769 = -_1755;
    float _1771 = fma(_1753, _1723, _1769);
    if (_1607)
    {
        float _1773 = -_1595;
        float _1775 = _1759 ? _1773 : _1595;
        _1617 = _1775;
    }
    float _1777 = _1617;
    float _1779 = fma(_1753, _1705, _1767);
    float _1781 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1783 = _1669 + 0.5;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1791 = _1783 * _1743;
    float _1793 = _1777 + (-0.5);
    float _1795 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1683);
    float _1797 = -_1785;
    float _1799 = fma(_1789, 2.0, _1797);
    float _1801 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1739);
    float _1803 = _1783 * _1765;
    float _1805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1807 = fma(_1793, _1765, _1791);
    float _1809 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1799);
    float _1811 = -_1803;
    float _1813 = fma(_1793, _1743, _1811);
    float _1815 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1817 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1749);
    float _1819 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1735);
    float _1821 = _1771 + 0.5;
    float _1823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1825 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1827 = _1779 + (-0.5);
    float _1829 = _1813 + 0.5;
    float _1831 = _1635 + _1236;
    float _1833 = fma(_1825, _1821, _1809);
    float _1835 = -_1781;
    float _1837 = -_1679;
    float _1839 = fma(_1835, _1827, _1837);
    float _1841 = _1807 + (-0.5);
    float _1843 = exp2(_1815);
    float _1845 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1847 = _1831 * 0.5;
    float _1849 = fma(_1845, _1829, _1817);
    float _1851 = -_1801;
    float _1853 = _1851 + 1.0;
    float _1855 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1857 = -_1751;
    float _1859 = _1857 + 1.0;
    float _1861 = -_1761;
    float _1863 = _1861 + 1.0;
    out.m_76.z = _1847;
    out.m_76.w = _1236;
    float _1865 = -_1855;
    float _1867 = -_1819;
    float _1869 = fma(_1865, _1841, _1867);
    float _1871 = -_1795;
    float _1873 = _1871 + 1.0;
    out.gl_Position.x = _1434;
    out.gl_Position.y = _1478;
    out.gl_Position.z = _1635;
    out.gl_Position.w = _1236;
    float _1875 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = fma(_1807, _1853, _1869);
    float _1881 = -_1859;
    float _1883 = fma(_1771, _1881, _1833);
    float _1885 = fma(_1877, -2.0, 3.0);
    float _1887 = _1877 * _1877;
    bool _1889 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan(0.5);
    bool _1897 = _1893 || _1895;
    float _1899 = fma(_1779, _1863, _1839);
    float _1901 = -_1873;
    float _1903 = fma(_1813, _1901, _1849);
    float _1905 = _1887 * _1885;
    float _1907 = -_1905;
    float _1909 = _1907 + 1.0;
    bool _1911 = _910 <= 8000.0;
    bool _1913 = isnan(_910);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(8000.0);
    bool _1919 = _1915 || _1917;
    float _1921 = float(_1919);
    out.m_78.x = _1883;
    out.m_78.y = _1899;
    out.m_78.z = _1903;
    out.m_78.w = _1879;
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1905);
    float _1925 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1927 = _1925 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1929 = _1921 * _1923;
    float _1931 = _1921;
    float _1933 = _1927;
    if (_1897)
    {
        _1931 = 1.0;
    }
    float _1935 = _1931;
    float _1937 = fma(_282, _1927, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1939 = _1935;
    if (!_1897)
    {
        float _1941 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1943 = _1941 * 0.15915493667125701904296875;
        float _1945 = _1943 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        float _1949 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1951 = _1949 * 0.15915493667125701904296875;
        float _1953 = _1943 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        float _1957 = 1.0 / _1947;
        float _1959 = _1951 * 6.283185482025146484375;
        float _1961 = cos(_1959);
        float _1963 = _1955 * _1957;
        float _1965 = _1951 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1961 * _1963;
        float _1971 = 1.0 / _1969;
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1975 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1973;
        float _1977 = 1.0 / _1975;
        float _1979 = _1967 * _1971;
        float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1983 = fma(_910, _1979, _1981);
        float _1985 = _1983 * _1977;
        float _1987 = precise::clamp(_1985, 0.0, 1.0);
        float _1989 = -_1987;
        float _1991 = _1989 + 1.0;
        _1939 = _1991;
        _1933 = _1971;
        _1266 = _1957;
    }
    float _1993 = _1939;
    float _1995 = _1933;
    float _1997 = _1266;
    float _1999 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2001 = -_1498;
    float _2003 = _2001 + 1.0;
    float _2005 = -_1657;
    float _2007 = _2005 + 1.0;
    float _2009 = _1937 * _1993;
    float _2011 = _2003 * _1999;
    float _2013 = precise::clamp(_2011, 0.0, 1.0);
    float _2015 = _1999;
    float _2017 = _2013;
    float _2019 = _1997;
    float _2021 = _1995;
    if (!_1416)
    {
        _2015 = 1.0;
    }
    float _2023 = _2015;
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2027 = _2023;
    if (_1416)
    {
        bool _2029 = _1512 >= _1462;
        bool _2031 = isnan(_1512);
        bool _2033 = _2029 || _2031;
        bool _2035 = isnan(_1462);
        bool _2037 = _2033 || _2035;
        float _2039 = float(_2037);
        _2027 = _2039;
    }
    float _2041 = _2027;
    float _2043 = -_2013;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2047 = _2045;
    float _2049 = 1.0;
    if (!_1124)
    {
        int _2051 = _1272 << 4;
        int _2053 = _2051 + 2048;
        uint _2055 = uint(int(uint(_2053) >> uint(2)));
        uint _2057 = uint(int(uint(int(_2055)) >> uint(2)));
        int _2059 = int(_2055) & 3;
        float _2061 = (*spvDescriptorSet0.vp_c15)._m0[int(_2057)][_2059];
        int _2063 = int(_2055) + 1;
        uint _2065 = uint(int(uint(_2063) >> uint(2)));
        int _2067 = _2063 & 3;
        float _2069 = (*spvDescriptorSet0.vp_c15)._m0[int(_2065)][_2067];
        int _2071 = _2053 + 8;
        uint _2073 = uint(int(uint(_2071) >> uint(2)));
        uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
        int _2077 = int(_2073) & 3;
        float _2079 = (*spvDescriptorSet0.vp_c15)._m0[int(_2075)][_2077];
        int _2081 = int(_2073) + 1;
        uint _2083 = uint(int(uint(_2081) >> uint(2)));
        int _2085 = _2081 & 3;
        float _2087 = (*spvDescriptorSet0.vp_c15)._m0[int(_2083)][_2085];
        float _2089 = _770 * _2069;
        float _2091 = fma(_2061, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2089);
        float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2091);
        float _2095 = _2093 + _2087;
        float _2097 = precise::clamp(_2095, 0.0, 1.0);
        float _2099 = -_2097;
        float _2101 = _2099 + _1506;
        float _2103 = fma(_2101, 500.0, 1.5);
        float _2105 = exp2(_2103);
        float _2107 = 0.0 + _2105;
        float _2109 = precise::clamp(_2107, 0.0, 1.0);
        _2049 = _2109;
        _2017 = _2105;
    }
    float _2111 = _2049;
    float _2113 = _2017;
    float _2115 = _2025 * _1514;
    float _2117 = _2041 * _2111;
    float _2119 = -_2025;
    float _2121 = _2119 + 1.0;
    bool _2123 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2125 = isnan(_776);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2131 = _2127 || _2129;
    float _2133 = _1525 * _2115;
    float _2135 = -_2117;
    float _2137 = fma(_2135, _2045, 1.0);
    float _2139 = precise::clamp(_2137, 0.0, 1.0);
    float _2141 = _1535 * _2115;
    float _2143 = fma(_1531, _2133, _1519);
    float _2145 = fma(_1533, _2133, _1521);
    float _2147 = _1525 * _2121;
    float _2149 = _2139 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2151 = fma(_1525, _2141, _1523);
    float _2153 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_80.x = _2149;
    float _2155 = _2113;
    float _2157 = _2121;
    float _2159 = _2139;
    if (!_2131)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2161 = _2019;
    float _2163 = _2161;
    float _2165 = _2161;
    if (!_2131)
    {
        _2047 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2167 = _2047;
    out.m_82.x = _2143;
    out.m_82.y = _2145;
    out.m_82.z = _2151;
    out.m_82.w = _2147;
    float _2169 = _2167;
    float _2171 = _2167;
    if (!_2131)
    {
        _2155 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2173 = _2155;
    float _2175 = _2173;
    float _2177 = _2173;
    if (!_2131)
    {
        _2157 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2179 = _2157;
    float _2181 = _2179;
    float _2183 = _2179;
    if (!_2131)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2185 = _2021;
    float _2187 = _2185;
    float _2189 = _2185;
    if (!_2131)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2191 = _2159;
    bool _2193 = !_2131;
    float _2195 = _2191;
    float _2197 = _2191;
    if (!_2193)
    {
        bool _2199 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2201 = isnan(_776);
        bool _2203 = _2199 || _2201;
        bool _2205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2207 = _2203 || _2205;
        if (!_2207)
        {
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2211 = _776 + _2209;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2215 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2213;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2221 = 1.0 / _2215;
            float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2239 = _2211 * _2221;
            float _2241 = precise::clamp(_2239, 0.0, 1.0);
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2247 = fma(_2241, _2219, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2249 = fma(_2241, _2245, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2251 = fma(_2241, _2225, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2253 = fma(_2241, _2229, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2255 = fma(_2241, _2233, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2257 = fma(_2241, _2237, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2171 = _2247;
            _2189 = _2255;
            _2165 = _2251;
            _2183 = _2253;
            _2177 = _2249;
            _2197 = _2257;
            _2259 = true;
        }
        else
        {
            bool _2261 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2263 = isnan(_776);
            bool _2265 = _2261 || _2263;
            bool _2267 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2269 = _2265 || _2267;
            if (!_2269)
            {
                _2163 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2271 = _2163;
            _2165 = _2271;
            if (!_2269)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2273 = _2169;
            _2171 = _2273;
            if (!_2269)
            {
                _2175 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2275 = _2175;
            _2177 = _2275;
            if (!_2269)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2277 = _2181;
            _2183 = _2277;
            if (!_2269)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2279 = _2187;
            _2189 = _2279;
            if (!_2269)
            {
                _2195 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2281 = _2195;
            bool _2283 = !_2269;
            _2197 = _2281;
            if (!_2283)
            {
                bool _2285 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2287 = isnan(_776);
                bool _2289 = _2285 || _2287;
                bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2293 = _2289 || _2291;
                if (!_2293)
                {
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2297 = _776 + _2295;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2301 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2299;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2307 = 1.0 / _2301;
                    float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2325 = _2297 * _2307;
                    float _2327 = precise::clamp(_2325, 0.0, 1.0);
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2333 = fma(_2327, _2305, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2335 = fma(_2327, _2331, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2337 = fma(_2327, _2311, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2339 = fma(_2327, _2315, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2341 = fma(_2327, _2319, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2343 = fma(_2327, _2323, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2171 = _2333;
                    _2189 = _2341;
                    _2165 = _2337;
                    _2183 = _2339;
                    _2177 = _2335;
                    _2197 = _2343;
                    _2259 = true;
                }
                else
                {
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2165 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2177 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2197 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2259 = false;
    float _2345 = _2171;
    float _2347 = _2189;
    float _2349 = _2165;
    float _2351 = _2183;
    float _2353 = _2177;
    float _2355 = _2197;
    float _2357 = fma(_508, -0.5, 0.5);
    float _2359 = precise::clamp(_2357, 0.0, 1.0);
    float _2361 = -_2345;
    float _2363 = _2361 + _2347;
    float _2365 = -_2349;
    float _2367 = _2365 + _2351;
    float _2369 = -_2353;
    float _2371 = _2369 + _2355;
    bool _2373 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2375 = fma(_2359, _2363, _2345);
    float _2377 = fma(_2359, _2367, _2349);
    float _2379 = fma(_2359, _2371, _2353);
    float _2381 = _2153 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2383 = _2375 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _2385 = fma(_2377, 0.298911988735198974609375, _2383);
    out.m_86.x = _2381;
    float _2387 = fma(_2379, 0.114477999508380889892578125, _2385);
    float _2389 = -_2387;
    float _2391 = _2377 + _2389;
    float _2393 = -_2387;
    float _2395 = _2375 + _2393;
    float _2397 = -_2387;
    float _2399 = _2379 + _2397;
    float _2401 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2387);
    float _2403 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2387);
    float _2405 = fma(_2399, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2387);
    out.m_88.x = _2401;
    out.m_88.y = _2403;
    out.m_88.z = _2405;
    if (!_2373)
    {
        return out;
    }
    float _2407 = -_722;
    float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2411 = -_724;
    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2415 = -_726;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2419 = _2409 * _2409;
    float _2421 = fma(_2413, _2413, _2419);
    float _2423 = fma(_2417, _2417, _2421);
    float _2425 = sqrt(_2423);
    float _2427 = rsqrt(_2423);
    float _2429 = -_2425;
    float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2433 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2435 = precise::clamp(_2433, 0.0, 1.0);
    float _2437 = _2413 * _2427;
    float _2439 = _2409 * _2427;
    float _2441 = abs(_2435);
    float _2443 = log2(_2441);
    float _2445 = _2417 * _2427;
    float _2447 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2449 = _508 * _2439;
    float _2451 = -_2439;
    float _2453 = -_2447;
    float _2455 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2453);
    float _2457 = fma(_502, _2437, _2449);
    float _2459 = -_2445;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2455);
    float _2463 = fma(_512, _2445, _2457);
    float _2465 = precise::clamp(_2463, 0.0, 1.0);
    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2469 = _2461 + _2467;
    float _2471 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2473 = _2469 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = exp2(_2471);
    float _2479 = _2477 * _2475;
    float _2481 = _2465 * _2479;
    float _2483 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2485 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2487 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2483;
    out.m_84.y = _2485;
    out.m_84.z = _2487;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2259 = false;
    bool _668 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = as_type<float>(int(gl_VertexIndex));
    float _104 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    int _111 = as_type<int>(_102) >> 2;
    int _113 = _111 + _109;
    int _115 = _113 * 96;
    int _117 = _115 + 32;
    uint _120 = uint(int(uint(_115) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_120)];
    float _122 = as_type<float>(_dmw0.x);
    int _124 = _115 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw0.y);
    int _130 = _115 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw0.z);
    int _136 = _115 + 12;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw0.w);
    uint _142 = uint(int(uint(_117) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_142)];
    float _144 = as_type<float>(_dmw2.x);
    int _146 = _117 + 4;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw2.y);
    int _152 = _117 + 8;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw2.z);
    int _158 = _115 + 16;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_160)];
    float _162 = as_type<float>(_dmw1.x);
    int _164 = _158 + 4;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>(_dmw1.y);
    int _170 = _158 + 8;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>(_dmw1.z);
    int _176 = _115 + 48;
    int _178 = as_type<int>(_102) & 2;
    bool _182 = _178 != 0;
    int _184 = as_type<int>(_102) & 1;
    bool _186 = _184 != 0;
    uint _188 = uint(int(uint(_176) >> uint(2)));
    packed_uint2 _dmw3 = *(const device packed_uint2*)&(*spvDescriptorSet0.vp_s0)._m0[int(_188)];
    float _190 = as_type<float>(_dmw3.x);
    int _192 = _176 + 4;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>(_dmw3.y);
    float _198 = -_128;
    float _200 = _198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _202 = _200 * _200;
    float _204 = _150 * _150;
    float _206 = -_122;
    float _208 = _206 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _210 = fma(_144, _144, _204);
    float _212 = -_134;
    float _214 = _212 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _216 = fma(_208, _208, _202);
    float _218 = fma(_156, _156, _210);
    float _220 = fma(_214, _214, _216);
    float _222 = rsqrt(_218);
    float _224 = rsqrt(_220);
    float _226 = _156 * _222;
    float _228 = _150 * _222;
    float _230 = _144 * _222;
    float _232 = _208 * _224;
    float _234 = _214 * _224;
    float _236 = _200 * _224;
    float _238 = _232 * _226;
    float _240 = _234 * _228;
    float _242 = -_238;
    float _244 = fma(_234, _230, _242);
    float _246 = _236 * _230;
    float _248 = -_240;
    float _250 = fma(_236, _226, _248);
    float _252 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _254 = _244 * _244;
    float _256 = -_246;
    float _258 = fma(_232, _228, _256);
    float _260 = _168 * _168;
    float _262 = fma(_250, _250, _254);
    float _264 = 1.0 / _252;
    float _266 = fma(_258, _258, _262);
    float _268 = fma(_162, _162, _260);
    float _270 = fma(_174, _174, _268);
    float _272 = rsqrt(_266);
    float _274 = float(_111);
    float _276 = rsqrt(_270);
    bool _278 = !_182;
    float _280 = _278 ? 1.0 : (-1.0);
    float _282 = _274 * _264;
    float _284 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _286 = _284 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _288 = abs(_140);
    float _290 = _288 * _280;
    float _292 = _290 * 0.5;
    float _294 = fma(_282, _286, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _296 = _244 * _272;
    float _298 = _258 * _272;
    float _300 = _294 * _292;
    float _302 = _250 * _272;
    float _304 = _162 * _276;
    float _306 = _168 * _276;
    float _308 = _174 * _276;
    float _310 = _272;
    float _312 = _174;
    float _314 = _276;
    float _316 = _102;
    float _318 = _308;
    float _320 = _304;
    if (!_186)
    {
        _310 = _302;
    }
    float _322 = _310;
    float _324 = _322;
    if (!_186)
    {
        _312 = _296;
    }
    float _326 = _312;
    float _328 = _326;
    if (!_186)
    {
        _314 = _298;
    }
    float _330 = _314;
    bool _332 = !_186;
    float _334 = _330;
    if (!_332)
    {
        float _336 = _308 * _302;
        float _338 = _306 * _298;
        float _340 = _304 * _296;
        float _342 = -_336;
        float _344 = fma(_304, _298, _342);
        float _346 = -_338;
        float _348 = fma(_308, _296, _346);
        float _350 = -_340;
        float _352 = fma(_306, _302, _350);
        float _354 = _344 * _344;
        float _356 = fma(_348, _348, _354);
        float _358 = fma(_352, _352, _356);
        float _360 = rsqrt(_358);
        float _362 = _348 * _360;
        float _364 = _344 * _360;
        float _366 = _352 * _360;
        _324 = _362;
        _334 = _366;
        _328 = _364;
    }
    float _368 = _324;
    float _370 = _334;
    float _372 = _328;
    float _374 = -_300;
    float _376 = fma(_368, _374, _122);
    float _378 = -_300;
    float _380 = fma(_370, _378, _134);
    float _382 = -_300;
    float _384 = fma(_372, _382, _128);
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _388 = _376 + _386;
    float _390 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _392 = _380 + _390;
    float _394 = _388 * _388;
    float _396 = _392 * _392;
    float _398 = _394 + _396;
    float _400 = sqrt(_398);
    bool _402 = _400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _404 = _394;
    float _406 = _396;
    float _408 = _376;
    float _410 = _380;
    float _412 = _388;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_402)
    {
        _316 = _384;
    }
    float _416 = _316;
    bool _418 = !_402;
    float _420 = _416;
    float _422 = 0.0;
    if (!_418)
    {
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _428 = _400 + _426;
        float _430 = _384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _432 = rsqrt(_398);
        float _434 = _428 * _424;
        float _436 = _434 * 0.15915493667125701904296875;
        float _438 = _436 * 6.283185482025146484375;
        float _440 = sin(_438);
        float _442 = _436 * 6.283185482025146484375;
        float _444 = cos(_442);
        float _446 = fma(_440, _430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _448 = _432 * _446;
        float _450 = _444 + (-1.0);
        float _452 = fma(_388, _448, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _454 = fma(_392, _448, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _456 = _450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _460 = _452 + _458;
        float _462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _464 = _454 + _462;
        float _466 = fma(_384, _444, _456);
        float _468 = _460 * _460;
        float _470 = _464 * _464;
        _420 = _466;
        _404 = _468;
        _406 = _470;
        _422 = _448;
        _408 = _452;
        _410 = _454;
    }
    float _472 = _420;
    float _474 = _404;
    float _476 = _406;
    float _478 = _422;
    float _480 = _408;
    float _482 = _410;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _486 = _484 != 0;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _490 = _472 + _488;
    float _492 = _308 * _372;
    float _494 = _306 * _368;
    float _496 = fma(_490, _490, _474);
    float _498 = _304 * _370;
    float _500 = -_492;
    float _502 = fma(_306, _370, _500);
    float _504 = _496 + _476;
    float _506 = -_498;
    float _508 = fma(_308, _368, _506);
    float _510 = -_494;
    float _512 = fma(_304, _372, _510);
    float _514 = 0.0;
    float _516 = _478;
    float _518 = _494;
    float _520 = _504;
    float _522 = (*spvDescriptorSet0.vp_c12)._m0[3].z;
    if (_486)
    {
        _514 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _524 = _514;
    float _526 = sqrt(_504);
    float _528 = _524;
    if (_486)
    {
        _516 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _530 = _516;
    float _532 = 0.0;
    float _534 = _530;
    if (_486)
    {
        _532 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _536 = _532;
    float _538 = _536;
    if (_486)
    {
        float _540 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _542 = _524 + _540;
        _528 = _542;
    }
    float _544 = _528;
    if (_486)
    {
        float _546 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _548 = _530 + _546;
        _534 = _548;
    }
    float _550 = _534;
    if (_486)
    {
        float _552 = _544 * _544;
        _318 = _552;
    }
    float _554 = _318;
    if (_486)
    {
        float _556 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _558 = _536 + _556;
        _538 = _558;
    }
    float _560 = _538;
    if (_486)
    {
        float _562 = fma(_550, _550, _554);
        _412 = _562;
    }
    float _564 = _412;
    float _566 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _570 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _572 = 0.0;
    if (_486)
    {
        float _574 = fma(_560, _560, _564);
        _572 = _574;
    }
    float _576 = _572;
    float _578 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _580 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _582 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _584 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _586 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _588 = _576;
    if (_486)
    {
        float _590 = rsqrt(_576);
        _588 = _590;
    }
    float _592 = _588;
    out.m_70.x = _502;
    out.m_70.y = _508;
    out.m_70.z = _512;
    bool _594 = _526 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _596 = isnan(_526);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _602 = _598 || _600;
    if (!_486)
    {
        _518 = 0.0;
        _520 = 0.0;
    }
    float _604 = _518;
    float _606 = _520;
    float _608 = _604;
    float _610 = _606;
    if (!_486)
    {
        _522 = 0.0;
    }
    float _612 = _522;
    out.m_72.x = _580;
    out.m_72.y = _582;
    out.m_72.z = _566;
    out.m_72.w = _568;
    out.m_74.x = _570;
    out.m_74.y = _578;
    out.m_74.z = _584;
    out.m_74.w = _586;
    float _614 = _612;
    if (!_602)
    {
        _320 = 1.0;
    }
    float _616 = _320;
    float _618 = 0.0;
    float _620 = _616;
    if (_486)
    {
        float _622 = _592 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _618 = _622;
    }
    float _624 = _618;
    if (_486)
    {
        float _626 = _550 * _624;
        _614 = _626;
    }
    float _628 = _614;
    if (_486)
    {
        float _630 = _544 * _624;
        _608 = _630;
    }
    float _632 = _608;
    if (_486)
    {
        float _634 = _560 * _624;
        _610 = _634;
    }
    float _636 = _610;
    bool _638 = !_602;
    if (!_638)
    {
        bool _640 = _526 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _642 = isnan(_526);
        bool _644 = _640 || _642;
        bool _646 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _648 = _644 || _646;
        if (!_648)
        {
            float _650 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _652 = _526 + _650;
            float _654 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _656 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _654;
            float _658 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _660 = _658 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _662 = 1.0 / _656;
            float _664 = _652 * _662;
            float _666 = fma(_664, _660, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _620 = _666;
            _668 = true;
        }
        else
        {
            bool _670 = _526 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _672 = isnan(_526);
            bool _674 = _670 || _672;
            bool _676 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _678 = _674 || _676;
            if (!_678)
            {
                float _680 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _682 = _526 + _680;
                float _684 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _686 = _684 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _688 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _690 = _688 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _692 = 1.0 / _686;
                float _694 = _682 * _692;
                float _696 = fma(_694, _690, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _620 = _696;
                _668 = true;
            }
            else
            {
                _620 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _668 = false;
    float _698 = _620;
    float _700 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _702 = _472 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _706 = _480 + _704;
    float _708 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _710 = _482 + _708;
    float _712 = _128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _714 = fma(_702, _698, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _716 = fma(_706, _698, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _718 = fma(_710, _698, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _720 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[2].x, _712);
    float _722 = _714 + _632;
    float _724 = _716 + _628;
    float _726 = _718 + _636;
    float _728 = _128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = _722 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _736 = _724 + _734;
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _740 = _726 + _738;
    float _742 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[1].x, _728);
    float _744 = _732 * _732;
    float _746 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[2].z, _720);
    float _748 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[1].z, _742);
    float _750 = fma(_736, _736, _744);
    float _752 = _746 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _754 = _748 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _756 = fma(_740, _740, _750);
    float _758 = _128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _760 = _128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _762 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _764 = rsqrt(_756);
    float _766 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[0].x, _758);
    float _768 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[3].x, _760);
    float _770 = _762 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _772 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[0].z, _766);
    float _774 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[3].z, _768);
    float _776 = sqrt(_756);
    float _778 = _772 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _780 = _774 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _782 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _784 = _764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _786 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _788 = floor(_782);
    float _790 = _740 * _784;
    float _792 = _754 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _794 = _736 * _784;
    float _796 = _790 * _790;
    float _798 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[7].x, _792);
    float _800 = _794 * _794;
    float _802 = floor(_786);
    float _804 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _798);
    float _806 = _754 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _808 = _800 + _796;
    float _810 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _804);
    float _812 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[6].x, _806);
    float _814 = sqrt(_808);
    float _816 = -_788;
    float _818 = _782 + _816;
    float _820 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _812);
    float _822 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _820);
    float _824 = 1.0 / _810;
    float _826 = _822 + _810;
    bool _828 = _814 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _830 = _770 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _832 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _830);
    float _834 = _826 * _824;
    float _836 = _834 * 0.5;
    float _838 = _770 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _840 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _832);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _844 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[30].w, _842);
    float _846 = _804;
    float _848 = _814;
    float _850 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _852 = _794;
    float _854 = _790;
    float _856 = _796;
    float _858 = _782;
    bool _860 = _828;
    if (_828)
    {
        float _862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _862;
    }
    float _864 = _846;
    float _866 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _838);
    float _868 = _840 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _870 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _866);
    float _872 = 1.0 / _844;
    float _874 = _870 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _878 = _814 + _876;
    float _880 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _882 = _878;
    if (_828)
    {
        float _884 = _878 * _864;
        _882 = _884;
    }
    float _886 = _882;
    float _888 = precise::max(0.0, _880);
    float _890 = trunc(_874);
    int _892 = int(_890);
    if (_828)
    {
        float _894 = _886 * 0.15915493667125701904296875;
        _848 = _894;
    }
    float _896 = _848;
    float _898 = _722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _900 = -_784;
    float _902 = -_888;
    float _904 = fma(_732, _900, _902);
    float _906 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _910 = _872 * _908;
    float _912 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[2].x, _898);
    float _914 = _864;
    int _916 = 2;
    float _918 = _904;
    if (_828)
    {
        float _920 = _896 * 6.283185482025146484375;
        float _922 = sin(_920);
        _914 = _922;
    }
    float _924 = _914;
    if (_828)
    {
        float _926 = _904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _850 = _926;
    }
    float _928 = _850;
    bool _930 = _910 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _932 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _912);
    bool _934 = _910 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _936 = !_930;
    int _938 = _936 ? 0 : 1;
    float _940 = _932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _942 = trunc(_868);
    int _944 = int(_942);
    int _946 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _948 = _892 + _946;
    int _950 = _948 + 1;
    float _952 = _940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _954 = _928;
    float _956 = as_type<float>(_938);
    if (!_930)
    {
        _916 = 1;
    }
    int _958 = _916;
    float _960 = _932;
    int _962 = _958;
    if (_828)
    {
        float _964 = _896 * 6.283185482025146484375;
        float _966 = cos(_964);
        _960 = _966;
    }
    float _968 = _960;
    if (!_934)
    {
        _962 = _938;
    }
    int _970 = _962;
    float _972 = -_952;
    float _974 = fma(_972, _906, 1.0);
    float _976 = _722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_828)
    {
        float _978 = fma(_924, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _954 = _978;
    }
    float _980 = _954;
    int _982 = _970 << 6;
    bool _984 = _950 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _986 = _808;
    float _988 = _980;
    float _990 = as_type<float>(_982);
    if (_828)
    {
        float _992 = rsqrt(_808);
        _986 = _992;
    }
    float _994 = _986;
    int _996 = _982 + 96;
    uint _998 = uint(int(uint(_996) >> uint(2)));
    uint _1000 = uint(int(uint(int(_998)) >> uint(2)));
    int _1002 = int(_998) & 3;
    float _1004 = (*spvDescriptorSet0.vp_c15)._m0[int(_1000)][_1002];
    int _1006 = int(_998) + 1;
    uint _1008 = uint(int(uint(_1006) >> uint(2)));
    int _1010 = _1006 & 3;
    float _1012 = (*spvDescriptorSet0.vp_c15)._m0[int(_1008)][_1010];
    int _1014 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1016 = _944 + _1014;
    int _1018 = _1016 + 1;
    float _1020 = as_type<float>(_1018);
    if (_828)
    {
        float _1022 = _968 + (-1.0);
        _956 = _1022;
    }
    float _1024 = _956;
    int _1026 = _982 + 48;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    float _1044 = log2(_974);
    float _1046 = _1024;
    if (_828)
    {
        float _1048 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1046 = _1048;
    }
    float _1050 = _1046;
    if (_828)
    {
        float _1052 = fma(_904, _968, _1050);
        _918 = _1052;
    }
    float _1054 = _918;
    int _1056 = _982 + 104;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    uint _1060 = uint(int(uint(int(_1058)) >> uint(2)));
    int _1062 = int(_1058) & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    int _1066 = int(_1058) + 1;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    int _1070 = _1066 & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    float _1074 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[1].x, _976);
    if (_828)
    {
        float _1076 = _994 * _980;
        _988 = _1076;
    }
    float _1078 = _988;
    int _1080 = _950 | _1018;
    float _1082 = _722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1084 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1074);
    if (_828)
    {
        float _1086 = _794 * _1078;
        _852 = _1086;
    }
    float _1088 = _852;
    bool _1090 = _1080 < 0;
    bool _1092 = _1090 || _984;
    int _1094 = _982 + 64;
    uint _1096 = uint(int(uint(_1094) >> uint(2)));
    uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
    int _1100 = int(_1096) & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = int(_1096) + 1;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    int _1108 = _1104 & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    float _1112 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1082);
    float _1114 = _1112;
    if (_828)
    {
        float _1116 = _790 * _1078;
        _854 = _1116;
    }
    float _1118 = _854;
    float _1120 = _722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1122 = _1018 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1124 = _1122 || _1092;
    float _1126 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1112);
    if (!_828)
    {
        _1114 = _800;
    }
    float _1128 = _1114;
    float _1130 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1132 = _982 + 56;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
    int _1138 = int(_1134) & 3;
    float _1140 = (*spvDescriptorSet0.vp_c15)._m0[int(_1136)][_1138];
    int _1142 = int(_1134) + 1;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    int _1146 = _1142 & 3;
    float _1148 = (*spvDescriptorSet0.vp_c15)._m0[int(_1144)][_1146];
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1152 = fma(_776, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1150);
    float _1154 = precise::clamp(_1152, 0.0, 1.0);
    float _1156 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1120);
    float _1158 = _1128;
    if (_828)
    {
        float _1160 = _1088 * _1088;
        _1158 = _1160;
    }
    float _1162 = _1158;
    if (_828)
    {
        float _1164 = _1118 * _1118;
        _856 = _1164;
    }
    float _1166 = _856;
    float _1168 = -_1154;
    float _1170 = _1168 + 1.0;
    float _1172 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1156);
    float _1174 = fma(_1054, _1054, _1162);
    int _1176 = _982 + 72;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
    int _1182 = int(_1178) & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    int _1186 = int(_1178) + 1;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    int _1190 = _1186 & 3;
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[int(_1188)][_1190];
    float _1194 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1196 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1198 = _1174 + _1166;
    float _1200 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1202 = abs(_1170);
    float _1204 = log2(_1202);
    float _1206 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1194);
    float _1208 = _1044 * 0.693147182464599609375;
    int _1210 = _982 + 80;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    uint _1214 = uint(int(uint(int(_1212)) >> uint(2)));
    int _1216 = int(_1212) & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    int _1220 = int(_1212) + 1;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    int _1224 = _1220 & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    float _1228 = _770 * _1012;
    float _1230 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1206);
    float _1232 = fma(_1004, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1228);
    float _1234 = rsqrt(_1198);
    float _1236 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1230);
    float _1238 = _770 * _1042;
    int _1240 = _982 + 88;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    uint _1244 = uint(int(uint(int(_1242)) >> uint(2)));
    int _1246 = int(_1242) & 3;
    float _1248 = (*spvDescriptorSet0.vp_c15)._m0[int(_1244)][_1246];
    int _1250 = int(_1242) + 1;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    int _1254 = _1250 & 3;
    float _1256 = (*spvDescriptorSet0.vp_c15)._m0[int(_1252)][_1254];
    float _1258 = fma(_1034, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1238);
    int _1260 = as_type<int>(_1034);
    int _1262 = as_type<int>(_1072);
    int _1264 = as_type<int>(_1258);
    float _1266 = _1236;
    if (!_1124)
    {
        int _1268 = _1018 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1270 = _1268 + _950;
        _1260 = _1270;
    }
    int _1272 = _1260;
    float _1274 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1276 = 1.0 / _1236;
    float _1278 = fma(_1064, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1232);
    float _1280 = _1278 + _1072;
    if (!_1124)
    {
        int _1282 = _1272 << 2;
        _1262 = _1282;
    }
    int _1284 = _1262;
    float _1286 = _1234 * _1088;
    float _1288 = _1234 * _1054;
    float _1290 = _770 * _1110;
    float _1292 = _1234 * _1118;
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _1296 = as_type<int>(_1286);
    float _1298 = _1234;
    if (!_1124)
    {
        int _1300 = 12 & _1284;
        _1296 = _1300;
    }
    int _1302 = _1296;
    float _1304 = fma(_1102, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1290);
    float _1306 = exp2(_1274);
    float _1308 = -_1294;
    float _1310 = fma(_1288, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1308);
    float _1312 = fma(_1140, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1258);
    int _1314 = _1302;
    float _1316 = _1310;
    if (!_1124)
    {
        uint _1318 = uint(int(uint(_1272) >> uint(2)));
        _1264 = int(_1318);
    }
    int _1320 = _1264;
    float _1322 = _1312 + _1148;
    float _1324 = 1.0 / _1280;
    if (!_1124)
    {
        int _1326 = _1320 << 4;
        int _1328 = _1326 + _1302;
        _1314 = _1328;
    }
    int _1330 = _1314;
    float _1332 = -_802;
    float _1334 = _786 + _1332;
    float _1336 = fma(_1184, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1304);
    float _1338 = -_1292;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1310);
    float _1342 = _1336 + _1192;
    float _1344 = _1292;
    if (!_1124)
    {
        float _1346 = floor(_868);
        _1344 = _1346;
    }
    float _1348 = _1344;
    float _1350 = fma(_1340, -0.5, 0.5);
    float _1352 = _770 * _1226;
    float _1354 = fma(_1340, 0.5, 0.5);
    float _1356 = fma(_1218, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1352);
    float _1358 = _1322 * _1324;
    float _1360 = _1342 * _1324;
    float _1362 = _1322;
    float _1364 = _1350;
    float _1366 = _1360;
    if (!_1124)
    {
        int _1368 = _1330 + 400;
        uint _1370 = uint(int(uint(_1368) >> uint(2)));
        uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
        int _1374 = int(_1370) & 3;
        float _1376 = (*spvDescriptorSet0.vp_c15)._m0[int(_1372)][_1374];
        _1362 = _1376;
    }
    float _1378 = _1362;
    float _1380 = sqrt(_1350);
    float _1382 = fma(_1248, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1356);
    bool _1384 = _1358 >= 0.0;
    float _1386 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1388 = _1382 + _1256;
    bool _1390 = _1358 <= 1.0;
    bool _1392 = _1390 && _1384;
    float _1394 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1396 = _802;
    float _1398 = _1348;
    if (!_1124)
    {
        float _1400 = floor(_874);
        _1396 = _1400;
    }
    float _1402 = _1396;
    bool _1404 = _1360 >= 0.0;
    bool _1406 = _1404 && _1392;
    float _1408 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1386);
    float _1410 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1394);
    float _1412 = fma(_1354, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _1414 = _1360 <= 1.0;
    bool _1416 = _1414 && _1406;
    if (!_1124)
    {
        float _1418 = -_1348;
        float _1420 = _868 + _1418;
        _1398 = _1420;
    }
    float _1422 = _1398;
    float _1424 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1408);
    float _1426 = fma(_1354, _1412, -0.212114393711090087890625);
    float _1428 = _1288 + 1.0;
    float _1430 = _1380 * 0.636619746685028076171875;
    float _1432 = fma(_1354, _1426, 1.570728778839111328125);
    float _1434 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1424);
    float _1436 = _868;
    if (!_1124)
    {
        float _1438 = rint(_1378);
        float _1440 = precise::max(_1438, 0.0);
        uint _1442 = uint(_1440);
        uint _1444 = clamp(_1442, 0u, 65535u);
        _1436 = as_type<float>(_1444);
    }
    float _1446 = _1436;
    float _1448 = -_1288;
    float _1450 = fma(_1306, _1428, _1448);
    float _1452 = _1402;
    float _1454 = _1450;
    if (!_1124)
    {
        float _1456 = -_1402;
        float _1458 = _874 + _1456;
        _858 = _1458;
    }
    float _1460 = _858;
    float _1462 = _1388 * _1324;
    if (_1416)
    {
        float _1464 = float(_970);
        _1364 = _1464;
    }
    float _1466 = _1364;
    float _1468 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1410);
    float _1470 = _1434 * _1276;
    float _1472 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1474 = -_1432;
    float _1476 = fma(_1430, _1474, 1.0);
    float _1478 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1468);
    float _1480 = _1466;
    if (_1416)
    {
        float _1482 = rint(_1466);
        float _1484 = precise::max(_1482, 0.0);
        uint _1486 = uint(_1484);
        uint _1488 = clamp(_1486, 0u, 65535u);
        _1480 = as_type<float>(_1488);
    }
    float _1490 = _1480;
    float _1492 = fma(_1470, 0.5, 0.5);
    float _1494 = fma(_1450, 0.5, 0.5);
    float _1496 = _1478 * _1276;
    float2 _4809 = float2(_1334, _818);
    float _1498 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4809, float2(0.0), isnan(_4809)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4809, float2(0.0), isnan(_4809)), level(0.0)).x;
    float _1500 = fma(_1496, -0.5, 0.5);
    float _1502 = _874;
    if (!_1124)
    {
        float3 _4828 = float3(_1460, _1422, float(as_type<int>(_1446)));
        float3 _4832 = select(_4828, float3(0.0), isnan(_4828));
        float _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4832.xy, uint(rint(_4832.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4832.xy, uint(rint(_4832.z)), level(0.0)).x;
        _1502 = _1504;
    }
    float _1506 = _1502;
    float _1508 = _1490;
    if (_1416)
    {
        float3 _4847 = float3(_1358, _1360, float(as_type<int>(_1490)));
        float3 _4849 = select(_4847, float3(0.0), isnan(_4847));
        float _1510 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4849.xy, uint(rint(_4849.z)), _1462, level(0.0));
        _1508 = _1510;
    }
    float _1512 = _1508;
    float3 _4859 = float3(_1492, _1500, _1472);
    float _1514 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4859, float3(0.0), isnan(_4859)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4859, float3(0.0), isnan(_4859)), level(0.0)).x;
    float3 _4868 = float3(_1492, _1500, _1472);
    float4 _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4868, float3(0.0), isnan(_4868)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4868, float3(0.0), isnan(_4868)), level(0.0)).xyzw;
    float _1519 = _1517.x;
    float _1521 = _1517.y;
    float _1523 = _1517.z;
    float _1525 = _1517.w;
    float2 _4884 = float2(_1476, _1494);
    float3 _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4884, float2(0.0), isnan(_4884)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4884, float2(0.0), isnan(_4884)), level(0.0)).xyz;
    float _1531 = _1529.x;
    float _1533 = _1529.y;
    float _1535 = _1529.z;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1539 = _1537 != 0;
    float _1541 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1545 = _1543 != 0;
    float _1547 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1551 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1541);
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1555 = _1545;
    if (_1539)
    {
        _1452 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1557 = _1452;
    if (!_1539)
    {
        float _1559 = -_190;
        float _1561 = (-0.0) + _1559;
        _1020 = _1561;
    }
    float _1563 = _1020;
    float _1565 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1553);
    float _1567 = _1563;
    if (_1539)
    {
        bool _1569 = _1557 > 0.5;
        _860 = _1569;
    }
    bool _1571 = _860;
    if (_1545)
    {
        _1366 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1573 = _1366;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1577 = _1573;
    if (_1539)
    {
        float _1579 = -_190;
        float _1581 = _1571 ? _190 : _1579;
        _1567 = _1581;
    }
    float _1583 = _1567;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1589 = _1587 != 0;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1593 = !_182;
    float _1595 = _1593 ? 0.0 : 1.0;
    float _1597 = fma(_1585, -2.0, _1575);
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1601 = _1599 != 0;
    float _1603 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1591);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1607 = _1605 != 0;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1611 = abs(_910);
    float _1613 = log2(_1611);
    bool _1615 = false;
    float _1617 = _1595;
    if (_1545)
    {
        bool _1619 = _1573 > 0.5;
        _1615 = _1619;
    }
    bool _1621 = _1615;
    float _1623 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1551);
    bool _1625 = _1621;
    if (!_1545)
    {
        _990 = _1595;
    }
    float _1627 = _990;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1631 = _1627;
    if (_1589)
    {
        _414 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1633 = _414;
    float _1635 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1623);
    float _1637 = _1633;
    if (_1545)
    {
        float _1639 = -_1595;
        float _1641 = _1621 ? _1639 : _1595;
        _1631 = _1641;
    }
    float _1643 = _1631;
    float _1645 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1629);
    if (_1589)
    {
        bool _1647 = _1633 > 0.5;
        _1625 = _1647;
    }
    bool _1649 = _1625;
    if (!_1589)
    {
        float _1651 = -_196;
        float _1653 = (-0.0) + _1651;
        _1637 = _1653;
    }
    float _1655 = _1637;
    float _1657 = exp2(_1547);
    float _1659 = _1655;
    if (!_1601)
    {
        _1316 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1661 = _1316;
    float _1663 = _1661;
    if (_1589)
    {
        float _1665 = -_196;
        float _1667 = _1649 ? _196 : _1665;
        _1659 = _1667;
    }
    float _1669 = _1659;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1673 = _1671;
    if (_1601)
    {
        _1663 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1675 = _1663;
    float _1677 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1645);
    float _1679 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1597);
    if (!_1601)
    {
        _1298 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1681 = _1298;
    float _1683 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1671);
    float _1685 = _1681;
    if (_1601)
    {
        _1685 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1687 = _1685;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (!_1601)
    {
        _1673 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1691 = _1673;
    float _1693 = _1677 * (-0.15915493667125701904296875);
    float _1695 = _1691;
    if (_1601)
    {
        _1695 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1697 = _1695;
    float _1699 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1689);
    if (!_1601)
    {
        _1454 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1701 = _1454;
    float _1703 = _1693 * 6.283185482025146484375;
    float _1705 = sin(_1703);
    float _1707 = _1701;
    if (_1601)
    {
        _1707 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1709 = _1707;
    float _1711 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1713 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1699);
    float _1715 = 0.0;
    if (!_1601)
    {
        _1715 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1717 = _1715;
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1721 = _1693 * 6.283185482025146484375;
    float _1723 = cos(_1721);
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1727 = _1717;
    if (_1601)
    {
        _1727 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1729 = _1727;
    float _1731 = _1713 * (-0.15915493667125701904296875);
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1735 = fma(_1719, -2.0, _1725);
    if (_1607)
    {
        _1577 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1737 = _1577;
    float _1739 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1609);
    float _1741 = _1731 * 6.283185482025146484375;
    float _1743 = cos(_1741);
    float _1745 = _1583 + 0.5;
    float _1747 = -_1733;
    float _1749 = fma(_1711, 2.0, _1747);
    float _1751 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1603);
    float _1753 = _1643 + (-0.5);
    float _1755 = _1745 * _1705;
    if (_1607)
    {
        bool _1757 = _1737 > 0.5;
        _1555 = _1757;
    }
    bool _1759 = _1555;
    float _1761 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1565);
    float _1763 = _1731 * 6.283185482025146484375;
    float _1765 = sin(_1763);
    float _1767 = _1745 * _1723;
    float _1769 = -_1755;
    float _1771 = fma(_1753, _1723, _1769);
    if (_1607)
    {
        float _1773 = -_1595;
        float _1775 = _1759 ? _1773 : _1595;
        _1617 = _1775;
    }
    float _1777 = _1617;
    float _1779 = fma(_1753, _1705, _1767);
    float _1781 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1783 = _1669 + 0.5;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1791 = _1783 * _1743;
    float _1793 = _1777 + (-0.5);
    float _1795 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1683);
    float _1797 = -_1785;
    float _1799 = fma(_1789, 2.0, _1797);
    float _1801 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1739);
    float _1803 = _1783 * _1765;
    float _1805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1807 = fma(_1793, _1765, _1791);
    float _1809 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1799);
    float _1811 = -_1803;
    float _1813 = fma(_1793, _1743, _1811);
    float _1815 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1817 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1749);
    float _1819 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1735);
    float _1821 = _1771 + 0.5;
    float _1823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1825 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1827 = _1779 + (-0.5);
    float _1829 = _1813 + 0.5;
    float _1831 = _1635 + _1236;
    float _1833 = fma(_1825, _1821, _1809);
    float _1835 = -_1781;
    float _1837 = -_1679;
    float _1839 = fma(_1835, _1827, _1837);
    float _1841 = _1807 + (-0.5);
    float _1843 = exp2(_1815);
    float _1845 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1847 = _1831 * 0.5;
    float _1849 = fma(_1845, _1829, _1817);
    float _1851 = -_1801;
    float _1853 = _1851 + 1.0;
    float _1855 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1857 = -_1751;
    float _1859 = _1857 + 1.0;
    float _1861 = -_1761;
    float _1863 = _1861 + 1.0;
    out.m_76.z = _1847;
    out.m_76.w = _1236;
    float _1865 = -_1855;
    float _1867 = -_1819;
    float _1869 = fma(_1865, _1841, _1867);
    float _1871 = -_1795;
    float _1873 = _1871 + 1.0;
    out.gl_Position.x = _1434;
    out.gl_Position.y = _1478;
    out.gl_Position.z = _1635;
    out.gl_Position.w = _1236;
    float _1875 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = fma(_1807, _1853, _1869);
    float _1881 = -_1859;
    float _1883 = fma(_1771, _1881, _1833);
    float _1885 = fma(_1877, -2.0, 3.0);
    float _1887 = _1877 * _1877;
    bool _1889 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan(0.5);
    bool _1897 = _1893 || _1895;
    float _1899 = fma(_1779, _1863, _1839);
    float _1901 = -_1873;
    float _1903 = fma(_1813, _1901, _1849);
    float _1905 = _1887 * _1885;
    float _1907 = -_1905;
    float _1909 = _1907 + 1.0;
    bool _1911 = _910 <= 8000.0;
    bool _1913 = isnan(_910);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(8000.0);
    bool _1919 = _1915 || _1917;
    float _1921 = float(_1919);
    out.m_78.x = _1883;
    out.m_78.y = _1899;
    out.m_78.z = _1903;
    out.m_78.w = _1879;
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1905);
    float _1925 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1927 = _1925 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1929 = _1921 * _1923;
    float _1931 = _1921;
    float _1933 = _1927;
    if (_1897)
    {
        _1931 = 1.0;
    }
    float _1935 = _1931;
    float _1937 = fma(_282, _1927, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1939 = _1935;
    if (!_1897)
    {
        float _1941 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1943 = _1941 * 0.15915493667125701904296875;
        float _1945 = _1943 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        float _1949 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1951 = _1949 * 0.15915493667125701904296875;
        float _1953 = _1943 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        float _1957 = 1.0 / _1947;
        float _1959 = _1951 * 6.283185482025146484375;
        float _1961 = cos(_1959);
        float _1963 = _1955 * _1957;
        float _1965 = _1951 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1961 * _1963;
        float _1971 = 1.0 / _1969;
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1975 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1973;
        float _1977 = 1.0 / _1975;
        float _1979 = _1967 * _1971;
        float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1983 = fma(_910, _1979, _1981);
        float _1985 = _1983 * _1977;
        float _1987 = precise::clamp(_1985, 0.0, 1.0);
        float _1989 = -_1987;
        float _1991 = _1989 + 1.0;
        _1939 = _1991;
        _1933 = _1971;
        _1266 = _1957;
    }
    float _1993 = _1939;
    float _1995 = _1933;
    float _1997 = _1266;
    float _1999 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2001 = -_1498;
    float _2003 = _2001 + 1.0;
    float _2005 = -_1657;
    float _2007 = _2005 + 1.0;
    float _2009 = _1937 * _1993;
    float _2011 = _2003 * _1999;
    float _2013 = precise::clamp(_2011, 0.0, 1.0);
    float _2015 = _1999;
    float _2017 = _2013;
    float _2019 = _1997;
    float _2021 = _1995;
    if (!_1416)
    {
        _2015 = 1.0;
    }
    float _2023 = _2015;
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2027 = _2023;
    if (_1416)
    {
        bool _2029 = _1512 >= _1462;
        bool _2031 = isnan(_1512);
        bool _2033 = _2029 || _2031;
        bool _2035 = isnan(_1462);
        bool _2037 = _2033 || _2035;
        float _2039 = float(_2037);
        _2027 = _2039;
    }
    float _2041 = _2027;
    float _2043 = -_2013;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2047 = _2045;
    float _2049 = 1.0;
    if (!_1124)
    {
        int _2051 = _1272 << 4;
        int _2053 = _2051 + 2048;
        uint _2055 = uint(int(uint(_2053) >> uint(2)));
        uint _2057 = uint(int(uint(int(_2055)) >> uint(2)));
        int _2059 = int(_2055) & 3;
        float _2061 = (*spvDescriptorSet0.vp_c15)._m0[int(_2057)][_2059];
        int _2063 = int(_2055) + 1;
        uint _2065 = uint(int(uint(_2063) >> uint(2)));
        int _2067 = _2063 & 3;
        float _2069 = (*spvDescriptorSet0.vp_c15)._m0[int(_2065)][_2067];
        int _2071 = _2053 + 8;
        uint _2073 = uint(int(uint(_2071) >> uint(2)));
        uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
        int _2077 = int(_2073) & 3;
        float _2079 = (*spvDescriptorSet0.vp_c15)._m0[int(_2075)][_2077];
        int _2081 = int(_2073) + 1;
        uint _2083 = uint(int(uint(_2081) >> uint(2)));
        int _2085 = _2081 & 3;
        float _2087 = (*spvDescriptorSet0.vp_c15)._m0[int(_2083)][_2085];
        float _2089 = _770 * _2069;
        float _2091 = fma(_2061, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2089);
        float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2091);
        float _2095 = _2093 + _2087;
        float _2097 = precise::clamp(_2095, 0.0, 1.0);
        float _2099 = -_2097;
        float _2101 = _2099 + _1506;
        float _2103 = fma(_2101, 500.0, 1.5);
        float _2105 = exp2(_2103);
        float _2107 = 0.0 + _2105;
        float _2109 = precise::clamp(_2107, 0.0, 1.0);
        _2049 = _2109;
        _2017 = _2105;
    }
    float _2111 = _2049;
    float _2113 = _2017;
    float _2115 = _2025 * _1514;
    float _2117 = _2041 * _2111;
    float _2119 = -_2025;
    float _2121 = _2119 + 1.0;
    bool _2123 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2125 = isnan(_776);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2131 = _2127 || _2129;
    float _2133 = _1525 * _2115;
    float _2135 = -_2117;
    float _2137 = fma(_2135, _2045, 1.0);
    float _2139 = precise::clamp(_2137, 0.0, 1.0);
    float _2141 = _1535 * _2115;
    float _2143 = fma(_1531, _2133, _1519);
    float _2145 = fma(_1533, _2133, _1521);
    float _2147 = _1525 * _2121;
    float _2149 = _2139 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2151 = fma(_1525, _2141, _1523);
    float _2153 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_80.x = _2149;
    float _2155 = _2113;
    float _2157 = _2121;
    float _2159 = _2139;
    if (!_2131)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2161 = _2019;
    float _2163 = _2161;
    float _2165 = _2161;
    if (!_2131)
    {
        _2047 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2167 = _2047;
    out.m_82.x = _2143;
    out.m_82.y = _2145;
    out.m_82.z = _2151;
    out.m_82.w = _2147;
    float _2169 = _2167;
    float _2171 = _2167;
    if (!_2131)
    {
        _2155 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2173 = _2155;
    float _2175 = _2173;
    float _2177 = _2173;
    if (!_2131)
    {
        _2157 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2179 = _2157;
    float _2181 = _2179;
    float _2183 = _2179;
    if (!_2131)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2185 = _2021;
    float _2187 = _2185;
    float _2189 = _2185;
    if (!_2131)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2191 = _2159;
    bool _2193 = !_2131;
    float _2195 = _2191;
    float _2197 = _2191;
    if (!_2193)
    {
        bool _2199 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2201 = isnan(_776);
        bool _2203 = _2199 || _2201;
        bool _2205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2207 = _2203 || _2205;
        if (!_2207)
        {
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2211 = _776 + _2209;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2215 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2213;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2221 = 1.0 / _2215;
            float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2239 = _2211 * _2221;
            float _2241 = precise::clamp(_2239, 0.0, 1.0);
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2247 = fma(_2241, _2219, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2249 = fma(_2241, _2245, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2251 = fma(_2241, _2225, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2253 = fma(_2241, _2229, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2255 = fma(_2241, _2233, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2257 = fma(_2241, _2237, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2171 = _2247;
            _2189 = _2255;
            _2165 = _2251;
            _2183 = _2253;
            _2177 = _2249;
            _2197 = _2257;
            _2259 = true;
        }
        else
        {
            bool _2261 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2263 = isnan(_776);
            bool _2265 = _2261 || _2263;
            bool _2267 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2269 = _2265 || _2267;
            if (!_2269)
            {
                _2163 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2271 = _2163;
            _2165 = _2271;
            if (!_2269)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2273 = _2169;
            _2171 = _2273;
            if (!_2269)
            {
                _2175 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2275 = _2175;
            _2177 = _2275;
            if (!_2269)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2277 = _2181;
            _2183 = _2277;
            if (!_2269)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2279 = _2187;
            _2189 = _2279;
            if (!_2269)
            {
                _2195 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2281 = _2195;
            bool _2283 = !_2269;
            _2197 = _2281;
            if (!_2283)
            {
                bool _2285 = _776 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2287 = isnan(_776);
                bool _2289 = _2285 || _2287;
                bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2293 = _2289 || _2291;
                if (!_2293)
                {
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2297 = _776 + _2295;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2301 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2299;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2307 = 1.0 / _2301;
                    float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2325 = _2297 * _2307;
                    float _2327 = precise::clamp(_2325, 0.0, 1.0);
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2333 = fma(_2327, _2305, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2335 = fma(_2327, _2331, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2337 = fma(_2327, _2311, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2339 = fma(_2327, _2315, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2341 = fma(_2327, _2319, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2343 = fma(_2327, _2323, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2171 = _2333;
                    _2189 = _2341;
                    _2165 = _2337;
                    _2183 = _2339;
                    _2177 = _2335;
                    _2197 = _2343;
                    _2259 = true;
                }
                else
                {
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2165 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2177 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2197 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2259 = false;
    float _2345 = _2171;
    float _2347 = _2189;
    float _2349 = _2165;
    float _2351 = _2183;
    float _2353 = _2177;
    float _2355 = _2197;
    float _2357 = fma(_508, -0.5, 0.5);
    float _2359 = precise::clamp(_2357, 0.0, 1.0);
    float _2361 = -_2345;
    float _2363 = _2361 + _2347;
    float _2365 = -_2349;
    float _2367 = _2365 + _2351;
    float _2369 = -_2353;
    float _2371 = _2369 + _2355;
    bool _2373 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2375 = fma(_2359, _2363, _2345);
    float _2377 = fma(_2359, _2367, _2349);
    float _2379 = fma(_2359, _2371, _2353);
    float _2381 = _2153 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2383 = _2375 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _2385 = fma(_2377, 0.298911988735198974609375, _2383);
    out.m_86.x = _2381;
    float _2387 = fma(_2379, 0.114477999508380889892578125, _2385);
    float _2389 = -_2387;
    float _2391 = _2377 + _2389;
    float _2393 = -_2387;
    float _2395 = _2375 + _2393;
    float _2397 = -_2387;
    float _2399 = _2379 + _2397;
    float _2401 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2387);
    float _2403 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2387);
    float _2405 = fma(_2399, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2387);
    out.m_88.x = _2401;
    out.m_88.y = _2403;
    out.m_88.z = _2405;
    if (!_2373)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2407 = -_722;
    float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2411 = -_724;
    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2415 = -_726;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2419 = _2409 * _2409;
    float _2421 = fma(_2413, _2413, _2419);
    float _2423 = fma(_2417, _2417, _2421);
    float _2425 = sqrt(_2423);
    float _2427 = rsqrt(_2423);
    float _2429 = -_2425;
    float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2433 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2435 = precise::clamp(_2433, 0.0, 1.0);
    float _2437 = _2413 * _2427;
    float _2439 = _2409 * _2427;
    float _2441 = abs(_2435);
    float _2443 = log2(_2441);
    float _2445 = _2417 * _2427;
    float _2447 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2449 = _508 * _2439;
    float _2451 = -_2439;
    float _2453 = -_2447;
    float _2455 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2453);
    float _2457 = fma(_502, _2437, _2449);
    float _2459 = -_2445;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2455);
    float _2463 = fma(_512, _2445, _2457);
    float _2465 = precise::clamp(_2463, 0.0, 1.0);
    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2469 = _2461 + _2467;
    float _2471 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2473 = _2469 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = exp2(_2471);
    float _2479 = _2477 * _2475;
    float _2481 = _2465 * _2479;
    float _2483 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2485 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2487 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2483;
    out.m_84.y = _2485;
    out.m_84.z = _2487;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

