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
        float _1174 = as_type<float>(_102);
        out.gl_Position.z = _1174;
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
        float _1242 = as_type<float>(_136);
        out.gl_Position.z = _1242;
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
    float _158 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _158);
    float _170 = sqrt(_160);
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    float _184 = _140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _186 = rsqrt(_182);
    float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _190 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _192 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _194 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _196 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _198 = _170 * _138;
    float _200 = _192 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _202 = _182;
    float _204 = _144;
    if (!_180)
    {
        float _206 = _144 * _144;
        float _208 = _206 * 0.5;
        _202 = _208;
    }
    float _210 = _202;
    float _212 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _198);
    float _214 = in.m_47.x;
    float _216 = in.m_47.y;
    float _218 = in.m_47.z;
    float _220 = _210;
    float _222 = 0.5;
    if (!_180)
    {
        float _224 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _224;
    }
    float _226 = _220;
    float _228 = _212 * 0.15915493667125701904296875;
    float _230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _232 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _188);
    float _234 = _228 * 6.283185482025146484375;
    float _236 = sin(_234);
    float _238 = _196 * _230;
    float _240 = _200 * _232;
    bool _242 = !_180;
    float _244 = _226;
    float _246 = _240;
    float _248 = _186;
    if (!_242)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = _144 * _252;
        float _262 = 1.0 / _256;
        float _264 = _258 * 0.693147182464599609375;
        float _266 = exp2(_260);
        float _268 = 1.0 / _264;
        float _270 = _266 + (-1.0);
        float _272 = -_270;
        float _274 = fma(_272, _268, _144);
        float _276 = _274 * _262;
        float _278 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _278;
    }
    float _280 = _244;
    bool _282 = !_180;
    if (!_282)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _290;
        float _294 = _144 * _286;
        float _296 = exp2(_294);
        float _298 = -_296;
        float _300 = _298 + 1.0;
        float _302 = _300 * _292;
        _204 = _302;
    }
    float _304 = _204;
    float _306 = _236 + _142;
    float _308 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _310 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _312 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _314 = _306 * _186;
    float _316 = _314 * 0.125;
    float _318 = fma(_304, _216, _308);
    float _320 = fma(_304, _214, _310);
    float _322 = fma(_304, _218, _312);
    float _324 = _240 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _326 = fma(_318, _156, _164);
    float _328 = fma(_320, _156, _162);
    float _330 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _316);
    float _334 = _326 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _336 = fma(_322, _156, _166);
    float _338 = _326 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = _240 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _342 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[6].x, _334);
    float _344 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[8].x, _324);
    float _346 = _330 * _332;
    float _348 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _350 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[10].x, _340);
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].z, _342);
    float _354 = _326 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].z, _348);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].z, _350);
    float _360 = _352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _362 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].z, _344);
    float _364 = _356 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _366 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _368 = _360 + _358;
    bool _370 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _372 = isnan(0.5);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _378 = _374 || _376;
    float _380 = _364 + _362;
    float _382 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].z, _366);
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _386 = _368 + _384;
    float _388 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _390 = _380 + _388;
    float _392 = _382 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _394 = _386 * _386;
    float _396 = _392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _398 = fma(_390, _390, _394);
    float _400 = _392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _402 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[11].x, _396);
    float _404 = sqrt(_398);
    float _406 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[11].z, _402);
    float _408 = _406 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _410 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[10].x, _400);
    float _412 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _414 = 1.0 / _408;
    float _416 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[10].z, _410);
    float _418 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[9].x, _412);
    bool _420 = _404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _422 = _416 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _424 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].z, _418);
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _432 = _430 != 0;
    float _434 = _422 + _408;
    float _436 = _392 + _424;
    bool _438 = !_428;
    int _440 = _438 ? 0 : 1;
    float _442 = _434 * _414;
    float _444 = _442 * 0.5;
    float _446 = _434;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _450 = _380;
    float _452 = _392;
    float _454 = _386;
    if (_378)
    {
        _446 = 1.0;
    }
    float _456 = _446;
    float _458 = _456;
    if (!_420)
    {
        _246 = _380;
    }
    float _460 = _246;
    bool _462 = !_432;
    int _464 = _462 ? 0 : 1;
    float _466 = _460;
    if (!_420)
    {
        _448 = _368;
    }
    float _468 = _448;
    float _470 = _468;
    if (!_420)
    {
        _450 = _436;
    }
    float _472 = _450;
    bool _474 = !_420;
    float _476 = _472;
    if (!_474)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _482 = _404 + _480;
        float _484 = rsqrt(_398);
        float _486 = _482 * _478;
        float _488 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = _486 * 0.15915493667125701904296875;
        float _492 = _490 * 6.283185482025146484375;
        float _494 = cos(_492);
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 + (-1.0);
        float _502 = _500 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _504 = fma(_498, _488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _506 = fma(_436, _494, _502);
        float _508 = _484 * _504;
        float _510 = fma(_390, _508, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _512 = fma(_386, _508, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _476 = _506;
        _466 = _510;
        _470 = _512;
    }
    float _514 = _476;
    float _516 = _466;
    float _518 = _470;
    if (!_378)
    {
        float _520 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _522 = _520 * 0.15915493667125701904296875;
        float _524 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _526 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _528 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[30].w, _526);
        float _530 = _522 * 6.283185482025146484375;
        float _532 = cos(_530);
        float _534 = _524 * 0.15915493667125701904296875;
        float _536 = _522 * 6.283185482025146484375;
        float _538 = sin(_536);
        float _540 = 1.0 / _532;
        float _542 = _534 * 6.283185482025146484375;
        float _544 = cos(_542);
        float _546 = _538 * _540;
        float _548 = _534 * 6.283185482025146484375;
        float _550 = sin(_548);
        float _552 = _544 * _546;
        float _554 = 1.0 / _528;
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _558 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _556;
        float _560 = 1.0 / _552;
        float _562 = 1.0 / _558;
        float _564 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _566 = _554 * _564;
        float _568 = _550 * _560;
        float _570 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _572 = fma(_568, _566, _570);
        float _574 = _572 * _562;
        float _576 = precise::clamp(_574, 0.0, 1.0);
        float _578 = -_576;
        float _580 = _578 + 1.0;
        _452 = _560;
        _458 = _580;
    }
    float _582 = _452;
    float _584 = _458;
    float _586 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _588 = _514 + _586;
    float _590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _592 = _516 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _596 = _518 + _594;
    float _598 = _588 * _588;
    float _600 = fma(_592, _592, _598);
    float _602 = fma(_596, _596, _600);
    float _604 = rsqrt(_602);
    float _606 = sqrt(_602);
    float _608 = _604 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _610 = _592 * _608;
    float _612 = _596 * _608;
    float _614 = _610 * _610;
    float _616 = _612 * _612;
    float _618 = _614 + _616;
    float _620 = sqrt(_618);
    bool _622 = _620 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _626 = _620 + _624;
    float _628 = _604;
    float _630 = _626;
    float _632 = _588;
    float _634 = _610;
    if (_622)
    {
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _628 = _636;
    }
    float _638 = _628;
    float _640 = _638;
    if (_622)
    {
        float _642 = _626 * _638;
        _630 = _642;
    }
    float _644 = _630;
    if (_622)
    {
        float _646 = rsqrt(_618);
        _640 = _646;
    }
    float _648 = _640;
    float _650 = _648;
    if (_622)
    {
        float _652 = _644 * 0.15915493667125701904296875;
        _454 = _652;
    }
    float _654 = _454;
    float _656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _658 = _596;
    float _660 = _654;
    if (_622)
    {
        float _662 = _654 * 6.283185482025146484375;
        float _664 = sin(_662);
        _658 = _664;
    }
    float _666 = _658;
    float _668 = precise::max(0.0, _656);
    float _670 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _672 = _582;
    float _674 = _668;
    if (_622)
    {
        float _676 = _654 * 6.283185482025146484375;
        float _678 = cos(_676);
        _672 = _678;
    }
    float _680 = _672;
    float _682 = -_608;
    float _684 = -_668;
    float _686 = fma(_588, _682, _684);
    if (_622)
    {
        float _688 = _686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _632 = _688;
    }
    float _690 = _632;
    float _692 = _666;
    float _694 = _690;
    if (_622)
    {
        float _696 = fma(_666, _690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _692 = _696;
    }
    float _698 = _692;
    float _700 = _698;
    if (!_622)
    {
        _694 = _616;
    }
    float _702 = _694;
    float _704 = _702;
    if (_622)
    {
        float _706 = _648 * _698;
        _248 = _706;
    }
    float _708 = _248;
    if (!_622)
    {
        _650 = _686;
    }
    float _710 = _650;
    float _712 = _710;
    if (_622)
    {
        float _714 = _680 + (-1.0);
        _674 = _714;
    }
    float _716 = _674;
    float _718 = _716;
    if (_622)
    {
        float _720 = _610 * _708;
        _634 = _720;
    }
    float _722 = _634;
    if (!_622)
    {
        _700 = _612;
    }
    float _724 = _700;
    float _726 = _724;
    if (_622)
    {
        float _728 = _612 * _708;
        _726 = _728;
    }
    float _730 = _726;
    if (_622)
    {
        float _732 = _716 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _660 = _732;
    }
    float _734 = _660;
    if (!_622)
    {
        _718 = _614;
    }
    float _736 = _718;
    float _738 = _736;
    if (_622)
    {
        float _740 = _722 * _722;
        _738 = _740;
    }
    float _742 = _738;
    if (_622)
    {
        float _744 = _730 * _730;
        _704 = _744;
    }
    float _746 = _704;
    if (_622)
    {
        float _748 = fma(_686, _680, _734);
        _712 = _748;
    }
    float _750 = _712;
    float _752 = _514 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _754 = fma(_750, _750, _742);
    float _756 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _758 = fma(_606, (*spvDescriptorSet0.vp_c15)._m0[23].w, _756);
    float _760 = precise::clamp(_758, 0.0, 1.0);
    float _762 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[3].x, _752);
    float _764 = _754 + _746;
    float _766 = _514 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _768 = -_760;
    float _770 = _768 + 1.0;
    float _772 = rsqrt(_764);
    float _774 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[2].x, _766);
    float _776 = _514 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _778 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[2].z, _774);
    float _780 = _514 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _782 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[1].x, _776);
    float _784 = _778 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _786 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[0].x, _780);
    float _788 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[1].z, _782);
    float _790 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[3].z, _762);
    float _792 = _784 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _794 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[0].z, _786);
    float _796 = _788 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _798 = abs(_770);
    float _800 = log2(_798);
    float _802 = -_792;
    float _804 = fma(_802, _670, 1.0);
    float _806 = _794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _808 = _796 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _810 = _772 * _722;
    float _812 = _772 * _750;
    float _814 = _772 * _730;
    float _816 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[7].x, _808);
    float _818 = _810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _820 = _790 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _822 = log2(_804);
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[7].z, _816);
    float _826 = -_818;
    float _828 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _826);
    float _830 = _796 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _824);
    float _834 = -_814;
    float _836 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[21].z, _828);
    float _838 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _840 = _796 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _842 = 1.0 / _832;
    float _844 = fma(_836, -0.5, 0.5);
    float _846 = fma(_836, 0.5, 0.5);
    float _848 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[4].x, _840);
    float _850 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[5].x, _830);
    float _852 = _812 + 1.0;
    float _854 = fma(_846, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _856 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[4].z, _848);
    float _858 = exp2(_838);
    float _860 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[5].z, _850);
    float _862 = fma(_846, _854, -0.212114393711090087890625);
    float _864 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _856);
    float _866 = _822 * 0.693147182464599609375;
    float _868 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _860);
    float _870 = fma(_846, _862, 1.570728778839111328125);
    float _872 = sqrt(_844);
    float _874 = _864 * _842;
    float _876 = _868 * _842;
    float _878 = _866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _880 = fma(_874, 0.5, 0.5);
    float _882 = fma(_876, -0.5, 0.5);
    float _884 = -_812;
    float _886 = fma(_858, _852, _884);
    float _888 = fma(_886, 0.5, 0.5);
    float _890 = _872 * 0.636619746685028076171875;
    float _892 = -_870;
    float _894 = fma(_890, _892, 1.0);
    float3 _2484 = float3(_880, _882, _878);
    float _896 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2484, float3(0.0), isnan(_2484)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2484, float3(0.0), isnan(_2484)), level(0.0)).x;
    float3 _2495 = float3(_880, _882, _878);
    float4 _899 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2495, float3(0.0), isnan(_2495)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2495, float3(0.0), isnan(_2495)), level(0.0)).xyzw;
    float _901 = _899.x;
    float _903 = _899.y;
    float _905 = _899.z;
    float _907 = _899.w;
    float2 _2512 = float2(_894, _888);
    float3 _911 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2512, float2(0.0), isnan(_2512)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2512, float2(0.0), isnan(_2512)), level(0.0)).xyz;
    float _913 = _911.x;
    float _915 = _911.y;
    float _917 = _911.z;
    float _919 = in.m_53.x;
    float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _923 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _925 = in.m_53.y;
    int _927 = abs(_440);
    int _929 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _931 = _929 != 0;
    float _933 = in.m_55.x;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _941 = _939 != 0;
    float _943 = _923 * _921;
    int _945 = abs(_464);
    float _947 = in.m_55.y;
    float _949 = float(_945);
    float _951 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[20].x, _943);
    bool _953 = _919 > 0.5;
    bool _955 = _953 && _941;
    float _957 = _951 * 6.283185482025146484375;
    float _959 = floor(_951);
    bool _961 = _925 > 0.5;
    float _963 = _957 * 0.15915493667125701904296875;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_941)
    {
        _965 = _933;
    }
    float _967 = _965;
    float _969 = _963 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _967;
    if (_955)
    {
        float _975 = -_967;
        float _977 = _975 + 1.0;
        _973 = _977;
    }
    float _979 = _973;
    float _981 = -_947;
    float _983 = _981 + 1.0;
    float _985 = -_959;
    float _987 = _951 + _985;
    bool _989 = !_931;
    int _991 = _989 ? 0 : 1;
    float _993 = -_987;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _997 = float(_927);
    int _999 = abs(_991);
    float _1001 = fma(_971, 0.5, 0.5);
    float _1003 = abs(_995);
    float _1005 = _997 * _1003;
    float _1007 = float(_999);
    float _1009 = -_1001;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1013 = _947;
    if (_937)
    {
        float _1015 = _961 ? _983 : _947;
        _1013 = _1015;
    }
    float _1017 = _1013;
    bool _1019 = _987 < 0.5;
    float _1021 = float(_1019);
    float _1023 = fma(_1007, _1011, _1005);
    float _1025 = _796 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1027 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1029 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1025);
    float _1031 = -_1021;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1041 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_941)
    {
        _222 = _933;
    }
    float _1043 = _222;
    float _1045 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1029);
    float _1047 = _1043;
    if (_941)
    {
        _1047 = _979;
    }
    float _1049 = _1047;
    float _1051 = abs(_1033);
    float _1053 = fma(_949, _1051, _1023);
    float _1055 = exp2(_1041);
    float _1057 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1045);
    float _1059 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1061 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1065 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1067 = _584 > 0.0;
    bool _1069 = isnan(_584);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.0);
    bool _1075 = _1071 || _1073;
    float _1077 = _1053 * _584;
    float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1081 = _1059 * _1037;
    float _1083 = _1057 + _832;
    float _1085 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = _1083 * 0.5;
    float _1089 = -_1055;
    float _1091 = _1089 + 1.0;
    out.m_57.x = _1061;
    out.m_57.y = _1065;
    out.m_57.z = _1085;
    float _1093 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_59.z = _1087;
    out.m_59.w = _832;
    float _1095 = _1027 * _1079;
    float _1097 = -_1093;
    float _1099 = _1097 + 1.0;
    float _1101 = _1077 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _138;
    out.m_61.y = _188;
    out.gl_Position.x = _864;
    out.gl_Position.y = _868;
    out.gl_Position.z = _1057;
    out.gl_Position.w = _832;
    out.m_63.x = _1081;
    out.m_63.y = _1095;
    out.m_45.x = _1101;
    float _1103 = _1093 * _896;
    float _1105 = _907 * _1099;
    float _1107 = _907 * _1103;
    float _1109 = _917 * _1103;
    float _1111 = fma(_913, _1107, _901);
    float _1113 = fma(_915, _1107, _903);
    float _1115 = fma(_907, _1109, _905);
    out.m_65.x = _1111;
    out.m_65.y = _1113;
    out.m_65.z = _1115;
    out.m_65.w = _1105;
    if (_1075)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1117 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1117;
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
        float _1174 = as_type<float>(_102);
        out.gl_Position.z = _1174;
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
        float _1242 = as_type<float>(_136);
        out.gl_Position.z = _1242;
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
    float _158 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _158);
    float _170 = sqrt(_160);
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    float _184 = _140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _186 = rsqrt(_182);
    float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _190 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _192 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _194 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _196 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _198 = _170 * _138;
    float _200 = _192 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _202 = _182;
    float _204 = _144;
    if (!_180)
    {
        float _206 = _144 * _144;
        float _208 = _206 * 0.5;
        _202 = _208;
    }
    float _210 = _202;
    float _212 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _198);
    float _214 = in.m_47.x;
    float _216 = in.m_47.y;
    float _218 = in.m_47.z;
    float _220 = _210;
    float _222 = 0.5;
    if (!_180)
    {
        float _224 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _224;
    }
    float _226 = _220;
    float _228 = _212 * 0.15915493667125701904296875;
    float _230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _232 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _188);
    float _234 = _228 * 6.283185482025146484375;
    float _236 = sin(_234);
    float _238 = _196 * _230;
    float _240 = _200 * _232;
    bool _242 = !_180;
    float _244 = _226;
    float _246 = _240;
    float _248 = _186;
    if (!_242)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = _144 * _252;
        float _262 = 1.0 / _256;
        float _264 = _258 * 0.693147182464599609375;
        float _266 = exp2(_260);
        float _268 = 1.0 / _264;
        float _270 = _266 + (-1.0);
        float _272 = -_270;
        float _274 = fma(_272, _268, _144);
        float _276 = _274 * _262;
        float _278 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _278;
    }
    float _280 = _244;
    bool _282 = !_180;
    if (!_282)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _290;
        float _294 = _144 * _286;
        float _296 = exp2(_294);
        float _298 = -_296;
        float _300 = _298 + 1.0;
        float _302 = _300 * _292;
        _204 = _302;
    }
    float _304 = _204;
    float _306 = _236 + _142;
    float _308 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _310 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _312 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _314 = _306 * _186;
    float _316 = _314 * 0.125;
    float _318 = fma(_304, _216, _308);
    float _320 = fma(_304, _214, _310);
    float _322 = fma(_304, _218, _312);
    float _324 = _240 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _326 = fma(_318, _156, _164);
    float _328 = fma(_320, _156, _162);
    float _330 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _316);
    float _334 = _326 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _336 = fma(_322, _156, _166);
    float _338 = _326 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = _240 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _342 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[6].x, _334);
    float _344 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[8].x, _324);
    float _346 = _330 * _332;
    float _348 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _350 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[10].x, _340);
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].z, _342);
    float _354 = _326 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].z, _348);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].z, _350);
    float _360 = _352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _362 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].z, _344);
    float _364 = _356 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _366 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _368 = _360 + _358;
    bool _370 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _372 = isnan(0.5);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _378 = _374 || _376;
    float _380 = _364 + _362;
    float _382 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].z, _366);
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _386 = _368 + _384;
    float _388 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _390 = _380 + _388;
    float _392 = _382 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _394 = _386 * _386;
    float _396 = _392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _398 = fma(_390, _390, _394);
    float _400 = _392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _402 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[11].x, _396);
    float _404 = sqrt(_398);
    float _406 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[11].z, _402);
    float _408 = _406 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _410 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[10].x, _400);
    float _412 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _414 = 1.0 / _408;
    float _416 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[10].z, _410);
    float _418 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[9].x, _412);
    bool _420 = _404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _422 = _416 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _424 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].z, _418);
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _432 = _430 != 0;
    float _434 = _422 + _408;
    float _436 = _392 + _424;
    bool _438 = !_428;
    int _440 = _438 ? 0 : 1;
    float _442 = _434 * _414;
    float _444 = _442 * 0.5;
    float _446 = _434;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _450 = _380;
    float _452 = _392;
    float _454 = _386;
    if (_378)
    {
        _446 = 1.0;
    }
    float _456 = _446;
    float _458 = _456;
    if (!_420)
    {
        _246 = _380;
    }
    float _460 = _246;
    bool _462 = !_432;
    int _464 = _462 ? 0 : 1;
    float _466 = _460;
    if (!_420)
    {
        _448 = _368;
    }
    float _468 = _448;
    float _470 = _468;
    if (!_420)
    {
        _450 = _436;
    }
    float _472 = _450;
    bool _474 = !_420;
    float _476 = _472;
    if (!_474)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _482 = _404 + _480;
        float _484 = rsqrt(_398);
        float _486 = _482 * _478;
        float _488 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = _486 * 0.15915493667125701904296875;
        float _492 = _490 * 6.283185482025146484375;
        float _494 = cos(_492);
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 + (-1.0);
        float _502 = _500 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _504 = fma(_498, _488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _506 = fma(_436, _494, _502);
        float _508 = _484 * _504;
        float _510 = fma(_390, _508, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _512 = fma(_386, _508, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _476 = _506;
        _466 = _510;
        _470 = _512;
    }
    float _514 = _476;
    float _516 = _466;
    float _518 = _470;
    if (!_378)
    {
        float _520 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _522 = _520 * 0.15915493667125701904296875;
        float _524 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _526 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _528 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[30].w, _526);
        float _530 = _522 * 6.283185482025146484375;
        float _532 = cos(_530);
        float _534 = _524 * 0.15915493667125701904296875;
        float _536 = _522 * 6.283185482025146484375;
        float _538 = sin(_536);
        float _540 = 1.0 / _532;
        float _542 = _534 * 6.283185482025146484375;
        float _544 = cos(_542);
        float _546 = _538 * _540;
        float _548 = _534 * 6.283185482025146484375;
        float _550 = sin(_548);
        float _552 = _544 * _546;
        float _554 = 1.0 / _528;
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _558 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _556;
        float _560 = 1.0 / _552;
        float _562 = 1.0 / _558;
        float _564 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _566 = _554 * _564;
        float _568 = _550 * _560;
        float _570 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _572 = fma(_568, _566, _570);
        float _574 = _572 * _562;
        float _576 = precise::clamp(_574, 0.0, 1.0);
        float _578 = -_576;
        float _580 = _578 + 1.0;
        _452 = _560;
        _458 = _580;
    }
    float _582 = _452;
    float _584 = _458;
    float _586 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _588 = _514 + _586;
    float _590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _592 = _516 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _596 = _518 + _594;
    float _598 = _588 * _588;
    float _600 = fma(_592, _592, _598);
    float _602 = fma(_596, _596, _600);
    float _604 = rsqrt(_602);
    float _606 = sqrt(_602);
    float _608 = _604 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _610 = _592 * _608;
    float _612 = _596 * _608;
    float _614 = _610 * _610;
    float _616 = _612 * _612;
    float _618 = _614 + _616;
    float _620 = sqrt(_618);
    bool _622 = _620 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _626 = _620 + _624;
    float _628 = _604;
    float _630 = _626;
    float _632 = _588;
    float _634 = _610;
    if (_622)
    {
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _628 = _636;
    }
    float _638 = _628;
    float _640 = _638;
    if (_622)
    {
        float _642 = _626 * _638;
        _630 = _642;
    }
    float _644 = _630;
    if (_622)
    {
        float _646 = rsqrt(_618);
        _640 = _646;
    }
    float _648 = _640;
    float _650 = _648;
    if (_622)
    {
        float _652 = _644 * 0.15915493667125701904296875;
        _454 = _652;
    }
    float _654 = _454;
    float _656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _658 = _596;
    float _660 = _654;
    if (_622)
    {
        float _662 = _654 * 6.283185482025146484375;
        float _664 = sin(_662);
        _658 = _664;
    }
    float _666 = _658;
    float _668 = precise::max(0.0, _656);
    float _670 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _672 = _582;
    float _674 = _668;
    if (_622)
    {
        float _676 = _654 * 6.283185482025146484375;
        float _678 = cos(_676);
        _672 = _678;
    }
    float _680 = _672;
    float _682 = -_608;
    float _684 = -_668;
    float _686 = fma(_588, _682, _684);
    if (_622)
    {
        float _688 = _686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _632 = _688;
    }
    float _690 = _632;
    float _692 = _666;
    float _694 = _690;
    if (_622)
    {
        float _696 = fma(_666, _690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _692 = _696;
    }
    float _698 = _692;
    float _700 = _698;
    if (!_622)
    {
        _694 = _616;
    }
    float _702 = _694;
    float _704 = _702;
    if (_622)
    {
        float _706 = _648 * _698;
        _248 = _706;
    }
    float _708 = _248;
    if (!_622)
    {
        _650 = _686;
    }
    float _710 = _650;
    float _712 = _710;
    if (_622)
    {
        float _714 = _680 + (-1.0);
        _674 = _714;
    }
    float _716 = _674;
    float _718 = _716;
    if (_622)
    {
        float _720 = _610 * _708;
        _634 = _720;
    }
    float _722 = _634;
    if (!_622)
    {
        _700 = _612;
    }
    float _724 = _700;
    float _726 = _724;
    if (_622)
    {
        float _728 = _612 * _708;
        _726 = _728;
    }
    float _730 = _726;
    if (_622)
    {
        float _732 = _716 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _660 = _732;
    }
    float _734 = _660;
    if (!_622)
    {
        _718 = _614;
    }
    float _736 = _718;
    float _738 = _736;
    if (_622)
    {
        float _740 = _722 * _722;
        _738 = _740;
    }
    float _742 = _738;
    if (_622)
    {
        float _744 = _730 * _730;
        _704 = _744;
    }
    float _746 = _704;
    if (_622)
    {
        float _748 = fma(_686, _680, _734);
        _712 = _748;
    }
    float _750 = _712;
    float _752 = _514 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _754 = fma(_750, _750, _742);
    float _756 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _758 = fma(_606, (*spvDescriptorSet0.vp_c15)._m0[23].w, _756);
    float _760 = precise::clamp(_758, 0.0, 1.0);
    float _762 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[3].x, _752);
    float _764 = _754 + _746;
    float _766 = _514 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _768 = -_760;
    float _770 = _768 + 1.0;
    float _772 = rsqrt(_764);
    float _774 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[2].x, _766);
    float _776 = _514 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _778 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[2].z, _774);
    float _780 = _514 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _782 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[1].x, _776);
    float _784 = _778 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _786 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[0].x, _780);
    float _788 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[1].z, _782);
    float _790 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[3].z, _762);
    float _792 = _784 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _794 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[0].z, _786);
    float _796 = _788 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _798 = abs(_770);
    float _800 = log2(_798);
    float _802 = -_792;
    float _804 = fma(_802, _670, 1.0);
    float _806 = _794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _808 = _796 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _810 = _772 * _722;
    float _812 = _772 * _750;
    float _814 = _772 * _730;
    float _816 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[7].x, _808);
    float _818 = _810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _820 = _790 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _822 = log2(_804);
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[7].z, _816);
    float _826 = -_818;
    float _828 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _826);
    float _830 = _796 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _824);
    float _834 = -_814;
    float _836 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[21].z, _828);
    float _838 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _840 = _796 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _842 = 1.0 / _832;
    float _844 = fma(_836, -0.5, 0.5);
    float _846 = fma(_836, 0.5, 0.5);
    float _848 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[4].x, _840);
    float _850 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[5].x, _830);
    float _852 = _812 + 1.0;
    float _854 = fma(_846, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _856 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[4].z, _848);
    float _858 = exp2(_838);
    float _860 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[5].z, _850);
    float _862 = fma(_846, _854, -0.212114393711090087890625);
    float _864 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _856);
    float _866 = _822 * 0.693147182464599609375;
    float _868 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _860);
    float _870 = fma(_846, _862, 1.570728778839111328125);
    float _872 = sqrt(_844);
    float _874 = _864 * _842;
    float _876 = _868 * _842;
    float _878 = _866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _880 = fma(_874, 0.5, 0.5);
    float _882 = fma(_876, -0.5, 0.5);
    float _884 = -_812;
    float _886 = fma(_858, _852, _884);
    float _888 = fma(_886, 0.5, 0.5);
    float _890 = _872 * 0.636619746685028076171875;
    float _892 = -_870;
    float _894 = fma(_890, _892, 1.0);
    float3 _2484 = float3(_880, _882, _878);
    float _896 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2484, float3(0.0), isnan(_2484)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2484, float3(0.0), isnan(_2484)), level(0.0)).x;
    float3 _2495 = float3(_880, _882, _878);
    float4 _899 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2495, float3(0.0), isnan(_2495)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2495, float3(0.0), isnan(_2495)), level(0.0)).xyzw;
    float _901 = _899.x;
    float _903 = _899.y;
    float _905 = _899.z;
    float _907 = _899.w;
    float2 _2512 = float2(_894, _888);
    float3 _911 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2512, float2(0.0), isnan(_2512)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2512, float2(0.0), isnan(_2512)), level(0.0)).xyz;
    float _913 = _911.x;
    float _915 = _911.y;
    float _917 = _911.z;
    float _919 = in.m_53.x;
    float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _923 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _925 = in.m_53.y;
    int _927 = abs(_440);
    int _929 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _931 = _929 != 0;
    float _933 = in.m_55.x;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _941 = _939 != 0;
    float _943 = _923 * _921;
    int _945 = abs(_464);
    float _947 = in.m_55.y;
    float _949 = float(_945);
    float _951 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[20].x, _943);
    bool _953 = _919 > 0.5;
    bool _955 = _953 && _941;
    float _957 = _951 * 6.283185482025146484375;
    float _959 = floor(_951);
    bool _961 = _925 > 0.5;
    float _963 = _957 * 0.15915493667125701904296875;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_941)
    {
        _965 = _933;
    }
    float _967 = _965;
    float _969 = _963 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _967;
    if (_955)
    {
        float _975 = -_967;
        float _977 = _975 + 1.0;
        _973 = _977;
    }
    float _979 = _973;
    float _981 = -_947;
    float _983 = _981 + 1.0;
    float _985 = -_959;
    float _987 = _951 + _985;
    bool _989 = !_931;
    int _991 = _989 ? 0 : 1;
    float _993 = -_987;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _997 = float(_927);
    int _999 = abs(_991);
    float _1001 = fma(_971, 0.5, 0.5);
    float _1003 = abs(_995);
    float _1005 = _997 * _1003;
    float _1007 = float(_999);
    float _1009 = -_1001;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1013 = _947;
    if (_937)
    {
        float _1015 = _961 ? _983 : _947;
        _1013 = _1015;
    }
    float _1017 = _1013;
    bool _1019 = _987 < 0.5;
    float _1021 = float(_1019);
    float _1023 = fma(_1007, _1011, _1005);
    float _1025 = _796 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1027 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1029 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1025);
    float _1031 = -_1021;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1041 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_941)
    {
        _222 = _933;
    }
    float _1043 = _222;
    float _1045 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1029);
    float _1047 = _1043;
    if (_941)
    {
        _1047 = _979;
    }
    float _1049 = _1047;
    float _1051 = abs(_1033);
    float _1053 = fma(_949, _1051, _1023);
    float _1055 = exp2(_1041);
    float _1057 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1045);
    float _1059 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1061 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1065 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1067 = _584 > 0.0;
    bool _1069 = isnan(_584);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.0);
    bool _1075 = _1071 || _1073;
    float _1077 = _1053 * _584;
    float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1081 = _1059 * _1037;
    float _1083 = _1057 + _832;
    float _1085 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = _1083 * 0.5;
    float _1089 = -_1055;
    float _1091 = _1089 + 1.0;
    out.m_57.x = _1061;
    out.m_57.y = _1065;
    out.m_57.z = _1085;
    float _1093 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_59.z = _1087;
    out.m_59.w = _832;
    float _1095 = _1027 * _1079;
    float _1097 = -_1093;
    float _1099 = _1097 + 1.0;
    float _1101 = _1077 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _138;
    out.m_61.y = _188;
    out.gl_Position.x = _864;
    out.gl_Position.y = _868;
    out.gl_Position.z = _1057;
    out.gl_Position.w = _832;
    out.m_63.x = _1081;
    out.m_63.y = _1095;
    out.m_45.x = _1101;
    float _1103 = _1093 * _896;
    float _1105 = _907 * _1099;
    float _1107 = _907 * _1103;
    float _1109 = _917 * _1103;
    float _1111 = fma(_913, _1107, _901);
    float _1113 = fma(_915, _1107, _903);
    float _1115 = fma(_907, _1109, _905);
    out.m_65.x = _1111;
    out.m_65.y = _1113;
    out.m_65.z = _1115;
    out.m_65.w = _1105;
    if (_1075)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1117 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1117;
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
        float _1174 = as_type<float>(_102);
        out.gl_Position.z = _1174;
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
        float _1242 = as_type<float>(_136);
        out.gl_Position.z = _1242;
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
    float _158 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _158);
    float _170 = sqrt(_160);
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    float _184 = _140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _186 = rsqrt(_182);
    float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _190 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _192 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _194 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _196 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _198 = _170 * _138;
    float _200 = _192 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _202 = _182;
    float _204 = _144;
    if (!_180)
    {
        float _206 = _144 * _144;
        float _208 = _206 * 0.5;
        _202 = _208;
    }
    float _210 = _202;
    float _212 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _198);
    float _214 = in.m_47.x;
    float _216 = in.m_47.y;
    float _218 = in.m_47.z;
    float _220 = _210;
    float _222 = 0.5;
    if (!_180)
    {
        float _224 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _224;
    }
    float _226 = _220;
    float _228 = _212 * 0.15915493667125701904296875;
    float _230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _232 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _188);
    float _234 = _228 * 6.283185482025146484375;
    float _236 = sin(_234);
    float _238 = _196 * _230;
    float _240 = _200 * _232;
    bool _242 = !_180;
    float _244 = _226;
    float _246 = _240;
    float _248 = _186;
    if (!_242)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = _144 * _252;
        float _262 = 1.0 / _256;
        float _264 = _258 * 0.693147182464599609375;
        float _266 = exp2(_260);
        float _268 = 1.0 / _264;
        float _270 = _266 + (-1.0);
        float _272 = -_270;
        float _274 = fma(_272, _268, _144);
        float _276 = _274 * _262;
        float _278 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _278;
    }
    float _280 = _244;
    bool _282 = !_180;
    if (!_282)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _290;
        float _294 = _144 * _286;
        float _296 = exp2(_294);
        float _298 = -_296;
        float _300 = _298 + 1.0;
        float _302 = _300 * _292;
        _204 = _302;
    }
    float _304 = _204;
    float _306 = _236 + _142;
    float _308 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _310 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _312 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _314 = _306 * _186;
    float _316 = _314 * 0.125;
    float _318 = fma(_304, _216, _308);
    float _320 = fma(_304, _214, _310);
    float _322 = fma(_304, _218, _312);
    float _324 = _240 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _326 = fma(_318, _156, _164);
    float _328 = fma(_320, _156, _162);
    float _330 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _316);
    float _334 = _326 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _336 = fma(_322, _156, _166);
    float _338 = _326 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = _240 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _342 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[6].x, _334);
    float _344 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[8].x, _324);
    float _346 = _330 * _332;
    float _348 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _350 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[10].x, _340);
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].z, _342);
    float _354 = _326 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].z, _348);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].z, _350);
    float _360 = _352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _362 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].z, _344);
    float _364 = _356 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _366 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _368 = _360 + _358;
    bool _370 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _372 = isnan(0.5);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _378 = _374 || _376;
    float _380 = _364 + _362;
    float _382 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].z, _366);
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _386 = _368 + _384;
    float _388 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _390 = _380 + _388;
    float _392 = _382 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _394 = _386 * _386;
    float _396 = _392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _398 = fma(_390, _390, _394);
    float _400 = _392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _402 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[11].x, _396);
    float _404 = sqrt(_398);
    float _406 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[11].z, _402);
    float _408 = _406 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _410 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[10].x, _400);
    float _412 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _414 = 1.0 / _408;
    float _416 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[10].z, _410);
    float _418 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[9].x, _412);
    bool _420 = _404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _422 = _416 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _424 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].z, _418);
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _432 = _430 != 0;
    float _434 = _422 + _408;
    float _436 = _392 + _424;
    bool _438 = !_428;
    int _440 = _438 ? 0 : 1;
    float _442 = _434 * _414;
    float _444 = _442 * 0.5;
    float _446 = _434;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _450 = _380;
    float _452 = _392;
    float _454 = _386;
    if (_378)
    {
        _446 = 1.0;
    }
    float _456 = _446;
    float _458 = _456;
    if (!_420)
    {
        _246 = _380;
    }
    float _460 = _246;
    bool _462 = !_432;
    int _464 = _462 ? 0 : 1;
    float _466 = _460;
    if (!_420)
    {
        _448 = _368;
    }
    float _468 = _448;
    float _470 = _468;
    if (!_420)
    {
        _450 = _436;
    }
    float _472 = _450;
    bool _474 = !_420;
    float _476 = _472;
    if (!_474)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _482 = _404 + _480;
        float _484 = rsqrt(_398);
        float _486 = _482 * _478;
        float _488 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = _486 * 0.15915493667125701904296875;
        float _492 = _490 * 6.283185482025146484375;
        float _494 = cos(_492);
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 + (-1.0);
        float _502 = _500 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _504 = fma(_498, _488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _506 = fma(_436, _494, _502);
        float _508 = _484 * _504;
        float _510 = fma(_390, _508, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _512 = fma(_386, _508, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _476 = _506;
        _466 = _510;
        _470 = _512;
    }
    float _514 = _476;
    float _516 = _466;
    float _518 = _470;
    if (!_378)
    {
        float _520 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _522 = _520 * 0.15915493667125701904296875;
        float _524 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _526 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _528 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[30].w, _526);
        float _530 = _522 * 6.283185482025146484375;
        float _532 = cos(_530);
        float _534 = _524 * 0.15915493667125701904296875;
        float _536 = _522 * 6.283185482025146484375;
        float _538 = sin(_536);
        float _540 = 1.0 / _532;
        float _542 = _534 * 6.283185482025146484375;
        float _544 = cos(_542);
        float _546 = _538 * _540;
        float _548 = _534 * 6.283185482025146484375;
        float _550 = sin(_548);
        float _552 = _544 * _546;
        float _554 = 1.0 / _528;
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _558 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _556;
        float _560 = 1.0 / _552;
        float _562 = 1.0 / _558;
        float _564 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _566 = _554 * _564;
        float _568 = _550 * _560;
        float _570 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _572 = fma(_568, _566, _570);
        float _574 = _572 * _562;
        float _576 = precise::clamp(_574, 0.0, 1.0);
        float _578 = -_576;
        float _580 = _578 + 1.0;
        _452 = _560;
        _458 = _580;
    }
    float _582 = _452;
    float _584 = _458;
    float _586 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _588 = _514 + _586;
    float _590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _592 = _516 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _596 = _518 + _594;
    float _598 = _588 * _588;
    float _600 = fma(_592, _592, _598);
    float _602 = fma(_596, _596, _600);
    float _604 = rsqrt(_602);
    float _606 = sqrt(_602);
    float _608 = _604 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _610 = _592 * _608;
    float _612 = _596 * _608;
    float _614 = _610 * _610;
    float _616 = _612 * _612;
    float _618 = _614 + _616;
    float _620 = sqrt(_618);
    bool _622 = _620 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _626 = _620 + _624;
    float _628 = _604;
    float _630 = _626;
    float _632 = _588;
    float _634 = _610;
    if (_622)
    {
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _628 = _636;
    }
    float _638 = _628;
    float _640 = _638;
    if (_622)
    {
        float _642 = _626 * _638;
        _630 = _642;
    }
    float _644 = _630;
    if (_622)
    {
        float _646 = rsqrt(_618);
        _640 = _646;
    }
    float _648 = _640;
    float _650 = _648;
    if (_622)
    {
        float _652 = _644 * 0.15915493667125701904296875;
        _454 = _652;
    }
    float _654 = _454;
    float _656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _658 = _596;
    float _660 = _654;
    if (_622)
    {
        float _662 = _654 * 6.283185482025146484375;
        float _664 = sin(_662);
        _658 = _664;
    }
    float _666 = _658;
    float _668 = precise::max(0.0, _656);
    float _670 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _672 = _582;
    float _674 = _668;
    if (_622)
    {
        float _676 = _654 * 6.283185482025146484375;
        float _678 = cos(_676);
        _672 = _678;
    }
    float _680 = _672;
    float _682 = -_608;
    float _684 = -_668;
    float _686 = fma(_588, _682, _684);
    if (_622)
    {
        float _688 = _686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _632 = _688;
    }
    float _690 = _632;
    float _692 = _666;
    float _694 = _690;
    if (_622)
    {
        float _696 = fma(_666, _690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _692 = _696;
    }
    float _698 = _692;
    float _700 = _698;
    if (!_622)
    {
        _694 = _616;
    }
    float _702 = _694;
    float _704 = _702;
    if (_622)
    {
        float _706 = _648 * _698;
        _248 = _706;
    }
    float _708 = _248;
    if (!_622)
    {
        _650 = _686;
    }
    float _710 = _650;
    float _712 = _710;
    if (_622)
    {
        float _714 = _680 + (-1.0);
        _674 = _714;
    }
    float _716 = _674;
    float _718 = _716;
    if (_622)
    {
        float _720 = _610 * _708;
        _634 = _720;
    }
    float _722 = _634;
    if (!_622)
    {
        _700 = _612;
    }
    float _724 = _700;
    float _726 = _724;
    if (_622)
    {
        float _728 = _612 * _708;
        _726 = _728;
    }
    float _730 = _726;
    if (_622)
    {
        float _732 = _716 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _660 = _732;
    }
    float _734 = _660;
    if (!_622)
    {
        _718 = _614;
    }
    float _736 = _718;
    float _738 = _736;
    if (_622)
    {
        float _740 = _722 * _722;
        _738 = _740;
    }
    float _742 = _738;
    if (_622)
    {
        float _744 = _730 * _730;
        _704 = _744;
    }
    float _746 = _704;
    if (_622)
    {
        float _748 = fma(_686, _680, _734);
        _712 = _748;
    }
    float _750 = _712;
    float _752 = _514 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _754 = fma(_750, _750, _742);
    float _756 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _758 = fma(_606, (*spvDescriptorSet0.vp_c15)._m0[23].w, _756);
    float _760 = precise::clamp(_758, 0.0, 1.0);
    float _762 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[3].x, _752);
    float _764 = _754 + _746;
    float _766 = _514 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _768 = -_760;
    float _770 = _768 + 1.0;
    float _772 = rsqrt(_764);
    float _774 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[2].x, _766);
    float _776 = _514 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _778 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[2].z, _774);
    float _780 = _514 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _782 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[1].x, _776);
    float _784 = _778 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _786 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[0].x, _780);
    float _788 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[1].z, _782);
    float _790 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[3].z, _762);
    float _792 = _784 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _794 = fma(_518, (*spvDescriptorSet0.vp_c8)._m0[0].z, _786);
    float _796 = _788 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _798 = abs(_770);
    float _800 = log2(_798);
    float _802 = -_792;
    float _804 = fma(_802, _670, 1.0);
    float _806 = _794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _808 = _796 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _810 = _772 * _722;
    float _812 = _772 * _750;
    float _814 = _772 * _730;
    float _816 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[7].x, _808);
    float _818 = _810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _820 = _790 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _822 = log2(_804);
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[7].z, _816);
    float _826 = -_818;
    float _828 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _826);
    float _830 = _796 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _824);
    float _834 = -_814;
    float _836 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[21].z, _828);
    float _838 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _840 = _796 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _842 = 1.0 / _832;
    float _844 = fma(_836, -0.5, 0.5);
    float _846 = fma(_836, 0.5, 0.5);
    float _848 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[4].x, _840);
    float _850 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[5].x, _830);
    float _852 = _812 + 1.0;
    float _854 = fma(_846, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _856 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[4].z, _848);
    float _858 = exp2(_838);
    float _860 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[5].z, _850);
    float _862 = fma(_846, _854, -0.212114393711090087890625);
    float _864 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _856);
    float _866 = _822 * 0.693147182464599609375;
    float _868 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _860);
    float _870 = fma(_846, _862, 1.570728778839111328125);
    float _872 = sqrt(_844);
    float _874 = _864 * _842;
    float _876 = _868 * _842;
    float _878 = _866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _880 = fma(_874, 0.5, 0.5);
    float _882 = fma(_876, -0.5, 0.5);
    float _884 = -_812;
    float _886 = fma(_858, _852, _884);
    float _888 = fma(_886, 0.5, 0.5);
    float _890 = _872 * 0.636619746685028076171875;
    float _892 = -_870;
    float _894 = fma(_890, _892, 1.0);
    float3 _2484 = float3(_880, _882, _878);
    float _896 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2484, float3(0.0), isnan(_2484)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2484, float3(0.0), isnan(_2484)), level(0.0)).x;
    float3 _2495 = float3(_880, _882, _878);
    float4 _899 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2495, float3(0.0), isnan(_2495)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2495, float3(0.0), isnan(_2495)), level(0.0)).xyzw;
    float _901 = _899.x;
    float _903 = _899.y;
    float _905 = _899.z;
    float _907 = _899.w;
    float2 _2512 = float2(_894, _888);
    float3 _911 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2512, float2(0.0), isnan(_2512)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2512, float2(0.0), isnan(_2512)), level(0.0)).xyz;
    float _913 = _911.x;
    float _915 = _911.y;
    float _917 = _911.z;
    float _919 = in.m_53.x;
    float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _923 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _925 = in.m_53.y;
    int _927 = abs(_440);
    int _929 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _931 = _929 != 0;
    float _933 = in.m_55.x;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _941 = _939 != 0;
    float _943 = _923 * _921;
    int _945 = abs(_464);
    float _947 = in.m_55.y;
    float _949 = float(_945);
    float _951 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[20].x, _943);
    bool _953 = _919 > 0.5;
    bool _955 = _953 && _941;
    float _957 = _951 * 6.283185482025146484375;
    float _959 = floor(_951);
    bool _961 = _925 > 0.5;
    float _963 = _957 * 0.15915493667125701904296875;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_941)
    {
        _965 = _933;
    }
    float _967 = _965;
    float _969 = _963 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _967;
    if (_955)
    {
        float _975 = -_967;
        float _977 = _975 + 1.0;
        _973 = _977;
    }
    float _979 = _973;
    float _981 = -_947;
    float _983 = _981 + 1.0;
    float _985 = -_959;
    float _987 = _951 + _985;
    bool _989 = !_931;
    int _991 = _989 ? 0 : 1;
    float _993 = -_987;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _997 = float(_927);
    int _999 = abs(_991);
    float _1001 = fma(_971, 0.5, 0.5);
    float _1003 = abs(_995);
    float _1005 = _997 * _1003;
    float _1007 = float(_999);
    float _1009 = -_1001;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1013 = _947;
    if (_937)
    {
        float _1015 = _961 ? _983 : _947;
        _1013 = _1015;
    }
    float _1017 = _1013;
    bool _1019 = _987 < 0.5;
    float _1021 = float(_1019);
    float _1023 = fma(_1007, _1011, _1005);
    float _1025 = _796 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1027 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1029 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1025);
    float _1031 = -_1021;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1041 = _800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_941)
    {
        _222 = _933;
    }
    float _1043 = _222;
    float _1045 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1029);
    float _1047 = _1043;
    if (_941)
    {
        _1047 = _979;
    }
    float _1049 = _1047;
    float _1051 = abs(_1033);
    float _1053 = fma(_949, _1051, _1023);
    float _1055 = exp2(_1041);
    float _1057 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1045);
    float _1059 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1061 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1065 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1067 = _584 > 0.0;
    bool _1069 = isnan(_584);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.0);
    bool _1075 = _1071 || _1073;
    float _1077 = _1053 * _584;
    float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1081 = _1059 * _1037;
    float _1083 = _1057 + _832;
    float _1085 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = _1083 * 0.5;
    float _1089 = -_1055;
    float _1091 = _1089 + 1.0;
    out.m_57.x = _1061;
    out.m_57.y = _1065;
    out.m_57.z = _1085;
    float _1093 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_59.z = _1087;
    out.m_59.w = _832;
    float _1095 = _1027 * _1079;
    float _1097 = -_1093;
    float _1099 = _1097 + 1.0;
    float _1101 = _1077 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _138;
    out.m_61.y = _188;
    out.gl_Position.x = _864;
    out.gl_Position.y = _868;
    out.gl_Position.z = _1057;
    out.gl_Position.w = _832;
    out.m_63.x = _1081;
    out.m_63.y = _1095;
    out.m_45.x = _1101;
    float _1103 = _1093 * _896;
    float _1105 = _907 * _1099;
    float _1107 = _907 * _1103;
    float _1109 = _917 * _1103;
    float _1111 = fma(_913, _1107, _901);
    float _1113 = fma(_915, _1107, _903);
    float _1115 = fma(_907, _1109, _905);
    out.m_65.x = _1111;
    out.m_65.y = _1113;
    out.m_65.z = _1115;
    out.m_65.w = _1105;
    if (_1075)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1117 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1117;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

