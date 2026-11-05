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
    constant _16* vp_c12 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c15 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c10 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    const device _35* vp_s0 [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _636 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = as_type<float>(int(gl_VertexIndex));
    float _82 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    int _89 = as_type<int>(_80) >> 2;
    int _91 = _89 + _87;
    int _93 = _91 * 96;
    int _95 = _93 + 32;
    uint _98 = uint(int(uint(_93) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_98)];
    float _100 = as_type<float>(_dmw0.x);
    int _102 = _93 + 4;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>(_dmw0.y);
    int _108 = _93 + 8;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw0.z);
    int _114 = _93 + 12;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw0.w);
    uint _120 = uint(int(uint(_95) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_120)];
    float _122 = as_type<float>(_dmw2.x);
    int _124 = _95 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw2.y);
    int _130 = _95 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw2.z);
    int _136 = _93 + 16;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_138)];
    float _140 = as_type<float>(_dmw1.x);
    int _142 = _136 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw1.y);
    int _148 = _136 + 8;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    float _152 = as_type<float>(_dmw1.z);
    int _154 = _93 + 48;
    int _156 = as_type<int>(_80) & 2;
    bool _160 = _156 != 0;
    int _162 = as_type<int>(_80) & 1;
    bool _164 = _162 != 0;
    float _166 = float(_89);
    uint _168 = uint(int(uint(_154) >> uint(2)));
    packed_uint2 _dmw3 = *(const device packed_uint2*)&(*spvDescriptorSet0.vp_s0)._m0[int(_168)];
    float _170 = as_type<float>(_dmw3.x);
    int _172 = _154 + 4;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>(_dmw3.y);
    float _178 = -_106;
    float _180 = _178 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _182 = _180 * _180;
    float _184 = _128 * _128;
    float _186 = -_100;
    float _188 = _186 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _190 = fma(_122, _122, _184);
    float _192 = -_112;
    float _194 = _192 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _196 = fma(_188, _188, _182);
    float _198 = fma(_134, _134, _190);
    float _200 = fma(_194, _194, _196);
    float _202 = rsqrt(_198);
    float _204 = rsqrt(_200);
    float _206 = _134 * _202;
    float _208 = _128 * _202;
    float _210 = _122 * _202;
    float _212 = _188 * _204;
    float _214 = _194 * _204;
    float _216 = _180 * _204;
    float _218 = _212 * _206;
    float _220 = _214 * _208;
    float _222 = -_218;
    float _224 = fma(_214, _210, _222);
    float _226 = _216 * _210;
    float _228 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _230 = -_220;
    float _232 = fma(_216, _206, _230);
    float _234 = _224 * _224;
    float _236 = -_226;
    float _238 = fma(_212, _208, _236);
    float _240 = _146 * _146;
    float _242 = fma(_232, _232, _234);
    float _244 = fma(_140, _140, _240);
    float _246 = fma(_238, _238, _242);
    float _248 = 1.0 / _228;
    float _250 = fma(_152, _152, _244);
    float _252 = rsqrt(_246);
    bool _254 = !_160;
    float _256 = _254 ? 1.0 : (-1.0);
    float _258 = rsqrt(_250);
    float _260 = abs(_118);
    float _262 = _260 * _256;
    float _264 = _262 * 0.5;
    float _266 = _166 * _248;
    float _268 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _270 = _268 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _272 = _232 * _252;
    float _274 = _224 * _252;
    float _276 = _238 * _252;
    float _278 = fma(_266, _270, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _280 = _140 * _258;
    float _282 = _146 * _258;
    float _284 = _152 * _258;
    float _286 = _278 * _264;
    float _288 = _146;
    float _290 = _152;
    float _292 = _140;
    float _294 = _264;
    float _296 = _272;
    float _298 = _286;
    float _300 = _80;
    float _302 = _106;
    float _304 = _100;
    bool _306 = _160;
    if (!_164)
    {
        _288 = _272;
    }
    float _308 = _288;
    float _310 = _308;
    if (!_164)
    {
        _290 = _274;
    }
    float _312 = _290;
    float _314 = _312;
    if (!_164)
    {
        _292 = _276;
    }
    float _316 = _292;
    bool _318 = !_164;
    float _320 = _316;
    float _322 = _170;
    if (!_318)
    {
        float _324 = _284 * _272;
        float _326 = _282 * _276;
        float _328 = -_324;
        float _330 = fma(_280, _276, _328);
        float _332 = _280 * _274;
        float _334 = -_326;
        float _336 = fma(_284, _274, _334);
        float _338 = _330 * _330;
        float _340 = -_332;
        float _342 = fma(_282, _272, _340);
        float _344 = fma(_336, _336, _338);
        float _346 = fma(_342, _342, _344);
        float _348 = rsqrt(_346);
        float _350 = _336 * _348;
        float _352 = _330 * _348;
        float _354 = _342 * _348;
        _320 = _354;
        _310 = _350;
        _314 = _352;
    }
    float _356 = _320;
    float _358 = _310;
    float _360 = _314;
    float _362 = _356 * _264;
    float _364 = -_286;
    float _366 = fma(_358, _364, _100);
    float _368 = -_286;
    float _370 = fma(_360, _368, _106);
    float _372 = -_362;
    float _374 = fma(_278, _372, _112);
    float _376 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _378 = _366 + _376;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _382 = _380 != 0;
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _386 = _374 + _384;
    float _388 = _378 * _378;
    float _390 = _386 * _386;
    float _392 = _388 + _390;
    float _394 = sqrt(_392);
    bool _396 = _394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _398 = _388;
    float _400 = _390;
    float _402 = _366;
    float _404 = _374;
    float _406 = _378;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_396)
    {
        _294 = _370;
    }
    float _410 = _294;
    bool _412 = !_396;
    float _414 = _410;
    if (!_412)
    {
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _420 = _394 + _418;
        float _422 = _370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = rsqrt(_392);
        float _426 = _420 * _416;
        float _428 = _426 * 0.15915493667125701904296875;
        float _430 = _428 * 6.283185482025146484375;
        float _432 = sin(_430);
        float _434 = _428 * 6.283185482025146484375;
        float _436 = cos(_434);
        float _438 = fma(_432, _422, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _440 = _424 * _438;
        float _442 = _436 + (-1.0);
        float _444 = fma(_378, _440, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _446 = fma(_386, _440, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _448 = _442 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _452 = _444 + _450;
        float _454 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _456 = _446 + _454;
        float _458 = fma(_370, _436, _448);
        float _460 = _452 * _452;
        float _462 = _456 * _456;
        _414 = _458;
        _398 = _460;
        _400 = _462;
        _402 = _444;
        _404 = _446;
    }
    float _464 = _414;
    float _466 = _398;
    float _468 = _400;
    float _470 = _402;
    float _472 = _404;
    float _474 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _476 = _464 + _474;
    float _478 = _468;
    float _480 = _470;
    if (_382)
    {
        _296 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _482 = _296;
    float _484 = _482;
    if (_382)
    {
        _298 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _486 = _298;
    float _488 = fma(_476, _476, _466);
    float _490 = _486;
    if (_382)
    {
        _300 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _492 = _300;
    float _494 = _492;
    if (_382)
    {
        float _496 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _498 = _482 + _496;
        _484 = _498;
    }
    float _500 = _484;
    float _502 = _488 + _468;
    float _504 = _502;
    if (_382)
    {
        float _506 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _508 = _486 + _506;
        _490 = _508;
    }
    float _510 = _490;
    float _512 = _510;
    if (_382)
    {
        float _514 = _500 * _500;
        _478 = _514;
    }
    float _516 = _478;
    if (_382)
    {
        float _518 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _520 = _492 + _518;
        _494 = _520;
    }
    float _522 = _494;
    if (_382)
    {
        float _524 = fma(_510, _510, _516);
        _406 = _524;
    }
    float _526 = _406;
    float _528 = sqrt(_502);
    float _530 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _532 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = 0.0;
    float _536 = (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _538 = (*spvDescriptorSet0.vp_c12)._m0[3].z;
    if (_382)
    {
        float _540 = fma(_522, _522, _526);
        _534 = _540;
    }
    float _542 = _534;
    float _544 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _546 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _548 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _550 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _552 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _554 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _556 = _542;
    float _558 = (*spvDescriptorSet0.vp_c12)._m0[3].w;
    if (_382)
    {
        float _560 = rsqrt(_542);
        _556 = _560;
    }
    float _562 = _556;
    out.m_56.x = _530;
    out.m_56.y = _532;
    out.m_56.z = _544;
    out.m_56.w = _546;
    bool _564 = _528 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _566 = isnan(_528);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _572 = _568 || _570;
    if (!_382)
    {
        _536 = 0.0;
        _538 = 0.0;
    }
    float _574 = _536;
    float _576 = _538;
    float _578 = _576;
    float _580 = _574;
    if (!_382)
    {
        _504 = 0.0;
    }
    float _582 = _504;
    out.m_58.x = _548;
    out.m_58.y = _550;
    out.m_58.z = _552;
    out.m_58.w = _554;
    float _584 = _582;
    if (_382)
    {
        float _586 = _562 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _558 = _586;
    }
    float _588 = _558;
    if (_382)
    {
        float _590 = _510 * _588;
        _578 = _590;
    }
    float _592 = _578;
    if (_382)
    {
        float _594 = _500 * _588;
        _580 = _594;
    }
    float _596 = _580;
    if (_382)
    {
        float _598 = _522 * _588;
        _584 = _598;
    }
    float _600 = _584;
    if (!_572)
    {
        _512 = 1.0;
    }
    float _602 = _512;
    bool _604 = !_572;
    float _606 = _602;
    if (!_604)
    {
        bool _608 = _528 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _610 = isnan(_528);
        bool _612 = _608 || _610;
        bool _614 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _616 = _612 || _614;
        if (!_616)
        {
            float _618 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _620 = _528 + _618;
            float _622 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _624 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _622;
            float _626 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _628 = _626 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _630 = 1.0 / _624;
            float _632 = _620 * _630;
            float _634 = fma(_632, _628, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _606 = _634;
            _636 = true;
        }
        else
        {
            bool _638 = _528 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _640 = isnan(_528);
            bool _642 = _638 || _640;
            bool _644 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _646 = _642 || _644;
            if (!_646)
            {
                float _648 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _650 = _528 + _648;
                float _652 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _654 = _652 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _656 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _658 = _656 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _660 = 1.0 / _654;
                float _662 = _650 * _660;
                float _664 = fma(_662, _658, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _606 = _664;
                _636 = true;
            }
            else
            {
                _606 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _636 = false;
    float _666 = _606;
    float _668 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _670 = _464 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _674 = _470 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _678 = _472 + _676;
    float _680 = fma(_670, _666, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _682 = fma(_674, _666, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _684 = fma(_678, _666, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _686 = _680 + _596;
    float _688 = _682 + _592;
    float _690 = _684 + _600;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _694 = _686 + _692;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _698 = _688 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _702 = _690 + _700;
    float _704 = _694 * _694;
    float _706 = fma(_698, _698, _704);
    float _708 = fma(_702, _702, _706);
    float _710 = rsqrt(_708);
    float _712 = _710 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _714 = _698 * _712;
    float _716 = _702 * _712;
    float _718 = _714 * _714;
    float _720 = _716 * _716;
    float _722 = _718 + _720;
    float _724 = sqrt(_722);
    bool _726 = _724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _730 = _724 + _728;
    float _732 = _702;
    float _734 = _722;
    float _736 = _730;
    float _738 = _712;
    bool _740 = _726;
    if (_726)
    {
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _732 = _742;
    }
    float _744 = _732;
    if (_726)
    {
        float _746 = rsqrt(_722);
        _734 = _746;
    }
    float _748 = _734;
    if (_726)
    {
        float _750 = _730 * _744;
        _736 = _750;
    }
    float _752 = _736;
    if (_726)
    {
        float _754 = _752 * 0.15915493667125701904296875;
        _480 = _754;
    }
    float _756 = _480;
    float _758 = _704;
    float _760 = _756;
    if (_726)
    {
        float _762 = _756 * 6.283185482025146484375;
        float _764 = sin(_762);
        _758 = _764;
    }
    float _766 = _758;
    float _768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _770 = precise::max(0.0, _768);
    float _772 = _710;
    float _774 = _770;
    float _776 = _768;
    if (_726)
    {
        float _778 = _756 * 6.283185482025146484375;
        float _780 = cos(_778);
        _772 = _780;
    }
    float _782 = _772;
    float _784 = -_712;
    float _786 = -_770;
    float _788 = fma(_694, _784, _786);
    float _790 = _788;
    if (!_726)
    {
        _774 = _714;
    }
    float _792 = _774;
    float _794 = _792;
    if (_726)
    {
        float _796 = _788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _776 = _796;
    }
    float _798 = _776;
    float _800 = _766;
    float _802 = _798;
    if (_726)
    {
        float _804 = fma(_766, _798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _800 = _804;
    }
    float _806 = _800;
    float _808 = _806;
    float _810 = _782;
    if (_726)
    {
        float _812 = _782 + (-1.0);
        _802 = _812;
    }
    float _814 = _802;
    float _816 = _814;
    if (_726)
    {
        float _818 = _748 * _806;
        _738 = _818;
    }
    float _820 = _738;
    if (!_726)
    {
        _808 = _718;
    }
    float _822 = _808;
    float _824 = sqrt(_708);
    float _826 = _822;
    if (_726)
    {
        float _828 = _814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _760 = _828;
    }
    float _830 = _760;
    if (_726)
    {
        float _832 = _714 * _820;
        _794 = _832;
    }
    float _834 = _794;
    if (!_726)
    {
        _816 = _716;
    }
    float _836 = _816;
    float _838 = _836;
    if (_726)
    {
        float _840 = _716 * _820;
        _838 = _840;
    }
    float _842 = _838;
    if (_726)
    {
        float _844 = fma(_788, _782, _830);
        _790 = _844;
    }
    float _846 = _790;
    if (_726)
    {
        float _848 = _834 * _834;
        _826 = _848;
    }
    float _850 = _826;
    if (!_726)
    {
        _810 = _720;
    }
    float _852 = _810;
    float _854 = _852;
    if (_726)
    {
        float _856 = _842 * _842;
        _854 = _856;
    }
    float _858 = _854;
    float _860 = fma(_846, _846, _850);
    float _862 = _860 + _858;
    float _864 = _686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _866 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _868 = fma(_824, (*spvDescriptorSet0.vp_c15)._m0[23].w, _866);
    float _870 = precise::clamp(_868, 0.0, 1.0);
    float _872 = _686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _874 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _876 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[2].x, _864);
    float _878 = rsqrt(_862);
    float _880 = -_870;
    float _882 = _880 + 1.0;
    float _884 = _686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _886 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[2].z, _876);
    float _888 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _872);
    float _890 = _686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _892 = _886 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _894 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _884);
    float _896 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _888);
    float _898 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[3].x, _890);
    float _900 = abs(_882);
    float _902 = log2(_900);
    float _904 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[0].z, _894);
    float _906 = _896 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _908 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[3].z, _898);
    float _910 = _892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _912 = _904 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _914 = _906 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _916 = _878 * _834;
    float _918 = _908 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _920 = -_910;
    float _922 = fma(_920, _874, 1.0);
    float _924 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].x, _914);
    float _926 = _878 * _846;
    float _928 = _916 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _930 = _878 * _842;
    float _932 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _924);
    float _934 = log2(_922);
    float _936 = -_928;
    float _938 = fma(_926, (*spvDescriptorSet0.vp_c15)._m0[21].y, _936);
    float _940 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _942 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[7].w, _932);
    float _944 = _906 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _946 = -_930;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _938);
    float _950 = _906 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _952 = 1.0 / _942;
    float _954 = fma(_948, -0.5, 0.5);
    float _956 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].x, _944);
    float _958 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].x, _950);
    float _960 = fma(_948, 0.5, 0.5);
    float _962 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _956);
    float _964 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _958);
    float _966 = exp2(_940);
    float _968 = fma(_960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _970 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[4].w, _962);
    float _972 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[5].w, _964);
    float _974 = _934 * 0.693147182464599609375;
    float _976 = fma(_960, _968, -0.212114393711090087890625);
    float _978 = sqrt(_954);
    float _980 = _926 + 1.0;
    float _982 = _972 * _952;
    float _984 = fma(_960, _976, 1.570728778839111328125);
    float _986 = _970 * _952;
    float _988 = _974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _990 = fma(_982, -0.5, 0.5);
    float _992 = -_926;
    float _994 = fma(_966, _980, _992);
    float _996 = fma(_986, 0.5, 0.5);
    float _998 = fma(_994, 0.5, 0.5);
    float _1000 = _978 * 0.636619746685028076171875;
    float _1002 = -_984;
    float _1004 = fma(_1000, _1002, 1.0);
    float3 _3061 = float3(_996, _990, _988);
    float _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3061, float3(0.0), isnan(_3061)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3061, float3(0.0), isnan(_3061)), level(0.0)).x;
    float3 _3072 = float3(_996, _990, _988);
    float4 _1009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3072, float3(0.0), isnan(_3072)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3072, float3(0.0), isnan(_3072)), level(0.0)).xyzw;
    float _1011 = _1009.x;
    float _1013 = _1009.y;
    float _1015 = _1009.z;
    float _1017 = _1009.w;
    float2 _3089 = float2(_1004, _998);
    float3 _1021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3089, float2(0.0), isnan(_3089)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3089, float2(0.0), isnan(_3089)), level(0.0)).xyz;
    float _1023 = _1021.x;
    float _1025 = _1021.y;
    float _1027 = _1021.z;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1031 = _1029 != 0;
    float _1033 = _106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1037 = _1035 != 0;
    float _1039 = _106 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1041 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1033);
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1045 = _1043 != 0;
    float _1047 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1039);
    float _1049 = _106 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1053 = _1051 != 0;
    float _1055 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1057 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1049);
    float _1059 = _976;
    bool _1061 = _1031;
    float _1063 = _1041;
    float _1065 = _1047;
    if (_1031)
    {
        _1059 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1067 = _1059;
    float _1069 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1073 = _1071 != 0;
    float _1075 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1057);
    if (_1031)
    {
        bool _1077 = _1067 > 0.5;
        _740 = _1077;
    }
    bool _1079 = _740;
    float _1081 = _106 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_1031)
    {
        float _1083 = -_170;
        float _1085 = (-0.0) + _1083;
        _302 = _1085;
    }
    float _1087 = _302;
    float _1089 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1091 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1081);
    float _1093 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1095 = _1087;
    if (_1037)
    {
        _304 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1097 = _304;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    if (_1031)
    {
        float _1101 = -_170;
        float _1103 = _1079 ? _170 : _1101;
        _1095 = _1103;
    }
    float _1105 = _1095;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1109 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.5);
    bool _1117 = _1113 || _1115;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1121 = !_160;
    float _1123 = _1121 ? 0.0 : 1.0;
    float _1125 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1099);
    float _1127 = _1123;
    if (_1037)
    {
        bool _1129 = _1097 > 0.5;
        _306 = _1129;
    }
    bool _1131 = _306;
    float _1133 = -_1107;
    float _1135 = fma(_1119, 2.0, _1133);
    float _1137 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1091);
    float _1139 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1047);
    if (_1045)
    {
        _408 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1141 = _408;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1149 = fma(_1145, -2.0, _1143);
    float _1151 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1155 = _1141;
    float _1157 = _1145;
    if (_1045)
    {
        bool _1159 = _1141 > 0.5;
        _1061 = _1159;
    }
    bool _1161 = _1061;
    float _1163 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1147);
    bool _1165 = _1161;
    if (!_1053)
    {
        _1063 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1167 = _1063;
    float _1169 = fma(_266, _1153, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1171 = _1167;
    if (_1073)
    {
        _1155 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1173 = _1155;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_1053)
    {
        _1171 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1177 = _1171;
    float _1179 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1125);
    if (!_1053)
    {
        _1065 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1181 = _1065;
    float _1183 = _1181;
    if (!_1073)
    {
        float _1185 = -_176;
        float _1187 = (-0.0) + _1185;
        _1157 = _1187;
    }
    float _1189 = _1157;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1175);
    float _1193 = _1189;
    if (_1053)
    {
        _1183 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1195 = _1183;
    float _1197 = _1179 * (-0.15915493667125701904296875);
    if (!_1045)
    {
        _322 = _1123;
    }
    float _1199 = _322;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1203 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1205 = _1199;
    float _1207 = _1201;
    if (_1045)
    {
        float _1209 = -_1123;
        float _1211 = _1161 ? _1209 : _1123;
        _1205 = _1211;
    }
    float _1213 = _1205;
    float _1215 = _1197 * 6.283185482025146484375;
    float _1217 = sin(_1215);
    if (_1073)
    {
        bool _1219 = _1173 > 0.5;
        _1165 = _1219;
    }
    bool _1221 = _1165;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1225 = 0.0;
    if (!_1053)
    {
        _1225 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1227 = _1225;
    float _1229 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1231 = _1227;
    if (_1053)
    {
        _1231 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1233 = _1231;
    float _1235 = -_1223;
    float _1237 = fma(_1203, 2.0, _1235);
    if (_1073)
    {
        float _1239 = -_176;
        float _1241 = _1221 ? _176 : _1239;
        _1193 = _1241;
    }
    float _1243 = _1193;
    float _1245 = _1197 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1201);
    if (!_1053)
    {
        _1207 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1251 = _1207;
    float _1253 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1191);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1257 = 0.0;
    float _1259 = _1251;
    if (!_1053)
    {
        _1257 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1261 = _1257;
    float _1263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1267 = _1261;
    if (_1053)
    {
        _1259 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1269 = _1259;
    float _1271 = _1105 + 0.5;
    if (_1053)
    {
        _1267 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1273 = _1267;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1277 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1265);
    float _1279 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1281 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1163);
    float _1283 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1255);
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1287 = fma(_1279, -2.0, _1275);
    float _1289 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1089);
    float _1291 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1283);
    float _1293 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1093);
    float _1295 = _1253 * (-0.15915493667125701904296875);
    float _1297 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1299 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1135);
    float _1301 = _1213 + (-0.5);
    float _1303 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1149);
    float _1305 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1277);
    float _1307 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1249);
    float _1309 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1237);
    float _1311 = _1271 * _1217;
    float _1313 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1287);
    float _1315 = _1295 * 6.283185482025146484375;
    float _1317 = sin(_1315);
    float _1319 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1289);
    float _1321 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1293);
    float _1323 = _1271 * _1247;
    float _1325 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1327 = -_1311;
    float _1329 = fma(_1301, _1247, _1327);
    float _1331 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1333 = _906 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1335 = _1295 * 6.283185482025146484375;
    float _1337 = cos(_1335);
    float _1339 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1319);
    float _1341 = _1329 + 0.5;
    float _1343 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1321);
    float _1345 = fma(_1301, _1217, _1323);
    float _1347 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1333);
    float _1349 = fma(_1331, _1341, _1299);
    if (_1037)
    {
        float _1351 = -_1123;
        float _1353 = _1131 ? _1351 : _1123;
        _1127 = _1353;
    }
    float _1355 = _1127;
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1359 = _1345 + (-0.5);
    float _1361 = _1339 + _1343;
    float _1363 = _1243 + 0.5;
    float _1365 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1367 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1369 = _1355 + (-0.5);
    float _1371 = _1363 * _1317;
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1375 = -_1365;
    float _1377 = -_1303;
    float _1379 = fma(_1375, _1359, _1377);
    float _1381 = _1363 * _1337;
    float _1383 = -_1371;
    float _1385 = fma(_1369, _1337, _1383);
    float _1387 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1347);
    float _1389 = -_1281;
    float _1391 = _1389 + 1.0;
    float _1393 = fma(_1369, _1317, _1381);
    float _1395 = 1.0 / _1343;
    float _1397 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1399 = _1385 + 0.5;
    float _1401 = _1393 + (-0.5);
    float _1403 = fma(_1397, _1399, _1309);
    float _1405 = _1399;
    if (_1117)
    {
        _1405 = 1.0;
    }
    float _1407 = _1405;
    float _1409 = exp2(_1367);
    float _1411 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1413 = -_1411;
    float _1415 = -_1313;
    float _1417 = fma(_1413, _1401, _1415);
    float _1419 = _1361 * _1395;
    float _1421 = _1419 * 0.5;
    float _1423 = _1407;
    if (!_1117)
    {
        float _1425 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1427 = _1425 * 0.15915493667125701904296875;
        float _1429 = _1427 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        float _1433 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1435 = _1433 * 0.15915493667125701904296875;
        float _1437 = _1427 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1443 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1441);
        float _1445 = 1.0 / _1431;
        float _1447 = _1435 * 6.283185482025146484375;
        float _1449 = cos(_1447);
        float _1451 = _1439 * _1445;
        float _1453 = 1.0 / _1443;
        float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1457 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1455;
        float _1459 = _1449 * _1451;
        float _1461 = _1435 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = 1.0 / _1459;
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1469 = _1453 * _1467;
        float _1471 = 1.0 / _1457;
        float _1473 = _1463 * _1465;
        float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1477 = fma(_1473, _1469, _1475);
        float _1479 = _1477 * _1471;
        float _1481 = precise::clamp(_1479, 0.0, 1.0);
        float _1483 = -_1481;
        float _1485 = _1483 + 1.0;
        _1423 = _1485;
    }
    float _1487 = _1423;
    float _1489 = -_1409;
    float _1491 = _1489 + 1.0;
    float _1493 = -_1307;
    float _1495 = _1493 + 1.0;
    float _1497 = _1169 * _1487;
    float _1499 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1387);
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1503 = fma(_1393, _1495, _1417);
    float _1505 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1507 = -_1305;
    float _1509 = _1507 + 1.0;
    float _1511 = _1501 * _1006;
    float _1513 = -_1501;
    float _1515 = _1513 + 1.0;
    float _1517 = -_1291;
    float _1519 = _1517 + 1.0;
    float _1521 = _1499 + _942;
    float _1523 = _1017 * _1511;
    float _1525 = _1027 * _1511;
    float _1527 = -_1391;
    float _1529 = fma(_1329, _1527, _1349);
    out.gl_Position.x = _970;
    out.gl_Position.y = _972;
    out.gl_Position.z = _1499;
    out.gl_Position.w = _942;
    float _1531 = fma(_1023, _1523, _1011);
    float _1533 = fma(_1025, _1523, _1013);
    float _1535 = _1017 * _1515;
    float _1537 = fma(_1345, _1509, _1379);
    float _1539 = -_1519;
    float _1541 = fma(_1385, _1539, _1403);
    float _1543 = _1521 * 0.5;
    float _1545 = _1505 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1547 = fma(_1017, _1525, _1015);
    out.m_60.x = _1529;
    out.m_60.y = _1537;
    out.m_60.z = _1541;
    out.m_60.w = _1503;
    out.m_62.z = _1543;
    out.m_62.w = _942;
    out.m_64.x = _1545;
    out.m_66.x = _1531;
    out.m_66.y = _1533;
    out.m_66.z = _1547;
    out.m_66.w = _1535;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _636 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = as_type<float>(int(gl_VertexIndex));
    float _82 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    int _89 = as_type<int>(_80) >> 2;
    int _91 = _89 + _87;
    int _93 = _91 * 96;
    int _95 = _93 + 32;
    uint _98 = uint(int(uint(_93) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_98)];
    float _100 = as_type<float>(_dmw0.x);
    int _102 = _93 + 4;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>(_dmw0.y);
    int _108 = _93 + 8;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw0.z);
    int _114 = _93 + 12;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw0.w);
    uint _120 = uint(int(uint(_95) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_120)];
    float _122 = as_type<float>(_dmw2.x);
    int _124 = _95 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw2.y);
    int _130 = _95 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw2.z);
    int _136 = _93 + 16;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_138)];
    float _140 = as_type<float>(_dmw1.x);
    int _142 = _136 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw1.y);
    int _148 = _136 + 8;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    float _152 = as_type<float>(_dmw1.z);
    int _154 = _93 + 48;
    int _156 = as_type<int>(_80) & 2;
    bool _160 = _156 != 0;
    int _162 = as_type<int>(_80) & 1;
    bool _164 = _162 != 0;
    float _166 = float(_89);
    uint _168 = uint(int(uint(_154) >> uint(2)));
    packed_uint2 _dmw3 = *(const device packed_uint2*)&(*spvDescriptorSet0.vp_s0)._m0[int(_168)];
    float _170 = as_type<float>(_dmw3.x);
    int _172 = _154 + 4;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>(_dmw3.y);
    float _178 = -_106;
    float _180 = _178 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _182 = _180 * _180;
    float _184 = _128 * _128;
    float _186 = -_100;
    float _188 = _186 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _190 = fma(_122, _122, _184);
    float _192 = -_112;
    float _194 = _192 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _196 = fma(_188, _188, _182);
    float _198 = fma(_134, _134, _190);
    float _200 = fma(_194, _194, _196);
    float _202 = rsqrt(_198);
    float _204 = rsqrt(_200);
    float _206 = _134 * _202;
    float _208 = _128 * _202;
    float _210 = _122 * _202;
    float _212 = _188 * _204;
    float _214 = _194 * _204;
    float _216 = _180 * _204;
    float _218 = _212 * _206;
    float _220 = _214 * _208;
    float _222 = -_218;
    float _224 = fma(_214, _210, _222);
    float _226 = _216 * _210;
    float _228 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _230 = -_220;
    float _232 = fma(_216, _206, _230);
    float _234 = _224 * _224;
    float _236 = -_226;
    float _238 = fma(_212, _208, _236);
    float _240 = _146 * _146;
    float _242 = fma(_232, _232, _234);
    float _244 = fma(_140, _140, _240);
    float _246 = fma(_238, _238, _242);
    float _248 = 1.0 / _228;
    float _250 = fma(_152, _152, _244);
    float _252 = rsqrt(_246);
    bool _254 = !_160;
    float _256 = _254 ? 1.0 : (-1.0);
    float _258 = rsqrt(_250);
    float _260 = abs(_118);
    float _262 = _260 * _256;
    float _264 = _262 * 0.5;
    float _266 = _166 * _248;
    float _268 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _270 = _268 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _272 = _232 * _252;
    float _274 = _224 * _252;
    float _276 = _238 * _252;
    float _278 = fma(_266, _270, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _280 = _140 * _258;
    float _282 = _146 * _258;
    float _284 = _152 * _258;
    float _286 = _278 * _264;
    float _288 = _146;
    float _290 = _152;
    float _292 = _140;
    float _294 = _264;
    float _296 = _272;
    float _298 = _286;
    float _300 = _80;
    float _302 = _106;
    float _304 = _100;
    bool _306 = _160;
    if (!_164)
    {
        _288 = _272;
    }
    float _308 = _288;
    float _310 = _308;
    if (!_164)
    {
        _290 = _274;
    }
    float _312 = _290;
    float _314 = _312;
    if (!_164)
    {
        _292 = _276;
    }
    float _316 = _292;
    bool _318 = !_164;
    float _320 = _316;
    float _322 = _170;
    if (!_318)
    {
        float _324 = _284 * _272;
        float _326 = _282 * _276;
        float _328 = -_324;
        float _330 = fma(_280, _276, _328);
        float _332 = _280 * _274;
        float _334 = -_326;
        float _336 = fma(_284, _274, _334);
        float _338 = _330 * _330;
        float _340 = -_332;
        float _342 = fma(_282, _272, _340);
        float _344 = fma(_336, _336, _338);
        float _346 = fma(_342, _342, _344);
        float _348 = rsqrt(_346);
        float _350 = _336 * _348;
        float _352 = _330 * _348;
        float _354 = _342 * _348;
        _320 = _354;
        _310 = _350;
        _314 = _352;
    }
    float _356 = _320;
    float _358 = _310;
    float _360 = _314;
    float _362 = _356 * _264;
    float _364 = -_286;
    float _366 = fma(_358, _364, _100);
    float _368 = -_286;
    float _370 = fma(_360, _368, _106);
    float _372 = -_362;
    float _374 = fma(_278, _372, _112);
    float _376 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _378 = _366 + _376;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _382 = _380 != 0;
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _386 = _374 + _384;
    float _388 = _378 * _378;
    float _390 = _386 * _386;
    float _392 = _388 + _390;
    float _394 = sqrt(_392);
    bool _396 = _394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _398 = _388;
    float _400 = _390;
    float _402 = _366;
    float _404 = _374;
    float _406 = _378;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_396)
    {
        _294 = _370;
    }
    float _410 = _294;
    bool _412 = !_396;
    float _414 = _410;
    if (!_412)
    {
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _420 = _394 + _418;
        float _422 = _370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = rsqrt(_392);
        float _426 = _420 * _416;
        float _428 = _426 * 0.15915493667125701904296875;
        float _430 = _428 * 6.283185482025146484375;
        float _432 = sin(_430);
        float _434 = _428 * 6.283185482025146484375;
        float _436 = cos(_434);
        float _438 = fma(_432, _422, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _440 = _424 * _438;
        float _442 = _436 + (-1.0);
        float _444 = fma(_378, _440, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _446 = fma(_386, _440, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _448 = _442 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _452 = _444 + _450;
        float _454 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _456 = _446 + _454;
        float _458 = fma(_370, _436, _448);
        float _460 = _452 * _452;
        float _462 = _456 * _456;
        _414 = _458;
        _398 = _460;
        _400 = _462;
        _402 = _444;
        _404 = _446;
    }
    float _464 = _414;
    float _466 = _398;
    float _468 = _400;
    float _470 = _402;
    float _472 = _404;
    float _474 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _476 = _464 + _474;
    float _478 = _468;
    float _480 = _470;
    if (_382)
    {
        _296 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _482 = _296;
    float _484 = _482;
    if (_382)
    {
        _298 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _486 = _298;
    float _488 = fma(_476, _476, _466);
    float _490 = _486;
    if (_382)
    {
        _300 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _492 = _300;
    float _494 = _492;
    if (_382)
    {
        float _496 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _498 = _482 + _496;
        _484 = _498;
    }
    float _500 = _484;
    float _502 = _488 + _468;
    float _504 = _502;
    if (_382)
    {
        float _506 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _508 = _486 + _506;
        _490 = _508;
    }
    float _510 = _490;
    float _512 = _510;
    if (_382)
    {
        float _514 = _500 * _500;
        _478 = _514;
    }
    float _516 = _478;
    if (_382)
    {
        float _518 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _520 = _492 + _518;
        _494 = _520;
    }
    float _522 = _494;
    if (_382)
    {
        float _524 = fma(_510, _510, _516);
        _406 = _524;
    }
    float _526 = _406;
    float _528 = sqrt(_502);
    float _530 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _532 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = 0.0;
    float _536 = (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _538 = (*spvDescriptorSet0.vp_c12)._m0[3].z;
    if (_382)
    {
        float _540 = fma(_522, _522, _526);
        _534 = _540;
    }
    float _542 = _534;
    float _544 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _546 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _548 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _550 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _552 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _554 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _556 = _542;
    float _558 = (*spvDescriptorSet0.vp_c12)._m0[3].w;
    if (_382)
    {
        float _560 = rsqrt(_542);
        _556 = _560;
    }
    float _562 = _556;
    out.m_56.x = _530;
    out.m_56.y = _532;
    out.m_56.z = _544;
    out.m_56.w = _546;
    bool _564 = _528 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _566 = isnan(_528);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _572 = _568 || _570;
    if (!_382)
    {
        _536 = 0.0;
        _538 = 0.0;
    }
    float _574 = _536;
    float _576 = _538;
    float _578 = _576;
    float _580 = _574;
    if (!_382)
    {
        _504 = 0.0;
    }
    float _582 = _504;
    out.m_58.x = _548;
    out.m_58.y = _550;
    out.m_58.z = _552;
    out.m_58.w = _554;
    float _584 = _582;
    if (_382)
    {
        float _586 = _562 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _558 = _586;
    }
    float _588 = _558;
    if (_382)
    {
        float _590 = _510 * _588;
        _578 = _590;
    }
    float _592 = _578;
    if (_382)
    {
        float _594 = _500 * _588;
        _580 = _594;
    }
    float _596 = _580;
    if (_382)
    {
        float _598 = _522 * _588;
        _584 = _598;
    }
    float _600 = _584;
    if (!_572)
    {
        _512 = 1.0;
    }
    float _602 = _512;
    bool _604 = !_572;
    float _606 = _602;
    if (!_604)
    {
        bool _608 = _528 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _610 = isnan(_528);
        bool _612 = _608 || _610;
        bool _614 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _616 = _612 || _614;
        if (!_616)
        {
            float _618 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _620 = _528 + _618;
            float _622 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _624 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _622;
            float _626 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _628 = _626 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _630 = 1.0 / _624;
            float _632 = _620 * _630;
            float _634 = fma(_632, _628, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _606 = _634;
            _636 = true;
        }
        else
        {
            bool _638 = _528 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _640 = isnan(_528);
            bool _642 = _638 || _640;
            bool _644 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _646 = _642 || _644;
            if (!_646)
            {
                float _648 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _650 = _528 + _648;
                float _652 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _654 = _652 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _656 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _658 = _656 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _660 = 1.0 / _654;
                float _662 = _650 * _660;
                float _664 = fma(_662, _658, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _606 = _664;
                _636 = true;
            }
            else
            {
                _606 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _636 = false;
    float _666 = _606;
    float _668 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _670 = _464 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _674 = _470 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _678 = _472 + _676;
    float _680 = fma(_670, _666, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _682 = fma(_674, _666, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _684 = fma(_678, _666, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _686 = _680 + _596;
    float _688 = _682 + _592;
    float _690 = _684 + _600;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _694 = _686 + _692;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _698 = _688 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _702 = _690 + _700;
    float _704 = _694 * _694;
    float _706 = fma(_698, _698, _704);
    float _708 = fma(_702, _702, _706);
    float _710 = rsqrt(_708);
    float _712 = _710 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _714 = _698 * _712;
    float _716 = _702 * _712;
    float _718 = _714 * _714;
    float _720 = _716 * _716;
    float _722 = _718 + _720;
    float _724 = sqrt(_722);
    bool _726 = _724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _730 = _724 + _728;
    float _732 = _702;
    float _734 = _722;
    float _736 = _730;
    float _738 = _712;
    bool _740 = _726;
    if (_726)
    {
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _732 = _742;
    }
    float _744 = _732;
    if (_726)
    {
        float _746 = rsqrt(_722);
        _734 = _746;
    }
    float _748 = _734;
    if (_726)
    {
        float _750 = _730 * _744;
        _736 = _750;
    }
    float _752 = _736;
    if (_726)
    {
        float _754 = _752 * 0.15915493667125701904296875;
        _480 = _754;
    }
    float _756 = _480;
    float _758 = _704;
    float _760 = _756;
    if (_726)
    {
        float _762 = _756 * 6.283185482025146484375;
        float _764 = sin(_762);
        _758 = _764;
    }
    float _766 = _758;
    float _768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _770 = precise::max(0.0, _768);
    float _772 = _710;
    float _774 = _770;
    float _776 = _768;
    if (_726)
    {
        float _778 = _756 * 6.283185482025146484375;
        float _780 = cos(_778);
        _772 = _780;
    }
    float _782 = _772;
    float _784 = -_712;
    float _786 = -_770;
    float _788 = fma(_694, _784, _786);
    float _790 = _788;
    if (!_726)
    {
        _774 = _714;
    }
    float _792 = _774;
    float _794 = _792;
    if (_726)
    {
        float _796 = _788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _776 = _796;
    }
    float _798 = _776;
    float _800 = _766;
    float _802 = _798;
    if (_726)
    {
        float _804 = fma(_766, _798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _800 = _804;
    }
    float _806 = _800;
    float _808 = _806;
    float _810 = _782;
    if (_726)
    {
        float _812 = _782 + (-1.0);
        _802 = _812;
    }
    float _814 = _802;
    float _816 = _814;
    if (_726)
    {
        float _818 = _748 * _806;
        _738 = _818;
    }
    float _820 = _738;
    if (!_726)
    {
        _808 = _718;
    }
    float _822 = _808;
    float _824 = sqrt(_708);
    float _826 = _822;
    if (_726)
    {
        float _828 = _814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _760 = _828;
    }
    float _830 = _760;
    if (_726)
    {
        float _832 = _714 * _820;
        _794 = _832;
    }
    float _834 = _794;
    if (!_726)
    {
        _816 = _716;
    }
    float _836 = _816;
    float _838 = _836;
    if (_726)
    {
        float _840 = _716 * _820;
        _838 = _840;
    }
    float _842 = _838;
    if (_726)
    {
        float _844 = fma(_788, _782, _830);
        _790 = _844;
    }
    float _846 = _790;
    if (_726)
    {
        float _848 = _834 * _834;
        _826 = _848;
    }
    float _850 = _826;
    if (!_726)
    {
        _810 = _720;
    }
    float _852 = _810;
    float _854 = _852;
    if (_726)
    {
        float _856 = _842 * _842;
        _854 = _856;
    }
    float _858 = _854;
    float _860 = fma(_846, _846, _850);
    float _862 = _860 + _858;
    float _864 = _686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _866 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _868 = fma(_824, (*spvDescriptorSet0.vp_c15)._m0[23].w, _866);
    float _870 = precise::clamp(_868, 0.0, 1.0);
    float _872 = _686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _874 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _876 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[2].x, _864);
    float _878 = rsqrt(_862);
    float _880 = -_870;
    float _882 = _880 + 1.0;
    float _884 = _686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _886 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[2].z, _876);
    float _888 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _872);
    float _890 = _686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _892 = _886 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _894 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _884);
    float _896 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _888);
    float _898 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[3].x, _890);
    float _900 = abs(_882);
    float _902 = log2(_900);
    float _904 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[0].z, _894);
    float _906 = _896 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _908 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[3].z, _898);
    float _910 = _892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _912 = _904 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _914 = _906 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _916 = _878 * _834;
    float _918 = _908 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _920 = -_910;
    float _922 = fma(_920, _874, 1.0);
    float _924 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].x, _914);
    float _926 = _878 * _846;
    float _928 = _916 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _930 = _878 * _842;
    float _932 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _924);
    float _934 = log2(_922);
    float _936 = -_928;
    float _938 = fma(_926, (*spvDescriptorSet0.vp_c15)._m0[21].y, _936);
    float _940 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _942 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[7].w, _932);
    float _944 = _906 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _946 = -_930;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _938);
    float _950 = _906 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _952 = 1.0 / _942;
    float _954 = fma(_948, -0.5, 0.5);
    float _956 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].x, _944);
    float _958 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].x, _950);
    float _960 = fma(_948, 0.5, 0.5);
    float _962 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _956);
    float _964 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _958);
    float _966 = exp2(_940);
    float _968 = fma(_960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _970 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[4].w, _962);
    float _972 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[5].w, _964);
    float _974 = _934 * 0.693147182464599609375;
    float _976 = fma(_960, _968, -0.212114393711090087890625);
    float _978 = sqrt(_954);
    float _980 = _926 + 1.0;
    float _982 = _972 * _952;
    float _984 = fma(_960, _976, 1.570728778839111328125);
    float _986 = _970 * _952;
    float _988 = _974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _990 = fma(_982, -0.5, 0.5);
    float _992 = -_926;
    float _994 = fma(_966, _980, _992);
    float _996 = fma(_986, 0.5, 0.5);
    float _998 = fma(_994, 0.5, 0.5);
    float _1000 = _978 * 0.636619746685028076171875;
    float _1002 = -_984;
    float _1004 = fma(_1000, _1002, 1.0);
    float3 _3061 = float3(_996, _990, _988);
    float _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3061, float3(0.0), isnan(_3061)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3061, float3(0.0), isnan(_3061)), level(0.0)).x;
    float3 _3072 = float3(_996, _990, _988);
    float4 _1009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3072, float3(0.0), isnan(_3072)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3072, float3(0.0), isnan(_3072)), level(0.0)).xyzw;
    float _1011 = _1009.x;
    float _1013 = _1009.y;
    float _1015 = _1009.z;
    float _1017 = _1009.w;
    float2 _3089 = float2(_1004, _998);
    float3 _1021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3089, float2(0.0), isnan(_3089)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3089, float2(0.0), isnan(_3089)), level(0.0)).xyz;
    float _1023 = _1021.x;
    float _1025 = _1021.y;
    float _1027 = _1021.z;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1031 = _1029 != 0;
    float _1033 = _106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1037 = _1035 != 0;
    float _1039 = _106 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1041 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1033);
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1045 = _1043 != 0;
    float _1047 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1039);
    float _1049 = _106 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1053 = _1051 != 0;
    float _1055 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1057 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1049);
    float _1059 = _976;
    bool _1061 = _1031;
    float _1063 = _1041;
    float _1065 = _1047;
    if (_1031)
    {
        _1059 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1067 = _1059;
    float _1069 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1073 = _1071 != 0;
    float _1075 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1057);
    if (_1031)
    {
        bool _1077 = _1067 > 0.5;
        _740 = _1077;
    }
    bool _1079 = _740;
    float _1081 = _106 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_1031)
    {
        float _1083 = -_170;
        float _1085 = (-0.0) + _1083;
        _302 = _1085;
    }
    float _1087 = _302;
    float _1089 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1091 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1081);
    float _1093 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1095 = _1087;
    if (_1037)
    {
        _304 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1097 = _304;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    if (_1031)
    {
        float _1101 = -_170;
        float _1103 = _1079 ? _170 : _1101;
        _1095 = _1103;
    }
    float _1105 = _1095;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1109 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.5);
    bool _1117 = _1113 || _1115;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1121 = !_160;
    float _1123 = _1121 ? 0.0 : 1.0;
    float _1125 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1099);
    float _1127 = _1123;
    if (_1037)
    {
        bool _1129 = _1097 > 0.5;
        _306 = _1129;
    }
    bool _1131 = _306;
    float _1133 = -_1107;
    float _1135 = fma(_1119, 2.0, _1133);
    float _1137 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1091);
    float _1139 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1047);
    if (_1045)
    {
        _408 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1141 = _408;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1149 = fma(_1145, -2.0, _1143);
    float _1151 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1155 = _1141;
    float _1157 = _1145;
    if (_1045)
    {
        bool _1159 = _1141 > 0.5;
        _1061 = _1159;
    }
    bool _1161 = _1061;
    float _1163 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1147);
    bool _1165 = _1161;
    if (!_1053)
    {
        _1063 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1167 = _1063;
    float _1169 = fma(_266, _1153, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1171 = _1167;
    if (_1073)
    {
        _1155 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1173 = _1155;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_1053)
    {
        _1171 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1177 = _1171;
    float _1179 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1125);
    if (!_1053)
    {
        _1065 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1181 = _1065;
    float _1183 = _1181;
    if (!_1073)
    {
        float _1185 = -_176;
        float _1187 = (-0.0) + _1185;
        _1157 = _1187;
    }
    float _1189 = _1157;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1175);
    float _1193 = _1189;
    if (_1053)
    {
        _1183 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1195 = _1183;
    float _1197 = _1179 * (-0.15915493667125701904296875);
    if (!_1045)
    {
        _322 = _1123;
    }
    float _1199 = _322;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1203 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1205 = _1199;
    float _1207 = _1201;
    if (_1045)
    {
        float _1209 = -_1123;
        float _1211 = _1161 ? _1209 : _1123;
        _1205 = _1211;
    }
    float _1213 = _1205;
    float _1215 = _1197 * 6.283185482025146484375;
    float _1217 = sin(_1215);
    if (_1073)
    {
        bool _1219 = _1173 > 0.5;
        _1165 = _1219;
    }
    bool _1221 = _1165;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1225 = 0.0;
    if (!_1053)
    {
        _1225 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1227 = _1225;
    float _1229 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1231 = _1227;
    if (_1053)
    {
        _1231 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1233 = _1231;
    float _1235 = -_1223;
    float _1237 = fma(_1203, 2.0, _1235);
    if (_1073)
    {
        float _1239 = -_176;
        float _1241 = _1221 ? _176 : _1239;
        _1193 = _1241;
    }
    float _1243 = _1193;
    float _1245 = _1197 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1201);
    if (!_1053)
    {
        _1207 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1251 = _1207;
    float _1253 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1191);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1257 = 0.0;
    float _1259 = _1251;
    if (!_1053)
    {
        _1257 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1261 = _1257;
    float _1263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1267 = _1261;
    if (_1053)
    {
        _1259 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1269 = _1259;
    float _1271 = _1105 + 0.5;
    if (_1053)
    {
        _1267 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1273 = _1267;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1277 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1265);
    float _1279 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1281 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1163);
    float _1283 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1255);
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1287 = fma(_1279, -2.0, _1275);
    float _1289 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1089);
    float _1291 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1283);
    float _1293 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1093);
    float _1295 = _1253 * (-0.15915493667125701904296875);
    float _1297 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1299 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1135);
    float _1301 = _1213 + (-0.5);
    float _1303 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1149);
    float _1305 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1277);
    float _1307 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1249);
    float _1309 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1237);
    float _1311 = _1271 * _1217;
    float _1313 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1287);
    float _1315 = _1295 * 6.283185482025146484375;
    float _1317 = sin(_1315);
    float _1319 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1289);
    float _1321 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1293);
    float _1323 = _1271 * _1247;
    float _1325 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1327 = -_1311;
    float _1329 = fma(_1301, _1247, _1327);
    float _1331 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1333 = _906 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1335 = _1295 * 6.283185482025146484375;
    float _1337 = cos(_1335);
    float _1339 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1319);
    float _1341 = _1329 + 0.5;
    float _1343 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1321);
    float _1345 = fma(_1301, _1217, _1323);
    float _1347 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1333);
    float _1349 = fma(_1331, _1341, _1299);
    if (_1037)
    {
        float _1351 = -_1123;
        float _1353 = _1131 ? _1351 : _1123;
        _1127 = _1353;
    }
    float _1355 = _1127;
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1359 = _1345 + (-0.5);
    float _1361 = _1339 + _1343;
    float _1363 = _1243 + 0.5;
    float _1365 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1367 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1369 = _1355 + (-0.5);
    float _1371 = _1363 * _1317;
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1375 = -_1365;
    float _1377 = -_1303;
    float _1379 = fma(_1375, _1359, _1377);
    float _1381 = _1363 * _1337;
    float _1383 = -_1371;
    float _1385 = fma(_1369, _1337, _1383);
    float _1387 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1347);
    float _1389 = -_1281;
    float _1391 = _1389 + 1.0;
    float _1393 = fma(_1369, _1317, _1381);
    float _1395 = 1.0 / _1343;
    float _1397 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1399 = _1385 + 0.5;
    float _1401 = _1393 + (-0.5);
    float _1403 = fma(_1397, _1399, _1309);
    float _1405 = _1399;
    if (_1117)
    {
        _1405 = 1.0;
    }
    float _1407 = _1405;
    float _1409 = exp2(_1367);
    float _1411 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1413 = -_1411;
    float _1415 = -_1313;
    float _1417 = fma(_1413, _1401, _1415);
    float _1419 = _1361 * _1395;
    float _1421 = _1419 * 0.5;
    float _1423 = _1407;
    if (!_1117)
    {
        float _1425 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1427 = _1425 * 0.15915493667125701904296875;
        float _1429 = _1427 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        float _1433 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1435 = _1433 * 0.15915493667125701904296875;
        float _1437 = _1427 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1443 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1441);
        float _1445 = 1.0 / _1431;
        float _1447 = _1435 * 6.283185482025146484375;
        float _1449 = cos(_1447);
        float _1451 = _1439 * _1445;
        float _1453 = 1.0 / _1443;
        float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1457 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1455;
        float _1459 = _1449 * _1451;
        float _1461 = _1435 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = 1.0 / _1459;
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1469 = _1453 * _1467;
        float _1471 = 1.0 / _1457;
        float _1473 = _1463 * _1465;
        float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1477 = fma(_1473, _1469, _1475);
        float _1479 = _1477 * _1471;
        float _1481 = precise::clamp(_1479, 0.0, 1.0);
        float _1483 = -_1481;
        float _1485 = _1483 + 1.0;
        _1423 = _1485;
    }
    float _1487 = _1423;
    float _1489 = -_1409;
    float _1491 = _1489 + 1.0;
    float _1493 = -_1307;
    float _1495 = _1493 + 1.0;
    float _1497 = _1169 * _1487;
    float _1499 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1387);
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1503 = fma(_1393, _1495, _1417);
    float _1505 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1507 = -_1305;
    float _1509 = _1507 + 1.0;
    float _1511 = _1501 * _1006;
    float _1513 = -_1501;
    float _1515 = _1513 + 1.0;
    float _1517 = -_1291;
    float _1519 = _1517 + 1.0;
    float _1521 = _1499 + _942;
    float _1523 = _1017 * _1511;
    float _1525 = _1027 * _1511;
    float _1527 = -_1391;
    float _1529 = fma(_1329, _1527, _1349);
    out.gl_Position.x = _970;
    out.gl_Position.y = _972;
    out.gl_Position.z = _1499;
    out.gl_Position.w = _942;
    float _1531 = fma(_1023, _1523, _1011);
    float _1533 = fma(_1025, _1523, _1013);
    float _1535 = _1017 * _1515;
    float _1537 = fma(_1345, _1509, _1379);
    float _1539 = -_1519;
    float _1541 = fma(_1385, _1539, _1403);
    float _1543 = _1521 * 0.5;
    float _1545 = _1505 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1547 = fma(_1017, _1525, _1015);
    out.m_60.x = _1529;
    out.m_60.y = _1537;
    out.m_60.z = _1541;
    out.m_60.w = _1503;
    out.m_62.z = _1543;
    out.m_62.w = _942;
    out.m_64.x = _1545;
    out.m_66.x = _1531;
    out.m_66.y = _1533;
    out.m_66.z = _1547;
    out.m_66.w = _1535;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _636 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = as_type<float>(int(gl_VertexIndex));
    float _82 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    int _89 = as_type<int>(_80) >> 2;
    int _91 = _89 + _87;
    int _93 = _91 * 96;
    int _95 = _93 + 32;
    uint _98 = uint(int(uint(_93) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_98)];
    float _100 = as_type<float>(_dmw0.x);
    int _102 = _93 + 4;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>(_dmw0.y);
    int _108 = _93 + 8;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw0.z);
    int _114 = _93 + 12;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw0.w);
    uint _120 = uint(int(uint(_95) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_120)];
    float _122 = as_type<float>(_dmw2.x);
    int _124 = _95 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw2.y);
    int _130 = _95 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw2.z);
    int _136 = _93 + 16;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_138)];
    float _140 = as_type<float>(_dmw1.x);
    int _142 = _136 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw1.y);
    int _148 = _136 + 8;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    float _152 = as_type<float>(_dmw1.z);
    int _154 = _93 + 48;
    int _156 = as_type<int>(_80) & 2;
    bool _160 = _156 != 0;
    int _162 = as_type<int>(_80) & 1;
    bool _164 = _162 != 0;
    float _166 = float(_89);
    uint _168 = uint(int(uint(_154) >> uint(2)));
    packed_uint2 _dmw3 = *(const device packed_uint2*)&(*spvDescriptorSet0.vp_s0)._m0[int(_168)];
    float _170 = as_type<float>(_dmw3.x);
    int _172 = _154 + 4;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>(_dmw3.y);
    float _178 = -_106;
    float _180 = _178 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _182 = _180 * _180;
    float _184 = _128 * _128;
    float _186 = -_100;
    float _188 = _186 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _190 = fma(_122, _122, _184);
    float _192 = -_112;
    float _194 = _192 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _196 = fma(_188, _188, _182);
    float _198 = fma(_134, _134, _190);
    float _200 = fma(_194, _194, _196);
    float _202 = rsqrt(_198);
    float _204 = rsqrt(_200);
    float _206 = _134 * _202;
    float _208 = _128 * _202;
    float _210 = _122 * _202;
    float _212 = _188 * _204;
    float _214 = _194 * _204;
    float _216 = _180 * _204;
    float _218 = _212 * _206;
    float _220 = _214 * _208;
    float _222 = -_218;
    float _224 = fma(_214, _210, _222);
    float _226 = _216 * _210;
    float _228 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _230 = -_220;
    float _232 = fma(_216, _206, _230);
    float _234 = _224 * _224;
    float _236 = -_226;
    float _238 = fma(_212, _208, _236);
    float _240 = _146 * _146;
    float _242 = fma(_232, _232, _234);
    float _244 = fma(_140, _140, _240);
    float _246 = fma(_238, _238, _242);
    float _248 = 1.0 / _228;
    float _250 = fma(_152, _152, _244);
    float _252 = rsqrt(_246);
    bool _254 = !_160;
    float _256 = _254 ? 1.0 : (-1.0);
    float _258 = rsqrt(_250);
    float _260 = abs(_118);
    float _262 = _260 * _256;
    float _264 = _262 * 0.5;
    float _266 = _166 * _248;
    float _268 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _270 = _268 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _272 = _232 * _252;
    float _274 = _224 * _252;
    float _276 = _238 * _252;
    float _278 = fma(_266, _270, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _280 = _140 * _258;
    float _282 = _146 * _258;
    float _284 = _152 * _258;
    float _286 = _278 * _264;
    float _288 = _146;
    float _290 = _152;
    float _292 = _140;
    float _294 = _264;
    float _296 = _272;
    float _298 = _286;
    float _300 = _80;
    float _302 = _106;
    float _304 = _100;
    bool _306 = _160;
    if (!_164)
    {
        _288 = _272;
    }
    float _308 = _288;
    float _310 = _308;
    if (!_164)
    {
        _290 = _274;
    }
    float _312 = _290;
    float _314 = _312;
    if (!_164)
    {
        _292 = _276;
    }
    float _316 = _292;
    bool _318 = !_164;
    float _320 = _316;
    float _322 = _170;
    if (!_318)
    {
        float _324 = _284 * _272;
        float _326 = _282 * _276;
        float _328 = -_324;
        float _330 = fma(_280, _276, _328);
        float _332 = _280 * _274;
        float _334 = -_326;
        float _336 = fma(_284, _274, _334);
        float _338 = _330 * _330;
        float _340 = -_332;
        float _342 = fma(_282, _272, _340);
        float _344 = fma(_336, _336, _338);
        float _346 = fma(_342, _342, _344);
        float _348 = rsqrt(_346);
        float _350 = _336 * _348;
        float _352 = _330 * _348;
        float _354 = _342 * _348;
        _320 = _354;
        _310 = _350;
        _314 = _352;
    }
    float _356 = _320;
    float _358 = _310;
    float _360 = _314;
    float _362 = _356 * _264;
    float _364 = -_286;
    float _366 = fma(_358, _364, _100);
    float _368 = -_286;
    float _370 = fma(_360, _368, _106);
    float _372 = -_362;
    float _374 = fma(_278, _372, _112);
    float _376 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _378 = _366 + _376;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _382 = _380 != 0;
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _386 = _374 + _384;
    float _388 = _378 * _378;
    float _390 = _386 * _386;
    float _392 = _388 + _390;
    float _394 = sqrt(_392);
    bool _396 = _394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _398 = _388;
    float _400 = _390;
    float _402 = _366;
    float _404 = _374;
    float _406 = _378;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_396)
    {
        _294 = _370;
    }
    float _410 = _294;
    bool _412 = !_396;
    float _414 = _410;
    if (!_412)
    {
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _420 = _394 + _418;
        float _422 = _370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = rsqrt(_392);
        float _426 = _420 * _416;
        float _428 = _426 * 0.15915493667125701904296875;
        float _430 = _428 * 6.283185482025146484375;
        float _432 = sin(_430);
        float _434 = _428 * 6.283185482025146484375;
        float _436 = cos(_434);
        float _438 = fma(_432, _422, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _440 = _424 * _438;
        float _442 = _436 + (-1.0);
        float _444 = fma(_378, _440, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _446 = fma(_386, _440, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _448 = _442 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _452 = _444 + _450;
        float _454 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _456 = _446 + _454;
        float _458 = fma(_370, _436, _448);
        float _460 = _452 * _452;
        float _462 = _456 * _456;
        _414 = _458;
        _398 = _460;
        _400 = _462;
        _402 = _444;
        _404 = _446;
    }
    float _464 = _414;
    float _466 = _398;
    float _468 = _400;
    float _470 = _402;
    float _472 = _404;
    float _474 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _476 = _464 + _474;
    float _478 = _468;
    float _480 = _470;
    if (_382)
    {
        _296 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _482 = _296;
    float _484 = _482;
    if (_382)
    {
        _298 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _486 = _298;
    float _488 = fma(_476, _476, _466);
    float _490 = _486;
    if (_382)
    {
        _300 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _492 = _300;
    float _494 = _492;
    if (_382)
    {
        float _496 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _498 = _482 + _496;
        _484 = _498;
    }
    float _500 = _484;
    float _502 = _488 + _468;
    float _504 = _502;
    if (_382)
    {
        float _506 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _508 = _486 + _506;
        _490 = _508;
    }
    float _510 = _490;
    float _512 = _510;
    if (_382)
    {
        float _514 = _500 * _500;
        _478 = _514;
    }
    float _516 = _478;
    if (_382)
    {
        float _518 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _520 = _492 + _518;
        _494 = _520;
    }
    float _522 = _494;
    if (_382)
    {
        float _524 = fma(_510, _510, _516);
        _406 = _524;
    }
    float _526 = _406;
    float _528 = sqrt(_502);
    float _530 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _532 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = 0.0;
    float _536 = (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _538 = (*spvDescriptorSet0.vp_c12)._m0[3].z;
    if (_382)
    {
        float _540 = fma(_522, _522, _526);
        _534 = _540;
    }
    float _542 = _534;
    float _544 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _546 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _548 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _550 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _552 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _554 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _556 = _542;
    float _558 = (*spvDescriptorSet0.vp_c12)._m0[3].w;
    if (_382)
    {
        float _560 = rsqrt(_542);
        _556 = _560;
    }
    float _562 = _556;
    out.m_56.x = _530;
    out.m_56.y = _532;
    out.m_56.z = _544;
    out.m_56.w = _546;
    bool _564 = _528 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _566 = isnan(_528);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _572 = _568 || _570;
    if (!_382)
    {
        _536 = 0.0;
        _538 = 0.0;
    }
    float _574 = _536;
    float _576 = _538;
    float _578 = _576;
    float _580 = _574;
    if (!_382)
    {
        _504 = 0.0;
    }
    float _582 = _504;
    out.m_58.x = _548;
    out.m_58.y = _550;
    out.m_58.z = _552;
    out.m_58.w = _554;
    float _584 = _582;
    if (_382)
    {
        float _586 = _562 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _558 = _586;
    }
    float _588 = _558;
    if (_382)
    {
        float _590 = _510 * _588;
        _578 = _590;
    }
    float _592 = _578;
    if (_382)
    {
        float _594 = _500 * _588;
        _580 = _594;
    }
    float _596 = _580;
    if (_382)
    {
        float _598 = _522 * _588;
        _584 = _598;
    }
    float _600 = _584;
    if (!_572)
    {
        _512 = 1.0;
    }
    float _602 = _512;
    bool _604 = !_572;
    float _606 = _602;
    if (!_604)
    {
        bool _608 = _528 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _610 = isnan(_528);
        bool _612 = _608 || _610;
        bool _614 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _616 = _612 || _614;
        if (!_616)
        {
            float _618 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _620 = _528 + _618;
            float _622 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _624 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _622;
            float _626 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _628 = _626 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _630 = 1.0 / _624;
            float _632 = _620 * _630;
            float _634 = fma(_632, _628, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _606 = _634;
            _636 = true;
        }
        else
        {
            bool _638 = _528 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _640 = isnan(_528);
            bool _642 = _638 || _640;
            bool _644 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _646 = _642 || _644;
            if (!_646)
            {
                float _648 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _650 = _528 + _648;
                float _652 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _654 = _652 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _656 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _658 = _656 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _660 = 1.0 / _654;
                float _662 = _650 * _660;
                float _664 = fma(_662, _658, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _606 = _664;
                _636 = true;
            }
            else
            {
                _606 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _636 = false;
    float _666 = _606;
    float _668 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _670 = _464 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _674 = _470 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _678 = _472 + _676;
    float _680 = fma(_670, _666, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _682 = fma(_674, _666, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _684 = fma(_678, _666, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _686 = _680 + _596;
    float _688 = _682 + _592;
    float _690 = _684 + _600;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _694 = _686 + _692;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _698 = _688 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _702 = _690 + _700;
    float _704 = _694 * _694;
    float _706 = fma(_698, _698, _704);
    float _708 = fma(_702, _702, _706);
    float _710 = rsqrt(_708);
    float _712 = _710 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _714 = _698 * _712;
    float _716 = _702 * _712;
    float _718 = _714 * _714;
    float _720 = _716 * _716;
    float _722 = _718 + _720;
    float _724 = sqrt(_722);
    bool _726 = _724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _730 = _724 + _728;
    float _732 = _702;
    float _734 = _722;
    float _736 = _730;
    float _738 = _712;
    bool _740 = _726;
    if (_726)
    {
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _732 = _742;
    }
    float _744 = _732;
    if (_726)
    {
        float _746 = rsqrt(_722);
        _734 = _746;
    }
    float _748 = _734;
    if (_726)
    {
        float _750 = _730 * _744;
        _736 = _750;
    }
    float _752 = _736;
    if (_726)
    {
        float _754 = _752 * 0.15915493667125701904296875;
        _480 = _754;
    }
    float _756 = _480;
    float _758 = _704;
    float _760 = _756;
    if (_726)
    {
        float _762 = _756 * 6.283185482025146484375;
        float _764 = sin(_762);
        _758 = _764;
    }
    float _766 = _758;
    float _768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _770 = precise::max(0.0, _768);
    float _772 = _710;
    float _774 = _770;
    float _776 = _768;
    if (_726)
    {
        float _778 = _756 * 6.283185482025146484375;
        float _780 = cos(_778);
        _772 = _780;
    }
    float _782 = _772;
    float _784 = -_712;
    float _786 = -_770;
    float _788 = fma(_694, _784, _786);
    float _790 = _788;
    if (!_726)
    {
        _774 = _714;
    }
    float _792 = _774;
    float _794 = _792;
    if (_726)
    {
        float _796 = _788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _776 = _796;
    }
    float _798 = _776;
    float _800 = _766;
    float _802 = _798;
    if (_726)
    {
        float _804 = fma(_766, _798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _800 = _804;
    }
    float _806 = _800;
    float _808 = _806;
    float _810 = _782;
    if (_726)
    {
        float _812 = _782 + (-1.0);
        _802 = _812;
    }
    float _814 = _802;
    float _816 = _814;
    if (_726)
    {
        float _818 = _748 * _806;
        _738 = _818;
    }
    float _820 = _738;
    if (!_726)
    {
        _808 = _718;
    }
    float _822 = _808;
    float _824 = sqrt(_708);
    float _826 = _822;
    if (_726)
    {
        float _828 = _814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _760 = _828;
    }
    float _830 = _760;
    if (_726)
    {
        float _832 = _714 * _820;
        _794 = _832;
    }
    float _834 = _794;
    if (!_726)
    {
        _816 = _716;
    }
    float _836 = _816;
    float _838 = _836;
    if (_726)
    {
        float _840 = _716 * _820;
        _838 = _840;
    }
    float _842 = _838;
    if (_726)
    {
        float _844 = fma(_788, _782, _830);
        _790 = _844;
    }
    float _846 = _790;
    if (_726)
    {
        float _848 = _834 * _834;
        _826 = _848;
    }
    float _850 = _826;
    if (!_726)
    {
        _810 = _720;
    }
    float _852 = _810;
    float _854 = _852;
    if (_726)
    {
        float _856 = _842 * _842;
        _854 = _856;
    }
    float _858 = _854;
    float _860 = fma(_846, _846, _850);
    float _862 = _860 + _858;
    float _864 = _686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _866 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _868 = fma(_824, (*spvDescriptorSet0.vp_c15)._m0[23].w, _866);
    float _870 = precise::clamp(_868, 0.0, 1.0);
    float _872 = _686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _874 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _876 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[2].x, _864);
    float _878 = rsqrt(_862);
    float _880 = -_870;
    float _882 = _880 + 1.0;
    float _884 = _686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _886 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[2].z, _876);
    float _888 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _872);
    float _890 = _686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _892 = _886 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _894 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _884);
    float _896 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _888);
    float _898 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[3].x, _890);
    float _900 = abs(_882);
    float _902 = log2(_900);
    float _904 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[0].z, _894);
    float _906 = _896 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _908 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[3].z, _898);
    float _910 = _892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _912 = _904 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _914 = _906 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _916 = _878 * _834;
    float _918 = _908 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _920 = -_910;
    float _922 = fma(_920, _874, 1.0);
    float _924 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].x, _914);
    float _926 = _878 * _846;
    float _928 = _916 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _930 = _878 * _842;
    float _932 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _924);
    float _934 = log2(_922);
    float _936 = -_928;
    float _938 = fma(_926, (*spvDescriptorSet0.vp_c15)._m0[21].y, _936);
    float _940 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _942 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[7].w, _932);
    float _944 = _906 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _946 = -_930;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _938);
    float _950 = _906 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _952 = 1.0 / _942;
    float _954 = fma(_948, -0.5, 0.5);
    float _956 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].x, _944);
    float _958 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].x, _950);
    float _960 = fma(_948, 0.5, 0.5);
    float _962 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _956);
    float _964 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _958);
    float _966 = exp2(_940);
    float _968 = fma(_960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _970 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[4].w, _962);
    float _972 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[5].w, _964);
    float _974 = _934 * 0.693147182464599609375;
    float _976 = fma(_960, _968, -0.212114393711090087890625);
    float _978 = sqrt(_954);
    float _980 = _926 + 1.0;
    float _982 = _972 * _952;
    float _984 = fma(_960, _976, 1.570728778839111328125);
    float _986 = _970 * _952;
    float _988 = _974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _990 = fma(_982, -0.5, 0.5);
    float _992 = -_926;
    float _994 = fma(_966, _980, _992);
    float _996 = fma(_986, 0.5, 0.5);
    float _998 = fma(_994, 0.5, 0.5);
    float _1000 = _978 * 0.636619746685028076171875;
    float _1002 = -_984;
    float _1004 = fma(_1000, _1002, 1.0);
    float3 _3061 = float3(_996, _990, _988);
    float _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3061, float3(0.0), isnan(_3061)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3061, float3(0.0), isnan(_3061)), level(0.0)).x;
    float3 _3072 = float3(_996, _990, _988);
    float4 _1009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3072, float3(0.0), isnan(_3072)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3072, float3(0.0), isnan(_3072)), level(0.0)).xyzw;
    float _1011 = _1009.x;
    float _1013 = _1009.y;
    float _1015 = _1009.z;
    float _1017 = _1009.w;
    float2 _3089 = float2(_1004, _998);
    float3 _1021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3089, float2(0.0), isnan(_3089)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3089, float2(0.0), isnan(_3089)), level(0.0)).xyz;
    float _1023 = _1021.x;
    float _1025 = _1021.y;
    float _1027 = _1021.z;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1031 = _1029 != 0;
    float _1033 = _106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1037 = _1035 != 0;
    float _1039 = _106 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1041 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1033);
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1045 = _1043 != 0;
    float _1047 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1039);
    float _1049 = _106 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1053 = _1051 != 0;
    float _1055 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1057 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1049);
    float _1059 = _976;
    bool _1061 = _1031;
    float _1063 = _1041;
    float _1065 = _1047;
    if (_1031)
    {
        _1059 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1067 = _1059;
    float _1069 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1073 = _1071 != 0;
    float _1075 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1057);
    if (_1031)
    {
        bool _1077 = _1067 > 0.5;
        _740 = _1077;
    }
    bool _1079 = _740;
    float _1081 = _106 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_1031)
    {
        float _1083 = -_170;
        float _1085 = (-0.0) + _1083;
        _302 = _1085;
    }
    float _1087 = _302;
    float _1089 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1091 = fma(_100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1081);
    float _1093 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1095 = _1087;
    if (_1037)
    {
        _304 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1097 = _304;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    if (_1031)
    {
        float _1101 = -_170;
        float _1103 = _1079 ? _170 : _1101;
        _1095 = _1103;
    }
    float _1105 = _1095;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1109 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.5);
    bool _1117 = _1113 || _1115;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1121 = !_160;
    float _1123 = _1121 ? 0.0 : 1.0;
    float _1125 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1099);
    float _1127 = _1123;
    if (_1037)
    {
        bool _1129 = _1097 > 0.5;
        _306 = _1129;
    }
    bool _1131 = _306;
    float _1133 = -_1107;
    float _1135 = fma(_1119, 2.0, _1133);
    float _1137 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1091);
    float _1139 = fma(_112, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1047);
    if (_1045)
    {
        _408 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1141 = _408;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1149 = fma(_1145, -2.0, _1143);
    float _1151 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1155 = _1141;
    float _1157 = _1145;
    if (_1045)
    {
        bool _1159 = _1141 > 0.5;
        _1061 = _1159;
    }
    bool _1161 = _1061;
    float _1163 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1147);
    bool _1165 = _1161;
    if (!_1053)
    {
        _1063 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1167 = _1063;
    float _1169 = fma(_266, _1153, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1171 = _1167;
    if (_1073)
    {
        _1155 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1173 = _1155;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_1053)
    {
        _1171 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1177 = _1171;
    float _1179 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1125);
    if (!_1053)
    {
        _1065 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1181 = _1065;
    float _1183 = _1181;
    if (!_1073)
    {
        float _1185 = -_176;
        float _1187 = (-0.0) + _1185;
        _1157 = _1187;
    }
    float _1189 = _1157;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1175);
    float _1193 = _1189;
    if (_1053)
    {
        _1183 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1195 = _1183;
    float _1197 = _1179 * (-0.15915493667125701904296875);
    if (!_1045)
    {
        _322 = _1123;
    }
    float _1199 = _322;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1203 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1205 = _1199;
    float _1207 = _1201;
    if (_1045)
    {
        float _1209 = -_1123;
        float _1211 = _1161 ? _1209 : _1123;
        _1205 = _1211;
    }
    float _1213 = _1205;
    float _1215 = _1197 * 6.283185482025146484375;
    float _1217 = sin(_1215);
    if (_1073)
    {
        bool _1219 = _1173 > 0.5;
        _1165 = _1219;
    }
    bool _1221 = _1165;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1225 = 0.0;
    if (!_1053)
    {
        _1225 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1227 = _1225;
    float _1229 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1231 = _1227;
    if (_1053)
    {
        _1231 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1233 = _1231;
    float _1235 = -_1223;
    float _1237 = fma(_1203, 2.0, _1235);
    if (_1073)
    {
        float _1239 = -_176;
        float _1241 = _1221 ? _176 : _1239;
        _1193 = _1241;
    }
    float _1243 = _1193;
    float _1245 = _1197 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1201);
    if (!_1053)
    {
        _1207 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1251 = _1207;
    float _1253 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1191);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1257 = 0.0;
    float _1259 = _1251;
    if (!_1053)
    {
        _1257 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1261 = _1257;
    float _1263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1267 = _1261;
    if (_1053)
    {
        _1259 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1269 = _1259;
    float _1271 = _1105 + 0.5;
    if (_1053)
    {
        _1267 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1273 = _1267;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1277 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1265);
    float _1279 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1281 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1163);
    float _1283 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1255);
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1287 = fma(_1279, -2.0, _1275);
    float _1289 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1089);
    float _1291 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1283);
    float _1293 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1093);
    float _1295 = _1253 * (-0.15915493667125701904296875);
    float _1297 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1299 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1135);
    float _1301 = _1213 + (-0.5);
    float _1303 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1149);
    float _1305 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1277);
    float _1307 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1249);
    float _1309 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1237);
    float _1311 = _1271 * _1217;
    float _1313 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1287);
    float _1315 = _1295 * 6.283185482025146484375;
    float _1317 = sin(_1315);
    float _1319 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1289);
    float _1321 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1293);
    float _1323 = _1271 * _1247;
    float _1325 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1327 = -_1311;
    float _1329 = fma(_1301, _1247, _1327);
    float _1331 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1333 = _906 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1335 = _1295 * 6.283185482025146484375;
    float _1337 = cos(_1335);
    float _1339 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1319);
    float _1341 = _1329 + 0.5;
    float _1343 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1321);
    float _1345 = fma(_1301, _1217, _1323);
    float _1347 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1333);
    float _1349 = fma(_1331, _1341, _1299);
    if (_1037)
    {
        float _1351 = -_1123;
        float _1353 = _1131 ? _1351 : _1123;
        _1127 = _1353;
    }
    float _1355 = _1127;
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1359 = _1345 + (-0.5);
    float _1361 = _1339 + _1343;
    float _1363 = _1243 + 0.5;
    float _1365 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1367 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1369 = _1355 + (-0.5);
    float _1371 = _1363 * _1317;
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1375 = -_1365;
    float _1377 = -_1303;
    float _1379 = fma(_1375, _1359, _1377);
    float _1381 = _1363 * _1337;
    float _1383 = -_1371;
    float _1385 = fma(_1369, _1337, _1383);
    float _1387 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1347);
    float _1389 = -_1281;
    float _1391 = _1389 + 1.0;
    float _1393 = fma(_1369, _1317, _1381);
    float _1395 = 1.0 / _1343;
    float _1397 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1399 = _1385 + 0.5;
    float _1401 = _1393 + (-0.5);
    float _1403 = fma(_1397, _1399, _1309);
    float _1405 = _1399;
    if (_1117)
    {
        _1405 = 1.0;
    }
    float _1407 = _1405;
    float _1409 = exp2(_1367);
    float _1411 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1413 = -_1411;
    float _1415 = -_1313;
    float _1417 = fma(_1413, _1401, _1415);
    float _1419 = _1361 * _1395;
    float _1421 = _1419 * 0.5;
    float _1423 = _1407;
    if (!_1117)
    {
        float _1425 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1427 = _1425 * 0.15915493667125701904296875;
        float _1429 = _1427 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        float _1433 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1435 = _1433 * 0.15915493667125701904296875;
        float _1437 = _1427 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1443 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1441);
        float _1445 = 1.0 / _1431;
        float _1447 = _1435 * 6.283185482025146484375;
        float _1449 = cos(_1447);
        float _1451 = _1439 * _1445;
        float _1453 = 1.0 / _1443;
        float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1457 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1455;
        float _1459 = _1449 * _1451;
        float _1461 = _1435 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = 1.0 / _1459;
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1469 = _1453 * _1467;
        float _1471 = 1.0 / _1457;
        float _1473 = _1463 * _1465;
        float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1477 = fma(_1473, _1469, _1475);
        float _1479 = _1477 * _1471;
        float _1481 = precise::clamp(_1479, 0.0, 1.0);
        float _1483 = -_1481;
        float _1485 = _1483 + 1.0;
        _1423 = _1485;
    }
    float _1487 = _1423;
    float _1489 = -_1409;
    float _1491 = _1489 + 1.0;
    float _1493 = -_1307;
    float _1495 = _1493 + 1.0;
    float _1497 = _1169 * _1487;
    float _1499 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1387);
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1503 = fma(_1393, _1495, _1417);
    float _1505 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1507 = -_1305;
    float _1509 = _1507 + 1.0;
    float _1511 = _1501 * _1006;
    float _1513 = -_1501;
    float _1515 = _1513 + 1.0;
    float _1517 = -_1291;
    float _1519 = _1517 + 1.0;
    float _1521 = _1499 + _942;
    float _1523 = _1017 * _1511;
    float _1525 = _1027 * _1511;
    float _1527 = -_1391;
    float _1529 = fma(_1329, _1527, _1349);
    out.gl_Position.x = _970;
    out.gl_Position.y = _972;
    out.gl_Position.z = _1499;
    out.gl_Position.w = _942;
    float _1531 = fma(_1023, _1523, _1011);
    float _1533 = fma(_1025, _1523, _1013);
    float _1535 = _1017 * _1515;
    float _1537 = fma(_1345, _1509, _1379);
    float _1539 = -_1519;
    float _1541 = fma(_1385, _1539, _1403);
    float _1543 = _1521 * 0.5;
    float _1545 = _1505 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1547 = fma(_1017, _1525, _1015);
    out.m_60.x = _1529;
    out.m_60.y = _1537;
    out.m_60.z = _1541;
    out.m_60.w = _1503;
    out.m_62.z = _1543;
    out.m_62.w = _942;
    out.m_64.x = _1545;
    out.m_66.x = _1531;
    out.m_66.y = _1533;
    out.m_66.z = _1547;
    out.m_66.w = _1535;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

