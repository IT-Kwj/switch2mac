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
    float4 m_57 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    float _96 = _94;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1166 = as_type<float>(_102);
        out.gl_Position.z = _1166;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _96 = _120;
    }
    float _122 = _96;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    if (_128)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _92;
    if (_128)
    {
        out.m_45.x = 0.0;
    }
    int _132 = 0;
    if (_128)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1234 = as_type<float>(_136);
        out.gl_Position.z = _1234;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_49.x;
    float _140 = in.m_49.y;
    float _142 = in.m_49.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    float _154 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _146);
    float _156 = in.m_51.w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = sqrt(_168);
    float _178 = in.m_42.x;
    float _180 = in.m_42.y;
    float _182 = in.m_42.z;
    float _184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _186 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _188 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _190 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _192 = _176 * _138;
    float _194 = _188 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _196 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _192);
    float _198 = (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _200 = _144;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _204 = 0.5;
    if (!_166)
    {
        float _206 = _144 * _144;
        float _208 = _206 * 0.5;
        _198 = _208;
    }
    float _210 = _198;
    float _212 = _196 * 0.15915493667125701904296875;
    float _214 = _140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _216 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _218 = _210;
    if (!_166)
    {
        float _220 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _220;
    }
    float _222 = _218;
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _214);
    float _226 = _212 * 6.283185482025146484375;
    float _228 = sin(_226);
    float _230 = _216 * _184;
    float _232 = _194 * _224;
    bool _234 = !_166;
    float _236 = _222;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _144 * _242;
        float _252 = 1.0 / _246;
        float _254 = _248 * 0.693147182464599609375;
        float _256 = exp2(_250);
        float _258 = 1.0 / _254;
        float _260 = _256 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _258, _144);
        float _266 = _264 * _252;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _268;
    }
    float _270 = _236;
    bool _272 = !_166;
    if (!_272)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _144 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _200 = _292;
        _202 = _280;
    }
    float _294 = _200;
    float _296 = _202;
    float _298 = _228 + _142;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _304 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _306 = _298 * 0.125;
    float _308 = fma(_294, _172, _300);
    float _310 = fma(_294, _170, _302);
    float _312 = fma(_294, _174, _304);
    float _314 = _232 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _316 = fma(_308, _156, _180);
    float _318 = fma(_310, _156, _178);
    float _320 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _306);
    float _324 = _316 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _326 = fma(_312, _156, _182);
    float _328 = _316 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _330 = _232 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _324);
    float _334 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[8].x, _314);
    float _336 = _320 * _322;
    float _338 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _328);
    float _340 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[10].x, _330);
    float _342 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[6].z, _332);
    float _344 = _316 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _346 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[4].z, _338);
    float _348 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[10].z, _340);
    float _350 = _342 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[8].z, _334);
    float _354 = _346 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _356 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _344);
    float _358 = _350 + _348;
    bool _360 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _362 = isnan(0.5);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _368 = _364 || _366;
    float _370 = _354 + _352;
    float _372 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _376 = _358 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _380 = _370 + _378;
    float _382 = _372 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _384 = _376 * _376;
    float _386 = _382 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _388 = fma(_380, _380, _384);
    float _390 = _382 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _392 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[11].x, _386);
    float _394 = sqrt(_388);
    float _396 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[11].z, _392);
    float _398 = _396 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _400 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[10].x, _390);
    float _402 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _404 = 1.0 / _398;
    float _406 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[10].z, _400);
    float _408 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[9].x, _402);
    bool _410 = _394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _412 = _406 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _414 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[9].z, _408);
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _422 = _420 != 0;
    float _424 = _412 + _398;
    float _426 = _382 + _414;
    bool _428 = !_418;
    int _430 = _428 ? 0 : 1;
    float _432 = _424 * _404;
    float _434 = _432 * 0.5;
    float _436 = _424;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _440 = _370;
    float _442 = _382;
    float _444 = _376;
    float _446 = _296;
    if (_368)
    {
        _436 = 1.0;
    }
    float _448 = _436;
    float _450 = _448;
    if (!_410)
    {
        _238 = _370;
    }
    float _452 = _238;
    bool _454 = !_422;
    int _456 = _454 ? 0 : 1;
    float _458 = _452;
    if (!_410)
    {
        _438 = _358;
    }
    float _460 = _438;
    float _462 = _460;
    if (!_410)
    {
        _440 = _426;
    }
    float _464 = _440;
    bool _466 = !_410;
    float _468 = _464;
    if (!_466)
    {
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _474 = _394 + _472;
        float _476 = rsqrt(_388);
        float _478 = _474 * _470;
        float _480 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _482 = _478 * 0.15915493667125701904296875;
        float _484 = _482 * 6.283185482025146484375;
        float _486 = cos(_484);
        float _488 = _482 * 6.283185482025146484375;
        float _490 = sin(_488);
        float _492 = _486 + (-1.0);
        float _494 = _492 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _496 = fma(_490, _480, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _498 = fma(_426, _486, _494);
        float _500 = _476 * _496;
        float _502 = fma(_380, _500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _504 = fma(_376, _500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _468 = _498;
        _458 = _502;
        _462 = _504;
    }
    float _506 = _468;
    float _508 = _458;
    float _510 = _462;
    if (!_368)
    {
        float _512 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _514 = _512 * 0.15915493667125701904296875;
        float _516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _518 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _520 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[30].w, _518);
        float _522 = _514 * 6.283185482025146484375;
        float _524 = cos(_522);
        float _526 = _516 * 0.15915493667125701904296875;
        float _528 = _514 * 6.283185482025146484375;
        float _530 = sin(_528);
        float _532 = 1.0 / _524;
        float _534 = _526 * 6.283185482025146484375;
        float _536 = cos(_534);
        float _538 = _530 * _532;
        float _540 = _526 * 6.283185482025146484375;
        float _542 = sin(_540);
        float _544 = _536 * _538;
        float _546 = 1.0 / _520;
        float _548 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _550 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _548;
        float _552 = 1.0 / _544;
        float _554 = 1.0 / _550;
        float _556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _558 = _546 * _556;
        float _560 = _542 * _552;
        float _562 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _564 = fma(_560, _558, _562);
        float _566 = _564 * _554;
        float _568 = precise::clamp(_566, 0.0, 1.0);
        float _570 = -_568;
        float _572 = _570 + 1.0;
        _442 = _552;
        _450 = _572;
    }
    float _574 = _442;
    float _576 = _450;
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _506 + _578;
    float _582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _584 = _508 + _582;
    float _586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _588 = _510 + _586;
    float _590 = _580 * _580;
    float _592 = fma(_584, _584, _590);
    float _594 = fma(_588, _588, _592);
    float _596 = rsqrt(_594);
    float _598 = sqrt(_594);
    float _600 = _596 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _602 = _584 * _600;
    float _604 = _588 * _600;
    float _606 = _602 * _602;
    float _608 = _604 * _604;
    float _610 = _606 + _608;
    float _612 = sqrt(_610);
    bool _614 = _612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _618 = _612 + _616;
    float _620 = _596;
    float _622 = _618;
    float _624 = _580;
    float _626 = _602;
    if (_614)
    {
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _628;
    }
    float _630 = _620;
    float _632 = _630;
    if (_614)
    {
        float _634 = _618 * _630;
        _622 = _634;
    }
    float _636 = _622;
    if (_614)
    {
        float _638 = rsqrt(_610);
        _632 = _638;
    }
    float _640 = _632;
    float _642 = _640;
    if (_614)
    {
        float _644 = _636 * 0.15915493667125701904296875;
        _444 = _644;
    }
    float _646 = _444;
    float _648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _650 = _588;
    float _652 = _646;
    if (_614)
    {
        float _654 = _646 * 6.283185482025146484375;
        float _656 = sin(_654);
        _650 = _656;
    }
    float _658 = _650;
    float _660 = precise::max(0.0, _648);
    float _662 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _664 = _574;
    float _666 = _660;
    if (_614)
    {
        float _668 = _646 * 6.283185482025146484375;
        float _670 = cos(_668);
        _664 = _670;
    }
    float _672 = _664;
    float _674 = -_600;
    float _676 = -_660;
    float _678 = fma(_580, _674, _676);
    if (_614)
    {
        float _680 = _678 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _624 = _680;
    }
    float _682 = _624;
    float _684 = _658;
    float _686 = _682;
    if (_614)
    {
        float _688 = fma(_658, _682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _684 = _688;
    }
    float _690 = _684;
    float _692 = _690;
    if (!_614)
    {
        _686 = _608;
    }
    float _694 = _686;
    float _696 = _694;
    if (_614)
    {
        float _698 = _640 * _690;
        _446 = _698;
    }
    float _700 = _446;
    if (!_614)
    {
        _642 = _678;
    }
    float _702 = _642;
    float _704 = _702;
    if (_614)
    {
        float _706 = _672 + (-1.0);
        _666 = _706;
    }
    float _708 = _666;
    float _710 = _708;
    if (_614)
    {
        float _712 = _602 * _700;
        _626 = _712;
    }
    float _714 = _626;
    if (!_614)
    {
        _692 = _604;
    }
    float _716 = _692;
    float _718 = _716;
    if (_614)
    {
        float _720 = _604 * _700;
        _718 = _720;
    }
    float _722 = _718;
    if (_614)
    {
        float _724 = _708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _724;
    }
    float _726 = _652;
    if (!_614)
    {
        _710 = _606;
    }
    float _728 = _710;
    float _730 = _728;
    if (_614)
    {
        float _732 = _714 * _714;
        _730 = _732;
    }
    float _734 = _730;
    if (_614)
    {
        float _736 = _722 * _722;
        _696 = _736;
    }
    float _738 = _696;
    if (_614)
    {
        float _740 = fma(_678, _672, _726);
        _704 = _740;
    }
    float _742 = _704;
    float _744 = _506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _746 = fma(_742, _742, _734);
    float _748 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _750 = fma(_598, (*spvDescriptorSet0.vp_c15)._m0[23].w, _748);
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float _754 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _744);
    float _756 = _746 + _738;
    float _758 = _506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _760 = -_752;
    float _762 = _760 + 1.0;
    float _764 = rsqrt(_756);
    float _766 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _758);
    float _768 = _506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _770 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[2].z, _766);
    float _772 = _506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _774 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _768);
    float _776 = _770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _778 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _772);
    float _780 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[1].z, _774);
    float _782 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[3].z, _754);
    float _784 = _776 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _786 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].z, _778);
    float _788 = _780 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _790 = abs(_762);
    float _792 = log2(_790);
    float _794 = -_784;
    float _796 = fma(_794, _662, 1.0);
    float _798 = _786 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _800 = _788 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _802 = _764 * _714;
    float _804 = _764 * _742;
    float _806 = _764 * _722;
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[7].x, _800);
    float _810 = _802 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _812 = _782 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _814 = log2(_796);
    float _816 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[7].z, _808);
    float _818 = -_810;
    float _820 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _818);
    float _822 = _788 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _824 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[7].w, _816);
    float _826 = -_806;
    float _828 = fma(_826, (*spvDescriptorSet0.vp_c15)._m0[21].z, _820);
    float _830 = _792 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _832 = _788 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _834 = 1.0 / _824;
    float _836 = fma(_828, -0.5, 0.5);
    float _838 = fma(_828, 0.5, 0.5);
    float _840 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[4].x, _832);
    float _842 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[5].x, _822);
    float _844 = _804 + 1.0;
    float _846 = fma(_838, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _848 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[4].z, _840);
    float _850 = exp2(_830);
    float _852 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[5].z, _842);
    float _854 = fma(_838, _846, -0.212114393711090087890625);
    float _856 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[4].w, _848);
    float _858 = _814 * 0.693147182464599609375;
    float _860 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[5].w, _852);
    float _862 = fma(_838, _854, 1.570728778839111328125);
    float _864 = sqrt(_836);
    float _866 = _856 * _834;
    float _868 = _860 * _834;
    float _870 = _858 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _872 = fma(_866, 0.5, 0.5);
    float _874 = fma(_868, -0.5, 0.5);
    float _876 = -_804;
    float _878 = fma(_850, _844, _876);
    float _880 = fma(_878, 0.5, 0.5);
    float _882 = _864 * 0.636619746685028076171875;
    float _884 = -_862;
    float _886 = fma(_882, _884, 1.0);
    float3 _2454 = float3(_872, _874, _870);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2454, float3(0.0), isnan(_2454)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2454, float3(0.0), isnan(_2454)), level(0.0)).x;
    float3 _2465 = float3(_872, _874, _870);
    float4 _891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2465, float3(0.0), isnan(_2465)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2465, float3(0.0), isnan(_2465)), level(0.0)).xyzw;
    float _893 = _891.x;
    float _895 = _891.y;
    float _897 = _891.z;
    float _899 = _891.w;
    float2 _2482 = float2(_886, _880);
    float3 _903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2482, float2(0.0), isnan(_2482)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2482, float2(0.0), isnan(_2482)), level(0.0)).xyz;
    float _905 = _903.x;
    float _907 = _903.y;
    float _909 = _903.z;
    float _911 = in.m_53.x;
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _915 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _917 = in.m_53.y;
    int _919 = abs(_430);
    int _921 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _923 = _921 != 0;
    float _925 = in.m_55.x;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _933 = _931 != 0;
    float _935 = _915 * _913;
    int _937 = abs(_456);
    float _939 = in.m_55.y;
    float _941 = float(_937);
    float _943 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[20].x, _935);
    bool _945 = _911 > 0.5;
    bool _947 = _945 && _933;
    float _949 = _943 * 6.283185482025146484375;
    float _951 = floor(_943);
    bool _953 = _917 > 0.5;
    float _955 = _949 * 0.15915493667125701904296875;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_933)
    {
        _957 = _925;
    }
    float _959 = _957;
    float _961 = _955 * 6.283185482025146484375;
    float _963 = cos(_961);
    float _965 = _959;
    if (_947)
    {
        float _967 = -_959;
        float _969 = _967 + 1.0;
        _965 = _969;
    }
    float _971 = _965;
    float _973 = -_939;
    float _975 = _973 + 1.0;
    float _977 = -_951;
    float _979 = _943 + _977;
    bool _981 = !_923;
    int _983 = _981 ? 0 : 1;
    float _985 = -_979;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _989 = float(_919);
    int _991 = abs(_983);
    float _993 = fma(_963, 0.5, 0.5);
    float _995 = abs(_987);
    float _997 = _989 * _995;
    float _999 = float(_991);
    float _1001 = -_993;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1005 = _939;
    if (_929)
    {
        float _1007 = _953 ? _975 : _939;
        _1005 = _1007;
    }
    float _1009 = _1005;
    bool _1011 = _979 < 0.5;
    float _1013 = float(_1011);
    float _1015 = fma(_999, _1003, _997);
    float _1017 = _788 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1021 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1017);
    float _1023 = -_1013;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1033 = _792 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_933)
    {
        _204 = _925;
    }
    float _1035 = _204;
    float _1037 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1021);
    float _1039 = _1035;
    if (_933)
    {
        _1039 = _971;
    }
    float _1041 = _1039;
    float _1043 = abs(_1025);
    float _1045 = fma(_941, _1043, _1015);
    float _1047 = exp2(_1033);
    float _1049 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1037);
    float _1051 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1053 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1057 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1059 = _576 > 0.0;
    bool _1061 = isnan(_576);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan(0.0);
    bool _1067 = _1063 || _1065;
    float _1069 = _1045 * _576;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1073 = _1051 * _1029;
    float _1075 = _1049 + _824;
    float _1077 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1075 * 0.5;
    float _1081 = -_1047;
    float _1083 = _1081 + 1.0;
    out.m_57.x = _1053;
    out.m_57.y = _1057;
    out.m_57.z = _1077;
    float _1085 = _1083 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_59.z = _1079;
    out.m_59.w = _824;
    float _1087 = _1019 * _1071;
    float _1089 = -_1085;
    float _1091 = _1089 + 1.0;
    float _1093 = _1069 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _138;
    out.m_61.y = _214;
    out.gl_Position.x = _856;
    out.gl_Position.y = _860;
    out.gl_Position.z = _1049;
    out.gl_Position.w = _824;
    out.m_63.x = _1073;
    out.m_63.y = _1087;
    out.m_45.x = _1093;
    float _1095 = _1085 * _888;
    float _1097 = _899 * _1091;
    float _1099 = _899 * _1095;
    float _1101 = _909 * _1095;
    float _1103 = fma(_905, _1099, _893);
    float _1105 = fma(_907, _1099, _895);
    float _1107 = fma(_899, _1101, _897);
    out.m_65.x = _1103;
    out.m_65.y = _1105;
    out.m_65.z = _1107;
    out.m_65.w = _1097;
    if (_1067)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1109 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1109;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    float _96 = _94;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1166 = as_type<float>(_102);
        out.gl_Position.z = _1166;
    }
    if (!_88)
    {
        return out;
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _96 = _120;
    }
    float _122 = _96;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    if (_128)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _92;
    if (_128)
    {
        out.m_45.x = 0.0;
    }
    int _132 = 0;
    if (_128)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1234 = as_type<float>(_136);
        out.gl_Position.z = _1234;
    }
    if (_128)
    {
        return out;
    }
    float _138 = in.m_49.x;
    float _140 = in.m_49.y;
    float _142 = in.m_49.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    float _154 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _146);
    float _156 = in.m_51.w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = sqrt(_168);
    float _178 = in.m_42.x;
    float _180 = in.m_42.y;
    float _182 = in.m_42.z;
    float _184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _186 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _188 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _190 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _192 = _176 * _138;
    float _194 = _188 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _196 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _192);
    float _198 = (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _200 = _144;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _204 = 0.5;
    if (!_166)
    {
        float _206 = _144 * _144;
        float _208 = _206 * 0.5;
        _198 = _208;
    }
    float _210 = _198;
    float _212 = _196 * 0.15915493667125701904296875;
    float _214 = _140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _216 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _218 = _210;
    if (!_166)
    {
        float _220 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _220;
    }
    float _222 = _218;
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _214);
    float _226 = _212 * 6.283185482025146484375;
    float _228 = sin(_226);
    float _230 = _216 * _184;
    float _232 = _194 * _224;
    bool _234 = !_166;
    float _236 = _222;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _144 * _242;
        float _252 = 1.0 / _246;
        float _254 = _248 * 0.693147182464599609375;
        float _256 = exp2(_250);
        float _258 = 1.0 / _254;
        float _260 = _256 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _258, _144);
        float _266 = _264 * _252;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _268;
    }
    float _270 = _236;
    bool _272 = !_166;
    if (!_272)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _144 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _200 = _292;
        _202 = _280;
    }
    float _294 = _200;
    float _296 = _202;
    float _298 = _228 + _142;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _304 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _306 = _298 * 0.125;
    float _308 = fma(_294, _172, _300);
    float _310 = fma(_294, _170, _302);
    float _312 = fma(_294, _174, _304);
    float _314 = _232 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _316 = fma(_308, _156, _180);
    float _318 = fma(_310, _156, _178);
    float _320 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _306);
    float _324 = _316 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _326 = fma(_312, _156, _182);
    float _328 = _316 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _330 = _232 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _324);
    float _334 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[8].x, _314);
    float _336 = _320 * _322;
    float _338 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _328);
    float _340 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[10].x, _330);
    float _342 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[6].z, _332);
    float _344 = _316 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _346 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[4].z, _338);
    float _348 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[10].z, _340);
    float _350 = _342 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[8].z, _334);
    float _354 = _346 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _356 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _344);
    float _358 = _350 + _348;
    bool _360 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _362 = isnan(0.5);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _368 = _364 || _366;
    float _370 = _354 + _352;
    float _372 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _376 = _358 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _380 = _370 + _378;
    float _382 = _372 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _384 = _376 * _376;
    float _386 = _382 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _388 = fma(_380, _380, _384);
    float _390 = _382 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _392 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[11].x, _386);
    float _394 = sqrt(_388);
    float _396 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[11].z, _392);
    float _398 = _396 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _400 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[10].x, _390);
    float _402 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _404 = 1.0 / _398;
    float _406 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[10].z, _400);
    float _408 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[9].x, _402);
    bool _410 = _394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _412 = _406 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _414 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[9].z, _408);
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _422 = _420 != 0;
    float _424 = _412 + _398;
    float _426 = _382 + _414;
    bool _428 = !_418;
    int _430 = _428 ? 0 : 1;
    float _432 = _424 * _404;
    float _434 = _432 * 0.5;
    float _436 = _424;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _440 = _370;
    float _442 = _382;
    float _444 = _376;
    float _446 = _296;
    if (_368)
    {
        _436 = 1.0;
    }
    float _448 = _436;
    float _450 = _448;
    if (!_410)
    {
        _238 = _370;
    }
    float _452 = _238;
    bool _454 = !_422;
    int _456 = _454 ? 0 : 1;
    float _458 = _452;
    if (!_410)
    {
        _438 = _358;
    }
    float _460 = _438;
    float _462 = _460;
    if (!_410)
    {
        _440 = _426;
    }
    float _464 = _440;
    bool _466 = !_410;
    float _468 = _464;
    if (!_466)
    {
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _474 = _394 + _472;
        float _476 = rsqrt(_388);
        float _478 = _474 * _470;
        float _480 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _482 = _478 * 0.15915493667125701904296875;
        float _484 = _482 * 6.283185482025146484375;
        float _486 = cos(_484);
        float _488 = _482 * 6.283185482025146484375;
        float _490 = sin(_488);
        float _492 = _486 + (-1.0);
        float _494 = _492 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _496 = fma(_490, _480, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _498 = fma(_426, _486, _494);
        float _500 = _476 * _496;
        float _502 = fma(_380, _500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _504 = fma(_376, _500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _468 = _498;
        _458 = _502;
        _462 = _504;
    }
    float _506 = _468;
    float _508 = _458;
    float _510 = _462;
    if (!_368)
    {
        float _512 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _514 = _512 * 0.15915493667125701904296875;
        float _516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _518 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _520 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[30].w, _518);
        float _522 = _514 * 6.283185482025146484375;
        float _524 = cos(_522);
        float _526 = _516 * 0.15915493667125701904296875;
        float _528 = _514 * 6.283185482025146484375;
        float _530 = sin(_528);
        float _532 = 1.0 / _524;
        float _534 = _526 * 6.283185482025146484375;
        float _536 = cos(_534);
        float _538 = _530 * _532;
        float _540 = _526 * 6.283185482025146484375;
        float _542 = sin(_540);
        float _544 = _536 * _538;
        float _546 = 1.0 / _520;
        float _548 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _550 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _548;
        float _552 = 1.0 / _544;
        float _554 = 1.0 / _550;
        float _556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _558 = _546 * _556;
        float _560 = _542 * _552;
        float _562 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _564 = fma(_560, _558, _562);
        float _566 = _564 * _554;
        float _568 = precise::clamp(_566, 0.0, 1.0);
        float _570 = -_568;
        float _572 = _570 + 1.0;
        _442 = _552;
        _450 = _572;
    }
    float _574 = _442;
    float _576 = _450;
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _506 + _578;
    float _582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _584 = _508 + _582;
    float _586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _588 = _510 + _586;
    float _590 = _580 * _580;
    float _592 = fma(_584, _584, _590);
    float _594 = fma(_588, _588, _592);
    float _596 = rsqrt(_594);
    float _598 = sqrt(_594);
    float _600 = _596 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _602 = _584 * _600;
    float _604 = _588 * _600;
    float _606 = _602 * _602;
    float _608 = _604 * _604;
    float _610 = _606 + _608;
    float _612 = sqrt(_610);
    bool _614 = _612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _618 = _612 + _616;
    float _620 = _596;
    float _622 = _618;
    float _624 = _580;
    float _626 = _602;
    if (_614)
    {
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _628;
    }
    float _630 = _620;
    float _632 = _630;
    if (_614)
    {
        float _634 = _618 * _630;
        _622 = _634;
    }
    float _636 = _622;
    if (_614)
    {
        float _638 = rsqrt(_610);
        _632 = _638;
    }
    float _640 = _632;
    float _642 = _640;
    if (_614)
    {
        float _644 = _636 * 0.15915493667125701904296875;
        _444 = _644;
    }
    float _646 = _444;
    float _648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _650 = _588;
    float _652 = _646;
    if (_614)
    {
        float _654 = _646 * 6.283185482025146484375;
        float _656 = sin(_654);
        _650 = _656;
    }
    float _658 = _650;
    float _660 = precise::max(0.0, _648);
    float _662 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _664 = _574;
    float _666 = _660;
    if (_614)
    {
        float _668 = _646 * 6.283185482025146484375;
        float _670 = cos(_668);
        _664 = _670;
    }
    float _672 = _664;
    float _674 = -_600;
    float _676 = -_660;
    float _678 = fma(_580, _674, _676);
    if (_614)
    {
        float _680 = _678 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _624 = _680;
    }
    float _682 = _624;
    float _684 = _658;
    float _686 = _682;
    if (_614)
    {
        float _688 = fma(_658, _682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _684 = _688;
    }
    float _690 = _684;
    float _692 = _690;
    if (!_614)
    {
        _686 = _608;
    }
    float _694 = _686;
    float _696 = _694;
    if (_614)
    {
        float _698 = _640 * _690;
        _446 = _698;
    }
    float _700 = _446;
    if (!_614)
    {
        _642 = _678;
    }
    float _702 = _642;
    float _704 = _702;
    if (_614)
    {
        float _706 = _672 + (-1.0);
        _666 = _706;
    }
    float _708 = _666;
    float _710 = _708;
    if (_614)
    {
        float _712 = _602 * _700;
        _626 = _712;
    }
    float _714 = _626;
    if (!_614)
    {
        _692 = _604;
    }
    float _716 = _692;
    float _718 = _716;
    if (_614)
    {
        float _720 = _604 * _700;
        _718 = _720;
    }
    float _722 = _718;
    if (_614)
    {
        float _724 = _708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _724;
    }
    float _726 = _652;
    if (!_614)
    {
        _710 = _606;
    }
    float _728 = _710;
    float _730 = _728;
    if (_614)
    {
        float _732 = _714 * _714;
        _730 = _732;
    }
    float _734 = _730;
    if (_614)
    {
        float _736 = _722 * _722;
        _696 = _736;
    }
    float _738 = _696;
    if (_614)
    {
        float _740 = fma(_678, _672, _726);
        _704 = _740;
    }
    float _742 = _704;
    float _744 = _506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _746 = fma(_742, _742, _734);
    float _748 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _750 = fma(_598, (*spvDescriptorSet0.vp_c15)._m0[23].w, _748);
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float _754 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _744);
    float _756 = _746 + _738;
    float _758 = _506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _760 = -_752;
    float _762 = _760 + 1.0;
    float _764 = rsqrt(_756);
    float _766 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _758);
    float _768 = _506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _770 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[2].z, _766);
    float _772 = _506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _774 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _768);
    float _776 = _770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _778 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _772);
    float _780 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[1].z, _774);
    float _782 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[3].z, _754);
    float _784 = _776 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _786 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].z, _778);
    float _788 = _780 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _790 = abs(_762);
    float _792 = log2(_790);
    float _794 = -_784;
    float _796 = fma(_794, _662, 1.0);
    float _798 = _786 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _800 = _788 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _802 = _764 * _714;
    float _804 = _764 * _742;
    float _806 = _764 * _722;
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[7].x, _800);
    float _810 = _802 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _812 = _782 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _814 = log2(_796);
    float _816 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[7].z, _808);
    float _818 = -_810;
    float _820 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _818);
    float _822 = _788 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _824 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[7].w, _816);
    float _826 = -_806;
    float _828 = fma(_826, (*spvDescriptorSet0.vp_c15)._m0[21].z, _820);
    float _830 = _792 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _832 = _788 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _834 = 1.0 / _824;
    float _836 = fma(_828, -0.5, 0.5);
    float _838 = fma(_828, 0.5, 0.5);
    float _840 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[4].x, _832);
    float _842 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[5].x, _822);
    float _844 = _804 + 1.0;
    float _846 = fma(_838, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _848 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[4].z, _840);
    float _850 = exp2(_830);
    float _852 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[5].z, _842);
    float _854 = fma(_838, _846, -0.212114393711090087890625);
    float _856 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[4].w, _848);
    float _858 = _814 * 0.693147182464599609375;
    float _860 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[5].w, _852);
    float _862 = fma(_838, _854, 1.570728778839111328125);
    float _864 = sqrt(_836);
    float _866 = _856 * _834;
    float _868 = _860 * _834;
    float _870 = _858 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _872 = fma(_866, 0.5, 0.5);
    float _874 = fma(_868, -0.5, 0.5);
    float _876 = -_804;
    float _878 = fma(_850, _844, _876);
    float _880 = fma(_878, 0.5, 0.5);
    float _882 = _864 * 0.636619746685028076171875;
    float _884 = -_862;
    float _886 = fma(_882, _884, 1.0);
    float3 _2454 = float3(_872, _874, _870);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2454, float3(0.0), isnan(_2454)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2454, float3(0.0), isnan(_2454)), level(0.0)).x;
    float3 _2465 = float3(_872, _874, _870);
    float4 _891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2465, float3(0.0), isnan(_2465)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2465, float3(0.0), isnan(_2465)), level(0.0)).xyzw;
    float _893 = _891.x;
    float _895 = _891.y;
    float _897 = _891.z;
    float _899 = _891.w;
    float2 _2482 = float2(_886, _880);
    float3 _903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2482, float2(0.0), isnan(_2482)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2482, float2(0.0), isnan(_2482)), level(0.0)).xyz;
    float _905 = _903.x;
    float _907 = _903.y;
    float _909 = _903.z;
    float _911 = in.m_53.x;
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _915 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _917 = in.m_53.y;
    int _919 = abs(_430);
    int _921 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _923 = _921 != 0;
    float _925 = in.m_55.x;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _933 = _931 != 0;
    float _935 = _915 * _913;
    int _937 = abs(_456);
    float _939 = in.m_55.y;
    float _941 = float(_937);
    float _943 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[20].x, _935);
    bool _945 = _911 > 0.5;
    bool _947 = _945 && _933;
    float _949 = _943 * 6.283185482025146484375;
    float _951 = floor(_943);
    bool _953 = _917 > 0.5;
    float _955 = _949 * 0.15915493667125701904296875;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_933)
    {
        _957 = _925;
    }
    float _959 = _957;
    float _961 = _955 * 6.283185482025146484375;
    float _963 = cos(_961);
    float _965 = _959;
    if (_947)
    {
        float _967 = -_959;
        float _969 = _967 + 1.0;
        _965 = _969;
    }
    float _971 = _965;
    float _973 = -_939;
    float _975 = _973 + 1.0;
    float _977 = -_951;
    float _979 = _943 + _977;
    bool _981 = !_923;
    int _983 = _981 ? 0 : 1;
    float _985 = -_979;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _989 = float(_919);
    int _991 = abs(_983);
    float _993 = fma(_963, 0.5, 0.5);
    float _995 = abs(_987);
    float _997 = _989 * _995;
    float _999 = float(_991);
    float _1001 = -_993;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1005 = _939;
    if (_929)
    {
        float _1007 = _953 ? _975 : _939;
        _1005 = _1007;
    }
    float _1009 = _1005;
    bool _1011 = _979 < 0.5;
    float _1013 = float(_1011);
    float _1015 = fma(_999, _1003, _997);
    float _1017 = _788 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1021 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1017);
    float _1023 = -_1013;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1033 = _792 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_933)
    {
        _204 = _925;
    }
    float _1035 = _204;
    float _1037 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1021);
    float _1039 = _1035;
    if (_933)
    {
        _1039 = _971;
    }
    float _1041 = _1039;
    float _1043 = abs(_1025);
    float _1045 = fma(_941, _1043, _1015);
    float _1047 = exp2(_1033);
    float _1049 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1037);
    float _1051 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1053 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1057 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1059 = _576 > 0.0;
    bool _1061 = isnan(_576);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan(0.0);
    bool _1067 = _1063 || _1065;
    float _1069 = _1045 * _576;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1073 = _1051 * _1029;
    float _1075 = _1049 + _824;
    float _1077 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1075 * 0.5;
    float _1081 = -_1047;
    float _1083 = _1081 + 1.0;
    out.m_57.x = _1053;
    out.m_57.y = _1057;
    out.m_57.z = _1077;
    float _1085 = _1083 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_59.z = _1079;
    out.m_59.w = _824;
    float _1087 = _1019 * _1071;
    float _1089 = -_1085;
    float _1091 = _1089 + 1.0;
    float _1093 = _1069 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _138;
    out.m_61.y = _214;
    out.gl_Position.x = _856;
    out.gl_Position.y = _860;
    out.gl_Position.z = _1049;
    out.gl_Position.w = _824;
    out.m_63.x = _1073;
    out.m_63.y = _1087;
    out.m_45.x = _1093;
    float _1095 = _1085 * _888;
    float _1097 = _899 * _1091;
    float _1099 = _899 * _1095;
    float _1101 = _909 * _1095;
    float _1103 = fma(_905, _1099, _893);
    float _1105 = fma(_907, _1099, _895);
    float _1107 = fma(_899, _1101, _897);
    out.m_65.x = _1103;
    out.m_65.y = _1105;
    out.m_65.z = _1107;
    out.m_65.w = _1097;
    if (_1067)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1109 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1109;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    float _96 = _94;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1166 = as_type<float>(_102);
        out.gl_Position.z = _1166;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _96 = _120;
    }
    float _122 = _96;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    if (_128)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _92;
    if (_128)
    {
        out.m_45.x = 0.0;
    }
    int _132 = 0;
    if (_128)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1234 = as_type<float>(_136);
        out.gl_Position.z = _1234;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_49.x;
    float _140 = in.m_49.y;
    float _142 = in.m_49.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    float _154 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _146);
    float _156 = in.m_51.w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = sqrt(_168);
    float _178 = in.m_42.x;
    float _180 = in.m_42.y;
    float _182 = in.m_42.z;
    float _184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _186 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _188 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _190 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _192 = _176 * _138;
    float _194 = _188 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _196 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _192);
    float _198 = (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _200 = _144;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _204 = 0.5;
    if (!_166)
    {
        float _206 = _144 * _144;
        float _208 = _206 * 0.5;
        _198 = _208;
    }
    float _210 = _198;
    float _212 = _196 * 0.15915493667125701904296875;
    float _214 = _140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _216 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _218 = _210;
    if (!_166)
    {
        float _220 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _220;
    }
    float _222 = _218;
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _214);
    float _226 = _212 * 6.283185482025146484375;
    float _228 = sin(_226);
    float _230 = _216 * _184;
    float _232 = _194 * _224;
    bool _234 = !_166;
    float _236 = _222;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _144 * _242;
        float _252 = 1.0 / _246;
        float _254 = _248 * 0.693147182464599609375;
        float _256 = exp2(_250);
        float _258 = 1.0 / _254;
        float _260 = _256 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _258, _144);
        float _266 = _264 * _252;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _268;
    }
    float _270 = _236;
    bool _272 = !_166;
    if (!_272)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _144 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _200 = _292;
        _202 = _280;
    }
    float _294 = _200;
    float _296 = _202;
    float _298 = _228 + _142;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _304 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _306 = _298 * 0.125;
    float _308 = fma(_294, _172, _300);
    float _310 = fma(_294, _170, _302);
    float _312 = fma(_294, _174, _304);
    float _314 = _232 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _316 = fma(_308, _156, _180);
    float _318 = fma(_310, _156, _178);
    float _320 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _306);
    float _324 = _316 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _326 = fma(_312, _156, _182);
    float _328 = _316 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _330 = _232 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _324);
    float _334 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[8].x, _314);
    float _336 = _320 * _322;
    float _338 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _328);
    float _340 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[10].x, _330);
    float _342 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[6].z, _332);
    float _344 = _316 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _346 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[4].z, _338);
    float _348 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[10].z, _340);
    float _350 = _342 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[8].z, _334);
    float _354 = _346 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _356 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _344);
    float _358 = _350 + _348;
    bool _360 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _362 = isnan(0.5);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _368 = _364 || _366;
    float _370 = _354 + _352;
    float _372 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _376 = _358 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _380 = _370 + _378;
    float _382 = _372 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _384 = _376 * _376;
    float _386 = _382 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _388 = fma(_380, _380, _384);
    float _390 = _382 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _392 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[11].x, _386);
    float _394 = sqrt(_388);
    float _396 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[11].z, _392);
    float _398 = _396 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _400 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[10].x, _390);
    float _402 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _404 = 1.0 / _398;
    float _406 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[10].z, _400);
    float _408 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[9].x, _402);
    bool _410 = _394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _412 = _406 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _414 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[9].z, _408);
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _422 = _420 != 0;
    float _424 = _412 + _398;
    float _426 = _382 + _414;
    bool _428 = !_418;
    int _430 = _428 ? 0 : 1;
    float _432 = _424 * _404;
    float _434 = _432 * 0.5;
    float _436 = _424;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _440 = _370;
    float _442 = _382;
    float _444 = _376;
    float _446 = _296;
    if (_368)
    {
        _436 = 1.0;
    }
    float _448 = _436;
    float _450 = _448;
    if (!_410)
    {
        _238 = _370;
    }
    float _452 = _238;
    bool _454 = !_422;
    int _456 = _454 ? 0 : 1;
    float _458 = _452;
    if (!_410)
    {
        _438 = _358;
    }
    float _460 = _438;
    float _462 = _460;
    if (!_410)
    {
        _440 = _426;
    }
    float _464 = _440;
    bool _466 = !_410;
    float _468 = _464;
    if (!_466)
    {
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _474 = _394 + _472;
        float _476 = rsqrt(_388);
        float _478 = _474 * _470;
        float _480 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _482 = _478 * 0.15915493667125701904296875;
        float _484 = _482 * 6.283185482025146484375;
        float _486 = cos(_484);
        float _488 = _482 * 6.283185482025146484375;
        float _490 = sin(_488);
        float _492 = _486 + (-1.0);
        float _494 = _492 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _496 = fma(_490, _480, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _498 = fma(_426, _486, _494);
        float _500 = _476 * _496;
        float _502 = fma(_380, _500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _504 = fma(_376, _500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _468 = _498;
        _458 = _502;
        _462 = _504;
    }
    float _506 = _468;
    float _508 = _458;
    float _510 = _462;
    if (!_368)
    {
        float _512 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _514 = _512 * 0.15915493667125701904296875;
        float _516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _518 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _520 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[30].w, _518);
        float _522 = _514 * 6.283185482025146484375;
        float _524 = cos(_522);
        float _526 = _516 * 0.15915493667125701904296875;
        float _528 = _514 * 6.283185482025146484375;
        float _530 = sin(_528);
        float _532 = 1.0 / _524;
        float _534 = _526 * 6.283185482025146484375;
        float _536 = cos(_534);
        float _538 = _530 * _532;
        float _540 = _526 * 6.283185482025146484375;
        float _542 = sin(_540);
        float _544 = _536 * _538;
        float _546 = 1.0 / _520;
        float _548 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _550 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _548;
        float _552 = 1.0 / _544;
        float _554 = 1.0 / _550;
        float _556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _558 = _546 * _556;
        float _560 = _542 * _552;
        float _562 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _564 = fma(_560, _558, _562);
        float _566 = _564 * _554;
        float _568 = precise::clamp(_566, 0.0, 1.0);
        float _570 = -_568;
        float _572 = _570 + 1.0;
        _442 = _552;
        _450 = _572;
    }
    float _574 = _442;
    float _576 = _450;
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _506 + _578;
    float _582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _584 = _508 + _582;
    float _586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _588 = _510 + _586;
    float _590 = _580 * _580;
    float _592 = fma(_584, _584, _590);
    float _594 = fma(_588, _588, _592);
    float _596 = rsqrt(_594);
    float _598 = sqrt(_594);
    float _600 = _596 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _602 = _584 * _600;
    float _604 = _588 * _600;
    float _606 = _602 * _602;
    float _608 = _604 * _604;
    float _610 = _606 + _608;
    float _612 = sqrt(_610);
    bool _614 = _612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _618 = _612 + _616;
    float _620 = _596;
    float _622 = _618;
    float _624 = _580;
    float _626 = _602;
    if (_614)
    {
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _628;
    }
    float _630 = _620;
    float _632 = _630;
    if (_614)
    {
        float _634 = _618 * _630;
        _622 = _634;
    }
    float _636 = _622;
    if (_614)
    {
        float _638 = rsqrt(_610);
        _632 = _638;
    }
    float _640 = _632;
    float _642 = _640;
    if (_614)
    {
        float _644 = _636 * 0.15915493667125701904296875;
        _444 = _644;
    }
    float _646 = _444;
    float _648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _650 = _588;
    float _652 = _646;
    if (_614)
    {
        float _654 = _646 * 6.283185482025146484375;
        float _656 = sin(_654);
        _650 = _656;
    }
    float _658 = _650;
    float _660 = precise::max(0.0, _648);
    float _662 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _664 = _574;
    float _666 = _660;
    if (_614)
    {
        float _668 = _646 * 6.283185482025146484375;
        float _670 = cos(_668);
        _664 = _670;
    }
    float _672 = _664;
    float _674 = -_600;
    float _676 = -_660;
    float _678 = fma(_580, _674, _676);
    if (_614)
    {
        float _680 = _678 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _624 = _680;
    }
    float _682 = _624;
    float _684 = _658;
    float _686 = _682;
    if (_614)
    {
        float _688 = fma(_658, _682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _684 = _688;
    }
    float _690 = _684;
    float _692 = _690;
    if (!_614)
    {
        _686 = _608;
    }
    float _694 = _686;
    float _696 = _694;
    if (_614)
    {
        float _698 = _640 * _690;
        _446 = _698;
    }
    float _700 = _446;
    if (!_614)
    {
        _642 = _678;
    }
    float _702 = _642;
    float _704 = _702;
    if (_614)
    {
        float _706 = _672 + (-1.0);
        _666 = _706;
    }
    float _708 = _666;
    float _710 = _708;
    if (_614)
    {
        float _712 = _602 * _700;
        _626 = _712;
    }
    float _714 = _626;
    if (!_614)
    {
        _692 = _604;
    }
    float _716 = _692;
    float _718 = _716;
    if (_614)
    {
        float _720 = _604 * _700;
        _718 = _720;
    }
    float _722 = _718;
    if (_614)
    {
        float _724 = _708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _724;
    }
    float _726 = _652;
    if (!_614)
    {
        _710 = _606;
    }
    float _728 = _710;
    float _730 = _728;
    if (_614)
    {
        float _732 = _714 * _714;
        _730 = _732;
    }
    float _734 = _730;
    if (_614)
    {
        float _736 = _722 * _722;
        _696 = _736;
    }
    float _738 = _696;
    if (_614)
    {
        float _740 = fma(_678, _672, _726);
        _704 = _740;
    }
    float _742 = _704;
    float _744 = _506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _746 = fma(_742, _742, _734);
    float _748 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _750 = fma(_598, (*spvDescriptorSet0.vp_c15)._m0[23].w, _748);
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float _754 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _744);
    float _756 = _746 + _738;
    float _758 = _506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _760 = -_752;
    float _762 = _760 + 1.0;
    float _764 = rsqrt(_756);
    float _766 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _758);
    float _768 = _506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _770 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[2].z, _766);
    float _772 = _506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _774 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _768);
    float _776 = _770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _778 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _772);
    float _780 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[1].z, _774);
    float _782 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[3].z, _754);
    float _784 = _776 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _786 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].z, _778);
    float _788 = _780 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _790 = abs(_762);
    float _792 = log2(_790);
    float _794 = -_784;
    float _796 = fma(_794, _662, 1.0);
    float _798 = _786 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _800 = _788 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _802 = _764 * _714;
    float _804 = _764 * _742;
    float _806 = _764 * _722;
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[7].x, _800);
    float _810 = _802 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _812 = _782 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _814 = log2(_796);
    float _816 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[7].z, _808);
    float _818 = -_810;
    float _820 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _818);
    float _822 = _788 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _824 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[7].w, _816);
    float _826 = -_806;
    float _828 = fma(_826, (*spvDescriptorSet0.vp_c15)._m0[21].z, _820);
    float _830 = _792 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _832 = _788 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _834 = 1.0 / _824;
    float _836 = fma(_828, -0.5, 0.5);
    float _838 = fma(_828, 0.5, 0.5);
    float _840 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[4].x, _832);
    float _842 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[5].x, _822);
    float _844 = _804 + 1.0;
    float _846 = fma(_838, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _848 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[4].z, _840);
    float _850 = exp2(_830);
    float _852 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[5].z, _842);
    float _854 = fma(_838, _846, -0.212114393711090087890625);
    float _856 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[4].w, _848);
    float _858 = _814 * 0.693147182464599609375;
    float _860 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[5].w, _852);
    float _862 = fma(_838, _854, 1.570728778839111328125);
    float _864 = sqrt(_836);
    float _866 = _856 * _834;
    float _868 = _860 * _834;
    float _870 = _858 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _872 = fma(_866, 0.5, 0.5);
    float _874 = fma(_868, -0.5, 0.5);
    float _876 = -_804;
    float _878 = fma(_850, _844, _876);
    float _880 = fma(_878, 0.5, 0.5);
    float _882 = _864 * 0.636619746685028076171875;
    float _884 = -_862;
    float _886 = fma(_882, _884, 1.0);
    float3 _2454 = float3(_872, _874, _870);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2454, float3(0.0), isnan(_2454)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2454, float3(0.0), isnan(_2454)), level(0.0)).x;
    float3 _2465 = float3(_872, _874, _870);
    float4 _891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2465, float3(0.0), isnan(_2465)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2465, float3(0.0), isnan(_2465)), level(0.0)).xyzw;
    float _893 = _891.x;
    float _895 = _891.y;
    float _897 = _891.z;
    float _899 = _891.w;
    float2 _2482 = float2(_886, _880);
    float3 _903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2482, float2(0.0), isnan(_2482)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2482, float2(0.0), isnan(_2482)), level(0.0)).xyz;
    float _905 = _903.x;
    float _907 = _903.y;
    float _909 = _903.z;
    float _911 = in.m_53.x;
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _915 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _917 = in.m_53.y;
    int _919 = abs(_430);
    int _921 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _923 = _921 != 0;
    float _925 = in.m_55.x;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _933 = _931 != 0;
    float _935 = _915 * _913;
    int _937 = abs(_456);
    float _939 = in.m_55.y;
    float _941 = float(_937);
    float _943 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[20].x, _935);
    bool _945 = _911 > 0.5;
    bool _947 = _945 && _933;
    float _949 = _943 * 6.283185482025146484375;
    float _951 = floor(_943);
    bool _953 = _917 > 0.5;
    float _955 = _949 * 0.15915493667125701904296875;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_933)
    {
        _957 = _925;
    }
    float _959 = _957;
    float _961 = _955 * 6.283185482025146484375;
    float _963 = cos(_961);
    float _965 = _959;
    if (_947)
    {
        float _967 = -_959;
        float _969 = _967 + 1.0;
        _965 = _969;
    }
    float _971 = _965;
    float _973 = -_939;
    float _975 = _973 + 1.0;
    float _977 = -_951;
    float _979 = _943 + _977;
    bool _981 = !_923;
    int _983 = _981 ? 0 : 1;
    float _985 = -_979;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _989 = float(_919);
    int _991 = abs(_983);
    float _993 = fma(_963, 0.5, 0.5);
    float _995 = abs(_987);
    float _997 = _989 * _995;
    float _999 = float(_991);
    float _1001 = -_993;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1005 = _939;
    if (_929)
    {
        float _1007 = _953 ? _975 : _939;
        _1005 = _1007;
    }
    float _1009 = _1005;
    bool _1011 = _979 < 0.5;
    float _1013 = float(_1011);
    float _1015 = fma(_999, _1003, _997);
    float _1017 = _788 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1021 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1017);
    float _1023 = -_1013;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1033 = _792 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_933)
    {
        _204 = _925;
    }
    float _1035 = _204;
    float _1037 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1021);
    float _1039 = _1035;
    if (_933)
    {
        _1039 = _971;
    }
    float _1041 = _1039;
    float _1043 = abs(_1025);
    float _1045 = fma(_941, _1043, _1015);
    float _1047 = exp2(_1033);
    float _1049 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1037);
    float _1051 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1053 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1057 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1059 = _576 > 0.0;
    bool _1061 = isnan(_576);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan(0.0);
    bool _1067 = _1063 || _1065;
    float _1069 = _1045 * _576;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1073 = _1051 * _1029;
    float _1075 = _1049 + _824;
    float _1077 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1075 * 0.5;
    float _1081 = -_1047;
    float _1083 = _1081 + 1.0;
    out.m_57.x = _1053;
    out.m_57.y = _1057;
    out.m_57.z = _1077;
    float _1085 = _1083 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_59.z = _1079;
    out.m_59.w = _824;
    float _1087 = _1019 * _1071;
    float _1089 = -_1085;
    float _1091 = _1089 + 1.0;
    float _1093 = _1069 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _138;
    out.m_61.y = _214;
    out.gl_Position.x = _856;
    out.gl_Position.y = _860;
    out.gl_Position.z = _1049;
    out.gl_Position.w = _824;
    out.m_63.x = _1073;
    out.m_63.y = _1087;
    out.m_45.x = _1093;
    float _1095 = _1085 * _888;
    float _1097 = _899 * _1091;
    float _1099 = _899 * _1095;
    float _1101 = _909 * _1095;
    float _1103 = fma(_905, _1099, _893);
    float _1105 = fma(_907, _1099, _895);
    float _1107 = fma(_899, _1101, _897);
    out.m_65.x = _1103;
    out.m_65.y = _1105;
    out.m_65.z = _1107;
    out.m_65.w = _1097;
    if (_1067)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1109 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1109;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

