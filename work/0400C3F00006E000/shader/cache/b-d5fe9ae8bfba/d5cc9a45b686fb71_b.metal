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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_49 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = in.m_44.w;
    float _89 = trunc(_85);
    int _92 = int(_89);
    float _94 = -_87;
    float _96 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _96;
    bool _100 = _92 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    if (!_100)
    {
        out.m_49.x = 0.0;
    }
    int _106 = 0;
    if (!_100)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1282 = as_type<float>(_110);
        out.gl_Position.z = _1282;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _114 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_87);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = in.m_51.x;
    float _126 = float(_92);
    bool _128 = _96 >= _126;
    bool _130 = !_122;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_49.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _112 = as_type<int>(_138);
    }
    int _140 = _112;
    out.m_53.x = _124;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1342 = as_type<float>(_140);
        out.gl_Position.z = _1342;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_55.x;
    float _144 = in.m_55.y;
    float _146 = in.m_55.z;
    float _148 = in.m_55.w;
    float _150 = in.m_51.y;
    float _152 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _154 = in.m_57.x;
    float _156 = in.m_57.y;
    float _158 = in.m_57.z;
    float _160 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].x, _124);
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[192].y + (-1.0);
    float _164 = in.m_59.z;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_59.w;
    float _178 = in.m_59.x;
    float _180 = fma(_148, 0.752160012722015380859375, _160);
    float _182 = _142 * _142;
    float _184 = fma(_146, 2.0, -1.0);
    float _186 = fma(_148, 2.0, -1.0);
    float _188 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[191].z, _180);
    float _190 = _182 * _144;
    float _192 = in.m_59.y;
    float _194 = -_186;
    float _196 = _184 + _194;
    float _198 = _188 * 6.283185482025146484375;
    float _200 = fma(_190, _162, 1.0);
    float _202 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0033333338797092437744140625, _150);
    float _204 = fma(_142, 2.0, -1.0);
    float _206 = _198 * 0.15915493667125701904296875;
    float _208 = in.m_42.x;
    float _210 = in.m_42.y;
    float _212 = in.m_42.z;
    float _214 = fma(_148, 0.9545400142669677734375, _202);
    float _216 = _144 * 7.0;
    float _218 = _144 * 25.0;
    float _220 = _206 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[192].z, _214);
    float _226 = _204 * _216;
    float _228 = in.m_44.x;
    float _230 = in.m_44.y;
    float _232 = in.m_44.z;
    float _234 = -_218;
    float _236 = fma(_200, _158, _234);
    float _238 = _224 * 6.283185482025146484375;
    float _240 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = _182 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _236);
    float _246 = _238 * 0.15915493667125701904296875;
    float _248 = _240 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _250 = fma(_242, _144, _156);
    float _252 = fma(_144, _142, 1.0);
    float _254 = _246 * 6.283185482025146484375;
    float _256 = sin(_254);
    float _258 = _248 * _244;
    float _260 = _222 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _262 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _264 = fma(_260, _144, _154);
    float _266 = _154;
    float _268 = _142;
    float _270 = _262;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[192].w;
    if (!_174)
    {
        float _274 = _262 * _262;
        float _276 = _274 * 0.5;
        _266 = _276;
    }
    float _278 = _266;
    if (!_174)
    {
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _280;
    }
    float _282 = _268;
    bool _284 = !_174;
    float _286 = _282;
    if (!_284)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _262 * _290;
        float _300 = 1.0 / _294;
        float _302 = _296 * 0.693147182464599609375;
        float _304 = exp2(_298);
        float _306 = 1.0 / _302;
        float _308 = _304 + (-1.0);
        float _310 = -_308;
        float _312 = fma(_310, _306, _262);
        float _314 = _312 * _300;
        float _316 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _286 = _316;
    }
    float _318 = _286;
    bool _320 = !_174;
    if (!_320)
    {
        float _322 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _324 = log2(_322);
        float _326 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _328 = _326 + 1.0;
        float _330 = 1.0 / _328;
        float _332 = _262 * _324;
        float _334 = exp2(_332);
        float _336 = -_334;
        float _338 = _336 + 1.0;
        float _340 = _338 * _330;
        _270 = _340;
    }
    float _342 = _270;
    float _344 = fma(_264, _252, _226);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _348 = _346 + 1.0;
    float _350 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _352 = fma(_256, 2.25, -1.75);
    float _354 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = fma(_348, _144, (*spvDescriptorSet0.vp_c9)._m0[192].w);
    float _358 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = fma(_342, _230, _350);
    float _362 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = fma(_356, _196, _344);
    float _366 = fma(_342, _228, _354);
    float _368 = fma(_342, _232, _358);
    float _370 = fma(_360, _176, _210);
    float _372 = fma(_196, _352, _364);
    float _374 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _378 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _250);
    float _380 = _372 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _382 = fma(_366, _176, _208);
    float _384 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _386 = _370 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = _376 * _378;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _380);
    float _392 = fma(_368, _176, _212);
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _396 = _370 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _398 = _388 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _400 = _384 * _390;
    float _402 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    float _404 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].x, _396);
    float _406 = _388 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[10].x, _398);
    float _410 = in.m_61.x;
    float _412 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _404);
    float _414 = _402 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _416 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[8].x, _406);
    float _418 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[10].z, _408);
    float _420 = in.m_51.z;
    float _422 = in.m_51.w;
    float _424 = _412 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _426 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _416);
    float _428 = _414 + _418;
    float _430 = in.m_61.y;
    float _432 = _424 + _426;
    float _434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _436 = _428 + _434;
    float _438 = _388 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _442 = _440 != 0;
    float _444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _446 = _432 + _444;
    float _448 = _436 * _436;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _452 = _450 != 0;
    float _454 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[9].x, _438);
    float _456 = fma(_446, _446, _448);
    float _458 = _370 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _460 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[9].z, _454);
    float _462 = sqrt(_456);
    float _464 = _384 * _410;
    float _466 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].x, _458);
    float _468 = _426;
    float _470 = _464;
    float _472 = _460;
    float _474 = _432;
    if (!_442)
    {
        _468 = _410;
    }
    float _476 = _468;
    float _478 = -_464;
    float _480 = _478 + 1.0;
    bool _482 = _420 > 0.5;
    float _484 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _466);
    bool _486 = _422 > 0.5;
    float _488 = _376 * _430;
    int _490 = _482 ? as_type<int>(_480) : as_type<int>(_464);
    float _492 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _504 = _502 != 0;
    float _506 = -_488;
    float _508 = _506 + 1.0;
    bool _510 = !_452;
    float _512 = _510 ? _464 : as_type<float>(_490);
    float _514 = _492 + _460;
    bool _516 = _462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _518 = _486 ? _508 : _488;
    bool _520 = _150 > 0.5;
    bool _522 = !_496;
    float _524 = _522 ? _488 : _518;
    float _526 = _488;
    float _528 = _518;
    float _530 = _480;
    float _532 = _476;
    if (_500)
    {
        float _534 = _520 ? _480 : _464;
        _470 = _534;
    }
    float _536 = _470;
    if (_504)
    {
        float _538 = _482 ? _508 : _488;
        _526 = _538;
    }
    float _540 = _526;
    if (!_516)
    {
        _528 = _432;
    }
    float _542 = _528;
    float _544 = _542;
    if (!_516)
    {
        _530 = _428;
    }
    float _546 = _530;
    float _548 = _546;
    if (!_516)
    {
        _472 = _514;
    }
    float _550 = _472;
    bool _552 = !_516;
    float _554 = _550;
    if (!_552)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _560 = _462 + _558;
        float _562 = _514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _564 = rsqrt(_456);
        float _566 = _560 * _556;
        float _568 = _566 * 0.15915493667125701904296875;
        float _570 = _568 * 6.283185482025146484375;
        float _572 = cos(_570);
        float _574 = _568 * 6.283185482025146484375;
        float _576 = sin(_574);
        float _578 = _572 + (-1.0);
        float _580 = _578 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _582 = fma(_576, _562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _584 = fma(_514, _572, _580);
        float _586 = _564 * _582;
        float _588 = fma(_446, _586, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _590 = fma(_436, _586, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _554 = _584;
        _544 = _588;
        _548 = _590;
    }
    float _592 = _554;
    float _594 = _544;
    float _596 = _548;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _592 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _594 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _608 = _596 + _606;
    float _610 = _600 * _600;
    float _612 = fma(_604, _604, _610);
    float _614 = fma(_608, _608, _612);
    float _616 = rsqrt(_614);
    float _618 = sqrt(_614);
    float _620 = _616 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _622 = _604 * _620;
    float _624 = _608 * _620;
    float _626 = _622 * _622;
    float _628 = _624 * _624;
    float _630 = _626 + _628;
    float _632 = sqrt(_630);
    bool _634 = _632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _636 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _638 = _632 + _636;
    float _640 = _616;
    float _642 = _630;
    float _644 = _638;
    float _646 = _600;
    if (_634)
    {
        float _648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _640 = _648;
    }
    float _650 = _640;
    if (_634)
    {
        float _652 = rsqrt(_630);
        _642 = _652;
    }
    float _654 = _642;
    float _656 = _654;
    if (_634)
    {
        float _658 = _638 * _650;
        _644 = _658;
    }
    float _660 = _644;
    if (_634)
    {
        float _662 = _660 * 0.15915493667125701904296875;
        _474 = _662;
    }
    float _664 = _474;
    float _666 = _608;
    float _668 = _664;
    if (_634)
    {
        float _670 = _664 * 6.283185482025146484375;
        float _672 = sin(_670);
        _666 = _672;
    }
    float _674 = _666;
    float _676 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _678 = precise::max(0.0, _676);
    float _680 = _650;
    float _682 = _678;
    if (_634)
    {
        float _684 = _664 * 6.283185482025146484375;
        float _686 = cos(_684);
        _680 = _686;
    }
    float _688 = _680;
    float _690 = -_620;
    float _692 = -_678;
    float _694 = fma(_600, _690, _692);
    if (_634)
    {
        float _696 = _694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _696;
    }
    float _698 = _646;
    float _700 = _698;
    float _702 = _674;
    if (_634)
    {
        float _704 = fma(_674, _698, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _700 = _704;
    }
    float _706 = _700;
    float _708 = _706;
    if (!_634)
    {
        _702 = _622;
    }
    float _710 = _702;
    float _712 = _710;
    float _714 = _688;
    if (_634)
    {
        float _716 = _688 + (-1.0);
        _682 = _716;
    }
    float _718 = _682;
    float _720 = _718;
    if (_634)
    {
        float _722 = _654 * _706;
        _272 = _722;
    }
    float _724 = _272;
    if (!_634)
    {
        _708 = _694;
    }
    float _726 = _708;
    float _728 = _726;
    if (_634)
    {
        float _730 = _718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _668 = _730;
    }
    float _732 = _668;
    if (_634)
    {
        float _734 = _622 * _724;
        _712 = _734;
    }
    float _736 = _712;
    if (!_634)
    {
        _720 = _624;
    }
    float _738 = _720;
    float _740 = _738;
    if (_634)
    {
        float _742 = _624 * _724;
        _740 = _742;
    }
    float _744 = _740;
    if (!_634)
    {
        _656 = _626;
    }
    float _746 = _656;
    float _748 = _746;
    if (_634)
    {
        float _750 = fma(_694, _688, _732);
        _728 = _750;
    }
    float _752 = _728;
    if (_634)
    {
        float _754 = _736 * _736;
        _748 = _754;
    }
    float _756 = _748;
    if (!_634)
    {
        _714 = _628;
    }
    float _758 = _714;
    float _760 = _758;
    if (_634)
    {
        float _762 = _744 * _744;
        _760 = _762;
    }
    float _764 = _760;
    float _766 = fma(_752, _752, _756);
    float _768 = _766 + _764;
    float _770 = _592 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _774 = fma(_618, (*spvDescriptorSet0.vp_c15)._m0[23].w, _772);
    float _776 = precise::clamp(_774, 0.0, 1.0);
    float _778 = _592 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _780 = rsqrt(_768);
    float _782 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[2].x, _770);
    float _784 = -_776;
    float _786 = _784 + 1.0;
    float _788 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[1].x, _778);
    float _790 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _792 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[2].z, _782);
    float _794 = _592 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _796 = _592 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _798 = abs(_786);
    float _800 = log2(_798);
    float _802 = _792 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _804 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[0].x, _794);
    float _806 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[1].z, _788);
    float _808 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[3].x, _796);
    float _810 = _802 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _812 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[0].z, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _816 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[3].z, _808);
    float _818 = -_810;
    float _820 = fma(_818, _790, 1.0);
    float _822 = _780 * _736;
    float _824 = _812 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _826 = _814 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _828 = _780 * _752;
    float _830 = _822 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _832 = _816 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].x, _826);
    float _836 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _838 = _780 * _744;
    float _840 = -_830;
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[21].y, _840);
    float _844 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _834);
    float _846 = exp2(_836);
    float _848 = _814 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _850 = -_838;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[21].z, _842);
    float _854 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _856 = _814 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _858 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].x, _848);
    float _860 = fma(_852, -0.5, 0.5);
    float _862 = fma(_852, 0.5, 0.5);
    float _864 = 1.0 / _854;
    float _866 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].x, _856);
    float _868 = _828 + 1.0;
    float _870 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _858);
    float _872 = fma(_862, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _874 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _866);
    float _876 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[4].w, _870);
    float _878 = log2(_820);
    float _880 = -_828;
    float _882 = fma(_846, _868, _880);
    float _884 = fma(_862, _872, -0.212114393711090087890625);
    float _886 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[5].w, _874);
    float _888 = fma(_862, _884, 1.570728778839111328125);
    float _890 = fma(_882, 0.5, 0.5);
    float _892 = sqrt(_860);
    float _894 = _876 * _864;
    float _896 = _886 * _864;
    float _898 = fma(_896, -0.5, 0.5);
    float _900 = _878 * 0.693147182464599609375;
    float _902 = fma(_894, 0.5, 0.5);
    float _904 = _900 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _906 = _892 * 0.636619746685028076171875;
    float3 _2596 = float3(_902, _898, _904);
    float _908 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2596, float3(0.0), isnan(_2596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2596, float3(0.0), isnan(_2596)), level(0.0)).x;
    float _910 = -_888;
    float _912 = fma(_906, _910, 1.0);
    float3 _2612 = float3(_902, _898, _904);
    float4 _915 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2612, float3(0.0), isnan(_2612)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2612, float3(0.0), isnan(_2612)), level(0.0)).xyzw;
    float _917 = _915.x;
    float _919 = _915.y;
    float _921 = _915.z;
    float _923 = _915.w;
    float2 _2629 = float2(_912, _890);
    float3 _927 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2629, float2(0.0), isnan(_2629)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2629, float2(0.0), isnan(_2629)), level(0.0)).xyz;
    float _929 = _927.x;
    float _931 = _927.y;
    float _933 = _927.z;
    float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _937 = _124 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _941 = _939 != 0;
    float _943 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _947 = _945 != 0;
    float _949 = -_430;
    float _951 = _949 + 1.0;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _955 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _957 = exp2(_943);
    int _959 = _520 ? as_type<int>(_951) : as_type<int>(_430);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _963 = fma(_955, -2.0, _953);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _967 = _947 ? as_type<float>(_959) : _430;
    float _969 = -_961;
    float _971 = fma(_937, 2.0, _969);
    float _973 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _975 = _961;
    float _977 = _973;
    bool _979 = _947;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_941)
    {
        _975 = _124;
    }
    float _983 = _975;
    float _985 = _935;
    float _987 = _983;
    if (!_941)
    {
        float _989 = in.m_51.z;
        _985 = _989;
    }
    float _991 = _985;
    float _993 = fma(_967, _973, -0.5);
    if (!_941)
    {
        _987 = _420;
    }
    float _995 = _987;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_941)
    {
        _977 = _150;
    }
    float _999 = _977;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1003 = _999;
    int _1005 = as_type<int>(_1001);
    if (_442)
    {
        bool _1007 = _124 > 0.5;
        _979 = _1007;
    }
    bool _1009 = _979;
    float _1011 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _997);
    if (!_941)
    {
        _981 = _999;
    }
    float _1013 = _981;
    float _1015 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1001);
    float _1017 = _1013;
    if (_941)
    {
        _1003 = _150;
    }
    float _1019 = _1003;
    float _1021 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1011);
    float _1023 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[76].y, _963);
    float _1025 = _1019;
    if (_442)
    {
        float _1027 = -_410;
        float _1029 = _1027 + 1.0;
        _1005 = as_type<int>(_1029);
    }
    int _1031 = _1005;
    if (_941)
    {
        _1017 = _124;
    }
    float _1033 = _1017;
    float _1035 = _995 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1037 = -_1023;
    float _1039 = fma(_1021, _993, _1037);
    float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1043 = _1035;
    if (_442)
    {
        float _1045 = _1009 ? as_type<float>(_1031) : _410;
        _532 = _1045;
    }
    float _1047 = _532;
    float _1049 = -_965;
    float _1051 = fma(_1035, 2.0, _1049);
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1055 = -_96;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _971);
    float _1059 = _991;
    if (!_941)
    {
        _1043 = _991;
    }
    float _1061 = _1043;
    float _1063 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1053);
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1067 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1069 = _1061;
    if (_941)
    {
        _1059 = _1019;
    }
    float _1071 = _1059;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1075 = -_1065;
    float _1077 = fma(_1067, 2.0, _1075);
    float _1079 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1073);
    float _1081 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_941)
    {
        _1069 = _1019;
    }
    float _1085 = _1069;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1091 = fma(_1081, _1047, -0.5);
    float _1093 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1087);
    if (!_941)
    {
        _1025 = _124;
    }
    float _1095 = _1025;
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1099 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1093);
    float _1101 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1089);
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1105 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1107 = fma(_1099, _1091, _1057);
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1113 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1115 = fma(_1105, -2.0, _1103);
    out.m_63.y = _144;
    float _1117 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1015);
    float _1119 = fma(_1113, -2.0, _1109);
    float _1121 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1101);
    float _1123 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1063);
    float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1127 = -_96;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1051);
    float _1131 = -_96;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1077);
    float _1135 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1137 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1079);
    float _1139 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1115);
    float _1141 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1119);
    float _1143 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1145 = _814 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1147 = fma(_1135, _536, -0.5);
    float _1149 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1151 = -_957;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_1143, _512, -0.5);
    float _1157 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1145);
    float _1159 = fma(_1149, _540, -0.5);
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1163 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1165 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1157);
    float _1167 = fma(_1121, _1147, _1129);
    float _1169 = -_1141;
    float _1171 = fma(_1117, _1159, _1169);
    float _1173 = fma(_1163, _524, -0.5);
    float _1175 = fma(_1123, _1155, _1133);
    float _1177 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1165);
    out.m_63.w = _148;
    float _1179 = -_1139;
    float _1181 = fma(_1137, _1173, _1179);
    float _1183 = _1039 + 0.5;
    float _1185 = _1167 + 0.5;
    float _1187 = _1171 + 0.5;
    float _1189 = _1175 + 0.5;
    float _1191 = _1177 + _854;
    float _1193 = _1181 + 0.5;
    out.m_65.x = _1185;
    out.m_65.y = _1187;
    float _1195 = _1107 + 0.5;
    float _1197 = _1191 * 0.5;
    float _1199 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1195;
    out.m_67.y = _1183;
    out.m_67.z = _1189;
    out.m_67.w = _1193;
    out.gl_Position.x = _876;
    out.gl_Position.y = _886;
    out.gl_Position.z = _1177;
    out.gl_Position.w = _854;
    out.m_69.z = _1197;
    out.m_69.w = _854;
    out.m_49.x = _1199;
    float _1201 = _1161 * _908;
    float _1203 = _923 * _1201;
    float _1205 = _933 * _1201;
    float _1207 = -_1161;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_929, _1203, _917);
    float _1213 = fma(_931, _1203, _919);
    float _1215 = fma(_923, _1205, _921);
    float _1217 = _923 * _1209;
    out.m_71.x = _1211;
    out.m_71.y = _1213;
    out.m_71.z = _1215;
    out.m_71.w = _1217;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = in.m_44.w;
    float _89 = trunc(_85);
    int _92 = int(_89);
    float _94 = -_87;
    float _96 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _96;
    bool _100 = _92 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    if (!_100)
    {
        out.m_49.x = 0.0;
    }
    int _106 = 0;
    if (!_100)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1282 = as_type<float>(_110);
        out.gl_Position.z = _1282;
    }
    if (!_100)
    {
        return out;
    }
    bool _114 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_87);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = in.m_51.x;
    float _126 = float(_92);
    bool _128 = _96 >= _126;
    bool _130 = !_122;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_49.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _112 = as_type<int>(_138);
    }
    int _140 = _112;
    out.m_53.x = _124;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1342 = as_type<float>(_140);
        out.gl_Position.z = _1342;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_55.x;
    float _144 = in.m_55.y;
    float _146 = in.m_55.z;
    float _148 = in.m_55.w;
    float _150 = in.m_51.y;
    float _152 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _154 = in.m_57.x;
    float _156 = in.m_57.y;
    float _158 = in.m_57.z;
    float _160 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].x, _124);
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[192].y + (-1.0);
    float _164 = in.m_59.z;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_59.w;
    float _178 = in.m_59.x;
    float _180 = fma(_148, 0.752160012722015380859375, _160);
    float _182 = _142 * _142;
    float _184 = fma(_146, 2.0, -1.0);
    float _186 = fma(_148, 2.0, -1.0);
    float _188 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[191].z, _180);
    float _190 = _182 * _144;
    float _192 = in.m_59.y;
    float _194 = -_186;
    float _196 = _184 + _194;
    float _198 = _188 * 6.283185482025146484375;
    float _200 = fma(_190, _162, 1.0);
    float _202 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0033333338797092437744140625, _150);
    float _204 = fma(_142, 2.0, -1.0);
    float _206 = _198 * 0.15915493667125701904296875;
    float _208 = in.m_42.x;
    float _210 = in.m_42.y;
    float _212 = in.m_42.z;
    float _214 = fma(_148, 0.9545400142669677734375, _202);
    float _216 = _144 * 7.0;
    float _218 = _144 * 25.0;
    float _220 = _206 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[192].z, _214);
    float _226 = _204 * _216;
    float _228 = in.m_44.x;
    float _230 = in.m_44.y;
    float _232 = in.m_44.z;
    float _234 = -_218;
    float _236 = fma(_200, _158, _234);
    float _238 = _224 * 6.283185482025146484375;
    float _240 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = _182 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _236);
    float _246 = _238 * 0.15915493667125701904296875;
    float _248 = _240 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _250 = fma(_242, _144, _156);
    float _252 = fma(_144, _142, 1.0);
    float _254 = _246 * 6.283185482025146484375;
    float _256 = sin(_254);
    float _258 = _248 * _244;
    float _260 = _222 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _262 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _264 = fma(_260, _144, _154);
    float _266 = _154;
    float _268 = _142;
    float _270 = _262;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[192].w;
    if (!_174)
    {
        float _274 = _262 * _262;
        float _276 = _274 * 0.5;
        _266 = _276;
    }
    float _278 = _266;
    if (!_174)
    {
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _280;
    }
    float _282 = _268;
    bool _284 = !_174;
    float _286 = _282;
    if (!_284)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _262 * _290;
        float _300 = 1.0 / _294;
        float _302 = _296 * 0.693147182464599609375;
        float _304 = exp2(_298);
        float _306 = 1.0 / _302;
        float _308 = _304 + (-1.0);
        float _310 = -_308;
        float _312 = fma(_310, _306, _262);
        float _314 = _312 * _300;
        float _316 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _286 = _316;
    }
    float _318 = _286;
    bool _320 = !_174;
    if (!_320)
    {
        float _322 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _324 = log2(_322);
        float _326 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _328 = _326 + 1.0;
        float _330 = 1.0 / _328;
        float _332 = _262 * _324;
        float _334 = exp2(_332);
        float _336 = -_334;
        float _338 = _336 + 1.0;
        float _340 = _338 * _330;
        _270 = _340;
    }
    float _342 = _270;
    float _344 = fma(_264, _252, _226);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _348 = _346 + 1.0;
    float _350 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _352 = fma(_256, 2.25, -1.75);
    float _354 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = fma(_348, _144, (*spvDescriptorSet0.vp_c9)._m0[192].w);
    float _358 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = fma(_342, _230, _350);
    float _362 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = fma(_356, _196, _344);
    float _366 = fma(_342, _228, _354);
    float _368 = fma(_342, _232, _358);
    float _370 = fma(_360, _176, _210);
    float _372 = fma(_196, _352, _364);
    float _374 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _378 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _250);
    float _380 = _372 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _382 = fma(_366, _176, _208);
    float _384 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _386 = _370 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = _376 * _378;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _380);
    float _392 = fma(_368, _176, _212);
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _396 = _370 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _398 = _388 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _400 = _384 * _390;
    float _402 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    float _404 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].x, _396);
    float _406 = _388 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[10].x, _398);
    float _410 = in.m_61.x;
    float _412 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _404);
    float _414 = _402 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _416 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[8].x, _406);
    float _418 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[10].z, _408);
    float _420 = in.m_51.z;
    float _422 = in.m_51.w;
    float _424 = _412 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _426 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _416);
    float _428 = _414 + _418;
    float _430 = in.m_61.y;
    float _432 = _424 + _426;
    float _434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _436 = _428 + _434;
    float _438 = _388 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _442 = _440 != 0;
    float _444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _446 = _432 + _444;
    float _448 = _436 * _436;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _452 = _450 != 0;
    float _454 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[9].x, _438);
    float _456 = fma(_446, _446, _448);
    float _458 = _370 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _460 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[9].z, _454);
    float _462 = sqrt(_456);
    float _464 = _384 * _410;
    float _466 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].x, _458);
    float _468 = _426;
    float _470 = _464;
    float _472 = _460;
    float _474 = _432;
    if (!_442)
    {
        _468 = _410;
    }
    float _476 = _468;
    float _478 = -_464;
    float _480 = _478 + 1.0;
    bool _482 = _420 > 0.5;
    float _484 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _466);
    bool _486 = _422 > 0.5;
    float _488 = _376 * _430;
    int _490 = _482 ? as_type<int>(_480) : as_type<int>(_464);
    float _492 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _504 = _502 != 0;
    float _506 = -_488;
    float _508 = _506 + 1.0;
    bool _510 = !_452;
    float _512 = _510 ? _464 : as_type<float>(_490);
    float _514 = _492 + _460;
    bool _516 = _462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _518 = _486 ? _508 : _488;
    bool _520 = _150 > 0.5;
    bool _522 = !_496;
    float _524 = _522 ? _488 : _518;
    float _526 = _488;
    float _528 = _518;
    float _530 = _480;
    float _532 = _476;
    if (_500)
    {
        float _534 = _520 ? _480 : _464;
        _470 = _534;
    }
    float _536 = _470;
    if (_504)
    {
        float _538 = _482 ? _508 : _488;
        _526 = _538;
    }
    float _540 = _526;
    if (!_516)
    {
        _528 = _432;
    }
    float _542 = _528;
    float _544 = _542;
    if (!_516)
    {
        _530 = _428;
    }
    float _546 = _530;
    float _548 = _546;
    if (!_516)
    {
        _472 = _514;
    }
    float _550 = _472;
    bool _552 = !_516;
    float _554 = _550;
    if (!_552)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _560 = _462 + _558;
        float _562 = _514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _564 = rsqrt(_456);
        float _566 = _560 * _556;
        float _568 = _566 * 0.15915493667125701904296875;
        float _570 = _568 * 6.283185482025146484375;
        float _572 = cos(_570);
        float _574 = _568 * 6.283185482025146484375;
        float _576 = sin(_574);
        float _578 = _572 + (-1.0);
        float _580 = _578 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _582 = fma(_576, _562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _584 = fma(_514, _572, _580);
        float _586 = _564 * _582;
        float _588 = fma(_446, _586, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _590 = fma(_436, _586, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _554 = _584;
        _544 = _588;
        _548 = _590;
    }
    float _592 = _554;
    float _594 = _544;
    float _596 = _548;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _592 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _594 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _608 = _596 + _606;
    float _610 = _600 * _600;
    float _612 = fma(_604, _604, _610);
    float _614 = fma(_608, _608, _612);
    float _616 = rsqrt(_614);
    float _618 = sqrt(_614);
    float _620 = _616 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _622 = _604 * _620;
    float _624 = _608 * _620;
    float _626 = _622 * _622;
    float _628 = _624 * _624;
    float _630 = _626 + _628;
    float _632 = sqrt(_630);
    bool _634 = _632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _636 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _638 = _632 + _636;
    float _640 = _616;
    float _642 = _630;
    float _644 = _638;
    float _646 = _600;
    if (_634)
    {
        float _648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _640 = _648;
    }
    float _650 = _640;
    if (_634)
    {
        float _652 = rsqrt(_630);
        _642 = _652;
    }
    float _654 = _642;
    float _656 = _654;
    if (_634)
    {
        float _658 = _638 * _650;
        _644 = _658;
    }
    float _660 = _644;
    if (_634)
    {
        float _662 = _660 * 0.15915493667125701904296875;
        _474 = _662;
    }
    float _664 = _474;
    float _666 = _608;
    float _668 = _664;
    if (_634)
    {
        float _670 = _664 * 6.283185482025146484375;
        float _672 = sin(_670);
        _666 = _672;
    }
    float _674 = _666;
    float _676 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _678 = precise::max(0.0, _676);
    float _680 = _650;
    float _682 = _678;
    if (_634)
    {
        float _684 = _664 * 6.283185482025146484375;
        float _686 = cos(_684);
        _680 = _686;
    }
    float _688 = _680;
    float _690 = -_620;
    float _692 = -_678;
    float _694 = fma(_600, _690, _692);
    if (_634)
    {
        float _696 = _694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _696;
    }
    float _698 = _646;
    float _700 = _698;
    float _702 = _674;
    if (_634)
    {
        float _704 = fma(_674, _698, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _700 = _704;
    }
    float _706 = _700;
    float _708 = _706;
    if (!_634)
    {
        _702 = _622;
    }
    float _710 = _702;
    float _712 = _710;
    float _714 = _688;
    if (_634)
    {
        float _716 = _688 + (-1.0);
        _682 = _716;
    }
    float _718 = _682;
    float _720 = _718;
    if (_634)
    {
        float _722 = _654 * _706;
        _272 = _722;
    }
    float _724 = _272;
    if (!_634)
    {
        _708 = _694;
    }
    float _726 = _708;
    float _728 = _726;
    if (_634)
    {
        float _730 = _718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _668 = _730;
    }
    float _732 = _668;
    if (_634)
    {
        float _734 = _622 * _724;
        _712 = _734;
    }
    float _736 = _712;
    if (!_634)
    {
        _720 = _624;
    }
    float _738 = _720;
    float _740 = _738;
    if (_634)
    {
        float _742 = _624 * _724;
        _740 = _742;
    }
    float _744 = _740;
    if (!_634)
    {
        _656 = _626;
    }
    float _746 = _656;
    float _748 = _746;
    if (_634)
    {
        float _750 = fma(_694, _688, _732);
        _728 = _750;
    }
    float _752 = _728;
    if (_634)
    {
        float _754 = _736 * _736;
        _748 = _754;
    }
    float _756 = _748;
    if (!_634)
    {
        _714 = _628;
    }
    float _758 = _714;
    float _760 = _758;
    if (_634)
    {
        float _762 = _744 * _744;
        _760 = _762;
    }
    float _764 = _760;
    float _766 = fma(_752, _752, _756);
    float _768 = _766 + _764;
    float _770 = _592 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _774 = fma(_618, (*spvDescriptorSet0.vp_c15)._m0[23].w, _772);
    float _776 = precise::clamp(_774, 0.0, 1.0);
    float _778 = _592 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _780 = rsqrt(_768);
    float _782 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[2].x, _770);
    float _784 = -_776;
    float _786 = _784 + 1.0;
    float _788 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[1].x, _778);
    float _790 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _792 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[2].z, _782);
    float _794 = _592 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _796 = _592 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _798 = abs(_786);
    float _800 = log2(_798);
    float _802 = _792 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _804 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[0].x, _794);
    float _806 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[1].z, _788);
    float _808 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[3].x, _796);
    float _810 = _802 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _812 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[0].z, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _816 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[3].z, _808);
    float _818 = -_810;
    float _820 = fma(_818, _790, 1.0);
    float _822 = _780 * _736;
    float _824 = _812 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _826 = _814 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _828 = _780 * _752;
    float _830 = _822 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _832 = _816 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].x, _826);
    float _836 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _838 = _780 * _744;
    float _840 = -_830;
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[21].y, _840);
    float _844 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _834);
    float _846 = exp2(_836);
    float _848 = _814 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _850 = -_838;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[21].z, _842);
    float _854 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _856 = _814 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _858 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].x, _848);
    float _860 = fma(_852, -0.5, 0.5);
    float _862 = fma(_852, 0.5, 0.5);
    float _864 = 1.0 / _854;
    float _866 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].x, _856);
    float _868 = _828 + 1.0;
    float _870 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _858);
    float _872 = fma(_862, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _874 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _866);
    float _876 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[4].w, _870);
    float _878 = log2(_820);
    float _880 = -_828;
    float _882 = fma(_846, _868, _880);
    float _884 = fma(_862, _872, -0.212114393711090087890625);
    float _886 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[5].w, _874);
    float _888 = fma(_862, _884, 1.570728778839111328125);
    float _890 = fma(_882, 0.5, 0.5);
    float _892 = sqrt(_860);
    float _894 = _876 * _864;
    float _896 = _886 * _864;
    float _898 = fma(_896, -0.5, 0.5);
    float _900 = _878 * 0.693147182464599609375;
    float _902 = fma(_894, 0.5, 0.5);
    float _904 = _900 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _906 = _892 * 0.636619746685028076171875;
    float3 _2596 = float3(_902, _898, _904);
    float _908 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2596, float3(0.0), isnan(_2596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2596, float3(0.0), isnan(_2596)), level(0.0)).x;
    float _910 = -_888;
    float _912 = fma(_906, _910, 1.0);
    float3 _2612 = float3(_902, _898, _904);
    float4 _915 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2612, float3(0.0), isnan(_2612)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2612, float3(0.0), isnan(_2612)), level(0.0)).xyzw;
    float _917 = _915.x;
    float _919 = _915.y;
    float _921 = _915.z;
    float _923 = _915.w;
    float2 _2629 = float2(_912, _890);
    float3 _927 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2629, float2(0.0), isnan(_2629)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2629, float2(0.0), isnan(_2629)), level(0.0)).xyz;
    float _929 = _927.x;
    float _931 = _927.y;
    float _933 = _927.z;
    float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _937 = _124 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _941 = _939 != 0;
    float _943 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _947 = _945 != 0;
    float _949 = -_430;
    float _951 = _949 + 1.0;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _955 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _957 = exp2(_943);
    int _959 = _520 ? as_type<int>(_951) : as_type<int>(_430);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _963 = fma(_955, -2.0, _953);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _967 = _947 ? as_type<float>(_959) : _430;
    float _969 = -_961;
    float _971 = fma(_937, 2.0, _969);
    float _973 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _975 = _961;
    float _977 = _973;
    bool _979 = _947;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_941)
    {
        _975 = _124;
    }
    float _983 = _975;
    float _985 = _935;
    float _987 = _983;
    if (!_941)
    {
        float _989 = in.m_51.z;
        _985 = _989;
    }
    float _991 = _985;
    float _993 = fma(_967, _973, -0.5);
    if (!_941)
    {
        _987 = _420;
    }
    float _995 = _987;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_941)
    {
        _977 = _150;
    }
    float _999 = _977;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1003 = _999;
    int _1005 = as_type<int>(_1001);
    if (_442)
    {
        bool _1007 = _124 > 0.5;
        _979 = _1007;
    }
    bool _1009 = _979;
    float _1011 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _997);
    if (!_941)
    {
        _981 = _999;
    }
    float _1013 = _981;
    float _1015 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1001);
    float _1017 = _1013;
    if (_941)
    {
        _1003 = _150;
    }
    float _1019 = _1003;
    float _1021 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1011);
    float _1023 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[76].y, _963);
    float _1025 = _1019;
    if (_442)
    {
        float _1027 = -_410;
        float _1029 = _1027 + 1.0;
        _1005 = as_type<int>(_1029);
    }
    int _1031 = _1005;
    if (_941)
    {
        _1017 = _124;
    }
    float _1033 = _1017;
    float _1035 = _995 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1037 = -_1023;
    float _1039 = fma(_1021, _993, _1037);
    float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1043 = _1035;
    if (_442)
    {
        float _1045 = _1009 ? as_type<float>(_1031) : _410;
        _532 = _1045;
    }
    float _1047 = _532;
    float _1049 = -_965;
    float _1051 = fma(_1035, 2.0, _1049);
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1055 = -_96;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _971);
    float _1059 = _991;
    if (!_941)
    {
        _1043 = _991;
    }
    float _1061 = _1043;
    float _1063 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1053);
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1067 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1069 = _1061;
    if (_941)
    {
        _1059 = _1019;
    }
    float _1071 = _1059;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1075 = -_1065;
    float _1077 = fma(_1067, 2.0, _1075);
    float _1079 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1073);
    float _1081 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_941)
    {
        _1069 = _1019;
    }
    float _1085 = _1069;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1091 = fma(_1081, _1047, -0.5);
    float _1093 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1087);
    if (!_941)
    {
        _1025 = _124;
    }
    float _1095 = _1025;
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1099 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1093);
    float _1101 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1089);
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1105 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1107 = fma(_1099, _1091, _1057);
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1113 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1115 = fma(_1105, -2.0, _1103);
    out.m_63.y = _144;
    float _1117 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1015);
    float _1119 = fma(_1113, -2.0, _1109);
    float _1121 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1101);
    float _1123 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1063);
    float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1127 = -_96;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1051);
    float _1131 = -_96;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1077);
    float _1135 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1137 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1079);
    float _1139 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1115);
    float _1141 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1119);
    float _1143 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1145 = _814 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1147 = fma(_1135, _536, -0.5);
    float _1149 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1151 = -_957;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_1143, _512, -0.5);
    float _1157 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1145);
    float _1159 = fma(_1149, _540, -0.5);
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1163 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1165 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1157);
    float _1167 = fma(_1121, _1147, _1129);
    float _1169 = -_1141;
    float _1171 = fma(_1117, _1159, _1169);
    float _1173 = fma(_1163, _524, -0.5);
    float _1175 = fma(_1123, _1155, _1133);
    float _1177 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1165);
    out.m_63.w = _148;
    float _1179 = -_1139;
    float _1181 = fma(_1137, _1173, _1179);
    float _1183 = _1039 + 0.5;
    float _1185 = _1167 + 0.5;
    float _1187 = _1171 + 0.5;
    float _1189 = _1175 + 0.5;
    float _1191 = _1177 + _854;
    float _1193 = _1181 + 0.5;
    out.m_65.x = _1185;
    out.m_65.y = _1187;
    float _1195 = _1107 + 0.5;
    float _1197 = _1191 * 0.5;
    float _1199 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1195;
    out.m_67.y = _1183;
    out.m_67.z = _1189;
    out.m_67.w = _1193;
    out.gl_Position.x = _876;
    out.gl_Position.y = _886;
    out.gl_Position.z = _1177;
    out.gl_Position.w = _854;
    out.m_69.z = _1197;
    out.m_69.w = _854;
    out.m_49.x = _1199;
    float _1201 = _1161 * _908;
    float _1203 = _923 * _1201;
    float _1205 = _933 * _1201;
    float _1207 = -_1161;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_929, _1203, _917);
    float _1213 = fma(_931, _1203, _919);
    float _1215 = fma(_923, _1205, _921);
    float _1217 = _923 * _1209;
    out.m_71.x = _1211;
    out.m_71.y = _1213;
    out.m_71.z = _1215;
    out.m_71.w = _1217;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = in.m_44.w;
    float _89 = trunc(_85);
    int _92 = int(_89);
    float _94 = -_87;
    float _96 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _96;
    bool _100 = _92 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    if (!_100)
    {
        out.m_49.x = 0.0;
    }
    int _106 = 0;
    if (!_100)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1282 = as_type<float>(_110);
        out.gl_Position.z = _1282;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _114 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_87);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = in.m_51.x;
    float _126 = float(_92);
    bool _128 = _96 >= _126;
    bool _130 = !_122;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_49.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _112 = as_type<int>(_138);
    }
    int _140 = _112;
    out.m_53.x = _124;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1342 = as_type<float>(_140);
        out.gl_Position.z = _1342;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_55.x;
    float _144 = in.m_55.y;
    float _146 = in.m_55.z;
    float _148 = in.m_55.w;
    float _150 = in.m_51.y;
    float _152 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _154 = in.m_57.x;
    float _156 = in.m_57.y;
    float _158 = in.m_57.z;
    float _160 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].x, _124);
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[192].y + (-1.0);
    float _164 = in.m_59.z;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_59.w;
    float _178 = in.m_59.x;
    float _180 = fma(_148, 0.752160012722015380859375, _160);
    float _182 = _142 * _142;
    float _184 = fma(_146, 2.0, -1.0);
    float _186 = fma(_148, 2.0, -1.0);
    float _188 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[191].z, _180);
    float _190 = _182 * _144;
    float _192 = in.m_59.y;
    float _194 = -_186;
    float _196 = _184 + _194;
    float _198 = _188 * 6.283185482025146484375;
    float _200 = fma(_190, _162, 1.0);
    float _202 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0033333338797092437744140625, _150);
    float _204 = fma(_142, 2.0, -1.0);
    float _206 = _198 * 0.15915493667125701904296875;
    float _208 = in.m_42.x;
    float _210 = in.m_42.y;
    float _212 = in.m_42.z;
    float _214 = fma(_148, 0.9545400142669677734375, _202);
    float _216 = _144 * 7.0;
    float _218 = _144 * 25.0;
    float _220 = _206 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[192].z, _214);
    float _226 = _204 * _216;
    float _228 = in.m_44.x;
    float _230 = in.m_44.y;
    float _232 = in.m_44.z;
    float _234 = -_218;
    float _236 = fma(_200, _158, _234);
    float _238 = _224 * 6.283185482025146484375;
    float _240 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = _182 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _236);
    float _246 = _238 * 0.15915493667125701904296875;
    float _248 = _240 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _250 = fma(_242, _144, _156);
    float _252 = fma(_144, _142, 1.0);
    float _254 = _246 * 6.283185482025146484375;
    float _256 = sin(_254);
    float _258 = _248 * _244;
    float _260 = _222 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _262 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _264 = fma(_260, _144, _154);
    float _266 = _154;
    float _268 = _142;
    float _270 = _262;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[192].w;
    if (!_174)
    {
        float _274 = _262 * _262;
        float _276 = _274 * 0.5;
        _266 = _276;
    }
    float _278 = _266;
    if (!_174)
    {
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _280;
    }
    float _282 = _268;
    bool _284 = !_174;
    float _286 = _282;
    if (!_284)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _262 * _290;
        float _300 = 1.0 / _294;
        float _302 = _296 * 0.693147182464599609375;
        float _304 = exp2(_298);
        float _306 = 1.0 / _302;
        float _308 = _304 + (-1.0);
        float _310 = -_308;
        float _312 = fma(_310, _306, _262);
        float _314 = _312 * _300;
        float _316 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _286 = _316;
    }
    float _318 = _286;
    bool _320 = !_174;
    if (!_320)
    {
        float _322 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _324 = log2(_322);
        float _326 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _328 = _326 + 1.0;
        float _330 = 1.0 / _328;
        float _332 = _262 * _324;
        float _334 = exp2(_332);
        float _336 = -_334;
        float _338 = _336 + 1.0;
        float _340 = _338 * _330;
        _270 = _340;
    }
    float _342 = _270;
    float _344 = fma(_264, _252, _226);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _348 = _346 + 1.0;
    float _350 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _352 = fma(_256, 2.25, -1.75);
    float _354 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = fma(_348, _144, (*spvDescriptorSet0.vp_c9)._m0[192].w);
    float _358 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = fma(_342, _230, _350);
    float _362 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = fma(_356, _196, _344);
    float _366 = fma(_342, _228, _354);
    float _368 = fma(_342, _232, _358);
    float _370 = fma(_360, _176, _210);
    float _372 = fma(_196, _352, _364);
    float _374 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _378 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _250);
    float _380 = _372 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _382 = fma(_366, _176, _208);
    float _384 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _386 = _370 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = _376 * _378;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _380);
    float _392 = fma(_368, _176, _212);
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _396 = _370 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _398 = _388 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _400 = _384 * _390;
    float _402 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    float _404 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].x, _396);
    float _406 = _388 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[10].x, _398);
    float _410 = in.m_61.x;
    float _412 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _404);
    float _414 = _402 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _416 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[8].x, _406);
    float _418 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[10].z, _408);
    float _420 = in.m_51.z;
    float _422 = in.m_51.w;
    float _424 = _412 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _426 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _416);
    float _428 = _414 + _418;
    float _430 = in.m_61.y;
    float _432 = _424 + _426;
    float _434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _436 = _428 + _434;
    float _438 = _388 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _442 = _440 != 0;
    float _444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _446 = _432 + _444;
    float _448 = _436 * _436;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _452 = _450 != 0;
    float _454 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[9].x, _438);
    float _456 = fma(_446, _446, _448);
    float _458 = _370 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _460 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[9].z, _454);
    float _462 = sqrt(_456);
    float _464 = _384 * _410;
    float _466 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].x, _458);
    float _468 = _426;
    float _470 = _464;
    float _472 = _460;
    float _474 = _432;
    if (!_442)
    {
        _468 = _410;
    }
    float _476 = _468;
    float _478 = -_464;
    float _480 = _478 + 1.0;
    bool _482 = _420 > 0.5;
    float _484 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _466);
    bool _486 = _422 > 0.5;
    float _488 = _376 * _430;
    int _490 = _482 ? as_type<int>(_480) : as_type<int>(_464);
    float _492 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _504 = _502 != 0;
    float _506 = -_488;
    float _508 = _506 + 1.0;
    bool _510 = !_452;
    float _512 = _510 ? _464 : as_type<float>(_490);
    float _514 = _492 + _460;
    bool _516 = _462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _518 = _486 ? _508 : _488;
    bool _520 = _150 > 0.5;
    bool _522 = !_496;
    float _524 = _522 ? _488 : _518;
    float _526 = _488;
    float _528 = _518;
    float _530 = _480;
    float _532 = _476;
    if (_500)
    {
        float _534 = _520 ? _480 : _464;
        _470 = _534;
    }
    float _536 = _470;
    if (_504)
    {
        float _538 = _482 ? _508 : _488;
        _526 = _538;
    }
    float _540 = _526;
    if (!_516)
    {
        _528 = _432;
    }
    float _542 = _528;
    float _544 = _542;
    if (!_516)
    {
        _530 = _428;
    }
    float _546 = _530;
    float _548 = _546;
    if (!_516)
    {
        _472 = _514;
    }
    float _550 = _472;
    bool _552 = !_516;
    float _554 = _550;
    if (!_552)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _560 = _462 + _558;
        float _562 = _514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _564 = rsqrt(_456);
        float _566 = _560 * _556;
        float _568 = _566 * 0.15915493667125701904296875;
        float _570 = _568 * 6.283185482025146484375;
        float _572 = cos(_570);
        float _574 = _568 * 6.283185482025146484375;
        float _576 = sin(_574);
        float _578 = _572 + (-1.0);
        float _580 = _578 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _582 = fma(_576, _562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _584 = fma(_514, _572, _580);
        float _586 = _564 * _582;
        float _588 = fma(_446, _586, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _590 = fma(_436, _586, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _554 = _584;
        _544 = _588;
        _548 = _590;
    }
    float _592 = _554;
    float _594 = _544;
    float _596 = _548;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _592 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _594 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _608 = _596 + _606;
    float _610 = _600 * _600;
    float _612 = fma(_604, _604, _610);
    float _614 = fma(_608, _608, _612);
    float _616 = rsqrt(_614);
    float _618 = sqrt(_614);
    float _620 = _616 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _622 = _604 * _620;
    float _624 = _608 * _620;
    float _626 = _622 * _622;
    float _628 = _624 * _624;
    float _630 = _626 + _628;
    float _632 = sqrt(_630);
    bool _634 = _632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _636 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _638 = _632 + _636;
    float _640 = _616;
    float _642 = _630;
    float _644 = _638;
    float _646 = _600;
    if (_634)
    {
        float _648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _640 = _648;
    }
    float _650 = _640;
    if (_634)
    {
        float _652 = rsqrt(_630);
        _642 = _652;
    }
    float _654 = _642;
    float _656 = _654;
    if (_634)
    {
        float _658 = _638 * _650;
        _644 = _658;
    }
    float _660 = _644;
    if (_634)
    {
        float _662 = _660 * 0.15915493667125701904296875;
        _474 = _662;
    }
    float _664 = _474;
    float _666 = _608;
    float _668 = _664;
    if (_634)
    {
        float _670 = _664 * 6.283185482025146484375;
        float _672 = sin(_670);
        _666 = _672;
    }
    float _674 = _666;
    float _676 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _678 = precise::max(0.0, _676);
    float _680 = _650;
    float _682 = _678;
    if (_634)
    {
        float _684 = _664 * 6.283185482025146484375;
        float _686 = cos(_684);
        _680 = _686;
    }
    float _688 = _680;
    float _690 = -_620;
    float _692 = -_678;
    float _694 = fma(_600, _690, _692);
    if (_634)
    {
        float _696 = _694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _696;
    }
    float _698 = _646;
    float _700 = _698;
    float _702 = _674;
    if (_634)
    {
        float _704 = fma(_674, _698, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _700 = _704;
    }
    float _706 = _700;
    float _708 = _706;
    if (!_634)
    {
        _702 = _622;
    }
    float _710 = _702;
    float _712 = _710;
    float _714 = _688;
    if (_634)
    {
        float _716 = _688 + (-1.0);
        _682 = _716;
    }
    float _718 = _682;
    float _720 = _718;
    if (_634)
    {
        float _722 = _654 * _706;
        _272 = _722;
    }
    float _724 = _272;
    if (!_634)
    {
        _708 = _694;
    }
    float _726 = _708;
    float _728 = _726;
    if (_634)
    {
        float _730 = _718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _668 = _730;
    }
    float _732 = _668;
    if (_634)
    {
        float _734 = _622 * _724;
        _712 = _734;
    }
    float _736 = _712;
    if (!_634)
    {
        _720 = _624;
    }
    float _738 = _720;
    float _740 = _738;
    if (_634)
    {
        float _742 = _624 * _724;
        _740 = _742;
    }
    float _744 = _740;
    if (!_634)
    {
        _656 = _626;
    }
    float _746 = _656;
    float _748 = _746;
    if (_634)
    {
        float _750 = fma(_694, _688, _732);
        _728 = _750;
    }
    float _752 = _728;
    if (_634)
    {
        float _754 = _736 * _736;
        _748 = _754;
    }
    float _756 = _748;
    if (!_634)
    {
        _714 = _628;
    }
    float _758 = _714;
    float _760 = _758;
    if (_634)
    {
        float _762 = _744 * _744;
        _760 = _762;
    }
    float _764 = _760;
    float _766 = fma(_752, _752, _756);
    float _768 = _766 + _764;
    float _770 = _592 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _774 = fma(_618, (*spvDescriptorSet0.vp_c15)._m0[23].w, _772);
    float _776 = precise::clamp(_774, 0.0, 1.0);
    float _778 = _592 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _780 = rsqrt(_768);
    float _782 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[2].x, _770);
    float _784 = -_776;
    float _786 = _784 + 1.0;
    float _788 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[1].x, _778);
    float _790 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _792 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[2].z, _782);
    float _794 = _592 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _796 = _592 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _798 = abs(_786);
    float _800 = log2(_798);
    float _802 = _792 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _804 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[0].x, _794);
    float _806 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[1].z, _788);
    float _808 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[3].x, _796);
    float _810 = _802 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _812 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[0].z, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _816 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[3].z, _808);
    float _818 = -_810;
    float _820 = fma(_818, _790, 1.0);
    float _822 = _780 * _736;
    float _824 = _812 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _826 = _814 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _828 = _780 * _752;
    float _830 = _822 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _832 = _816 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].x, _826);
    float _836 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _838 = _780 * _744;
    float _840 = -_830;
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[21].y, _840);
    float _844 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _834);
    float _846 = exp2(_836);
    float _848 = _814 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _850 = -_838;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[21].z, _842);
    float _854 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _856 = _814 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _858 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].x, _848);
    float _860 = fma(_852, -0.5, 0.5);
    float _862 = fma(_852, 0.5, 0.5);
    float _864 = 1.0 / _854;
    float _866 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].x, _856);
    float _868 = _828 + 1.0;
    float _870 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _858);
    float _872 = fma(_862, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _874 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _866);
    float _876 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[4].w, _870);
    float _878 = log2(_820);
    float _880 = -_828;
    float _882 = fma(_846, _868, _880);
    float _884 = fma(_862, _872, -0.212114393711090087890625);
    float _886 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[5].w, _874);
    float _888 = fma(_862, _884, 1.570728778839111328125);
    float _890 = fma(_882, 0.5, 0.5);
    float _892 = sqrt(_860);
    float _894 = _876 * _864;
    float _896 = _886 * _864;
    float _898 = fma(_896, -0.5, 0.5);
    float _900 = _878 * 0.693147182464599609375;
    float _902 = fma(_894, 0.5, 0.5);
    float _904 = _900 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _906 = _892 * 0.636619746685028076171875;
    float3 _2596 = float3(_902, _898, _904);
    float _908 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2596, float3(0.0), isnan(_2596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2596, float3(0.0), isnan(_2596)), level(0.0)).x;
    float _910 = -_888;
    float _912 = fma(_906, _910, 1.0);
    float3 _2612 = float3(_902, _898, _904);
    float4 _915 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2612, float3(0.0), isnan(_2612)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2612, float3(0.0), isnan(_2612)), level(0.0)).xyzw;
    float _917 = _915.x;
    float _919 = _915.y;
    float _921 = _915.z;
    float _923 = _915.w;
    float2 _2629 = float2(_912, _890);
    float3 _927 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2629, float2(0.0), isnan(_2629)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2629, float2(0.0), isnan(_2629)), level(0.0)).xyz;
    float _929 = _927.x;
    float _931 = _927.y;
    float _933 = _927.z;
    float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _937 = _124 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _941 = _939 != 0;
    float _943 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _947 = _945 != 0;
    float _949 = -_430;
    float _951 = _949 + 1.0;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _955 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _957 = exp2(_943);
    int _959 = _520 ? as_type<int>(_951) : as_type<int>(_430);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _963 = fma(_955, -2.0, _953);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _967 = _947 ? as_type<float>(_959) : _430;
    float _969 = -_961;
    float _971 = fma(_937, 2.0, _969);
    float _973 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _975 = _961;
    float _977 = _973;
    bool _979 = _947;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_941)
    {
        _975 = _124;
    }
    float _983 = _975;
    float _985 = _935;
    float _987 = _983;
    if (!_941)
    {
        float _989 = in.m_51.z;
        _985 = _989;
    }
    float _991 = _985;
    float _993 = fma(_967, _973, -0.5);
    if (!_941)
    {
        _987 = _420;
    }
    float _995 = _987;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_941)
    {
        _977 = _150;
    }
    float _999 = _977;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1003 = _999;
    int _1005 = as_type<int>(_1001);
    if (_442)
    {
        bool _1007 = _124 > 0.5;
        _979 = _1007;
    }
    bool _1009 = _979;
    float _1011 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _997);
    if (!_941)
    {
        _981 = _999;
    }
    float _1013 = _981;
    float _1015 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1001);
    float _1017 = _1013;
    if (_941)
    {
        _1003 = _150;
    }
    float _1019 = _1003;
    float _1021 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1011);
    float _1023 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[76].y, _963);
    float _1025 = _1019;
    if (_442)
    {
        float _1027 = -_410;
        float _1029 = _1027 + 1.0;
        _1005 = as_type<int>(_1029);
    }
    int _1031 = _1005;
    if (_941)
    {
        _1017 = _124;
    }
    float _1033 = _1017;
    float _1035 = _995 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1037 = -_1023;
    float _1039 = fma(_1021, _993, _1037);
    float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1043 = _1035;
    if (_442)
    {
        float _1045 = _1009 ? as_type<float>(_1031) : _410;
        _532 = _1045;
    }
    float _1047 = _532;
    float _1049 = -_965;
    float _1051 = fma(_1035, 2.0, _1049);
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1055 = -_96;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _971);
    float _1059 = _991;
    if (!_941)
    {
        _1043 = _991;
    }
    float _1061 = _1043;
    float _1063 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1053);
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1067 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1069 = _1061;
    if (_941)
    {
        _1059 = _1019;
    }
    float _1071 = _1059;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1075 = -_1065;
    float _1077 = fma(_1067, 2.0, _1075);
    float _1079 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1073);
    float _1081 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_941)
    {
        _1069 = _1019;
    }
    float _1085 = _1069;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1091 = fma(_1081, _1047, -0.5);
    float _1093 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1087);
    if (!_941)
    {
        _1025 = _124;
    }
    float _1095 = _1025;
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1099 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1093);
    float _1101 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1089);
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1105 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1107 = fma(_1099, _1091, _1057);
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1113 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1115 = fma(_1105, -2.0, _1103);
    out.m_63.y = _144;
    float _1117 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1015);
    float _1119 = fma(_1113, -2.0, _1109);
    float _1121 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1101);
    float _1123 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1063);
    float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1127 = -_96;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1051);
    float _1131 = -_96;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1077);
    float _1135 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1137 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1079);
    float _1139 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1115);
    float _1141 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1119);
    float _1143 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1145 = _814 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1147 = fma(_1135, _536, -0.5);
    float _1149 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1151 = -_957;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_1143, _512, -0.5);
    float _1157 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1145);
    float _1159 = fma(_1149, _540, -0.5);
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1163 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1165 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1157);
    float _1167 = fma(_1121, _1147, _1129);
    float _1169 = -_1141;
    float _1171 = fma(_1117, _1159, _1169);
    float _1173 = fma(_1163, _524, -0.5);
    float _1175 = fma(_1123, _1155, _1133);
    float _1177 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1165);
    out.m_63.w = _148;
    float _1179 = -_1139;
    float _1181 = fma(_1137, _1173, _1179);
    float _1183 = _1039 + 0.5;
    float _1185 = _1167 + 0.5;
    float _1187 = _1171 + 0.5;
    float _1189 = _1175 + 0.5;
    float _1191 = _1177 + _854;
    float _1193 = _1181 + 0.5;
    out.m_65.x = _1185;
    out.m_65.y = _1187;
    float _1195 = _1107 + 0.5;
    float _1197 = _1191 * 0.5;
    float _1199 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1195;
    out.m_67.y = _1183;
    out.m_67.z = _1189;
    out.m_67.w = _1193;
    out.gl_Position.x = _876;
    out.gl_Position.y = _886;
    out.gl_Position.z = _1177;
    out.gl_Position.w = _854;
    out.m_69.z = _1197;
    out.m_69.w = _854;
    out.m_49.x = _1199;
    float _1201 = _1161 * _908;
    float _1203 = _923 * _1201;
    float _1205 = _933 * _1201;
    float _1207 = -_1161;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_929, _1203, _917);
    float _1213 = fma(_931, _1203, _919);
    float _1215 = fma(_923, _1205, _921);
    float _1217 = _923 * _1209;
    out.m_71.x = _1211;
    out.m_71.y = _1213;
    out.m_71.z = _1215;
    out.m_71.w = _1217;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

