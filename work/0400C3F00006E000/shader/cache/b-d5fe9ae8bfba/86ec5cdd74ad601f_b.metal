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
    float4 m_65 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _104 = as_type<float>(_92);
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _102;
    if (!_100)
    {
        out.m_49.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1294 = as_type<float>(_112);
        out.gl_Position.z = _1294;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _116 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_87);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = in.m_51.x;
    float _128 = float(_92);
    bool _130 = _96 >= _128;
    bool _132 = !_124;
    bool _134 = _130 || _132;
    if (_134)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _104;
    if (_134)
    {
        out.m_49.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _114 = as_type<int>(_138);
    }
    int _140 = _114;
    out.m_53.x = _126;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1353 = as_type<float>(_140);
        out.gl_Position.z = _1353;
    }
    if (_134)
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
    float _160 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].x, _126);
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_59.z;
    float _174 = in.m_59.w;
    float _176 = in.m_59.y;
    float _178 = fma(_146, 2.0, -1.0);
    float _180 = fma(_148, 2.0, -1.0);
    float _182 = fma(_148, 1.58766305446624755859375, _160);
    float _184 = fma(_142, 2.0, -1.0);
    float _186 = -_180;
    float _188 = _186 + _178;
    float _190 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[191].z, _182);
    float _192 = _148 * 0.5;
    float _194 = abs(_184);
    float _196 = _194 * _144;
    float _198 = _184 * _184;
    float _200 = _190 * 6.283185482025146484375;
    float _202 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].w, _192);
    float _204 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00833333469927310943603515625, _150);
    float _206 = fma(_196, 2.5, 1.0);
    float _208 = _200 * 0.15915493667125701904296875;
    float _210 = _202 * 6.283185482025146484375;
    float _212 = fma(_148, 0.9545400142669677734375, _204);
    float _214 = in.m_59.x;
    float _216 = _198 * _144;
    float _218 = _210 * 0.15915493667125701904296875;
    float _220 = _208 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[192].z, _212);
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _228 = in.m_44.x;
    float _230 = in.m_44.y;
    float _232 = in.m_44.z;
    float _234 = _224 * 6.283185482025146484375;
    float _236 = fma(_226, _144, _156);
    float _238 = in.m_42.x;
    float _240 = in.m_42.y;
    float _242 = in.m_42.z;
    float _244 = _218 * 6.283185482025146484375;
    float _246 = sin(_244);
    float _248 = _234 * 0.15915493667125701904296875;
    float _250 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[192].y, _158);
    float _252 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _254 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _256 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _258 = _222 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _260 = _252;
    float _262 = _254;
    if (!_170)
    {
        float _264 = _254 * _254;
        float _266 = _264 * 0.5;
        _260 = _266;
    }
    float _268 = _260;
    float _270 = fma(_258, _144, _154);
    float _272 = fma(_144, -60.0, _250);
    float _274 = _248 * 6.283185482025146484375;
    float _276 = sin(_274);
    float _278 = _268;
    if (!_170)
    {
        float _280 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _280;
    }
    float _282 = _278;
    float _284 = _246 * 25.0;
    float _286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _272);
    bool _288 = !_170;
    float _290 = _282;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = _254 * _294;
        float _304 = 1.0 / _298;
        float _306 = _300 * 0.693147182464599609375;
        float _308 = exp2(_302);
        float _310 = 1.0 / _306;
        float _312 = _308 + (-1.0);
        float _314 = -_312;
        float _316 = fma(_314, _310, _254);
        float _318 = _316 * _304;
        float _320 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _320;
    }
    float _322 = _290;
    bool _324 = !_170;
    if (!_324)
    {
        float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _328 = log2(_326);
        float _330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _332 = _330 + 1.0;
        float _334 = 1.0 / _332;
        float _336 = _254 * _328;
        float _338 = exp2(_336);
        float _340 = -_338;
        float _342 = _340 + 1.0;
        float _344 = _342 * _334;
        _262 = _344;
    }
    float _346 = _262;
    float _348 = abs(_284);
    float _350 = fma(_348, _144, _236);
    float _352 = _270 * _206;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _356 = _354 + 1.0;
    float _358 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _362 = _276 * 2.0;
    float _364 = fma(_356, _144, (*spvDescriptorSet0.vp_c9)._m0[192].w);
    float _366 = fma(_346, _228, _358);
    float _368 = fma(_346, _230, _360);
    float _370 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = fma(_364, _188, _352);
    float _374 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _376 = fma(_366, _174, _238);
    float _378 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = fma(_368, _174, _240);
    float _382 = fma(_188, _362, _372);
    float _384 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _350);
    float _388 = fma(_346, _232, _374);
    float _390 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _392 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = _384 * _386;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _382);
    float _398 = fma(_388, _174, _242);
    float _400 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _402 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _404 = _394 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _406 = _390 * _396;
    float _408 = _256 * _286;
    float _410 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].x, _400);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _402);
    float _414 = _394 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _416 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[10].x, _404);
    float _418 = in.m_61.x;
    float _420 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _410);
    float _422 = _412 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _424 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[8].x, _414);
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[10].z, _416);
    float _428 = in.m_51.z;
    float _430 = in.m_51.w;
    float _432 = _420 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _434 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[8].z, _424);
    float _436 = _422 + _426;
    float _438 = in.m_61.y;
    float _440 = _432 + _434;
    float _442 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _444 = _436 + _442;
    float _446 = _394 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _450 = _448 != 0;
    float _452 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _454 = _440 + _452;
    float _456 = _444 * _444;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _460 = _458 != 0;
    float _462 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[9].x, _446);
    float _464 = fma(_454, _454, _456);
    float _466 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _468 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[9].z, _462);
    float _470 = sqrt(_464);
    float _472 = _390 * _418;
    float _474 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].x, _466);
    float _476 = _434;
    float _478 = _472;
    if (!_450)
    {
        _476 = _418;
    }
    float _480 = _476;
    float _482 = -_472;
    float _484 = _482 + 1.0;
    bool _486 = _428 > 0.5;
    float _488 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _474);
    bool _490 = _430 > 0.5;
    float _492 = _384 * _438;
    float _494 = _486 ? _484 : _472;
    float _496 = _488 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _508 = _506 != 0;
    float _510 = -_492;
    float _512 = _510 + 1.0;
    bool _514 = !_460;
    float _516 = _514 ? _472 : _494;
    float _518 = _496 + _468;
    bool _520 = _470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _522 = _490 ? as_type<int>(_512) : as_type<int>(_492);
    bool _524 = _150 > 0.5;
    bool _526 = !_500;
    float _528 = _526 ? _492 : as_type<float>(_522);
    float _530 = _492;
    float _532 = _494;
    float _534 = _484;
    float _536 = _496;
    float _538 = _470;
    float _540 = _480;
    if (_504)
    {
        float _542 = _524 ? _484 : _472;
        _478 = _542;
    }
    float _544 = _478;
    if (_508)
    {
        float _546 = _486 ? _512 : _492;
        _530 = _546;
    }
    float _548 = _530;
    if (!_520)
    {
        _532 = _440;
    }
    float _550 = _532;
    float _552 = _550;
    if (!_520)
    {
        _534 = _436;
    }
    float _554 = _534;
    float _556 = _554;
    if (!_520)
    {
        _536 = _518;
    }
    float _558 = _536;
    bool _560 = !_520;
    float _562 = _558;
    if (!_560)
    {
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _568 = _470 + _566;
        float _570 = rsqrt(_464);
        float _572 = _568 * _564;
        float _574 = _518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _576 = _572 * 0.15915493667125701904296875;
        float _578 = _576 * 6.283185482025146484375;
        float _580 = sin(_578);
        float _582 = _576 * 6.283185482025146484375;
        float _584 = cos(_582);
        float _586 = fma(_580, _574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _588 = _570 * _586;
        float _590 = _584 + (-1.0);
        float _592 = _590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _594 = fma(_454, _588, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _596 = fma(_444, _588, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _598 = fma(_518, _584, _592);
        _562 = _598;
        _552 = _594;
        _556 = _596;
    }
    float _600 = _562;
    float _602 = _552;
    float _604 = _556;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _600 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _602 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _616 = _604 + _614;
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = rsqrt(_622);
    float _626 = _624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _612 * _626;
    float _630 = _616 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _616;
    float _648 = _636;
    float _650 = _644;
    float _652 = _626;
    if (_640)
    {
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _654;
    }
    float _656 = _646;
    if (_640)
    {
        float _658 = rsqrt(_636);
        _648 = _658;
    }
    float _660 = _648;
    if (_640)
    {
        float _662 = _644 * _656;
        _650 = _662;
    }
    float _664 = _650;
    if (_640)
    {
        float _666 = _664 * 0.15915493667125701904296875;
        _538 = _666;
    }
    float _668 = _538;
    float _670 = _618;
    float _672 = _668;
    if (_640)
    {
        float _674 = _668 * 6.283185482025146484375;
        float _676 = sin(_674);
        _670 = _676;
    }
    float _678 = _670;
    float _680 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _682 = precise::max(0.0, _680);
    float _684 = _624;
    float _686 = _682;
    float _688 = _680;
    if (_640)
    {
        float _690 = _668 * 6.283185482025146484375;
        float _692 = cos(_690);
        _684 = _692;
    }
    float _694 = _684;
    float _696 = -_626;
    float _698 = -_682;
    float _700 = fma(_608, _696, _698);
    float _702 = _700;
    if (!_640)
    {
        _686 = _628;
    }
    float _704 = _686;
    float _706 = _704;
    if (_640)
    {
        float _708 = _700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _688 = _708;
    }
    float _710 = _688;
    float _712 = _678;
    float _714 = _710;
    if (_640)
    {
        float _716 = fma(_678, _710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _712 = _716;
    }
    float _718 = _712;
    float _720 = _718;
    float _722 = _694;
    if (_640)
    {
        float _724 = _694 + (-1.0);
        _714 = _724;
    }
    float _726 = _714;
    float _728 = _726;
    if (_640)
    {
        float _730 = _660 * _718;
        _652 = _730;
    }
    float _732 = _652;
    if (!_640)
    {
        _720 = _632;
    }
    float _734 = _720;
    float _736 = sqrt(_622);
    float _738 = _734;
    if (_640)
    {
        float _740 = _726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _672 = _740;
    }
    float _742 = _672;
    if (_640)
    {
        float _744 = _628 * _732;
        _706 = _744;
    }
    float _746 = _706;
    if (!_640)
    {
        _728 = _630;
    }
    float _748 = _728;
    float _750 = _748;
    if (_640)
    {
        float _752 = _630 * _732;
        _750 = _752;
    }
    float _754 = _750;
    if (_640)
    {
        float _756 = fma(_700, _694, _742);
        _702 = _756;
    }
    float _758 = _702;
    if (_640)
    {
        float _760 = _746 * _746;
        _738 = _760;
    }
    float _762 = _738;
    if (!_640)
    {
        _722 = _634;
    }
    float _764 = _722;
    float _766 = _764;
    if (_640)
    {
        float _768 = _754 * _754;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = fma(_758, _758, _762);
    float _774 = _600 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _776 = _772 + _770;
    float _778 = _600 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _782 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[23].w, _780);
    float _784 = precise::clamp(_782, 0.0, 1.0);
    float _786 = _600 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _788 = rsqrt(_776);
    float _790 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[2].x, _778);
    float _792 = -_784;
    float _794 = _792 + 1.0;
    float _796 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[1].x, _786);
    float _798 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[3].x, _774);
    float _800 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[2].z, _790);
    float _802 = _600 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _804 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[1].z, _796);
    float _806 = abs(_794);
    float _808 = log2(_806);
    float _810 = _800 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _812 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[0].x, _802);
    float _814 = _804 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _816 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[3].z, _798);
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _820 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[0].z, _812);
    float _822 = _810 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _824 = _788 * _746;
    float _826 = _788 * _758;
    float _828 = _820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _830 = _814 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _832 = _824 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _834 = _788 * _754;
    float _836 = _816 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _838 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[7].x, _830);
    float _840 = -_832;
    float _842 = fma(_826, (*spvDescriptorSet0.vp_c15)._m0[21].y, _840);
    float _844 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _846 = -_822;
    float _848 = fma(_846, _818, 1.0);
    float _850 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[7].z, _838);
    float _852 = -_834;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c15)._m0[21].z, _842);
    float _856 = exp2(_844);
    float _858 = _814 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _860 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _850);
    float _862 = fma(_854, -0.5, 0.5);
    float _864 = _814 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _866 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[4].x, _858);
    float _868 = fma(_854, 0.5, 0.5);
    float _870 = log2(_848);
    float _872 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[5].x, _864);
    float _874 = _826 + 1.0;
    float _876 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[4].z, _866);
    float _878 = fma(_868, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _880 = 1.0 / _860;
    float _882 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[5].z, _872);
    float _884 = -_826;
    float _886 = fma(_856, _874, _884);
    float _888 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _890 = fma(_868, _878, -0.212114393711090087890625);
    float _892 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _882);
    float _894 = sqrt(_862);
    float _896 = fma(_868, _890, 1.570728778839111328125);
    float _898 = _870 * 0.693147182464599609375;
    float _900 = fma(_886, 0.5, 0.5);
    float _902 = _898 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _904 = _888 * _880;
    float _906 = _892 * _880;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = fma(_906, -0.5, 0.5);
    float _912 = _894 * 0.636619746685028076171875;
    float3 _2609 = float3(_908, _910, _902);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2609, float3(0.0), isnan(_2609)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2609, float3(0.0), isnan(_2609)), level(0.0)).x;
    float3 _2620 = float3(_908, _910, _902);
    float4 _917 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2620, float3(0.0), isnan(_2620)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2620, float3(0.0), isnan(_2620)), level(0.0)).xyzw;
    float _919 = _917.x;
    float _921 = _917.y;
    float _923 = _917.z;
    float _925 = _917.w;
    float _927 = -_896;
    float _929 = fma(_912, _927, 1.0);
    float2 _2642 = float2(_929, _900);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2642, float2(0.0), isnan(_2642)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2642, float2(0.0), isnan(_2642)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _945 = _943 != 0;
    float _947 = -_438;
    float _949 = _947 + 1.0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _953 = _951 != 0;
    float _955 = _126 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _957 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _963 = _524 ? as_type<int>(_949) : as_type<int>(_438);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _967 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _969 = -_961;
    float _971 = fma(_955, 2.0, _969);
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _975 = _945 ? as_type<float>(_963) : _438;
    float _977 = fma(_967, -2.0, _965);
    float _979 = _941 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _981 = _965;
    bool _983 = _945;
    if (_953)
    {
        _981 = _126;
    }
    float _985 = _981;
    float _987 = exp2(_957);
    float _989 = _985;
    if (!_953)
    {
        _989 = _428;
    }
    float _991 = _989;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _995 = fma(_975, _979, -0.5);
    float _997 = _979;
    float _999 = _991;
    float _1001 = _995;
    if (!_953)
    {
        float _1003 = in.m_51.z;
        _997 = _1003;
    }
    float _1005 = _997;
    float _1007 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _993);
    float _1009 = 0.0;
    if (!_953)
    {
        _1009 = _150;
    }
    float _1011 = _1009;
    float _1013 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[76].y, _977);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1017 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1007);
    float _1019 = _991 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1021 = _1011;
    int _1023 = as_type<int>(_1017);
    if (!_953)
    {
        _999 = _1011;
    }
    float _1025 = _999;
    float _1027 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _973);
    float _1029 = _1025;
    if (_953)
    {
        _1021 = _150;
    }
    float _1031 = _1021;
    float _1033 = -_1015;
    float _1035 = fma(_1019, 2.0, _1033);
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1039 = -_1013;
    float _1041 = fma(_1017, _995, _1039);
    if (_450)
    {
        float _1043 = -_418;
        float _1045 = _1043 + 1.0;
        _1023 = as_type<int>(_1045);
    }
    int _1047 = _1023;
    if (_450)
    {
        bool _1049 = _126 > 0.5;
        _983 = _1049;
    }
    bool _1051 = _983;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1055 = -_96;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1035);
    if (_953)
    {
        _1029 = _126;
    }
    float _1059 = _1029;
    out.m_63.y = _144;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_450)
    {
        float _1063 = _1051 ? as_type<float>(_1047) : _418;
        _540 = _1063;
    }
    float _1065 = _540;
    float _1067 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1069 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1053);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1073 = -_1061;
    float _1075 = fma(_1067, 2.0, _1073);
    float _1077 = _1005;
    float _1079 = _1067;
    if (!_953)
    {
        _1001 = _1005;
    }
    float _1081 = _1001;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1085 = _1081;
    if (_953)
    {
        _1085 = _1031;
    }
    float _1087 = _1085;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_953)
    {
        _1077 = _1031;
    }
    float _1091 = _1077;
    float _1093 = -_96;
    float _1095 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1075);
    if (_953)
    {
        _1079 = _1031;
    }
    float _1097 = _1079;
    float _1099 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1071);
    float _1101 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1103 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1089);
    float _1105 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1107 = _1097;
    if (!_953)
    {
        _1107 = _126;
    }
    float _1109 = _1107;
    float _1111 = fma(_1101, _1065, -0.5);
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1117 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1099);
    float _1119 = fma(_1105, -2.0, _1113);
    float _1121 = -_96;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[76].x, _971);
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1127 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1133 = fma(_1117, _1111, _1123);
    float _1135 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1125);
    float _1137 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1103);
    float _1139 = fma(_1127, -2.0, _1131);
    float _1141 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1143 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1027);
    float _1145 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1069);
    float _1147 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1135);
    float _1149 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1119);
    float _1151 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1139);
    float _1153 = _814 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _142;
    float _1155 = fma(_1141, _516, -0.5);
    float _1157 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1159 = _959 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1161 = -_987;
    float _1163 = _1161 + 1.0;
    float _1165 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1153);
    float _1167 = fma(_1157, _544, -0.5);
    float _1169 = fma(_1159, _528, -0.5);
    float _1171 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_63.w = _148;
    float _1173 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1165);
    float _1175 = fma(_1137, _1167, _1057);
    float _1177 = fma(_1171, _548, -0.5);
    float _1179 = fma(_1145, _1155, _1095);
    float _1181 = -_1149;
    float _1183 = fma(_1147, _1169, _1181);
    float _1185 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1173);
    float _1187 = -_1151;
    float _1189 = fma(_1143, _1177, _1187);
    float _1191 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1193 = _1175 + 0.5;
    float _1195 = _1041 + 0.5;
    float _1197 = _1133 + 0.5;
    float _1199 = _1179 + 0.5;
    float _1201 = _1183 + 0.5;
    float _1203 = _1189 + 0.5;
    float _1205 = _1185 + _860;
    out.m_65.x = _1197;
    out.m_65.y = _1195;
    out.m_65.z = _1199;
    out.m_65.w = _1201;
    float _1207 = _1205 * 0.5;
    out.m_67.x = _1193;
    out.m_67.y = _1203;
    out.gl_Position.x = _888;
    out.gl_Position.y = _892;
    out.gl_Position.z = _1185;
    out.gl_Position.w = _860;
    out.m_69.z = _1207;
    out.m_69.w = _860;
    float _1209 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _1209;
    float _1211 = _1191 * _914;
    float _1213 = _925 * _1211;
    float _1215 = _939 * _1211;
    float _1217 = -_1191;
    float _1219 = _1217 + 1.0;
    float _1221 = fma(_935, _1213, _919);
    float _1223 = fma(_937, _1213, _921);
    float _1225 = fma(_925, _1215, _923);
    float _1227 = _925 * _1219;
    out.m_71.x = _1221;
    out.m_71.y = _1223;
    out.m_71.z = _1225;
    out.m_71.w = _1227;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _104 = as_type<float>(_92);
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _102;
    if (!_100)
    {
        out.m_49.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1294 = as_type<float>(_112);
        out.gl_Position.z = _1294;
    }
    if (!_100)
    {
        return out;
    }
    bool _116 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_87);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = in.m_51.x;
    float _128 = float(_92);
    bool _130 = _96 >= _128;
    bool _132 = !_124;
    bool _134 = _130 || _132;
    if (_134)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _104;
    if (_134)
    {
        out.m_49.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _114 = as_type<int>(_138);
    }
    int _140 = _114;
    out.m_53.x = _126;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1353 = as_type<float>(_140);
        out.gl_Position.z = _1353;
    }
    if (_134)
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
    float _160 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].x, _126);
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_59.z;
    float _174 = in.m_59.w;
    float _176 = in.m_59.y;
    float _178 = fma(_146, 2.0, -1.0);
    float _180 = fma(_148, 2.0, -1.0);
    float _182 = fma(_148, 1.58766305446624755859375, _160);
    float _184 = fma(_142, 2.0, -1.0);
    float _186 = -_180;
    float _188 = _186 + _178;
    float _190 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[191].z, _182);
    float _192 = _148 * 0.5;
    float _194 = abs(_184);
    float _196 = _194 * _144;
    float _198 = _184 * _184;
    float _200 = _190 * 6.283185482025146484375;
    float _202 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].w, _192);
    float _204 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00833333469927310943603515625, _150);
    float _206 = fma(_196, 2.5, 1.0);
    float _208 = _200 * 0.15915493667125701904296875;
    float _210 = _202 * 6.283185482025146484375;
    float _212 = fma(_148, 0.9545400142669677734375, _204);
    float _214 = in.m_59.x;
    float _216 = _198 * _144;
    float _218 = _210 * 0.15915493667125701904296875;
    float _220 = _208 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[192].z, _212);
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _228 = in.m_44.x;
    float _230 = in.m_44.y;
    float _232 = in.m_44.z;
    float _234 = _224 * 6.283185482025146484375;
    float _236 = fma(_226, _144, _156);
    float _238 = in.m_42.x;
    float _240 = in.m_42.y;
    float _242 = in.m_42.z;
    float _244 = _218 * 6.283185482025146484375;
    float _246 = sin(_244);
    float _248 = _234 * 0.15915493667125701904296875;
    float _250 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[192].y, _158);
    float _252 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _254 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _256 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _258 = _222 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _260 = _252;
    float _262 = _254;
    if (!_170)
    {
        float _264 = _254 * _254;
        float _266 = _264 * 0.5;
        _260 = _266;
    }
    float _268 = _260;
    float _270 = fma(_258, _144, _154);
    float _272 = fma(_144, -60.0, _250);
    float _274 = _248 * 6.283185482025146484375;
    float _276 = sin(_274);
    float _278 = _268;
    if (!_170)
    {
        float _280 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _280;
    }
    float _282 = _278;
    float _284 = _246 * 25.0;
    float _286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _272);
    bool _288 = !_170;
    float _290 = _282;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = _254 * _294;
        float _304 = 1.0 / _298;
        float _306 = _300 * 0.693147182464599609375;
        float _308 = exp2(_302);
        float _310 = 1.0 / _306;
        float _312 = _308 + (-1.0);
        float _314 = -_312;
        float _316 = fma(_314, _310, _254);
        float _318 = _316 * _304;
        float _320 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _320;
    }
    float _322 = _290;
    bool _324 = !_170;
    if (!_324)
    {
        float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _328 = log2(_326);
        float _330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _332 = _330 + 1.0;
        float _334 = 1.0 / _332;
        float _336 = _254 * _328;
        float _338 = exp2(_336);
        float _340 = -_338;
        float _342 = _340 + 1.0;
        float _344 = _342 * _334;
        _262 = _344;
    }
    float _346 = _262;
    float _348 = abs(_284);
    float _350 = fma(_348, _144, _236);
    float _352 = _270 * _206;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _356 = _354 + 1.0;
    float _358 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _362 = _276 * 2.0;
    float _364 = fma(_356, _144, (*spvDescriptorSet0.vp_c9)._m0[192].w);
    float _366 = fma(_346, _228, _358);
    float _368 = fma(_346, _230, _360);
    float _370 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = fma(_364, _188, _352);
    float _374 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _376 = fma(_366, _174, _238);
    float _378 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = fma(_368, _174, _240);
    float _382 = fma(_188, _362, _372);
    float _384 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _350);
    float _388 = fma(_346, _232, _374);
    float _390 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _392 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = _384 * _386;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _382);
    float _398 = fma(_388, _174, _242);
    float _400 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _402 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _404 = _394 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _406 = _390 * _396;
    float _408 = _256 * _286;
    float _410 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].x, _400);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _402);
    float _414 = _394 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _416 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[10].x, _404);
    float _418 = in.m_61.x;
    float _420 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _410);
    float _422 = _412 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _424 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[8].x, _414);
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[10].z, _416);
    float _428 = in.m_51.z;
    float _430 = in.m_51.w;
    float _432 = _420 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _434 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[8].z, _424);
    float _436 = _422 + _426;
    float _438 = in.m_61.y;
    float _440 = _432 + _434;
    float _442 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _444 = _436 + _442;
    float _446 = _394 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _450 = _448 != 0;
    float _452 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _454 = _440 + _452;
    float _456 = _444 * _444;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _460 = _458 != 0;
    float _462 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[9].x, _446);
    float _464 = fma(_454, _454, _456);
    float _466 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _468 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[9].z, _462);
    float _470 = sqrt(_464);
    float _472 = _390 * _418;
    float _474 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].x, _466);
    float _476 = _434;
    float _478 = _472;
    if (!_450)
    {
        _476 = _418;
    }
    float _480 = _476;
    float _482 = -_472;
    float _484 = _482 + 1.0;
    bool _486 = _428 > 0.5;
    float _488 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _474);
    bool _490 = _430 > 0.5;
    float _492 = _384 * _438;
    float _494 = _486 ? _484 : _472;
    float _496 = _488 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _508 = _506 != 0;
    float _510 = -_492;
    float _512 = _510 + 1.0;
    bool _514 = !_460;
    float _516 = _514 ? _472 : _494;
    float _518 = _496 + _468;
    bool _520 = _470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _522 = _490 ? as_type<int>(_512) : as_type<int>(_492);
    bool _524 = _150 > 0.5;
    bool _526 = !_500;
    float _528 = _526 ? _492 : as_type<float>(_522);
    float _530 = _492;
    float _532 = _494;
    float _534 = _484;
    float _536 = _496;
    float _538 = _470;
    float _540 = _480;
    if (_504)
    {
        float _542 = _524 ? _484 : _472;
        _478 = _542;
    }
    float _544 = _478;
    if (_508)
    {
        float _546 = _486 ? _512 : _492;
        _530 = _546;
    }
    float _548 = _530;
    if (!_520)
    {
        _532 = _440;
    }
    float _550 = _532;
    float _552 = _550;
    if (!_520)
    {
        _534 = _436;
    }
    float _554 = _534;
    float _556 = _554;
    if (!_520)
    {
        _536 = _518;
    }
    float _558 = _536;
    bool _560 = !_520;
    float _562 = _558;
    if (!_560)
    {
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _568 = _470 + _566;
        float _570 = rsqrt(_464);
        float _572 = _568 * _564;
        float _574 = _518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _576 = _572 * 0.15915493667125701904296875;
        float _578 = _576 * 6.283185482025146484375;
        float _580 = sin(_578);
        float _582 = _576 * 6.283185482025146484375;
        float _584 = cos(_582);
        float _586 = fma(_580, _574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _588 = _570 * _586;
        float _590 = _584 + (-1.0);
        float _592 = _590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _594 = fma(_454, _588, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _596 = fma(_444, _588, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _598 = fma(_518, _584, _592);
        _562 = _598;
        _552 = _594;
        _556 = _596;
    }
    float _600 = _562;
    float _602 = _552;
    float _604 = _556;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _600 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _602 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _616 = _604 + _614;
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = rsqrt(_622);
    float _626 = _624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _612 * _626;
    float _630 = _616 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _616;
    float _648 = _636;
    float _650 = _644;
    float _652 = _626;
    if (_640)
    {
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _654;
    }
    float _656 = _646;
    if (_640)
    {
        float _658 = rsqrt(_636);
        _648 = _658;
    }
    float _660 = _648;
    if (_640)
    {
        float _662 = _644 * _656;
        _650 = _662;
    }
    float _664 = _650;
    if (_640)
    {
        float _666 = _664 * 0.15915493667125701904296875;
        _538 = _666;
    }
    float _668 = _538;
    float _670 = _618;
    float _672 = _668;
    if (_640)
    {
        float _674 = _668 * 6.283185482025146484375;
        float _676 = sin(_674);
        _670 = _676;
    }
    float _678 = _670;
    float _680 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _682 = precise::max(0.0, _680);
    float _684 = _624;
    float _686 = _682;
    float _688 = _680;
    if (_640)
    {
        float _690 = _668 * 6.283185482025146484375;
        float _692 = cos(_690);
        _684 = _692;
    }
    float _694 = _684;
    float _696 = -_626;
    float _698 = -_682;
    float _700 = fma(_608, _696, _698);
    float _702 = _700;
    if (!_640)
    {
        _686 = _628;
    }
    float _704 = _686;
    float _706 = _704;
    if (_640)
    {
        float _708 = _700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _688 = _708;
    }
    float _710 = _688;
    float _712 = _678;
    float _714 = _710;
    if (_640)
    {
        float _716 = fma(_678, _710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _712 = _716;
    }
    float _718 = _712;
    float _720 = _718;
    float _722 = _694;
    if (_640)
    {
        float _724 = _694 + (-1.0);
        _714 = _724;
    }
    float _726 = _714;
    float _728 = _726;
    if (_640)
    {
        float _730 = _660 * _718;
        _652 = _730;
    }
    float _732 = _652;
    if (!_640)
    {
        _720 = _632;
    }
    float _734 = _720;
    float _736 = sqrt(_622);
    float _738 = _734;
    if (_640)
    {
        float _740 = _726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _672 = _740;
    }
    float _742 = _672;
    if (_640)
    {
        float _744 = _628 * _732;
        _706 = _744;
    }
    float _746 = _706;
    if (!_640)
    {
        _728 = _630;
    }
    float _748 = _728;
    float _750 = _748;
    if (_640)
    {
        float _752 = _630 * _732;
        _750 = _752;
    }
    float _754 = _750;
    if (_640)
    {
        float _756 = fma(_700, _694, _742);
        _702 = _756;
    }
    float _758 = _702;
    if (_640)
    {
        float _760 = _746 * _746;
        _738 = _760;
    }
    float _762 = _738;
    if (!_640)
    {
        _722 = _634;
    }
    float _764 = _722;
    float _766 = _764;
    if (_640)
    {
        float _768 = _754 * _754;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = fma(_758, _758, _762);
    float _774 = _600 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _776 = _772 + _770;
    float _778 = _600 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _782 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[23].w, _780);
    float _784 = precise::clamp(_782, 0.0, 1.0);
    float _786 = _600 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _788 = rsqrt(_776);
    float _790 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[2].x, _778);
    float _792 = -_784;
    float _794 = _792 + 1.0;
    float _796 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[1].x, _786);
    float _798 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[3].x, _774);
    float _800 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[2].z, _790);
    float _802 = _600 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _804 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[1].z, _796);
    float _806 = abs(_794);
    float _808 = log2(_806);
    float _810 = _800 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _812 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[0].x, _802);
    float _814 = _804 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _816 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[3].z, _798);
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _820 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[0].z, _812);
    float _822 = _810 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _824 = _788 * _746;
    float _826 = _788 * _758;
    float _828 = _820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _830 = _814 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _832 = _824 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _834 = _788 * _754;
    float _836 = _816 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _838 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[7].x, _830);
    float _840 = -_832;
    float _842 = fma(_826, (*spvDescriptorSet0.vp_c15)._m0[21].y, _840);
    float _844 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _846 = -_822;
    float _848 = fma(_846, _818, 1.0);
    float _850 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[7].z, _838);
    float _852 = -_834;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c15)._m0[21].z, _842);
    float _856 = exp2(_844);
    float _858 = _814 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _860 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _850);
    float _862 = fma(_854, -0.5, 0.5);
    float _864 = _814 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _866 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[4].x, _858);
    float _868 = fma(_854, 0.5, 0.5);
    float _870 = log2(_848);
    float _872 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[5].x, _864);
    float _874 = _826 + 1.0;
    float _876 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[4].z, _866);
    float _878 = fma(_868, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _880 = 1.0 / _860;
    float _882 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[5].z, _872);
    float _884 = -_826;
    float _886 = fma(_856, _874, _884);
    float _888 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _890 = fma(_868, _878, -0.212114393711090087890625);
    float _892 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _882);
    float _894 = sqrt(_862);
    float _896 = fma(_868, _890, 1.570728778839111328125);
    float _898 = _870 * 0.693147182464599609375;
    float _900 = fma(_886, 0.5, 0.5);
    float _902 = _898 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _904 = _888 * _880;
    float _906 = _892 * _880;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = fma(_906, -0.5, 0.5);
    float _912 = _894 * 0.636619746685028076171875;
    float3 _2609 = float3(_908, _910, _902);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2609, float3(0.0), isnan(_2609)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2609, float3(0.0), isnan(_2609)), level(0.0)).x;
    float3 _2620 = float3(_908, _910, _902);
    float4 _917 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2620, float3(0.0), isnan(_2620)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2620, float3(0.0), isnan(_2620)), level(0.0)).xyzw;
    float _919 = _917.x;
    float _921 = _917.y;
    float _923 = _917.z;
    float _925 = _917.w;
    float _927 = -_896;
    float _929 = fma(_912, _927, 1.0);
    float2 _2642 = float2(_929, _900);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2642, float2(0.0), isnan(_2642)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2642, float2(0.0), isnan(_2642)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _945 = _943 != 0;
    float _947 = -_438;
    float _949 = _947 + 1.0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _953 = _951 != 0;
    float _955 = _126 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _957 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _963 = _524 ? as_type<int>(_949) : as_type<int>(_438);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _967 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _969 = -_961;
    float _971 = fma(_955, 2.0, _969);
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _975 = _945 ? as_type<float>(_963) : _438;
    float _977 = fma(_967, -2.0, _965);
    float _979 = _941 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _981 = _965;
    bool _983 = _945;
    if (_953)
    {
        _981 = _126;
    }
    float _985 = _981;
    float _987 = exp2(_957);
    float _989 = _985;
    if (!_953)
    {
        _989 = _428;
    }
    float _991 = _989;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _995 = fma(_975, _979, -0.5);
    float _997 = _979;
    float _999 = _991;
    float _1001 = _995;
    if (!_953)
    {
        float _1003 = in.m_51.z;
        _997 = _1003;
    }
    float _1005 = _997;
    float _1007 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _993);
    float _1009 = 0.0;
    if (!_953)
    {
        _1009 = _150;
    }
    float _1011 = _1009;
    float _1013 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[76].y, _977);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1017 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1007);
    float _1019 = _991 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1021 = _1011;
    int _1023 = as_type<int>(_1017);
    if (!_953)
    {
        _999 = _1011;
    }
    float _1025 = _999;
    float _1027 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _973);
    float _1029 = _1025;
    if (_953)
    {
        _1021 = _150;
    }
    float _1031 = _1021;
    float _1033 = -_1015;
    float _1035 = fma(_1019, 2.0, _1033);
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1039 = -_1013;
    float _1041 = fma(_1017, _995, _1039);
    if (_450)
    {
        float _1043 = -_418;
        float _1045 = _1043 + 1.0;
        _1023 = as_type<int>(_1045);
    }
    int _1047 = _1023;
    if (_450)
    {
        bool _1049 = _126 > 0.5;
        _983 = _1049;
    }
    bool _1051 = _983;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1055 = -_96;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1035);
    if (_953)
    {
        _1029 = _126;
    }
    float _1059 = _1029;
    out.m_63.y = _144;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_450)
    {
        float _1063 = _1051 ? as_type<float>(_1047) : _418;
        _540 = _1063;
    }
    float _1065 = _540;
    float _1067 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1069 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1053);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1073 = -_1061;
    float _1075 = fma(_1067, 2.0, _1073);
    float _1077 = _1005;
    float _1079 = _1067;
    if (!_953)
    {
        _1001 = _1005;
    }
    float _1081 = _1001;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1085 = _1081;
    if (_953)
    {
        _1085 = _1031;
    }
    float _1087 = _1085;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_953)
    {
        _1077 = _1031;
    }
    float _1091 = _1077;
    float _1093 = -_96;
    float _1095 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1075);
    if (_953)
    {
        _1079 = _1031;
    }
    float _1097 = _1079;
    float _1099 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1071);
    float _1101 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1103 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1089);
    float _1105 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1107 = _1097;
    if (!_953)
    {
        _1107 = _126;
    }
    float _1109 = _1107;
    float _1111 = fma(_1101, _1065, -0.5);
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1117 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1099);
    float _1119 = fma(_1105, -2.0, _1113);
    float _1121 = -_96;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[76].x, _971);
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1127 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1133 = fma(_1117, _1111, _1123);
    float _1135 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1125);
    float _1137 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1103);
    float _1139 = fma(_1127, -2.0, _1131);
    float _1141 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1143 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1027);
    float _1145 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1069);
    float _1147 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1135);
    float _1149 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1119);
    float _1151 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1139);
    float _1153 = _814 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _142;
    float _1155 = fma(_1141, _516, -0.5);
    float _1157 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1159 = _959 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1161 = -_987;
    float _1163 = _1161 + 1.0;
    float _1165 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1153);
    float _1167 = fma(_1157, _544, -0.5);
    float _1169 = fma(_1159, _528, -0.5);
    float _1171 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_63.w = _148;
    float _1173 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1165);
    float _1175 = fma(_1137, _1167, _1057);
    float _1177 = fma(_1171, _548, -0.5);
    float _1179 = fma(_1145, _1155, _1095);
    float _1181 = -_1149;
    float _1183 = fma(_1147, _1169, _1181);
    float _1185 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1173);
    float _1187 = -_1151;
    float _1189 = fma(_1143, _1177, _1187);
    float _1191 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1193 = _1175 + 0.5;
    float _1195 = _1041 + 0.5;
    float _1197 = _1133 + 0.5;
    float _1199 = _1179 + 0.5;
    float _1201 = _1183 + 0.5;
    float _1203 = _1189 + 0.5;
    float _1205 = _1185 + _860;
    out.m_65.x = _1197;
    out.m_65.y = _1195;
    out.m_65.z = _1199;
    out.m_65.w = _1201;
    float _1207 = _1205 * 0.5;
    out.m_67.x = _1193;
    out.m_67.y = _1203;
    out.gl_Position.x = _888;
    out.gl_Position.y = _892;
    out.gl_Position.z = _1185;
    out.gl_Position.w = _860;
    out.m_69.z = _1207;
    out.m_69.w = _860;
    float _1209 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _1209;
    float _1211 = _1191 * _914;
    float _1213 = _925 * _1211;
    float _1215 = _939 * _1211;
    float _1217 = -_1191;
    float _1219 = _1217 + 1.0;
    float _1221 = fma(_935, _1213, _919);
    float _1223 = fma(_937, _1213, _921);
    float _1225 = fma(_925, _1215, _923);
    float _1227 = _925 * _1219;
    out.m_71.x = _1221;
    out.m_71.y = _1223;
    out.m_71.z = _1225;
    out.m_71.w = _1227;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _104 = as_type<float>(_92);
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _102;
    if (!_100)
    {
        out.m_49.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1294 = as_type<float>(_112);
        out.gl_Position.z = _1294;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _116 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_87);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = in.m_51.x;
    float _128 = float(_92);
    bool _130 = _96 >= _128;
    bool _132 = !_124;
    bool _134 = _130 || _132;
    if (_134)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _104;
    if (_134)
    {
        out.m_49.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _114 = as_type<int>(_138);
    }
    int _140 = _114;
    out.m_53.x = _126;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1353 = as_type<float>(_140);
        out.gl_Position.z = _1353;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _160 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].x, _126);
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_59.z;
    float _174 = in.m_59.w;
    float _176 = in.m_59.y;
    float _178 = fma(_146, 2.0, -1.0);
    float _180 = fma(_148, 2.0, -1.0);
    float _182 = fma(_148, 1.58766305446624755859375, _160);
    float _184 = fma(_142, 2.0, -1.0);
    float _186 = -_180;
    float _188 = _186 + _178;
    float _190 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[191].z, _182);
    float _192 = _148 * 0.5;
    float _194 = abs(_184);
    float _196 = _194 * _144;
    float _198 = _184 * _184;
    float _200 = _190 * 6.283185482025146484375;
    float _202 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].w, _192);
    float _204 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00833333469927310943603515625, _150);
    float _206 = fma(_196, 2.5, 1.0);
    float _208 = _200 * 0.15915493667125701904296875;
    float _210 = _202 * 6.283185482025146484375;
    float _212 = fma(_148, 0.9545400142669677734375, _204);
    float _214 = in.m_59.x;
    float _216 = _198 * _144;
    float _218 = _210 * 0.15915493667125701904296875;
    float _220 = _208 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[192].z, _212);
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _228 = in.m_44.x;
    float _230 = in.m_44.y;
    float _232 = in.m_44.z;
    float _234 = _224 * 6.283185482025146484375;
    float _236 = fma(_226, _144, _156);
    float _238 = in.m_42.x;
    float _240 = in.m_42.y;
    float _242 = in.m_42.z;
    float _244 = _218 * 6.283185482025146484375;
    float _246 = sin(_244);
    float _248 = _234 * 0.15915493667125701904296875;
    float _250 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[192].y, _158);
    float _252 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _254 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _256 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _258 = _222 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _260 = _252;
    float _262 = _254;
    if (!_170)
    {
        float _264 = _254 * _254;
        float _266 = _264 * 0.5;
        _260 = _266;
    }
    float _268 = _260;
    float _270 = fma(_258, _144, _154);
    float _272 = fma(_144, -60.0, _250);
    float _274 = _248 * 6.283185482025146484375;
    float _276 = sin(_274);
    float _278 = _268;
    if (!_170)
    {
        float _280 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _280;
    }
    float _282 = _278;
    float _284 = _246 * 25.0;
    float _286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _272);
    bool _288 = !_170;
    float _290 = _282;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = _254 * _294;
        float _304 = 1.0 / _298;
        float _306 = _300 * 0.693147182464599609375;
        float _308 = exp2(_302);
        float _310 = 1.0 / _306;
        float _312 = _308 + (-1.0);
        float _314 = -_312;
        float _316 = fma(_314, _310, _254);
        float _318 = _316 * _304;
        float _320 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _320;
    }
    float _322 = _290;
    bool _324 = !_170;
    if (!_324)
    {
        float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _328 = log2(_326);
        float _330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _332 = _330 + 1.0;
        float _334 = 1.0 / _332;
        float _336 = _254 * _328;
        float _338 = exp2(_336);
        float _340 = -_338;
        float _342 = _340 + 1.0;
        float _344 = _342 * _334;
        _262 = _344;
    }
    float _346 = _262;
    float _348 = abs(_284);
    float _350 = fma(_348, _144, _236);
    float _352 = _270 * _206;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _356 = _354 + 1.0;
    float _358 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _362 = _276 * 2.0;
    float _364 = fma(_356, _144, (*spvDescriptorSet0.vp_c9)._m0[192].w);
    float _366 = fma(_346, _228, _358);
    float _368 = fma(_346, _230, _360);
    float _370 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = fma(_364, _188, _352);
    float _374 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _376 = fma(_366, _174, _238);
    float _378 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = fma(_368, _174, _240);
    float _382 = fma(_188, _362, _372);
    float _384 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _350);
    float _388 = fma(_346, _232, _374);
    float _390 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _392 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = _384 * _386;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _382);
    float _398 = fma(_388, _174, _242);
    float _400 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _402 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _404 = _394 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _406 = _390 * _396;
    float _408 = _256 * _286;
    float _410 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].x, _400);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _402);
    float _414 = _394 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _416 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[10].x, _404);
    float _418 = in.m_61.x;
    float _420 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _410);
    float _422 = _412 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _424 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[8].x, _414);
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[10].z, _416);
    float _428 = in.m_51.z;
    float _430 = in.m_51.w;
    float _432 = _420 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _434 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[8].z, _424);
    float _436 = _422 + _426;
    float _438 = in.m_61.y;
    float _440 = _432 + _434;
    float _442 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _444 = _436 + _442;
    float _446 = _394 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _450 = _448 != 0;
    float _452 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _454 = _440 + _452;
    float _456 = _444 * _444;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _460 = _458 != 0;
    float _462 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[9].x, _446);
    float _464 = fma(_454, _454, _456);
    float _466 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _468 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[9].z, _462);
    float _470 = sqrt(_464);
    float _472 = _390 * _418;
    float _474 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].x, _466);
    float _476 = _434;
    float _478 = _472;
    if (!_450)
    {
        _476 = _418;
    }
    float _480 = _476;
    float _482 = -_472;
    float _484 = _482 + 1.0;
    bool _486 = _428 > 0.5;
    float _488 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _474);
    bool _490 = _430 > 0.5;
    float _492 = _384 * _438;
    float _494 = _486 ? _484 : _472;
    float _496 = _488 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _508 = _506 != 0;
    float _510 = -_492;
    float _512 = _510 + 1.0;
    bool _514 = !_460;
    float _516 = _514 ? _472 : _494;
    float _518 = _496 + _468;
    bool _520 = _470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _522 = _490 ? as_type<int>(_512) : as_type<int>(_492);
    bool _524 = _150 > 0.5;
    bool _526 = !_500;
    float _528 = _526 ? _492 : as_type<float>(_522);
    float _530 = _492;
    float _532 = _494;
    float _534 = _484;
    float _536 = _496;
    float _538 = _470;
    float _540 = _480;
    if (_504)
    {
        float _542 = _524 ? _484 : _472;
        _478 = _542;
    }
    float _544 = _478;
    if (_508)
    {
        float _546 = _486 ? _512 : _492;
        _530 = _546;
    }
    float _548 = _530;
    if (!_520)
    {
        _532 = _440;
    }
    float _550 = _532;
    float _552 = _550;
    if (!_520)
    {
        _534 = _436;
    }
    float _554 = _534;
    float _556 = _554;
    if (!_520)
    {
        _536 = _518;
    }
    float _558 = _536;
    bool _560 = !_520;
    float _562 = _558;
    if (!_560)
    {
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _568 = _470 + _566;
        float _570 = rsqrt(_464);
        float _572 = _568 * _564;
        float _574 = _518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _576 = _572 * 0.15915493667125701904296875;
        float _578 = _576 * 6.283185482025146484375;
        float _580 = sin(_578);
        float _582 = _576 * 6.283185482025146484375;
        float _584 = cos(_582);
        float _586 = fma(_580, _574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _588 = _570 * _586;
        float _590 = _584 + (-1.0);
        float _592 = _590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _594 = fma(_454, _588, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _596 = fma(_444, _588, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _598 = fma(_518, _584, _592);
        _562 = _598;
        _552 = _594;
        _556 = _596;
    }
    float _600 = _562;
    float _602 = _552;
    float _604 = _556;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _600 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _602 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _616 = _604 + _614;
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = rsqrt(_622);
    float _626 = _624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _612 * _626;
    float _630 = _616 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _616;
    float _648 = _636;
    float _650 = _644;
    float _652 = _626;
    if (_640)
    {
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _654;
    }
    float _656 = _646;
    if (_640)
    {
        float _658 = rsqrt(_636);
        _648 = _658;
    }
    float _660 = _648;
    if (_640)
    {
        float _662 = _644 * _656;
        _650 = _662;
    }
    float _664 = _650;
    if (_640)
    {
        float _666 = _664 * 0.15915493667125701904296875;
        _538 = _666;
    }
    float _668 = _538;
    float _670 = _618;
    float _672 = _668;
    if (_640)
    {
        float _674 = _668 * 6.283185482025146484375;
        float _676 = sin(_674);
        _670 = _676;
    }
    float _678 = _670;
    float _680 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _682 = precise::max(0.0, _680);
    float _684 = _624;
    float _686 = _682;
    float _688 = _680;
    if (_640)
    {
        float _690 = _668 * 6.283185482025146484375;
        float _692 = cos(_690);
        _684 = _692;
    }
    float _694 = _684;
    float _696 = -_626;
    float _698 = -_682;
    float _700 = fma(_608, _696, _698);
    float _702 = _700;
    if (!_640)
    {
        _686 = _628;
    }
    float _704 = _686;
    float _706 = _704;
    if (_640)
    {
        float _708 = _700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _688 = _708;
    }
    float _710 = _688;
    float _712 = _678;
    float _714 = _710;
    if (_640)
    {
        float _716 = fma(_678, _710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _712 = _716;
    }
    float _718 = _712;
    float _720 = _718;
    float _722 = _694;
    if (_640)
    {
        float _724 = _694 + (-1.0);
        _714 = _724;
    }
    float _726 = _714;
    float _728 = _726;
    if (_640)
    {
        float _730 = _660 * _718;
        _652 = _730;
    }
    float _732 = _652;
    if (!_640)
    {
        _720 = _632;
    }
    float _734 = _720;
    float _736 = sqrt(_622);
    float _738 = _734;
    if (_640)
    {
        float _740 = _726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _672 = _740;
    }
    float _742 = _672;
    if (_640)
    {
        float _744 = _628 * _732;
        _706 = _744;
    }
    float _746 = _706;
    if (!_640)
    {
        _728 = _630;
    }
    float _748 = _728;
    float _750 = _748;
    if (_640)
    {
        float _752 = _630 * _732;
        _750 = _752;
    }
    float _754 = _750;
    if (_640)
    {
        float _756 = fma(_700, _694, _742);
        _702 = _756;
    }
    float _758 = _702;
    if (_640)
    {
        float _760 = _746 * _746;
        _738 = _760;
    }
    float _762 = _738;
    if (!_640)
    {
        _722 = _634;
    }
    float _764 = _722;
    float _766 = _764;
    if (_640)
    {
        float _768 = _754 * _754;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = fma(_758, _758, _762);
    float _774 = _600 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _776 = _772 + _770;
    float _778 = _600 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _782 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[23].w, _780);
    float _784 = precise::clamp(_782, 0.0, 1.0);
    float _786 = _600 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _788 = rsqrt(_776);
    float _790 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[2].x, _778);
    float _792 = -_784;
    float _794 = _792 + 1.0;
    float _796 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[1].x, _786);
    float _798 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[3].x, _774);
    float _800 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[2].z, _790);
    float _802 = _600 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _804 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[1].z, _796);
    float _806 = abs(_794);
    float _808 = log2(_806);
    float _810 = _800 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _812 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[0].x, _802);
    float _814 = _804 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _816 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[3].z, _798);
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _820 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[0].z, _812);
    float _822 = _810 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _824 = _788 * _746;
    float _826 = _788 * _758;
    float _828 = _820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _830 = _814 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _832 = _824 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _834 = _788 * _754;
    float _836 = _816 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _838 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[7].x, _830);
    float _840 = -_832;
    float _842 = fma(_826, (*spvDescriptorSet0.vp_c15)._m0[21].y, _840);
    float _844 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _846 = -_822;
    float _848 = fma(_846, _818, 1.0);
    float _850 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[7].z, _838);
    float _852 = -_834;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c15)._m0[21].z, _842);
    float _856 = exp2(_844);
    float _858 = _814 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _860 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _850);
    float _862 = fma(_854, -0.5, 0.5);
    float _864 = _814 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _866 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[4].x, _858);
    float _868 = fma(_854, 0.5, 0.5);
    float _870 = log2(_848);
    float _872 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[5].x, _864);
    float _874 = _826 + 1.0;
    float _876 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[4].z, _866);
    float _878 = fma(_868, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _880 = 1.0 / _860;
    float _882 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[5].z, _872);
    float _884 = -_826;
    float _886 = fma(_856, _874, _884);
    float _888 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _890 = fma(_868, _878, -0.212114393711090087890625);
    float _892 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _882);
    float _894 = sqrt(_862);
    float _896 = fma(_868, _890, 1.570728778839111328125);
    float _898 = _870 * 0.693147182464599609375;
    float _900 = fma(_886, 0.5, 0.5);
    float _902 = _898 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _904 = _888 * _880;
    float _906 = _892 * _880;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = fma(_906, -0.5, 0.5);
    float _912 = _894 * 0.636619746685028076171875;
    float3 _2609 = float3(_908, _910, _902);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2609, float3(0.0), isnan(_2609)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2609, float3(0.0), isnan(_2609)), level(0.0)).x;
    float3 _2620 = float3(_908, _910, _902);
    float4 _917 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2620, float3(0.0), isnan(_2620)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2620, float3(0.0), isnan(_2620)), level(0.0)).xyzw;
    float _919 = _917.x;
    float _921 = _917.y;
    float _923 = _917.z;
    float _925 = _917.w;
    float _927 = -_896;
    float _929 = fma(_912, _927, 1.0);
    float2 _2642 = float2(_929, _900);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2642, float2(0.0), isnan(_2642)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2642, float2(0.0), isnan(_2642)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _945 = _943 != 0;
    float _947 = -_438;
    float _949 = _947 + 1.0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _953 = _951 != 0;
    float _955 = _126 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _957 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _963 = _524 ? as_type<int>(_949) : as_type<int>(_438);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _967 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _969 = -_961;
    float _971 = fma(_955, 2.0, _969);
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _975 = _945 ? as_type<float>(_963) : _438;
    float _977 = fma(_967, -2.0, _965);
    float _979 = _941 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _981 = _965;
    bool _983 = _945;
    if (_953)
    {
        _981 = _126;
    }
    float _985 = _981;
    float _987 = exp2(_957);
    float _989 = _985;
    if (!_953)
    {
        _989 = _428;
    }
    float _991 = _989;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _995 = fma(_975, _979, -0.5);
    float _997 = _979;
    float _999 = _991;
    float _1001 = _995;
    if (!_953)
    {
        float _1003 = in.m_51.z;
        _997 = _1003;
    }
    float _1005 = _997;
    float _1007 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _993);
    float _1009 = 0.0;
    if (!_953)
    {
        _1009 = _150;
    }
    float _1011 = _1009;
    float _1013 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[76].y, _977);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1017 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1007);
    float _1019 = _991 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1021 = _1011;
    int _1023 = as_type<int>(_1017);
    if (!_953)
    {
        _999 = _1011;
    }
    float _1025 = _999;
    float _1027 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _973);
    float _1029 = _1025;
    if (_953)
    {
        _1021 = _150;
    }
    float _1031 = _1021;
    float _1033 = -_1015;
    float _1035 = fma(_1019, 2.0, _1033);
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1039 = -_1013;
    float _1041 = fma(_1017, _995, _1039);
    if (_450)
    {
        float _1043 = -_418;
        float _1045 = _1043 + 1.0;
        _1023 = as_type<int>(_1045);
    }
    int _1047 = _1023;
    if (_450)
    {
        bool _1049 = _126 > 0.5;
        _983 = _1049;
    }
    bool _1051 = _983;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1055 = -_96;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1035);
    if (_953)
    {
        _1029 = _126;
    }
    float _1059 = _1029;
    out.m_63.y = _144;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_450)
    {
        float _1063 = _1051 ? as_type<float>(_1047) : _418;
        _540 = _1063;
    }
    float _1065 = _540;
    float _1067 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1069 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1053);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1073 = -_1061;
    float _1075 = fma(_1067, 2.0, _1073);
    float _1077 = _1005;
    float _1079 = _1067;
    if (!_953)
    {
        _1001 = _1005;
    }
    float _1081 = _1001;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1085 = _1081;
    if (_953)
    {
        _1085 = _1031;
    }
    float _1087 = _1085;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_953)
    {
        _1077 = _1031;
    }
    float _1091 = _1077;
    float _1093 = -_96;
    float _1095 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1075);
    if (_953)
    {
        _1079 = _1031;
    }
    float _1097 = _1079;
    float _1099 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1071);
    float _1101 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1103 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1089);
    float _1105 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1107 = _1097;
    if (!_953)
    {
        _1107 = _126;
    }
    float _1109 = _1107;
    float _1111 = fma(_1101, _1065, -0.5);
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1117 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1099);
    float _1119 = fma(_1105, -2.0, _1113);
    float _1121 = -_96;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[76].x, _971);
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1127 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1133 = fma(_1117, _1111, _1123);
    float _1135 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1125);
    float _1137 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1103);
    float _1139 = fma(_1127, -2.0, _1131);
    float _1141 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1143 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1027);
    float _1145 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1069);
    float _1147 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1135);
    float _1149 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1119);
    float _1151 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1139);
    float _1153 = _814 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _142;
    float _1155 = fma(_1141, _516, -0.5);
    float _1157 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1159 = _959 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1161 = -_987;
    float _1163 = _1161 + 1.0;
    float _1165 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1153);
    float _1167 = fma(_1157, _544, -0.5);
    float _1169 = fma(_1159, _528, -0.5);
    float _1171 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_63.w = _148;
    float _1173 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1165);
    float _1175 = fma(_1137, _1167, _1057);
    float _1177 = fma(_1171, _548, -0.5);
    float _1179 = fma(_1145, _1155, _1095);
    float _1181 = -_1149;
    float _1183 = fma(_1147, _1169, _1181);
    float _1185 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1173);
    float _1187 = -_1151;
    float _1189 = fma(_1143, _1177, _1187);
    float _1191 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1193 = _1175 + 0.5;
    float _1195 = _1041 + 0.5;
    float _1197 = _1133 + 0.5;
    float _1199 = _1179 + 0.5;
    float _1201 = _1183 + 0.5;
    float _1203 = _1189 + 0.5;
    float _1205 = _1185 + _860;
    out.m_65.x = _1197;
    out.m_65.y = _1195;
    out.m_65.z = _1199;
    out.m_65.w = _1201;
    float _1207 = _1205 * 0.5;
    out.m_67.x = _1193;
    out.m_67.y = _1203;
    out.gl_Position.x = _888;
    out.gl_Position.y = _892;
    out.gl_Position.z = _1185;
    out.gl_Position.w = _860;
    out.m_69.z = _1207;
    out.m_69.w = _860;
    float _1209 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _1209;
    float _1211 = _1191 * _914;
    float _1213 = _925 * _1211;
    float _1215 = _939 * _1211;
    float _1217 = -_1191;
    float _1219 = _1217 + 1.0;
    float _1221 = fma(_935, _1213, _919);
    float _1223 = fma(_937, _1213, _921);
    float _1225 = fma(_925, _1215, _923);
    float _1227 = _925 * _1219;
    out.m_71.x = _1221;
    out.m_71.y = _1223;
    out.m_71.z = _1225;
    out.m_71.w = _1227;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

