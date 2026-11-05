#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d_array<float> vp_t_tcb_16 [[id(6)]];
    sampler vp_t_tcb_16Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_20 [[id(8)]];
    sampler vp_t_tcb_20Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    texture2d_array<float> vp_t_tcb_14 [[id(18)]];
    sampler vp_t_tcb_14Smplr [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_32Smplr_w [[id(22)]];
    sampler vp_t_tcb_30Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_83 [[user(locn0)]];
    float4 m_87 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_111 [[user(locn3)]];
    float4 m_105 [[user(locn4)]];
    float4 m_89 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_99 [[user(locn8)]];
    float4 m_101 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_109 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_103 [[user(locn13)]];
    float4 m_107 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_81 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
    float4 m_75 [[attribute(10)]];
    float4 m_85 [[attribute(11)]];
    float4 m_79 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2488 = false;
    bool _368 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_58.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_61.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2773 = as_type<float>(_146);
        out.gl_Position.z = _2773;
    }
    if (!_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_63.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = _164;
    if (_160)
    {
        float _168 = float(_130);
        _140 = _168;
    }
    float _170 = _140;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    float _178 = _170;
    if (_176)
    {
        _178 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _178;
    if (_176)
    {
        out.m_61.x = 0.0;
    }
    if (_176)
    {
        float _182 = _180 * 5.0;
        _148 = as_type<int>(_182);
    }
    int _184 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2843 = as_type<float>(_184);
        out.gl_Position.z = _2843;
    }
    if (_176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _186 = in.m_65.x;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.x;
    float _194 = in.m_67.y;
    float _196 = in.m_67.z;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = _190 * _190;
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_202, _202, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = _224;
    float _234 = _186;
    float _236 = _190;
    if (_228)
    {
        float _238 = rsqrt(_216);
        _232 = _238;
    }
    float _240 = _232;
    float _242 = 0.0;
    if (!_228)
    {
        _242 = 0.0;
    }
    float _244 = _242;
    bool _246 = _226 > 0.0;
    float _248 = 0.0;
    float _250 = _244;
    if (!_228)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _252;
    if (!_228)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = _226;
    float _262 = _258;
    if (_230)
    {
        float _264 = rsqrt(_218);
        _260 = _264;
    }
    float _266 = _260;
    float _268 = 0.0;
    float _270 = 0.0;
    if (!_230)
    {
        _268 = 0.0;
        _270 = 0.0;
    }
    float _272 = _268;
    float _274 = _270;
    float _276 = 0.0;
    float _278 = _272;
    float _280 = _274;
    if (!_230)
    {
        _276 = 0.0;
    }
    float _282 = _276;
    float _284 = 0.0;
    float _286 = _282;
    if (_246)
    {
        float _288 = rsqrt(_220);
        _284 = _288;
    }
    float _290 = _284;
    if (_228)
    {
        float _292 = _240 * _192;
        _250 = _292;
    }
    float _294 = _250;
    if (_228)
    {
        float _296 = _240 * _186;
        _256 = _296;
    }
    float _298 = _256;
    if (_228)
    {
        float _300 = _240 * _198;
        _262 = _300;
    }
    float _302 = _262;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _306 = 0.0;
    if (!_246)
    {
        _306 = 0.0;
    }
    float _308 = _306;
    float _310 = 0.0;
    float _312 = _308;
    if (!_246)
    {
        _310 = 0.0;
    }
    float _314 = _310;
    float _316 = _314;
    if (_230)
    {
        float _318 = _266 * _194;
        _278 = _318;
    }
    float _320 = _278;
    float _322 = 0.0;
    if (!_246)
    {
        _322 = 0.0;
    }
    float _324 = _322;
    float _326 = _324;
    if (_230)
    {
        float _328 = _266 * _188;
        _280 = _328;
    }
    float _330 = _280;
    if (_230)
    {
        float _332 = _266 * _200;
        _286 = _332;
    }
    float _334 = _286;
    if (_246)
    {
        float _336 = _290 * _196;
        _312 = _336;
    }
    float _338 = _312;
    if (_246)
    {
        float _340 = _290 * _190;
        _316 = _340;
    }
    float _342 = _316;
    if (_246)
    {
        float _344 = _290 * _202;
        _326 = _344;
    }
    float _346 = _326;
    bool _348 = !_304;
    float _366;
    if (!_348)
    {
        float _350 = in.m_71.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_130);
        float _372 = 1.0 / _370;
        float _374 = _164 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_71.z;
    float _380 = in.m_71.y;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _382;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _392 = _390 != 0;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _396 = _394 != 0;
    float _398 = in.m_71.x;
    float _400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _402 = log2(_400);
    float _404 = in.m_58.x;
    float _406 = in.m_58.y;
    float _408 = in.m_58.z;
    float _410 = 1.0 / _384;
    float _412 = _378 * 2.0;
    float _414 = _402 * _164;
    float _416 = _380 * 2.0;
    float _418 = floor(_412);
    float _420 = _398 * 2.0;
    float _422 = _398 + _378;
    float _424 = _194 * _406;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _428 = _376 + _426;
    float _430 = floor(_416);
    float _432 = _422 + (-1.0);
    float _434 = fma(_192, _404, _424);
    float _436 = _380 + _378;
    float _438 = _428 * _410;
    float _440 = _200 * _406;
    float _442 = _188 * _406;
    float _444 = _436 + (-1.0);
    float _446 = floor(_420);
    bool _448 = _418 > 0.0;
    float _450 = fma(_198, _404, _440);
    bool _452 = _418 >= 0.0;
    bool _454 = isnan(_418);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = fma(_186, _404, _442);
    float _464 = fma(_202, _408, _450);
    int _466 = _460 ? 0 : 1;
    float _468 = exp2(_414);
    bool _470 = _430 > 0.0;
    float _472 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _474 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _476 = !_388;
    int _478 = _476 ? 0 : 1;
    float _480 = fma(_190, _408, _462);
    bool _482 = _430 >= 0.0;
    bool _484 = isnan(_430);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    bool _492 = _446 > 0.0;
    bool _494 = _446 >= 0.0;
    bool _496 = isnan(_446);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    int _504 = ~_466;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    int _510 = abs(_478);
    int _512 = _508;
    float _514 = _378;
    if (!_448)
    {
        int _516 = ~_466;
        int _518 = _516 + 1;
        _512 = _518;
    }
    int _520 = _512;
    float _522 = -_468;
    float _524 = _522 + 1.0;
    int _526 = _490 ? 0 : 1;
    float _528 = float(_510);
    float _530 = float(_520);
    int _532 = ~_526;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    int _538 = _536;
    if (!_470)
    {
        int _540 = ~_526;
        int _542 = _540 + 1;
        _538 = _542;
    }
    int _544 = _538;
    float _546 = _528 * _530;
    int _548 = _502 ? 0 : 1;
    float _550 = in.m_73.x;
    float _552 = in.m_73.y;
    float _554 = in.m_73.z;
    float _556 = _546 * (-2.0);
    bool _558 = !_392;
    int _560 = _558 ? 0 : 1;
    int _562 = ~_548;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _570 = 1.0 + _568;
    int _572 = _566;
    if (!_492)
    {
        int _574 = ~_548;
        int _576 = _574 + 1;
        _572 = _576;
    }
    int _578 = _572;
    bool _580 = !_396;
    int _582 = _580 ? 0 : 1;
    float _584 = 1.0 / _570;
    int _586 = abs(_560);
    float _588 = _398 + _380;
    int _590 = abs(_582);
    float _592 = _588 + (-1.0);
    bool _594 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _596 = isnan(1.0);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _602 = _598 || _600;
    float _604 = float(_586);
    float _606 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _608 = float(_578);
    float _610 = _398 + (-0.5);
    bool _612 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _620 = _616 || _618;
    float _622 = fma(_556, _550, _550);
    float _624 = float(_590);
    float _626 = _604 * _608;
    float _628 = _620 ? _524 : 0.0;
    float _630 = float(_544);
    float _632 = _626 * (-2.0);
    if (_602)
    {
        float _634 = _628 * _584;
        _166 = _634;
    }
    float _636 = _166;
    float _638 = fma(_606, _556, _606);
    float _640 = fma(_472, _632, _472);
    float _642 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[196].x, _622);
    float _644 = fma(_632, _552, _552);
    float _646 = _380 + (-0.5);
    float _648 = _624 * _630;
    float _650 = fma(_638, _636, _642);
    float _652 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _644);
    float _654 = _648 * (-2.0);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _656;
    float _660 = fma(_640, _636, _652);
    bool _662 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _664 = isnan(_376);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _678;
    float _682 = in.m_75.x;
    float _684 = in.m_75.y;
    float _686 = in.m_75.z;
    float _688 = _650 * 0.15915493667125701904296875;
    bool _690 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _692 = isnan(_376);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -_672;
    float _704 = _702 + 1.0;
    float _706 = fma(_658, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _708 = fma(_676, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _710 = fma(_680, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _712 = fma(_654, _554, _554);
    float _714 = _378 + (-0.5);
    float _716 = in.m_77.x;
    float _718 = in.m_77.y;
    float _720 = in.m_77.z;
    float _722 = _700 * _704;
    float _724 = fma(_474, _654, _474);
    float _726 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].z, _712);
    float _728 = -_700;
    float _730 = _728 + 1.0;
    float _732 = _710 * _722;
    float _734 = _706 * _722;
    float _736 = _708 * _722;
    float _738 = fma(_724, _636, _726);
    float _740 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[143].z, _732);
    float _742 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[143].x, _734);
    float _744 = _660 * 0.15915493667125701904296875;
    float _746 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[143].y, _736);
    float _748 = _738 * 0.15915493667125701904296875;
    float _750 = _688 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[144].z, _740);
    float _756 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[144].x, _742);
    float _758 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[144].y, _746);
    float _760 = _754 * _686;
    float _762 = _756 * _682;
    float _764 = _744 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = _758 * _684;
    float _770 = in.m_69.w;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _774 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _778 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    float _782 = _744 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _772 * _774;
    float _788 = _776 * _778;
    float _790 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = in.m_67.w;
    float _794 = _780 * _790;
    float _796 = _688 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _752 * _766;
    float _802 = _748 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = _752 * _784;
    float _808 = _748 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _798 * _766;
    float _814 = _798 * _784;
    float _816 = _752 * _804;
    float _818 = _798 * _804;
    float _820 = _784 * _804;
    float _822 = _766 * _804;
    float _824 = _816 * _788;
    float _826 = fma(_196, _408, _434);
    float _828 = _464 + _770;
    float _830 = fma(_810, _806, _812);
    float _832 = -_788;
    float _834 = _810 * _832;
    float _836 = -_814;
    float _838 = fma(_810, _800, _836);
    float _840 = -_800;
    float _842 = fma(_810, _814, _840);
    float _844 = fma(_830, _786, _824);
    float _846 = _818 * _788;
    float _848 = fma(_820, _786, _834);
    float _850 = fma(_810, _812, _806);
    float _852 = fma(_838, _794, _844);
    float _854 = fma(_842, _786, _846);
    float _856 = fma(_822, _794, _848);
    float _858 = _826 + _792;
    float _860 = _852 * _334;
    float _862 = fma(_850, _794, _854);
    float _864 = _852 * _320;
    float _866 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _868 = fma(_856, _302, _860);
    float _870 = fma(_856, _294, _864);
    float _872 = in.m_65.w;
    float _874 = fma(_862, _346, _868);
    float _876 = floor(_866);
    float _878 = fma(_862, _338, _870);
    float _880 = _828 + _874;
    float _882 = _858 + _878;
    float _884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _886 = _880 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _890 = _882 + _888;
    float _892 = _886 * _886;
    float _894 = fma(_890, _890, _892);
    float _896 = sqrt(_894);
    float _898 = _480 + _872;
    bool _900 = _896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _904 = _896 + _902;
    float _906 = _874;
    float _908 = _896;
    float _910 = _848;
    float _912 = _852;
    float _914 = _858;
    if (_900)
    {
        float _916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _916;
    }
    float _918 = _906;
    if (!_900)
    {
        _234 = _882;
    }
    float _920 = _234;
    float _922 = _920;
    if (!_900)
    {
        _236 = _880;
    }
    float _924 = _236;
    float _926 = _924;
    if (_900)
    {
        float _928 = _904 * _918;
        _908 = _928;
    }
    float _930 = _908;
    if (_900)
    {
        float _932 = _930 * 0.15915493667125701904296875;
        _910 = _932;
    }
    float _934 = _910;
    float _936 = _852 * _330;
    float _938 = _918;
    if (_900)
    {
        float _940 = _934 * 6.283185482025146484375;
        float _942 = cos(_940);
        _938 = _942;
    }
    float _944 = _938;
    float _946 = fma(_856, _298, _936);
    float _948 = fma(_862, _342, _946);
    float _950 = _404;
    float _952 = _946;
    float _954 = _948;
    if (_900)
    {
        float _956 = _934 * 6.283185482025146484375;
        float _958 = sin(_956);
        _950 = _958;
    }
    float _960 = _950;
    float _962 = _898 + _948;
    float _964 = _962;
    if (_900)
    {
        float _966 = _962 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _952 = _966;
    }
    float _968 = _952;
    float _970 = _936;
    float _972 = _968;
    if (_900)
    {
        float _974 = rsqrt(_894);
        _970 = _974;
    }
    float _976 = _970;
    if (_900)
    {
        float _978 = _944 + (-1.0);
        _954 = _978;
    }
    float _980 = _954;
    if (_900)
    {
        float _982 = fma(_960, _968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _912 = _982;
    }
    float _984 = _912;
    if (_900)
    {
        float _986 = _980 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _986;
    }
    float _988 = _972;
    float _990 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    if (_900)
    {
        float _992 = fma(_962, _944, _988);
        _964 = _992;
    }
    float _994 = _964;
    float _996 = _898 + _990;
    float _998 = _976;
    if (_900)
    {
        float _1000 = _976 * _984;
        _998 = _1000;
    }
    float _1002 = _998;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _994 + _1004;
    float _1008 = _996 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1010 = _996 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    if (_900)
    {
        float _1012 = fma(_890, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _922 = _1012;
    }
    float _1014 = _922;
    if (_900)
    {
        float _1016 = fma(_886, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _926 = _1016;
    }
    float _1018 = _926;
    float _1020 = _1006 * _1006;
    float _1022 = _898 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1026 = _1014 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1030 = _1018 + _1028;
    float _1032 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1022);
    float _1034 = fma(_1026, _1026, _1020);
    float _1036 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1008);
    float _1038 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1010);
    float _1040 = fma(_1030, _1030, _1034);
    float _1042 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1032);
    float _1044 = _898 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1046 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1036);
    float _1048 = rsqrt(_1040);
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1052 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1044);
    float _1054 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1038);
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1058 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    float _1060 = _1054 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1062 = 1.0 / _1050;
    float _1064 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1066 = _1064 + _1050;
    float _1068 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1070 = trunc(_1056);
    int _1072 = int(_1070);
    float _1074 = _1026 * _1068;
    float _1076 = _1030 * _1068;
    float _1078 = _1074 * _1074;
    float _1080 = _1076 * _1076;
    float _1082 = _1066 * _1062;
    float _1084 = _1082 * 0.5;
    float _1086 = trunc(_1060);
    int _1088 = int(_1086);
    float _1090 = _1078 + _1080;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1094 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1092);
    int _1096 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1098 = _1072 + _1096;
    int _1100 = _1098 + 1;
    float _1102 = sqrt(_1090);
    float _1104 = 1.0 / _1094;
    bool _1106 = _1102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1102 + _1108;
    float _1112 = sqrt(_1040);
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1116 = _1104 * _1114;
    bool _1118 = _1116 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1120 = _894;
    float _1122 = _1090;
    int _1124 = 2;
    float _1126 = _1074;
    float _1128 = _1076;
    float _1130 = _1078;
    int _1132 = as_type<int>(_1080);
    float _1134 = _1060;
    bool _1136 = _1106;
    if (_1106)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1138;
    }
    float _1140 = _1120;
    bool _1142 = _1116 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1144 = !_1118;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = as_type<float>(_1146);
    if (_1106)
    {
        float _1150 = rsqrt(_1090);
        _1122 = _1150;
    }
    float _1152 = _1122;
    float _1154 = _1152;
    if (!_1118)
    {
        _1124 = 1;
    }
    int _1156 = _1124;
    int _1158 = _1156;
    if (!_1142)
    {
        _1158 = _1146;
    }
    int _1160 = _1158;
    if (_1106)
    {
        float _1162 = _1110 * _1140;
        _1148 = _1162;
    }
    float _1164 = _1148;
    bool _1166 = _1100 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1168 = _1160 << 6;
    float _1170 = 0.0;
    if (_1106)
    {
        float _1172 = _1164 * 0.15915493667125701904296875;
        _1170 = _1172;
    }
    float _1174 = _1170;
    float _1176 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1178 = _1168 + 96;
    uint _1181 = uint(int(uint(_1178) >> uint(2)));
    uint _1183 = uint(int(uint(int(_1181)) >> uint(2)));
    int _1185 = int(_1181) & 3;
    float _1187 = (*spvDescriptorSet0.vp_c15)._m0[int(_1183)][_1185];
    int _1189 = int(_1181) + 1;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    int _1193 = _1189 & 3;
    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[int(_1191)][_1193];
    float _1197 = 0.0;
    float _1199 = _1174;
    if (_1106)
    {
        float _1201 = _1174 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        _1197 = _1203;
    }
    float _1205 = _1197;
    float _1207 = precise::max(0.0, _1176);
    int _1209 = _1168 + 48;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    uint _1213 = uint(int(uint(int(_1211)) >> uint(2)));
    int _1215 = int(_1211) & 3;
    float _1217 = (*spvDescriptorSet0.vp_c15)._m0[int(_1213)][_1215];
    int _1219 = int(_1211) + 1;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    int _1223 = _1219 & 3;
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[int(_1221)][_1223];
    float _1227 = 0.0;
    if (_1106)
    {
        float _1229 = _1174 * 6.283185482025146484375;
        float _1231 = cos(_1229);
        _1227 = _1231;
    }
    float _1233 = _1227;
    float _1235 = -_1068;
    float _1237 = -_1207;
    float _1239 = fma(_1006, _1235, _1237);
    int _1241 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1243 = _1088 + _1241;
    int _1245 = _1243 + 1;
    float _1247 = 0.0;
    if (_1106)
    {
        float _1249 = _1239 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1247 = _1249;
    }
    float _1251 = _1247;
    int _1253 = _1100 | _1245;
    int _1255 = _1168 + 104;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c15)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    float _1273 = 0.0;
    float _1275 = as_type<float>(_1253);
    if (_1106)
    {
        float _1277 = fma(_1205, _1251, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1273 = _1277;
    }
    float _1279 = _1273;
    bool _1281 = _1253 < 0;
    bool _1283 = _1281 || _1166;
    float _1285 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1287 = _1279;
    if (!_1106)
    {
        _1275 = _1239;
    }
    float _1289 = _1275;
    float _1291 = _1289;
    if (_1106)
    {
        float _1293 = _1152 * _1279;
        _1287 = _1293;
    }
    float _1295 = _1287;
    bool _1297 = _1245 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1299 = _1297 || _1283;
    int _1301 = _1168 + 64;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    uint _1305 = uint(int(uint(int(_1303)) >> uint(2)));
    int _1307 = int(_1303) & 3;
    float _1309 = (*spvDescriptorSet0.vp_c15)._m0[int(_1305)][_1307];
    int _1311 = int(_1303) + 1;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    int _1315 = _1311 & 3;
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[int(_1313)][_1315];
    float _1319 = _1233;
    if (_1106)
    {
        float _1321 = _1233 + (-1.0);
        _1154 = _1321;
    }
    float _1323 = _1154;
    float _1325 = floor(_1285);
    float _1327 = _1323;
    if (_1106)
    {
        float _1329 = _1074 * _1295;
        _1126 = _1329;
    }
    float _1331 = _1126;
    if (_1106)
    {
        float _1333 = _1076 * _1295;
        _1128 = _1333;
    }
    float _1335 = _1128;
    if (_1106)
    {
        float _1337 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1337;
    }
    float _1339 = _1327;
    int _1341 = as_type<int>(_1339);
    if (_1106)
    {
        float _1343 = _1331 * _1331;
        _1130 = _1343;
    }
    float _1345 = _1130;
    int _1347 = _1168 + 56;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    if (_1106)
    {
        float _1365 = fma(_1239, _1233, _1339);
        _1291 = _1365;
    }
    float _1367 = _1291;
    if (!_1106)
    {
        _1319 = _1080;
    }
    float _1369 = _1319;
    float _1371 = _1369;
    if (_1106)
    {
        float _1373 = _1335 * _1335;
        _1371 = _1373;
    }
    float _1375 = _1371;
    int _1377 = as_type<int>(_1375);
    if (!_1299)
    {
        int _1379 = _1245 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1381 = _1379 + _1100;
        _1132 = _1381;
    }
    int _1383 = _1132;
    float _1385 = -_876;
    float _1387 = _866 + _1385;
    float _1389 = fma(_1367, _1367, _1345);
    int _1391 = _1168 + 72;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    uint _1395 = uint(int(uint(int(_1393)) >> uint(2)));
    int _1397 = int(_1393) & 3;
    float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
    int _1401 = int(_1393) + 1;
    uint _1403 = uint(int(uint(_1401) >> uint(2)));
    int _1405 = _1401 & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    if (!_1299)
    {
        int _1409 = _1383 << 2;
        _1341 = _1409;
    }
    int _1411 = _1341;
    float _1413 = _1389 + _1375;
    float _1415 = -_1325;
    float _1417 = _1285 + _1415;
    int _1419 = _1411;
    if (!_1299)
    {
        uint _1421 = uint(int(uint(_1383) >> uint(2)));
        _1377 = int(_1421);
    }
    int _1423 = _1377;
    if (!_1299)
    {
        int _1425 = 12 & _1411;
        _1419 = _1425;
    }
    int _1427 = _1419;
    float _1429 = _996 * _1195;
    float _1431 = rsqrt(_1413);
    float _1433 = fma(_858, _1187, _1429);
    int _1435 = as_type<int>(_1187);
    if (!_1299)
    {
        int _1437 = _1423 << 4;
        int _1439 = _1437 + _1427;
        _1435 = _1439;
    }
    int _1441 = _1435;
    float _1443 = _996 * _1225;
    float _1445 = fma(_858, _1217, _1443);
    float _1447 = fma(_828, _1263, _1433);
    float _1449 = _994 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1451 = _1431 * _1331;
    float _1453 = _1431 * _1335;
    float _1455 = _1447 + _1271;
    float _1457 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1449);
    int _1459 = _1168 + 88;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c15)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    float _1477 = _996 * _1317;
    float _1479 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1457);
    float _1481 = 1.0 / _1455;
    float _1483 = fma(_858, _1309, _1477);
    float _1485 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1487 = fma(_828, _1355, _1445);
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1491 = fma(_1112, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1489);
    float _1493 = precise::clamp(_1491, 0.0, 1.0);
    int _1495 = _1168 + 80;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    float _1513 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1515 = _1487 + _1363;
    float _1517 = -_1493;
    float _1519 = _1517 + 1.0;
    float _1521 = _994 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1523 = _1477;
    if (!_1299)
    {
        float _1525 = floor(_1056);
        _1523 = _1525;
    }
    float _1527 = _1523;
    float _1529 = fma(_828, _1399, _1483);
    float _1531 = _1431 * _1367;
    float _1533 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1537 = _1529 + _1407;
    float _1539 = _994 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1541 = -_1533;
    float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1541);
    float _1545 = _1515 * _1481;
    float _1547 = abs(_1519);
    float _1549 = log2(_1547);
    float _1551 = _1537 * _1481;
    float _1553 = -_1513;
    float _1555 = fma(_1553, _1535, 1.0);
    float _1557 = -_1453;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1543);
    bool _1561 = _1545 >= 0.0;
    float _1563 = _994 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1565 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1539);
    float _1567 = fma(_1559, -0.5, 0.5);
    bool _1569 = _1545 <= 1.0;
    bool _1571 = _1569 && _1561;
    float _1573 = _1513;
    float _1575 = _1527;
    if (!_1299)
    {
        float _1577 = floor(_1060);
        _1573 = _1577;
    }
    float _1579 = _1573;
    float _1581 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1563);
    float _1583 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1565);
    bool _1585 = _1551 >= 0.0;
    bool _1587 = _1585 && _1571;
    float _1589 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1521);
    float _1591 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1581);
    float _1593 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1595 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1597 = _1551 <= 1.0;
    bool _1599 = _1597 && _1587;
    float _1601 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1603 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1605 = exp2(_1595);
    float _1607 = fma(_1559, 0.5, 0.5);
    float _1609 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1589);
    float _1611 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1603);
    if (!_1299)
    {
        float _1613 = -_1579;
        float _1615 = _1060 + _1613;
        _1199 = _1615;
    }
    float _1617 = _1199;
    float _1619 = fma(_1607, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1621 = _1515;
    if (!_1299)
    {
        int _1623 = _1441 + 400;
        uint _1625 = uint(int(uint(_1623) >> uint(2)));
        uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
        int _1629 = int(_1625) & 3;
        float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
        _1621 = _1631;
    }
    float _1633 = _1621;
    float _1635 = sqrt(_1567);
    float _1637 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (_1599)
    {
        float _1639 = float(_1160);
        _1134 = _1639;
    }
    float _1641 = _1134;
    float _1643 = fma(_1607, _1619, -0.212114393711090087890625);
    if (!_1299)
    {
        float _1645 = -_1527;
        float _1647 = _1056 + _1645;
        _1575 = _1647;
    }
    float _1649 = _1575;
    float _1651 = fma(_1018, 6.2500002968590706586837768554688e-05, 0.5);
    float _1653 = _996 * _1511;
    float _1655 = _1531 + 1.0;
    float _1657 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1611);
    float _1659 = _1641;
    if (_1599)
    {
        float _1661 = rint(_1641);
        float _1663 = precise::max(_1661, 0.0);
        uint _1665 = uint(_1663);
        uint _1667 = clamp(_1665, 0u, 65535u);
        _1659 = as_type<float>(_1667);
    }
    float _1669 = _1659;
    float _1671 = fma(_858, _1503, _1653);
    float _1673 = -_1531;
    float _1675 = fma(_1605, _1655, _1673);
    float _1677 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1679 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1657);
    float _1681 = fma(_828, _1467, _1671);
    float _1683 = fma(_1607, _1643, 1.570728778839111328125);
    float _1685 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1677);
    float _1687 = log2(_1555);
    float _1689 = _1681 + _1475;
    float _1691 = _1635 * 0.636619746685028076171875;
    float _1693 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1685);
    float _1695 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1697 = _1689 * _1481;
    float _1699 = -_1683;
    float _1701 = fma(_1691, _1699, 1.0);
    float _1703 = fma(_1014, 6.2500002968590706586837768554688e-05, 0.5);
    float _1705 = 1.0 / _1679;
    float _1707 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1693);
    float _1709 = fma(_1675, 0.5, 0.5);
    float _1711 = _1693;
    if (_1599)
    {
        float3 _5210 = float3(_1545, _1551, float(as_type<int>(_1669)));
        float3 _5214 = select(_5210, float3(0.0), isnan(_5210));
        float _1713 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5214.xy, uint(rint(_5214.z)), _1697, level(0.0));
        _1711 = _1713;
    }
    float _1715 = _1711;
    float _1717 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1695);
    float2 _5229 = float2(_1703, _1651);
    float3 _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5229, float2(0.0), isnan(_5229)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5229, float2(0.0), isnan(_5229)), level(0.0)).xyz;
    float _1723 = _1721.x;
    float _1725 = _1721.y;
    float _1727 = _1721.z;
    float _1729 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1717);
    float _1731 = _1687 * 0.693147182464599609375;
    float _1733 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1729);
    float _1735 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = _1733 * _1705;
    float _1739 = _1707 * _1705;
    float2 _5268 = float2(_1387, _1417);
    float _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5268, float2(0.0), isnan(_5268)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5268, float2(0.0), isnan(_5268)), level(0.0)).x;
    float _1743 = fma(_1737, 0.5, 0.5);
    float _1745 = fma(_1739, -0.5, 0.5);
    float _1747 = _1633;
    if (!_1299)
    {
        float _1749 = rint(_1633);
        float _1751 = precise::max(_1749, 0.0);
        uint _1753 = uint(_1751);
        uint _1755 = clamp(_1753, 0u, 65535u);
        _1747 = as_type<float>(_1755);
    }
    float _1757 = _1747;
    float3 _5297 = float3(_1743, _1745, _1735);
    float _1759 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5297, float3(0.0), isnan(_5297)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5297, float3(0.0), isnan(_5297)), level(0.0)).x;
    float3 _5306 = float3(_1743, _1745, _1735);
    float4 _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5306, float3(0.0), isnan(_5306)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5306, float3(0.0), isnan(_5306)), level(0.0)).xyzw;
    float _1764 = _1762.x;
    float _1766 = _1762.y;
    float _1768 = _1762.z;
    float _1770 = _1762.w;
    float2 _5322 = float2(_1701, _1709);
    float3 _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5322, float2(0.0), isnan(_5322)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5322, float2(0.0), isnan(_5322)), level(0.0)).xyz;
    float _1774 = _1772.x;
    float _1776 = _1772.y;
    float _1778 = _1772.z;
    float _1780 = _1617;
    int _1782 = as_type<int>(_1757);
    if (!_1299)
    {
        float3 _5345 = float3(_1649, _1617, float(as_type<int>(_1757)));
        float3 _5347 = select(_5345, float3(0.0), isnan(_5345));
        float _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5347.xy, uint(rint(_5347.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5347.xy, uint(rint(_5347.z)), level(0.0)).x;
        _1780 = _1784;
    }
    float _1786 = _1780;
    float _1788 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1790 = in.m_79.x;
    float _1792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1794 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1796 = _1788 * _398;
    float _1798 = in.m_71.w;
    float _1800 = in.m_79.y;
    float _1802 = trunc(_1796);
    int _1804 = int(_1802);
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1808 = _1806 != 0;
    float _1810 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1794);
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1814 = _1812 != 0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1818 = _1816 != 0;
    float _1820 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1810);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1824 = _1822 != 0;
    int _1826 = _1804 << 4;
    int _1828 = _1826 + 1968;
    bool _1830 = _1818;
    float _1832 = _1790;
    if (_1808)
    {
        float _1834 = -_1790;
        float _1836 = _1834 + 1.0;
        _1782 = as_type<int>(_1836);
    }
    int _1838 = _1782;
    if (_1808)
    {
        bool _1840 = _398 > 0.5;
        _1136 = _1840;
    }
    bool _1842 = _1136;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    uint _1846 = uint(int(uint(_1828) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    float _1862 = 0.0;
    if (!_1808)
    {
        _1862 = _1790;
    }
    float _1864 = _1862;
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1868 = _1864;
    if (_1808)
    {
        float _1870 = _1842 ? as_type<float>(_1838) : _1790;
        _1868 = _1870;
    }
    float _1872 = _1868;
    float _1874 = -_1800;
    float _1876 = _1874 + 1.0;
    float _1878 = in.m_81.x;
    float _1880 = in.m_81.y;
    float _1882 = in.m_81.z;
    bool _1884 = _718 != 0.0;
    bool _1886 = isnan(_718);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan(0.0);
    bool _1892 = _1888 || _1890;
    float _1894 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1896 = _1828 + 8;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    uint _1900 = uint(int(uint(int(_1898)) >> uint(2)));
    int _1902 = int(_1898) & 3;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[int(_1900)][_1902];
    bool _1906 = _1798 > 0.5;
    bool _1908 = _716 == 0.0;
    bool _1910 = !_1892;
    bool _1912 = _1908 && _1910;
    bool _1914 = _720 == 0.0;
    bool _1916 = _1914 && _1912;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1922 = _1906 ? as_type<int>(_1876) : as_type<int>(_1800);
    float _1924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1926 = _380 > 0.5;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1930 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1932 = _1818 ? as_type<float>(_1922) : _1800;
    int _1934 = _1922;
    float _1936 = _1800;
    float _1938 = _1876;
    if (_1814)
    {
        float _1940 = -_1790;
        float _1942 = _1940 + 1.0;
        _1934 = as_type<int>(_1942);
    }
    int _1944 = _1934;
    float _1946 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = as_type<float>(_1944);
    if (_1814)
    {
        bool _1950 = _378 > 0.5;
        _1830 = _1950;
    }
    bool _1952 = _1830;
    if (_1916)
    {
        _514 = _1878;
    }
    float _1954 = _514;
    out.m_83.x = _1930;
    out.m_83.y = _1894;
    out.m_83.z = _1946;
    out.m_83.w = _1918;
    float _1956 = _1954;
    if (_1824)
    {
        float _1958 = _1926 ? _1876 : _1800;
        _1936 = _1958;
    }
    float _1960 = _1936;
    if (_1916)
    {
        _1938 = _1954;
    }
    float _1962 = _1938;
    float _1964 = in.m_85.x;
    float _1966 = in.m_85.y;
    float _1968 = in.m_85.z;
    float _1970 = in.m_85.w;
    float _1972 = _1962;
    if (!_1916)
    {
        _1956 = _1878;
    }
    float _1974 = _1956;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1814)
    {
        float _1978 = _1952 ? as_type<float>(_1944) : _1790;
        _1832 = _1978;
    }
    float _1980 = _1832;
    if (_1916)
    {
        _1948 = _1880;
    }
    float _1982 = _1948;
    float _1984 = _1982;
    if (!_1916)
    {
        float _1986 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1974);
        _1972 = _1986;
    }
    float _1988 = _1972;
    float _1990 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1992 = 0.0;
    if (_1916)
    {
        _1992 = _1882;
    }
    float _1994 = _1992;
    float _1996 = 0.0;
    float _1998 = _1994;
    if (_1916)
    {
        _1996 = _1982;
    }
    float _2000 = _1996;
    float _2002 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2004 = _1860 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2006 = _2000;
    if (!_1916)
    {
        _1984 = _1880;
    }
    float _2008 = _1984;
    float _2010 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2014 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2016 = 0.0;
    if (_1916)
    {
        _2016 = _1994;
    }
    float _2018 = _2016;
    float _2020 = _2010 * _1976;
    float _2022 = _1904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2024 = _2018;
    if (!_1916)
    {
        float _2026 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2006 = _2026;
    }
    float _2028 = _2006;
    float _2030 = _1990 * _1924;
    if (!_1916)
    {
        _1998 = _1882;
    }
    float _2032 = _1998;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2036 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2038 = abs(_1116);
    float _2040 = log2(_2038);
    float _2042 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1916)
    {
        float _2044 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2024 = _2044;
    }
    float _2046 = _2024;
    out.m_87.x = _2012;
    out.m_87.y = _2014;
    out.m_87.z = _2034;
    float _2048 = _2036 * _1866;
    float _2050 = _1966 * _2032;
    float _2052 = _2042 * _1792;
    float _2054 = -_2050;
    float _2056 = fma(_1968, _2008, _2054);
    float _2058 = -_1966;
    float _2060 = _810 * _2058;
    out.m_89.x = _2048;
    out.m_89.y = _2030;
    out.m_89.z = _2052;
    out.m_89.w = _2020;
    bool _2062 = _1116 <= 8000.0;
    bool _2064 = isnan(_1116);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan(8000.0);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = fma(_820, _1964, _2060);
    float _2076 = _1968 * _1974;
    float _2078 = _1964 * _2008;
    float _2080 = fma(_822, _1968, _2074);
    float _2082 = -_2076;
    float _2084 = fma(_1964, _2032, _2082);
    float _2086 = -_2078;
    float _2088 = fma(_1966, _1974, _2086);
    float _2090 = _2056 * _1970;
    float _2092 = _2084 * _1970;
    float _2094 = _2088 * _1970;
    float _2096 = -_2028;
    float _2098 = _810 * _2096;
    float _2100 = _816 * _1966;
    float _2102 = -_2092;
    float _2104 = _810 * _2102;
    float _2106 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2108 = fma(_820, _1988, _2098);
    float _2110 = _818 * _1966;
    float _2112 = fma(_820, _2090, _2104);
    float _2114 = exp2(_2106);
    float _2116 = _816 * _2028;
    float _2118 = _816 * _2092;
    float _2120 = fma(_830, _1964, _2100);
    float _2122 = _818 * _2092;
    float _2124 = fma(_830, _1988, _2116);
    float _2126 = fma(_830, _2090, _2118);
    float _2128 = _818 * _2028;
    float _2130 = fma(_842, _2090, _2122);
    float _2132 = fma(_838, _1968, _2120);
    float _2134 = fma(_842, _1964, _2110);
    float _2136 = fma(_838, _2094, _2126);
    float _2138 = fma(_822, _2046, _2108);
    float _2140 = fma(_842, _1988, _2128);
    float _2142 = fma(_822, _2094, _2112);
    float _2144 = fma(_2114, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = fma(_838, _2046, _2124);
    float _2150 = fma(_850, _2094, _2130);
    float _2152 = _2132 * _320;
    float _2154 = _2148 * _320;
    float _2156 = _2136 * _320;
    float _2158 = _2132 * _330;
    float _2160 = _2148 * _330;
    float _2162 = _2136 * _330;
    float _2164 = fma(_850, _2046, _2140);
    float _2166 = fma(_850, _1968, _2134);
    float _2168 = fma(_2146, -2.0, 3.0);
    float _2170 = _2146 * _2146;
    float _2172 = _2148 * _334;
    float _2174 = _2132 * _334;
    float _2176 = fma(_2080, _294, _2152);
    float _2178 = fma(_2142, _294, _2156);
    float _2180 = fma(_2080, _298, _2158);
    float _2182 = fma(_2138, _298, _2160);
    float _2184 = fma(_2142, _298, _2162);
    float _2186 = _2136 * _334;
    float _2188 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1820);
    float _2190 = fma(_2138, _294, _2154);
    float _2192 = fma(_2080, _302, _2174);
    float _2194 = fma(_2166, _338, _2176);
    float _2196 = fma(_2150, _342, _2184);
    float _2198 = fma(_2142, _302, _2186);
    float _2200 = _2188 + _1679;
    float _2202 = fma(_2166, _342, _2180);
    float _2204 = fma(_2166, _346, _2192);
    float _2206 = fma(_2150, _338, _2178);
    float _2208 = fma(_2150, _346, _2198);
    float _2210 = _2200 * 0.5;
    float _2212 = fma(_2138, _302, _2172);
    float _2214 = _2170 * _2168;
    out.m_91.x = _2194;
    out.m_91.y = _2202;
    out.m_91.z = _2204;
    float _2216 = _2170;
    if (!_1599)
    {
        _2216 = 1.0;
    }
    float _2218 = _2216;
    float _2220 = fma(_2164, _346, _2212);
    float _2222 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_93.x = _2206;
    out.m_93.y = _2196;
    out.m_93.z = _2208;
    float _2224 = fma(_2164, _338, _2190);
    float _2226 = fma(_2164, _342, _2182);
    out.gl_Position.x = _1733;
    out.gl_Position.y = _1707;
    out.gl_Position.z = _2188;
    out.gl_Position.w = _1679;
    float _2228 = exp2(_2222);
    out.m_95.z = _2210;
    out.m_95.w = _1679;
    float _2230 = _2218;
    if (_1599)
    {
        bool _2232 = _1715 >= _1697;
        bool _2234 = isnan(_1715);
        bool _2236 = _2232 || _2234;
        bool _2238 = isnan(_1697);
        bool _2240 = _2236 || _2238;
        float _2242 = float(_2240);
        _2230 = _2242;
    }
    float _2244 = _2230;
    float _2246 = -_2214;
    float _2248 = _2246 + 1.0;
    out.m_97.x = _1723;
    out.m_97.y = _1725;
    out.m_97.z = _1727;
    float _2250 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2214);
    float _2252 = _2072 * _2250;
    float _2254 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2256 = _2252;
    if (_1299)
    {
        _2256 = 1.0;
    }
    float _2258 = _2256;
    float _2260 = -_1741;
    float _2262 = _2260 + 1.0;
    float _2264 = _2262 * _2254;
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = _2258;
    if (!_1299)
    {
        int _2270 = _1383 << 4;
        int _2272 = _2270 + 2048;
        uint _2274 = uint(int(uint(_2272) >> uint(2)));
        uint _2276 = uint(int(uint(int(_2274)) >> uint(2)));
        int _2278 = int(_2274) & 3;
        float _2280 = (*spvDescriptorSet0.vp_c15)._m0[int(_2276)][_2278];
        int _2282 = int(_2274) + 1;
        uint _2284 = uint(int(uint(_2282) >> uint(2)));
        int _2286 = _2282 & 3;
        float _2288 = (*spvDescriptorSet0.vp_c15)._m0[int(_2284)][_2286];
        int _2290 = _2272 + 8;
        uint _2292 = uint(int(uint(_2290) >> uint(2)));
        uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
        int _2296 = int(_2292) & 3;
        float _2298 = (*spvDescriptorSet0.vp_c15)._m0[int(_2294)][_2296];
        int _2300 = int(_2292) + 1;
        uint _2302 = uint(int(uint(_2300) >> uint(2)));
        int _2304 = _2300 & 3;
        float _2306 = (*spvDescriptorSet0.vp_c15)._m0[int(_2302)][_2304];
        float _2308 = _996 * _2288;
        float _2310 = fma(_858, _2280, _2308);
        float _2312 = fma(_828, _2298, _2310);
        float _2314 = _2312 + _2306;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        float _2318 = -_2316;
        float _2320 = _2318 + _1786;
        float _2322 = fma(_2320, 500.0, 1.5);
        float _2324 = exp2(_2322);
        float _2326 = 0.0 + _2324;
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        _2268 = _2328;
    }
    float _2330 = _2268;
    float _2332 = -_2228;
    float _2334 = _2332 + 1.0;
    float _2336 = _2244 * _2330;
    float _2338 = -_2266;
    float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_99.x = _2224;
    out.m_99.y = _2226;
    out.m_99.z = _2220;
    float _2342 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2344 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2346 = isnan(_1112);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2352 = _2348 || _2350;
    float _2354 = -_2336;
    float _2356 = fma(_2354, _2340, 1.0);
    float _2358 = precise::clamp(_2356, 0.0, 1.0);
    out.m_101.x = _1014;
    out.m_101.y = _994;
    out.m_101.z = _1018;
    float _2360 = _2342 * _1759;
    float _2362 = -_2342;
    float _2364 = _2362 + 1.0;
    float _2366 = _2358 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2368 = _1770 * _2360;
    float _2370 = _1778 * _2360;
    out.m_103.x = _2366;
    float _2372 = fma(_1774, _2368, _1764);
    float _2374 = fma(_1776, _2368, _1766);
    float _2376 = _1770 * _2364;
    float _2378 = fma(_1770, _2370, _1768);
    out.m_105.x = 1.0;
    out.m_105.y = 1.0;
    out.m_105.z = 1.0;
    float _2380 = _2364;
    float _2382 = _2360;
    float _2384 = _2370;
    float _2386 = 1.0;
    float _2388 = 1.0;
    if (!_2352)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2390 = _2380;
    float _2392 = _2390;
    float _2394 = _2390;
    if (!_2352)
    {
        _914 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2396 = _914;
    out.m_107.x = _2372;
    out.m_107.y = _2374;
    out.m_107.z = _2378;
    out.m_107.w = _2376;
    float _2398 = _2396;
    float _2400 = _2396;
    if (!_2352)
    {
        _2382 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2402 = _2382;
    float _2404 = _2402;
    float _2406 = _2402;
    if (!_2352)
    {
        _2384 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2408 = _2384;
    float _2410 = _2408;
    float _2412 = _2408;
    if (!_2352)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2414 = _2386;
    float _2416 = _2414;
    float _2418 = _2414;
    if (!_2352)
    {
        _2388 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2420 = _2388;
    bool _2422 = !_2352;
    float _2424 = _2420;
    float _2426 = _2420;
    if (!_2422)
    {
        bool _2428 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2430 = isnan(_1112);
        bool _2432 = _2428 || _2430;
        bool _2434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2436 = _2432 || _2434;
        if (!_2436)
        {
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2440 = _1112 + _2438;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2442;
            float _2446 = 1.0 / _2444;
            float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2450 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2464 = _2440 * _2446;
            float _2466 = precise::clamp(_2464, 0.0, 1.0);
            float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2470 = _2468 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2476 = fma(_2466, _2450, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2478 = fma(_2466, _2470, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2480 = fma(_2466, _2474, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2482 = fma(_2466, _2454, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2484 = fma(_2466, _2458, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2486 = fma(_2466, _2462, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2418 = _2480;
            _2406 = _2484;
            _2394 = _2478;
            _2426 = _2482;
            _2400 = _2476;
            _2412 = _2486;
            _2488 = true;
        }
        else
        {
            bool _2490 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2492 = isnan(_1112);
            bool _2494 = _2490 || _2492;
            bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2498 = _2494 || _2496;
            if (!_2498)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2500 = _2392;
            _2394 = _2500;
            if (!_2498)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2502 = _2416;
            _2418 = _2502;
            if (!_2498)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2504 = _2398;
            _2400 = _2504;
            if (!_2498)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2506 = _2424;
            _2426 = _2506;
            if (!_2498)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2508 = _2404;
            _2406 = _2508;
            if (!_2498)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2510 = _2410;
            bool _2512 = !_2498;
            _2412 = _2510;
            if (!_2512)
            {
                bool _2514 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2516 = isnan(_1112);
                bool _2518 = _2514 || _2516;
                bool _2520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2522 = _2518 || _2520;
                if (!_2522)
                {
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2526 = _1112 + _2524;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2528;
                    float _2532 = 1.0 / _2530;
                    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2550 = _2526 * _2532;
                    float _2552 = precise::clamp(_2550, 0.0, 1.0);
                    float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2562 = fma(_2552, _2536, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2564 = fma(_2552, _2556, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2566 = fma(_2552, _2560, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2568 = fma(_2552, _2540, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2570 = fma(_2552, _2544, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2572 = fma(_2552, _2548, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2418 = _2566;
                    _2406 = _2570;
                    _2394 = _2564;
                    _2426 = _2568;
                    _2400 = _2562;
                    _2412 = _2572;
                    _2488 = true;
                }
                else
                {
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2488 = false;
    float _2574 = _2418;
    float _2576 = _2406;
    float _2578 = _2394;
    float _2580 = _2426;
    float _2582 = _2400;
    float _2584 = _2412;
    float _2586 = fma(_2226, -0.5, 0.5);
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = -_2574;
    float _2592 = _2590 + _2576;
    float _2594 = -_2578;
    float _2596 = _2594 + _2580;
    float _2598 = -_2582;
    float _2600 = _2598 + _2584;
    bool _2602 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2604 = fma(_2588, _2592, _2574);
    float _2606 = fma(_2588, _2596, _2578);
    float _2608 = fma(_2588, _2600, _2582);
    float _2610 = _2604 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2612 = fma(_2606, 0.298911988735198974609375, _2610);
    float _2614 = fma(_2608, 0.114477999508380889892578125, _2612);
    out.m_109.x = 0.0;
    float _2616 = -_2614;
    float _2618 = _2606 + _2616;
    float _2620 = -_2614;
    float _2622 = _2604 + _2620;
    float _2624 = -_2614;
    float _2626 = _2608 + _2624;
    float _2628 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2630 = fma(_2618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2614);
    float _2632 = fma(_2622, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2614);
    float _2634 = fma(_2626, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2614);
    out.m_103.w = _2628;
    out.m_111.x = _2630;
    out.m_111.y = _2632;
    out.m_111.z = _2634;
    if (!_2602)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2636 = -_994;
    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2640 = -_1014;
    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2644 = -_1018;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2648 = _2638 * _2638;
    float _2650 = fma(_2642, _2642, _2648);
    float _2652 = fma(_2646, _2646, _2650);
    float _2654 = sqrt(_2652);
    float _2656 = rsqrt(_2652);
    float _2658 = -_2654;
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2662 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2664 = precise::clamp(_2662, 0.0, 1.0);
    float _2666 = _2642 * _2656;
    float _2668 = _2638 * _2656;
    float _2670 = abs(_2664);
    float _2672 = log2(_2670);
    float _2674 = _2646 * _2656;
    float _2676 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2678 = _2226 * _2668;
    float _2680 = -_2668;
    float _2682 = -_2676;
    float _2684 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2682);
    float _2686 = fma(_2224, _2666, _2678);
    float _2688 = -_2674;
    float _2690 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2684);
    float _2692 = fma(_2220, _2674, _2686);
    float _2694 = precise::clamp(_2692, 0.0, 1.0);
    float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2698 = _2690 + _2696;
    float _2700 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2702 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = exp2(_2700);
    float _2708 = _2706 * _2704;
    float _2710 = _2694 * _2708;
    float _2712 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2714 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2716 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _2712;
    out.m_109.y = _2714;
    out.m_109.z = _2716;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2488 = false;
    bool _368 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_58.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_61.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2773 = as_type<float>(_146);
        out.gl_Position.z = _2773;
    }
    if (!_134)
    {
        return out;
    }
    float _150 = in.m_63.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = _164;
    if (_160)
    {
        float _168 = float(_130);
        _140 = _168;
    }
    float _170 = _140;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    float _178 = _170;
    if (_176)
    {
        _178 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _178;
    if (_176)
    {
        out.m_61.x = 0.0;
    }
    if (_176)
    {
        float _182 = _180 * 5.0;
        _148 = as_type<int>(_182);
    }
    int _184 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2843 = as_type<float>(_184);
        out.gl_Position.z = _2843;
    }
    if (_176)
    {
        return out;
    }
    float _186 = in.m_65.x;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.x;
    float _194 = in.m_67.y;
    float _196 = in.m_67.z;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = _190 * _190;
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_202, _202, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = _224;
    float _234 = _186;
    float _236 = _190;
    if (_228)
    {
        float _238 = rsqrt(_216);
        _232 = _238;
    }
    float _240 = _232;
    float _242 = 0.0;
    if (!_228)
    {
        _242 = 0.0;
    }
    float _244 = _242;
    bool _246 = _226 > 0.0;
    float _248 = 0.0;
    float _250 = _244;
    if (!_228)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _252;
    if (!_228)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = _226;
    float _262 = _258;
    if (_230)
    {
        float _264 = rsqrt(_218);
        _260 = _264;
    }
    float _266 = _260;
    float _268 = 0.0;
    float _270 = 0.0;
    if (!_230)
    {
        _268 = 0.0;
        _270 = 0.0;
    }
    float _272 = _268;
    float _274 = _270;
    float _276 = 0.0;
    float _278 = _272;
    float _280 = _274;
    if (!_230)
    {
        _276 = 0.0;
    }
    float _282 = _276;
    float _284 = 0.0;
    float _286 = _282;
    if (_246)
    {
        float _288 = rsqrt(_220);
        _284 = _288;
    }
    float _290 = _284;
    if (_228)
    {
        float _292 = _240 * _192;
        _250 = _292;
    }
    float _294 = _250;
    if (_228)
    {
        float _296 = _240 * _186;
        _256 = _296;
    }
    float _298 = _256;
    if (_228)
    {
        float _300 = _240 * _198;
        _262 = _300;
    }
    float _302 = _262;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _306 = 0.0;
    if (!_246)
    {
        _306 = 0.0;
    }
    float _308 = _306;
    float _310 = 0.0;
    float _312 = _308;
    if (!_246)
    {
        _310 = 0.0;
    }
    float _314 = _310;
    float _316 = _314;
    if (_230)
    {
        float _318 = _266 * _194;
        _278 = _318;
    }
    float _320 = _278;
    float _322 = 0.0;
    if (!_246)
    {
        _322 = 0.0;
    }
    float _324 = _322;
    float _326 = _324;
    if (_230)
    {
        float _328 = _266 * _188;
        _280 = _328;
    }
    float _330 = _280;
    if (_230)
    {
        float _332 = _266 * _200;
        _286 = _332;
    }
    float _334 = _286;
    if (_246)
    {
        float _336 = _290 * _196;
        _312 = _336;
    }
    float _338 = _312;
    if (_246)
    {
        float _340 = _290 * _190;
        _316 = _340;
    }
    float _342 = _316;
    if (_246)
    {
        float _344 = _290 * _202;
        _326 = _344;
    }
    float _346 = _326;
    bool _348 = !_304;
    float _366;
    if (!_348)
    {
        float _350 = in.m_71.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_130);
        float _372 = 1.0 / _370;
        float _374 = _164 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_71.z;
    float _380 = in.m_71.y;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _382;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _392 = _390 != 0;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _396 = _394 != 0;
    float _398 = in.m_71.x;
    float _400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _402 = log2(_400);
    float _404 = in.m_58.x;
    float _406 = in.m_58.y;
    float _408 = in.m_58.z;
    float _410 = 1.0 / _384;
    float _412 = _378 * 2.0;
    float _414 = _402 * _164;
    float _416 = _380 * 2.0;
    float _418 = floor(_412);
    float _420 = _398 * 2.0;
    float _422 = _398 + _378;
    float _424 = _194 * _406;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _428 = _376 + _426;
    float _430 = floor(_416);
    float _432 = _422 + (-1.0);
    float _434 = fma(_192, _404, _424);
    float _436 = _380 + _378;
    float _438 = _428 * _410;
    float _440 = _200 * _406;
    float _442 = _188 * _406;
    float _444 = _436 + (-1.0);
    float _446 = floor(_420);
    bool _448 = _418 > 0.0;
    float _450 = fma(_198, _404, _440);
    bool _452 = _418 >= 0.0;
    bool _454 = isnan(_418);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = fma(_186, _404, _442);
    float _464 = fma(_202, _408, _450);
    int _466 = _460 ? 0 : 1;
    float _468 = exp2(_414);
    bool _470 = _430 > 0.0;
    float _472 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _474 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _476 = !_388;
    int _478 = _476 ? 0 : 1;
    float _480 = fma(_190, _408, _462);
    bool _482 = _430 >= 0.0;
    bool _484 = isnan(_430);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    bool _492 = _446 > 0.0;
    bool _494 = _446 >= 0.0;
    bool _496 = isnan(_446);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    int _504 = ~_466;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    int _510 = abs(_478);
    int _512 = _508;
    float _514 = _378;
    if (!_448)
    {
        int _516 = ~_466;
        int _518 = _516 + 1;
        _512 = _518;
    }
    int _520 = _512;
    float _522 = -_468;
    float _524 = _522 + 1.0;
    int _526 = _490 ? 0 : 1;
    float _528 = float(_510);
    float _530 = float(_520);
    int _532 = ~_526;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    int _538 = _536;
    if (!_470)
    {
        int _540 = ~_526;
        int _542 = _540 + 1;
        _538 = _542;
    }
    int _544 = _538;
    float _546 = _528 * _530;
    int _548 = _502 ? 0 : 1;
    float _550 = in.m_73.x;
    float _552 = in.m_73.y;
    float _554 = in.m_73.z;
    float _556 = _546 * (-2.0);
    bool _558 = !_392;
    int _560 = _558 ? 0 : 1;
    int _562 = ~_548;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _570 = 1.0 + _568;
    int _572 = _566;
    if (!_492)
    {
        int _574 = ~_548;
        int _576 = _574 + 1;
        _572 = _576;
    }
    int _578 = _572;
    bool _580 = !_396;
    int _582 = _580 ? 0 : 1;
    float _584 = 1.0 / _570;
    int _586 = abs(_560);
    float _588 = _398 + _380;
    int _590 = abs(_582);
    float _592 = _588 + (-1.0);
    bool _594 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _596 = isnan(1.0);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _602 = _598 || _600;
    float _604 = float(_586);
    float _606 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _608 = float(_578);
    float _610 = _398 + (-0.5);
    bool _612 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _620 = _616 || _618;
    float _622 = fma(_556, _550, _550);
    float _624 = float(_590);
    float _626 = _604 * _608;
    float _628 = _620 ? _524 : 0.0;
    float _630 = float(_544);
    float _632 = _626 * (-2.0);
    if (_602)
    {
        float _634 = _628 * _584;
        _166 = _634;
    }
    float _636 = _166;
    float _638 = fma(_606, _556, _606);
    float _640 = fma(_472, _632, _472);
    float _642 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[196].x, _622);
    float _644 = fma(_632, _552, _552);
    float _646 = _380 + (-0.5);
    float _648 = _624 * _630;
    float _650 = fma(_638, _636, _642);
    float _652 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _644);
    float _654 = _648 * (-2.0);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _656;
    float _660 = fma(_640, _636, _652);
    bool _662 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _664 = isnan(_376);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _678;
    float _682 = in.m_75.x;
    float _684 = in.m_75.y;
    float _686 = in.m_75.z;
    float _688 = _650 * 0.15915493667125701904296875;
    bool _690 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _692 = isnan(_376);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -_672;
    float _704 = _702 + 1.0;
    float _706 = fma(_658, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _708 = fma(_676, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _710 = fma(_680, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _712 = fma(_654, _554, _554);
    float _714 = _378 + (-0.5);
    float _716 = in.m_77.x;
    float _718 = in.m_77.y;
    float _720 = in.m_77.z;
    float _722 = _700 * _704;
    float _724 = fma(_474, _654, _474);
    float _726 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].z, _712);
    float _728 = -_700;
    float _730 = _728 + 1.0;
    float _732 = _710 * _722;
    float _734 = _706 * _722;
    float _736 = _708 * _722;
    float _738 = fma(_724, _636, _726);
    float _740 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[143].z, _732);
    float _742 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[143].x, _734);
    float _744 = _660 * 0.15915493667125701904296875;
    float _746 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[143].y, _736);
    float _748 = _738 * 0.15915493667125701904296875;
    float _750 = _688 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[144].z, _740);
    float _756 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[144].x, _742);
    float _758 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[144].y, _746);
    float _760 = _754 * _686;
    float _762 = _756 * _682;
    float _764 = _744 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = _758 * _684;
    float _770 = in.m_69.w;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _774 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _778 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    float _782 = _744 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _772 * _774;
    float _788 = _776 * _778;
    float _790 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = in.m_67.w;
    float _794 = _780 * _790;
    float _796 = _688 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _752 * _766;
    float _802 = _748 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = _752 * _784;
    float _808 = _748 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _798 * _766;
    float _814 = _798 * _784;
    float _816 = _752 * _804;
    float _818 = _798 * _804;
    float _820 = _784 * _804;
    float _822 = _766 * _804;
    float _824 = _816 * _788;
    float _826 = fma(_196, _408, _434);
    float _828 = _464 + _770;
    float _830 = fma(_810, _806, _812);
    float _832 = -_788;
    float _834 = _810 * _832;
    float _836 = -_814;
    float _838 = fma(_810, _800, _836);
    float _840 = -_800;
    float _842 = fma(_810, _814, _840);
    float _844 = fma(_830, _786, _824);
    float _846 = _818 * _788;
    float _848 = fma(_820, _786, _834);
    float _850 = fma(_810, _812, _806);
    float _852 = fma(_838, _794, _844);
    float _854 = fma(_842, _786, _846);
    float _856 = fma(_822, _794, _848);
    float _858 = _826 + _792;
    float _860 = _852 * _334;
    float _862 = fma(_850, _794, _854);
    float _864 = _852 * _320;
    float _866 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _868 = fma(_856, _302, _860);
    float _870 = fma(_856, _294, _864);
    float _872 = in.m_65.w;
    float _874 = fma(_862, _346, _868);
    float _876 = floor(_866);
    float _878 = fma(_862, _338, _870);
    float _880 = _828 + _874;
    float _882 = _858 + _878;
    float _884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _886 = _880 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _890 = _882 + _888;
    float _892 = _886 * _886;
    float _894 = fma(_890, _890, _892);
    float _896 = sqrt(_894);
    float _898 = _480 + _872;
    bool _900 = _896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _904 = _896 + _902;
    float _906 = _874;
    float _908 = _896;
    float _910 = _848;
    float _912 = _852;
    float _914 = _858;
    if (_900)
    {
        float _916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _916;
    }
    float _918 = _906;
    if (!_900)
    {
        _234 = _882;
    }
    float _920 = _234;
    float _922 = _920;
    if (!_900)
    {
        _236 = _880;
    }
    float _924 = _236;
    float _926 = _924;
    if (_900)
    {
        float _928 = _904 * _918;
        _908 = _928;
    }
    float _930 = _908;
    if (_900)
    {
        float _932 = _930 * 0.15915493667125701904296875;
        _910 = _932;
    }
    float _934 = _910;
    float _936 = _852 * _330;
    float _938 = _918;
    if (_900)
    {
        float _940 = _934 * 6.283185482025146484375;
        float _942 = cos(_940);
        _938 = _942;
    }
    float _944 = _938;
    float _946 = fma(_856, _298, _936);
    float _948 = fma(_862, _342, _946);
    float _950 = _404;
    float _952 = _946;
    float _954 = _948;
    if (_900)
    {
        float _956 = _934 * 6.283185482025146484375;
        float _958 = sin(_956);
        _950 = _958;
    }
    float _960 = _950;
    float _962 = _898 + _948;
    float _964 = _962;
    if (_900)
    {
        float _966 = _962 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _952 = _966;
    }
    float _968 = _952;
    float _970 = _936;
    float _972 = _968;
    if (_900)
    {
        float _974 = rsqrt(_894);
        _970 = _974;
    }
    float _976 = _970;
    if (_900)
    {
        float _978 = _944 + (-1.0);
        _954 = _978;
    }
    float _980 = _954;
    if (_900)
    {
        float _982 = fma(_960, _968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _912 = _982;
    }
    float _984 = _912;
    if (_900)
    {
        float _986 = _980 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _986;
    }
    float _988 = _972;
    float _990 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    if (_900)
    {
        float _992 = fma(_962, _944, _988);
        _964 = _992;
    }
    float _994 = _964;
    float _996 = _898 + _990;
    float _998 = _976;
    if (_900)
    {
        float _1000 = _976 * _984;
        _998 = _1000;
    }
    float _1002 = _998;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _994 + _1004;
    float _1008 = _996 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1010 = _996 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    if (_900)
    {
        float _1012 = fma(_890, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _922 = _1012;
    }
    float _1014 = _922;
    if (_900)
    {
        float _1016 = fma(_886, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _926 = _1016;
    }
    float _1018 = _926;
    float _1020 = _1006 * _1006;
    float _1022 = _898 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1026 = _1014 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1030 = _1018 + _1028;
    float _1032 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1022);
    float _1034 = fma(_1026, _1026, _1020);
    float _1036 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1008);
    float _1038 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1010);
    float _1040 = fma(_1030, _1030, _1034);
    float _1042 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1032);
    float _1044 = _898 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1046 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1036);
    float _1048 = rsqrt(_1040);
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1052 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1044);
    float _1054 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1038);
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1058 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    float _1060 = _1054 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1062 = 1.0 / _1050;
    float _1064 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1066 = _1064 + _1050;
    float _1068 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1070 = trunc(_1056);
    int _1072 = int(_1070);
    float _1074 = _1026 * _1068;
    float _1076 = _1030 * _1068;
    float _1078 = _1074 * _1074;
    float _1080 = _1076 * _1076;
    float _1082 = _1066 * _1062;
    float _1084 = _1082 * 0.5;
    float _1086 = trunc(_1060);
    int _1088 = int(_1086);
    float _1090 = _1078 + _1080;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1094 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1092);
    int _1096 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1098 = _1072 + _1096;
    int _1100 = _1098 + 1;
    float _1102 = sqrt(_1090);
    float _1104 = 1.0 / _1094;
    bool _1106 = _1102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1102 + _1108;
    float _1112 = sqrt(_1040);
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1116 = _1104 * _1114;
    bool _1118 = _1116 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1120 = _894;
    float _1122 = _1090;
    int _1124 = 2;
    float _1126 = _1074;
    float _1128 = _1076;
    float _1130 = _1078;
    int _1132 = as_type<int>(_1080);
    float _1134 = _1060;
    bool _1136 = _1106;
    if (_1106)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1138;
    }
    float _1140 = _1120;
    bool _1142 = _1116 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1144 = !_1118;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = as_type<float>(_1146);
    if (_1106)
    {
        float _1150 = rsqrt(_1090);
        _1122 = _1150;
    }
    float _1152 = _1122;
    float _1154 = _1152;
    if (!_1118)
    {
        _1124 = 1;
    }
    int _1156 = _1124;
    int _1158 = _1156;
    if (!_1142)
    {
        _1158 = _1146;
    }
    int _1160 = _1158;
    if (_1106)
    {
        float _1162 = _1110 * _1140;
        _1148 = _1162;
    }
    float _1164 = _1148;
    bool _1166 = _1100 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1168 = _1160 << 6;
    float _1170 = 0.0;
    if (_1106)
    {
        float _1172 = _1164 * 0.15915493667125701904296875;
        _1170 = _1172;
    }
    float _1174 = _1170;
    float _1176 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1178 = _1168 + 96;
    uint _1181 = uint(int(uint(_1178) >> uint(2)));
    uint _1183 = uint(int(uint(int(_1181)) >> uint(2)));
    int _1185 = int(_1181) & 3;
    float _1187 = (*spvDescriptorSet0.vp_c15)._m0[int(_1183)][_1185];
    int _1189 = int(_1181) + 1;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    int _1193 = _1189 & 3;
    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[int(_1191)][_1193];
    float _1197 = 0.0;
    float _1199 = _1174;
    if (_1106)
    {
        float _1201 = _1174 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        _1197 = _1203;
    }
    float _1205 = _1197;
    float _1207 = precise::max(0.0, _1176);
    int _1209 = _1168 + 48;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    uint _1213 = uint(int(uint(int(_1211)) >> uint(2)));
    int _1215 = int(_1211) & 3;
    float _1217 = (*spvDescriptorSet0.vp_c15)._m0[int(_1213)][_1215];
    int _1219 = int(_1211) + 1;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    int _1223 = _1219 & 3;
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[int(_1221)][_1223];
    float _1227 = 0.0;
    if (_1106)
    {
        float _1229 = _1174 * 6.283185482025146484375;
        float _1231 = cos(_1229);
        _1227 = _1231;
    }
    float _1233 = _1227;
    float _1235 = -_1068;
    float _1237 = -_1207;
    float _1239 = fma(_1006, _1235, _1237);
    int _1241 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1243 = _1088 + _1241;
    int _1245 = _1243 + 1;
    float _1247 = 0.0;
    if (_1106)
    {
        float _1249 = _1239 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1247 = _1249;
    }
    float _1251 = _1247;
    int _1253 = _1100 | _1245;
    int _1255 = _1168 + 104;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c15)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    float _1273 = 0.0;
    float _1275 = as_type<float>(_1253);
    if (_1106)
    {
        float _1277 = fma(_1205, _1251, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1273 = _1277;
    }
    float _1279 = _1273;
    bool _1281 = _1253 < 0;
    bool _1283 = _1281 || _1166;
    float _1285 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1287 = _1279;
    if (!_1106)
    {
        _1275 = _1239;
    }
    float _1289 = _1275;
    float _1291 = _1289;
    if (_1106)
    {
        float _1293 = _1152 * _1279;
        _1287 = _1293;
    }
    float _1295 = _1287;
    bool _1297 = _1245 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1299 = _1297 || _1283;
    int _1301 = _1168 + 64;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    uint _1305 = uint(int(uint(int(_1303)) >> uint(2)));
    int _1307 = int(_1303) & 3;
    float _1309 = (*spvDescriptorSet0.vp_c15)._m0[int(_1305)][_1307];
    int _1311 = int(_1303) + 1;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    int _1315 = _1311 & 3;
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[int(_1313)][_1315];
    float _1319 = _1233;
    if (_1106)
    {
        float _1321 = _1233 + (-1.0);
        _1154 = _1321;
    }
    float _1323 = _1154;
    float _1325 = floor(_1285);
    float _1327 = _1323;
    if (_1106)
    {
        float _1329 = _1074 * _1295;
        _1126 = _1329;
    }
    float _1331 = _1126;
    if (_1106)
    {
        float _1333 = _1076 * _1295;
        _1128 = _1333;
    }
    float _1335 = _1128;
    if (_1106)
    {
        float _1337 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1337;
    }
    float _1339 = _1327;
    int _1341 = as_type<int>(_1339);
    if (_1106)
    {
        float _1343 = _1331 * _1331;
        _1130 = _1343;
    }
    float _1345 = _1130;
    int _1347 = _1168 + 56;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    if (_1106)
    {
        float _1365 = fma(_1239, _1233, _1339);
        _1291 = _1365;
    }
    float _1367 = _1291;
    if (!_1106)
    {
        _1319 = _1080;
    }
    float _1369 = _1319;
    float _1371 = _1369;
    if (_1106)
    {
        float _1373 = _1335 * _1335;
        _1371 = _1373;
    }
    float _1375 = _1371;
    int _1377 = as_type<int>(_1375);
    if (!_1299)
    {
        int _1379 = _1245 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1381 = _1379 + _1100;
        _1132 = _1381;
    }
    int _1383 = _1132;
    float _1385 = -_876;
    float _1387 = _866 + _1385;
    float _1389 = fma(_1367, _1367, _1345);
    int _1391 = _1168 + 72;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    uint _1395 = uint(int(uint(int(_1393)) >> uint(2)));
    int _1397 = int(_1393) & 3;
    float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
    int _1401 = int(_1393) + 1;
    uint _1403 = uint(int(uint(_1401) >> uint(2)));
    int _1405 = _1401 & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    if (!_1299)
    {
        int _1409 = _1383 << 2;
        _1341 = _1409;
    }
    int _1411 = _1341;
    float _1413 = _1389 + _1375;
    float _1415 = -_1325;
    float _1417 = _1285 + _1415;
    int _1419 = _1411;
    if (!_1299)
    {
        uint _1421 = uint(int(uint(_1383) >> uint(2)));
        _1377 = int(_1421);
    }
    int _1423 = _1377;
    if (!_1299)
    {
        int _1425 = 12 & _1411;
        _1419 = _1425;
    }
    int _1427 = _1419;
    float _1429 = _996 * _1195;
    float _1431 = rsqrt(_1413);
    float _1433 = fma(_858, _1187, _1429);
    int _1435 = as_type<int>(_1187);
    if (!_1299)
    {
        int _1437 = _1423 << 4;
        int _1439 = _1437 + _1427;
        _1435 = _1439;
    }
    int _1441 = _1435;
    float _1443 = _996 * _1225;
    float _1445 = fma(_858, _1217, _1443);
    float _1447 = fma(_828, _1263, _1433);
    float _1449 = _994 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1451 = _1431 * _1331;
    float _1453 = _1431 * _1335;
    float _1455 = _1447 + _1271;
    float _1457 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1449);
    int _1459 = _1168 + 88;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c15)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    float _1477 = _996 * _1317;
    float _1479 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1457);
    float _1481 = 1.0 / _1455;
    float _1483 = fma(_858, _1309, _1477);
    float _1485 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1487 = fma(_828, _1355, _1445);
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1491 = fma(_1112, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1489);
    float _1493 = precise::clamp(_1491, 0.0, 1.0);
    int _1495 = _1168 + 80;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    float _1513 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1515 = _1487 + _1363;
    float _1517 = -_1493;
    float _1519 = _1517 + 1.0;
    float _1521 = _994 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1523 = _1477;
    if (!_1299)
    {
        float _1525 = floor(_1056);
        _1523 = _1525;
    }
    float _1527 = _1523;
    float _1529 = fma(_828, _1399, _1483);
    float _1531 = _1431 * _1367;
    float _1533 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1537 = _1529 + _1407;
    float _1539 = _994 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1541 = -_1533;
    float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1541);
    float _1545 = _1515 * _1481;
    float _1547 = abs(_1519);
    float _1549 = log2(_1547);
    float _1551 = _1537 * _1481;
    float _1553 = -_1513;
    float _1555 = fma(_1553, _1535, 1.0);
    float _1557 = -_1453;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1543);
    bool _1561 = _1545 >= 0.0;
    float _1563 = _994 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1565 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1539);
    float _1567 = fma(_1559, -0.5, 0.5);
    bool _1569 = _1545 <= 1.0;
    bool _1571 = _1569 && _1561;
    float _1573 = _1513;
    float _1575 = _1527;
    if (!_1299)
    {
        float _1577 = floor(_1060);
        _1573 = _1577;
    }
    float _1579 = _1573;
    float _1581 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1563);
    float _1583 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1565);
    bool _1585 = _1551 >= 0.0;
    bool _1587 = _1585 && _1571;
    float _1589 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1521);
    float _1591 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1581);
    float _1593 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1595 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1597 = _1551 <= 1.0;
    bool _1599 = _1597 && _1587;
    float _1601 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1603 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1605 = exp2(_1595);
    float _1607 = fma(_1559, 0.5, 0.5);
    float _1609 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1589);
    float _1611 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1603);
    if (!_1299)
    {
        float _1613 = -_1579;
        float _1615 = _1060 + _1613;
        _1199 = _1615;
    }
    float _1617 = _1199;
    float _1619 = fma(_1607, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1621 = _1515;
    if (!_1299)
    {
        int _1623 = _1441 + 400;
        uint _1625 = uint(int(uint(_1623) >> uint(2)));
        uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
        int _1629 = int(_1625) & 3;
        float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
        _1621 = _1631;
    }
    float _1633 = _1621;
    float _1635 = sqrt(_1567);
    float _1637 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (_1599)
    {
        float _1639 = float(_1160);
        _1134 = _1639;
    }
    float _1641 = _1134;
    float _1643 = fma(_1607, _1619, -0.212114393711090087890625);
    if (!_1299)
    {
        float _1645 = -_1527;
        float _1647 = _1056 + _1645;
        _1575 = _1647;
    }
    float _1649 = _1575;
    float _1651 = fma(_1018, 6.2500002968590706586837768554688e-05, 0.5);
    float _1653 = _996 * _1511;
    float _1655 = _1531 + 1.0;
    float _1657 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1611);
    float _1659 = _1641;
    if (_1599)
    {
        float _1661 = rint(_1641);
        float _1663 = precise::max(_1661, 0.0);
        uint _1665 = uint(_1663);
        uint _1667 = clamp(_1665, 0u, 65535u);
        _1659 = as_type<float>(_1667);
    }
    float _1669 = _1659;
    float _1671 = fma(_858, _1503, _1653);
    float _1673 = -_1531;
    float _1675 = fma(_1605, _1655, _1673);
    float _1677 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1679 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1657);
    float _1681 = fma(_828, _1467, _1671);
    float _1683 = fma(_1607, _1643, 1.570728778839111328125);
    float _1685 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1677);
    float _1687 = log2(_1555);
    float _1689 = _1681 + _1475;
    float _1691 = _1635 * 0.636619746685028076171875;
    float _1693 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1685);
    float _1695 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1697 = _1689 * _1481;
    float _1699 = -_1683;
    float _1701 = fma(_1691, _1699, 1.0);
    float _1703 = fma(_1014, 6.2500002968590706586837768554688e-05, 0.5);
    float _1705 = 1.0 / _1679;
    float _1707 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1693);
    float _1709 = fma(_1675, 0.5, 0.5);
    float _1711 = _1693;
    if (_1599)
    {
        float3 _5210 = float3(_1545, _1551, float(as_type<int>(_1669)));
        float3 _5214 = select(_5210, float3(0.0), isnan(_5210));
        float _1713 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5214.xy, uint(rint(_5214.z)), _1697, level(0.0));
        _1711 = _1713;
    }
    float _1715 = _1711;
    float _1717 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1695);
    float2 _5229 = float2(_1703, _1651);
    float3 _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5229, float2(0.0), isnan(_5229)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5229, float2(0.0), isnan(_5229)), level(0.0)).xyz;
    float _1723 = _1721.x;
    float _1725 = _1721.y;
    float _1727 = _1721.z;
    float _1729 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1717);
    float _1731 = _1687 * 0.693147182464599609375;
    float _1733 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1729);
    float _1735 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = _1733 * _1705;
    float _1739 = _1707 * _1705;
    float2 _5268 = float2(_1387, _1417);
    float _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5268, float2(0.0), isnan(_5268)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5268, float2(0.0), isnan(_5268)), level(0.0)).x;
    float _1743 = fma(_1737, 0.5, 0.5);
    float _1745 = fma(_1739, -0.5, 0.5);
    float _1747 = _1633;
    if (!_1299)
    {
        float _1749 = rint(_1633);
        float _1751 = precise::max(_1749, 0.0);
        uint _1753 = uint(_1751);
        uint _1755 = clamp(_1753, 0u, 65535u);
        _1747 = as_type<float>(_1755);
    }
    float _1757 = _1747;
    float3 _5297 = float3(_1743, _1745, _1735);
    float _1759 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5297, float3(0.0), isnan(_5297)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5297, float3(0.0), isnan(_5297)), level(0.0)).x;
    float3 _5306 = float3(_1743, _1745, _1735);
    float4 _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5306, float3(0.0), isnan(_5306)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5306, float3(0.0), isnan(_5306)), level(0.0)).xyzw;
    float _1764 = _1762.x;
    float _1766 = _1762.y;
    float _1768 = _1762.z;
    float _1770 = _1762.w;
    float2 _5322 = float2(_1701, _1709);
    float3 _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5322, float2(0.0), isnan(_5322)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5322, float2(0.0), isnan(_5322)), level(0.0)).xyz;
    float _1774 = _1772.x;
    float _1776 = _1772.y;
    float _1778 = _1772.z;
    float _1780 = _1617;
    int _1782 = as_type<int>(_1757);
    if (!_1299)
    {
        float3 _5345 = float3(_1649, _1617, float(as_type<int>(_1757)));
        float3 _5347 = select(_5345, float3(0.0), isnan(_5345));
        float _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5347.xy, uint(rint(_5347.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5347.xy, uint(rint(_5347.z)), level(0.0)).x;
        _1780 = _1784;
    }
    float _1786 = _1780;
    float _1788 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1790 = in.m_79.x;
    float _1792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1794 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1796 = _1788 * _398;
    float _1798 = in.m_71.w;
    float _1800 = in.m_79.y;
    float _1802 = trunc(_1796);
    int _1804 = int(_1802);
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1808 = _1806 != 0;
    float _1810 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1794);
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1814 = _1812 != 0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1818 = _1816 != 0;
    float _1820 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1810);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1824 = _1822 != 0;
    int _1826 = _1804 << 4;
    int _1828 = _1826 + 1968;
    bool _1830 = _1818;
    float _1832 = _1790;
    if (_1808)
    {
        float _1834 = -_1790;
        float _1836 = _1834 + 1.0;
        _1782 = as_type<int>(_1836);
    }
    int _1838 = _1782;
    if (_1808)
    {
        bool _1840 = _398 > 0.5;
        _1136 = _1840;
    }
    bool _1842 = _1136;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    uint _1846 = uint(int(uint(_1828) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    float _1862 = 0.0;
    if (!_1808)
    {
        _1862 = _1790;
    }
    float _1864 = _1862;
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1868 = _1864;
    if (_1808)
    {
        float _1870 = _1842 ? as_type<float>(_1838) : _1790;
        _1868 = _1870;
    }
    float _1872 = _1868;
    float _1874 = -_1800;
    float _1876 = _1874 + 1.0;
    float _1878 = in.m_81.x;
    float _1880 = in.m_81.y;
    float _1882 = in.m_81.z;
    bool _1884 = _718 != 0.0;
    bool _1886 = isnan(_718);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan(0.0);
    bool _1892 = _1888 || _1890;
    float _1894 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1896 = _1828 + 8;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    uint _1900 = uint(int(uint(int(_1898)) >> uint(2)));
    int _1902 = int(_1898) & 3;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[int(_1900)][_1902];
    bool _1906 = _1798 > 0.5;
    bool _1908 = _716 == 0.0;
    bool _1910 = !_1892;
    bool _1912 = _1908 && _1910;
    bool _1914 = _720 == 0.0;
    bool _1916 = _1914 && _1912;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1922 = _1906 ? as_type<int>(_1876) : as_type<int>(_1800);
    float _1924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1926 = _380 > 0.5;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1930 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1932 = _1818 ? as_type<float>(_1922) : _1800;
    int _1934 = _1922;
    float _1936 = _1800;
    float _1938 = _1876;
    if (_1814)
    {
        float _1940 = -_1790;
        float _1942 = _1940 + 1.0;
        _1934 = as_type<int>(_1942);
    }
    int _1944 = _1934;
    float _1946 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = as_type<float>(_1944);
    if (_1814)
    {
        bool _1950 = _378 > 0.5;
        _1830 = _1950;
    }
    bool _1952 = _1830;
    if (_1916)
    {
        _514 = _1878;
    }
    float _1954 = _514;
    out.m_83.x = _1930;
    out.m_83.y = _1894;
    out.m_83.z = _1946;
    out.m_83.w = _1918;
    float _1956 = _1954;
    if (_1824)
    {
        float _1958 = _1926 ? _1876 : _1800;
        _1936 = _1958;
    }
    float _1960 = _1936;
    if (_1916)
    {
        _1938 = _1954;
    }
    float _1962 = _1938;
    float _1964 = in.m_85.x;
    float _1966 = in.m_85.y;
    float _1968 = in.m_85.z;
    float _1970 = in.m_85.w;
    float _1972 = _1962;
    if (!_1916)
    {
        _1956 = _1878;
    }
    float _1974 = _1956;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1814)
    {
        float _1978 = _1952 ? as_type<float>(_1944) : _1790;
        _1832 = _1978;
    }
    float _1980 = _1832;
    if (_1916)
    {
        _1948 = _1880;
    }
    float _1982 = _1948;
    float _1984 = _1982;
    if (!_1916)
    {
        float _1986 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1974);
        _1972 = _1986;
    }
    float _1988 = _1972;
    float _1990 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1992 = 0.0;
    if (_1916)
    {
        _1992 = _1882;
    }
    float _1994 = _1992;
    float _1996 = 0.0;
    float _1998 = _1994;
    if (_1916)
    {
        _1996 = _1982;
    }
    float _2000 = _1996;
    float _2002 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2004 = _1860 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2006 = _2000;
    if (!_1916)
    {
        _1984 = _1880;
    }
    float _2008 = _1984;
    float _2010 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2014 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2016 = 0.0;
    if (_1916)
    {
        _2016 = _1994;
    }
    float _2018 = _2016;
    float _2020 = _2010 * _1976;
    float _2022 = _1904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2024 = _2018;
    if (!_1916)
    {
        float _2026 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2006 = _2026;
    }
    float _2028 = _2006;
    float _2030 = _1990 * _1924;
    if (!_1916)
    {
        _1998 = _1882;
    }
    float _2032 = _1998;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2036 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2038 = abs(_1116);
    float _2040 = log2(_2038);
    float _2042 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1916)
    {
        float _2044 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2024 = _2044;
    }
    float _2046 = _2024;
    out.m_87.x = _2012;
    out.m_87.y = _2014;
    out.m_87.z = _2034;
    float _2048 = _2036 * _1866;
    float _2050 = _1966 * _2032;
    float _2052 = _2042 * _1792;
    float _2054 = -_2050;
    float _2056 = fma(_1968, _2008, _2054);
    float _2058 = -_1966;
    float _2060 = _810 * _2058;
    out.m_89.x = _2048;
    out.m_89.y = _2030;
    out.m_89.z = _2052;
    out.m_89.w = _2020;
    bool _2062 = _1116 <= 8000.0;
    bool _2064 = isnan(_1116);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan(8000.0);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = fma(_820, _1964, _2060);
    float _2076 = _1968 * _1974;
    float _2078 = _1964 * _2008;
    float _2080 = fma(_822, _1968, _2074);
    float _2082 = -_2076;
    float _2084 = fma(_1964, _2032, _2082);
    float _2086 = -_2078;
    float _2088 = fma(_1966, _1974, _2086);
    float _2090 = _2056 * _1970;
    float _2092 = _2084 * _1970;
    float _2094 = _2088 * _1970;
    float _2096 = -_2028;
    float _2098 = _810 * _2096;
    float _2100 = _816 * _1966;
    float _2102 = -_2092;
    float _2104 = _810 * _2102;
    float _2106 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2108 = fma(_820, _1988, _2098);
    float _2110 = _818 * _1966;
    float _2112 = fma(_820, _2090, _2104);
    float _2114 = exp2(_2106);
    float _2116 = _816 * _2028;
    float _2118 = _816 * _2092;
    float _2120 = fma(_830, _1964, _2100);
    float _2122 = _818 * _2092;
    float _2124 = fma(_830, _1988, _2116);
    float _2126 = fma(_830, _2090, _2118);
    float _2128 = _818 * _2028;
    float _2130 = fma(_842, _2090, _2122);
    float _2132 = fma(_838, _1968, _2120);
    float _2134 = fma(_842, _1964, _2110);
    float _2136 = fma(_838, _2094, _2126);
    float _2138 = fma(_822, _2046, _2108);
    float _2140 = fma(_842, _1988, _2128);
    float _2142 = fma(_822, _2094, _2112);
    float _2144 = fma(_2114, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = fma(_838, _2046, _2124);
    float _2150 = fma(_850, _2094, _2130);
    float _2152 = _2132 * _320;
    float _2154 = _2148 * _320;
    float _2156 = _2136 * _320;
    float _2158 = _2132 * _330;
    float _2160 = _2148 * _330;
    float _2162 = _2136 * _330;
    float _2164 = fma(_850, _2046, _2140);
    float _2166 = fma(_850, _1968, _2134);
    float _2168 = fma(_2146, -2.0, 3.0);
    float _2170 = _2146 * _2146;
    float _2172 = _2148 * _334;
    float _2174 = _2132 * _334;
    float _2176 = fma(_2080, _294, _2152);
    float _2178 = fma(_2142, _294, _2156);
    float _2180 = fma(_2080, _298, _2158);
    float _2182 = fma(_2138, _298, _2160);
    float _2184 = fma(_2142, _298, _2162);
    float _2186 = _2136 * _334;
    float _2188 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1820);
    float _2190 = fma(_2138, _294, _2154);
    float _2192 = fma(_2080, _302, _2174);
    float _2194 = fma(_2166, _338, _2176);
    float _2196 = fma(_2150, _342, _2184);
    float _2198 = fma(_2142, _302, _2186);
    float _2200 = _2188 + _1679;
    float _2202 = fma(_2166, _342, _2180);
    float _2204 = fma(_2166, _346, _2192);
    float _2206 = fma(_2150, _338, _2178);
    float _2208 = fma(_2150, _346, _2198);
    float _2210 = _2200 * 0.5;
    float _2212 = fma(_2138, _302, _2172);
    float _2214 = _2170 * _2168;
    out.m_91.x = _2194;
    out.m_91.y = _2202;
    out.m_91.z = _2204;
    float _2216 = _2170;
    if (!_1599)
    {
        _2216 = 1.0;
    }
    float _2218 = _2216;
    float _2220 = fma(_2164, _346, _2212);
    float _2222 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_93.x = _2206;
    out.m_93.y = _2196;
    out.m_93.z = _2208;
    float _2224 = fma(_2164, _338, _2190);
    float _2226 = fma(_2164, _342, _2182);
    out.gl_Position.x = _1733;
    out.gl_Position.y = _1707;
    out.gl_Position.z = _2188;
    out.gl_Position.w = _1679;
    float _2228 = exp2(_2222);
    out.m_95.z = _2210;
    out.m_95.w = _1679;
    float _2230 = _2218;
    if (_1599)
    {
        bool _2232 = _1715 >= _1697;
        bool _2234 = isnan(_1715);
        bool _2236 = _2232 || _2234;
        bool _2238 = isnan(_1697);
        bool _2240 = _2236 || _2238;
        float _2242 = float(_2240);
        _2230 = _2242;
    }
    float _2244 = _2230;
    float _2246 = -_2214;
    float _2248 = _2246 + 1.0;
    out.m_97.x = _1723;
    out.m_97.y = _1725;
    out.m_97.z = _1727;
    float _2250 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2214);
    float _2252 = _2072 * _2250;
    float _2254 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2256 = _2252;
    if (_1299)
    {
        _2256 = 1.0;
    }
    float _2258 = _2256;
    float _2260 = -_1741;
    float _2262 = _2260 + 1.0;
    float _2264 = _2262 * _2254;
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = _2258;
    if (!_1299)
    {
        int _2270 = _1383 << 4;
        int _2272 = _2270 + 2048;
        uint _2274 = uint(int(uint(_2272) >> uint(2)));
        uint _2276 = uint(int(uint(int(_2274)) >> uint(2)));
        int _2278 = int(_2274) & 3;
        float _2280 = (*spvDescriptorSet0.vp_c15)._m0[int(_2276)][_2278];
        int _2282 = int(_2274) + 1;
        uint _2284 = uint(int(uint(_2282) >> uint(2)));
        int _2286 = _2282 & 3;
        float _2288 = (*spvDescriptorSet0.vp_c15)._m0[int(_2284)][_2286];
        int _2290 = _2272 + 8;
        uint _2292 = uint(int(uint(_2290) >> uint(2)));
        uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
        int _2296 = int(_2292) & 3;
        float _2298 = (*spvDescriptorSet0.vp_c15)._m0[int(_2294)][_2296];
        int _2300 = int(_2292) + 1;
        uint _2302 = uint(int(uint(_2300) >> uint(2)));
        int _2304 = _2300 & 3;
        float _2306 = (*spvDescriptorSet0.vp_c15)._m0[int(_2302)][_2304];
        float _2308 = _996 * _2288;
        float _2310 = fma(_858, _2280, _2308);
        float _2312 = fma(_828, _2298, _2310);
        float _2314 = _2312 + _2306;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        float _2318 = -_2316;
        float _2320 = _2318 + _1786;
        float _2322 = fma(_2320, 500.0, 1.5);
        float _2324 = exp2(_2322);
        float _2326 = 0.0 + _2324;
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        _2268 = _2328;
    }
    float _2330 = _2268;
    float _2332 = -_2228;
    float _2334 = _2332 + 1.0;
    float _2336 = _2244 * _2330;
    float _2338 = -_2266;
    float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_99.x = _2224;
    out.m_99.y = _2226;
    out.m_99.z = _2220;
    float _2342 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2344 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2346 = isnan(_1112);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2352 = _2348 || _2350;
    float _2354 = -_2336;
    float _2356 = fma(_2354, _2340, 1.0);
    float _2358 = precise::clamp(_2356, 0.0, 1.0);
    out.m_101.x = _1014;
    out.m_101.y = _994;
    out.m_101.z = _1018;
    float _2360 = _2342 * _1759;
    float _2362 = -_2342;
    float _2364 = _2362 + 1.0;
    float _2366 = _2358 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2368 = _1770 * _2360;
    float _2370 = _1778 * _2360;
    out.m_103.x = _2366;
    float _2372 = fma(_1774, _2368, _1764);
    float _2374 = fma(_1776, _2368, _1766);
    float _2376 = _1770 * _2364;
    float _2378 = fma(_1770, _2370, _1768);
    out.m_105.x = 1.0;
    out.m_105.y = 1.0;
    out.m_105.z = 1.0;
    float _2380 = _2364;
    float _2382 = _2360;
    float _2384 = _2370;
    float _2386 = 1.0;
    float _2388 = 1.0;
    if (!_2352)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2390 = _2380;
    float _2392 = _2390;
    float _2394 = _2390;
    if (!_2352)
    {
        _914 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2396 = _914;
    out.m_107.x = _2372;
    out.m_107.y = _2374;
    out.m_107.z = _2378;
    out.m_107.w = _2376;
    float _2398 = _2396;
    float _2400 = _2396;
    if (!_2352)
    {
        _2382 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2402 = _2382;
    float _2404 = _2402;
    float _2406 = _2402;
    if (!_2352)
    {
        _2384 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2408 = _2384;
    float _2410 = _2408;
    float _2412 = _2408;
    if (!_2352)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2414 = _2386;
    float _2416 = _2414;
    float _2418 = _2414;
    if (!_2352)
    {
        _2388 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2420 = _2388;
    bool _2422 = !_2352;
    float _2424 = _2420;
    float _2426 = _2420;
    if (!_2422)
    {
        bool _2428 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2430 = isnan(_1112);
        bool _2432 = _2428 || _2430;
        bool _2434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2436 = _2432 || _2434;
        if (!_2436)
        {
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2440 = _1112 + _2438;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2442;
            float _2446 = 1.0 / _2444;
            float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2450 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2464 = _2440 * _2446;
            float _2466 = precise::clamp(_2464, 0.0, 1.0);
            float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2470 = _2468 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2476 = fma(_2466, _2450, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2478 = fma(_2466, _2470, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2480 = fma(_2466, _2474, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2482 = fma(_2466, _2454, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2484 = fma(_2466, _2458, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2486 = fma(_2466, _2462, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2418 = _2480;
            _2406 = _2484;
            _2394 = _2478;
            _2426 = _2482;
            _2400 = _2476;
            _2412 = _2486;
            _2488 = true;
        }
        else
        {
            bool _2490 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2492 = isnan(_1112);
            bool _2494 = _2490 || _2492;
            bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2498 = _2494 || _2496;
            if (!_2498)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2500 = _2392;
            _2394 = _2500;
            if (!_2498)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2502 = _2416;
            _2418 = _2502;
            if (!_2498)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2504 = _2398;
            _2400 = _2504;
            if (!_2498)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2506 = _2424;
            _2426 = _2506;
            if (!_2498)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2508 = _2404;
            _2406 = _2508;
            if (!_2498)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2510 = _2410;
            bool _2512 = !_2498;
            _2412 = _2510;
            if (!_2512)
            {
                bool _2514 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2516 = isnan(_1112);
                bool _2518 = _2514 || _2516;
                bool _2520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2522 = _2518 || _2520;
                if (!_2522)
                {
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2526 = _1112 + _2524;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2528;
                    float _2532 = 1.0 / _2530;
                    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2550 = _2526 * _2532;
                    float _2552 = precise::clamp(_2550, 0.0, 1.0);
                    float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2562 = fma(_2552, _2536, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2564 = fma(_2552, _2556, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2566 = fma(_2552, _2560, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2568 = fma(_2552, _2540, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2570 = fma(_2552, _2544, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2572 = fma(_2552, _2548, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2418 = _2566;
                    _2406 = _2570;
                    _2394 = _2564;
                    _2426 = _2568;
                    _2400 = _2562;
                    _2412 = _2572;
                    _2488 = true;
                }
                else
                {
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2488 = false;
    float _2574 = _2418;
    float _2576 = _2406;
    float _2578 = _2394;
    float _2580 = _2426;
    float _2582 = _2400;
    float _2584 = _2412;
    float _2586 = fma(_2226, -0.5, 0.5);
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = -_2574;
    float _2592 = _2590 + _2576;
    float _2594 = -_2578;
    float _2596 = _2594 + _2580;
    float _2598 = -_2582;
    float _2600 = _2598 + _2584;
    bool _2602 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2604 = fma(_2588, _2592, _2574);
    float _2606 = fma(_2588, _2596, _2578);
    float _2608 = fma(_2588, _2600, _2582);
    float _2610 = _2604 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2612 = fma(_2606, 0.298911988735198974609375, _2610);
    float _2614 = fma(_2608, 0.114477999508380889892578125, _2612);
    out.m_109.x = 0.0;
    float _2616 = -_2614;
    float _2618 = _2606 + _2616;
    float _2620 = -_2614;
    float _2622 = _2604 + _2620;
    float _2624 = -_2614;
    float _2626 = _2608 + _2624;
    float _2628 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2630 = fma(_2618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2614);
    float _2632 = fma(_2622, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2614);
    float _2634 = fma(_2626, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2614);
    out.m_103.w = _2628;
    out.m_111.x = _2630;
    out.m_111.y = _2632;
    out.m_111.z = _2634;
    if (!_2602)
    {
        return out;
    }
    float _2636 = -_994;
    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2640 = -_1014;
    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2644 = -_1018;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2648 = _2638 * _2638;
    float _2650 = fma(_2642, _2642, _2648);
    float _2652 = fma(_2646, _2646, _2650);
    float _2654 = sqrt(_2652);
    float _2656 = rsqrt(_2652);
    float _2658 = -_2654;
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2662 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2664 = precise::clamp(_2662, 0.0, 1.0);
    float _2666 = _2642 * _2656;
    float _2668 = _2638 * _2656;
    float _2670 = abs(_2664);
    float _2672 = log2(_2670);
    float _2674 = _2646 * _2656;
    float _2676 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2678 = _2226 * _2668;
    float _2680 = -_2668;
    float _2682 = -_2676;
    float _2684 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2682);
    float _2686 = fma(_2224, _2666, _2678);
    float _2688 = -_2674;
    float _2690 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2684);
    float _2692 = fma(_2220, _2674, _2686);
    float _2694 = precise::clamp(_2692, 0.0, 1.0);
    float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2698 = _2690 + _2696;
    float _2700 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2702 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = exp2(_2700);
    float _2708 = _2706 * _2704;
    float _2710 = _2694 * _2708;
    float _2712 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2714 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2716 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _2712;
    out.m_109.y = _2714;
    out.m_109.z = _2716;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2488 = false;
    bool _368 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_58.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_61.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2773 = as_type<float>(_146);
        out.gl_Position.z = _2773;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_63.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = _164;
    if (_160)
    {
        float _168 = float(_130);
        _140 = _168;
    }
    float _170 = _140;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    float _178 = _170;
    if (_176)
    {
        _178 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _178;
    if (_176)
    {
        out.m_61.x = 0.0;
    }
    if (_176)
    {
        float _182 = _180 * 5.0;
        _148 = as_type<int>(_182);
    }
    int _184 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2843 = as_type<float>(_184);
        out.gl_Position.z = _2843;
    }
    if (_176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _186 = in.m_65.x;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.x;
    float _194 = in.m_67.y;
    float _196 = in.m_67.z;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = _190 * _190;
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_202, _202, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = _224;
    float _234 = _186;
    float _236 = _190;
    if (_228)
    {
        float _238 = rsqrt(_216);
        _232 = _238;
    }
    float _240 = _232;
    float _242 = 0.0;
    if (!_228)
    {
        _242 = 0.0;
    }
    float _244 = _242;
    bool _246 = _226 > 0.0;
    float _248 = 0.0;
    float _250 = _244;
    if (!_228)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _252;
    if (!_228)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = _226;
    float _262 = _258;
    if (_230)
    {
        float _264 = rsqrt(_218);
        _260 = _264;
    }
    float _266 = _260;
    float _268 = 0.0;
    float _270 = 0.0;
    if (!_230)
    {
        _268 = 0.0;
        _270 = 0.0;
    }
    float _272 = _268;
    float _274 = _270;
    float _276 = 0.0;
    float _278 = _272;
    float _280 = _274;
    if (!_230)
    {
        _276 = 0.0;
    }
    float _282 = _276;
    float _284 = 0.0;
    float _286 = _282;
    if (_246)
    {
        float _288 = rsqrt(_220);
        _284 = _288;
    }
    float _290 = _284;
    if (_228)
    {
        float _292 = _240 * _192;
        _250 = _292;
    }
    float _294 = _250;
    if (_228)
    {
        float _296 = _240 * _186;
        _256 = _296;
    }
    float _298 = _256;
    if (_228)
    {
        float _300 = _240 * _198;
        _262 = _300;
    }
    float _302 = _262;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _306 = 0.0;
    if (!_246)
    {
        _306 = 0.0;
    }
    float _308 = _306;
    float _310 = 0.0;
    float _312 = _308;
    if (!_246)
    {
        _310 = 0.0;
    }
    float _314 = _310;
    float _316 = _314;
    if (_230)
    {
        float _318 = _266 * _194;
        _278 = _318;
    }
    float _320 = _278;
    float _322 = 0.0;
    if (!_246)
    {
        _322 = 0.0;
    }
    float _324 = _322;
    float _326 = _324;
    if (_230)
    {
        float _328 = _266 * _188;
        _280 = _328;
    }
    float _330 = _280;
    if (_230)
    {
        float _332 = _266 * _200;
        _286 = _332;
    }
    float _334 = _286;
    if (_246)
    {
        float _336 = _290 * _196;
        _312 = _336;
    }
    float _338 = _312;
    if (_246)
    {
        float _340 = _290 * _190;
        _316 = _340;
    }
    float _342 = _316;
    if (_246)
    {
        float _344 = _290 * _202;
        _326 = _344;
    }
    float _346 = _326;
    bool _348 = !_304;
    float _366;
    if (!_348)
    {
        float _350 = in.m_71.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_130);
        float _372 = 1.0 / _370;
        float _374 = _164 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_71.z;
    float _380 = in.m_71.y;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _382;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _392 = _390 != 0;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _396 = _394 != 0;
    float _398 = in.m_71.x;
    float _400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _402 = log2(_400);
    float _404 = in.m_58.x;
    float _406 = in.m_58.y;
    float _408 = in.m_58.z;
    float _410 = 1.0 / _384;
    float _412 = _378 * 2.0;
    float _414 = _402 * _164;
    float _416 = _380 * 2.0;
    float _418 = floor(_412);
    float _420 = _398 * 2.0;
    float _422 = _398 + _378;
    float _424 = _194 * _406;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _428 = _376 + _426;
    float _430 = floor(_416);
    float _432 = _422 + (-1.0);
    float _434 = fma(_192, _404, _424);
    float _436 = _380 + _378;
    float _438 = _428 * _410;
    float _440 = _200 * _406;
    float _442 = _188 * _406;
    float _444 = _436 + (-1.0);
    float _446 = floor(_420);
    bool _448 = _418 > 0.0;
    float _450 = fma(_198, _404, _440);
    bool _452 = _418 >= 0.0;
    bool _454 = isnan(_418);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = fma(_186, _404, _442);
    float _464 = fma(_202, _408, _450);
    int _466 = _460 ? 0 : 1;
    float _468 = exp2(_414);
    bool _470 = _430 > 0.0;
    float _472 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _474 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _476 = !_388;
    int _478 = _476 ? 0 : 1;
    float _480 = fma(_190, _408, _462);
    bool _482 = _430 >= 0.0;
    bool _484 = isnan(_430);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    bool _492 = _446 > 0.0;
    bool _494 = _446 >= 0.0;
    bool _496 = isnan(_446);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    int _504 = ~_466;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    int _510 = abs(_478);
    int _512 = _508;
    float _514 = _378;
    if (!_448)
    {
        int _516 = ~_466;
        int _518 = _516 + 1;
        _512 = _518;
    }
    int _520 = _512;
    float _522 = -_468;
    float _524 = _522 + 1.0;
    int _526 = _490 ? 0 : 1;
    float _528 = float(_510);
    float _530 = float(_520);
    int _532 = ~_526;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    int _538 = _536;
    if (!_470)
    {
        int _540 = ~_526;
        int _542 = _540 + 1;
        _538 = _542;
    }
    int _544 = _538;
    float _546 = _528 * _530;
    int _548 = _502 ? 0 : 1;
    float _550 = in.m_73.x;
    float _552 = in.m_73.y;
    float _554 = in.m_73.z;
    float _556 = _546 * (-2.0);
    bool _558 = !_392;
    int _560 = _558 ? 0 : 1;
    int _562 = ~_548;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _570 = 1.0 + _568;
    int _572 = _566;
    if (!_492)
    {
        int _574 = ~_548;
        int _576 = _574 + 1;
        _572 = _576;
    }
    int _578 = _572;
    bool _580 = !_396;
    int _582 = _580 ? 0 : 1;
    float _584 = 1.0 / _570;
    int _586 = abs(_560);
    float _588 = _398 + _380;
    int _590 = abs(_582);
    float _592 = _588 + (-1.0);
    bool _594 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _596 = isnan(1.0);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _602 = _598 || _600;
    float _604 = float(_586);
    float _606 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _608 = float(_578);
    float _610 = _398 + (-0.5);
    bool _612 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _620 = _616 || _618;
    float _622 = fma(_556, _550, _550);
    float _624 = float(_590);
    float _626 = _604 * _608;
    float _628 = _620 ? _524 : 0.0;
    float _630 = float(_544);
    float _632 = _626 * (-2.0);
    if (_602)
    {
        float _634 = _628 * _584;
        _166 = _634;
    }
    float _636 = _166;
    float _638 = fma(_606, _556, _606);
    float _640 = fma(_472, _632, _472);
    float _642 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[196].x, _622);
    float _644 = fma(_632, _552, _552);
    float _646 = _380 + (-0.5);
    float _648 = _624 * _630;
    float _650 = fma(_638, _636, _642);
    float _652 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _644);
    float _654 = _648 * (-2.0);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _656;
    float _660 = fma(_640, _636, _652);
    bool _662 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _664 = isnan(_376);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _678;
    float _682 = in.m_75.x;
    float _684 = in.m_75.y;
    float _686 = in.m_75.z;
    float _688 = _650 * 0.15915493667125701904296875;
    bool _690 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _692 = isnan(_376);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -_672;
    float _704 = _702 + 1.0;
    float _706 = fma(_658, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _708 = fma(_676, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _710 = fma(_680, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _712 = fma(_654, _554, _554);
    float _714 = _378 + (-0.5);
    float _716 = in.m_77.x;
    float _718 = in.m_77.y;
    float _720 = in.m_77.z;
    float _722 = _700 * _704;
    float _724 = fma(_474, _654, _474);
    float _726 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].z, _712);
    float _728 = -_700;
    float _730 = _728 + 1.0;
    float _732 = _710 * _722;
    float _734 = _706 * _722;
    float _736 = _708 * _722;
    float _738 = fma(_724, _636, _726);
    float _740 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[143].z, _732);
    float _742 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[143].x, _734);
    float _744 = _660 * 0.15915493667125701904296875;
    float _746 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[143].y, _736);
    float _748 = _738 * 0.15915493667125701904296875;
    float _750 = _688 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[144].z, _740);
    float _756 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[144].x, _742);
    float _758 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[144].y, _746);
    float _760 = _754 * _686;
    float _762 = _756 * _682;
    float _764 = _744 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = _758 * _684;
    float _770 = in.m_69.w;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _774 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _778 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    float _782 = _744 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _772 * _774;
    float _788 = _776 * _778;
    float _790 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = in.m_67.w;
    float _794 = _780 * _790;
    float _796 = _688 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _752 * _766;
    float _802 = _748 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = _752 * _784;
    float _808 = _748 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _798 * _766;
    float _814 = _798 * _784;
    float _816 = _752 * _804;
    float _818 = _798 * _804;
    float _820 = _784 * _804;
    float _822 = _766 * _804;
    float _824 = _816 * _788;
    float _826 = fma(_196, _408, _434);
    float _828 = _464 + _770;
    float _830 = fma(_810, _806, _812);
    float _832 = -_788;
    float _834 = _810 * _832;
    float _836 = -_814;
    float _838 = fma(_810, _800, _836);
    float _840 = -_800;
    float _842 = fma(_810, _814, _840);
    float _844 = fma(_830, _786, _824);
    float _846 = _818 * _788;
    float _848 = fma(_820, _786, _834);
    float _850 = fma(_810, _812, _806);
    float _852 = fma(_838, _794, _844);
    float _854 = fma(_842, _786, _846);
    float _856 = fma(_822, _794, _848);
    float _858 = _826 + _792;
    float _860 = _852 * _334;
    float _862 = fma(_850, _794, _854);
    float _864 = _852 * _320;
    float _866 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _868 = fma(_856, _302, _860);
    float _870 = fma(_856, _294, _864);
    float _872 = in.m_65.w;
    float _874 = fma(_862, _346, _868);
    float _876 = floor(_866);
    float _878 = fma(_862, _338, _870);
    float _880 = _828 + _874;
    float _882 = _858 + _878;
    float _884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _886 = _880 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _890 = _882 + _888;
    float _892 = _886 * _886;
    float _894 = fma(_890, _890, _892);
    float _896 = sqrt(_894);
    float _898 = _480 + _872;
    bool _900 = _896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _904 = _896 + _902;
    float _906 = _874;
    float _908 = _896;
    float _910 = _848;
    float _912 = _852;
    float _914 = _858;
    if (_900)
    {
        float _916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _916;
    }
    float _918 = _906;
    if (!_900)
    {
        _234 = _882;
    }
    float _920 = _234;
    float _922 = _920;
    if (!_900)
    {
        _236 = _880;
    }
    float _924 = _236;
    float _926 = _924;
    if (_900)
    {
        float _928 = _904 * _918;
        _908 = _928;
    }
    float _930 = _908;
    if (_900)
    {
        float _932 = _930 * 0.15915493667125701904296875;
        _910 = _932;
    }
    float _934 = _910;
    float _936 = _852 * _330;
    float _938 = _918;
    if (_900)
    {
        float _940 = _934 * 6.283185482025146484375;
        float _942 = cos(_940);
        _938 = _942;
    }
    float _944 = _938;
    float _946 = fma(_856, _298, _936);
    float _948 = fma(_862, _342, _946);
    float _950 = _404;
    float _952 = _946;
    float _954 = _948;
    if (_900)
    {
        float _956 = _934 * 6.283185482025146484375;
        float _958 = sin(_956);
        _950 = _958;
    }
    float _960 = _950;
    float _962 = _898 + _948;
    float _964 = _962;
    if (_900)
    {
        float _966 = _962 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _952 = _966;
    }
    float _968 = _952;
    float _970 = _936;
    float _972 = _968;
    if (_900)
    {
        float _974 = rsqrt(_894);
        _970 = _974;
    }
    float _976 = _970;
    if (_900)
    {
        float _978 = _944 + (-1.0);
        _954 = _978;
    }
    float _980 = _954;
    if (_900)
    {
        float _982 = fma(_960, _968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _912 = _982;
    }
    float _984 = _912;
    if (_900)
    {
        float _986 = _980 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _986;
    }
    float _988 = _972;
    float _990 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    if (_900)
    {
        float _992 = fma(_962, _944, _988);
        _964 = _992;
    }
    float _994 = _964;
    float _996 = _898 + _990;
    float _998 = _976;
    if (_900)
    {
        float _1000 = _976 * _984;
        _998 = _1000;
    }
    float _1002 = _998;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _994 + _1004;
    float _1008 = _996 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1010 = _996 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    if (_900)
    {
        float _1012 = fma(_890, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _922 = _1012;
    }
    float _1014 = _922;
    if (_900)
    {
        float _1016 = fma(_886, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _926 = _1016;
    }
    float _1018 = _926;
    float _1020 = _1006 * _1006;
    float _1022 = _898 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1026 = _1014 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1030 = _1018 + _1028;
    float _1032 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1022);
    float _1034 = fma(_1026, _1026, _1020);
    float _1036 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1008);
    float _1038 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1010);
    float _1040 = fma(_1030, _1030, _1034);
    float _1042 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1032);
    float _1044 = _898 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1046 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1036);
    float _1048 = rsqrt(_1040);
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1052 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1044);
    float _1054 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1038);
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1058 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    float _1060 = _1054 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1062 = 1.0 / _1050;
    float _1064 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1066 = _1064 + _1050;
    float _1068 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1070 = trunc(_1056);
    int _1072 = int(_1070);
    float _1074 = _1026 * _1068;
    float _1076 = _1030 * _1068;
    float _1078 = _1074 * _1074;
    float _1080 = _1076 * _1076;
    float _1082 = _1066 * _1062;
    float _1084 = _1082 * 0.5;
    float _1086 = trunc(_1060);
    int _1088 = int(_1086);
    float _1090 = _1078 + _1080;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1094 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1092);
    int _1096 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1098 = _1072 + _1096;
    int _1100 = _1098 + 1;
    float _1102 = sqrt(_1090);
    float _1104 = 1.0 / _1094;
    bool _1106 = _1102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1102 + _1108;
    float _1112 = sqrt(_1040);
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1116 = _1104 * _1114;
    bool _1118 = _1116 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1120 = _894;
    float _1122 = _1090;
    int _1124 = 2;
    float _1126 = _1074;
    float _1128 = _1076;
    float _1130 = _1078;
    int _1132 = as_type<int>(_1080);
    float _1134 = _1060;
    bool _1136 = _1106;
    if (_1106)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1138;
    }
    float _1140 = _1120;
    bool _1142 = _1116 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1144 = !_1118;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = as_type<float>(_1146);
    if (_1106)
    {
        float _1150 = rsqrt(_1090);
        _1122 = _1150;
    }
    float _1152 = _1122;
    float _1154 = _1152;
    if (!_1118)
    {
        _1124 = 1;
    }
    int _1156 = _1124;
    int _1158 = _1156;
    if (!_1142)
    {
        _1158 = _1146;
    }
    int _1160 = _1158;
    if (_1106)
    {
        float _1162 = _1110 * _1140;
        _1148 = _1162;
    }
    float _1164 = _1148;
    bool _1166 = _1100 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1168 = _1160 << 6;
    float _1170 = 0.0;
    if (_1106)
    {
        float _1172 = _1164 * 0.15915493667125701904296875;
        _1170 = _1172;
    }
    float _1174 = _1170;
    float _1176 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1178 = _1168 + 96;
    uint _1181 = uint(int(uint(_1178) >> uint(2)));
    uint _1183 = uint(int(uint(int(_1181)) >> uint(2)));
    int _1185 = int(_1181) & 3;
    float _1187 = (*spvDescriptorSet0.vp_c15)._m0[int(_1183)][_1185];
    int _1189 = int(_1181) + 1;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    int _1193 = _1189 & 3;
    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[int(_1191)][_1193];
    float _1197 = 0.0;
    float _1199 = _1174;
    if (_1106)
    {
        float _1201 = _1174 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        _1197 = _1203;
    }
    float _1205 = _1197;
    float _1207 = precise::max(0.0, _1176);
    int _1209 = _1168 + 48;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    uint _1213 = uint(int(uint(int(_1211)) >> uint(2)));
    int _1215 = int(_1211) & 3;
    float _1217 = (*spvDescriptorSet0.vp_c15)._m0[int(_1213)][_1215];
    int _1219 = int(_1211) + 1;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    int _1223 = _1219 & 3;
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[int(_1221)][_1223];
    float _1227 = 0.0;
    if (_1106)
    {
        float _1229 = _1174 * 6.283185482025146484375;
        float _1231 = cos(_1229);
        _1227 = _1231;
    }
    float _1233 = _1227;
    float _1235 = -_1068;
    float _1237 = -_1207;
    float _1239 = fma(_1006, _1235, _1237);
    int _1241 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1243 = _1088 + _1241;
    int _1245 = _1243 + 1;
    float _1247 = 0.0;
    if (_1106)
    {
        float _1249 = _1239 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1247 = _1249;
    }
    float _1251 = _1247;
    int _1253 = _1100 | _1245;
    int _1255 = _1168 + 104;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c15)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    float _1273 = 0.0;
    float _1275 = as_type<float>(_1253);
    if (_1106)
    {
        float _1277 = fma(_1205, _1251, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1273 = _1277;
    }
    float _1279 = _1273;
    bool _1281 = _1253 < 0;
    bool _1283 = _1281 || _1166;
    float _1285 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1287 = _1279;
    if (!_1106)
    {
        _1275 = _1239;
    }
    float _1289 = _1275;
    float _1291 = _1289;
    if (_1106)
    {
        float _1293 = _1152 * _1279;
        _1287 = _1293;
    }
    float _1295 = _1287;
    bool _1297 = _1245 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1299 = _1297 || _1283;
    int _1301 = _1168 + 64;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    uint _1305 = uint(int(uint(int(_1303)) >> uint(2)));
    int _1307 = int(_1303) & 3;
    float _1309 = (*spvDescriptorSet0.vp_c15)._m0[int(_1305)][_1307];
    int _1311 = int(_1303) + 1;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    int _1315 = _1311 & 3;
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[int(_1313)][_1315];
    float _1319 = _1233;
    if (_1106)
    {
        float _1321 = _1233 + (-1.0);
        _1154 = _1321;
    }
    float _1323 = _1154;
    float _1325 = floor(_1285);
    float _1327 = _1323;
    if (_1106)
    {
        float _1329 = _1074 * _1295;
        _1126 = _1329;
    }
    float _1331 = _1126;
    if (_1106)
    {
        float _1333 = _1076 * _1295;
        _1128 = _1333;
    }
    float _1335 = _1128;
    if (_1106)
    {
        float _1337 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1337;
    }
    float _1339 = _1327;
    int _1341 = as_type<int>(_1339);
    if (_1106)
    {
        float _1343 = _1331 * _1331;
        _1130 = _1343;
    }
    float _1345 = _1130;
    int _1347 = _1168 + 56;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    if (_1106)
    {
        float _1365 = fma(_1239, _1233, _1339);
        _1291 = _1365;
    }
    float _1367 = _1291;
    if (!_1106)
    {
        _1319 = _1080;
    }
    float _1369 = _1319;
    float _1371 = _1369;
    if (_1106)
    {
        float _1373 = _1335 * _1335;
        _1371 = _1373;
    }
    float _1375 = _1371;
    int _1377 = as_type<int>(_1375);
    if (!_1299)
    {
        int _1379 = _1245 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1381 = _1379 + _1100;
        _1132 = _1381;
    }
    int _1383 = _1132;
    float _1385 = -_876;
    float _1387 = _866 + _1385;
    float _1389 = fma(_1367, _1367, _1345);
    int _1391 = _1168 + 72;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    uint _1395 = uint(int(uint(int(_1393)) >> uint(2)));
    int _1397 = int(_1393) & 3;
    float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
    int _1401 = int(_1393) + 1;
    uint _1403 = uint(int(uint(_1401) >> uint(2)));
    int _1405 = _1401 & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    if (!_1299)
    {
        int _1409 = _1383 << 2;
        _1341 = _1409;
    }
    int _1411 = _1341;
    float _1413 = _1389 + _1375;
    float _1415 = -_1325;
    float _1417 = _1285 + _1415;
    int _1419 = _1411;
    if (!_1299)
    {
        uint _1421 = uint(int(uint(_1383) >> uint(2)));
        _1377 = int(_1421);
    }
    int _1423 = _1377;
    if (!_1299)
    {
        int _1425 = 12 & _1411;
        _1419 = _1425;
    }
    int _1427 = _1419;
    float _1429 = _996 * _1195;
    float _1431 = rsqrt(_1413);
    float _1433 = fma(_858, _1187, _1429);
    int _1435 = as_type<int>(_1187);
    if (!_1299)
    {
        int _1437 = _1423 << 4;
        int _1439 = _1437 + _1427;
        _1435 = _1439;
    }
    int _1441 = _1435;
    float _1443 = _996 * _1225;
    float _1445 = fma(_858, _1217, _1443);
    float _1447 = fma(_828, _1263, _1433);
    float _1449 = _994 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1451 = _1431 * _1331;
    float _1453 = _1431 * _1335;
    float _1455 = _1447 + _1271;
    float _1457 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1449);
    int _1459 = _1168 + 88;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c15)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    float _1477 = _996 * _1317;
    float _1479 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1457);
    float _1481 = 1.0 / _1455;
    float _1483 = fma(_858, _1309, _1477);
    float _1485 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1487 = fma(_828, _1355, _1445);
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1491 = fma(_1112, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1489);
    float _1493 = precise::clamp(_1491, 0.0, 1.0);
    int _1495 = _1168 + 80;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    float _1513 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1515 = _1487 + _1363;
    float _1517 = -_1493;
    float _1519 = _1517 + 1.0;
    float _1521 = _994 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1523 = _1477;
    if (!_1299)
    {
        float _1525 = floor(_1056);
        _1523 = _1525;
    }
    float _1527 = _1523;
    float _1529 = fma(_828, _1399, _1483);
    float _1531 = _1431 * _1367;
    float _1533 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1537 = _1529 + _1407;
    float _1539 = _994 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1541 = -_1533;
    float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1541);
    float _1545 = _1515 * _1481;
    float _1547 = abs(_1519);
    float _1549 = log2(_1547);
    float _1551 = _1537 * _1481;
    float _1553 = -_1513;
    float _1555 = fma(_1553, _1535, 1.0);
    float _1557 = -_1453;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1543);
    bool _1561 = _1545 >= 0.0;
    float _1563 = _994 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1565 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1539);
    float _1567 = fma(_1559, -0.5, 0.5);
    bool _1569 = _1545 <= 1.0;
    bool _1571 = _1569 && _1561;
    float _1573 = _1513;
    float _1575 = _1527;
    if (!_1299)
    {
        float _1577 = floor(_1060);
        _1573 = _1577;
    }
    float _1579 = _1573;
    float _1581 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1563);
    float _1583 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1565);
    bool _1585 = _1551 >= 0.0;
    bool _1587 = _1585 && _1571;
    float _1589 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1521);
    float _1591 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1581);
    float _1593 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1595 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1597 = _1551 <= 1.0;
    bool _1599 = _1597 && _1587;
    float _1601 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1603 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1605 = exp2(_1595);
    float _1607 = fma(_1559, 0.5, 0.5);
    float _1609 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1589);
    float _1611 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1603);
    if (!_1299)
    {
        float _1613 = -_1579;
        float _1615 = _1060 + _1613;
        _1199 = _1615;
    }
    float _1617 = _1199;
    float _1619 = fma(_1607, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1621 = _1515;
    if (!_1299)
    {
        int _1623 = _1441 + 400;
        uint _1625 = uint(int(uint(_1623) >> uint(2)));
        uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
        int _1629 = int(_1625) & 3;
        float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
        _1621 = _1631;
    }
    float _1633 = _1621;
    float _1635 = sqrt(_1567);
    float _1637 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (_1599)
    {
        float _1639 = float(_1160);
        _1134 = _1639;
    }
    float _1641 = _1134;
    float _1643 = fma(_1607, _1619, -0.212114393711090087890625);
    if (!_1299)
    {
        float _1645 = -_1527;
        float _1647 = _1056 + _1645;
        _1575 = _1647;
    }
    float _1649 = _1575;
    float _1651 = fma(_1018, 6.2500002968590706586837768554688e-05, 0.5);
    float _1653 = _996 * _1511;
    float _1655 = _1531 + 1.0;
    float _1657 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1611);
    float _1659 = _1641;
    if (_1599)
    {
        float _1661 = rint(_1641);
        float _1663 = precise::max(_1661, 0.0);
        uint _1665 = uint(_1663);
        uint _1667 = clamp(_1665, 0u, 65535u);
        _1659 = as_type<float>(_1667);
    }
    float _1669 = _1659;
    float _1671 = fma(_858, _1503, _1653);
    float _1673 = -_1531;
    float _1675 = fma(_1605, _1655, _1673);
    float _1677 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1679 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1657);
    float _1681 = fma(_828, _1467, _1671);
    float _1683 = fma(_1607, _1643, 1.570728778839111328125);
    float _1685 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1677);
    float _1687 = log2(_1555);
    float _1689 = _1681 + _1475;
    float _1691 = _1635 * 0.636619746685028076171875;
    float _1693 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1685);
    float _1695 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1697 = _1689 * _1481;
    float _1699 = -_1683;
    float _1701 = fma(_1691, _1699, 1.0);
    float _1703 = fma(_1014, 6.2500002968590706586837768554688e-05, 0.5);
    float _1705 = 1.0 / _1679;
    float _1707 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1693);
    float _1709 = fma(_1675, 0.5, 0.5);
    float _1711 = _1693;
    if (_1599)
    {
        float3 _5210 = float3(_1545, _1551, float(as_type<int>(_1669)));
        float3 _5214 = select(_5210, float3(0.0), isnan(_5210));
        float _1713 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5214.xy, uint(rint(_5214.z)), _1697, level(0.0));
        _1711 = _1713;
    }
    float _1715 = _1711;
    float _1717 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1695);
    float2 _5229 = float2(_1703, _1651);
    float3 _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5229, float2(0.0), isnan(_5229)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5229, float2(0.0), isnan(_5229)), level(0.0)).xyz;
    float _1723 = _1721.x;
    float _1725 = _1721.y;
    float _1727 = _1721.z;
    float _1729 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1717);
    float _1731 = _1687 * 0.693147182464599609375;
    float _1733 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1729);
    float _1735 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = _1733 * _1705;
    float _1739 = _1707 * _1705;
    float2 _5268 = float2(_1387, _1417);
    float _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5268, float2(0.0), isnan(_5268)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5268, float2(0.0), isnan(_5268)), level(0.0)).x;
    float _1743 = fma(_1737, 0.5, 0.5);
    float _1745 = fma(_1739, -0.5, 0.5);
    float _1747 = _1633;
    if (!_1299)
    {
        float _1749 = rint(_1633);
        float _1751 = precise::max(_1749, 0.0);
        uint _1753 = uint(_1751);
        uint _1755 = clamp(_1753, 0u, 65535u);
        _1747 = as_type<float>(_1755);
    }
    float _1757 = _1747;
    float3 _5297 = float3(_1743, _1745, _1735);
    float _1759 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5297, float3(0.0), isnan(_5297)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5297, float3(0.0), isnan(_5297)), level(0.0)).x;
    float3 _5306 = float3(_1743, _1745, _1735);
    float4 _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5306, float3(0.0), isnan(_5306)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5306, float3(0.0), isnan(_5306)), level(0.0)).xyzw;
    float _1764 = _1762.x;
    float _1766 = _1762.y;
    float _1768 = _1762.z;
    float _1770 = _1762.w;
    float2 _5322 = float2(_1701, _1709);
    float3 _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5322, float2(0.0), isnan(_5322)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5322, float2(0.0), isnan(_5322)), level(0.0)).xyz;
    float _1774 = _1772.x;
    float _1776 = _1772.y;
    float _1778 = _1772.z;
    float _1780 = _1617;
    int _1782 = as_type<int>(_1757);
    if (!_1299)
    {
        float3 _5345 = float3(_1649, _1617, float(as_type<int>(_1757)));
        float3 _5347 = select(_5345, float3(0.0), isnan(_5345));
        float _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5347.xy, uint(rint(_5347.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5347.xy, uint(rint(_5347.z)), level(0.0)).x;
        _1780 = _1784;
    }
    float _1786 = _1780;
    float _1788 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1790 = in.m_79.x;
    float _1792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1794 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1796 = _1788 * _398;
    float _1798 = in.m_71.w;
    float _1800 = in.m_79.y;
    float _1802 = trunc(_1796);
    int _1804 = int(_1802);
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1808 = _1806 != 0;
    float _1810 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1794);
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1814 = _1812 != 0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1818 = _1816 != 0;
    float _1820 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1810);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1824 = _1822 != 0;
    int _1826 = _1804 << 4;
    int _1828 = _1826 + 1968;
    bool _1830 = _1818;
    float _1832 = _1790;
    if (_1808)
    {
        float _1834 = -_1790;
        float _1836 = _1834 + 1.0;
        _1782 = as_type<int>(_1836);
    }
    int _1838 = _1782;
    if (_1808)
    {
        bool _1840 = _398 > 0.5;
        _1136 = _1840;
    }
    bool _1842 = _1136;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    uint _1846 = uint(int(uint(_1828) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    float _1862 = 0.0;
    if (!_1808)
    {
        _1862 = _1790;
    }
    float _1864 = _1862;
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1868 = _1864;
    if (_1808)
    {
        float _1870 = _1842 ? as_type<float>(_1838) : _1790;
        _1868 = _1870;
    }
    float _1872 = _1868;
    float _1874 = -_1800;
    float _1876 = _1874 + 1.0;
    float _1878 = in.m_81.x;
    float _1880 = in.m_81.y;
    float _1882 = in.m_81.z;
    bool _1884 = _718 != 0.0;
    bool _1886 = isnan(_718);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan(0.0);
    bool _1892 = _1888 || _1890;
    float _1894 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1896 = _1828 + 8;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    uint _1900 = uint(int(uint(int(_1898)) >> uint(2)));
    int _1902 = int(_1898) & 3;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[int(_1900)][_1902];
    bool _1906 = _1798 > 0.5;
    bool _1908 = _716 == 0.0;
    bool _1910 = !_1892;
    bool _1912 = _1908 && _1910;
    bool _1914 = _720 == 0.0;
    bool _1916 = _1914 && _1912;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1922 = _1906 ? as_type<int>(_1876) : as_type<int>(_1800);
    float _1924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1926 = _380 > 0.5;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1930 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1932 = _1818 ? as_type<float>(_1922) : _1800;
    int _1934 = _1922;
    float _1936 = _1800;
    float _1938 = _1876;
    if (_1814)
    {
        float _1940 = -_1790;
        float _1942 = _1940 + 1.0;
        _1934 = as_type<int>(_1942);
    }
    int _1944 = _1934;
    float _1946 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = as_type<float>(_1944);
    if (_1814)
    {
        bool _1950 = _378 > 0.5;
        _1830 = _1950;
    }
    bool _1952 = _1830;
    if (_1916)
    {
        _514 = _1878;
    }
    float _1954 = _514;
    out.m_83.x = _1930;
    out.m_83.y = _1894;
    out.m_83.z = _1946;
    out.m_83.w = _1918;
    float _1956 = _1954;
    if (_1824)
    {
        float _1958 = _1926 ? _1876 : _1800;
        _1936 = _1958;
    }
    float _1960 = _1936;
    if (_1916)
    {
        _1938 = _1954;
    }
    float _1962 = _1938;
    float _1964 = in.m_85.x;
    float _1966 = in.m_85.y;
    float _1968 = in.m_85.z;
    float _1970 = in.m_85.w;
    float _1972 = _1962;
    if (!_1916)
    {
        _1956 = _1878;
    }
    float _1974 = _1956;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1814)
    {
        float _1978 = _1952 ? as_type<float>(_1944) : _1790;
        _1832 = _1978;
    }
    float _1980 = _1832;
    if (_1916)
    {
        _1948 = _1880;
    }
    float _1982 = _1948;
    float _1984 = _1982;
    if (!_1916)
    {
        float _1986 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1974);
        _1972 = _1986;
    }
    float _1988 = _1972;
    float _1990 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1992 = 0.0;
    if (_1916)
    {
        _1992 = _1882;
    }
    float _1994 = _1992;
    float _1996 = 0.0;
    float _1998 = _1994;
    if (_1916)
    {
        _1996 = _1982;
    }
    float _2000 = _1996;
    float _2002 = _1852 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2004 = _1860 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2006 = _2000;
    if (!_1916)
    {
        _1984 = _1880;
    }
    float _2008 = _1984;
    float _2010 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2014 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2016 = 0.0;
    if (_1916)
    {
        _2016 = _1994;
    }
    float _2018 = _2016;
    float _2020 = _2010 * _1976;
    float _2022 = _1904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2024 = _2018;
    if (!_1916)
    {
        float _2026 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2006 = _2026;
    }
    float _2028 = _2006;
    float _2030 = _1990 * _1924;
    if (!_1916)
    {
        _1998 = _1882;
    }
    float _2032 = _1998;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2036 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2038 = abs(_1116);
    float _2040 = log2(_2038);
    float _2042 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1916)
    {
        float _2044 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2024 = _2044;
    }
    float _2046 = _2024;
    out.m_87.x = _2012;
    out.m_87.y = _2014;
    out.m_87.z = _2034;
    float _2048 = _2036 * _1866;
    float _2050 = _1966 * _2032;
    float _2052 = _2042 * _1792;
    float _2054 = -_2050;
    float _2056 = fma(_1968, _2008, _2054);
    float _2058 = -_1966;
    float _2060 = _810 * _2058;
    out.m_89.x = _2048;
    out.m_89.y = _2030;
    out.m_89.z = _2052;
    out.m_89.w = _2020;
    bool _2062 = _1116 <= 8000.0;
    bool _2064 = isnan(_1116);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan(8000.0);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = fma(_820, _1964, _2060);
    float _2076 = _1968 * _1974;
    float _2078 = _1964 * _2008;
    float _2080 = fma(_822, _1968, _2074);
    float _2082 = -_2076;
    float _2084 = fma(_1964, _2032, _2082);
    float _2086 = -_2078;
    float _2088 = fma(_1966, _1974, _2086);
    float _2090 = _2056 * _1970;
    float _2092 = _2084 * _1970;
    float _2094 = _2088 * _1970;
    float _2096 = -_2028;
    float _2098 = _810 * _2096;
    float _2100 = _816 * _1966;
    float _2102 = -_2092;
    float _2104 = _810 * _2102;
    float _2106 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2108 = fma(_820, _1988, _2098);
    float _2110 = _818 * _1966;
    float _2112 = fma(_820, _2090, _2104);
    float _2114 = exp2(_2106);
    float _2116 = _816 * _2028;
    float _2118 = _816 * _2092;
    float _2120 = fma(_830, _1964, _2100);
    float _2122 = _818 * _2092;
    float _2124 = fma(_830, _1988, _2116);
    float _2126 = fma(_830, _2090, _2118);
    float _2128 = _818 * _2028;
    float _2130 = fma(_842, _2090, _2122);
    float _2132 = fma(_838, _1968, _2120);
    float _2134 = fma(_842, _1964, _2110);
    float _2136 = fma(_838, _2094, _2126);
    float _2138 = fma(_822, _2046, _2108);
    float _2140 = fma(_842, _1988, _2128);
    float _2142 = fma(_822, _2094, _2112);
    float _2144 = fma(_2114, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = fma(_838, _2046, _2124);
    float _2150 = fma(_850, _2094, _2130);
    float _2152 = _2132 * _320;
    float _2154 = _2148 * _320;
    float _2156 = _2136 * _320;
    float _2158 = _2132 * _330;
    float _2160 = _2148 * _330;
    float _2162 = _2136 * _330;
    float _2164 = fma(_850, _2046, _2140);
    float _2166 = fma(_850, _1968, _2134);
    float _2168 = fma(_2146, -2.0, 3.0);
    float _2170 = _2146 * _2146;
    float _2172 = _2148 * _334;
    float _2174 = _2132 * _334;
    float _2176 = fma(_2080, _294, _2152);
    float _2178 = fma(_2142, _294, _2156);
    float _2180 = fma(_2080, _298, _2158);
    float _2182 = fma(_2138, _298, _2160);
    float _2184 = fma(_2142, _298, _2162);
    float _2186 = _2136 * _334;
    float _2188 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1820);
    float _2190 = fma(_2138, _294, _2154);
    float _2192 = fma(_2080, _302, _2174);
    float _2194 = fma(_2166, _338, _2176);
    float _2196 = fma(_2150, _342, _2184);
    float _2198 = fma(_2142, _302, _2186);
    float _2200 = _2188 + _1679;
    float _2202 = fma(_2166, _342, _2180);
    float _2204 = fma(_2166, _346, _2192);
    float _2206 = fma(_2150, _338, _2178);
    float _2208 = fma(_2150, _346, _2198);
    float _2210 = _2200 * 0.5;
    float _2212 = fma(_2138, _302, _2172);
    float _2214 = _2170 * _2168;
    out.m_91.x = _2194;
    out.m_91.y = _2202;
    out.m_91.z = _2204;
    float _2216 = _2170;
    if (!_1599)
    {
        _2216 = 1.0;
    }
    float _2218 = _2216;
    float _2220 = fma(_2164, _346, _2212);
    float _2222 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_93.x = _2206;
    out.m_93.y = _2196;
    out.m_93.z = _2208;
    float _2224 = fma(_2164, _338, _2190);
    float _2226 = fma(_2164, _342, _2182);
    out.gl_Position.x = _1733;
    out.gl_Position.y = _1707;
    out.gl_Position.z = _2188;
    out.gl_Position.w = _1679;
    float _2228 = exp2(_2222);
    out.m_95.z = _2210;
    out.m_95.w = _1679;
    float _2230 = _2218;
    if (_1599)
    {
        bool _2232 = _1715 >= _1697;
        bool _2234 = isnan(_1715);
        bool _2236 = _2232 || _2234;
        bool _2238 = isnan(_1697);
        bool _2240 = _2236 || _2238;
        float _2242 = float(_2240);
        _2230 = _2242;
    }
    float _2244 = _2230;
    float _2246 = -_2214;
    float _2248 = _2246 + 1.0;
    out.m_97.x = _1723;
    out.m_97.y = _1725;
    out.m_97.z = _1727;
    float _2250 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2214);
    float _2252 = _2072 * _2250;
    float _2254 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2256 = _2252;
    if (_1299)
    {
        _2256 = 1.0;
    }
    float _2258 = _2256;
    float _2260 = -_1741;
    float _2262 = _2260 + 1.0;
    float _2264 = _2262 * _2254;
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = _2258;
    if (!_1299)
    {
        int _2270 = _1383 << 4;
        int _2272 = _2270 + 2048;
        uint _2274 = uint(int(uint(_2272) >> uint(2)));
        uint _2276 = uint(int(uint(int(_2274)) >> uint(2)));
        int _2278 = int(_2274) & 3;
        float _2280 = (*spvDescriptorSet0.vp_c15)._m0[int(_2276)][_2278];
        int _2282 = int(_2274) + 1;
        uint _2284 = uint(int(uint(_2282) >> uint(2)));
        int _2286 = _2282 & 3;
        float _2288 = (*spvDescriptorSet0.vp_c15)._m0[int(_2284)][_2286];
        int _2290 = _2272 + 8;
        uint _2292 = uint(int(uint(_2290) >> uint(2)));
        uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
        int _2296 = int(_2292) & 3;
        float _2298 = (*spvDescriptorSet0.vp_c15)._m0[int(_2294)][_2296];
        int _2300 = int(_2292) + 1;
        uint _2302 = uint(int(uint(_2300) >> uint(2)));
        int _2304 = _2300 & 3;
        float _2306 = (*spvDescriptorSet0.vp_c15)._m0[int(_2302)][_2304];
        float _2308 = _996 * _2288;
        float _2310 = fma(_858, _2280, _2308);
        float _2312 = fma(_828, _2298, _2310);
        float _2314 = _2312 + _2306;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        float _2318 = -_2316;
        float _2320 = _2318 + _1786;
        float _2322 = fma(_2320, 500.0, 1.5);
        float _2324 = exp2(_2322);
        float _2326 = 0.0 + _2324;
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        _2268 = _2328;
    }
    float _2330 = _2268;
    float _2332 = -_2228;
    float _2334 = _2332 + 1.0;
    float _2336 = _2244 * _2330;
    float _2338 = -_2266;
    float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_99.x = _2224;
    out.m_99.y = _2226;
    out.m_99.z = _2220;
    float _2342 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2344 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2346 = isnan(_1112);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2352 = _2348 || _2350;
    float _2354 = -_2336;
    float _2356 = fma(_2354, _2340, 1.0);
    float _2358 = precise::clamp(_2356, 0.0, 1.0);
    out.m_101.x = _1014;
    out.m_101.y = _994;
    out.m_101.z = _1018;
    float _2360 = _2342 * _1759;
    float _2362 = -_2342;
    float _2364 = _2362 + 1.0;
    float _2366 = _2358 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2368 = _1770 * _2360;
    float _2370 = _1778 * _2360;
    out.m_103.x = _2366;
    float _2372 = fma(_1774, _2368, _1764);
    float _2374 = fma(_1776, _2368, _1766);
    float _2376 = _1770 * _2364;
    float _2378 = fma(_1770, _2370, _1768);
    out.m_105.x = 1.0;
    out.m_105.y = 1.0;
    out.m_105.z = 1.0;
    float _2380 = _2364;
    float _2382 = _2360;
    float _2384 = _2370;
    float _2386 = 1.0;
    float _2388 = 1.0;
    if (!_2352)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2390 = _2380;
    float _2392 = _2390;
    float _2394 = _2390;
    if (!_2352)
    {
        _914 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2396 = _914;
    out.m_107.x = _2372;
    out.m_107.y = _2374;
    out.m_107.z = _2378;
    out.m_107.w = _2376;
    float _2398 = _2396;
    float _2400 = _2396;
    if (!_2352)
    {
        _2382 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2402 = _2382;
    float _2404 = _2402;
    float _2406 = _2402;
    if (!_2352)
    {
        _2384 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2408 = _2384;
    float _2410 = _2408;
    float _2412 = _2408;
    if (!_2352)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2414 = _2386;
    float _2416 = _2414;
    float _2418 = _2414;
    if (!_2352)
    {
        _2388 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2420 = _2388;
    bool _2422 = !_2352;
    float _2424 = _2420;
    float _2426 = _2420;
    if (!_2422)
    {
        bool _2428 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2430 = isnan(_1112);
        bool _2432 = _2428 || _2430;
        bool _2434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2436 = _2432 || _2434;
        if (!_2436)
        {
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2440 = _1112 + _2438;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2442;
            float _2446 = 1.0 / _2444;
            float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2450 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2464 = _2440 * _2446;
            float _2466 = precise::clamp(_2464, 0.0, 1.0);
            float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2470 = _2468 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2476 = fma(_2466, _2450, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2478 = fma(_2466, _2470, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2480 = fma(_2466, _2474, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2482 = fma(_2466, _2454, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2484 = fma(_2466, _2458, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2486 = fma(_2466, _2462, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2418 = _2480;
            _2406 = _2484;
            _2394 = _2478;
            _2426 = _2482;
            _2400 = _2476;
            _2412 = _2486;
            _2488 = true;
        }
        else
        {
            bool _2490 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2492 = isnan(_1112);
            bool _2494 = _2490 || _2492;
            bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2498 = _2494 || _2496;
            if (!_2498)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2500 = _2392;
            _2394 = _2500;
            if (!_2498)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2502 = _2416;
            _2418 = _2502;
            if (!_2498)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2504 = _2398;
            _2400 = _2504;
            if (!_2498)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2506 = _2424;
            _2426 = _2506;
            if (!_2498)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2508 = _2404;
            _2406 = _2508;
            if (!_2498)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2510 = _2410;
            bool _2512 = !_2498;
            _2412 = _2510;
            if (!_2512)
            {
                bool _2514 = _1112 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2516 = isnan(_1112);
                bool _2518 = _2514 || _2516;
                bool _2520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2522 = _2518 || _2520;
                if (!_2522)
                {
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2526 = _1112 + _2524;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2528;
                    float _2532 = 1.0 / _2530;
                    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2550 = _2526 * _2532;
                    float _2552 = precise::clamp(_2550, 0.0, 1.0);
                    float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2562 = fma(_2552, _2536, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2564 = fma(_2552, _2556, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2566 = fma(_2552, _2560, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2568 = fma(_2552, _2540, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2570 = fma(_2552, _2544, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2572 = fma(_2552, _2548, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2418 = _2566;
                    _2406 = _2570;
                    _2394 = _2564;
                    _2426 = _2568;
                    _2400 = _2562;
                    _2412 = _2572;
                    _2488 = true;
                }
                else
                {
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2488 = false;
    float _2574 = _2418;
    float _2576 = _2406;
    float _2578 = _2394;
    float _2580 = _2426;
    float _2582 = _2400;
    float _2584 = _2412;
    float _2586 = fma(_2226, -0.5, 0.5);
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = -_2574;
    float _2592 = _2590 + _2576;
    float _2594 = -_2578;
    float _2596 = _2594 + _2580;
    float _2598 = -_2582;
    float _2600 = _2598 + _2584;
    bool _2602 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2604 = fma(_2588, _2592, _2574);
    float _2606 = fma(_2588, _2596, _2578);
    float _2608 = fma(_2588, _2600, _2582);
    float _2610 = _2604 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2612 = fma(_2606, 0.298911988735198974609375, _2610);
    float _2614 = fma(_2608, 0.114477999508380889892578125, _2612);
    out.m_109.x = 0.0;
    float _2616 = -_2614;
    float _2618 = _2606 + _2616;
    float _2620 = -_2614;
    float _2622 = _2604 + _2620;
    float _2624 = -_2614;
    float _2626 = _2608 + _2624;
    float _2628 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2630 = fma(_2618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2614);
    float _2632 = fma(_2622, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2614);
    float _2634 = fma(_2626, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2614);
    out.m_103.w = _2628;
    out.m_111.x = _2630;
    out.m_111.y = _2632;
    out.m_111.z = _2634;
    if (!_2602)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2636 = -_994;
    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2640 = -_1014;
    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2644 = -_1018;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2648 = _2638 * _2638;
    float _2650 = fma(_2642, _2642, _2648);
    float _2652 = fma(_2646, _2646, _2650);
    float _2654 = sqrt(_2652);
    float _2656 = rsqrt(_2652);
    float _2658 = -_2654;
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2662 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2664 = precise::clamp(_2662, 0.0, 1.0);
    float _2666 = _2642 * _2656;
    float _2668 = _2638 * _2656;
    float _2670 = abs(_2664);
    float _2672 = log2(_2670);
    float _2674 = _2646 * _2656;
    float _2676 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2678 = _2226 * _2668;
    float _2680 = -_2668;
    float _2682 = -_2676;
    float _2684 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2682);
    float _2686 = fma(_2224, _2666, _2678);
    float _2688 = -_2674;
    float _2690 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2684);
    float _2692 = fma(_2220, _2674, _2686);
    float _2694 = precise::clamp(_2692, 0.0, 1.0);
    float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2698 = _2690 + _2696;
    float _2700 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2702 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = exp2(_2700);
    float _2708 = _2706 * _2704;
    float _2710 = _2694 * _2708;
    float _2712 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2714 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2716 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _2712;
    out.m_109.y = _2714;
    out.m_109.z = _2716;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

