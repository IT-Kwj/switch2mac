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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_83 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(0)]];
    float4 m_55 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_77 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_79 [[attribute(11)]];
    float4 m_67 [[attribute(12)]];
    float4 m_69 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1891 = false;
    bool _350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2190 = as_type<float>(_134);
        out.gl_Position.z = _2190;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_51.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_148)
    {
        float _154 = float(_118);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2259 = as_type<float>(_170);
        out.gl_Position.z = _2259;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = _208;
    if (_214)
    {
        float _220 = rsqrt(_202);
        _218 = _220;
    }
    float _222 = _218;
    float _224 = 0.0;
    if (!_214)
    {
        _224 = 0.0;
    }
    float _226 = _224;
    bool _228 = _212 > 0.0;
    float _230 = 0.0;
    float _232 = _226;
    if (!_214)
    {
        _230 = 0.0;
    }
    float _234 = _230;
    float _236 = 0.0;
    float _238 = _234;
    if (!_214)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = _210;
    float _244 = _240;
    if (_216)
    {
        float _246 = rsqrt(_204);
        _242 = _246;
    }
    float _248 = _242;
    float _250 = 0.0;
    if (!_216)
    {
        _250 = 0.0;
    }
    float _252 = _250;
    float _254 = 0.0;
    float _256 = _252;
    if (!_216)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = 0.0;
    float _262 = _258;
    if (!_216)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = 0.0;
    float _268 = _264;
    if (_228)
    {
        float _270 = rsqrt(_206);
        _266 = _270;
    }
    float _272 = _266;
    if (_214)
    {
        float _274 = _222 * _178;
        _232 = _274;
    }
    float _276 = _232;
    if (_214)
    {
        float _278 = _222 * _172;
        _238 = _278;
    }
    float _280 = _238;
    if (_214)
    {
        float _282 = _222 * _184;
        _244 = _282;
    }
    float _284 = _244;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 0.0;
    if (!_228)
    {
        _288 = 0.0;
    }
    float _290 = _288;
    float _292 = 0.0;
    float _294 = _290;
    if (!_228)
    {
        _292 = 0.0;
    }
    float _296 = _292;
    float _298 = _296;
    if (_216)
    {
        float _300 = _248 * _180;
        _256 = _300;
    }
    float _302 = _256;
    float _304 = 0.0;
    if (!_228)
    {
        _304 = 0.0;
    }
    float _306 = _304;
    float _308 = _306;
    if (_216)
    {
        float _310 = _248 * _174;
        _262 = _310;
    }
    float _312 = _262;
    if (_216)
    {
        float _314 = _248 * _186;
        _268 = _314;
    }
    float _316 = _268;
    if (_228)
    {
        float _318 = _272 * _182;
        _294 = _318;
    }
    float _320 = _294;
    if (_228)
    {
        float _322 = _272 * _176;
        _298 = _322;
    }
    float _324 = _298;
    if (_228)
    {
        float _326 = _272 * _188;
        _308 = _326;
    }
    float _328 = _308;
    bool _330 = !_286;
    float _348;
    if (!_330)
    {
        float _332 = in.m_59.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_118);
        float _354 = 1.0 / _352;
        float _356 = _152 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_46.x;
    float _362 = in.m_46.y;
    float _364 = in.m_46.z;
    float _366 = (*spvDescriptorSet0.vp_c8)._m0[32].y * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _368 = in.m_61.x;
    float _370 = in.m_61.y;
    float _372 = in.m_61.z;
    float _374 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _366);
    float _376 = in.m_53.w;
    float _378 = fma((*spvDescriptorSet0.vp_c8)._m0[32].z, (*spvDescriptorSet0.vp_c8)._m0[32].z, _374);
    float _380 = in.m_63.x;
    float _382 = in.m_63.y;
    float _384 = in.m_63.z;
    float _386 = rsqrt(_378);
    float _388 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _390 = _174 * _362;
    float _392 = _186 * _362;
    float _394 = _180 * _362;
    float _396 = _388 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _398 = fma(_172, _360, _390);
    float _400 = fma(_184, _360, _392);
    float _402 = _396 * 0.15915493667125701904296875;
    float _404 = fma(_176, _364, _398);
    float _406 = _370 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = _386 * (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _410 = _386 * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _412 = fma(_178, _360, _394);
    float _414 = _402 * 6.283185482025146484375;
    float _416 = cos(_414);
    float _418 = _408 * _408;
    float _420 = _368 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _422 = _372 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _426 = fma(_410, _410, _418);
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _382);
    float _430 = fma(_182, _364, _412);
    float _432 = _402 * 6.283185482025146484375;
    float _434 = sin(_432);
    float _436 = in.m_55.w;
    float _438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _380);
    float _440 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _428 * _424;
    float _444 = in.m_57.w;
    float _446 = fma(_188, _364, _400);
    float _448 = _438 * _440;
    float _450 = rsqrt(_426);
    float _452 = _442 * _302;
    float _454 = _442 * _312;
    float _456 = _442 * _316;
    float _458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _384);
    float _460 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _462 = fma(_448, _276, _452);
    float _464 = fma(_448, _280, _454);
    float _466 = fma(_448, _284, _456);
    float _468 = -_416;
    float _470 = _468 + 1.0;
    float _472 = _458 * _460;
    float _474 = _404 + _376;
    float _476 = fma(_472, _324, _464);
    float _478 = fma(_472, _320, _462);
    float _480 = _410 * _450;
    float _482 = -_450;
    float _484 = _408 * _482;
    float _486 = fma(_472, _328, _466);
    float _488 = _430 + _436;
    float _490 = _480 * _470;
    float _492 = _480 * _434;
    float _494 = _484 * _484;
    float _496 = _484 * _434;
    float _498 = fma(_480, _490, _416);
    float _500 = _484 * _490;
    float _502 = _476 * _492;
    float _504 = fma(_470, _494, _416);
    float _506 = _476 * _496;
    float _508 = _474 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _510 = fma(_478, _500, _502);
    float _512 = _446 + _444;
    float _514 = -_506;
    float _516 = fma(_478, _498, _514);
    float _518 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[11].x, _508);
    float _520 = fma(_486, _504, _510);
    float _522 = _474 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _524 = fma(_486, _500, _516);
    float _526 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _518);
    float _528 = _512 + _520;
    float _530 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[10].x, _522);
    float _532 = _488 + _524;
    float _534 = _526 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _538 = _528 + _536;
    float _540 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _530);
    float _542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _544 = _532 + _542;
    float _546 = 1.0 / _534;
    float _548 = _538 * _538;
    float _550 = _540 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _552 = _476 * _416;
    float _554 = fma(_544, _544, _548);
    float _556 = _550 + _534;
    float _558 = fma(_478, _496, _552);
    float _560 = sqrt(_554);
    bool _562 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _564 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.5);
    bool _570 = _566 || _568;
    float _572 = -_492;
    float _574 = fma(_486, _572, _558);
    float _576 = _556 * _546;
    float _578 = _576 * 0.5;
    float _580 = _474 + _574;
    float _582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _584 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[30].w, _582);
    float _586 = 0.0;
    float _588 = _474;
    float _590 = _552;
    float _592 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _594 = _532;
    float _596 = _488;
    int _598 = as_type<int>(_358);
    if (_570)
    {
        _586 = 1.0;
    }
    float _600 = _586;
    bool _602 = _560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _604 = 1.0 / _584;
    float _606 = _600;
    if (!_602)
    {
        _588 = _532;
    }
    float _608 = _588;
    float _610 = _608;
    if (!_602)
    {
        _590 = _528;
    }
    float _612 = _590;
    float _614 = _612;
    if (!_602)
    {
        _592 = _580;
    }
    float _616 = _592;
    bool _618 = !_602;
    float _620 = _616;
    if (!_618)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _626 = _560 + _624;
        float _628 = _580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _630 = rsqrt(_554);
        float _632 = _626 * _622;
        float _634 = _632 * 0.15915493667125701904296875;
        float _636 = _634 * 6.283185482025146484375;
        float _638 = cos(_636);
        float _640 = _634 * 6.283185482025146484375;
        float _642 = sin(_640);
        float _644 = _638 + (-1.0);
        float _646 = _644 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _648 = fma(_642, _628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _650 = fma(_580, _638, _646);
        float _652 = _630 * _648;
        float _654 = fma(_544, _652, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _656 = fma(_538, _652, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _620 = _650;
        _610 = _654;
        _614 = _656;
    }
    float _658 = _620;
    float _660 = _610;
    float _662 = _614;
    float _664 = 0.0;
    if (_570)
    {
        _664 = 1.0;
    }
    float _666 = _664;
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _670 = _604 * _668;
    float _672 = _666;
    if (!_570)
    {
        float _674 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _678 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _676;
        float _680 = _674 * 0.15915493667125701904296875;
        float _682 = 1.0 / _678;
        float _684 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _686 = _680 * 6.283185482025146484375;
        float _688 = cos(_686);
        float _690 = _684 * 0.15915493667125701904296875;
        float _692 = _680 * 6.283185482025146484375;
        float _694 = sin(_692);
        float _696 = 1.0 / _688;
        float _698 = _690 * 6.283185482025146484375;
        float _700 = cos(_698);
        float _702 = _694 * _696;
        float _704 = _690 * 6.283185482025146484375;
        float _706 = sin(_704);
        float _708 = _700 * _702;
        float _710 = 1.0 / _708;
        float _712 = _706 * _710;
        float _714 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _716 = fma(_670, _712, _714);
        float _718 = _716 * _682;
        float _720 = precise::clamp(_718, 0.0, 1.0);
        _594 = _690;
        _606 = _720;
    }
    float _722 = _594;
    float _724 = _606;
    float _726 = _722;
    if (!_570)
    {
        float _728 = in.m_65.w;
        int _730 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _732 = _730 == 4;
        bool _734 = _730 == 8;
        bool _736 = _730 == 12;
        int _738 = as_type<int>(_728) << 16;
        int _740 = as_type<int>(_728) << 8;
        int _742 = as_type<int>(_728) << 24;
        int _744 = _738 >> 24;
        int _746 = _740 >> 24;
        int _748 = as_type<int>(_728) >> 24;
        int _750 = _742 >> 24;
        float _752 = float(_744);
        float _754 = float(_746);
        float _756 = float(_748);
        float _758 = _752 * 0.0078740157186985015869140625;
        float _760 = float(_750);
        float _762 = _754 * 0.0078740157186985015869140625;
        float _764 = _756 * 0.0078740157186985015869140625;
        float _766 = precise::min(_758, 1.0);
        float _768 = _760 * 0.0078740157186985015869140625;
        float _770 = precise::min(_762, 1.0);
        float _772 = precise::min(_764, 1.0);
        float _774 = precise::min(_768, 1.0);
        float _776 = precise::max(_766, -1.0);
        float _778 = precise::max(_770, -1.0);
        float _780 = precise::max(_772, -1.0);
        float _782 = precise::max(_774, -1.0);
        float _784 = _782;
        if (_732)
        {
            _784 = _776;
        }
        float _786 = _784;
        float _788 = _786;
        if (_734)
        {
            _788 = _778;
        }
        float _790 = _788;
        float _792 = _790;
        if (_736)
        {
            _792 = _780;
        }
        float _794 = _792;
        float _796 = abs(_794);
        float _798 = (-0.0) + _796;
        _672 = _798;
    }
    float _800 = _672;
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _804 = _658 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _660 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _812 = _662 + _810;
    float _814 = _804 * _804;
    bool _816 = _800 != 0.0;
    bool _818 = isnan(_800);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    float _826 = fma(_808, _808, _814);
    float _828 = fma(_812, _812, _826);
    float _830 = rsqrt(_828);
    float _832 = sqrt(_828);
    float _834 = _830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _836 = _808 * _834;
    float _838 = _812 * _834;
    float _840 = _836 * _836;
    float _842 = _838 * _838;
    float _844 = _840 + _842;
    float _846 = sqrt(_844);
    bool _848 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _846 + _850;
    float _854 = _812;
    float _856 = _844;
    float _858 = _852;
    float _860 = _804;
    float _862 = _814;
    float _864 = _836;
    if (_848)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _866;
    }
    float _868 = _854;
    if (_848)
    {
        float _870 = rsqrt(_844);
        _856 = _870;
    }
    float _872 = _856;
    if (_848)
    {
        float _874 = _852 * _868;
        _858 = _874;
    }
    float _876 = _858;
    if (_848)
    {
        float _878 = _876 * 0.15915493667125701904296875;
        _726 = _878;
    }
    float _880 = _726;
    float _882 = _868;
    if (_848)
    {
        float _884 = _880 * 6.283185482025146484375;
        float _886 = sin(_884);
        _882 = _886;
    }
    float _888 = _882;
    float _890 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _892 = precise::max(0.0, _890);
    float _894 = _830;
    float _896 = _892;
    if (_848)
    {
        float _898 = _880 * 6.283185482025146484375;
        float _900 = cos(_898);
        _894 = _900;
    }
    float _902 = _894;
    float _904 = -_834;
    float _906 = -_892;
    float _908 = fma(_804, _904, _906);
    float _910 = _908;
    if (!_848)
    {
        _860 = _838;
    }
    float _912 = _860;
    float _914 = _912;
    if (_848)
    {
        float _916 = _908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _896 = _916;
    }
    float _918 = _896;
    float _920 = _888;
    float _922 = _918;
    if (_848)
    {
        float _924 = fma(_888, _918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _920 = _924;
    }
    float _926 = _920;
    if (_848)
    {
        float _928 = _902 + (-1.0);
        _922 = _928;
    }
    float _930 = _922;
    float _932 = 0.0;
    float _934 = _930;
    if (_848)
    {
        float _936 = _872 * _926;
        _932 = _936;
    }
    float _938 = _932;
    float _940 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _942 = _940;
    if (!_848)
    {
        _596 = _840;
    }
    float _944 = _596;
    float _946 = _944;
    if (_848)
    {
        float _948 = _930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _862 = _948;
    }
    float _950 = _862;
    if (_848)
    {
        float _952 = _836 * _938;
        _864 = _952;
    }
    float _954 = _864;
    if (_848)
    {
        float _956 = _838 * _938;
        _914 = _956;
    }
    float _958 = _914;
    if (!_848)
    {
        _934 = _842;
    }
    float _960 = _934;
    float _962 = _960;
    if (_848)
    {
        float _964 = fma(_908, _902, _950);
        _910 = _964;
    }
    float _966 = _910;
    if (_848)
    {
        float _968 = _954 * _954;
        _946 = _968;
    }
    float _970 = _946;
    if (_848)
    {
        float _972 = _958 * _958;
        _962 = _972;
    }
    float _974 = _962;
    float _976 = _658 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _978 = fma(_966, _966, _970);
    float _980 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[2].x, _976);
    float _982 = floor(_940);
    float _984 = _978 + _974;
    float _986 = _658 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _988 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[2].z, _980);
    float _990 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _992 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[1].x, _986);
    float _994 = _988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _996 = rsqrt(_984);
    float _998 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1000 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[1].z, _992);
    float _1002 = _658 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1004 = _994 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1006 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1008 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1002);
    float _1010 = -_1004;
    float _1012 = fma(_1010, _990, 1.0);
    float _1014 = _658 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1016 = floor(_998);
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1020 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1018);
    float _1022 = precise::clamp(_1020, 0.0, 1.0);
    float _1024 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1008);
    float _1026 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1014);
    float _1028 = -_982;
    float _1030 = _940 + _1028;
    float _1032 = -_1022;
    float _1034 = _1032 + 1.0;
    float _1036 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1038 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1040 = _996 * _954;
    float _1042 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1026);
    float _1044 = _996 * _966;
    float _1046 = abs(_1034);
    float _1048 = log2(_1046);
    float _1050 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1038);
    float _1052 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1054 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1056 = _996 * _958;
    float _1058 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1050);
    float _1060 = -_1052;
    float _1062 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1060);
    float _1064 = log2(_1012);
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1058);
    float _1068 = -_1056;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1062);
    float _1072 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1074 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1076 = -_1016;
    float _1078 = _998 + _1076;
    float _1080 = fma(_1070, -0.5, 0.5);
    float _1082 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1072);
    float _1084 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1074);
    float _1086 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1088 = 1.0 / _1066;
    float _1090 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1082);
    float _1092 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1084);
    float _1094 = fma(_1070, 0.5, 0.5);
    float _1096 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1090);
    float _1098 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1092);
    float _1100 = fma(_1094, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1102 = sqrt(_1080);
    float _1104 = _1064 * 0.693147182464599609375;
    float _1106 = _982;
    float _1108 = _1066;
    if (_824)
    {
        _1106 = _1096;
    }
    float _1110 = _1106;
    float _1112 = fma(_1094, _1100, -0.212114393711090087890625);
    float _1114 = _1110;
    if (_824)
    {
        _942 = _1098;
    }
    float _1116 = _942;
    float2 _3715 = float2(_1030, _1078);
    float _1118 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3715, float2(0.0), isnan(_3715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3715, float2(0.0), isnan(_3715)), level(0.0)).x;
    float _1120 = _1116;
    if (!_824)
    {
        _1114 = 0.0;
    }
    float _1122 = _1114;
    float _1124 = fma(_1094, _1112, 1.570728778839111328125);
    float _1126 = exp2(_1086);
    if (!_824)
    {
        _1120 = 0.0;
    }
    float _1128 = _1120;
    float _1130 = _1044 + 1.0;
    float _1132 = _1088 * _1122;
    float _1134 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1136 = _1088 * _1128;
    float _1138 = fma(_1132, 0.5, 0.5);
    float _1140 = _1102 * 0.636619746685028076171875;
    float _1142 = fma(_1136, -0.5, 0.5);
    float _1144 = -_1124;
    float _1146 = fma(_1140, _1144, 1.0);
    float _1148 = -_1044;
    float _1150 = fma(_1126, _1130, _1148);
    float3 _3773 = float3(_1138, _1142, _1134);
    float _1152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3773, float3(0.0), isnan(_3773)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3773, float3(0.0), isnan(_3773)), level(0.0)).x;
    float3 _3784 = float3(_1138, _1142, _1134);
    float4 _1155 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3784, float3(0.0), isnan(_3784)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3784, float3(0.0), isnan(_3784)), level(0.0)).xyzw;
    float _1157 = _1155.x;
    float _1159 = _1155.y;
    float _1161 = _1155.z;
    float _1163 = _1155.w;
    float _1165 = fma(_1150, 0.5, 0.5);
    float2 _3802 = float2(_1146, _1165);
    float3 _1169 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3802, float2(0.0), isnan(_3802)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3802, float2(0.0), isnan(_3802)), level(0.0)).xyz;
    float _1171 = _1169.x;
    float _1173 = _1169.y;
    float _1175 = _1169.z;
    float _1177 = in.m_59.w;
    float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1181 = in.m_59.y;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1185 = _1183 != 0;
    float _1187 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1191 = _1189 != 0;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1195 = _1193 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1199 = _1197 != 0;
    float _1201 = in.m_67.x;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1205 = _1203 != 0;
    float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1209 = in.m_69.x;
    float _1211 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1215 = _1213 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1219 = _1217 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1221 = 1.0 / _1195;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1225 = _1134;
    bool _1227 = _1205;
    if (_1185)
    {
        float _1229 = in.m_59.x;
        _1223 = _1229;
    }
    float _1231 = _1223;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1235 = _1177 > 0.5;
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1239 = in.m_67.y;
    float _1241 = 1.0 / _1215;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1245 = _1181 > 0.5;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = 0.0;
    bool _1251 = _1235;
    if (_1191)
    {
        float _1253 = in.m_59.z;
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1257;
    float _1261 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1263 = 1.0 / _1219;
    float _1265 = _1201;
    if (!_1185)
    {
        _1225 = _1201;
    }
    float _1267 = _1225;
    out.m_71.x = _1209;
    int _1269 = 0;
    float _1271 = _1267;
    if (_1191)
    {
        float _1273 = -_1201;
        float _1275 = _1273 + 1.0;
        _1269 = as_type<int>(_1275);
    }
    int _1277 = _1269;
    float _1279 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1187);
    out.m_73.x = _660;
    out.m_73.y = _658;
    out.m_73.z = _662;
    float _1281 = _1259 * _1241;
    float _1283 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1285;
    bool _1289 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1291 = isnan(_358);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1307 = -_1239;
    float _1309 = _1307 + 1.0;
    float _1311 = _1287 * _1221;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1315 = _358 + _1313;
    out.m_75.x = _1247;
    out.m_75.y = _1261;
    out.m_75.z = _1283;
    float _1317 = _1303 * _1263;
    int _1319 = _1235 ? as_type<int>(_1309) : as_type<int>(_1239);
    float _1321 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1279);
    float _1323 = _1239;
    if (_1185)
    {
        bool _1325 = _1231 > 0.5;
        _1251 = _1325;
    }
    bool _1327 = _1251;
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1331 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1333 = isnan(_358);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1321);
    float _1345 = _1199 ? as_type<float>(_1319) : _1239;
    float _1347 = in.m_65.x;
    bool _1349 = _382 != 0.0;
    bool _1351 = isnan(_382);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan(0.0);
    bool _1357 = _1353 || _1355;
    float _1359 = -_1341;
    float _1361 = _1359 + 1.0;
    float _1363 = fma(_1311, _1315, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1365 = -_1299;
    float _1367 = _1365 + 1.0;
    bool _1369 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1371 = isnan(_358);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    float _1381 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1383 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1385 = isnan(_358);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1391 = _1387 || _1389;
    float _1393 = float(_1391);
    float _1395 = _1341 * _1367;
    bool _1397 = _380 == 0.0;
    bool _1399 = !_1357;
    bool _1401 = _1397 && _1399;
    float _1403 = in.m_77.x;
    float _1405 = in.m_77.y;
    float _1407 = in.m_77.z;
    float _1409 = -_1379;
    float _1411 = _1409 + 1.0;
    float _1413 = _1379 * _1361;
    float _1415 = _1411;
    float _1417 = _1343;
    if (_1205)
    {
        float _1419 = _1245 ? _1309 : _1239;
        _1323 = _1419;
    }
    float _1421 = _1323;
    float _1423 = -_1393;
    float _1425 = _1423 + 1.0;
    float _1427 = _1393 * _1411;
    bool _1429 = _384 == 0.0;
    bool _1431 = _1429 && _1401;
    float _1433 = exp2(_1211);
    float _1435 = _1255;
    if (_1191)
    {
        bool _1437 = _1255 > 0.5;
        _1227 = _1437;
    }
    bool _1439 = _1227;
    float _1441 = _1363 * _1427;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1445 = _358 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1449 = _358 + _1447;
    float _1451 = _1441;
    if (_1185)
    {
        float _1453 = -_1201;
        float _1455 = _1453 + 1.0;
        _598 = as_type<int>(_1455);
    }
    int _1457 = _598;
    float _1459 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1441);
    float _1461 = fma(_1317, _1445, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1463 = fma(_1281, _1449, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    out.gl_Position.x = _1096;
    out.gl_Position.y = _1098;
    out.gl_Position.z = _1343;
    out.gl_Position.w = _1066;
    if (_1185)
    {
        float _1465 = _1327 ? as_type<float>(_1457) : _1201;
        _1271 = _1465;
    }
    float _1467 = _1271;
    float _1469 = fma(_1461, _1413, _1459);
    if (_1191)
    {
        float _1471 = _1439 ? as_type<float>(_1277) : _1201;
        _1265 = _1471;
    }
    float _1473 = _1265;
    float _1475 = in.m_79.x;
    float _1477 = in.m_79.y;
    float _1479 = in.m_79.z;
    float _1481 = in.m_79.w;
    float _1483 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1485 = fma(_1463, _1395, _1469);
    float _1487 = _1403;
    if (_1431)
    {
        _1415 = _1403;
    }
    float _1489 = _1415;
    float _1491 = -_1433;
    float _1493 = _1491 + 1.0;
    float _1495 = _1489;
    if (_1431)
    {
        _1435 = _1405;
    }
    float _1497 = _1435;
    float _1499 = _1497;
    if (!_1431)
    {
        float _1501 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1405);
        _1499 = _1501;
    }
    float _1503 = _1499;
    if (_1431)
    {
        _1451 = _1489;
    }
    float _1505 = _1451;
    float _1507 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1485);
    float _1509 = _1505;
    if (!_1431)
    {
        _1495 = _1403;
    }
    float _1511 = _1495;
    float _1513 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1431)
    {
        _1487 = _1407;
    }
    float _1515 = _1487;
    float _1517 = _1515;
    if (!_1431)
    {
        float _1519 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1407);
        _1517 = _1519;
    }
    float _1521 = _1517;
    if (!_1431)
    {
        float _1523 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1511);
        _1509 = _1523;
    }
    float _1525 = _1509;
    float _1527 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1529 = _1381 * _1207;
    float _1531 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1533 = _316 * _1503;
    float _1535 = _1527 * _1179;
    float _1537 = _1483 * _1305;
    float _1539 = _1531 * _1329;
    float _1541 = fma(_284, _1525, _1533);
    float _1543 = _302 * _1477;
    float _1545 = _312 * _1477;
    float _1547 = _316 * _1477;
    float _1549 = _1479 * _1511;
    float _1551 = fma(_276, _1475, _1543);
    float _1553 = fma(_280, _1475, _1545);
    float _1555 = fma(_284, _1475, _1547);
    float _1557 = _1475 * _1405;
    float _1559 = fma(_320, _1479, _1551);
    float _1561 = -_1549;
    float _1563 = fma(_1475, _1407, _1561);
    float _1565 = _1477 * _1407;
    float _1567 = fma(_324, _1479, _1553);
    float _1569 = fma(_328, _1479, _1555);
    float _1571 = -_1557;
    float _1573 = fma(_1477, _1511, _1571);
    float _1575 = -_1565;
    float _1577 = fma(_1479, _1405, _1575);
    float _1579 = _1563 * _1481;
    float _1581 = abs(_670);
    float _1583 = log2(_1581);
    float _1585 = _302 * _1503;
    float _1587 = _1577 * _1481;
    float _1589 = _1573 * _1481;
    float _1591 = _312 * _1503;
    float _1593 = fma(_276, _1525, _1585);
    out.m_81.x = _1537;
    out.m_81.y = _1535;
    out.m_81.z = _1539;
    out.m_81.w = _1529;
    float _1595 = fma(_280, _1525, _1591);
    float _1597 = _1579 * _312;
    float _1599 = _1579 * _316;
    float _1601 = fma(_320, _1521, _1593);
    float _1603 = fma(_328, _1521, _1541);
    float _1605 = fma(_1587, _280, _1597);
    float _1607 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1609 = _1579 * _302;
    float _1611 = fma(_1587, _284, _1599);
    bool _1613 = _670 <= 8000.0;
    bool _1615 = isnan(_670);
    bool _1617 = _1613 || _1615;
    bool _1619 = isnan(8000.0);
    bool _1621 = _1617 || _1619;
    float _1623 = float(_1621);
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1627 = exp2(_1607);
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1633 = fma(_324, _1521, _1595);
    float _1635 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1643 = _1567 * _416;
    float _1645 = _1633 * _416;
    float _1647 = fma(_1587, _276, _1609);
    out.m_83.x = _1635;
    out.m_83.y = _1637;
    out.m_83.z = _1639;
    out.m_83.w = _1641;
    float _1649 = fma(_1601, _496, _1645);
    float _1651 = -_1513;
    float _1653 = _1651 + 1.0;
    bool _1655 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1657 = isnan(_832);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1663 = _1659 || _1661;
    float _1665 = fma(_1627, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1667 = precise::clamp(_1665, 0.0, 1.0);
    float _1669 = fma(_1559, _496, _1643);
    float _1671 = _1633 * _496;
    float _1673 = _1567 * _496;
    float _1675 = fma(_1667, -2.0, 3.0);
    float _1677 = _1667 * _1667;
    float _1679 = -_492;
    float _1681 = fma(_1569, _1679, _1669);
    float _1683 = _1633 * _492;
    float _1685 = _1677 * _1675;
    float _1687 = _1567 * _492;
    float _1689 = -_1671;
    float _1691 = fma(_1601, _498, _1689);
    float _1693 = fma(_1589, _320, _1647);
    float _1695 = fma(_1589, _328, _1611);
    float _1697 = fma(_1559, _500, _1687);
    float _1699 = fma(_1589, _324, _1605);
    float _1701 = -_1673;
    float _1703 = fma(_1559, _498, _1701);
    float _1705 = fma(_1601, _500, _1683);
    float _1707 = fma(_1569, _504, _1697);
    float _1709 = -_1685;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1569, _500, _1703);
    out.m_85.x = _1693;
    out.m_85.y = _1699;
    out.m_85.z = _1695;
    float _1715 = _1569;
    float _1717 = _1691;
    float _1719 = _1653;
    if (!_824)
    {
        _1715 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1721 = _1715;
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1685);
    out.m_87.x = _1713;
    out.m_87.y = _1681;
    out.m_87.z = _1707;
    float _1725 = _1623 * _1723;
    int _1727 = as_type<int>(_1721);
    if (!_824)
    {
        float _1729 = _1721 * 5.0;
        _1727 = as_type<int>(_1729);
    }
    int _1731 = _1727;
    float _1733 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1735 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1737 = _1343 + _1066;
    float _1739 = -_492;
    float _1741 = fma(_1603, _1739, _1649);
    if (!_824)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4775 = as_type<float>(_1731);
        out.gl_Position.z = _4775;
    }
    float _1743 = _1737 * 0.5;
    float _1745 = _1735 * _800;
    float _1747 = fma(_1603, _500, _1691);
    float _1749 = fma(_1603, _504, _1705);
    float _1751 = _1066;
    float _1753 = _1743;
    if (!_1663)
    {
        _1717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1755 = _1717;
    out.m_89.x = _1747;
    out.m_89.y = _1741;
    out.m_89.z = _1749;
    float _1757 = _1755;
    float _1759 = _1755;
    if (!_1663)
    {
        _1108 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1761 = _1108;
    float _1763 = _1761;
    float _1765 = _1761;
    if (!_1663)
    {
        _1417 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1767 = _1417;
    out.m_91.z = _1743;
    out.m_91.w = _1066;
    float _1769 = _1767;
    float _1771 = _1767;
    if (_824)
    {
        _1751 = _1745;
    }
    float _1773 = _1751;
    float _1775 = _1773;
    if (!_824)
    {
        _1775 = 0.0;
    }
    float _1777 = _1775;
    if (!_1663)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1779 = _1753;
    float _1781 = -_1118;
    float _1783 = _1781 + 1.0;
    float _1785 = _1783 * _1733;
    float _1787 = precise::clamp(_1785, 0.0, 1.0);
    float _1789 = -_1787;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1793 = _1791 * _1347;
    float _1795 = _1793 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1797 = _1513 * _1152;
    float _1799 = _1163 * _1653;
    out.m_93.x = _1795;
    float _1801 = _1779;
    float _1803 = _1779;
    if (!_1663)
    {
        _1719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1805 = _1719;
    float _1807 = _1163 * _1797;
    float _1809 = _1175 * _1797;
    float _1811 = fma(_1171, _1807, _1157);
    float _1813 = fma(_1173, _1807, _1159);
    float _1815 = _1807;
    float _1817 = _1805;
    float _1819 = _1805;
    if (!_1663)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1821 = _1815;
    float _1823 = fma(_1163, _1809, _1161);
    out.m_95.x = _1811;
    out.m_95.y = _1813;
    out.m_95.z = _1823;
    out.m_95.w = _1799;
    bool _1825 = !_1663;
    float _1827 = _1821;
    float _1829 = _1821;
    if (!_1825)
    {
        bool _1831 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1833 = isnan(_832);
        bool _1835 = _1831 || _1833;
        bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1839 = _1835 || _1837;
        if (!_1839)
        {
            float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1843 = _832 + _1841;
            float _1845 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1847 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1845;
            float _1849 = 1.0 / _1847;
            float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1853 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1865 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1871 = _1843 * _1849;
            float _1873 = precise::clamp(_1871, 0.0, 1.0);
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1879 = fma(_1873, _1853, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1881 = fma(_1873, _1877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1883 = fma(_1873, _1857, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1885 = fma(_1873, _1861, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1887 = fma(_1873, _1865, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1889 = fma(_1873, _1869, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1759 = _1879;
            _1771 = _1885;
            _1803 = _1881;
            _1829 = _1887;
            _1765 = _1883;
            _1819 = _1889;
            _1891 = true;
        }
        else
        {
            bool _1893 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1895 = isnan(_832);
            bool _1897 = _1893 || _1895;
            bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1901 = _1897 || _1899;
            if (!_1901)
            {
                _1757 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1903 = _1757;
            _1759 = _1903;
            if (!_1901)
            {
                _1801 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1905 = _1801;
            _1803 = _1905;
            if (!_1901)
            {
                _1763 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1907 = _1763;
            _1765 = _1907;
            if (!_1901)
            {
                _1769 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1909 = _1769;
            _1771 = _1909;
            if (!_1901)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1911 = _1827;
            _1829 = _1911;
            if (!_1901)
            {
                _1817 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1913 = _1817;
            bool _1915 = !_1901;
            _1819 = _1913;
            if (!_1915)
            {
                bool _1917 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1919 = isnan(_832);
                bool _1921 = _1917 || _1919;
                bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1925 = _1921 || _1923;
                if (!_1925)
                {
                    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1929 = _832 + _1927;
                    float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1931;
                    float _1935 = 1.0 / _1933;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1947 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1951 = _1949 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1957 = _1929 * _1935;
                    float _1959 = precise::clamp(_1957, 0.0, 1.0);
                    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1965 = fma(_1959, _1939, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1967 = fma(_1959, _1963, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1969 = fma(_1959, _1943, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1971 = fma(_1959, _1947, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1973 = fma(_1959, _1951, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1975 = fma(_1959, _1955, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1759 = _1965;
                    _1771 = _1971;
                    _1803 = _1967;
                    _1829 = _1973;
                    _1765 = _1969;
                    _1819 = _1975;
                    _1891 = true;
                }
                else
                {
                    _1759 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1771 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1803 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1765 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1819 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1891 = false;
    float _1977 = _1759;
    float _1979 = _1771;
    float _1981 = _1803;
    float _1983 = _1829;
    float _1985 = _1765;
    float _1987 = _1819;
    float _1989 = fma(_1741, -0.5, 0.5);
    float _1991 = precise::clamp(_1989, 0.0, 1.0);
    float _1993 = -_1977;
    float _1995 = _1993 + _1979;
    float _1997 = -_1981;
    float _1999 = _1997 + _1983;
    float _2001 = _1777 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2003 = fma(_1991, _1995, _1977);
    float _2005 = fma(_1991, _1999, _1981);
    out.m_93.w = _2001;
    float _2007 = -_1985;
    float _2009 = _2007 + _1987;
    bool _2011 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2013 = _2005 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2015 = fma(_1991, _2009, _1985);
    bool _2017 = _724 > 0.0;
    bool _2019 = isnan(_724);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan(0.0);
    bool _2025 = _2021 || _2023;
    float _2027 = fma(_2003, 0.298911988735198974609375, _2013);
    float _2029 = fma(_2015, 0.114477999508380889892578125, _2027);
    out.m_97.x = 0.0;
    float _2031 = -_2029;
    float _2033 = _2003 + _2031;
    float _2035 = -_2029;
    float _2037 = _2005 + _2035;
    float _2039 = -_2029;
    float _2041 = _2015 + _2039;
    float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2045 = fma(_2037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2047 = fma(_2041, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    bool _2049 = !_2011;
    if (!_2049)
    {
        float _2051 = -_658;
        float _2053 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2055 = -_660;
        float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2059 = -_662;
        float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2063 = _2053 * _2053;
        float _2065 = fma(_2057, _2057, _2063);
        float _2067 = fma(_2061, _2061, _2065);
        float _2069 = sqrt(_2067);
        float _2071 = rsqrt(_2067);
        float _2073 = -_2069;
        float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2077 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        float _2081 = _2057 * _2071;
        float _2083 = _2053 * _2071;
        float _2085 = abs(_2079);
        float _2087 = log2(_2085);
        float _2089 = _2061 * _2071;
        float _2091 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2093 = _1741 * _2083;
        float _2095 = -_2083;
        float _2097 = -_2091;
        float _2099 = fma(_2095, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2097);
        float _2101 = fma(_1747, _2081, _2093);
        float _2103 = -_2089;
        float _2105 = fma(_2103, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2099);
        float _2107 = fma(_1749, _2089, _2101);
        float _2109 = precise::clamp(_2107, 0.0, 1.0);
        float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2113 = _2105 + _2111;
        float _2115 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2117 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2119 = precise::clamp(_2117, 0.0, 1.0);
        float _2121 = exp2(_2115);
        float _2123 = _2121 * _2119;
        float _2125 = _2109 * _2123;
        float _2127 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2129 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2131 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2127;
        out.m_97.y = _2129;
        out.m_97.z = _2131;
    }
    out.m_99.x = _2043;
    out.m_99.y = _2045;
    out.m_99.z = _2047;
    if (_2025)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2133 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2133;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1891 = false;
    bool _350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2190 = as_type<float>(_134);
        out.gl_Position.z = _2190;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_51.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_148)
    {
        float _154 = float(_118);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2259 = as_type<float>(_170);
        out.gl_Position.z = _2259;
    }
    if (_162)
    {
        return out;
    }
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = _208;
    if (_214)
    {
        float _220 = rsqrt(_202);
        _218 = _220;
    }
    float _222 = _218;
    float _224 = 0.0;
    if (!_214)
    {
        _224 = 0.0;
    }
    float _226 = _224;
    bool _228 = _212 > 0.0;
    float _230 = 0.0;
    float _232 = _226;
    if (!_214)
    {
        _230 = 0.0;
    }
    float _234 = _230;
    float _236 = 0.0;
    float _238 = _234;
    if (!_214)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = _210;
    float _244 = _240;
    if (_216)
    {
        float _246 = rsqrt(_204);
        _242 = _246;
    }
    float _248 = _242;
    float _250 = 0.0;
    if (!_216)
    {
        _250 = 0.0;
    }
    float _252 = _250;
    float _254 = 0.0;
    float _256 = _252;
    if (!_216)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = 0.0;
    float _262 = _258;
    if (!_216)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = 0.0;
    float _268 = _264;
    if (_228)
    {
        float _270 = rsqrt(_206);
        _266 = _270;
    }
    float _272 = _266;
    if (_214)
    {
        float _274 = _222 * _178;
        _232 = _274;
    }
    float _276 = _232;
    if (_214)
    {
        float _278 = _222 * _172;
        _238 = _278;
    }
    float _280 = _238;
    if (_214)
    {
        float _282 = _222 * _184;
        _244 = _282;
    }
    float _284 = _244;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 0.0;
    if (!_228)
    {
        _288 = 0.0;
    }
    float _290 = _288;
    float _292 = 0.0;
    float _294 = _290;
    if (!_228)
    {
        _292 = 0.0;
    }
    float _296 = _292;
    float _298 = _296;
    if (_216)
    {
        float _300 = _248 * _180;
        _256 = _300;
    }
    float _302 = _256;
    float _304 = 0.0;
    if (!_228)
    {
        _304 = 0.0;
    }
    float _306 = _304;
    float _308 = _306;
    if (_216)
    {
        float _310 = _248 * _174;
        _262 = _310;
    }
    float _312 = _262;
    if (_216)
    {
        float _314 = _248 * _186;
        _268 = _314;
    }
    float _316 = _268;
    if (_228)
    {
        float _318 = _272 * _182;
        _294 = _318;
    }
    float _320 = _294;
    if (_228)
    {
        float _322 = _272 * _176;
        _298 = _322;
    }
    float _324 = _298;
    if (_228)
    {
        float _326 = _272 * _188;
        _308 = _326;
    }
    float _328 = _308;
    bool _330 = !_286;
    float _348;
    if (!_330)
    {
        float _332 = in.m_59.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_118);
        float _354 = 1.0 / _352;
        float _356 = _152 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_46.x;
    float _362 = in.m_46.y;
    float _364 = in.m_46.z;
    float _366 = (*spvDescriptorSet0.vp_c8)._m0[32].y * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _368 = in.m_61.x;
    float _370 = in.m_61.y;
    float _372 = in.m_61.z;
    float _374 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _366);
    float _376 = in.m_53.w;
    float _378 = fma((*spvDescriptorSet0.vp_c8)._m0[32].z, (*spvDescriptorSet0.vp_c8)._m0[32].z, _374);
    float _380 = in.m_63.x;
    float _382 = in.m_63.y;
    float _384 = in.m_63.z;
    float _386 = rsqrt(_378);
    float _388 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _390 = _174 * _362;
    float _392 = _186 * _362;
    float _394 = _180 * _362;
    float _396 = _388 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _398 = fma(_172, _360, _390);
    float _400 = fma(_184, _360, _392);
    float _402 = _396 * 0.15915493667125701904296875;
    float _404 = fma(_176, _364, _398);
    float _406 = _370 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = _386 * (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _410 = _386 * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _412 = fma(_178, _360, _394);
    float _414 = _402 * 6.283185482025146484375;
    float _416 = cos(_414);
    float _418 = _408 * _408;
    float _420 = _368 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _422 = _372 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _426 = fma(_410, _410, _418);
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _382);
    float _430 = fma(_182, _364, _412);
    float _432 = _402 * 6.283185482025146484375;
    float _434 = sin(_432);
    float _436 = in.m_55.w;
    float _438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _380);
    float _440 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _428 * _424;
    float _444 = in.m_57.w;
    float _446 = fma(_188, _364, _400);
    float _448 = _438 * _440;
    float _450 = rsqrt(_426);
    float _452 = _442 * _302;
    float _454 = _442 * _312;
    float _456 = _442 * _316;
    float _458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _384);
    float _460 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _462 = fma(_448, _276, _452);
    float _464 = fma(_448, _280, _454);
    float _466 = fma(_448, _284, _456);
    float _468 = -_416;
    float _470 = _468 + 1.0;
    float _472 = _458 * _460;
    float _474 = _404 + _376;
    float _476 = fma(_472, _324, _464);
    float _478 = fma(_472, _320, _462);
    float _480 = _410 * _450;
    float _482 = -_450;
    float _484 = _408 * _482;
    float _486 = fma(_472, _328, _466);
    float _488 = _430 + _436;
    float _490 = _480 * _470;
    float _492 = _480 * _434;
    float _494 = _484 * _484;
    float _496 = _484 * _434;
    float _498 = fma(_480, _490, _416);
    float _500 = _484 * _490;
    float _502 = _476 * _492;
    float _504 = fma(_470, _494, _416);
    float _506 = _476 * _496;
    float _508 = _474 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _510 = fma(_478, _500, _502);
    float _512 = _446 + _444;
    float _514 = -_506;
    float _516 = fma(_478, _498, _514);
    float _518 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[11].x, _508);
    float _520 = fma(_486, _504, _510);
    float _522 = _474 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _524 = fma(_486, _500, _516);
    float _526 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _518);
    float _528 = _512 + _520;
    float _530 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[10].x, _522);
    float _532 = _488 + _524;
    float _534 = _526 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _538 = _528 + _536;
    float _540 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _530);
    float _542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _544 = _532 + _542;
    float _546 = 1.0 / _534;
    float _548 = _538 * _538;
    float _550 = _540 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _552 = _476 * _416;
    float _554 = fma(_544, _544, _548);
    float _556 = _550 + _534;
    float _558 = fma(_478, _496, _552);
    float _560 = sqrt(_554);
    bool _562 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _564 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.5);
    bool _570 = _566 || _568;
    float _572 = -_492;
    float _574 = fma(_486, _572, _558);
    float _576 = _556 * _546;
    float _578 = _576 * 0.5;
    float _580 = _474 + _574;
    float _582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _584 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[30].w, _582);
    float _586 = 0.0;
    float _588 = _474;
    float _590 = _552;
    float _592 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _594 = _532;
    float _596 = _488;
    int _598 = as_type<int>(_358);
    if (_570)
    {
        _586 = 1.0;
    }
    float _600 = _586;
    bool _602 = _560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _604 = 1.0 / _584;
    float _606 = _600;
    if (!_602)
    {
        _588 = _532;
    }
    float _608 = _588;
    float _610 = _608;
    if (!_602)
    {
        _590 = _528;
    }
    float _612 = _590;
    float _614 = _612;
    if (!_602)
    {
        _592 = _580;
    }
    float _616 = _592;
    bool _618 = !_602;
    float _620 = _616;
    if (!_618)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _626 = _560 + _624;
        float _628 = _580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _630 = rsqrt(_554);
        float _632 = _626 * _622;
        float _634 = _632 * 0.15915493667125701904296875;
        float _636 = _634 * 6.283185482025146484375;
        float _638 = cos(_636);
        float _640 = _634 * 6.283185482025146484375;
        float _642 = sin(_640);
        float _644 = _638 + (-1.0);
        float _646 = _644 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _648 = fma(_642, _628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _650 = fma(_580, _638, _646);
        float _652 = _630 * _648;
        float _654 = fma(_544, _652, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _656 = fma(_538, _652, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _620 = _650;
        _610 = _654;
        _614 = _656;
    }
    float _658 = _620;
    float _660 = _610;
    float _662 = _614;
    float _664 = 0.0;
    if (_570)
    {
        _664 = 1.0;
    }
    float _666 = _664;
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _670 = _604 * _668;
    float _672 = _666;
    if (!_570)
    {
        float _674 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _678 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _676;
        float _680 = _674 * 0.15915493667125701904296875;
        float _682 = 1.0 / _678;
        float _684 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _686 = _680 * 6.283185482025146484375;
        float _688 = cos(_686);
        float _690 = _684 * 0.15915493667125701904296875;
        float _692 = _680 * 6.283185482025146484375;
        float _694 = sin(_692);
        float _696 = 1.0 / _688;
        float _698 = _690 * 6.283185482025146484375;
        float _700 = cos(_698);
        float _702 = _694 * _696;
        float _704 = _690 * 6.283185482025146484375;
        float _706 = sin(_704);
        float _708 = _700 * _702;
        float _710 = 1.0 / _708;
        float _712 = _706 * _710;
        float _714 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _716 = fma(_670, _712, _714);
        float _718 = _716 * _682;
        float _720 = precise::clamp(_718, 0.0, 1.0);
        _594 = _690;
        _606 = _720;
    }
    float _722 = _594;
    float _724 = _606;
    float _726 = _722;
    if (!_570)
    {
        float _728 = in.m_65.w;
        int _730 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _732 = _730 == 4;
        bool _734 = _730 == 8;
        bool _736 = _730 == 12;
        int _738 = as_type<int>(_728) << 16;
        int _740 = as_type<int>(_728) << 8;
        int _742 = as_type<int>(_728) << 24;
        int _744 = _738 >> 24;
        int _746 = _740 >> 24;
        int _748 = as_type<int>(_728) >> 24;
        int _750 = _742 >> 24;
        float _752 = float(_744);
        float _754 = float(_746);
        float _756 = float(_748);
        float _758 = _752 * 0.0078740157186985015869140625;
        float _760 = float(_750);
        float _762 = _754 * 0.0078740157186985015869140625;
        float _764 = _756 * 0.0078740157186985015869140625;
        float _766 = precise::min(_758, 1.0);
        float _768 = _760 * 0.0078740157186985015869140625;
        float _770 = precise::min(_762, 1.0);
        float _772 = precise::min(_764, 1.0);
        float _774 = precise::min(_768, 1.0);
        float _776 = precise::max(_766, -1.0);
        float _778 = precise::max(_770, -1.0);
        float _780 = precise::max(_772, -1.0);
        float _782 = precise::max(_774, -1.0);
        float _784 = _782;
        if (_732)
        {
            _784 = _776;
        }
        float _786 = _784;
        float _788 = _786;
        if (_734)
        {
            _788 = _778;
        }
        float _790 = _788;
        float _792 = _790;
        if (_736)
        {
            _792 = _780;
        }
        float _794 = _792;
        float _796 = abs(_794);
        float _798 = (-0.0) + _796;
        _672 = _798;
    }
    float _800 = _672;
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _804 = _658 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _660 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _812 = _662 + _810;
    float _814 = _804 * _804;
    bool _816 = _800 != 0.0;
    bool _818 = isnan(_800);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    float _826 = fma(_808, _808, _814);
    float _828 = fma(_812, _812, _826);
    float _830 = rsqrt(_828);
    float _832 = sqrt(_828);
    float _834 = _830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _836 = _808 * _834;
    float _838 = _812 * _834;
    float _840 = _836 * _836;
    float _842 = _838 * _838;
    float _844 = _840 + _842;
    float _846 = sqrt(_844);
    bool _848 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _846 + _850;
    float _854 = _812;
    float _856 = _844;
    float _858 = _852;
    float _860 = _804;
    float _862 = _814;
    float _864 = _836;
    if (_848)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _866;
    }
    float _868 = _854;
    if (_848)
    {
        float _870 = rsqrt(_844);
        _856 = _870;
    }
    float _872 = _856;
    if (_848)
    {
        float _874 = _852 * _868;
        _858 = _874;
    }
    float _876 = _858;
    if (_848)
    {
        float _878 = _876 * 0.15915493667125701904296875;
        _726 = _878;
    }
    float _880 = _726;
    float _882 = _868;
    if (_848)
    {
        float _884 = _880 * 6.283185482025146484375;
        float _886 = sin(_884);
        _882 = _886;
    }
    float _888 = _882;
    float _890 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _892 = precise::max(0.0, _890);
    float _894 = _830;
    float _896 = _892;
    if (_848)
    {
        float _898 = _880 * 6.283185482025146484375;
        float _900 = cos(_898);
        _894 = _900;
    }
    float _902 = _894;
    float _904 = -_834;
    float _906 = -_892;
    float _908 = fma(_804, _904, _906);
    float _910 = _908;
    if (!_848)
    {
        _860 = _838;
    }
    float _912 = _860;
    float _914 = _912;
    if (_848)
    {
        float _916 = _908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _896 = _916;
    }
    float _918 = _896;
    float _920 = _888;
    float _922 = _918;
    if (_848)
    {
        float _924 = fma(_888, _918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _920 = _924;
    }
    float _926 = _920;
    if (_848)
    {
        float _928 = _902 + (-1.0);
        _922 = _928;
    }
    float _930 = _922;
    float _932 = 0.0;
    float _934 = _930;
    if (_848)
    {
        float _936 = _872 * _926;
        _932 = _936;
    }
    float _938 = _932;
    float _940 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _942 = _940;
    if (!_848)
    {
        _596 = _840;
    }
    float _944 = _596;
    float _946 = _944;
    if (_848)
    {
        float _948 = _930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _862 = _948;
    }
    float _950 = _862;
    if (_848)
    {
        float _952 = _836 * _938;
        _864 = _952;
    }
    float _954 = _864;
    if (_848)
    {
        float _956 = _838 * _938;
        _914 = _956;
    }
    float _958 = _914;
    if (!_848)
    {
        _934 = _842;
    }
    float _960 = _934;
    float _962 = _960;
    if (_848)
    {
        float _964 = fma(_908, _902, _950);
        _910 = _964;
    }
    float _966 = _910;
    if (_848)
    {
        float _968 = _954 * _954;
        _946 = _968;
    }
    float _970 = _946;
    if (_848)
    {
        float _972 = _958 * _958;
        _962 = _972;
    }
    float _974 = _962;
    float _976 = _658 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _978 = fma(_966, _966, _970);
    float _980 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[2].x, _976);
    float _982 = floor(_940);
    float _984 = _978 + _974;
    float _986 = _658 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _988 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[2].z, _980);
    float _990 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _992 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[1].x, _986);
    float _994 = _988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _996 = rsqrt(_984);
    float _998 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1000 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[1].z, _992);
    float _1002 = _658 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1004 = _994 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1006 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1008 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1002);
    float _1010 = -_1004;
    float _1012 = fma(_1010, _990, 1.0);
    float _1014 = _658 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1016 = floor(_998);
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1020 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1018);
    float _1022 = precise::clamp(_1020, 0.0, 1.0);
    float _1024 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1008);
    float _1026 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1014);
    float _1028 = -_982;
    float _1030 = _940 + _1028;
    float _1032 = -_1022;
    float _1034 = _1032 + 1.0;
    float _1036 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1038 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1040 = _996 * _954;
    float _1042 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1026);
    float _1044 = _996 * _966;
    float _1046 = abs(_1034);
    float _1048 = log2(_1046);
    float _1050 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1038);
    float _1052 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1054 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1056 = _996 * _958;
    float _1058 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1050);
    float _1060 = -_1052;
    float _1062 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1060);
    float _1064 = log2(_1012);
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1058);
    float _1068 = -_1056;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1062);
    float _1072 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1074 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1076 = -_1016;
    float _1078 = _998 + _1076;
    float _1080 = fma(_1070, -0.5, 0.5);
    float _1082 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1072);
    float _1084 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1074);
    float _1086 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1088 = 1.0 / _1066;
    float _1090 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1082);
    float _1092 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1084);
    float _1094 = fma(_1070, 0.5, 0.5);
    float _1096 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1090);
    float _1098 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1092);
    float _1100 = fma(_1094, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1102 = sqrt(_1080);
    float _1104 = _1064 * 0.693147182464599609375;
    float _1106 = _982;
    float _1108 = _1066;
    if (_824)
    {
        _1106 = _1096;
    }
    float _1110 = _1106;
    float _1112 = fma(_1094, _1100, -0.212114393711090087890625);
    float _1114 = _1110;
    if (_824)
    {
        _942 = _1098;
    }
    float _1116 = _942;
    float2 _3715 = float2(_1030, _1078);
    float _1118 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3715, float2(0.0), isnan(_3715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3715, float2(0.0), isnan(_3715)), level(0.0)).x;
    float _1120 = _1116;
    if (!_824)
    {
        _1114 = 0.0;
    }
    float _1122 = _1114;
    float _1124 = fma(_1094, _1112, 1.570728778839111328125);
    float _1126 = exp2(_1086);
    if (!_824)
    {
        _1120 = 0.0;
    }
    float _1128 = _1120;
    float _1130 = _1044 + 1.0;
    float _1132 = _1088 * _1122;
    float _1134 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1136 = _1088 * _1128;
    float _1138 = fma(_1132, 0.5, 0.5);
    float _1140 = _1102 * 0.636619746685028076171875;
    float _1142 = fma(_1136, -0.5, 0.5);
    float _1144 = -_1124;
    float _1146 = fma(_1140, _1144, 1.0);
    float _1148 = -_1044;
    float _1150 = fma(_1126, _1130, _1148);
    float3 _3773 = float3(_1138, _1142, _1134);
    float _1152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3773, float3(0.0), isnan(_3773)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3773, float3(0.0), isnan(_3773)), level(0.0)).x;
    float3 _3784 = float3(_1138, _1142, _1134);
    float4 _1155 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3784, float3(0.0), isnan(_3784)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3784, float3(0.0), isnan(_3784)), level(0.0)).xyzw;
    float _1157 = _1155.x;
    float _1159 = _1155.y;
    float _1161 = _1155.z;
    float _1163 = _1155.w;
    float _1165 = fma(_1150, 0.5, 0.5);
    float2 _3802 = float2(_1146, _1165);
    float3 _1169 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3802, float2(0.0), isnan(_3802)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3802, float2(0.0), isnan(_3802)), level(0.0)).xyz;
    float _1171 = _1169.x;
    float _1173 = _1169.y;
    float _1175 = _1169.z;
    float _1177 = in.m_59.w;
    float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1181 = in.m_59.y;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1185 = _1183 != 0;
    float _1187 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1191 = _1189 != 0;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1195 = _1193 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1199 = _1197 != 0;
    float _1201 = in.m_67.x;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1205 = _1203 != 0;
    float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1209 = in.m_69.x;
    float _1211 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1215 = _1213 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1219 = _1217 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1221 = 1.0 / _1195;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1225 = _1134;
    bool _1227 = _1205;
    if (_1185)
    {
        float _1229 = in.m_59.x;
        _1223 = _1229;
    }
    float _1231 = _1223;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1235 = _1177 > 0.5;
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1239 = in.m_67.y;
    float _1241 = 1.0 / _1215;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1245 = _1181 > 0.5;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = 0.0;
    bool _1251 = _1235;
    if (_1191)
    {
        float _1253 = in.m_59.z;
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1257;
    float _1261 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1263 = 1.0 / _1219;
    float _1265 = _1201;
    if (!_1185)
    {
        _1225 = _1201;
    }
    float _1267 = _1225;
    out.m_71.x = _1209;
    int _1269 = 0;
    float _1271 = _1267;
    if (_1191)
    {
        float _1273 = -_1201;
        float _1275 = _1273 + 1.0;
        _1269 = as_type<int>(_1275);
    }
    int _1277 = _1269;
    float _1279 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1187);
    out.m_73.x = _660;
    out.m_73.y = _658;
    out.m_73.z = _662;
    float _1281 = _1259 * _1241;
    float _1283 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1285;
    bool _1289 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1291 = isnan(_358);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1307 = -_1239;
    float _1309 = _1307 + 1.0;
    float _1311 = _1287 * _1221;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1315 = _358 + _1313;
    out.m_75.x = _1247;
    out.m_75.y = _1261;
    out.m_75.z = _1283;
    float _1317 = _1303 * _1263;
    int _1319 = _1235 ? as_type<int>(_1309) : as_type<int>(_1239);
    float _1321 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1279);
    float _1323 = _1239;
    if (_1185)
    {
        bool _1325 = _1231 > 0.5;
        _1251 = _1325;
    }
    bool _1327 = _1251;
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1331 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1333 = isnan(_358);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1321);
    float _1345 = _1199 ? as_type<float>(_1319) : _1239;
    float _1347 = in.m_65.x;
    bool _1349 = _382 != 0.0;
    bool _1351 = isnan(_382);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan(0.0);
    bool _1357 = _1353 || _1355;
    float _1359 = -_1341;
    float _1361 = _1359 + 1.0;
    float _1363 = fma(_1311, _1315, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1365 = -_1299;
    float _1367 = _1365 + 1.0;
    bool _1369 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1371 = isnan(_358);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    float _1381 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1383 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1385 = isnan(_358);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1391 = _1387 || _1389;
    float _1393 = float(_1391);
    float _1395 = _1341 * _1367;
    bool _1397 = _380 == 0.0;
    bool _1399 = !_1357;
    bool _1401 = _1397 && _1399;
    float _1403 = in.m_77.x;
    float _1405 = in.m_77.y;
    float _1407 = in.m_77.z;
    float _1409 = -_1379;
    float _1411 = _1409 + 1.0;
    float _1413 = _1379 * _1361;
    float _1415 = _1411;
    float _1417 = _1343;
    if (_1205)
    {
        float _1419 = _1245 ? _1309 : _1239;
        _1323 = _1419;
    }
    float _1421 = _1323;
    float _1423 = -_1393;
    float _1425 = _1423 + 1.0;
    float _1427 = _1393 * _1411;
    bool _1429 = _384 == 0.0;
    bool _1431 = _1429 && _1401;
    float _1433 = exp2(_1211);
    float _1435 = _1255;
    if (_1191)
    {
        bool _1437 = _1255 > 0.5;
        _1227 = _1437;
    }
    bool _1439 = _1227;
    float _1441 = _1363 * _1427;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1445 = _358 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1449 = _358 + _1447;
    float _1451 = _1441;
    if (_1185)
    {
        float _1453 = -_1201;
        float _1455 = _1453 + 1.0;
        _598 = as_type<int>(_1455);
    }
    int _1457 = _598;
    float _1459 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1441);
    float _1461 = fma(_1317, _1445, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1463 = fma(_1281, _1449, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    out.gl_Position.x = _1096;
    out.gl_Position.y = _1098;
    out.gl_Position.z = _1343;
    out.gl_Position.w = _1066;
    if (_1185)
    {
        float _1465 = _1327 ? as_type<float>(_1457) : _1201;
        _1271 = _1465;
    }
    float _1467 = _1271;
    float _1469 = fma(_1461, _1413, _1459);
    if (_1191)
    {
        float _1471 = _1439 ? as_type<float>(_1277) : _1201;
        _1265 = _1471;
    }
    float _1473 = _1265;
    float _1475 = in.m_79.x;
    float _1477 = in.m_79.y;
    float _1479 = in.m_79.z;
    float _1481 = in.m_79.w;
    float _1483 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1485 = fma(_1463, _1395, _1469);
    float _1487 = _1403;
    if (_1431)
    {
        _1415 = _1403;
    }
    float _1489 = _1415;
    float _1491 = -_1433;
    float _1493 = _1491 + 1.0;
    float _1495 = _1489;
    if (_1431)
    {
        _1435 = _1405;
    }
    float _1497 = _1435;
    float _1499 = _1497;
    if (!_1431)
    {
        float _1501 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1405);
        _1499 = _1501;
    }
    float _1503 = _1499;
    if (_1431)
    {
        _1451 = _1489;
    }
    float _1505 = _1451;
    float _1507 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1485);
    float _1509 = _1505;
    if (!_1431)
    {
        _1495 = _1403;
    }
    float _1511 = _1495;
    float _1513 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1431)
    {
        _1487 = _1407;
    }
    float _1515 = _1487;
    float _1517 = _1515;
    if (!_1431)
    {
        float _1519 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1407);
        _1517 = _1519;
    }
    float _1521 = _1517;
    if (!_1431)
    {
        float _1523 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1511);
        _1509 = _1523;
    }
    float _1525 = _1509;
    float _1527 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1529 = _1381 * _1207;
    float _1531 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1533 = _316 * _1503;
    float _1535 = _1527 * _1179;
    float _1537 = _1483 * _1305;
    float _1539 = _1531 * _1329;
    float _1541 = fma(_284, _1525, _1533);
    float _1543 = _302 * _1477;
    float _1545 = _312 * _1477;
    float _1547 = _316 * _1477;
    float _1549 = _1479 * _1511;
    float _1551 = fma(_276, _1475, _1543);
    float _1553 = fma(_280, _1475, _1545);
    float _1555 = fma(_284, _1475, _1547);
    float _1557 = _1475 * _1405;
    float _1559 = fma(_320, _1479, _1551);
    float _1561 = -_1549;
    float _1563 = fma(_1475, _1407, _1561);
    float _1565 = _1477 * _1407;
    float _1567 = fma(_324, _1479, _1553);
    float _1569 = fma(_328, _1479, _1555);
    float _1571 = -_1557;
    float _1573 = fma(_1477, _1511, _1571);
    float _1575 = -_1565;
    float _1577 = fma(_1479, _1405, _1575);
    float _1579 = _1563 * _1481;
    float _1581 = abs(_670);
    float _1583 = log2(_1581);
    float _1585 = _302 * _1503;
    float _1587 = _1577 * _1481;
    float _1589 = _1573 * _1481;
    float _1591 = _312 * _1503;
    float _1593 = fma(_276, _1525, _1585);
    out.m_81.x = _1537;
    out.m_81.y = _1535;
    out.m_81.z = _1539;
    out.m_81.w = _1529;
    float _1595 = fma(_280, _1525, _1591);
    float _1597 = _1579 * _312;
    float _1599 = _1579 * _316;
    float _1601 = fma(_320, _1521, _1593);
    float _1603 = fma(_328, _1521, _1541);
    float _1605 = fma(_1587, _280, _1597);
    float _1607 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1609 = _1579 * _302;
    float _1611 = fma(_1587, _284, _1599);
    bool _1613 = _670 <= 8000.0;
    bool _1615 = isnan(_670);
    bool _1617 = _1613 || _1615;
    bool _1619 = isnan(8000.0);
    bool _1621 = _1617 || _1619;
    float _1623 = float(_1621);
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1627 = exp2(_1607);
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1633 = fma(_324, _1521, _1595);
    float _1635 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1643 = _1567 * _416;
    float _1645 = _1633 * _416;
    float _1647 = fma(_1587, _276, _1609);
    out.m_83.x = _1635;
    out.m_83.y = _1637;
    out.m_83.z = _1639;
    out.m_83.w = _1641;
    float _1649 = fma(_1601, _496, _1645);
    float _1651 = -_1513;
    float _1653 = _1651 + 1.0;
    bool _1655 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1657 = isnan(_832);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1663 = _1659 || _1661;
    float _1665 = fma(_1627, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1667 = precise::clamp(_1665, 0.0, 1.0);
    float _1669 = fma(_1559, _496, _1643);
    float _1671 = _1633 * _496;
    float _1673 = _1567 * _496;
    float _1675 = fma(_1667, -2.0, 3.0);
    float _1677 = _1667 * _1667;
    float _1679 = -_492;
    float _1681 = fma(_1569, _1679, _1669);
    float _1683 = _1633 * _492;
    float _1685 = _1677 * _1675;
    float _1687 = _1567 * _492;
    float _1689 = -_1671;
    float _1691 = fma(_1601, _498, _1689);
    float _1693 = fma(_1589, _320, _1647);
    float _1695 = fma(_1589, _328, _1611);
    float _1697 = fma(_1559, _500, _1687);
    float _1699 = fma(_1589, _324, _1605);
    float _1701 = -_1673;
    float _1703 = fma(_1559, _498, _1701);
    float _1705 = fma(_1601, _500, _1683);
    float _1707 = fma(_1569, _504, _1697);
    float _1709 = -_1685;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1569, _500, _1703);
    out.m_85.x = _1693;
    out.m_85.y = _1699;
    out.m_85.z = _1695;
    float _1715 = _1569;
    float _1717 = _1691;
    float _1719 = _1653;
    if (!_824)
    {
        _1715 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1721 = _1715;
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1685);
    out.m_87.x = _1713;
    out.m_87.y = _1681;
    out.m_87.z = _1707;
    float _1725 = _1623 * _1723;
    int _1727 = as_type<int>(_1721);
    if (!_824)
    {
        float _1729 = _1721 * 5.0;
        _1727 = as_type<int>(_1729);
    }
    int _1731 = _1727;
    float _1733 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1735 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1737 = _1343 + _1066;
    float _1739 = -_492;
    float _1741 = fma(_1603, _1739, _1649);
    if (!_824)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4775 = as_type<float>(_1731);
        out.gl_Position.z = _4775;
    }
    float _1743 = _1737 * 0.5;
    float _1745 = _1735 * _800;
    float _1747 = fma(_1603, _500, _1691);
    float _1749 = fma(_1603, _504, _1705);
    float _1751 = _1066;
    float _1753 = _1743;
    if (!_1663)
    {
        _1717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1755 = _1717;
    out.m_89.x = _1747;
    out.m_89.y = _1741;
    out.m_89.z = _1749;
    float _1757 = _1755;
    float _1759 = _1755;
    if (!_1663)
    {
        _1108 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1761 = _1108;
    float _1763 = _1761;
    float _1765 = _1761;
    if (!_1663)
    {
        _1417 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1767 = _1417;
    out.m_91.z = _1743;
    out.m_91.w = _1066;
    float _1769 = _1767;
    float _1771 = _1767;
    if (_824)
    {
        _1751 = _1745;
    }
    float _1773 = _1751;
    float _1775 = _1773;
    if (!_824)
    {
        _1775 = 0.0;
    }
    float _1777 = _1775;
    if (!_1663)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1779 = _1753;
    float _1781 = -_1118;
    float _1783 = _1781 + 1.0;
    float _1785 = _1783 * _1733;
    float _1787 = precise::clamp(_1785, 0.0, 1.0);
    float _1789 = -_1787;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1793 = _1791 * _1347;
    float _1795 = _1793 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1797 = _1513 * _1152;
    float _1799 = _1163 * _1653;
    out.m_93.x = _1795;
    float _1801 = _1779;
    float _1803 = _1779;
    if (!_1663)
    {
        _1719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1805 = _1719;
    float _1807 = _1163 * _1797;
    float _1809 = _1175 * _1797;
    float _1811 = fma(_1171, _1807, _1157);
    float _1813 = fma(_1173, _1807, _1159);
    float _1815 = _1807;
    float _1817 = _1805;
    float _1819 = _1805;
    if (!_1663)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1821 = _1815;
    float _1823 = fma(_1163, _1809, _1161);
    out.m_95.x = _1811;
    out.m_95.y = _1813;
    out.m_95.z = _1823;
    out.m_95.w = _1799;
    bool _1825 = !_1663;
    float _1827 = _1821;
    float _1829 = _1821;
    if (!_1825)
    {
        bool _1831 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1833 = isnan(_832);
        bool _1835 = _1831 || _1833;
        bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1839 = _1835 || _1837;
        if (!_1839)
        {
            float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1843 = _832 + _1841;
            float _1845 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1847 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1845;
            float _1849 = 1.0 / _1847;
            float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1853 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1865 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1871 = _1843 * _1849;
            float _1873 = precise::clamp(_1871, 0.0, 1.0);
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1879 = fma(_1873, _1853, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1881 = fma(_1873, _1877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1883 = fma(_1873, _1857, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1885 = fma(_1873, _1861, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1887 = fma(_1873, _1865, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1889 = fma(_1873, _1869, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1759 = _1879;
            _1771 = _1885;
            _1803 = _1881;
            _1829 = _1887;
            _1765 = _1883;
            _1819 = _1889;
            _1891 = true;
        }
        else
        {
            bool _1893 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1895 = isnan(_832);
            bool _1897 = _1893 || _1895;
            bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1901 = _1897 || _1899;
            if (!_1901)
            {
                _1757 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1903 = _1757;
            _1759 = _1903;
            if (!_1901)
            {
                _1801 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1905 = _1801;
            _1803 = _1905;
            if (!_1901)
            {
                _1763 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1907 = _1763;
            _1765 = _1907;
            if (!_1901)
            {
                _1769 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1909 = _1769;
            _1771 = _1909;
            if (!_1901)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1911 = _1827;
            _1829 = _1911;
            if (!_1901)
            {
                _1817 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1913 = _1817;
            bool _1915 = !_1901;
            _1819 = _1913;
            if (!_1915)
            {
                bool _1917 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1919 = isnan(_832);
                bool _1921 = _1917 || _1919;
                bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1925 = _1921 || _1923;
                if (!_1925)
                {
                    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1929 = _832 + _1927;
                    float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1931;
                    float _1935 = 1.0 / _1933;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1947 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1951 = _1949 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1957 = _1929 * _1935;
                    float _1959 = precise::clamp(_1957, 0.0, 1.0);
                    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1965 = fma(_1959, _1939, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1967 = fma(_1959, _1963, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1969 = fma(_1959, _1943, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1971 = fma(_1959, _1947, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1973 = fma(_1959, _1951, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1975 = fma(_1959, _1955, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1759 = _1965;
                    _1771 = _1971;
                    _1803 = _1967;
                    _1829 = _1973;
                    _1765 = _1969;
                    _1819 = _1975;
                    _1891 = true;
                }
                else
                {
                    _1759 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1771 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1803 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1765 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1819 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1891 = false;
    float _1977 = _1759;
    float _1979 = _1771;
    float _1981 = _1803;
    float _1983 = _1829;
    float _1985 = _1765;
    float _1987 = _1819;
    float _1989 = fma(_1741, -0.5, 0.5);
    float _1991 = precise::clamp(_1989, 0.0, 1.0);
    float _1993 = -_1977;
    float _1995 = _1993 + _1979;
    float _1997 = -_1981;
    float _1999 = _1997 + _1983;
    float _2001 = _1777 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2003 = fma(_1991, _1995, _1977);
    float _2005 = fma(_1991, _1999, _1981);
    out.m_93.w = _2001;
    float _2007 = -_1985;
    float _2009 = _2007 + _1987;
    bool _2011 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2013 = _2005 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2015 = fma(_1991, _2009, _1985);
    bool _2017 = _724 > 0.0;
    bool _2019 = isnan(_724);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan(0.0);
    bool _2025 = _2021 || _2023;
    float _2027 = fma(_2003, 0.298911988735198974609375, _2013);
    float _2029 = fma(_2015, 0.114477999508380889892578125, _2027);
    out.m_97.x = 0.0;
    float _2031 = -_2029;
    float _2033 = _2003 + _2031;
    float _2035 = -_2029;
    float _2037 = _2005 + _2035;
    float _2039 = -_2029;
    float _2041 = _2015 + _2039;
    float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2045 = fma(_2037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2047 = fma(_2041, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    bool _2049 = !_2011;
    if (!_2049)
    {
        float _2051 = -_658;
        float _2053 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2055 = -_660;
        float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2059 = -_662;
        float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2063 = _2053 * _2053;
        float _2065 = fma(_2057, _2057, _2063);
        float _2067 = fma(_2061, _2061, _2065);
        float _2069 = sqrt(_2067);
        float _2071 = rsqrt(_2067);
        float _2073 = -_2069;
        float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2077 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        float _2081 = _2057 * _2071;
        float _2083 = _2053 * _2071;
        float _2085 = abs(_2079);
        float _2087 = log2(_2085);
        float _2089 = _2061 * _2071;
        float _2091 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2093 = _1741 * _2083;
        float _2095 = -_2083;
        float _2097 = -_2091;
        float _2099 = fma(_2095, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2097);
        float _2101 = fma(_1747, _2081, _2093);
        float _2103 = -_2089;
        float _2105 = fma(_2103, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2099);
        float _2107 = fma(_1749, _2089, _2101);
        float _2109 = precise::clamp(_2107, 0.0, 1.0);
        float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2113 = _2105 + _2111;
        float _2115 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2117 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2119 = precise::clamp(_2117, 0.0, 1.0);
        float _2121 = exp2(_2115);
        float _2123 = _2121 * _2119;
        float _2125 = _2109 * _2123;
        float _2127 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2129 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2131 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2127;
        out.m_97.y = _2129;
        out.m_97.z = _2131;
    }
    out.m_99.x = _2043;
    out.m_99.y = _2045;
    out.m_99.z = _2047;
    if (_2025)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2133 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2133;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1891 = false;
    bool _350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2190 = as_type<float>(_134);
        out.gl_Position.z = _2190;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_51.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_148)
    {
        float _154 = float(_118);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2259 = as_type<float>(_170);
        out.gl_Position.z = _2259;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = _208;
    if (_214)
    {
        float _220 = rsqrt(_202);
        _218 = _220;
    }
    float _222 = _218;
    float _224 = 0.0;
    if (!_214)
    {
        _224 = 0.0;
    }
    float _226 = _224;
    bool _228 = _212 > 0.0;
    float _230 = 0.0;
    float _232 = _226;
    if (!_214)
    {
        _230 = 0.0;
    }
    float _234 = _230;
    float _236 = 0.0;
    float _238 = _234;
    if (!_214)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = _210;
    float _244 = _240;
    if (_216)
    {
        float _246 = rsqrt(_204);
        _242 = _246;
    }
    float _248 = _242;
    float _250 = 0.0;
    if (!_216)
    {
        _250 = 0.0;
    }
    float _252 = _250;
    float _254 = 0.0;
    float _256 = _252;
    if (!_216)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = 0.0;
    float _262 = _258;
    if (!_216)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = 0.0;
    float _268 = _264;
    if (_228)
    {
        float _270 = rsqrt(_206);
        _266 = _270;
    }
    float _272 = _266;
    if (_214)
    {
        float _274 = _222 * _178;
        _232 = _274;
    }
    float _276 = _232;
    if (_214)
    {
        float _278 = _222 * _172;
        _238 = _278;
    }
    float _280 = _238;
    if (_214)
    {
        float _282 = _222 * _184;
        _244 = _282;
    }
    float _284 = _244;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 0.0;
    if (!_228)
    {
        _288 = 0.0;
    }
    float _290 = _288;
    float _292 = 0.0;
    float _294 = _290;
    if (!_228)
    {
        _292 = 0.0;
    }
    float _296 = _292;
    float _298 = _296;
    if (_216)
    {
        float _300 = _248 * _180;
        _256 = _300;
    }
    float _302 = _256;
    float _304 = 0.0;
    if (!_228)
    {
        _304 = 0.0;
    }
    float _306 = _304;
    float _308 = _306;
    if (_216)
    {
        float _310 = _248 * _174;
        _262 = _310;
    }
    float _312 = _262;
    if (_216)
    {
        float _314 = _248 * _186;
        _268 = _314;
    }
    float _316 = _268;
    if (_228)
    {
        float _318 = _272 * _182;
        _294 = _318;
    }
    float _320 = _294;
    if (_228)
    {
        float _322 = _272 * _176;
        _298 = _322;
    }
    float _324 = _298;
    if (_228)
    {
        float _326 = _272 * _188;
        _308 = _326;
    }
    float _328 = _308;
    bool _330 = !_286;
    float _348;
    if (!_330)
    {
        float _332 = in.m_59.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_118);
        float _354 = 1.0 / _352;
        float _356 = _152 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_46.x;
    float _362 = in.m_46.y;
    float _364 = in.m_46.z;
    float _366 = (*spvDescriptorSet0.vp_c8)._m0[32].y * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _368 = in.m_61.x;
    float _370 = in.m_61.y;
    float _372 = in.m_61.z;
    float _374 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _366);
    float _376 = in.m_53.w;
    float _378 = fma((*spvDescriptorSet0.vp_c8)._m0[32].z, (*spvDescriptorSet0.vp_c8)._m0[32].z, _374);
    float _380 = in.m_63.x;
    float _382 = in.m_63.y;
    float _384 = in.m_63.z;
    float _386 = rsqrt(_378);
    float _388 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _390 = _174 * _362;
    float _392 = _186 * _362;
    float _394 = _180 * _362;
    float _396 = _388 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _398 = fma(_172, _360, _390);
    float _400 = fma(_184, _360, _392);
    float _402 = _396 * 0.15915493667125701904296875;
    float _404 = fma(_176, _364, _398);
    float _406 = _370 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = _386 * (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _410 = _386 * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _412 = fma(_178, _360, _394);
    float _414 = _402 * 6.283185482025146484375;
    float _416 = cos(_414);
    float _418 = _408 * _408;
    float _420 = _368 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _422 = _372 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _426 = fma(_410, _410, _418);
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _382);
    float _430 = fma(_182, _364, _412);
    float _432 = _402 * 6.283185482025146484375;
    float _434 = sin(_432);
    float _436 = in.m_55.w;
    float _438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _380);
    float _440 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _428 * _424;
    float _444 = in.m_57.w;
    float _446 = fma(_188, _364, _400);
    float _448 = _438 * _440;
    float _450 = rsqrt(_426);
    float _452 = _442 * _302;
    float _454 = _442 * _312;
    float _456 = _442 * _316;
    float _458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _384);
    float _460 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _462 = fma(_448, _276, _452);
    float _464 = fma(_448, _280, _454);
    float _466 = fma(_448, _284, _456);
    float _468 = -_416;
    float _470 = _468 + 1.0;
    float _472 = _458 * _460;
    float _474 = _404 + _376;
    float _476 = fma(_472, _324, _464);
    float _478 = fma(_472, _320, _462);
    float _480 = _410 * _450;
    float _482 = -_450;
    float _484 = _408 * _482;
    float _486 = fma(_472, _328, _466);
    float _488 = _430 + _436;
    float _490 = _480 * _470;
    float _492 = _480 * _434;
    float _494 = _484 * _484;
    float _496 = _484 * _434;
    float _498 = fma(_480, _490, _416);
    float _500 = _484 * _490;
    float _502 = _476 * _492;
    float _504 = fma(_470, _494, _416);
    float _506 = _476 * _496;
    float _508 = _474 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _510 = fma(_478, _500, _502);
    float _512 = _446 + _444;
    float _514 = -_506;
    float _516 = fma(_478, _498, _514);
    float _518 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[11].x, _508);
    float _520 = fma(_486, _504, _510);
    float _522 = _474 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _524 = fma(_486, _500, _516);
    float _526 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _518);
    float _528 = _512 + _520;
    float _530 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[10].x, _522);
    float _532 = _488 + _524;
    float _534 = _526 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _538 = _528 + _536;
    float _540 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _530);
    float _542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _544 = _532 + _542;
    float _546 = 1.0 / _534;
    float _548 = _538 * _538;
    float _550 = _540 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _552 = _476 * _416;
    float _554 = fma(_544, _544, _548);
    float _556 = _550 + _534;
    float _558 = fma(_478, _496, _552);
    float _560 = sqrt(_554);
    bool _562 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _564 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.5);
    bool _570 = _566 || _568;
    float _572 = -_492;
    float _574 = fma(_486, _572, _558);
    float _576 = _556 * _546;
    float _578 = _576 * 0.5;
    float _580 = _474 + _574;
    float _582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _584 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[30].w, _582);
    float _586 = 0.0;
    float _588 = _474;
    float _590 = _552;
    float _592 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _594 = _532;
    float _596 = _488;
    int _598 = as_type<int>(_358);
    if (_570)
    {
        _586 = 1.0;
    }
    float _600 = _586;
    bool _602 = _560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _604 = 1.0 / _584;
    float _606 = _600;
    if (!_602)
    {
        _588 = _532;
    }
    float _608 = _588;
    float _610 = _608;
    if (!_602)
    {
        _590 = _528;
    }
    float _612 = _590;
    float _614 = _612;
    if (!_602)
    {
        _592 = _580;
    }
    float _616 = _592;
    bool _618 = !_602;
    float _620 = _616;
    if (!_618)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _626 = _560 + _624;
        float _628 = _580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _630 = rsqrt(_554);
        float _632 = _626 * _622;
        float _634 = _632 * 0.15915493667125701904296875;
        float _636 = _634 * 6.283185482025146484375;
        float _638 = cos(_636);
        float _640 = _634 * 6.283185482025146484375;
        float _642 = sin(_640);
        float _644 = _638 + (-1.0);
        float _646 = _644 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _648 = fma(_642, _628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _650 = fma(_580, _638, _646);
        float _652 = _630 * _648;
        float _654 = fma(_544, _652, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _656 = fma(_538, _652, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _620 = _650;
        _610 = _654;
        _614 = _656;
    }
    float _658 = _620;
    float _660 = _610;
    float _662 = _614;
    float _664 = 0.0;
    if (_570)
    {
        _664 = 1.0;
    }
    float _666 = _664;
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _670 = _604 * _668;
    float _672 = _666;
    if (!_570)
    {
        float _674 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _678 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _676;
        float _680 = _674 * 0.15915493667125701904296875;
        float _682 = 1.0 / _678;
        float _684 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _686 = _680 * 6.283185482025146484375;
        float _688 = cos(_686);
        float _690 = _684 * 0.15915493667125701904296875;
        float _692 = _680 * 6.283185482025146484375;
        float _694 = sin(_692);
        float _696 = 1.0 / _688;
        float _698 = _690 * 6.283185482025146484375;
        float _700 = cos(_698);
        float _702 = _694 * _696;
        float _704 = _690 * 6.283185482025146484375;
        float _706 = sin(_704);
        float _708 = _700 * _702;
        float _710 = 1.0 / _708;
        float _712 = _706 * _710;
        float _714 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _716 = fma(_670, _712, _714);
        float _718 = _716 * _682;
        float _720 = precise::clamp(_718, 0.0, 1.0);
        _594 = _690;
        _606 = _720;
    }
    float _722 = _594;
    float _724 = _606;
    float _726 = _722;
    if (!_570)
    {
        float _728 = in.m_65.w;
        int _730 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _732 = _730 == 4;
        bool _734 = _730 == 8;
        bool _736 = _730 == 12;
        int _738 = as_type<int>(_728) << 16;
        int _740 = as_type<int>(_728) << 8;
        int _742 = as_type<int>(_728) << 24;
        int _744 = _738 >> 24;
        int _746 = _740 >> 24;
        int _748 = as_type<int>(_728) >> 24;
        int _750 = _742 >> 24;
        float _752 = float(_744);
        float _754 = float(_746);
        float _756 = float(_748);
        float _758 = _752 * 0.0078740157186985015869140625;
        float _760 = float(_750);
        float _762 = _754 * 0.0078740157186985015869140625;
        float _764 = _756 * 0.0078740157186985015869140625;
        float _766 = precise::min(_758, 1.0);
        float _768 = _760 * 0.0078740157186985015869140625;
        float _770 = precise::min(_762, 1.0);
        float _772 = precise::min(_764, 1.0);
        float _774 = precise::min(_768, 1.0);
        float _776 = precise::max(_766, -1.0);
        float _778 = precise::max(_770, -1.0);
        float _780 = precise::max(_772, -1.0);
        float _782 = precise::max(_774, -1.0);
        float _784 = _782;
        if (_732)
        {
            _784 = _776;
        }
        float _786 = _784;
        float _788 = _786;
        if (_734)
        {
            _788 = _778;
        }
        float _790 = _788;
        float _792 = _790;
        if (_736)
        {
            _792 = _780;
        }
        float _794 = _792;
        float _796 = abs(_794);
        float _798 = (-0.0) + _796;
        _672 = _798;
    }
    float _800 = _672;
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _804 = _658 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _660 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _812 = _662 + _810;
    float _814 = _804 * _804;
    bool _816 = _800 != 0.0;
    bool _818 = isnan(_800);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    float _826 = fma(_808, _808, _814);
    float _828 = fma(_812, _812, _826);
    float _830 = rsqrt(_828);
    float _832 = sqrt(_828);
    float _834 = _830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _836 = _808 * _834;
    float _838 = _812 * _834;
    float _840 = _836 * _836;
    float _842 = _838 * _838;
    float _844 = _840 + _842;
    float _846 = sqrt(_844);
    bool _848 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _846 + _850;
    float _854 = _812;
    float _856 = _844;
    float _858 = _852;
    float _860 = _804;
    float _862 = _814;
    float _864 = _836;
    if (_848)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _866;
    }
    float _868 = _854;
    if (_848)
    {
        float _870 = rsqrt(_844);
        _856 = _870;
    }
    float _872 = _856;
    if (_848)
    {
        float _874 = _852 * _868;
        _858 = _874;
    }
    float _876 = _858;
    if (_848)
    {
        float _878 = _876 * 0.15915493667125701904296875;
        _726 = _878;
    }
    float _880 = _726;
    float _882 = _868;
    if (_848)
    {
        float _884 = _880 * 6.283185482025146484375;
        float _886 = sin(_884);
        _882 = _886;
    }
    float _888 = _882;
    float _890 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _892 = precise::max(0.0, _890);
    float _894 = _830;
    float _896 = _892;
    if (_848)
    {
        float _898 = _880 * 6.283185482025146484375;
        float _900 = cos(_898);
        _894 = _900;
    }
    float _902 = _894;
    float _904 = -_834;
    float _906 = -_892;
    float _908 = fma(_804, _904, _906);
    float _910 = _908;
    if (!_848)
    {
        _860 = _838;
    }
    float _912 = _860;
    float _914 = _912;
    if (_848)
    {
        float _916 = _908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _896 = _916;
    }
    float _918 = _896;
    float _920 = _888;
    float _922 = _918;
    if (_848)
    {
        float _924 = fma(_888, _918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _920 = _924;
    }
    float _926 = _920;
    if (_848)
    {
        float _928 = _902 + (-1.0);
        _922 = _928;
    }
    float _930 = _922;
    float _932 = 0.0;
    float _934 = _930;
    if (_848)
    {
        float _936 = _872 * _926;
        _932 = _936;
    }
    float _938 = _932;
    float _940 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _942 = _940;
    if (!_848)
    {
        _596 = _840;
    }
    float _944 = _596;
    float _946 = _944;
    if (_848)
    {
        float _948 = _930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _862 = _948;
    }
    float _950 = _862;
    if (_848)
    {
        float _952 = _836 * _938;
        _864 = _952;
    }
    float _954 = _864;
    if (_848)
    {
        float _956 = _838 * _938;
        _914 = _956;
    }
    float _958 = _914;
    if (!_848)
    {
        _934 = _842;
    }
    float _960 = _934;
    float _962 = _960;
    if (_848)
    {
        float _964 = fma(_908, _902, _950);
        _910 = _964;
    }
    float _966 = _910;
    if (_848)
    {
        float _968 = _954 * _954;
        _946 = _968;
    }
    float _970 = _946;
    if (_848)
    {
        float _972 = _958 * _958;
        _962 = _972;
    }
    float _974 = _962;
    float _976 = _658 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _978 = fma(_966, _966, _970);
    float _980 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[2].x, _976);
    float _982 = floor(_940);
    float _984 = _978 + _974;
    float _986 = _658 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _988 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[2].z, _980);
    float _990 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _992 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[1].x, _986);
    float _994 = _988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _996 = rsqrt(_984);
    float _998 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1000 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[1].z, _992);
    float _1002 = _658 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1004 = _994 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1006 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1008 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1002);
    float _1010 = -_1004;
    float _1012 = fma(_1010, _990, 1.0);
    float _1014 = _658 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1016 = floor(_998);
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1020 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1018);
    float _1022 = precise::clamp(_1020, 0.0, 1.0);
    float _1024 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1008);
    float _1026 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1014);
    float _1028 = -_982;
    float _1030 = _940 + _1028;
    float _1032 = -_1022;
    float _1034 = _1032 + 1.0;
    float _1036 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1038 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1040 = _996 * _954;
    float _1042 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1026);
    float _1044 = _996 * _966;
    float _1046 = abs(_1034);
    float _1048 = log2(_1046);
    float _1050 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1038);
    float _1052 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1054 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1056 = _996 * _958;
    float _1058 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1050);
    float _1060 = -_1052;
    float _1062 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1060);
    float _1064 = log2(_1012);
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1058);
    float _1068 = -_1056;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1062);
    float _1072 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1074 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1076 = -_1016;
    float _1078 = _998 + _1076;
    float _1080 = fma(_1070, -0.5, 0.5);
    float _1082 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1072);
    float _1084 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1074);
    float _1086 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1088 = 1.0 / _1066;
    float _1090 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1082);
    float _1092 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1084);
    float _1094 = fma(_1070, 0.5, 0.5);
    float _1096 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1090);
    float _1098 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1092);
    float _1100 = fma(_1094, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1102 = sqrt(_1080);
    float _1104 = _1064 * 0.693147182464599609375;
    float _1106 = _982;
    float _1108 = _1066;
    if (_824)
    {
        _1106 = _1096;
    }
    float _1110 = _1106;
    float _1112 = fma(_1094, _1100, -0.212114393711090087890625);
    float _1114 = _1110;
    if (_824)
    {
        _942 = _1098;
    }
    float _1116 = _942;
    float2 _3715 = float2(_1030, _1078);
    float _1118 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3715, float2(0.0), isnan(_3715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3715, float2(0.0), isnan(_3715)), level(0.0)).x;
    float _1120 = _1116;
    if (!_824)
    {
        _1114 = 0.0;
    }
    float _1122 = _1114;
    float _1124 = fma(_1094, _1112, 1.570728778839111328125);
    float _1126 = exp2(_1086);
    if (!_824)
    {
        _1120 = 0.0;
    }
    float _1128 = _1120;
    float _1130 = _1044 + 1.0;
    float _1132 = _1088 * _1122;
    float _1134 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1136 = _1088 * _1128;
    float _1138 = fma(_1132, 0.5, 0.5);
    float _1140 = _1102 * 0.636619746685028076171875;
    float _1142 = fma(_1136, -0.5, 0.5);
    float _1144 = -_1124;
    float _1146 = fma(_1140, _1144, 1.0);
    float _1148 = -_1044;
    float _1150 = fma(_1126, _1130, _1148);
    float3 _3773 = float3(_1138, _1142, _1134);
    float _1152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3773, float3(0.0), isnan(_3773)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3773, float3(0.0), isnan(_3773)), level(0.0)).x;
    float3 _3784 = float3(_1138, _1142, _1134);
    float4 _1155 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3784, float3(0.0), isnan(_3784)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3784, float3(0.0), isnan(_3784)), level(0.0)).xyzw;
    float _1157 = _1155.x;
    float _1159 = _1155.y;
    float _1161 = _1155.z;
    float _1163 = _1155.w;
    float _1165 = fma(_1150, 0.5, 0.5);
    float2 _3802 = float2(_1146, _1165);
    float3 _1169 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3802, float2(0.0), isnan(_3802)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3802, float2(0.0), isnan(_3802)), level(0.0)).xyz;
    float _1171 = _1169.x;
    float _1173 = _1169.y;
    float _1175 = _1169.z;
    float _1177 = in.m_59.w;
    float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1181 = in.m_59.y;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1185 = _1183 != 0;
    float _1187 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1191 = _1189 != 0;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1195 = _1193 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1199 = _1197 != 0;
    float _1201 = in.m_67.x;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1205 = _1203 != 0;
    float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1209 = in.m_69.x;
    float _1211 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1215 = _1213 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1219 = _1217 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1221 = 1.0 / _1195;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1225 = _1134;
    bool _1227 = _1205;
    if (_1185)
    {
        float _1229 = in.m_59.x;
        _1223 = _1229;
    }
    float _1231 = _1223;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1235 = _1177 > 0.5;
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1239 = in.m_67.y;
    float _1241 = 1.0 / _1215;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1245 = _1181 > 0.5;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = 0.0;
    bool _1251 = _1235;
    if (_1191)
    {
        float _1253 = in.m_59.z;
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1257;
    float _1261 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1263 = 1.0 / _1219;
    float _1265 = _1201;
    if (!_1185)
    {
        _1225 = _1201;
    }
    float _1267 = _1225;
    out.m_71.x = _1209;
    int _1269 = 0;
    float _1271 = _1267;
    if (_1191)
    {
        float _1273 = -_1201;
        float _1275 = _1273 + 1.0;
        _1269 = as_type<int>(_1275);
    }
    int _1277 = _1269;
    float _1279 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1187);
    out.m_73.x = _660;
    out.m_73.y = _658;
    out.m_73.z = _662;
    float _1281 = _1259 * _1241;
    float _1283 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1285;
    bool _1289 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1291 = isnan(_358);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1307 = -_1239;
    float _1309 = _1307 + 1.0;
    float _1311 = _1287 * _1221;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1315 = _358 + _1313;
    out.m_75.x = _1247;
    out.m_75.y = _1261;
    out.m_75.z = _1283;
    float _1317 = _1303 * _1263;
    int _1319 = _1235 ? as_type<int>(_1309) : as_type<int>(_1239);
    float _1321 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1279);
    float _1323 = _1239;
    if (_1185)
    {
        bool _1325 = _1231 > 0.5;
        _1251 = _1325;
    }
    bool _1327 = _1251;
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1331 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1333 = isnan(_358);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1321);
    float _1345 = _1199 ? as_type<float>(_1319) : _1239;
    float _1347 = in.m_65.x;
    bool _1349 = _382 != 0.0;
    bool _1351 = isnan(_382);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan(0.0);
    bool _1357 = _1353 || _1355;
    float _1359 = -_1341;
    float _1361 = _1359 + 1.0;
    float _1363 = fma(_1311, _1315, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1365 = -_1299;
    float _1367 = _1365 + 1.0;
    bool _1369 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1371 = isnan(_358);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    float _1381 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1383 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1385 = isnan(_358);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1391 = _1387 || _1389;
    float _1393 = float(_1391);
    float _1395 = _1341 * _1367;
    bool _1397 = _380 == 0.0;
    bool _1399 = !_1357;
    bool _1401 = _1397 && _1399;
    float _1403 = in.m_77.x;
    float _1405 = in.m_77.y;
    float _1407 = in.m_77.z;
    float _1409 = -_1379;
    float _1411 = _1409 + 1.0;
    float _1413 = _1379 * _1361;
    float _1415 = _1411;
    float _1417 = _1343;
    if (_1205)
    {
        float _1419 = _1245 ? _1309 : _1239;
        _1323 = _1419;
    }
    float _1421 = _1323;
    float _1423 = -_1393;
    float _1425 = _1423 + 1.0;
    float _1427 = _1393 * _1411;
    bool _1429 = _384 == 0.0;
    bool _1431 = _1429 && _1401;
    float _1433 = exp2(_1211);
    float _1435 = _1255;
    if (_1191)
    {
        bool _1437 = _1255 > 0.5;
        _1227 = _1437;
    }
    bool _1439 = _1227;
    float _1441 = _1363 * _1427;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1445 = _358 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1449 = _358 + _1447;
    float _1451 = _1441;
    if (_1185)
    {
        float _1453 = -_1201;
        float _1455 = _1453 + 1.0;
        _598 = as_type<int>(_1455);
    }
    int _1457 = _598;
    float _1459 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1441);
    float _1461 = fma(_1317, _1445, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1463 = fma(_1281, _1449, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    out.gl_Position.x = _1096;
    out.gl_Position.y = _1098;
    out.gl_Position.z = _1343;
    out.gl_Position.w = _1066;
    if (_1185)
    {
        float _1465 = _1327 ? as_type<float>(_1457) : _1201;
        _1271 = _1465;
    }
    float _1467 = _1271;
    float _1469 = fma(_1461, _1413, _1459);
    if (_1191)
    {
        float _1471 = _1439 ? as_type<float>(_1277) : _1201;
        _1265 = _1471;
    }
    float _1473 = _1265;
    float _1475 = in.m_79.x;
    float _1477 = in.m_79.y;
    float _1479 = in.m_79.z;
    float _1481 = in.m_79.w;
    float _1483 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1485 = fma(_1463, _1395, _1469);
    float _1487 = _1403;
    if (_1431)
    {
        _1415 = _1403;
    }
    float _1489 = _1415;
    float _1491 = -_1433;
    float _1493 = _1491 + 1.0;
    float _1495 = _1489;
    if (_1431)
    {
        _1435 = _1405;
    }
    float _1497 = _1435;
    float _1499 = _1497;
    if (!_1431)
    {
        float _1501 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1405);
        _1499 = _1501;
    }
    float _1503 = _1499;
    if (_1431)
    {
        _1451 = _1489;
    }
    float _1505 = _1451;
    float _1507 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1485);
    float _1509 = _1505;
    if (!_1431)
    {
        _1495 = _1403;
    }
    float _1511 = _1495;
    float _1513 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1431)
    {
        _1487 = _1407;
    }
    float _1515 = _1487;
    float _1517 = _1515;
    if (!_1431)
    {
        float _1519 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1407);
        _1517 = _1519;
    }
    float _1521 = _1517;
    if (!_1431)
    {
        float _1523 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1511);
        _1509 = _1523;
    }
    float _1525 = _1509;
    float _1527 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1529 = _1381 * _1207;
    float _1531 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1533 = _316 * _1503;
    float _1535 = _1527 * _1179;
    float _1537 = _1483 * _1305;
    float _1539 = _1531 * _1329;
    float _1541 = fma(_284, _1525, _1533);
    float _1543 = _302 * _1477;
    float _1545 = _312 * _1477;
    float _1547 = _316 * _1477;
    float _1549 = _1479 * _1511;
    float _1551 = fma(_276, _1475, _1543);
    float _1553 = fma(_280, _1475, _1545);
    float _1555 = fma(_284, _1475, _1547);
    float _1557 = _1475 * _1405;
    float _1559 = fma(_320, _1479, _1551);
    float _1561 = -_1549;
    float _1563 = fma(_1475, _1407, _1561);
    float _1565 = _1477 * _1407;
    float _1567 = fma(_324, _1479, _1553);
    float _1569 = fma(_328, _1479, _1555);
    float _1571 = -_1557;
    float _1573 = fma(_1477, _1511, _1571);
    float _1575 = -_1565;
    float _1577 = fma(_1479, _1405, _1575);
    float _1579 = _1563 * _1481;
    float _1581 = abs(_670);
    float _1583 = log2(_1581);
    float _1585 = _302 * _1503;
    float _1587 = _1577 * _1481;
    float _1589 = _1573 * _1481;
    float _1591 = _312 * _1503;
    float _1593 = fma(_276, _1525, _1585);
    out.m_81.x = _1537;
    out.m_81.y = _1535;
    out.m_81.z = _1539;
    out.m_81.w = _1529;
    float _1595 = fma(_280, _1525, _1591);
    float _1597 = _1579 * _312;
    float _1599 = _1579 * _316;
    float _1601 = fma(_320, _1521, _1593);
    float _1603 = fma(_328, _1521, _1541);
    float _1605 = fma(_1587, _280, _1597);
    float _1607 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1609 = _1579 * _302;
    float _1611 = fma(_1587, _284, _1599);
    bool _1613 = _670 <= 8000.0;
    bool _1615 = isnan(_670);
    bool _1617 = _1613 || _1615;
    bool _1619 = isnan(8000.0);
    bool _1621 = _1617 || _1619;
    float _1623 = float(_1621);
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1627 = exp2(_1607);
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1633 = fma(_324, _1521, _1595);
    float _1635 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1643 = _1567 * _416;
    float _1645 = _1633 * _416;
    float _1647 = fma(_1587, _276, _1609);
    out.m_83.x = _1635;
    out.m_83.y = _1637;
    out.m_83.z = _1639;
    out.m_83.w = _1641;
    float _1649 = fma(_1601, _496, _1645);
    float _1651 = -_1513;
    float _1653 = _1651 + 1.0;
    bool _1655 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1657 = isnan(_832);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1663 = _1659 || _1661;
    float _1665 = fma(_1627, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1667 = precise::clamp(_1665, 0.0, 1.0);
    float _1669 = fma(_1559, _496, _1643);
    float _1671 = _1633 * _496;
    float _1673 = _1567 * _496;
    float _1675 = fma(_1667, -2.0, 3.0);
    float _1677 = _1667 * _1667;
    float _1679 = -_492;
    float _1681 = fma(_1569, _1679, _1669);
    float _1683 = _1633 * _492;
    float _1685 = _1677 * _1675;
    float _1687 = _1567 * _492;
    float _1689 = -_1671;
    float _1691 = fma(_1601, _498, _1689);
    float _1693 = fma(_1589, _320, _1647);
    float _1695 = fma(_1589, _328, _1611);
    float _1697 = fma(_1559, _500, _1687);
    float _1699 = fma(_1589, _324, _1605);
    float _1701 = -_1673;
    float _1703 = fma(_1559, _498, _1701);
    float _1705 = fma(_1601, _500, _1683);
    float _1707 = fma(_1569, _504, _1697);
    float _1709 = -_1685;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1569, _500, _1703);
    out.m_85.x = _1693;
    out.m_85.y = _1699;
    out.m_85.z = _1695;
    float _1715 = _1569;
    float _1717 = _1691;
    float _1719 = _1653;
    if (!_824)
    {
        _1715 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1721 = _1715;
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1685);
    out.m_87.x = _1713;
    out.m_87.y = _1681;
    out.m_87.z = _1707;
    float _1725 = _1623 * _1723;
    int _1727 = as_type<int>(_1721);
    if (!_824)
    {
        float _1729 = _1721 * 5.0;
        _1727 = as_type<int>(_1729);
    }
    int _1731 = _1727;
    float _1733 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1735 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1737 = _1343 + _1066;
    float _1739 = -_492;
    float _1741 = fma(_1603, _1739, _1649);
    if (!_824)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4775 = as_type<float>(_1731);
        out.gl_Position.z = _4775;
    }
    float _1743 = _1737 * 0.5;
    float _1745 = _1735 * _800;
    float _1747 = fma(_1603, _500, _1691);
    float _1749 = fma(_1603, _504, _1705);
    float _1751 = _1066;
    float _1753 = _1743;
    if (!_1663)
    {
        _1717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1755 = _1717;
    out.m_89.x = _1747;
    out.m_89.y = _1741;
    out.m_89.z = _1749;
    float _1757 = _1755;
    float _1759 = _1755;
    if (!_1663)
    {
        _1108 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1761 = _1108;
    float _1763 = _1761;
    float _1765 = _1761;
    if (!_1663)
    {
        _1417 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1767 = _1417;
    out.m_91.z = _1743;
    out.m_91.w = _1066;
    float _1769 = _1767;
    float _1771 = _1767;
    if (_824)
    {
        _1751 = _1745;
    }
    float _1773 = _1751;
    float _1775 = _1773;
    if (!_824)
    {
        _1775 = 0.0;
    }
    float _1777 = _1775;
    if (!_1663)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1779 = _1753;
    float _1781 = -_1118;
    float _1783 = _1781 + 1.0;
    float _1785 = _1783 * _1733;
    float _1787 = precise::clamp(_1785, 0.0, 1.0);
    float _1789 = -_1787;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1793 = _1791 * _1347;
    float _1795 = _1793 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1797 = _1513 * _1152;
    float _1799 = _1163 * _1653;
    out.m_93.x = _1795;
    float _1801 = _1779;
    float _1803 = _1779;
    if (!_1663)
    {
        _1719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1805 = _1719;
    float _1807 = _1163 * _1797;
    float _1809 = _1175 * _1797;
    float _1811 = fma(_1171, _1807, _1157);
    float _1813 = fma(_1173, _1807, _1159);
    float _1815 = _1807;
    float _1817 = _1805;
    float _1819 = _1805;
    if (!_1663)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1821 = _1815;
    float _1823 = fma(_1163, _1809, _1161);
    out.m_95.x = _1811;
    out.m_95.y = _1813;
    out.m_95.z = _1823;
    out.m_95.w = _1799;
    bool _1825 = !_1663;
    float _1827 = _1821;
    float _1829 = _1821;
    if (!_1825)
    {
        bool _1831 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1833 = isnan(_832);
        bool _1835 = _1831 || _1833;
        bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1839 = _1835 || _1837;
        if (!_1839)
        {
            float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1843 = _832 + _1841;
            float _1845 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1847 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1845;
            float _1849 = 1.0 / _1847;
            float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1853 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1865 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1871 = _1843 * _1849;
            float _1873 = precise::clamp(_1871, 0.0, 1.0);
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1879 = fma(_1873, _1853, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1881 = fma(_1873, _1877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1883 = fma(_1873, _1857, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1885 = fma(_1873, _1861, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1887 = fma(_1873, _1865, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1889 = fma(_1873, _1869, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1759 = _1879;
            _1771 = _1885;
            _1803 = _1881;
            _1829 = _1887;
            _1765 = _1883;
            _1819 = _1889;
            _1891 = true;
        }
        else
        {
            bool _1893 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1895 = isnan(_832);
            bool _1897 = _1893 || _1895;
            bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1901 = _1897 || _1899;
            if (!_1901)
            {
                _1757 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1903 = _1757;
            _1759 = _1903;
            if (!_1901)
            {
                _1801 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1905 = _1801;
            _1803 = _1905;
            if (!_1901)
            {
                _1763 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1907 = _1763;
            _1765 = _1907;
            if (!_1901)
            {
                _1769 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1909 = _1769;
            _1771 = _1909;
            if (!_1901)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1911 = _1827;
            _1829 = _1911;
            if (!_1901)
            {
                _1817 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1913 = _1817;
            bool _1915 = !_1901;
            _1819 = _1913;
            if (!_1915)
            {
                bool _1917 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1919 = isnan(_832);
                bool _1921 = _1917 || _1919;
                bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1925 = _1921 || _1923;
                if (!_1925)
                {
                    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1929 = _832 + _1927;
                    float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1931;
                    float _1935 = 1.0 / _1933;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1947 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1951 = _1949 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1957 = _1929 * _1935;
                    float _1959 = precise::clamp(_1957, 0.0, 1.0);
                    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1965 = fma(_1959, _1939, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1967 = fma(_1959, _1963, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1969 = fma(_1959, _1943, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1971 = fma(_1959, _1947, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1973 = fma(_1959, _1951, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1975 = fma(_1959, _1955, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1759 = _1965;
                    _1771 = _1971;
                    _1803 = _1967;
                    _1829 = _1973;
                    _1765 = _1969;
                    _1819 = _1975;
                    _1891 = true;
                }
                else
                {
                    _1759 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1771 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1803 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1765 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1819 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1891 = false;
    float _1977 = _1759;
    float _1979 = _1771;
    float _1981 = _1803;
    float _1983 = _1829;
    float _1985 = _1765;
    float _1987 = _1819;
    float _1989 = fma(_1741, -0.5, 0.5);
    float _1991 = precise::clamp(_1989, 0.0, 1.0);
    float _1993 = -_1977;
    float _1995 = _1993 + _1979;
    float _1997 = -_1981;
    float _1999 = _1997 + _1983;
    float _2001 = _1777 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2003 = fma(_1991, _1995, _1977);
    float _2005 = fma(_1991, _1999, _1981);
    out.m_93.w = _2001;
    float _2007 = -_1985;
    float _2009 = _2007 + _1987;
    bool _2011 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2013 = _2005 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2015 = fma(_1991, _2009, _1985);
    bool _2017 = _724 > 0.0;
    bool _2019 = isnan(_724);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan(0.0);
    bool _2025 = _2021 || _2023;
    float _2027 = fma(_2003, 0.298911988735198974609375, _2013);
    float _2029 = fma(_2015, 0.114477999508380889892578125, _2027);
    out.m_97.x = 0.0;
    float _2031 = -_2029;
    float _2033 = _2003 + _2031;
    float _2035 = -_2029;
    float _2037 = _2005 + _2035;
    float _2039 = -_2029;
    float _2041 = _2015 + _2039;
    float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2045 = fma(_2037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2047 = fma(_2041, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    bool _2049 = !_2011;
    if (!_2049)
    {
        float _2051 = -_658;
        float _2053 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2055 = -_660;
        float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2059 = -_662;
        float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2063 = _2053 * _2053;
        float _2065 = fma(_2057, _2057, _2063);
        float _2067 = fma(_2061, _2061, _2065);
        float _2069 = sqrt(_2067);
        float _2071 = rsqrt(_2067);
        float _2073 = -_2069;
        float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2077 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        float _2081 = _2057 * _2071;
        float _2083 = _2053 * _2071;
        float _2085 = abs(_2079);
        float _2087 = log2(_2085);
        float _2089 = _2061 * _2071;
        float _2091 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2093 = _1741 * _2083;
        float _2095 = -_2083;
        float _2097 = -_2091;
        float _2099 = fma(_2095, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2097);
        float _2101 = fma(_1747, _2081, _2093);
        float _2103 = -_2089;
        float _2105 = fma(_2103, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2099);
        float _2107 = fma(_1749, _2089, _2101);
        float _2109 = precise::clamp(_2107, 0.0, 1.0);
        float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2113 = _2105 + _2111;
        float _2115 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2117 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2119 = precise::clamp(_2117, 0.0, 1.0);
        float _2121 = exp2(_2115);
        float _2123 = _2121 * _2119;
        float _2125 = _2109 * _2123;
        float _2127 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2129 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2131 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2127;
        out.m_97.y = _2129;
        out.m_97.z = _2131;
    }
    out.m_99.x = _2043;
    out.m_99.y = _2045;
    out.m_99.z = _2047;
    if (_2025)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2133 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2133;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

