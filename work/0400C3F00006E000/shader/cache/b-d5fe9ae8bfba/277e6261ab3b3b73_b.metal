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
    float4 m_61 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_75 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    float _106 = _104;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1529 = as_type<float>(_112);
        out.gl_Position.z = _1529;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_94);
        _106 = _132;
    }
    float _134 = _106;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _114 = as_type<int>(_144);
    }
    int _146 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1597 = as_type<float>(_146);
        out.gl_Position.z = _1597;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.w;
    float _150 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _152 = _150 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _154 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c8)._m0[29].y);
    float _156 = in.m_49.x;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = precise::min(_154, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _170 = 1.0 / _152;
    float _172 = in.m_49.y;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _176 = _168 + _174;
    float _178 = in.m_49.z;
    float _180 = in.m_47.x;
    float _182 = in.m_47.y;
    float _184 = in.m_47.z;
    float _186 = in.m_42.x;
    float _188 = in.m_42.y;
    float _190 = in.m_42.z;
    float _192 = _176 * _170;
    float _194 = in.m_51.x;
    float _196 = in.m_51.y;
    float _198 = in.m_51.z;
    float _200 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _202 = _192 >= 0.0;
    bool _204 = isnan(_192);
    bool _206 = _202 || _204;
    bool _208 = isnan(0.0);
    bool _210 = _206 || _208;
    float _212 = _176;
    float _214 = _200;
    float _216 = _178;
    if (!_166)
    {
        float _218 = _200 * _200;
        float _220 = _218 * 0.5;
        _212 = _220;
    }
    float _222 = _212;
    bool _224 = _192 > 0.0;
    int _226 = _210 ? 0 : 1;
    float _228 = _222;
    if (!_166)
    {
        float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _230;
    }
    float _232 = _228;
    bool _234 = !_166;
    float _236 = _232;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _200 * _240;
        float _250 = 1.0 / _244;
        float _252 = _246 * 0.693147182464599609375;
        float _254 = exp2(_248);
        float _256 = 1.0 / _252;
        float _258 = _254 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _256, _200);
        float _264 = _262 * _250;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_166;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _200 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _214 = _290;
    }
    float _292 = _214;
    int _294 = ~_226;
    int _296 = _294 + 1;
    int _298 = _296 + 1;
    float _300 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _302 = _298;
    if (!_224)
    {
        int _304 = ~_226;
        int _306 = _304 + 1;
        _302 = _306;
    }
    int _308 = _302;
    float _310 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _312 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _314 = fma(_292, _180, _300);
    float _316 = float(_308);
    float _318 = fma(_292, _182, _310);
    float _320 = fma(_292, _184, _312);
    float _322 = fma(_314, _148, _186);
    float _324 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = _316 * _198;
    float _328 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = _316 * _196;
    float _332 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _326);
    float _336 = fma(_318, _148, _188);
    float _338 = _316 * _194;
    float _340 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = _332 * _334;
    float _344 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _330);
    float _348 = fma(_320, _148, _190);
    float _350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _338);
    float _352 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _354 = _344 * _346;
    float _356 = _336 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _358 = _336 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _360 = _352 * _350;
    float _362 = _354 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _364 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].x, _356);
    float _366 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].x, _358);
    float _368 = _354 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[10].x, _362);
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _364);
    float _374 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _366);
    float _376 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[8].x, _368);
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _380 = _378 != 0;
    float _382 = _372 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _384 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[10].z, _370);
    float _386 = _374 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _388 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[8].z, _376);
    float _390 = in.m_53.y;
    float _392 = _382 + _384;
    float _394 = _354 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _396 = _386 + _388;
    float _398 = in.m_53.z;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _402 = _392 + _400;
    float _404 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[9].x, _394);
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _408 = _396 + _406;
    float _410 = 0.0;
    float _412 = _394;
    float _414 = _396;
    float _416 = _392;
    float _418 = _408;
    if (_380)
    {
        float _420 = in.m_53.x;
        _410 = _420;
    }
    float _422 = _410;
    float _424 = _402 * _402;
    float _426 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[9].z, _404);
    int _428 = 0;
    if (_380)
    {
        _428 = 0;
    }
    int _430 = _428;
    float _432 = fma(_408, _408, _424);
    float _434 = _336 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _436 = 0;
    int _438 = _430;
    if (_380)
    {
        _436 = 0;
    }
    int _440 = _436;
    float _442 = sqrt(_432);
    float _444 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].x, _434);
    float _446 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _448 = 0.0;
    int _450 = _440;
    float _452 = _390;
    if (_380)
    {
        _448 = _390;
    }
    float _454 = _448;
    float _456 = _446 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _458 = 0;
    float _460 = _456;
    float _462 = _454;
    float _464 = _398;
    if (_380)
    {
        _458 = as_type<int>(_398);
    }
    int _466 = _458;
    float _468 = _456 + _426;
    float _470 = 0.0;
    float _472 = _422;
    int _474 = _466;
    if (_380)
    {
        _470 = _422;
    }
    float _476 = _470;
    bool _478 = _442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _480 = _476;
    if (!_380)
    {
        float _482 = in.m_53.x;
        float _484 = _390 * 3.1415927410125732421875;
        float _486 = _484 * 0.15915493667125701904296875;
        float _488 = _398 * 3.1415927410125732421875;
        float _490 = _488 * 0.15915493667125701904296875;
        float _492 = _486 * 6.283185482025146484375;
        float _494 = sin(_492);
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _482 * 3.1415927410125732421875;
        float _502 = _500 * 0.15915493667125701904296875;
        float _504 = _502 * 6.283185482025146484375;
        float _506 = sin(_504);
        _460 = _502;
        _438 = 1;
        _450 = 2;
        _472 = _482;
        _480 = _506;
        _462 = _494;
        _474 = as_type<int>(_498);
    }
    float _508 = _460;
    int _510 = _438;
    int _512 = _450;
    float _514 = _472;
    float _516 = _480;
    float _518 = _462;
    int _520 = _474;
    float _522 = _508;
    if (!_478)
    {
        _412 = _396;
    }
    float _524 = _412;
    float _526 = _524;
    if (!_478)
    {
        _522 = _392;
    }
    float _528 = _522;
    float _530 = _528;
    if (!_478)
    {
        _414 = _468;
    }
    float _532 = _414;
    bool _534 = !_478;
    float _536 = _532;
    if (!_534)
    {
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _540 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _542 = _442 + _540;
        float _544 = _468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _546 = rsqrt(_432);
        float _548 = _542 * _538;
        float _550 = _548 * 0.15915493667125701904296875;
        float _552 = _550 * 6.283185482025146484375;
        float _554 = cos(_552);
        float _556 = _550 * 6.283185482025146484375;
        float _558 = sin(_556);
        float _560 = _554 + (-1.0);
        float _562 = fma(_558, _544, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _564 = _560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = _546 * _562;
        float _568 = fma(_468, _554, _564);
        float _570 = fma(_408, _566, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _572 = fma(_402, _566, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _536 = _568;
        _526 = _570;
        _530 = _572;
    }
    float _574 = _536;
    float _576 = _526;
    float _578 = _530;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _582 = _574 + _580;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _576 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _590 = _578 + _588;
    float _592 = _582 * _582;
    float _594 = fma(_586, _586, _592);
    float _596 = fma(_590, _590, _594);
    float _598 = rsqrt(_596);
    float _600 = _598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _602 = _586 * _600;
    float _604 = _590 * _600;
    float _606 = _602 * _602;
    float _608 = _604 * _604;
    float _610 = _606 + _608;
    float _612 = sqrt(_610);
    bool _614 = _612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _618 = _612 + _616;
    float _620 = _598;
    float _622 = _610;
    float _624 = _618;
    float _626 = _582;
    if (_614)
    {
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _628;
    }
    float _630 = _620;
    if (_614)
    {
        float _632 = rsqrt(_610);
        _622 = _632;
    }
    float _634 = _622;
    float _636 = _634;
    if (_614)
    {
        float _638 = _618 * _630;
        _624 = _638;
    }
    float _640 = _624;
    if (_614)
    {
        float _642 = _640 * 0.15915493667125701904296875;
        _416 = _642;
    }
    float _644 = _416;
    float _646 = _590;
    if (_614)
    {
        float _648 = _644 * 6.283185482025146484375;
        float _650 = sin(_648);
        _646 = _650;
    }
    float _652 = _646;
    float _654 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _656 = precise::max(0.0, _654);
    float _658 = _630;
    float _660 = _656;
    if (_614)
    {
        float _662 = _644 * 6.283185482025146484375;
        float _664 = cos(_662);
        _658 = _664;
    }
    float _666 = _658;
    float _668 = -_600;
    float _670 = -_656;
    float _672 = fma(_582, _668, _670);
    if (_614)
    {
        float _674 = _672 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _626 = _674;
    }
    float _676 = _626;
    float _678 = sqrt(_596);
    float _680 = _676;
    float _682 = _652;
    if (_614)
    {
        float _684 = fma(_652, _676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _680 = _684;
    }
    float _686 = _680;
    float _688 = _686;
    if (!_614)
    {
        _682 = _602;
    }
    float _690 = _682;
    float _692 = _690;
    float _694 = _666;
    if (_614)
    {
        float _696 = _666 + (-1.0);
        _660 = _696;
    }
    float _698 = _660;
    float _700 = _698;
    if (_614)
    {
        float _702 = _634 * _686;
        _216 = _702;
    }
    float _704 = _216;
    if (!_614)
    {
        _688 = _672;
    }
    float _706 = _688;
    float _708 = _706;
    if (_614)
    {
        float _710 = _698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _418 = _710;
    }
    float _712 = _418;
    if (_614)
    {
        float _714 = _602 * _704;
        _692 = _714;
    }
    float _716 = _692;
    if (!_614)
    {
        _700 = _604;
    }
    float _718 = _700;
    float _720 = _718;
    if (_614)
    {
        float _722 = _604 * _704;
        _720 = _722;
    }
    float _724 = _720;
    if (!_614)
    {
        _636 = _606;
    }
    float _726 = _636;
    float _728 = _726;
    if (_614)
    {
        float _730 = fma(_672, _666, _712);
        _708 = _730;
    }
    float _732 = _708;
    if (_614)
    {
        float _734 = _716 * _716;
        _728 = _734;
    }
    float _736 = _728;
    if (!_614)
    {
        _694 = _608;
    }
    float _738 = _694;
    float _740 = _738;
    if (_614)
    {
        float _742 = _724 * _724;
        _740 = _742;
    }
    float _744 = _740;
    float _746 = fma(_732, _732, _736);
    float _748 = _746 + _744;
    float _750 = _574 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _754 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[23].w, _752);
    float _756 = precise::clamp(_754, 0.0, 1.0);
    float _758 = _574 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _762 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _750);
    float _764 = rsqrt(_748);
    float _766 = -_756;
    float _768 = _766 + 1.0;
    float _770 = _574 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _772 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _762);
    float _774 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _758);
    float _776 = _574 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _778 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _770);
    float _780 = _772 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _782 = abs(_768);
    float _784 = log2(_782);
    float _786 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _774);
    float _788 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _778);
    float _790 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _776);
    float _792 = _780 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _794 = _786 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _796 = _788 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _798 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _790);
    float _800 = _764 * _716;
    float _802 = _794 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _804 = _764 * _732;
    float _806 = _764 * _724;
    float _808 = _800 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _810 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[7].x, _802);
    float _812 = _798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _814 = -_792;
    float _816 = fma(_814, _760, 1.0);
    float _818 = _784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _820 = -_808;
    float _822 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _820);
    float _824 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[7].z, _810);
    float _826 = _794 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _828 = -_806;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[21].z, _822);
    float _832 = exp2(_818);
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[7].w, _824);
    float _836 = _794 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _838 = fma(_830, -0.5, 0.5);
    float _840 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[4].x, _826);
    float _842 = fma(_830, 0.5, 0.5);
    float _844 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[5].x, _836);
    float _846 = _804 + 1.0;
    float _848 = log2(_816);
    float _850 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[4].z, _840);
    float _852 = fma(_842, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _854 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[5].z, _844);
    float _856 = fma(_842, _852, -0.212114393711090087890625);
    float _858 = 1.0 / _834;
    float _860 = -_804;
    float _862 = fma(_832, _846, _860);
    float _864 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[4].w, _850);
    float _866 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[5].w, _854);
    float _868 = fma(_842, _856, 1.570728778839111328125);
    float _870 = fma(_862, 0.5, 0.5);
    float _872 = sqrt(_838);
    float _874 = _848 * 0.693147182464599609375;
    float _876 = _874 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _878 = _864 * _858;
    float _880 = _866 * _858;
    float _882 = fma(_878, 0.5, 0.5);
    float _884 = fma(_880, -0.5, 0.5);
    float _886 = _872 * 0.636619746685028076171875;
    float3 _2757 = float3(_882, _884, _876);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2757, float3(0.0), isnan(_2757)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2757, float3(0.0), isnan(_2757)), level(0.0)).x;
    float3 _2768 = float3(_882, _884, _876);
    float4 _891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2768, float3(0.0), isnan(_2768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2768, float3(0.0), isnan(_2768)), level(0.0)).xyzw;
    float _893 = _891.x;
    float _895 = _891.y;
    float _897 = _891.z;
    float _899 = _891.w;
    float _901 = -_868;
    float _903 = fma(_886, _901, 1.0);
    float2 _2790 = float2(_903, _870);
    float3 _907 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2790, float2(0.0), isnan(_2790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2790, float2(0.0), isnan(_2790)), level(0.0)).xyz;
    float _909 = _907.x;
    float _911 = _907.y;
    float _913 = _907.z;
    float _915 = in.m_55.y;
    float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _919 = _398 > 0.5;
    float _921 = in.m_55.x;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _925 = _923 != 0;
    float _927 = _784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _931 = _929 != 0;
    float _933 = _794 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _935 = _390 > 0.5;
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _941 = _939 != 0;
    float _943 = in.m_53.w;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _947 = _945 != 0;
    float _949 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[6].x, _933);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _953 = _951 != 0;
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _957 = _917 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _959 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[6].z, _949);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _963 = -_915;
    float _965 = _963 + 1.0;
    float _967 = _344 * _915;
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _971 = _937 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _973 = as_type<int>(_868);
    float _975 = _882;
    int _977 = as_type<int>(_870);
    float _979 = _921;
    float _981 = _967;
    if (_925)
    {
        float _983 = -_921;
        float _985 = _983 + 1.0;
        _973 = as_type<int>(_985);
    }
    int _987 = _973;
    int _989 = _919 ? as_type<int>(_965) : as_type<int>(_915);
    float _991 = _352 * _921;
    float _993 = _991;
    if (!_925)
    {
        _975 = _921;
    }
    float _995 = _975;
    float _997 = _995;
    if (_931)
    {
        float _999 = -_921;
        float _1001 = _999 + 1.0;
        _977 = as_type<int>(_1001);
    }
    int _1003 = _977;
    if (_925)
    {
        float _1005 = _935 ? as_type<float>(_987) : _921;
        _997 = _1005;
    }
    float _1007 = _997;
    float _1009 = -_967;
    float _1011 = _1009 + 1.0;
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1015 = _941 ? as_type<float>(_989) : _915;
    float _1017 = _955 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1019 = _947 ? as_type<float>(_989) : _915;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1023 = _953 ? as_type<float>(_989) : _915;
    float _1025 = fma(_1017, _1007, -0.5);
    float _1027 = in.m_57.w;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1031 = _1029 != 0;
    float _1033 = fma(_1019, _957, -0.5);
    float _1035 = 0.0;
    if (!_931)
    {
        _1035 = _921;
    }
    float _1037 = _1035;
    float _1039 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1021);
    float _1041 = _1037;
    if (_931)
    {
        float _1043 = _935 ? as_type<float>(_1003) : _921;
        _1041 = _1043;
    }
    float _1045 = _1041;
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1051 = _1049 != 0;
    float _1053 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1039);
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1065 = _1063 != 0;
    float _1067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1069 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1071 = _935 ? as_type<int>(_1011) : as_type<int>(_967);
    float _1073 = fma(_1069, -2.0, _961);
    float _1075 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _1077 = as_type<int>(_1013);
    if (_1031)
    {
        float _1079 = -_921;
        float _1081 = _1079 + 1.0;
        _1077 = as_type<int>(_1081);
    }
    int _1083 = _1077;
    bool _1085 = !_1057;
    float _1087 = _1085 ? _967 : as_type<float>(_1071);
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1091 = fma(_1023, _1075, -0.5);
    bool _1093 = _943 > 0.5;
    float _1095 = in.m_57.z;
    if (_1031)
    {
        float _1097 = _935 ? as_type<float>(_1083) : _921;
        _979 = _1097;
    }
    float _1099 = _979;
    float _1101 = fma(_971, _1087, -0.5);
    float _1103 = _969 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1105 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    if (_1065)
    {
        float _1107 = _1093 ? _1011 : _967;
        _981 = _1107;
    }
    float _1109 = _981;
    float _1111 = _192 * _1027;
    float _1113 = fma(_1105, _1099, -0.5);
    float _1115 = fma(_1103, _1045, -0.5);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1127 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1073);
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1135 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1145 = _510 != 1;
    float _1147 = -_1127;
    float _1149 = fma(_1053, _1101, _1147);
    out.m_59.x = _1131;
    out.m_59.y = _1135;
    out.m_59.z = _1137;
    out.m_59.w = _1129;
    float _1151 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1153 = _512 != 2;
    out.m_61.x = _1139;
    out.m_61.y = _1141;
    out.m_61.z = _1143;
    out.m_61.w = _1133;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1157 = _514 > 0.5;
    float _1159 = fma(_1015, _1151, -0.5);
    out.m_63.z = _1095;
    out.m_63.w = _1111;
    float _1161 = in.m_57.x;
    float _1163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1167 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1171 = _516 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1173 = -_1165;
    float _1175 = fma(_1167, 2.0, _1173);
    float _1177 = -_1169;
    float _1179 = fma(_1171, 2.0, _1177);
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1183 = _518 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1185 = -_991;
    float _1187 = _1185 + 1.0;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1193 = fma(_1183, -2.0, _1181);
    float _1195 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1197 = _1157 ? as_type<int>(_1187) : as_type<int>(_991);
    float _1199 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1191);
    float _1201 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1189);
    float _1203 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1193);
    bool _1205 = !_1051;
    float _1207 = _1205 ? _991 : as_type<float>(_1197);
    float _1209 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1199);
    float _1211 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1201);
    if (_1061)
    {
        float _1213 = _919 ? _1187 : _991;
        _993 = _1213;
    }
    float _1215 = _993;
    float _1217 = -_130;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1179);
    float _1221 = fma(_1195, _1207, -0.5);
    float _1223 = -_1203;
    float _1225 = fma(_1209, _1159, _1223);
    float _1227 = fma(_1211, _1025, _1219);
    bool _1229 = !_1145;
    float _1231 = _1229 ? _518 : _516;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    bool _1235 = !_1145;
    float _1237 = _1235 ? as_type<float>(_520) : _518;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1243 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1245 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1233);
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    out.m_63.x = _1161;
    float _1249 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1239);
    float _1251 = -_130;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1175);
    float _1255 = _1233;
    float _1257 = _1249;
    float _1259 = _1221;
    if (!_1145)
    {
        _1255 = _390;
    }
    float _1261 = _1255;
    float _1263 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1249);
    float _1265 = _1261;
    if (_1153)
    {
        _1257 = _514;
    }
    float _1267 = _1257;
    float _1269 = _1227 + 0.5;
    float _1271 = -_1247;
    float _1273 = fma(_1243, 2.0, _1271);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1279 = -_130;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1273);
    float _1283 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1275);
    float _1285 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _1287 = fma(_1263, _1221, _1253);
    float _1289 = _1267;
    if (!_1153)
    {
        _1289 = _398;
    }
    float _1291 = _1289;
    float _1293 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1295 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1245);
    float _1297 = fma(_1285, -2.0, _1277);
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1301 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1303 = fma(_1295, _1113, _1281);
    float _1305 = fma(_1293, _1215, -0.5);
    float _1307 = -_1299;
    float _1309 = fma(_1301, 2.0, _1307);
    float _1311 = _1293;
    if (!_1145)
    {
        _1311 = _398;
    }
    float _1313 = _1311;
    float _1315 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1297);
    float _1317 = _1313;
    if (!_1145)
    {
        _1259 = _1261;
    }
    float _1319 = _1259;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1323 = _1319;
    if (_1145)
    {
        _1317 = _390;
    }
    float _1325 = _1317;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1145)
    {
        _1265 = _514;
    }
    float _1329 = _1265;
    float _1331 = _1225 + 0.5;
    float _1333 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1321);
    float _1335 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1327);
    if (_1145)
    {
        _464 = _390;
    }
    float _1337 = _464;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1341 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[97].w, _1283);
    if (_1145)
    {
        _1323 = _514;
    }
    float _1343 = _1323;
    out.m_65.x = _1269;
    out.m_65.y = _1331;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1347 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1339);
    float _1349 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1351 = -_1315;
    float _1353 = fma(_1341, _1091, _1351);
    float _1355 = exp2(_927);
    float _1357 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1359 = -_1345;
    float _1361 = fma(_1349, 2.0, _1359);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1365 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1153)
    {
        _452 = _514;
    }
    float _1369 = _452;
    float _1371 = fma(_1357, _1109, -0.5);
    float _1373 = fma(_1365, -2.0, _1363);
    float _1375 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1367);
    float _1377 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1333);
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1381 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1373);
    float _1383 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1335);
    float _1385 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1387 = -_130;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1361);
    float _1391 = -_1381;
    float _1393 = fma(_1377, _1371, _1391);
    float _1395 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1375);
    float _1397 = fma(_1385, -2.0, _1379);
    float _1399 = fma(_1383, _1305, _1389);
    float _1401 = -_130;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1309);
    float _1405 = _864 + _834;
    float _1407 = in.m_57.y;
    float _1409 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1347);
    float _1411 = _1287 + 0.5;
    float _1413 = _1149 + 0.5;
    float _1415 = _1399 + 0.5;
    float _1417 = _1393 + 0.5;
    float _1419 = fma(_1395, _1115, _1403);
    float _1421 = _1405 * 0.5;
    float _1423 = -_1355;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1397);
    out.m_67.x = _1411;
    out.m_67.y = _1413;
    out.m_67.z = _1415;
    out.m_67.w = _1417;
    float _1429 = _834 * 0.5;
    float _1431 = _1303 + 0.5;
    float _1433 = -_1427;
    float _1435 = fma(_1409, _1033, _1433);
    float _1437 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[6].w, _959);
    float _1439 = fma(_866, -0.5, _1429);
    float _1441 = _1353 + 0.5;
    float _1443 = _1419 + 0.5;
    float _1445 = _1437 + _834;
    float _1447 = _1435 + 0.5;
    out.m_69.x = _1431;
    out.m_69.y = _1441;
    float _1449 = _1445 * 0.5;
    float _1451 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_63.y = _1407;
    float _1453 = -_1451;
    float _1455 = _1453 + 1.0;
    float _1457 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _1443;
    out.m_71.y = _1447;
    out.gl_Position.x = _864;
    out.gl_Position.y = _866;
    out.gl_Position.z = _1437;
    out.gl_Position.w = _834;
    out.m_73.x = _1421;
    out.m_73.y = _1439;
    out.m_73.z = _1449;
    out.m_73.w = _834;
    out.m_45.x = _1457;
    float _1459 = _1451 * _888;
    float _1461 = _899 * _1455;
    float _1463 = _899 * _1459;
    float _1465 = _913 * _1459;
    float _1467 = fma(_909, _1463, _893);
    float _1469 = fma(_911, _1463, _895);
    float _1471 = fma(_899, _1465, _897);
    out.m_75.x = _1467;
    out.m_75.y = _1469;
    out.m_75.z = _1471;
    out.m_75.w = _1461;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    float _106 = _104;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1529 = as_type<float>(_112);
        out.gl_Position.z = _1529;
    }
    if (!_98)
    {
        return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_94);
        _106 = _132;
    }
    float _134 = _106;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _114 = as_type<int>(_144);
    }
    int _146 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1597 = as_type<float>(_146);
        out.gl_Position.z = _1597;
    }
    if (_140)
    {
        return out;
    }
    float _148 = in.m_49.w;
    float _150 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _152 = _150 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _154 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c8)._m0[29].y);
    float _156 = in.m_49.x;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = precise::min(_154, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _170 = 1.0 / _152;
    float _172 = in.m_49.y;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _176 = _168 + _174;
    float _178 = in.m_49.z;
    float _180 = in.m_47.x;
    float _182 = in.m_47.y;
    float _184 = in.m_47.z;
    float _186 = in.m_42.x;
    float _188 = in.m_42.y;
    float _190 = in.m_42.z;
    float _192 = _176 * _170;
    float _194 = in.m_51.x;
    float _196 = in.m_51.y;
    float _198 = in.m_51.z;
    float _200 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _202 = _192 >= 0.0;
    bool _204 = isnan(_192);
    bool _206 = _202 || _204;
    bool _208 = isnan(0.0);
    bool _210 = _206 || _208;
    float _212 = _176;
    float _214 = _200;
    float _216 = _178;
    if (!_166)
    {
        float _218 = _200 * _200;
        float _220 = _218 * 0.5;
        _212 = _220;
    }
    float _222 = _212;
    bool _224 = _192 > 0.0;
    int _226 = _210 ? 0 : 1;
    float _228 = _222;
    if (!_166)
    {
        float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _230;
    }
    float _232 = _228;
    bool _234 = !_166;
    float _236 = _232;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _200 * _240;
        float _250 = 1.0 / _244;
        float _252 = _246 * 0.693147182464599609375;
        float _254 = exp2(_248);
        float _256 = 1.0 / _252;
        float _258 = _254 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _256, _200);
        float _264 = _262 * _250;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_166;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _200 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _214 = _290;
    }
    float _292 = _214;
    int _294 = ~_226;
    int _296 = _294 + 1;
    int _298 = _296 + 1;
    float _300 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _302 = _298;
    if (!_224)
    {
        int _304 = ~_226;
        int _306 = _304 + 1;
        _302 = _306;
    }
    int _308 = _302;
    float _310 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _312 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _314 = fma(_292, _180, _300);
    float _316 = float(_308);
    float _318 = fma(_292, _182, _310);
    float _320 = fma(_292, _184, _312);
    float _322 = fma(_314, _148, _186);
    float _324 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = _316 * _198;
    float _328 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = _316 * _196;
    float _332 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _326);
    float _336 = fma(_318, _148, _188);
    float _338 = _316 * _194;
    float _340 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = _332 * _334;
    float _344 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _330);
    float _348 = fma(_320, _148, _190);
    float _350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _338);
    float _352 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _354 = _344 * _346;
    float _356 = _336 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _358 = _336 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _360 = _352 * _350;
    float _362 = _354 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _364 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].x, _356);
    float _366 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].x, _358);
    float _368 = _354 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[10].x, _362);
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _364);
    float _374 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _366);
    float _376 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[8].x, _368);
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _380 = _378 != 0;
    float _382 = _372 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _384 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[10].z, _370);
    float _386 = _374 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _388 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[8].z, _376);
    float _390 = in.m_53.y;
    float _392 = _382 + _384;
    float _394 = _354 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _396 = _386 + _388;
    float _398 = in.m_53.z;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _402 = _392 + _400;
    float _404 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[9].x, _394);
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _408 = _396 + _406;
    float _410 = 0.0;
    float _412 = _394;
    float _414 = _396;
    float _416 = _392;
    float _418 = _408;
    if (_380)
    {
        float _420 = in.m_53.x;
        _410 = _420;
    }
    float _422 = _410;
    float _424 = _402 * _402;
    float _426 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[9].z, _404);
    int _428 = 0;
    if (_380)
    {
        _428 = 0;
    }
    int _430 = _428;
    float _432 = fma(_408, _408, _424);
    float _434 = _336 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _436 = 0;
    int _438 = _430;
    if (_380)
    {
        _436 = 0;
    }
    int _440 = _436;
    float _442 = sqrt(_432);
    float _444 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].x, _434);
    float _446 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _448 = 0.0;
    int _450 = _440;
    float _452 = _390;
    if (_380)
    {
        _448 = _390;
    }
    float _454 = _448;
    float _456 = _446 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _458 = 0;
    float _460 = _456;
    float _462 = _454;
    float _464 = _398;
    if (_380)
    {
        _458 = as_type<int>(_398);
    }
    int _466 = _458;
    float _468 = _456 + _426;
    float _470 = 0.0;
    float _472 = _422;
    int _474 = _466;
    if (_380)
    {
        _470 = _422;
    }
    float _476 = _470;
    bool _478 = _442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _480 = _476;
    if (!_380)
    {
        float _482 = in.m_53.x;
        float _484 = _390 * 3.1415927410125732421875;
        float _486 = _484 * 0.15915493667125701904296875;
        float _488 = _398 * 3.1415927410125732421875;
        float _490 = _488 * 0.15915493667125701904296875;
        float _492 = _486 * 6.283185482025146484375;
        float _494 = sin(_492);
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _482 * 3.1415927410125732421875;
        float _502 = _500 * 0.15915493667125701904296875;
        float _504 = _502 * 6.283185482025146484375;
        float _506 = sin(_504);
        _460 = _502;
        _438 = 1;
        _450 = 2;
        _472 = _482;
        _480 = _506;
        _462 = _494;
        _474 = as_type<int>(_498);
    }
    float _508 = _460;
    int _510 = _438;
    int _512 = _450;
    float _514 = _472;
    float _516 = _480;
    float _518 = _462;
    int _520 = _474;
    float _522 = _508;
    if (!_478)
    {
        _412 = _396;
    }
    float _524 = _412;
    float _526 = _524;
    if (!_478)
    {
        _522 = _392;
    }
    float _528 = _522;
    float _530 = _528;
    if (!_478)
    {
        _414 = _468;
    }
    float _532 = _414;
    bool _534 = !_478;
    float _536 = _532;
    if (!_534)
    {
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _540 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _542 = _442 + _540;
        float _544 = _468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _546 = rsqrt(_432);
        float _548 = _542 * _538;
        float _550 = _548 * 0.15915493667125701904296875;
        float _552 = _550 * 6.283185482025146484375;
        float _554 = cos(_552);
        float _556 = _550 * 6.283185482025146484375;
        float _558 = sin(_556);
        float _560 = _554 + (-1.0);
        float _562 = fma(_558, _544, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _564 = _560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = _546 * _562;
        float _568 = fma(_468, _554, _564);
        float _570 = fma(_408, _566, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _572 = fma(_402, _566, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _536 = _568;
        _526 = _570;
        _530 = _572;
    }
    float _574 = _536;
    float _576 = _526;
    float _578 = _530;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _582 = _574 + _580;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _576 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _590 = _578 + _588;
    float _592 = _582 * _582;
    float _594 = fma(_586, _586, _592);
    float _596 = fma(_590, _590, _594);
    float _598 = rsqrt(_596);
    float _600 = _598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _602 = _586 * _600;
    float _604 = _590 * _600;
    float _606 = _602 * _602;
    float _608 = _604 * _604;
    float _610 = _606 + _608;
    float _612 = sqrt(_610);
    bool _614 = _612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _618 = _612 + _616;
    float _620 = _598;
    float _622 = _610;
    float _624 = _618;
    float _626 = _582;
    if (_614)
    {
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _628;
    }
    float _630 = _620;
    if (_614)
    {
        float _632 = rsqrt(_610);
        _622 = _632;
    }
    float _634 = _622;
    float _636 = _634;
    if (_614)
    {
        float _638 = _618 * _630;
        _624 = _638;
    }
    float _640 = _624;
    if (_614)
    {
        float _642 = _640 * 0.15915493667125701904296875;
        _416 = _642;
    }
    float _644 = _416;
    float _646 = _590;
    if (_614)
    {
        float _648 = _644 * 6.283185482025146484375;
        float _650 = sin(_648);
        _646 = _650;
    }
    float _652 = _646;
    float _654 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _656 = precise::max(0.0, _654);
    float _658 = _630;
    float _660 = _656;
    if (_614)
    {
        float _662 = _644 * 6.283185482025146484375;
        float _664 = cos(_662);
        _658 = _664;
    }
    float _666 = _658;
    float _668 = -_600;
    float _670 = -_656;
    float _672 = fma(_582, _668, _670);
    if (_614)
    {
        float _674 = _672 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _626 = _674;
    }
    float _676 = _626;
    float _678 = sqrt(_596);
    float _680 = _676;
    float _682 = _652;
    if (_614)
    {
        float _684 = fma(_652, _676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _680 = _684;
    }
    float _686 = _680;
    float _688 = _686;
    if (!_614)
    {
        _682 = _602;
    }
    float _690 = _682;
    float _692 = _690;
    float _694 = _666;
    if (_614)
    {
        float _696 = _666 + (-1.0);
        _660 = _696;
    }
    float _698 = _660;
    float _700 = _698;
    if (_614)
    {
        float _702 = _634 * _686;
        _216 = _702;
    }
    float _704 = _216;
    if (!_614)
    {
        _688 = _672;
    }
    float _706 = _688;
    float _708 = _706;
    if (_614)
    {
        float _710 = _698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _418 = _710;
    }
    float _712 = _418;
    if (_614)
    {
        float _714 = _602 * _704;
        _692 = _714;
    }
    float _716 = _692;
    if (!_614)
    {
        _700 = _604;
    }
    float _718 = _700;
    float _720 = _718;
    if (_614)
    {
        float _722 = _604 * _704;
        _720 = _722;
    }
    float _724 = _720;
    if (!_614)
    {
        _636 = _606;
    }
    float _726 = _636;
    float _728 = _726;
    if (_614)
    {
        float _730 = fma(_672, _666, _712);
        _708 = _730;
    }
    float _732 = _708;
    if (_614)
    {
        float _734 = _716 * _716;
        _728 = _734;
    }
    float _736 = _728;
    if (!_614)
    {
        _694 = _608;
    }
    float _738 = _694;
    float _740 = _738;
    if (_614)
    {
        float _742 = _724 * _724;
        _740 = _742;
    }
    float _744 = _740;
    float _746 = fma(_732, _732, _736);
    float _748 = _746 + _744;
    float _750 = _574 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _754 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[23].w, _752);
    float _756 = precise::clamp(_754, 0.0, 1.0);
    float _758 = _574 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _762 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _750);
    float _764 = rsqrt(_748);
    float _766 = -_756;
    float _768 = _766 + 1.0;
    float _770 = _574 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _772 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _762);
    float _774 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _758);
    float _776 = _574 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _778 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _770);
    float _780 = _772 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _782 = abs(_768);
    float _784 = log2(_782);
    float _786 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _774);
    float _788 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _778);
    float _790 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _776);
    float _792 = _780 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _794 = _786 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _796 = _788 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _798 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _790);
    float _800 = _764 * _716;
    float _802 = _794 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _804 = _764 * _732;
    float _806 = _764 * _724;
    float _808 = _800 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _810 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[7].x, _802);
    float _812 = _798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _814 = -_792;
    float _816 = fma(_814, _760, 1.0);
    float _818 = _784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _820 = -_808;
    float _822 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _820);
    float _824 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[7].z, _810);
    float _826 = _794 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _828 = -_806;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[21].z, _822);
    float _832 = exp2(_818);
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[7].w, _824);
    float _836 = _794 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _838 = fma(_830, -0.5, 0.5);
    float _840 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[4].x, _826);
    float _842 = fma(_830, 0.5, 0.5);
    float _844 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[5].x, _836);
    float _846 = _804 + 1.0;
    float _848 = log2(_816);
    float _850 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[4].z, _840);
    float _852 = fma(_842, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _854 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[5].z, _844);
    float _856 = fma(_842, _852, -0.212114393711090087890625);
    float _858 = 1.0 / _834;
    float _860 = -_804;
    float _862 = fma(_832, _846, _860);
    float _864 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[4].w, _850);
    float _866 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[5].w, _854);
    float _868 = fma(_842, _856, 1.570728778839111328125);
    float _870 = fma(_862, 0.5, 0.5);
    float _872 = sqrt(_838);
    float _874 = _848 * 0.693147182464599609375;
    float _876 = _874 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _878 = _864 * _858;
    float _880 = _866 * _858;
    float _882 = fma(_878, 0.5, 0.5);
    float _884 = fma(_880, -0.5, 0.5);
    float _886 = _872 * 0.636619746685028076171875;
    float3 _2757 = float3(_882, _884, _876);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2757, float3(0.0), isnan(_2757)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2757, float3(0.0), isnan(_2757)), level(0.0)).x;
    float3 _2768 = float3(_882, _884, _876);
    float4 _891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2768, float3(0.0), isnan(_2768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2768, float3(0.0), isnan(_2768)), level(0.0)).xyzw;
    float _893 = _891.x;
    float _895 = _891.y;
    float _897 = _891.z;
    float _899 = _891.w;
    float _901 = -_868;
    float _903 = fma(_886, _901, 1.0);
    float2 _2790 = float2(_903, _870);
    float3 _907 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2790, float2(0.0), isnan(_2790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2790, float2(0.0), isnan(_2790)), level(0.0)).xyz;
    float _909 = _907.x;
    float _911 = _907.y;
    float _913 = _907.z;
    float _915 = in.m_55.y;
    float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _919 = _398 > 0.5;
    float _921 = in.m_55.x;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _925 = _923 != 0;
    float _927 = _784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _931 = _929 != 0;
    float _933 = _794 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _935 = _390 > 0.5;
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _941 = _939 != 0;
    float _943 = in.m_53.w;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _947 = _945 != 0;
    float _949 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[6].x, _933);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _953 = _951 != 0;
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _957 = _917 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _959 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[6].z, _949);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _963 = -_915;
    float _965 = _963 + 1.0;
    float _967 = _344 * _915;
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _971 = _937 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _973 = as_type<int>(_868);
    float _975 = _882;
    int _977 = as_type<int>(_870);
    float _979 = _921;
    float _981 = _967;
    if (_925)
    {
        float _983 = -_921;
        float _985 = _983 + 1.0;
        _973 = as_type<int>(_985);
    }
    int _987 = _973;
    int _989 = _919 ? as_type<int>(_965) : as_type<int>(_915);
    float _991 = _352 * _921;
    float _993 = _991;
    if (!_925)
    {
        _975 = _921;
    }
    float _995 = _975;
    float _997 = _995;
    if (_931)
    {
        float _999 = -_921;
        float _1001 = _999 + 1.0;
        _977 = as_type<int>(_1001);
    }
    int _1003 = _977;
    if (_925)
    {
        float _1005 = _935 ? as_type<float>(_987) : _921;
        _997 = _1005;
    }
    float _1007 = _997;
    float _1009 = -_967;
    float _1011 = _1009 + 1.0;
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1015 = _941 ? as_type<float>(_989) : _915;
    float _1017 = _955 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1019 = _947 ? as_type<float>(_989) : _915;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1023 = _953 ? as_type<float>(_989) : _915;
    float _1025 = fma(_1017, _1007, -0.5);
    float _1027 = in.m_57.w;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1031 = _1029 != 0;
    float _1033 = fma(_1019, _957, -0.5);
    float _1035 = 0.0;
    if (!_931)
    {
        _1035 = _921;
    }
    float _1037 = _1035;
    float _1039 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1021);
    float _1041 = _1037;
    if (_931)
    {
        float _1043 = _935 ? as_type<float>(_1003) : _921;
        _1041 = _1043;
    }
    float _1045 = _1041;
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1051 = _1049 != 0;
    float _1053 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1039);
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1065 = _1063 != 0;
    float _1067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1069 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1071 = _935 ? as_type<int>(_1011) : as_type<int>(_967);
    float _1073 = fma(_1069, -2.0, _961);
    float _1075 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _1077 = as_type<int>(_1013);
    if (_1031)
    {
        float _1079 = -_921;
        float _1081 = _1079 + 1.0;
        _1077 = as_type<int>(_1081);
    }
    int _1083 = _1077;
    bool _1085 = !_1057;
    float _1087 = _1085 ? _967 : as_type<float>(_1071);
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1091 = fma(_1023, _1075, -0.5);
    bool _1093 = _943 > 0.5;
    float _1095 = in.m_57.z;
    if (_1031)
    {
        float _1097 = _935 ? as_type<float>(_1083) : _921;
        _979 = _1097;
    }
    float _1099 = _979;
    float _1101 = fma(_971, _1087, -0.5);
    float _1103 = _969 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1105 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    if (_1065)
    {
        float _1107 = _1093 ? _1011 : _967;
        _981 = _1107;
    }
    float _1109 = _981;
    float _1111 = _192 * _1027;
    float _1113 = fma(_1105, _1099, -0.5);
    float _1115 = fma(_1103, _1045, -0.5);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1127 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1073);
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1135 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1145 = _510 != 1;
    float _1147 = -_1127;
    float _1149 = fma(_1053, _1101, _1147);
    out.m_59.x = _1131;
    out.m_59.y = _1135;
    out.m_59.z = _1137;
    out.m_59.w = _1129;
    float _1151 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1153 = _512 != 2;
    out.m_61.x = _1139;
    out.m_61.y = _1141;
    out.m_61.z = _1143;
    out.m_61.w = _1133;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1157 = _514 > 0.5;
    float _1159 = fma(_1015, _1151, -0.5);
    out.m_63.z = _1095;
    out.m_63.w = _1111;
    float _1161 = in.m_57.x;
    float _1163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1167 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1171 = _516 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1173 = -_1165;
    float _1175 = fma(_1167, 2.0, _1173);
    float _1177 = -_1169;
    float _1179 = fma(_1171, 2.0, _1177);
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1183 = _518 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1185 = -_991;
    float _1187 = _1185 + 1.0;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1193 = fma(_1183, -2.0, _1181);
    float _1195 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1197 = _1157 ? as_type<int>(_1187) : as_type<int>(_991);
    float _1199 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1191);
    float _1201 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1189);
    float _1203 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1193);
    bool _1205 = !_1051;
    float _1207 = _1205 ? _991 : as_type<float>(_1197);
    float _1209 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1199);
    float _1211 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1201);
    if (_1061)
    {
        float _1213 = _919 ? _1187 : _991;
        _993 = _1213;
    }
    float _1215 = _993;
    float _1217 = -_130;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1179);
    float _1221 = fma(_1195, _1207, -0.5);
    float _1223 = -_1203;
    float _1225 = fma(_1209, _1159, _1223);
    float _1227 = fma(_1211, _1025, _1219);
    bool _1229 = !_1145;
    float _1231 = _1229 ? _518 : _516;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    bool _1235 = !_1145;
    float _1237 = _1235 ? as_type<float>(_520) : _518;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1243 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1245 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1233);
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    out.m_63.x = _1161;
    float _1249 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1239);
    float _1251 = -_130;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1175);
    float _1255 = _1233;
    float _1257 = _1249;
    float _1259 = _1221;
    if (!_1145)
    {
        _1255 = _390;
    }
    float _1261 = _1255;
    float _1263 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1249);
    float _1265 = _1261;
    if (_1153)
    {
        _1257 = _514;
    }
    float _1267 = _1257;
    float _1269 = _1227 + 0.5;
    float _1271 = -_1247;
    float _1273 = fma(_1243, 2.0, _1271);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1279 = -_130;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1273);
    float _1283 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1275);
    float _1285 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _1287 = fma(_1263, _1221, _1253);
    float _1289 = _1267;
    if (!_1153)
    {
        _1289 = _398;
    }
    float _1291 = _1289;
    float _1293 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1295 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1245);
    float _1297 = fma(_1285, -2.0, _1277);
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1301 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1303 = fma(_1295, _1113, _1281);
    float _1305 = fma(_1293, _1215, -0.5);
    float _1307 = -_1299;
    float _1309 = fma(_1301, 2.0, _1307);
    float _1311 = _1293;
    if (!_1145)
    {
        _1311 = _398;
    }
    float _1313 = _1311;
    float _1315 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1297);
    float _1317 = _1313;
    if (!_1145)
    {
        _1259 = _1261;
    }
    float _1319 = _1259;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1323 = _1319;
    if (_1145)
    {
        _1317 = _390;
    }
    float _1325 = _1317;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1145)
    {
        _1265 = _514;
    }
    float _1329 = _1265;
    float _1331 = _1225 + 0.5;
    float _1333 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1321);
    float _1335 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1327);
    if (_1145)
    {
        _464 = _390;
    }
    float _1337 = _464;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1341 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[97].w, _1283);
    if (_1145)
    {
        _1323 = _514;
    }
    float _1343 = _1323;
    out.m_65.x = _1269;
    out.m_65.y = _1331;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1347 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1339);
    float _1349 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1351 = -_1315;
    float _1353 = fma(_1341, _1091, _1351);
    float _1355 = exp2(_927);
    float _1357 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1359 = -_1345;
    float _1361 = fma(_1349, 2.0, _1359);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1365 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1153)
    {
        _452 = _514;
    }
    float _1369 = _452;
    float _1371 = fma(_1357, _1109, -0.5);
    float _1373 = fma(_1365, -2.0, _1363);
    float _1375 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1367);
    float _1377 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1333);
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1381 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1373);
    float _1383 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1335);
    float _1385 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1387 = -_130;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1361);
    float _1391 = -_1381;
    float _1393 = fma(_1377, _1371, _1391);
    float _1395 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1375);
    float _1397 = fma(_1385, -2.0, _1379);
    float _1399 = fma(_1383, _1305, _1389);
    float _1401 = -_130;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1309);
    float _1405 = _864 + _834;
    float _1407 = in.m_57.y;
    float _1409 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1347);
    float _1411 = _1287 + 0.5;
    float _1413 = _1149 + 0.5;
    float _1415 = _1399 + 0.5;
    float _1417 = _1393 + 0.5;
    float _1419 = fma(_1395, _1115, _1403);
    float _1421 = _1405 * 0.5;
    float _1423 = -_1355;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1397);
    out.m_67.x = _1411;
    out.m_67.y = _1413;
    out.m_67.z = _1415;
    out.m_67.w = _1417;
    float _1429 = _834 * 0.5;
    float _1431 = _1303 + 0.5;
    float _1433 = -_1427;
    float _1435 = fma(_1409, _1033, _1433);
    float _1437 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[6].w, _959);
    float _1439 = fma(_866, -0.5, _1429);
    float _1441 = _1353 + 0.5;
    float _1443 = _1419 + 0.5;
    float _1445 = _1437 + _834;
    float _1447 = _1435 + 0.5;
    out.m_69.x = _1431;
    out.m_69.y = _1441;
    float _1449 = _1445 * 0.5;
    float _1451 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_63.y = _1407;
    float _1453 = -_1451;
    float _1455 = _1453 + 1.0;
    float _1457 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _1443;
    out.m_71.y = _1447;
    out.gl_Position.x = _864;
    out.gl_Position.y = _866;
    out.gl_Position.z = _1437;
    out.gl_Position.w = _834;
    out.m_73.x = _1421;
    out.m_73.y = _1439;
    out.m_73.z = _1449;
    out.m_73.w = _834;
    out.m_45.x = _1457;
    float _1459 = _1451 * _888;
    float _1461 = _899 * _1455;
    float _1463 = _899 * _1459;
    float _1465 = _913 * _1459;
    float _1467 = fma(_909, _1463, _893);
    float _1469 = fma(_911, _1463, _895);
    float _1471 = fma(_899, _1465, _897);
    out.m_75.x = _1467;
    out.m_75.y = _1469;
    out.m_75.z = _1471;
    out.m_75.w = _1461;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    float _106 = _104;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1529 = as_type<float>(_112);
        out.gl_Position.z = _1529;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_94);
        _106 = _132;
    }
    float _134 = _106;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _114 = as_type<int>(_144);
    }
    int _146 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1597 = as_type<float>(_146);
        out.gl_Position.z = _1597;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.w;
    float _150 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _152 = _150 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _154 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c8)._m0[29].y);
    float _156 = in.m_49.x;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = precise::min(_154, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _170 = 1.0 / _152;
    float _172 = in.m_49.y;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _176 = _168 + _174;
    float _178 = in.m_49.z;
    float _180 = in.m_47.x;
    float _182 = in.m_47.y;
    float _184 = in.m_47.z;
    float _186 = in.m_42.x;
    float _188 = in.m_42.y;
    float _190 = in.m_42.z;
    float _192 = _176 * _170;
    float _194 = in.m_51.x;
    float _196 = in.m_51.y;
    float _198 = in.m_51.z;
    float _200 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _202 = _192 >= 0.0;
    bool _204 = isnan(_192);
    bool _206 = _202 || _204;
    bool _208 = isnan(0.0);
    bool _210 = _206 || _208;
    float _212 = _176;
    float _214 = _200;
    float _216 = _178;
    if (!_166)
    {
        float _218 = _200 * _200;
        float _220 = _218 * 0.5;
        _212 = _220;
    }
    float _222 = _212;
    bool _224 = _192 > 0.0;
    int _226 = _210 ? 0 : 1;
    float _228 = _222;
    if (!_166)
    {
        float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _230;
    }
    float _232 = _228;
    bool _234 = !_166;
    float _236 = _232;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _200 * _240;
        float _250 = 1.0 / _244;
        float _252 = _246 * 0.693147182464599609375;
        float _254 = exp2(_248);
        float _256 = 1.0 / _252;
        float _258 = _254 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _256, _200);
        float _264 = _262 * _250;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_166;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _200 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _214 = _290;
    }
    float _292 = _214;
    int _294 = ~_226;
    int _296 = _294 + 1;
    int _298 = _296 + 1;
    float _300 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _302 = _298;
    if (!_224)
    {
        int _304 = ~_226;
        int _306 = _304 + 1;
        _302 = _306;
    }
    int _308 = _302;
    float _310 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _312 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _314 = fma(_292, _180, _300);
    float _316 = float(_308);
    float _318 = fma(_292, _182, _310);
    float _320 = fma(_292, _184, _312);
    float _322 = fma(_314, _148, _186);
    float _324 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = _316 * _198;
    float _328 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = _316 * _196;
    float _332 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _326);
    float _336 = fma(_318, _148, _188);
    float _338 = _316 * _194;
    float _340 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = _332 * _334;
    float _344 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _330);
    float _348 = fma(_320, _148, _190);
    float _350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _338);
    float _352 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _354 = _344 * _346;
    float _356 = _336 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _358 = _336 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _360 = _352 * _350;
    float _362 = _354 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _364 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].x, _356);
    float _366 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].x, _358);
    float _368 = _354 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[10].x, _362);
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _364);
    float _374 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _366);
    float _376 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[8].x, _368);
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _380 = _378 != 0;
    float _382 = _372 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _384 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[10].z, _370);
    float _386 = _374 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _388 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[8].z, _376);
    float _390 = in.m_53.y;
    float _392 = _382 + _384;
    float _394 = _354 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _396 = _386 + _388;
    float _398 = in.m_53.z;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _402 = _392 + _400;
    float _404 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[9].x, _394);
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _408 = _396 + _406;
    float _410 = 0.0;
    float _412 = _394;
    float _414 = _396;
    float _416 = _392;
    float _418 = _408;
    if (_380)
    {
        float _420 = in.m_53.x;
        _410 = _420;
    }
    float _422 = _410;
    float _424 = _402 * _402;
    float _426 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[9].z, _404);
    int _428 = 0;
    if (_380)
    {
        _428 = 0;
    }
    int _430 = _428;
    float _432 = fma(_408, _408, _424);
    float _434 = _336 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _436 = 0;
    int _438 = _430;
    if (_380)
    {
        _436 = 0;
    }
    int _440 = _436;
    float _442 = sqrt(_432);
    float _444 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].x, _434);
    float _446 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _448 = 0.0;
    int _450 = _440;
    float _452 = _390;
    if (_380)
    {
        _448 = _390;
    }
    float _454 = _448;
    float _456 = _446 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _458 = 0;
    float _460 = _456;
    float _462 = _454;
    float _464 = _398;
    if (_380)
    {
        _458 = as_type<int>(_398);
    }
    int _466 = _458;
    float _468 = _456 + _426;
    float _470 = 0.0;
    float _472 = _422;
    int _474 = _466;
    if (_380)
    {
        _470 = _422;
    }
    float _476 = _470;
    bool _478 = _442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _480 = _476;
    if (!_380)
    {
        float _482 = in.m_53.x;
        float _484 = _390 * 3.1415927410125732421875;
        float _486 = _484 * 0.15915493667125701904296875;
        float _488 = _398 * 3.1415927410125732421875;
        float _490 = _488 * 0.15915493667125701904296875;
        float _492 = _486 * 6.283185482025146484375;
        float _494 = sin(_492);
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _482 * 3.1415927410125732421875;
        float _502 = _500 * 0.15915493667125701904296875;
        float _504 = _502 * 6.283185482025146484375;
        float _506 = sin(_504);
        _460 = _502;
        _438 = 1;
        _450 = 2;
        _472 = _482;
        _480 = _506;
        _462 = _494;
        _474 = as_type<int>(_498);
    }
    float _508 = _460;
    int _510 = _438;
    int _512 = _450;
    float _514 = _472;
    float _516 = _480;
    float _518 = _462;
    int _520 = _474;
    float _522 = _508;
    if (!_478)
    {
        _412 = _396;
    }
    float _524 = _412;
    float _526 = _524;
    if (!_478)
    {
        _522 = _392;
    }
    float _528 = _522;
    float _530 = _528;
    if (!_478)
    {
        _414 = _468;
    }
    float _532 = _414;
    bool _534 = !_478;
    float _536 = _532;
    if (!_534)
    {
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _540 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _542 = _442 + _540;
        float _544 = _468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _546 = rsqrt(_432);
        float _548 = _542 * _538;
        float _550 = _548 * 0.15915493667125701904296875;
        float _552 = _550 * 6.283185482025146484375;
        float _554 = cos(_552);
        float _556 = _550 * 6.283185482025146484375;
        float _558 = sin(_556);
        float _560 = _554 + (-1.0);
        float _562 = fma(_558, _544, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _564 = _560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = _546 * _562;
        float _568 = fma(_468, _554, _564);
        float _570 = fma(_408, _566, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _572 = fma(_402, _566, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _536 = _568;
        _526 = _570;
        _530 = _572;
    }
    float _574 = _536;
    float _576 = _526;
    float _578 = _530;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _582 = _574 + _580;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _576 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _590 = _578 + _588;
    float _592 = _582 * _582;
    float _594 = fma(_586, _586, _592);
    float _596 = fma(_590, _590, _594);
    float _598 = rsqrt(_596);
    float _600 = _598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _602 = _586 * _600;
    float _604 = _590 * _600;
    float _606 = _602 * _602;
    float _608 = _604 * _604;
    float _610 = _606 + _608;
    float _612 = sqrt(_610);
    bool _614 = _612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _618 = _612 + _616;
    float _620 = _598;
    float _622 = _610;
    float _624 = _618;
    float _626 = _582;
    if (_614)
    {
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _628;
    }
    float _630 = _620;
    if (_614)
    {
        float _632 = rsqrt(_610);
        _622 = _632;
    }
    float _634 = _622;
    float _636 = _634;
    if (_614)
    {
        float _638 = _618 * _630;
        _624 = _638;
    }
    float _640 = _624;
    if (_614)
    {
        float _642 = _640 * 0.15915493667125701904296875;
        _416 = _642;
    }
    float _644 = _416;
    float _646 = _590;
    if (_614)
    {
        float _648 = _644 * 6.283185482025146484375;
        float _650 = sin(_648);
        _646 = _650;
    }
    float _652 = _646;
    float _654 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _656 = precise::max(0.0, _654);
    float _658 = _630;
    float _660 = _656;
    if (_614)
    {
        float _662 = _644 * 6.283185482025146484375;
        float _664 = cos(_662);
        _658 = _664;
    }
    float _666 = _658;
    float _668 = -_600;
    float _670 = -_656;
    float _672 = fma(_582, _668, _670);
    if (_614)
    {
        float _674 = _672 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _626 = _674;
    }
    float _676 = _626;
    float _678 = sqrt(_596);
    float _680 = _676;
    float _682 = _652;
    if (_614)
    {
        float _684 = fma(_652, _676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _680 = _684;
    }
    float _686 = _680;
    float _688 = _686;
    if (!_614)
    {
        _682 = _602;
    }
    float _690 = _682;
    float _692 = _690;
    float _694 = _666;
    if (_614)
    {
        float _696 = _666 + (-1.0);
        _660 = _696;
    }
    float _698 = _660;
    float _700 = _698;
    if (_614)
    {
        float _702 = _634 * _686;
        _216 = _702;
    }
    float _704 = _216;
    if (!_614)
    {
        _688 = _672;
    }
    float _706 = _688;
    float _708 = _706;
    if (_614)
    {
        float _710 = _698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _418 = _710;
    }
    float _712 = _418;
    if (_614)
    {
        float _714 = _602 * _704;
        _692 = _714;
    }
    float _716 = _692;
    if (!_614)
    {
        _700 = _604;
    }
    float _718 = _700;
    float _720 = _718;
    if (_614)
    {
        float _722 = _604 * _704;
        _720 = _722;
    }
    float _724 = _720;
    if (!_614)
    {
        _636 = _606;
    }
    float _726 = _636;
    float _728 = _726;
    if (_614)
    {
        float _730 = fma(_672, _666, _712);
        _708 = _730;
    }
    float _732 = _708;
    if (_614)
    {
        float _734 = _716 * _716;
        _728 = _734;
    }
    float _736 = _728;
    if (!_614)
    {
        _694 = _608;
    }
    float _738 = _694;
    float _740 = _738;
    if (_614)
    {
        float _742 = _724 * _724;
        _740 = _742;
    }
    float _744 = _740;
    float _746 = fma(_732, _732, _736);
    float _748 = _746 + _744;
    float _750 = _574 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _754 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[23].w, _752);
    float _756 = precise::clamp(_754, 0.0, 1.0);
    float _758 = _574 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _762 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _750);
    float _764 = rsqrt(_748);
    float _766 = -_756;
    float _768 = _766 + 1.0;
    float _770 = _574 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _772 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _762);
    float _774 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _758);
    float _776 = _574 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _778 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _770);
    float _780 = _772 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _782 = abs(_768);
    float _784 = log2(_782);
    float _786 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _774);
    float _788 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _778);
    float _790 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _776);
    float _792 = _780 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _794 = _786 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _796 = _788 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _798 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _790);
    float _800 = _764 * _716;
    float _802 = _794 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _804 = _764 * _732;
    float _806 = _764 * _724;
    float _808 = _800 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _810 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[7].x, _802);
    float _812 = _798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _814 = -_792;
    float _816 = fma(_814, _760, 1.0);
    float _818 = _784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _820 = -_808;
    float _822 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _820);
    float _824 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[7].z, _810);
    float _826 = _794 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _828 = -_806;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[21].z, _822);
    float _832 = exp2(_818);
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[7].w, _824);
    float _836 = _794 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _838 = fma(_830, -0.5, 0.5);
    float _840 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[4].x, _826);
    float _842 = fma(_830, 0.5, 0.5);
    float _844 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[5].x, _836);
    float _846 = _804 + 1.0;
    float _848 = log2(_816);
    float _850 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[4].z, _840);
    float _852 = fma(_842, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _854 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[5].z, _844);
    float _856 = fma(_842, _852, -0.212114393711090087890625);
    float _858 = 1.0 / _834;
    float _860 = -_804;
    float _862 = fma(_832, _846, _860);
    float _864 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[4].w, _850);
    float _866 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[5].w, _854);
    float _868 = fma(_842, _856, 1.570728778839111328125);
    float _870 = fma(_862, 0.5, 0.5);
    float _872 = sqrt(_838);
    float _874 = _848 * 0.693147182464599609375;
    float _876 = _874 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _878 = _864 * _858;
    float _880 = _866 * _858;
    float _882 = fma(_878, 0.5, 0.5);
    float _884 = fma(_880, -0.5, 0.5);
    float _886 = _872 * 0.636619746685028076171875;
    float3 _2757 = float3(_882, _884, _876);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2757, float3(0.0), isnan(_2757)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2757, float3(0.0), isnan(_2757)), level(0.0)).x;
    float3 _2768 = float3(_882, _884, _876);
    float4 _891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2768, float3(0.0), isnan(_2768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2768, float3(0.0), isnan(_2768)), level(0.0)).xyzw;
    float _893 = _891.x;
    float _895 = _891.y;
    float _897 = _891.z;
    float _899 = _891.w;
    float _901 = -_868;
    float _903 = fma(_886, _901, 1.0);
    float2 _2790 = float2(_903, _870);
    float3 _907 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2790, float2(0.0), isnan(_2790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2790, float2(0.0), isnan(_2790)), level(0.0)).xyz;
    float _909 = _907.x;
    float _911 = _907.y;
    float _913 = _907.z;
    float _915 = in.m_55.y;
    float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _919 = _398 > 0.5;
    float _921 = in.m_55.x;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _925 = _923 != 0;
    float _927 = _784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _931 = _929 != 0;
    float _933 = _794 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _935 = _390 > 0.5;
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _941 = _939 != 0;
    float _943 = in.m_53.w;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _947 = _945 != 0;
    float _949 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[6].x, _933);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _953 = _951 != 0;
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _957 = _917 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _959 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[6].z, _949);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _963 = -_915;
    float _965 = _963 + 1.0;
    float _967 = _344 * _915;
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _971 = _937 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _973 = as_type<int>(_868);
    float _975 = _882;
    int _977 = as_type<int>(_870);
    float _979 = _921;
    float _981 = _967;
    if (_925)
    {
        float _983 = -_921;
        float _985 = _983 + 1.0;
        _973 = as_type<int>(_985);
    }
    int _987 = _973;
    int _989 = _919 ? as_type<int>(_965) : as_type<int>(_915);
    float _991 = _352 * _921;
    float _993 = _991;
    if (!_925)
    {
        _975 = _921;
    }
    float _995 = _975;
    float _997 = _995;
    if (_931)
    {
        float _999 = -_921;
        float _1001 = _999 + 1.0;
        _977 = as_type<int>(_1001);
    }
    int _1003 = _977;
    if (_925)
    {
        float _1005 = _935 ? as_type<float>(_987) : _921;
        _997 = _1005;
    }
    float _1007 = _997;
    float _1009 = -_967;
    float _1011 = _1009 + 1.0;
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1015 = _941 ? as_type<float>(_989) : _915;
    float _1017 = _955 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1019 = _947 ? as_type<float>(_989) : _915;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1023 = _953 ? as_type<float>(_989) : _915;
    float _1025 = fma(_1017, _1007, -0.5);
    float _1027 = in.m_57.w;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1031 = _1029 != 0;
    float _1033 = fma(_1019, _957, -0.5);
    float _1035 = 0.0;
    if (!_931)
    {
        _1035 = _921;
    }
    float _1037 = _1035;
    float _1039 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1021);
    float _1041 = _1037;
    if (_931)
    {
        float _1043 = _935 ? as_type<float>(_1003) : _921;
        _1041 = _1043;
    }
    float _1045 = _1041;
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1051 = _1049 != 0;
    float _1053 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1039);
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1065 = _1063 != 0;
    float _1067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1069 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1071 = _935 ? as_type<int>(_1011) : as_type<int>(_967);
    float _1073 = fma(_1069, -2.0, _961);
    float _1075 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _1077 = as_type<int>(_1013);
    if (_1031)
    {
        float _1079 = -_921;
        float _1081 = _1079 + 1.0;
        _1077 = as_type<int>(_1081);
    }
    int _1083 = _1077;
    bool _1085 = !_1057;
    float _1087 = _1085 ? _967 : as_type<float>(_1071);
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1091 = fma(_1023, _1075, -0.5);
    bool _1093 = _943 > 0.5;
    float _1095 = in.m_57.z;
    if (_1031)
    {
        float _1097 = _935 ? as_type<float>(_1083) : _921;
        _979 = _1097;
    }
    float _1099 = _979;
    float _1101 = fma(_971, _1087, -0.5);
    float _1103 = _969 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1105 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    if (_1065)
    {
        float _1107 = _1093 ? _1011 : _967;
        _981 = _1107;
    }
    float _1109 = _981;
    float _1111 = _192 * _1027;
    float _1113 = fma(_1105, _1099, -0.5);
    float _1115 = fma(_1103, _1045, -0.5);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1127 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1073);
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1135 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1145 = _510 != 1;
    float _1147 = -_1127;
    float _1149 = fma(_1053, _1101, _1147);
    out.m_59.x = _1131;
    out.m_59.y = _1135;
    out.m_59.z = _1137;
    out.m_59.w = _1129;
    float _1151 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1153 = _512 != 2;
    out.m_61.x = _1139;
    out.m_61.y = _1141;
    out.m_61.z = _1143;
    out.m_61.w = _1133;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1157 = _514 > 0.5;
    float _1159 = fma(_1015, _1151, -0.5);
    out.m_63.z = _1095;
    out.m_63.w = _1111;
    float _1161 = in.m_57.x;
    float _1163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1167 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1171 = _516 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1173 = -_1165;
    float _1175 = fma(_1167, 2.0, _1173);
    float _1177 = -_1169;
    float _1179 = fma(_1171, 2.0, _1177);
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1183 = _518 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1185 = -_991;
    float _1187 = _1185 + 1.0;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1193 = fma(_1183, -2.0, _1181);
    float _1195 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1197 = _1157 ? as_type<int>(_1187) : as_type<int>(_991);
    float _1199 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1191);
    float _1201 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1189);
    float _1203 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1193);
    bool _1205 = !_1051;
    float _1207 = _1205 ? _991 : as_type<float>(_1197);
    float _1209 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1199);
    float _1211 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1201);
    if (_1061)
    {
        float _1213 = _919 ? _1187 : _991;
        _993 = _1213;
    }
    float _1215 = _993;
    float _1217 = -_130;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1179);
    float _1221 = fma(_1195, _1207, -0.5);
    float _1223 = -_1203;
    float _1225 = fma(_1209, _1159, _1223);
    float _1227 = fma(_1211, _1025, _1219);
    bool _1229 = !_1145;
    float _1231 = _1229 ? _518 : _516;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    bool _1235 = !_1145;
    float _1237 = _1235 ? as_type<float>(_520) : _518;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1243 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1245 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1233);
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    out.m_63.x = _1161;
    float _1249 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1239);
    float _1251 = -_130;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1175);
    float _1255 = _1233;
    float _1257 = _1249;
    float _1259 = _1221;
    if (!_1145)
    {
        _1255 = _390;
    }
    float _1261 = _1255;
    float _1263 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1249);
    float _1265 = _1261;
    if (_1153)
    {
        _1257 = _514;
    }
    float _1267 = _1257;
    float _1269 = _1227 + 0.5;
    float _1271 = -_1247;
    float _1273 = fma(_1243, 2.0, _1271);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1279 = -_130;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1273);
    float _1283 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1275);
    float _1285 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _1287 = fma(_1263, _1221, _1253);
    float _1289 = _1267;
    if (!_1153)
    {
        _1289 = _398;
    }
    float _1291 = _1289;
    float _1293 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1295 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1245);
    float _1297 = fma(_1285, -2.0, _1277);
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1301 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1303 = fma(_1295, _1113, _1281);
    float _1305 = fma(_1293, _1215, -0.5);
    float _1307 = -_1299;
    float _1309 = fma(_1301, 2.0, _1307);
    float _1311 = _1293;
    if (!_1145)
    {
        _1311 = _398;
    }
    float _1313 = _1311;
    float _1315 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1297);
    float _1317 = _1313;
    if (!_1145)
    {
        _1259 = _1261;
    }
    float _1319 = _1259;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1323 = _1319;
    if (_1145)
    {
        _1317 = _390;
    }
    float _1325 = _1317;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1145)
    {
        _1265 = _514;
    }
    float _1329 = _1265;
    float _1331 = _1225 + 0.5;
    float _1333 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1321);
    float _1335 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1327);
    if (_1145)
    {
        _464 = _390;
    }
    float _1337 = _464;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1341 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[97].w, _1283);
    if (_1145)
    {
        _1323 = _514;
    }
    float _1343 = _1323;
    out.m_65.x = _1269;
    out.m_65.y = _1331;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1347 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1339);
    float _1349 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1351 = -_1315;
    float _1353 = fma(_1341, _1091, _1351);
    float _1355 = exp2(_927);
    float _1357 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1359 = -_1345;
    float _1361 = fma(_1349, 2.0, _1359);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1365 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1153)
    {
        _452 = _514;
    }
    float _1369 = _452;
    float _1371 = fma(_1357, _1109, -0.5);
    float _1373 = fma(_1365, -2.0, _1363);
    float _1375 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1367);
    float _1377 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1333);
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1381 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1373);
    float _1383 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1335);
    float _1385 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1387 = -_130;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1361);
    float _1391 = -_1381;
    float _1393 = fma(_1377, _1371, _1391);
    float _1395 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1375);
    float _1397 = fma(_1385, -2.0, _1379);
    float _1399 = fma(_1383, _1305, _1389);
    float _1401 = -_130;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1309);
    float _1405 = _864 + _834;
    float _1407 = in.m_57.y;
    float _1409 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1347);
    float _1411 = _1287 + 0.5;
    float _1413 = _1149 + 0.5;
    float _1415 = _1399 + 0.5;
    float _1417 = _1393 + 0.5;
    float _1419 = fma(_1395, _1115, _1403);
    float _1421 = _1405 * 0.5;
    float _1423 = -_1355;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1397);
    out.m_67.x = _1411;
    out.m_67.y = _1413;
    out.m_67.z = _1415;
    out.m_67.w = _1417;
    float _1429 = _834 * 0.5;
    float _1431 = _1303 + 0.5;
    float _1433 = -_1427;
    float _1435 = fma(_1409, _1033, _1433);
    float _1437 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[6].w, _959);
    float _1439 = fma(_866, -0.5, _1429);
    float _1441 = _1353 + 0.5;
    float _1443 = _1419 + 0.5;
    float _1445 = _1437 + _834;
    float _1447 = _1435 + 0.5;
    out.m_69.x = _1431;
    out.m_69.y = _1441;
    float _1449 = _1445 * 0.5;
    float _1451 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_63.y = _1407;
    float _1453 = -_1451;
    float _1455 = _1453 + 1.0;
    float _1457 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _1443;
    out.m_71.y = _1447;
    out.gl_Position.x = _864;
    out.gl_Position.y = _866;
    out.gl_Position.z = _1437;
    out.gl_Position.w = _834;
    out.m_73.x = _1421;
    out.m_73.y = _1439;
    out.m_73.z = _1449;
    out.m_73.w = _834;
    out.m_45.x = _1457;
    float _1459 = _1451 * _888;
    float _1461 = _899 * _1455;
    float _1463 = _899 * _1459;
    float _1465 = _913 * _1459;
    float _1467 = fma(_909, _1463, _893);
    float _1469 = fma(_911, _1463, _895);
    float _1471 = fma(_899, _1465, _897);
    out.m_75.x = _1467;
    out.m_75.y = _1469;
    out.m_75.z = _1471;
    out.m_75.w = _1461;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

