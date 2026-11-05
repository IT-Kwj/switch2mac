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
    float4 m_71 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_75 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_61 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_63 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _662 = false;
    bool _538 = false;
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
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2086 = as_type<float>(_110);
        out.gl_Position.z = _2086;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2155 = as_type<float>(_148);
        out.gl_Position.z = _2155;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = in.m_51.x;
    float _162 = in.m_51.y;
    float _164 = in.m_51.z;
    float _166 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_55.x;
    float _186 = _158 * _156;
    float _188 = 0.0;
    float _190 = _166;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_176)
    {
        float _194 = _166 * _166;
        float _196 = _194 * 0.5;
        _188 = _196;
    }
    float _198 = _188;
    float _200 = _150 * _150;
    float _202 = _152 * _152;
    float _204 = _154 * _154;
    float _206 = _198;
    if (!_176)
    {
        float _208 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    float _212 = fma(_160, _160, _200);
    float _214 = fma(_162, _162, _202);
    float _216 = fma(_164, _164, _204);
    float _218 = fma(_178, _178, _212);
    float _220 = fma(_180, _180, _214);
    float _222 = fma(_182, _182, _216);
    float _224 = sqrt(_218);
    float _226 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[20].x, _186);
    float _228 = sqrt(_220);
    float _230 = sqrt(_222);
    bool _232 = _224 > 0.0;
    bool _234 = _228 > 0.0;
    float _236 = floor(_226);
    int _238 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _240 = _238 != 0;
    bool _242 = _230 > 0.0;
    float _244 = _156;
    float _246 = _230;
    float _248 = _210;
    if (_232)
    {
        float _250 = rsqrt(_218);
        _244 = _250;
    }
    float _252 = _244;
    float _254 = 0.0;
    if (!_232)
    {
        _254 = 0.0;
    }
    float _256 = _254;
    float _258 = 0.0;
    float _260 = _256;
    if (!_232)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _262;
    if (!_232)
    {
        _246 = 0.0;
    }
    float _266 = _246;
    float _268 = _224;
    float _270 = _266;
    if (_234)
    {
        float _272 = rsqrt(_220);
        _268 = _272;
    }
    float _274 = _268;
    float _276 = -_236;
    float _278 = _226 + _276;
    float _280 = _226 * 6.283185482025146484375;
    float _282 = 0.0;
    if (_242)
    {
        float _284 = rsqrt(_222);
        _282 = _284;
    }
    float _286 = _282;
    bool _288 = !_176;
    if (!_288)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _166 * _292;
        float _302 = 1.0 / _296;
        float _304 = _298 * 0.693147182464599609375;
        float _306 = exp2(_300);
        float _308 = 1.0 / _304;
        float _310 = _306 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _308, _166);
        float _316 = _314 * _302;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _318;
    }
    float _320 = _248;
    bool _322 = !_176;
    if (!_322)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _166 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _190 = _342;
        _192 = _330;
    }
    float _344 = _190;
    float _346 = _192;
    float _348 = _280 * 0.15915493667125701904296875;
    float _350 = in.m_47.x;
    float _352 = in.m_47.y;
    float _354 = in.m_47.z;
    float _356 = 0.0;
    float _358 = 0.0;
    float _360 = _346;
    if (!_234)
    {
        _356 = 0.0;
        _358 = 0.0;
    }
    float _362 = _356;
    float _364 = _358;
    float _366 = _348 * 6.283185482025146484375;
    float _368 = cos(_366);
    float _370 = _364;
    float _372 = _362;
    if (!_234)
    {
        _360 = 0.0;
    }
    float _374 = _360;
    float _376 = _374;
    if (_232)
    {
        float _378 = _252 * _160;
        _260 = _378;
    }
    float _380 = _260;
    if (_232)
    {
        float _382 = _252 * _150;
        _264 = _382;
    }
    float _384 = _264;
    if (_232)
    {
        float _386 = _252 * _178;
        _270 = _386;
    }
    float _388 = _270;
    if (_234)
    {
        float _390 = _274 * _162;
        _376 = _390;
    }
    float _392 = _376;
    if (_234)
    {
        float _394 = _274 * _152;
        _370 = _394;
    }
    float _396 = _370;
    if (_234)
    {
        float _398 = _274 * _180;
        _372 = _398;
    }
    float _400 = _372;
    float _402 = in.m_57.w;
    float _404 = 0.0;
    float _406 = 0.0;
    if (!_242)
    {
        _404 = 0.0;
        _406 = 0.0;
    }
    float _408 = _404;
    float _410 = _406;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _418 = _416 != 0;
    float _420 = in.m_42.x;
    float _422 = in.m_42.y;
    float _424 = in.m_42.z;
    bool _426 = _278 < 0.5;
    float _428 = float(_426);
    float _430 = -_278;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _434 = fma(_368, 0.5, 0.5);
    bool _436 = !_414;
    int _438 = _436 ? 0 : 1;
    float _440 = _408;
    float _442 = _410;
    if (_242)
    {
        float _444 = _286 * _164;
        _440 = _444;
    }
    float _446 = _440;
    float _448 = 0.0;
    if (!_242)
    {
        _448 = 0.0;
    }
    float _450 = _448;
    float _452 = _450;
    if (_242)
    {
        float _454 = _286 * _154;
        _442 = _454;
    }
    float _456 = _442;
    if (_242)
    {
        float _458 = _286 * _182;
        _452 = _458;
    }
    float _460 = _452;
    float _462 = -_428;
    float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _466 = !_240;
    int _468 = _466 ? 0 : 1;
    float _470 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _472 = -_434;
    float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _476 = abs(_438);
    float _478 = fma(_344, _350, _470);
    int _480 = abs(_468);
    float _482 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _484 = !_418;
    int _486 = _484 ? 0 : 1;
    float _488 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _490 = fma(_344, _352, _482);
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _494 = fma(_344, _354, _488);
    int _496 = abs(_486);
    float _498 = fma(_490, _402, _422);
    float _500 = float(_476);
    float _502 = fma(_494, _402, _424);
    float _504 = float(_480);
    float _506 = fma(_478, _402, _420);
    float _508 = abs(_432);
    float _510 = _500 * _508;
    float _512 = float(_496);
    float _514 = fma(_504, _474, _510);
    float _516 = abs(_464);
    float _518 = fma(_512, _516, _514);
    bool _520 = !_492;
    float _536;
    if (!_520)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _524 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_94);
        float _542 = 1.0 / _540;
        float _544 = _128 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _550 = _546 + _548;
    bool _552 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_546);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _564;
    float _568 = -_562;
    float _570 = _568 + 1.0;
    bool _572 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _574 = isnan(_546);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = 1.0 / _566;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _590;
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _596 = _550 * _584;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _598;
    float _602 = in.m_57.x;
    float _604 = in.m_57.y;
    float _606 = in.m_57.z;
    float _608 = _582 * _570;
    float _610 = fma(_588, _596, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _612 = fma(_600, _596, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _614 = fma(_592, _596, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _616 = -_582;
    float _618 = _616 + 1.0;
    float _620 = _610 * _608;
    float _622 = _612 * _608;
    float _624 = _614 * _608;
    float _626 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].x, _620);
    float _628 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].y, _622);
    float _630 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _632 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[144].x, _626);
    float _634 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[144].y, _628);
    float _636 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[144].z, _630);
    float _638 = _632 * _602;
    float _640 = _634 * _604;
    float _642 = _636 * _606;
    bool _644 = !_594;
    float _660;
    if (!_644)
    {
        float _646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _648 = _184 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _652 = _650 * _646;
        float _654 = floor(_652);
        float _656 = -_654;
        float _658 = _652 + _656;
        _660 = _658;
        _662 = true;
    }
    else
    {
        float _664 = float(_94);
        float _666 = 1.0 / _664;
        float _668 = _128 * _666;
        _660 = _668;
    }
    _662 = false;
    float _670 = _660;
    float _672 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _674 = log2(_672);
    float _676 = in.m_55.y;
    float _678 = _184 * 2.0;
    float _680 = _498 * _162;
    float _682 = in.m_55.z;
    float _684 = _498 * _152;
    float _686 = _498 * _180;
    float _688 = floor(_678);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _692 = 1.0 + _690;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _704 = _702 != 0;
    float _706 = fma(_506, _160, _680);
    float _708 = fma(_506, _150, _684);
    float _710 = fma(_506, _178, _686);
    float _712 = in.m_51.w;
    float _714 = fma(_502, _164, _706);
    float _716 = _674 * _128;
    float _718 = 1.0 / _692;
    float _720 = in.m_49.w;
    bool _722 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(1.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = fma(_502, _154, _708);
    bool _734 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _742 = _738 || _740;
    float _744 = in.m_53.w;
    float _746 = fma(_502, _182, _710);
    float _748 = exp2(_716);
    float _750 = _676 * 2.0;
    bool _752 = _688 > 0.0;
    float _754 = _518 * _640;
    float _756 = _682 * 2.0;
    float _758 = _676 + _682;
    bool _760 = _688 >= 0.0;
    bool _762 = isnan(_688);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.0);
    bool _768 = _764 || _766;
    float _770 = _518 * _638;
    float _772 = floor(_750);
    float _774 = _758 + (-1.0);
    float _776 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _778 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _780 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _782 = _714 + _712;
    float _784 = in.m_59.x;
    float _786 = in.m_59.y;
    float _788 = in.m_59.z;
    float _790 = floor(_756);
    float _792 = -_748;
    float _794 = _792 + 1.0;
    float _796 = _732 + _720;
    float _798 = _518 * _642;
    float _800 = _746 + _744;
    float _802 = _742 ? _794 : 0.0;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _806 = _796 + _804;
    bool _808 = _772 >= 0.0;
    bool _810 = isnan(_772);
    bool _812 = _808 || _810;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    float _818 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _820 = !_700;
    int _822 = _820 ? 0 : 1;
    if (_730)
    {
        float _824 = _802 * _718;
        _132 = _824;
    }
    float _826 = _132;
    bool _828 = _772 > 0.0;
    float _830 = _806 * _806;
    int _832 = _768 ? 0 : 1;
    bool _834 = _790 > 0.0;
    bool _836 = _790 >= 0.0;
    bool _838 = isnan(_790);
    bool _840 = _836 || _838;
    bool _842 = isnan(0.0);
    bool _844 = _840 || _842;
    int _846 = abs(_822);
    int _848 = ~_832;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    int _854 = _852;
    if (!_752)
    {
        int _856 = ~_832;
        int _858 = _856 + 1;
        _854 = _858;
    }
    int _860 = _854;
    int _862 = _816 ? 0 : 1;
    float _864 = float(_846);
    float _866 = float(_860);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _870 = _782 + _868;
    int _872 = ~_862;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    int _878 = _876;
    if (!_828)
    {
        int _880 = ~_862;
        int _882 = _880 + 1;
        _878 = _882;
    }
    int _884 = _878;
    float _886 = _864 * _866;
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _890 = _800 + _888;
    float _892 = fma(_870, _870, _830);
    int _894 = _844 ? 0 : 1;
    float _896 = _886 * (-2.0);
    bool _898 = !_704;
    int _900 = _898 ? 0 : 1;
    float _902 = fma(_890, _890, _892);
    int _904 = ~_894;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    float _910 = fma(_780, _896, _780);
    float _912 = fma(_896, _786, _786);
    int _914 = _908;
    if (!_834)
    {
        int _916 = ~_894;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = rsqrt(_902);
    bool _924 = !_696;
    int _926 = _924 ? 0 : 1;
    float _928 = _184 + _676;
    int _930 = abs(_900);
    int _932 = abs(_926);
    float _934 = _676 + (-0.5);
    float _936 = float(_930);
    float _938 = _928 + (-1.0);
    float _940 = float(_884);
    float _942 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[196].y, _912);
    float _944 = float(_932);
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _948 = float(_920);
    float _950 = _936 * _940;
    float _952 = fma(_910, _826, _942);
    float _954 = _806 * _922;
    float _956 = _944 * _948;
    float _958 = _870 * _922;
    float _960 = -_954;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _806);
    float _964 = _952 * 0.15915493667125701904296875;
    float _966 = _956 * (-2.0);
    float _968 = -_958;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _870);
    float _972 = _962 * _962;
    float _974 = _890 * _922;
    float _976 = fma(_946, _966, _946);
    float _978 = fma(_966, _784, _784);
    float _980 = fma(_970, _970, _972);
    float _982 = -_974;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _986 = _184 + (-0.5);
    float _988 = _184 + _682;
    float _990 = _682 + (-0.5);
    float _992 = fma(_984, _984, _980);
    float _994 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[196].x, _978);
    float _996 = _988 + (-1.0);
    float _998 = _950 * (-2.0);
    float _1000 = fma(_976, _826, _994);
    float _1002 = sqrt(_992);
    float _1004 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1006 = fma(_998, _788, _788);
    float _1008 = in.m_61.x;
    float _1010 = in.m_61.y;
    float _1012 = in.m_61.z;
    float _1014 = _1000 * 0.15915493667125701904296875;
    float _1016 = fma(_1004, _998, _1004);
    float _1018 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1006);
    float _1020 = _964 * 6.283185482025146484375;
    float _1022 = sin(_1020);
    float _1024 = fma(_1016, _826, _1018);
    float _1026 = _1024 * 0.15915493667125701904296875;
    float _1028 = _964 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = _922 * _1002;
    float _1034 = _776 * _1032;
    float _1036 = _778 * _1032;
    float _1038 = _818 * _1032;
    float _1040 = _1014 * 6.283185482025146484375;
    float _1042 = sin(_1040);
    float _1044 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1010);
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1008);
    float _1048 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1012);
    float _1050 = _1034 * _1044;
    float _1052 = _1014 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    float _1056 = _1036 * _1046;
    float _1058 = _1038 * _1048;
    float _1060 = _1026 * 6.283185482025146484375;
    float _1062 = cos(_1060);
    float _1064 = _1042 * _1022;
    float _1066 = _1026 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _1054 * _1030;
    float _1072 = _1054 * _1022;
    float _1074 = _1062 * _1050;
    float _1076 = _1022 * _1062;
    float _1078 = _1030 * _1062;
    float _1080 = _1042 * _1030;
    float _1082 = _1054 * _1074;
    float _1084 = _1042 * _1074;
    float _1086 = fma(_1068, _1070, _1064);
    float _1088 = -_1050;
    float _1090 = _1068 * _1088;
    float _1092 = fma(_1068, _1064, _1070);
    float _1094 = fma(_1086, _1056, _1082);
    float _1096 = -_1080;
    float _1098 = fma(_1068, _1072, _1096);
    float _1100 = -_1072;
    float _1102 = fma(_1068, _1080, _1100);
    float _1104 = fma(_1078, _1056, _1090);
    float _1106 = fma(_1098, _1058, _1094);
    float _1108 = fma(_1102, _1056, _1084);
    float _1110 = fma(_1076, _1058, _1104);
    float _1112 = _1106 * _400;
    float _1114 = fma(_1092, _1058, _1108);
    float _1116 = _1106 * _392;
    float _1118 = _1106 * _396;
    float _1120 = fma(_1110, _388, _1112);
    float _1122 = fma(_1110, _380, _1116);
    float _1124 = fma(_1110, _384, _1118);
    float _1126 = fma(_1114, _460, _1120);
    float _1128 = fma(_1114, _446, _1122);
    float _1130 = fma(_1114, _456, _1124);
    float _1132 = _800 + _1126;
    float _1134 = _782 + _1128;
    float _1136 = _796 + _1130;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1132 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1144 = _1134 + _1142;
    float _1146 = _1140 * _1140;
    float _1148 = fma(_1144, _1144, _1146);
    float _1150 = sqrt(_1148);
    bool _1152 = _1150 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1154 = _1114;
    float _1156 = _1146;
    float _1158 = _1134;
    float _1160 = _1140;
    float _1162 = _1132;
    if (!_1152)
    {
        _1154 = _1132;
    }
    float _1164 = _1154;
    float _1166 = _1164;
    if (!_1152)
    {
        _1156 = _1136;
    }
    float _1168 = _1156;
    bool _1170 = !_1152;
    float _1172 = _1168;
    if (!_1170)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1178 = _1150 + _1176;
        float _1180 = _1136 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = rsqrt(_1148);
        float _1184 = _1178 * _1174;
        float _1186 = _1184 * 0.15915493667125701904296875;
        float _1188 = _1186 * 6.283185482025146484375;
        float _1190 = sin(_1188);
        float _1192 = _1186 * 6.283185482025146484375;
        float _1194 = cos(_1192);
        float _1196 = fma(_1190, _1180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1198 = _1182 * _1196;
        float _1200 = _1194 + (-1.0);
        float _1202 = fma(_1144, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1204 = fma(_1140, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1206 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = fma(_1136, _1194, _1206);
        _1172 = _1208;
        _1158 = _1202;
        _1166 = _1204;
    }
    float _1210 = _1172;
    float _1212 = _1158;
    float _1214 = _1166;
    float _1216 = -_954;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1220 = -_958;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1224 = -_974;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1218 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1222 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1226 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1230;
    if (_1264)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1278;
    }
    float _1280 = _1270;
    if (_1264)
    {
        float _1282 = rsqrt(_1260);
        _1272 = _1282;
    }
    float _1284 = _1272;
    if (_1264)
    {
        float _1286 = _1268 * _1280;
        _1274 = _1286;
    }
    float _1288 = _1274;
    if (_1264)
    {
        float _1290 = _1288 * 0.15915493667125701904296875;
        _1160 = _1290;
    }
    float _1292 = _1160;
    float _1294 = _1240;
    if (_1264)
    {
        float _1296 = _1292 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        _1294 = _1298;
    }
    float _1300 = _1294;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1304 = precise::max(0.0, _1302);
    float _1306 = _1246;
    float _1308 = _1304;
    float _1310 = _1302;
    if (_1264)
    {
        float _1312 = _1292 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        _1306 = _1314;
    }
    float _1316 = _1306;
    float _1318 = -_1250;
    float _1320 = -_1304;
    float _1322 = fma(_1230, _1318, _1320);
    if (!_1264)
    {
        _1308 = _1252;
    }
    float _1324 = _1308;
    float _1326 = _1324;
    if (_1264)
    {
        float _1328 = _1322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1310 = _1328;
    }
    float _1330 = _1310;
    float _1332 = _1330;
    float _1334 = _1300;
    if (_1264)
    {
        float _1336 = fma(_1300, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1162 = _1336;
    }
    float _1338 = _1162;
    float _1340 = _1338;
    if (!_1264)
    {
        _1332 = _1322;
    }
    float _1342 = _1332;
    float _1344 = _1342;
    float _1346 = _1316;
    if (_1264)
    {
        float _1348 = _1316 + (-1.0);
        _1276 = _1348;
    }
    float _1350 = _1276;
    float _1352 = _1350;
    if (_1264)
    {
        float _1354 = _1284 * _1338;
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1264)
    {
        float _1360 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1360;
    }
    float _1362 = _1334;
    float _1364 = _1362;
    if (_1264)
    {
        float _1366 = _1252 * _1356;
        _1326 = _1366;
    }
    float _1368 = _1326;
    if (!_1264)
    {
        _1352 = _1254;
    }
    float _1370 = _1352;
    float _1372 = _1370;
    if (_1264)
    {
        float _1374 = _1254 * _1356;
        _1372 = _1374;
    }
    float _1376 = _1372;
    if (_1264)
    {
        float _1378 = fma(_1322, _1316, _1362);
        _1344 = _1378;
    }
    float _1380 = _1344;
    if (!_1264)
    {
        _1364 = _1256;
    }
    float _1382 = _1364;
    float _1384 = _1382;
    if (_1264)
    {
        float _1386 = _1368 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1264)
    {
        _1346 = _1258;
    }
    float _1392 = _1346;
    float _1394 = _1392;
    if (_1264)
    {
        float _1396 = _1376 * _1376;
        _1394 = _1396;
    }
    float _1398 = _1394;
    float _1400 = fma(_1380, _1380, _1388);
    float _1402 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1390);
    float _1404 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1406 = _1400 + _1398;
    float _1408 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1358);
    float _1410 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1404);
    float _1412 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1402);
    float _1414 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1408);
    float _1418 = rsqrt(_1406);
    float _1420 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1410);
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1424 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1422);
    float _1426 = precise::clamp(_1424, 0.0, 1.0);
    float _1428 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1430 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1432 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1434 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = -_1426;
    float _1438 = _1436 + 1.0;
    float _1440 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1442 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1446 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1430);
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1440);
    float _1450 = abs(_1438);
    float _1452 = log2(_1450);
    float _1454 = -_1444;
    float _1456 = fma(_1454, _1442, 1.0);
    float _1458 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1460 = _1418 * _1368;
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1448);
    float _1464 = _1418 * _1380;
    float _1466 = _1418 * _1376;
    float _1468 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1470 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    float _1472 = log2(_1456);
    float _1474 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1476 = -_1468;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1476);
    float _1480 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1474);
    float _1482 = -_1466;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1478);
    float _1486 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1488 = 1.0 / _1470;
    float _1490 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = fma(_1484, -0.5, 0.5);
    float _1494 = fma(_1484, 0.5, 0.5);
    float _1496 = _1464 + 1.0;
    float _1498 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1500 = fma(_1494, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1502 = exp2(_1486);
    float _1504 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1498);
    float _1506 = _1472 * 0.693147182464599609375;
    float _1508 = fma(_1494, _1500, -0.212114393711090087890625);
    float _1510 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1504);
    float _1512 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1514 = fma(_1494, _1508, 1.570728778839111328125);
    float _1516 = sqrt(_1492);
    float _1518 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1480);
    float _1520 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1518);
    float _1522 = -_1464;
    float _1524 = fma(_1502, _1496, _1522);
    float _1526 = _1520 * _1488;
    float _1528 = _1510 * _1488;
    float _1530 = fma(_1524, 0.5, 0.5);
    float _1532 = fma(_1526, 0.5, 0.5);
    float _1534 = fma(_1528, -0.5, 0.5);
    float _1536 = _1516 * 0.636619746685028076171875;
    float _1538 = -_1514;
    float _1540 = fma(_1536, _1538, 1.0);
    float3 _4234 = float3(_1532, _1534, _1512);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4234, float3(0.0), isnan(_4234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4234, float3(0.0), isnan(_4234)), level(0.0)).x;
    float3 _4245 = float3(_1532, _1534, _1512);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4245, float3(0.0), isnan(_4245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4245, float3(0.0), isnan(_4245)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _4262 = float2(_1540, _1530);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4262, float2(0.0), isnan(_4262)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4262, float2(0.0), isnan(_4262)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = in.m_63.y;
    float _1567 = -_954;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _1571 = -_958;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1577 = _1575 != 0;
    float _1579 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1581 = _676 > 0.5;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1583;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1591 = -_974;
    float _1593 = fma(_1591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _800);
    float _1595 = 1.0 / _1585;
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1579);
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1601 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1597);
    float _1603 = 1.0 / _1589;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1611 = -_1565;
    float _1613 = _1611 + 1.0;
    bool _1615 = _184 > 0.5;
    bool _1617 = _1615 && _1607;
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1621 = _670 + _1619;
    float _1623 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1609);
    float _1625 = _1565;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1577)
    {
        float _1629 = _1581 ? _1613 : _1565;
        _1625 = _1629;
    }
    float _1631 = _1625;
    float _1633 = in.m_63.x;
    float _1635 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1643 = _670 + _1641;
    float _1645 = _1621 * _1595;
    float _1647 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1643 * _1603;
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1653;
    out.m_67.x = _1635;
    out.m_67.y = _1647;
    out.m_67.z = _1649;
    float _1657 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1659 = fma(_1655, _1645, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1663 = _1661 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1665;
    float _1669 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1671 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1673 = isnan(0.5);
    bool _1675 = _1671 || _1673;
    bool _1677 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1679 = _1675 || _1677;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1683 = _1681 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1685 = fma(_1667, _1645, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1687 = fma(_1663, _1651, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1689 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1623);
    if (_1607)
    {
        _1627 = _1633;
    }
    float _1691 = _1627;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1693;
    float _1697 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1701 = fma(_1683, _1651, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1703 = fma(_1695, _1645, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1709 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1697);
    float _1711 = _1691;
    float _1713 = _1707;
    if (_1617)
    {
        float _1715 = -_1691;
        float _1717 = _1715 + 1.0;
        _1711 = _1717;
    }
    float _1719 = _1711;
    bool _1721 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1723 = isnan(_670);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1729 = _1725 || _1727;
    float _1731 = float(_1729);
    float _1733 = fma(_1707, _1651, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1737 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1709);
    if (!_1607)
    {
        _1713 = _1633;
    }
    float _1739 = _1713;
    float _1741 = -_1731;
    float _1743 = _1741 + 1.0;
    float _1745 = _1739;
    if (_1607)
    {
        _1745 = _1719;
    }
    float _1747 = _1745;
    float _1749 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1751 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1753 = isnan(_670);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = 1.0 / _1657;
    float _1765 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1767 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1769 = isnan(_670);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = _1669 * _1699;
    float _1781 = _1765 * _1735;
    float _1783 = _1749 + _1657;
    float _1785 = _1761 * _1743;
    float _1787 = -_1761;
    float _1789 = _1787 + 1.0;
    out.m_69.x = _1781;
    out.m_69.y = _1779;
    float _1791 = _1783 * _1763;
    float _1793 = _1791 * 0.5;
    float _1795 = _1777 * _1789;
    float _1797 = -_1777;
    float _1799 = _1797 + 1.0;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1803 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1801);
    float _1805 = _1685 * _1795;
    float _1807 = _1659 * _1795;
    float _1809 = _1703 * _1795;
    float _1811 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1805);
    float _1813 = 1.0 / _1803;
    float _1815 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1807);
    float _1817 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1809);
    float _1819 = fma(_1701, _1785, _1811);
    float _1821 = fma(_1687, _1785, _1815);
    float _1823 = fma(_1733, _1785, _1817);
    float _1825 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1819);
    float _1827 = _1815;
    float _1829 = _1819;
    if (_1679)
    {
        _1827 = 1.0;
    }
    float _1831 = _1827;
    float _1833 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1821);
    float _1835 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1823);
    float _1837 = _1831;
    if (_1679)
    {
        _1829 = 1.0;
    }
    float _1839 = _1829;
    float _1841 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1845 = _1813 * _1843;
    float _1847 = _1839;
    if (!_1679)
    {
        float _1849 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1851 = _1849 * 0.15915493667125701904296875;
        float _1853 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1857 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1855;
        float _1859 = _1851 * 6.283185482025146484375;
        float _1861 = cos(_1859);
        float _1863 = _1853 * 0.15915493667125701904296875;
        float _1865 = _1851 * 6.283185482025146484375;
        float _1867 = sin(_1865);
        float _1869 = 1.0 / _1861;
        float _1871 = _1863 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1867 * _1869;
        float _1877 = _1863 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = 1.0 / _1857;
        float _1885 = 1.0 / _1881;
        float _1887 = _1879 * _1885;
        float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1891 = fma(_1845, _1887, _1889);
        float _1893 = _1891 * _1883;
        float _1895 = precise::clamp(_1893, 0.0, 1.0);
        _1837 = _1895;
    }
    float _1897 = _1837;
    if (!_1679)
    {
        float _1899 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1901 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1903 = _1899 * 0.15915493667125701904296875;
        float _1905 = _1901 * 0.15915493667125701904296875;
        float _1907 = _1903 * 6.283185482025146484375;
        float _1909 = cos(_1907);
        float _1911 = _1903 * 6.283185482025146484375;
        float _1913 = sin(_1911);
        float _1915 = 1.0 / _1909;
        float _1917 = _1905 * 6.283185482025146484375;
        float _1919 = cos(_1917);
        float _1921 = _1913 * _1915;
        float _1923 = _1905 * 6.283185482025146484375;
        float _1925 = sin(_1923);
        float _1927 = _1919 * _1921;
        float _1929 = 1.0 / _1927;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1933 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1931;
        float _1935 = 1.0 / _1933;
        float _1937 = _1925 * _1929;
        float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1941 = fma(_1845, _1937, _1939);
        float _1943 = _1941 * _1935;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        float _1947 = -_1945;
        float _1949 = _1947 + 1.0;
        _1847 = _1949;
    }
    float _1951 = _1847;
    float _1953 = exp2(_1841);
    float _1955 = _1897 * _1951;
    bool _1957 = _1897 > 0.0;
    bool _1959 = isnan(_1897);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan(0.0);
    bool _1965 = _1961 || _1963;
    float _1967 = _1825 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1969 = _1833 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1971 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1973 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1975 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1689);
    bool _1977 = _1951 <= 0.0;
    bool _1979 = !_1965;
    bool _1981 = _1977 || _1979;
    float _1983 = _1971 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1987 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1989 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1975 + _1470;
    float _1995 = _1520 + _1470;
    float _1997 = -_1953;
    float _1999 = _1997 + 1.0;
    float _2001 = _1470 * 0.5;
    out.m_71.x = _1987;
    out.m_71.y = _1989;
    out.m_71.z = _1991;
    out.m_71.w = _1985;
    float _2003 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2005 = _1993 * 0.5;
    float _2007 = _1995 * 0.5;
    float _2009 = fma(_1510, -0.5, _2001);
    float _2011 = _2003 * _1542;
    out.m_45.x = _1983;
    float _2013 = _1553 * _2011;
    float _2015 = _1563 * _2011;
    float _2017 = -_2003;
    float _2019 = _2017 + 1.0;
    out.gl_Position.x = _1520;
    out.gl_Position.y = _1510;
    out.gl_Position.z = _1975;
    out.gl_Position.w = _1470;
    float _2021 = fma(_1559, _2013, _1547);
    float _2023 = fma(_1561, _2013, _1549);
    float _2025 = _1553 * _2019;
    float _2027 = fma(_1553, _2015, _1551);
    out.m_73.x = _2007;
    out.m_73.y = _2009;
    out.m_73.z = _2005;
    out.m_73.w = _1470;
    out.m_75.x = _2021;
    out.m_75.y = _2023;
    out.m_75.z = _2027;
    out.m_75.w = _2025;
    if (!_1981)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2029 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2029;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _662 = false;
    bool _538 = false;
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
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2086 = as_type<float>(_110);
        out.gl_Position.z = _2086;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2155 = as_type<float>(_148);
        out.gl_Position.z = _2155;
    }
    if (_142)
    {
        return out;
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = in.m_51.x;
    float _162 = in.m_51.y;
    float _164 = in.m_51.z;
    float _166 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_55.x;
    float _186 = _158 * _156;
    float _188 = 0.0;
    float _190 = _166;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_176)
    {
        float _194 = _166 * _166;
        float _196 = _194 * 0.5;
        _188 = _196;
    }
    float _198 = _188;
    float _200 = _150 * _150;
    float _202 = _152 * _152;
    float _204 = _154 * _154;
    float _206 = _198;
    if (!_176)
    {
        float _208 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    float _212 = fma(_160, _160, _200);
    float _214 = fma(_162, _162, _202);
    float _216 = fma(_164, _164, _204);
    float _218 = fma(_178, _178, _212);
    float _220 = fma(_180, _180, _214);
    float _222 = fma(_182, _182, _216);
    float _224 = sqrt(_218);
    float _226 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[20].x, _186);
    float _228 = sqrt(_220);
    float _230 = sqrt(_222);
    bool _232 = _224 > 0.0;
    bool _234 = _228 > 0.0;
    float _236 = floor(_226);
    int _238 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _240 = _238 != 0;
    bool _242 = _230 > 0.0;
    float _244 = _156;
    float _246 = _230;
    float _248 = _210;
    if (_232)
    {
        float _250 = rsqrt(_218);
        _244 = _250;
    }
    float _252 = _244;
    float _254 = 0.0;
    if (!_232)
    {
        _254 = 0.0;
    }
    float _256 = _254;
    float _258 = 0.0;
    float _260 = _256;
    if (!_232)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _262;
    if (!_232)
    {
        _246 = 0.0;
    }
    float _266 = _246;
    float _268 = _224;
    float _270 = _266;
    if (_234)
    {
        float _272 = rsqrt(_220);
        _268 = _272;
    }
    float _274 = _268;
    float _276 = -_236;
    float _278 = _226 + _276;
    float _280 = _226 * 6.283185482025146484375;
    float _282 = 0.0;
    if (_242)
    {
        float _284 = rsqrt(_222);
        _282 = _284;
    }
    float _286 = _282;
    bool _288 = !_176;
    if (!_288)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _166 * _292;
        float _302 = 1.0 / _296;
        float _304 = _298 * 0.693147182464599609375;
        float _306 = exp2(_300);
        float _308 = 1.0 / _304;
        float _310 = _306 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _308, _166);
        float _316 = _314 * _302;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _318;
    }
    float _320 = _248;
    bool _322 = !_176;
    if (!_322)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _166 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _190 = _342;
        _192 = _330;
    }
    float _344 = _190;
    float _346 = _192;
    float _348 = _280 * 0.15915493667125701904296875;
    float _350 = in.m_47.x;
    float _352 = in.m_47.y;
    float _354 = in.m_47.z;
    float _356 = 0.0;
    float _358 = 0.0;
    float _360 = _346;
    if (!_234)
    {
        _356 = 0.0;
        _358 = 0.0;
    }
    float _362 = _356;
    float _364 = _358;
    float _366 = _348 * 6.283185482025146484375;
    float _368 = cos(_366);
    float _370 = _364;
    float _372 = _362;
    if (!_234)
    {
        _360 = 0.0;
    }
    float _374 = _360;
    float _376 = _374;
    if (_232)
    {
        float _378 = _252 * _160;
        _260 = _378;
    }
    float _380 = _260;
    if (_232)
    {
        float _382 = _252 * _150;
        _264 = _382;
    }
    float _384 = _264;
    if (_232)
    {
        float _386 = _252 * _178;
        _270 = _386;
    }
    float _388 = _270;
    if (_234)
    {
        float _390 = _274 * _162;
        _376 = _390;
    }
    float _392 = _376;
    if (_234)
    {
        float _394 = _274 * _152;
        _370 = _394;
    }
    float _396 = _370;
    if (_234)
    {
        float _398 = _274 * _180;
        _372 = _398;
    }
    float _400 = _372;
    float _402 = in.m_57.w;
    float _404 = 0.0;
    float _406 = 0.0;
    if (!_242)
    {
        _404 = 0.0;
        _406 = 0.0;
    }
    float _408 = _404;
    float _410 = _406;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _418 = _416 != 0;
    float _420 = in.m_42.x;
    float _422 = in.m_42.y;
    float _424 = in.m_42.z;
    bool _426 = _278 < 0.5;
    float _428 = float(_426);
    float _430 = -_278;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _434 = fma(_368, 0.5, 0.5);
    bool _436 = !_414;
    int _438 = _436 ? 0 : 1;
    float _440 = _408;
    float _442 = _410;
    if (_242)
    {
        float _444 = _286 * _164;
        _440 = _444;
    }
    float _446 = _440;
    float _448 = 0.0;
    if (!_242)
    {
        _448 = 0.0;
    }
    float _450 = _448;
    float _452 = _450;
    if (_242)
    {
        float _454 = _286 * _154;
        _442 = _454;
    }
    float _456 = _442;
    if (_242)
    {
        float _458 = _286 * _182;
        _452 = _458;
    }
    float _460 = _452;
    float _462 = -_428;
    float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _466 = !_240;
    int _468 = _466 ? 0 : 1;
    float _470 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _472 = -_434;
    float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _476 = abs(_438);
    float _478 = fma(_344, _350, _470);
    int _480 = abs(_468);
    float _482 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _484 = !_418;
    int _486 = _484 ? 0 : 1;
    float _488 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _490 = fma(_344, _352, _482);
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _494 = fma(_344, _354, _488);
    int _496 = abs(_486);
    float _498 = fma(_490, _402, _422);
    float _500 = float(_476);
    float _502 = fma(_494, _402, _424);
    float _504 = float(_480);
    float _506 = fma(_478, _402, _420);
    float _508 = abs(_432);
    float _510 = _500 * _508;
    float _512 = float(_496);
    float _514 = fma(_504, _474, _510);
    float _516 = abs(_464);
    float _518 = fma(_512, _516, _514);
    bool _520 = !_492;
    float _536;
    if (!_520)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _524 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_94);
        float _542 = 1.0 / _540;
        float _544 = _128 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _550 = _546 + _548;
    bool _552 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_546);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _564;
    float _568 = -_562;
    float _570 = _568 + 1.0;
    bool _572 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _574 = isnan(_546);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = 1.0 / _566;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _590;
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _596 = _550 * _584;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _598;
    float _602 = in.m_57.x;
    float _604 = in.m_57.y;
    float _606 = in.m_57.z;
    float _608 = _582 * _570;
    float _610 = fma(_588, _596, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _612 = fma(_600, _596, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _614 = fma(_592, _596, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _616 = -_582;
    float _618 = _616 + 1.0;
    float _620 = _610 * _608;
    float _622 = _612 * _608;
    float _624 = _614 * _608;
    float _626 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].x, _620);
    float _628 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].y, _622);
    float _630 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _632 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[144].x, _626);
    float _634 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[144].y, _628);
    float _636 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[144].z, _630);
    float _638 = _632 * _602;
    float _640 = _634 * _604;
    float _642 = _636 * _606;
    bool _644 = !_594;
    float _660;
    if (!_644)
    {
        float _646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _648 = _184 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _652 = _650 * _646;
        float _654 = floor(_652);
        float _656 = -_654;
        float _658 = _652 + _656;
        _660 = _658;
        _662 = true;
    }
    else
    {
        float _664 = float(_94);
        float _666 = 1.0 / _664;
        float _668 = _128 * _666;
        _660 = _668;
    }
    _662 = false;
    float _670 = _660;
    float _672 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _674 = log2(_672);
    float _676 = in.m_55.y;
    float _678 = _184 * 2.0;
    float _680 = _498 * _162;
    float _682 = in.m_55.z;
    float _684 = _498 * _152;
    float _686 = _498 * _180;
    float _688 = floor(_678);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _692 = 1.0 + _690;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _704 = _702 != 0;
    float _706 = fma(_506, _160, _680);
    float _708 = fma(_506, _150, _684);
    float _710 = fma(_506, _178, _686);
    float _712 = in.m_51.w;
    float _714 = fma(_502, _164, _706);
    float _716 = _674 * _128;
    float _718 = 1.0 / _692;
    float _720 = in.m_49.w;
    bool _722 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(1.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = fma(_502, _154, _708);
    bool _734 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _742 = _738 || _740;
    float _744 = in.m_53.w;
    float _746 = fma(_502, _182, _710);
    float _748 = exp2(_716);
    float _750 = _676 * 2.0;
    bool _752 = _688 > 0.0;
    float _754 = _518 * _640;
    float _756 = _682 * 2.0;
    float _758 = _676 + _682;
    bool _760 = _688 >= 0.0;
    bool _762 = isnan(_688);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.0);
    bool _768 = _764 || _766;
    float _770 = _518 * _638;
    float _772 = floor(_750);
    float _774 = _758 + (-1.0);
    float _776 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _778 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _780 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _782 = _714 + _712;
    float _784 = in.m_59.x;
    float _786 = in.m_59.y;
    float _788 = in.m_59.z;
    float _790 = floor(_756);
    float _792 = -_748;
    float _794 = _792 + 1.0;
    float _796 = _732 + _720;
    float _798 = _518 * _642;
    float _800 = _746 + _744;
    float _802 = _742 ? _794 : 0.0;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _806 = _796 + _804;
    bool _808 = _772 >= 0.0;
    bool _810 = isnan(_772);
    bool _812 = _808 || _810;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    float _818 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _820 = !_700;
    int _822 = _820 ? 0 : 1;
    if (_730)
    {
        float _824 = _802 * _718;
        _132 = _824;
    }
    float _826 = _132;
    bool _828 = _772 > 0.0;
    float _830 = _806 * _806;
    int _832 = _768 ? 0 : 1;
    bool _834 = _790 > 0.0;
    bool _836 = _790 >= 0.0;
    bool _838 = isnan(_790);
    bool _840 = _836 || _838;
    bool _842 = isnan(0.0);
    bool _844 = _840 || _842;
    int _846 = abs(_822);
    int _848 = ~_832;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    int _854 = _852;
    if (!_752)
    {
        int _856 = ~_832;
        int _858 = _856 + 1;
        _854 = _858;
    }
    int _860 = _854;
    int _862 = _816 ? 0 : 1;
    float _864 = float(_846);
    float _866 = float(_860);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _870 = _782 + _868;
    int _872 = ~_862;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    int _878 = _876;
    if (!_828)
    {
        int _880 = ~_862;
        int _882 = _880 + 1;
        _878 = _882;
    }
    int _884 = _878;
    float _886 = _864 * _866;
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _890 = _800 + _888;
    float _892 = fma(_870, _870, _830);
    int _894 = _844 ? 0 : 1;
    float _896 = _886 * (-2.0);
    bool _898 = !_704;
    int _900 = _898 ? 0 : 1;
    float _902 = fma(_890, _890, _892);
    int _904 = ~_894;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    float _910 = fma(_780, _896, _780);
    float _912 = fma(_896, _786, _786);
    int _914 = _908;
    if (!_834)
    {
        int _916 = ~_894;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = rsqrt(_902);
    bool _924 = !_696;
    int _926 = _924 ? 0 : 1;
    float _928 = _184 + _676;
    int _930 = abs(_900);
    int _932 = abs(_926);
    float _934 = _676 + (-0.5);
    float _936 = float(_930);
    float _938 = _928 + (-1.0);
    float _940 = float(_884);
    float _942 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[196].y, _912);
    float _944 = float(_932);
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _948 = float(_920);
    float _950 = _936 * _940;
    float _952 = fma(_910, _826, _942);
    float _954 = _806 * _922;
    float _956 = _944 * _948;
    float _958 = _870 * _922;
    float _960 = -_954;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _806);
    float _964 = _952 * 0.15915493667125701904296875;
    float _966 = _956 * (-2.0);
    float _968 = -_958;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _870);
    float _972 = _962 * _962;
    float _974 = _890 * _922;
    float _976 = fma(_946, _966, _946);
    float _978 = fma(_966, _784, _784);
    float _980 = fma(_970, _970, _972);
    float _982 = -_974;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _986 = _184 + (-0.5);
    float _988 = _184 + _682;
    float _990 = _682 + (-0.5);
    float _992 = fma(_984, _984, _980);
    float _994 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[196].x, _978);
    float _996 = _988 + (-1.0);
    float _998 = _950 * (-2.0);
    float _1000 = fma(_976, _826, _994);
    float _1002 = sqrt(_992);
    float _1004 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1006 = fma(_998, _788, _788);
    float _1008 = in.m_61.x;
    float _1010 = in.m_61.y;
    float _1012 = in.m_61.z;
    float _1014 = _1000 * 0.15915493667125701904296875;
    float _1016 = fma(_1004, _998, _1004);
    float _1018 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1006);
    float _1020 = _964 * 6.283185482025146484375;
    float _1022 = sin(_1020);
    float _1024 = fma(_1016, _826, _1018);
    float _1026 = _1024 * 0.15915493667125701904296875;
    float _1028 = _964 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = _922 * _1002;
    float _1034 = _776 * _1032;
    float _1036 = _778 * _1032;
    float _1038 = _818 * _1032;
    float _1040 = _1014 * 6.283185482025146484375;
    float _1042 = sin(_1040);
    float _1044 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1010);
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1008);
    float _1048 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1012);
    float _1050 = _1034 * _1044;
    float _1052 = _1014 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    float _1056 = _1036 * _1046;
    float _1058 = _1038 * _1048;
    float _1060 = _1026 * 6.283185482025146484375;
    float _1062 = cos(_1060);
    float _1064 = _1042 * _1022;
    float _1066 = _1026 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _1054 * _1030;
    float _1072 = _1054 * _1022;
    float _1074 = _1062 * _1050;
    float _1076 = _1022 * _1062;
    float _1078 = _1030 * _1062;
    float _1080 = _1042 * _1030;
    float _1082 = _1054 * _1074;
    float _1084 = _1042 * _1074;
    float _1086 = fma(_1068, _1070, _1064);
    float _1088 = -_1050;
    float _1090 = _1068 * _1088;
    float _1092 = fma(_1068, _1064, _1070);
    float _1094 = fma(_1086, _1056, _1082);
    float _1096 = -_1080;
    float _1098 = fma(_1068, _1072, _1096);
    float _1100 = -_1072;
    float _1102 = fma(_1068, _1080, _1100);
    float _1104 = fma(_1078, _1056, _1090);
    float _1106 = fma(_1098, _1058, _1094);
    float _1108 = fma(_1102, _1056, _1084);
    float _1110 = fma(_1076, _1058, _1104);
    float _1112 = _1106 * _400;
    float _1114 = fma(_1092, _1058, _1108);
    float _1116 = _1106 * _392;
    float _1118 = _1106 * _396;
    float _1120 = fma(_1110, _388, _1112);
    float _1122 = fma(_1110, _380, _1116);
    float _1124 = fma(_1110, _384, _1118);
    float _1126 = fma(_1114, _460, _1120);
    float _1128 = fma(_1114, _446, _1122);
    float _1130 = fma(_1114, _456, _1124);
    float _1132 = _800 + _1126;
    float _1134 = _782 + _1128;
    float _1136 = _796 + _1130;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1132 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1144 = _1134 + _1142;
    float _1146 = _1140 * _1140;
    float _1148 = fma(_1144, _1144, _1146);
    float _1150 = sqrt(_1148);
    bool _1152 = _1150 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1154 = _1114;
    float _1156 = _1146;
    float _1158 = _1134;
    float _1160 = _1140;
    float _1162 = _1132;
    if (!_1152)
    {
        _1154 = _1132;
    }
    float _1164 = _1154;
    float _1166 = _1164;
    if (!_1152)
    {
        _1156 = _1136;
    }
    float _1168 = _1156;
    bool _1170 = !_1152;
    float _1172 = _1168;
    if (!_1170)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1178 = _1150 + _1176;
        float _1180 = _1136 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = rsqrt(_1148);
        float _1184 = _1178 * _1174;
        float _1186 = _1184 * 0.15915493667125701904296875;
        float _1188 = _1186 * 6.283185482025146484375;
        float _1190 = sin(_1188);
        float _1192 = _1186 * 6.283185482025146484375;
        float _1194 = cos(_1192);
        float _1196 = fma(_1190, _1180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1198 = _1182 * _1196;
        float _1200 = _1194 + (-1.0);
        float _1202 = fma(_1144, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1204 = fma(_1140, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1206 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = fma(_1136, _1194, _1206);
        _1172 = _1208;
        _1158 = _1202;
        _1166 = _1204;
    }
    float _1210 = _1172;
    float _1212 = _1158;
    float _1214 = _1166;
    float _1216 = -_954;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1220 = -_958;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1224 = -_974;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1218 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1222 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1226 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1230;
    if (_1264)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1278;
    }
    float _1280 = _1270;
    if (_1264)
    {
        float _1282 = rsqrt(_1260);
        _1272 = _1282;
    }
    float _1284 = _1272;
    if (_1264)
    {
        float _1286 = _1268 * _1280;
        _1274 = _1286;
    }
    float _1288 = _1274;
    if (_1264)
    {
        float _1290 = _1288 * 0.15915493667125701904296875;
        _1160 = _1290;
    }
    float _1292 = _1160;
    float _1294 = _1240;
    if (_1264)
    {
        float _1296 = _1292 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        _1294 = _1298;
    }
    float _1300 = _1294;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1304 = precise::max(0.0, _1302);
    float _1306 = _1246;
    float _1308 = _1304;
    float _1310 = _1302;
    if (_1264)
    {
        float _1312 = _1292 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        _1306 = _1314;
    }
    float _1316 = _1306;
    float _1318 = -_1250;
    float _1320 = -_1304;
    float _1322 = fma(_1230, _1318, _1320);
    if (!_1264)
    {
        _1308 = _1252;
    }
    float _1324 = _1308;
    float _1326 = _1324;
    if (_1264)
    {
        float _1328 = _1322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1310 = _1328;
    }
    float _1330 = _1310;
    float _1332 = _1330;
    float _1334 = _1300;
    if (_1264)
    {
        float _1336 = fma(_1300, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1162 = _1336;
    }
    float _1338 = _1162;
    float _1340 = _1338;
    if (!_1264)
    {
        _1332 = _1322;
    }
    float _1342 = _1332;
    float _1344 = _1342;
    float _1346 = _1316;
    if (_1264)
    {
        float _1348 = _1316 + (-1.0);
        _1276 = _1348;
    }
    float _1350 = _1276;
    float _1352 = _1350;
    if (_1264)
    {
        float _1354 = _1284 * _1338;
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1264)
    {
        float _1360 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1360;
    }
    float _1362 = _1334;
    float _1364 = _1362;
    if (_1264)
    {
        float _1366 = _1252 * _1356;
        _1326 = _1366;
    }
    float _1368 = _1326;
    if (!_1264)
    {
        _1352 = _1254;
    }
    float _1370 = _1352;
    float _1372 = _1370;
    if (_1264)
    {
        float _1374 = _1254 * _1356;
        _1372 = _1374;
    }
    float _1376 = _1372;
    if (_1264)
    {
        float _1378 = fma(_1322, _1316, _1362);
        _1344 = _1378;
    }
    float _1380 = _1344;
    if (!_1264)
    {
        _1364 = _1256;
    }
    float _1382 = _1364;
    float _1384 = _1382;
    if (_1264)
    {
        float _1386 = _1368 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1264)
    {
        _1346 = _1258;
    }
    float _1392 = _1346;
    float _1394 = _1392;
    if (_1264)
    {
        float _1396 = _1376 * _1376;
        _1394 = _1396;
    }
    float _1398 = _1394;
    float _1400 = fma(_1380, _1380, _1388);
    float _1402 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1390);
    float _1404 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1406 = _1400 + _1398;
    float _1408 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1358);
    float _1410 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1404);
    float _1412 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1402);
    float _1414 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1408);
    float _1418 = rsqrt(_1406);
    float _1420 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1410);
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1424 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1422);
    float _1426 = precise::clamp(_1424, 0.0, 1.0);
    float _1428 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1430 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1432 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1434 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = -_1426;
    float _1438 = _1436 + 1.0;
    float _1440 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1442 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1446 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1430);
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1440);
    float _1450 = abs(_1438);
    float _1452 = log2(_1450);
    float _1454 = -_1444;
    float _1456 = fma(_1454, _1442, 1.0);
    float _1458 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1460 = _1418 * _1368;
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1448);
    float _1464 = _1418 * _1380;
    float _1466 = _1418 * _1376;
    float _1468 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1470 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    float _1472 = log2(_1456);
    float _1474 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1476 = -_1468;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1476);
    float _1480 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1474);
    float _1482 = -_1466;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1478);
    float _1486 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1488 = 1.0 / _1470;
    float _1490 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = fma(_1484, -0.5, 0.5);
    float _1494 = fma(_1484, 0.5, 0.5);
    float _1496 = _1464 + 1.0;
    float _1498 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1500 = fma(_1494, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1502 = exp2(_1486);
    float _1504 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1498);
    float _1506 = _1472 * 0.693147182464599609375;
    float _1508 = fma(_1494, _1500, -0.212114393711090087890625);
    float _1510 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1504);
    float _1512 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1514 = fma(_1494, _1508, 1.570728778839111328125);
    float _1516 = sqrt(_1492);
    float _1518 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1480);
    float _1520 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1518);
    float _1522 = -_1464;
    float _1524 = fma(_1502, _1496, _1522);
    float _1526 = _1520 * _1488;
    float _1528 = _1510 * _1488;
    float _1530 = fma(_1524, 0.5, 0.5);
    float _1532 = fma(_1526, 0.5, 0.5);
    float _1534 = fma(_1528, -0.5, 0.5);
    float _1536 = _1516 * 0.636619746685028076171875;
    float _1538 = -_1514;
    float _1540 = fma(_1536, _1538, 1.0);
    float3 _4234 = float3(_1532, _1534, _1512);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4234, float3(0.0), isnan(_4234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4234, float3(0.0), isnan(_4234)), level(0.0)).x;
    float3 _4245 = float3(_1532, _1534, _1512);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4245, float3(0.0), isnan(_4245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4245, float3(0.0), isnan(_4245)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _4262 = float2(_1540, _1530);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4262, float2(0.0), isnan(_4262)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4262, float2(0.0), isnan(_4262)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = in.m_63.y;
    float _1567 = -_954;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _1571 = -_958;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1577 = _1575 != 0;
    float _1579 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1581 = _676 > 0.5;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1583;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1591 = -_974;
    float _1593 = fma(_1591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _800);
    float _1595 = 1.0 / _1585;
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1579);
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1601 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1597);
    float _1603 = 1.0 / _1589;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1611 = -_1565;
    float _1613 = _1611 + 1.0;
    bool _1615 = _184 > 0.5;
    bool _1617 = _1615 && _1607;
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1621 = _670 + _1619;
    float _1623 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1609);
    float _1625 = _1565;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1577)
    {
        float _1629 = _1581 ? _1613 : _1565;
        _1625 = _1629;
    }
    float _1631 = _1625;
    float _1633 = in.m_63.x;
    float _1635 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1643 = _670 + _1641;
    float _1645 = _1621 * _1595;
    float _1647 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1643 * _1603;
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1653;
    out.m_67.x = _1635;
    out.m_67.y = _1647;
    out.m_67.z = _1649;
    float _1657 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1659 = fma(_1655, _1645, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1663 = _1661 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1665;
    float _1669 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1671 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1673 = isnan(0.5);
    bool _1675 = _1671 || _1673;
    bool _1677 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1679 = _1675 || _1677;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1683 = _1681 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1685 = fma(_1667, _1645, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1687 = fma(_1663, _1651, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1689 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1623);
    if (_1607)
    {
        _1627 = _1633;
    }
    float _1691 = _1627;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1693;
    float _1697 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1701 = fma(_1683, _1651, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1703 = fma(_1695, _1645, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1709 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1697);
    float _1711 = _1691;
    float _1713 = _1707;
    if (_1617)
    {
        float _1715 = -_1691;
        float _1717 = _1715 + 1.0;
        _1711 = _1717;
    }
    float _1719 = _1711;
    bool _1721 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1723 = isnan(_670);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1729 = _1725 || _1727;
    float _1731 = float(_1729);
    float _1733 = fma(_1707, _1651, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1737 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1709);
    if (!_1607)
    {
        _1713 = _1633;
    }
    float _1739 = _1713;
    float _1741 = -_1731;
    float _1743 = _1741 + 1.0;
    float _1745 = _1739;
    if (_1607)
    {
        _1745 = _1719;
    }
    float _1747 = _1745;
    float _1749 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1751 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1753 = isnan(_670);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = 1.0 / _1657;
    float _1765 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1767 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1769 = isnan(_670);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = _1669 * _1699;
    float _1781 = _1765 * _1735;
    float _1783 = _1749 + _1657;
    float _1785 = _1761 * _1743;
    float _1787 = -_1761;
    float _1789 = _1787 + 1.0;
    out.m_69.x = _1781;
    out.m_69.y = _1779;
    float _1791 = _1783 * _1763;
    float _1793 = _1791 * 0.5;
    float _1795 = _1777 * _1789;
    float _1797 = -_1777;
    float _1799 = _1797 + 1.0;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1803 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1801);
    float _1805 = _1685 * _1795;
    float _1807 = _1659 * _1795;
    float _1809 = _1703 * _1795;
    float _1811 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1805);
    float _1813 = 1.0 / _1803;
    float _1815 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1807);
    float _1817 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1809);
    float _1819 = fma(_1701, _1785, _1811);
    float _1821 = fma(_1687, _1785, _1815);
    float _1823 = fma(_1733, _1785, _1817);
    float _1825 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1819);
    float _1827 = _1815;
    float _1829 = _1819;
    if (_1679)
    {
        _1827 = 1.0;
    }
    float _1831 = _1827;
    float _1833 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1821);
    float _1835 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1823);
    float _1837 = _1831;
    if (_1679)
    {
        _1829 = 1.0;
    }
    float _1839 = _1829;
    float _1841 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1845 = _1813 * _1843;
    float _1847 = _1839;
    if (!_1679)
    {
        float _1849 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1851 = _1849 * 0.15915493667125701904296875;
        float _1853 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1857 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1855;
        float _1859 = _1851 * 6.283185482025146484375;
        float _1861 = cos(_1859);
        float _1863 = _1853 * 0.15915493667125701904296875;
        float _1865 = _1851 * 6.283185482025146484375;
        float _1867 = sin(_1865);
        float _1869 = 1.0 / _1861;
        float _1871 = _1863 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1867 * _1869;
        float _1877 = _1863 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = 1.0 / _1857;
        float _1885 = 1.0 / _1881;
        float _1887 = _1879 * _1885;
        float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1891 = fma(_1845, _1887, _1889);
        float _1893 = _1891 * _1883;
        float _1895 = precise::clamp(_1893, 0.0, 1.0);
        _1837 = _1895;
    }
    float _1897 = _1837;
    if (!_1679)
    {
        float _1899 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1901 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1903 = _1899 * 0.15915493667125701904296875;
        float _1905 = _1901 * 0.15915493667125701904296875;
        float _1907 = _1903 * 6.283185482025146484375;
        float _1909 = cos(_1907);
        float _1911 = _1903 * 6.283185482025146484375;
        float _1913 = sin(_1911);
        float _1915 = 1.0 / _1909;
        float _1917 = _1905 * 6.283185482025146484375;
        float _1919 = cos(_1917);
        float _1921 = _1913 * _1915;
        float _1923 = _1905 * 6.283185482025146484375;
        float _1925 = sin(_1923);
        float _1927 = _1919 * _1921;
        float _1929 = 1.0 / _1927;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1933 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1931;
        float _1935 = 1.0 / _1933;
        float _1937 = _1925 * _1929;
        float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1941 = fma(_1845, _1937, _1939);
        float _1943 = _1941 * _1935;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        float _1947 = -_1945;
        float _1949 = _1947 + 1.0;
        _1847 = _1949;
    }
    float _1951 = _1847;
    float _1953 = exp2(_1841);
    float _1955 = _1897 * _1951;
    bool _1957 = _1897 > 0.0;
    bool _1959 = isnan(_1897);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan(0.0);
    bool _1965 = _1961 || _1963;
    float _1967 = _1825 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1969 = _1833 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1971 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1973 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1975 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1689);
    bool _1977 = _1951 <= 0.0;
    bool _1979 = !_1965;
    bool _1981 = _1977 || _1979;
    float _1983 = _1971 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1987 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1989 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1975 + _1470;
    float _1995 = _1520 + _1470;
    float _1997 = -_1953;
    float _1999 = _1997 + 1.0;
    float _2001 = _1470 * 0.5;
    out.m_71.x = _1987;
    out.m_71.y = _1989;
    out.m_71.z = _1991;
    out.m_71.w = _1985;
    float _2003 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2005 = _1993 * 0.5;
    float _2007 = _1995 * 0.5;
    float _2009 = fma(_1510, -0.5, _2001);
    float _2011 = _2003 * _1542;
    out.m_45.x = _1983;
    float _2013 = _1553 * _2011;
    float _2015 = _1563 * _2011;
    float _2017 = -_2003;
    float _2019 = _2017 + 1.0;
    out.gl_Position.x = _1520;
    out.gl_Position.y = _1510;
    out.gl_Position.z = _1975;
    out.gl_Position.w = _1470;
    float _2021 = fma(_1559, _2013, _1547);
    float _2023 = fma(_1561, _2013, _1549);
    float _2025 = _1553 * _2019;
    float _2027 = fma(_1553, _2015, _1551);
    out.m_73.x = _2007;
    out.m_73.y = _2009;
    out.m_73.z = _2005;
    out.m_73.w = _1470;
    out.m_75.x = _2021;
    out.m_75.y = _2023;
    out.m_75.z = _2027;
    out.m_75.w = _2025;
    if (!_1981)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2029 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2029;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _662 = false;
    bool _538 = false;
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
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2086 = as_type<float>(_110);
        out.gl_Position.z = _2086;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2155 = as_type<float>(_148);
        out.gl_Position.z = _2155;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = in.m_51.x;
    float _162 = in.m_51.y;
    float _164 = in.m_51.z;
    float _166 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_55.x;
    float _186 = _158 * _156;
    float _188 = 0.0;
    float _190 = _166;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_176)
    {
        float _194 = _166 * _166;
        float _196 = _194 * 0.5;
        _188 = _196;
    }
    float _198 = _188;
    float _200 = _150 * _150;
    float _202 = _152 * _152;
    float _204 = _154 * _154;
    float _206 = _198;
    if (!_176)
    {
        float _208 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    float _212 = fma(_160, _160, _200);
    float _214 = fma(_162, _162, _202);
    float _216 = fma(_164, _164, _204);
    float _218 = fma(_178, _178, _212);
    float _220 = fma(_180, _180, _214);
    float _222 = fma(_182, _182, _216);
    float _224 = sqrt(_218);
    float _226 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[20].x, _186);
    float _228 = sqrt(_220);
    float _230 = sqrt(_222);
    bool _232 = _224 > 0.0;
    bool _234 = _228 > 0.0;
    float _236 = floor(_226);
    int _238 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _240 = _238 != 0;
    bool _242 = _230 > 0.0;
    float _244 = _156;
    float _246 = _230;
    float _248 = _210;
    if (_232)
    {
        float _250 = rsqrt(_218);
        _244 = _250;
    }
    float _252 = _244;
    float _254 = 0.0;
    if (!_232)
    {
        _254 = 0.0;
    }
    float _256 = _254;
    float _258 = 0.0;
    float _260 = _256;
    if (!_232)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _262;
    if (!_232)
    {
        _246 = 0.0;
    }
    float _266 = _246;
    float _268 = _224;
    float _270 = _266;
    if (_234)
    {
        float _272 = rsqrt(_220);
        _268 = _272;
    }
    float _274 = _268;
    float _276 = -_236;
    float _278 = _226 + _276;
    float _280 = _226 * 6.283185482025146484375;
    float _282 = 0.0;
    if (_242)
    {
        float _284 = rsqrt(_222);
        _282 = _284;
    }
    float _286 = _282;
    bool _288 = !_176;
    if (!_288)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _166 * _292;
        float _302 = 1.0 / _296;
        float _304 = _298 * 0.693147182464599609375;
        float _306 = exp2(_300);
        float _308 = 1.0 / _304;
        float _310 = _306 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _308, _166);
        float _316 = _314 * _302;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _318;
    }
    float _320 = _248;
    bool _322 = !_176;
    if (!_322)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _166 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _190 = _342;
        _192 = _330;
    }
    float _344 = _190;
    float _346 = _192;
    float _348 = _280 * 0.15915493667125701904296875;
    float _350 = in.m_47.x;
    float _352 = in.m_47.y;
    float _354 = in.m_47.z;
    float _356 = 0.0;
    float _358 = 0.0;
    float _360 = _346;
    if (!_234)
    {
        _356 = 0.0;
        _358 = 0.0;
    }
    float _362 = _356;
    float _364 = _358;
    float _366 = _348 * 6.283185482025146484375;
    float _368 = cos(_366);
    float _370 = _364;
    float _372 = _362;
    if (!_234)
    {
        _360 = 0.0;
    }
    float _374 = _360;
    float _376 = _374;
    if (_232)
    {
        float _378 = _252 * _160;
        _260 = _378;
    }
    float _380 = _260;
    if (_232)
    {
        float _382 = _252 * _150;
        _264 = _382;
    }
    float _384 = _264;
    if (_232)
    {
        float _386 = _252 * _178;
        _270 = _386;
    }
    float _388 = _270;
    if (_234)
    {
        float _390 = _274 * _162;
        _376 = _390;
    }
    float _392 = _376;
    if (_234)
    {
        float _394 = _274 * _152;
        _370 = _394;
    }
    float _396 = _370;
    if (_234)
    {
        float _398 = _274 * _180;
        _372 = _398;
    }
    float _400 = _372;
    float _402 = in.m_57.w;
    float _404 = 0.0;
    float _406 = 0.0;
    if (!_242)
    {
        _404 = 0.0;
        _406 = 0.0;
    }
    float _408 = _404;
    float _410 = _406;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _418 = _416 != 0;
    float _420 = in.m_42.x;
    float _422 = in.m_42.y;
    float _424 = in.m_42.z;
    bool _426 = _278 < 0.5;
    float _428 = float(_426);
    float _430 = -_278;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _434 = fma(_368, 0.5, 0.5);
    bool _436 = !_414;
    int _438 = _436 ? 0 : 1;
    float _440 = _408;
    float _442 = _410;
    if (_242)
    {
        float _444 = _286 * _164;
        _440 = _444;
    }
    float _446 = _440;
    float _448 = 0.0;
    if (!_242)
    {
        _448 = 0.0;
    }
    float _450 = _448;
    float _452 = _450;
    if (_242)
    {
        float _454 = _286 * _154;
        _442 = _454;
    }
    float _456 = _442;
    if (_242)
    {
        float _458 = _286 * _182;
        _452 = _458;
    }
    float _460 = _452;
    float _462 = -_428;
    float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _466 = !_240;
    int _468 = _466 ? 0 : 1;
    float _470 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _472 = -_434;
    float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _476 = abs(_438);
    float _478 = fma(_344, _350, _470);
    int _480 = abs(_468);
    float _482 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _484 = !_418;
    int _486 = _484 ? 0 : 1;
    float _488 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _490 = fma(_344, _352, _482);
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _494 = fma(_344, _354, _488);
    int _496 = abs(_486);
    float _498 = fma(_490, _402, _422);
    float _500 = float(_476);
    float _502 = fma(_494, _402, _424);
    float _504 = float(_480);
    float _506 = fma(_478, _402, _420);
    float _508 = abs(_432);
    float _510 = _500 * _508;
    float _512 = float(_496);
    float _514 = fma(_504, _474, _510);
    float _516 = abs(_464);
    float _518 = fma(_512, _516, _514);
    bool _520 = !_492;
    float _536;
    if (!_520)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _524 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_94);
        float _542 = 1.0 / _540;
        float _544 = _128 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _550 = _546 + _548;
    bool _552 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_546);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _564;
    float _568 = -_562;
    float _570 = _568 + 1.0;
    bool _572 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _574 = isnan(_546);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = 1.0 / _566;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _590;
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _596 = _550 * _584;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _598;
    float _602 = in.m_57.x;
    float _604 = in.m_57.y;
    float _606 = in.m_57.z;
    float _608 = _582 * _570;
    float _610 = fma(_588, _596, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _612 = fma(_600, _596, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _614 = fma(_592, _596, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _616 = -_582;
    float _618 = _616 + 1.0;
    float _620 = _610 * _608;
    float _622 = _612 * _608;
    float _624 = _614 * _608;
    float _626 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].x, _620);
    float _628 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].y, _622);
    float _630 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _632 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[144].x, _626);
    float _634 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[144].y, _628);
    float _636 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[144].z, _630);
    float _638 = _632 * _602;
    float _640 = _634 * _604;
    float _642 = _636 * _606;
    bool _644 = !_594;
    float _660;
    if (!_644)
    {
        float _646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _648 = _184 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _652 = _650 * _646;
        float _654 = floor(_652);
        float _656 = -_654;
        float _658 = _652 + _656;
        _660 = _658;
        _662 = true;
    }
    else
    {
        float _664 = float(_94);
        float _666 = 1.0 / _664;
        float _668 = _128 * _666;
        _660 = _668;
    }
    _662 = false;
    float _670 = _660;
    float _672 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _674 = log2(_672);
    float _676 = in.m_55.y;
    float _678 = _184 * 2.0;
    float _680 = _498 * _162;
    float _682 = in.m_55.z;
    float _684 = _498 * _152;
    float _686 = _498 * _180;
    float _688 = floor(_678);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _692 = 1.0 + _690;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _704 = _702 != 0;
    float _706 = fma(_506, _160, _680);
    float _708 = fma(_506, _150, _684);
    float _710 = fma(_506, _178, _686);
    float _712 = in.m_51.w;
    float _714 = fma(_502, _164, _706);
    float _716 = _674 * _128;
    float _718 = 1.0 / _692;
    float _720 = in.m_49.w;
    bool _722 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(1.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = fma(_502, _154, _708);
    bool _734 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _742 = _738 || _740;
    float _744 = in.m_53.w;
    float _746 = fma(_502, _182, _710);
    float _748 = exp2(_716);
    float _750 = _676 * 2.0;
    bool _752 = _688 > 0.0;
    float _754 = _518 * _640;
    float _756 = _682 * 2.0;
    float _758 = _676 + _682;
    bool _760 = _688 >= 0.0;
    bool _762 = isnan(_688);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.0);
    bool _768 = _764 || _766;
    float _770 = _518 * _638;
    float _772 = floor(_750);
    float _774 = _758 + (-1.0);
    float _776 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _778 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _780 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _782 = _714 + _712;
    float _784 = in.m_59.x;
    float _786 = in.m_59.y;
    float _788 = in.m_59.z;
    float _790 = floor(_756);
    float _792 = -_748;
    float _794 = _792 + 1.0;
    float _796 = _732 + _720;
    float _798 = _518 * _642;
    float _800 = _746 + _744;
    float _802 = _742 ? _794 : 0.0;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _806 = _796 + _804;
    bool _808 = _772 >= 0.0;
    bool _810 = isnan(_772);
    bool _812 = _808 || _810;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    float _818 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _820 = !_700;
    int _822 = _820 ? 0 : 1;
    if (_730)
    {
        float _824 = _802 * _718;
        _132 = _824;
    }
    float _826 = _132;
    bool _828 = _772 > 0.0;
    float _830 = _806 * _806;
    int _832 = _768 ? 0 : 1;
    bool _834 = _790 > 0.0;
    bool _836 = _790 >= 0.0;
    bool _838 = isnan(_790);
    bool _840 = _836 || _838;
    bool _842 = isnan(0.0);
    bool _844 = _840 || _842;
    int _846 = abs(_822);
    int _848 = ~_832;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    int _854 = _852;
    if (!_752)
    {
        int _856 = ~_832;
        int _858 = _856 + 1;
        _854 = _858;
    }
    int _860 = _854;
    int _862 = _816 ? 0 : 1;
    float _864 = float(_846);
    float _866 = float(_860);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _870 = _782 + _868;
    int _872 = ~_862;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    int _878 = _876;
    if (!_828)
    {
        int _880 = ~_862;
        int _882 = _880 + 1;
        _878 = _882;
    }
    int _884 = _878;
    float _886 = _864 * _866;
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _890 = _800 + _888;
    float _892 = fma(_870, _870, _830);
    int _894 = _844 ? 0 : 1;
    float _896 = _886 * (-2.0);
    bool _898 = !_704;
    int _900 = _898 ? 0 : 1;
    float _902 = fma(_890, _890, _892);
    int _904 = ~_894;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    float _910 = fma(_780, _896, _780);
    float _912 = fma(_896, _786, _786);
    int _914 = _908;
    if (!_834)
    {
        int _916 = ~_894;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = rsqrt(_902);
    bool _924 = !_696;
    int _926 = _924 ? 0 : 1;
    float _928 = _184 + _676;
    int _930 = abs(_900);
    int _932 = abs(_926);
    float _934 = _676 + (-0.5);
    float _936 = float(_930);
    float _938 = _928 + (-1.0);
    float _940 = float(_884);
    float _942 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[196].y, _912);
    float _944 = float(_932);
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _948 = float(_920);
    float _950 = _936 * _940;
    float _952 = fma(_910, _826, _942);
    float _954 = _806 * _922;
    float _956 = _944 * _948;
    float _958 = _870 * _922;
    float _960 = -_954;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _806);
    float _964 = _952 * 0.15915493667125701904296875;
    float _966 = _956 * (-2.0);
    float _968 = -_958;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _870);
    float _972 = _962 * _962;
    float _974 = _890 * _922;
    float _976 = fma(_946, _966, _946);
    float _978 = fma(_966, _784, _784);
    float _980 = fma(_970, _970, _972);
    float _982 = -_974;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _986 = _184 + (-0.5);
    float _988 = _184 + _682;
    float _990 = _682 + (-0.5);
    float _992 = fma(_984, _984, _980);
    float _994 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[196].x, _978);
    float _996 = _988 + (-1.0);
    float _998 = _950 * (-2.0);
    float _1000 = fma(_976, _826, _994);
    float _1002 = sqrt(_992);
    float _1004 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1006 = fma(_998, _788, _788);
    float _1008 = in.m_61.x;
    float _1010 = in.m_61.y;
    float _1012 = in.m_61.z;
    float _1014 = _1000 * 0.15915493667125701904296875;
    float _1016 = fma(_1004, _998, _1004);
    float _1018 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1006);
    float _1020 = _964 * 6.283185482025146484375;
    float _1022 = sin(_1020);
    float _1024 = fma(_1016, _826, _1018);
    float _1026 = _1024 * 0.15915493667125701904296875;
    float _1028 = _964 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = _922 * _1002;
    float _1034 = _776 * _1032;
    float _1036 = _778 * _1032;
    float _1038 = _818 * _1032;
    float _1040 = _1014 * 6.283185482025146484375;
    float _1042 = sin(_1040);
    float _1044 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1010);
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1008);
    float _1048 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1012);
    float _1050 = _1034 * _1044;
    float _1052 = _1014 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    float _1056 = _1036 * _1046;
    float _1058 = _1038 * _1048;
    float _1060 = _1026 * 6.283185482025146484375;
    float _1062 = cos(_1060);
    float _1064 = _1042 * _1022;
    float _1066 = _1026 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _1054 * _1030;
    float _1072 = _1054 * _1022;
    float _1074 = _1062 * _1050;
    float _1076 = _1022 * _1062;
    float _1078 = _1030 * _1062;
    float _1080 = _1042 * _1030;
    float _1082 = _1054 * _1074;
    float _1084 = _1042 * _1074;
    float _1086 = fma(_1068, _1070, _1064);
    float _1088 = -_1050;
    float _1090 = _1068 * _1088;
    float _1092 = fma(_1068, _1064, _1070);
    float _1094 = fma(_1086, _1056, _1082);
    float _1096 = -_1080;
    float _1098 = fma(_1068, _1072, _1096);
    float _1100 = -_1072;
    float _1102 = fma(_1068, _1080, _1100);
    float _1104 = fma(_1078, _1056, _1090);
    float _1106 = fma(_1098, _1058, _1094);
    float _1108 = fma(_1102, _1056, _1084);
    float _1110 = fma(_1076, _1058, _1104);
    float _1112 = _1106 * _400;
    float _1114 = fma(_1092, _1058, _1108);
    float _1116 = _1106 * _392;
    float _1118 = _1106 * _396;
    float _1120 = fma(_1110, _388, _1112);
    float _1122 = fma(_1110, _380, _1116);
    float _1124 = fma(_1110, _384, _1118);
    float _1126 = fma(_1114, _460, _1120);
    float _1128 = fma(_1114, _446, _1122);
    float _1130 = fma(_1114, _456, _1124);
    float _1132 = _800 + _1126;
    float _1134 = _782 + _1128;
    float _1136 = _796 + _1130;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1132 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1144 = _1134 + _1142;
    float _1146 = _1140 * _1140;
    float _1148 = fma(_1144, _1144, _1146);
    float _1150 = sqrt(_1148);
    bool _1152 = _1150 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1154 = _1114;
    float _1156 = _1146;
    float _1158 = _1134;
    float _1160 = _1140;
    float _1162 = _1132;
    if (!_1152)
    {
        _1154 = _1132;
    }
    float _1164 = _1154;
    float _1166 = _1164;
    if (!_1152)
    {
        _1156 = _1136;
    }
    float _1168 = _1156;
    bool _1170 = !_1152;
    float _1172 = _1168;
    if (!_1170)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1178 = _1150 + _1176;
        float _1180 = _1136 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = rsqrt(_1148);
        float _1184 = _1178 * _1174;
        float _1186 = _1184 * 0.15915493667125701904296875;
        float _1188 = _1186 * 6.283185482025146484375;
        float _1190 = sin(_1188);
        float _1192 = _1186 * 6.283185482025146484375;
        float _1194 = cos(_1192);
        float _1196 = fma(_1190, _1180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1198 = _1182 * _1196;
        float _1200 = _1194 + (-1.0);
        float _1202 = fma(_1144, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1204 = fma(_1140, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1206 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = fma(_1136, _1194, _1206);
        _1172 = _1208;
        _1158 = _1202;
        _1166 = _1204;
    }
    float _1210 = _1172;
    float _1212 = _1158;
    float _1214 = _1166;
    float _1216 = -_954;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1220 = -_958;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1224 = -_974;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1218 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1222 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1226 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1230;
    if (_1264)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1278;
    }
    float _1280 = _1270;
    if (_1264)
    {
        float _1282 = rsqrt(_1260);
        _1272 = _1282;
    }
    float _1284 = _1272;
    if (_1264)
    {
        float _1286 = _1268 * _1280;
        _1274 = _1286;
    }
    float _1288 = _1274;
    if (_1264)
    {
        float _1290 = _1288 * 0.15915493667125701904296875;
        _1160 = _1290;
    }
    float _1292 = _1160;
    float _1294 = _1240;
    if (_1264)
    {
        float _1296 = _1292 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        _1294 = _1298;
    }
    float _1300 = _1294;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1304 = precise::max(0.0, _1302);
    float _1306 = _1246;
    float _1308 = _1304;
    float _1310 = _1302;
    if (_1264)
    {
        float _1312 = _1292 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        _1306 = _1314;
    }
    float _1316 = _1306;
    float _1318 = -_1250;
    float _1320 = -_1304;
    float _1322 = fma(_1230, _1318, _1320);
    if (!_1264)
    {
        _1308 = _1252;
    }
    float _1324 = _1308;
    float _1326 = _1324;
    if (_1264)
    {
        float _1328 = _1322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1310 = _1328;
    }
    float _1330 = _1310;
    float _1332 = _1330;
    float _1334 = _1300;
    if (_1264)
    {
        float _1336 = fma(_1300, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1162 = _1336;
    }
    float _1338 = _1162;
    float _1340 = _1338;
    if (!_1264)
    {
        _1332 = _1322;
    }
    float _1342 = _1332;
    float _1344 = _1342;
    float _1346 = _1316;
    if (_1264)
    {
        float _1348 = _1316 + (-1.0);
        _1276 = _1348;
    }
    float _1350 = _1276;
    float _1352 = _1350;
    if (_1264)
    {
        float _1354 = _1284 * _1338;
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1264)
    {
        float _1360 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1360;
    }
    float _1362 = _1334;
    float _1364 = _1362;
    if (_1264)
    {
        float _1366 = _1252 * _1356;
        _1326 = _1366;
    }
    float _1368 = _1326;
    if (!_1264)
    {
        _1352 = _1254;
    }
    float _1370 = _1352;
    float _1372 = _1370;
    if (_1264)
    {
        float _1374 = _1254 * _1356;
        _1372 = _1374;
    }
    float _1376 = _1372;
    if (_1264)
    {
        float _1378 = fma(_1322, _1316, _1362);
        _1344 = _1378;
    }
    float _1380 = _1344;
    if (!_1264)
    {
        _1364 = _1256;
    }
    float _1382 = _1364;
    float _1384 = _1382;
    if (_1264)
    {
        float _1386 = _1368 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1264)
    {
        _1346 = _1258;
    }
    float _1392 = _1346;
    float _1394 = _1392;
    if (_1264)
    {
        float _1396 = _1376 * _1376;
        _1394 = _1396;
    }
    float _1398 = _1394;
    float _1400 = fma(_1380, _1380, _1388);
    float _1402 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1390);
    float _1404 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1406 = _1400 + _1398;
    float _1408 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1358);
    float _1410 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1404);
    float _1412 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1402);
    float _1414 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1408);
    float _1418 = rsqrt(_1406);
    float _1420 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1410);
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1424 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1422);
    float _1426 = precise::clamp(_1424, 0.0, 1.0);
    float _1428 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1430 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1432 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1434 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = -_1426;
    float _1438 = _1436 + 1.0;
    float _1440 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1442 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1446 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1430);
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1440);
    float _1450 = abs(_1438);
    float _1452 = log2(_1450);
    float _1454 = -_1444;
    float _1456 = fma(_1454, _1442, 1.0);
    float _1458 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1460 = _1418 * _1368;
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1448);
    float _1464 = _1418 * _1380;
    float _1466 = _1418 * _1376;
    float _1468 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1470 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    float _1472 = log2(_1456);
    float _1474 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1476 = -_1468;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1476);
    float _1480 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1474);
    float _1482 = -_1466;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1478);
    float _1486 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1488 = 1.0 / _1470;
    float _1490 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = fma(_1484, -0.5, 0.5);
    float _1494 = fma(_1484, 0.5, 0.5);
    float _1496 = _1464 + 1.0;
    float _1498 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1500 = fma(_1494, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1502 = exp2(_1486);
    float _1504 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1498);
    float _1506 = _1472 * 0.693147182464599609375;
    float _1508 = fma(_1494, _1500, -0.212114393711090087890625);
    float _1510 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1504);
    float _1512 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1514 = fma(_1494, _1508, 1.570728778839111328125);
    float _1516 = sqrt(_1492);
    float _1518 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1480);
    float _1520 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1518);
    float _1522 = -_1464;
    float _1524 = fma(_1502, _1496, _1522);
    float _1526 = _1520 * _1488;
    float _1528 = _1510 * _1488;
    float _1530 = fma(_1524, 0.5, 0.5);
    float _1532 = fma(_1526, 0.5, 0.5);
    float _1534 = fma(_1528, -0.5, 0.5);
    float _1536 = _1516 * 0.636619746685028076171875;
    float _1538 = -_1514;
    float _1540 = fma(_1536, _1538, 1.0);
    float3 _4234 = float3(_1532, _1534, _1512);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4234, float3(0.0), isnan(_4234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4234, float3(0.0), isnan(_4234)), level(0.0)).x;
    float3 _4245 = float3(_1532, _1534, _1512);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4245, float3(0.0), isnan(_4245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4245, float3(0.0), isnan(_4245)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _4262 = float2(_1540, _1530);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4262, float2(0.0), isnan(_4262)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4262, float2(0.0), isnan(_4262)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = in.m_63.y;
    float _1567 = -_954;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _1571 = -_958;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1577 = _1575 != 0;
    float _1579 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1581 = _676 > 0.5;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1583;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1591 = -_974;
    float _1593 = fma(_1591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _800);
    float _1595 = 1.0 / _1585;
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1579);
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1601 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1597);
    float _1603 = 1.0 / _1589;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1611 = -_1565;
    float _1613 = _1611 + 1.0;
    bool _1615 = _184 > 0.5;
    bool _1617 = _1615 && _1607;
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1621 = _670 + _1619;
    float _1623 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1609);
    float _1625 = _1565;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1577)
    {
        float _1629 = _1581 ? _1613 : _1565;
        _1625 = _1629;
    }
    float _1631 = _1625;
    float _1633 = in.m_63.x;
    float _1635 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1643 = _670 + _1641;
    float _1645 = _1621 * _1595;
    float _1647 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1643 * _1603;
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1653;
    out.m_67.x = _1635;
    out.m_67.y = _1647;
    out.m_67.z = _1649;
    float _1657 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1659 = fma(_1655, _1645, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1663 = _1661 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1665;
    float _1669 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1671 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1673 = isnan(0.5);
    bool _1675 = _1671 || _1673;
    bool _1677 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1679 = _1675 || _1677;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1683 = _1681 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1685 = fma(_1667, _1645, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1687 = fma(_1663, _1651, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1689 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1623);
    if (_1607)
    {
        _1627 = _1633;
    }
    float _1691 = _1627;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1693;
    float _1697 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1701 = fma(_1683, _1651, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1703 = fma(_1695, _1645, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1709 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1697);
    float _1711 = _1691;
    float _1713 = _1707;
    if (_1617)
    {
        float _1715 = -_1691;
        float _1717 = _1715 + 1.0;
        _1711 = _1717;
    }
    float _1719 = _1711;
    bool _1721 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1723 = isnan(_670);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1729 = _1725 || _1727;
    float _1731 = float(_1729);
    float _1733 = fma(_1707, _1651, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1737 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1709);
    if (!_1607)
    {
        _1713 = _1633;
    }
    float _1739 = _1713;
    float _1741 = -_1731;
    float _1743 = _1741 + 1.0;
    float _1745 = _1739;
    if (_1607)
    {
        _1745 = _1719;
    }
    float _1747 = _1745;
    float _1749 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1751 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1753 = isnan(_670);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = 1.0 / _1657;
    float _1765 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1767 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1769 = isnan(_670);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = _1669 * _1699;
    float _1781 = _1765 * _1735;
    float _1783 = _1749 + _1657;
    float _1785 = _1761 * _1743;
    float _1787 = -_1761;
    float _1789 = _1787 + 1.0;
    out.m_69.x = _1781;
    out.m_69.y = _1779;
    float _1791 = _1783 * _1763;
    float _1793 = _1791 * 0.5;
    float _1795 = _1777 * _1789;
    float _1797 = -_1777;
    float _1799 = _1797 + 1.0;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1803 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1801);
    float _1805 = _1685 * _1795;
    float _1807 = _1659 * _1795;
    float _1809 = _1703 * _1795;
    float _1811 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1805);
    float _1813 = 1.0 / _1803;
    float _1815 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1807);
    float _1817 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1809);
    float _1819 = fma(_1701, _1785, _1811);
    float _1821 = fma(_1687, _1785, _1815);
    float _1823 = fma(_1733, _1785, _1817);
    float _1825 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1819);
    float _1827 = _1815;
    float _1829 = _1819;
    if (_1679)
    {
        _1827 = 1.0;
    }
    float _1831 = _1827;
    float _1833 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1821);
    float _1835 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1823);
    float _1837 = _1831;
    if (_1679)
    {
        _1829 = 1.0;
    }
    float _1839 = _1829;
    float _1841 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1845 = _1813 * _1843;
    float _1847 = _1839;
    if (!_1679)
    {
        float _1849 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1851 = _1849 * 0.15915493667125701904296875;
        float _1853 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1857 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1855;
        float _1859 = _1851 * 6.283185482025146484375;
        float _1861 = cos(_1859);
        float _1863 = _1853 * 0.15915493667125701904296875;
        float _1865 = _1851 * 6.283185482025146484375;
        float _1867 = sin(_1865);
        float _1869 = 1.0 / _1861;
        float _1871 = _1863 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1867 * _1869;
        float _1877 = _1863 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = 1.0 / _1857;
        float _1885 = 1.0 / _1881;
        float _1887 = _1879 * _1885;
        float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1891 = fma(_1845, _1887, _1889);
        float _1893 = _1891 * _1883;
        float _1895 = precise::clamp(_1893, 0.0, 1.0);
        _1837 = _1895;
    }
    float _1897 = _1837;
    if (!_1679)
    {
        float _1899 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1901 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1903 = _1899 * 0.15915493667125701904296875;
        float _1905 = _1901 * 0.15915493667125701904296875;
        float _1907 = _1903 * 6.283185482025146484375;
        float _1909 = cos(_1907);
        float _1911 = _1903 * 6.283185482025146484375;
        float _1913 = sin(_1911);
        float _1915 = 1.0 / _1909;
        float _1917 = _1905 * 6.283185482025146484375;
        float _1919 = cos(_1917);
        float _1921 = _1913 * _1915;
        float _1923 = _1905 * 6.283185482025146484375;
        float _1925 = sin(_1923);
        float _1927 = _1919 * _1921;
        float _1929 = 1.0 / _1927;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1933 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1931;
        float _1935 = 1.0 / _1933;
        float _1937 = _1925 * _1929;
        float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1941 = fma(_1845, _1937, _1939);
        float _1943 = _1941 * _1935;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        float _1947 = -_1945;
        float _1949 = _1947 + 1.0;
        _1847 = _1949;
    }
    float _1951 = _1847;
    float _1953 = exp2(_1841);
    float _1955 = _1897 * _1951;
    bool _1957 = _1897 > 0.0;
    bool _1959 = isnan(_1897);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan(0.0);
    bool _1965 = _1961 || _1963;
    float _1967 = _1825 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1969 = _1833 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1971 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1973 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1975 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1689);
    bool _1977 = _1951 <= 0.0;
    bool _1979 = !_1965;
    bool _1981 = _1977 || _1979;
    float _1983 = _1971 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1987 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1989 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1975 + _1470;
    float _1995 = _1520 + _1470;
    float _1997 = -_1953;
    float _1999 = _1997 + 1.0;
    float _2001 = _1470 * 0.5;
    out.m_71.x = _1987;
    out.m_71.y = _1989;
    out.m_71.z = _1991;
    out.m_71.w = _1985;
    float _2003 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2005 = _1993 * 0.5;
    float _2007 = _1995 * 0.5;
    float _2009 = fma(_1510, -0.5, _2001);
    float _2011 = _2003 * _1542;
    out.m_45.x = _1983;
    float _2013 = _1553 * _2011;
    float _2015 = _1563 * _2011;
    float _2017 = -_2003;
    float _2019 = _2017 + 1.0;
    out.gl_Position.x = _1520;
    out.gl_Position.y = _1510;
    out.gl_Position.z = _1975;
    out.gl_Position.w = _1470;
    float _2021 = fma(_1559, _2013, _1547);
    float _2023 = fma(_1561, _2013, _1549);
    float _2025 = _1553 * _2019;
    float _2027 = fma(_1553, _2015, _1551);
    out.m_73.x = _2007;
    out.m_73.y = _2009;
    out.m_73.z = _2005;
    out.m_73.w = _1470;
    out.m_75.x = _2021;
    out.m_75.y = _2023;
    out.m_75.z = _2027;
    out.m_75.w = _2025;
    if (!_1981)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2029 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2029;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

