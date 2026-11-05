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
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_47 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_81 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1429 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1712 = as_type<float>(_120);
        out.gl_Position.z = _1712;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_49.w;
    float _124 = float(_104);
    float _126 = 1.0 / _124;
    float _128 = -_122;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_122);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = _130 * _126;
    bool _144 = _130 >= _124;
    bool _146 = !_140;
    bool _148 = _144 || _146;
    out.m_51.x = _142;
    float _150 = _122;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    int _154 = 0;
    if (_148)
    {
        float _156 = _152 * 5.0;
        _154 = as_type<int>(_156);
    }
    int _158 = _154;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1783 = as_type<float>(_158);
        out.gl_Position.z = _1783;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_53.w;
    float _162 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = in.m_55.z;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_49.x;
    float _182 = in.m_49.y;
    float _184 = in.m_49.z;
    float _186 = in.m_44.x;
    float _188 = in.m_44.y;
    float _190 = in.m_44.z;
    float _192 = _162;
    if (!_174)
    {
        float _194 = _162 * _162;
        float _196 = _194 * 0.5;
        _112 = _196;
    }
    float _198 = _112;
    float _200 = in.m_53.x;
    float _202 = in.m_53.y;
    float _204 = in.m_53.z;
    float _206 = _198;
    if (!_174)
    {
        float _208 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    bool _212 = !_174;
    float _214 = _210;
    if (!_212)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _162 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _162);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _244;
    }
    float _246 = _214;
    bool _248 = !_174;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _162 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _192 = _268;
    }
    float _270 = _192;
    float _272 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _178);
    float _278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    float _280 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _282 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _286 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = _278 * _280;
    float _290 = fma(_270, _182, _282);
    float _292 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _294 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = _276 * _284;
    float _298 = fma(_290, _160, _188);
    float _300 = fma(_270, _180, _292);
    float _302 = fma(_270, _184, _294);
    float _304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _306 = _286 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _308 = fma(_300, _160, _186);
    float _310 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _312 = fma(_302, _160, _190);
    float _314 = _296 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _316 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _310);
    float _320 = _296 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _322 = _304 * _306;
    float _324 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[10].x, _314);
    float _326 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _316);
    float _328 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[6].z, _318);
    float _330 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _332 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[10].z, _324);
    float _334 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[4].z, _326);
    float _336 = _328 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[8].z, _330);
    float _340 = _296 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _342 = _334 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _344 = _332 + _336;
    float _346 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[9].x, _340);
    float _348 = _338 + _342;
    float _350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _352 = _344 + _350;
    float _354 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[9].z, _346);
    float _356 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _358 = _348 + _356;
    float _360 = _352 * _352;
    float _362 = fma(_358, _358, _360);
    float _364 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _366 = sqrt(_362);
    float _368 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _364);
    float _370 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[5].z, _368);
    float _372 = _370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _374 = _354 + _372;
    bool _376 = _366 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _378 = _370;
    float _380 = _348;
    float _382 = _372;
    float _384 = _340;
    float _386 = _306;
    if (!_376)
    {
        _378 = _348;
    }
    float _388 = _378;
    float _390 = _388;
    if (!_376)
    {
        _380 = _344;
    }
    float _392 = _380;
    float _394 = _392;
    if (!_376)
    {
        _382 = _374;
    }
    float _396 = _382;
    bool _398 = !_376;
    float _400 = _396;
    if (!_398)
    {
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _404 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _406 = _366 + _404;
        float _408 = rsqrt(_362);
        float _410 = _406 * _402;
        float _412 = _374 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = _410 * 0.15915493667125701904296875;
        float _416 = _414 * 6.283185482025146484375;
        float _418 = cos(_416);
        float _420 = _414 * 6.283185482025146484375;
        float _422 = sin(_420);
        float _424 = _418 + (-1.0);
        float _426 = _424 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _428 = fma(_422, _412, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _430 = fma(_374, _418, _426);
        float _432 = _408 * _428;
        float _434 = fma(_358, _432, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _436 = fma(_352, _432, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _400 = _430;
        _390 = _434;
        _394 = _436;
    }
    float _438 = _400;
    float _440 = _390;
    float _442 = _394;
    float _444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _446 = _438 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _450 = _440 + _448;
    float _452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _454 = _442 + _452;
    float _456 = _446 * _446;
    float _458 = fma(_450, _450, _456);
    float _460 = fma(_454, _454, _458);
    float _462 = rsqrt(_460);
    float _464 = _462 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _466 = _450 * _464;
    float _468 = _454 * _464;
    float _470 = _466 * _466;
    float _472 = _468 * _468;
    float _474 = _470 + _472;
    float _476 = sqrt(_474);
    bool _478 = _476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _482 = _476 + _480;
    float _484 = _462;
    float _486 = _474;
    float _488 = _482;
    float _490 = _446;
    float _492 = _464;
    if (_478)
    {
        float _494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _484 = _494;
    }
    float _496 = _484;
    if (_478)
    {
        float _498 = rsqrt(_474);
        _486 = _498;
    }
    float _500 = _486;
    float _502 = _500;
    if (_478)
    {
        float _504 = _482 * _496;
        _488 = _504;
    }
    float _506 = _488;
    if (_478)
    {
        float _508 = _506 * 0.15915493667125701904296875;
        _384 = _508;
    }
    float _510 = _384;
    float _512 = _454;
    if (_478)
    {
        float _514 = _510 * 6.283185482025146484375;
        float _516 = sin(_514);
        _512 = _516;
    }
    float _518 = _512;
    float _520 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _522 = precise::max(0.0, _520);
    float _524 = _374;
    float _526 = _522;
    float _528 = _520;
    if (_478)
    {
        float _530 = _510 * 6.283185482025146484375;
        float _532 = cos(_530);
        _524 = _532;
    }
    float _534 = _524;
    float _536 = -_464;
    float _538 = -_522;
    float _540 = fma(_446, _536, _538);
    if (!_478)
    {
        _490 = _468;
    }
    float _542 = _490;
    float _544 = _542;
    if (_478)
    {
        float _546 = _540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _526 = _546;
    }
    float _548 = _526;
    float _550 = _438 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _552 = _518;
    float _554 = _548;
    if (_478)
    {
        float _556 = fma(_518, _548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _552 = _556;
    }
    float _558 = _552;
    float _560 = _558;
    if (!_478)
    {
        _554 = _466;
    }
    float _562 = _554;
    float _564 = _562;
    float _566 = _534;
    if (_478)
    {
        float _568 = _534 + (-1.0);
        _528 = _568;
    }
    float _570 = _528;
    if (_478)
    {
        float _572 = _500 * _558;
        _386 = _572;
    }
    float _574 = _386;
    if (!_478)
    {
        _560 = _540;
    }
    float _576 = _560;
    float _578 = _576;
    if (_478)
    {
        float _580 = _570 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _492 = _580;
    }
    float _582 = _492;
    if (_478)
    {
        float _584 = _466 * _574;
        _564 = _584;
    }
    float _586 = _564;
    if (!_478)
    {
        _502 = _470;
    }
    float _588 = _502;
    float _590 = sqrt(_460);
    float _592 = _588;
    if (_478)
    {
        float _594 = fma(_540, _534, _582);
        _578 = _594;
    }
    float _596 = _578;
    if (_478)
    {
        float _598 = _468 * _574;
        _544 = _598;
    }
    float _600 = _544;
    if (_478)
    {
        float _602 = _586 * _586;
        _592 = _602;
    }
    float _604 = _592;
    if (!_478)
    {
        _566 = _472;
    }
    float _606 = _566;
    float _608 = _606;
    if (_478)
    {
        float _610 = _600 * _600;
        _608 = _610;
    }
    float _612 = _608;
    float _614 = fma(_596, _596, _604);
    float _616 = _614 + _612;
    float _618 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[2].x, _550);
    float _620 = _438 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _622 = rsqrt(_616);
    float _624 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[2].z, _618);
    float _626 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _628 = fma(_590, (*spvDescriptorSet0.vp_c15)._m0[23].w, _626);
    float _630 = precise::clamp(_628, 0.0, 1.0);
    float _632 = _438 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _634 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[1].x, _620);
    float _636 = _624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _638 = -_630;
    float _640 = _638 + 1.0;
    float _642 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[0].x, _632);
    float _644 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[1].z, _634);
    float _646 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _648 = _636 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _650 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[0].z, _642);
    float _652 = _644 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _654 = abs(_640);
    float _656 = log2(_654);
    float _658 = _438 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _660 = -_648;
    float _662 = fma(_660, _646, 1.0);
    float _664 = _650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _666 = _652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _668 = _622 * _586;
    float _670 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[3].x, _658);
    float _672 = _622 * _596;
    float _674 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[7].x, _666);
    float _676 = _668 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _678 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[3].z, _670);
    float _680 = _622 * _600;
    float _682 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[7].z, _674);
    float _684 = -_676;
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].y, _684);
    float _688 = _678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = log2(_662);
    float _692 = _656 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _694 = -_680;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c15)._m0[21].z, _686);
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _682);
    float _700 = _652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _702 = _652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _704 = fma(_696, -0.5, 0.5);
    float _706 = fma(_696, 0.5, 0.5);
    float _708 = exp2(_692);
    float _710 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[4].x, _700);
    float _712 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[5].x, _702);
    float _714 = _672 + 1.0;
    float _716 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[4].z, _710);
    float _718 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[5].z, _712);
    float _720 = 1.0 / _698;
    float _722 = fma(_706, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _724 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _716);
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _718);
    float _728 = _690 * 0.693147182464599609375;
    float _730 = fma(_706, _722, -0.212114393711090087890625);
    float _732 = sqrt(_704);
    float _734 = -_672;
    float _736 = fma(_708, _714, _734);
    float _738 = fma(_706, _730, 1.570728778839111328125);
    float _740 = _728 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _742 = fma(_736, 0.5, 0.5);
    float _744 = _724 * _720;
    float _746 = _726 * _720;
    float _748 = fma(_744, 0.5, 0.5);
    float _750 = fma(_746, -0.5, 0.5);
    float _752 = _732 * 0.636619746685028076171875;
    float3 _2777 = float3(_748, _750, _740);
    float _754 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2777, float3(0.0), isnan(_2777)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2777, float3(0.0), isnan(_2777)), level(0.0)).x;
    float _756 = -_738;
    float _758 = fma(_752, _756, 1.0);
    float3 _2793 = float3(_748, _750, _740);
    float4 _761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2793, float3(0.0), isnan(_2793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2793, float3(0.0), isnan(_2793)), level(0.0)).xyzw;
    float _763 = _761.x;
    float _765 = _761.y;
    float _767 = _761.z;
    float _769 = _761.w;
    float2 _2810 = float2(_758, _742);
    float3 _773 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2810, float2(0.0), isnan(_2810)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2810, float2(0.0), isnan(_2810)), level(0.0)).xyz;
    float _775 = _773.x;
    float _777 = _773.y;
    float _779 = _773.z;
    float _781 = in.m_57.y;
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _785 = _656 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _787 = in.m_59.y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _791 = in.m_59.w;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _795 = _793 != 0;
    float _797 = in.m_59.x;
    float _799 = in.m_59.z;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _803 = in.m_57.x;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _807 = _805 != 0;
    float _809 = -_781;
    float _811 = _809 + 1.0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _815 = _813 != 0;
    float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _821 = _819 != 0;
    out.m_61.z = _164;
    bool _823 = _787 > 0.5;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _827 = _825 != 0;
    out.m_63.x = _440;
    out.m_63.y = _438;
    out.m_63.z = _442;
    bool _829 = _791 > 0.5;
    float _831 = _801 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _833 = _823 ? as_type<int>(_811) : as_type<int>(_781);
    float _835 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _837 = _829 ? as_type<int>(_811) : as_type<int>(_781);
    float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _841 = _795 ? as_type<float>(_833) : _781;
    float _843 = -_789;
    float _845 = fma(_835, 2.0, _843);
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _849 = _847 != 0;
    float _851 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _855 = _853 != 0;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _859 = _807 ? as_type<float>(_837) : _781;
    float _861 = fma(_851, _841, -0.5);
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _865 = _799 > 0.5;
    float _867 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _871 = fma(_859, _831, -0.5);
    float _873 = _781;
    float _875 = _811;
    float _877 = _851;
    bool _879 = _849;
    float _881 = _803;
    float _883 = _799;
    float _885 = _787;
    float _887 = _797;
    float _889 = _698;
    float _891 = _726;
    if (_849)
    {
        float _893 = _865 ? _811 : _781;
        _873 = _893;
    }
    float _895 = _873;
    float _897 = fma(_867, -2.0, _857);
    if (_855)
    {
        _875 = _797;
    }
    float _899 = _875;
    float _901 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    float _903 = _899;
    int _905 = as_type<int>(_901);
    if (!_855)
    {
        _903 = _799;
    }
    float _907 = _903;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _911 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _897);
    float _913 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _901);
    if (_821)
    {
        float _915 = -_803;
        float _917 = _915 + 1.0;
        _905 = as_type<int>(_917);
    }
    int _919 = _905;
    float _921 = _907 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _923 = 0.0;
    int _925 = as_type<int>(_921);
    if (!_821)
    {
        _923 = _803;
    }
    float _927 = _923;
    float _929 = -_911;
    float _931 = fma(_913, _861, _929);
    float _933 = _863 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _935 = -_909;
    float _937 = fma(_921, 2.0, _935);
    float _939 = _927;
    if (_815)
    {
        float _941 = -_803;
        float _943 = _941 + 1.0;
        _925 = as_type<int>(_943);
    }
    int _945 = _925;
    int _947 = _945;
    if (_821)
    {
        float _949 = _865 ? as_type<float>(_919) : _803;
        _939 = _949;
    }
    float _951 = _939;
    float _953 = fma(_933, _895, -0.5);
    float _955 = in.m_65.x;
    float _957 = in.m_65.y;
    float _959 = in.m_65.z;
    if (!_855)
    {
        _877 = _787;
    }
    float _961 = _877;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _965 = _961;
    if (_855)
    {
        _965 = _797;
    }
    float _967 = _965;
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _971 = _178 != 0.0;
    bool _973 = isnan(_178);
    bool _975 = _971 || _973;
    bool _977 = isnan(0.0);
    bool _979 = _975 || _977;
    float _981 = _839 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_815)
    {
        bool _983 = _797 > 0.5;
        _879 = _983;
    }
    bool _985 = _879;
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[83].z, _963);
    float _989 = _967 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _991 = 0.0;
    if (!_815)
    {
        _991 = _803;
    }
    float _993 = _991;
    float _995 = fma(_981, _951, -0.5);
    bool _997 = _176 == 0.0;
    bool _999 = !_979;
    bool _1001 = _997 && _999;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1005 = _993;
    if (_815)
    {
        float _1007 = _985 ? as_type<float>(_945) : _803;
        _1005 = _1007;
    }
    float _1009 = _1005;
    if (_827)
    {
        float _1011 = -_803;
        float _1013 = _1011 + 1.0;
        _947 = as_type<int>(_1013);
    }
    int _1015 = _947;
    bool _1017 = _164 == 0.0;
    bool _1019 = _1017 && _1001;
    float _1021 = -_1003;
    float _1023 = fma(_989, 2.0, _1021);
    float _1025 = _969 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_827)
    {
        float _1027 = _823 ? as_type<float>(_1015) : _803;
        _881 = _1027;
    }
    float _1029 = _881;
    float _1031 = -_130;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[76].x, _845);
    float _1035 = in.m_67.x;
    float _1037 = in.m_67.y;
    float _1039 = in.m_67.z;
    float _1041 = in.m_67.w;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1045 = 0.0;
    if (!_855)
    {
        _1045 = _799;
    }
    float _1047 = _1045;
    float _1049 = fma(_1025, _1029, -0.5);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1053 = _1047;
    float _1055 = _1051;
    if (_855)
    {
        _1053 = _787;
    }
    float _1057 = _1053;
    float _1059 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1043);
    float _1061 = 0.0;
    if (_1019)
    {
        _1061 = _955;
    }
    float _1063 = _1061;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1067 = 0.0;
    float _1069 = _1063;
    float _1071 = _1065;
    if (!_855)
    {
        _1067 = _799;
    }
    float _1073 = _1067;
    float _1075 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1051);
    float _1077 = _1073;
    if (_855)
    {
        _1077 = _787;
    }
    float _1079 = _1077;
    float _1081 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1065);
    if (_855)
    {
        _883 = _787;
    }
    float _1083 = _883;
    float _1085 = -_130;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[86].x, _937);
    float _1089 = _1083;
    if (_1019)
    {
        _1055 = _957;
    }
    float _1091 = _1055;
    float _1093 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1095 = _1091;
    if (_1019)
    {
        _885 = _1063;
    }
    float _1097 = _885;
    float _1099 = -_130;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1023);
    float _1103 = _1097;
    if (!_1019)
    {
        _1069 = _955;
    }
    float _1105 = _1069;
    float _1107 = exp2(_785);
    float _1109 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (!_1019)
    {
        float _1111 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1105);
        _1103 = _1111;
    }
    float _1113 = _1103;
    if (_1019)
    {
        _1071 = _1091;
    }
    float _1115 = _1071;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1119 = _1115;
    if (!_1019)
    {
        _1095 = _957;
    }
    float _1121 = _1095;
    float _1123 = _817 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1127 = fma(_1093, -2.0, _1117);
    float _1129 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1131 = fma(_1123, _1009, -0.5);
    float _1133 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1135 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1125);
    float _1137 = 0.0;
    if (_1019)
    {
        _1137 = _959;
    }
    float _1139 = _1137;
    float _1141 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1081);
    float _1143 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1133);
    float _1145 = _1139;
    if (!_855)
    {
        _1089 = _797;
    }
    float _1147 = _1089;
    float _1149 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1109);
    float _1151 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1129);
    float _1153 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1135);
    if (_1019)
    {
        _887 = _1139;
    }
    float _1155 = _887;
    float _1157 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1143);
    float _1159 = _1155;
    if (!_1019)
    {
        _1145 = _959;
    }
    float _1161 = _1145;
    float _1163 = fma(_1141, _1131, _1033);
    float _1165 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1149);
    float _1167 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1151);
    float _1169 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _987);
    float _1171 = fma(_1153, _1049, _1087);
    float _1173 = _1039 * _1105;
    if (!_1019)
    {
        float _1175 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1121);
        _1119 = _1175;
    }
    float _1177 = _1119;
    float _1179 = _1037 * _1161;
    float _1181 = fma(_1169, _995, _1101);
    out.m_69.x = _1157;
    out.m_69.y = _1165;
    out.m_69.z = _1167;
    float _1183 = -_1173;
    float _1185 = fma(_1035, _1161, _1183);
    float _1187 = _1035 * _1121;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1191 = -_1179;
    float _1193 = fma(_1039, _1121, _1191);
    float _1195 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1075);
    float _1197 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1127);
    float _1199 = -_1187;
    float _1201 = fma(_1037, _1105, _1199);
    float _1203 = _1185 * _1041;
    if (!_1019)
    {
        float _1205 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1161);
        _1159 = _1205;
    }
    float _1207 = _1159;
    float _1209 = -_1197;
    float _1211 = fma(_1195, _871, _1209);
    float _1213 = _1193 * _1041;
    float _1215 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1217 = _652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1219 = _1201 * _1041;
    float _1221 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1223 = fma(_1215, -2.0, _1189);
    float _1225 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1059);
    float _1227 = _1163 + 0.5;
    float _1229 = _1181 + 0.5;
    float _1231 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1223);
    float _1233 = _931 + 0.5;
    float _1235 = _1211 + 0.5;
    float _1237 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1217);
    float _1239 = fma(_1213, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1221);
    float _1241 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1243 = -_1107;
    float _1245 = _1243 + 1.0;
    float _1247 = -_1231;
    float _1249 = fma(_1225, _953, _1247);
    out.m_71.x = _1227;
    out.m_71.y = _1233;
    out.m_71.z = _1229;
    out.m_71.w = _1235;
    float _1251 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1237);
    float _1253 = fma(_1213, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1241);
    float _1255 = _1171 + 0.5;
    float _1257 = _1249 + 0.5;
    float _1259 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1251);
    float _1261 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1263 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1265 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1267 = _1259 + _698;
    out.m_73.x = _1255;
    out.m_73.y = _1257;
    float _1269 = fma(_1113, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1261);
    float _1271 = fma(_1113, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1263);
    float _1273 = fma(_1113, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1265);
    float _1275 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1239);
    float _1277 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1279 = _1267 * 0.5;
    float _1281 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1253);
    float _1283 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1271);
    float _1285 = -_1277;
    float _1287 = _1285 + 1.0;
    float _1289 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1269);
    float _1291 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1273);
    bool _1293 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1295 = isnan(_590);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1301 = _1297 || _1299;
    float _1303 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_75.z = _1279;
    out.m_75.w = _698;
    float _1305 = fma(_1213, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1303);
    out.m_77.x = _1289;
    out.m_77.y = _1283;
    out.m_77.z = _1291;
    float _1307 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1305);
    out.gl_Position.x = _724;
    out.gl_Position.y = _726;
    out.gl_Position.z = _1259;
    out.gl_Position.w = _698;
    out.m_79.x = _1275;
    out.m_79.y = _1281;
    out.m_79.z = _1307;
    float _1309 = _1275;
    float _1311 = _1259;
    float _1313 = _724;
    float _1315 = _1277;
    if (!_1301)
    {
        _889 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1317 = _889;
    float _1319 = _1317;
    float _1321 = _1317;
    if (!_1301)
    {
        _1309 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1323 = _1309;
    float _1325 = _1323;
    float _1327 = _1323;
    if (!_1301)
    {
        _1311 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1329 = _1311;
    float _1331 = _1329;
    float _1333 = _1329;
    if (!_1301)
    {
        _891 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1335 = _891;
    float _1337 = _1335;
    float _1339 = _1335;
    if (!_1301)
    {
        _1313 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1341 = _1313;
    float _1343 = _1277 * _754;
    float _1345 = _1341;
    float _1347 = _1341;
    if (!_1301)
    {
        _1315 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1349 = _1315;
    float _1351 = _769 * _1343;
    float _1353 = _769 * _1287;
    float _1355 = _779 * _1343;
    float _1357 = fma(_775, _1351, _763);
    float _1359 = fma(_777, _1351, _765);
    float _1361 = fma(_769, _1355, _767);
    out.m_81.x = _1357;
    out.m_81.y = _1359;
    out.m_81.z = _1361;
    out.m_81.w = _1353;
    bool _1363 = !_1301;
    float _1365 = _1349;
    float _1367 = _1349;
    if (!_1363)
    {
        bool _1369 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1371 = isnan(_590);
        bool _1373 = _1369 || _1371;
        bool _1375 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1377 = _1373 || _1375;
        if (!_1377)
        {
            float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1381 = _590 + _1379;
            float _1383 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1385 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1383;
            float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1389 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1391 = 1.0 / _1385;
            float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1399 = _1397 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1403 = _1401 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1407 = _1405 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1409 = _1381 * _1391;
            float _1411 = precise::clamp(_1409, 0.0, 1.0);
            float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1415 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1417 = fma(_1411, _1389, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1419 = fma(_1411, _1415, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1421 = fma(_1411, _1395, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1423 = fma(_1411, _1399, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1425 = fma(_1411, _1403, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1427 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1327 = _1421;
            _1339 = _1425;
            _1367 = _1417;
            _1333 = _1423;
            _1321 = _1419;
            _1347 = _1427;
            _1429 = true;
        }
        else
        {
            bool _1431 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1433 = isnan(_590);
            bool _1435 = _1431 || _1433;
            bool _1437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1439 = _1435 || _1437;
            if (!_1439)
            {
                _1365 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1441 = _1365;
            _1367 = _1441;
            if (!_1439)
            {
                _1325 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1443 = _1325;
            _1327 = _1443;
            if (!_1439)
            {
                _1319 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1445 = _1319;
            _1321 = _1445;
            if (!_1439)
            {
                _1331 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1447 = _1331;
            _1333 = _1447;
            if (!_1439)
            {
                _1337 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1449 = _1337;
            _1339 = _1449;
            if (!_1439)
            {
                _1345 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1451 = _1345;
            bool _1453 = !_1439;
            _1347 = _1451;
            if (!_1453)
            {
                bool _1455 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1457 = isnan(_590);
                bool _1459 = _1455 || _1457;
                bool _1461 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1463 = _1459 || _1461;
                if (!_1463)
                {
                    float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1467 = _590 + _1465;
                    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1469;
                    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1475 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1477 = 1.0 / _1471;
                    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1485 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1489 = _1487 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1493 = _1491 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1495 = _1467 * _1477;
                    float _1497 = precise::clamp(_1495, 0.0, 1.0);
                    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1501 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1503 = fma(_1497, _1475, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1505 = fma(_1497, _1501, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1507 = fma(_1497, _1481, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1509 = fma(_1497, _1485, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1511 = fma(_1497, _1489, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1513 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1327 = _1507;
                    _1339 = _1511;
                    _1367 = _1503;
                    _1333 = _1509;
                    _1321 = _1505;
                    _1347 = _1513;
                    _1429 = true;
                }
                else
                {
                    _1327 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1339 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1367 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1333 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1321 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1347 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1429 = false;
    float _1515 = _1327;
    float _1517 = _1339;
    float _1519 = _1367;
    float _1521 = _1333;
    float _1523 = _1321;
    float _1525 = _1347;
    float _1527 = fma(_1283, -0.5, 0.5);
    float _1529 = precise::clamp(_1527, 0.0, 1.0);
    float _1531 = -_1515;
    float _1533 = _1531 + _1517;
    float _1535 = -_1519;
    float _1537 = _1535 + _1521;
    float _1539 = -_1523;
    float _1541 = _1539 + _1525;
    bool _1543 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1545 = fma(_1529, _1533, _1515);
    float _1547 = fma(_1529, _1537, _1519);
    float _1549 = fma(_1529, _1541, _1523);
    float _1551 = _1545 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1553 = fma(_1547, 0.298911988735198974609375, _1551);
    float _1555 = fma(_1549, 0.114477999508380889892578125, _1553);
    float _1557 = -_1555;
    float _1559 = _1547 + _1557;
    float _1561 = -_1555;
    float _1563 = _1545 + _1561;
    float _1565 = -_1555;
    float _1567 = _1549 + _1565;
    float _1569 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1571 = fma(_1559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1555);
    float _1573 = fma(_1563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1555);
    float _1575 = fma(_1567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1555);
    out.m_47.x = _1569;
    out.m_85.x = _1571;
    out.m_85.y = _1573;
    out.m_85.z = _1575;
    if (!_1543)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1577 = -_438;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1581 = -_440;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1585 = -_442;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1589 = _1579 * _1579;
    float _1591 = fma(_1583, _1583, _1589);
    float _1593 = fma(_1587, _1587, _1591);
    float _1595 = sqrt(_1593);
    float _1597 = rsqrt(_1593);
    float _1599 = -_1595;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1603 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1605 = precise::clamp(_1603, 0.0, 1.0);
    float _1607 = _1583 * _1597;
    float _1609 = _1579 * _1597;
    float _1611 = abs(_1605);
    float _1613 = log2(_1611);
    float _1615 = _1587 * _1597;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1619 = _1283 * _1609;
    float _1621 = -_1609;
    float _1623 = -_1617;
    float _1625 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1623);
    float _1627 = fma(_1289, _1607, _1619);
    float _1629 = -_1615;
    float _1631 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1625);
    float _1633 = fma(_1291, _1615, _1627);
    float _1635 = precise::clamp(_1633, 0.0, 1.0);
    float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1639 = _1631 + _1637;
    float _1641 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = exp2(_1641);
    float _1649 = _1647 * _1645;
    float _1651 = _1635 * _1649;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1655 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1657 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1653;
    out.m_83.y = _1655;
    out.m_83.z = _1657;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1429 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1712 = as_type<float>(_120);
        out.gl_Position.z = _1712;
    }
    if (!_108)
    {
        return out;
    }
    float _122 = in.m_49.w;
    float _124 = float(_104);
    float _126 = 1.0 / _124;
    float _128 = -_122;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_122);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = _130 * _126;
    bool _144 = _130 >= _124;
    bool _146 = !_140;
    bool _148 = _144 || _146;
    out.m_51.x = _142;
    float _150 = _122;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    int _154 = 0;
    if (_148)
    {
        float _156 = _152 * 5.0;
        _154 = as_type<int>(_156);
    }
    int _158 = _154;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1783 = as_type<float>(_158);
        out.gl_Position.z = _1783;
    }
    if (_148)
    {
        return out;
    }
    float _160 = in.m_53.w;
    float _162 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = in.m_55.z;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_49.x;
    float _182 = in.m_49.y;
    float _184 = in.m_49.z;
    float _186 = in.m_44.x;
    float _188 = in.m_44.y;
    float _190 = in.m_44.z;
    float _192 = _162;
    if (!_174)
    {
        float _194 = _162 * _162;
        float _196 = _194 * 0.5;
        _112 = _196;
    }
    float _198 = _112;
    float _200 = in.m_53.x;
    float _202 = in.m_53.y;
    float _204 = in.m_53.z;
    float _206 = _198;
    if (!_174)
    {
        float _208 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    bool _212 = !_174;
    float _214 = _210;
    if (!_212)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _162 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _162);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _244;
    }
    float _246 = _214;
    bool _248 = !_174;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _162 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _192 = _268;
    }
    float _270 = _192;
    float _272 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _178);
    float _278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    float _280 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _282 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _286 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = _278 * _280;
    float _290 = fma(_270, _182, _282);
    float _292 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _294 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = _276 * _284;
    float _298 = fma(_290, _160, _188);
    float _300 = fma(_270, _180, _292);
    float _302 = fma(_270, _184, _294);
    float _304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _306 = _286 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _308 = fma(_300, _160, _186);
    float _310 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _312 = fma(_302, _160, _190);
    float _314 = _296 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _316 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _310);
    float _320 = _296 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _322 = _304 * _306;
    float _324 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[10].x, _314);
    float _326 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _316);
    float _328 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[6].z, _318);
    float _330 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _332 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[10].z, _324);
    float _334 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[4].z, _326);
    float _336 = _328 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[8].z, _330);
    float _340 = _296 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _342 = _334 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _344 = _332 + _336;
    float _346 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[9].x, _340);
    float _348 = _338 + _342;
    float _350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _352 = _344 + _350;
    float _354 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[9].z, _346);
    float _356 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _358 = _348 + _356;
    float _360 = _352 * _352;
    float _362 = fma(_358, _358, _360);
    float _364 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _366 = sqrt(_362);
    float _368 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _364);
    float _370 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[5].z, _368);
    float _372 = _370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _374 = _354 + _372;
    bool _376 = _366 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _378 = _370;
    float _380 = _348;
    float _382 = _372;
    float _384 = _340;
    float _386 = _306;
    if (!_376)
    {
        _378 = _348;
    }
    float _388 = _378;
    float _390 = _388;
    if (!_376)
    {
        _380 = _344;
    }
    float _392 = _380;
    float _394 = _392;
    if (!_376)
    {
        _382 = _374;
    }
    float _396 = _382;
    bool _398 = !_376;
    float _400 = _396;
    if (!_398)
    {
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _404 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _406 = _366 + _404;
        float _408 = rsqrt(_362);
        float _410 = _406 * _402;
        float _412 = _374 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = _410 * 0.15915493667125701904296875;
        float _416 = _414 * 6.283185482025146484375;
        float _418 = cos(_416);
        float _420 = _414 * 6.283185482025146484375;
        float _422 = sin(_420);
        float _424 = _418 + (-1.0);
        float _426 = _424 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _428 = fma(_422, _412, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _430 = fma(_374, _418, _426);
        float _432 = _408 * _428;
        float _434 = fma(_358, _432, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _436 = fma(_352, _432, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _400 = _430;
        _390 = _434;
        _394 = _436;
    }
    float _438 = _400;
    float _440 = _390;
    float _442 = _394;
    float _444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _446 = _438 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _450 = _440 + _448;
    float _452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _454 = _442 + _452;
    float _456 = _446 * _446;
    float _458 = fma(_450, _450, _456);
    float _460 = fma(_454, _454, _458);
    float _462 = rsqrt(_460);
    float _464 = _462 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _466 = _450 * _464;
    float _468 = _454 * _464;
    float _470 = _466 * _466;
    float _472 = _468 * _468;
    float _474 = _470 + _472;
    float _476 = sqrt(_474);
    bool _478 = _476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _482 = _476 + _480;
    float _484 = _462;
    float _486 = _474;
    float _488 = _482;
    float _490 = _446;
    float _492 = _464;
    if (_478)
    {
        float _494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _484 = _494;
    }
    float _496 = _484;
    if (_478)
    {
        float _498 = rsqrt(_474);
        _486 = _498;
    }
    float _500 = _486;
    float _502 = _500;
    if (_478)
    {
        float _504 = _482 * _496;
        _488 = _504;
    }
    float _506 = _488;
    if (_478)
    {
        float _508 = _506 * 0.15915493667125701904296875;
        _384 = _508;
    }
    float _510 = _384;
    float _512 = _454;
    if (_478)
    {
        float _514 = _510 * 6.283185482025146484375;
        float _516 = sin(_514);
        _512 = _516;
    }
    float _518 = _512;
    float _520 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _522 = precise::max(0.0, _520);
    float _524 = _374;
    float _526 = _522;
    float _528 = _520;
    if (_478)
    {
        float _530 = _510 * 6.283185482025146484375;
        float _532 = cos(_530);
        _524 = _532;
    }
    float _534 = _524;
    float _536 = -_464;
    float _538 = -_522;
    float _540 = fma(_446, _536, _538);
    if (!_478)
    {
        _490 = _468;
    }
    float _542 = _490;
    float _544 = _542;
    if (_478)
    {
        float _546 = _540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _526 = _546;
    }
    float _548 = _526;
    float _550 = _438 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _552 = _518;
    float _554 = _548;
    if (_478)
    {
        float _556 = fma(_518, _548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _552 = _556;
    }
    float _558 = _552;
    float _560 = _558;
    if (!_478)
    {
        _554 = _466;
    }
    float _562 = _554;
    float _564 = _562;
    float _566 = _534;
    if (_478)
    {
        float _568 = _534 + (-1.0);
        _528 = _568;
    }
    float _570 = _528;
    if (_478)
    {
        float _572 = _500 * _558;
        _386 = _572;
    }
    float _574 = _386;
    if (!_478)
    {
        _560 = _540;
    }
    float _576 = _560;
    float _578 = _576;
    if (_478)
    {
        float _580 = _570 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _492 = _580;
    }
    float _582 = _492;
    if (_478)
    {
        float _584 = _466 * _574;
        _564 = _584;
    }
    float _586 = _564;
    if (!_478)
    {
        _502 = _470;
    }
    float _588 = _502;
    float _590 = sqrt(_460);
    float _592 = _588;
    if (_478)
    {
        float _594 = fma(_540, _534, _582);
        _578 = _594;
    }
    float _596 = _578;
    if (_478)
    {
        float _598 = _468 * _574;
        _544 = _598;
    }
    float _600 = _544;
    if (_478)
    {
        float _602 = _586 * _586;
        _592 = _602;
    }
    float _604 = _592;
    if (!_478)
    {
        _566 = _472;
    }
    float _606 = _566;
    float _608 = _606;
    if (_478)
    {
        float _610 = _600 * _600;
        _608 = _610;
    }
    float _612 = _608;
    float _614 = fma(_596, _596, _604);
    float _616 = _614 + _612;
    float _618 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[2].x, _550);
    float _620 = _438 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _622 = rsqrt(_616);
    float _624 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[2].z, _618);
    float _626 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _628 = fma(_590, (*spvDescriptorSet0.vp_c15)._m0[23].w, _626);
    float _630 = precise::clamp(_628, 0.0, 1.0);
    float _632 = _438 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _634 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[1].x, _620);
    float _636 = _624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _638 = -_630;
    float _640 = _638 + 1.0;
    float _642 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[0].x, _632);
    float _644 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[1].z, _634);
    float _646 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _648 = _636 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _650 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[0].z, _642);
    float _652 = _644 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _654 = abs(_640);
    float _656 = log2(_654);
    float _658 = _438 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _660 = -_648;
    float _662 = fma(_660, _646, 1.0);
    float _664 = _650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _666 = _652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _668 = _622 * _586;
    float _670 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[3].x, _658);
    float _672 = _622 * _596;
    float _674 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[7].x, _666);
    float _676 = _668 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _678 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[3].z, _670);
    float _680 = _622 * _600;
    float _682 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[7].z, _674);
    float _684 = -_676;
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].y, _684);
    float _688 = _678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = log2(_662);
    float _692 = _656 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _694 = -_680;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c15)._m0[21].z, _686);
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _682);
    float _700 = _652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _702 = _652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _704 = fma(_696, -0.5, 0.5);
    float _706 = fma(_696, 0.5, 0.5);
    float _708 = exp2(_692);
    float _710 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[4].x, _700);
    float _712 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[5].x, _702);
    float _714 = _672 + 1.0;
    float _716 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[4].z, _710);
    float _718 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[5].z, _712);
    float _720 = 1.0 / _698;
    float _722 = fma(_706, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _724 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _716);
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _718);
    float _728 = _690 * 0.693147182464599609375;
    float _730 = fma(_706, _722, -0.212114393711090087890625);
    float _732 = sqrt(_704);
    float _734 = -_672;
    float _736 = fma(_708, _714, _734);
    float _738 = fma(_706, _730, 1.570728778839111328125);
    float _740 = _728 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _742 = fma(_736, 0.5, 0.5);
    float _744 = _724 * _720;
    float _746 = _726 * _720;
    float _748 = fma(_744, 0.5, 0.5);
    float _750 = fma(_746, -0.5, 0.5);
    float _752 = _732 * 0.636619746685028076171875;
    float3 _2777 = float3(_748, _750, _740);
    float _754 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2777, float3(0.0), isnan(_2777)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2777, float3(0.0), isnan(_2777)), level(0.0)).x;
    float _756 = -_738;
    float _758 = fma(_752, _756, 1.0);
    float3 _2793 = float3(_748, _750, _740);
    float4 _761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2793, float3(0.0), isnan(_2793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2793, float3(0.0), isnan(_2793)), level(0.0)).xyzw;
    float _763 = _761.x;
    float _765 = _761.y;
    float _767 = _761.z;
    float _769 = _761.w;
    float2 _2810 = float2(_758, _742);
    float3 _773 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2810, float2(0.0), isnan(_2810)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2810, float2(0.0), isnan(_2810)), level(0.0)).xyz;
    float _775 = _773.x;
    float _777 = _773.y;
    float _779 = _773.z;
    float _781 = in.m_57.y;
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _785 = _656 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _787 = in.m_59.y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _791 = in.m_59.w;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _795 = _793 != 0;
    float _797 = in.m_59.x;
    float _799 = in.m_59.z;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _803 = in.m_57.x;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _807 = _805 != 0;
    float _809 = -_781;
    float _811 = _809 + 1.0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _815 = _813 != 0;
    float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _821 = _819 != 0;
    out.m_61.z = _164;
    bool _823 = _787 > 0.5;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _827 = _825 != 0;
    out.m_63.x = _440;
    out.m_63.y = _438;
    out.m_63.z = _442;
    bool _829 = _791 > 0.5;
    float _831 = _801 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _833 = _823 ? as_type<int>(_811) : as_type<int>(_781);
    float _835 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _837 = _829 ? as_type<int>(_811) : as_type<int>(_781);
    float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _841 = _795 ? as_type<float>(_833) : _781;
    float _843 = -_789;
    float _845 = fma(_835, 2.0, _843);
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _849 = _847 != 0;
    float _851 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _855 = _853 != 0;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _859 = _807 ? as_type<float>(_837) : _781;
    float _861 = fma(_851, _841, -0.5);
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _865 = _799 > 0.5;
    float _867 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _871 = fma(_859, _831, -0.5);
    float _873 = _781;
    float _875 = _811;
    float _877 = _851;
    bool _879 = _849;
    float _881 = _803;
    float _883 = _799;
    float _885 = _787;
    float _887 = _797;
    float _889 = _698;
    float _891 = _726;
    if (_849)
    {
        float _893 = _865 ? _811 : _781;
        _873 = _893;
    }
    float _895 = _873;
    float _897 = fma(_867, -2.0, _857);
    if (_855)
    {
        _875 = _797;
    }
    float _899 = _875;
    float _901 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    float _903 = _899;
    int _905 = as_type<int>(_901);
    if (!_855)
    {
        _903 = _799;
    }
    float _907 = _903;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _911 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _897);
    float _913 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _901);
    if (_821)
    {
        float _915 = -_803;
        float _917 = _915 + 1.0;
        _905 = as_type<int>(_917);
    }
    int _919 = _905;
    float _921 = _907 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _923 = 0.0;
    int _925 = as_type<int>(_921);
    if (!_821)
    {
        _923 = _803;
    }
    float _927 = _923;
    float _929 = -_911;
    float _931 = fma(_913, _861, _929);
    float _933 = _863 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _935 = -_909;
    float _937 = fma(_921, 2.0, _935);
    float _939 = _927;
    if (_815)
    {
        float _941 = -_803;
        float _943 = _941 + 1.0;
        _925 = as_type<int>(_943);
    }
    int _945 = _925;
    int _947 = _945;
    if (_821)
    {
        float _949 = _865 ? as_type<float>(_919) : _803;
        _939 = _949;
    }
    float _951 = _939;
    float _953 = fma(_933, _895, -0.5);
    float _955 = in.m_65.x;
    float _957 = in.m_65.y;
    float _959 = in.m_65.z;
    if (!_855)
    {
        _877 = _787;
    }
    float _961 = _877;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _965 = _961;
    if (_855)
    {
        _965 = _797;
    }
    float _967 = _965;
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _971 = _178 != 0.0;
    bool _973 = isnan(_178);
    bool _975 = _971 || _973;
    bool _977 = isnan(0.0);
    bool _979 = _975 || _977;
    float _981 = _839 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_815)
    {
        bool _983 = _797 > 0.5;
        _879 = _983;
    }
    bool _985 = _879;
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[83].z, _963);
    float _989 = _967 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _991 = 0.0;
    if (!_815)
    {
        _991 = _803;
    }
    float _993 = _991;
    float _995 = fma(_981, _951, -0.5);
    bool _997 = _176 == 0.0;
    bool _999 = !_979;
    bool _1001 = _997 && _999;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1005 = _993;
    if (_815)
    {
        float _1007 = _985 ? as_type<float>(_945) : _803;
        _1005 = _1007;
    }
    float _1009 = _1005;
    if (_827)
    {
        float _1011 = -_803;
        float _1013 = _1011 + 1.0;
        _947 = as_type<int>(_1013);
    }
    int _1015 = _947;
    bool _1017 = _164 == 0.0;
    bool _1019 = _1017 && _1001;
    float _1021 = -_1003;
    float _1023 = fma(_989, 2.0, _1021);
    float _1025 = _969 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_827)
    {
        float _1027 = _823 ? as_type<float>(_1015) : _803;
        _881 = _1027;
    }
    float _1029 = _881;
    float _1031 = -_130;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[76].x, _845);
    float _1035 = in.m_67.x;
    float _1037 = in.m_67.y;
    float _1039 = in.m_67.z;
    float _1041 = in.m_67.w;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1045 = 0.0;
    if (!_855)
    {
        _1045 = _799;
    }
    float _1047 = _1045;
    float _1049 = fma(_1025, _1029, -0.5);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1053 = _1047;
    float _1055 = _1051;
    if (_855)
    {
        _1053 = _787;
    }
    float _1057 = _1053;
    float _1059 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1043);
    float _1061 = 0.0;
    if (_1019)
    {
        _1061 = _955;
    }
    float _1063 = _1061;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1067 = 0.0;
    float _1069 = _1063;
    float _1071 = _1065;
    if (!_855)
    {
        _1067 = _799;
    }
    float _1073 = _1067;
    float _1075 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1051);
    float _1077 = _1073;
    if (_855)
    {
        _1077 = _787;
    }
    float _1079 = _1077;
    float _1081 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1065);
    if (_855)
    {
        _883 = _787;
    }
    float _1083 = _883;
    float _1085 = -_130;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[86].x, _937);
    float _1089 = _1083;
    if (_1019)
    {
        _1055 = _957;
    }
    float _1091 = _1055;
    float _1093 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1095 = _1091;
    if (_1019)
    {
        _885 = _1063;
    }
    float _1097 = _885;
    float _1099 = -_130;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1023);
    float _1103 = _1097;
    if (!_1019)
    {
        _1069 = _955;
    }
    float _1105 = _1069;
    float _1107 = exp2(_785);
    float _1109 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (!_1019)
    {
        float _1111 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1105);
        _1103 = _1111;
    }
    float _1113 = _1103;
    if (_1019)
    {
        _1071 = _1091;
    }
    float _1115 = _1071;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1119 = _1115;
    if (!_1019)
    {
        _1095 = _957;
    }
    float _1121 = _1095;
    float _1123 = _817 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1127 = fma(_1093, -2.0, _1117);
    float _1129 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1131 = fma(_1123, _1009, -0.5);
    float _1133 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1135 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1125);
    float _1137 = 0.0;
    if (_1019)
    {
        _1137 = _959;
    }
    float _1139 = _1137;
    float _1141 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1081);
    float _1143 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1133);
    float _1145 = _1139;
    if (!_855)
    {
        _1089 = _797;
    }
    float _1147 = _1089;
    float _1149 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1109);
    float _1151 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1129);
    float _1153 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1135);
    if (_1019)
    {
        _887 = _1139;
    }
    float _1155 = _887;
    float _1157 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1143);
    float _1159 = _1155;
    if (!_1019)
    {
        _1145 = _959;
    }
    float _1161 = _1145;
    float _1163 = fma(_1141, _1131, _1033);
    float _1165 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1149);
    float _1167 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1151);
    float _1169 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _987);
    float _1171 = fma(_1153, _1049, _1087);
    float _1173 = _1039 * _1105;
    if (!_1019)
    {
        float _1175 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1121);
        _1119 = _1175;
    }
    float _1177 = _1119;
    float _1179 = _1037 * _1161;
    float _1181 = fma(_1169, _995, _1101);
    out.m_69.x = _1157;
    out.m_69.y = _1165;
    out.m_69.z = _1167;
    float _1183 = -_1173;
    float _1185 = fma(_1035, _1161, _1183);
    float _1187 = _1035 * _1121;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1191 = -_1179;
    float _1193 = fma(_1039, _1121, _1191);
    float _1195 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1075);
    float _1197 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1127);
    float _1199 = -_1187;
    float _1201 = fma(_1037, _1105, _1199);
    float _1203 = _1185 * _1041;
    if (!_1019)
    {
        float _1205 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1161);
        _1159 = _1205;
    }
    float _1207 = _1159;
    float _1209 = -_1197;
    float _1211 = fma(_1195, _871, _1209);
    float _1213 = _1193 * _1041;
    float _1215 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1217 = _652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1219 = _1201 * _1041;
    float _1221 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1223 = fma(_1215, -2.0, _1189);
    float _1225 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1059);
    float _1227 = _1163 + 0.5;
    float _1229 = _1181 + 0.5;
    float _1231 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1223);
    float _1233 = _931 + 0.5;
    float _1235 = _1211 + 0.5;
    float _1237 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1217);
    float _1239 = fma(_1213, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1221);
    float _1241 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1243 = -_1107;
    float _1245 = _1243 + 1.0;
    float _1247 = -_1231;
    float _1249 = fma(_1225, _953, _1247);
    out.m_71.x = _1227;
    out.m_71.y = _1233;
    out.m_71.z = _1229;
    out.m_71.w = _1235;
    float _1251 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1237);
    float _1253 = fma(_1213, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1241);
    float _1255 = _1171 + 0.5;
    float _1257 = _1249 + 0.5;
    float _1259 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1251);
    float _1261 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1263 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1265 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1267 = _1259 + _698;
    out.m_73.x = _1255;
    out.m_73.y = _1257;
    float _1269 = fma(_1113, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1261);
    float _1271 = fma(_1113, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1263);
    float _1273 = fma(_1113, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1265);
    float _1275 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1239);
    float _1277 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1279 = _1267 * 0.5;
    float _1281 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1253);
    float _1283 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1271);
    float _1285 = -_1277;
    float _1287 = _1285 + 1.0;
    float _1289 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1269);
    float _1291 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1273);
    bool _1293 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1295 = isnan(_590);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1301 = _1297 || _1299;
    float _1303 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_75.z = _1279;
    out.m_75.w = _698;
    float _1305 = fma(_1213, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1303);
    out.m_77.x = _1289;
    out.m_77.y = _1283;
    out.m_77.z = _1291;
    float _1307 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1305);
    out.gl_Position.x = _724;
    out.gl_Position.y = _726;
    out.gl_Position.z = _1259;
    out.gl_Position.w = _698;
    out.m_79.x = _1275;
    out.m_79.y = _1281;
    out.m_79.z = _1307;
    float _1309 = _1275;
    float _1311 = _1259;
    float _1313 = _724;
    float _1315 = _1277;
    if (!_1301)
    {
        _889 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1317 = _889;
    float _1319 = _1317;
    float _1321 = _1317;
    if (!_1301)
    {
        _1309 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1323 = _1309;
    float _1325 = _1323;
    float _1327 = _1323;
    if (!_1301)
    {
        _1311 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1329 = _1311;
    float _1331 = _1329;
    float _1333 = _1329;
    if (!_1301)
    {
        _891 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1335 = _891;
    float _1337 = _1335;
    float _1339 = _1335;
    if (!_1301)
    {
        _1313 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1341 = _1313;
    float _1343 = _1277 * _754;
    float _1345 = _1341;
    float _1347 = _1341;
    if (!_1301)
    {
        _1315 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1349 = _1315;
    float _1351 = _769 * _1343;
    float _1353 = _769 * _1287;
    float _1355 = _779 * _1343;
    float _1357 = fma(_775, _1351, _763);
    float _1359 = fma(_777, _1351, _765);
    float _1361 = fma(_769, _1355, _767);
    out.m_81.x = _1357;
    out.m_81.y = _1359;
    out.m_81.z = _1361;
    out.m_81.w = _1353;
    bool _1363 = !_1301;
    float _1365 = _1349;
    float _1367 = _1349;
    if (!_1363)
    {
        bool _1369 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1371 = isnan(_590);
        bool _1373 = _1369 || _1371;
        bool _1375 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1377 = _1373 || _1375;
        if (!_1377)
        {
            float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1381 = _590 + _1379;
            float _1383 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1385 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1383;
            float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1389 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1391 = 1.0 / _1385;
            float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1399 = _1397 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1403 = _1401 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1407 = _1405 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1409 = _1381 * _1391;
            float _1411 = precise::clamp(_1409, 0.0, 1.0);
            float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1415 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1417 = fma(_1411, _1389, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1419 = fma(_1411, _1415, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1421 = fma(_1411, _1395, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1423 = fma(_1411, _1399, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1425 = fma(_1411, _1403, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1427 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1327 = _1421;
            _1339 = _1425;
            _1367 = _1417;
            _1333 = _1423;
            _1321 = _1419;
            _1347 = _1427;
            _1429 = true;
        }
        else
        {
            bool _1431 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1433 = isnan(_590);
            bool _1435 = _1431 || _1433;
            bool _1437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1439 = _1435 || _1437;
            if (!_1439)
            {
                _1365 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1441 = _1365;
            _1367 = _1441;
            if (!_1439)
            {
                _1325 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1443 = _1325;
            _1327 = _1443;
            if (!_1439)
            {
                _1319 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1445 = _1319;
            _1321 = _1445;
            if (!_1439)
            {
                _1331 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1447 = _1331;
            _1333 = _1447;
            if (!_1439)
            {
                _1337 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1449 = _1337;
            _1339 = _1449;
            if (!_1439)
            {
                _1345 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1451 = _1345;
            bool _1453 = !_1439;
            _1347 = _1451;
            if (!_1453)
            {
                bool _1455 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1457 = isnan(_590);
                bool _1459 = _1455 || _1457;
                bool _1461 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1463 = _1459 || _1461;
                if (!_1463)
                {
                    float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1467 = _590 + _1465;
                    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1469;
                    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1475 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1477 = 1.0 / _1471;
                    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1485 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1489 = _1487 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1493 = _1491 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1495 = _1467 * _1477;
                    float _1497 = precise::clamp(_1495, 0.0, 1.0);
                    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1501 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1503 = fma(_1497, _1475, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1505 = fma(_1497, _1501, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1507 = fma(_1497, _1481, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1509 = fma(_1497, _1485, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1511 = fma(_1497, _1489, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1513 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1327 = _1507;
                    _1339 = _1511;
                    _1367 = _1503;
                    _1333 = _1509;
                    _1321 = _1505;
                    _1347 = _1513;
                    _1429 = true;
                }
                else
                {
                    _1327 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1339 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1367 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1333 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1321 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1347 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1429 = false;
    float _1515 = _1327;
    float _1517 = _1339;
    float _1519 = _1367;
    float _1521 = _1333;
    float _1523 = _1321;
    float _1525 = _1347;
    float _1527 = fma(_1283, -0.5, 0.5);
    float _1529 = precise::clamp(_1527, 0.0, 1.0);
    float _1531 = -_1515;
    float _1533 = _1531 + _1517;
    float _1535 = -_1519;
    float _1537 = _1535 + _1521;
    float _1539 = -_1523;
    float _1541 = _1539 + _1525;
    bool _1543 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1545 = fma(_1529, _1533, _1515);
    float _1547 = fma(_1529, _1537, _1519);
    float _1549 = fma(_1529, _1541, _1523);
    float _1551 = _1545 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1553 = fma(_1547, 0.298911988735198974609375, _1551);
    float _1555 = fma(_1549, 0.114477999508380889892578125, _1553);
    float _1557 = -_1555;
    float _1559 = _1547 + _1557;
    float _1561 = -_1555;
    float _1563 = _1545 + _1561;
    float _1565 = -_1555;
    float _1567 = _1549 + _1565;
    float _1569 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1571 = fma(_1559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1555);
    float _1573 = fma(_1563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1555);
    float _1575 = fma(_1567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1555);
    out.m_47.x = _1569;
    out.m_85.x = _1571;
    out.m_85.y = _1573;
    out.m_85.z = _1575;
    if (!_1543)
    {
        return out;
    }
    float _1577 = -_438;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1581 = -_440;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1585 = -_442;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1589 = _1579 * _1579;
    float _1591 = fma(_1583, _1583, _1589);
    float _1593 = fma(_1587, _1587, _1591);
    float _1595 = sqrt(_1593);
    float _1597 = rsqrt(_1593);
    float _1599 = -_1595;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1603 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1605 = precise::clamp(_1603, 0.0, 1.0);
    float _1607 = _1583 * _1597;
    float _1609 = _1579 * _1597;
    float _1611 = abs(_1605);
    float _1613 = log2(_1611);
    float _1615 = _1587 * _1597;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1619 = _1283 * _1609;
    float _1621 = -_1609;
    float _1623 = -_1617;
    float _1625 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1623);
    float _1627 = fma(_1289, _1607, _1619);
    float _1629 = -_1615;
    float _1631 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1625);
    float _1633 = fma(_1291, _1615, _1627);
    float _1635 = precise::clamp(_1633, 0.0, 1.0);
    float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1639 = _1631 + _1637;
    float _1641 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = exp2(_1641);
    float _1649 = _1647 * _1645;
    float _1651 = _1635 * _1649;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1655 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1657 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1653;
    out.m_83.y = _1655;
    out.m_83.z = _1657;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1429 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1712 = as_type<float>(_120);
        out.gl_Position.z = _1712;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_49.w;
    float _124 = float(_104);
    float _126 = 1.0 / _124;
    float _128 = -_122;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_122);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = _130 * _126;
    bool _144 = _130 >= _124;
    bool _146 = !_140;
    bool _148 = _144 || _146;
    out.m_51.x = _142;
    float _150 = _122;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    int _154 = 0;
    if (_148)
    {
        float _156 = _152 * 5.0;
        _154 = as_type<int>(_156);
    }
    int _158 = _154;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1783 = as_type<float>(_158);
        out.gl_Position.z = _1783;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_53.w;
    float _162 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = in.m_55.z;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_49.x;
    float _182 = in.m_49.y;
    float _184 = in.m_49.z;
    float _186 = in.m_44.x;
    float _188 = in.m_44.y;
    float _190 = in.m_44.z;
    float _192 = _162;
    if (!_174)
    {
        float _194 = _162 * _162;
        float _196 = _194 * 0.5;
        _112 = _196;
    }
    float _198 = _112;
    float _200 = in.m_53.x;
    float _202 = in.m_53.y;
    float _204 = in.m_53.z;
    float _206 = _198;
    if (!_174)
    {
        float _208 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    bool _212 = !_174;
    float _214 = _210;
    if (!_212)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _162 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _162);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _244;
    }
    float _246 = _214;
    bool _248 = !_174;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _162 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _192 = _268;
    }
    float _270 = _192;
    float _272 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _178);
    float _278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    float _280 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _282 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _286 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = _278 * _280;
    float _290 = fma(_270, _182, _282);
    float _292 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _294 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = _276 * _284;
    float _298 = fma(_290, _160, _188);
    float _300 = fma(_270, _180, _292);
    float _302 = fma(_270, _184, _294);
    float _304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _306 = _286 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _308 = fma(_300, _160, _186);
    float _310 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _312 = fma(_302, _160, _190);
    float _314 = _296 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _316 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _310);
    float _320 = _296 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _322 = _304 * _306;
    float _324 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[10].x, _314);
    float _326 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _316);
    float _328 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[6].z, _318);
    float _330 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _332 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[10].z, _324);
    float _334 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[4].z, _326);
    float _336 = _328 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[8].z, _330);
    float _340 = _296 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _342 = _334 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _344 = _332 + _336;
    float _346 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[9].x, _340);
    float _348 = _338 + _342;
    float _350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _352 = _344 + _350;
    float _354 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[9].z, _346);
    float _356 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _358 = _348 + _356;
    float _360 = _352 * _352;
    float _362 = fma(_358, _358, _360);
    float _364 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _366 = sqrt(_362);
    float _368 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _364);
    float _370 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[5].z, _368);
    float _372 = _370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _374 = _354 + _372;
    bool _376 = _366 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _378 = _370;
    float _380 = _348;
    float _382 = _372;
    float _384 = _340;
    float _386 = _306;
    if (!_376)
    {
        _378 = _348;
    }
    float _388 = _378;
    float _390 = _388;
    if (!_376)
    {
        _380 = _344;
    }
    float _392 = _380;
    float _394 = _392;
    if (!_376)
    {
        _382 = _374;
    }
    float _396 = _382;
    bool _398 = !_376;
    float _400 = _396;
    if (!_398)
    {
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _404 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _406 = _366 + _404;
        float _408 = rsqrt(_362);
        float _410 = _406 * _402;
        float _412 = _374 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = _410 * 0.15915493667125701904296875;
        float _416 = _414 * 6.283185482025146484375;
        float _418 = cos(_416);
        float _420 = _414 * 6.283185482025146484375;
        float _422 = sin(_420);
        float _424 = _418 + (-1.0);
        float _426 = _424 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _428 = fma(_422, _412, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _430 = fma(_374, _418, _426);
        float _432 = _408 * _428;
        float _434 = fma(_358, _432, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _436 = fma(_352, _432, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _400 = _430;
        _390 = _434;
        _394 = _436;
    }
    float _438 = _400;
    float _440 = _390;
    float _442 = _394;
    float _444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _446 = _438 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _450 = _440 + _448;
    float _452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _454 = _442 + _452;
    float _456 = _446 * _446;
    float _458 = fma(_450, _450, _456);
    float _460 = fma(_454, _454, _458);
    float _462 = rsqrt(_460);
    float _464 = _462 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _466 = _450 * _464;
    float _468 = _454 * _464;
    float _470 = _466 * _466;
    float _472 = _468 * _468;
    float _474 = _470 + _472;
    float _476 = sqrt(_474);
    bool _478 = _476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _482 = _476 + _480;
    float _484 = _462;
    float _486 = _474;
    float _488 = _482;
    float _490 = _446;
    float _492 = _464;
    if (_478)
    {
        float _494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _484 = _494;
    }
    float _496 = _484;
    if (_478)
    {
        float _498 = rsqrt(_474);
        _486 = _498;
    }
    float _500 = _486;
    float _502 = _500;
    if (_478)
    {
        float _504 = _482 * _496;
        _488 = _504;
    }
    float _506 = _488;
    if (_478)
    {
        float _508 = _506 * 0.15915493667125701904296875;
        _384 = _508;
    }
    float _510 = _384;
    float _512 = _454;
    if (_478)
    {
        float _514 = _510 * 6.283185482025146484375;
        float _516 = sin(_514);
        _512 = _516;
    }
    float _518 = _512;
    float _520 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _522 = precise::max(0.0, _520);
    float _524 = _374;
    float _526 = _522;
    float _528 = _520;
    if (_478)
    {
        float _530 = _510 * 6.283185482025146484375;
        float _532 = cos(_530);
        _524 = _532;
    }
    float _534 = _524;
    float _536 = -_464;
    float _538 = -_522;
    float _540 = fma(_446, _536, _538);
    if (!_478)
    {
        _490 = _468;
    }
    float _542 = _490;
    float _544 = _542;
    if (_478)
    {
        float _546 = _540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _526 = _546;
    }
    float _548 = _526;
    float _550 = _438 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _552 = _518;
    float _554 = _548;
    if (_478)
    {
        float _556 = fma(_518, _548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _552 = _556;
    }
    float _558 = _552;
    float _560 = _558;
    if (!_478)
    {
        _554 = _466;
    }
    float _562 = _554;
    float _564 = _562;
    float _566 = _534;
    if (_478)
    {
        float _568 = _534 + (-1.0);
        _528 = _568;
    }
    float _570 = _528;
    if (_478)
    {
        float _572 = _500 * _558;
        _386 = _572;
    }
    float _574 = _386;
    if (!_478)
    {
        _560 = _540;
    }
    float _576 = _560;
    float _578 = _576;
    if (_478)
    {
        float _580 = _570 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _492 = _580;
    }
    float _582 = _492;
    if (_478)
    {
        float _584 = _466 * _574;
        _564 = _584;
    }
    float _586 = _564;
    if (!_478)
    {
        _502 = _470;
    }
    float _588 = _502;
    float _590 = sqrt(_460);
    float _592 = _588;
    if (_478)
    {
        float _594 = fma(_540, _534, _582);
        _578 = _594;
    }
    float _596 = _578;
    if (_478)
    {
        float _598 = _468 * _574;
        _544 = _598;
    }
    float _600 = _544;
    if (_478)
    {
        float _602 = _586 * _586;
        _592 = _602;
    }
    float _604 = _592;
    if (!_478)
    {
        _566 = _472;
    }
    float _606 = _566;
    float _608 = _606;
    if (_478)
    {
        float _610 = _600 * _600;
        _608 = _610;
    }
    float _612 = _608;
    float _614 = fma(_596, _596, _604);
    float _616 = _614 + _612;
    float _618 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[2].x, _550);
    float _620 = _438 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _622 = rsqrt(_616);
    float _624 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[2].z, _618);
    float _626 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _628 = fma(_590, (*spvDescriptorSet0.vp_c15)._m0[23].w, _626);
    float _630 = precise::clamp(_628, 0.0, 1.0);
    float _632 = _438 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _634 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[1].x, _620);
    float _636 = _624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _638 = -_630;
    float _640 = _638 + 1.0;
    float _642 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[0].x, _632);
    float _644 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[1].z, _634);
    float _646 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _648 = _636 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _650 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[0].z, _642);
    float _652 = _644 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _654 = abs(_640);
    float _656 = log2(_654);
    float _658 = _438 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _660 = -_648;
    float _662 = fma(_660, _646, 1.0);
    float _664 = _650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _666 = _652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _668 = _622 * _586;
    float _670 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[3].x, _658);
    float _672 = _622 * _596;
    float _674 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[7].x, _666);
    float _676 = _668 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _678 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[3].z, _670);
    float _680 = _622 * _600;
    float _682 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[7].z, _674);
    float _684 = -_676;
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].y, _684);
    float _688 = _678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = log2(_662);
    float _692 = _656 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _694 = -_680;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c15)._m0[21].z, _686);
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _682);
    float _700 = _652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _702 = _652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _704 = fma(_696, -0.5, 0.5);
    float _706 = fma(_696, 0.5, 0.5);
    float _708 = exp2(_692);
    float _710 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[4].x, _700);
    float _712 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[5].x, _702);
    float _714 = _672 + 1.0;
    float _716 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[4].z, _710);
    float _718 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[5].z, _712);
    float _720 = 1.0 / _698;
    float _722 = fma(_706, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _724 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _716);
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _718);
    float _728 = _690 * 0.693147182464599609375;
    float _730 = fma(_706, _722, -0.212114393711090087890625);
    float _732 = sqrt(_704);
    float _734 = -_672;
    float _736 = fma(_708, _714, _734);
    float _738 = fma(_706, _730, 1.570728778839111328125);
    float _740 = _728 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _742 = fma(_736, 0.5, 0.5);
    float _744 = _724 * _720;
    float _746 = _726 * _720;
    float _748 = fma(_744, 0.5, 0.5);
    float _750 = fma(_746, -0.5, 0.5);
    float _752 = _732 * 0.636619746685028076171875;
    float3 _2777 = float3(_748, _750, _740);
    float _754 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2777, float3(0.0), isnan(_2777)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2777, float3(0.0), isnan(_2777)), level(0.0)).x;
    float _756 = -_738;
    float _758 = fma(_752, _756, 1.0);
    float3 _2793 = float3(_748, _750, _740);
    float4 _761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2793, float3(0.0), isnan(_2793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2793, float3(0.0), isnan(_2793)), level(0.0)).xyzw;
    float _763 = _761.x;
    float _765 = _761.y;
    float _767 = _761.z;
    float _769 = _761.w;
    float2 _2810 = float2(_758, _742);
    float3 _773 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2810, float2(0.0), isnan(_2810)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2810, float2(0.0), isnan(_2810)), level(0.0)).xyz;
    float _775 = _773.x;
    float _777 = _773.y;
    float _779 = _773.z;
    float _781 = in.m_57.y;
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _785 = _656 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _787 = in.m_59.y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _791 = in.m_59.w;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _795 = _793 != 0;
    float _797 = in.m_59.x;
    float _799 = in.m_59.z;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _803 = in.m_57.x;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _807 = _805 != 0;
    float _809 = -_781;
    float _811 = _809 + 1.0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _815 = _813 != 0;
    float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _821 = _819 != 0;
    out.m_61.z = _164;
    bool _823 = _787 > 0.5;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _827 = _825 != 0;
    out.m_63.x = _440;
    out.m_63.y = _438;
    out.m_63.z = _442;
    bool _829 = _791 > 0.5;
    float _831 = _801 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _833 = _823 ? as_type<int>(_811) : as_type<int>(_781);
    float _835 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _837 = _829 ? as_type<int>(_811) : as_type<int>(_781);
    float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _841 = _795 ? as_type<float>(_833) : _781;
    float _843 = -_789;
    float _845 = fma(_835, 2.0, _843);
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _849 = _847 != 0;
    float _851 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _855 = _853 != 0;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _859 = _807 ? as_type<float>(_837) : _781;
    float _861 = fma(_851, _841, -0.5);
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _865 = _799 > 0.5;
    float _867 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _871 = fma(_859, _831, -0.5);
    float _873 = _781;
    float _875 = _811;
    float _877 = _851;
    bool _879 = _849;
    float _881 = _803;
    float _883 = _799;
    float _885 = _787;
    float _887 = _797;
    float _889 = _698;
    float _891 = _726;
    if (_849)
    {
        float _893 = _865 ? _811 : _781;
        _873 = _893;
    }
    float _895 = _873;
    float _897 = fma(_867, -2.0, _857);
    if (_855)
    {
        _875 = _797;
    }
    float _899 = _875;
    float _901 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    float _903 = _899;
    int _905 = as_type<int>(_901);
    if (!_855)
    {
        _903 = _799;
    }
    float _907 = _903;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _911 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _897);
    float _913 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _901);
    if (_821)
    {
        float _915 = -_803;
        float _917 = _915 + 1.0;
        _905 = as_type<int>(_917);
    }
    int _919 = _905;
    float _921 = _907 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _923 = 0.0;
    int _925 = as_type<int>(_921);
    if (!_821)
    {
        _923 = _803;
    }
    float _927 = _923;
    float _929 = -_911;
    float _931 = fma(_913, _861, _929);
    float _933 = _863 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _935 = -_909;
    float _937 = fma(_921, 2.0, _935);
    float _939 = _927;
    if (_815)
    {
        float _941 = -_803;
        float _943 = _941 + 1.0;
        _925 = as_type<int>(_943);
    }
    int _945 = _925;
    int _947 = _945;
    if (_821)
    {
        float _949 = _865 ? as_type<float>(_919) : _803;
        _939 = _949;
    }
    float _951 = _939;
    float _953 = fma(_933, _895, -0.5);
    float _955 = in.m_65.x;
    float _957 = in.m_65.y;
    float _959 = in.m_65.z;
    if (!_855)
    {
        _877 = _787;
    }
    float _961 = _877;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _965 = _961;
    if (_855)
    {
        _965 = _797;
    }
    float _967 = _965;
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _971 = _178 != 0.0;
    bool _973 = isnan(_178);
    bool _975 = _971 || _973;
    bool _977 = isnan(0.0);
    bool _979 = _975 || _977;
    float _981 = _839 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_815)
    {
        bool _983 = _797 > 0.5;
        _879 = _983;
    }
    bool _985 = _879;
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[83].z, _963);
    float _989 = _967 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _991 = 0.0;
    if (!_815)
    {
        _991 = _803;
    }
    float _993 = _991;
    float _995 = fma(_981, _951, -0.5);
    bool _997 = _176 == 0.0;
    bool _999 = !_979;
    bool _1001 = _997 && _999;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1005 = _993;
    if (_815)
    {
        float _1007 = _985 ? as_type<float>(_945) : _803;
        _1005 = _1007;
    }
    float _1009 = _1005;
    if (_827)
    {
        float _1011 = -_803;
        float _1013 = _1011 + 1.0;
        _947 = as_type<int>(_1013);
    }
    int _1015 = _947;
    bool _1017 = _164 == 0.0;
    bool _1019 = _1017 && _1001;
    float _1021 = -_1003;
    float _1023 = fma(_989, 2.0, _1021);
    float _1025 = _969 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_827)
    {
        float _1027 = _823 ? as_type<float>(_1015) : _803;
        _881 = _1027;
    }
    float _1029 = _881;
    float _1031 = -_130;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[76].x, _845);
    float _1035 = in.m_67.x;
    float _1037 = in.m_67.y;
    float _1039 = in.m_67.z;
    float _1041 = in.m_67.w;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1045 = 0.0;
    if (!_855)
    {
        _1045 = _799;
    }
    float _1047 = _1045;
    float _1049 = fma(_1025, _1029, -0.5);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1053 = _1047;
    float _1055 = _1051;
    if (_855)
    {
        _1053 = _787;
    }
    float _1057 = _1053;
    float _1059 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1043);
    float _1061 = 0.0;
    if (_1019)
    {
        _1061 = _955;
    }
    float _1063 = _1061;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1067 = 0.0;
    float _1069 = _1063;
    float _1071 = _1065;
    if (!_855)
    {
        _1067 = _799;
    }
    float _1073 = _1067;
    float _1075 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1051);
    float _1077 = _1073;
    if (_855)
    {
        _1077 = _787;
    }
    float _1079 = _1077;
    float _1081 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1065);
    if (_855)
    {
        _883 = _787;
    }
    float _1083 = _883;
    float _1085 = -_130;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[86].x, _937);
    float _1089 = _1083;
    if (_1019)
    {
        _1055 = _957;
    }
    float _1091 = _1055;
    float _1093 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1095 = _1091;
    if (_1019)
    {
        _885 = _1063;
    }
    float _1097 = _885;
    float _1099 = -_130;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1023);
    float _1103 = _1097;
    if (!_1019)
    {
        _1069 = _955;
    }
    float _1105 = _1069;
    float _1107 = exp2(_785);
    float _1109 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (!_1019)
    {
        float _1111 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1105);
        _1103 = _1111;
    }
    float _1113 = _1103;
    if (_1019)
    {
        _1071 = _1091;
    }
    float _1115 = _1071;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1119 = _1115;
    if (!_1019)
    {
        _1095 = _957;
    }
    float _1121 = _1095;
    float _1123 = _817 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1127 = fma(_1093, -2.0, _1117);
    float _1129 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1131 = fma(_1123, _1009, -0.5);
    float _1133 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1135 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1125);
    float _1137 = 0.0;
    if (_1019)
    {
        _1137 = _959;
    }
    float _1139 = _1137;
    float _1141 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1081);
    float _1143 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1133);
    float _1145 = _1139;
    if (!_855)
    {
        _1089 = _797;
    }
    float _1147 = _1089;
    float _1149 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1109);
    float _1151 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1129);
    float _1153 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1135);
    if (_1019)
    {
        _887 = _1139;
    }
    float _1155 = _887;
    float _1157 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1143);
    float _1159 = _1155;
    if (!_1019)
    {
        _1145 = _959;
    }
    float _1161 = _1145;
    float _1163 = fma(_1141, _1131, _1033);
    float _1165 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1149);
    float _1167 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1151);
    float _1169 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _987);
    float _1171 = fma(_1153, _1049, _1087);
    float _1173 = _1039 * _1105;
    if (!_1019)
    {
        float _1175 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1121);
        _1119 = _1175;
    }
    float _1177 = _1119;
    float _1179 = _1037 * _1161;
    float _1181 = fma(_1169, _995, _1101);
    out.m_69.x = _1157;
    out.m_69.y = _1165;
    out.m_69.z = _1167;
    float _1183 = -_1173;
    float _1185 = fma(_1035, _1161, _1183);
    float _1187 = _1035 * _1121;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1191 = -_1179;
    float _1193 = fma(_1039, _1121, _1191);
    float _1195 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1075);
    float _1197 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1127);
    float _1199 = -_1187;
    float _1201 = fma(_1037, _1105, _1199);
    float _1203 = _1185 * _1041;
    if (!_1019)
    {
        float _1205 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1161);
        _1159 = _1205;
    }
    float _1207 = _1159;
    float _1209 = -_1197;
    float _1211 = fma(_1195, _871, _1209);
    float _1213 = _1193 * _1041;
    float _1215 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1217 = _652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1219 = _1201 * _1041;
    float _1221 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1223 = fma(_1215, -2.0, _1189);
    float _1225 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1059);
    float _1227 = _1163 + 0.5;
    float _1229 = _1181 + 0.5;
    float _1231 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1223);
    float _1233 = _931 + 0.5;
    float _1235 = _1211 + 0.5;
    float _1237 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1217);
    float _1239 = fma(_1213, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1221);
    float _1241 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1243 = -_1107;
    float _1245 = _1243 + 1.0;
    float _1247 = -_1231;
    float _1249 = fma(_1225, _953, _1247);
    out.m_71.x = _1227;
    out.m_71.y = _1233;
    out.m_71.z = _1229;
    out.m_71.w = _1235;
    float _1251 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1237);
    float _1253 = fma(_1213, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1241);
    float _1255 = _1171 + 0.5;
    float _1257 = _1249 + 0.5;
    float _1259 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1251);
    float _1261 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1263 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1265 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1267 = _1259 + _698;
    out.m_73.x = _1255;
    out.m_73.y = _1257;
    float _1269 = fma(_1113, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1261);
    float _1271 = fma(_1113, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1263);
    float _1273 = fma(_1113, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1265);
    float _1275 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1239);
    float _1277 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1279 = _1267 * 0.5;
    float _1281 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1253);
    float _1283 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1271);
    float _1285 = -_1277;
    float _1287 = _1285 + 1.0;
    float _1289 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1269);
    float _1291 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1273);
    bool _1293 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1295 = isnan(_590);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1301 = _1297 || _1299;
    float _1303 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_75.z = _1279;
    out.m_75.w = _698;
    float _1305 = fma(_1213, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1303);
    out.m_77.x = _1289;
    out.m_77.y = _1283;
    out.m_77.z = _1291;
    float _1307 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1305);
    out.gl_Position.x = _724;
    out.gl_Position.y = _726;
    out.gl_Position.z = _1259;
    out.gl_Position.w = _698;
    out.m_79.x = _1275;
    out.m_79.y = _1281;
    out.m_79.z = _1307;
    float _1309 = _1275;
    float _1311 = _1259;
    float _1313 = _724;
    float _1315 = _1277;
    if (!_1301)
    {
        _889 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1317 = _889;
    float _1319 = _1317;
    float _1321 = _1317;
    if (!_1301)
    {
        _1309 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1323 = _1309;
    float _1325 = _1323;
    float _1327 = _1323;
    if (!_1301)
    {
        _1311 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1329 = _1311;
    float _1331 = _1329;
    float _1333 = _1329;
    if (!_1301)
    {
        _891 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1335 = _891;
    float _1337 = _1335;
    float _1339 = _1335;
    if (!_1301)
    {
        _1313 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1341 = _1313;
    float _1343 = _1277 * _754;
    float _1345 = _1341;
    float _1347 = _1341;
    if (!_1301)
    {
        _1315 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1349 = _1315;
    float _1351 = _769 * _1343;
    float _1353 = _769 * _1287;
    float _1355 = _779 * _1343;
    float _1357 = fma(_775, _1351, _763);
    float _1359 = fma(_777, _1351, _765);
    float _1361 = fma(_769, _1355, _767);
    out.m_81.x = _1357;
    out.m_81.y = _1359;
    out.m_81.z = _1361;
    out.m_81.w = _1353;
    bool _1363 = !_1301;
    float _1365 = _1349;
    float _1367 = _1349;
    if (!_1363)
    {
        bool _1369 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1371 = isnan(_590);
        bool _1373 = _1369 || _1371;
        bool _1375 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1377 = _1373 || _1375;
        if (!_1377)
        {
            float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1381 = _590 + _1379;
            float _1383 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1385 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1383;
            float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1389 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1391 = 1.0 / _1385;
            float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1399 = _1397 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1403 = _1401 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1407 = _1405 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1409 = _1381 * _1391;
            float _1411 = precise::clamp(_1409, 0.0, 1.0);
            float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1415 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1417 = fma(_1411, _1389, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1419 = fma(_1411, _1415, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1421 = fma(_1411, _1395, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1423 = fma(_1411, _1399, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1425 = fma(_1411, _1403, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1427 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1327 = _1421;
            _1339 = _1425;
            _1367 = _1417;
            _1333 = _1423;
            _1321 = _1419;
            _1347 = _1427;
            _1429 = true;
        }
        else
        {
            bool _1431 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1433 = isnan(_590);
            bool _1435 = _1431 || _1433;
            bool _1437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1439 = _1435 || _1437;
            if (!_1439)
            {
                _1365 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1441 = _1365;
            _1367 = _1441;
            if (!_1439)
            {
                _1325 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1443 = _1325;
            _1327 = _1443;
            if (!_1439)
            {
                _1319 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1445 = _1319;
            _1321 = _1445;
            if (!_1439)
            {
                _1331 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1447 = _1331;
            _1333 = _1447;
            if (!_1439)
            {
                _1337 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1449 = _1337;
            _1339 = _1449;
            if (!_1439)
            {
                _1345 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1451 = _1345;
            bool _1453 = !_1439;
            _1347 = _1451;
            if (!_1453)
            {
                bool _1455 = _590 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1457 = isnan(_590);
                bool _1459 = _1455 || _1457;
                bool _1461 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1463 = _1459 || _1461;
                if (!_1463)
                {
                    float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1467 = _590 + _1465;
                    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1469;
                    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1475 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1477 = 1.0 / _1471;
                    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1485 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1489 = _1487 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1493 = _1491 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1495 = _1467 * _1477;
                    float _1497 = precise::clamp(_1495, 0.0, 1.0);
                    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1501 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1503 = fma(_1497, _1475, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1505 = fma(_1497, _1501, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1507 = fma(_1497, _1481, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1509 = fma(_1497, _1485, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1511 = fma(_1497, _1489, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1513 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1327 = _1507;
                    _1339 = _1511;
                    _1367 = _1503;
                    _1333 = _1509;
                    _1321 = _1505;
                    _1347 = _1513;
                    _1429 = true;
                }
                else
                {
                    _1327 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1339 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1367 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1333 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1321 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1347 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1429 = false;
    float _1515 = _1327;
    float _1517 = _1339;
    float _1519 = _1367;
    float _1521 = _1333;
    float _1523 = _1321;
    float _1525 = _1347;
    float _1527 = fma(_1283, -0.5, 0.5);
    float _1529 = precise::clamp(_1527, 0.0, 1.0);
    float _1531 = -_1515;
    float _1533 = _1531 + _1517;
    float _1535 = -_1519;
    float _1537 = _1535 + _1521;
    float _1539 = -_1523;
    float _1541 = _1539 + _1525;
    bool _1543 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1545 = fma(_1529, _1533, _1515);
    float _1547 = fma(_1529, _1537, _1519);
    float _1549 = fma(_1529, _1541, _1523);
    float _1551 = _1545 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1553 = fma(_1547, 0.298911988735198974609375, _1551);
    float _1555 = fma(_1549, 0.114477999508380889892578125, _1553);
    float _1557 = -_1555;
    float _1559 = _1547 + _1557;
    float _1561 = -_1555;
    float _1563 = _1545 + _1561;
    float _1565 = -_1555;
    float _1567 = _1549 + _1565;
    float _1569 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1571 = fma(_1559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1555);
    float _1573 = fma(_1563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1555);
    float _1575 = fma(_1567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1555);
    out.m_47.x = _1569;
    out.m_85.x = _1571;
    out.m_85.y = _1573;
    out.m_85.z = _1575;
    if (!_1543)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1577 = -_438;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1581 = -_440;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1585 = -_442;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1589 = _1579 * _1579;
    float _1591 = fma(_1583, _1583, _1589);
    float _1593 = fma(_1587, _1587, _1591);
    float _1595 = sqrt(_1593);
    float _1597 = rsqrt(_1593);
    float _1599 = -_1595;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1603 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1605 = precise::clamp(_1603, 0.0, 1.0);
    float _1607 = _1583 * _1597;
    float _1609 = _1579 * _1597;
    float _1611 = abs(_1605);
    float _1613 = log2(_1611);
    float _1615 = _1587 * _1597;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1619 = _1283 * _1609;
    float _1621 = -_1609;
    float _1623 = -_1617;
    float _1625 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1623);
    float _1627 = fma(_1289, _1607, _1619);
    float _1629 = -_1615;
    float _1631 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1625);
    float _1633 = fma(_1291, _1615, _1627);
    float _1635 = precise::clamp(_1633, 0.0, 1.0);
    float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1639 = _1631 + _1637;
    float _1641 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = exp2(_1641);
    float _1649 = _1647 * _1645;
    float _1651 = _1635 * _1649;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1655 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1657 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1653;
    out.m_83.y = _1655;
    out.m_83.z = _1657;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

