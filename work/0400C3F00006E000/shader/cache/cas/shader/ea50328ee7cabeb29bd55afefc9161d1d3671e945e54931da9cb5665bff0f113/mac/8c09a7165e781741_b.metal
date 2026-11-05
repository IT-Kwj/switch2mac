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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c12 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    const device _33* vp_s0 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_54 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_58 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = as_type<float>(int(gl_VertexIndex));
    float _84 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    int _91 = as_type<int>(_82) >> 2;
    int _93 = _91 + _89;
    int _95 = _93 * 48;
    int _97 = _95 + 16;
    uint _100 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_100)];
    float _102 = as_type<float>(_dmw0.x);
    int _104 = _95 + 4;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw0.y);
    int _110 = _95 + 8;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.z);
    int _116 = _95 + 12;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw0.w);
    uint _122 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_122)];
    float _124 = as_type<float>(_dmw1.x);
    int _126 = _97 + 4;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.y);
    int _132 = _97 + 8;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw1.z);
    int _138 = _97 + 12;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_dmw1.w);
    int _144 = _95 + 32;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_146)];
    float _148 = as_type<float>(_dmw2.x);
    int _150 = _144 + 4;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    float _154 = as_type<float>(_dmw2.y);
    int _156 = _144 + 8;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw2.z);
    int _162 = as_type<int>(_82) & 1;
    bool _166 = _162 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _170 = _168 != 0;
    int _172 = as_type<int>(_82) & 2;
    bool _174 = _172 != 0;
    bool _176 = !_174;
    float _178 = _176 ? 1.0 : (-1.0);
    float _180 = _130 * _130;
    float _182 = fma(_124, _124, _180);
    float _184 = fma(_136, _136, _182);
    float _186 = rsqrt(_184);
    float _188 = abs(_120);
    float _190 = _188 * _178;
    float _192 = _190 * 0.5;
    float _194 = 0.0;
    float _196 = _130;
    float _198 = 1.0;
    float _200 = _124;
    float _202 = _120;
    float _204 = _82;
    bool _206 = _174;
    if (!_166)
    {
        _194 = _148;
    }
    float _208 = _194;
    float _210 = 0.0;
    float _212 = _208;
    if (!_166)
    {
        _210 = _154;
    }
    float _214 = _210;
    float _216 = 0.0;
    float _218 = _214;
    if (!_166)
    {
        _216 = _160;
    }
    float _220 = _216;
    float _222 = _130 * _186;
    float _224 = _124 * _186;
    float _226 = _136 * _186;
    float _228 = _220;
    float _230 = _186;
    if (_170)
    {
        _196 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _232 = _196;
    bool _234 = !_166;
    float _236 = _232;
    if (!_234)
    {
        float _238 = _148 * _226;
        float _240 = _160 * _222;
        float _242 = -_238;
        float _244 = fma(_160, _224, _242);
        float _246 = _154 * _224;
        float _248 = -_240;
        float _250 = fma(_154, _226, _248);
        float _252 = _244 * _244;
        float _254 = -_246;
        float _256 = fma(_148, _222, _254);
        float _258 = fma(_250, _250, _252);
        float _260 = fma(_256, _256, _258);
        float _262 = rsqrt(_260);
        float _264 = _250 * _262;
        float _266 = _244 * _262;
        float _268 = _256 * _262;
        _228 = _268;
        _212 = _264;
        _198 = _256;
        _230 = _252;
        _218 = _266;
        _200 = _250;
    }
    float _270 = _228;
    float _272 = _212;
    float _274 = _198;
    float _276 = _230;
    float _278 = _218;
    float _280 = _200;
    float _282 = -_192;
    float _284 = fma(_270, _282, _114);
    float _286 = -_192;
    float _288 = fma(_272, _286, _102);
    float _290 = _274;
    float _292 = _276;
    float _294 = _280;
    float _296 = _284;
    if (_170)
    {
        _290 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _298 = _290;
    float _300 = _298;
    if (_170)
    {
        float _302 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _304 = _232 + _302;
        _292 = _304;
    }
    float _306 = _292;
    float _308 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _310 = _284 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _314 = _288 + _312;
    if (_170)
    {
        _202 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _316 = _202;
    float _318 = _316;
    if (_170)
    {
        float _320 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _322 = _298 + _320;
        _300 = _322;
    }
    float _324 = _300;
    float _326 = _310 * _310;
    float _328 = _326;
    float _330 = _324;
    if (_170)
    {
        float _332 = _306 * _306;
        _294 = _332;
    }
    float _334 = _294;
    float _336 = -_192;
    float _338 = fma(_278, _336, _108);
    float _340 = _334;
    float _342 = _338;
    if (_170)
    {
        float _344 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _346 = _316 + _344;
        _236 = _346;
    }
    float _348 = _236;
    float _350 = fma(_314, _314, _326);
    if (_170)
    {
        float _352 = fma(_324, _324, _334);
        _340 = _352;
    }
    float _354 = _340;
    float _356 = 0.0;
    float _358 = _354;
    if (!_170)
    {
        _356 = 0.0;
    }
    float _360 = _356;
    float _362 = sqrt(_350);
    float _364 = _360;
    if (_170)
    {
        float _366 = fma(_348, _348, _354);
        _204 = _366;
    }
    float _368 = _204;
    if (!_170)
    {
        _328 = 0.0;
    }
    float _370 = _328;
    float _372 = _370;
    if (!_170)
    {
        _358 = 0.0;
    }
    float _374 = _358;
    float _376 = _368;
    float _378 = _374;
    if (_170)
    {
        float _380 = rsqrt(_368);
        _376 = _380;
    }
    float _382 = _376;
    bool _384 = _362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _386 = 0.0;
    float _388 = _382;
    float _390 = _362;
    if (_170)
    {
        float _392 = _382 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _386 = _392;
    }
    float _394 = _386;
    if (_170)
    {
        float _396 = _324 * _394;
        _364 = _396;
    }
    float _398 = _364;
    if (_170)
    {
        float _400 = _306 * _394;
        _372 = _400;
    }
    float _402 = _372;
    if (!_384)
    {
        _318 = _288;
    }
    float _404 = _318;
    float _406 = _404;
    if (!_384)
    {
        _330 = _284;
    }
    float _408 = _330;
    float _410 = _408;
    if (!_384)
    {
        _388 = _338;
    }
    float _412 = _388;
    bool _414 = !_384;
    float _416 = _412;
    if (!_414)
    {
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _420 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _422 = _362 + _420;
        float _424 = rsqrt(_350);
        float _426 = _422 * _418;
        float _428 = _338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = _426 * 0.15915493667125701904296875;
        float _432 = _430 * 6.283185482025146484375;
        float _434 = cos(_432);
        float _436 = _430 * 6.283185482025146484375;
        float _438 = sin(_436);
        float _440 = _434 + (-1.0);
        float _442 = fma(_438, _428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _444 = _440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _446 = _424 * _442;
        float _448 = fma(_338, _434, _444);
        float _450 = fma(_314, _446, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _452 = fma(_310, _446, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _416 = _448;
        _406 = _450;
        _410 = _452;
        _390 = _444;
        _296 = _446;
    }
    float _454 = _416;
    float _456 = _406;
    float _458 = _410;
    float _460 = _390;
    float _462 = _296;
    float _464 = _402 + _454;
    if (_170)
    {
        float _466 = _348 * _394;
        _378 = _466;
    }
    float _468 = _378;
    float _470 = _398 + _456;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _474 = _464 + _472;
    float _476 = _468 + _458;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _480 = _470 + _478;
    float _482 = _474 * _474;
    float _484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _486 = _476 + _484;
    float _488 = fma(_480, _480, _482);
    float _490 = fma(_486, _486, _488);
    float _492 = rsqrt(_490);
    float _494 = sqrt(_490);
    float _496 = _492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _498 = _480 * _496;
    float _500 = _486 * _496;
    float _502 = _498 * _498;
    float _504 = _500 * _500;
    float _506 = _502 + _504;
    float _508 = sqrt(_506);
    bool _510 = _508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _514 = _508 + _512;
    float _516 = _398;
    float _518 = _506;
    float _520 = _514;
    float _522 = _496;
    if (_510)
    {
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _524;
    }
    float _526 = _516;
    if (_510)
    {
        float _528 = rsqrt(_506);
        _518 = _528;
    }
    float _530 = _518;
    float _532 = _530;
    if (_510)
    {
        float _534 = _514 * _526;
        _520 = _534;
    }
    float _536 = _520;
    if (_510)
    {
        float _538 = _536 * 0.15915493667125701904296875;
        _342 = _538;
    }
    float _540 = _342;
    float _542 = _460;
    float _544 = _540;
    if (_510)
    {
        float _546 = _540 * 6.283185482025146484375;
        float _548 = sin(_546);
        _542 = _548;
    }
    float _550 = _542;
    float _552 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _554 = precise::max(0.0, _552);
    float _556 = _462;
    float _558 = _552;
    float _560 = _554;
    if (_510)
    {
        float _562 = _540 * 6.283185482025146484375;
        float _564 = cos(_562);
        _556 = _564;
    }
    float _566 = _556;
    float _568 = -_496;
    float _570 = -_554;
    float _572 = fma(_474, _568, _570);
    if (_510)
    {
        float _574 = _572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _574;
    }
    float _576 = _558;
    float _578 = _550;
    float _580 = _576;
    if (_510)
    {
        float _582 = fma(_550, _576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _560 = _582;
    }
    float _584 = _560;
    float _586 = _584;
    if (!_510)
    {
        _578 = _498;
    }
    float _588 = _578;
    float _590 = _588;
    float _592 = _566;
    if (_510)
    {
        float _594 = _566 + (-1.0);
        _580 = _594;
    }
    float _596 = _580;
    float _598 = _596;
    if (_510)
    {
        float _600 = _530 * _584;
        _522 = _600;
    }
    float _602 = _522;
    if (!_510)
    {
        _586 = _572;
    }
    float _604 = _586;
    float _606 = _604;
    if (_510)
    {
        float _608 = _596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _544 = _608;
    }
    float _610 = _544;
    if (_510)
    {
        float _612 = _498 * _602;
        _590 = _612;
    }
    float _614 = _590;
    if (!_510)
    {
        _598 = _500;
    }
    float _616 = _598;
    float _618 = _616;
    if (_510)
    {
        float _620 = _500 * _602;
        _618 = _620;
    }
    float _622 = _618;
    if (!_510)
    {
        _532 = _502;
    }
    float _624 = _532;
    float _626 = _624;
    if (_510)
    {
        float _628 = fma(_572, _566, _610);
        _606 = _628;
    }
    float _630 = _606;
    if (_510)
    {
        float _632 = _614 * _614;
        _626 = _632;
    }
    float _634 = _626;
    if (!_510)
    {
        _592 = _504;
    }
    float _636 = _592;
    float _638 = _636;
    if (_510)
    {
        float _640 = _622 * _622;
        _638 = _640;
    }
    float _642 = _638;
    float _644 = fma(_630, _630, _634);
    float _646 = _464 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _648 = _644 + _642;
    float _650 = _464 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _652 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _654 = fma(_494, (*spvDescriptorSet0.vp_c15)._m0[23].w, _652);
    float _656 = precise::clamp(_654, 0.0, 1.0);
    float _658 = _464 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _660 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[3].x, _646);
    float _662 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[2].x, _650);
    float _664 = rsqrt(_648);
    float _666 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[1].x, _658);
    float _668 = -_656;
    float _670 = _668 + 1.0;
    float _672 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[2].z, _662);
    float _674 = _464 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _676 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[1].z, _666);
    float _678 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[3].z, _660);
    float _680 = _672 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _682 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[0].x, _674);
    float _684 = _676 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _686 = abs(_670);
    float _688 = log2(_686);
    float _690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _692 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[0].z, _682);
    float _694 = _680 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _696 = _678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _698 = _692 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _700 = _684 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _702 = _664 * _614;
    float _704 = -_694;
    float _706 = fma(_704, _690, 1.0);
    float _708 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[7].x, _700);
    float _710 = _664 * _630;
    float _712 = _702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _714 = _664 * _622;
    float _716 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[7].z, _708);
    float _718 = _688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _720 = -_712;
    float _722 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[21].y, _720);
    float _724 = log2(_706);
    float _726 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[7].w, _716);
    float _728 = _684 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _730 = -_714;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _722);
    float _734 = _684 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _736 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[5].x, _728);
    float _738 = fma(_732, -0.5, 0.5);
    float _740 = exp2(_718);
    float _742 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[4].x, _734);
    float _744 = fma(_732, 0.5, 0.5);
    float _746 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[5].z, _736);
    float _748 = _710 + 1.0;
    float _750 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[4].z, _742);
    float _752 = fma(_744, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _754 = 1.0 / _726;
    float _756 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[4].w, _750);
    float _758 = fma(_744, _752, -0.212114393711090087890625);
    float _760 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[5].w, _746);
    float _762 = fma(_744, _758, 1.570728778839111328125);
    float _764 = sqrt(_738);
    float _766 = -_710;
    float _768 = fma(_740, _748, _766);
    float _770 = _724 * 0.693147182464599609375;
    float _772 = fma(_768, 0.5, 0.5);
    float _774 = _770 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _776 = _756 * _754;
    float _778 = _760 * _754;
    float _780 = fma(_776, 0.5, 0.5);
    float _782 = fma(_778, -0.5, 0.5);
    float _784 = _764 * 0.636619746685028076171875;
    float _786 = -_762;
    float _788 = fma(_784, _786, 1.0);
    float3 _2304 = float3(_780, _782, _774);
    float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2304, float3(0.0), isnan(_2304)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2304, float3(0.0), isnan(_2304)), level(0.0)).x;
    float3 _2315 = float3(_780, _782, _774);
    float4 _793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2315, float3(0.0), isnan(_2315)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2315, float3(0.0), isnan(_2315)), level(0.0)).xyzw;
    float _795 = _793.x;
    float _797 = _793.y;
    float _799 = _793.z;
    float _801 = _793.w;
    float2 _2332 = float2(_788, _772);
    float3 _805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2332, float2(0.0), isnan(_2332)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2332, float2(0.0), isnan(_2332)), level(0.0)).xyz;
    float _807 = _805.x;
    float _809 = _805.y;
    float _811 = _805.z;
    float _813 = _108 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _815 = _108 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _817 = _108 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _819 = _108 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _821 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _813);
    float _823 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[0].x, _815);
    float _825 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[2].x, _817);
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _829 = _827 != 0;
    float _831 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _821);
    float _833 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _823);
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _837 = _835 != 0;
    float _839 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[3].x, _819);
    float _841 = _831 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _843 = _833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _845 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _825);
    float _847 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _839);
    float _849 = _841 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _851 = _841 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _855 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[7].x, _849);
    float _857 = _847 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[6].x, _851);
    float _861 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[7].z, _855);
    float _863 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    float _867 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[6].z, _859);
    float _869 = 1.0 / _865;
    float _871 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _873 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _875 = _224 * _270;
    float _877 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _879 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _881 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _883 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _867);
    float _885 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _887 = _226 * _278;
    float _889 = 1.0 / _873;
    float _891 = -_875;
    float _893 = fma(_226, _272, _891);
    out.m_54.x = _879;
    out.m_54.y = _871;
    out.m_54.z = _877;
    out.m_54.w = _881;
    float _895 = _222 * _272;
    float _897 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _899 = -_887;
    float _901 = fma(_222, _270, _899);
    float _903 = _883 + _865;
    float _905 = -_895;
    float _907 = fma(_224, _278, _905);
    float _909 = float(_91);
    out.m_56.x = _863;
    out.m_56.y = _885;
    out.m_56.z = _897;
    float _911 = _903 * _869;
    float _913 = _911 * 0.5;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _917 = _684 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _919 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _921 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _923 = _919 || _921;
    bool _925 = isnan(0.5);
    bool _927 = _923 || _925;
    float _929 = _893 * _893;
    float _931 = _879;
    float _933 = _909;
    float _935 = _929;
    if (_829)
    {
        _931 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _937 = _931;
    float _939 = _909 * _889;
    if (!_837)
    {
        float _941 = -_142;
        float _943 = (-0.0) + _941;
        _933 = _943;
    }
    float _945 = _933;
    float _947 = fma(_901, _901, _929);
    float _949 = _945;
    if (_837)
    {
        _935 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _951 = _935;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _955 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[6].x, _917);
    bool _957 = false;
    if (_829)
    {
        bool _959 = _937 > 0.5;
        _957 = _959;
    }
    bool _961 = _957;
    float _963 = fma(_907, _907, _947);
    bool _965 = !_174;
    float _967 = _965 ? 0.0 : 1.0;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _971 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _969);
    float _973 = _967;
    if (_837)
    {
        bool _975 = _951 > 0.5;
        _206 = _975;
    }
    bool _977 = _206;
    float _979 = rsqrt(_963);
    float _981 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[6].z, _955);
    if (_837)
    {
        float _983 = -_142;
        float _985 = _977 ? _142 : _983;
        _949 = _985;
    }
    float _987 = _949;
    float _989 = _688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_829)
    {
        float _991 = -_967;
        float _993 = _961 ? _991 : _967;
        _973 = _993;
    }
    float _995 = _973;
    float _997 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _999 = (*spvDescriptorSet0.vp_c12)._m0[1].y + _997;
    float _1001 = 1.0 / _971;
    float _1003 = _987 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1005 = _995 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = fma(_999, _939, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1009 = _995;
    if (_927)
    {
        _1009 = 1.0;
    }
    float _1011 = _1009;
    float _1013 = -_1003;
    float _1015 = fma(_1013, _953, -0.0);
    float _1017 = _1005 * _915;
    float _1019 = exp2(_989);
    float _1021 = _901 * _979;
    float _1023 = _893 * _979;
    float _1025 = _907 * _979;
    float _1027 = _979;
    float _1029 = _1011;
    if (_927)
    {
        _1027 = 1.0;
    }
    float _1031 = _1027;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1035 = _1001 * _1033;
    float _1037 = _1031;
    if (!_927)
    {
        float _1039 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1043 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1041;
        float _1045 = _1039 * 0.15915493667125701904296875;
        float _1047 = _1045 * 6.283185482025146484375;
        float _1049 = cos(_1047);
        float _1051 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1053 = _1051 * 0.15915493667125701904296875;
        float _1055 = _1045 * 6.283185482025146484375;
        float _1057 = sin(_1055);
        float _1059 = 1.0 / _1049;
        float _1061 = _1053 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = _1057 * _1059;
        float _1067 = _1053 * 6.283185482025146484375;
        float _1069 = sin(_1067);
        float _1071 = _1063 * _1065;
        float _1073 = 1.0 / _1043;
        float _1075 = 1.0 / _1071;
        float _1077 = _1069 * _1075;
        float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1081 = fma(_1035, _1077, _1079);
        float _1083 = _1081 * _1073;
        float _1085 = precise::clamp(_1083, 0.0, 1.0);
        _1037 = _1085;
    }
    float _1087 = _1037;
    if (!_927)
    {
        float _1089 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1091 = _1089 * 0.15915493667125701904296875;
        float _1093 = _1091 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        float _1097 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1099 = _1097 * 0.15915493667125701904296875;
        float _1101 = _1091 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1095;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1121;
        float _1125 = 1.0 / _1123;
        float _1127 = _1115 * _1119;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1131 = fma(_1035, _1127, _1129);
        float _1133 = _1131 * _1125;
        float _1135 = precise::clamp(_1133, 0.0, 1.0);
        float _1137 = -_1135;
        float _1139 = _1137 + 1.0;
        _1029 = _1139;
    }
    float _1141 = _1029;
    float _1143 = _1087 * _1141;
    float _1145 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[6].w, _981);
    float _1147 = -_1019;
    float _1149 = _1147 + 1.0;
    out.m_58.x = _1021;
    out.m_58.y = _1023;
    out.m_58.z = _1025;
    float _1151 = _1143 * _1007;
    float _1153 = _1145 + _726;
    out.m_60.x = _480;
    out.m_60.y = _474;
    out.m_60.z = _486;
    float _1155 = _1153 * 0.5;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1159 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.x = _1017;
    out.m_62.y = _1015;
    float _1161 = _1157 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1163 = _1159 * _790;
    float _1165 = -_1159;
    float _1167 = _1165 + 1.0;
    out.gl_Position.x = _756;
    out.gl_Position.y = _760;
    out.gl_Position.z = _1145;
    out.gl_Position.w = _726;
    float _1169 = _801 * _1163;
    float _1171 = _811 * _1163;
    out.m_64.z = _1155;
    out.m_64.w = _726;
    float _1173 = fma(_807, _1169, _795);
    float _1175 = fma(_809, _1169, _797);
    float _1177 = _801 * _1167;
    float _1179 = fma(_801, _1171, _799);
    out.m_66.x = _1161;
    out.m_68.x = _1173;
    out.m_68.y = _1175;
    out.m_68.z = _1179;
    out.m_68.w = _1177;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = as_type<float>(int(gl_VertexIndex));
    float _84 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    int _91 = as_type<int>(_82) >> 2;
    int _93 = _91 + _89;
    int _95 = _93 * 48;
    int _97 = _95 + 16;
    uint _100 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_100)];
    float _102 = as_type<float>(_dmw0.x);
    int _104 = _95 + 4;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw0.y);
    int _110 = _95 + 8;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.z);
    int _116 = _95 + 12;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw0.w);
    uint _122 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_122)];
    float _124 = as_type<float>(_dmw1.x);
    int _126 = _97 + 4;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.y);
    int _132 = _97 + 8;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw1.z);
    int _138 = _97 + 12;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_dmw1.w);
    int _144 = _95 + 32;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_146)];
    float _148 = as_type<float>(_dmw2.x);
    int _150 = _144 + 4;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    float _154 = as_type<float>(_dmw2.y);
    int _156 = _144 + 8;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw2.z);
    int _162 = as_type<int>(_82) & 1;
    bool _166 = _162 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _170 = _168 != 0;
    int _172 = as_type<int>(_82) & 2;
    bool _174 = _172 != 0;
    bool _176 = !_174;
    float _178 = _176 ? 1.0 : (-1.0);
    float _180 = _130 * _130;
    float _182 = fma(_124, _124, _180);
    float _184 = fma(_136, _136, _182);
    float _186 = rsqrt(_184);
    float _188 = abs(_120);
    float _190 = _188 * _178;
    float _192 = _190 * 0.5;
    float _194 = 0.0;
    float _196 = _130;
    float _198 = 1.0;
    float _200 = _124;
    float _202 = _120;
    float _204 = _82;
    bool _206 = _174;
    if (!_166)
    {
        _194 = _148;
    }
    float _208 = _194;
    float _210 = 0.0;
    float _212 = _208;
    if (!_166)
    {
        _210 = _154;
    }
    float _214 = _210;
    float _216 = 0.0;
    float _218 = _214;
    if (!_166)
    {
        _216 = _160;
    }
    float _220 = _216;
    float _222 = _130 * _186;
    float _224 = _124 * _186;
    float _226 = _136 * _186;
    float _228 = _220;
    float _230 = _186;
    if (_170)
    {
        _196 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _232 = _196;
    bool _234 = !_166;
    float _236 = _232;
    if (!_234)
    {
        float _238 = _148 * _226;
        float _240 = _160 * _222;
        float _242 = -_238;
        float _244 = fma(_160, _224, _242);
        float _246 = _154 * _224;
        float _248 = -_240;
        float _250 = fma(_154, _226, _248);
        float _252 = _244 * _244;
        float _254 = -_246;
        float _256 = fma(_148, _222, _254);
        float _258 = fma(_250, _250, _252);
        float _260 = fma(_256, _256, _258);
        float _262 = rsqrt(_260);
        float _264 = _250 * _262;
        float _266 = _244 * _262;
        float _268 = _256 * _262;
        _228 = _268;
        _212 = _264;
        _198 = _256;
        _230 = _252;
        _218 = _266;
        _200 = _250;
    }
    float _270 = _228;
    float _272 = _212;
    float _274 = _198;
    float _276 = _230;
    float _278 = _218;
    float _280 = _200;
    float _282 = -_192;
    float _284 = fma(_270, _282, _114);
    float _286 = -_192;
    float _288 = fma(_272, _286, _102);
    float _290 = _274;
    float _292 = _276;
    float _294 = _280;
    float _296 = _284;
    if (_170)
    {
        _290 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _298 = _290;
    float _300 = _298;
    if (_170)
    {
        float _302 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _304 = _232 + _302;
        _292 = _304;
    }
    float _306 = _292;
    float _308 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _310 = _284 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _314 = _288 + _312;
    if (_170)
    {
        _202 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _316 = _202;
    float _318 = _316;
    if (_170)
    {
        float _320 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _322 = _298 + _320;
        _300 = _322;
    }
    float _324 = _300;
    float _326 = _310 * _310;
    float _328 = _326;
    float _330 = _324;
    if (_170)
    {
        float _332 = _306 * _306;
        _294 = _332;
    }
    float _334 = _294;
    float _336 = -_192;
    float _338 = fma(_278, _336, _108);
    float _340 = _334;
    float _342 = _338;
    if (_170)
    {
        float _344 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _346 = _316 + _344;
        _236 = _346;
    }
    float _348 = _236;
    float _350 = fma(_314, _314, _326);
    if (_170)
    {
        float _352 = fma(_324, _324, _334);
        _340 = _352;
    }
    float _354 = _340;
    float _356 = 0.0;
    float _358 = _354;
    if (!_170)
    {
        _356 = 0.0;
    }
    float _360 = _356;
    float _362 = sqrt(_350);
    float _364 = _360;
    if (_170)
    {
        float _366 = fma(_348, _348, _354);
        _204 = _366;
    }
    float _368 = _204;
    if (!_170)
    {
        _328 = 0.0;
    }
    float _370 = _328;
    float _372 = _370;
    if (!_170)
    {
        _358 = 0.0;
    }
    float _374 = _358;
    float _376 = _368;
    float _378 = _374;
    if (_170)
    {
        float _380 = rsqrt(_368);
        _376 = _380;
    }
    float _382 = _376;
    bool _384 = _362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _386 = 0.0;
    float _388 = _382;
    float _390 = _362;
    if (_170)
    {
        float _392 = _382 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _386 = _392;
    }
    float _394 = _386;
    if (_170)
    {
        float _396 = _324 * _394;
        _364 = _396;
    }
    float _398 = _364;
    if (_170)
    {
        float _400 = _306 * _394;
        _372 = _400;
    }
    float _402 = _372;
    if (!_384)
    {
        _318 = _288;
    }
    float _404 = _318;
    float _406 = _404;
    if (!_384)
    {
        _330 = _284;
    }
    float _408 = _330;
    float _410 = _408;
    if (!_384)
    {
        _388 = _338;
    }
    float _412 = _388;
    bool _414 = !_384;
    float _416 = _412;
    if (!_414)
    {
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _420 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _422 = _362 + _420;
        float _424 = rsqrt(_350);
        float _426 = _422 * _418;
        float _428 = _338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = _426 * 0.15915493667125701904296875;
        float _432 = _430 * 6.283185482025146484375;
        float _434 = cos(_432);
        float _436 = _430 * 6.283185482025146484375;
        float _438 = sin(_436);
        float _440 = _434 + (-1.0);
        float _442 = fma(_438, _428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _444 = _440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _446 = _424 * _442;
        float _448 = fma(_338, _434, _444);
        float _450 = fma(_314, _446, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _452 = fma(_310, _446, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _416 = _448;
        _406 = _450;
        _410 = _452;
        _390 = _444;
        _296 = _446;
    }
    float _454 = _416;
    float _456 = _406;
    float _458 = _410;
    float _460 = _390;
    float _462 = _296;
    float _464 = _402 + _454;
    if (_170)
    {
        float _466 = _348 * _394;
        _378 = _466;
    }
    float _468 = _378;
    float _470 = _398 + _456;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _474 = _464 + _472;
    float _476 = _468 + _458;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _480 = _470 + _478;
    float _482 = _474 * _474;
    float _484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _486 = _476 + _484;
    float _488 = fma(_480, _480, _482);
    float _490 = fma(_486, _486, _488);
    float _492 = rsqrt(_490);
    float _494 = sqrt(_490);
    float _496 = _492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _498 = _480 * _496;
    float _500 = _486 * _496;
    float _502 = _498 * _498;
    float _504 = _500 * _500;
    float _506 = _502 + _504;
    float _508 = sqrt(_506);
    bool _510 = _508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _514 = _508 + _512;
    float _516 = _398;
    float _518 = _506;
    float _520 = _514;
    float _522 = _496;
    if (_510)
    {
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _524;
    }
    float _526 = _516;
    if (_510)
    {
        float _528 = rsqrt(_506);
        _518 = _528;
    }
    float _530 = _518;
    float _532 = _530;
    if (_510)
    {
        float _534 = _514 * _526;
        _520 = _534;
    }
    float _536 = _520;
    if (_510)
    {
        float _538 = _536 * 0.15915493667125701904296875;
        _342 = _538;
    }
    float _540 = _342;
    float _542 = _460;
    float _544 = _540;
    if (_510)
    {
        float _546 = _540 * 6.283185482025146484375;
        float _548 = sin(_546);
        _542 = _548;
    }
    float _550 = _542;
    float _552 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _554 = precise::max(0.0, _552);
    float _556 = _462;
    float _558 = _552;
    float _560 = _554;
    if (_510)
    {
        float _562 = _540 * 6.283185482025146484375;
        float _564 = cos(_562);
        _556 = _564;
    }
    float _566 = _556;
    float _568 = -_496;
    float _570 = -_554;
    float _572 = fma(_474, _568, _570);
    if (_510)
    {
        float _574 = _572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _574;
    }
    float _576 = _558;
    float _578 = _550;
    float _580 = _576;
    if (_510)
    {
        float _582 = fma(_550, _576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _560 = _582;
    }
    float _584 = _560;
    float _586 = _584;
    if (!_510)
    {
        _578 = _498;
    }
    float _588 = _578;
    float _590 = _588;
    float _592 = _566;
    if (_510)
    {
        float _594 = _566 + (-1.0);
        _580 = _594;
    }
    float _596 = _580;
    float _598 = _596;
    if (_510)
    {
        float _600 = _530 * _584;
        _522 = _600;
    }
    float _602 = _522;
    if (!_510)
    {
        _586 = _572;
    }
    float _604 = _586;
    float _606 = _604;
    if (_510)
    {
        float _608 = _596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _544 = _608;
    }
    float _610 = _544;
    if (_510)
    {
        float _612 = _498 * _602;
        _590 = _612;
    }
    float _614 = _590;
    if (!_510)
    {
        _598 = _500;
    }
    float _616 = _598;
    float _618 = _616;
    if (_510)
    {
        float _620 = _500 * _602;
        _618 = _620;
    }
    float _622 = _618;
    if (!_510)
    {
        _532 = _502;
    }
    float _624 = _532;
    float _626 = _624;
    if (_510)
    {
        float _628 = fma(_572, _566, _610);
        _606 = _628;
    }
    float _630 = _606;
    if (_510)
    {
        float _632 = _614 * _614;
        _626 = _632;
    }
    float _634 = _626;
    if (!_510)
    {
        _592 = _504;
    }
    float _636 = _592;
    float _638 = _636;
    if (_510)
    {
        float _640 = _622 * _622;
        _638 = _640;
    }
    float _642 = _638;
    float _644 = fma(_630, _630, _634);
    float _646 = _464 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _648 = _644 + _642;
    float _650 = _464 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _652 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _654 = fma(_494, (*spvDescriptorSet0.vp_c15)._m0[23].w, _652);
    float _656 = precise::clamp(_654, 0.0, 1.0);
    float _658 = _464 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _660 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[3].x, _646);
    float _662 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[2].x, _650);
    float _664 = rsqrt(_648);
    float _666 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[1].x, _658);
    float _668 = -_656;
    float _670 = _668 + 1.0;
    float _672 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[2].z, _662);
    float _674 = _464 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _676 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[1].z, _666);
    float _678 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[3].z, _660);
    float _680 = _672 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _682 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[0].x, _674);
    float _684 = _676 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _686 = abs(_670);
    float _688 = log2(_686);
    float _690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _692 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[0].z, _682);
    float _694 = _680 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _696 = _678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _698 = _692 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _700 = _684 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _702 = _664 * _614;
    float _704 = -_694;
    float _706 = fma(_704, _690, 1.0);
    float _708 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[7].x, _700);
    float _710 = _664 * _630;
    float _712 = _702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _714 = _664 * _622;
    float _716 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[7].z, _708);
    float _718 = _688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _720 = -_712;
    float _722 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[21].y, _720);
    float _724 = log2(_706);
    float _726 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[7].w, _716);
    float _728 = _684 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _730 = -_714;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _722);
    float _734 = _684 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _736 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[5].x, _728);
    float _738 = fma(_732, -0.5, 0.5);
    float _740 = exp2(_718);
    float _742 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[4].x, _734);
    float _744 = fma(_732, 0.5, 0.5);
    float _746 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[5].z, _736);
    float _748 = _710 + 1.0;
    float _750 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[4].z, _742);
    float _752 = fma(_744, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _754 = 1.0 / _726;
    float _756 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[4].w, _750);
    float _758 = fma(_744, _752, -0.212114393711090087890625);
    float _760 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[5].w, _746);
    float _762 = fma(_744, _758, 1.570728778839111328125);
    float _764 = sqrt(_738);
    float _766 = -_710;
    float _768 = fma(_740, _748, _766);
    float _770 = _724 * 0.693147182464599609375;
    float _772 = fma(_768, 0.5, 0.5);
    float _774 = _770 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _776 = _756 * _754;
    float _778 = _760 * _754;
    float _780 = fma(_776, 0.5, 0.5);
    float _782 = fma(_778, -0.5, 0.5);
    float _784 = _764 * 0.636619746685028076171875;
    float _786 = -_762;
    float _788 = fma(_784, _786, 1.0);
    float3 _2304 = float3(_780, _782, _774);
    float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2304, float3(0.0), isnan(_2304)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2304, float3(0.0), isnan(_2304)), level(0.0)).x;
    float3 _2315 = float3(_780, _782, _774);
    float4 _793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2315, float3(0.0), isnan(_2315)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2315, float3(0.0), isnan(_2315)), level(0.0)).xyzw;
    float _795 = _793.x;
    float _797 = _793.y;
    float _799 = _793.z;
    float _801 = _793.w;
    float2 _2332 = float2(_788, _772);
    float3 _805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2332, float2(0.0), isnan(_2332)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2332, float2(0.0), isnan(_2332)), level(0.0)).xyz;
    float _807 = _805.x;
    float _809 = _805.y;
    float _811 = _805.z;
    float _813 = _108 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _815 = _108 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _817 = _108 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _819 = _108 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _821 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _813);
    float _823 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[0].x, _815);
    float _825 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[2].x, _817);
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _829 = _827 != 0;
    float _831 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _821);
    float _833 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _823);
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _837 = _835 != 0;
    float _839 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[3].x, _819);
    float _841 = _831 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _843 = _833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _845 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _825);
    float _847 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _839);
    float _849 = _841 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _851 = _841 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _855 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[7].x, _849);
    float _857 = _847 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[6].x, _851);
    float _861 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[7].z, _855);
    float _863 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    float _867 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[6].z, _859);
    float _869 = 1.0 / _865;
    float _871 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _873 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _875 = _224 * _270;
    float _877 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _879 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _881 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _883 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _867);
    float _885 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _887 = _226 * _278;
    float _889 = 1.0 / _873;
    float _891 = -_875;
    float _893 = fma(_226, _272, _891);
    out.m_54.x = _879;
    out.m_54.y = _871;
    out.m_54.z = _877;
    out.m_54.w = _881;
    float _895 = _222 * _272;
    float _897 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _899 = -_887;
    float _901 = fma(_222, _270, _899);
    float _903 = _883 + _865;
    float _905 = -_895;
    float _907 = fma(_224, _278, _905);
    float _909 = float(_91);
    out.m_56.x = _863;
    out.m_56.y = _885;
    out.m_56.z = _897;
    float _911 = _903 * _869;
    float _913 = _911 * 0.5;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _917 = _684 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _919 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _921 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _923 = _919 || _921;
    bool _925 = isnan(0.5);
    bool _927 = _923 || _925;
    float _929 = _893 * _893;
    float _931 = _879;
    float _933 = _909;
    float _935 = _929;
    if (_829)
    {
        _931 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _937 = _931;
    float _939 = _909 * _889;
    if (!_837)
    {
        float _941 = -_142;
        float _943 = (-0.0) + _941;
        _933 = _943;
    }
    float _945 = _933;
    float _947 = fma(_901, _901, _929);
    float _949 = _945;
    if (_837)
    {
        _935 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _951 = _935;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _955 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[6].x, _917);
    bool _957 = false;
    if (_829)
    {
        bool _959 = _937 > 0.5;
        _957 = _959;
    }
    bool _961 = _957;
    float _963 = fma(_907, _907, _947);
    bool _965 = !_174;
    float _967 = _965 ? 0.0 : 1.0;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _971 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _969);
    float _973 = _967;
    if (_837)
    {
        bool _975 = _951 > 0.5;
        _206 = _975;
    }
    bool _977 = _206;
    float _979 = rsqrt(_963);
    float _981 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[6].z, _955);
    if (_837)
    {
        float _983 = -_142;
        float _985 = _977 ? _142 : _983;
        _949 = _985;
    }
    float _987 = _949;
    float _989 = _688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_829)
    {
        float _991 = -_967;
        float _993 = _961 ? _991 : _967;
        _973 = _993;
    }
    float _995 = _973;
    float _997 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _999 = (*spvDescriptorSet0.vp_c12)._m0[1].y + _997;
    float _1001 = 1.0 / _971;
    float _1003 = _987 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1005 = _995 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = fma(_999, _939, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1009 = _995;
    if (_927)
    {
        _1009 = 1.0;
    }
    float _1011 = _1009;
    float _1013 = -_1003;
    float _1015 = fma(_1013, _953, -0.0);
    float _1017 = _1005 * _915;
    float _1019 = exp2(_989);
    float _1021 = _901 * _979;
    float _1023 = _893 * _979;
    float _1025 = _907 * _979;
    float _1027 = _979;
    float _1029 = _1011;
    if (_927)
    {
        _1027 = 1.0;
    }
    float _1031 = _1027;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1035 = _1001 * _1033;
    float _1037 = _1031;
    if (!_927)
    {
        float _1039 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1043 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1041;
        float _1045 = _1039 * 0.15915493667125701904296875;
        float _1047 = _1045 * 6.283185482025146484375;
        float _1049 = cos(_1047);
        float _1051 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1053 = _1051 * 0.15915493667125701904296875;
        float _1055 = _1045 * 6.283185482025146484375;
        float _1057 = sin(_1055);
        float _1059 = 1.0 / _1049;
        float _1061 = _1053 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = _1057 * _1059;
        float _1067 = _1053 * 6.283185482025146484375;
        float _1069 = sin(_1067);
        float _1071 = _1063 * _1065;
        float _1073 = 1.0 / _1043;
        float _1075 = 1.0 / _1071;
        float _1077 = _1069 * _1075;
        float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1081 = fma(_1035, _1077, _1079);
        float _1083 = _1081 * _1073;
        float _1085 = precise::clamp(_1083, 0.0, 1.0);
        _1037 = _1085;
    }
    float _1087 = _1037;
    if (!_927)
    {
        float _1089 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1091 = _1089 * 0.15915493667125701904296875;
        float _1093 = _1091 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        float _1097 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1099 = _1097 * 0.15915493667125701904296875;
        float _1101 = _1091 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1095;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1121;
        float _1125 = 1.0 / _1123;
        float _1127 = _1115 * _1119;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1131 = fma(_1035, _1127, _1129);
        float _1133 = _1131 * _1125;
        float _1135 = precise::clamp(_1133, 0.0, 1.0);
        float _1137 = -_1135;
        float _1139 = _1137 + 1.0;
        _1029 = _1139;
    }
    float _1141 = _1029;
    float _1143 = _1087 * _1141;
    float _1145 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[6].w, _981);
    float _1147 = -_1019;
    float _1149 = _1147 + 1.0;
    out.m_58.x = _1021;
    out.m_58.y = _1023;
    out.m_58.z = _1025;
    float _1151 = _1143 * _1007;
    float _1153 = _1145 + _726;
    out.m_60.x = _480;
    out.m_60.y = _474;
    out.m_60.z = _486;
    float _1155 = _1153 * 0.5;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1159 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.x = _1017;
    out.m_62.y = _1015;
    float _1161 = _1157 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1163 = _1159 * _790;
    float _1165 = -_1159;
    float _1167 = _1165 + 1.0;
    out.gl_Position.x = _756;
    out.gl_Position.y = _760;
    out.gl_Position.z = _1145;
    out.gl_Position.w = _726;
    float _1169 = _801 * _1163;
    float _1171 = _811 * _1163;
    out.m_64.z = _1155;
    out.m_64.w = _726;
    float _1173 = fma(_807, _1169, _795);
    float _1175 = fma(_809, _1169, _797);
    float _1177 = _801 * _1167;
    float _1179 = fma(_801, _1171, _799);
    out.m_66.x = _1161;
    out.m_68.x = _1173;
    out.m_68.y = _1175;
    out.m_68.z = _1179;
    out.m_68.w = _1177;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = as_type<float>(int(gl_VertexIndex));
    float _84 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    int _91 = as_type<int>(_82) >> 2;
    int _93 = _91 + _89;
    int _95 = _93 * 48;
    int _97 = _95 + 16;
    uint _100 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_100)];
    float _102 = as_type<float>(_dmw0.x);
    int _104 = _95 + 4;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw0.y);
    int _110 = _95 + 8;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.z);
    int _116 = _95 + 12;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw0.w);
    uint _122 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_122)];
    float _124 = as_type<float>(_dmw1.x);
    int _126 = _97 + 4;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.y);
    int _132 = _97 + 8;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw1.z);
    int _138 = _97 + 12;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_dmw1.w);
    int _144 = _95 + 32;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_146)];
    float _148 = as_type<float>(_dmw2.x);
    int _150 = _144 + 4;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    float _154 = as_type<float>(_dmw2.y);
    int _156 = _144 + 8;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw2.z);
    int _162 = as_type<int>(_82) & 1;
    bool _166 = _162 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _170 = _168 != 0;
    int _172 = as_type<int>(_82) & 2;
    bool _174 = _172 != 0;
    bool _176 = !_174;
    float _178 = _176 ? 1.0 : (-1.0);
    float _180 = _130 * _130;
    float _182 = fma(_124, _124, _180);
    float _184 = fma(_136, _136, _182);
    float _186 = rsqrt(_184);
    float _188 = abs(_120);
    float _190 = _188 * _178;
    float _192 = _190 * 0.5;
    float _194 = 0.0;
    float _196 = _130;
    float _198 = 1.0;
    float _200 = _124;
    float _202 = _120;
    float _204 = _82;
    bool _206 = _174;
    if (!_166)
    {
        _194 = _148;
    }
    float _208 = _194;
    float _210 = 0.0;
    float _212 = _208;
    if (!_166)
    {
        _210 = _154;
    }
    float _214 = _210;
    float _216 = 0.0;
    float _218 = _214;
    if (!_166)
    {
        _216 = _160;
    }
    float _220 = _216;
    float _222 = _130 * _186;
    float _224 = _124 * _186;
    float _226 = _136 * _186;
    float _228 = _220;
    float _230 = _186;
    if (_170)
    {
        _196 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _232 = _196;
    bool _234 = !_166;
    float _236 = _232;
    if (!_234)
    {
        float _238 = _148 * _226;
        float _240 = _160 * _222;
        float _242 = -_238;
        float _244 = fma(_160, _224, _242);
        float _246 = _154 * _224;
        float _248 = -_240;
        float _250 = fma(_154, _226, _248);
        float _252 = _244 * _244;
        float _254 = -_246;
        float _256 = fma(_148, _222, _254);
        float _258 = fma(_250, _250, _252);
        float _260 = fma(_256, _256, _258);
        float _262 = rsqrt(_260);
        float _264 = _250 * _262;
        float _266 = _244 * _262;
        float _268 = _256 * _262;
        _228 = _268;
        _212 = _264;
        _198 = _256;
        _230 = _252;
        _218 = _266;
        _200 = _250;
    }
    float _270 = _228;
    float _272 = _212;
    float _274 = _198;
    float _276 = _230;
    float _278 = _218;
    float _280 = _200;
    float _282 = -_192;
    float _284 = fma(_270, _282, _114);
    float _286 = -_192;
    float _288 = fma(_272, _286, _102);
    float _290 = _274;
    float _292 = _276;
    float _294 = _280;
    float _296 = _284;
    if (_170)
    {
        _290 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _298 = _290;
    float _300 = _298;
    if (_170)
    {
        float _302 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _304 = _232 + _302;
        _292 = _304;
    }
    float _306 = _292;
    float _308 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _310 = _284 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _314 = _288 + _312;
    if (_170)
    {
        _202 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _316 = _202;
    float _318 = _316;
    if (_170)
    {
        float _320 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _322 = _298 + _320;
        _300 = _322;
    }
    float _324 = _300;
    float _326 = _310 * _310;
    float _328 = _326;
    float _330 = _324;
    if (_170)
    {
        float _332 = _306 * _306;
        _294 = _332;
    }
    float _334 = _294;
    float _336 = -_192;
    float _338 = fma(_278, _336, _108);
    float _340 = _334;
    float _342 = _338;
    if (_170)
    {
        float _344 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _346 = _316 + _344;
        _236 = _346;
    }
    float _348 = _236;
    float _350 = fma(_314, _314, _326);
    if (_170)
    {
        float _352 = fma(_324, _324, _334);
        _340 = _352;
    }
    float _354 = _340;
    float _356 = 0.0;
    float _358 = _354;
    if (!_170)
    {
        _356 = 0.0;
    }
    float _360 = _356;
    float _362 = sqrt(_350);
    float _364 = _360;
    if (_170)
    {
        float _366 = fma(_348, _348, _354);
        _204 = _366;
    }
    float _368 = _204;
    if (!_170)
    {
        _328 = 0.0;
    }
    float _370 = _328;
    float _372 = _370;
    if (!_170)
    {
        _358 = 0.0;
    }
    float _374 = _358;
    float _376 = _368;
    float _378 = _374;
    if (_170)
    {
        float _380 = rsqrt(_368);
        _376 = _380;
    }
    float _382 = _376;
    bool _384 = _362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _386 = 0.0;
    float _388 = _382;
    float _390 = _362;
    if (_170)
    {
        float _392 = _382 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _386 = _392;
    }
    float _394 = _386;
    if (_170)
    {
        float _396 = _324 * _394;
        _364 = _396;
    }
    float _398 = _364;
    if (_170)
    {
        float _400 = _306 * _394;
        _372 = _400;
    }
    float _402 = _372;
    if (!_384)
    {
        _318 = _288;
    }
    float _404 = _318;
    float _406 = _404;
    if (!_384)
    {
        _330 = _284;
    }
    float _408 = _330;
    float _410 = _408;
    if (!_384)
    {
        _388 = _338;
    }
    float _412 = _388;
    bool _414 = !_384;
    float _416 = _412;
    if (!_414)
    {
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _420 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _422 = _362 + _420;
        float _424 = rsqrt(_350);
        float _426 = _422 * _418;
        float _428 = _338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = _426 * 0.15915493667125701904296875;
        float _432 = _430 * 6.283185482025146484375;
        float _434 = cos(_432);
        float _436 = _430 * 6.283185482025146484375;
        float _438 = sin(_436);
        float _440 = _434 + (-1.0);
        float _442 = fma(_438, _428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _444 = _440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _446 = _424 * _442;
        float _448 = fma(_338, _434, _444);
        float _450 = fma(_314, _446, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _452 = fma(_310, _446, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _416 = _448;
        _406 = _450;
        _410 = _452;
        _390 = _444;
        _296 = _446;
    }
    float _454 = _416;
    float _456 = _406;
    float _458 = _410;
    float _460 = _390;
    float _462 = _296;
    float _464 = _402 + _454;
    if (_170)
    {
        float _466 = _348 * _394;
        _378 = _466;
    }
    float _468 = _378;
    float _470 = _398 + _456;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _474 = _464 + _472;
    float _476 = _468 + _458;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _480 = _470 + _478;
    float _482 = _474 * _474;
    float _484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _486 = _476 + _484;
    float _488 = fma(_480, _480, _482);
    float _490 = fma(_486, _486, _488);
    float _492 = rsqrt(_490);
    float _494 = sqrt(_490);
    float _496 = _492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _498 = _480 * _496;
    float _500 = _486 * _496;
    float _502 = _498 * _498;
    float _504 = _500 * _500;
    float _506 = _502 + _504;
    float _508 = sqrt(_506);
    bool _510 = _508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _514 = _508 + _512;
    float _516 = _398;
    float _518 = _506;
    float _520 = _514;
    float _522 = _496;
    if (_510)
    {
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _524;
    }
    float _526 = _516;
    if (_510)
    {
        float _528 = rsqrt(_506);
        _518 = _528;
    }
    float _530 = _518;
    float _532 = _530;
    if (_510)
    {
        float _534 = _514 * _526;
        _520 = _534;
    }
    float _536 = _520;
    if (_510)
    {
        float _538 = _536 * 0.15915493667125701904296875;
        _342 = _538;
    }
    float _540 = _342;
    float _542 = _460;
    float _544 = _540;
    if (_510)
    {
        float _546 = _540 * 6.283185482025146484375;
        float _548 = sin(_546);
        _542 = _548;
    }
    float _550 = _542;
    float _552 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _554 = precise::max(0.0, _552);
    float _556 = _462;
    float _558 = _552;
    float _560 = _554;
    if (_510)
    {
        float _562 = _540 * 6.283185482025146484375;
        float _564 = cos(_562);
        _556 = _564;
    }
    float _566 = _556;
    float _568 = -_496;
    float _570 = -_554;
    float _572 = fma(_474, _568, _570);
    if (_510)
    {
        float _574 = _572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _574;
    }
    float _576 = _558;
    float _578 = _550;
    float _580 = _576;
    if (_510)
    {
        float _582 = fma(_550, _576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _560 = _582;
    }
    float _584 = _560;
    float _586 = _584;
    if (!_510)
    {
        _578 = _498;
    }
    float _588 = _578;
    float _590 = _588;
    float _592 = _566;
    if (_510)
    {
        float _594 = _566 + (-1.0);
        _580 = _594;
    }
    float _596 = _580;
    float _598 = _596;
    if (_510)
    {
        float _600 = _530 * _584;
        _522 = _600;
    }
    float _602 = _522;
    if (!_510)
    {
        _586 = _572;
    }
    float _604 = _586;
    float _606 = _604;
    if (_510)
    {
        float _608 = _596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _544 = _608;
    }
    float _610 = _544;
    if (_510)
    {
        float _612 = _498 * _602;
        _590 = _612;
    }
    float _614 = _590;
    if (!_510)
    {
        _598 = _500;
    }
    float _616 = _598;
    float _618 = _616;
    if (_510)
    {
        float _620 = _500 * _602;
        _618 = _620;
    }
    float _622 = _618;
    if (!_510)
    {
        _532 = _502;
    }
    float _624 = _532;
    float _626 = _624;
    if (_510)
    {
        float _628 = fma(_572, _566, _610);
        _606 = _628;
    }
    float _630 = _606;
    if (_510)
    {
        float _632 = _614 * _614;
        _626 = _632;
    }
    float _634 = _626;
    if (!_510)
    {
        _592 = _504;
    }
    float _636 = _592;
    float _638 = _636;
    if (_510)
    {
        float _640 = _622 * _622;
        _638 = _640;
    }
    float _642 = _638;
    float _644 = fma(_630, _630, _634);
    float _646 = _464 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _648 = _644 + _642;
    float _650 = _464 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _652 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _654 = fma(_494, (*spvDescriptorSet0.vp_c15)._m0[23].w, _652);
    float _656 = precise::clamp(_654, 0.0, 1.0);
    float _658 = _464 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _660 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[3].x, _646);
    float _662 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[2].x, _650);
    float _664 = rsqrt(_648);
    float _666 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[1].x, _658);
    float _668 = -_656;
    float _670 = _668 + 1.0;
    float _672 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[2].z, _662);
    float _674 = _464 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _676 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[1].z, _666);
    float _678 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[3].z, _660);
    float _680 = _672 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _682 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[0].x, _674);
    float _684 = _676 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _686 = abs(_670);
    float _688 = log2(_686);
    float _690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _692 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[0].z, _682);
    float _694 = _680 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _696 = _678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _698 = _692 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _700 = _684 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _702 = _664 * _614;
    float _704 = -_694;
    float _706 = fma(_704, _690, 1.0);
    float _708 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[7].x, _700);
    float _710 = _664 * _630;
    float _712 = _702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _714 = _664 * _622;
    float _716 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[7].z, _708);
    float _718 = _688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _720 = -_712;
    float _722 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[21].y, _720);
    float _724 = log2(_706);
    float _726 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[7].w, _716);
    float _728 = _684 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _730 = -_714;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _722);
    float _734 = _684 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _736 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[5].x, _728);
    float _738 = fma(_732, -0.5, 0.5);
    float _740 = exp2(_718);
    float _742 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[4].x, _734);
    float _744 = fma(_732, 0.5, 0.5);
    float _746 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[5].z, _736);
    float _748 = _710 + 1.0;
    float _750 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[4].z, _742);
    float _752 = fma(_744, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _754 = 1.0 / _726;
    float _756 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[4].w, _750);
    float _758 = fma(_744, _752, -0.212114393711090087890625);
    float _760 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[5].w, _746);
    float _762 = fma(_744, _758, 1.570728778839111328125);
    float _764 = sqrt(_738);
    float _766 = -_710;
    float _768 = fma(_740, _748, _766);
    float _770 = _724 * 0.693147182464599609375;
    float _772 = fma(_768, 0.5, 0.5);
    float _774 = _770 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _776 = _756 * _754;
    float _778 = _760 * _754;
    float _780 = fma(_776, 0.5, 0.5);
    float _782 = fma(_778, -0.5, 0.5);
    float _784 = _764 * 0.636619746685028076171875;
    float _786 = -_762;
    float _788 = fma(_784, _786, 1.0);
    float3 _2304 = float3(_780, _782, _774);
    float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2304, float3(0.0), isnan(_2304)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2304, float3(0.0), isnan(_2304)), level(0.0)).x;
    float3 _2315 = float3(_780, _782, _774);
    float4 _793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2315, float3(0.0), isnan(_2315)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2315, float3(0.0), isnan(_2315)), level(0.0)).xyzw;
    float _795 = _793.x;
    float _797 = _793.y;
    float _799 = _793.z;
    float _801 = _793.w;
    float2 _2332 = float2(_788, _772);
    float3 _805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2332, float2(0.0), isnan(_2332)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2332, float2(0.0), isnan(_2332)), level(0.0)).xyz;
    float _807 = _805.x;
    float _809 = _805.y;
    float _811 = _805.z;
    float _813 = _108 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _815 = _108 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _817 = _108 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _819 = _108 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _821 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _813);
    float _823 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[0].x, _815);
    float _825 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[2].x, _817);
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _829 = _827 != 0;
    float _831 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _821);
    float _833 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _823);
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _837 = _835 != 0;
    float _839 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[3].x, _819);
    float _841 = _831 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _843 = _833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _845 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _825);
    float _847 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _839);
    float _849 = _841 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _851 = _841 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _855 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[7].x, _849);
    float _857 = _847 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[6].x, _851);
    float _861 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[7].z, _855);
    float _863 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    float _867 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[6].z, _859);
    float _869 = 1.0 / _865;
    float _871 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _873 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _875 = _224 * _270;
    float _877 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _879 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _881 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _883 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _867);
    float _885 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _887 = _226 * _278;
    float _889 = 1.0 / _873;
    float _891 = -_875;
    float _893 = fma(_226, _272, _891);
    out.m_54.x = _879;
    out.m_54.y = _871;
    out.m_54.z = _877;
    out.m_54.w = _881;
    float _895 = _222 * _272;
    float _897 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _899 = -_887;
    float _901 = fma(_222, _270, _899);
    float _903 = _883 + _865;
    float _905 = -_895;
    float _907 = fma(_224, _278, _905);
    float _909 = float(_91);
    out.m_56.x = _863;
    out.m_56.y = _885;
    out.m_56.z = _897;
    float _911 = _903 * _869;
    float _913 = _911 * 0.5;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _917 = _684 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _919 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _921 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _923 = _919 || _921;
    bool _925 = isnan(0.5);
    bool _927 = _923 || _925;
    float _929 = _893 * _893;
    float _931 = _879;
    float _933 = _909;
    float _935 = _929;
    if (_829)
    {
        _931 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _937 = _931;
    float _939 = _909 * _889;
    if (!_837)
    {
        float _941 = -_142;
        float _943 = (-0.0) + _941;
        _933 = _943;
    }
    float _945 = _933;
    float _947 = fma(_901, _901, _929);
    float _949 = _945;
    if (_837)
    {
        _935 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _951 = _935;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _955 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[6].x, _917);
    bool _957 = false;
    if (_829)
    {
        bool _959 = _937 > 0.5;
        _957 = _959;
    }
    bool _961 = _957;
    float _963 = fma(_907, _907, _947);
    bool _965 = !_174;
    float _967 = _965 ? 0.0 : 1.0;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _971 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _969);
    float _973 = _967;
    if (_837)
    {
        bool _975 = _951 > 0.5;
        _206 = _975;
    }
    bool _977 = _206;
    float _979 = rsqrt(_963);
    float _981 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[6].z, _955);
    if (_837)
    {
        float _983 = -_142;
        float _985 = _977 ? _142 : _983;
        _949 = _985;
    }
    float _987 = _949;
    float _989 = _688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_829)
    {
        float _991 = -_967;
        float _993 = _961 ? _991 : _967;
        _973 = _993;
    }
    float _995 = _973;
    float _997 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _999 = (*spvDescriptorSet0.vp_c12)._m0[1].y + _997;
    float _1001 = 1.0 / _971;
    float _1003 = _987 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1005 = _995 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = fma(_999, _939, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1009 = _995;
    if (_927)
    {
        _1009 = 1.0;
    }
    float _1011 = _1009;
    float _1013 = -_1003;
    float _1015 = fma(_1013, _953, -0.0);
    float _1017 = _1005 * _915;
    float _1019 = exp2(_989);
    float _1021 = _901 * _979;
    float _1023 = _893 * _979;
    float _1025 = _907 * _979;
    float _1027 = _979;
    float _1029 = _1011;
    if (_927)
    {
        _1027 = 1.0;
    }
    float _1031 = _1027;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1035 = _1001 * _1033;
    float _1037 = _1031;
    if (!_927)
    {
        float _1039 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1043 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1041;
        float _1045 = _1039 * 0.15915493667125701904296875;
        float _1047 = _1045 * 6.283185482025146484375;
        float _1049 = cos(_1047);
        float _1051 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1053 = _1051 * 0.15915493667125701904296875;
        float _1055 = _1045 * 6.283185482025146484375;
        float _1057 = sin(_1055);
        float _1059 = 1.0 / _1049;
        float _1061 = _1053 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = _1057 * _1059;
        float _1067 = _1053 * 6.283185482025146484375;
        float _1069 = sin(_1067);
        float _1071 = _1063 * _1065;
        float _1073 = 1.0 / _1043;
        float _1075 = 1.0 / _1071;
        float _1077 = _1069 * _1075;
        float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1081 = fma(_1035, _1077, _1079);
        float _1083 = _1081 * _1073;
        float _1085 = precise::clamp(_1083, 0.0, 1.0);
        _1037 = _1085;
    }
    float _1087 = _1037;
    if (!_927)
    {
        float _1089 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1091 = _1089 * 0.15915493667125701904296875;
        float _1093 = _1091 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        float _1097 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1099 = _1097 * 0.15915493667125701904296875;
        float _1101 = _1091 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1095;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1121;
        float _1125 = 1.0 / _1123;
        float _1127 = _1115 * _1119;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1131 = fma(_1035, _1127, _1129);
        float _1133 = _1131 * _1125;
        float _1135 = precise::clamp(_1133, 0.0, 1.0);
        float _1137 = -_1135;
        float _1139 = _1137 + 1.0;
        _1029 = _1139;
    }
    float _1141 = _1029;
    float _1143 = _1087 * _1141;
    float _1145 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[6].w, _981);
    float _1147 = -_1019;
    float _1149 = _1147 + 1.0;
    out.m_58.x = _1021;
    out.m_58.y = _1023;
    out.m_58.z = _1025;
    float _1151 = _1143 * _1007;
    float _1153 = _1145 + _726;
    out.m_60.x = _480;
    out.m_60.y = _474;
    out.m_60.z = _486;
    float _1155 = _1153 * 0.5;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1159 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.x = _1017;
    out.m_62.y = _1015;
    float _1161 = _1157 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1163 = _1159 * _790;
    float _1165 = -_1159;
    float _1167 = _1165 + 1.0;
    out.gl_Position.x = _756;
    out.gl_Position.y = _760;
    out.gl_Position.z = _1145;
    out.gl_Position.w = _726;
    float _1169 = _801 * _1163;
    float _1171 = _811 * _1163;
    out.m_64.z = _1155;
    out.m_64.w = _726;
    float _1173 = fma(_807, _1169, _795);
    float _1175 = fma(_809, _1169, _797);
    float _1177 = _801 * _1167;
    float _1179 = fma(_801, _1171, _799);
    out.m_66.x = _1161;
    out.m_68.x = _1173;
    out.m_68.y = _1175;
    out.m_68.z = _1179;
    out.m_68.w = _1177;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

