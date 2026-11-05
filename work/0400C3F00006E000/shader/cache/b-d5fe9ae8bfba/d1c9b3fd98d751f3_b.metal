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
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c10 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    constant _16* vp_c7 [[id(7)]];
    const device _37* vp_s0 [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    texture2d_array<float> vp_t_tcb_14 [[id(19)]];
    sampler vp_t_tcb_14Smplr [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_32Smplr_w [[id(22)]];
    sampler vp_t_tcb_30Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1937 = false;
    bool _624 = false;
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
    int _117 = _115 + 16;
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
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_142)];
    float _144 = as_type<float>(_dmw1.x);
    int _146 = _117 + 4;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw1.y);
    int _152 = _117 + 8;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw1.z);
    int _158 = _115 + 80;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_160)];
    float _162 = as_type<float>(_dmw2.x);
    int _164 = _158 + 4;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>(_dmw2.y);
    int _170 = _158 + 8;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>(_dmw2.z);
    int _176 = _115 + 48;
    int _178 = as_type<int>(_102) & 1;
    bool _182 = _178 != 0;
    uint _184 = uint(int(uint(_176) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_184)]);
    float _188 = float(_111);
    int _190 = as_type<int>(_102) & 2;
    bool _192 = _190 != 0;
    float _194 = _150 * _150;
    float _196 = fma(_144, _144, _194);
    float _198 = fma(_156, _156, _196);
    float _200 = rsqrt(_198);
    float _202 = _156 * _200;
    float _204 = _150 * _200;
    float _206 = _144 * _200;
    float _208 = _162 * _202;
    float _210 = _174 * _204;
    float _212 = -_208;
    float _214 = fma(_174, _206, _212);
    float _216 = -_210;
    float _218 = fma(_168, _202, _216);
    float _220 = _168 * _206;
    float _222 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _224 = _214 * _214;
    float _226 = -_220;
    float _228 = fma(_162, _204, _226);
    float _230 = fma(_218, _218, _224);
    float _232 = 1.0 / _222;
    float _234 = fma(_228, _228, _230);
    float _236 = rsqrt(_234);
    bool _238 = !_192;
    float _240 = _238 ? 1.0 : (-1.0);
    float _242 = _188 * _232;
    float _244 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _246 = _244 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _248 = abs(_140);
    float _250 = _248 * _240;
    float _252 = _250 * 0.5;
    float _254 = fma(_242, _246, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _256 = _218 * _236;
    float _258 = _214 * _236;
    float _260 = _228 * _236;
    float _262 = _254 * _252;
    bool _264 = !_182;
    float _266 = _256;
    float _268 = _260;
    float _270 = _258;
    float _272 = (*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _274 = _202;
    float _276 = _204;
    bool _278 = _192;
    float _280 = _242;
    if (!_264)
    {
        float _282 = _202 * _256;
        float _284 = _204 * _260;
        float _286 = _206 * _258;
        float _288 = -_282;
        float _290 = fma(_206, _260, _288);
        float _292 = -_284;
        float _294 = fma(_202, _258, _292);
        float _296 = -_286;
        float _298 = fma(_204, _256, _296);
        float _300 = _290 * _290;
        float _302 = fma(_294, _294, _300);
        float _304 = fma(_298, _298, _302);
        float _306 = rsqrt(_304);
        float _308 = _294 * _306;
        float _310 = _290 * _306;
        float _312 = _298 * _306;
        _266 = _308;
        _268 = _312;
        _270 = _310;
    }
    float _314 = _266;
    float _316 = _268;
    float _318 = _270;
    float _320 = -_262;
    float _322 = fma(_314, _320, _122);
    float _324 = -_262;
    float _326 = fma(_316, _324, _134);
    float _328 = -_262;
    float _330 = fma(_318, _328, _128);
    float _332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _334 = _322 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _326 + _336;
    float _340 = _334 * _334;
    float _342 = _338 * _338;
    float _344 = _340 + _342;
    float _346 = sqrt(_344);
    bool _348 = _346 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _350 = _340;
    float _352 = _342;
    float _354 = _322;
    float _356 = _326;
    if (!_348)
    {
        _272 = _330;
    }
    float _358 = _272;
    bool _360 = !_348;
    float _362 = _358;
    if (!_360)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _366 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _368 = _346 + _366;
        float _370 = rsqrt(_344);
        float _372 = _368 * _364;
        float _374 = _330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _376 = _372 * 0.15915493667125701904296875;
        float _378 = _376 * 6.283185482025146484375;
        float _380 = sin(_378);
        float _382 = _376 * 6.283185482025146484375;
        float _384 = cos(_382);
        float _386 = fma(_380, _374, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _388 = _370 * _386;
        float _390 = _384 + (-1.0);
        float _392 = fma(_334, _388, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _394 = fma(_338, _388, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _396 = _390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _398 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _400 = _392 + _398;
        float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _404 = _394 + _402;
        float _406 = fma(_330, _384, _396);
        float _408 = _400 * _400;
        float _410 = _404 * _404;
        _362 = _406;
        _350 = _408;
        _352 = _410;
        _354 = _392;
        _356 = _394;
    }
    float _412 = _362;
    float _414 = _350;
    float _416 = _352;
    float _418 = _354;
    float _420 = _356;
    float _422 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _424 = _412 + _422;
    float _426 = _206 * _316;
    float _428 = fma(_424, _424, _414);
    float _430 = _202 * _318;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _434 = _432 != 0;
    float _436 = -_426;
    float _438 = fma(_202, _314, _436);
    float _440 = _204 * _314;
    float _442 = -_430;
    float _444 = fma(_204, _316, _442);
    float _446 = _438 * _438;
    float _448 = -_440;
    float _450 = fma(_206, _318, _448);
    float _452 = _428 + _416;
    float _454 = fma(_444, _444, _446);
    float _456 = sqrt(_452);
    float _458 = fma(_450, _450, _454);
    float _460 = 0.0;
    float _462 = _446;
    float _464 = _444;
    float _466 = _438;
    float _468 = _452;
    if (_434)
    {
        _460 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _470 = _460;
    float _472 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _474 = _470;
    if (_434)
    {
        _274 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _476 = _274;
    float _478 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _480 = 0.0;
    float _482 = _476;
    if (_434)
    {
        _480 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _484 = _480;
    float _486 = rsqrt(_458);
    float _488 = _484;
    if (_434)
    {
        float _490 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _492 = _470 + _490;
        _474 = _492;
    }
    float _494 = _474;
    if (_434)
    {
        float _496 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _498 = _476 + _496;
        _482 = _498;
    }
    float _500 = _482;
    float _502 = _500;
    if (_434)
    {
        float _504 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _506 = _484 + _504;
        _488 = _506;
    }
    float _508 = _488;
    if (_434)
    {
        float _510 = _494 * _494;
        _462 = _510;
    }
    float _512 = _462;
    float _514 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _516 = _512;
    if (_434)
    {
        float _518 = fma(_500, _500, _512);
        _516 = _518;
    }
    float _520 = _516;
    float _522 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _524 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _528 = _522;
    if (_434)
    {
        float _530 = fma(_508, _508, _520);
        _276 = _530;
    }
    float _532 = _276;
    float _534 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _536 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _538 = _444 * _486;
    float _540 = _438 * _486;
    float _542 = _450 * _486;
    float _544 = _532;
    if (_434)
    {
        float _546 = rsqrt(_532);
        _544 = _546;
    }
    float _548 = _544;
    out.m_70.x = _472;
    out.m_70.y = _478;
    out.m_70.z = _514;
    out.m_70.w = _522;
    bool _550 = _456 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _552 = isnan(_456);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _558 = _554 || _556;
    if (!_434)
    {
        _464 = 0.0;
    }
    float _560 = _464;
    out.m_72.x = _524;
    out.m_72.y = _526;
    out.m_72.z = _534;
    out.m_72.w = _536;
    out.m_74.x = _538;
    out.m_74.y = _540;
    out.m_74.z = _542;
    float _562 = _548;
    float _564 = _560;
    if (_434)
    {
        float _566 = _548 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _466 = _566;
    }
    float _568 = _466;
    if (!_434)
    {
        _468 = 0.0;
        _562 = 0.0;
    }
    float _570 = _468;
    float _572 = _562;
    float _574 = _570;
    float _576 = _572;
    if (_434)
    {
        float _578 = _500 * _568;
        _564 = _578;
    }
    float _580 = _564;
    if (_434)
    {
        float _582 = _494 * _568;
        _574 = _582;
    }
    float _584 = _574;
    if (_434)
    {
        float _586 = _508 * _568;
        _576 = _586;
    }
    float _588 = _576;
    if (!_558)
    {
        _502 = 1.0;
    }
    float _590 = _502;
    bool _592 = !_558;
    float _594 = _590;
    if (!_592)
    {
        bool _596 = _456 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _598 = isnan(_456);
        bool _600 = _596 || _598;
        bool _602 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _604 = _600 || _602;
        if (!_604)
        {
            float _606 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _608 = _456 + _606;
            float _610 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _612 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _610;
            float _614 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _616 = _614 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _618 = 1.0 / _612;
            float _620 = _608 * _618;
            float _622 = fma(_620, _616, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _594 = _622;
            _624 = true;
        }
        else
        {
            bool _626 = _456 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _628 = isnan(_456);
            bool _630 = _626 || _628;
            bool _632 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _634 = _630 || _632;
            if (!_634)
            {
                float _636 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _638 = _456 + _636;
                float _640 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _642 = _640 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _644 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _646 = _644 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _648 = 1.0 / _642;
                float _650 = _638 * _648;
                float _652 = fma(_650, _646, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _594 = _652;
                _624 = true;
            }
            else
            {
                _594 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _624 = false;
    float _654 = _594;
    float _656 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _658 = _412 + _656;
    float _660 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _662 = _418 + _660;
    float _664 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _666 = _420 + _664;
    float _668 = _128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _670 = fma(_658, _654, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _672 = fma(_662, _654, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _674 = fma(_666, _654, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _676 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[2].x, _668);
    float _678 = _670 + _584;
    float _680 = _672 + _580;
    float _682 = _674 + _588;
    float _684 = _128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _688 = _678 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _692 = _680 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _696 = _682 + _694;
    float _698 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[1].x, _684);
    float _700 = _688 * _688;
    float _702 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[2].z, _676);
    float _704 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[1].z, _698);
    float _706 = fma(_692, _692, _700);
    float _708 = _128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _710 = _128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = _704 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _714 = fma(_696, _696, _706);
    float _716 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[0].x, _708);
    float _718 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _720 = _712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _722 = rsqrt(_714);
    float _724 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[0].z, _716);
    float _726 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[3].z, _718);
    float _728 = _702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _730 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _732 = _724 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _734 = _726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _736 = _730 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _738 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].x, _720);
    float _740 = _712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[7].z, _738);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].x, _740);
    float _746 = _722 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _742);
    float _750 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[6].z, _744);
    float _752 = _692 * _746;
    float _754 = _696 * _746;
    float _756 = 1.0 / _748;
    float _758 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _750);
    float _760 = _752 * _752;
    float _762 = _754 * _754;
    float _764 = _758 + _748;
    float _766 = _760 + _762;
    float _768 = _736 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _770 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _772 = sqrt(_766);
    float _774 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _768);
    float _776 = _764 * _756;
    float _778 = _776 * 0.5;
    float _780 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _774);
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _784 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _782);
    float _786 = _780 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _788 = _736 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _790 = trunc(_786);
    int _792 = int(_790);
    float _794 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _788);
    bool _796 = _772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _798 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _794);
    float _800 = 1.0 / _784;
    float _802 = _798 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _804 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _806 = _756;
    float _808 = _766;
    float _810 = _752;
    float _812 = _754;
    float _814 = _760;
    float _816 = _714;
    if (_796)
    {
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _806 = _818;
    }
    float _820 = _806;
    int _822 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _824 = _792 + _822;
    int _826 = _824 + 1;
    float _828 = trunc(_802);
    int _830 = int(_828);
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _834 = _800 * _832;
    float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = _772 + _836;
    bool _840 = _834 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _842 = _834 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _844 = _838;
    int _846 = 2;
    if (_796)
    {
        float _848 = _838 * _820;
        _844 = _848;
    }
    float _850 = _844;
    float _852 = 0.0;
    if (_796)
    {
        float _854 = rsqrt(_766);
        _852 = _854;
    }
    float _856 = _852;
    if (_796)
    {
        float _858 = _850 * 0.15915493667125701904296875;
        _528 = _858;
    }
    float _860 = _528;
    bool _862 = !_840;
    int _864 = _862 ? 0 : 1;
    int _866 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _868 = _830 + _866;
    int _870 = _868 + 1;
    float _872 = floor(_804);
    if (!_840)
    {
        _846 = 1;
    }
    int _874 = _846;
    bool _876 = _826 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _878 = _826 | _870;
    int _880 = _874;
    if (!_842)
    {
        _880 = _864;
    }
    int _882 = _880;
    float _884 = 0.0;
    if (_796)
    {
        float _886 = _860 * 6.283185482025146484375;
        float _888 = cos(_886);
        _884 = _888;
    }
    float _890 = _884;
    bool _892 = _878 < 0;
    bool _894 = _892 || _876;
    float _896 = precise::max(0.0, _770);
    bool _898 = _870 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _900 = _898 || _894;
    int _902 = _882 << 6;
    float _904 = as_type<float>(_864);
    int _906 = _902;
    if (_796)
    {
        float _908 = _860 * 6.283185482025146484375;
        float _910 = sin(_908);
        _904 = _910;
    }
    float _912 = _904;
    float _914 = -_746;
    float _916 = -_896;
    float _918 = fma(_688, _914, _916);
    int _920 = _902 + 96;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    uint _924 = uint(int(uint(int(_922)) >> uint(2)));
    int _926 = int(_922) & 3;
    float _928 = (*spvDescriptorSet0.vp_c15)._m0[int(_924)][_926];
    int _930 = int(_922) + 1;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    int _934 = _930 & 3;
    float _936 = (*spvDescriptorSet0.vp_c15)._m0[int(_932)][_934];
    float _938 = -_872;
    float _940 = _804 + _938;
    float _942 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    uint _944 = as_type<uint>(_872);
    if (!_796)
    {
        _808 = _918;
    }
    float _946 = _808;
    float _948 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _950 = _946;
    if (_796)
    {
        float _952 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _942 = _952;
    }
    float _954 = _942;
    float _956 = 0.0;
    if (_796)
    {
        float _958 = _890 + (-1.0);
        _956 = _958;
    }
    float _960 = _956;
    float _962 = _960;
    if (!_900)
    {
        int _964 = _870 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _966 = _964 + _826;
        _944 = uint(_966);
    }
    uint _968 = _944;
    int _970 = _902 + 48;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    uint _974 = uint(int(uint(int(_972)) >> uint(2)));
    int _976 = int(_972) & 3;
    float _978 = (*spvDescriptorSet0.vp_c15)._m0[int(_974)][_976];
    int _980 = int(_972) + 1;
    uint _982 = uint(int(uint(_980) >> uint(2)));
    int _984 = _980 & 3;
    float _986 = (*spvDescriptorSet0.vp_c15)._m0[int(_982)][_984];
    float _988 = floor(_948);
    if (_796)
    {
        float _990 = _960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _962 = _990;
    }
    float _992 = _962;
    float _994 = 0.0;
    if (_796)
    {
        float _996 = fma(_912, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _994 = _996;
    }
    float _998 = _994;
    float _1000 = _998;
    if (_796)
    {
        float _1002 = fma(_918, _890, _992);
        _950 = _1002;
    }
    float _1004 = _950;
    int _1006 = _902 + 64;
    uint _1008 = uint(int(uint(_1006) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c15)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
    if (_796)
    {
        float _1024 = _856 * _998;
        _1000 = _1024;
    }
    float _1026 = _1000;
    float _1028 = _678 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1030 = _918;
    if (!_900)
    {
        float _1032 = floor(_802);
        _1030 = _1032;
    }
    float _1034 = _1030;
    if (_796)
    {
        float _1036 = _752 * _1026;
        _810 = _1036;
    }
    float _1038 = _810;
    float _1040 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1028);
    float _1042 = _1040;
    if (_796)
    {
        float _1044 = _754 * _1026;
        _812 = _1044;
    }
    float _1046 = _812;
    int _1048 = _902 + 104;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    if (_796)
    {
        float _1066 = _1038 * _1038;
        _814 = _1066;
    }
    float _1068 = _814;
    float _1070 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1040);
    if (!_796)
    {
        _1042 = _762;
    }
    float _1072 = _1042;
    float _1074 = _1072;
    if (_796)
    {
        float _1076 = _1046 * _1046;
        _1074 = _1076;
    }
    float _1078 = _1074;
    float _1080 = fma(_1004, _1004, _1068);
    float _1082 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1084 = sqrt(_714);
    int _1086 = _902 + 80;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    float _1104 = _1080 + _1078;
    float _1106 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1108 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1110 = -_988;
    float _1112 = _948 + _1110;
    float _1114 = -_1108;
    float _1116 = fma(_1114, _1106, 1.0);
    int _1118 = _902 + 56;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c15)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c15)._m0[int(_1130)][_1132];
    int _1136 = as_type<int>(_1108);
    if (!_900)
    {
        uint _1138 = uint(int(uint(int(_968)) >> uint(2)));
        _1136 = int(_1138);
    }
    int _1140 = _1136;
    float _1142 = rsqrt(_1104);
    if (!_900)
    {
        float _1144 = -_1034;
        float _1146 = _802 + _1144;
        _816 = _1146;
    }
    float _1148 = _816;
    int _1150 = _902 + 72;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    float _1168 = _736 * _936;
    float _1170 = log2(_1116);
    float _1172 = fma(_928, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1168);
    int _1174 = _902 + 88;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    uint _1178 = uint(int(uint(int(_1176)) >> uint(2)));
    int _1180 = int(_1176) & 3;
    float _1182 = (*spvDescriptorSet0.vp_c15)._m0[int(_1178)][_1180];
    int _1184 = int(_1176) + 1;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    int _1188 = _1184 & 3;
    float _1190 = (*spvDescriptorSet0.vp_c15)._m0[int(_1186)][_1188];
    float _1192 = _736 * _986;
    float _1194 = _1142 * _1046;
    float _1196 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1192);
    int _1198 = as_type<int>(_986);
    if (!_900)
    {
        int _1200 = int(_968) << 2;
        _906 = _1200;
    }
    int _1202 = _906;
    float _1204 = _736 * _1022;
    float _1206 = _736 * _1102;
    int _1208 = _1202;
    if (!_900)
    {
        int _1210 = 12 & _1202;
        _1208 = _1210;
    }
    int _1212 = _1208;
    float _1214 = fma(_1056, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1172);
    float _1216 = fma(_1014, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1204);
    float _1218 = fma(_1094, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1206);
    if (!_900)
    {
        int _1220 = _1140 << 4;
        int _1222 = _1220 + _1212;
        _1198 = _1222;
    }
    int _1224 = _1198;
    float _1226 = _1214 + _1064;
    float _1228 = fma(_1126, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1196);
    float _1230 = _1142 * _1038;
    float _1232 = _678 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float2 _4067 = float2(_940, _1112);
    float _1234 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4067, float2(0.0), isnan(_4067)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4067, float2(0.0), isnan(_4067)), level(0.0)).x;
    float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1238 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1236);
    float _1240 = precise::clamp(_1238, 0.0, 1.0);
    float _1242 = 1.0 / _1226;
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1246 = _1228 + _1134;
    float _1248 = -_1240;
    float _1250 = _1248 + 1.0;
    float _1252 = fma(_1158, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1216);
    float _1254 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1232);
    float _1256 = _1142 * _1004;
    float _1258 = _678 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1260 = abs(_1250);
    float _1262 = log2(_1260);
    float _1264 = _1252 + _1166;
    float _1266 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1254);
    float _1268 = fma(_1182, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1218);
    float _1270 = _678 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1272 = -_1244;
    float _1274 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1272);
    float _1276 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1278 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1270);
    float _1280 = -_1194;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1274);
    float _1284 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1258);
    float _1286 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1288 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1278);
    float _1290 = _1246 * _1242;
    float _1292 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1284);
    float _1294 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1296 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1298 = _1290 >= 0.0;
    float _1300 = fma(_1282, -0.5, 0.5);
    float _1302 = exp2(_1294);
    float _1304 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1286);
    bool _1306 = _1290 <= 1.0;
    bool _1308 = _1306 && _1298;
    float _1310 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1312 = fma(_1282, 0.5, 0.5);
    float _1314 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1316 = _1268 + _1190;
    float _1318 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1320 = sqrt(_1300);
    float _1322 = _1264 * _1242;
    float _1324 = fma(_1312, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1326 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1314);
    float _1328 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1330 = as_type<float>(_1140);
    float _1332 = _1256;
    float _1334 = _1326;
    if (!_900)
    {
        int _1336 = _1224 + 400;
        uint _1338 = uint(int(uint(_1336) >> uint(2)));
        uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
        int _1342 = int(_1338) & 3;
        float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
        _1330 = _1344;
    }
    float _1346 = _1330;
    bool _1348 = _1322 >= 0.0;
    bool _1350 = _1348 && _1308;
    float _1352 = fma(_1312, _1324, -0.212114393711090087890625);
    float _1354 = _1216;
    if (!_900)
    {
        float _1356 = floor(_786);
        _1354 = _1356;
    }
    float _1358 = _1354;
    float _1360 = _1256 + 1.0;
    bool _1362 = _1322 <= 1.0;
    bool _1364 = _1362 && _1350;
    float _1366 = fma(_1312, _1352, 1.570728778839111328125);
    float _1368 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1328);
    float _1370 = -_1256;
    float _1372 = fma(_1302, _1360, _1370);
    float _1374 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1318);
    float _1376 = _1170 * 0.693147182464599609375;
    float _1378 = 1.0 / _1326;
    float _1380 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1368);
    float _1382 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1374);
    float _1384 = _1320 * 0.636619746685028076171875;
    float _1386 = _1316 * _1242;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1390 = fma(_1372, 0.5, 0.5);
    float _1392 = _1368;
    if (_1364)
    {
        float _1394 = float(_882);
        _1332 = _1394;
    }
    float _1396 = _1332;
    if (!_900)
    {
        float _1398 = -_1358;
        float _1400 = _786 + _1398;
        _1392 = _1400;
    }
    float _1402 = _1392;
    float _1404 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1406 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1382);
    float _1408 = -_1366;
    float _1410 = fma(_1384, _1408, 1.0);
    float _1412 = _1396;
    float _1414 = _1402;
    if (_1364)
    {
        float _1416 = rint(_1396);
        float _1418 = precise::max(_1416, 0.0);
        uint _1420 = uint(_1418);
        uint _1422 = clamp(_1420, 0u, 65535u);
        _1412 = as_type<float>(_1422);
    }
    float _1424 = _1412;
    float _1426 = _1404 * _1378;
    float _1428 = _1406 * _1378;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = fma(_1428, -0.5, 0.5);
    float _1434 = _1316;
    if (!_900)
    {
        float _1436 = rint(_1346);
        float _1438 = precise::max(_1436, 0.0);
        uint _1440 = uint(_1438);
        uint _1442 = clamp(_1440, 0u, 65535u);
        _1434 = as_type<float>(_1442);
    }
    float _1444 = _1434;
    float _1446 = _1424;
    if (_1364)
    {
        float3 _4430 = float3(_1290, _1322, float(as_type<int>(_1424)));
        float3 _4434 = select(_4430, float3(0.0), isnan(_4430));
        float _1448 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4434.xy, uint(rint(_4434.z)), _1386, level(0.0));
        _1446 = _1448;
    }
    float _1450 = _1446;
    float3 _4444 = float3(_1430, _1432, _1388);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4444, float3(0.0), isnan(_4444)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4444, float3(0.0), isnan(_4444)), level(0.0)).x;
    float3 _4453 = float3(_1430, _1432, _1388);
    float4 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4453, float3(0.0), isnan(_4453)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4453, float3(0.0), isnan(_4453)), level(0.0)).xyzw;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1455.w;
    float2 _4469 = float2(_1410, _1390);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4469, float2(0.0), isnan(_4469)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4469, float2(0.0), isnan(_4469)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = _1444;
    if (!_900)
    {
        float3 _4490 = float3(_1402, _1148, float(as_type<int>(_1444)));
        float3 _4492 = select(_4490, float3(0.0), isnan(_4490));
        float _1477 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4492.xy, uint(rint(_4492.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4492.xy, uint(rint(_4492.z)), level(0.0)).x;
        _1475 = _1477;
    }
    float _1479 = _1475;
    float _1481 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1483 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1487 = _1485 != 0;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1493 = _1491 != 0;
    float _1495 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1489);
    float _1497 = (*spvDescriptorSet0.vp_c12)._m0[0].y * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1499 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1495);
    bool _1501 = !_192;
    float _1503 = _1501 ? 0.0 : 1.0;
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1507 = _1499 * (-0.15915493667125701904296875);
    bool _1509 = false;
    float _1511 = _1503;
    if (_1487)
    {
        bool _1513 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1509 = _1513;
    }
    bool _1515 = _1509;
    if (!_1487)
    {
        float _1517 = -_186;
        float _1519 = (-0.0) + _1517;
        _1414 = _1519;
    }
    float _1521 = _1414;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1525 = _1521;
    if (_1493)
    {
        bool _1527 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _278 = _1527;
    }
    bool _1529 = _278;
    float _1531 = (*spvDescriptorSet0.vp_c12)._m0[0].x * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1533 = abs(_834);
    float _1535 = log2(_1533);
    if (_1487)
    {
        float _1537 = -_186;
        float _1539 = _1515 ? _186 : _1537;
        _1525 = _1539;
    }
    float _1541 = _1525;
    float _1543 = fma(_1497, -2.0, _1523);
    if (_1493)
    {
        float _1545 = -_1503;
        float _1547 = _1529 ? _1545 : _1503;
        _1511 = _1547;
    }
    float _1549 = _1511;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1553 = _1541 + 0.5;
    float _1555 = _1507 * 6.283185482025146484375;
    float _1557 = cos(_1555);
    float _1559 = -_1551;
    float _1561 = fma(_1531, 2.0, _1559);
    float _1563 = _1549 + (-0.5);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1569 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1543);
    float _1571 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1481);
    float _1573 = _1507 * 6.283185482025146484375;
    float _1575 = sin(_1573);
    float _1577 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1565);
    float _1579 = fma((*spvDescriptorSet0.vp_c12)._m0[0].y, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1567);
    float _1581 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1571);
    float _1583 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1561);
    float _1585 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1587 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1577);
    float _1589 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1579);
    float _1591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1593 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1595 = _1553 * _1557;
    bool _1597 = _834 <= 8000.0;
    bool _1599 = isnan(_834);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan(8000.0);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    float _1609 = exp2(_1593);
    float _1611 = _1553 * _1575;
    float _1613 = fma(_1563, _1575, _1595);
    float _1615 = -_1611;
    float _1617 = fma(_1563, _1557, _1615);
    float _1619 = _1613 + (-0.5);
    float _1621 = -_1587;
    float _1623 = _1621 + 1.0;
    float _1625 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1627 = _1617 + 0.5;
    float _1629 = exp2(_1483);
    float _1631 = -_1625;
    float _1633 = -_1569;
    float _1635 = fma(_1631, _1619, _1633);
    float _1637 = fma(_1585, _1627, _1583);
    float _1639 = -_1589;
    float _1641 = _1639 + 1.0;
    float _1643 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1581);
    float _1649 = -_1623;
    float _1651 = fma(_1617, _1649, _1637);
    float _1653 = fma(_1613, _1641, _1635);
    float _1655 = fma(_1645, -2.0, 3.0);
    float _1657 = _1645 * _1645;
    float _1659 = _1647 + _1326;
    out.m_76.x = _1651;
    out.m_76.y = _1653;
    float _1661 = _1657 * _1655;
    float _1663 = _1659 * 0.5;
    float _1665 = -_1661;
    float _1667 = _1665 + 1.0;
    float _1669 = -_1629;
    float _1671 = _1669 + 1.0;
    out.gl_Position.x = _1404;
    out.gl_Position.y = _1406;
    out.gl_Position.z = _1647;
    out.gl_Position.w = _1326;
    float _1673 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1661);
    float _1675 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    out.m_78.z = _1663;
    out.m_78.w = _1326;
    float _1679 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1681 = _1607 * _1673;
    float _1683 = fma(_242, _1677, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1685 = _1647;
    if (!_1364)
    {
        _280 = 1.0;
    }
    float _1687 = _280;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1691 = -_1234;
    float _1693 = _1691 + 1.0;
    float _1695 = _1693 * _1689;
    float _1697 = precise::clamp(_1695, 0.0, 1.0);
    float _1699 = -_1697;
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1703 = _1687;
    float _1705 = 1.0;
    if (_1364)
    {
        bool _1707 = _1450 >= _1386;
        bool _1709 = isnan(_1450);
        bool _1711 = _1707 || _1709;
        bool _1713 = isnan(_1386);
        bool _1715 = _1711 || _1713;
        float _1717 = float(_1715);
        _1703 = _1717;
    }
    float _1719 = _1703;
    float _1721 = _1719;
    if (!_900)
    {
        int _1723 = int(_968) << 4;
        int _1725 = _1723 + 2048;
        uint _1727 = uint(int(uint(_1725) >> uint(2)));
        uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
        int _1731 = int(_1727) & 3;
        float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
        int _1735 = int(_1727) + 1;
        uint _1737 = uint(int(uint(_1735) >> uint(2)));
        int _1739 = _1735 & 3;
        float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
        int _1743 = _1725 + 8;
        uint _1745 = uint(int(uint(_1743) >> uint(2)));
        uint _1747 = uint(int(uint(int(_1745)) >> uint(2)));
        int _1749 = int(_1745) & 3;
        float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
        int _1753 = int(_1745) + 1;
        uint _1755 = uint(int(uint(_1753) >> uint(2)));
        int _1757 = _1753 & 3;
        float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
        float _1761 = _736 * _1741;
        float _1763 = fma(_1733, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1761);
        float _1765 = fma(_1751, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1763);
        float _1767 = _1765 + _1759;
        float _1769 = precise::clamp(_1767, 0.0, 1.0);
        float _1771 = -_1769;
        float _1773 = _1771 + _1479;
        float _1775 = fma(_1773, 500.0, 1.5);
        float _1777 = exp2(_1775);
        float _1779 = 0.0 + _1777;
        float _1781 = precise::clamp(_1779, 0.0, 1.0);
        _1705 = _1781;
        _1334 = _1759;
        _1685 = _1751;
    }
    float _1783 = _1705;
    float _1785 = _1334;
    float _1787 = _1685;
    float _1789 = _1679 * _1452;
    float _1791 = _1719 * _1783;
    float _1793 = -_1679;
    float _1795 = _1793 + 1.0;
    bool _1797 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1799 = isnan(_1084);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1805 = _1801 || _1803;
    float _1807 = _1463 * _1789;
    float _1809 = -_1791;
    float _1811 = fma(_1809, _1701, 1.0);
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = _1473 * _1789;
    float _1817 = _1463 * _1795;
    float _1819 = fma(_1469, _1807, _1457);
    float _1821 = fma(_1471, _1807, _1459);
    float _1823 = _1813 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1825 = fma(_1463, _1815, _1461);
    float _1827 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_80.x = _1823;
    float _1829 = _1785;
    float _1831 = _1787;
    float _1833 = _1807;
    float _1835 = _1795;
    float _1837 = _1813;
    if (!_1805)
    {
        _1721 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1839 = _1721;
    float _1841 = _1839;
    float _1843 = _1839;
    if (!_1805)
    {
        _1829 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1845 = _1829;
    out.m_82.x = _1819;
    out.m_82.y = _1821;
    out.m_82.z = _1825;
    out.m_82.w = _1817;
    float _1847 = _1845;
    float _1849 = _1845;
    if (!_1805)
    {
        _1831 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1851 = _1831;
    float _1853 = _1851;
    float _1855 = _1851;
    if (!_1805)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1857 = _1833;
    float _1859 = _1857;
    float _1861 = _1857;
    if (!_1805)
    {
        _1835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1863 = _1835;
    float _1865 = _1863;
    float _1867 = _1863;
    if (!_1805)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1869 = _1837;
    bool _1871 = !_1805;
    float _1873 = _1869;
    float _1875 = _1869;
    if (!_1871)
    {
        bool _1877 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1879 = isnan(_1084);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1885 = _1881 || _1883;
        if (!_1885)
        {
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1889 = _1084 + _1887;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1893 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1891;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1899 = 1.0 / _1893;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1917 = _1889 * _1899;
            float _1919 = precise::clamp(_1917, 0.0, 1.0);
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1925 = fma(_1919, _1897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1927 = fma(_1919, _1923, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1929 = fma(_1919, _1903, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1931 = fma(_1919, _1907, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1933 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1935 = fma(_1919, _1915, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1849 = _1929;
            _1867 = _1933;
            _1843 = _1925;
            _1861 = _1931;
            _1855 = _1927;
            _1875 = _1935;
            _1937 = true;
        }
        else
        {
            bool _1939 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1941 = isnan(_1084);
            bool _1943 = _1939 || _1941;
            bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1947 = _1943 || _1945;
            if (!_1947)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1949 = _1841;
            _1843 = _1949;
            if (!_1947)
            {
                _1847 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1951 = _1847;
            _1849 = _1951;
            if (!_1947)
            {
                _1853 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1953 = _1853;
            _1855 = _1953;
            if (!_1947)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1955 = _1859;
            _1861 = _1955;
            if (!_1947)
            {
                _1865 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1957 = _1865;
            _1867 = _1957;
            if (!_1947)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1959 = _1873;
            bool _1961 = !_1947;
            _1875 = _1959;
            if (!_1961)
            {
                bool _1963 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1965 = isnan(_1084);
                bool _1967 = _1963 || _1965;
                bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1971 = _1967 || _1969;
                if (!_1971)
                {
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1975 = _1084 + _1973;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1977;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1985 = 1.0 / _1979;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2003 = _1975 * _1985;
                    float _2005 = precise::clamp(_2003, 0.0, 1.0);
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2011 = fma(_2005, _1983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1849 = _2015;
                    _1867 = _2019;
                    _1843 = _2011;
                    _1861 = _2017;
                    _1855 = _2013;
                    _1875 = _2021;
                    _1937 = true;
                }
                else
                {
                    _1849 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1867 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1855 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1937 = false;
    float _2023 = _1849;
    float _2025 = _1867;
    float _2027 = _1843;
    float _2029 = _1861;
    float _2031 = _1855;
    float _2033 = _1875;
    float _2035 = fma(_540, -0.5, 0.5);
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = -_2023;
    float _2041 = _2039 + _2025;
    float _2043 = -_2027;
    float _2045 = _2043 + _2029;
    float _2047 = -_2031;
    float _2049 = _2047 + _2033;
    bool _2051 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2053 = fma(_2037, _2041, _2023);
    float _2055 = fma(_2037, _2045, _2027);
    float _2057 = fma(_2037, _2049, _2031);
    float _2059 = _1827 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2061 = _2053 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _2063 = fma(_2055, 0.298911988735198974609375, _2061);
    out.m_86.x = _2059;
    float _2065 = fma(_2057, 0.114477999508380889892578125, _2063);
    float _2067 = -_2065;
    float _2069 = _2055 + _2067;
    float _2071 = -_2065;
    float _2073 = _2053 + _2071;
    float _2075 = -_2065;
    float _2077 = _2057 + _2075;
    float _2079 = fma(_2069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2081 = fma(_2073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2083 = fma(_2077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    out.m_88.x = _2079;
    out.m_88.y = _2081;
    out.m_88.z = _2083;
    if (!_2051)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2085 = -_678;
    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2089 = -_680;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2093 = -_682;
    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2097 = _2087 * _2087;
    float _2099 = fma(_2091, _2091, _2097);
    float _2101 = fma(_2095, _2095, _2099);
    float _2103 = sqrt(_2101);
    float _2105 = rsqrt(_2101);
    float _2107 = -_2103;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = _2091 * _2105;
    float _2117 = _2087 * _2105;
    float _2119 = abs(_2113);
    float _2121 = log2(_2119);
    float _2123 = _2095 * _2105;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2127 = _540 * _2117;
    float _2129 = -_2117;
    float _2131 = -_2125;
    float _2133 = fma(_2129, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2131);
    float _2135 = fma(_538, _2115, _2127);
    float _2137 = -_2123;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2133);
    float _2141 = fma(_542, _2123, _2135);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2147 = _2139 + _2145;
    float _2149 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = exp2(_2149);
    float _2157 = _2155 * _2153;
    float _2159 = _2143 * _2157;
    float _2161 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2163 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2165 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2161;
    out.m_84.y = _2163;
    out.m_84.z = _2165;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1937 = false;
    bool _624 = false;
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
    int _117 = _115 + 16;
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
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_142)];
    float _144 = as_type<float>(_dmw1.x);
    int _146 = _117 + 4;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw1.y);
    int _152 = _117 + 8;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw1.z);
    int _158 = _115 + 80;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_160)];
    float _162 = as_type<float>(_dmw2.x);
    int _164 = _158 + 4;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>(_dmw2.y);
    int _170 = _158 + 8;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>(_dmw2.z);
    int _176 = _115 + 48;
    int _178 = as_type<int>(_102) & 1;
    bool _182 = _178 != 0;
    uint _184 = uint(int(uint(_176) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_184)]);
    float _188 = float(_111);
    int _190 = as_type<int>(_102) & 2;
    bool _192 = _190 != 0;
    float _194 = _150 * _150;
    float _196 = fma(_144, _144, _194);
    float _198 = fma(_156, _156, _196);
    float _200 = rsqrt(_198);
    float _202 = _156 * _200;
    float _204 = _150 * _200;
    float _206 = _144 * _200;
    float _208 = _162 * _202;
    float _210 = _174 * _204;
    float _212 = -_208;
    float _214 = fma(_174, _206, _212);
    float _216 = -_210;
    float _218 = fma(_168, _202, _216);
    float _220 = _168 * _206;
    float _222 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _224 = _214 * _214;
    float _226 = -_220;
    float _228 = fma(_162, _204, _226);
    float _230 = fma(_218, _218, _224);
    float _232 = 1.0 / _222;
    float _234 = fma(_228, _228, _230);
    float _236 = rsqrt(_234);
    bool _238 = !_192;
    float _240 = _238 ? 1.0 : (-1.0);
    float _242 = _188 * _232;
    float _244 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _246 = _244 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _248 = abs(_140);
    float _250 = _248 * _240;
    float _252 = _250 * 0.5;
    float _254 = fma(_242, _246, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _256 = _218 * _236;
    float _258 = _214 * _236;
    float _260 = _228 * _236;
    float _262 = _254 * _252;
    bool _264 = !_182;
    float _266 = _256;
    float _268 = _260;
    float _270 = _258;
    float _272 = (*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _274 = _202;
    float _276 = _204;
    bool _278 = _192;
    float _280 = _242;
    if (!_264)
    {
        float _282 = _202 * _256;
        float _284 = _204 * _260;
        float _286 = _206 * _258;
        float _288 = -_282;
        float _290 = fma(_206, _260, _288);
        float _292 = -_284;
        float _294 = fma(_202, _258, _292);
        float _296 = -_286;
        float _298 = fma(_204, _256, _296);
        float _300 = _290 * _290;
        float _302 = fma(_294, _294, _300);
        float _304 = fma(_298, _298, _302);
        float _306 = rsqrt(_304);
        float _308 = _294 * _306;
        float _310 = _290 * _306;
        float _312 = _298 * _306;
        _266 = _308;
        _268 = _312;
        _270 = _310;
    }
    float _314 = _266;
    float _316 = _268;
    float _318 = _270;
    float _320 = -_262;
    float _322 = fma(_314, _320, _122);
    float _324 = -_262;
    float _326 = fma(_316, _324, _134);
    float _328 = -_262;
    float _330 = fma(_318, _328, _128);
    float _332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _334 = _322 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _326 + _336;
    float _340 = _334 * _334;
    float _342 = _338 * _338;
    float _344 = _340 + _342;
    float _346 = sqrt(_344);
    bool _348 = _346 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _350 = _340;
    float _352 = _342;
    float _354 = _322;
    float _356 = _326;
    if (!_348)
    {
        _272 = _330;
    }
    float _358 = _272;
    bool _360 = !_348;
    float _362 = _358;
    if (!_360)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _366 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _368 = _346 + _366;
        float _370 = rsqrt(_344);
        float _372 = _368 * _364;
        float _374 = _330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _376 = _372 * 0.15915493667125701904296875;
        float _378 = _376 * 6.283185482025146484375;
        float _380 = sin(_378);
        float _382 = _376 * 6.283185482025146484375;
        float _384 = cos(_382);
        float _386 = fma(_380, _374, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _388 = _370 * _386;
        float _390 = _384 + (-1.0);
        float _392 = fma(_334, _388, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _394 = fma(_338, _388, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _396 = _390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _398 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _400 = _392 + _398;
        float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _404 = _394 + _402;
        float _406 = fma(_330, _384, _396);
        float _408 = _400 * _400;
        float _410 = _404 * _404;
        _362 = _406;
        _350 = _408;
        _352 = _410;
        _354 = _392;
        _356 = _394;
    }
    float _412 = _362;
    float _414 = _350;
    float _416 = _352;
    float _418 = _354;
    float _420 = _356;
    float _422 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _424 = _412 + _422;
    float _426 = _206 * _316;
    float _428 = fma(_424, _424, _414);
    float _430 = _202 * _318;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _434 = _432 != 0;
    float _436 = -_426;
    float _438 = fma(_202, _314, _436);
    float _440 = _204 * _314;
    float _442 = -_430;
    float _444 = fma(_204, _316, _442);
    float _446 = _438 * _438;
    float _448 = -_440;
    float _450 = fma(_206, _318, _448);
    float _452 = _428 + _416;
    float _454 = fma(_444, _444, _446);
    float _456 = sqrt(_452);
    float _458 = fma(_450, _450, _454);
    float _460 = 0.0;
    float _462 = _446;
    float _464 = _444;
    float _466 = _438;
    float _468 = _452;
    if (_434)
    {
        _460 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _470 = _460;
    float _472 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _474 = _470;
    if (_434)
    {
        _274 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _476 = _274;
    float _478 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _480 = 0.0;
    float _482 = _476;
    if (_434)
    {
        _480 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _484 = _480;
    float _486 = rsqrt(_458);
    float _488 = _484;
    if (_434)
    {
        float _490 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _492 = _470 + _490;
        _474 = _492;
    }
    float _494 = _474;
    if (_434)
    {
        float _496 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _498 = _476 + _496;
        _482 = _498;
    }
    float _500 = _482;
    float _502 = _500;
    if (_434)
    {
        float _504 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _506 = _484 + _504;
        _488 = _506;
    }
    float _508 = _488;
    if (_434)
    {
        float _510 = _494 * _494;
        _462 = _510;
    }
    float _512 = _462;
    float _514 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _516 = _512;
    if (_434)
    {
        float _518 = fma(_500, _500, _512);
        _516 = _518;
    }
    float _520 = _516;
    float _522 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _524 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _528 = _522;
    if (_434)
    {
        float _530 = fma(_508, _508, _520);
        _276 = _530;
    }
    float _532 = _276;
    float _534 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _536 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _538 = _444 * _486;
    float _540 = _438 * _486;
    float _542 = _450 * _486;
    float _544 = _532;
    if (_434)
    {
        float _546 = rsqrt(_532);
        _544 = _546;
    }
    float _548 = _544;
    out.m_70.x = _472;
    out.m_70.y = _478;
    out.m_70.z = _514;
    out.m_70.w = _522;
    bool _550 = _456 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _552 = isnan(_456);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _558 = _554 || _556;
    if (!_434)
    {
        _464 = 0.0;
    }
    float _560 = _464;
    out.m_72.x = _524;
    out.m_72.y = _526;
    out.m_72.z = _534;
    out.m_72.w = _536;
    out.m_74.x = _538;
    out.m_74.y = _540;
    out.m_74.z = _542;
    float _562 = _548;
    float _564 = _560;
    if (_434)
    {
        float _566 = _548 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _466 = _566;
    }
    float _568 = _466;
    if (!_434)
    {
        _468 = 0.0;
        _562 = 0.0;
    }
    float _570 = _468;
    float _572 = _562;
    float _574 = _570;
    float _576 = _572;
    if (_434)
    {
        float _578 = _500 * _568;
        _564 = _578;
    }
    float _580 = _564;
    if (_434)
    {
        float _582 = _494 * _568;
        _574 = _582;
    }
    float _584 = _574;
    if (_434)
    {
        float _586 = _508 * _568;
        _576 = _586;
    }
    float _588 = _576;
    if (!_558)
    {
        _502 = 1.0;
    }
    float _590 = _502;
    bool _592 = !_558;
    float _594 = _590;
    if (!_592)
    {
        bool _596 = _456 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _598 = isnan(_456);
        bool _600 = _596 || _598;
        bool _602 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _604 = _600 || _602;
        if (!_604)
        {
            float _606 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _608 = _456 + _606;
            float _610 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _612 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _610;
            float _614 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _616 = _614 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _618 = 1.0 / _612;
            float _620 = _608 * _618;
            float _622 = fma(_620, _616, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _594 = _622;
            _624 = true;
        }
        else
        {
            bool _626 = _456 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _628 = isnan(_456);
            bool _630 = _626 || _628;
            bool _632 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _634 = _630 || _632;
            if (!_634)
            {
                float _636 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _638 = _456 + _636;
                float _640 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _642 = _640 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _644 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _646 = _644 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _648 = 1.0 / _642;
                float _650 = _638 * _648;
                float _652 = fma(_650, _646, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _594 = _652;
                _624 = true;
            }
            else
            {
                _594 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _624 = false;
    float _654 = _594;
    float _656 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _658 = _412 + _656;
    float _660 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _662 = _418 + _660;
    float _664 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _666 = _420 + _664;
    float _668 = _128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _670 = fma(_658, _654, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _672 = fma(_662, _654, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _674 = fma(_666, _654, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _676 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[2].x, _668);
    float _678 = _670 + _584;
    float _680 = _672 + _580;
    float _682 = _674 + _588;
    float _684 = _128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _688 = _678 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _692 = _680 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _696 = _682 + _694;
    float _698 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[1].x, _684);
    float _700 = _688 * _688;
    float _702 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[2].z, _676);
    float _704 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[1].z, _698);
    float _706 = fma(_692, _692, _700);
    float _708 = _128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _710 = _128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = _704 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _714 = fma(_696, _696, _706);
    float _716 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[0].x, _708);
    float _718 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _720 = _712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _722 = rsqrt(_714);
    float _724 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[0].z, _716);
    float _726 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[3].z, _718);
    float _728 = _702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _730 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _732 = _724 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _734 = _726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _736 = _730 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _738 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].x, _720);
    float _740 = _712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[7].z, _738);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].x, _740);
    float _746 = _722 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _742);
    float _750 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[6].z, _744);
    float _752 = _692 * _746;
    float _754 = _696 * _746;
    float _756 = 1.0 / _748;
    float _758 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _750);
    float _760 = _752 * _752;
    float _762 = _754 * _754;
    float _764 = _758 + _748;
    float _766 = _760 + _762;
    float _768 = _736 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _770 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _772 = sqrt(_766);
    float _774 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _768);
    float _776 = _764 * _756;
    float _778 = _776 * 0.5;
    float _780 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _774);
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _784 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _782);
    float _786 = _780 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _788 = _736 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _790 = trunc(_786);
    int _792 = int(_790);
    float _794 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _788);
    bool _796 = _772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _798 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _794);
    float _800 = 1.0 / _784;
    float _802 = _798 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _804 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _806 = _756;
    float _808 = _766;
    float _810 = _752;
    float _812 = _754;
    float _814 = _760;
    float _816 = _714;
    if (_796)
    {
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _806 = _818;
    }
    float _820 = _806;
    int _822 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _824 = _792 + _822;
    int _826 = _824 + 1;
    float _828 = trunc(_802);
    int _830 = int(_828);
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _834 = _800 * _832;
    float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = _772 + _836;
    bool _840 = _834 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _842 = _834 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _844 = _838;
    int _846 = 2;
    if (_796)
    {
        float _848 = _838 * _820;
        _844 = _848;
    }
    float _850 = _844;
    float _852 = 0.0;
    if (_796)
    {
        float _854 = rsqrt(_766);
        _852 = _854;
    }
    float _856 = _852;
    if (_796)
    {
        float _858 = _850 * 0.15915493667125701904296875;
        _528 = _858;
    }
    float _860 = _528;
    bool _862 = !_840;
    int _864 = _862 ? 0 : 1;
    int _866 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _868 = _830 + _866;
    int _870 = _868 + 1;
    float _872 = floor(_804);
    if (!_840)
    {
        _846 = 1;
    }
    int _874 = _846;
    bool _876 = _826 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _878 = _826 | _870;
    int _880 = _874;
    if (!_842)
    {
        _880 = _864;
    }
    int _882 = _880;
    float _884 = 0.0;
    if (_796)
    {
        float _886 = _860 * 6.283185482025146484375;
        float _888 = cos(_886);
        _884 = _888;
    }
    float _890 = _884;
    bool _892 = _878 < 0;
    bool _894 = _892 || _876;
    float _896 = precise::max(0.0, _770);
    bool _898 = _870 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _900 = _898 || _894;
    int _902 = _882 << 6;
    float _904 = as_type<float>(_864);
    int _906 = _902;
    if (_796)
    {
        float _908 = _860 * 6.283185482025146484375;
        float _910 = sin(_908);
        _904 = _910;
    }
    float _912 = _904;
    float _914 = -_746;
    float _916 = -_896;
    float _918 = fma(_688, _914, _916);
    int _920 = _902 + 96;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    uint _924 = uint(int(uint(int(_922)) >> uint(2)));
    int _926 = int(_922) & 3;
    float _928 = (*spvDescriptorSet0.vp_c15)._m0[int(_924)][_926];
    int _930 = int(_922) + 1;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    int _934 = _930 & 3;
    float _936 = (*spvDescriptorSet0.vp_c15)._m0[int(_932)][_934];
    float _938 = -_872;
    float _940 = _804 + _938;
    float _942 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    uint _944 = as_type<uint>(_872);
    if (!_796)
    {
        _808 = _918;
    }
    float _946 = _808;
    float _948 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _950 = _946;
    if (_796)
    {
        float _952 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _942 = _952;
    }
    float _954 = _942;
    float _956 = 0.0;
    if (_796)
    {
        float _958 = _890 + (-1.0);
        _956 = _958;
    }
    float _960 = _956;
    float _962 = _960;
    if (!_900)
    {
        int _964 = _870 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _966 = _964 + _826;
        _944 = uint(_966);
    }
    uint _968 = _944;
    int _970 = _902 + 48;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    uint _974 = uint(int(uint(int(_972)) >> uint(2)));
    int _976 = int(_972) & 3;
    float _978 = (*spvDescriptorSet0.vp_c15)._m0[int(_974)][_976];
    int _980 = int(_972) + 1;
    uint _982 = uint(int(uint(_980) >> uint(2)));
    int _984 = _980 & 3;
    float _986 = (*spvDescriptorSet0.vp_c15)._m0[int(_982)][_984];
    float _988 = floor(_948);
    if (_796)
    {
        float _990 = _960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _962 = _990;
    }
    float _992 = _962;
    float _994 = 0.0;
    if (_796)
    {
        float _996 = fma(_912, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _994 = _996;
    }
    float _998 = _994;
    float _1000 = _998;
    if (_796)
    {
        float _1002 = fma(_918, _890, _992);
        _950 = _1002;
    }
    float _1004 = _950;
    int _1006 = _902 + 64;
    uint _1008 = uint(int(uint(_1006) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c15)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
    if (_796)
    {
        float _1024 = _856 * _998;
        _1000 = _1024;
    }
    float _1026 = _1000;
    float _1028 = _678 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1030 = _918;
    if (!_900)
    {
        float _1032 = floor(_802);
        _1030 = _1032;
    }
    float _1034 = _1030;
    if (_796)
    {
        float _1036 = _752 * _1026;
        _810 = _1036;
    }
    float _1038 = _810;
    float _1040 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1028);
    float _1042 = _1040;
    if (_796)
    {
        float _1044 = _754 * _1026;
        _812 = _1044;
    }
    float _1046 = _812;
    int _1048 = _902 + 104;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    if (_796)
    {
        float _1066 = _1038 * _1038;
        _814 = _1066;
    }
    float _1068 = _814;
    float _1070 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1040);
    if (!_796)
    {
        _1042 = _762;
    }
    float _1072 = _1042;
    float _1074 = _1072;
    if (_796)
    {
        float _1076 = _1046 * _1046;
        _1074 = _1076;
    }
    float _1078 = _1074;
    float _1080 = fma(_1004, _1004, _1068);
    float _1082 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1084 = sqrt(_714);
    int _1086 = _902 + 80;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    float _1104 = _1080 + _1078;
    float _1106 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1108 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1110 = -_988;
    float _1112 = _948 + _1110;
    float _1114 = -_1108;
    float _1116 = fma(_1114, _1106, 1.0);
    int _1118 = _902 + 56;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c15)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c15)._m0[int(_1130)][_1132];
    int _1136 = as_type<int>(_1108);
    if (!_900)
    {
        uint _1138 = uint(int(uint(int(_968)) >> uint(2)));
        _1136 = int(_1138);
    }
    int _1140 = _1136;
    float _1142 = rsqrt(_1104);
    if (!_900)
    {
        float _1144 = -_1034;
        float _1146 = _802 + _1144;
        _816 = _1146;
    }
    float _1148 = _816;
    int _1150 = _902 + 72;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    float _1168 = _736 * _936;
    float _1170 = log2(_1116);
    float _1172 = fma(_928, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1168);
    int _1174 = _902 + 88;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    uint _1178 = uint(int(uint(int(_1176)) >> uint(2)));
    int _1180 = int(_1176) & 3;
    float _1182 = (*spvDescriptorSet0.vp_c15)._m0[int(_1178)][_1180];
    int _1184 = int(_1176) + 1;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    int _1188 = _1184 & 3;
    float _1190 = (*spvDescriptorSet0.vp_c15)._m0[int(_1186)][_1188];
    float _1192 = _736 * _986;
    float _1194 = _1142 * _1046;
    float _1196 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1192);
    int _1198 = as_type<int>(_986);
    if (!_900)
    {
        int _1200 = int(_968) << 2;
        _906 = _1200;
    }
    int _1202 = _906;
    float _1204 = _736 * _1022;
    float _1206 = _736 * _1102;
    int _1208 = _1202;
    if (!_900)
    {
        int _1210 = 12 & _1202;
        _1208 = _1210;
    }
    int _1212 = _1208;
    float _1214 = fma(_1056, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1172);
    float _1216 = fma(_1014, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1204);
    float _1218 = fma(_1094, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1206);
    if (!_900)
    {
        int _1220 = _1140 << 4;
        int _1222 = _1220 + _1212;
        _1198 = _1222;
    }
    int _1224 = _1198;
    float _1226 = _1214 + _1064;
    float _1228 = fma(_1126, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1196);
    float _1230 = _1142 * _1038;
    float _1232 = _678 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float2 _4067 = float2(_940, _1112);
    float _1234 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4067, float2(0.0), isnan(_4067)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4067, float2(0.0), isnan(_4067)), level(0.0)).x;
    float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1238 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1236);
    float _1240 = precise::clamp(_1238, 0.0, 1.0);
    float _1242 = 1.0 / _1226;
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1246 = _1228 + _1134;
    float _1248 = -_1240;
    float _1250 = _1248 + 1.0;
    float _1252 = fma(_1158, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1216);
    float _1254 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1232);
    float _1256 = _1142 * _1004;
    float _1258 = _678 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1260 = abs(_1250);
    float _1262 = log2(_1260);
    float _1264 = _1252 + _1166;
    float _1266 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1254);
    float _1268 = fma(_1182, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1218);
    float _1270 = _678 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1272 = -_1244;
    float _1274 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1272);
    float _1276 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1278 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1270);
    float _1280 = -_1194;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1274);
    float _1284 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1258);
    float _1286 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1288 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1278);
    float _1290 = _1246 * _1242;
    float _1292 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1284);
    float _1294 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1296 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1298 = _1290 >= 0.0;
    float _1300 = fma(_1282, -0.5, 0.5);
    float _1302 = exp2(_1294);
    float _1304 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1286);
    bool _1306 = _1290 <= 1.0;
    bool _1308 = _1306 && _1298;
    float _1310 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1312 = fma(_1282, 0.5, 0.5);
    float _1314 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1316 = _1268 + _1190;
    float _1318 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1320 = sqrt(_1300);
    float _1322 = _1264 * _1242;
    float _1324 = fma(_1312, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1326 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1314);
    float _1328 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1330 = as_type<float>(_1140);
    float _1332 = _1256;
    float _1334 = _1326;
    if (!_900)
    {
        int _1336 = _1224 + 400;
        uint _1338 = uint(int(uint(_1336) >> uint(2)));
        uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
        int _1342 = int(_1338) & 3;
        float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
        _1330 = _1344;
    }
    float _1346 = _1330;
    bool _1348 = _1322 >= 0.0;
    bool _1350 = _1348 && _1308;
    float _1352 = fma(_1312, _1324, -0.212114393711090087890625);
    float _1354 = _1216;
    if (!_900)
    {
        float _1356 = floor(_786);
        _1354 = _1356;
    }
    float _1358 = _1354;
    float _1360 = _1256 + 1.0;
    bool _1362 = _1322 <= 1.0;
    bool _1364 = _1362 && _1350;
    float _1366 = fma(_1312, _1352, 1.570728778839111328125);
    float _1368 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1328);
    float _1370 = -_1256;
    float _1372 = fma(_1302, _1360, _1370);
    float _1374 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1318);
    float _1376 = _1170 * 0.693147182464599609375;
    float _1378 = 1.0 / _1326;
    float _1380 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1368);
    float _1382 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1374);
    float _1384 = _1320 * 0.636619746685028076171875;
    float _1386 = _1316 * _1242;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1390 = fma(_1372, 0.5, 0.5);
    float _1392 = _1368;
    if (_1364)
    {
        float _1394 = float(_882);
        _1332 = _1394;
    }
    float _1396 = _1332;
    if (!_900)
    {
        float _1398 = -_1358;
        float _1400 = _786 + _1398;
        _1392 = _1400;
    }
    float _1402 = _1392;
    float _1404 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1406 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1382);
    float _1408 = -_1366;
    float _1410 = fma(_1384, _1408, 1.0);
    float _1412 = _1396;
    float _1414 = _1402;
    if (_1364)
    {
        float _1416 = rint(_1396);
        float _1418 = precise::max(_1416, 0.0);
        uint _1420 = uint(_1418);
        uint _1422 = clamp(_1420, 0u, 65535u);
        _1412 = as_type<float>(_1422);
    }
    float _1424 = _1412;
    float _1426 = _1404 * _1378;
    float _1428 = _1406 * _1378;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = fma(_1428, -0.5, 0.5);
    float _1434 = _1316;
    if (!_900)
    {
        float _1436 = rint(_1346);
        float _1438 = precise::max(_1436, 0.0);
        uint _1440 = uint(_1438);
        uint _1442 = clamp(_1440, 0u, 65535u);
        _1434 = as_type<float>(_1442);
    }
    float _1444 = _1434;
    float _1446 = _1424;
    if (_1364)
    {
        float3 _4430 = float3(_1290, _1322, float(as_type<int>(_1424)));
        float3 _4434 = select(_4430, float3(0.0), isnan(_4430));
        float _1448 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4434.xy, uint(rint(_4434.z)), _1386, level(0.0));
        _1446 = _1448;
    }
    float _1450 = _1446;
    float3 _4444 = float3(_1430, _1432, _1388);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4444, float3(0.0), isnan(_4444)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4444, float3(0.0), isnan(_4444)), level(0.0)).x;
    float3 _4453 = float3(_1430, _1432, _1388);
    float4 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4453, float3(0.0), isnan(_4453)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4453, float3(0.0), isnan(_4453)), level(0.0)).xyzw;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1455.w;
    float2 _4469 = float2(_1410, _1390);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4469, float2(0.0), isnan(_4469)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4469, float2(0.0), isnan(_4469)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = _1444;
    if (!_900)
    {
        float3 _4490 = float3(_1402, _1148, float(as_type<int>(_1444)));
        float3 _4492 = select(_4490, float3(0.0), isnan(_4490));
        float _1477 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4492.xy, uint(rint(_4492.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4492.xy, uint(rint(_4492.z)), level(0.0)).x;
        _1475 = _1477;
    }
    float _1479 = _1475;
    float _1481 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1483 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1487 = _1485 != 0;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1493 = _1491 != 0;
    float _1495 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1489);
    float _1497 = (*spvDescriptorSet0.vp_c12)._m0[0].y * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1499 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1495);
    bool _1501 = !_192;
    float _1503 = _1501 ? 0.0 : 1.0;
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1507 = _1499 * (-0.15915493667125701904296875);
    bool _1509 = false;
    float _1511 = _1503;
    if (_1487)
    {
        bool _1513 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1509 = _1513;
    }
    bool _1515 = _1509;
    if (!_1487)
    {
        float _1517 = -_186;
        float _1519 = (-0.0) + _1517;
        _1414 = _1519;
    }
    float _1521 = _1414;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1525 = _1521;
    if (_1493)
    {
        bool _1527 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _278 = _1527;
    }
    bool _1529 = _278;
    float _1531 = (*spvDescriptorSet0.vp_c12)._m0[0].x * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1533 = abs(_834);
    float _1535 = log2(_1533);
    if (_1487)
    {
        float _1537 = -_186;
        float _1539 = _1515 ? _186 : _1537;
        _1525 = _1539;
    }
    float _1541 = _1525;
    float _1543 = fma(_1497, -2.0, _1523);
    if (_1493)
    {
        float _1545 = -_1503;
        float _1547 = _1529 ? _1545 : _1503;
        _1511 = _1547;
    }
    float _1549 = _1511;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1553 = _1541 + 0.5;
    float _1555 = _1507 * 6.283185482025146484375;
    float _1557 = cos(_1555);
    float _1559 = -_1551;
    float _1561 = fma(_1531, 2.0, _1559);
    float _1563 = _1549 + (-0.5);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1569 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1543);
    float _1571 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1481);
    float _1573 = _1507 * 6.283185482025146484375;
    float _1575 = sin(_1573);
    float _1577 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1565);
    float _1579 = fma((*spvDescriptorSet0.vp_c12)._m0[0].y, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1567);
    float _1581 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1571);
    float _1583 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1561);
    float _1585 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1587 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1577);
    float _1589 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1579);
    float _1591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1593 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1595 = _1553 * _1557;
    bool _1597 = _834 <= 8000.0;
    bool _1599 = isnan(_834);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan(8000.0);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    float _1609 = exp2(_1593);
    float _1611 = _1553 * _1575;
    float _1613 = fma(_1563, _1575, _1595);
    float _1615 = -_1611;
    float _1617 = fma(_1563, _1557, _1615);
    float _1619 = _1613 + (-0.5);
    float _1621 = -_1587;
    float _1623 = _1621 + 1.0;
    float _1625 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1627 = _1617 + 0.5;
    float _1629 = exp2(_1483);
    float _1631 = -_1625;
    float _1633 = -_1569;
    float _1635 = fma(_1631, _1619, _1633);
    float _1637 = fma(_1585, _1627, _1583);
    float _1639 = -_1589;
    float _1641 = _1639 + 1.0;
    float _1643 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1581);
    float _1649 = -_1623;
    float _1651 = fma(_1617, _1649, _1637);
    float _1653 = fma(_1613, _1641, _1635);
    float _1655 = fma(_1645, -2.0, 3.0);
    float _1657 = _1645 * _1645;
    float _1659 = _1647 + _1326;
    out.m_76.x = _1651;
    out.m_76.y = _1653;
    float _1661 = _1657 * _1655;
    float _1663 = _1659 * 0.5;
    float _1665 = -_1661;
    float _1667 = _1665 + 1.0;
    float _1669 = -_1629;
    float _1671 = _1669 + 1.0;
    out.gl_Position.x = _1404;
    out.gl_Position.y = _1406;
    out.gl_Position.z = _1647;
    out.gl_Position.w = _1326;
    float _1673 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1661);
    float _1675 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    out.m_78.z = _1663;
    out.m_78.w = _1326;
    float _1679 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1681 = _1607 * _1673;
    float _1683 = fma(_242, _1677, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1685 = _1647;
    if (!_1364)
    {
        _280 = 1.0;
    }
    float _1687 = _280;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1691 = -_1234;
    float _1693 = _1691 + 1.0;
    float _1695 = _1693 * _1689;
    float _1697 = precise::clamp(_1695, 0.0, 1.0);
    float _1699 = -_1697;
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1703 = _1687;
    float _1705 = 1.0;
    if (_1364)
    {
        bool _1707 = _1450 >= _1386;
        bool _1709 = isnan(_1450);
        bool _1711 = _1707 || _1709;
        bool _1713 = isnan(_1386);
        bool _1715 = _1711 || _1713;
        float _1717 = float(_1715);
        _1703 = _1717;
    }
    float _1719 = _1703;
    float _1721 = _1719;
    if (!_900)
    {
        int _1723 = int(_968) << 4;
        int _1725 = _1723 + 2048;
        uint _1727 = uint(int(uint(_1725) >> uint(2)));
        uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
        int _1731 = int(_1727) & 3;
        float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
        int _1735 = int(_1727) + 1;
        uint _1737 = uint(int(uint(_1735) >> uint(2)));
        int _1739 = _1735 & 3;
        float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
        int _1743 = _1725 + 8;
        uint _1745 = uint(int(uint(_1743) >> uint(2)));
        uint _1747 = uint(int(uint(int(_1745)) >> uint(2)));
        int _1749 = int(_1745) & 3;
        float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
        int _1753 = int(_1745) + 1;
        uint _1755 = uint(int(uint(_1753) >> uint(2)));
        int _1757 = _1753 & 3;
        float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
        float _1761 = _736 * _1741;
        float _1763 = fma(_1733, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1761);
        float _1765 = fma(_1751, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1763);
        float _1767 = _1765 + _1759;
        float _1769 = precise::clamp(_1767, 0.0, 1.0);
        float _1771 = -_1769;
        float _1773 = _1771 + _1479;
        float _1775 = fma(_1773, 500.0, 1.5);
        float _1777 = exp2(_1775);
        float _1779 = 0.0 + _1777;
        float _1781 = precise::clamp(_1779, 0.0, 1.0);
        _1705 = _1781;
        _1334 = _1759;
        _1685 = _1751;
    }
    float _1783 = _1705;
    float _1785 = _1334;
    float _1787 = _1685;
    float _1789 = _1679 * _1452;
    float _1791 = _1719 * _1783;
    float _1793 = -_1679;
    float _1795 = _1793 + 1.0;
    bool _1797 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1799 = isnan(_1084);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1805 = _1801 || _1803;
    float _1807 = _1463 * _1789;
    float _1809 = -_1791;
    float _1811 = fma(_1809, _1701, 1.0);
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = _1473 * _1789;
    float _1817 = _1463 * _1795;
    float _1819 = fma(_1469, _1807, _1457);
    float _1821 = fma(_1471, _1807, _1459);
    float _1823 = _1813 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1825 = fma(_1463, _1815, _1461);
    float _1827 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_80.x = _1823;
    float _1829 = _1785;
    float _1831 = _1787;
    float _1833 = _1807;
    float _1835 = _1795;
    float _1837 = _1813;
    if (!_1805)
    {
        _1721 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1839 = _1721;
    float _1841 = _1839;
    float _1843 = _1839;
    if (!_1805)
    {
        _1829 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1845 = _1829;
    out.m_82.x = _1819;
    out.m_82.y = _1821;
    out.m_82.z = _1825;
    out.m_82.w = _1817;
    float _1847 = _1845;
    float _1849 = _1845;
    if (!_1805)
    {
        _1831 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1851 = _1831;
    float _1853 = _1851;
    float _1855 = _1851;
    if (!_1805)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1857 = _1833;
    float _1859 = _1857;
    float _1861 = _1857;
    if (!_1805)
    {
        _1835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1863 = _1835;
    float _1865 = _1863;
    float _1867 = _1863;
    if (!_1805)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1869 = _1837;
    bool _1871 = !_1805;
    float _1873 = _1869;
    float _1875 = _1869;
    if (!_1871)
    {
        bool _1877 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1879 = isnan(_1084);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1885 = _1881 || _1883;
        if (!_1885)
        {
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1889 = _1084 + _1887;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1893 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1891;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1899 = 1.0 / _1893;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1917 = _1889 * _1899;
            float _1919 = precise::clamp(_1917, 0.0, 1.0);
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1925 = fma(_1919, _1897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1927 = fma(_1919, _1923, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1929 = fma(_1919, _1903, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1931 = fma(_1919, _1907, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1933 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1935 = fma(_1919, _1915, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1849 = _1929;
            _1867 = _1933;
            _1843 = _1925;
            _1861 = _1931;
            _1855 = _1927;
            _1875 = _1935;
            _1937 = true;
        }
        else
        {
            bool _1939 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1941 = isnan(_1084);
            bool _1943 = _1939 || _1941;
            bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1947 = _1943 || _1945;
            if (!_1947)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1949 = _1841;
            _1843 = _1949;
            if (!_1947)
            {
                _1847 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1951 = _1847;
            _1849 = _1951;
            if (!_1947)
            {
                _1853 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1953 = _1853;
            _1855 = _1953;
            if (!_1947)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1955 = _1859;
            _1861 = _1955;
            if (!_1947)
            {
                _1865 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1957 = _1865;
            _1867 = _1957;
            if (!_1947)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1959 = _1873;
            bool _1961 = !_1947;
            _1875 = _1959;
            if (!_1961)
            {
                bool _1963 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1965 = isnan(_1084);
                bool _1967 = _1963 || _1965;
                bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1971 = _1967 || _1969;
                if (!_1971)
                {
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1975 = _1084 + _1973;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1977;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1985 = 1.0 / _1979;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2003 = _1975 * _1985;
                    float _2005 = precise::clamp(_2003, 0.0, 1.0);
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2011 = fma(_2005, _1983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1849 = _2015;
                    _1867 = _2019;
                    _1843 = _2011;
                    _1861 = _2017;
                    _1855 = _2013;
                    _1875 = _2021;
                    _1937 = true;
                }
                else
                {
                    _1849 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1867 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1855 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1937 = false;
    float _2023 = _1849;
    float _2025 = _1867;
    float _2027 = _1843;
    float _2029 = _1861;
    float _2031 = _1855;
    float _2033 = _1875;
    float _2035 = fma(_540, -0.5, 0.5);
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = -_2023;
    float _2041 = _2039 + _2025;
    float _2043 = -_2027;
    float _2045 = _2043 + _2029;
    float _2047 = -_2031;
    float _2049 = _2047 + _2033;
    bool _2051 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2053 = fma(_2037, _2041, _2023);
    float _2055 = fma(_2037, _2045, _2027);
    float _2057 = fma(_2037, _2049, _2031);
    float _2059 = _1827 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2061 = _2053 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _2063 = fma(_2055, 0.298911988735198974609375, _2061);
    out.m_86.x = _2059;
    float _2065 = fma(_2057, 0.114477999508380889892578125, _2063);
    float _2067 = -_2065;
    float _2069 = _2055 + _2067;
    float _2071 = -_2065;
    float _2073 = _2053 + _2071;
    float _2075 = -_2065;
    float _2077 = _2057 + _2075;
    float _2079 = fma(_2069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2081 = fma(_2073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2083 = fma(_2077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    out.m_88.x = _2079;
    out.m_88.y = _2081;
    out.m_88.z = _2083;
    if (!_2051)
    {
        return out;
    }
    float _2085 = -_678;
    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2089 = -_680;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2093 = -_682;
    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2097 = _2087 * _2087;
    float _2099 = fma(_2091, _2091, _2097);
    float _2101 = fma(_2095, _2095, _2099);
    float _2103 = sqrt(_2101);
    float _2105 = rsqrt(_2101);
    float _2107 = -_2103;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = _2091 * _2105;
    float _2117 = _2087 * _2105;
    float _2119 = abs(_2113);
    float _2121 = log2(_2119);
    float _2123 = _2095 * _2105;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2127 = _540 * _2117;
    float _2129 = -_2117;
    float _2131 = -_2125;
    float _2133 = fma(_2129, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2131);
    float _2135 = fma(_538, _2115, _2127);
    float _2137 = -_2123;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2133);
    float _2141 = fma(_542, _2123, _2135);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2147 = _2139 + _2145;
    float _2149 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = exp2(_2149);
    float _2157 = _2155 * _2153;
    float _2159 = _2143 * _2157;
    float _2161 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2163 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2165 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2161;
    out.m_84.y = _2163;
    out.m_84.z = _2165;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1937 = false;
    bool _624 = false;
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
    int _117 = _115 + 16;
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
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_142)];
    float _144 = as_type<float>(_dmw1.x);
    int _146 = _117 + 4;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw1.y);
    int _152 = _117 + 8;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw1.z);
    int _158 = _115 + 80;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_160)];
    float _162 = as_type<float>(_dmw2.x);
    int _164 = _158 + 4;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>(_dmw2.y);
    int _170 = _158 + 8;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>(_dmw2.z);
    int _176 = _115 + 48;
    int _178 = as_type<int>(_102) & 1;
    bool _182 = _178 != 0;
    uint _184 = uint(int(uint(_176) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_184)]);
    float _188 = float(_111);
    int _190 = as_type<int>(_102) & 2;
    bool _192 = _190 != 0;
    float _194 = _150 * _150;
    float _196 = fma(_144, _144, _194);
    float _198 = fma(_156, _156, _196);
    float _200 = rsqrt(_198);
    float _202 = _156 * _200;
    float _204 = _150 * _200;
    float _206 = _144 * _200;
    float _208 = _162 * _202;
    float _210 = _174 * _204;
    float _212 = -_208;
    float _214 = fma(_174, _206, _212);
    float _216 = -_210;
    float _218 = fma(_168, _202, _216);
    float _220 = _168 * _206;
    float _222 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _224 = _214 * _214;
    float _226 = -_220;
    float _228 = fma(_162, _204, _226);
    float _230 = fma(_218, _218, _224);
    float _232 = 1.0 / _222;
    float _234 = fma(_228, _228, _230);
    float _236 = rsqrt(_234);
    bool _238 = !_192;
    float _240 = _238 ? 1.0 : (-1.0);
    float _242 = _188 * _232;
    float _244 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _246 = _244 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _248 = abs(_140);
    float _250 = _248 * _240;
    float _252 = _250 * 0.5;
    float _254 = fma(_242, _246, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _256 = _218 * _236;
    float _258 = _214 * _236;
    float _260 = _228 * _236;
    float _262 = _254 * _252;
    bool _264 = !_182;
    float _266 = _256;
    float _268 = _260;
    float _270 = _258;
    float _272 = (*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _274 = _202;
    float _276 = _204;
    bool _278 = _192;
    float _280 = _242;
    if (!_264)
    {
        float _282 = _202 * _256;
        float _284 = _204 * _260;
        float _286 = _206 * _258;
        float _288 = -_282;
        float _290 = fma(_206, _260, _288);
        float _292 = -_284;
        float _294 = fma(_202, _258, _292);
        float _296 = -_286;
        float _298 = fma(_204, _256, _296);
        float _300 = _290 * _290;
        float _302 = fma(_294, _294, _300);
        float _304 = fma(_298, _298, _302);
        float _306 = rsqrt(_304);
        float _308 = _294 * _306;
        float _310 = _290 * _306;
        float _312 = _298 * _306;
        _266 = _308;
        _268 = _312;
        _270 = _310;
    }
    float _314 = _266;
    float _316 = _268;
    float _318 = _270;
    float _320 = -_262;
    float _322 = fma(_314, _320, _122);
    float _324 = -_262;
    float _326 = fma(_316, _324, _134);
    float _328 = -_262;
    float _330 = fma(_318, _328, _128);
    float _332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _334 = _322 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _326 + _336;
    float _340 = _334 * _334;
    float _342 = _338 * _338;
    float _344 = _340 + _342;
    float _346 = sqrt(_344);
    bool _348 = _346 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _350 = _340;
    float _352 = _342;
    float _354 = _322;
    float _356 = _326;
    if (!_348)
    {
        _272 = _330;
    }
    float _358 = _272;
    bool _360 = !_348;
    float _362 = _358;
    if (!_360)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _366 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _368 = _346 + _366;
        float _370 = rsqrt(_344);
        float _372 = _368 * _364;
        float _374 = _330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _376 = _372 * 0.15915493667125701904296875;
        float _378 = _376 * 6.283185482025146484375;
        float _380 = sin(_378);
        float _382 = _376 * 6.283185482025146484375;
        float _384 = cos(_382);
        float _386 = fma(_380, _374, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _388 = _370 * _386;
        float _390 = _384 + (-1.0);
        float _392 = fma(_334, _388, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _394 = fma(_338, _388, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _396 = _390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _398 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _400 = _392 + _398;
        float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _404 = _394 + _402;
        float _406 = fma(_330, _384, _396);
        float _408 = _400 * _400;
        float _410 = _404 * _404;
        _362 = _406;
        _350 = _408;
        _352 = _410;
        _354 = _392;
        _356 = _394;
    }
    float _412 = _362;
    float _414 = _350;
    float _416 = _352;
    float _418 = _354;
    float _420 = _356;
    float _422 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _424 = _412 + _422;
    float _426 = _206 * _316;
    float _428 = fma(_424, _424, _414);
    float _430 = _202 * _318;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _434 = _432 != 0;
    float _436 = -_426;
    float _438 = fma(_202, _314, _436);
    float _440 = _204 * _314;
    float _442 = -_430;
    float _444 = fma(_204, _316, _442);
    float _446 = _438 * _438;
    float _448 = -_440;
    float _450 = fma(_206, _318, _448);
    float _452 = _428 + _416;
    float _454 = fma(_444, _444, _446);
    float _456 = sqrt(_452);
    float _458 = fma(_450, _450, _454);
    float _460 = 0.0;
    float _462 = _446;
    float _464 = _444;
    float _466 = _438;
    float _468 = _452;
    if (_434)
    {
        _460 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _470 = _460;
    float _472 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _474 = _470;
    if (_434)
    {
        _274 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _476 = _274;
    float _478 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _480 = 0.0;
    float _482 = _476;
    if (_434)
    {
        _480 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _484 = _480;
    float _486 = rsqrt(_458);
    float _488 = _484;
    if (_434)
    {
        float _490 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _492 = _470 + _490;
        _474 = _492;
    }
    float _494 = _474;
    if (_434)
    {
        float _496 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _498 = _476 + _496;
        _482 = _498;
    }
    float _500 = _482;
    float _502 = _500;
    if (_434)
    {
        float _504 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _506 = _484 + _504;
        _488 = _506;
    }
    float _508 = _488;
    if (_434)
    {
        float _510 = _494 * _494;
        _462 = _510;
    }
    float _512 = _462;
    float _514 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _516 = _512;
    if (_434)
    {
        float _518 = fma(_500, _500, _512);
        _516 = _518;
    }
    float _520 = _516;
    float _522 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _524 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _528 = _522;
    if (_434)
    {
        float _530 = fma(_508, _508, _520);
        _276 = _530;
    }
    float _532 = _276;
    float _534 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _536 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _538 = _444 * _486;
    float _540 = _438 * _486;
    float _542 = _450 * _486;
    float _544 = _532;
    if (_434)
    {
        float _546 = rsqrt(_532);
        _544 = _546;
    }
    float _548 = _544;
    out.m_70.x = _472;
    out.m_70.y = _478;
    out.m_70.z = _514;
    out.m_70.w = _522;
    bool _550 = _456 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _552 = isnan(_456);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _558 = _554 || _556;
    if (!_434)
    {
        _464 = 0.0;
    }
    float _560 = _464;
    out.m_72.x = _524;
    out.m_72.y = _526;
    out.m_72.z = _534;
    out.m_72.w = _536;
    out.m_74.x = _538;
    out.m_74.y = _540;
    out.m_74.z = _542;
    float _562 = _548;
    float _564 = _560;
    if (_434)
    {
        float _566 = _548 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _466 = _566;
    }
    float _568 = _466;
    if (!_434)
    {
        _468 = 0.0;
        _562 = 0.0;
    }
    float _570 = _468;
    float _572 = _562;
    float _574 = _570;
    float _576 = _572;
    if (_434)
    {
        float _578 = _500 * _568;
        _564 = _578;
    }
    float _580 = _564;
    if (_434)
    {
        float _582 = _494 * _568;
        _574 = _582;
    }
    float _584 = _574;
    if (_434)
    {
        float _586 = _508 * _568;
        _576 = _586;
    }
    float _588 = _576;
    if (!_558)
    {
        _502 = 1.0;
    }
    float _590 = _502;
    bool _592 = !_558;
    float _594 = _590;
    if (!_592)
    {
        bool _596 = _456 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _598 = isnan(_456);
        bool _600 = _596 || _598;
        bool _602 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _604 = _600 || _602;
        if (!_604)
        {
            float _606 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _608 = _456 + _606;
            float _610 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _612 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _610;
            float _614 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _616 = _614 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _618 = 1.0 / _612;
            float _620 = _608 * _618;
            float _622 = fma(_620, _616, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _594 = _622;
            _624 = true;
        }
        else
        {
            bool _626 = _456 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _628 = isnan(_456);
            bool _630 = _626 || _628;
            bool _632 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _634 = _630 || _632;
            if (!_634)
            {
                float _636 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _638 = _456 + _636;
                float _640 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _642 = _640 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _644 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _646 = _644 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _648 = 1.0 / _642;
                float _650 = _638 * _648;
                float _652 = fma(_650, _646, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _594 = _652;
                _624 = true;
            }
            else
            {
                _594 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _624 = false;
    float _654 = _594;
    float _656 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _658 = _412 + _656;
    float _660 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _662 = _418 + _660;
    float _664 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _666 = _420 + _664;
    float _668 = _128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _670 = fma(_658, _654, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _672 = fma(_662, _654, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _674 = fma(_666, _654, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _676 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[2].x, _668);
    float _678 = _670 + _584;
    float _680 = _672 + _580;
    float _682 = _674 + _588;
    float _684 = _128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _688 = _678 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _692 = _680 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _696 = _682 + _694;
    float _698 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[1].x, _684);
    float _700 = _688 * _688;
    float _702 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[2].z, _676);
    float _704 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[1].z, _698);
    float _706 = fma(_692, _692, _700);
    float _708 = _128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _710 = _128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = _704 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _714 = fma(_696, _696, _706);
    float _716 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[0].x, _708);
    float _718 = fma(_122, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _720 = _712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _722 = rsqrt(_714);
    float _724 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[0].z, _716);
    float _726 = fma(_134, (*spvDescriptorSet0.vp_c8)._m0[3].z, _718);
    float _728 = _702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _730 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _732 = _724 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _734 = _726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _736 = _730 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _738 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].x, _720);
    float _740 = _712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[7].z, _738);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].x, _740);
    float _746 = _722 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _742);
    float _750 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[6].z, _744);
    float _752 = _692 * _746;
    float _754 = _696 * _746;
    float _756 = 1.0 / _748;
    float _758 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _750);
    float _760 = _752 * _752;
    float _762 = _754 * _754;
    float _764 = _758 + _748;
    float _766 = _760 + _762;
    float _768 = _736 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _770 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _772 = sqrt(_766);
    float _774 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _768);
    float _776 = _764 * _756;
    float _778 = _776 * 0.5;
    float _780 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _774);
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _784 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _782);
    float _786 = _780 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _788 = _736 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _790 = trunc(_786);
    int _792 = int(_790);
    float _794 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _788);
    bool _796 = _772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _798 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _794);
    float _800 = 1.0 / _784;
    float _802 = _798 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _804 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _806 = _756;
    float _808 = _766;
    float _810 = _752;
    float _812 = _754;
    float _814 = _760;
    float _816 = _714;
    if (_796)
    {
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _806 = _818;
    }
    float _820 = _806;
    int _822 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _824 = _792 + _822;
    int _826 = _824 + 1;
    float _828 = trunc(_802);
    int _830 = int(_828);
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _834 = _800 * _832;
    float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = _772 + _836;
    bool _840 = _834 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _842 = _834 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _844 = _838;
    int _846 = 2;
    if (_796)
    {
        float _848 = _838 * _820;
        _844 = _848;
    }
    float _850 = _844;
    float _852 = 0.0;
    if (_796)
    {
        float _854 = rsqrt(_766);
        _852 = _854;
    }
    float _856 = _852;
    if (_796)
    {
        float _858 = _850 * 0.15915493667125701904296875;
        _528 = _858;
    }
    float _860 = _528;
    bool _862 = !_840;
    int _864 = _862 ? 0 : 1;
    int _866 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _868 = _830 + _866;
    int _870 = _868 + 1;
    float _872 = floor(_804);
    if (!_840)
    {
        _846 = 1;
    }
    int _874 = _846;
    bool _876 = _826 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _878 = _826 | _870;
    int _880 = _874;
    if (!_842)
    {
        _880 = _864;
    }
    int _882 = _880;
    float _884 = 0.0;
    if (_796)
    {
        float _886 = _860 * 6.283185482025146484375;
        float _888 = cos(_886);
        _884 = _888;
    }
    float _890 = _884;
    bool _892 = _878 < 0;
    bool _894 = _892 || _876;
    float _896 = precise::max(0.0, _770);
    bool _898 = _870 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _900 = _898 || _894;
    int _902 = _882 << 6;
    float _904 = as_type<float>(_864);
    int _906 = _902;
    if (_796)
    {
        float _908 = _860 * 6.283185482025146484375;
        float _910 = sin(_908);
        _904 = _910;
    }
    float _912 = _904;
    float _914 = -_746;
    float _916 = -_896;
    float _918 = fma(_688, _914, _916);
    int _920 = _902 + 96;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    uint _924 = uint(int(uint(int(_922)) >> uint(2)));
    int _926 = int(_922) & 3;
    float _928 = (*spvDescriptorSet0.vp_c15)._m0[int(_924)][_926];
    int _930 = int(_922) + 1;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    int _934 = _930 & 3;
    float _936 = (*spvDescriptorSet0.vp_c15)._m0[int(_932)][_934];
    float _938 = -_872;
    float _940 = _804 + _938;
    float _942 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    uint _944 = as_type<uint>(_872);
    if (!_796)
    {
        _808 = _918;
    }
    float _946 = _808;
    float _948 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _950 = _946;
    if (_796)
    {
        float _952 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _942 = _952;
    }
    float _954 = _942;
    float _956 = 0.0;
    if (_796)
    {
        float _958 = _890 + (-1.0);
        _956 = _958;
    }
    float _960 = _956;
    float _962 = _960;
    if (!_900)
    {
        int _964 = _870 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _966 = _964 + _826;
        _944 = uint(_966);
    }
    uint _968 = _944;
    int _970 = _902 + 48;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    uint _974 = uint(int(uint(int(_972)) >> uint(2)));
    int _976 = int(_972) & 3;
    float _978 = (*spvDescriptorSet0.vp_c15)._m0[int(_974)][_976];
    int _980 = int(_972) + 1;
    uint _982 = uint(int(uint(_980) >> uint(2)));
    int _984 = _980 & 3;
    float _986 = (*spvDescriptorSet0.vp_c15)._m0[int(_982)][_984];
    float _988 = floor(_948);
    if (_796)
    {
        float _990 = _960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _962 = _990;
    }
    float _992 = _962;
    float _994 = 0.0;
    if (_796)
    {
        float _996 = fma(_912, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _994 = _996;
    }
    float _998 = _994;
    float _1000 = _998;
    if (_796)
    {
        float _1002 = fma(_918, _890, _992);
        _950 = _1002;
    }
    float _1004 = _950;
    int _1006 = _902 + 64;
    uint _1008 = uint(int(uint(_1006) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c15)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
    if (_796)
    {
        float _1024 = _856 * _998;
        _1000 = _1024;
    }
    float _1026 = _1000;
    float _1028 = _678 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1030 = _918;
    if (!_900)
    {
        float _1032 = floor(_802);
        _1030 = _1032;
    }
    float _1034 = _1030;
    if (_796)
    {
        float _1036 = _752 * _1026;
        _810 = _1036;
    }
    float _1038 = _810;
    float _1040 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1028);
    float _1042 = _1040;
    if (_796)
    {
        float _1044 = _754 * _1026;
        _812 = _1044;
    }
    float _1046 = _812;
    int _1048 = _902 + 104;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    if (_796)
    {
        float _1066 = _1038 * _1038;
        _814 = _1066;
    }
    float _1068 = _814;
    float _1070 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1040);
    if (!_796)
    {
        _1042 = _762;
    }
    float _1072 = _1042;
    float _1074 = _1072;
    if (_796)
    {
        float _1076 = _1046 * _1046;
        _1074 = _1076;
    }
    float _1078 = _1074;
    float _1080 = fma(_1004, _1004, _1068);
    float _1082 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1084 = sqrt(_714);
    int _1086 = _902 + 80;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    float _1104 = _1080 + _1078;
    float _1106 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1108 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1110 = -_988;
    float _1112 = _948 + _1110;
    float _1114 = -_1108;
    float _1116 = fma(_1114, _1106, 1.0);
    int _1118 = _902 + 56;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c15)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c15)._m0[int(_1130)][_1132];
    int _1136 = as_type<int>(_1108);
    if (!_900)
    {
        uint _1138 = uint(int(uint(int(_968)) >> uint(2)));
        _1136 = int(_1138);
    }
    int _1140 = _1136;
    float _1142 = rsqrt(_1104);
    if (!_900)
    {
        float _1144 = -_1034;
        float _1146 = _802 + _1144;
        _816 = _1146;
    }
    float _1148 = _816;
    int _1150 = _902 + 72;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    float _1168 = _736 * _936;
    float _1170 = log2(_1116);
    float _1172 = fma(_928, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1168);
    int _1174 = _902 + 88;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    uint _1178 = uint(int(uint(int(_1176)) >> uint(2)));
    int _1180 = int(_1176) & 3;
    float _1182 = (*spvDescriptorSet0.vp_c15)._m0[int(_1178)][_1180];
    int _1184 = int(_1176) + 1;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    int _1188 = _1184 & 3;
    float _1190 = (*spvDescriptorSet0.vp_c15)._m0[int(_1186)][_1188];
    float _1192 = _736 * _986;
    float _1194 = _1142 * _1046;
    float _1196 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1192);
    int _1198 = as_type<int>(_986);
    if (!_900)
    {
        int _1200 = int(_968) << 2;
        _906 = _1200;
    }
    int _1202 = _906;
    float _1204 = _736 * _1022;
    float _1206 = _736 * _1102;
    int _1208 = _1202;
    if (!_900)
    {
        int _1210 = 12 & _1202;
        _1208 = _1210;
    }
    int _1212 = _1208;
    float _1214 = fma(_1056, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1172);
    float _1216 = fma(_1014, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1204);
    float _1218 = fma(_1094, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1206);
    if (!_900)
    {
        int _1220 = _1140 << 4;
        int _1222 = _1220 + _1212;
        _1198 = _1222;
    }
    int _1224 = _1198;
    float _1226 = _1214 + _1064;
    float _1228 = fma(_1126, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1196);
    float _1230 = _1142 * _1038;
    float _1232 = _678 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float2 _4067 = float2(_940, _1112);
    float _1234 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4067, float2(0.0), isnan(_4067)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4067, float2(0.0), isnan(_4067)), level(0.0)).x;
    float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1238 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1236);
    float _1240 = precise::clamp(_1238, 0.0, 1.0);
    float _1242 = 1.0 / _1226;
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1246 = _1228 + _1134;
    float _1248 = -_1240;
    float _1250 = _1248 + 1.0;
    float _1252 = fma(_1158, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1216);
    float _1254 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1232);
    float _1256 = _1142 * _1004;
    float _1258 = _678 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1260 = abs(_1250);
    float _1262 = log2(_1260);
    float _1264 = _1252 + _1166;
    float _1266 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1254);
    float _1268 = fma(_1182, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1218);
    float _1270 = _678 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1272 = -_1244;
    float _1274 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1272);
    float _1276 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1278 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1270);
    float _1280 = -_1194;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1274);
    float _1284 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1258);
    float _1286 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1288 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1278);
    float _1290 = _1246 * _1242;
    float _1292 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1284);
    float _1294 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1296 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1298 = _1290 >= 0.0;
    float _1300 = fma(_1282, -0.5, 0.5);
    float _1302 = exp2(_1294);
    float _1304 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1286);
    bool _1306 = _1290 <= 1.0;
    bool _1308 = _1306 && _1298;
    float _1310 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1312 = fma(_1282, 0.5, 0.5);
    float _1314 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1316 = _1268 + _1190;
    float _1318 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1320 = sqrt(_1300);
    float _1322 = _1264 * _1242;
    float _1324 = fma(_1312, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1326 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1314);
    float _1328 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1330 = as_type<float>(_1140);
    float _1332 = _1256;
    float _1334 = _1326;
    if (!_900)
    {
        int _1336 = _1224 + 400;
        uint _1338 = uint(int(uint(_1336) >> uint(2)));
        uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
        int _1342 = int(_1338) & 3;
        float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
        _1330 = _1344;
    }
    float _1346 = _1330;
    bool _1348 = _1322 >= 0.0;
    bool _1350 = _1348 && _1308;
    float _1352 = fma(_1312, _1324, -0.212114393711090087890625);
    float _1354 = _1216;
    if (!_900)
    {
        float _1356 = floor(_786);
        _1354 = _1356;
    }
    float _1358 = _1354;
    float _1360 = _1256 + 1.0;
    bool _1362 = _1322 <= 1.0;
    bool _1364 = _1362 && _1350;
    float _1366 = fma(_1312, _1352, 1.570728778839111328125);
    float _1368 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1328);
    float _1370 = -_1256;
    float _1372 = fma(_1302, _1360, _1370);
    float _1374 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1318);
    float _1376 = _1170 * 0.693147182464599609375;
    float _1378 = 1.0 / _1326;
    float _1380 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1368);
    float _1382 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1374);
    float _1384 = _1320 * 0.636619746685028076171875;
    float _1386 = _1316 * _1242;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1390 = fma(_1372, 0.5, 0.5);
    float _1392 = _1368;
    if (_1364)
    {
        float _1394 = float(_882);
        _1332 = _1394;
    }
    float _1396 = _1332;
    if (!_900)
    {
        float _1398 = -_1358;
        float _1400 = _786 + _1398;
        _1392 = _1400;
    }
    float _1402 = _1392;
    float _1404 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1406 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1382);
    float _1408 = -_1366;
    float _1410 = fma(_1384, _1408, 1.0);
    float _1412 = _1396;
    float _1414 = _1402;
    if (_1364)
    {
        float _1416 = rint(_1396);
        float _1418 = precise::max(_1416, 0.0);
        uint _1420 = uint(_1418);
        uint _1422 = clamp(_1420, 0u, 65535u);
        _1412 = as_type<float>(_1422);
    }
    float _1424 = _1412;
    float _1426 = _1404 * _1378;
    float _1428 = _1406 * _1378;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = fma(_1428, -0.5, 0.5);
    float _1434 = _1316;
    if (!_900)
    {
        float _1436 = rint(_1346);
        float _1438 = precise::max(_1436, 0.0);
        uint _1440 = uint(_1438);
        uint _1442 = clamp(_1440, 0u, 65535u);
        _1434 = as_type<float>(_1442);
    }
    float _1444 = _1434;
    float _1446 = _1424;
    if (_1364)
    {
        float3 _4430 = float3(_1290, _1322, float(as_type<int>(_1424)));
        float3 _4434 = select(_4430, float3(0.0), isnan(_4430));
        float _1448 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4434.xy, uint(rint(_4434.z)), _1386, level(0.0));
        _1446 = _1448;
    }
    float _1450 = _1446;
    float3 _4444 = float3(_1430, _1432, _1388);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4444, float3(0.0), isnan(_4444)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4444, float3(0.0), isnan(_4444)), level(0.0)).x;
    float3 _4453 = float3(_1430, _1432, _1388);
    float4 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4453, float3(0.0), isnan(_4453)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4453, float3(0.0), isnan(_4453)), level(0.0)).xyzw;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1455.w;
    float2 _4469 = float2(_1410, _1390);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4469, float2(0.0), isnan(_4469)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4469, float2(0.0), isnan(_4469)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = _1444;
    if (!_900)
    {
        float3 _4490 = float3(_1402, _1148, float(as_type<int>(_1444)));
        float3 _4492 = select(_4490, float3(0.0), isnan(_4490));
        float _1477 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4492.xy, uint(rint(_4492.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4492.xy, uint(rint(_4492.z)), level(0.0)).x;
        _1475 = _1477;
    }
    float _1479 = _1475;
    float _1481 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1483 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1487 = _1485 != 0;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1493 = _1491 != 0;
    float _1495 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1489);
    float _1497 = (*spvDescriptorSet0.vp_c12)._m0[0].y * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1499 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1495);
    bool _1501 = !_192;
    float _1503 = _1501 ? 0.0 : 1.0;
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1507 = _1499 * (-0.15915493667125701904296875);
    bool _1509 = false;
    float _1511 = _1503;
    if (_1487)
    {
        bool _1513 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1509 = _1513;
    }
    bool _1515 = _1509;
    if (!_1487)
    {
        float _1517 = -_186;
        float _1519 = (-0.0) + _1517;
        _1414 = _1519;
    }
    float _1521 = _1414;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1525 = _1521;
    if (_1493)
    {
        bool _1527 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _278 = _1527;
    }
    bool _1529 = _278;
    float _1531 = (*spvDescriptorSet0.vp_c12)._m0[0].x * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1533 = abs(_834);
    float _1535 = log2(_1533);
    if (_1487)
    {
        float _1537 = -_186;
        float _1539 = _1515 ? _186 : _1537;
        _1525 = _1539;
    }
    float _1541 = _1525;
    float _1543 = fma(_1497, -2.0, _1523);
    if (_1493)
    {
        float _1545 = -_1503;
        float _1547 = _1529 ? _1545 : _1503;
        _1511 = _1547;
    }
    float _1549 = _1511;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1553 = _1541 + 0.5;
    float _1555 = _1507 * 6.283185482025146484375;
    float _1557 = cos(_1555);
    float _1559 = -_1551;
    float _1561 = fma(_1531, 2.0, _1559);
    float _1563 = _1549 + (-0.5);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1569 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1543);
    float _1571 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1481);
    float _1573 = _1507 * 6.283185482025146484375;
    float _1575 = sin(_1573);
    float _1577 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1565);
    float _1579 = fma((*spvDescriptorSet0.vp_c12)._m0[0].y, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1567);
    float _1581 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1571);
    float _1583 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1561);
    float _1585 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1587 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1577);
    float _1589 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1579);
    float _1591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1593 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1595 = _1553 * _1557;
    bool _1597 = _834 <= 8000.0;
    bool _1599 = isnan(_834);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan(8000.0);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    float _1609 = exp2(_1593);
    float _1611 = _1553 * _1575;
    float _1613 = fma(_1563, _1575, _1595);
    float _1615 = -_1611;
    float _1617 = fma(_1563, _1557, _1615);
    float _1619 = _1613 + (-0.5);
    float _1621 = -_1587;
    float _1623 = _1621 + 1.0;
    float _1625 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1627 = _1617 + 0.5;
    float _1629 = exp2(_1483);
    float _1631 = -_1625;
    float _1633 = -_1569;
    float _1635 = fma(_1631, _1619, _1633);
    float _1637 = fma(_1585, _1627, _1583);
    float _1639 = -_1589;
    float _1641 = _1639 + 1.0;
    float _1643 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1581);
    float _1649 = -_1623;
    float _1651 = fma(_1617, _1649, _1637);
    float _1653 = fma(_1613, _1641, _1635);
    float _1655 = fma(_1645, -2.0, 3.0);
    float _1657 = _1645 * _1645;
    float _1659 = _1647 + _1326;
    out.m_76.x = _1651;
    out.m_76.y = _1653;
    float _1661 = _1657 * _1655;
    float _1663 = _1659 * 0.5;
    float _1665 = -_1661;
    float _1667 = _1665 + 1.0;
    float _1669 = -_1629;
    float _1671 = _1669 + 1.0;
    out.gl_Position.x = _1404;
    out.gl_Position.y = _1406;
    out.gl_Position.z = _1647;
    out.gl_Position.w = _1326;
    float _1673 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1661);
    float _1675 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    out.m_78.z = _1663;
    out.m_78.w = _1326;
    float _1679 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1681 = _1607 * _1673;
    float _1683 = fma(_242, _1677, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1685 = _1647;
    if (!_1364)
    {
        _280 = 1.0;
    }
    float _1687 = _280;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1691 = -_1234;
    float _1693 = _1691 + 1.0;
    float _1695 = _1693 * _1689;
    float _1697 = precise::clamp(_1695, 0.0, 1.0);
    float _1699 = -_1697;
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1703 = _1687;
    float _1705 = 1.0;
    if (_1364)
    {
        bool _1707 = _1450 >= _1386;
        bool _1709 = isnan(_1450);
        bool _1711 = _1707 || _1709;
        bool _1713 = isnan(_1386);
        bool _1715 = _1711 || _1713;
        float _1717 = float(_1715);
        _1703 = _1717;
    }
    float _1719 = _1703;
    float _1721 = _1719;
    if (!_900)
    {
        int _1723 = int(_968) << 4;
        int _1725 = _1723 + 2048;
        uint _1727 = uint(int(uint(_1725) >> uint(2)));
        uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
        int _1731 = int(_1727) & 3;
        float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
        int _1735 = int(_1727) + 1;
        uint _1737 = uint(int(uint(_1735) >> uint(2)));
        int _1739 = _1735 & 3;
        float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
        int _1743 = _1725 + 8;
        uint _1745 = uint(int(uint(_1743) >> uint(2)));
        uint _1747 = uint(int(uint(int(_1745)) >> uint(2)));
        int _1749 = int(_1745) & 3;
        float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
        int _1753 = int(_1745) + 1;
        uint _1755 = uint(int(uint(_1753) >> uint(2)));
        int _1757 = _1753 & 3;
        float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
        float _1761 = _736 * _1741;
        float _1763 = fma(_1733, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1761);
        float _1765 = fma(_1751, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1763);
        float _1767 = _1765 + _1759;
        float _1769 = precise::clamp(_1767, 0.0, 1.0);
        float _1771 = -_1769;
        float _1773 = _1771 + _1479;
        float _1775 = fma(_1773, 500.0, 1.5);
        float _1777 = exp2(_1775);
        float _1779 = 0.0 + _1777;
        float _1781 = precise::clamp(_1779, 0.0, 1.0);
        _1705 = _1781;
        _1334 = _1759;
        _1685 = _1751;
    }
    float _1783 = _1705;
    float _1785 = _1334;
    float _1787 = _1685;
    float _1789 = _1679 * _1452;
    float _1791 = _1719 * _1783;
    float _1793 = -_1679;
    float _1795 = _1793 + 1.0;
    bool _1797 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1799 = isnan(_1084);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1805 = _1801 || _1803;
    float _1807 = _1463 * _1789;
    float _1809 = -_1791;
    float _1811 = fma(_1809, _1701, 1.0);
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = _1473 * _1789;
    float _1817 = _1463 * _1795;
    float _1819 = fma(_1469, _1807, _1457);
    float _1821 = fma(_1471, _1807, _1459);
    float _1823 = _1813 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1825 = fma(_1463, _1815, _1461);
    float _1827 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_80.x = _1823;
    float _1829 = _1785;
    float _1831 = _1787;
    float _1833 = _1807;
    float _1835 = _1795;
    float _1837 = _1813;
    if (!_1805)
    {
        _1721 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1839 = _1721;
    float _1841 = _1839;
    float _1843 = _1839;
    if (!_1805)
    {
        _1829 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1845 = _1829;
    out.m_82.x = _1819;
    out.m_82.y = _1821;
    out.m_82.z = _1825;
    out.m_82.w = _1817;
    float _1847 = _1845;
    float _1849 = _1845;
    if (!_1805)
    {
        _1831 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1851 = _1831;
    float _1853 = _1851;
    float _1855 = _1851;
    if (!_1805)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1857 = _1833;
    float _1859 = _1857;
    float _1861 = _1857;
    if (!_1805)
    {
        _1835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1863 = _1835;
    float _1865 = _1863;
    float _1867 = _1863;
    if (!_1805)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1869 = _1837;
    bool _1871 = !_1805;
    float _1873 = _1869;
    float _1875 = _1869;
    if (!_1871)
    {
        bool _1877 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1879 = isnan(_1084);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1885 = _1881 || _1883;
        if (!_1885)
        {
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1889 = _1084 + _1887;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1893 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1891;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1899 = 1.0 / _1893;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1917 = _1889 * _1899;
            float _1919 = precise::clamp(_1917, 0.0, 1.0);
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1925 = fma(_1919, _1897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1927 = fma(_1919, _1923, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1929 = fma(_1919, _1903, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1931 = fma(_1919, _1907, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1933 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1935 = fma(_1919, _1915, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1849 = _1929;
            _1867 = _1933;
            _1843 = _1925;
            _1861 = _1931;
            _1855 = _1927;
            _1875 = _1935;
            _1937 = true;
        }
        else
        {
            bool _1939 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1941 = isnan(_1084);
            bool _1943 = _1939 || _1941;
            bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1947 = _1943 || _1945;
            if (!_1947)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1949 = _1841;
            _1843 = _1949;
            if (!_1947)
            {
                _1847 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1951 = _1847;
            _1849 = _1951;
            if (!_1947)
            {
                _1853 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1953 = _1853;
            _1855 = _1953;
            if (!_1947)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1955 = _1859;
            _1861 = _1955;
            if (!_1947)
            {
                _1865 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1957 = _1865;
            _1867 = _1957;
            if (!_1947)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1959 = _1873;
            bool _1961 = !_1947;
            _1875 = _1959;
            if (!_1961)
            {
                bool _1963 = _1084 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1965 = isnan(_1084);
                bool _1967 = _1963 || _1965;
                bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1971 = _1967 || _1969;
                if (!_1971)
                {
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1975 = _1084 + _1973;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1977;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1985 = 1.0 / _1979;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2003 = _1975 * _1985;
                    float _2005 = precise::clamp(_2003, 0.0, 1.0);
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2011 = fma(_2005, _1983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1849 = _2015;
                    _1867 = _2019;
                    _1843 = _2011;
                    _1861 = _2017;
                    _1855 = _2013;
                    _1875 = _2021;
                    _1937 = true;
                }
                else
                {
                    _1849 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1867 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1855 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1937 = false;
    float _2023 = _1849;
    float _2025 = _1867;
    float _2027 = _1843;
    float _2029 = _1861;
    float _2031 = _1855;
    float _2033 = _1875;
    float _2035 = fma(_540, -0.5, 0.5);
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = -_2023;
    float _2041 = _2039 + _2025;
    float _2043 = -_2027;
    float _2045 = _2043 + _2029;
    float _2047 = -_2031;
    float _2049 = _2047 + _2033;
    bool _2051 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2053 = fma(_2037, _2041, _2023);
    float _2055 = fma(_2037, _2045, _2027);
    float _2057 = fma(_2037, _2049, _2031);
    float _2059 = _1827 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2061 = _2053 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _2063 = fma(_2055, 0.298911988735198974609375, _2061);
    out.m_86.x = _2059;
    float _2065 = fma(_2057, 0.114477999508380889892578125, _2063);
    float _2067 = -_2065;
    float _2069 = _2055 + _2067;
    float _2071 = -_2065;
    float _2073 = _2053 + _2071;
    float _2075 = -_2065;
    float _2077 = _2057 + _2075;
    float _2079 = fma(_2069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2081 = fma(_2073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2083 = fma(_2077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    out.m_88.x = _2079;
    out.m_88.y = _2081;
    out.m_88.z = _2083;
    if (!_2051)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2085 = -_678;
    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2089 = -_680;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2093 = -_682;
    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2097 = _2087 * _2087;
    float _2099 = fma(_2091, _2091, _2097);
    float _2101 = fma(_2095, _2095, _2099);
    float _2103 = sqrt(_2101);
    float _2105 = rsqrt(_2101);
    float _2107 = -_2103;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = _2091 * _2105;
    float _2117 = _2087 * _2105;
    float _2119 = abs(_2113);
    float _2121 = log2(_2119);
    float _2123 = _2095 * _2105;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2127 = _540 * _2117;
    float _2129 = -_2117;
    float _2131 = -_2125;
    float _2133 = fma(_2129, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2131);
    float _2135 = fma(_538, _2115, _2127);
    float _2137 = -_2123;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2133);
    float _2141 = fma(_542, _2123, _2135);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2147 = _2139 + _2145;
    float _2149 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = exp2(_2149);
    float _2157 = _2155 * _2153;
    float _2159 = _2143 * _2157;
    float _2161 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2163 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2165 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2161;
    out.m_84.y = _2163;
    out.m_84.z = _2165;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

