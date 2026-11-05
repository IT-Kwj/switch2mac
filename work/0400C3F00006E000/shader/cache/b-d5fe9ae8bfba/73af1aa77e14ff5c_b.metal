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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_81 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_97 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_103 [[user(locn12)]];
    float4 m_99 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_75 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
    float4 m_77 [[attribute(11)]];
    float4 m_63 [[attribute(12)]];
    float4 m_83 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2772 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_48.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = as_type<float>(_124);
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_51.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_140);
        out.gl_Position.z = _3058;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_53.w;
    float _146 = float(_124);
    float _148 = -_144;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_144);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    bool _162 = _150 >= _146;
    bool _164 = !_160;
    bool _166 = _162 || _164;
    float _168 = _150;
    if (_166)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _132;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _142 = as_type<int>(_172);
    }
    int _174 = _142;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3122 = as_type<float>(_174);
        out.gl_Position.z = _3122;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = 1.0 / _146;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    float _196 = _150 * _182;
    float _198 = _176 * _176;
    float _200 = _178 * _178;
    float _202 = _180 * _180;
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = fma(_194, _194, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = _218;
    float _228 = _188;
    if (_222)
    {
        float _230 = rsqrt(_210);
        _226 = _230;
    }
    float _232 = _226;
    float _234 = 0.0;
    if (!_222)
    {
        _234 = 0.0;
    }
    float _236 = _234;
    bool _238 = _220 > 0.0;
    float _240 = 0.0;
    float _242 = _236;
    if (!_222)
    {
        _240 = 0.0;
    }
    float _244 = _240;
    float _246 = 0.0;
    float _248 = _244;
    if (!_222)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = _216;
    float _254 = _250;
    if (_224)
    {
        float _256 = rsqrt(_212);
        _252 = _256;
    }
    float _258 = _252;
    float _260 = 0.0;
    float _262 = 0.0;
    if (!_224)
    {
        _260 = 0.0;
        _262 = 0.0;
    }
    float _264 = _260;
    float _266 = _262;
    float _268 = 0.0;
    float _270 = _264;
    float _272 = _266;
    if (!_224)
    {
        _268 = 0.0;
    }
    float _274 = _268;
    float _276 = _220;
    float _278 = _274;
    if (_238)
    {
        float _280 = rsqrt(_214);
        _276 = _280;
    }
    float _282 = _276;
    if (_222)
    {
        float _284 = _232 * _176;
        _242 = _284;
    }
    float _286 = _242;
    if (_222)
    {
        float _288 = _232 * _184;
        _248 = _288;
    }
    float _290 = _248;
    if (_222)
    {
        float _292 = _232 * _190;
        _254 = _292;
    }
    float _294 = _254;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _298 = 0.0;
    if (!_238)
    {
        _298 = 0.0;
    }
    float _300 = _298;
    float _302 = 0.0;
    float _304 = _300;
    if (!_238)
    {
        _302 = 0.0;
    }
    float _306 = _302;
    float _308 = _306;
    if (_224)
    {
        float _310 = _258 * _178;
        _278 = _310;
    }
    float _312 = _278;
    float _314 = 0.0;
    if (!_238)
    {
        _314 = 0.0;
    }
    float _316 = _314;
    float _318 = _316;
    if (_224)
    {
        float _320 = _258 * _186;
        _270 = _320;
    }
    float _322 = _270;
    if (_224)
    {
        float _324 = _258 * _192;
        _272 = _324;
    }
    float _326 = _272;
    if (_238)
    {
        float _328 = _282 * _180;
        _304 = _328;
    }
    float _330 = _304;
    if (_238)
    {
        float _332 = _282 * _188;
        _308 = _332;
    }
    float _334 = _308;
    if (_238)
    {
        float _336 = _282 * _194;
        _318 = _336;
    }
    float _338 = _318;
    bool _340 = !_296;
    float _358;
    if (!_340)
    {
        float _342 = in.m_61.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        _358 = _196;
    }
    _360 = false;
    float _362 = _358;
    float _364 = in.m_61.w;
    float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _368 = -_196;
    float _370 = _368 + 1.0;
    float _372 = in.m_48.x;
    float _374 = in.m_48.y;
    float _376 = in.m_48.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _362 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = _362 + _382;
    float _386 = in.m_61.z;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = in.m_61.y;
    float _398 = 1.0 / _390;
    float _400 = in.m_63.y;
    float _402 = _370 * _366;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = in.m_61.x;
    float _408 = 1.0 / _394;
    bool _410 = _364 > 0.5;
    float _412 = _186 * _374;
    float _414 = _384 * _398;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _416;
    float _420 = _196 * _366;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _192 * _374;
    float _426 = fma(_184, _372, _412);
    float _428 = 1.0 / _418;
    bool _430 = _396 > 0.5;
    float _432 = fma(_190, _372, _424);
    float _434 = fma(_188, _376, _426);
    float _436 = _396 + _386;
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = fma(_194, _376, _432);
    float _444 = _386 * 2.0;
    float _446 = _396 * 2.0;
    float _448 = _436 + (-1.0);
    float _450 = _380 * _408;
    float _452 = floor(_444);
    float _454 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _458 = _456 != 0;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _462 = _460 != 0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _466 = _464 != 0;
    float _468 = _406 + _386;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _472 = _470 != 0;
    int _474 = _410 ? as_type<int>(_440) : as_type<int>(_400);
    float _476 = _468 + (-1.0);
    float _478 = floor(_446);
    float _480 = precise::min(_422, _404);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _484 = _362 + _482;
    float _486 = _462 ? as_type<float>(_474) : _400;
    float _488 = _484 * _428;
    float _490 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _492 = log2(_490);
    bool _494 = _452 >= 0.0;
    bool _496 = isnan(_452);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _506 = _452 > 0.0;
    int _508 = _502 ? 0 : 1;
    bool _510 = _386 > 0.5;
    int _512 = _430 ? as_type<int>(_440) : as_type<int>(_400);
    bool _514 = _478 >= 0.0;
    bool _516 = isnan(_478);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    int _524 = _510 ? as_type<int>(_440) : as_type<int>(_400);
    float _526 = _458 ? as_type<float>(_512) : _400;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    bool _530 = _478 > 0.0;
    float _532 = _478;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[94].z;
    float _536 = _374;
    int _538 = as_type<int>(_406);
    if (_472)
    {
        _228 = _406;
    }
    float _540 = _228;
    float _542 = _540;
    if (_472)
    {
        _532 = _396;
    }
    float _544 = _532;
    float _546 = _544;
    if (_472)
    {
        _534 = _386;
    }
    float _548 = _534;
    int _550 = _522 ? 0 : 1;
    float _552 = _466 ? as_type<float>(_524) : _400;
    float _554 = _548;
    if (!_472)
    {
        float _556 = _406 * 3.1415927410125732421875;
        float _558 = _556 * 0.15915493667125701904296875;
        float _560 = _396 * 3.1415927410125732421875;
        float _562 = _560 * 0.15915493667125701904296875;
        float _564 = _386 * 3.1415927410125732421875;
        float _566 = _558 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _564 * 0.15915493667125701904296875;
        float _572 = _562 * 6.283185482025146484375;
        float _574 = sin(_572);
        float _576 = _570 * 6.283185482025146484375;
        float _578 = sin(_576);
        _554 = _578;
        _542 = _568;
        _546 = _574;
    }
    float _580 = _554;
    float _582 = _542;
    float _584 = _546;
    float _586 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[94].z, _528);
    int _588 = ~_508;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _596 = _592;
    if (!_506)
    {
        int _598 = ~_508;
        int _600 = _598 + 1;
        _596 = _600;
    }
    int _602 = _596;
    float _604 = _492 * _150;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _608 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[94].x, _586);
    float _610 = exp2(_604);
    float _612 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[93].z, _606);
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _616 = _582 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _618 = ~_550;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _626 = 1.0 + _624;
    int _628 = _622;
    if (!_530)
    {
        int _630 = ~_550;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = -_614;
    float _638 = fma(_616, 2.0, _636);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _642 = 1.0 / _626;
    float _644 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].z, _612);
    float _646 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[93].w, _640);
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _650 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _652 = isnan(1.0);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _658 = _654 || _656;
    float _660 = _584 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _662 = _406 * 2.0;
    float _664 = -_610;
    float _666 = _664 + 1.0;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    bool _670 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    float _680 = fma(_660, -2.0, _648);
    float _682 = floor(_662);
    float _684 = fma(_668, _396, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _686 = _678 ? _666 : 0.0;
    float _688 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[91].y, _680);
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _700 = _698 != 0;
    float _702 = _406 + _396;
    float _704 = _684 * _150;
    float _706 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].w, _646);
    float _708 = -_150;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[91].x, _638);
    float _712 = _710;
    if (_658)
    {
        float _714 = _686 * _642;
        _168 = _714;
    }
    float _716 = _168;
    bool _718 = !_692;
    int _720 = _718 ? 0 : 1;
    float _722 = _702 + (-1.0);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _734 = _732 != 0;
    float _736 = in.m_57.w;
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _740 = in.m_59.w;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _744 = !_696;
    int _746 = _744 ? 0 : 1;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    bool _752 = !_700;
    int _754 = _752 ? 0 : 1;
    float _756 = _396 + (-0.5);
    bool _758 = !_734;
    int _760 = _758 ? 0 : 1;
    float _762 = fma(_750, _414, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _764 = fma(_406, 6.283185482025146484375, _704);
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _776 = _774 != 0;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _778;
    bool _782 = _682 >= 0.0;
    bool _784 = isnan(_682);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _792;
    float _796 = fma(_780, _414, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _798 = _790 ? 0 : 1;
    float _800 = fma(_794, _414, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _802 = _682 > 0.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _816 = fma(_806, _450, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _818;
    float _822 = fma(_810, _450, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _824;
    float _828 = fma(_814, _450, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _830;
    bool _834 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _836 = isnan(_362);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = _716 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _848 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _850 = isnan(_362);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = fma(_820, _488, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _862 = fma(_826, _488, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _864 = fma(_832, _488, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _866 = _846 * _594;
    float _868 = -_844;
    float _870 = _868 + 1.0;
    bool _872 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _874 = isnan(_362);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -_858;
    float _886 = _884 + 1.0;
    float _888 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[203].x, _866);
    float _890 = _858 * _870;
    bool _892 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _894 = isnan(_362);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _882 * _886;
    float _906 = -_882;
    float _908 = _906 + 1.0;
    float _910 = floor(_888);
    float _912 = _434 + _736;
    float _914 = _442 + _740;
    float _916 = _902 * _908;
    float _918 = _716 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _920 = -_902;
    float _922 = _920 + 1.0;
    float _924 = _888 + 0.25;
    float _926 = _762 * _916;
    float _928 = _796 * _916;
    float _930 = _918 * _742;
    float _932 = floor(_924);
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[143].x, _926);
    float _936 = _800 * _916;
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[143].y, _928);
    float _940 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[203].z, _930);
    float _942 = fma(_816, _904, _934);
    int _944 = ~_798;
    int _946 = _944 + 1;
    int _948 = _946 + 1;
    float _950 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[143].z, _936);
    int _952 = _948;
    if (!_802)
    {
        int _954 = ~_798;
        int _956 = _954 + 1;
        _952 = _956;
    }
    int _958 = _952;
    float _960 = fma(_822, _904, _938);
    bool _962 = !_768;
    int _964 = _962 ? 0 : 1;
    float _966 = _940 + 0.25;
    float _968 = fma(_860, _890, _942);
    float _970 = -_910;
    float _972 = _888 + _970;
    bool _974 = !_772;
    int _976 = _974 ? 0 : 1;
    float _978 = fma(_828, _904, _950);
    int _980 = abs(_964);
    float _982 = floor(_966);
    int _984 = abs(_976);
    float _986 = in.m_65.x;
    float _988 = in.m_65.y;
    float _990 = in.m_65.z;
    bool _992 = _972 >= 0.5;
    bool _994 = isnan(_972);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.5);
    bool _1000 = _996 || _998;
    float _1002 = -_932;
    float _1004 = _924 + _1002;
    float _1006 = float(_602);
    float _1008 = in.m_67.y;
    float _1010 = floor(_940);
    float _1012 = -_480;
    float _1014 = _1012 + 1.0;
    float _1016 = float(_958);
    float _1018 = fma(_862, _890, _960);
    float _1020 = float(_984);
    float _1022 = fma(_864, _890, _978);
    float _1024 = float(_980);
    float _1026 = -_982;
    float _1028 = _966 + _1026;
    bool _1030 = !_730;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _1020 * _1016;
    int _1036 = abs(_746);
    float _1038 = _1024 * _1006;
    float _1040 = _1034 * (-2.0);
    int _1042 = abs(_1032);
    float _1044 = _888 * 6.283185482025146484375;
    float _1046 = -_1010;
    float _1048 = _940 + _1046;
    bool _1050 = !_1000;
    float _1052 = _1050 ? 0.5 : (-0.5);
    float _1054 = fma(_454, _1040, _454);
    float _1056 = _1044 * 0.15915493667125701904296875;
    float _1058 = fma(_1040, _988, _988);
    bool _1060 = _1048 >= 0.5;
    bool _1062 = isnan(_1048);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(0.5);
    bool _1068 = _1064 || _1066;
    float _1070 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1072 = _1070 * 2.0;
    float _1074 = float(_1036);
    float _1076 = _940 * 6.283185482025146484375;
    float _1078 = _1056 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    bool _1082 = !_1068;
    float _1084 = _1082 ? 0.5 : (-0.5);
    float _1086 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1058);
    bool _1088 = _1004 > 0.5;
    float _1090 = _1074 * _1072;
    float _1092 = float(_1042);
    float _1094 = _1076 * 0.15915493667125701904296875;
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1098 = _1096 * 2.0;
    int _1100 = abs(_720);
    float _1102 = _1038 * (-2.0);
    int _1104 = abs(_754);
    float _1106 = _1092 * _1098;
    float _1108 = _1094 * 6.283185482025146484375;
    float _1110 = sin(_1108);
    bool _1112 = !_726;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = fma(_1054, _716, _1086);
    float _1118 = _1004;
    float _1120 = _1028;
    if (_1088)
    {
        float _1122 = -_1004;
        float _1124 = _1122 + 1.0;
        _1118 = _1124;
    }
    float _1126 = _1118;
    float _1128 = float(_1100);
    float _1130 = in.m_67.x;
    int _1132 = abs(_1114);
    float _1134 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1136 = fma(_1126, 4.0, -1.0);
    bool _1138 = _1028 > 0.5;
    float _1140 = in.m_67.z;
    float _1142 = fma(_1128, _1134, _1090);
    float _1144 = float(_1104);
    float _1146 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1148 = _1116 * 0.15915493667125701904296875;
    float _1150 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1152 = fma(_1144, _1146, _1142);
    float _1154 = _914 * _914;
    float _1156 = float(_1132);
    float _1158 = _764 * 0.15915493667125701904296875;
    float _1160 = fma(_1152, 3.1415927410125732421875, _986);
    float _1162 = fma(_912, _912, _1154);
    int _1164 = abs(_760);
    if (_1138)
    {
        float _1166 = -_1028;
        float _1168 = _1166 + 1.0;
        _1120 = _1168;
    }
    float _1170 = _1120;
    float _1172 = float(_634);
    float _1174 = fma(_1156, _1150, _1106);
    float _1176 = fma(_1170, 4.0, -1.0);
    bool _1178 = !_776;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _406 + (-0.5);
    float _1184 = float(_1164);
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1188 = abs(_1180);
    float _1190 = fma(_1160, _1102, _1160);
    float _1192 = fma(_738, _1102, _738);
    float _1194 = fma(_1184, _1186, _1174);
    float _1196 = float(_1188);
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1190);
    float _1200 = _1158 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    float _1204 = fma(_1194, 3.1415927410125732421875, _990);
    float _1206 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1018);
    float _1208 = _1196 * _1172;
    float _1210 = in.m_69.x;
    float _1212 = in.m_69.y;
    float _1214 = in.m_69.z;
    float _1216 = fma(_1192, _716, _1198);
    float _1218 = _1208 * (-2.0);
    float _1220 = _1148 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = _1216 * 0.15915493667125701904296875;
    float _1226 = fma(_504, _1218, _504);
    float _1228 = fma(_1204, _1218, _1204);
    float _1230 = _386 + (-0.5);
    float _1232 = abs(_1202);
    float _1234 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1236 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1228);
    float _1238 = _1148 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _662 + (-1.0);
    float _1244 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1234);
    float _1246 = fma(_1226, _716, _1236);
    float _1248 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[146].x, _968);
    float _1250 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1022);
    float _1252 = -_1244;
    float _1254 = _1252 + _1008;
    float _1256 = _1246 * 0.15915493667125701904296875;
    float _1258 = _1224 * 6.283185482025146484375;
    float _1260 = cos(_1258);
    float _1262 = _1248 * _1210;
    float _1264 = _1250 * _1214;
    float _1266 = _1206 * _1212;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1254);
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1274 = sqrt(_1162);
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1130);
    float _1280 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1282 = _1272 * _1268;
    float _1284 = _1276 * _1270;
    float _1286 = _1280 * _1278;
    float _1288 = _1224 * 6.283185482025146484375;
    float _1290 = sin(_1288);
    float _1292 = _1260 * _1240;
    float _1294 = _1260 * _1222;
    float _1296 = _1256 * 6.283185482025146484375;
    float _1298 = cos(_1296);
    float _1300 = _1242 * _1274;
    float _1302 = _1300 * 0.75;
    float _1304 = _1256 * 6.283185482025146484375;
    float _1306 = sin(_1304);
    float _1308 = _1290 * _1222;
    float _1310 = _1290 * _1240;
    float _1312 = _1302 * 0.15915493667125701904296875;
    float _1314 = _1260 * _1298;
    float _1316 = _1290 * _1298;
    float _1318 = _1240 * _1298;
    float _1320 = _1222 * _1298;
    float _1322 = _1314 * _1284;
    float _1324 = _1316 * _1284;
    float _1326 = _1312 * 6.283185482025146484375;
    float _1328 = sin(_1326);
    float _1330 = fma(_1306, _1292, _1308);
    float _1332 = -_1294;
    float _1334 = fma(_1306, _1310, _1332);
    float _1336 = -_1310;
    float _1338 = fma(_1306, _1294, _1336);
    float _1340 = -_1284;
    float _1342 = _1306 * _1340;
    float _1344 = fma(_1330, _1286, _1322);
    float _1346 = fma(_1306, _1308, _1292);
    float _1348 = fma(_1334, _1286, _1324);
    float _1350 = fma(_1318, _1286, _1342);
    float _1352 = fma(_1338, _1282, _1344);
    float _1354 = _1312 * 6.283185482025146484375;
    float _1356 = cos(_1354);
    float _1358 = fma(_1346, _1282, _1348);
    float _1360 = fma(_1320, _1282, _1350);
    float _1362 = _1352 * _322;
    float _1364 = _1352 * _326;
    float _1366 = fma(_1360, _290, _1362);
    float _1368 = fma(_1360, _294, _1364);
    float _1370 = fma(_1358, _334, _1366);
    float _1372 = fma(_1358, _338, _1368);
    float _1374 = _1370 * _1328;
    float _1376 = _1370 * _1356;
    float _1378 = -_1374;
    float _1380 = fma(_1372, _1356, _1378);
    float _1382 = fma(_1372, _1328, _1376);
    float _1384 = in.m_71.y;
    float _1386 = _914 + _1380;
    float _1388 = _912 + _1382;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1392 = _1386 + _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1396 = _1388 + _1394;
    float _1398 = _1392 * _1392;
    float _1400 = fma(_1396, _1396, _1398);
    float _1402 = sqrt(_1400);
    bool _1404 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = _1402 + _1406;
    float _1410 = _1380;
    float _1412 = _1408;
    float _1414 = _1382;
    float _1416 = _1358;
    float _1418 = _1388;
    if (_1404)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1410 = _1420;
    }
    float _1422 = _1410;
    float _1424 = _1422;
    if (_1404)
    {
        float _1426 = _1408 * _1422;
        _1412 = _1426;
    }
    float _1428 = _1412;
    if (_1404)
    {
        float _1430 = rsqrt(_1400);
        _1424 = _1430;
    }
    float _1432 = _1424;
    float _1434 = _1432;
    if (_1404)
    {
        float _1436 = _1428 * 0.15915493667125701904296875;
        _1414 = _1436;
    }
    float _1438 = _1414;
    float _1440 = _1352 * _312;
    float _1442 = fma(_1360, _286, _1440);
    float _1444 = _1352;
    if (_1404)
    {
        float _1446 = _1438 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = _374 + _1384;
    float _1454 = fma(_1358, _330, _1442);
    float _1456 = _1452 + _1454;
    float _1458 = _1456;
    if (_1404)
    {
        float _1460 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _536 = _1460;
    }
    float _1462 = _536;
    float _1464 = _1450;
    float _1466 = _1462;
    if (_1404)
    {
        float _1468 = fma(_1450, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1416 = _1468;
    }
    float _1470 = _1416;
    if (!_1404)
    {
        _1464 = _1388;
    }
    float _1472 = _1464;
    float _1474 = _1472;
    if (!_1404)
    {
        _1466 = _1386;
    }
    float _1476 = _1466;
    float _1478 = _1476;
    if (_1404)
    {
        float _1480 = _1432 * _1470;
        _1434 = _1480;
    }
    float _1482 = _1434;
    if (_1404)
    {
        float _1484 = fma(_1396, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1474 = _1484;
    }
    float _1486 = _1474;
    float _1488 = _1486;
    if (_1404)
    {
        float _1490 = fma(_1392, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1478 = _1490;
    }
    float _1492 = _1478;
    float _1494 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1496 = _1486 + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1500 = _1492 + _1498;
    float _1502 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1504 = fma(_1500, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5079 = float2(_1502, _1504);
    float _1506 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5079, float2(0.0), isnan(_5079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5079, float2(0.0), isnan(_5079)), level(0.0)).x;
    float _1508 = _1482;
    float _1510 = _1496;
    float _1512 = _1504;
    float _1514 = _1492;
    if (_1404)
    {
        float _1516 = _1438 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        _1508 = _1518;
    }
    float _1520 = _1508;
    bool _1522 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1524 = isnan(0.5);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1530 = _1526 || _1528;
    float _1532 = in.m_63.x;
    float _1534 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1538 = _1520;
    float _1540 = _1536;
    if (_1404)
    {
        float _1542 = _1520 + (-1.0);
        _1510 = _1542;
    }
    float _1544 = _1510;
    float _1546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1548 = _1544;
    if (_1404)
    {
        float _1550 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1550;
    }
    float _1552 = _1548;
    float _1554 = _1552;
    if (_1404)
    {
        float _1556 = fma(_1456, _1520, _1552);
        _1458 = _1556;
    }
    float _1558 = _1458;
    float _1560 = _1558;
    if (!_1530)
    {
        float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1564 = _912 + _1562;
        _1538 = _1564;
    }
    float _1566 = _1538;
    float _1568 = _1566;
    if (!_1530)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1512 = _1570;
    }
    float _1572 = _1512;
    float _1574 = fma(_1506, 100.0, _1452);
    float _1576 = _1506;
    if (!_1530)
    {
        float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1580 = _1574 + _1578;
        _1554 = _1580;
    }
    float _1582 = _1554;
    float _1584 = _1582;
    if (!_1530)
    {
        float _1586 = _1582 * _1582;
        _1418 = _1586;
    }
    float _1588 = _1418;
    if (!_1530)
    {
        float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1592 = _914 + _1590;
        _1584 = _1592;
    }
    float _1594 = _1584;
    float _1596 = _1594;
    if (!_1530)
    {
        float _1598 = fma(_1566, _1566, _1588);
        _1568 = _1598;
    }
    float _1600 = _1568;
    float _1602 = _1600;
    if (!_1530)
    {
        float _1604 = fma(_1594, _1594, _1600);
        _1602 = _1604;
    }
    float _1606 = _1602;
    if (!_1530)
    {
        float _1608 = -_1452;
        float _1610 = _1608 + _1558;
        _1596 = _1610;
    }
    float _1612 = _1596;
    float _1614 = fma(_1506, 100.0, _1558);
    float _1616 = _1606;
    float _1618 = _1614;
    if (!_1530)
    {
        float _1620 = sqrt(_1606);
        _1616 = _1620;
    }
    float _1622 = _1616;
    float _1624 = _1622;
    if (!_1530)
    {
        float _1626 = precise::min(_1622, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1560 = _1626;
    }
    float _1628 = _1560;
    float _1630 = _1628;
    if (!_1530)
    {
        float _1632 = -_914;
        float _1634 = _1632 + _1492;
        _1624 = _1634;
    }
    float _1636 = _1624;
    if (!_1530)
    {
        float _1638 = _1628 * _1572;
        _1576 = _1638;
    }
    float _1640 = _1576;
    if (!_1530)
    {
        float _1642 = -_912;
        float _1644 = _1642 + _1486;
        _1630 = _1644;
    }
    float _1646 = _1630;
    if (!_1530)
    {
        float _1648 = fma(_1612, _1640, _1574);
        _1618 = _1648;
    }
    float _1650 = _1618;
    if (!_1530)
    {
        float _1652 = fma(_1646, _1640, _912);
        _1488 = _1652;
    }
    float _1654 = _1488;
    if (!_1530)
    {
        float _1656 = fma(_1636, _1640, _914);
        _1514 = _1656;
    }
    float _1658 = _1514;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1662 = _1650 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1666 = _1654 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1670 = _1658 + _1668;
    float _1672 = _1662 * _1662;
    float _1674 = fma(_1666, _1666, _1672);
    float _1676 = fma(_1670, _1670, _1674);
    float _1678 = rsqrt(_1676);
    float _1680 = sqrt(_1676);
    float _1682 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1684 = _1666 * _1682;
    float _1686 = _1670 * _1682;
    float _1688 = _1684 * _1684;
    float _1690 = _1686 * _1686;
    float _1692 = _1688 + _1690;
    float _1694 = sqrt(_1692);
    bool _1696 = _1694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1700 = _1694 + _1698;
    float _1702 = _1588;
    float _1704 = _1678;
    float _1706 = _1700;
    float _1708 = _1662;
    float _1710 = _1692;
    if (_1696)
    {
        float _1712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1702 = _1712;
    }
    float _1714 = _1702;
    if (_1696)
    {
        float _1716 = rsqrt(_1692);
        _1704 = _1716;
    }
    float _1718 = _1704;
    float _1720 = _1714;
    float _1722 = _1718;
    if (_1696)
    {
        float _1724 = _1700 * _1714;
        _1706 = _1724;
    }
    float _1726 = _1706;
    if (_1696)
    {
        float _1728 = _1726 * 0.15915493667125701904296875;
        _1720 = _1728;
    }
    float _1730 = _1720;
    float _1732 = _1670;
    float _1734 = _1730;
    if (_1696)
    {
        float _1736 = _1730 * 6.283185482025146484375;
        float _1738 = sin(_1736);
        _1732 = _1738;
    }
    float _1740 = _1732;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1744 = precise::max(0.0, _1742);
    float _1746 = _1438;
    if (_1696)
    {
        float _1748 = _1730 * 6.283185482025146484375;
        float _1750 = cos(_1748);
        _1746 = _1750;
    }
    float _1752 = _1746;
    float _1754 = -_1682;
    float _1756 = -_1744;
    float _1758 = fma(_1662, _1754, _1756);
    float _1760 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1762 = _1760;
    float _1764 = _1758;
    if (_1696)
    {
        float _1766 = _1758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1708 = _1766;
    }
    float _1768 = _1708;
    float _1770 = _1740;
    if (_1696)
    {
        float _1772 = fma(_1740, _1768, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1770 = _1772;
    }
    float _1774 = _1770;
    float _1776 = _1760 * _406;
    float _1778 = _1774;
    if (_1696)
    {
        float _1780 = _1718 * _1774;
        _1710 = _1780;
    }
    float _1782 = _1710;
    float _1784 = _1752;
    if (_1696)
    {
        float _1786 = _1752 + (-1.0);
        _1762 = _1786;
    }
    float _1788 = _1762;
    float _1790 = _1788;
    if (!_1696)
    {
        _1722 = _1684;
    }
    float _1792 = _1722;
    float _1794 = trunc(_1776);
    int _1796 = int(_1794);
    float _1798 = _1792;
    if (_1696)
    {
        float _1800 = _1684 * _1782;
        _1798 = _1800;
    }
    float _1802 = _1798;
    if (_1696)
    {
        float _1804 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1804;
    }
    float _1806 = _1734;
    if (!_1696)
    {
        _1778 = _1686;
    }
    float _1808 = _1778;
    float _1810 = _1808;
    if (_1696)
    {
        float _1812 = _1686 * _1782;
        _1810 = _1812;
    }
    float _1814 = _1810;
    if (!_1696)
    {
        _1790 = _1688;
    }
    float _1816 = _1790;
    float _1818 = _1816;
    if (_1696)
    {
        float _1820 = fma(_1758, _1752, _1806);
        _1764 = _1820;
    }
    float _1822 = _1764;
    if (_1696)
    {
        float _1824 = _1802 * _1802;
        _1818 = _1824;
    }
    float _1826 = _1818;
    if (!_1696)
    {
        _1784 = _1690;
    }
    float _1828 = _1784;
    float _1830 = _1828;
    if (_1696)
    {
        float _1832 = _1814 * _1814;
        _1830 = _1832;
    }
    float _1834 = _1830;
    float _1836 = fma(_1822, _1822, _1826);
    float _1838 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1842 = _1840 != 0;
    float _1844 = _1836 + _1834;
    float _1846 = _1838 * _406;
    int _1848 = _1796 << 4;
    int _1850 = _1848 + 1712;
    float _1852 = rsqrt(_1844);
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1856 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1854);
    float _1858 = precise::clamp(_1856, 0.0, 1.0);
    float _1860 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1862 = _1850 + 8;
    uint _1865 = uint(int(uint(_1862) >> uint(2)));
    uint _1867 = uint(int(uint(int(_1865)) >> uint(2)));
    int _1869 = int(_1865) & 3;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[int(_1867)][_1869];
    float _1873 = -_1858;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1860);
    float _1879 = trunc(_1846);
    int _1881 = int(_1879);
    float _1883 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1877);
    float _1885 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1887 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1889 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1891 = abs(_1875);
    float _1893 = log2(_1891);
    float _1895 = _1852 * _1802;
    float _1897 = _1852 * _1822;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1901 = _1852 * _1814;
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1905 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1899;
    float _1909 = fma(_1907, _1887, 1.0);
    float _1911 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1913 = -_1903;
    float _1915 = fma(_1897, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1913);
    float _1917 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1905);
    float _1919 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1921 = floor(_1534);
    float _1923 = -_1901;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1915);
    float _1927 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1911);
    float _1929 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1917);
    float _1931 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1933 = fma(_1925, -0.5, 0.5);
    float _1935 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1927);
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1939 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1919);
    float _1941 = fma(_1925, 0.5, 0.5);
    float _1943 = exp2(_1931);
    float _1945 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1947 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1949 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1939);
    float _1951 = fma(_1941, -0.0187292993068695068359375, 0.07426099479198455810546875);
    int _1953 = _1881 << 4;
    int _1955 = _1953 + 1968;
    float _1957 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1947);
    float _1959 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1961 = sqrt(_1933);
    float _1963 = -_1921;
    float _1965 = _1534 + _1963;
    float _1967 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1957);
    float _1969 = fma(_1941, _1951, -0.212114393711090087890625);
    float _1971 = _1897 + 1.0;
    float _1973 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1967);
    float _1975 = fma(_1941, _1969, 1.570728778839111328125);
    float _1977 = floor(_1885);
    float _1979 = -_1897;
    float _1981 = fma(_1943, _1971, _1979);
    float _1983 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1985 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1987 = fma(_1981, 0.5, 0.5);
    float _1989 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1985);
    float _1991 = _1961 * 0.636619746685028076171875;
    float _1993 = log2(_1909);
    float _1995 = -_1975;
    float _1997 = fma(_1991, _1995, 1.0);
    float _1999 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1983);
    float _2001 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1989);
    uint _2003 = uint(int(uint(_1850) >> uint(2)));
    uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
    int _2007 = int(_2003) & 3;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[int(_2005)][_2007];
    int _2011 = int(_2003) + 1;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    int _2015 = _2011 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[int(_2013)][_2015];
    float _2019 = -_1977;
    float _2021 = _1885 + _2019;
    float _2023 = 1.0 / _1973;
    float _2025 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1999);
    float _2027 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2001);
    float _2029 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2025);
    float2 _5949 = float2(_2021, _1965);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5949, float2(0.0), isnan(_5949)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5949, float2(0.0), isnan(_5949)), level(0.0)).x;
    float _2033 = _1993 * 0.693147182464599609375;
    float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2037 = uint(int(uint(_1955) >> uint(2)));
    uint _2039 = uint(int(uint(int(_2037)) >> uint(2)));
    int _2041 = int(_2037) & 3;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[int(_2039)][_2041];
    int _2045 = int(_2037) + 1;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    int _2049 = _2045 & 3;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[int(_2047)][_2049];
    float _2053 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2055 = _2029 * _2023;
    float _2057 = _2027 * _2023;
    float _2059 = fma(_2055, 0.5, 0.5);
    float _2061 = fma(_2057, -0.5, 0.5);
    float3 _6007 = float3(_2059, _2061, _2053);
    float _2063 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6007, float3(0.0), isnan(_6007)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6007, float3(0.0), isnan(_6007)), level(0.0)).x;
    float3 _6018 = float3(_2059, _2061, _2053);
    float4 _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6018, float3(0.0), isnan(_6018)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6018, float3(0.0), isnan(_6018)), level(0.0)).xyzw;
    float _2068 = _2066.x;
    float _2070 = _2066.y;
    float _2072 = _2066.z;
    float _2074 = _2066.w;
    float2 _6034 = float2(_1997, _1987);
    float3 _2078 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6034, float2(0.0), isnan(_6034)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6034, float2(0.0), isnan(_6034)), level(0.0)).xyz;
    float _2080 = _2078.x;
    float _2082 = _2078.y;
    float _2084 = _2078.z;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2088 = _2086 != 0;
    int _2090 = _1955 + 8;
    uint _2092 = uint(int(uint(_2090) >> uint(2)));
    uint _2094 = uint(int(uint(int(_2092)) >> uint(2)));
    int _2096 = int(_2092) & 3;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[int(_2094)][_2096];
    int _2100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2102 = _2100 != 0;
    float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2108 = _2106 != 0;
    float _2110 = _552 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2114 = _2112 != 0;
    float _2116 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2118 = _2108 ? as_type<float>(_524) : _400;
    float _2120 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _2122 = _2108;
    int _2124 = as_type<int>(_2061);
    int _2126 = as_type<int>(_1965);
    if (_1842)
    {
        bool _2128 = _406 > 0.5;
        _2122 = _2128;
    }
    bool _2130 = _2122;
    float _2132 = _1532;
    if (_1842)
    {
        float _2134 = -_1532;
        float _2136 = _2134 + 1.0;
        _2124 = as_type<int>(_2136);
    }
    int _2138 = _2124;
    bool _2140 = _386 > 0.5;
    if (_2088)
    {
        float _2142 = -_1532;
        float _2144 = _2142 + 1.0;
        _538 = as_type<int>(_2144);
    }
    int _2146 = _538;
    float _2148 = 0.0;
    if (!_1842)
    {
        _2148 = _1532;
    }
    float _2150 = _2148;
    float _2152 = _608 * (-0.15915493667125701904296875);
    float _2154 = _2150;
    if (_1842)
    {
        float _2156 = _2130 ? as_type<float>(_2138) : _1532;
        _2154 = _2156;
    }
    float _2158 = _2154;
    if (_2102)
    {
        float _2160 = -_1532;
        float _2162 = _2160 + 1.0;
        _2126 = as_type<int>(_2162);
    }
    int _2164 = _2126;
    float _2166 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2168 = _1871;
    int _2170 = as_type<int>(_2017);
    if (!_2088)
    {
        _1540 = _1532;
    }
    float _2172 = _1540;
    float _2174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2176 = fma(_2118, _2120, -0.5);
    float _2178 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2180 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2182 = _2172;
    if (_2088)
    {
        float _2184 = _2140 ? as_type<float>(_2146) : _1532;
        _2182 = _2184;
    }
    float _2186 = _2182;
    float _2188 = _2017 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2190 = _1871 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2192 = _2152 * 6.283185482025146484375;
    float _2194 = sin(_2192);
    if (!_2102)
    {
        _2168 = _1532;
    }
    float _2196 = _2168;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2200 = _2196;
    if (_2102)
    {
        float _2202 = _430 ? as_type<float>(_2164) : _1532;
        _2200 = _2202;
    }
    float _2204 = _2200;
    float _2206 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2208 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2210 = _526 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2114)
    {
        float _2212 = -_1532;
        float _2214 = _2212 + 1.0;
        _2170 = as_type<int>(_2214);
    }
    int _2216 = _2170;
    float _2218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2220 = fma(_2180, _2204, -0.5);
    out.m_73.x = _2178;
    out.m_73.y = _2206;
    out.m_73.z = _2208;
    out.m_73.w = _2198;
    float _2222 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2116);
    if (_2114)
    {
        float _2224 = _430 ? as_type<float>(_2216) : _1532;
        _2132 = _2224;
    }
    float _2226 = _2132;
    float _2228 = in.m_75.x;
    float _2230 = in.m_75.y;
    float _2232 = in.m_75.z;
    float _2234 = -_1244;
    float _2236 = -_1008;
    bool _2238 = _2234 != _2236;
    bool _2240 = isnan(_2234);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan(_2236);
    bool _2246 = _2242 || _2244;
    float _2248 = _2152 * 6.283185482025146484375;
    float _2250 = cos(_2248);
    float _2252 = _2051 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2254 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2256 = _1130 == 0.0;
    bool _2258 = !_2246;
    bool _2260 = _2256 && _2258;
    float _2262 = _2210 * _2104;
    float _2264 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2222);
    float _2266 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2268 = _1140 == 0.0;
    bool _2270 = _2268 && _2260;
    float _2272 = _486 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2274 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2276 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2278 = _2254 * _2035;
    float _2280 = _2272 * _2174;
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2284 = _2194 * _2176;
    float _2286 = _2276 * _2218;
    float _2288 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2290 = _2250 * _2176;
    float _2292 = -_2284;
    float _2294 = fma(_2250, _2220, _2292);
    float _2296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2298 = in.m_77.x;
    float _2300 = in.m_77.y;
    float _2302 = in.m_77.z;
    float _2304 = in.m_77.w;
    float _2306 = _2098 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2308 = fma(_2194, _2220, _2290);
    float _2310 = _2194;
    float _2312 = _2226;
    float _2314 = _2286;
    float _2316 = _2280;
    float _2318 = _2228;
    if (_2270)
    {
        _2310 = _2228;
    }
    float _2320 = _2310;
    out.m_79.x = _2278;
    out.m_79.y = _2262;
    out.m_79.z = _2286;
    out.m_79.w = _2280;
    float _2322 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2324 = fma(_644, _2294, _710);
    float _2326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2328 = _2320;
    if (_2270)
    {
        _712 = _2320;
    }
    float _2330 = _712;
    float _2332 = -_688;
    float _2334 = fma(_706, _2308, _2332);
    float _2336 = _2330;
    if (!_2270)
    {
        _2328 = _2228;
    }
    float _2338 = _2328;
    float _2340 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_2270)
    {
        _2312 = _2230;
    }
    float _2342 = _2312;
    out.m_81.x = _2282;
    out.m_81.y = _2288;
    out.m_81.z = _2322;
    float _2344 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2264);
    float _2346 = _2342;
    if (!_2270)
    {
        float _2348 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2338);
        _2336 = _2348;
    }
    float _2350 = _2336;
    float _2352 = exp2(_2266);
    float _2354 = in.m_83.x;
    if (_2270)
    {
        _2314 = _2232;
    }
    float _2356 = _2314;
    float _2358 = _2324 + 0.5;
    float _2360 = _2356;
    if (_2270)
    {
        _2316 = _2342;
    }
    float _2362 = _2316;
    float _2364 = _2334 + 0.5;
    float _2366 = _2362;
    if (_2270)
    {
        _2318 = _2356;
    }
    float _2368 = _2318;
    float _2370 = _2368;
    if (!_2270)
    {
        _2360 = _2232;
    }
    float _2372 = _2360;
    float _2374 = _2110 * _2296;
    float _2376 = _2302 * _2338;
    if (!_2270)
    {
        _2346 = _2230;
    }
    float _2378 = _2346;
    float _2380 = _2340 * _2326;
    float _2382 = _2300 * _2372;
    float _2384 = -_2376;
    float _2386 = fma(_2298, _2372, _2384);
    if (!_2270)
    {
        float _2388 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2372);
        _2370 = _2388;
    }
    float _2390 = _2370;
    if (!_2270)
    {
        float _2392 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2378);
        _2366 = _2392;
    }
    float _2394 = _2366;
    float _2396 = -_2382;
    float _2398 = fma(_2302, _2378, _2396);
    float _2400 = _2386 * _2304;
    out.m_85.x = _2358;
    out.m_85.y = _2364;
    float _2402 = _2298 * _2378;
    float _2404 = _2398 * _2304;
    float _2406 = _1316 * _2394;
    out.m_87.x = _2380;
    out.m_87.y = _2374;
    float _2408 = -_2402;
    float _2410 = fma(_2300, _2338, _2408);
    float _2412 = -_2352;
    float _2414 = _2412 + 1.0;
    float _2416 = fma(_1334, _2350, _2406);
    out.m_89.x = _2354;
    float _2418 = _2410 * _2304;
    float _2420 = -_2394;
    float _2422 = _1306 * _2420;
    float _2424 = -_2300;
    float _2426 = _1306 * _2424;
    float _2428 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2430 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2432 = isnan(_1680);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2438 = _2434 || _2436;
    float _2440 = -_2400;
    float _2442 = _1306 * _2440;
    float _2444 = fma(_1318, _2350, _2422);
    float _2446 = fma(_1318, _2298, _2426);
    float _2448 = _1314 * _2394;
    float _2450 = fma(_1318, _2404, _2442);
    float _2452 = _1314 * _2300;
    float _2454 = _1314 * _2400;
    float _2456 = _1316 * _2300;
    float _2458 = _1316 * _2400;
    float _2460 = fma(_1330, _2350, _2448);
    float _2462 = fma(_1330, _2298, _2452);
    float _2464 = fma(_1330, _2404, _2454);
    float _2466 = fma(_1334, _2298, _2456);
    float _2468 = fma(_1334, _2404, _2458);
    float _2470 = fma(_1320, _2390, _2444);
    float _2472 = fma(_1338, _2390, _2460);
    float _2474 = fma(_1346, _2390, _2416);
    float _2476 = fma(_1338, _2302, _2462);
    float _2478 = fma(_1338, _2418, _2464);
    float _2480 = fma(_1346, _2302, _2466);
    float _2482 = fma(_1320, _2302, _2446);
    float _2484 = fma(_1346, _2418, _2468);
    float _2486 = fma(_1320, _2418, _2450);
    float _2488 = _2476 * _322;
    float _2490 = _2472 * _322;
    float _2492 = _2478 * _322;
    float _2494 = _2476 * _312;
    float _2496 = _2472 * _312;
    float _2498 = _2478 * _312;
    float _2500 = _2478 * _326;
    float _2502 = _2476 * _326;
    float _2504 = fma(_2486, _290, _2492);
    float _2506 = fma(_2482, _286, _2494);
    float _2508 = fma(_2486, _294, _2500);
    float _2510 = fma(_2486, _286, _2498);
    float _2512 = _2472 * _326;
    float _2514 = fma(_2482, _290, _2488);
    float _2516 = fma(_2484, _338, _2508);
    float _2518 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2520 = fma(_2482, _294, _2502);
    float _2522 = fma(_2480, _334, _2514);
    float _2524 = fma(_2470, _294, _2512);
    float _2526 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2518);
    float _2528 = fma(_2480, _338, _2520);
    float _2530 = fma(_2470, _290, _2490);
    float _2532 = fma(_2470, _286, _2496);
    float _2534 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2526);
    float _2536 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2538 = fma(_2474, _334, _2530);
    float _2540 = fma(_2474, _338, _2524);
    float _2542 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2544 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2536);
    float _2546 = fma(_2484, _334, _2504);
    float _2548 = fma(_2484, _330, _2510);
    float _2550 = 1.0 / _2542;
    float _2552 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2544);
    float _2554 = fma(_2480, _330, _2506);
    out.m_91.x = _2546;
    out.m_91.y = _2548;
    out.m_91.z = _2516;
    float _2556 = _2552 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2558 = fma(_2474, _330, _2532);
    float _2560 = in.m_71.x;
    float _2562 = _2556 + _2542;
    out.m_93.x = _2522;
    out.m_93.y = _2554;
    out.m_93.z = _2528;
    float _2564 = _2562 * _2550;
    float _2566 = _2564 * 0.5;
    out.m_95.x = _2538;
    out.m_95.y = _2558;
    out.m_95.z = _2540;
    float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2570 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2568);
    float _2572 = 1.0 / _2570;
    out.gl_Position.x = _2029;
    out.gl_Position.y = _2027;
    out.gl_Position.z = _2344;
    out.gl_Position.w = _1973;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2576 = _2572 * _2574;
    float _2578 = abs(_2576);
    float _2580 = log2(_2578);
    bool _2582 = _2576 <= 8000.0;
    bool _2584 = isnan(_2576);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan(8000.0);
    bool _2590 = _2586 || _2588;
    float _2592 = float(_2590);
    float _2594 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2596 = exp2(_2594);
    float _2598 = fma(_2596, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2600 = precise::clamp(_2598, 0.0, 1.0);
    float _2602 = _2344 + _1973;
    float _2604 = fma(_2600, -2.0, 3.0);
    float _2606 = _2600 * _2600;
    float _2608 = _2602 * 0.5;
    float _2610 = in.m_83.y;
    float _2612 = _2606 * _2604;
    float _2614 = in.m_83.w;
    float _2616 = -_2612;
    float _2618 = _2616 + 1.0;
    float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2612);
    float _2622 = _2592 * _2620;
    float _2624 = in.m_83.z;
    float _2626 = _2622 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_97.z = _2608;
    out.m_97.w = _1973;
    float _2628 = -_2031;
    float _2630 = _2628 + 1.0;
    out.m_89.y = _2610;
    float _2632 = _2630 * _2626;
    float _2634 = precise::clamp(_2632, 0.0, 1.0);
    out.m_89.w = _2614;
    float _2636 = -_2634;
    float _2638 = fma(_2636, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2640 = _2608;
    float _2642 = _2610;
    if (!_2438)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2644 = _2640;
    float _2646 = _2644;
    float _2648 = _2644;
    if (!_2438)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2650 = _2642;
    float _2652 = _2638 * _2560;
    float _2654 = _2652 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2656 = _2652;
    float _2658 = _2650;
    float _2660 = _2650;
    if (!_2438)
    {
        _2656 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2662 = _2656;
    out.m_89.z = _2624;
    float _2664 = _2428 * _2063;
    float _2666 = -_2428;
    float _2668 = _2666 + 1.0;
    out.m_99.x = _2654;
    float _2670 = _2074 * _2664;
    float _2672 = _2084 * _2664;
    float _2674 = _2074 * _2668;
    float _2676 = _2664;
    float _2678 = _2672;
    float _2680 = _2670;
    float _2682 = _2662;
    float _2684 = _2662;
    if (!_2438)
    {
        _2676 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2686 = _2676;
    float _2688 = fma(_2080, _2670, _2068);
    float _2690 = fma(_2082, _2670, _2070);
    float _2692 = fma(_2074, _2672, _2072);
    float _2694 = _2686;
    float _2696 = _2686;
    if (!_2438)
    {
        _2678 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2698 = _2678;
    float _2700 = _2698;
    float _2702 = _2698;
    if (!_2438)
    {
        _2680 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2704 = _2680;
    out.m_101.x = _2688;
    out.m_101.y = _2690;
    out.m_101.z = _2692;
    out.m_101.w = _2674;
    bool _2706 = !_2438;
    float _2708 = _2704;
    float _2710 = _2704;
    if (!_2706)
    {
        bool _2712 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2714 = isnan(_1680);
        bool _2716 = _2712 || _2714;
        bool _2718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2720 = _2716 || _2718;
        if (!_2720)
        {
            float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2724 = _1680 + _2722;
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2728 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2726;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2734 = 1.0 / _2728;
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2752 = _2724 * _2734;
            float _2754 = precise::clamp(_2752, 0.0, 1.0);
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2760 = fma(_2754, _2732, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2762 = fma(_2754, _2758, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2764 = fma(_2754, _2738, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2766 = fma(_2754, _2742, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2768 = fma(_2754, _2746, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2770 = fma(_2754, _2750, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2648 = _2760;
            _2684 = _2768;
            _2696 = _2764;
            _2710 = _2766;
            _2702 = _2762;
            _2660 = _2770;
            _2772 = true;
        }
        else
        {
            bool _2774 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2776 = isnan(_1680);
            bool _2778 = _2774 || _2776;
            bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2782 = _2778 || _2780;
            if (!_2782)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2784 = _2694;
            _2696 = _2784;
            if (!_2782)
            {
                _2646 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2786 = _2646;
            _2648 = _2786;
            if (!_2782)
            {
                _2700 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2788 = _2700;
            _2702 = _2788;
            if (!_2782)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2790 = _2708;
            _2710 = _2790;
            if (!_2782)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2792 = _2682;
            _2684 = _2792;
            if (!_2782)
            {
                _2658 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2794 = _2658;
            bool _2796 = !_2782;
            _2660 = _2794;
            if (!_2796)
            {
                bool _2798 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2800 = isnan(_1680);
                bool _2802 = _2798 || _2800;
                bool _2804 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2806 = _2802 || _2804;
                if (!_2806)
                {
                    float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2810 = _1680 + _2808;
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2814 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2812;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2820 = 1.0 / _2814;
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2838 = _2810 * _2820;
                    float _2840 = precise::clamp(_2838, 0.0, 1.0);
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2846 = fma(_2840, _2818, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2848 = fma(_2840, _2844, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2850 = fma(_2840, _2824, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2852 = fma(_2840, _2828, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2854 = fma(_2840, _2832, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2856 = fma(_2840, _2836, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2648 = _2846;
                    _2684 = _2854;
                    _2696 = _2850;
                    _2710 = _2852;
                    _2702 = _2848;
                    _2660 = _2856;
                    _2772 = true;
                }
                else
                {
                    _2648 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2702 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2660 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2772 = false;
    float _2858 = _2648;
    float _2860 = _2684;
    float _2862 = _2696;
    float _2864 = _2710;
    float _2866 = _2702;
    float _2868 = _2660;
    float _2870 = fma(_2558, -0.5, 0.5);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = -_2858;
    float _2876 = _2874 + _2860;
    float _2878 = -_2862;
    float _2880 = _2878 + _2864;
    float _2882 = -_2866;
    float _2884 = _2882 + _2868;
    bool _2886 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2888 = fma(_2872, _2876, _2858);
    float _2890 = fma(_2872, _2880, _2862);
    float _2892 = fma(_2872, _2884, _2866);
    float _2894 = _2888 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2896 = fma(_2890, 0.298911988735198974609375, _2894);
    float _2898 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2900 = fma(_2892, 0.114477999508380889892578125, _2896);
    out.m_99.w = _2898;
    float _2902 = -_2900;
    float _2904 = _2890 + _2902;
    float _2906 = -_2900;
    float _2908 = _2888 + _2906;
    float _2910 = -_2900;
    float _2912 = _2892 + _2910;
    out.m_103.x = 0.0;
    float _2914 = fma(_2904, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2916 = fma(_2908, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2918 = fma(_2912, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    out.m_105.x = _2914;
    out.m_105.y = _2916;
    out.m_105.z = _2918;
    if (!_2886)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2920 = -_1650;
    float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2924 = -_1654;
    float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2928 = -_1658;
    float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2932 = _2922 * _2922;
    float _2934 = fma(_2926, _2926, _2932);
    float _2936 = fma(_2930, _2930, _2934);
    float _2938 = sqrt(_2936);
    float _2940 = rsqrt(_2936);
    float _2942 = -_2938;
    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2946 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2948 = precise::clamp(_2946, 0.0, 1.0);
    float _2950 = _2926 * _2940;
    float _2952 = _2922 * _2940;
    float _2954 = abs(_2948);
    float _2956 = log2(_2954);
    float _2958 = _2930 * _2940;
    float _2960 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2962 = _2558 * _2952;
    float _2964 = -_2952;
    float _2966 = -_2960;
    float _2968 = fma(_2964, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2966);
    float _2970 = fma(_2538, _2950, _2962);
    float _2972 = -_2958;
    float _2974 = fma(_2972, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2968);
    float _2976 = fma(_2540, _2958, _2970);
    float _2978 = precise::clamp(_2976, 0.0, 1.0);
    float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2982 = _2974 + _2980;
    float _2984 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2988 = precise::clamp(_2986, 0.0, 1.0);
    float _2990 = exp2(_2984);
    float _2992 = _2990 * _2988;
    float _2994 = _2978 * _2992;
    float _2996 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2998 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3000 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2996;
    out.m_103.y = _2998;
    out.m_103.z = _3000;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2772 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_48.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = as_type<float>(_124);
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_51.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_140);
        out.gl_Position.z = _3058;
    }
    if (!_128)
    {
        return out;
    }
    float _144 = in.m_53.w;
    float _146 = float(_124);
    float _148 = -_144;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_144);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    bool _162 = _150 >= _146;
    bool _164 = !_160;
    bool _166 = _162 || _164;
    float _168 = _150;
    if (_166)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _132;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _142 = as_type<int>(_172);
    }
    int _174 = _142;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3122 = as_type<float>(_174);
        out.gl_Position.z = _3122;
    }
    if (_166)
    {
        return out;
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = 1.0 / _146;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    float _196 = _150 * _182;
    float _198 = _176 * _176;
    float _200 = _178 * _178;
    float _202 = _180 * _180;
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = fma(_194, _194, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = _218;
    float _228 = _188;
    if (_222)
    {
        float _230 = rsqrt(_210);
        _226 = _230;
    }
    float _232 = _226;
    float _234 = 0.0;
    if (!_222)
    {
        _234 = 0.0;
    }
    float _236 = _234;
    bool _238 = _220 > 0.0;
    float _240 = 0.0;
    float _242 = _236;
    if (!_222)
    {
        _240 = 0.0;
    }
    float _244 = _240;
    float _246 = 0.0;
    float _248 = _244;
    if (!_222)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = _216;
    float _254 = _250;
    if (_224)
    {
        float _256 = rsqrt(_212);
        _252 = _256;
    }
    float _258 = _252;
    float _260 = 0.0;
    float _262 = 0.0;
    if (!_224)
    {
        _260 = 0.0;
        _262 = 0.0;
    }
    float _264 = _260;
    float _266 = _262;
    float _268 = 0.0;
    float _270 = _264;
    float _272 = _266;
    if (!_224)
    {
        _268 = 0.0;
    }
    float _274 = _268;
    float _276 = _220;
    float _278 = _274;
    if (_238)
    {
        float _280 = rsqrt(_214);
        _276 = _280;
    }
    float _282 = _276;
    if (_222)
    {
        float _284 = _232 * _176;
        _242 = _284;
    }
    float _286 = _242;
    if (_222)
    {
        float _288 = _232 * _184;
        _248 = _288;
    }
    float _290 = _248;
    if (_222)
    {
        float _292 = _232 * _190;
        _254 = _292;
    }
    float _294 = _254;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _298 = 0.0;
    if (!_238)
    {
        _298 = 0.0;
    }
    float _300 = _298;
    float _302 = 0.0;
    float _304 = _300;
    if (!_238)
    {
        _302 = 0.0;
    }
    float _306 = _302;
    float _308 = _306;
    if (_224)
    {
        float _310 = _258 * _178;
        _278 = _310;
    }
    float _312 = _278;
    float _314 = 0.0;
    if (!_238)
    {
        _314 = 0.0;
    }
    float _316 = _314;
    float _318 = _316;
    if (_224)
    {
        float _320 = _258 * _186;
        _270 = _320;
    }
    float _322 = _270;
    if (_224)
    {
        float _324 = _258 * _192;
        _272 = _324;
    }
    float _326 = _272;
    if (_238)
    {
        float _328 = _282 * _180;
        _304 = _328;
    }
    float _330 = _304;
    if (_238)
    {
        float _332 = _282 * _188;
        _308 = _332;
    }
    float _334 = _308;
    if (_238)
    {
        float _336 = _282 * _194;
        _318 = _336;
    }
    float _338 = _318;
    bool _340 = !_296;
    float _358;
    if (!_340)
    {
        float _342 = in.m_61.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        _358 = _196;
    }
    _360 = false;
    float _362 = _358;
    float _364 = in.m_61.w;
    float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _368 = -_196;
    float _370 = _368 + 1.0;
    float _372 = in.m_48.x;
    float _374 = in.m_48.y;
    float _376 = in.m_48.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _362 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = _362 + _382;
    float _386 = in.m_61.z;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = in.m_61.y;
    float _398 = 1.0 / _390;
    float _400 = in.m_63.y;
    float _402 = _370 * _366;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = in.m_61.x;
    float _408 = 1.0 / _394;
    bool _410 = _364 > 0.5;
    float _412 = _186 * _374;
    float _414 = _384 * _398;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _416;
    float _420 = _196 * _366;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _192 * _374;
    float _426 = fma(_184, _372, _412);
    float _428 = 1.0 / _418;
    bool _430 = _396 > 0.5;
    float _432 = fma(_190, _372, _424);
    float _434 = fma(_188, _376, _426);
    float _436 = _396 + _386;
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = fma(_194, _376, _432);
    float _444 = _386 * 2.0;
    float _446 = _396 * 2.0;
    float _448 = _436 + (-1.0);
    float _450 = _380 * _408;
    float _452 = floor(_444);
    float _454 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _458 = _456 != 0;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _462 = _460 != 0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _466 = _464 != 0;
    float _468 = _406 + _386;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _472 = _470 != 0;
    int _474 = _410 ? as_type<int>(_440) : as_type<int>(_400);
    float _476 = _468 + (-1.0);
    float _478 = floor(_446);
    float _480 = precise::min(_422, _404);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _484 = _362 + _482;
    float _486 = _462 ? as_type<float>(_474) : _400;
    float _488 = _484 * _428;
    float _490 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _492 = log2(_490);
    bool _494 = _452 >= 0.0;
    bool _496 = isnan(_452);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _506 = _452 > 0.0;
    int _508 = _502 ? 0 : 1;
    bool _510 = _386 > 0.5;
    int _512 = _430 ? as_type<int>(_440) : as_type<int>(_400);
    bool _514 = _478 >= 0.0;
    bool _516 = isnan(_478);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    int _524 = _510 ? as_type<int>(_440) : as_type<int>(_400);
    float _526 = _458 ? as_type<float>(_512) : _400;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    bool _530 = _478 > 0.0;
    float _532 = _478;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[94].z;
    float _536 = _374;
    int _538 = as_type<int>(_406);
    if (_472)
    {
        _228 = _406;
    }
    float _540 = _228;
    float _542 = _540;
    if (_472)
    {
        _532 = _396;
    }
    float _544 = _532;
    float _546 = _544;
    if (_472)
    {
        _534 = _386;
    }
    float _548 = _534;
    int _550 = _522 ? 0 : 1;
    float _552 = _466 ? as_type<float>(_524) : _400;
    float _554 = _548;
    if (!_472)
    {
        float _556 = _406 * 3.1415927410125732421875;
        float _558 = _556 * 0.15915493667125701904296875;
        float _560 = _396 * 3.1415927410125732421875;
        float _562 = _560 * 0.15915493667125701904296875;
        float _564 = _386 * 3.1415927410125732421875;
        float _566 = _558 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _564 * 0.15915493667125701904296875;
        float _572 = _562 * 6.283185482025146484375;
        float _574 = sin(_572);
        float _576 = _570 * 6.283185482025146484375;
        float _578 = sin(_576);
        _554 = _578;
        _542 = _568;
        _546 = _574;
    }
    float _580 = _554;
    float _582 = _542;
    float _584 = _546;
    float _586 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[94].z, _528);
    int _588 = ~_508;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _596 = _592;
    if (!_506)
    {
        int _598 = ~_508;
        int _600 = _598 + 1;
        _596 = _600;
    }
    int _602 = _596;
    float _604 = _492 * _150;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _608 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[94].x, _586);
    float _610 = exp2(_604);
    float _612 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[93].z, _606);
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _616 = _582 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _618 = ~_550;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _626 = 1.0 + _624;
    int _628 = _622;
    if (!_530)
    {
        int _630 = ~_550;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = -_614;
    float _638 = fma(_616, 2.0, _636);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _642 = 1.0 / _626;
    float _644 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].z, _612);
    float _646 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[93].w, _640);
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _650 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _652 = isnan(1.0);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _658 = _654 || _656;
    float _660 = _584 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _662 = _406 * 2.0;
    float _664 = -_610;
    float _666 = _664 + 1.0;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    bool _670 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    float _680 = fma(_660, -2.0, _648);
    float _682 = floor(_662);
    float _684 = fma(_668, _396, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _686 = _678 ? _666 : 0.0;
    float _688 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[91].y, _680);
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _700 = _698 != 0;
    float _702 = _406 + _396;
    float _704 = _684 * _150;
    float _706 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].w, _646);
    float _708 = -_150;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[91].x, _638);
    float _712 = _710;
    if (_658)
    {
        float _714 = _686 * _642;
        _168 = _714;
    }
    float _716 = _168;
    bool _718 = !_692;
    int _720 = _718 ? 0 : 1;
    float _722 = _702 + (-1.0);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _734 = _732 != 0;
    float _736 = in.m_57.w;
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _740 = in.m_59.w;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _744 = !_696;
    int _746 = _744 ? 0 : 1;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    bool _752 = !_700;
    int _754 = _752 ? 0 : 1;
    float _756 = _396 + (-0.5);
    bool _758 = !_734;
    int _760 = _758 ? 0 : 1;
    float _762 = fma(_750, _414, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _764 = fma(_406, 6.283185482025146484375, _704);
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _776 = _774 != 0;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _778;
    bool _782 = _682 >= 0.0;
    bool _784 = isnan(_682);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _792;
    float _796 = fma(_780, _414, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _798 = _790 ? 0 : 1;
    float _800 = fma(_794, _414, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _802 = _682 > 0.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _816 = fma(_806, _450, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _818;
    float _822 = fma(_810, _450, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _824;
    float _828 = fma(_814, _450, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _830;
    bool _834 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _836 = isnan(_362);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = _716 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _848 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _850 = isnan(_362);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = fma(_820, _488, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _862 = fma(_826, _488, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _864 = fma(_832, _488, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _866 = _846 * _594;
    float _868 = -_844;
    float _870 = _868 + 1.0;
    bool _872 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _874 = isnan(_362);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -_858;
    float _886 = _884 + 1.0;
    float _888 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[203].x, _866);
    float _890 = _858 * _870;
    bool _892 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _894 = isnan(_362);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _882 * _886;
    float _906 = -_882;
    float _908 = _906 + 1.0;
    float _910 = floor(_888);
    float _912 = _434 + _736;
    float _914 = _442 + _740;
    float _916 = _902 * _908;
    float _918 = _716 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _920 = -_902;
    float _922 = _920 + 1.0;
    float _924 = _888 + 0.25;
    float _926 = _762 * _916;
    float _928 = _796 * _916;
    float _930 = _918 * _742;
    float _932 = floor(_924);
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[143].x, _926);
    float _936 = _800 * _916;
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[143].y, _928);
    float _940 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[203].z, _930);
    float _942 = fma(_816, _904, _934);
    int _944 = ~_798;
    int _946 = _944 + 1;
    int _948 = _946 + 1;
    float _950 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[143].z, _936);
    int _952 = _948;
    if (!_802)
    {
        int _954 = ~_798;
        int _956 = _954 + 1;
        _952 = _956;
    }
    int _958 = _952;
    float _960 = fma(_822, _904, _938);
    bool _962 = !_768;
    int _964 = _962 ? 0 : 1;
    float _966 = _940 + 0.25;
    float _968 = fma(_860, _890, _942);
    float _970 = -_910;
    float _972 = _888 + _970;
    bool _974 = !_772;
    int _976 = _974 ? 0 : 1;
    float _978 = fma(_828, _904, _950);
    int _980 = abs(_964);
    float _982 = floor(_966);
    int _984 = abs(_976);
    float _986 = in.m_65.x;
    float _988 = in.m_65.y;
    float _990 = in.m_65.z;
    bool _992 = _972 >= 0.5;
    bool _994 = isnan(_972);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.5);
    bool _1000 = _996 || _998;
    float _1002 = -_932;
    float _1004 = _924 + _1002;
    float _1006 = float(_602);
    float _1008 = in.m_67.y;
    float _1010 = floor(_940);
    float _1012 = -_480;
    float _1014 = _1012 + 1.0;
    float _1016 = float(_958);
    float _1018 = fma(_862, _890, _960);
    float _1020 = float(_984);
    float _1022 = fma(_864, _890, _978);
    float _1024 = float(_980);
    float _1026 = -_982;
    float _1028 = _966 + _1026;
    bool _1030 = !_730;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _1020 * _1016;
    int _1036 = abs(_746);
    float _1038 = _1024 * _1006;
    float _1040 = _1034 * (-2.0);
    int _1042 = abs(_1032);
    float _1044 = _888 * 6.283185482025146484375;
    float _1046 = -_1010;
    float _1048 = _940 + _1046;
    bool _1050 = !_1000;
    float _1052 = _1050 ? 0.5 : (-0.5);
    float _1054 = fma(_454, _1040, _454);
    float _1056 = _1044 * 0.15915493667125701904296875;
    float _1058 = fma(_1040, _988, _988);
    bool _1060 = _1048 >= 0.5;
    bool _1062 = isnan(_1048);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(0.5);
    bool _1068 = _1064 || _1066;
    float _1070 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1072 = _1070 * 2.0;
    float _1074 = float(_1036);
    float _1076 = _940 * 6.283185482025146484375;
    float _1078 = _1056 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    bool _1082 = !_1068;
    float _1084 = _1082 ? 0.5 : (-0.5);
    float _1086 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1058);
    bool _1088 = _1004 > 0.5;
    float _1090 = _1074 * _1072;
    float _1092 = float(_1042);
    float _1094 = _1076 * 0.15915493667125701904296875;
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1098 = _1096 * 2.0;
    int _1100 = abs(_720);
    float _1102 = _1038 * (-2.0);
    int _1104 = abs(_754);
    float _1106 = _1092 * _1098;
    float _1108 = _1094 * 6.283185482025146484375;
    float _1110 = sin(_1108);
    bool _1112 = !_726;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = fma(_1054, _716, _1086);
    float _1118 = _1004;
    float _1120 = _1028;
    if (_1088)
    {
        float _1122 = -_1004;
        float _1124 = _1122 + 1.0;
        _1118 = _1124;
    }
    float _1126 = _1118;
    float _1128 = float(_1100);
    float _1130 = in.m_67.x;
    int _1132 = abs(_1114);
    float _1134 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1136 = fma(_1126, 4.0, -1.0);
    bool _1138 = _1028 > 0.5;
    float _1140 = in.m_67.z;
    float _1142 = fma(_1128, _1134, _1090);
    float _1144 = float(_1104);
    float _1146 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1148 = _1116 * 0.15915493667125701904296875;
    float _1150 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1152 = fma(_1144, _1146, _1142);
    float _1154 = _914 * _914;
    float _1156 = float(_1132);
    float _1158 = _764 * 0.15915493667125701904296875;
    float _1160 = fma(_1152, 3.1415927410125732421875, _986);
    float _1162 = fma(_912, _912, _1154);
    int _1164 = abs(_760);
    if (_1138)
    {
        float _1166 = -_1028;
        float _1168 = _1166 + 1.0;
        _1120 = _1168;
    }
    float _1170 = _1120;
    float _1172 = float(_634);
    float _1174 = fma(_1156, _1150, _1106);
    float _1176 = fma(_1170, 4.0, -1.0);
    bool _1178 = !_776;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _406 + (-0.5);
    float _1184 = float(_1164);
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1188 = abs(_1180);
    float _1190 = fma(_1160, _1102, _1160);
    float _1192 = fma(_738, _1102, _738);
    float _1194 = fma(_1184, _1186, _1174);
    float _1196 = float(_1188);
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1190);
    float _1200 = _1158 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    float _1204 = fma(_1194, 3.1415927410125732421875, _990);
    float _1206 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1018);
    float _1208 = _1196 * _1172;
    float _1210 = in.m_69.x;
    float _1212 = in.m_69.y;
    float _1214 = in.m_69.z;
    float _1216 = fma(_1192, _716, _1198);
    float _1218 = _1208 * (-2.0);
    float _1220 = _1148 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = _1216 * 0.15915493667125701904296875;
    float _1226 = fma(_504, _1218, _504);
    float _1228 = fma(_1204, _1218, _1204);
    float _1230 = _386 + (-0.5);
    float _1232 = abs(_1202);
    float _1234 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1236 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1228);
    float _1238 = _1148 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _662 + (-1.0);
    float _1244 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1234);
    float _1246 = fma(_1226, _716, _1236);
    float _1248 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[146].x, _968);
    float _1250 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1022);
    float _1252 = -_1244;
    float _1254 = _1252 + _1008;
    float _1256 = _1246 * 0.15915493667125701904296875;
    float _1258 = _1224 * 6.283185482025146484375;
    float _1260 = cos(_1258);
    float _1262 = _1248 * _1210;
    float _1264 = _1250 * _1214;
    float _1266 = _1206 * _1212;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1254);
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1274 = sqrt(_1162);
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1130);
    float _1280 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1282 = _1272 * _1268;
    float _1284 = _1276 * _1270;
    float _1286 = _1280 * _1278;
    float _1288 = _1224 * 6.283185482025146484375;
    float _1290 = sin(_1288);
    float _1292 = _1260 * _1240;
    float _1294 = _1260 * _1222;
    float _1296 = _1256 * 6.283185482025146484375;
    float _1298 = cos(_1296);
    float _1300 = _1242 * _1274;
    float _1302 = _1300 * 0.75;
    float _1304 = _1256 * 6.283185482025146484375;
    float _1306 = sin(_1304);
    float _1308 = _1290 * _1222;
    float _1310 = _1290 * _1240;
    float _1312 = _1302 * 0.15915493667125701904296875;
    float _1314 = _1260 * _1298;
    float _1316 = _1290 * _1298;
    float _1318 = _1240 * _1298;
    float _1320 = _1222 * _1298;
    float _1322 = _1314 * _1284;
    float _1324 = _1316 * _1284;
    float _1326 = _1312 * 6.283185482025146484375;
    float _1328 = sin(_1326);
    float _1330 = fma(_1306, _1292, _1308);
    float _1332 = -_1294;
    float _1334 = fma(_1306, _1310, _1332);
    float _1336 = -_1310;
    float _1338 = fma(_1306, _1294, _1336);
    float _1340 = -_1284;
    float _1342 = _1306 * _1340;
    float _1344 = fma(_1330, _1286, _1322);
    float _1346 = fma(_1306, _1308, _1292);
    float _1348 = fma(_1334, _1286, _1324);
    float _1350 = fma(_1318, _1286, _1342);
    float _1352 = fma(_1338, _1282, _1344);
    float _1354 = _1312 * 6.283185482025146484375;
    float _1356 = cos(_1354);
    float _1358 = fma(_1346, _1282, _1348);
    float _1360 = fma(_1320, _1282, _1350);
    float _1362 = _1352 * _322;
    float _1364 = _1352 * _326;
    float _1366 = fma(_1360, _290, _1362);
    float _1368 = fma(_1360, _294, _1364);
    float _1370 = fma(_1358, _334, _1366);
    float _1372 = fma(_1358, _338, _1368);
    float _1374 = _1370 * _1328;
    float _1376 = _1370 * _1356;
    float _1378 = -_1374;
    float _1380 = fma(_1372, _1356, _1378);
    float _1382 = fma(_1372, _1328, _1376);
    float _1384 = in.m_71.y;
    float _1386 = _914 + _1380;
    float _1388 = _912 + _1382;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1392 = _1386 + _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1396 = _1388 + _1394;
    float _1398 = _1392 * _1392;
    float _1400 = fma(_1396, _1396, _1398);
    float _1402 = sqrt(_1400);
    bool _1404 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = _1402 + _1406;
    float _1410 = _1380;
    float _1412 = _1408;
    float _1414 = _1382;
    float _1416 = _1358;
    float _1418 = _1388;
    if (_1404)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1410 = _1420;
    }
    float _1422 = _1410;
    float _1424 = _1422;
    if (_1404)
    {
        float _1426 = _1408 * _1422;
        _1412 = _1426;
    }
    float _1428 = _1412;
    if (_1404)
    {
        float _1430 = rsqrt(_1400);
        _1424 = _1430;
    }
    float _1432 = _1424;
    float _1434 = _1432;
    if (_1404)
    {
        float _1436 = _1428 * 0.15915493667125701904296875;
        _1414 = _1436;
    }
    float _1438 = _1414;
    float _1440 = _1352 * _312;
    float _1442 = fma(_1360, _286, _1440);
    float _1444 = _1352;
    if (_1404)
    {
        float _1446 = _1438 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = _374 + _1384;
    float _1454 = fma(_1358, _330, _1442);
    float _1456 = _1452 + _1454;
    float _1458 = _1456;
    if (_1404)
    {
        float _1460 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _536 = _1460;
    }
    float _1462 = _536;
    float _1464 = _1450;
    float _1466 = _1462;
    if (_1404)
    {
        float _1468 = fma(_1450, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1416 = _1468;
    }
    float _1470 = _1416;
    if (!_1404)
    {
        _1464 = _1388;
    }
    float _1472 = _1464;
    float _1474 = _1472;
    if (!_1404)
    {
        _1466 = _1386;
    }
    float _1476 = _1466;
    float _1478 = _1476;
    if (_1404)
    {
        float _1480 = _1432 * _1470;
        _1434 = _1480;
    }
    float _1482 = _1434;
    if (_1404)
    {
        float _1484 = fma(_1396, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1474 = _1484;
    }
    float _1486 = _1474;
    float _1488 = _1486;
    if (_1404)
    {
        float _1490 = fma(_1392, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1478 = _1490;
    }
    float _1492 = _1478;
    float _1494 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1496 = _1486 + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1500 = _1492 + _1498;
    float _1502 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1504 = fma(_1500, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5079 = float2(_1502, _1504);
    float _1506 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5079, float2(0.0), isnan(_5079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5079, float2(0.0), isnan(_5079)), level(0.0)).x;
    float _1508 = _1482;
    float _1510 = _1496;
    float _1512 = _1504;
    float _1514 = _1492;
    if (_1404)
    {
        float _1516 = _1438 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        _1508 = _1518;
    }
    float _1520 = _1508;
    bool _1522 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1524 = isnan(0.5);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1530 = _1526 || _1528;
    float _1532 = in.m_63.x;
    float _1534 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1538 = _1520;
    float _1540 = _1536;
    if (_1404)
    {
        float _1542 = _1520 + (-1.0);
        _1510 = _1542;
    }
    float _1544 = _1510;
    float _1546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1548 = _1544;
    if (_1404)
    {
        float _1550 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1550;
    }
    float _1552 = _1548;
    float _1554 = _1552;
    if (_1404)
    {
        float _1556 = fma(_1456, _1520, _1552);
        _1458 = _1556;
    }
    float _1558 = _1458;
    float _1560 = _1558;
    if (!_1530)
    {
        float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1564 = _912 + _1562;
        _1538 = _1564;
    }
    float _1566 = _1538;
    float _1568 = _1566;
    if (!_1530)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1512 = _1570;
    }
    float _1572 = _1512;
    float _1574 = fma(_1506, 100.0, _1452);
    float _1576 = _1506;
    if (!_1530)
    {
        float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1580 = _1574 + _1578;
        _1554 = _1580;
    }
    float _1582 = _1554;
    float _1584 = _1582;
    if (!_1530)
    {
        float _1586 = _1582 * _1582;
        _1418 = _1586;
    }
    float _1588 = _1418;
    if (!_1530)
    {
        float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1592 = _914 + _1590;
        _1584 = _1592;
    }
    float _1594 = _1584;
    float _1596 = _1594;
    if (!_1530)
    {
        float _1598 = fma(_1566, _1566, _1588);
        _1568 = _1598;
    }
    float _1600 = _1568;
    float _1602 = _1600;
    if (!_1530)
    {
        float _1604 = fma(_1594, _1594, _1600);
        _1602 = _1604;
    }
    float _1606 = _1602;
    if (!_1530)
    {
        float _1608 = -_1452;
        float _1610 = _1608 + _1558;
        _1596 = _1610;
    }
    float _1612 = _1596;
    float _1614 = fma(_1506, 100.0, _1558);
    float _1616 = _1606;
    float _1618 = _1614;
    if (!_1530)
    {
        float _1620 = sqrt(_1606);
        _1616 = _1620;
    }
    float _1622 = _1616;
    float _1624 = _1622;
    if (!_1530)
    {
        float _1626 = precise::min(_1622, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1560 = _1626;
    }
    float _1628 = _1560;
    float _1630 = _1628;
    if (!_1530)
    {
        float _1632 = -_914;
        float _1634 = _1632 + _1492;
        _1624 = _1634;
    }
    float _1636 = _1624;
    if (!_1530)
    {
        float _1638 = _1628 * _1572;
        _1576 = _1638;
    }
    float _1640 = _1576;
    if (!_1530)
    {
        float _1642 = -_912;
        float _1644 = _1642 + _1486;
        _1630 = _1644;
    }
    float _1646 = _1630;
    if (!_1530)
    {
        float _1648 = fma(_1612, _1640, _1574);
        _1618 = _1648;
    }
    float _1650 = _1618;
    if (!_1530)
    {
        float _1652 = fma(_1646, _1640, _912);
        _1488 = _1652;
    }
    float _1654 = _1488;
    if (!_1530)
    {
        float _1656 = fma(_1636, _1640, _914);
        _1514 = _1656;
    }
    float _1658 = _1514;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1662 = _1650 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1666 = _1654 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1670 = _1658 + _1668;
    float _1672 = _1662 * _1662;
    float _1674 = fma(_1666, _1666, _1672);
    float _1676 = fma(_1670, _1670, _1674);
    float _1678 = rsqrt(_1676);
    float _1680 = sqrt(_1676);
    float _1682 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1684 = _1666 * _1682;
    float _1686 = _1670 * _1682;
    float _1688 = _1684 * _1684;
    float _1690 = _1686 * _1686;
    float _1692 = _1688 + _1690;
    float _1694 = sqrt(_1692);
    bool _1696 = _1694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1700 = _1694 + _1698;
    float _1702 = _1588;
    float _1704 = _1678;
    float _1706 = _1700;
    float _1708 = _1662;
    float _1710 = _1692;
    if (_1696)
    {
        float _1712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1702 = _1712;
    }
    float _1714 = _1702;
    if (_1696)
    {
        float _1716 = rsqrt(_1692);
        _1704 = _1716;
    }
    float _1718 = _1704;
    float _1720 = _1714;
    float _1722 = _1718;
    if (_1696)
    {
        float _1724 = _1700 * _1714;
        _1706 = _1724;
    }
    float _1726 = _1706;
    if (_1696)
    {
        float _1728 = _1726 * 0.15915493667125701904296875;
        _1720 = _1728;
    }
    float _1730 = _1720;
    float _1732 = _1670;
    float _1734 = _1730;
    if (_1696)
    {
        float _1736 = _1730 * 6.283185482025146484375;
        float _1738 = sin(_1736);
        _1732 = _1738;
    }
    float _1740 = _1732;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1744 = precise::max(0.0, _1742);
    float _1746 = _1438;
    if (_1696)
    {
        float _1748 = _1730 * 6.283185482025146484375;
        float _1750 = cos(_1748);
        _1746 = _1750;
    }
    float _1752 = _1746;
    float _1754 = -_1682;
    float _1756 = -_1744;
    float _1758 = fma(_1662, _1754, _1756);
    float _1760 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1762 = _1760;
    float _1764 = _1758;
    if (_1696)
    {
        float _1766 = _1758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1708 = _1766;
    }
    float _1768 = _1708;
    float _1770 = _1740;
    if (_1696)
    {
        float _1772 = fma(_1740, _1768, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1770 = _1772;
    }
    float _1774 = _1770;
    float _1776 = _1760 * _406;
    float _1778 = _1774;
    if (_1696)
    {
        float _1780 = _1718 * _1774;
        _1710 = _1780;
    }
    float _1782 = _1710;
    float _1784 = _1752;
    if (_1696)
    {
        float _1786 = _1752 + (-1.0);
        _1762 = _1786;
    }
    float _1788 = _1762;
    float _1790 = _1788;
    if (!_1696)
    {
        _1722 = _1684;
    }
    float _1792 = _1722;
    float _1794 = trunc(_1776);
    int _1796 = int(_1794);
    float _1798 = _1792;
    if (_1696)
    {
        float _1800 = _1684 * _1782;
        _1798 = _1800;
    }
    float _1802 = _1798;
    if (_1696)
    {
        float _1804 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1804;
    }
    float _1806 = _1734;
    if (!_1696)
    {
        _1778 = _1686;
    }
    float _1808 = _1778;
    float _1810 = _1808;
    if (_1696)
    {
        float _1812 = _1686 * _1782;
        _1810 = _1812;
    }
    float _1814 = _1810;
    if (!_1696)
    {
        _1790 = _1688;
    }
    float _1816 = _1790;
    float _1818 = _1816;
    if (_1696)
    {
        float _1820 = fma(_1758, _1752, _1806);
        _1764 = _1820;
    }
    float _1822 = _1764;
    if (_1696)
    {
        float _1824 = _1802 * _1802;
        _1818 = _1824;
    }
    float _1826 = _1818;
    if (!_1696)
    {
        _1784 = _1690;
    }
    float _1828 = _1784;
    float _1830 = _1828;
    if (_1696)
    {
        float _1832 = _1814 * _1814;
        _1830 = _1832;
    }
    float _1834 = _1830;
    float _1836 = fma(_1822, _1822, _1826);
    float _1838 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1842 = _1840 != 0;
    float _1844 = _1836 + _1834;
    float _1846 = _1838 * _406;
    int _1848 = _1796 << 4;
    int _1850 = _1848 + 1712;
    float _1852 = rsqrt(_1844);
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1856 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1854);
    float _1858 = precise::clamp(_1856, 0.0, 1.0);
    float _1860 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1862 = _1850 + 8;
    uint _1865 = uint(int(uint(_1862) >> uint(2)));
    uint _1867 = uint(int(uint(int(_1865)) >> uint(2)));
    int _1869 = int(_1865) & 3;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[int(_1867)][_1869];
    float _1873 = -_1858;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1860);
    float _1879 = trunc(_1846);
    int _1881 = int(_1879);
    float _1883 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1877);
    float _1885 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1887 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1889 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1891 = abs(_1875);
    float _1893 = log2(_1891);
    float _1895 = _1852 * _1802;
    float _1897 = _1852 * _1822;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1901 = _1852 * _1814;
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1905 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1899;
    float _1909 = fma(_1907, _1887, 1.0);
    float _1911 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1913 = -_1903;
    float _1915 = fma(_1897, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1913);
    float _1917 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1905);
    float _1919 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1921 = floor(_1534);
    float _1923 = -_1901;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1915);
    float _1927 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1911);
    float _1929 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1917);
    float _1931 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1933 = fma(_1925, -0.5, 0.5);
    float _1935 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1927);
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1939 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1919);
    float _1941 = fma(_1925, 0.5, 0.5);
    float _1943 = exp2(_1931);
    float _1945 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1947 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1949 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1939);
    float _1951 = fma(_1941, -0.0187292993068695068359375, 0.07426099479198455810546875);
    int _1953 = _1881 << 4;
    int _1955 = _1953 + 1968;
    float _1957 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1947);
    float _1959 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1961 = sqrt(_1933);
    float _1963 = -_1921;
    float _1965 = _1534 + _1963;
    float _1967 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1957);
    float _1969 = fma(_1941, _1951, -0.212114393711090087890625);
    float _1971 = _1897 + 1.0;
    float _1973 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1967);
    float _1975 = fma(_1941, _1969, 1.570728778839111328125);
    float _1977 = floor(_1885);
    float _1979 = -_1897;
    float _1981 = fma(_1943, _1971, _1979);
    float _1983 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1985 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1987 = fma(_1981, 0.5, 0.5);
    float _1989 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1985);
    float _1991 = _1961 * 0.636619746685028076171875;
    float _1993 = log2(_1909);
    float _1995 = -_1975;
    float _1997 = fma(_1991, _1995, 1.0);
    float _1999 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1983);
    float _2001 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1989);
    uint _2003 = uint(int(uint(_1850) >> uint(2)));
    uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
    int _2007 = int(_2003) & 3;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[int(_2005)][_2007];
    int _2011 = int(_2003) + 1;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    int _2015 = _2011 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[int(_2013)][_2015];
    float _2019 = -_1977;
    float _2021 = _1885 + _2019;
    float _2023 = 1.0 / _1973;
    float _2025 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1999);
    float _2027 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2001);
    float _2029 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2025);
    float2 _5949 = float2(_2021, _1965);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5949, float2(0.0), isnan(_5949)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5949, float2(0.0), isnan(_5949)), level(0.0)).x;
    float _2033 = _1993 * 0.693147182464599609375;
    float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2037 = uint(int(uint(_1955) >> uint(2)));
    uint _2039 = uint(int(uint(int(_2037)) >> uint(2)));
    int _2041 = int(_2037) & 3;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[int(_2039)][_2041];
    int _2045 = int(_2037) + 1;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    int _2049 = _2045 & 3;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[int(_2047)][_2049];
    float _2053 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2055 = _2029 * _2023;
    float _2057 = _2027 * _2023;
    float _2059 = fma(_2055, 0.5, 0.5);
    float _2061 = fma(_2057, -0.5, 0.5);
    float3 _6007 = float3(_2059, _2061, _2053);
    float _2063 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6007, float3(0.0), isnan(_6007)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6007, float3(0.0), isnan(_6007)), level(0.0)).x;
    float3 _6018 = float3(_2059, _2061, _2053);
    float4 _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6018, float3(0.0), isnan(_6018)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6018, float3(0.0), isnan(_6018)), level(0.0)).xyzw;
    float _2068 = _2066.x;
    float _2070 = _2066.y;
    float _2072 = _2066.z;
    float _2074 = _2066.w;
    float2 _6034 = float2(_1997, _1987);
    float3 _2078 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6034, float2(0.0), isnan(_6034)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6034, float2(0.0), isnan(_6034)), level(0.0)).xyz;
    float _2080 = _2078.x;
    float _2082 = _2078.y;
    float _2084 = _2078.z;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2088 = _2086 != 0;
    int _2090 = _1955 + 8;
    uint _2092 = uint(int(uint(_2090) >> uint(2)));
    uint _2094 = uint(int(uint(int(_2092)) >> uint(2)));
    int _2096 = int(_2092) & 3;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[int(_2094)][_2096];
    int _2100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2102 = _2100 != 0;
    float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2108 = _2106 != 0;
    float _2110 = _552 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2114 = _2112 != 0;
    float _2116 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2118 = _2108 ? as_type<float>(_524) : _400;
    float _2120 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _2122 = _2108;
    int _2124 = as_type<int>(_2061);
    int _2126 = as_type<int>(_1965);
    if (_1842)
    {
        bool _2128 = _406 > 0.5;
        _2122 = _2128;
    }
    bool _2130 = _2122;
    float _2132 = _1532;
    if (_1842)
    {
        float _2134 = -_1532;
        float _2136 = _2134 + 1.0;
        _2124 = as_type<int>(_2136);
    }
    int _2138 = _2124;
    bool _2140 = _386 > 0.5;
    if (_2088)
    {
        float _2142 = -_1532;
        float _2144 = _2142 + 1.0;
        _538 = as_type<int>(_2144);
    }
    int _2146 = _538;
    float _2148 = 0.0;
    if (!_1842)
    {
        _2148 = _1532;
    }
    float _2150 = _2148;
    float _2152 = _608 * (-0.15915493667125701904296875);
    float _2154 = _2150;
    if (_1842)
    {
        float _2156 = _2130 ? as_type<float>(_2138) : _1532;
        _2154 = _2156;
    }
    float _2158 = _2154;
    if (_2102)
    {
        float _2160 = -_1532;
        float _2162 = _2160 + 1.0;
        _2126 = as_type<int>(_2162);
    }
    int _2164 = _2126;
    float _2166 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2168 = _1871;
    int _2170 = as_type<int>(_2017);
    if (!_2088)
    {
        _1540 = _1532;
    }
    float _2172 = _1540;
    float _2174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2176 = fma(_2118, _2120, -0.5);
    float _2178 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2180 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2182 = _2172;
    if (_2088)
    {
        float _2184 = _2140 ? as_type<float>(_2146) : _1532;
        _2182 = _2184;
    }
    float _2186 = _2182;
    float _2188 = _2017 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2190 = _1871 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2192 = _2152 * 6.283185482025146484375;
    float _2194 = sin(_2192);
    if (!_2102)
    {
        _2168 = _1532;
    }
    float _2196 = _2168;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2200 = _2196;
    if (_2102)
    {
        float _2202 = _430 ? as_type<float>(_2164) : _1532;
        _2200 = _2202;
    }
    float _2204 = _2200;
    float _2206 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2208 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2210 = _526 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2114)
    {
        float _2212 = -_1532;
        float _2214 = _2212 + 1.0;
        _2170 = as_type<int>(_2214);
    }
    int _2216 = _2170;
    float _2218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2220 = fma(_2180, _2204, -0.5);
    out.m_73.x = _2178;
    out.m_73.y = _2206;
    out.m_73.z = _2208;
    out.m_73.w = _2198;
    float _2222 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2116);
    if (_2114)
    {
        float _2224 = _430 ? as_type<float>(_2216) : _1532;
        _2132 = _2224;
    }
    float _2226 = _2132;
    float _2228 = in.m_75.x;
    float _2230 = in.m_75.y;
    float _2232 = in.m_75.z;
    float _2234 = -_1244;
    float _2236 = -_1008;
    bool _2238 = _2234 != _2236;
    bool _2240 = isnan(_2234);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan(_2236);
    bool _2246 = _2242 || _2244;
    float _2248 = _2152 * 6.283185482025146484375;
    float _2250 = cos(_2248);
    float _2252 = _2051 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2254 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2256 = _1130 == 0.0;
    bool _2258 = !_2246;
    bool _2260 = _2256 && _2258;
    float _2262 = _2210 * _2104;
    float _2264 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2222);
    float _2266 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2268 = _1140 == 0.0;
    bool _2270 = _2268 && _2260;
    float _2272 = _486 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2274 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2276 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2278 = _2254 * _2035;
    float _2280 = _2272 * _2174;
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2284 = _2194 * _2176;
    float _2286 = _2276 * _2218;
    float _2288 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2290 = _2250 * _2176;
    float _2292 = -_2284;
    float _2294 = fma(_2250, _2220, _2292);
    float _2296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2298 = in.m_77.x;
    float _2300 = in.m_77.y;
    float _2302 = in.m_77.z;
    float _2304 = in.m_77.w;
    float _2306 = _2098 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2308 = fma(_2194, _2220, _2290);
    float _2310 = _2194;
    float _2312 = _2226;
    float _2314 = _2286;
    float _2316 = _2280;
    float _2318 = _2228;
    if (_2270)
    {
        _2310 = _2228;
    }
    float _2320 = _2310;
    out.m_79.x = _2278;
    out.m_79.y = _2262;
    out.m_79.z = _2286;
    out.m_79.w = _2280;
    float _2322 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2324 = fma(_644, _2294, _710);
    float _2326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2328 = _2320;
    if (_2270)
    {
        _712 = _2320;
    }
    float _2330 = _712;
    float _2332 = -_688;
    float _2334 = fma(_706, _2308, _2332);
    float _2336 = _2330;
    if (!_2270)
    {
        _2328 = _2228;
    }
    float _2338 = _2328;
    float _2340 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_2270)
    {
        _2312 = _2230;
    }
    float _2342 = _2312;
    out.m_81.x = _2282;
    out.m_81.y = _2288;
    out.m_81.z = _2322;
    float _2344 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2264);
    float _2346 = _2342;
    if (!_2270)
    {
        float _2348 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2338);
        _2336 = _2348;
    }
    float _2350 = _2336;
    float _2352 = exp2(_2266);
    float _2354 = in.m_83.x;
    if (_2270)
    {
        _2314 = _2232;
    }
    float _2356 = _2314;
    float _2358 = _2324 + 0.5;
    float _2360 = _2356;
    if (_2270)
    {
        _2316 = _2342;
    }
    float _2362 = _2316;
    float _2364 = _2334 + 0.5;
    float _2366 = _2362;
    if (_2270)
    {
        _2318 = _2356;
    }
    float _2368 = _2318;
    float _2370 = _2368;
    if (!_2270)
    {
        _2360 = _2232;
    }
    float _2372 = _2360;
    float _2374 = _2110 * _2296;
    float _2376 = _2302 * _2338;
    if (!_2270)
    {
        _2346 = _2230;
    }
    float _2378 = _2346;
    float _2380 = _2340 * _2326;
    float _2382 = _2300 * _2372;
    float _2384 = -_2376;
    float _2386 = fma(_2298, _2372, _2384);
    if (!_2270)
    {
        float _2388 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2372);
        _2370 = _2388;
    }
    float _2390 = _2370;
    if (!_2270)
    {
        float _2392 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2378);
        _2366 = _2392;
    }
    float _2394 = _2366;
    float _2396 = -_2382;
    float _2398 = fma(_2302, _2378, _2396);
    float _2400 = _2386 * _2304;
    out.m_85.x = _2358;
    out.m_85.y = _2364;
    float _2402 = _2298 * _2378;
    float _2404 = _2398 * _2304;
    float _2406 = _1316 * _2394;
    out.m_87.x = _2380;
    out.m_87.y = _2374;
    float _2408 = -_2402;
    float _2410 = fma(_2300, _2338, _2408);
    float _2412 = -_2352;
    float _2414 = _2412 + 1.0;
    float _2416 = fma(_1334, _2350, _2406);
    out.m_89.x = _2354;
    float _2418 = _2410 * _2304;
    float _2420 = -_2394;
    float _2422 = _1306 * _2420;
    float _2424 = -_2300;
    float _2426 = _1306 * _2424;
    float _2428 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2430 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2432 = isnan(_1680);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2438 = _2434 || _2436;
    float _2440 = -_2400;
    float _2442 = _1306 * _2440;
    float _2444 = fma(_1318, _2350, _2422);
    float _2446 = fma(_1318, _2298, _2426);
    float _2448 = _1314 * _2394;
    float _2450 = fma(_1318, _2404, _2442);
    float _2452 = _1314 * _2300;
    float _2454 = _1314 * _2400;
    float _2456 = _1316 * _2300;
    float _2458 = _1316 * _2400;
    float _2460 = fma(_1330, _2350, _2448);
    float _2462 = fma(_1330, _2298, _2452);
    float _2464 = fma(_1330, _2404, _2454);
    float _2466 = fma(_1334, _2298, _2456);
    float _2468 = fma(_1334, _2404, _2458);
    float _2470 = fma(_1320, _2390, _2444);
    float _2472 = fma(_1338, _2390, _2460);
    float _2474 = fma(_1346, _2390, _2416);
    float _2476 = fma(_1338, _2302, _2462);
    float _2478 = fma(_1338, _2418, _2464);
    float _2480 = fma(_1346, _2302, _2466);
    float _2482 = fma(_1320, _2302, _2446);
    float _2484 = fma(_1346, _2418, _2468);
    float _2486 = fma(_1320, _2418, _2450);
    float _2488 = _2476 * _322;
    float _2490 = _2472 * _322;
    float _2492 = _2478 * _322;
    float _2494 = _2476 * _312;
    float _2496 = _2472 * _312;
    float _2498 = _2478 * _312;
    float _2500 = _2478 * _326;
    float _2502 = _2476 * _326;
    float _2504 = fma(_2486, _290, _2492);
    float _2506 = fma(_2482, _286, _2494);
    float _2508 = fma(_2486, _294, _2500);
    float _2510 = fma(_2486, _286, _2498);
    float _2512 = _2472 * _326;
    float _2514 = fma(_2482, _290, _2488);
    float _2516 = fma(_2484, _338, _2508);
    float _2518 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2520 = fma(_2482, _294, _2502);
    float _2522 = fma(_2480, _334, _2514);
    float _2524 = fma(_2470, _294, _2512);
    float _2526 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2518);
    float _2528 = fma(_2480, _338, _2520);
    float _2530 = fma(_2470, _290, _2490);
    float _2532 = fma(_2470, _286, _2496);
    float _2534 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2526);
    float _2536 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2538 = fma(_2474, _334, _2530);
    float _2540 = fma(_2474, _338, _2524);
    float _2542 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2544 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2536);
    float _2546 = fma(_2484, _334, _2504);
    float _2548 = fma(_2484, _330, _2510);
    float _2550 = 1.0 / _2542;
    float _2552 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2544);
    float _2554 = fma(_2480, _330, _2506);
    out.m_91.x = _2546;
    out.m_91.y = _2548;
    out.m_91.z = _2516;
    float _2556 = _2552 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2558 = fma(_2474, _330, _2532);
    float _2560 = in.m_71.x;
    float _2562 = _2556 + _2542;
    out.m_93.x = _2522;
    out.m_93.y = _2554;
    out.m_93.z = _2528;
    float _2564 = _2562 * _2550;
    float _2566 = _2564 * 0.5;
    out.m_95.x = _2538;
    out.m_95.y = _2558;
    out.m_95.z = _2540;
    float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2570 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2568);
    float _2572 = 1.0 / _2570;
    out.gl_Position.x = _2029;
    out.gl_Position.y = _2027;
    out.gl_Position.z = _2344;
    out.gl_Position.w = _1973;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2576 = _2572 * _2574;
    float _2578 = abs(_2576);
    float _2580 = log2(_2578);
    bool _2582 = _2576 <= 8000.0;
    bool _2584 = isnan(_2576);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan(8000.0);
    bool _2590 = _2586 || _2588;
    float _2592 = float(_2590);
    float _2594 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2596 = exp2(_2594);
    float _2598 = fma(_2596, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2600 = precise::clamp(_2598, 0.0, 1.0);
    float _2602 = _2344 + _1973;
    float _2604 = fma(_2600, -2.0, 3.0);
    float _2606 = _2600 * _2600;
    float _2608 = _2602 * 0.5;
    float _2610 = in.m_83.y;
    float _2612 = _2606 * _2604;
    float _2614 = in.m_83.w;
    float _2616 = -_2612;
    float _2618 = _2616 + 1.0;
    float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2612);
    float _2622 = _2592 * _2620;
    float _2624 = in.m_83.z;
    float _2626 = _2622 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_97.z = _2608;
    out.m_97.w = _1973;
    float _2628 = -_2031;
    float _2630 = _2628 + 1.0;
    out.m_89.y = _2610;
    float _2632 = _2630 * _2626;
    float _2634 = precise::clamp(_2632, 0.0, 1.0);
    out.m_89.w = _2614;
    float _2636 = -_2634;
    float _2638 = fma(_2636, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2640 = _2608;
    float _2642 = _2610;
    if (!_2438)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2644 = _2640;
    float _2646 = _2644;
    float _2648 = _2644;
    if (!_2438)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2650 = _2642;
    float _2652 = _2638 * _2560;
    float _2654 = _2652 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2656 = _2652;
    float _2658 = _2650;
    float _2660 = _2650;
    if (!_2438)
    {
        _2656 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2662 = _2656;
    out.m_89.z = _2624;
    float _2664 = _2428 * _2063;
    float _2666 = -_2428;
    float _2668 = _2666 + 1.0;
    out.m_99.x = _2654;
    float _2670 = _2074 * _2664;
    float _2672 = _2084 * _2664;
    float _2674 = _2074 * _2668;
    float _2676 = _2664;
    float _2678 = _2672;
    float _2680 = _2670;
    float _2682 = _2662;
    float _2684 = _2662;
    if (!_2438)
    {
        _2676 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2686 = _2676;
    float _2688 = fma(_2080, _2670, _2068);
    float _2690 = fma(_2082, _2670, _2070);
    float _2692 = fma(_2074, _2672, _2072);
    float _2694 = _2686;
    float _2696 = _2686;
    if (!_2438)
    {
        _2678 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2698 = _2678;
    float _2700 = _2698;
    float _2702 = _2698;
    if (!_2438)
    {
        _2680 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2704 = _2680;
    out.m_101.x = _2688;
    out.m_101.y = _2690;
    out.m_101.z = _2692;
    out.m_101.w = _2674;
    bool _2706 = !_2438;
    float _2708 = _2704;
    float _2710 = _2704;
    if (!_2706)
    {
        bool _2712 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2714 = isnan(_1680);
        bool _2716 = _2712 || _2714;
        bool _2718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2720 = _2716 || _2718;
        if (!_2720)
        {
            float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2724 = _1680 + _2722;
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2728 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2726;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2734 = 1.0 / _2728;
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2752 = _2724 * _2734;
            float _2754 = precise::clamp(_2752, 0.0, 1.0);
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2760 = fma(_2754, _2732, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2762 = fma(_2754, _2758, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2764 = fma(_2754, _2738, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2766 = fma(_2754, _2742, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2768 = fma(_2754, _2746, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2770 = fma(_2754, _2750, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2648 = _2760;
            _2684 = _2768;
            _2696 = _2764;
            _2710 = _2766;
            _2702 = _2762;
            _2660 = _2770;
            _2772 = true;
        }
        else
        {
            bool _2774 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2776 = isnan(_1680);
            bool _2778 = _2774 || _2776;
            bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2782 = _2778 || _2780;
            if (!_2782)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2784 = _2694;
            _2696 = _2784;
            if (!_2782)
            {
                _2646 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2786 = _2646;
            _2648 = _2786;
            if (!_2782)
            {
                _2700 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2788 = _2700;
            _2702 = _2788;
            if (!_2782)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2790 = _2708;
            _2710 = _2790;
            if (!_2782)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2792 = _2682;
            _2684 = _2792;
            if (!_2782)
            {
                _2658 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2794 = _2658;
            bool _2796 = !_2782;
            _2660 = _2794;
            if (!_2796)
            {
                bool _2798 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2800 = isnan(_1680);
                bool _2802 = _2798 || _2800;
                bool _2804 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2806 = _2802 || _2804;
                if (!_2806)
                {
                    float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2810 = _1680 + _2808;
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2814 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2812;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2820 = 1.0 / _2814;
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2838 = _2810 * _2820;
                    float _2840 = precise::clamp(_2838, 0.0, 1.0);
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2846 = fma(_2840, _2818, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2848 = fma(_2840, _2844, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2850 = fma(_2840, _2824, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2852 = fma(_2840, _2828, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2854 = fma(_2840, _2832, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2856 = fma(_2840, _2836, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2648 = _2846;
                    _2684 = _2854;
                    _2696 = _2850;
                    _2710 = _2852;
                    _2702 = _2848;
                    _2660 = _2856;
                    _2772 = true;
                }
                else
                {
                    _2648 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2702 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2660 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2772 = false;
    float _2858 = _2648;
    float _2860 = _2684;
    float _2862 = _2696;
    float _2864 = _2710;
    float _2866 = _2702;
    float _2868 = _2660;
    float _2870 = fma(_2558, -0.5, 0.5);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = -_2858;
    float _2876 = _2874 + _2860;
    float _2878 = -_2862;
    float _2880 = _2878 + _2864;
    float _2882 = -_2866;
    float _2884 = _2882 + _2868;
    bool _2886 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2888 = fma(_2872, _2876, _2858);
    float _2890 = fma(_2872, _2880, _2862);
    float _2892 = fma(_2872, _2884, _2866);
    float _2894 = _2888 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2896 = fma(_2890, 0.298911988735198974609375, _2894);
    float _2898 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2900 = fma(_2892, 0.114477999508380889892578125, _2896);
    out.m_99.w = _2898;
    float _2902 = -_2900;
    float _2904 = _2890 + _2902;
    float _2906 = -_2900;
    float _2908 = _2888 + _2906;
    float _2910 = -_2900;
    float _2912 = _2892 + _2910;
    out.m_103.x = 0.0;
    float _2914 = fma(_2904, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2916 = fma(_2908, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2918 = fma(_2912, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    out.m_105.x = _2914;
    out.m_105.y = _2916;
    out.m_105.z = _2918;
    if (!_2886)
    {
        return out;
    }
    float _2920 = -_1650;
    float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2924 = -_1654;
    float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2928 = -_1658;
    float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2932 = _2922 * _2922;
    float _2934 = fma(_2926, _2926, _2932);
    float _2936 = fma(_2930, _2930, _2934);
    float _2938 = sqrt(_2936);
    float _2940 = rsqrt(_2936);
    float _2942 = -_2938;
    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2946 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2948 = precise::clamp(_2946, 0.0, 1.0);
    float _2950 = _2926 * _2940;
    float _2952 = _2922 * _2940;
    float _2954 = abs(_2948);
    float _2956 = log2(_2954);
    float _2958 = _2930 * _2940;
    float _2960 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2962 = _2558 * _2952;
    float _2964 = -_2952;
    float _2966 = -_2960;
    float _2968 = fma(_2964, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2966);
    float _2970 = fma(_2538, _2950, _2962);
    float _2972 = -_2958;
    float _2974 = fma(_2972, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2968);
    float _2976 = fma(_2540, _2958, _2970);
    float _2978 = precise::clamp(_2976, 0.0, 1.0);
    float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2982 = _2974 + _2980;
    float _2984 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2988 = precise::clamp(_2986, 0.0, 1.0);
    float _2990 = exp2(_2984);
    float _2992 = _2990 * _2988;
    float _2994 = _2978 * _2992;
    float _2996 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2998 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3000 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2996;
    out.m_103.y = _2998;
    out.m_103.z = _3000;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2772 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_48.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = as_type<float>(_124);
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_51.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_140);
        out.gl_Position.z = _3058;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_53.w;
    float _146 = float(_124);
    float _148 = -_144;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_144);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    bool _162 = _150 >= _146;
    bool _164 = !_160;
    bool _166 = _162 || _164;
    float _168 = _150;
    if (_166)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _132;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _142 = as_type<int>(_172);
    }
    int _174 = _142;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3122 = as_type<float>(_174);
        out.gl_Position.z = _3122;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = 1.0 / _146;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    float _196 = _150 * _182;
    float _198 = _176 * _176;
    float _200 = _178 * _178;
    float _202 = _180 * _180;
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = fma(_194, _194, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = _218;
    float _228 = _188;
    if (_222)
    {
        float _230 = rsqrt(_210);
        _226 = _230;
    }
    float _232 = _226;
    float _234 = 0.0;
    if (!_222)
    {
        _234 = 0.0;
    }
    float _236 = _234;
    bool _238 = _220 > 0.0;
    float _240 = 0.0;
    float _242 = _236;
    if (!_222)
    {
        _240 = 0.0;
    }
    float _244 = _240;
    float _246 = 0.0;
    float _248 = _244;
    if (!_222)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = _216;
    float _254 = _250;
    if (_224)
    {
        float _256 = rsqrt(_212);
        _252 = _256;
    }
    float _258 = _252;
    float _260 = 0.0;
    float _262 = 0.0;
    if (!_224)
    {
        _260 = 0.0;
        _262 = 0.0;
    }
    float _264 = _260;
    float _266 = _262;
    float _268 = 0.0;
    float _270 = _264;
    float _272 = _266;
    if (!_224)
    {
        _268 = 0.0;
    }
    float _274 = _268;
    float _276 = _220;
    float _278 = _274;
    if (_238)
    {
        float _280 = rsqrt(_214);
        _276 = _280;
    }
    float _282 = _276;
    if (_222)
    {
        float _284 = _232 * _176;
        _242 = _284;
    }
    float _286 = _242;
    if (_222)
    {
        float _288 = _232 * _184;
        _248 = _288;
    }
    float _290 = _248;
    if (_222)
    {
        float _292 = _232 * _190;
        _254 = _292;
    }
    float _294 = _254;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _298 = 0.0;
    if (!_238)
    {
        _298 = 0.0;
    }
    float _300 = _298;
    float _302 = 0.0;
    float _304 = _300;
    if (!_238)
    {
        _302 = 0.0;
    }
    float _306 = _302;
    float _308 = _306;
    if (_224)
    {
        float _310 = _258 * _178;
        _278 = _310;
    }
    float _312 = _278;
    float _314 = 0.0;
    if (!_238)
    {
        _314 = 0.0;
    }
    float _316 = _314;
    float _318 = _316;
    if (_224)
    {
        float _320 = _258 * _186;
        _270 = _320;
    }
    float _322 = _270;
    if (_224)
    {
        float _324 = _258 * _192;
        _272 = _324;
    }
    float _326 = _272;
    if (_238)
    {
        float _328 = _282 * _180;
        _304 = _328;
    }
    float _330 = _304;
    if (_238)
    {
        float _332 = _282 * _188;
        _308 = _332;
    }
    float _334 = _308;
    if (_238)
    {
        float _336 = _282 * _194;
        _318 = _336;
    }
    float _338 = _318;
    bool _340 = !_296;
    float _358;
    if (!_340)
    {
        float _342 = in.m_61.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        _358 = _196;
    }
    _360 = false;
    float _362 = _358;
    float _364 = in.m_61.w;
    float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _368 = -_196;
    float _370 = _368 + 1.0;
    float _372 = in.m_48.x;
    float _374 = in.m_48.y;
    float _376 = in.m_48.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _362 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = _362 + _382;
    float _386 = in.m_61.z;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = in.m_61.y;
    float _398 = 1.0 / _390;
    float _400 = in.m_63.y;
    float _402 = _370 * _366;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = in.m_61.x;
    float _408 = 1.0 / _394;
    bool _410 = _364 > 0.5;
    float _412 = _186 * _374;
    float _414 = _384 * _398;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _416;
    float _420 = _196 * _366;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _192 * _374;
    float _426 = fma(_184, _372, _412);
    float _428 = 1.0 / _418;
    bool _430 = _396 > 0.5;
    float _432 = fma(_190, _372, _424);
    float _434 = fma(_188, _376, _426);
    float _436 = _396 + _386;
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = fma(_194, _376, _432);
    float _444 = _386 * 2.0;
    float _446 = _396 * 2.0;
    float _448 = _436 + (-1.0);
    float _450 = _380 * _408;
    float _452 = floor(_444);
    float _454 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _458 = _456 != 0;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _462 = _460 != 0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _466 = _464 != 0;
    float _468 = _406 + _386;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _472 = _470 != 0;
    int _474 = _410 ? as_type<int>(_440) : as_type<int>(_400);
    float _476 = _468 + (-1.0);
    float _478 = floor(_446);
    float _480 = precise::min(_422, _404);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _484 = _362 + _482;
    float _486 = _462 ? as_type<float>(_474) : _400;
    float _488 = _484 * _428;
    float _490 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _492 = log2(_490);
    bool _494 = _452 >= 0.0;
    bool _496 = isnan(_452);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _506 = _452 > 0.0;
    int _508 = _502 ? 0 : 1;
    bool _510 = _386 > 0.5;
    int _512 = _430 ? as_type<int>(_440) : as_type<int>(_400);
    bool _514 = _478 >= 0.0;
    bool _516 = isnan(_478);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    int _524 = _510 ? as_type<int>(_440) : as_type<int>(_400);
    float _526 = _458 ? as_type<float>(_512) : _400;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    bool _530 = _478 > 0.0;
    float _532 = _478;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[94].z;
    float _536 = _374;
    int _538 = as_type<int>(_406);
    if (_472)
    {
        _228 = _406;
    }
    float _540 = _228;
    float _542 = _540;
    if (_472)
    {
        _532 = _396;
    }
    float _544 = _532;
    float _546 = _544;
    if (_472)
    {
        _534 = _386;
    }
    float _548 = _534;
    int _550 = _522 ? 0 : 1;
    float _552 = _466 ? as_type<float>(_524) : _400;
    float _554 = _548;
    if (!_472)
    {
        float _556 = _406 * 3.1415927410125732421875;
        float _558 = _556 * 0.15915493667125701904296875;
        float _560 = _396 * 3.1415927410125732421875;
        float _562 = _560 * 0.15915493667125701904296875;
        float _564 = _386 * 3.1415927410125732421875;
        float _566 = _558 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _564 * 0.15915493667125701904296875;
        float _572 = _562 * 6.283185482025146484375;
        float _574 = sin(_572);
        float _576 = _570 * 6.283185482025146484375;
        float _578 = sin(_576);
        _554 = _578;
        _542 = _568;
        _546 = _574;
    }
    float _580 = _554;
    float _582 = _542;
    float _584 = _546;
    float _586 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[94].z, _528);
    int _588 = ~_508;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _596 = _592;
    if (!_506)
    {
        int _598 = ~_508;
        int _600 = _598 + 1;
        _596 = _600;
    }
    int _602 = _596;
    float _604 = _492 * _150;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _608 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[94].x, _586);
    float _610 = exp2(_604);
    float _612 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[93].z, _606);
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _616 = _582 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _618 = ~_550;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _626 = 1.0 + _624;
    int _628 = _622;
    if (!_530)
    {
        int _630 = ~_550;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = -_614;
    float _638 = fma(_616, 2.0, _636);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _642 = 1.0 / _626;
    float _644 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].z, _612);
    float _646 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[93].w, _640);
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _650 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _652 = isnan(1.0);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _658 = _654 || _656;
    float _660 = _584 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _662 = _406 * 2.0;
    float _664 = -_610;
    float _666 = _664 + 1.0;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    bool _670 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    float _680 = fma(_660, -2.0, _648);
    float _682 = floor(_662);
    float _684 = fma(_668, _396, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _686 = _678 ? _666 : 0.0;
    float _688 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[91].y, _680);
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _700 = _698 != 0;
    float _702 = _406 + _396;
    float _704 = _684 * _150;
    float _706 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].w, _646);
    float _708 = -_150;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[91].x, _638);
    float _712 = _710;
    if (_658)
    {
        float _714 = _686 * _642;
        _168 = _714;
    }
    float _716 = _168;
    bool _718 = !_692;
    int _720 = _718 ? 0 : 1;
    float _722 = _702 + (-1.0);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _734 = _732 != 0;
    float _736 = in.m_57.w;
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _740 = in.m_59.w;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _744 = !_696;
    int _746 = _744 ? 0 : 1;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    bool _752 = !_700;
    int _754 = _752 ? 0 : 1;
    float _756 = _396 + (-0.5);
    bool _758 = !_734;
    int _760 = _758 ? 0 : 1;
    float _762 = fma(_750, _414, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _764 = fma(_406, 6.283185482025146484375, _704);
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _776 = _774 != 0;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _778;
    bool _782 = _682 >= 0.0;
    bool _784 = isnan(_682);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _792;
    float _796 = fma(_780, _414, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _798 = _790 ? 0 : 1;
    float _800 = fma(_794, _414, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _802 = _682 > 0.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _816 = fma(_806, _450, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _818;
    float _822 = fma(_810, _450, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _824;
    float _828 = fma(_814, _450, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _830;
    bool _834 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _836 = isnan(_362);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = _716 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _848 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _850 = isnan(_362);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = fma(_820, _488, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _862 = fma(_826, _488, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _864 = fma(_832, _488, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _866 = _846 * _594;
    float _868 = -_844;
    float _870 = _868 + 1.0;
    bool _872 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _874 = isnan(_362);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -_858;
    float _886 = _884 + 1.0;
    float _888 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[203].x, _866);
    float _890 = _858 * _870;
    bool _892 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _894 = isnan(_362);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _882 * _886;
    float _906 = -_882;
    float _908 = _906 + 1.0;
    float _910 = floor(_888);
    float _912 = _434 + _736;
    float _914 = _442 + _740;
    float _916 = _902 * _908;
    float _918 = _716 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _920 = -_902;
    float _922 = _920 + 1.0;
    float _924 = _888 + 0.25;
    float _926 = _762 * _916;
    float _928 = _796 * _916;
    float _930 = _918 * _742;
    float _932 = floor(_924);
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[143].x, _926);
    float _936 = _800 * _916;
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[143].y, _928);
    float _940 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[203].z, _930);
    float _942 = fma(_816, _904, _934);
    int _944 = ~_798;
    int _946 = _944 + 1;
    int _948 = _946 + 1;
    float _950 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[143].z, _936);
    int _952 = _948;
    if (!_802)
    {
        int _954 = ~_798;
        int _956 = _954 + 1;
        _952 = _956;
    }
    int _958 = _952;
    float _960 = fma(_822, _904, _938);
    bool _962 = !_768;
    int _964 = _962 ? 0 : 1;
    float _966 = _940 + 0.25;
    float _968 = fma(_860, _890, _942);
    float _970 = -_910;
    float _972 = _888 + _970;
    bool _974 = !_772;
    int _976 = _974 ? 0 : 1;
    float _978 = fma(_828, _904, _950);
    int _980 = abs(_964);
    float _982 = floor(_966);
    int _984 = abs(_976);
    float _986 = in.m_65.x;
    float _988 = in.m_65.y;
    float _990 = in.m_65.z;
    bool _992 = _972 >= 0.5;
    bool _994 = isnan(_972);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.5);
    bool _1000 = _996 || _998;
    float _1002 = -_932;
    float _1004 = _924 + _1002;
    float _1006 = float(_602);
    float _1008 = in.m_67.y;
    float _1010 = floor(_940);
    float _1012 = -_480;
    float _1014 = _1012 + 1.0;
    float _1016 = float(_958);
    float _1018 = fma(_862, _890, _960);
    float _1020 = float(_984);
    float _1022 = fma(_864, _890, _978);
    float _1024 = float(_980);
    float _1026 = -_982;
    float _1028 = _966 + _1026;
    bool _1030 = !_730;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _1020 * _1016;
    int _1036 = abs(_746);
    float _1038 = _1024 * _1006;
    float _1040 = _1034 * (-2.0);
    int _1042 = abs(_1032);
    float _1044 = _888 * 6.283185482025146484375;
    float _1046 = -_1010;
    float _1048 = _940 + _1046;
    bool _1050 = !_1000;
    float _1052 = _1050 ? 0.5 : (-0.5);
    float _1054 = fma(_454, _1040, _454);
    float _1056 = _1044 * 0.15915493667125701904296875;
    float _1058 = fma(_1040, _988, _988);
    bool _1060 = _1048 >= 0.5;
    bool _1062 = isnan(_1048);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(0.5);
    bool _1068 = _1064 || _1066;
    float _1070 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1072 = _1070 * 2.0;
    float _1074 = float(_1036);
    float _1076 = _940 * 6.283185482025146484375;
    float _1078 = _1056 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    bool _1082 = !_1068;
    float _1084 = _1082 ? 0.5 : (-0.5);
    float _1086 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1058);
    bool _1088 = _1004 > 0.5;
    float _1090 = _1074 * _1072;
    float _1092 = float(_1042);
    float _1094 = _1076 * 0.15915493667125701904296875;
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1098 = _1096 * 2.0;
    int _1100 = abs(_720);
    float _1102 = _1038 * (-2.0);
    int _1104 = abs(_754);
    float _1106 = _1092 * _1098;
    float _1108 = _1094 * 6.283185482025146484375;
    float _1110 = sin(_1108);
    bool _1112 = !_726;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = fma(_1054, _716, _1086);
    float _1118 = _1004;
    float _1120 = _1028;
    if (_1088)
    {
        float _1122 = -_1004;
        float _1124 = _1122 + 1.0;
        _1118 = _1124;
    }
    float _1126 = _1118;
    float _1128 = float(_1100);
    float _1130 = in.m_67.x;
    int _1132 = abs(_1114);
    float _1134 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1136 = fma(_1126, 4.0, -1.0);
    bool _1138 = _1028 > 0.5;
    float _1140 = in.m_67.z;
    float _1142 = fma(_1128, _1134, _1090);
    float _1144 = float(_1104);
    float _1146 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1148 = _1116 * 0.15915493667125701904296875;
    float _1150 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1152 = fma(_1144, _1146, _1142);
    float _1154 = _914 * _914;
    float _1156 = float(_1132);
    float _1158 = _764 * 0.15915493667125701904296875;
    float _1160 = fma(_1152, 3.1415927410125732421875, _986);
    float _1162 = fma(_912, _912, _1154);
    int _1164 = abs(_760);
    if (_1138)
    {
        float _1166 = -_1028;
        float _1168 = _1166 + 1.0;
        _1120 = _1168;
    }
    float _1170 = _1120;
    float _1172 = float(_634);
    float _1174 = fma(_1156, _1150, _1106);
    float _1176 = fma(_1170, 4.0, -1.0);
    bool _1178 = !_776;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _406 + (-0.5);
    float _1184 = float(_1164);
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1188 = abs(_1180);
    float _1190 = fma(_1160, _1102, _1160);
    float _1192 = fma(_738, _1102, _738);
    float _1194 = fma(_1184, _1186, _1174);
    float _1196 = float(_1188);
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1190);
    float _1200 = _1158 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    float _1204 = fma(_1194, 3.1415927410125732421875, _990);
    float _1206 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1018);
    float _1208 = _1196 * _1172;
    float _1210 = in.m_69.x;
    float _1212 = in.m_69.y;
    float _1214 = in.m_69.z;
    float _1216 = fma(_1192, _716, _1198);
    float _1218 = _1208 * (-2.0);
    float _1220 = _1148 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = _1216 * 0.15915493667125701904296875;
    float _1226 = fma(_504, _1218, _504);
    float _1228 = fma(_1204, _1218, _1204);
    float _1230 = _386 + (-0.5);
    float _1232 = abs(_1202);
    float _1234 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1236 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1228);
    float _1238 = _1148 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _662 + (-1.0);
    float _1244 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1234);
    float _1246 = fma(_1226, _716, _1236);
    float _1248 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[146].x, _968);
    float _1250 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1022);
    float _1252 = -_1244;
    float _1254 = _1252 + _1008;
    float _1256 = _1246 * 0.15915493667125701904296875;
    float _1258 = _1224 * 6.283185482025146484375;
    float _1260 = cos(_1258);
    float _1262 = _1248 * _1210;
    float _1264 = _1250 * _1214;
    float _1266 = _1206 * _1212;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1254);
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1274 = sqrt(_1162);
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1130);
    float _1280 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1282 = _1272 * _1268;
    float _1284 = _1276 * _1270;
    float _1286 = _1280 * _1278;
    float _1288 = _1224 * 6.283185482025146484375;
    float _1290 = sin(_1288);
    float _1292 = _1260 * _1240;
    float _1294 = _1260 * _1222;
    float _1296 = _1256 * 6.283185482025146484375;
    float _1298 = cos(_1296);
    float _1300 = _1242 * _1274;
    float _1302 = _1300 * 0.75;
    float _1304 = _1256 * 6.283185482025146484375;
    float _1306 = sin(_1304);
    float _1308 = _1290 * _1222;
    float _1310 = _1290 * _1240;
    float _1312 = _1302 * 0.15915493667125701904296875;
    float _1314 = _1260 * _1298;
    float _1316 = _1290 * _1298;
    float _1318 = _1240 * _1298;
    float _1320 = _1222 * _1298;
    float _1322 = _1314 * _1284;
    float _1324 = _1316 * _1284;
    float _1326 = _1312 * 6.283185482025146484375;
    float _1328 = sin(_1326);
    float _1330 = fma(_1306, _1292, _1308);
    float _1332 = -_1294;
    float _1334 = fma(_1306, _1310, _1332);
    float _1336 = -_1310;
    float _1338 = fma(_1306, _1294, _1336);
    float _1340 = -_1284;
    float _1342 = _1306 * _1340;
    float _1344 = fma(_1330, _1286, _1322);
    float _1346 = fma(_1306, _1308, _1292);
    float _1348 = fma(_1334, _1286, _1324);
    float _1350 = fma(_1318, _1286, _1342);
    float _1352 = fma(_1338, _1282, _1344);
    float _1354 = _1312 * 6.283185482025146484375;
    float _1356 = cos(_1354);
    float _1358 = fma(_1346, _1282, _1348);
    float _1360 = fma(_1320, _1282, _1350);
    float _1362 = _1352 * _322;
    float _1364 = _1352 * _326;
    float _1366 = fma(_1360, _290, _1362);
    float _1368 = fma(_1360, _294, _1364);
    float _1370 = fma(_1358, _334, _1366);
    float _1372 = fma(_1358, _338, _1368);
    float _1374 = _1370 * _1328;
    float _1376 = _1370 * _1356;
    float _1378 = -_1374;
    float _1380 = fma(_1372, _1356, _1378);
    float _1382 = fma(_1372, _1328, _1376);
    float _1384 = in.m_71.y;
    float _1386 = _914 + _1380;
    float _1388 = _912 + _1382;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1392 = _1386 + _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1396 = _1388 + _1394;
    float _1398 = _1392 * _1392;
    float _1400 = fma(_1396, _1396, _1398);
    float _1402 = sqrt(_1400);
    bool _1404 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = _1402 + _1406;
    float _1410 = _1380;
    float _1412 = _1408;
    float _1414 = _1382;
    float _1416 = _1358;
    float _1418 = _1388;
    if (_1404)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1410 = _1420;
    }
    float _1422 = _1410;
    float _1424 = _1422;
    if (_1404)
    {
        float _1426 = _1408 * _1422;
        _1412 = _1426;
    }
    float _1428 = _1412;
    if (_1404)
    {
        float _1430 = rsqrt(_1400);
        _1424 = _1430;
    }
    float _1432 = _1424;
    float _1434 = _1432;
    if (_1404)
    {
        float _1436 = _1428 * 0.15915493667125701904296875;
        _1414 = _1436;
    }
    float _1438 = _1414;
    float _1440 = _1352 * _312;
    float _1442 = fma(_1360, _286, _1440);
    float _1444 = _1352;
    if (_1404)
    {
        float _1446 = _1438 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = _374 + _1384;
    float _1454 = fma(_1358, _330, _1442);
    float _1456 = _1452 + _1454;
    float _1458 = _1456;
    if (_1404)
    {
        float _1460 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _536 = _1460;
    }
    float _1462 = _536;
    float _1464 = _1450;
    float _1466 = _1462;
    if (_1404)
    {
        float _1468 = fma(_1450, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1416 = _1468;
    }
    float _1470 = _1416;
    if (!_1404)
    {
        _1464 = _1388;
    }
    float _1472 = _1464;
    float _1474 = _1472;
    if (!_1404)
    {
        _1466 = _1386;
    }
    float _1476 = _1466;
    float _1478 = _1476;
    if (_1404)
    {
        float _1480 = _1432 * _1470;
        _1434 = _1480;
    }
    float _1482 = _1434;
    if (_1404)
    {
        float _1484 = fma(_1396, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1474 = _1484;
    }
    float _1486 = _1474;
    float _1488 = _1486;
    if (_1404)
    {
        float _1490 = fma(_1392, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1478 = _1490;
    }
    float _1492 = _1478;
    float _1494 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1496 = _1486 + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1500 = _1492 + _1498;
    float _1502 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1504 = fma(_1500, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5079 = float2(_1502, _1504);
    float _1506 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5079, float2(0.0), isnan(_5079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5079, float2(0.0), isnan(_5079)), level(0.0)).x;
    float _1508 = _1482;
    float _1510 = _1496;
    float _1512 = _1504;
    float _1514 = _1492;
    if (_1404)
    {
        float _1516 = _1438 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        _1508 = _1518;
    }
    float _1520 = _1508;
    bool _1522 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1524 = isnan(0.5);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1530 = _1526 || _1528;
    float _1532 = in.m_63.x;
    float _1534 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1538 = _1520;
    float _1540 = _1536;
    if (_1404)
    {
        float _1542 = _1520 + (-1.0);
        _1510 = _1542;
    }
    float _1544 = _1510;
    float _1546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1548 = _1544;
    if (_1404)
    {
        float _1550 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1550;
    }
    float _1552 = _1548;
    float _1554 = _1552;
    if (_1404)
    {
        float _1556 = fma(_1456, _1520, _1552);
        _1458 = _1556;
    }
    float _1558 = _1458;
    float _1560 = _1558;
    if (!_1530)
    {
        float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1564 = _912 + _1562;
        _1538 = _1564;
    }
    float _1566 = _1538;
    float _1568 = _1566;
    if (!_1530)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1512 = _1570;
    }
    float _1572 = _1512;
    float _1574 = fma(_1506, 100.0, _1452);
    float _1576 = _1506;
    if (!_1530)
    {
        float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1580 = _1574 + _1578;
        _1554 = _1580;
    }
    float _1582 = _1554;
    float _1584 = _1582;
    if (!_1530)
    {
        float _1586 = _1582 * _1582;
        _1418 = _1586;
    }
    float _1588 = _1418;
    if (!_1530)
    {
        float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1592 = _914 + _1590;
        _1584 = _1592;
    }
    float _1594 = _1584;
    float _1596 = _1594;
    if (!_1530)
    {
        float _1598 = fma(_1566, _1566, _1588);
        _1568 = _1598;
    }
    float _1600 = _1568;
    float _1602 = _1600;
    if (!_1530)
    {
        float _1604 = fma(_1594, _1594, _1600);
        _1602 = _1604;
    }
    float _1606 = _1602;
    if (!_1530)
    {
        float _1608 = -_1452;
        float _1610 = _1608 + _1558;
        _1596 = _1610;
    }
    float _1612 = _1596;
    float _1614 = fma(_1506, 100.0, _1558);
    float _1616 = _1606;
    float _1618 = _1614;
    if (!_1530)
    {
        float _1620 = sqrt(_1606);
        _1616 = _1620;
    }
    float _1622 = _1616;
    float _1624 = _1622;
    if (!_1530)
    {
        float _1626 = precise::min(_1622, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1560 = _1626;
    }
    float _1628 = _1560;
    float _1630 = _1628;
    if (!_1530)
    {
        float _1632 = -_914;
        float _1634 = _1632 + _1492;
        _1624 = _1634;
    }
    float _1636 = _1624;
    if (!_1530)
    {
        float _1638 = _1628 * _1572;
        _1576 = _1638;
    }
    float _1640 = _1576;
    if (!_1530)
    {
        float _1642 = -_912;
        float _1644 = _1642 + _1486;
        _1630 = _1644;
    }
    float _1646 = _1630;
    if (!_1530)
    {
        float _1648 = fma(_1612, _1640, _1574);
        _1618 = _1648;
    }
    float _1650 = _1618;
    if (!_1530)
    {
        float _1652 = fma(_1646, _1640, _912);
        _1488 = _1652;
    }
    float _1654 = _1488;
    if (!_1530)
    {
        float _1656 = fma(_1636, _1640, _914);
        _1514 = _1656;
    }
    float _1658 = _1514;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1662 = _1650 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1666 = _1654 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1670 = _1658 + _1668;
    float _1672 = _1662 * _1662;
    float _1674 = fma(_1666, _1666, _1672);
    float _1676 = fma(_1670, _1670, _1674);
    float _1678 = rsqrt(_1676);
    float _1680 = sqrt(_1676);
    float _1682 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1684 = _1666 * _1682;
    float _1686 = _1670 * _1682;
    float _1688 = _1684 * _1684;
    float _1690 = _1686 * _1686;
    float _1692 = _1688 + _1690;
    float _1694 = sqrt(_1692);
    bool _1696 = _1694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1700 = _1694 + _1698;
    float _1702 = _1588;
    float _1704 = _1678;
    float _1706 = _1700;
    float _1708 = _1662;
    float _1710 = _1692;
    if (_1696)
    {
        float _1712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1702 = _1712;
    }
    float _1714 = _1702;
    if (_1696)
    {
        float _1716 = rsqrt(_1692);
        _1704 = _1716;
    }
    float _1718 = _1704;
    float _1720 = _1714;
    float _1722 = _1718;
    if (_1696)
    {
        float _1724 = _1700 * _1714;
        _1706 = _1724;
    }
    float _1726 = _1706;
    if (_1696)
    {
        float _1728 = _1726 * 0.15915493667125701904296875;
        _1720 = _1728;
    }
    float _1730 = _1720;
    float _1732 = _1670;
    float _1734 = _1730;
    if (_1696)
    {
        float _1736 = _1730 * 6.283185482025146484375;
        float _1738 = sin(_1736);
        _1732 = _1738;
    }
    float _1740 = _1732;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1744 = precise::max(0.0, _1742);
    float _1746 = _1438;
    if (_1696)
    {
        float _1748 = _1730 * 6.283185482025146484375;
        float _1750 = cos(_1748);
        _1746 = _1750;
    }
    float _1752 = _1746;
    float _1754 = -_1682;
    float _1756 = -_1744;
    float _1758 = fma(_1662, _1754, _1756);
    float _1760 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1762 = _1760;
    float _1764 = _1758;
    if (_1696)
    {
        float _1766 = _1758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1708 = _1766;
    }
    float _1768 = _1708;
    float _1770 = _1740;
    if (_1696)
    {
        float _1772 = fma(_1740, _1768, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1770 = _1772;
    }
    float _1774 = _1770;
    float _1776 = _1760 * _406;
    float _1778 = _1774;
    if (_1696)
    {
        float _1780 = _1718 * _1774;
        _1710 = _1780;
    }
    float _1782 = _1710;
    float _1784 = _1752;
    if (_1696)
    {
        float _1786 = _1752 + (-1.0);
        _1762 = _1786;
    }
    float _1788 = _1762;
    float _1790 = _1788;
    if (!_1696)
    {
        _1722 = _1684;
    }
    float _1792 = _1722;
    float _1794 = trunc(_1776);
    int _1796 = int(_1794);
    float _1798 = _1792;
    if (_1696)
    {
        float _1800 = _1684 * _1782;
        _1798 = _1800;
    }
    float _1802 = _1798;
    if (_1696)
    {
        float _1804 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1804;
    }
    float _1806 = _1734;
    if (!_1696)
    {
        _1778 = _1686;
    }
    float _1808 = _1778;
    float _1810 = _1808;
    if (_1696)
    {
        float _1812 = _1686 * _1782;
        _1810 = _1812;
    }
    float _1814 = _1810;
    if (!_1696)
    {
        _1790 = _1688;
    }
    float _1816 = _1790;
    float _1818 = _1816;
    if (_1696)
    {
        float _1820 = fma(_1758, _1752, _1806);
        _1764 = _1820;
    }
    float _1822 = _1764;
    if (_1696)
    {
        float _1824 = _1802 * _1802;
        _1818 = _1824;
    }
    float _1826 = _1818;
    if (!_1696)
    {
        _1784 = _1690;
    }
    float _1828 = _1784;
    float _1830 = _1828;
    if (_1696)
    {
        float _1832 = _1814 * _1814;
        _1830 = _1832;
    }
    float _1834 = _1830;
    float _1836 = fma(_1822, _1822, _1826);
    float _1838 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1842 = _1840 != 0;
    float _1844 = _1836 + _1834;
    float _1846 = _1838 * _406;
    int _1848 = _1796 << 4;
    int _1850 = _1848 + 1712;
    float _1852 = rsqrt(_1844);
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1856 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1854);
    float _1858 = precise::clamp(_1856, 0.0, 1.0);
    float _1860 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1862 = _1850 + 8;
    uint _1865 = uint(int(uint(_1862) >> uint(2)));
    uint _1867 = uint(int(uint(int(_1865)) >> uint(2)));
    int _1869 = int(_1865) & 3;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[int(_1867)][_1869];
    float _1873 = -_1858;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1860);
    float _1879 = trunc(_1846);
    int _1881 = int(_1879);
    float _1883 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1877);
    float _1885 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1887 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1889 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1891 = abs(_1875);
    float _1893 = log2(_1891);
    float _1895 = _1852 * _1802;
    float _1897 = _1852 * _1822;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1901 = _1852 * _1814;
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1905 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1899;
    float _1909 = fma(_1907, _1887, 1.0);
    float _1911 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1913 = -_1903;
    float _1915 = fma(_1897, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1913);
    float _1917 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1905);
    float _1919 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1921 = floor(_1534);
    float _1923 = -_1901;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1915);
    float _1927 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1911);
    float _1929 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1917);
    float _1931 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1933 = fma(_1925, -0.5, 0.5);
    float _1935 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1927);
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1939 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1919);
    float _1941 = fma(_1925, 0.5, 0.5);
    float _1943 = exp2(_1931);
    float _1945 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1947 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1949 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1939);
    float _1951 = fma(_1941, -0.0187292993068695068359375, 0.07426099479198455810546875);
    int _1953 = _1881 << 4;
    int _1955 = _1953 + 1968;
    float _1957 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1947);
    float _1959 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1961 = sqrt(_1933);
    float _1963 = -_1921;
    float _1965 = _1534 + _1963;
    float _1967 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1957);
    float _1969 = fma(_1941, _1951, -0.212114393711090087890625);
    float _1971 = _1897 + 1.0;
    float _1973 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1967);
    float _1975 = fma(_1941, _1969, 1.570728778839111328125);
    float _1977 = floor(_1885);
    float _1979 = -_1897;
    float _1981 = fma(_1943, _1971, _1979);
    float _1983 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1985 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1987 = fma(_1981, 0.5, 0.5);
    float _1989 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1985);
    float _1991 = _1961 * 0.636619746685028076171875;
    float _1993 = log2(_1909);
    float _1995 = -_1975;
    float _1997 = fma(_1991, _1995, 1.0);
    float _1999 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1983);
    float _2001 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1989);
    uint _2003 = uint(int(uint(_1850) >> uint(2)));
    uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
    int _2007 = int(_2003) & 3;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[int(_2005)][_2007];
    int _2011 = int(_2003) + 1;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    int _2015 = _2011 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[int(_2013)][_2015];
    float _2019 = -_1977;
    float _2021 = _1885 + _2019;
    float _2023 = 1.0 / _1973;
    float _2025 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1999);
    float _2027 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2001);
    float _2029 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2025);
    float2 _5949 = float2(_2021, _1965);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5949, float2(0.0), isnan(_5949)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5949, float2(0.0), isnan(_5949)), level(0.0)).x;
    float _2033 = _1993 * 0.693147182464599609375;
    float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2037 = uint(int(uint(_1955) >> uint(2)));
    uint _2039 = uint(int(uint(int(_2037)) >> uint(2)));
    int _2041 = int(_2037) & 3;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[int(_2039)][_2041];
    int _2045 = int(_2037) + 1;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    int _2049 = _2045 & 3;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[int(_2047)][_2049];
    float _2053 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2055 = _2029 * _2023;
    float _2057 = _2027 * _2023;
    float _2059 = fma(_2055, 0.5, 0.5);
    float _2061 = fma(_2057, -0.5, 0.5);
    float3 _6007 = float3(_2059, _2061, _2053);
    float _2063 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6007, float3(0.0), isnan(_6007)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6007, float3(0.0), isnan(_6007)), level(0.0)).x;
    float3 _6018 = float3(_2059, _2061, _2053);
    float4 _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6018, float3(0.0), isnan(_6018)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6018, float3(0.0), isnan(_6018)), level(0.0)).xyzw;
    float _2068 = _2066.x;
    float _2070 = _2066.y;
    float _2072 = _2066.z;
    float _2074 = _2066.w;
    float2 _6034 = float2(_1997, _1987);
    float3 _2078 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6034, float2(0.0), isnan(_6034)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6034, float2(0.0), isnan(_6034)), level(0.0)).xyz;
    float _2080 = _2078.x;
    float _2082 = _2078.y;
    float _2084 = _2078.z;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2088 = _2086 != 0;
    int _2090 = _1955 + 8;
    uint _2092 = uint(int(uint(_2090) >> uint(2)));
    uint _2094 = uint(int(uint(int(_2092)) >> uint(2)));
    int _2096 = int(_2092) & 3;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[int(_2094)][_2096];
    int _2100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2102 = _2100 != 0;
    float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2108 = _2106 != 0;
    float _2110 = _552 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2114 = _2112 != 0;
    float _2116 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2118 = _2108 ? as_type<float>(_524) : _400;
    float _2120 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _2122 = _2108;
    int _2124 = as_type<int>(_2061);
    int _2126 = as_type<int>(_1965);
    if (_1842)
    {
        bool _2128 = _406 > 0.5;
        _2122 = _2128;
    }
    bool _2130 = _2122;
    float _2132 = _1532;
    if (_1842)
    {
        float _2134 = -_1532;
        float _2136 = _2134 + 1.0;
        _2124 = as_type<int>(_2136);
    }
    int _2138 = _2124;
    bool _2140 = _386 > 0.5;
    if (_2088)
    {
        float _2142 = -_1532;
        float _2144 = _2142 + 1.0;
        _538 = as_type<int>(_2144);
    }
    int _2146 = _538;
    float _2148 = 0.0;
    if (!_1842)
    {
        _2148 = _1532;
    }
    float _2150 = _2148;
    float _2152 = _608 * (-0.15915493667125701904296875);
    float _2154 = _2150;
    if (_1842)
    {
        float _2156 = _2130 ? as_type<float>(_2138) : _1532;
        _2154 = _2156;
    }
    float _2158 = _2154;
    if (_2102)
    {
        float _2160 = -_1532;
        float _2162 = _2160 + 1.0;
        _2126 = as_type<int>(_2162);
    }
    int _2164 = _2126;
    float _2166 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2168 = _1871;
    int _2170 = as_type<int>(_2017);
    if (!_2088)
    {
        _1540 = _1532;
    }
    float _2172 = _1540;
    float _2174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2176 = fma(_2118, _2120, -0.5);
    float _2178 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2180 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2182 = _2172;
    if (_2088)
    {
        float _2184 = _2140 ? as_type<float>(_2146) : _1532;
        _2182 = _2184;
    }
    float _2186 = _2182;
    float _2188 = _2017 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2190 = _1871 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2192 = _2152 * 6.283185482025146484375;
    float _2194 = sin(_2192);
    if (!_2102)
    {
        _2168 = _1532;
    }
    float _2196 = _2168;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2200 = _2196;
    if (_2102)
    {
        float _2202 = _430 ? as_type<float>(_2164) : _1532;
        _2200 = _2202;
    }
    float _2204 = _2200;
    float _2206 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2208 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2210 = _526 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2114)
    {
        float _2212 = -_1532;
        float _2214 = _2212 + 1.0;
        _2170 = as_type<int>(_2214);
    }
    int _2216 = _2170;
    float _2218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2220 = fma(_2180, _2204, -0.5);
    out.m_73.x = _2178;
    out.m_73.y = _2206;
    out.m_73.z = _2208;
    out.m_73.w = _2198;
    float _2222 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2116);
    if (_2114)
    {
        float _2224 = _430 ? as_type<float>(_2216) : _1532;
        _2132 = _2224;
    }
    float _2226 = _2132;
    float _2228 = in.m_75.x;
    float _2230 = in.m_75.y;
    float _2232 = in.m_75.z;
    float _2234 = -_1244;
    float _2236 = -_1008;
    bool _2238 = _2234 != _2236;
    bool _2240 = isnan(_2234);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan(_2236);
    bool _2246 = _2242 || _2244;
    float _2248 = _2152 * 6.283185482025146484375;
    float _2250 = cos(_2248);
    float _2252 = _2051 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2254 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2256 = _1130 == 0.0;
    bool _2258 = !_2246;
    bool _2260 = _2256 && _2258;
    float _2262 = _2210 * _2104;
    float _2264 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2222);
    float _2266 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2268 = _1140 == 0.0;
    bool _2270 = _2268 && _2260;
    float _2272 = _486 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2274 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2276 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2278 = _2254 * _2035;
    float _2280 = _2272 * _2174;
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2284 = _2194 * _2176;
    float _2286 = _2276 * _2218;
    float _2288 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2290 = _2250 * _2176;
    float _2292 = -_2284;
    float _2294 = fma(_2250, _2220, _2292);
    float _2296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2298 = in.m_77.x;
    float _2300 = in.m_77.y;
    float _2302 = in.m_77.z;
    float _2304 = in.m_77.w;
    float _2306 = _2098 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2308 = fma(_2194, _2220, _2290);
    float _2310 = _2194;
    float _2312 = _2226;
    float _2314 = _2286;
    float _2316 = _2280;
    float _2318 = _2228;
    if (_2270)
    {
        _2310 = _2228;
    }
    float _2320 = _2310;
    out.m_79.x = _2278;
    out.m_79.y = _2262;
    out.m_79.z = _2286;
    out.m_79.w = _2280;
    float _2322 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2324 = fma(_644, _2294, _710);
    float _2326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2328 = _2320;
    if (_2270)
    {
        _712 = _2320;
    }
    float _2330 = _712;
    float _2332 = -_688;
    float _2334 = fma(_706, _2308, _2332);
    float _2336 = _2330;
    if (!_2270)
    {
        _2328 = _2228;
    }
    float _2338 = _2328;
    float _2340 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_2270)
    {
        _2312 = _2230;
    }
    float _2342 = _2312;
    out.m_81.x = _2282;
    out.m_81.y = _2288;
    out.m_81.z = _2322;
    float _2344 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2264);
    float _2346 = _2342;
    if (!_2270)
    {
        float _2348 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2338);
        _2336 = _2348;
    }
    float _2350 = _2336;
    float _2352 = exp2(_2266);
    float _2354 = in.m_83.x;
    if (_2270)
    {
        _2314 = _2232;
    }
    float _2356 = _2314;
    float _2358 = _2324 + 0.5;
    float _2360 = _2356;
    if (_2270)
    {
        _2316 = _2342;
    }
    float _2362 = _2316;
    float _2364 = _2334 + 0.5;
    float _2366 = _2362;
    if (_2270)
    {
        _2318 = _2356;
    }
    float _2368 = _2318;
    float _2370 = _2368;
    if (!_2270)
    {
        _2360 = _2232;
    }
    float _2372 = _2360;
    float _2374 = _2110 * _2296;
    float _2376 = _2302 * _2338;
    if (!_2270)
    {
        _2346 = _2230;
    }
    float _2378 = _2346;
    float _2380 = _2340 * _2326;
    float _2382 = _2300 * _2372;
    float _2384 = -_2376;
    float _2386 = fma(_2298, _2372, _2384);
    if (!_2270)
    {
        float _2388 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2372);
        _2370 = _2388;
    }
    float _2390 = _2370;
    if (!_2270)
    {
        float _2392 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2378);
        _2366 = _2392;
    }
    float _2394 = _2366;
    float _2396 = -_2382;
    float _2398 = fma(_2302, _2378, _2396);
    float _2400 = _2386 * _2304;
    out.m_85.x = _2358;
    out.m_85.y = _2364;
    float _2402 = _2298 * _2378;
    float _2404 = _2398 * _2304;
    float _2406 = _1316 * _2394;
    out.m_87.x = _2380;
    out.m_87.y = _2374;
    float _2408 = -_2402;
    float _2410 = fma(_2300, _2338, _2408);
    float _2412 = -_2352;
    float _2414 = _2412 + 1.0;
    float _2416 = fma(_1334, _2350, _2406);
    out.m_89.x = _2354;
    float _2418 = _2410 * _2304;
    float _2420 = -_2394;
    float _2422 = _1306 * _2420;
    float _2424 = -_2300;
    float _2426 = _1306 * _2424;
    float _2428 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2430 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2432 = isnan(_1680);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2438 = _2434 || _2436;
    float _2440 = -_2400;
    float _2442 = _1306 * _2440;
    float _2444 = fma(_1318, _2350, _2422);
    float _2446 = fma(_1318, _2298, _2426);
    float _2448 = _1314 * _2394;
    float _2450 = fma(_1318, _2404, _2442);
    float _2452 = _1314 * _2300;
    float _2454 = _1314 * _2400;
    float _2456 = _1316 * _2300;
    float _2458 = _1316 * _2400;
    float _2460 = fma(_1330, _2350, _2448);
    float _2462 = fma(_1330, _2298, _2452);
    float _2464 = fma(_1330, _2404, _2454);
    float _2466 = fma(_1334, _2298, _2456);
    float _2468 = fma(_1334, _2404, _2458);
    float _2470 = fma(_1320, _2390, _2444);
    float _2472 = fma(_1338, _2390, _2460);
    float _2474 = fma(_1346, _2390, _2416);
    float _2476 = fma(_1338, _2302, _2462);
    float _2478 = fma(_1338, _2418, _2464);
    float _2480 = fma(_1346, _2302, _2466);
    float _2482 = fma(_1320, _2302, _2446);
    float _2484 = fma(_1346, _2418, _2468);
    float _2486 = fma(_1320, _2418, _2450);
    float _2488 = _2476 * _322;
    float _2490 = _2472 * _322;
    float _2492 = _2478 * _322;
    float _2494 = _2476 * _312;
    float _2496 = _2472 * _312;
    float _2498 = _2478 * _312;
    float _2500 = _2478 * _326;
    float _2502 = _2476 * _326;
    float _2504 = fma(_2486, _290, _2492);
    float _2506 = fma(_2482, _286, _2494);
    float _2508 = fma(_2486, _294, _2500);
    float _2510 = fma(_2486, _286, _2498);
    float _2512 = _2472 * _326;
    float _2514 = fma(_2482, _290, _2488);
    float _2516 = fma(_2484, _338, _2508);
    float _2518 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2520 = fma(_2482, _294, _2502);
    float _2522 = fma(_2480, _334, _2514);
    float _2524 = fma(_2470, _294, _2512);
    float _2526 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2518);
    float _2528 = fma(_2480, _338, _2520);
    float _2530 = fma(_2470, _290, _2490);
    float _2532 = fma(_2470, _286, _2496);
    float _2534 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2526);
    float _2536 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2538 = fma(_2474, _334, _2530);
    float _2540 = fma(_2474, _338, _2524);
    float _2542 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2544 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2536);
    float _2546 = fma(_2484, _334, _2504);
    float _2548 = fma(_2484, _330, _2510);
    float _2550 = 1.0 / _2542;
    float _2552 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2544);
    float _2554 = fma(_2480, _330, _2506);
    out.m_91.x = _2546;
    out.m_91.y = _2548;
    out.m_91.z = _2516;
    float _2556 = _2552 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2558 = fma(_2474, _330, _2532);
    float _2560 = in.m_71.x;
    float _2562 = _2556 + _2542;
    out.m_93.x = _2522;
    out.m_93.y = _2554;
    out.m_93.z = _2528;
    float _2564 = _2562 * _2550;
    float _2566 = _2564 * 0.5;
    out.m_95.x = _2538;
    out.m_95.y = _2558;
    out.m_95.z = _2540;
    float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2570 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2568);
    float _2572 = 1.0 / _2570;
    out.gl_Position.x = _2029;
    out.gl_Position.y = _2027;
    out.gl_Position.z = _2344;
    out.gl_Position.w = _1973;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2576 = _2572 * _2574;
    float _2578 = abs(_2576);
    float _2580 = log2(_2578);
    bool _2582 = _2576 <= 8000.0;
    bool _2584 = isnan(_2576);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan(8000.0);
    bool _2590 = _2586 || _2588;
    float _2592 = float(_2590);
    float _2594 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2596 = exp2(_2594);
    float _2598 = fma(_2596, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2600 = precise::clamp(_2598, 0.0, 1.0);
    float _2602 = _2344 + _1973;
    float _2604 = fma(_2600, -2.0, 3.0);
    float _2606 = _2600 * _2600;
    float _2608 = _2602 * 0.5;
    float _2610 = in.m_83.y;
    float _2612 = _2606 * _2604;
    float _2614 = in.m_83.w;
    float _2616 = -_2612;
    float _2618 = _2616 + 1.0;
    float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2612);
    float _2622 = _2592 * _2620;
    float _2624 = in.m_83.z;
    float _2626 = _2622 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_97.z = _2608;
    out.m_97.w = _1973;
    float _2628 = -_2031;
    float _2630 = _2628 + 1.0;
    out.m_89.y = _2610;
    float _2632 = _2630 * _2626;
    float _2634 = precise::clamp(_2632, 0.0, 1.0);
    out.m_89.w = _2614;
    float _2636 = -_2634;
    float _2638 = fma(_2636, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2640 = _2608;
    float _2642 = _2610;
    if (!_2438)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2644 = _2640;
    float _2646 = _2644;
    float _2648 = _2644;
    if (!_2438)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2650 = _2642;
    float _2652 = _2638 * _2560;
    float _2654 = _2652 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2656 = _2652;
    float _2658 = _2650;
    float _2660 = _2650;
    if (!_2438)
    {
        _2656 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2662 = _2656;
    out.m_89.z = _2624;
    float _2664 = _2428 * _2063;
    float _2666 = -_2428;
    float _2668 = _2666 + 1.0;
    out.m_99.x = _2654;
    float _2670 = _2074 * _2664;
    float _2672 = _2084 * _2664;
    float _2674 = _2074 * _2668;
    float _2676 = _2664;
    float _2678 = _2672;
    float _2680 = _2670;
    float _2682 = _2662;
    float _2684 = _2662;
    if (!_2438)
    {
        _2676 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2686 = _2676;
    float _2688 = fma(_2080, _2670, _2068);
    float _2690 = fma(_2082, _2670, _2070);
    float _2692 = fma(_2074, _2672, _2072);
    float _2694 = _2686;
    float _2696 = _2686;
    if (!_2438)
    {
        _2678 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2698 = _2678;
    float _2700 = _2698;
    float _2702 = _2698;
    if (!_2438)
    {
        _2680 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2704 = _2680;
    out.m_101.x = _2688;
    out.m_101.y = _2690;
    out.m_101.z = _2692;
    out.m_101.w = _2674;
    bool _2706 = !_2438;
    float _2708 = _2704;
    float _2710 = _2704;
    if (!_2706)
    {
        bool _2712 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2714 = isnan(_1680);
        bool _2716 = _2712 || _2714;
        bool _2718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2720 = _2716 || _2718;
        if (!_2720)
        {
            float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2724 = _1680 + _2722;
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2728 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2726;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2734 = 1.0 / _2728;
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2752 = _2724 * _2734;
            float _2754 = precise::clamp(_2752, 0.0, 1.0);
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2760 = fma(_2754, _2732, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2762 = fma(_2754, _2758, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2764 = fma(_2754, _2738, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2766 = fma(_2754, _2742, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2768 = fma(_2754, _2746, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2770 = fma(_2754, _2750, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2648 = _2760;
            _2684 = _2768;
            _2696 = _2764;
            _2710 = _2766;
            _2702 = _2762;
            _2660 = _2770;
            _2772 = true;
        }
        else
        {
            bool _2774 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2776 = isnan(_1680);
            bool _2778 = _2774 || _2776;
            bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2782 = _2778 || _2780;
            if (!_2782)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2784 = _2694;
            _2696 = _2784;
            if (!_2782)
            {
                _2646 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2786 = _2646;
            _2648 = _2786;
            if (!_2782)
            {
                _2700 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2788 = _2700;
            _2702 = _2788;
            if (!_2782)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2790 = _2708;
            _2710 = _2790;
            if (!_2782)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2792 = _2682;
            _2684 = _2792;
            if (!_2782)
            {
                _2658 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2794 = _2658;
            bool _2796 = !_2782;
            _2660 = _2794;
            if (!_2796)
            {
                bool _2798 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2800 = isnan(_1680);
                bool _2802 = _2798 || _2800;
                bool _2804 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2806 = _2802 || _2804;
                if (!_2806)
                {
                    float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2810 = _1680 + _2808;
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2814 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2812;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2820 = 1.0 / _2814;
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2838 = _2810 * _2820;
                    float _2840 = precise::clamp(_2838, 0.0, 1.0);
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2846 = fma(_2840, _2818, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2848 = fma(_2840, _2844, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2850 = fma(_2840, _2824, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2852 = fma(_2840, _2828, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2854 = fma(_2840, _2832, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2856 = fma(_2840, _2836, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2648 = _2846;
                    _2684 = _2854;
                    _2696 = _2850;
                    _2710 = _2852;
                    _2702 = _2848;
                    _2660 = _2856;
                    _2772 = true;
                }
                else
                {
                    _2648 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2702 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2660 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2772 = false;
    float _2858 = _2648;
    float _2860 = _2684;
    float _2862 = _2696;
    float _2864 = _2710;
    float _2866 = _2702;
    float _2868 = _2660;
    float _2870 = fma(_2558, -0.5, 0.5);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = -_2858;
    float _2876 = _2874 + _2860;
    float _2878 = -_2862;
    float _2880 = _2878 + _2864;
    float _2882 = -_2866;
    float _2884 = _2882 + _2868;
    bool _2886 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2888 = fma(_2872, _2876, _2858);
    float _2890 = fma(_2872, _2880, _2862);
    float _2892 = fma(_2872, _2884, _2866);
    float _2894 = _2888 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2896 = fma(_2890, 0.298911988735198974609375, _2894);
    float _2898 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2900 = fma(_2892, 0.114477999508380889892578125, _2896);
    out.m_99.w = _2898;
    float _2902 = -_2900;
    float _2904 = _2890 + _2902;
    float _2906 = -_2900;
    float _2908 = _2888 + _2906;
    float _2910 = -_2900;
    float _2912 = _2892 + _2910;
    out.m_103.x = 0.0;
    float _2914 = fma(_2904, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2916 = fma(_2908, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2918 = fma(_2912, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    out.m_105.x = _2914;
    out.m_105.y = _2916;
    out.m_105.z = _2918;
    if (!_2886)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2920 = -_1650;
    float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2924 = -_1654;
    float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2928 = -_1658;
    float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2932 = _2922 * _2922;
    float _2934 = fma(_2926, _2926, _2932);
    float _2936 = fma(_2930, _2930, _2934);
    float _2938 = sqrt(_2936);
    float _2940 = rsqrt(_2936);
    float _2942 = -_2938;
    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2946 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2948 = precise::clamp(_2946, 0.0, 1.0);
    float _2950 = _2926 * _2940;
    float _2952 = _2922 * _2940;
    float _2954 = abs(_2948);
    float _2956 = log2(_2954);
    float _2958 = _2930 * _2940;
    float _2960 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2962 = _2558 * _2952;
    float _2964 = -_2952;
    float _2966 = -_2960;
    float _2968 = fma(_2964, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2966);
    float _2970 = fma(_2538, _2950, _2962);
    float _2972 = -_2958;
    float _2974 = fma(_2972, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2968);
    float _2976 = fma(_2540, _2958, _2970);
    float _2978 = precise::clamp(_2976, 0.0, 1.0);
    float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2982 = _2974 + _2980;
    float _2984 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2988 = precise::clamp(_2986, 0.0, 1.0);
    float _2990 = exp2(_2984);
    float _2992 = _2990 * _2988;
    float _2994 = _2978 * _2992;
    float _2996 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2998 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3000 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2996;
    out.m_103.y = _2998;
    out.m_103.z = _3000;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

