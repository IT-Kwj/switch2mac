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

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_61 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_49 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_42.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    float _88 = as_type<float>(_80);
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _86;
    if (!_84)
    {
        out.m_45.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _90 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _870 = as_type<float>(_96);
        out.gl_Position.z = _870;
    }
    if (!_84)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _100 = in.m_47.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_45.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _939 = as_type<float>(_132);
        out.gl_Position.z = _939;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_49.x;
    float _136 = in.m_49.y;
    float _138 = in.m_49.z;
    float _140 = in.m_49.w;
    float _142 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    float _148 = in.m_51.z;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _142;
    if (!_158)
    {
        float _176 = _142 * _142;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _134 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = _136 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _186 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _188 = _138;
    if (!_158)
    {
        float _190 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _144);
    float _196 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _146);
    float _200 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _148);
    float _204 = _196 * _194;
    float _206 = _200 * _198;
    bool _208 = !_158;
    float _210 = _192;
    float _212 = _144;
    if (!_208)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _142 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _142);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _242;
    }
    float _244 = _210;
    bool _246 = !_158;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _142 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _174 = _266;
    }
    float _268 = _174;
    float _270 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_268, _162, _270);
    float _280 = fma(_268, _160, _272);
    float _282 = _274 * _202;
    float _284 = fma(_268, _164, _276);
    float _286 = fma(_278, _140, _168);
    float _288 = fma(_280, _140, _166);
    float _290 = _206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _292 = fma(_284, _140, _170);
    float _294 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _296 = _206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _298 = fma(_204, (*spvDescriptorSet0.vp_c8)._m0[26].x, _290);
    float _300 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _302 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _294);
    float _304 = fma(_204, (*spvDescriptorSet0.vp_c8)._m0[24].x, _296);
    float _306 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _298);
    float _308 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _300);
    float _310 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _302);
    float _312 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _304);
    float _314 = _306 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _316 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _308);
    float _318 = _310 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _320 = _312 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _322 = _206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _326 = _318 + _314;
    float _328 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _330 = fma(_204, (*spvDescriptorSet0.vp_c8)._m0[25].x, _322);
    float _332 = _324 + _320;
    float _334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _336 = _326 + _334;
    float _338 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _328);
    float _340 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _330);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _332 + _342;
    float _346 = _336 * _336;
    float _348 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _338);
    float _350 = _340 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _352 = fma(_344, _344, _346);
    float _354 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _356 = sqrt(_352);
    float _358 = _354 + _350;
    bool _360 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _362 = _340;
    float _364 = _288;
    float _366 = _332;
    float _368 = _336;
    if (!_360)
    {
        _362 = _326;
    }
    float _370 = _362;
    float _372 = _370;
    if (!_360)
    {
        _364 = _358;
    }
    float _374 = _364;
    bool _376 = !_360;
    float _378 = _374;
    if (!_376)
    {
        float _380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _384 = _356 + _382;
        float _386 = rsqrt(_352);
        float _388 = _384 * _380;
        float _390 = _358 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = _388 * 0.15915493667125701904296875;
        float _394 = _392 * 6.283185482025146484375;
        float _396 = cos(_394);
        float _398 = _392 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = _396 + (-1.0);
        float _404 = fma(_400, _390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _406 = _402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _408 = _386 * _404;
        float _410 = fma(_358, _396, _406);
        float _412 = fma(_344, _408, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _414 = fma(_336, _408, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _378 = _410;
        _366 = _412;
        _372 = _414;
    }
    float _416 = _378;
    float _418 = _366;
    float _420 = _372;
    float _422 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _424 = _416 + _422;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _428 = _418 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _432 = _420 + _430;
    float _434 = _424 * _424;
    float _436 = fma(_428, _428, _434);
    float _438 = fma(_432, _432, _436);
    float _440 = rsqrt(_438);
    float _442 = _440 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _444 = _428 * _442;
    float _446 = _432 * _442;
    float _448 = _444 * _444;
    float _450 = _446 * _446;
    float _452 = _448 + _450;
    float _454 = sqrt(_452);
    bool _456 = _454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _460 = _454 + _458;
    float _462 = _440;
    float _464 = _452;
    float _466 = _460;
    float _468 = _424;
    float _470 = _444;
    if (_456)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _462 = _472;
    }
    float _474 = _462;
    if (_456)
    {
        float _476 = rsqrt(_452);
        _464 = _476;
    }
    float _478 = _464;
    if (_456)
    {
        float _480 = _460 * _474;
        _466 = _480;
    }
    float _482 = _466;
    if (_456)
    {
        float _484 = _482 * 0.15915493667125701904296875;
        _368 = _484;
    }
    float _486 = _368;
    float _488 = _432;
    if (_456)
    {
        float _490 = _486 * 6.283185482025146484375;
        float _492 = sin(_490);
        _488 = _492;
    }
    float _494 = _488;
    float _496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _498 = precise::max(0.0, _496);
    float _500 = _354;
    float _502 = _498;
    float _504 = _496;
    if (_456)
    {
        float _506 = _486 * 6.283185482025146484375;
        float _508 = cos(_506);
        _500 = _508;
    }
    float _510 = _500;
    float _512 = -_442;
    float _514 = -_498;
    float _516 = fma(_424, _512, _514);
    if (_456)
    {
        float _518 = _516 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _502 = _518;
    }
    float _520 = _502;
    float _522 = _520;
    float _524 = _494;
    if (_456)
    {
        float _526 = fma(_494, _520, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _522 = _526;
    }
    float _528 = _522;
    float _530 = _528;
    if (!_456)
    {
        _524 = _446;
    }
    float _532 = _524;
    float _534 = _532;
    if (_456)
    {
        float _536 = _510 + (-1.0);
        _504 = _536;
    }
    float _538 = _504;
    float _540 = _538;
    if (_456)
    {
        float _542 = _478 * _528;
        _212 = _542;
    }
    float _544 = _212;
    if (!_456)
    {
        _530 = _516;
    }
    float _546 = _530;
    float _548 = sqrt(_438);
    float _550 = _546;
    if (_456)
    {
        float _552 = _538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _468 = _552;
    }
    float _554 = _468;
    float _556 = _554;
    if (_456)
    {
        float _558 = _444 * _544;
        _470 = _558;
    }
    float _560 = _470;
    if (!_456)
    {
        _540 = _448;
    }
    float _562 = _540;
    float _564 = _562;
    if (_456)
    {
        float _566 = _446 * _544;
        _534 = _566;
    }
    float _568 = _534;
    if (_456)
    {
        float _570 = fma(_516, _510, _554);
        _550 = _570;
    }
    float _572 = _550;
    if (_456)
    {
        float _574 = _560 * _560;
        _564 = _574;
    }
    float _576 = _564;
    if (!_456)
    {
        _556 = _450;
    }
    float _578 = _556;
    float _580 = _578;
    if (_456)
    {
        float _582 = _568 * _568;
        _580 = _582;
    }
    float _584 = _580;
    float _586 = _416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _588 = fma(_572, _572, _576);
    float _590 = _416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _592 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _586);
    float _594 = _588 + _584;
    float _596 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _590);
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _600 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[23].w, _598);
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = _416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _606 = rsqrt(_594);
    float _608 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[2].z, _596);
    float _610 = -_602;
    float _612 = _610 + 1.0;
    float _614 = _416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _616 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _604);
    float _618 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[3].z, _592);
    float _620 = _608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _622 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _614);
    float _624 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[1].z, _616);
    float _626 = abs(_612);
    float _628 = log2(_626);
    float _630 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _632 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[0].z, _622);
    float _634 = _624 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _636 = _620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _638 = _618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _640 = _632 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _642 = _634 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _644 = _606 * _560;
    float _646 = _606 * _572;
    float _648 = _606 * _568;
    float _650 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _642);
    float _652 = _644 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _654 = -_636;
    float _656 = fma(_654, _630, 1.0);
    float _658 = _634 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _660 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _650);
    float _662 = -_652;
    float _664 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[21].y, _662);
    float _666 = _628 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _668 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _658);
    float _670 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].w, _660);
    float _672 = -_648;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].z, _664);
    float _676 = _634 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _678 = log2(_656);
    float _680 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _668);
    float _682 = fma(_674, -0.5, 0.5);
    float _684 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _676);
    float _686 = _646 + 1.0;
    float _688 = 1.0 / _670;
    float _690 = exp2(_666);
    float _692 = _678 * 0.693147182464599609375;
    float _694 = _692 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _696 = sqrt(_682);
    float _698 = fma(_674, 0.5, 0.5);
    float _700 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _702 = fma(_698, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _704 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].w, _700);
    float _706 = -_646;
    float _708 = fma(_690, _686, _706);
    float _710 = fma(_698, _702, -0.212114393711090087890625);
    float _712 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].w, _680);
    float _714 = _704 * _688;
    float _716 = fma(_708, 0.5, 0.5);
    float _718 = fma(_698, _710, 1.570728778839111328125);
    float _720 = _712 * _688;
    float _722 = fma(_714, 0.5, 0.5);
    float _724 = _696 * 0.636619746685028076171875;
    float _726 = fma(_720, -0.5, 0.5);
    float _728 = -_718;
    float _730 = fma(_724, _728, 1.0);
    float3 _1935 = float3(_722, _726, _694);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_1935, float3(0.0), isnan(_1935)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_1935, float3(0.0), isnan(_1935)), level(0.0)).x;
    float3 _1946 = float3(_722, _726, _694);
    float4 _735 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_1946, float3(0.0), isnan(_1946)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_1946, float3(0.0), isnan(_1946)), level(0.0)).xyzw;
    float _737 = _735.x;
    float _739 = _735.y;
    float _741 = _735.z;
    float _743 = _735.w;
    float2 _1963 = float2(_730, _716);
    float3 _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_1963, float2(0.0), isnan(_1963)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_1963, float2(0.0), isnan(_1963)), level(0.0)).xyz;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = _634 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _757 = _628 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _759 = in.m_53.w;
    float _761 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _755);
    float _763 = exp2(_757);
    float _765 = in.m_53.z;
    float _767 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _761);
    float _769 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].w, _767);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _773 = _769 + _670;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _773 * 0.5;
    float _781 = -_763;
    float _783 = _781 + 1.0;
    float _785 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _783 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_55.w = _759;
    out.m_55.z = _765;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.z = _779;
    out.m_57.w = _670;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _793 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _704;
    out.gl_Position.y = _712;
    out.gl_Position.z = _769;
    out.gl_Position.w = _670;
    float _795 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_59.x = _777;
    out.m_59.y = _785;
    out.m_59.z = _793;
    out.m_59.w = _789;
    out.m_45.x = _795;
    float _797 = _787 * _732;
    float _799 = -_787;
    float _801 = _799 + 1.0;
    float _803 = _743 * _797;
    float _805 = _753 * _797;
    float _807 = _743 * _801;
    float _809 = fma(_749, _803, _737);
    float _811 = fma(_751, _803, _739);
    float _813 = fma(_743, _805, _741);
    out.m_61.x = _809;
    out.m_61.y = _811;
    out.m_61.z = _813;
    out.m_61.w = _807;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_42.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    float _88 = as_type<float>(_80);
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _86;
    if (!_84)
    {
        out.m_45.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _90 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _870 = as_type<float>(_96);
        out.gl_Position.z = _870;
    }
    if (!_84)
    {
        return out;
    }
    float _100 = in.m_47.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_45.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _939 = as_type<float>(_132);
        out.gl_Position.z = _939;
    }
    if (_124)
    {
        return out;
    }
    float _134 = in.m_49.x;
    float _136 = in.m_49.y;
    float _138 = in.m_49.z;
    float _140 = in.m_49.w;
    float _142 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    float _148 = in.m_51.z;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _142;
    if (!_158)
    {
        float _176 = _142 * _142;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _134 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = _136 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _186 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _188 = _138;
    if (!_158)
    {
        float _190 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _144);
    float _196 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _146);
    float _200 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _148);
    float _204 = _196 * _194;
    float _206 = _200 * _198;
    bool _208 = !_158;
    float _210 = _192;
    float _212 = _144;
    if (!_208)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _142 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _142);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _242;
    }
    float _244 = _210;
    bool _246 = !_158;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _142 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _174 = _266;
    }
    float _268 = _174;
    float _270 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_268, _162, _270);
    float _280 = fma(_268, _160, _272);
    float _282 = _274 * _202;
    float _284 = fma(_268, _164, _276);
    float _286 = fma(_278, _140, _168);
    float _288 = fma(_280, _140, _166);
    float _290 = _206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _292 = fma(_284, _140, _170);
    float _294 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _296 = _206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _298 = fma(_204, (*spvDescriptorSet0.vp_c8)._m0[26].x, _290);
    float _300 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _302 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _294);
    float _304 = fma(_204, (*spvDescriptorSet0.vp_c8)._m0[24].x, _296);
    float _306 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _298);
    float _308 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _300);
    float _310 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _302);
    float _312 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _304);
    float _314 = _306 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _316 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _308);
    float _318 = _310 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _320 = _312 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _322 = _206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _326 = _318 + _314;
    float _328 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _330 = fma(_204, (*spvDescriptorSet0.vp_c8)._m0[25].x, _322);
    float _332 = _324 + _320;
    float _334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _336 = _326 + _334;
    float _338 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _328);
    float _340 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _330);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _332 + _342;
    float _346 = _336 * _336;
    float _348 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _338);
    float _350 = _340 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _352 = fma(_344, _344, _346);
    float _354 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _356 = sqrt(_352);
    float _358 = _354 + _350;
    bool _360 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _362 = _340;
    float _364 = _288;
    float _366 = _332;
    float _368 = _336;
    if (!_360)
    {
        _362 = _326;
    }
    float _370 = _362;
    float _372 = _370;
    if (!_360)
    {
        _364 = _358;
    }
    float _374 = _364;
    bool _376 = !_360;
    float _378 = _374;
    if (!_376)
    {
        float _380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _384 = _356 + _382;
        float _386 = rsqrt(_352);
        float _388 = _384 * _380;
        float _390 = _358 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = _388 * 0.15915493667125701904296875;
        float _394 = _392 * 6.283185482025146484375;
        float _396 = cos(_394);
        float _398 = _392 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = _396 + (-1.0);
        float _404 = fma(_400, _390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _406 = _402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _408 = _386 * _404;
        float _410 = fma(_358, _396, _406);
        float _412 = fma(_344, _408, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _414 = fma(_336, _408, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _378 = _410;
        _366 = _412;
        _372 = _414;
    }
    float _416 = _378;
    float _418 = _366;
    float _420 = _372;
    float _422 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _424 = _416 + _422;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _428 = _418 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _432 = _420 + _430;
    float _434 = _424 * _424;
    float _436 = fma(_428, _428, _434);
    float _438 = fma(_432, _432, _436);
    float _440 = rsqrt(_438);
    float _442 = _440 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _444 = _428 * _442;
    float _446 = _432 * _442;
    float _448 = _444 * _444;
    float _450 = _446 * _446;
    float _452 = _448 + _450;
    float _454 = sqrt(_452);
    bool _456 = _454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _460 = _454 + _458;
    float _462 = _440;
    float _464 = _452;
    float _466 = _460;
    float _468 = _424;
    float _470 = _444;
    if (_456)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _462 = _472;
    }
    float _474 = _462;
    if (_456)
    {
        float _476 = rsqrt(_452);
        _464 = _476;
    }
    float _478 = _464;
    if (_456)
    {
        float _480 = _460 * _474;
        _466 = _480;
    }
    float _482 = _466;
    if (_456)
    {
        float _484 = _482 * 0.15915493667125701904296875;
        _368 = _484;
    }
    float _486 = _368;
    float _488 = _432;
    if (_456)
    {
        float _490 = _486 * 6.283185482025146484375;
        float _492 = sin(_490);
        _488 = _492;
    }
    float _494 = _488;
    float _496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _498 = precise::max(0.0, _496);
    float _500 = _354;
    float _502 = _498;
    float _504 = _496;
    if (_456)
    {
        float _506 = _486 * 6.283185482025146484375;
        float _508 = cos(_506);
        _500 = _508;
    }
    float _510 = _500;
    float _512 = -_442;
    float _514 = -_498;
    float _516 = fma(_424, _512, _514);
    if (_456)
    {
        float _518 = _516 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _502 = _518;
    }
    float _520 = _502;
    float _522 = _520;
    float _524 = _494;
    if (_456)
    {
        float _526 = fma(_494, _520, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _522 = _526;
    }
    float _528 = _522;
    float _530 = _528;
    if (!_456)
    {
        _524 = _446;
    }
    float _532 = _524;
    float _534 = _532;
    if (_456)
    {
        float _536 = _510 + (-1.0);
        _504 = _536;
    }
    float _538 = _504;
    float _540 = _538;
    if (_456)
    {
        float _542 = _478 * _528;
        _212 = _542;
    }
    float _544 = _212;
    if (!_456)
    {
        _530 = _516;
    }
    float _546 = _530;
    float _548 = sqrt(_438);
    float _550 = _546;
    if (_456)
    {
        float _552 = _538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _468 = _552;
    }
    float _554 = _468;
    float _556 = _554;
    if (_456)
    {
        float _558 = _444 * _544;
        _470 = _558;
    }
    float _560 = _470;
    if (!_456)
    {
        _540 = _448;
    }
    float _562 = _540;
    float _564 = _562;
    if (_456)
    {
        float _566 = _446 * _544;
        _534 = _566;
    }
    float _568 = _534;
    if (_456)
    {
        float _570 = fma(_516, _510, _554);
        _550 = _570;
    }
    float _572 = _550;
    if (_456)
    {
        float _574 = _560 * _560;
        _564 = _574;
    }
    float _576 = _564;
    if (!_456)
    {
        _556 = _450;
    }
    float _578 = _556;
    float _580 = _578;
    if (_456)
    {
        float _582 = _568 * _568;
        _580 = _582;
    }
    float _584 = _580;
    float _586 = _416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _588 = fma(_572, _572, _576);
    float _590 = _416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _592 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _586);
    float _594 = _588 + _584;
    float _596 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _590);
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _600 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[23].w, _598);
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = _416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _606 = rsqrt(_594);
    float _608 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[2].z, _596);
    float _610 = -_602;
    float _612 = _610 + 1.0;
    float _614 = _416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _616 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _604);
    float _618 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[3].z, _592);
    float _620 = _608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _622 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _614);
    float _624 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[1].z, _616);
    float _626 = abs(_612);
    float _628 = log2(_626);
    float _630 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _632 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[0].z, _622);
    float _634 = _624 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _636 = _620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _638 = _618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _640 = _632 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _642 = _634 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _644 = _606 * _560;
    float _646 = _606 * _572;
    float _648 = _606 * _568;
    float _650 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _642);
    float _652 = _644 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _654 = -_636;
    float _656 = fma(_654, _630, 1.0);
    float _658 = _634 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _660 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _650);
    float _662 = -_652;
    float _664 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[21].y, _662);
    float _666 = _628 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _668 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _658);
    float _670 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].w, _660);
    float _672 = -_648;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].z, _664);
    float _676 = _634 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _678 = log2(_656);
    float _680 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _668);
    float _682 = fma(_674, -0.5, 0.5);
    float _684 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _676);
    float _686 = _646 + 1.0;
    float _688 = 1.0 / _670;
    float _690 = exp2(_666);
    float _692 = _678 * 0.693147182464599609375;
    float _694 = _692 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _696 = sqrt(_682);
    float _698 = fma(_674, 0.5, 0.5);
    float _700 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _702 = fma(_698, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _704 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].w, _700);
    float _706 = -_646;
    float _708 = fma(_690, _686, _706);
    float _710 = fma(_698, _702, -0.212114393711090087890625);
    float _712 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].w, _680);
    float _714 = _704 * _688;
    float _716 = fma(_708, 0.5, 0.5);
    float _718 = fma(_698, _710, 1.570728778839111328125);
    float _720 = _712 * _688;
    float _722 = fma(_714, 0.5, 0.5);
    float _724 = _696 * 0.636619746685028076171875;
    float _726 = fma(_720, -0.5, 0.5);
    float _728 = -_718;
    float _730 = fma(_724, _728, 1.0);
    float3 _1935 = float3(_722, _726, _694);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_1935, float3(0.0), isnan(_1935)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_1935, float3(0.0), isnan(_1935)), level(0.0)).x;
    float3 _1946 = float3(_722, _726, _694);
    float4 _735 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_1946, float3(0.0), isnan(_1946)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_1946, float3(0.0), isnan(_1946)), level(0.0)).xyzw;
    float _737 = _735.x;
    float _739 = _735.y;
    float _741 = _735.z;
    float _743 = _735.w;
    float2 _1963 = float2(_730, _716);
    float3 _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_1963, float2(0.0), isnan(_1963)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_1963, float2(0.0), isnan(_1963)), level(0.0)).xyz;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = _634 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _757 = _628 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _759 = in.m_53.w;
    float _761 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _755);
    float _763 = exp2(_757);
    float _765 = in.m_53.z;
    float _767 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _761);
    float _769 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].w, _767);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _773 = _769 + _670;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _773 * 0.5;
    float _781 = -_763;
    float _783 = _781 + 1.0;
    float _785 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _783 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_55.w = _759;
    out.m_55.z = _765;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.z = _779;
    out.m_57.w = _670;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _793 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _704;
    out.gl_Position.y = _712;
    out.gl_Position.z = _769;
    out.gl_Position.w = _670;
    float _795 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_59.x = _777;
    out.m_59.y = _785;
    out.m_59.z = _793;
    out.m_59.w = _789;
    out.m_45.x = _795;
    float _797 = _787 * _732;
    float _799 = -_787;
    float _801 = _799 + 1.0;
    float _803 = _743 * _797;
    float _805 = _753 * _797;
    float _807 = _743 * _801;
    float _809 = fma(_749, _803, _737);
    float _811 = fma(_751, _803, _739);
    float _813 = fma(_743, _805, _741);
    out.m_61.x = _809;
    out.m_61.y = _811;
    out.m_61.z = _813;
    out.m_61.w = _807;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_42.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    float _88 = as_type<float>(_80);
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _86;
    if (!_84)
    {
        out.m_45.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _90 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _870 = as_type<float>(_96);
        out.gl_Position.z = _870;
    }
    if (!_84)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _100 = in.m_47.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_45.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _939 = as_type<float>(_132);
        out.gl_Position.z = _939;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_49.x;
    float _136 = in.m_49.y;
    float _138 = in.m_49.z;
    float _140 = in.m_49.w;
    float _142 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    float _148 = in.m_51.z;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _142;
    if (!_158)
    {
        float _176 = _142 * _142;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _134 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = _136 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _186 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _188 = _138;
    if (!_158)
    {
        float _190 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _144);
    float _196 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _146);
    float _200 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _148);
    float _204 = _196 * _194;
    float _206 = _200 * _198;
    bool _208 = !_158;
    float _210 = _192;
    float _212 = _144;
    if (!_208)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _142 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _142);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _242;
    }
    float _244 = _210;
    bool _246 = !_158;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _142 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _174 = _266;
    }
    float _268 = _174;
    float _270 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_268, _162, _270);
    float _280 = fma(_268, _160, _272);
    float _282 = _274 * _202;
    float _284 = fma(_268, _164, _276);
    float _286 = fma(_278, _140, _168);
    float _288 = fma(_280, _140, _166);
    float _290 = _206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _292 = fma(_284, _140, _170);
    float _294 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _296 = _206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _298 = fma(_204, (*spvDescriptorSet0.vp_c8)._m0[26].x, _290);
    float _300 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _302 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _294);
    float _304 = fma(_204, (*spvDescriptorSet0.vp_c8)._m0[24].x, _296);
    float _306 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _298);
    float _308 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _300);
    float _310 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _302);
    float _312 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _304);
    float _314 = _306 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _316 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _308);
    float _318 = _310 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _320 = _312 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _322 = _206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _326 = _318 + _314;
    float _328 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _330 = fma(_204, (*spvDescriptorSet0.vp_c8)._m0[25].x, _322);
    float _332 = _324 + _320;
    float _334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _336 = _326 + _334;
    float _338 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _328);
    float _340 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _330);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _332 + _342;
    float _346 = _336 * _336;
    float _348 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _338);
    float _350 = _340 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _352 = fma(_344, _344, _346);
    float _354 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _356 = sqrt(_352);
    float _358 = _354 + _350;
    bool _360 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _362 = _340;
    float _364 = _288;
    float _366 = _332;
    float _368 = _336;
    if (!_360)
    {
        _362 = _326;
    }
    float _370 = _362;
    float _372 = _370;
    if (!_360)
    {
        _364 = _358;
    }
    float _374 = _364;
    bool _376 = !_360;
    float _378 = _374;
    if (!_376)
    {
        float _380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _384 = _356 + _382;
        float _386 = rsqrt(_352);
        float _388 = _384 * _380;
        float _390 = _358 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = _388 * 0.15915493667125701904296875;
        float _394 = _392 * 6.283185482025146484375;
        float _396 = cos(_394);
        float _398 = _392 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = _396 + (-1.0);
        float _404 = fma(_400, _390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _406 = _402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _408 = _386 * _404;
        float _410 = fma(_358, _396, _406);
        float _412 = fma(_344, _408, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _414 = fma(_336, _408, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _378 = _410;
        _366 = _412;
        _372 = _414;
    }
    float _416 = _378;
    float _418 = _366;
    float _420 = _372;
    float _422 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _424 = _416 + _422;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _428 = _418 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _432 = _420 + _430;
    float _434 = _424 * _424;
    float _436 = fma(_428, _428, _434);
    float _438 = fma(_432, _432, _436);
    float _440 = rsqrt(_438);
    float _442 = _440 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _444 = _428 * _442;
    float _446 = _432 * _442;
    float _448 = _444 * _444;
    float _450 = _446 * _446;
    float _452 = _448 + _450;
    float _454 = sqrt(_452);
    bool _456 = _454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _460 = _454 + _458;
    float _462 = _440;
    float _464 = _452;
    float _466 = _460;
    float _468 = _424;
    float _470 = _444;
    if (_456)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _462 = _472;
    }
    float _474 = _462;
    if (_456)
    {
        float _476 = rsqrt(_452);
        _464 = _476;
    }
    float _478 = _464;
    if (_456)
    {
        float _480 = _460 * _474;
        _466 = _480;
    }
    float _482 = _466;
    if (_456)
    {
        float _484 = _482 * 0.15915493667125701904296875;
        _368 = _484;
    }
    float _486 = _368;
    float _488 = _432;
    if (_456)
    {
        float _490 = _486 * 6.283185482025146484375;
        float _492 = sin(_490);
        _488 = _492;
    }
    float _494 = _488;
    float _496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _498 = precise::max(0.0, _496);
    float _500 = _354;
    float _502 = _498;
    float _504 = _496;
    if (_456)
    {
        float _506 = _486 * 6.283185482025146484375;
        float _508 = cos(_506);
        _500 = _508;
    }
    float _510 = _500;
    float _512 = -_442;
    float _514 = -_498;
    float _516 = fma(_424, _512, _514);
    if (_456)
    {
        float _518 = _516 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _502 = _518;
    }
    float _520 = _502;
    float _522 = _520;
    float _524 = _494;
    if (_456)
    {
        float _526 = fma(_494, _520, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _522 = _526;
    }
    float _528 = _522;
    float _530 = _528;
    if (!_456)
    {
        _524 = _446;
    }
    float _532 = _524;
    float _534 = _532;
    if (_456)
    {
        float _536 = _510 + (-1.0);
        _504 = _536;
    }
    float _538 = _504;
    float _540 = _538;
    if (_456)
    {
        float _542 = _478 * _528;
        _212 = _542;
    }
    float _544 = _212;
    if (!_456)
    {
        _530 = _516;
    }
    float _546 = _530;
    float _548 = sqrt(_438);
    float _550 = _546;
    if (_456)
    {
        float _552 = _538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _468 = _552;
    }
    float _554 = _468;
    float _556 = _554;
    if (_456)
    {
        float _558 = _444 * _544;
        _470 = _558;
    }
    float _560 = _470;
    if (!_456)
    {
        _540 = _448;
    }
    float _562 = _540;
    float _564 = _562;
    if (_456)
    {
        float _566 = _446 * _544;
        _534 = _566;
    }
    float _568 = _534;
    if (_456)
    {
        float _570 = fma(_516, _510, _554);
        _550 = _570;
    }
    float _572 = _550;
    if (_456)
    {
        float _574 = _560 * _560;
        _564 = _574;
    }
    float _576 = _564;
    if (!_456)
    {
        _556 = _450;
    }
    float _578 = _556;
    float _580 = _578;
    if (_456)
    {
        float _582 = _568 * _568;
        _580 = _582;
    }
    float _584 = _580;
    float _586 = _416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _588 = fma(_572, _572, _576);
    float _590 = _416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _592 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _586);
    float _594 = _588 + _584;
    float _596 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _590);
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _600 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[23].w, _598);
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = _416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _606 = rsqrt(_594);
    float _608 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[2].z, _596);
    float _610 = -_602;
    float _612 = _610 + 1.0;
    float _614 = _416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _616 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _604);
    float _618 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[3].z, _592);
    float _620 = _608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _622 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _614);
    float _624 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[1].z, _616);
    float _626 = abs(_612);
    float _628 = log2(_626);
    float _630 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _632 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[0].z, _622);
    float _634 = _624 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _636 = _620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _638 = _618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _640 = _632 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _642 = _634 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _644 = _606 * _560;
    float _646 = _606 * _572;
    float _648 = _606 * _568;
    float _650 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _642);
    float _652 = _644 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _654 = -_636;
    float _656 = fma(_654, _630, 1.0);
    float _658 = _634 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _660 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _650);
    float _662 = -_652;
    float _664 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[21].y, _662);
    float _666 = _628 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _668 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _658);
    float _670 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].w, _660);
    float _672 = -_648;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].z, _664);
    float _676 = _634 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _678 = log2(_656);
    float _680 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _668);
    float _682 = fma(_674, -0.5, 0.5);
    float _684 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _676);
    float _686 = _646 + 1.0;
    float _688 = 1.0 / _670;
    float _690 = exp2(_666);
    float _692 = _678 * 0.693147182464599609375;
    float _694 = _692 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _696 = sqrt(_682);
    float _698 = fma(_674, 0.5, 0.5);
    float _700 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _702 = fma(_698, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _704 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].w, _700);
    float _706 = -_646;
    float _708 = fma(_690, _686, _706);
    float _710 = fma(_698, _702, -0.212114393711090087890625);
    float _712 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].w, _680);
    float _714 = _704 * _688;
    float _716 = fma(_708, 0.5, 0.5);
    float _718 = fma(_698, _710, 1.570728778839111328125);
    float _720 = _712 * _688;
    float _722 = fma(_714, 0.5, 0.5);
    float _724 = _696 * 0.636619746685028076171875;
    float _726 = fma(_720, -0.5, 0.5);
    float _728 = -_718;
    float _730 = fma(_724, _728, 1.0);
    float3 _1935 = float3(_722, _726, _694);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_1935, float3(0.0), isnan(_1935)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_1935, float3(0.0), isnan(_1935)), level(0.0)).x;
    float3 _1946 = float3(_722, _726, _694);
    float4 _735 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_1946, float3(0.0), isnan(_1946)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_1946, float3(0.0), isnan(_1946)), level(0.0)).xyzw;
    float _737 = _735.x;
    float _739 = _735.y;
    float _741 = _735.z;
    float _743 = _735.w;
    float2 _1963 = float2(_730, _716);
    float3 _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_1963, float2(0.0), isnan(_1963)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_1963, float2(0.0), isnan(_1963)), level(0.0)).xyz;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = _634 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _757 = _628 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _759 = in.m_53.w;
    float _761 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _755);
    float _763 = exp2(_757);
    float _765 = in.m_53.z;
    float _767 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _761);
    float _769 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].w, _767);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _773 = _769 + _670;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _773 * 0.5;
    float _781 = -_763;
    float _783 = _781 + 1.0;
    float _785 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _783 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_55.w = _759;
    out.m_55.z = _765;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.z = _779;
    out.m_57.w = _670;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _793 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _704;
    out.gl_Position.y = _712;
    out.gl_Position.z = _769;
    out.gl_Position.w = _670;
    float _795 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_59.x = _777;
    out.m_59.y = _785;
    out.m_59.z = _793;
    out.m_59.w = _789;
    out.m_45.x = _795;
    float _797 = _787 * _732;
    float _799 = -_787;
    float _801 = _799 + 1.0;
    float _803 = _743 * _797;
    float _805 = _753 * _797;
    float _807 = _743 * _801;
    float _809 = fma(_749, _803, _737);
    float _811 = fma(_751, _803, _739);
    float _813 = fma(_743, _805, _741);
    out.m_61.x = _809;
    out.m_61.y = _811;
    out.m_61.z = _813;
    out.m_61.w = _807;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

