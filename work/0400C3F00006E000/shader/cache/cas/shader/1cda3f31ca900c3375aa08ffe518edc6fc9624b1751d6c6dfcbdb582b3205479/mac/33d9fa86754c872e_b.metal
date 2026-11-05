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
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1382 = as_type<float>(_110);
        out.gl_Position.z = _1382;
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
    if (_124)
    {
        float _130 = float(_94);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1451 = as_type<float>(_146);
        out.gl_Position.z = _1451;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_47.x;
    float _154 = in.m_47.y;
    float _156 = in.m_47.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = in.m_51.x;
    float _176 = in.m_51.y;
    float _178 = in.m_51.z;
    float _180 = in.m_49.x;
    float _182 = in.m_49.y;
    float _184 = in.m_49.z;
    float _186 = 0.0;
    float _188 = _150;
    if (!_166)
    {
        float _190 = _150 * _150;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_166)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_166;
    float _204 = _200;
    int _206 = as_type<int>(_178);
    float _208 = _176;
    if (!_202)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _150 * _212;
        float _222 = exp2(_220);
        float _224 = _218 * 0.693147182464599609375;
        float _226 = 1.0 / _224;
        float _228 = 1.0 / _216;
        float _230 = _222 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _226, _150);
        float _236 = _234 * _228;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _238;
    }
    float _240 = _204;
    bool _242 = !_166;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _150 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _188 = _262;
    }
    float _264 = _188;
    float _266 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _176);
    float _272 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _276 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _280 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _174);
    float _284 = fma(_264, _154, _276);
    float _286 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _288 = _278 * _270;
    float _290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _178);
    float _292 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _294 = fma(_264, _152, _286);
    float _296 = fma(_284, _148, _170);
    float _298 = _280 * _290;
    float _300 = fma(_264, _156, _292);
    float _302 = fma(_294, _148, _168);
    float _304 = _296 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _274 * _282;
    float _308 = fma(_300, _148, _172);
    float _310 = _288 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _314 = _296 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _288 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _318 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _320 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _324 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].x, _316);
    float _326 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _296 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _332 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _322);
    float _334 = _288 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _336 = _328 + _326;
    float _338 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].x, _330);
    float _340 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].z, _324);
    float _342 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].x, _334);
    float _346 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _338);
    float _348 = _336 * 0.119999997317790985107421875;
    float _350 = _342 + _340;
    float _352 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _344);
    float _354 = _346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _356 = _348 * 0.15915493667125701904296875;
    float _358 = _350 * 0.14000000059604644775390625;
    float _360 = in.m_53.y;
    float _362 = _354 + _352;
    float _364 = _356 * 6.283185482025146484375;
    float _366 = sin(_364);
    float _368 = _358 * 0.15915493667125701904296875;
    float _370 = _362 * 0.1599999964237213134765625;
    float _372 = _370 * 0.15915493667125701904296875;
    float _374 = _368 * 6.283185482025146484375;
    float _376 = sin(_374);
    float _378 = _372 * 6.283185482025146484375;
    float _380 = sin(_378);
    float _382 = -_360;
    float _384 = _382 + 1.0;
    float _386 = _366 + _376;
    float _388 = _386 + _380;
    float _390 = _384 * _388;
    float _392 = _390 * 2.0;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].y, _362);
    float _396 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[8].y, _336);
    float _398 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[9].y, _350);
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _402 = _394 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _406 = _396 + _404;
    float _408 = _402 * _402;
    float _410 = fma(_406, _406, _408);
    float _412 = sqrt(_410);
    bool _414 = _412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _416 = _334;
    float _418 = _396;
    float _420 = _394;
    float _422 = _298;
    float _424 = _360;
    if (!_414)
    {
        _416 = _398;
    }
    float _426 = _416;
    bool _428 = !_414;
    float _430 = _426;
    if (!_428)
    {
        float _432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _436 = _412 + _434;
        float _438 = rsqrt(_410);
        float _440 = _436 * _432;
        float _442 = _398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _444 = _440 * 0.15915493667125701904296875;
        float _446 = _444 * 6.283185482025146484375;
        float _448 = sin(_446);
        float _450 = _444 * 6.283185482025146484375;
        float _452 = cos(_450);
        float _454 = fma(_448, _442, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _456 = _438 * _454;
        float _458 = _452 + (-1.0);
        float _460 = fma(_406, _456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _462 = fma(_402, _456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _464 = _458 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = fma(_398, _452, _464);
        _430 = _466;
        _418 = _460;
        _420 = _462;
    }
    float _468 = _430;
    float _470 = _418;
    float _472 = _420;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _476 = _468 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _480 = _470 + _478;
    float _482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _484 = _472 + _482;
    float _486 = _476 * _476;
    float _488 = fma(_480, _480, _486);
    float _490 = fma(_484, _484, _488);
    float _492 = rsqrt(_490);
    float _494 = _492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _496 = _480 * _494;
    float _498 = _484 * _494;
    float _500 = _496 * _496;
    float _502 = _498 * _498;
    float _504 = _500 + _502;
    float _506 = sqrt(_504);
    bool _508 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _512 = _506 + _510;
    float _514 = _398;
    float _516 = _504;
    float _518 = _512;
    float _520 = _494;
    if (_508)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _522;
    }
    float _524 = _514;
    if (_508)
    {
        float _526 = rsqrt(_504);
        _516 = _526;
    }
    float _528 = _516;
    float _530 = _528;
    if (_508)
    {
        float _532 = _512 * _524;
        _518 = _532;
    }
    float _534 = _518;
    if (_508)
    {
        float _536 = _534 * 0.15915493667125701904296875;
        _422 = _536;
    }
    float _538 = _422;
    float _540 = _406;
    if (_508)
    {
        float _542 = _538 * 6.283185482025146484375;
        float _544 = sin(_542);
        _540 = _544;
    }
    float _546 = _540;
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _550 = precise::max(0.0, _548);
    float _552 = _402;
    float _554 = _550;
    float _556 = _548;
    if (_508)
    {
        float _558 = _538 * 6.283185482025146484375;
        float _560 = cos(_558);
        _552 = _560;
    }
    float _562 = _552;
    float _564 = -_494;
    float _566 = -_550;
    float _568 = fma(_476, _564, _566);
    if (_508)
    {
        float _570 = _568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _554 = _570;
    }
    float _572 = _554;
    float _574 = sqrt(_490);
    float _576 = _572;
    float _578 = _546;
    if (_508)
    {
        float _580 = fma(_546, _572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = _582;
    if (!_508)
    {
        _578 = _496;
    }
    float _586 = _578;
    float _588 = _586;
    float _590 = _562;
    if (_508)
    {
        float _592 = _562 + (-1.0);
        _556 = _592;
    }
    float _594 = _556;
    float _596 = 0.0;
    float _598 = _594;
    if (_508)
    {
        float _600 = _528 * _582;
        _596 = _600;
    }
    float _602 = _596;
    if (!_508)
    {
        _584 = _568;
    }
    float _604 = _584;
    float _606 = _604;
    if (_508)
    {
        float _608 = _594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _520 = _608;
    }
    float _610 = _520;
    if (_508)
    {
        float _612 = _496 * _602;
        _588 = _612;
    }
    float _614 = _588;
    if (!_508)
    {
        _598 = _498;
    }
    float _616 = _598;
    float _618 = _616;
    if (_508)
    {
        float _620 = _498 * _602;
        _618 = _620;
    }
    float _622 = _618;
    if (!_508)
    {
        _530 = _500;
    }
    float _624 = _530;
    float _626 = _624;
    if (_508)
    {
        float _628 = fma(_568, _562, _610);
        _606 = _628;
    }
    float _630 = _606;
    if (_508)
    {
        float _632 = _614 * _614;
        _626 = _632;
    }
    float _634 = _626;
    if (!_508)
    {
        _590 = _502;
    }
    float _636 = _590;
    float _638 = _636;
    if (_508)
    {
        float _640 = _622 * _622;
        _638 = _640;
    }
    float _642 = _638;
    float _644 = fma(_630, _630, _634);
    float _646 = _644 + _642;
    float _648 = _468 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _650 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _652 = fma(_574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _650);
    float _654 = precise::clamp(_652, 0.0, 1.0);
    float _656 = _468 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _660 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[2].x, _648);
    float _662 = rsqrt(_646);
    float _664 = -_654;
    float _666 = _664 + 1.0;
    float _668 = _468 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _670 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[2].z, _660);
    float _672 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[1].x, _656);
    float _674 = _468 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _676 = _670 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _678 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[0].x, _668);
    float _680 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[1].z, _672);
    float _682 = abs(_666);
    float _684 = log2(_682);
    float _686 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[3].x, _674);
    float _688 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[0].z, _678);
    float _690 = _680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _692 = _676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _694 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[3].z, _686);
    float _696 = _688 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _698 = _690 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _700 = _662 * _614;
    float _702 = _694 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _704 = _662 * _630;
    float _706 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[7].x, _698);
    float _708 = _700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _710 = _662 * _622;
    float _712 = -_692;
    float _714 = fma(_712, _658, 1.0);
    float _716 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _706);
    float _718 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _720 = -_708;
    float _722 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _720);
    float _724 = _690 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _726 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _716);
    float _728 = log2(_714);
    float _730 = -_710;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _722);
    float _734 = _690 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _736 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[4].x, _724);
    float _738 = fma(_732, -0.5, 0.5);
    float _740 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[5].x, _734);
    float _742 = fma(_732, 0.5, 0.5);
    float _744 = exp2(_718);
    float _746 = _704 + 1.0;
    float _748 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _736);
    float _750 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _740);
    float _752 = fma(_742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _754 = 1.0 / _726;
    float _756 = fma(_742, _752, -0.212114393711090087890625);
    float _758 = fma(_742, _756, 1.570728778839111328125);
    float _760 = sqrt(_738);
    float _762 = -_704;
    float _764 = fma(_744, _746, _762);
    float _766 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _748);
    float _768 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _750);
    float _770 = _728 * 0.693147182464599609375;
    float _772 = fma(_764, 0.5, 0.5);
    float _774 = _766 * _754;
    float _776 = _768 * _754;
    float _778 = _770 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _780 = fma(_774, 0.5, 0.5);
    float _782 = fma(_776, -0.5, 0.5);
    float _784 = _760 * 0.636619746685028076171875;
    float3 _2494 = float3(_780, _782, _778);
    float _786 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2494, float3(0.0), isnan(_2494)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2494, float3(0.0), isnan(_2494)), level(0.0)).x;
    float _788 = -_758;
    float _790 = fma(_784, _788, 1.0);
    float3 _2510 = float3(_780, _782, _778);
    float4 _793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2510, float3(0.0), isnan(_2510)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2510, float3(0.0), isnan(_2510)), level(0.0)).xyzw;
    float _795 = _793.x;
    float _797 = _793.y;
    float _799 = _793.z;
    float _801 = _793.w;
    float2 _2527 = float2(_790, _772);
    float3 _805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2527, float2(0.0), isnan(_2527)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2527, float2(0.0), isnan(_2527)), level(0.0)).xyz;
    float _807 = _805.x;
    float _809 = _805.y;
    float _811 = _805.z;
    float _813 = in.m_55.w;
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _817 = in.m_53.x;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _821 = _819 != 0;
    float _823 = _690 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _825 = in.m_55.x;
    float _827 = in.m_55.y;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _833 = in.m_55.z;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _837 = _835 != 0;
    float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _843 = _841 != 0;
    out.m_57.y = _360;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _847 = _845 != 0;
    float _849 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[6].x, _823);
    out.m_59.x = _480;
    out.m_59.y = _476;
    out.m_59.z = _484;
    bool _851 = _813 > 0.5;
    float _853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _855 = as_type<int>(_813);
    float _857 = _780;
    bool _859 = _847;
    if (_821)
    {
        float _861 = -_817;
        float _863 = _861 + 1.0;
        _855 = as_type<int>(_863);
    }
    int _865 = _855;
    float _867 = 0.0;
    if (!_821)
    {
        _867 = _817;
    }
    float _869 = _867;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _873 = _825 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _875 = false;
    float _877 = _869;
    int _879 = as_type<int>(_871);
    float _881 = _825;
    if (_821)
    {
        bool _883 = _825 > 0.5;
        _875 = _883;
    }
    bool _885 = _875;
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_837)
    {
        _857 = _825;
    }
    float _889 = _857;
    float _891 = _827 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _893 = _827 > 0.5;
    float _895 = -_831;
    float _897 = fma(_873, 2.0, _895);
    float _899 = _891;
    float _901 = _889;
    if (_821)
    {
        float _903 = _885 ? as_type<float>(_865) : _817;
        _877 = _903;
    }
    float _905 = _877;
    float _907 = fma(_891, -2.0, _829);
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _911 = _909 != 0;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _915 = _893 ? as_type<int>(_384) : as_type<int>(_360);
    float _917 = -_128;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[76].x, _897);
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _923 = _921 != 0;
    float _925 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[78].z, _913);
    float _927 = _911 ? as_type<float>(_915) : _360;
    float _929 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _931 = _851 ? as_type<int>(_384) : as_type<int>(_360);
    bool _933 = _176 != 0.0;
    bool _935 = isnan(_176);
    bool _937 = _933 || _935;
    bool _939 = isnan(0.0);
    bool _941 = _937 || _939;
    float _943 = fma(_929, _927, -0.5);
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _947 = _945 != 0;
    float _949 = in.m_61.x;
    float _951 = in.m_61.y;
    float _953 = in.m_61.z;
    bool _955 = _174 == 0.0;
    bool _957 = !_941;
    bool _959 = _955 && _957;
    float _961 = _839 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _963 = _178 == 0.0;
    bool _965 = _963 && _959;
    float _967 = _847 ? as_type<float>(_931) : _360;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _971 = _907;
    float _973 = _833;
    if (_923)
    {
        bool _975 = _833 > 0.5;
        _859 = _975;
    }
    bool _977 = _859;
    if (!_837)
    {
        _899 = _833;
    }
    float _979 = _899;
    float _981 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[78].w, _969);
    float _983 = fma(_967, _961, -0.5);
    float _985 = 0.0;
    float _987 = _979;
    if (!_837)
    {
        _985 = _827;
    }
    float _989 = _985;
    float _991 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[88].w, _871);
    float _993 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _981);
    float _995 = _993;
    float _997 = _989;
    if (_843)
    {
        float _999 = -_817;
        float _1001 = _999 + 1.0;
        _879 = as_type<int>(_1001);
    }
    int _1003 = _879;
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1007 = _953;
    float _1009 = _949;
    float _1011 = _951;
    if (!_965)
    {
        float _1013 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _953);
        _1007 = _1013;
    }
    float _1015 = _1007;
    if (_923)
    {
        float _1017 = -_817;
        float _1019 = _1017 + 1.0;
        _206 = as_type<int>(_1019);
    }
    int _1021 = _206;
    if (!_965)
    {
        float _1023 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _949);
        _1009 = _1023;
    }
    float _1025 = _1009;
    if (!_965)
    {
        float _1027 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _951);
        _1011 = _1027;
    }
    float _1029 = _1011;
    float _1031 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _907);
    if (!_923)
    {
        _208 = _817;
    }
    float _1033 = _208;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1037 = _1033;
    if (_923)
    {
        float _1039 = _977 ? as_type<float>(_1021) : _817;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = -_1031;
    float _1045 = fma(_993, _943, _1043);
    float _1047 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_837)
    {
        _995 = _979;
    }
    float _1049 = _995;
    float _1051 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1035);
    float _1053 = _1049;
    if (!_837)
    {
        _971 = _989;
    }
    float _1055 = _971;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1059 = _1055;
    if (_837)
    {
        _987 = _833;
    }
    float _1061 = _987;
    float _1063 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1047);
    bool _1065 = _833 > 0.5;
    if (_837)
    {
        _997 = _825;
    }
    float _1067 = _997;
    if (!_843)
    {
        _973 = _817;
    }
    float _1069 = _973;
    float _1071 = _1069;
    if (_843)
    {
        float _1073 = _893 ? as_type<float>(_1003) : _817;
        _1071 = _1073;
    }
    float _1075 = _1071;
    float _1077 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1057);
    float _1081 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_837)
    {
        _1059 = _825;
    }
    float _1083 = _1059;
    float _1085 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1077);
    float _1087 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1081);
    float _1089 = _1083;
    if (_947)
    {
        float _1091 = _1065 ? _384 : _360;
        _424 = _1091;
    }
    float _1093 = _424;
    float _1095 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_837)
    {
        _901 = _1061;
    }
    float _1097 = _901;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1101 = _853 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1103 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1105 = _1099;
    float _1107 = _1101;
    if (!_837)
    {
        _1089 = _1049;
    }
    float _1109 = _1089;
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1099);
    float _1113 = _1109;
    if (_837)
    {
        _1053 = _827;
    }
    float _1115 = _1053;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_837)
    {
        _1105 = _827;
    }
    float _1119 = _1105;
    float _1121 = fma(_1101, _1041, -0.5);
    float _1123 = _1119;
    if (!_837)
    {
        _1123 = _825;
    }
    float _1125 = _1123;
    float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_837)
    {
        _881 = _1061;
    }
    float _1129 = _881;
    float _1131 = fma(_1095, _905, -0.5);
    if (_837)
    {
        _1107 = _1061;
    }
    float _1133 = _1107;
    float _1135 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1111);
    float _1137 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1117);
    float _1139 = _1133;
    if (!_837)
    {
        _1139 = _827;
    }
    float _1141 = _1139;
    float _1143 = _887 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1147 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1085);
    float _1149 = fma(_1143, _1093, -0.5);
    float _1151 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1145);
    if (_837)
    {
        _1113 = _827;
    }
    float _1153 = _1113;
    float _1155 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1063);
    float _1157 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _925);
    float _1159 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1151);
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1163 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1087);
    float _1165 = fma(_1157, _1131, _919);
    float _1167 = _1159 * (-0.15915493667125701904296875);
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1171 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1175 = -_1161;
    float _1177 = fma(_1103, 2.0, _1175);
    float _1179 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1181 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1183 = _1135 * (-0.15915493667125701904296875);
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1189 = fma(_1181, -2.0, _1173);
    float _1191 = fma(_1179, _1075, -0.5);
    float _1193 = _1183 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1051);
    float _1199 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1201 = fma(_1169, -2.0, _1185);
    float _1203 = -_1187;
    float _1205 = fma(_1171, 2.0, _1203);
    float _1207 = _1165 + 0.5;
    float _1209 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _991);
    float _1211 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1079);
    float _1213 = _1183 * 6.283185482025146484375;
    float _1215 = cos(_1213);
    float _1217 = -_128;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1177);
    float _1221 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1201);
    float _1223 = -_128;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1205);
    float _1227 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1189);
    out.m_63.x = _1155;
    out.m_63.y = _1147;
    out.m_63.z = _1163;
    float _1229 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _849);
    float _1231 = _726 * 0.5;
    float _1233 = exp2(_1199);
    float _1235 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1137);
    float _1237 = _1195 * _983;
    float _1239 = in.m_65.w;
    float _1241 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1229);
    float _1243 = _1045 + 0.5;
    float _1245 = _1167 * 6.283185482025146484375;
    float _1247 = sin(_1245);
    float _1249 = _1215 * _983;
    float _1251 = -_1237;
    float _1253 = fma(_1215, _1121, _1251);
    float _1255 = _1241 + _726;
    out.gl_Position.x = _766;
    out.gl_Position.y = _768;
    out.gl_Position.z = _1241;
    out.gl_Position.w = _726;
    float _1257 = fma(_1195, _1121, _1249);
    float _1259 = fma(_1211, _1253, _1219);
    float _1261 = _1167 * 6.283185482025146484375;
    float _1263 = cos(_1261);
    float _1265 = -_1233;
    float _1267 = _1265 + 1.0;
    float _1269 = -_1221;
    float _1271 = fma(_1235, _1257, _1269);
    float _1273 = fma(_768, -0.5, _1231);
    float _1275 = _1255 * 0.5;
    float _1277 = _1267 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1279 = _1247 * _1149;
    out.m_67.w = _1239;
    float _1281 = _1263 * _1149;
    float _1283 = -_1279;
    float _1285 = fma(_1263, _1191, _1283);
    float _1287 = fma(_1247, _1191, _1281);
    float _1289 = fma(_1197, _1285, _1225);
    float _1291 = _1259 + 0.5;
    float _1293 = -_1227;
    float _1295 = fma(_1209, _1287, _1293);
    float _1297 = _1271 + 0.5;
    float _1299 = _766 + _726;
    float _1301 = _1289 + 0.5;
    float _1303 = _1295 + 0.5;
    float _1305 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1307 = _1299 * 0.5;
    out.m_69.x = _1207;
    out.m_69.y = _1243;
    out.m_69.z = _1291;
    out.m_69.w = _1297;
    out.m_71.x = _1301;
    out.m_71.y = _1303;
    out.m_73.x = _1307;
    out.m_73.y = _1273;
    out.m_73.z = _1275;
    out.m_73.w = _726;
    out.m_45.x = _1305;
    float _1309 = _1277 * _786;
    float _1311 = -_1277;
    float _1313 = _1311 + 1.0;
    float _1315 = _801 * _1309;
    float _1317 = _801 * _1313;
    float _1319 = _811 * _1309;
    float _1321 = fma(_807, _1315, _795);
    float _1323 = fma(_809, _1315, _797);
    float _1325 = fma(_801, _1319, _799);
    out.m_75.x = _1321;
    out.m_75.y = _1323;
    out.m_75.z = _1325;
    out.m_75.w = _1317;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1382 = as_type<float>(_110);
        out.gl_Position.z = _1382;
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
    if (_124)
    {
        float _130 = float(_94);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1451 = as_type<float>(_146);
        out.gl_Position.z = _1451;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_47.x;
    float _154 = in.m_47.y;
    float _156 = in.m_47.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = in.m_51.x;
    float _176 = in.m_51.y;
    float _178 = in.m_51.z;
    float _180 = in.m_49.x;
    float _182 = in.m_49.y;
    float _184 = in.m_49.z;
    float _186 = 0.0;
    float _188 = _150;
    if (!_166)
    {
        float _190 = _150 * _150;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_166)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_166;
    float _204 = _200;
    int _206 = as_type<int>(_178);
    float _208 = _176;
    if (!_202)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _150 * _212;
        float _222 = exp2(_220);
        float _224 = _218 * 0.693147182464599609375;
        float _226 = 1.0 / _224;
        float _228 = 1.0 / _216;
        float _230 = _222 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _226, _150);
        float _236 = _234 * _228;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _238;
    }
    float _240 = _204;
    bool _242 = !_166;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _150 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _188 = _262;
    }
    float _264 = _188;
    float _266 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _176);
    float _272 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _276 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _280 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _174);
    float _284 = fma(_264, _154, _276);
    float _286 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _288 = _278 * _270;
    float _290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _178);
    float _292 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _294 = fma(_264, _152, _286);
    float _296 = fma(_284, _148, _170);
    float _298 = _280 * _290;
    float _300 = fma(_264, _156, _292);
    float _302 = fma(_294, _148, _168);
    float _304 = _296 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _274 * _282;
    float _308 = fma(_300, _148, _172);
    float _310 = _288 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _314 = _296 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _288 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _318 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _320 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _324 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].x, _316);
    float _326 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _296 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _332 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _322);
    float _334 = _288 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _336 = _328 + _326;
    float _338 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].x, _330);
    float _340 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].z, _324);
    float _342 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].x, _334);
    float _346 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _338);
    float _348 = _336 * 0.119999997317790985107421875;
    float _350 = _342 + _340;
    float _352 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _344);
    float _354 = _346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _356 = _348 * 0.15915493667125701904296875;
    float _358 = _350 * 0.14000000059604644775390625;
    float _360 = in.m_53.y;
    float _362 = _354 + _352;
    float _364 = _356 * 6.283185482025146484375;
    float _366 = sin(_364);
    float _368 = _358 * 0.15915493667125701904296875;
    float _370 = _362 * 0.1599999964237213134765625;
    float _372 = _370 * 0.15915493667125701904296875;
    float _374 = _368 * 6.283185482025146484375;
    float _376 = sin(_374);
    float _378 = _372 * 6.283185482025146484375;
    float _380 = sin(_378);
    float _382 = -_360;
    float _384 = _382 + 1.0;
    float _386 = _366 + _376;
    float _388 = _386 + _380;
    float _390 = _384 * _388;
    float _392 = _390 * 2.0;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].y, _362);
    float _396 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[8].y, _336);
    float _398 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[9].y, _350);
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _402 = _394 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _406 = _396 + _404;
    float _408 = _402 * _402;
    float _410 = fma(_406, _406, _408);
    float _412 = sqrt(_410);
    bool _414 = _412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _416 = _334;
    float _418 = _396;
    float _420 = _394;
    float _422 = _298;
    float _424 = _360;
    if (!_414)
    {
        _416 = _398;
    }
    float _426 = _416;
    bool _428 = !_414;
    float _430 = _426;
    if (!_428)
    {
        float _432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _436 = _412 + _434;
        float _438 = rsqrt(_410);
        float _440 = _436 * _432;
        float _442 = _398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _444 = _440 * 0.15915493667125701904296875;
        float _446 = _444 * 6.283185482025146484375;
        float _448 = sin(_446);
        float _450 = _444 * 6.283185482025146484375;
        float _452 = cos(_450);
        float _454 = fma(_448, _442, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _456 = _438 * _454;
        float _458 = _452 + (-1.0);
        float _460 = fma(_406, _456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _462 = fma(_402, _456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _464 = _458 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = fma(_398, _452, _464);
        _430 = _466;
        _418 = _460;
        _420 = _462;
    }
    float _468 = _430;
    float _470 = _418;
    float _472 = _420;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _476 = _468 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _480 = _470 + _478;
    float _482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _484 = _472 + _482;
    float _486 = _476 * _476;
    float _488 = fma(_480, _480, _486);
    float _490 = fma(_484, _484, _488);
    float _492 = rsqrt(_490);
    float _494 = _492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _496 = _480 * _494;
    float _498 = _484 * _494;
    float _500 = _496 * _496;
    float _502 = _498 * _498;
    float _504 = _500 + _502;
    float _506 = sqrt(_504);
    bool _508 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _512 = _506 + _510;
    float _514 = _398;
    float _516 = _504;
    float _518 = _512;
    float _520 = _494;
    if (_508)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _522;
    }
    float _524 = _514;
    if (_508)
    {
        float _526 = rsqrt(_504);
        _516 = _526;
    }
    float _528 = _516;
    float _530 = _528;
    if (_508)
    {
        float _532 = _512 * _524;
        _518 = _532;
    }
    float _534 = _518;
    if (_508)
    {
        float _536 = _534 * 0.15915493667125701904296875;
        _422 = _536;
    }
    float _538 = _422;
    float _540 = _406;
    if (_508)
    {
        float _542 = _538 * 6.283185482025146484375;
        float _544 = sin(_542);
        _540 = _544;
    }
    float _546 = _540;
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _550 = precise::max(0.0, _548);
    float _552 = _402;
    float _554 = _550;
    float _556 = _548;
    if (_508)
    {
        float _558 = _538 * 6.283185482025146484375;
        float _560 = cos(_558);
        _552 = _560;
    }
    float _562 = _552;
    float _564 = -_494;
    float _566 = -_550;
    float _568 = fma(_476, _564, _566);
    if (_508)
    {
        float _570 = _568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _554 = _570;
    }
    float _572 = _554;
    float _574 = sqrt(_490);
    float _576 = _572;
    float _578 = _546;
    if (_508)
    {
        float _580 = fma(_546, _572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = _582;
    if (!_508)
    {
        _578 = _496;
    }
    float _586 = _578;
    float _588 = _586;
    float _590 = _562;
    if (_508)
    {
        float _592 = _562 + (-1.0);
        _556 = _592;
    }
    float _594 = _556;
    float _596 = 0.0;
    float _598 = _594;
    if (_508)
    {
        float _600 = _528 * _582;
        _596 = _600;
    }
    float _602 = _596;
    if (!_508)
    {
        _584 = _568;
    }
    float _604 = _584;
    float _606 = _604;
    if (_508)
    {
        float _608 = _594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _520 = _608;
    }
    float _610 = _520;
    if (_508)
    {
        float _612 = _496 * _602;
        _588 = _612;
    }
    float _614 = _588;
    if (!_508)
    {
        _598 = _498;
    }
    float _616 = _598;
    float _618 = _616;
    if (_508)
    {
        float _620 = _498 * _602;
        _618 = _620;
    }
    float _622 = _618;
    if (!_508)
    {
        _530 = _500;
    }
    float _624 = _530;
    float _626 = _624;
    if (_508)
    {
        float _628 = fma(_568, _562, _610);
        _606 = _628;
    }
    float _630 = _606;
    if (_508)
    {
        float _632 = _614 * _614;
        _626 = _632;
    }
    float _634 = _626;
    if (!_508)
    {
        _590 = _502;
    }
    float _636 = _590;
    float _638 = _636;
    if (_508)
    {
        float _640 = _622 * _622;
        _638 = _640;
    }
    float _642 = _638;
    float _644 = fma(_630, _630, _634);
    float _646 = _644 + _642;
    float _648 = _468 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _650 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _652 = fma(_574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _650);
    float _654 = precise::clamp(_652, 0.0, 1.0);
    float _656 = _468 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _660 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[2].x, _648);
    float _662 = rsqrt(_646);
    float _664 = -_654;
    float _666 = _664 + 1.0;
    float _668 = _468 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _670 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[2].z, _660);
    float _672 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[1].x, _656);
    float _674 = _468 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _676 = _670 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _678 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[0].x, _668);
    float _680 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[1].z, _672);
    float _682 = abs(_666);
    float _684 = log2(_682);
    float _686 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[3].x, _674);
    float _688 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[0].z, _678);
    float _690 = _680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _692 = _676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _694 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[3].z, _686);
    float _696 = _688 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _698 = _690 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _700 = _662 * _614;
    float _702 = _694 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _704 = _662 * _630;
    float _706 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[7].x, _698);
    float _708 = _700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _710 = _662 * _622;
    float _712 = -_692;
    float _714 = fma(_712, _658, 1.0);
    float _716 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _706);
    float _718 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _720 = -_708;
    float _722 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _720);
    float _724 = _690 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _726 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _716);
    float _728 = log2(_714);
    float _730 = -_710;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _722);
    float _734 = _690 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _736 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[4].x, _724);
    float _738 = fma(_732, -0.5, 0.5);
    float _740 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[5].x, _734);
    float _742 = fma(_732, 0.5, 0.5);
    float _744 = exp2(_718);
    float _746 = _704 + 1.0;
    float _748 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _736);
    float _750 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _740);
    float _752 = fma(_742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _754 = 1.0 / _726;
    float _756 = fma(_742, _752, -0.212114393711090087890625);
    float _758 = fma(_742, _756, 1.570728778839111328125);
    float _760 = sqrt(_738);
    float _762 = -_704;
    float _764 = fma(_744, _746, _762);
    float _766 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _748);
    float _768 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _750);
    float _770 = _728 * 0.693147182464599609375;
    float _772 = fma(_764, 0.5, 0.5);
    float _774 = _766 * _754;
    float _776 = _768 * _754;
    float _778 = _770 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _780 = fma(_774, 0.5, 0.5);
    float _782 = fma(_776, -0.5, 0.5);
    float _784 = _760 * 0.636619746685028076171875;
    float3 _2494 = float3(_780, _782, _778);
    float _786 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2494, float3(0.0), isnan(_2494)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2494, float3(0.0), isnan(_2494)), level(0.0)).x;
    float _788 = -_758;
    float _790 = fma(_784, _788, 1.0);
    float3 _2510 = float3(_780, _782, _778);
    float4 _793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2510, float3(0.0), isnan(_2510)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2510, float3(0.0), isnan(_2510)), level(0.0)).xyzw;
    float _795 = _793.x;
    float _797 = _793.y;
    float _799 = _793.z;
    float _801 = _793.w;
    float2 _2527 = float2(_790, _772);
    float3 _805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2527, float2(0.0), isnan(_2527)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2527, float2(0.0), isnan(_2527)), level(0.0)).xyz;
    float _807 = _805.x;
    float _809 = _805.y;
    float _811 = _805.z;
    float _813 = in.m_55.w;
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _817 = in.m_53.x;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _821 = _819 != 0;
    float _823 = _690 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _825 = in.m_55.x;
    float _827 = in.m_55.y;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _833 = in.m_55.z;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _837 = _835 != 0;
    float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _843 = _841 != 0;
    out.m_57.y = _360;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _847 = _845 != 0;
    float _849 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[6].x, _823);
    out.m_59.x = _480;
    out.m_59.y = _476;
    out.m_59.z = _484;
    bool _851 = _813 > 0.5;
    float _853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _855 = as_type<int>(_813);
    float _857 = _780;
    bool _859 = _847;
    if (_821)
    {
        float _861 = -_817;
        float _863 = _861 + 1.0;
        _855 = as_type<int>(_863);
    }
    int _865 = _855;
    float _867 = 0.0;
    if (!_821)
    {
        _867 = _817;
    }
    float _869 = _867;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _873 = _825 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _875 = false;
    float _877 = _869;
    int _879 = as_type<int>(_871);
    float _881 = _825;
    if (_821)
    {
        bool _883 = _825 > 0.5;
        _875 = _883;
    }
    bool _885 = _875;
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_837)
    {
        _857 = _825;
    }
    float _889 = _857;
    float _891 = _827 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _893 = _827 > 0.5;
    float _895 = -_831;
    float _897 = fma(_873, 2.0, _895);
    float _899 = _891;
    float _901 = _889;
    if (_821)
    {
        float _903 = _885 ? as_type<float>(_865) : _817;
        _877 = _903;
    }
    float _905 = _877;
    float _907 = fma(_891, -2.0, _829);
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _911 = _909 != 0;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _915 = _893 ? as_type<int>(_384) : as_type<int>(_360);
    float _917 = -_128;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[76].x, _897);
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _923 = _921 != 0;
    float _925 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[78].z, _913);
    float _927 = _911 ? as_type<float>(_915) : _360;
    float _929 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _931 = _851 ? as_type<int>(_384) : as_type<int>(_360);
    bool _933 = _176 != 0.0;
    bool _935 = isnan(_176);
    bool _937 = _933 || _935;
    bool _939 = isnan(0.0);
    bool _941 = _937 || _939;
    float _943 = fma(_929, _927, -0.5);
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _947 = _945 != 0;
    float _949 = in.m_61.x;
    float _951 = in.m_61.y;
    float _953 = in.m_61.z;
    bool _955 = _174 == 0.0;
    bool _957 = !_941;
    bool _959 = _955 && _957;
    float _961 = _839 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _963 = _178 == 0.0;
    bool _965 = _963 && _959;
    float _967 = _847 ? as_type<float>(_931) : _360;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _971 = _907;
    float _973 = _833;
    if (_923)
    {
        bool _975 = _833 > 0.5;
        _859 = _975;
    }
    bool _977 = _859;
    if (!_837)
    {
        _899 = _833;
    }
    float _979 = _899;
    float _981 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[78].w, _969);
    float _983 = fma(_967, _961, -0.5);
    float _985 = 0.0;
    float _987 = _979;
    if (!_837)
    {
        _985 = _827;
    }
    float _989 = _985;
    float _991 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[88].w, _871);
    float _993 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _981);
    float _995 = _993;
    float _997 = _989;
    if (_843)
    {
        float _999 = -_817;
        float _1001 = _999 + 1.0;
        _879 = as_type<int>(_1001);
    }
    int _1003 = _879;
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1007 = _953;
    float _1009 = _949;
    float _1011 = _951;
    if (!_965)
    {
        float _1013 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _953);
        _1007 = _1013;
    }
    float _1015 = _1007;
    if (_923)
    {
        float _1017 = -_817;
        float _1019 = _1017 + 1.0;
        _206 = as_type<int>(_1019);
    }
    int _1021 = _206;
    if (!_965)
    {
        float _1023 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _949);
        _1009 = _1023;
    }
    float _1025 = _1009;
    if (!_965)
    {
        float _1027 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _951);
        _1011 = _1027;
    }
    float _1029 = _1011;
    float _1031 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _907);
    if (!_923)
    {
        _208 = _817;
    }
    float _1033 = _208;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1037 = _1033;
    if (_923)
    {
        float _1039 = _977 ? as_type<float>(_1021) : _817;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = -_1031;
    float _1045 = fma(_993, _943, _1043);
    float _1047 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_837)
    {
        _995 = _979;
    }
    float _1049 = _995;
    float _1051 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1035);
    float _1053 = _1049;
    if (!_837)
    {
        _971 = _989;
    }
    float _1055 = _971;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1059 = _1055;
    if (_837)
    {
        _987 = _833;
    }
    float _1061 = _987;
    float _1063 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1047);
    bool _1065 = _833 > 0.5;
    if (_837)
    {
        _997 = _825;
    }
    float _1067 = _997;
    if (!_843)
    {
        _973 = _817;
    }
    float _1069 = _973;
    float _1071 = _1069;
    if (_843)
    {
        float _1073 = _893 ? as_type<float>(_1003) : _817;
        _1071 = _1073;
    }
    float _1075 = _1071;
    float _1077 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1057);
    float _1081 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_837)
    {
        _1059 = _825;
    }
    float _1083 = _1059;
    float _1085 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1077);
    float _1087 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1081);
    float _1089 = _1083;
    if (_947)
    {
        float _1091 = _1065 ? _384 : _360;
        _424 = _1091;
    }
    float _1093 = _424;
    float _1095 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_837)
    {
        _901 = _1061;
    }
    float _1097 = _901;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1101 = _853 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1103 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1105 = _1099;
    float _1107 = _1101;
    if (!_837)
    {
        _1089 = _1049;
    }
    float _1109 = _1089;
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1099);
    float _1113 = _1109;
    if (_837)
    {
        _1053 = _827;
    }
    float _1115 = _1053;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_837)
    {
        _1105 = _827;
    }
    float _1119 = _1105;
    float _1121 = fma(_1101, _1041, -0.5);
    float _1123 = _1119;
    if (!_837)
    {
        _1123 = _825;
    }
    float _1125 = _1123;
    float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_837)
    {
        _881 = _1061;
    }
    float _1129 = _881;
    float _1131 = fma(_1095, _905, -0.5);
    if (_837)
    {
        _1107 = _1061;
    }
    float _1133 = _1107;
    float _1135 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1111);
    float _1137 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1117);
    float _1139 = _1133;
    if (!_837)
    {
        _1139 = _827;
    }
    float _1141 = _1139;
    float _1143 = _887 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1147 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1085);
    float _1149 = fma(_1143, _1093, -0.5);
    float _1151 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1145);
    if (_837)
    {
        _1113 = _827;
    }
    float _1153 = _1113;
    float _1155 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1063);
    float _1157 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _925);
    float _1159 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1151);
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1163 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1087);
    float _1165 = fma(_1157, _1131, _919);
    float _1167 = _1159 * (-0.15915493667125701904296875);
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1171 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1175 = -_1161;
    float _1177 = fma(_1103, 2.0, _1175);
    float _1179 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1181 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1183 = _1135 * (-0.15915493667125701904296875);
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1189 = fma(_1181, -2.0, _1173);
    float _1191 = fma(_1179, _1075, -0.5);
    float _1193 = _1183 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1051);
    float _1199 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1201 = fma(_1169, -2.0, _1185);
    float _1203 = -_1187;
    float _1205 = fma(_1171, 2.0, _1203);
    float _1207 = _1165 + 0.5;
    float _1209 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _991);
    float _1211 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1079);
    float _1213 = _1183 * 6.283185482025146484375;
    float _1215 = cos(_1213);
    float _1217 = -_128;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1177);
    float _1221 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1201);
    float _1223 = -_128;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1205);
    float _1227 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1189);
    out.m_63.x = _1155;
    out.m_63.y = _1147;
    out.m_63.z = _1163;
    float _1229 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _849);
    float _1231 = _726 * 0.5;
    float _1233 = exp2(_1199);
    float _1235 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1137);
    float _1237 = _1195 * _983;
    float _1239 = in.m_65.w;
    float _1241 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1229);
    float _1243 = _1045 + 0.5;
    float _1245 = _1167 * 6.283185482025146484375;
    float _1247 = sin(_1245);
    float _1249 = _1215 * _983;
    float _1251 = -_1237;
    float _1253 = fma(_1215, _1121, _1251);
    float _1255 = _1241 + _726;
    out.gl_Position.x = _766;
    out.gl_Position.y = _768;
    out.gl_Position.z = _1241;
    out.gl_Position.w = _726;
    float _1257 = fma(_1195, _1121, _1249);
    float _1259 = fma(_1211, _1253, _1219);
    float _1261 = _1167 * 6.283185482025146484375;
    float _1263 = cos(_1261);
    float _1265 = -_1233;
    float _1267 = _1265 + 1.0;
    float _1269 = -_1221;
    float _1271 = fma(_1235, _1257, _1269);
    float _1273 = fma(_768, -0.5, _1231);
    float _1275 = _1255 * 0.5;
    float _1277 = _1267 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1279 = _1247 * _1149;
    out.m_67.w = _1239;
    float _1281 = _1263 * _1149;
    float _1283 = -_1279;
    float _1285 = fma(_1263, _1191, _1283);
    float _1287 = fma(_1247, _1191, _1281);
    float _1289 = fma(_1197, _1285, _1225);
    float _1291 = _1259 + 0.5;
    float _1293 = -_1227;
    float _1295 = fma(_1209, _1287, _1293);
    float _1297 = _1271 + 0.5;
    float _1299 = _766 + _726;
    float _1301 = _1289 + 0.5;
    float _1303 = _1295 + 0.5;
    float _1305 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1307 = _1299 * 0.5;
    out.m_69.x = _1207;
    out.m_69.y = _1243;
    out.m_69.z = _1291;
    out.m_69.w = _1297;
    out.m_71.x = _1301;
    out.m_71.y = _1303;
    out.m_73.x = _1307;
    out.m_73.y = _1273;
    out.m_73.z = _1275;
    out.m_73.w = _726;
    out.m_45.x = _1305;
    float _1309 = _1277 * _786;
    float _1311 = -_1277;
    float _1313 = _1311 + 1.0;
    float _1315 = _801 * _1309;
    float _1317 = _801 * _1313;
    float _1319 = _811 * _1309;
    float _1321 = fma(_807, _1315, _795);
    float _1323 = fma(_809, _1315, _797);
    float _1325 = fma(_801, _1319, _799);
    out.m_75.x = _1321;
    out.m_75.y = _1323;
    out.m_75.z = _1325;
    out.m_75.w = _1317;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1382 = as_type<float>(_110);
        out.gl_Position.z = _1382;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1451 = as_type<float>(_146);
        out.gl_Position.z = _1451;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_47.x;
    float _154 = in.m_47.y;
    float _156 = in.m_47.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = in.m_51.x;
    float _176 = in.m_51.y;
    float _178 = in.m_51.z;
    float _180 = in.m_49.x;
    float _182 = in.m_49.y;
    float _184 = in.m_49.z;
    float _186 = 0.0;
    float _188 = _150;
    if (!_166)
    {
        float _190 = _150 * _150;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_166)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_166;
    float _204 = _200;
    int _206 = as_type<int>(_178);
    float _208 = _176;
    if (!_202)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _150 * _212;
        float _222 = exp2(_220);
        float _224 = _218 * 0.693147182464599609375;
        float _226 = 1.0 / _224;
        float _228 = 1.0 / _216;
        float _230 = _222 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _226, _150);
        float _236 = _234 * _228;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _238;
    }
    float _240 = _204;
    bool _242 = !_166;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _150 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _188 = _262;
    }
    float _264 = _188;
    float _266 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _176);
    float _272 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _276 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _280 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _174);
    float _284 = fma(_264, _154, _276);
    float _286 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _288 = _278 * _270;
    float _290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _178);
    float _292 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _294 = fma(_264, _152, _286);
    float _296 = fma(_284, _148, _170);
    float _298 = _280 * _290;
    float _300 = fma(_264, _156, _292);
    float _302 = fma(_294, _148, _168);
    float _304 = _296 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _274 * _282;
    float _308 = fma(_300, _148, _172);
    float _310 = _288 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _314 = _296 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _288 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _318 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _320 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _324 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].x, _316);
    float _326 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _296 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _332 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _322);
    float _334 = _288 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _336 = _328 + _326;
    float _338 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].x, _330);
    float _340 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].z, _324);
    float _342 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].x, _334);
    float _346 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _338);
    float _348 = _336 * 0.119999997317790985107421875;
    float _350 = _342 + _340;
    float _352 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _344);
    float _354 = _346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _356 = _348 * 0.15915493667125701904296875;
    float _358 = _350 * 0.14000000059604644775390625;
    float _360 = in.m_53.y;
    float _362 = _354 + _352;
    float _364 = _356 * 6.283185482025146484375;
    float _366 = sin(_364);
    float _368 = _358 * 0.15915493667125701904296875;
    float _370 = _362 * 0.1599999964237213134765625;
    float _372 = _370 * 0.15915493667125701904296875;
    float _374 = _368 * 6.283185482025146484375;
    float _376 = sin(_374);
    float _378 = _372 * 6.283185482025146484375;
    float _380 = sin(_378);
    float _382 = -_360;
    float _384 = _382 + 1.0;
    float _386 = _366 + _376;
    float _388 = _386 + _380;
    float _390 = _384 * _388;
    float _392 = _390 * 2.0;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].y, _362);
    float _396 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[8].y, _336);
    float _398 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[9].y, _350);
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _402 = _394 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _406 = _396 + _404;
    float _408 = _402 * _402;
    float _410 = fma(_406, _406, _408);
    float _412 = sqrt(_410);
    bool _414 = _412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _416 = _334;
    float _418 = _396;
    float _420 = _394;
    float _422 = _298;
    float _424 = _360;
    if (!_414)
    {
        _416 = _398;
    }
    float _426 = _416;
    bool _428 = !_414;
    float _430 = _426;
    if (!_428)
    {
        float _432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _436 = _412 + _434;
        float _438 = rsqrt(_410);
        float _440 = _436 * _432;
        float _442 = _398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _444 = _440 * 0.15915493667125701904296875;
        float _446 = _444 * 6.283185482025146484375;
        float _448 = sin(_446);
        float _450 = _444 * 6.283185482025146484375;
        float _452 = cos(_450);
        float _454 = fma(_448, _442, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _456 = _438 * _454;
        float _458 = _452 + (-1.0);
        float _460 = fma(_406, _456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _462 = fma(_402, _456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _464 = _458 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = fma(_398, _452, _464);
        _430 = _466;
        _418 = _460;
        _420 = _462;
    }
    float _468 = _430;
    float _470 = _418;
    float _472 = _420;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _476 = _468 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _480 = _470 + _478;
    float _482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _484 = _472 + _482;
    float _486 = _476 * _476;
    float _488 = fma(_480, _480, _486);
    float _490 = fma(_484, _484, _488);
    float _492 = rsqrt(_490);
    float _494 = _492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _496 = _480 * _494;
    float _498 = _484 * _494;
    float _500 = _496 * _496;
    float _502 = _498 * _498;
    float _504 = _500 + _502;
    float _506 = sqrt(_504);
    bool _508 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _512 = _506 + _510;
    float _514 = _398;
    float _516 = _504;
    float _518 = _512;
    float _520 = _494;
    if (_508)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _522;
    }
    float _524 = _514;
    if (_508)
    {
        float _526 = rsqrt(_504);
        _516 = _526;
    }
    float _528 = _516;
    float _530 = _528;
    if (_508)
    {
        float _532 = _512 * _524;
        _518 = _532;
    }
    float _534 = _518;
    if (_508)
    {
        float _536 = _534 * 0.15915493667125701904296875;
        _422 = _536;
    }
    float _538 = _422;
    float _540 = _406;
    if (_508)
    {
        float _542 = _538 * 6.283185482025146484375;
        float _544 = sin(_542);
        _540 = _544;
    }
    float _546 = _540;
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _550 = precise::max(0.0, _548);
    float _552 = _402;
    float _554 = _550;
    float _556 = _548;
    if (_508)
    {
        float _558 = _538 * 6.283185482025146484375;
        float _560 = cos(_558);
        _552 = _560;
    }
    float _562 = _552;
    float _564 = -_494;
    float _566 = -_550;
    float _568 = fma(_476, _564, _566);
    if (_508)
    {
        float _570 = _568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _554 = _570;
    }
    float _572 = _554;
    float _574 = sqrt(_490);
    float _576 = _572;
    float _578 = _546;
    if (_508)
    {
        float _580 = fma(_546, _572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = _582;
    if (!_508)
    {
        _578 = _496;
    }
    float _586 = _578;
    float _588 = _586;
    float _590 = _562;
    if (_508)
    {
        float _592 = _562 + (-1.0);
        _556 = _592;
    }
    float _594 = _556;
    float _596 = 0.0;
    float _598 = _594;
    if (_508)
    {
        float _600 = _528 * _582;
        _596 = _600;
    }
    float _602 = _596;
    if (!_508)
    {
        _584 = _568;
    }
    float _604 = _584;
    float _606 = _604;
    if (_508)
    {
        float _608 = _594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _520 = _608;
    }
    float _610 = _520;
    if (_508)
    {
        float _612 = _496 * _602;
        _588 = _612;
    }
    float _614 = _588;
    if (!_508)
    {
        _598 = _498;
    }
    float _616 = _598;
    float _618 = _616;
    if (_508)
    {
        float _620 = _498 * _602;
        _618 = _620;
    }
    float _622 = _618;
    if (!_508)
    {
        _530 = _500;
    }
    float _624 = _530;
    float _626 = _624;
    if (_508)
    {
        float _628 = fma(_568, _562, _610);
        _606 = _628;
    }
    float _630 = _606;
    if (_508)
    {
        float _632 = _614 * _614;
        _626 = _632;
    }
    float _634 = _626;
    if (!_508)
    {
        _590 = _502;
    }
    float _636 = _590;
    float _638 = _636;
    if (_508)
    {
        float _640 = _622 * _622;
        _638 = _640;
    }
    float _642 = _638;
    float _644 = fma(_630, _630, _634);
    float _646 = _644 + _642;
    float _648 = _468 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _650 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _652 = fma(_574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _650);
    float _654 = precise::clamp(_652, 0.0, 1.0);
    float _656 = _468 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _660 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[2].x, _648);
    float _662 = rsqrt(_646);
    float _664 = -_654;
    float _666 = _664 + 1.0;
    float _668 = _468 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _670 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[2].z, _660);
    float _672 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[1].x, _656);
    float _674 = _468 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _676 = _670 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _678 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[0].x, _668);
    float _680 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[1].z, _672);
    float _682 = abs(_666);
    float _684 = log2(_682);
    float _686 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[3].x, _674);
    float _688 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[0].z, _678);
    float _690 = _680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _692 = _676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _694 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[3].z, _686);
    float _696 = _688 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _698 = _690 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _700 = _662 * _614;
    float _702 = _694 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _704 = _662 * _630;
    float _706 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[7].x, _698);
    float _708 = _700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _710 = _662 * _622;
    float _712 = -_692;
    float _714 = fma(_712, _658, 1.0);
    float _716 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _706);
    float _718 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _720 = -_708;
    float _722 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _720);
    float _724 = _690 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _726 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _716);
    float _728 = log2(_714);
    float _730 = -_710;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _722);
    float _734 = _690 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _736 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[4].x, _724);
    float _738 = fma(_732, -0.5, 0.5);
    float _740 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[5].x, _734);
    float _742 = fma(_732, 0.5, 0.5);
    float _744 = exp2(_718);
    float _746 = _704 + 1.0;
    float _748 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _736);
    float _750 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _740);
    float _752 = fma(_742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _754 = 1.0 / _726;
    float _756 = fma(_742, _752, -0.212114393711090087890625);
    float _758 = fma(_742, _756, 1.570728778839111328125);
    float _760 = sqrt(_738);
    float _762 = -_704;
    float _764 = fma(_744, _746, _762);
    float _766 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _748);
    float _768 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _750);
    float _770 = _728 * 0.693147182464599609375;
    float _772 = fma(_764, 0.5, 0.5);
    float _774 = _766 * _754;
    float _776 = _768 * _754;
    float _778 = _770 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _780 = fma(_774, 0.5, 0.5);
    float _782 = fma(_776, -0.5, 0.5);
    float _784 = _760 * 0.636619746685028076171875;
    float3 _2494 = float3(_780, _782, _778);
    float _786 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2494, float3(0.0), isnan(_2494)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2494, float3(0.0), isnan(_2494)), level(0.0)).x;
    float _788 = -_758;
    float _790 = fma(_784, _788, 1.0);
    float3 _2510 = float3(_780, _782, _778);
    float4 _793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2510, float3(0.0), isnan(_2510)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2510, float3(0.0), isnan(_2510)), level(0.0)).xyzw;
    float _795 = _793.x;
    float _797 = _793.y;
    float _799 = _793.z;
    float _801 = _793.w;
    float2 _2527 = float2(_790, _772);
    float3 _805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2527, float2(0.0), isnan(_2527)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2527, float2(0.0), isnan(_2527)), level(0.0)).xyz;
    float _807 = _805.x;
    float _809 = _805.y;
    float _811 = _805.z;
    float _813 = in.m_55.w;
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _817 = in.m_53.x;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _821 = _819 != 0;
    float _823 = _690 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _825 = in.m_55.x;
    float _827 = in.m_55.y;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _833 = in.m_55.z;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _837 = _835 != 0;
    float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _843 = _841 != 0;
    out.m_57.y = _360;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _847 = _845 != 0;
    float _849 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[6].x, _823);
    out.m_59.x = _480;
    out.m_59.y = _476;
    out.m_59.z = _484;
    bool _851 = _813 > 0.5;
    float _853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _855 = as_type<int>(_813);
    float _857 = _780;
    bool _859 = _847;
    if (_821)
    {
        float _861 = -_817;
        float _863 = _861 + 1.0;
        _855 = as_type<int>(_863);
    }
    int _865 = _855;
    float _867 = 0.0;
    if (!_821)
    {
        _867 = _817;
    }
    float _869 = _867;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _873 = _825 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _875 = false;
    float _877 = _869;
    int _879 = as_type<int>(_871);
    float _881 = _825;
    if (_821)
    {
        bool _883 = _825 > 0.5;
        _875 = _883;
    }
    bool _885 = _875;
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_837)
    {
        _857 = _825;
    }
    float _889 = _857;
    float _891 = _827 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _893 = _827 > 0.5;
    float _895 = -_831;
    float _897 = fma(_873, 2.0, _895);
    float _899 = _891;
    float _901 = _889;
    if (_821)
    {
        float _903 = _885 ? as_type<float>(_865) : _817;
        _877 = _903;
    }
    float _905 = _877;
    float _907 = fma(_891, -2.0, _829);
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _911 = _909 != 0;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _915 = _893 ? as_type<int>(_384) : as_type<int>(_360);
    float _917 = -_128;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[76].x, _897);
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _923 = _921 != 0;
    float _925 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[78].z, _913);
    float _927 = _911 ? as_type<float>(_915) : _360;
    float _929 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _931 = _851 ? as_type<int>(_384) : as_type<int>(_360);
    bool _933 = _176 != 0.0;
    bool _935 = isnan(_176);
    bool _937 = _933 || _935;
    bool _939 = isnan(0.0);
    bool _941 = _937 || _939;
    float _943 = fma(_929, _927, -0.5);
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _947 = _945 != 0;
    float _949 = in.m_61.x;
    float _951 = in.m_61.y;
    float _953 = in.m_61.z;
    bool _955 = _174 == 0.0;
    bool _957 = !_941;
    bool _959 = _955 && _957;
    float _961 = _839 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _963 = _178 == 0.0;
    bool _965 = _963 && _959;
    float _967 = _847 ? as_type<float>(_931) : _360;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _971 = _907;
    float _973 = _833;
    if (_923)
    {
        bool _975 = _833 > 0.5;
        _859 = _975;
    }
    bool _977 = _859;
    if (!_837)
    {
        _899 = _833;
    }
    float _979 = _899;
    float _981 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[78].w, _969);
    float _983 = fma(_967, _961, -0.5);
    float _985 = 0.0;
    float _987 = _979;
    if (!_837)
    {
        _985 = _827;
    }
    float _989 = _985;
    float _991 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[88].w, _871);
    float _993 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _981);
    float _995 = _993;
    float _997 = _989;
    if (_843)
    {
        float _999 = -_817;
        float _1001 = _999 + 1.0;
        _879 = as_type<int>(_1001);
    }
    int _1003 = _879;
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1007 = _953;
    float _1009 = _949;
    float _1011 = _951;
    if (!_965)
    {
        float _1013 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _953);
        _1007 = _1013;
    }
    float _1015 = _1007;
    if (_923)
    {
        float _1017 = -_817;
        float _1019 = _1017 + 1.0;
        _206 = as_type<int>(_1019);
    }
    int _1021 = _206;
    if (!_965)
    {
        float _1023 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _949);
        _1009 = _1023;
    }
    float _1025 = _1009;
    if (!_965)
    {
        float _1027 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _951);
        _1011 = _1027;
    }
    float _1029 = _1011;
    float _1031 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _907);
    if (!_923)
    {
        _208 = _817;
    }
    float _1033 = _208;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1037 = _1033;
    if (_923)
    {
        float _1039 = _977 ? as_type<float>(_1021) : _817;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = -_1031;
    float _1045 = fma(_993, _943, _1043);
    float _1047 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_837)
    {
        _995 = _979;
    }
    float _1049 = _995;
    float _1051 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1035);
    float _1053 = _1049;
    if (!_837)
    {
        _971 = _989;
    }
    float _1055 = _971;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1059 = _1055;
    if (_837)
    {
        _987 = _833;
    }
    float _1061 = _987;
    float _1063 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1047);
    bool _1065 = _833 > 0.5;
    if (_837)
    {
        _997 = _825;
    }
    float _1067 = _997;
    if (!_843)
    {
        _973 = _817;
    }
    float _1069 = _973;
    float _1071 = _1069;
    if (_843)
    {
        float _1073 = _893 ? as_type<float>(_1003) : _817;
        _1071 = _1073;
    }
    float _1075 = _1071;
    float _1077 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1057);
    float _1081 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_837)
    {
        _1059 = _825;
    }
    float _1083 = _1059;
    float _1085 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1077);
    float _1087 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1081);
    float _1089 = _1083;
    if (_947)
    {
        float _1091 = _1065 ? _384 : _360;
        _424 = _1091;
    }
    float _1093 = _424;
    float _1095 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_837)
    {
        _901 = _1061;
    }
    float _1097 = _901;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1101 = _853 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1103 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1105 = _1099;
    float _1107 = _1101;
    if (!_837)
    {
        _1089 = _1049;
    }
    float _1109 = _1089;
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1099);
    float _1113 = _1109;
    if (_837)
    {
        _1053 = _827;
    }
    float _1115 = _1053;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_837)
    {
        _1105 = _827;
    }
    float _1119 = _1105;
    float _1121 = fma(_1101, _1041, -0.5);
    float _1123 = _1119;
    if (!_837)
    {
        _1123 = _825;
    }
    float _1125 = _1123;
    float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_837)
    {
        _881 = _1061;
    }
    float _1129 = _881;
    float _1131 = fma(_1095, _905, -0.5);
    if (_837)
    {
        _1107 = _1061;
    }
    float _1133 = _1107;
    float _1135 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1111);
    float _1137 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1117);
    float _1139 = _1133;
    if (!_837)
    {
        _1139 = _827;
    }
    float _1141 = _1139;
    float _1143 = _887 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1147 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1085);
    float _1149 = fma(_1143, _1093, -0.5);
    float _1151 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1145);
    if (_837)
    {
        _1113 = _827;
    }
    float _1153 = _1113;
    float _1155 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1063);
    float _1157 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _925);
    float _1159 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1151);
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1163 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1087);
    float _1165 = fma(_1157, _1131, _919);
    float _1167 = _1159 * (-0.15915493667125701904296875);
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1171 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1175 = -_1161;
    float _1177 = fma(_1103, 2.0, _1175);
    float _1179 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1181 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1183 = _1135 * (-0.15915493667125701904296875);
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1189 = fma(_1181, -2.0, _1173);
    float _1191 = fma(_1179, _1075, -0.5);
    float _1193 = _1183 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1051);
    float _1199 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1201 = fma(_1169, -2.0, _1185);
    float _1203 = -_1187;
    float _1205 = fma(_1171, 2.0, _1203);
    float _1207 = _1165 + 0.5;
    float _1209 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _991);
    float _1211 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1079);
    float _1213 = _1183 * 6.283185482025146484375;
    float _1215 = cos(_1213);
    float _1217 = -_128;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1177);
    float _1221 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1201);
    float _1223 = -_128;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1205);
    float _1227 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1189);
    out.m_63.x = _1155;
    out.m_63.y = _1147;
    out.m_63.z = _1163;
    float _1229 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _849);
    float _1231 = _726 * 0.5;
    float _1233 = exp2(_1199);
    float _1235 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1137);
    float _1237 = _1195 * _983;
    float _1239 = in.m_65.w;
    float _1241 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1229);
    float _1243 = _1045 + 0.5;
    float _1245 = _1167 * 6.283185482025146484375;
    float _1247 = sin(_1245);
    float _1249 = _1215 * _983;
    float _1251 = -_1237;
    float _1253 = fma(_1215, _1121, _1251);
    float _1255 = _1241 + _726;
    out.gl_Position.x = _766;
    out.gl_Position.y = _768;
    out.gl_Position.z = _1241;
    out.gl_Position.w = _726;
    float _1257 = fma(_1195, _1121, _1249);
    float _1259 = fma(_1211, _1253, _1219);
    float _1261 = _1167 * 6.283185482025146484375;
    float _1263 = cos(_1261);
    float _1265 = -_1233;
    float _1267 = _1265 + 1.0;
    float _1269 = -_1221;
    float _1271 = fma(_1235, _1257, _1269);
    float _1273 = fma(_768, -0.5, _1231);
    float _1275 = _1255 * 0.5;
    float _1277 = _1267 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1279 = _1247 * _1149;
    out.m_67.w = _1239;
    float _1281 = _1263 * _1149;
    float _1283 = -_1279;
    float _1285 = fma(_1263, _1191, _1283);
    float _1287 = fma(_1247, _1191, _1281);
    float _1289 = fma(_1197, _1285, _1225);
    float _1291 = _1259 + 0.5;
    float _1293 = -_1227;
    float _1295 = fma(_1209, _1287, _1293);
    float _1297 = _1271 + 0.5;
    float _1299 = _766 + _726;
    float _1301 = _1289 + 0.5;
    float _1303 = _1295 + 0.5;
    float _1305 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1307 = _1299 * 0.5;
    out.m_69.x = _1207;
    out.m_69.y = _1243;
    out.m_69.z = _1291;
    out.m_69.w = _1297;
    out.m_71.x = _1301;
    out.m_71.y = _1303;
    out.m_73.x = _1307;
    out.m_73.y = _1273;
    out.m_73.z = _1275;
    out.m_73.w = _726;
    out.m_45.x = _1305;
    float _1309 = _1277 * _786;
    float _1311 = -_1277;
    float _1313 = _1311 + 1.0;
    float _1315 = _801 * _1309;
    float _1317 = _801 * _1313;
    float _1319 = _811 * _1309;
    float _1321 = fma(_807, _1315, _795);
    float _1323 = fma(_809, _1315, _797);
    float _1325 = fma(_801, _1319, _799);
    out.m_75.x = _1321;
    out.m_75.y = _1323;
    out.m_75.z = _1325;
    out.m_75.w = _1317;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

