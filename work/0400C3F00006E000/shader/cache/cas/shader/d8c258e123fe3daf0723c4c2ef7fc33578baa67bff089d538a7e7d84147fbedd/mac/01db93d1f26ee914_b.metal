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
    float4 m_63 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _960 = as_type<float>(_104);
        out.gl_Position.z = _960;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1029 = as_type<float>(_140);
        out.gl_Position.z = _1029;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_47.x;
    float _144 = in.m_47.y;
    float _146 = in.m_47.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_42.x;
    float _152 = in.m_42.y;
    float _154 = in.m_42.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = in.m_51.w;
    float _180 = 0.0;
    float _182 = _148;
    if (!_164)
    {
        float _184 = _148 * _148;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_164)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_164;
    float _198 = _194;
    float _200 = 0.0;
    if (!_196)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _148 * _204;
        float _214 = exp2(_212);
        float _216 = _210 * 0.693147182464599609375;
        float _218 = 1.0 / _216;
        float _220 = 1.0 / _208;
        float _222 = _214 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _218, _148);
        float _228 = _226 * _220;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _230;
        _200 = _228;
    }
    float _232 = _198;
    float _234 = _200;
    bool _236 = !_164;
    float _238 = _234;
    if (!_236)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _148 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _182 = _258;
    }
    float _260 = _182;
    float _262 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _166);
    float _266 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _168);
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _272 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _276 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = _270 * _264;
    float _280 = fma(_260, _144, _272);
    float _282 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = _274 * _268;
    float _288 = fma(_280, _178, _152);
    float _290 = fma(_260, _142, _282);
    float _292 = fma(_260, _146, _284);
    float _294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _170);
    float _296 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = fma(_290, _178, _150);
    float _300 = fma(_292, _178, _154);
    float _302 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _304 = _286 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _306 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _310 = _302 * _294;
    float _312 = _286 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _314 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].x, _304);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _320 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].x, _312);
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[10].z, _314);
    float _324 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _316);
    float _326 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _328 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[8].z, _320);
    float _330 = _286 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _334 = _326 + _322;
    float _336 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _338 = _332 + _328;
    float _340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _342 = _334 + _340;
    float _344 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[9].z, _336);
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _348 = _338 + _346;
    float _350 = _342 * _342;
    float _352 = fma(_348, _348, _350);
    float _354 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = sqrt(_352);
    float _358 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _360 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _362 = _360 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _364 = _362 + _344;
    bool _366 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _368 = _354;
    float _370 = _338;
    float _372 = _362;
    float _374 = _310;
    if (!_366)
    {
        _368 = _338;
    }
    float _376 = _368;
    float _378 = _376;
    if (!_366)
    {
        _370 = _334;
    }
    float _380 = _370;
    float _382 = _380;
    if (!_366)
    {
        _372 = _364;
    }
    float _384 = _372;
    bool _386 = !_366;
    float _388 = _384;
    if (!_386)
    {
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _394 = _356 + _392;
        float _396 = rsqrt(_352);
        float _398 = _394 * _390;
        float _400 = _364 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _402 = _398 * 0.15915493667125701904296875;
        float _404 = _402 * 6.283185482025146484375;
        float _406 = cos(_404);
        float _408 = _402 * 6.283185482025146484375;
        float _410 = sin(_408);
        float _412 = _406 + (-1.0);
        float _414 = _412 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _416 = fma(_410, _400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _418 = fma(_364, _406, _414);
        float _420 = _396 * _416;
        float _422 = fma(_348, _420, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _424 = fma(_342, _420, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _388 = _418;
        _378 = _422;
        _382 = _424;
    }
    float _426 = _388;
    float _428 = _378;
    float _430 = _382;
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _434 = _426 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _438 = _428 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _442 = _430 + _440;
    float _444 = _434 * _434;
    float _446 = _426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _448 = fma(_438, _438, _444);
    float _450 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _452 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _446);
    float _454 = fma(_442, _442, _448);
    float _456 = rsqrt(_454);
    float _458 = _456 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _460 = _438 * _458;
    float _462 = _442 * _458;
    float _464 = _460 * _460;
    float _466 = _462 * _462;
    float _468 = _464 + _466;
    float _470 = sqrt(_468);
    bool _472 = _470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _476 = _470 + _474;
    float _478 = _342;
    float _480 = _468;
    float _482 = _476;
    float _484 = _434;
    float _486 = _460;
    if (_472)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _478 = _488;
    }
    float _490 = _478;
    if (_472)
    {
        float _492 = rsqrt(_468);
        _480 = _492;
    }
    float _494 = _480;
    float _496 = _494;
    if (_472)
    {
        float _498 = _476 * _490;
        _482 = _498;
    }
    float _500 = _482;
    if (_472)
    {
        float _502 = _500 * 0.15915493667125701904296875;
        _374 = _502;
    }
    float _504 = _374;
    float _506 = _442;
    if (_472)
    {
        float _508 = _504 * 6.283185482025146484375;
        float _510 = sin(_508);
        _506 = _510;
    }
    float _512 = _506;
    float _514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _516 = precise::max(0.0, _514);
    float _518 = _490;
    float _520 = _516;
    if (_472)
    {
        float _522 = _504 * 6.283185482025146484375;
        float _524 = cos(_522);
        _518 = _524;
    }
    float _526 = _518;
    float _528 = -_458;
    float _530 = -_516;
    float _532 = fma(_434, _528, _530);
    if (_472)
    {
        float _534 = _532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _484 = _534;
    }
    float _536 = _484;
    float _538 = sqrt(_454);
    float _540 = _512;
    float _542 = _536;
    if (_472)
    {
        float _544 = fma(_512, _536, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _540 = _544;
    }
    float _546 = _540;
    float _548 = _546;
    if (!_472)
    {
        _542 = _462;
    }
    float _550 = _542;
    float _552 = _550;
    if (_472)
    {
        float _554 = _526 + (-1.0);
        _520 = _554;
    }
    float _556 = _520;
    float _558 = _556;
    if (_472)
    {
        float _560 = _494 * _546;
        _238 = _560;
    }
    float _562 = _238;
    if (!_472)
    {
        _548 = _532;
    }
    float _564 = _548;
    float _566 = _564;
    if (_472)
    {
        float _568 = _556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _568;
    }
    float _570 = _558;
    float _572 = _570;
    if (_472)
    {
        float _574 = _460 * _562;
        _486 = _574;
    }
    float _576 = _486;
    if (!_472)
    {
        _496 = _464;
    }
    float _578 = _496;
    float _580 = _578;
    if (_472)
    {
        float _582 = _462 * _562;
        _552 = _582;
    }
    float _584 = _552;
    if (_472)
    {
        float _586 = fma(_532, _526, _570);
        _566 = _586;
    }
    float _588 = _566;
    if (_472)
    {
        float _590 = _576 * _576;
        _580 = _590;
    }
    float _592 = _580;
    if (!_472)
    {
        _572 = _466;
    }
    float _594 = _572;
    float _596 = _594;
    if (_472)
    {
        float _598 = _584 * _584;
        _596 = _598;
    }
    float _600 = _596;
    float _602 = fma(_588, _588, _592);
    float _604 = _602 + _600;
    float _606 = _426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _608 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _610 = fma(_538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _608);
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = rsqrt(_604);
    float _616 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _606);
    float _618 = _426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _620 = -_612;
    float _622 = _620 + 1.0;
    float _624 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].z, _616);
    float _626 = _426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _628 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _618);
    float _630 = abs(_622);
    float _632 = log2(_630);
    float _634 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _626);
    float _636 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _628);
    float _638 = _624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _640 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].z, _634);
    float _642 = _636 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _644 = _614 * _576;
    float _646 = _638 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _648 = _640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _650 = _642 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _652 = _614 * _588;
    float _654 = _644 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _656 = -_646;
    float _658 = fma(_656, _450, 1.0);
    float _660 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].z, _452);
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _650);
    float _664 = _614 * _584;
    float _666 = -_654;
    float _668 = fma(_652, (*spvDescriptorSet0.vp_c15)._m0[21].y, _666);
    float _670 = _660 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _672 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].z, _662);
    float _674 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _676 = -_664;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[21].z, _668);
    float _680 = _642 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[7].w, _672);
    float _684 = log2(_658);
    float _686 = fma(_678, -0.5, 0.5);
    float _688 = _642 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _690 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _680);
    float _692 = fma(_678, 0.5, 0.5);
    float _694 = _652 + 1.0;
    float _696 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _688);
    float _698 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].z, _690);
    float _700 = exp2(_674);
    float _702 = fma(_692, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _704 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].z, _696);
    float _706 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[4].w, _698);
    float _708 = fma(_692, _702, -0.212114393711090087890625);
    float _710 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[5].w, _704);
    float _712 = 1.0 / _682;
    float _714 = _684 * 0.693147182464599609375;
    float _716 = fma(_692, _708, 1.570728778839111328125);
    float _718 = _714 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _720 = sqrt(_686);
    float _722 = -_652;
    float _724 = fma(_700, _694, _722);
    float _726 = _706 * _712;
    float _728 = _710 * _712;
    float _730 = fma(_724, 0.5, 0.5);
    float _732 = fma(_726, 0.5, 0.5);
    float _734 = fma(_728, -0.5, 0.5);
    float _736 = _720 * 0.636619746685028076171875;
    float3 _2018 = float3(_732, _734, _718);
    float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2018, float3(0.0), isnan(_2018)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2018, float3(0.0), isnan(_2018)), level(0.0)).x;
    float _740 = -_716;
    float _742 = fma(_736, _740, 1.0);
    float3 _2034 = float3(_732, _734, _718);
    float4 _745 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2034, float3(0.0), isnan(_2034)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2034, float3(0.0), isnan(_2034)), level(0.0)).xyzw;
    float _747 = _745.x;
    float _749 = _745.y;
    float _751 = _745.z;
    float _753 = _745.w;
    float2 _2051 = float2(_742, _730);
    float3 _757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2051, float2(0.0), isnan(_2051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2051, float2(0.0), isnan(_2051)), level(0.0)).xyz;
    float _759 = _757.x;
    float _761 = _757.y;
    float _763 = _757.z;
    float _765 = in.m_53.x;
    float _767 = in.m_53.y;
    float _769 = in.m_53.z;
    bool _771 = _168 != 0.0;
    bool _773 = isnan(_168);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = _642 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _783 = in.m_55.w;
    bool _785 = _166 == 0.0;
    bool _787 = !_779;
    bool _789 = _785 && _787;
    float _791 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _781);
    out.m_57.x = _428;
    out.m_57.y = _426;
    out.m_57.z = _430;
    bool _793 = _170 == 0.0;
    bool _795 = _793 && _789;
    float _797 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].z, _791);
    float _799 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _801 = _706 + _682;
    float _803 = exp2(_799);
    float _805 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[6].w, _797);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _809 = _801 * 0.5;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _813 = _805 + _682;
    float _815 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _706;
    out.gl_Position.y = _710;
    out.gl_Position.z = _805;
    out.gl_Position.w = _682;
    float _817 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _767;
    float _821 = _765;
    float _823 = _769;
    if (!_795)
    {
        float _825 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _767);
        _819 = _825;
    }
    float _827 = _819;
    if (!_795)
    {
        float _829 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _765);
        _821 = _829;
    }
    float _831 = _821;
    if (!_795)
    {
        float _833 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _769);
        _823 = _833;
    }
    float _835 = _823;
    float _837 = _827 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _839 = _827 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _841 = _827 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _843 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[8].x, _837);
    float _845 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[9].x, _839);
    float _847 = -_803;
    float _849 = _847 + 1.0;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _857 = _849 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _861 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _841);
    float _869 = _682 * 0.5;
    float _871 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[8].z, _843);
    out.m_59.x = _861;
    out.m_59.y = _863;
    out.m_59.z = _865;
    out.m_59.w = _859;
    float _873 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[9].z, _845);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _877 = fma(_710, -0.5, _869);
    float _879 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[10].z, _867);
    float _881 = _813 * 0.5;
    float _883 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.w = _783;
    out.m_63.x = _815;
    out.m_63.y = _883;
    out.m_63.z = _817;
    out.m_65.x = _871;
    out.m_65.y = _873;
    out.m_65.z = _879;
    float _885 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _809;
    out.m_67.y = _877;
    out.m_67.z = _881;
    out.m_67.w = _682;
    out.m_45.x = _885;
    float _887 = _857 * _738;
    float _889 = -_857;
    float _891 = _889 + 1.0;
    float _893 = _753 * _887;
    float _895 = _753 * _891;
    float _897 = _763 * _887;
    float _899 = fma(_759, _893, _747);
    float _901 = fma(_761, _893, _749);
    float _903 = fma(_753, _897, _751);
    out.m_69.x = _899;
    out.m_69.y = _901;
    out.m_69.z = _903;
    out.m_69.w = _895;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _960 = as_type<float>(_104);
        out.gl_Position.z = _960;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1029 = as_type<float>(_140);
        out.gl_Position.z = _1029;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_47.x;
    float _144 = in.m_47.y;
    float _146 = in.m_47.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_42.x;
    float _152 = in.m_42.y;
    float _154 = in.m_42.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = in.m_51.w;
    float _180 = 0.0;
    float _182 = _148;
    if (!_164)
    {
        float _184 = _148 * _148;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_164)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_164;
    float _198 = _194;
    float _200 = 0.0;
    if (!_196)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _148 * _204;
        float _214 = exp2(_212);
        float _216 = _210 * 0.693147182464599609375;
        float _218 = 1.0 / _216;
        float _220 = 1.0 / _208;
        float _222 = _214 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _218, _148);
        float _228 = _226 * _220;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _230;
        _200 = _228;
    }
    float _232 = _198;
    float _234 = _200;
    bool _236 = !_164;
    float _238 = _234;
    if (!_236)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _148 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _182 = _258;
    }
    float _260 = _182;
    float _262 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _166);
    float _266 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _168);
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _272 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _276 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = _270 * _264;
    float _280 = fma(_260, _144, _272);
    float _282 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = _274 * _268;
    float _288 = fma(_280, _178, _152);
    float _290 = fma(_260, _142, _282);
    float _292 = fma(_260, _146, _284);
    float _294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _170);
    float _296 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = fma(_290, _178, _150);
    float _300 = fma(_292, _178, _154);
    float _302 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _304 = _286 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _306 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _310 = _302 * _294;
    float _312 = _286 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _314 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].x, _304);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _320 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].x, _312);
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[10].z, _314);
    float _324 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _316);
    float _326 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _328 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[8].z, _320);
    float _330 = _286 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _334 = _326 + _322;
    float _336 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _338 = _332 + _328;
    float _340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _342 = _334 + _340;
    float _344 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[9].z, _336);
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _348 = _338 + _346;
    float _350 = _342 * _342;
    float _352 = fma(_348, _348, _350);
    float _354 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = sqrt(_352);
    float _358 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _360 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _362 = _360 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _364 = _362 + _344;
    bool _366 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _368 = _354;
    float _370 = _338;
    float _372 = _362;
    float _374 = _310;
    if (!_366)
    {
        _368 = _338;
    }
    float _376 = _368;
    float _378 = _376;
    if (!_366)
    {
        _370 = _334;
    }
    float _380 = _370;
    float _382 = _380;
    if (!_366)
    {
        _372 = _364;
    }
    float _384 = _372;
    bool _386 = !_366;
    float _388 = _384;
    if (!_386)
    {
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _394 = _356 + _392;
        float _396 = rsqrt(_352);
        float _398 = _394 * _390;
        float _400 = _364 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _402 = _398 * 0.15915493667125701904296875;
        float _404 = _402 * 6.283185482025146484375;
        float _406 = cos(_404);
        float _408 = _402 * 6.283185482025146484375;
        float _410 = sin(_408);
        float _412 = _406 + (-1.0);
        float _414 = _412 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _416 = fma(_410, _400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _418 = fma(_364, _406, _414);
        float _420 = _396 * _416;
        float _422 = fma(_348, _420, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _424 = fma(_342, _420, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _388 = _418;
        _378 = _422;
        _382 = _424;
    }
    float _426 = _388;
    float _428 = _378;
    float _430 = _382;
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _434 = _426 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _438 = _428 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _442 = _430 + _440;
    float _444 = _434 * _434;
    float _446 = _426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _448 = fma(_438, _438, _444);
    float _450 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _452 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _446);
    float _454 = fma(_442, _442, _448);
    float _456 = rsqrt(_454);
    float _458 = _456 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _460 = _438 * _458;
    float _462 = _442 * _458;
    float _464 = _460 * _460;
    float _466 = _462 * _462;
    float _468 = _464 + _466;
    float _470 = sqrt(_468);
    bool _472 = _470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _476 = _470 + _474;
    float _478 = _342;
    float _480 = _468;
    float _482 = _476;
    float _484 = _434;
    float _486 = _460;
    if (_472)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _478 = _488;
    }
    float _490 = _478;
    if (_472)
    {
        float _492 = rsqrt(_468);
        _480 = _492;
    }
    float _494 = _480;
    float _496 = _494;
    if (_472)
    {
        float _498 = _476 * _490;
        _482 = _498;
    }
    float _500 = _482;
    if (_472)
    {
        float _502 = _500 * 0.15915493667125701904296875;
        _374 = _502;
    }
    float _504 = _374;
    float _506 = _442;
    if (_472)
    {
        float _508 = _504 * 6.283185482025146484375;
        float _510 = sin(_508);
        _506 = _510;
    }
    float _512 = _506;
    float _514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _516 = precise::max(0.0, _514);
    float _518 = _490;
    float _520 = _516;
    if (_472)
    {
        float _522 = _504 * 6.283185482025146484375;
        float _524 = cos(_522);
        _518 = _524;
    }
    float _526 = _518;
    float _528 = -_458;
    float _530 = -_516;
    float _532 = fma(_434, _528, _530);
    if (_472)
    {
        float _534 = _532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _484 = _534;
    }
    float _536 = _484;
    float _538 = sqrt(_454);
    float _540 = _512;
    float _542 = _536;
    if (_472)
    {
        float _544 = fma(_512, _536, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _540 = _544;
    }
    float _546 = _540;
    float _548 = _546;
    if (!_472)
    {
        _542 = _462;
    }
    float _550 = _542;
    float _552 = _550;
    if (_472)
    {
        float _554 = _526 + (-1.0);
        _520 = _554;
    }
    float _556 = _520;
    float _558 = _556;
    if (_472)
    {
        float _560 = _494 * _546;
        _238 = _560;
    }
    float _562 = _238;
    if (!_472)
    {
        _548 = _532;
    }
    float _564 = _548;
    float _566 = _564;
    if (_472)
    {
        float _568 = _556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _568;
    }
    float _570 = _558;
    float _572 = _570;
    if (_472)
    {
        float _574 = _460 * _562;
        _486 = _574;
    }
    float _576 = _486;
    if (!_472)
    {
        _496 = _464;
    }
    float _578 = _496;
    float _580 = _578;
    if (_472)
    {
        float _582 = _462 * _562;
        _552 = _582;
    }
    float _584 = _552;
    if (_472)
    {
        float _586 = fma(_532, _526, _570);
        _566 = _586;
    }
    float _588 = _566;
    if (_472)
    {
        float _590 = _576 * _576;
        _580 = _590;
    }
    float _592 = _580;
    if (!_472)
    {
        _572 = _466;
    }
    float _594 = _572;
    float _596 = _594;
    if (_472)
    {
        float _598 = _584 * _584;
        _596 = _598;
    }
    float _600 = _596;
    float _602 = fma(_588, _588, _592);
    float _604 = _602 + _600;
    float _606 = _426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _608 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _610 = fma(_538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _608);
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = rsqrt(_604);
    float _616 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _606);
    float _618 = _426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _620 = -_612;
    float _622 = _620 + 1.0;
    float _624 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].z, _616);
    float _626 = _426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _628 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _618);
    float _630 = abs(_622);
    float _632 = log2(_630);
    float _634 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _626);
    float _636 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _628);
    float _638 = _624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _640 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].z, _634);
    float _642 = _636 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _644 = _614 * _576;
    float _646 = _638 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _648 = _640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _650 = _642 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _652 = _614 * _588;
    float _654 = _644 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _656 = -_646;
    float _658 = fma(_656, _450, 1.0);
    float _660 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].z, _452);
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _650);
    float _664 = _614 * _584;
    float _666 = -_654;
    float _668 = fma(_652, (*spvDescriptorSet0.vp_c15)._m0[21].y, _666);
    float _670 = _660 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _672 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].z, _662);
    float _674 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _676 = -_664;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[21].z, _668);
    float _680 = _642 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[7].w, _672);
    float _684 = log2(_658);
    float _686 = fma(_678, -0.5, 0.5);
    float _688 = _642 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _690 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _680);
    float _692 = fma(_678, 0.5, 0.5);
    float _694 = _652 + 1.0;
    float _696 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _688);
    float _698 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].z, _690);
    float _700 = exp2(_674);
    float _702 = fma(_692, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _704 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].z, _696);
    float _706 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[4].w, _698);
    float _708 = fma(_692, _702, -0.212114393711090087890625);
    float _710 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[5].w, _704);
    float _712 = 1.0 / _682;
    float _714 = _684 * 0.693147182464599609375;
    float _716 = fma(_692, _708, 1.570728778839111328125);
    float _718 = _714 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _720 = sqrt(_686);
    float _722 = -_652;
    float _724 = fma(_700, _694, _722);
    float _726 = _706 * _712;
    float _728 = _710 * _712;
    float _730 = fma(_724, 0.5, 0.5);
    float _732 = fma(_726, 0.5, 0.5);
    float _734 = fma(_728, -0.5, 0.5);
    float _736 = _720 * 0.636619746685028076171875;
    float3 _2018 = float3(_732, _734, _718);
    float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2018, float3(0.0), isnan(_2018)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2018, float3(0.0), isnan(_2018)), level(0.0)).x;
    float _740 = -_716;
    float _742 = fma(_736, _740, 1.0);
    float3 _2034 = float3(_732, _734, _718);
    float4 _745 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2034, float3(0.0), isnan(_2034)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2034, float3(0.0), isnan(_2034)), level(0.0)).xyzw;
    float _747 = _745.x;
    float _749 = _745.y;
    float _751 = _745.z;
    float _753 = _745.w;
    float2 _2051 = float2(_742, _730);
    float3 _757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2051, float2(0.0), isnan(_2051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2051, float2(0.0), isnan(_2051)), level(0.0)).xyz;
    float _759 = _757.x;
    float _761 = _757.y;
    float _763 = _757.z;
    float _765 = in.m_53.x;
    float _767 = in.m_53.y;
    float _769 = in.m_53.z;
    bool _771 = _168 != 0.0;
    bool _773 = isnan(_168);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = _642 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _783 = in.m_55.w;
    bool _785 = _166 == 0.0;
    bool _787 = !_779;
    bool _789 = _785 && _787;
    float _791 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _781);
    out.m_57.x = _428;
    out.m_57.y = _426;
    out.m_57.z = _430;
    bool _793 = _170 == 0.0;
    bool _795 = _793 && _789;
    float _797 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].z, _791);
    float _799 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _801 = _706 + _682;
    float _803 = exp2(_799);
    float _805 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[6].w, _797);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _809 = _801 * 0.5;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _813 = _805 + _682;
    float _815 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _706;
    out.gl_Position.y = _710;
    out.gl_Position.z = _805;
    out.gl_Position.w = _682;
    float _817 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _767;
    float _821 = _765;
    float _823 = _769;
    if (!_795)
    {
        float _825 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _767);
        _819 = _825;
    }
    float _827 = _819;
    if (!_795)
    {
        float _829 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _765);
        _821 = _829;
    }
    float _831 = _821;
    if (!_795)
    {
        float _833 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _769);
        _823 = _833;
    }
    float _835 = _823;
    float _837 = _827 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _839 = _827 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _841 = _827 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _843 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[8].x, _837);
    float _845 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[9].x, _839);
    float _847 = -_803;
    float _849 = _847 + 1.0;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _857 = _849 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _861 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _841);
    float _869 = _682 * 0.5;
    float _871 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[8].z, _843);
    out.m_59.x = _861;
    out.m_59.y = _863;
    out.m_59.z = _865;
    out.m_59.w = _859;
    float _873 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[9].z, _845);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _877 = fma(_710, -0.5, _869);
    float _879 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[10].z, _867);
    float _881 = _813 * 0.5;
    float _883 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.w = _783;
    out.m_63.x = _815;
    out.m_63.y = _883;
    out.m_63.z = _817;
    out.m_65.x = _871;
    out.m_65.y = _873;
    out.m_65.z = _879;
    float _885 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _809;
    out.m_67.y = _877;
    out.m_67.z = _881;
    out.m_67.w = _682;
    out.m_45.x = _885;
    float _887 = _857 * _738;
    float _889 = -_857;
    float _891 = _889 + 1.0;
    float _893 = _753 * _887;
    float _895 = _753 * _891;
    float _897 = _763 * _887;
    float _899 = fma(_759, _893, _747);
    float _901 = fma(_761, _893, _749);
    float _903 = fma(_753, _897, _751);
    out.m_69.x = _899;
    out.m_69.y = _901;
    out.m_69.z = _903;
    out.m_69.w = _895;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _960 = as_type<float>(_104);
        out.gl_Position.z = _960;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1029 = as_type<float>(_140);
        out.gl_Position.z = _1029;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_47.x;
    float _144 = in.m_47.y;
    float _146 = in.m_47.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_42.x;
    float _152 = in.m_42.y;
    float _154 = in.m_42.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = in.m_51.w;
    float _180 = 0.0;
    float _182 = _148;
    if (!_164)
    {
        float _184 = _148 * _148;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_164)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_164;
    float _198 = _194;
    float _200 = 0.0;
    if (!_196)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _148 * _204;
        float _214 = exp2(_212);
        float _216 = _210 * 0.693147182464599609375;
        float _218 = 1.0 / _216;
        float _220 = 1.0 / _208;
        float _222 = _214 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _218, _148);
        float _228 = _226 * _220;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _230;
        _200 = _228;
    }
    float _232 = _198;
    float _234 = _200;
    bool _236 = !_164;
    float _238 = _234;
    if (!_236)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _148 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _182 = _258;
    }
    float _260 = _182;
    float _262 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _166);
    float _266 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _168);
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _272 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _276 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = _270 * _264;
    float _280 = fma(_260, _144, _272);
    float _282 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = _274 * _268;
    float _288 = fma(_280, _178, _152);
    float _290 = fma(_260, _142, _282);
    float _292 = fma(_260, _146, _284);
    float _294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _170);
    float _296 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = fma(_290, _178, _150);
    float _300 = fma(_292, _178, _154);
    float _302 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _304 = _286 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _306 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _310 = _302 * _294;
    float _312 = _286 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _314 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].x, _304);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _320 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].x, _312);
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[10].z, _314);
    float _324 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _316);
    float _326 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _328 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[8].z, _320);
    float _330 = _286 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _334 = _326 + _322;
    float _336 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _338 = _332 + _328;
    float _340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _342 = _334 + _340;
    float _344 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[9].z, _336);
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _348 = _338 + _346;
    float _350 = _342 * _342;
    float _352 = fma(_348, _348, _350);
    float _354 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = sqrt(_352);
    float _358 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _360 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _362 = _360 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _364 = _362 + _344;
    bool _366 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _368 = _354;
    float _370 = _338;
    float _372 = _362;
    float _374 = _310;
    if (!_366)
    {
        _368 = _338;
    }
    float _376 = _368;
    float _378 = _376;
    if (!_366)
    {
        _370 = _334;
    }
    float _380 = _370;
    float _382 = _380;
    if (!_366)
    {
        _372 = _364;
    }
    float _384 = _372;
    bool _386 = !_366;
    float _388 = _384;
    if (!_386)
    {
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _394 = _356 + _392;
        float _396 = rsqrt(_352);
        float _398 = _394 * _390;
        float _400 = _364 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _402 = _398 * 0.15915493667125701904296875;
        float _404 = _402 * 6.283185482025146484375;
        float _406 = cos(_404);
        float _408 = _402 * 6.283185482025146484375;
        float _410 = sin(_408);
        float _412 = _406 + (-1.0);
        float _414 = _412 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _416 = fma(_410, _400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _418 = fma(_364, _406, _414);
        float _420 = _396 * _416;
        float _422 = fma(_348, _420, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _424 = fma(_342, _420, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _388 = _418;
        _378 = _422;
        _382 = _424;
    }
    float _426 = _388;
    float _428 = _378;
    float _430 = _382;
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _434 = _426 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _438 = _428 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _442 = _430 + _440;
    float _444 = _434 * _434;
    float _446 = _426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _448 = fma(_438, _438, _444);
    float _450 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _452 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _446);
    float _454 = fma(_442, _442, _448);
    float _456 = rsqrt(_454);
    float _458 = _456 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _460 = _438 * _458;
    float _462 = _442 * _458;
    float _464 = _460 * _460;
    float _466 = _462 * _462;
    float _468 = _464 + _466;
    float _470 = sqrt(_468);
    bool _472 = _470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _476 = _470 + _474;
    float _478 = _342;
    float _480 = _468;
    float _482 = _476;
    float _484 = _434;
    float _486 = _460;
    if (_472)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _478 = _488;
    }
    float _490 = _478;
    if (_472)
    {
        float _492 = rsqrt(_468);
        _480 = _492;
    }
    float _494 = _480;
    float _496 = _494;
    if (_472)
    {
        float _498 = _476 * _490;
        _482 = _498;
    }
    float _500 = _482;
    if (_472)
    {
        float _502 = _500 * 0.15915493667125701904296875;
        _374 = _502;
    }
    float _504 = _374;
    float _506 = _442;
    if (_472)
    {
        float _508 = _504 * 6.283185482025146484375;
        float _510 = sin(_508);
        _506 = _510;
    }
    float _512 = _506;
    float _514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _516 = precise::max(0.0, _514);
    float _518 = _490;
    float _520 = _516;
    if (_472)
    {
        float _522 = _504 * 6.283185482025146484375;
        float _524 = cos(_522);
        _518 = _524;
    }
    float _526 = _518;
    float _528 = -_458;
    float _530 = -_516;
    float _532 = fma(_434, _528, _530);
    if (_472)
    {
        float _534 = _532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _484 = _534;
    }
    float _536 = _484;
    float _538 = sqrt(_454);
    float _540 = _512;
    float _542 = _536;
    if (_472)
    {
        float _544 = fma(_512, _536, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _540 = _544;
    }
    float _546 = _540;
    float _548 = _546;
    if (!_472)
    {
        _542 = _462;
    }
    float _550 = _542;
    float _552 = _550;
    if (_472)
    {
        float _554 = _526 + (-1.0);
        _520 = _554;
    }
    float _556 = _520;
    float _558 = _556;
    if (_472)
    {
        float _560 = _494 * _546;
        _238 = _560;
    }
    float _562 = _238;
    if (!_472)
    {
        _548 = _532;
    }
    float _564 = _548;
    float _566 = _564;
    if (_472)
    {
        float _568 = _556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _568;
    }
    float _570 = _558;
    float _572 = _570;
    if (_472)
    {
        float _574 = _460 * _562;
        _486 = _574;
    }
    float _576 = _486;
    if (!_472)
    {
        _496 = _464;
    }
    float _578 = _496;
    float _580 = _578;
    if (_472)
    {
        float _582 = _462 * _562;
        _552 = _582;
    }
    float _584 = _552;
    if (_472)
    {
        float _586 = fma(_532, _526, _570);
        _566 = _586;
    }
    float _588 = _566;
    if (_472)
    {
        float _590 = _576 * _576;
        _580 = _590;
    }
    float _592 = _580;
    if (!_472)
    {
        _572 = _466;
    }
    float _594 = _572;
    float _596 = _594;
    if (_472)
    {
        float _598 = _584 * _584;
        _596 = _598;
    }
    float _600 = _596;
    float _602 = fma(_588, _588, _592);
    float _604 = _602 + _600;
    float _606 = _426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _608 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _610 = fma(_538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _608);
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = rsqrt(_604);
    float _616 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _606);
    float _618 = _426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _620 = -_612;
    float _622 = _620 + 1.0;
    float _624 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].z, _616);
    float _626 = _426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _628 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _618);
    float _630 = abs(_622);
    float _632 = log2(_630);
    float _634 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _626);
    float _636 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _628);
    float _638 = _624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _640 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].z, _634);
    float _642 = _636 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _644 = _614 * _576;
    float _646 = _638 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _648 = _640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _650 = _642 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _652 = _614 * _588;
    float _654 = _644 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _656 = -_646;
    float _658 = fma(_656, _450, 1.0);
    float _660 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].z, _452);
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _650);
    float _664 = _614 * _584;
    float _666 = -_654;
    float _668 = fma(_652, (*spvDescriptorSet0.vp_c15)._m0[21].y, _666);
    float _670 = _660 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _672 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].z, _662);
    float _674 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _676 = -_664;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[21].z, _668);
    float _680 = _642 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[7].w, _672);
    float _684 = log2(_658);
    float _686 = fma(_678, -0.5, 0.5);
    float _688 = _642 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _690 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _680);
    float _692 = fma(_678, 0.5, 0.5);
    float _694 = _652 + 1.0;
    float _696 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _688);
    float _698 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].z, _690);
    float _700 = exp2(_674);
    float _702 = fma(_692, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _704 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].z, _696);
    float _706 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[4].w, _698);
    float _708 = fma(_692, _702, -0.212114393711090087890625);
    float _710 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[5].w, _704);
    float _712 = 1.0 / _682;
    float _714 = _684 * 0.693147182464599609375;
    float _716 = fma(_692, _708, 1.570728778839111328125);
    float _718 = _714 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _720 = sqrt(_686);
    float _722 = -_652;
    float _724 = fma(_700, _694, _722);
    float _726 = _706 * _712;
    float _728 = _710 * _712;
    float _730 = fma(_724, 0.5, 0.5);
    float _732 = fma(_726, 0.5, 0.5);
    float _734 = fma(_728, -0.5, 0.5);
    float _736 = _720 * 0.636619746685028076171875;
    float3 _2018 = float3(_732, _734, _718);
    float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2018, float3(0.0), isnan(_2018)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2018, float3(0.0), isnan(_2018)), level(0.0)).x;
    float _740 = -_716;
    float _742 = fma(_736, _740, 1.0);
    float3 _2034 = float3(_732, _734, _718);
    float4 _745 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2034, float3(0.0), isnan(_2034)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2034, float3(0.0), isnan(_2034)), level(0.0)).xyzw;
    float _747 = _745.x;
    float _749 = _745.y;
    float _751 = _745.z;
    float _753 = _745.w;
    float2 _2051 = float2(_742, _730);
    float3 _757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2051, float2(0.0), isnan(_2051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2051, float2(0.0), isnan(_2051)), level(0.0)).xyz;
    float _759 = _757.x;
    float _761 = _757.y;
    float _763 = _757.z;
    float _765 = in.m_53.x;
    float _767 = in.m_53.y;
    float _769 = in.m_53.z;
    bool _771 = _168 != 0.0;
    bool _773 = isnan(_168);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = _642 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _783 = in.m_55.w;
    bool _785 = _166 == 0.0;
    bool _787 = !_779;
    bool _789 = _785 && _787;
    float _791 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _781);
    out.m_57.x = _428;
    out.m_57.y = _426;
    out.m_57.z = _430;
    bool _793 = _170 == 0.0;
    bool _795 = _793 && _789;
    float _797 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].z, _791);
    float _799 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _801 = _706 + _682;
    float _803 = exp2(_799);
    float _805 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[6].w, _797);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _809 = _801 * 0.5;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _813 = _805 + _682;
    float _815 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _706;
    out.gl_Position.y = _710;
    out.gl_Position.z = _805;
    out.gl_Position.w = _682;
    float _817 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _767;
    float _821 = _765;
    float _823 = _769;
    if (!_795)
    {
        float _825 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _767);
        _819 = _825;
    }
    float _827 = _819;
    if (!_795)
    {
        float _829 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _765);
        _821 = _829;
    }
    float _831 = _821;
    if (!_795)
    {
        float _833 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _769);
        _823 = _833;
    }
    float _835 = _823;
    float _837 = _827 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _839 = _827 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _841 = _827 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _843 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[8].x, _837);
    float _845 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[9].x, _839);
    float _847 = -_803;
    float _849 = _847 + 1.0;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _857 = _849 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _861 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _841);
    float _869 = _682 * 0.5;
    float _871 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[8].z, _843);
    out.m_59.x = _861;
    out.m_59.y = _863;
    out.m_59.z = _865;
    out.m_59.w = _859;
    float _873 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[9].z, _845);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _877 = fma(_710, -0.5, _869);
    float _879 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[10].z, _867);
    float _881 = _813 * 0.5;
    float _883 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.w = _783;
    out.m_63.x = _815;
    out.m_63.y = _883;
    out.m_63.z = _817;
    out.m_65.x = _871;
    out.m_65.y = _873;
    out.m_65.z = _879;
    float _885 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _809;
    out.m_67.y = _877;
    out.m_67.z = _881;
    out.m_67.w = _682;
    out.m_45.x = _885;
    float _887 = _857 * _738;
    float _889 = -_857;
    float _891 = _889 + 1.0;
    float _893 = _753 * _887;
    float _895 = _753 * _891;
    float _897 = _763 * _887;
    float _899 = fma(_759, _893, _747);
    float _901 = fma(_761, _893, _749);
    float _903 = fma(_753, _897, _751);
    out.m_69.x = _899;
    out.m_69.y = _901;
    out.m_69.z = _903;
    out.m_69.w = _895;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

