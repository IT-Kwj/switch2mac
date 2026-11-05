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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_83 [[user(locn0)]];
    float4 m_81 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_95 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_79 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2530 = false;
    bool _1298 = false;
    bool _482 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _2875 = as_type<float>(_134);
        out.gl_Position.z = _2875;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_61.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2944 = as_type<float>(_172);
        out.gl_Position.z = _2944;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = in.m_67.x;
    float _184 = in.m_67.y;
    float _186 = in.m_67.z;
    float _188 = in.m_69.x;
    float _190 = in.m_69.y;
    float _192 = in.m_69.z;
    float _194 = in.m_63.x;
    float _196 = in.m_63.y;
    float _198 = in.m_63.z;
    float _200 = _174 * _174;
    float _202 = _176 * _176;
    float _204 = _178 * _178;
    float _206 = fma(_182, _182, _200);
    float _208 = fma(_184, _184, _202);
    float _210 = fma(_186, _186, _204);
    float _212 = fma(_188, _188, _206);
    float _214 = fma(_190, _190, _208);
    float _216 = fma(_192, _192, _210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _218 > 0.0;
    float _224 = sqrt(_216);
    bool _226 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    bool _236 = _220 > 0.0;
    float _238 = 0.0;
    float _240 = _220;
    float _242 = _212;
    float _244 = _180;
    float _246 = _174;
    if (_222)
    {
        float _248 = rsqrt(_212);
        _238 = _248;
    }
    float _250 = _238;
    bool _252 = _224 > 0.0;
    float _254 = _224;
    if (!_234)
    {
        float _256 = _180 * _180;
        float _258 = _256 * 0.5;
        _240 = _258;
    }
    float _260 = _240;
    float _262 = 0.0;
    float _264 = _260;
    if (_236)
    {
        float _266 = rsqrt(_214);
        _262 = _266;
    }
    float _268 = _262;
    if (!_234)
    {
        float _270 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _270;
    }
    float _272 = _264;
    bool _274 = !_234;
    float _276 = _272;
    float _278 = _250;
    if (!_274)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _180 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _180);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _308;
        _242 = _294;
        _254 = _296;
    }
    float _310 = _276;
    float _312 = _242;
    float _314 = _254;
    bool _316 = !_234;
    float _318 = _312;
    float _320 = _314;
    float _322 = _310;
    if (!_316)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _180 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _244 = _342;
    }
    float _344 = _244;
    float _346 = in.m_71.w;
    if (!_222)
    {
        _318 = 0.0;
    }
    float _348 = _318;
    float _350 = _348;
    if (_222)
    {
        float _352 = _250 * _182;
        _350 = _352;
    }
    float _354 = _350;
    if (!_222)
    {
        _320 = 0.0;
    }
    float _356 = _320;
    float _358 = in.m_58.x;
    float _360 = in.m_58.y;
    float _362 = in.m_58.z;
    float _364 = 0.0;
    float _366 = _356;
    if (!_222)
    {
        _364 = 0.0;
    }
    float _368 = _364;
    float _370 = _368;
    if (_222)
    {
        float _372 = _250 * _174;
        _366 = _372;
    }
    float _374 = _366;
    if (_222)
    {
        float _376 = _250 * _188;
        _370 = _376;
    }
    float _378 = _370;
    float _380 = 0.0;
    if (_252)
    {
        float _382 = rsqrt(_216);
        _380 = _382;
    }
    float _384 = _380;
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _388 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _390 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _392 = 0.0;
    float _394 = _388;
    if (!_236)
    {
        _392 = 0.0;
    }
    float _396 = _392;
    float _398 = _396;
    if (_236)
    {
        float _400 = _268 * _184;
        _398 = _400;
    }
    float _402 = _398;
    float _404 = fma(_344, _194, _388);
    float _406 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _408 = fma(_344, _196, _390);
    if (!_236)
    {
        _278 = 0.0;
    }
    float _410 = _278;
    float _412 = _410;
    if (_236)
    {
        float _414 = _268 * _176;
        _412 = _414;
    }
    float _416 = _412;
    float _418 = fma(_344, _198, _406);
    float _420 = 0.0;
    if (!_236)
    {
        _420 = 0.0;
    }
    float _422 = _420;
    float _424 = _422;
    if (_236)
    {
        float _426 = _268 * _190;
        _424 = _426;
    }
    float _428 = _424;
    if (!_252)
    {
        _394 = 0.0;
    }
    float _430 = _394;
    float _432 = 0.0;
    float _434 = _430;
    if (!_252)
    {
        _432 = 0.0;
    }
    float _436 = _432;
    float _438 = _436;
    if (_252)
    {
        float _440 = _384 * _186;
        _434 = _440;
    }
    float _442 = _434;
    if (!_252)
    {
        _322 = 0.0;
    }
    float _444 = _322;
    float _446 = _444;
    if (_252)
    {
        float _448 = _384 * _178;
        _438 = _448;
    }
    float _450 = _438;
    if (_252)
    {
        float _452 = _384 * _192;
        _446 = _452;
    }
    float _454 = _446;
    float _456 = fma(_404, _346, _358);
    float _458 = fma(_408, _346, _360);
    float _460 = fma(_418, _346, _362);
    bool _462 = !_386;
    float _480;
    if (!_462)
    {
        float _464 = in.m_73.x;
        float _466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _468 = _464 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _470 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _472 = _470 * _466;
        float _474 = floor(_472);
        float _476 = -_474;
        float _478 = _472 + _476;
        _480 = _478;
        _482 = true;
    }
    else
    {
        float _484 = float(_118);
        float _486 = 1.0 / _484;
        float _488 = _152 * _486;
        _480 = _488;
    }
    _482 = false;
    float _490 = _480;
    float _492 = in.m_73.x;
    float _494 = in.m_73.y;
    float _496 = in.m_73.z;
    float _498 = _458 * _184;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _508 = fma(_456, _182, _498);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _512 = _490 + _510;
    float _514 = 1.0 / _502;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _526 = _524 != 0;
    float _528 = 1.0 / _506;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _532 = _490 + _530;
    float _534 = _492 * 2.0;
    float _536 = _496 * 2.0;
    float _538 = _494 + _496;
    float _540 = _494 + _492;
    float _542 = floor(_534);
    float _544 = _494 * 2.0;
    float _546 = _496 + _492;
    float _548 = _496 + (-0.5);
    float _550 = _492 + (-0.5);
    float _552 = _540 + (-1.0);
    float _554 = _532 * _528;
    float _556 = floor(_536);
    float _558 = _538 + (-1.0);
    float _560 = _546 + (-1.0);
    float _562 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _564 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _566 = !_522;
    int _568 = _566 ? 0 : 1;
    float _570 = floor(_544);
    float _572 = _494 + (-0.5);
    float _574 = _512 * _514;
    bool _576 = _542 > 0.0;
    bool _578 = _542 >= 0.0;
    bool _580 = isnan(_542);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _590 = log2(_588);
    bool _592 = _556 > 0.0;
    bool _594 = _556 >= 0.0;
    bool _596 = isnan(_556);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _606 = _586 ? 0 : 1;
    bool _608 = !_518;
    int _610 = _608 ? 0 : 1;
    int _612 = _602 ? 0 : 1;
    int _614 = ~_606;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    int _620 = _618;
    if (!_576)
    {
        int _622 = ~_606;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    int _628 = abs(_610);
    float _630 = _590 * _152;
    int _632 = ~_612;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    int _638 = _636;
    if (!_592)
    {
        int _640 = ~_612;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = exp2(_630);
    int _648 = abs(_568);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _652 = 1.0 + _650;
    float _654 = in.m_75.x;
    float _656 = in.m_75.y;
    float _658 = in.m_75.z;
    float _660 = float(_628);
    float _662 = float(_644);
    float _664 = 1.0 / _652;
    bool _666 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _668 = isnan(1.0);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _674 = _670 || _672;
    float _676 = float(_648);
    float _678 = _660 * _662;
    float _680 = float(_626);
    bool _682 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = -_646;
    float _694 = _692 + 1.0;
    bool _696 = _570 > 0.0;
    float _698 = _676 * _680;
    float _700 = _678 * (-2.0);
    float _702 = _690 ? _694 : 0.0;
    float _704 = _698 * (-2.0);
    bool _706 = _570 >= 0.0;
    bool _708 = isnan(_570);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _716;
    float _720 = fma(_604, _700, _604);
    if (_674)
    {
        float _722 = _702 * _664;
        _156 = _722;
    }
    float _724 = _156;
    int _726 = _714 ? 0 : 1;
    float _728 = fma(_700, _654, _654);
    float _730 = fma(_718, _574, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _732 = fma(_704, _656, _656);
    int _734 = ~_726;
    int _736 = _734 + 1;
    int _738 = _736 + 1;
    float _740 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[196].x, _728);
    int _742 = _738;
    if (!_696)
    {
        int _744 = ~_726;
        int _746 = _744 + 1;
        _742 = _746;
    }
    int _748 = _742;
    float _750 = fma(_562, _704, _562);
    float _752 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _732);
    bool _754 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _756 = isnan(_490);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = fma(_720, _724, _740);
    bool _768 = !_526;
    int _770 = _768 ? 0 : 1;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _776 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _778 = isnan(_490);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -_764;
    float _790 = _788 + 1.0;
    bool _792 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _794 = isnan(_490);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = fma(_750, _724, _752);
    int _806 = abs(_770);
    float _808 = _766 * 0.15915493667125701904296875;
    float _810 = _802 * _790;
    float _812 = -_802;
    float _814 = _812 + 1.0;
    float _816 = float(_806);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _818;
    float _822 = float(_748);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _824;
    float _828 = _786 * _814;
    float _830 = fma(_820, _574, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _836 = _816 * _822;
    float _838 = fma(_826, _574, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _840 = _730 * _828;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _846 = _836 * (-2.0);
    float _848 = fma(_774, _554, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _850 = _830 * _828;
    float _852 = _838 * _828;
    float _854 = fma(_846, _658, _658);
    float _856 = in.m_71.x;
    float _858 = in.m_71.y;
    float _860 = in.m_71.z;
    float _862 = fma(_844, _554, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _864 = fma(_834, _554, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _866 = -_786;
    float _868 = _866 + 1.0;
    float _870 = in.m_77.x;
    float _872 = in.m_77.y;
    float _874 = in.m_77.z;
    float _876 = fma(_564, _846, _564);
    float _878 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[196].z, _854);
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[143].y, _840);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[143].x, _850);
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[143].z, _852);
    float _886 = fma(_876, _724, _878);
    float _888 = fma(_848, _810, _880);
    float _890 = _804 * 0.15915493667125701904296875;
    float _892 = fma(_862, _810, _882);
    float _894 = _886 * 0.15915493667125701904296875;
    float _896 = fma(_864, _810, _884);
    float _898 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[145].y, _888);
    float _900 = _808 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[145].x, _892);
    float _906 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[145].z, _896);
    float _908 = _458 * _190;
    float _910 = _458 * _176;
    float _912 = _904 * _856;
    float _914 = _808 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = _898 * _858;
    float _920 = _906 * _860;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _870);
    float _924 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _872);
    float _928 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _930 = fma(_460, _186, _508);
    float _932 = _890 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _874);
    float _938 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _940 = _924 * _922;
    float _942 = _928 * _926;
    float _944 = fma(_456, _188, _908);
    float _946 = _938 * _936;
    float _948 = _930 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _950 = _890 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = fma(_460, _192, _944);
    bool _956 = _872 != 0.0;
    bool _958 = isnan(_872);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = fma(_456, _174, _910);
    bool _968 = _870 == 0.0;
    bool _970 = !_964;
    bool _972 = _968 && _970;
    float _974 = fma(_460, _178, _966);
    float _976 = _894 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _902 * _934;
    bool _982 = _874 == 0.0;
    bool _984 = _982 && _972;
    float _986 = _894 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _916 * _952;
    float _992 = _902 * _952;
    float _994 = _916 * _978;
    float _996 = _902 * _978;
    float _998 = _916 * _934;
    float _1000 = _934 * _978;
    float _1002 = _994 * _942;
    float _1004 = _952 * _978;
    float _1006 = _996 * _942;
    float _1008 = fma(_988, _990, _980);
    float _1010 = -_942;
    float _1012 = _988 * _1010;
    float _1014 = -_992;
    float _1016 = fma(_988, _998, _1014);
    float _1018 = -_998;
    float _1020 = fma(_988, _992, _1018);
    float _1022 = fma(_1008, _940, _1002);
    float _1024 = fma(_1004, _940, _1012);
    float _1026 = fma(_988, _980, _990);
    float _1028 = fma(_1020, _940, _1006);
    float _1030 = fma(_1016, _946, _1022);
    float _1032 = fma(_1000, _946, _1024);
    float _1034 = _954 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1036 = fma(_1026, _946, _1028);
    float _1038 = _1030 * _402;
    float _1040 = _1030 * _428;
    float _1042 = _1030 * _416;
    float _1044 = fma(_1032, _354, _1038);
    float _1046 = fma(_1032, _378, _1040);
    float _1048 = fma(_1032, _374, _1042);
    float _1050 = fma(_1036, _442, _1044);
    float _1052 = fma(_1036, _454, _1046);
    float _1054 = in.m_79.x;
    float _1056 = in.m_79.y;
    float _1058 = in.m_79.z;
    float _1060 = fma(_1036, _450, _1048);
    float _1062 = _948 + _1050;
    float _1064 = _1034 + _1052;
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1068 = _1062 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1072 = _1064 + _1070;
    float _1074 = _1068 * _1068;
    float _1076 = _1072 * _1072;
    float _1078 = _1074 + _1076;
    float _1080 = sqrt(_1078);
    float _1082 = _1056;
    float _1084 = _1054;
    float _1086 = _1058;
    float _1088 = _1074;
    float _1090 = _1062;
    float _1092 = _1064;
    int _1094 = as_type<int>(_1072);
    float _1096 = _1026;
    if (!_984)
    {
        float _1098 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1082 = _1098;
    }
    float _1100 = _1082;
    float _1102 = _1100;
    if (!_984)
    {
        float _1104 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1054);
        _1084 = _1104;
    }
    float _1106 = _1084;
    float _1108 = _1106;
    if (!_984)
    {
        float _1110 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1058);
        _1086 = _1110;
    }
    float _1112 = _1086;
    float _1114 = _974 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1116 = -_1100;
    float _1118 = _988 * _1116;
    float _1120 = _994 * _1100;
    float _1122 = _996 * _1100;
    float _1124 = fma(_1004, _1106, _1118);
    float _1126 = fma(_1008, _1106, _1120);
    float _1128 = fma(_1020, _1106, _1122);
    bool _1130 = _1080 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = fma(_1000, _1112, _1124);
    float _1134 = fma(_1016, _1112, _1126);
    float _1136 = fma(_1026, _1112, _1128);
    float _1138 = _1114 + _1060;
    if (!_1130)
    {
        _246 = _1076;
    }
    float _1140 = _246;
    float _1142 = _1140;
    if (!_1130)
    {
        _1108 = _1138;
    }
    float _1144 = _1108;
    bool _1146 = !_1130;
    float _1148 = _1144;
    if (!_1146)
    {
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1154 = _1080 + _1152;
        float _1156 = rsqrt(_1078);
        float _1158 = _1154 * _1150;
        float _1160 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = _1158 * 0.15915493667125701904296875;
        float _1164 = _1162 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1162 * 6.283185482025146484375;
        float _1170 = cos(_1168);
        float _1172 = fma(_1166, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1174 = _1156 * _1172;
        float _1176 = _1170 + (-1.0);
        float _1178 = fma(_1068, _1174, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1180 = fma(_1072, _1174, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1182 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1186 = _1178 + _1184;
        float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1190 = _1180 + _1188;
        float _1192 = fma(_1138, _1170, _1182);
        float _1194 = _1186 * _1186;
        float _1196 = _1190 * _1190;
        _1148 = _1192;
        _1088 = _1194;
        _1142 = _1196;
        _1090 = _1178;
        _1092 = _1180;
        _1102 = _1162;
    }
    float _1198 = _1148;
    float _1200 = _1088;
    float _1202 = _1142;
    float _1204 = _1090;
    float _1206 = _1092;
    float _1208 = _1102;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1212 = _1198 + _1210;
    float _1214 = _1134 * _402;
    float _1216 = _1134 * _416;
    float _1218 = _1134 * _428;
    float _1220 = fma(_1212, _1212, _1200);
    float _1222 = fma(_1132, _354, _1214);
    float _1224 = fma(_1132, _374, _1216);
    float _1226 = _1220 + _1202;
    float _1228 = fma(_1136, _442, _1222);
    float _1230 = fma(_1136, _450, _1224);
    float _1232 = fma(_1132, _378, _1218);
    float _1234 = sqrt(_1226);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1244 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = fma(_1136, _454, _1232);
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1244;
    out.m_83.y = _1246;
    out.m_83.z = _1248;
    out.m_83.w = _1242;
    bool _1252 = _1234 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1254 = isnan(_1234);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1260 = _1256 || _1258;
    out.m_85.x = _1228;
    out.m_85.y = _1230;
    out.m_85.z = _1250;
    float _1262 = _1208;
    if (!_1260)
    {
        _1262 = 1.0;
    }
    float _1264 = _1262;
    bool _1266 = !_1260;
    float _1268 = _1264;
    if (!_1266)
    {
        bool _1270 = _1234 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1272 = isnan(_1234);
        bool _1274 = _1270 || _1272;
        bool _1276 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1278 = _1274 || _1276;
        if (!_1278)
        {
            float _1280 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1282 = _1234 + _1280;
            float _1284 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1286 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1284;
            float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1290 = _1288 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1292 = 1.0 / _1286;
            float _1294 = _1282 * _1292;
            float _1296 = fma(_1294, _1290, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1268 = _1296;
            _1298 = true;
        }
        else
        {
            bool _1300 = _1234 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1302 = isnan(_1234);
            bool _1304 = _1300 || _1302;
            bool _1306 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1308 = _1304 || _1306;
            if (!_1308)
            {
                float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1312 = _1234 + _1310;
                float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1316 = _1314 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1320 = _1318 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1322 = 1.0 / _1316;
                float _1324 = _1312 * _1322;
                float _1326 = fma(_1324, _1320, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1268 = _1326;
                _1298 = true;
            }
            else
            {
                _1268 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1298 = false;
    float _1328 = _1268;
    float _1330 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1332 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1334 = floor(_1330);
    float _1336 = floor(_1332);
    float _1338 = -_1334;
    float _1340 = _1330 + _1338;
    float _1342 = -_1336;
    float _1344 = _1332 + _1342;
    float2 _4727 = float2(_1340, _1344);
    float _1346 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4727, float2(0.0), isnan(_4727)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4727, float2(0.0), isnan(_4727)), level(0.0)).x;
    float _1348 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1352 = _1204 + _1350;
    float _1354 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1348);
    float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1358 = _1198 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1362 = _1206 + _1360;
    float _1364 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1354);
    float _1366 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1368 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.5);
    bool _1376 = _1372 || _1374;
    float _1378 = fma(_1352, _1328, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1380 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1382 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1366);
    float _1384 = fma(_1358, _1328, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1386 = fma(_1362, _1328, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1388 = 1.0 / _1380;
    float _1390 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1382);
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1394 = _1358;
    float _1396 = _1328;
    int _1398 = 2;
    if (_1376)
    {
        _1394 = _1378;
    }
    float _1400 = _1394;
    float _1402 = _1392 + _1380;
    float _1404 = _1400;
    if (_1376)
    {
        _1396 = _1384;
    }
    float _1406 = _1396;
    float _1408 = _1402 * _1388;
    float _1410 = _1408 * 0.5;
    float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1414 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1412);
    float _1416 = 1.0 / _1414;
    float _1418 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1420 = _1114 + _1418;
    float _1422 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1424 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1422);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1428 = _1416 * _1426;
    float _1430 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1424);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1434 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1436 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1432);
    bool _1438 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1440 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1442 = !_1434;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1436);
    float _1448 = trunc(_1440);
    int _1450 = int(_1448);
    float _1452 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1454 = _1406;
    if (!_1434)
    {
        _1398 = 1;
    }
    int _1456 = _1398;
    int _1458 = _1456;
    if (!_1438)
    {
        _1458 = _1444;
    }
    int _1460 = _1458;
    float _1462 = trunc(_1452);
    int _1464 = int(_1462);
    int _1466 = _1460 << 6;
    int _1468 = _1466 + 48;
    uint _1471 = uint(int(uint(_1468) >> uint(2)));
    uint _1473 = uint(int(uint(int(_1471)) >> uint(2)));
    int _1475 = int(_1471) & 3;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[int(_1473)][_1475];
    int _1479 = int(_1471) + 1;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    int _1483 = _1479 & 3;
    float _1485 = (*spvDescriptorSet0.vp_c15)._m0[int(_1481)][_1483];
    int _1487 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1489 = _1450 + _1487;
    int _1491 = _1489 + 1;
    bool _1493 = _1491 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1495 = _1466 + 56;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    int _1513 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1515 = _1464 + _1513;
    int _1517 = _1515 + 1;
    int _1519 = _1491 | _1517;
    int _1521 = _1466 + 64;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    uint _1525 = uint(int(uint(int(_1523)) >> uint(2)));
    int _1527 = int(_1523) & 3;
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[int(_1525)][_1527];
    int _1531 = int(_1523) + 1;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    int _1535 = _1531 & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    bool _1539 = _1519 < 0;
    bool _1541 = _1539 || _1493;
    float _1543 = as_type<float>(_1519);
    int _1545 = _1491;
    if (_1376)
    {
        _1543 = _1386;
    }
    float _1547 = _1543;
    bool _1549 = _1517 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1551 = _1549 || _1541;
    int _1553 = _1466 + 72;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
    int _1559 = int(_1555) & 3;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
    int _1563 = int(_1555) + 1;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    int _1567 = _1563 & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = _1466 + 96;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    uint _1575 = uint(int(uint(int(_1573)) >> uint(2)));
    int _1577 = int(_1573) & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    int _1581 = int(_1573) + 1;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    int _1585 = _1581 & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    int _1589 = _1466 + 104;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    float _1607 = _1547;
    if (!_1376)
    {
        float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1611 = _1114 + _1609;
        float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1615 = _948 + _1613;
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1619 = _1611 * _1611;
        float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1623 = _1034 + _1621;
        float _1625 = fma(_1615, _1615, _1619);
        float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1629 = fma(_1623, _1623, _1625);
        float _1631 = sqrt(_1629);
        float _1633 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1635 = -_1034;
        float _1637 = _1635 + _1386;
        float _1639 = precise::min(_1631, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1641 = _1639 * _1627;
        float _1643 = -_1114;
        float _1645 = _1643 + _1384;
        float _1647 = _1633 * _1641;
        float _1649 = -_948;
        float _1651 = _1649 + _1378;
        float _1653 = fma(_1645, _1647, _1114);
        float _1655 = fma(_1651, _1647, _948);
        float _1657 = fma(_1637, _1647, _1034);
        _1454 = _1653;
        _1404 = _1655;
        _1607 = _1657;
        _1094 = as_type<int>(_1627);
    }
    float _1659 = _1454;
    float _1661 = _1404;
    float _1663 = _1607;
    int _1665 = _1094;
    float _1667 = _1420 * _1587;
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1671 = _1665;
    if (!_1551)
    {
        int _1673 = _1517 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1675 = _1673 + _1491;
        _1545 = _1675;
    }
    int _1677 = _1545;
    float _1679 = _1420 * _1537;
    float _1681 = fma(_948, _1579, _1667);
    float _1683 = _1420 * _1485;
    float _1685 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1669);
    int _1687 = as_type<int>(_1685);
    if (!_1551)
    {
        int _1689 = _1677 << 2;
        _1671 = _1689;
    }
    int _1691 = _1671;
    float _1693 = fma(_1034, _1597, _1681);
    float _1695 = fma(_948, _1477, _1683);
    float _1697 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1685);
    float _1699 = fma(_948, _1529, _1679);
    int _1701 = _1691;
    if (!_1551)
    {
        uint _1703 = uint(int(uint(_1677) >> uint(2)));
        _1687 = int(_1703);
    }
    int _1705 = _1687;
    int _1707 = _1466 + 80;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    uint _1711 = uint(int(uint(int(_1709)) >> uint(2)));
    int _1713 = int(_1709) & 3;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[int(_1711)][_1713];
    int _1717 = int(_1709) + 1;
    uint _1719 = uint(int(uint(_1717) >> uint(2)));
    int _1721 = _1717 & 3;
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[int(_1719)][_1721];
    if (!_1551)
    {
        int _1725 = 12 & _1691;
        _1701 = _1725;
    }
    int _1727 = _1701;
    float _1729 = _1693 + _1605;
    float _1731 = fma(_1034, _1503, _1695);
    float _1733 = fma(_1034, _1561, _1699);
    float _1735 = as_type<float>(_1727);
    if (!_1551)
    {
        int _1737 = _1705 << 4;
        int _1739 = _1737 + _1727;
        _1735 = as_type<float>(_1739);
    }
    float _1741 = _1735;
    float _1743 = 1.0 / _1729;
    float _1745 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1747 = _1466 + 88;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    uint _1751 = uint(int(uint(int(_1749)) >> uint(2)));
    int _1753 = int(_1749) & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    int _1757 = int(_1749) + 1;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    int _1761 = _1757 & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    float _1765 = _1731 + _1511;
    float _1767 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = _1733 + _1569;
    float _1771 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1773 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1745);
    float _1775 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1777 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1779 = _1741;
    if (!_1551)
    {
        int _1781 = as_type<int>(_1741) + 400;
        uint _1783 = uint(int(uint(_1781) >> uint(2)));
        uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
        int _1787 = int(_1783) & 3;
        float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
        _1779 = _1789;
    }
    float _1791 = _1779;
    float _1793 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1771);
    float _1795 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1773);
    float _1797 = -_1777;
    float _1799 = fma(_1797, _1775, 1.0);
    float _1801 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1803 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1793);
    float _1805 = _1765 * _1743;
    float _1807 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1809 = _1769 * _1743;
    float _1811 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1801);
    float _1813 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1815 = _1805 >= 0.0;
    float _1817 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1819 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1811);
    float _1821 = _1765;
    float _1823 = _1743;
    if (!_1551)
    {
        float _1825 = floor(_1452);
        _1821 = _1825;
    }
    float _1827 = _1821;
    bool _1829 = _1805 <= 1.0;
    bool _1831 = _1829 && _1815;
    float _1833 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1817);
    float _1835 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1837 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1839 = _1809 >= 0.0;
    bool _1841 = _1839 && _1831;
    float _1843 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1833);
    float _1845 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1847 = log2(_1799);
    bool _1849 = _1809 <= 1.0;
    bool _1851 = _1849 && _1841;
    float _1853 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1843);
    float _1855 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1845);
    float _1857 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1837);
    float _1859 = 1.0 / _1853;
    float _1861 = _1827;
    float _1863 = _1791;
    if (!_1551)
    {
        float _1865 = -_1827;
        float _1867 = _1452 + _1865;
        _1861 = _1867;
    }
    float _1869 = _1861;
    float _1871 = _1420 * _1723;
    float _1873 = _1723;
    if (_1851)
    {
        float _1875 = float(_1460);
        _1873 = _1875;
    }
    float _1877 = _1873;
    float _1879 = fma(_948, _1715, _1871);
    float _1881 = _1378;
    if (!_1551)
    {
        float _1883 = floor(_1440);
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1855);
    float _1889 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1857);
    float _1891 = fma(_1034, _1755, _1879);
    float _1893 = _1847 * 0.693147182464599609375;
    float _1895 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1887);
    float _1897 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1889);
    float _1899 = _1891 + _1763;
    float _1901 = _1871;
    if (_1851)
    {
        float _1903 = rint(_1877);
        float _1905 = precise::max(_1903, 0.0);
        uint _1907 = uint(_1905);
        uint _1909 = clamp(_1907, 0u, 65535u);
        _1901 = as_type<float>(_1909);
    }
    float _1911 = _1901;
    float _1913 = _1895 * _1859;
    float _1915 = _1897 * _1859;
    float _1917 = _1899 * _1743;
    float _1919 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1921 = fma(_1913, 0.5, 0.5);
    float _1923 = fma(_1915, -0.5, 0.5);
    float _1925 = _1879;
    float _1927 = _1859;
    if (!_1551)
    {
        float _1929 = rint(_1791);
        float _1931 = precise::max(_1929, 0.0);
        uint _1933 = uint(_1931);
        uint _1935 = clamp(_1933, 0u, 65535u);
        _1925 = as_type<float>(_1935);
    }
    float _1937 = _1925;
    if (!_1551)
    {
        float _1939 = -_1885;
        float _1941 = _1440 + _1939;
        _1927 = _1941;
    }
    float _1943 = _1927;
    float _1945 = _1911;
    if (_1851)
    {
        float3 _5754 = float3(_1805, _1809, float(as_type<int>(_1911)));
        float3 _5758 = select(_5754, float3(0.0), isnan(_5754));
        float _1947 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5758.xy, uint(rint(_5758.z)), _1917, level(0.0));
        _1945 = _1947;
    }
    float _1949 = _1945;
    float3 _5768 = float3(_1921, _1923, _1919);
    float _1951 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5768, float3(0.0), isnan(_5768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5768, float3(0.0), isnan(_5768)), level(0.0)).x;
    float3 _5777 = float3(_1921, _1923, _1919);
    float4 _1954 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5777, float3(0.0), isnan(_5777)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5777, float3(0.0), isnan(_5777)), level(0.0)).xyzw;
    float _1956 = _1954.x;
    float _1958 = _1954.y;
    float _1960 = _1954.z;
    float _1962 = _1954.w;
    float _1964 = _1869;
    float _1966 = _1937;
    if (!_1551)
    {
        float3 _5801 = float3(_1943, _1869, float(as_type<int>(_1937)));
        float3 _5803 = select(_5801, float3(0.0), isnan(_5801));
        float _1968 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5803.xy, uint(rint(_5803.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5803.xy, uint(rint(_5803.z)), level(0.0)).x;
        _1964 = _1968;
    }
    float _1970 = _1964;
    if (_1551)
    {
        _1823 = 1.0;
    }
    float _1972 = _1823;
    float _1974 = _1972;
    if (!_1551)
    {
        int _1976 = _1677 << 4;
        int _1978 = _1976 + 2048;
        uint _1980 = uint(int(uint(_1978) >> uint(2)));
        uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
        int _1984 = int(_1980) & 3;
        float _1986 = (*spvDescriptorSet0.vp_c15)._m0[int(_1982)][_1984];
        int _1988 = int(_1980) + 1;
        uint _1990 = uint(int(uint(_1988) >> uint(2)));
        int _1992 = _1988 & 3;
        float _1994 = (*spvDescriptorSet0.vp_c15)._m0[int(_1990)][_1992];
        int _1996 = _1978 + 8;
        uint _1998 = uint(int(uint(_1996) >> uint(2)));
        uint _2000 = uint(int(uint(int(_1998)) >> uint(2)));
        int _2002 = int(_1998) & 3;
        float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
        int _2006 = int(_1998) + 1;
        uint _2008 = uint(int(uint(_2006) >> uint(2)));
        int _2010 = _2006 & 3;
        float _2012 = (*spvDescriptorSet0.vp_c15)._m0[int(_2008)][_2010];
        float _2014 = _1420 * _1994;
        float _2016 = fma(_948, _1986, _2014);
        float _2018 = fma(_1034, _2004, _2016);
        float _2020 = _2018 + _2012;
        float _2022 = precise::clamp(_2020, 0.0, 1.0);
        float _2024 = -_2022;
        float _2026 = _2024 + _1970;
        float _2028 = fma(_2026, 500.0, 1.5);
        float _2030 = exp2(_2028);
        float _2032 = 0.0 + _2030;
        float _2034 = precise::clamp(_2032, 0.0, 1.0);
        _1966 = _1986;
        _1974 = _2034;
    }
    float _2036 = _1966;
    float _2038 = _1974;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2042 = _1659 + _2040;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2046 = _1661 + _2044;
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2050 = _1663 + _2048;
    float _2052 = _2042 * _2042;
    float _2054 = fma(_2046, _2046, _2052);
    float _2056 = fma(_2050, _2050, _2054);
    float _2058 = rsqrt(_2056);
    float _2060 = sqrt(_2056);
    float _2062 = _2046 * _2058;
    float _2064 = _2050 * _2058;
    float _2066 = _2042 * _2058;
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2070 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2072 = _2068 * _2068;
    float _2074 = _2070 * _2070;
    float _2076 = _2072 + _2074;
    float _2078 = sqrt(_2076);
    bool _2080 = _2078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2084 = _2078 + _2082;
    float _2086 = _1034;
    float _2088 = _2058;
    float _2090 = _2084;
    float _2092 = _2036;
    if (_2080)
    {
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2086 = _2094;
    }
    float _2096 = _2086;
    if (_2080)
    {
        float _2098 = rsqrt(_2076);
        _2088 = _2098;
    }
    float _2100 = _2088;
    float _2102 = _2100;
    if (_2080)
    {
        float _2104 = _2084 * _2096;
        _2090 = _2104;
    }
    float _2106 = _2090;
    if (_2080)
    {
        float _2108 = _2106 * 0.15915493667125701904296875;
        _2092 = _2108;
    }
    float _2110 = _2092;
    float _2112 = _2096;
    float _2114 = _2110;
    if (_2080)
    {
        float _2116 = _2110 * 6.283185482025146484375;
        float _2118 = sin(_2116);
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2124 = precise::max(0.0, _2122);
    float _2126 = _1970;
    float _2128 = _2124;
    if (_2080)
    {
        float _2130 = _2110 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        _2126 = _2132;
    }
    float _2134 = _2126;
    float _2136 = -_2066;
    float _2138 = -_2124;
    float _2140 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2138);
    if (_2080)
    {
        float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2142;
    }
    float _2144 = _2128;
    float _2146 = _2120;
    float _2148 = _2144;
    if (_2080)
    {
        float _2150 = fma(_2120, _2144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1863 = _2150;
    }
    float _2152 = _1863;
    float _2154 = _2152;
    if (!_2080)
    {
        _2146 = _2068;
    }
    float _2156 = _2146;
    float _2158 = _2156;
    float _2160 = _2134;
    if (_2080)
    {
        float _2162 = _2134 + (-1.0);
        _2148 = _2162;
    }
    float _2164 = _2148;
    float _2166 = _2164;
    if (_2080)
    {
        float _2168 = _2100 * _2152;
        _1096 = _2168;
    }
    float _2170 = _1096;
    if (!_2080)
    {
        _2102 = _2140;
    }
    float _2172 = _2102;
    float _2174 = _2172;
    if (_2080)
    {
        float _2176 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2176;
    }
    float _2178 = _2114;
    if (_2080)
    {
        float _2180 = _2068 * _2170;
        _2158 = _2180;
    }
    float _2182 = _2158;
    if (!_2080)
    {
        _2166 = _2070;
    }
    float _2184 = _2166;
    float _2186 = _2184;
    if (_2080)
    {
        float _2188 = _2070 * _2170;
        _2186 = _2188;
    }
    float _2190 = _2186;
    if (!_2080)
    {
        _2154 = _2072;
    }
    float _2192 = _2154;
    float _2194 = _2192;
    if (_2080)
    {
        float _2196 = fma(_2140, _2134, _2178);
        _2174 = _2196;
    }
    float _2198 = _2174;
    if (_2080)
    {
        float _2200 = _2182 * _2182;
        _2194 = _2200;
    }
    float _2202 = _2194;
    if (!_2080)
    {
        _2160 = _2074;
    }
    float _2204 = _2160;
    float _2206 = _2204;
    if (_2080)
    {
        float _2208 = _2190 * _2190;
        _2206 = _2208;
    }
    float _2210 = _2206;
    float _2212 = fma(_2198, _2198, _2202);
    float _2214 = _2212 + _2210;
    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2218 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2216);
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = -_2220;
    float _2224 = _2222 + 1.0;
    float _2226 = rsqrt(_2214);
    float _2228 = _2226 * _2182;
    float _2230 = _2226 * _2198;
    float _2232 = _2226 * _2190;
    float _2234 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2236 = abs(_2224);
    float _2238 = log2(_2236);
    float _2240 = -_2234;
    float _2242 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2240);
    float _2244 = -_2232;
    float _2246 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2242);
    float _2248 = fma(_2246, -0.5, 0.5);
    float _2250 = fma(_2246, 0.5, 0.5);
    float _2252 = fma(_2250, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2254 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2256 = sqrt(_2248);
    float _2258 = fma(_2250, _2252, -0.212114393711090087890625);
    float _2260 = _2230 + 1.0;
    float _2262 = fma(_2250, _2258, 1.570728778839111328125);
    float _2264 = exp2(_2254);
    float _2266 = _2256 * 0.636619746685028076171875;
    float _2268 = -_2230;
    float _2270 = fma(_2264, _2260, _2268);
    float _2272 = -_2262;
    float _2274 = fma(_2266, _2272, 1.0);
    float _2276 = fma(_2270, 0.5, 0.5);
    float2 _6286 = float2(_2274, _2276);
    float3 _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6286, float2(0.0), isnan(_6286)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6286, float2(0.0), isnan(_6286)), level(0.0)).xyz;
    float _2282 = _2280.x;
    float _2284 = _2280.y;
    float _2286 = _2280.z;
    float _2288 = abs(_1428);
    float _2290 = log2(_2288);
    float _2292 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2294 = -_1346;
    float _2296 = _2294 + 1.0;
    out.m_87.x = _1661;
    out.m_87.y = _1659;
    out.m_87.z = _1663;
    float _2298 = exp2(_2292);
    bool _2300 = _1428 <= 8000.0;
    bool _2302 = isnan(_1428);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan(8000.0);
    bool _2308 = _2304 || _2306;
    float _2310 = float(_2308);
    float _2312 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2314 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2316 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2314);
    float _2318 = exp2(_2312);
    float _2320 = -_2298;
    float _2322 = _2320 + 1.0;
    float _2324 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2316);
    float _2326 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2324);
    float _2328 = _2326 + _1853;
    float _2330 = _2328 * 0.5;
    float _2332 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2334 = precise::clamp(_2332, 0.0, 1.0);
    float _2336 = fma(_2334, -2.0, 3.0);
    float _2338 = _2334 * _2334;
    float _2340 = _2338 * _2336;
    float _2342 = -_2340;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2340);
    float _2348 = _2310 * _2346;
    float _2350 = _2310;
    float _2352 = _2326;
    float _2354 = _1895;
    if (!_1851)
    {
        _2350 = 1.0;
    }
    float _2356 = _2350;
    out.m_89.z = _2330;
    out.m_89.w = _1853;
    float _2358 = _2356;
    if (_1851)
    {
        bool _2360 = _1949 >= _1917;
        bool _2362 = isnan(_1949);
        bool _2364 = _2360 || _2362;
        bool _2366 = isnan(_1917);
        bool _2368 = _2364 || _2366;
        float _2370 = float(_2368);
        _2358 = _2370;
    }
    float _2372 = _2358;
    float _2374 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2376 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2378 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2380 = isnan(_2060);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2386 = _2382 || _2384;
    out.gl_Position.x = _1895;
    out.gl_Position.y = _1897;
    out.gl_Position.z = _2326;
    out.gl_Position.w = _1853;
    float _2388 = _2296 * _2374;
    float _2390 = precise::clamp(_2388, 0.0, 1.0);
    float _2392 = _2376 * _1951;
    float _2394 = _2372 * _2038;
    float _2396 = -_2376;
    float _2398 = _2396 + 1.0;
    float _2400 = -_2390;
    float _2402 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2404 = _1962 * _2392;
    float _2406 = _1962 * _2398;
    float _2408 = -_2394;
    float _2410 = fma(_2408, _2402, 1.0);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = _2402;
    float _2416 = _2412;
    float _2418 = _2390;
    float _2420 = _2392;
    if (!_2386)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2422 = _2414;
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2426 = _2422;
    float _2428 = _2422;
    if (!_2386)
    {
        _2352 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2430 = _2352;
    float _2432 = _2430;
    float _2434 = _2430;
    if (!_2386)
    {
        _2354 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2436 = _2354;
    out.m_91.x = _2424;
    float _2438 = _2436;
    float _2440 = _2436;
    if (!_2386)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2442 = _2416;
    float _2444 = _2442;
    float _2446 = _2442;
    if (!_2386)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2448 = _2418;
    float _2450 = _2286 * _2392;
    float _2452 = fma(_2282, _2404, _1956);
    float _2454 = fma(_2284, _2404, _1958);
    float _2456 = _2448;
    float _2458 = _2448;
    if (!_2386)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2460 = _2420;
    float _2462 = fma(_1962, _2450, _1960);
    out.m_93.x = _2452;
    out.m_93.y = _2454;
    out.m_93.z = _2462;
    out.m_93.w = _2406;
    bool _2464 = !_2386;
    float _2466 = _2460;
    float _2468 = _2460;
    if (!_2464)
    {
        bool _2470 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2472 = isnan(_2060);
        bool _2474 = _2470 || _2472;
        bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2478 = _2474 || _2476;
        if (!_2478)
        {
            float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2482 = _2060 + _2480;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2486 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2484;
            float _2488 = 1.0 / _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2510 = _2482 * _2488;
            float _2512 = precise::clamp(_2510, 0.0, 1.0);
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2518 = fma(_2512, _2492, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2520 = fma(_2512, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2522 = fma(_2512, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2524 = fma(_2512, _2500, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2526 = fma(_2512, _2504, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2528 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2434 = _2518;
            _2446 = _2526;
            _2468 = _2520;
            _2428 = _2524;
            _2440 = _2522;
            _2458 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2534 = isnan(_2060);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2542 = _2466;
            _2468 = _2542;
            if (!_2540)
            {
                _2432 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2544 = _2432;
            _2434 = _2544;
            if (!_2540)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2546 = _2438;
            _2440 = _2546;
            if (!_2540)
            {
                _2426 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2548 = _2426;
            _2428 = _2548;
            if (!_2540)
            {
                _2444 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2550 = _2444;
            _2446 = _2550;
            if (!_2540)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2552 = _2456;
            bool _2554 = !_2540;
            _2458 = _2552;
            if (!_2554)
            {
                bool _2556 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2558 = isnan(_2060);
                bool _2560 = _2556 || _2558;
                bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2564 = _2560 || _2562;
                if (!_2564)
                {
                    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2568 = _2060 + _2566;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2572 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2570;
                    float _2574 = 1.0 / _2572;
                    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2596 = _2568 * _2574;
                    float _2598 = precise::clamp(_2596, 0.0, 1.0);
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2604 = fma(_2598, _2578, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2606 = fma(_2598, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2608 = fma(_2598, _2582, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2610 = fma(_2598, _2586, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2612 = fma(_2598, _2590, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2614 = fma(_2598, _2594, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2434 = _2604;
                    _2446 = _2612;
                    _2468 = _2606;
                    _2428 = _2610;
                    _2440 = _2608;
                    _2458 = _2614;
                    _2530 = true;
                }
                else
                {
                    _2434 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2446 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2428 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2530 = false;
    float _2616 = _2434;
    float _2618 = _2446;
    float _2620 = _2468;
    float _2622 = _2428;
    float _2624 = _2440;
    float _2626 = _2458;
    float _2628 = fma(_1230, -0.5, 0.5);
    float _2630 = precise::clamp(_2628, 0.0, 1.0);
    float _2632 = -_2616;
    float _2634 = _2632 + _2618;
    float _2636 = -_2620;
    float _2638 = _2636 + _2622;
    float _2640 = -_2624;
    float _2642 = _2640 + _2626;
    bool _2644 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2646 = fma(_2630, _2634, _2616);
    float _2648 = fma(_2630, _2638, _2620);
    float _2650 = fma(_2630, _2642, _2624);
    float _2652 = _2646 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2654 = fma(_2648, 0.298911988735198974609375, _2652);
    float _2656 = fma(_2650, 0.114477999508380889892578125, _2654);
    out.m_97.x = 0.0;
    float _2658 = -_2656;
    float _2660 = _2648 + _2658;
    float _2662 = -_2656;
    float _2664 = _2646 + _2662;
    float _2666 = -_2656;
    float _2668 = _2650 + _2666;
    float _2670 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2672 = fma(_2660, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2674 = fma(_2664, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2676 = fma(_2668, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    out.m_61.x = _2670;
    out.m_99.x = _2672;
    out.m_99.y = _2674;
    out.m_99.z = _2676;
    if (!_2644)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2678 = -_1659;
    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2682 = -_1661;
    float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2686 = -_1663;
    float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2690 = _2680 * _2680;
    float _2692 = fma(_2684, _2684, _2690);
    float _2694 = fma(_2688, _2688, _2692);
    float _2696 = rsqrt(_2694);
    float _2698 = _2680 * _2696;
    float _2700 = _2684 * _2696;
    float _2702 = _2688 * _2696;
    float _2704 = sqrt(_2694);
    float _2706 = -_2066;
    float _2708 = _2706 + _2698;
    float _2710 = -_2062;
    float _2712 = _2710 + _2700;
    float _2714 = -_2064;
    float _2716 = _2714 + _2702;
    float _2718 = _2708 * _2708;
    float _2720 = fma(_2712, _2712, _2718);
    float _2722 = fma(_2716, _2716, _2720);
    float _2724 = -_2704;
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2728 = rsqrt(_2722);
    float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = abs(_2732);
    float _2736 = log2(_2734);
    float _2738 = _2708 * _2728;
    float _2740 = _2712 * _2728;
    float _2742 = _2716 * _2728;
    float _2744 = _1230 * _2738;
    float _2746 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    float _2750 = _1230 * _2698;
    float _2752 = fma(_1228, _2740, _2744);
    float _2754 = _2748 * _2748;
    float _2756 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2758 = fma(_1228, _2700, _2750);
    float _2760 = fma(_1250, _2742, _2752);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = _2754 + (-1.0);
    float _2766 = fma(_1250, _2702, _2758);
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    float _2770 = _2762 * _2762;
    float _2772 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2774 = exp2(_2756);
    float _2776 = fma(_2770, _2764, 1.0);
    float _2778 = -_2698;
    float _2780 = -_2772;
    float _2782 = fma(_2778, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2780);
    float _2784 = _2776 * _2776;
    float _2786 = -_2702;
    float _2788 = fma(_2786, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2782);
    float _2790 = 1.0 / _2784;
    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2794 = _2788 + _2792;
    float _2796 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = _2774 * _2798;
    float _2802 = _2768 * _2800;
    float _2804 = _2754 * _2790;
    float _2806 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2808 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2810 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2812 = _2802 * _2804;
    float _2814 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2816 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2818 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2806;
    out.m_95.y = _2808;
    out.m_95.z = _2810;
    out.m_97.x = _2814;
    out.m_97.y = _2816;
    out.m_97.z = _2818;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2530 = false;
    bool _1298 = false;
    bool _482 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _2875 = as_type<float>(_134);
        out.gl_Position.z = _2875;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_61.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2944 = as_type<float>(_172);
        out.gl_Position.z = _2944;
    }
    if (_166)
    {
        return out;
    }
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = in.m_67.x;
    float _184 = in.m_67.y;
    float _186 = in.m_67.z;
    float _188 = in.m_69.x;
    float _190 = in.m_69.y;
    float _192 = in.m_69.z;
    float _194 = in.m_63.x;
    float _196 = in.m_63.y;
    float _198 = in.m_63.z;
    float _200 = _174 * _174;
    float _202 = _176 * _176;
    float _204 = _178 * _178;
    float _206 = fma(_182, _182, _200);
    float _208 = fma(_184, _184, _202);
    float _210 = fma(_186, _186, _204);
    float _212 = fma(_188, _188, _206);
    float _214 = fma(_190, _190, _208);
    float _216 = fma(_192, _192, _210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _218 > 0.0;
    float _224 = sqrt(_216);
    bool _226 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    bool _236 = _220 > 0.0;
    float _238 = 0.0;
    float _240 = _220;
    float _242 = _212;
    float _244 = _180;
    float _246 = _174;
    if (_222)
    {
        float _248 = rsqrt(_212);
        _238 = _248;
    }
    float _250 = _238;
    bool _252 = _224 > 0.0;
    float _254 = _224;
    if (!_234)
    {
        float _256 = _180 * _180;
        float _258 = _256 * 0.5;
        _240 = _258;
    }
    float _260 = _240;
    float _262 = 0.0;
    float _264 = _260;
    if (_236)
    {
        float _266 = rsqrt(_214);
        _262 = _266;
    }
    float _268 = _262;
    if (!_234)
    {
        float _270 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _270;
    }
    float _272 = _264;
    bool _274 = !_234;
    float _276 = _272;
    float _278 = _250;
    if (!_274)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _180 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _180);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _308;
        _242 = _294;
        _254 = _296;
    }
    float _310 = _276;
    float _312 = _242;
    float _314 = _254;
    bool _316 = !_234;
    float _318 = _312;
    float _320 = _314;
    float _322 = _310;
    if (!_316)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _180 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _244 = _342;
    }
    float _344 = _244;
    float _346 = in.m_71.w;
    if (!_222)
    {
        _318 = 0.0;
    }
    float _348 = _318;
    float _350 = _348;
    if (_222)
    {
        float _352 = _250 * _182;
        _350 = _352;
    }
    float _354 = _350;
    if (!_222)
    {
        _320 = 0.0;
    }
    float _356 = _320;
    float _358 = in.m_58.x;
    float _360 = in.m_58.y;
    float _362 = in.m_58.z;
    float _364 = 0.0;
    float _366 = _356;
    if (!_222)
    {
        _364 = 0.0;
    }
    float _368 = _364;
    float _370 = _368;
    if (_222)
    {
        float _372 = _250 * _174;
        _366 = _372;
    }
    float _374 = _366;
    if (_222)
    {
        float _376 = _250 * _188;
        _370 = _376;
    }
    float _378 = _370;
    float _380 = 0.0;
    if (_252)
    {
        float _382 = rsqrt(_216);
        _380 = _382;
    }
    float _384 = _380;
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _388 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _390 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _392 = 0.0;
    float _394 = _388;
    if (!_236)
    {
        _392 = 0.0;
    }
    float _396 = _392;
    float _398 = _396;
    if (_236)
    {
        float _400 = _268 * _184;
        _398 = _400;
    }
    float _402 = _398;
    float _404 = fma(_344, _194, _388);
    float _406 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _408 = fma(_344, _196, _390);
    if (!_236)
    {
        _278 = 0.0;
    }
    float _410 = _278;
    float _412 = _410;
    if (_236)
    {
        float _414 = _268 * _176;
        _412 = _414;
    }
    float _416 = _412;
    float _418 = fma(_344, _198, _406);
    float _420 = 0.0;
    if (!_236)
    {
        _420 = 0.0;
    }
    float _422 = _420;
    float _424 = _422;
    if (_236)
    {
        float _426 = _268 * _190;
        _424 = _426;
    }
    float _428 = _424;
    if (!_252)
    {
        _394 = 0.0;
    }
    float _430 = _394;
    float _432 = 0.0;
    float _434 = _430;
    if (!_252)
    {
        _432 = 0.0;
    }
    float _436 = _432;
    float _438 = _436;
    if (_252)
    {
        float _440 = _384 * _186;
        _434 = _440;
    }
    float _442 = _434;
    if (!_252)
    {
        _322 = 0.0;
    }
    float _444 = _322;
    float _446 = _444;
    if (_252)
    {
        float _448 = _384 * _178;
        _438 = _448;
    }
    float _450 = _438;
    if (_252)
    {
        float _452 = _384 * _192;
        _446 = _452;
    }
    float _454 = _446;
    float _456 = fma(_404, _346, _358);
    float _458 = fma(_408, _346, _360);
    float _460 = fma(_418, _346, _362);
    bool _462 = !_386;
    float _480;
    if (!_462)
    {
        float _464 = in.m_73.x;
        float _466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _468 = _464 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _470 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _472 = _470 * _466;
        float _474 = floor(_472);
        float _476 = -_474;
        float _478 = _472 + _476;
        _480 = _478;
        _482 = true;
    }
    else
    {
        float _484 = float(_118);
        float _486 = 1.0 / _484;
        float _488 = _152 * _486;
        _480 = _488;
    }
    _482 = false;
    float _490 = _480;
    float _492 = in.m_73.x;
    float _494 = in.m_73.y;
    float _496 = in.m_73.z;
    float _498 = _458 * _184;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _508 = fma(_456, _182, _498);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _512 = _490 + _510;
    float _514 = 1.0 / _502;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _526 = _524 != 0;
    float _528 = 1.0 / _506;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _532 = _490 + _530;
    float _534 = _492 * 2.0;
    float _536 = _496 * 2.0;
    float _538 = _494 + _496;
    float _540 = _494 + _492;
    float _542 = floor(_534);
    float _544 = _494 * 2.0;
    float _546 = _496 + _492;
    float _548 = _496 + (-0.5);
    float _550 = _492 + (-0.5);
    float _552 = _540 + (-1.0);
    float _554 = _532 * _528;
    float _556 = floor(_536);
    float _558 = _538 + (-1.0);
    float _560 = _546 + (-1.0);
    float _562 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _564 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _566 = !_522;
    int _568 = _566 ? 0 : 1;
    float _570 = floor(_544);
    float _572 = _494 + (-0.5);
    float _574 = _512 * _514;
    bool _576 = _542 > 0.0;
    bool _578 = _542 >= 0.0;
    bool _580 = isnan(_542);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _590 = log2(_588);
    bool _592 = _556 > 0.0;
    bool _594 = _556 >= 0.0;
    bool _596 = isnan(_556);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _606 = _586 ? 0 : 1;
    bool _608 = !_518;
    int _610 = _608 ? 0 : 1;
    int _612 = _602 ? 0 : 1;
    int _614 = ~_606;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    int _620 = _618;
    if (!_576)
    {
        int _622 = ~_606;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    int _628 = abs(_610);
    float _630 = _590 * _152;
    int _632 = ~_612;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    int _638 = _636;
    if (!_592)
    {
        int _640 = ~_612;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = exp2(_630);
    int _648 = abs(_568);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _652 = 1.0 + _650;
    float _654 = in.m_75.x;
    float _656 = in.m_75.y;
    float _658 = in.m_75.z;
    float _660 = float(_628);
    float _662 = float(_644);
    float _664 = 1.0 / _652;
    bool _666 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _668 = isnan(1.0);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _674 = _670 || _672;
    float _676 = float(_648);
    float _678 = _660 * _662;
    float _680 = float(_626);
    bool _682 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = -_646;
    float _694 = _692 + 1.0;
    bool _696 = _570 > 0.0;
    float _698 = _676 * _680;
    float _700 = _678 * (-2.0);
    float _702 = _690 ? _694 : 0.0;
    float _704 = _698 * (-2.0);
    bool _706 = _570 >= 0.0;
    bool _708 = isnan(_570);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _716;
    float _720 = fma(_604, _700, _604);
    if (_674)
    {
        float _722 = _702 * _664;
        _156 = _722;
    }
    float _724 = _156;
    int _726 = _714 ? 0 : 1;
    float _728 = fma(_700, _654, _654);
    float _730 = fma(_718, _574, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _732 = fma(_704, _656, _656);
    int _734 = ~_726;
    int _736 = _734 + 1;
    int _738 = _736 + 1;
    float _740 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[196].x, _728);
    int _742 = _738;
    if (!_696)
    {
        int _744 = ~_726;
        int _746 = _744 + 1;
        _742 = _746;
    }
    int _748 = _742;
    float _750 = fma(_562, _704, _562);
    float _752 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _732);
    bool _754 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _756 = isnan(_490);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = fma(_720, _724, _740);
    bool _768 = !_526;
    int _770 = _768 ? 0 : 1;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _776 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _778 = isnan(_490);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -_764;
    float _790 = _788 + 1.0;
    bool _792 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _794 = isnan(_490);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = fma(_750, _724, _752);
    int _806 = abs(_770);
    float _808 = _766 * 0.15915493667125701904296875;
    float _810 = _802 * _790;
    float _812 = -_802;
    float _814 = _812 + 1.0;
    float _816 = float(_806);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _818;
    float _822 = float(_748);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _824;
    float _828 = _786 * _814;
    float _830 = fma(_820, _574, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _836 = _816 * _822;
    float _838 = fma(_826, _574, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _840 = _730 * _828;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _846 = _836 * (-2.0);
    float _848 = fma(_774, _554, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _850 = _830 * _828;
    float _852 = _838 * _828;
    float _854 = fma(_846, _658, _658);
    float _856 = in.m_71.x;
    float _858 = in.m_71.y;
    float _860 = in.m_71.z;
    float _862 = fma(_844, _554, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _864 = fma(_834, _554, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _866 = -_786;
    float _868 = _866 + 1.0;
    float _870 = in.m_77.x;
    float _872 = in.m_77.y;
    float _874 = in.m_77.z;
    float _876 = fma(_564, _846, _564);
    float _878 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[196].z, _854);
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[143].y, _840);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[143].x, _850);
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[143].z, _852);
    float _886 = fma(_876, _724, _878);
    float _888 = fma(_848, _810, _880);
    float _890 = _804 * 0.15915493667125701904296875;
    float _892 = fma(_862, _810, _882);
    float _894 = _886 * 0.15915493667125701904296875;
    float _896 = fma(_864, _810, _884);
    float _898 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[145].y, _888);
    float _900 = _808 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[145].x, _892);
    float _906 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[145].z, _896);
    float _908 = _458 * _190;
    float _910 = _458 * _176;
    float _912 = _904 * _856;
    float _914 = _808 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = _898 * _858;
    float _920 = _906 * _860;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _870);
    float _924 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _872);
    float _928 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _930 = fma(_460, _186, _508);
    float _932 = _890 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _874);
    float _938 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _940 = _924 * _922;
    float _942 = _928 * _926;
    float _944 = fma(_456, _188, _908);
    float _946 = _938 * _936;
    float _948 = _930 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _950 = _890 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = fma(_460, _192, _944);
    bool _956 = _872 != 0.0;
    bool _958 = isnan(_872);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = fma(_456, _174, _910);
    bool _968 = _870 == 0.0;
    bool _970 = !_964;
    bool _972 = _968 && _970;
    float _974 = fma(_460, _178, _966);
    float _976 = _894 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _902 * _934;
    bool _982 = _874 == 0.0;
    bool _984 = _982 && _972;
    float _986 = _894 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _916 * _952;
    float _992 = _902 * _952;
    float _994 = _916 * _978;
    float _996 = _902 * _978;
    float _998 = _916 * _934;
    float _1000 = _934 * _978;
    float _1002 = _994 * _942;
    float _1004 = _952 * _978;
    float _1006 = _996 * _942;
    float _1008 = fma(_988, _990, _980);
    float _1010 = -_942;
    float _1012 = _988 * _1010;
    float _1014 = -_992;
    float _1016 = fma(_988, _998, _1014);
    float _1018 = -_998;
    float _1020 = fma(_988, _992, _1018);
    float _1022 = fma(_1008, _940, _1002);
    float _1024 = fma(_1004, _940, _1012);
    float _1026 = fma(_988, _980, _990);
    float _1028 = fma(_1020, _940, _1006);
    float _1030 = fma(_1016, _946, _1022);
    float _1032 = fma(_1000, _946, _1024);
    float _1034 = _954 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1036 = fma(_1026, _946, _1028);
    float _1038 = _1030 * _402;
    float _1040 = _1030 * _428;
    float _1042 = _1030 * _416;
    float _1044 = fma(_1032, _354, _1038);
    float _1046 = fma(_1032, _378, _1040);
    float _1048 = fma(_1032, _374, _1042);
    float _1050 = fma(_1036, _442, _1044);
    float _1052 = fma(_1036, _454, _1046);
    float _1054 = in.m_79.x;
    float _1056 = in.m_79.y;
    float _1058 = in.m_79.z;
    float _1060 = fma(_1036, _450, _1048);
    float _1062 = _948 + _1050;
    float _1064 = _1034 + _1052;
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1068 = _1062 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1072 = _1064 + _1070;
    float _1074 = _1068 * _1068;
    float _1076 = _1072 * _1072;
    float _1078 = _1074 + _1076;
    float _1080 = sqrt(_1078);
    float _1082 = _1056;
    float _1084 = _1054;
    float _1086 = _1058;
    float _1088 = _1074;
    float _1090 = _1062;
    float _1092 = _1064;
    int _1094 = as_type<int>(_1072);
    float _1096 = _1026;
    if (!_984)
    {
        float _1098 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1082 = _1098;
    }
    float _1100 = _1082;
    float _1102 = _1100;
    if (!_984)
    {
        float _1104 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1054);
        _1084 = _1104;
    }
    float _1106 = _1084;
    float _1108 = _1106;
    if (!_984)
    {
        float _1110 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1058);
        _1086 = _1110;
    }
    float _1112 = _1086;
    float _1114 = _974 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1116 = -_1100;
    float _1118 = _988 * _1116;
    float _1120 = _994 * _1100;
    float _1122 = _996 * _1100;
    float _1124 = fma(_1004, _1106, _1118);
    float _1126 = fma(_1008, _1106, _1120);
    float _1128 = fma(_1020, _1106, _1122);
    bool _1130 = _1080 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = fma(_1000, _1112, _1124);
    float _1134 = fma(_1016, _1112, _1126);
    float _1136 = fma(_1026, _1112, _1128);
    float _1138 = _1114 + _1060;
    if (!_1130)
    {
        _246 = _1076;
    }
    float _1140 = _246;
    float _1142 = _1140;
    if (!_1130)
    {
        _1108 = _1138;
    }
    float _1144 = _1108;
    bool _1146 = !_1130;
    float _1148 = _1144;
    if (!_1146)
    {
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1154 = _1080 + _1152;
        float _1156 = rsqrt(_1078);
        float _1158 = _1154 * _1150;
        float _1160 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = _1158 * 0.15915493667125701904296875;
        float _1164 = _1162 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1162 * 6.283185482025146484375;
        float _1170 = cos(_1168);
        float _1172 = fma(_1166, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1174 = _1156 * _1172;
        float _1176 = _1170 + (-1.0);
        float _1178 = fma(_1068, _1174, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1180 = fma(_1072, _1174, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1182 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1186 = _1178 + _1184;
        float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1190 = _1180 + _1188;
        float _1192 = fma(_1138, _1170, _1182);
        float _1194 = _1186 * _1186;
        float _1196 = _1190 * _1190;
        _1148 = _1192;
        _1088 = _1194;
        _1142 = _1196;
        _1090 = _1178;
        _1092 = _1180;
        _1102 = _1162;
    }
    float _1198 = _1148;
    float _1200 = _1088;
    float _1202 = _1142;
    float _1204 = _1090;
    float _1206 = _1092;
    float _1208 = _1102;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1212 = _1198 + _1210;
    float _1214 = _1134 * _402;
    float _1216 = _1134 * _416;
    float _1218 = _1134 * _428;
    float _1220 = fma(_1212, _1212, _1200);
    float _1222 = fma(_1132, _354, _1214);
    float _1224 = fma(_1132, _374, _1216);
    float _1226 = _1220 + _1202;
    float _1228 = fma(_1136, _442, _1222);
    float _1230 = fma(_1136, _450, _1224);
    float _1232 = fma(_1132, _378, _1218);
    float _1234 = sqrt(_1226);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1244 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = fma(_1136, _454, _1232);
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1244;
    out.m_83.y = _1246;
    out.m_83.z = _1248;
    out.m_83.w = _1242;
    bool _1252 = _1234 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1254 = isnan(_1234);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1260 = _1256 || _1258;
    out.m_85.x = _1228;
    out.m_85.y = _1230;
    out.m_85.z = _1250;
    float _1262 = _1208;
    if (!_1260)
    {
        _1262 = 1.0;
    }
    float _1264 = _1262;
    bool _1266 = !_1260;
    float _1268 = _1264;
    if (!_1266)
    {
        bool _1270 = _1234 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1272 = isnan(_1234);
        bool _1274 = _1270 || _1272;
        bool _1276 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1278 = _1274 || _1276;
        if (!_1278)
        {
            float _1280 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1282 = _1234 + _1280;
            float _1284 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1286 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1284;
            float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1290 = _1288 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1292 = 1.0 / _1286;
            float _1294 = _1282 * _1292;
            float _1296 = fma(_1294, _1290, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1268 = _1296;
            _1298 = true;
        }
        else
        {
            bool _1300 = _1234 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1302 = isnan(_1234);
            bool _1304 = _1300 || _1302;
            bool _1306 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1308 = _1304 || _1306;
            if (!_1308)
            {
                float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1312 = _1234 + _1310;
                float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1316 = _1314 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1320 = _1318 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1322 = 1.0 / _1316;
                float _1324 = _1312 * _1322;
                float _1326 = fma(_1324, _1320, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1268 = _1326;
                _1298 = true;
            }
            else
            {
                _1268 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1298 = false;
    float _1328 = _1268;
    float _1330 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1332 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1334 = floor(_1330);
    float _1336 = floor(_1332);
    float _1338 = -_1334;
    float _1340 = _1330 + _1338;
    float _1342 = -_1336;
    float _1344 = _1332 + _1342;
    float2 _4727 = float2(_1340, _1344);
    float _1346 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4727, float2(0.0), isnan(_4727)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4727, float2(0.0), isnan(_4727)), level(0.0)).x;
    float _1348 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1352 = _1204 + _1350;
    float _1354 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1348);
    float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1358 = _1198 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1362 = _1206 + _1360;
    float _1364 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1354);
    float _1366 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1368 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.5);
    bool _1376 = _1372 || _1374;
    float _1378 = fma(_1352, _1328, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1380 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1382 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1366);
    float _1384 = fma(_1358, _1328, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1386 = fma(_1362, _1328, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1388 = 1.0 / _1380;
    float _1390 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1382);
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1394 = _1358;
    float _1396 = _1328;
    int _1398 = 2;
    if (_1376)
    {
        _1394 = _1378;
    }
    float _1400 = _1394;
    float _1402 = _1392 + _1380;
    float _1404 = _1400;
    if (_1376)
    {
        _1396 = _1384;
    }
    float _1406 = _1396;
    float _1408 = _1402 * _1388;
    float _1410 = _1408 * 0.5;
    float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1414 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1412);
    float _1416 = 1.0 / _1414;
    float _1418 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1420 = _1114 + _1418;
    float _1422 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1424 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1422);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1428 = _1416 * _1426;
    float _1430 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1424);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1434 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1436 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1432);
    bool _1438 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1440 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1442 = !_1434;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1436);
    float _1448 = trunc(_1440);
    int _1450 = int(_1448);
    float _1452 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1454 = _1406;
    if (!_1434)
    {
        _1398 = 1;
    }
    int _1456 = _1398;
    int _1458 = _1456;
    if (!_1438)
    {
        _1458 = _1444;
    }
    int _1460 = _1458;
    float _1462 = trunc(_1452);
    int _1464 = int(_1462);
    int _1466 = _1460 << 6;
    int _1468 = _1466 + 48;
    uint _1471 = uint(int(uint(_1468) >> uint(2)));
    uint _1473 = uint(int(uint(int(_1471)) >> uint(2)));
    int _1475 = int(_1471) & 3;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[int(_1473)][_1475];
    int _1479 = int(_1471) + 1;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    int _1483 = _1479 & 3;
    float _1485 = (*spvDescriptorSet0.vp_c15)._m0[int(_1481)][_1483];
    int _1487 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1489 = _1450 + _1487;
    int _1491 = _1489 + 1;
    bool _1493 = _1491 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1495 = _1466 + 56;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    int _1513 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1515 = _1464 + _1513;
    int _1517 = _1515 + 1;
    int _1519 = _1491 | _1517;
    int _1521 = _1466 + 64;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    uint _1525 = uint(int(uint(int(_1523)) >> uint(2)));
    int _1527 = int(_1523) & 3;
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[int(_1525)][_1527];
    int _1531 = int(_1523) + 1;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    int _1535 = _1531 & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    bool _1539 = _1519 < 0;
    bool _1541 = _1539 || _1493;
    float _1543 = as_type<float>(_1519);
    int _1545 = _1491;
    if (_1376)
    {
        _1543 = _1386;
    }
    float _1547 = _1543;
    bool _1549 = _1517 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1551 = _1549 || _1541;
    int _1553 = _1466 + 72;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
    int _1559 = int(_1555) & 3;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
    int _1563 = int(_1555) + 1;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    int _1567 = _1563 & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = _1466 + 96;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    uint _1575 = uint(int(uint(int(_1573)) >> uint(2)));
    int _1577 = int(_1573) & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    int _1581 = int(_1573) + 1;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    int _1585 = _1581 & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    int _1589 = _1466 + 104;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    float _1607 = _1547;
    if (!_1376)
    {
        float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1611 = _1114 + _1609;
        float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1615 = _948 + _1613;
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1619 = _1611 * _1611;
        float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1623 = _1034 + _1621;
        float _1625 = fma(_1615, _1615, _1619);
        float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1629 = fma(_1623, _1623, _1625);
        float _1631 = sqrt(_1629);
        float _1633 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1635 = -_1034;
        float _1637 = _1635 + _1386;
        float _1639 = precise::min(_1631, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1641 = _1639 * _1627;
        float _1643 = -_1114;
        float _1645 = _1643 + _1384;
        float _1647 = _1633 * _1641;
        float _1649 = -_948;
        float _1651 = _1649 + _1378;
        float _1653 = fma(_1645, _1647, _1114);
        float _1655 = fma(_1651, _1647, _948);
        float _1657 = fma(_1637, _1647, _1034);
        _1454 = _1653;
        _1404 = _1655;
        _1607 = _1657;
        _1094 = as_type<int>(_1627);
    }
    float _1659 = _1454;
    float _1661 = _1404;
    float _1663 = _1607;
    int _1665 = _1094;
    float _1667 = _1420 * _1587;
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1671 = _1665;
    if (!_1551)
    {
        int _1673 = _1517 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1675 = _1673 + _1491;
        _1545 = _1675;
    }
    int _1677 = _1545;
    float _1679 = _1420 * _1537;
    float _1681 = fma(_948, _1579, _1667);
    float _1683 = _1420 * _1485;
    float _1685 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1669);
    int _1687 = as_type<int>(_1685);
    if (!_1551)
    {
        int _1689 = _1677 << 2;
        _1671 = _1689;
    }
    int _1691 = _1671;
    float _1693 = fma(_1034, _1597, _1681);
    float _1695 = fma(_948, _1477, _1683);
    float _1697 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1685);
    float _1699 = fma(_948, _1529, _1679);
    int _1701 = _1691;
    if (!_1551)
    {
        uint _1703 = uint(int(uint(_1677) >> uint(2)));
        _1687 = int(_1703);
    }
    int _1705 = _1687;
    int _1707 = _1466 + 80;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    uint _1711 = uint(int(uint(int(_1709)) >> uint(2)));
    int _1713 = int(_1709) & 3;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[int(_1711)][_1713];
    int _1717 = int(_1709) + 1;
    uint _1719 = uint(int(uint(_1717) >> uint(2)));
    int _1721 = _1717 & 3;
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[int(_1719)][_1721];
    if (!_1551)
    {
        int _1725 = 12 & _1691;
        _1701 = _1725;
    }
    int _1727 = _1701;
    float _1729 = _1693 + _1605;
    float _1731 = fma(_1034, _1503, _1695);
    float _1733 = fma(_1034, _1561, _1699);
    float _1735 = as_type<float>(_1727);
    if (!_1551)
    {
        int _1737 = _1705 << 4;
        int _1739 = _1737 + _1727;
        _1735 = as_type<float>(_1739);
    }
    float _1741 = _1735;
    float _1743 = 1.0 / _1729;
    float _1745 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1747 = _1466 + 88;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    uint _1751 = uint(int(uint(int(_1749)) >> uint(2)));
    int _1753 = int(_1749) & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    int _1757 = int(_1749) + 1;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    int _1761 = _1757 & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    float _1765 = _1731 + _1511;
    float _1767 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = _1733 + _1569;
    float _1771 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1773 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1745);
    float _1775 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1777 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1779 = _1741;
    if (!_1551)
    {
        int _1781 = as_type<int>(_1741) + 400;
        uint _1783 = uint(int(uint(_1781) >> uint(2)));
        uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
        int _1787 = int(_1783) & 3;
        float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
        _1779 = _1789;
    }
    float _1791 = _1779;
    float _1793 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1771);
    float _1795 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1773);
    float _1797 = -_1777;
    float _1799 = fma(_1797, _1775, 1.0);
    float _1801 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1803 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1793);
    float _1805 = _1765 * _1743;
    float _1807 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1809 = _1769 * _1743;
    float _1811 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1801);
    float _1813 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1815 = _1805 >= 0.0;
    float _1817 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1819 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1811);
    float _1821 = _1765;
    float _1823 = _1743;
    if (!_1551)
    {
        float _1825 = floor(_1452);
        _1821 = _1825;
    }
    float _1827 = _1821;
    bool _1829 = _1805 <= 1.0;
    bool _1831 = _1829 && _1815;
    float _1833 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1817);
    float _1835 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1837 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1839 = _1809 >= 0.0;
    bool _1841 = _1839 && _1831;
    float _1843 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1833);
    float _1845 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1847 = log2(_1799);
    bool _1849 = _1809 <= 1.0;
    bool _1851 = _1849 && _1841;
    float _1853 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1843);
    float _1855 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1845);
    float _1857 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1837);
    float _1859 = 1.0 / _1853;
    float _1861 = _1827;
    float _1863 = _1791;
    if (!_1551)
    {
        float _1865 = -_1827;
        float _1867 = _1452 + _1865;
        _1861 = _1867;
    }
    float _1869 = _1861;
    float _1871 = _1420 * _1723;
    float _1873 = _1723;
    if (_1851)
    {
        float _1875 = float(_1460);
        _1873 = _1875;
    }
    float _1877 = _1873;
    float _1879 = fma(_948, _1715, _1871);
    float _1881 = _1378;
    if (!_1551)
    {
        float _1883 = floor(_1440);
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1855);
    float _1889 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1857);
    float _1891 = fma(_1034, _1755, _1879);
    float _1893 = _1847 * 0.693147182464599609375;
    float _1895 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1887);
    float _1897 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1889);
    float _1899 = _1891 + _1763;
    float _1901 = _1871;
    if (_1851)
    {
        float _1903 = rint(_1877);
        float _1905 = precise::max(_1903, 0.0);
        uint _1907 = uint(_1905);
        uint _1909 = clamp(_1907, 0u, 65535u);
        _1901 = as_type<float>(_1909);
    }
    float _1911 = _1901;
    float _1913 = _1895 * _1859;
    float _1915 = _1897 * _1859;
    float _1917 = _1899 * _1743;
    float _1919 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1921 = fma(_1913, 0.5, 0.5);
    float _1923 = fma(_1915, -0.5, 0.5);
    float _1925 = _1879;
    float _1927 = _1859;
    if (!_1551)
    {
        float _1929 = rint(_1791);
        float _1931 = precise::max(_1929, 0.0);
        uint _1933 = uint(_1931);
        uint _1935 = clamp(_1933, 0u, 65535u);
        _1925 = as_type<float>(_1935);
    }
    float _1937 = _1925;
    if (!_1551)
    {
        float _1939 = -_1885;
        float _1941 = _1440 + _1939;
        _1927 = _1941;
    }
    float _1943 = _1927;
    float _1945 = _1911;
    if (_1851)
    {
        float3 _5754 = float3(_1805, _1809, float(as_type<int>(_1911)));
        float3 _5758 = select(_5754, float3(0.0), isnan(_5754));
        float _1947 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5758.xy, uint(rint(_5758.z)), _1917, level(0.0));
        _1945 = _1947;
    }
    float _1949 = _1945;
    float3 _5768 = float3(_1921, _1923, _1919);
    float _1951 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5768, float3(0.0), isnan(_5768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5768, float3(0.0), isnan(_5768)), level(0.0)).x;
    float3 _5777 = float3(_1921, _1923, _1919);
    float4 _1954 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5777, float3(0.0), isnan(_5777)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5777, float3(0.0), isnan(_5777)), level(0.0)).xyzw;
    float _1956 = _1954.x;
    float _1958 = _1954.y;
    float _1960 = _1954.z;
    float _1962 = _1954.w;
    float _1964 = _1869;
    float _1966 = _1937;
    if (!_1551)
    {
        float3 _5801 = float3(_1943, _1869, float(as_type<int>(_1937)));
        float3 _5803 = select(_5801, float3(0.0), isnan(_5801));
        float _1968 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5803.xy, uint(rint(_5803.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5803.xy, uint(rint(_5803.z)), level(0.0)).x;
        _1964 = _1968;
    }
    float _1970 = _1964;
    if (_1551)
    {
        _1823 = 1.0;
    }
    float _1972 = _1823;
    float _1974 = _1972;
    if (!_1551)
    {
        int _1976 = _1677 << 4;
        int _1978 = _1976 + 2048;
        uint _1980 = uint(int(uint(_1978) >> uint(2)));
        uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
        int _1984 = int(_1980) & 3;
        float _1986 = (*spvDescriptorSet0.vp_c15)._m0[int(_1982)][_1984];
        int _1988 = int(_1980) + 1;
        uint _1990 = uint(int(uint(_1988) >> uint(2)));
        int _1992 = _1988 & 3;
        float _1994 = (*spvDescriptorSet0.vp_c15)._m0[int(_1990)][_1992];
        int _1996 = _1978 + 8;
        uint _1998 = uint(int(uint(_1996) >> uint(2)));
        uint _2000 = uint(int(uint(int(_1998)) >> uint(2)));
        int _2002 = int(_1998) & 3;
        float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
        int _2006 = int(_1998) + 1;
        uint _2008 = uint(int(uint(_2006) >> uint(2)));
        int _2010 = _2006 & 3;
        float _2012 = (*spvDescriptorSet0.vp_c15)._m0[int(_2008)][_2010];
        float _2014 = _1420 * _1994;
        float _2016 = fma(_948, _1986, _2014);
        float _2018 = fma(_1034, _2004, _2016);
        float _2020 = _2018 + _2012;
        float _2022 = precise::clamp(_2020, 0.0, 1.0);
        float _2024 = -_2022;
        float _2026 = _2024 + _1970;
        float _2028 = fma(_2026, 500.0, 1.5);
        float _2030 = exp2(_2028);
        float _2032 = 0.0 + _2030;
        float _2034 = precise::clamp(_2032, 0.0, 1.0);
        _1966 = _1986;
        _1974 = _2034;
    }
    float _2036 = _1966;
    float _2038 = _1974;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2042 = _1659 + _2040;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2046 = _1661 + _2044;
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2050 = _1663 + _2048;
    float _2052 = _2042 * _2042;
    float _2054 = fma(_2046, _2046, _2052);
    float _2056 = fma(_2050, _2050, _2054);
    float _2058 = rsqrt(_2056);
    float _2060 = sqrt(_2056);
    float _2062 = _2046 * _2058;
    float _2064 = _2050 * _2058;
    float _2066 = _2042 * _2058;
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2070 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2072 = _2068 * _2068;
    float _2074 = _2070 * _2070;
    float _2076 = _2072 + _2074;
    float _2078 = sqrt(_2076);
    bool _2080 = _2078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2084 = _2078 + _2082;
    float _2086 = _1034;
    float _2088 = _2058;
    float _2090 = _2084;
    float _2092 = _2036;
    if (_2080)
    {
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2086 = _2094;
    }
    float _2096 = _2086;
    if (_2080)
    {
        float _2098 = rsqrt(_2076);
        _2088 = _2098;
    }
    float _2100 = _2088;
    float _2102 = _2100;
    if (_2080)
    {
        float _2104 = _2084 * _2096;
        _2090 = _2104;
    }
    float _2106 = _2090;
    if (_2080)
    {
        float _2108 = _2106 * 0.15915493667125701904296875;
        _2092 = _2108;
    }
    float _2110 = _2092;
    float _2112 = _2096;
    float _2114 = _2110;
    if (_2080)
    {
        float _2116 = _2110 * 6.283185482025146484375;
        float _2118 = sin(_2116);
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2124 = precise::max(0.0, _2122);
    float _2126 = _1970;
    float _2128 = _2124;
    if (_2080)
    {
        float _2130 = _2110 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        _2126 = _2132;
    }
    float _2134 = _2126;
    float _2136 = -_2066;
    float _2138 = -_2124;
    float _2140 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2138);
    if (_2080)
    {
        float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2142;
    }
    float _2144 = _2128;
    float _2146 = _2120;
    float _2148 = _2144;
    if (_2080)
    {
        float _2150 = fma(_2120, _2144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1863 = _2150;
    }
    float _2152 = _1863;
    float _2154 = _2152;
    if (!_2080)
    {
        _2146 = _2068;
    }
    float _2156 = _2146;
    float _2158 = _2156;
    float _2160 = _2134;
    if (_2080)
    {
        float _2162 = _2134 + (-1.0);
        _2148 = _2162;
    }
    float _2164 = _2148;
    float _2166 = _2164;
    if (_2080)
    {
        float _2168 = _2100 * _2152;
        _1096 = _2168;
    }
    float _2170 = _1096;
    if (!_2080)
    {
        _2102 = _2140;
    }
    float _2172 = _2102;
    float _2174 = _2172;
    if (_2080)
    {
        float _2176 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2176;
    }
    float _2178 = _2114;
    if (_2080)
    {
        float _2180 = _2068 * _2170;
        _2158 = _2180;
    }
    float _2182 = _2158;
    if (!_2080)
    {
        _2166 = _2070;
    }
    float _2184 = _2166;
    float _2186 = _2184;
    if (_2080)
    {
        float _2188 = _2070 * _2170;
        _2186 = _2188;
    }
    float _2190 = _2186;
    if (!_2080)
    {
        _2154 = _2072;
    }
    float _2192 = _2154;
    float _2194 = _2192;
    if (_2080)
    {
        float _2196 = fma(_2140, _2134, _2178);
        _2174 = _2196;
    }
    float _2198 = _2174;
    if (_2080)
    {
        float _2200 = _2182 * _2182;
        _2194 = _2200;
    }
    float _2202 = _2194;
    if (!_2080)
    {
        _2160 = _2074;
    }
    float _2204 = _2160;
    float _2206 = _2204;
    if (_2080)
    {
        float _2208 = _2190 * _2190;
        _2206 = _2208;
    }
    float _2210 = _2206;
    float _2212 = fma(_2198, _2198, _2202);
    float _2214 = _2212 + _2210;
    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2218 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2216);
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = -_2220;
    float _2224 = _2222 + 1.0;
    float _2226 = rsqrt(_2214);
    float _2228 = _2226 * _2182;
    float _2230 = _2226 * _2198;
    float _2232 = _2226 * _2190;
    float _2234 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2236 = abs(_2224);
    float _2238 = log2(_2236);
    float _2240 = -_2234;
    float _2242 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2240);
    float _2244 = -_2232;
    float _2246 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2242);
    float _2248 = fma(_2246, -0.5, 0.5);
    float _2250 = fma(_2246, 0.5, 0.5);
    float _2252 = fma(_2250, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2254 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2256 = sqrt(_2248);
    float _2258 = fma(_2250, _2252, -0.212114393711090087890625);
    float _2260 = _2230 + 1.0;
    float _2262 = fma(_2250, _2258, 1.570728778839111328125);
    float _2264 = exp2(_2254);
    float _2266 = _2256 * 0.636619746685028076171875;
    float _2268 = -_2230;
    float _2270 = fma(_2264, _2260, _2268);
    float _2272 = -_2262;
    float _2274 = fma(_2266, _2272, 1.0);
    float _2276 = fma(_2270, 0.5, 0.5);
    float2 _6286 = float2(_2274, _2276);
    float3 _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6286, float2(0.0), isnan(_6286)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6286, float2(0.0), isnan(_6286)), level(0.0)).xyz;
    float _2282 = _2280.x;
    float _2284 = _2280.y;
    float _2286 = _2280.z;
    float _2288 = abs(_1428);
    float _2290 = log2(_2288);
    float _2292 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2294 = -_1346;
    float _2296 = _2294 + 1.0;
    out.m_87.x = _1661;
    out.m_87.y = _1659;
    out.m_87.z = _1663;
    float _2298 = exp2(_2292);
    bool _2300 = _1428 <= 8000.0;
    bool _2302 = isnan(_1428);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan(8000.0);
    bool _2308 = _2304 || _2306;
    float _2310 = float(_2308);
    float _2312 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2314 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2316 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2314);
    float _2318 = exp2(_2312);
    float _2320 = -_2298;
    float _2322 = _2320 + 1.0;
    float _2324 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2316);
    float _2326 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2324);
    float _2328 = _2326 + _1853;
    float _2330 = _2328 * 0.5;
    float _2332 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2334 = precise::clamp(_2332, 0.0, 1.0);
    float _2336 = fma(_2334, -2.0, 3.0);
    float _2338 = _2334 * _2334;
    float _2340 = _2338 * _2336;
    float _2342 = -_2340;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2340);
    float _2348 = _2310 * _2346;
    float _2350 = _2310;
    float _2352 = _2326;
    float _2354 = _1895;
    if (!_1851)
    {
        _2350 = 1.0;
    }
    float _2356 = _2350;
    out.m_89.z = _2330;
    out.m_89.w = _1853;
    float _2358 = _2356;
    if (_1851)
    {
        bool _2360 = _1949 >= _1917;
        bool _2362 = isnan(_1949);
        bool _2364 = _2360 || _2362;
        bool _2366 = isnan(_1917);
        bool _2368 = _2364 || _2366;
        float _2370 = float(_2368);
        _2358 = _2370;
    }
    float _2372 = _2358;
    float _2374 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2376 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2378 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2380 = isnan(_2060);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2386 = _2382 || _2384;
    out.gl_Position.x = _1895;
    out.gl_Position.y = _1897;
    out.gl_Position.z = _2326;
    out.gl_Position.w = _1853;
    float _2388 = _2296 * _2374;
    float _2390 = precise::clamp(_2388, 0.0, 1.0);
    float _2392 = _2376 * _1951;
    float _2394 = _2372 * _2038;
    float _2396 = -_2376;
    float _2398 = _2396 + 1.0;
    float _2400 = -_2390;
    float _2402 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2404 = _1962 * _2392;
    float _2406 = _1962 * _2398;
    float _2408 = -_2394;
    float _2410 = fma(_2408, _2402, 1.0);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = _2402;
    float _2416 = _2412;
    float _2418 = _2390;
    float _2420 = _2392;
    if (!_2386)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2422 = _2414;
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2426 = _2422;
    float _2428 = _2422;
    if (!_2386)
    {
        _2352 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2430 = _2352;
    float _2432 = _2430;
    float _2434 = _2430;
    if (!_2386)
    {
        _2354 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2436 = _2354;
    out.m_91.x = _2424;
    float _2438 = _2436;
    float _2440 = _2436;
    if (!_2386)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2442 = _2416;
    float _2444 = _2442;
    float _2446 = _2442;
    if (!_2386)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2448 = _2418;
    float _2450 = _2286 * _2392;
    float _2452 = fma(_2282, _2404, _1956);
    float _2454 = fma(_2284, _2404, _1958);
    float _2456 = _2448;
    float _2458 = _2448;
    if (!_2386)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2460 = _2420;
    float _2462 = fma(_1962, _2450, _1960);
    out.m_93.x = _2452;
    out.m_93.y = _2454;
    out.m_93.z = _2462;
    out.m_93.w = _2406;
    bool _2464 = !_2386;
    float _2466 = _2460;
    float _2468 = _2460;
    if (!_2464)
    {
        bool _2470 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2472 = isnan(_2060);
        bool _2474 = _2470 || _2472;
        bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2478 = _2474 || _2476;
        if (!_2478)
        {
            float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2482 = _2060 + _2480;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2486 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2484;
            float _2488 = 1.0 / _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2510 = _2482 * _2488;
            float _2512 = precise::clamp(_2510, 0.0, 1.0);
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2518 = fma(_2512, _2492, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2520 = fma(_2512, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2522 = fma(_2512, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2524 = fma(_2512, _2500, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2526 = fma(_2512, _2504, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2528 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2434 = _2518;
            _2446 = _2526;
            _2468 = _2520;
            _2428 = _2524;
            _2440 = _2522;
            _2458 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2534 = isnan(_2060);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2542 = _2466;
            _2468 = _2542;
            if (!_2540)
            {
                _2432 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2544 = _2432;
            _2434 = _2544;
            if (!_2540)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2546 = _2438;
            _2440 = _2546;
            if (!_2540)
            {
                _2426 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2548 = _2426;
            _2428 = _2548;
            if (!_2540)
            {
                _2444 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2550 = _2444;
            _2446 = _2550;
            if (!_2540)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2552 = _2456;
            bool _2554 = !_2540;
            _2458 = _2552;
            if (!_2554)
            {
                bool _2556 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2558 = isnan(_2060);
                bool _2560 = _2556 || _2558;
                bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2564 = _2560 || _2562;
                if (!_2564)
                {
                    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2568 = _2060 + _2566;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2572 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2570;
                    float _2574 = 1.0 / _2572;
                    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2596 = _2568 * _2574;
                    float _2598 = precise::clamp(_2596, 0.0, 1.0);
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2604 = fma(_2598, _2578, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2606 = fma(_2598, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2608 = fma(_2598, _2582, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2610 = fma(_2598, _2586, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2612 = fma(_2598, _2590, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2614 = fma(_2598, _2594, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2434 = _2604;
                    _2446 = _2612;
                    _2468 = _2606;
                    _2428 = _2610;
                    _2440 = _2608;
                    _2458 = _2614;
                    _2530 = true;
                }
                else
                {
                    _2434 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2446 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2428 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2530 = false;
    float _2616 = _2434;
    float _2618 = _2446;
    float _2620 = _2468;
    float _2622 = _2428;
    float _2624 = _2440;
    float _2626 = _2458;
    float _2628 = fma(_1230, -0.5, 0.5);
    float _2630 = precise::clamp(_2628, 0.0, 1.0);
    float _2632 = -_2616;
    float _2634 = _2632 + _2618;
    float _2636 = -_2620;
    float _2638 = _2636 + _2622;
    float _2640 = -_2624;
    float _2642 = _2640 + _2626;
    bool _2644 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2646 = fma(_2630, _2634, _2616);
    float _2648 = fma(_2630, _2638, _2620);
    float _2650 = fma(_2630, _2642, _2624);
    float _2652 = _2646 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2654 = fma(_2648, 0.298911988735198974609375, _2652);
    float _2656 = fma(_2650, 0.114477999508380889892578125, _2654);
    out.m_97.x = 0.0;
    float _2658 = -_2656;
    float _2660 = _2648 + _2658;
    float _2662 = -_2656;
    float _2664 = _2646 + _2662;
    float _2666 = -_2656;
    float _2668 = _2650 + _2666;
    float _2670 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2672 = fma(_2660, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2674 = fma(_2664, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2676 = fma(_2668, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    out.m_61.x = _2670;
    out.m_99.x = _2672;
    out.m_99.y = _2674;
    out.m_99.z = _2676;
    if (!_2644)
    {
        return out;
    }
    float _2678 = -_1659;
    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2682 = -_1661;
    float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2686 = -_1663;
    float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2690 = _2680 * _2680;
    float _2692 = fma(_2684, _2684, _2690);
    float _2694 = fma(_2688, _2688, _2692);
    float _2696 = rsqrt(_2694);
    float _2698 = _2680 * _2696;
    float _2700 = _2684 * _2696;
    float _2702 = _2688 * _2696;
    float _2704 = sqrt(_2694);
    float _2706 = -_2066;
    float _2708 = _2706 + _2698;
    float _2710 = -_2062;
    float _2712 = _2710 + _2700;
    float _2714 = -_2064;
    float _2716 = _2714 + _2702;
    float _2718 = _2708 * _2708;
    float _2720 = fma(_2712, _2712, _2718);
    float _2722 = fma(_2716, _2716, _2720);
    float _2724 = -_2704;
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2728 = rsqrt(_2722);
    float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = abs(_2732);
    float _2736 = log2(_2734);
    float _2738 = _2708 * _2728;
    float _2740 = _2712 * _2728;
    float _2742 = _2716 * _2728;
    float _2744 = _1230 * _2738;
    float _2746 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    float _2750 = _1230 * _2698;
    float _2752 = fma(_1228, _2740, _2744);
    float _2754 = _2748 * _2748;
    float _2756 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2758 = fma(_1228, _2700, _2750);
    float _2760 = fma(_1250, _2742, _2752);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = _2754 + (-1.0);
    float _2766 = fma(_1250, _2702, _2758);
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    float _2770 = _2762 * _2762;
    float _2772 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2774 = exp2(_2756);
    float _2776 = fma(_2770, _2764, 1.0);
    float _2778 = -_2698;
    float _2780 = -_2772;
    float _2782 = fma(_2778, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2780);
    float _2784 = _2776 * _2776;
    float _2786 = -_2702;
    float _2788 = fma(_2786, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2782);
    float _2790 = 1.0 / _2784;
    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2794 = _2788 + _2792;
    float _2796 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = _2774 * _2798;
    float _2802 = _2768 * _2800;
    float _2804 = _2754 * _2790;
    float _2806 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2808 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2810 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2812 = _2802 * _2804;
    float _2814 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2816 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2818 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2806;
    out.m_95.y = _2808;
    out.m_95.z = _2810;
    out.m_97.x = _2814;
    out.m_97.y = _2816;
    out.m_97.z = _2818;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2530 = false;
    bool _1298 = false;
    bool _482 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _2875 = as_type<float>(_134);
        out.gl_Position.z = _2875;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_61.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2944 = as_type<float>(_172);
        out.gl_Position.z = _2944;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = in.m_67.x;
    float _184 = in.m_67.y;
    float _186 = in.m_67.z;
    float _188 = in.m_69.x;
    float _190 = in.m_69.y;
    float _192 = in.m_69.z;
    float _194 = in.m_63.x;
    float _196 = in.m_63.y;
    float _198 = in.m_63.z;
    float _200 = _174 * _174;
    float _202 = _176 * _176;
    float _204 = _178 * _178;
    float _206 = fma(_182, _182, _200);
    float _208 = fma(_184, _184, _202);
    float _210 = fma(_186, _186, _204);
    float _212 = fma(_188, _188, _206);
    float _214 = fma(_190, _190, _208);
    float _216 = fma(_192, _192, _210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _218 > 0.0;
    float _224 = sqrt(_216);
    bool _226 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    bool _236 = _220 > 0.0;
    float _238 = 0.0;
    float _240 = _220;
    float _242 = _212;
    float _244 = _180;
    float _246 = _174;
    if (_222)
    {
        float _248 = rsqrt(_212);
        _238 = _248;
    }
    float _250 = _238;
    bool _252 = _224 > 0.0;
    float _254 = _224;
    if (!_234)
    {
        float _256 = _180 * _180;
        float _258 = _256 * 0.5;
        _240 = _258;
    }
    float _260 = _240;
    float _262 = 0.0;
    float _264 = _260;
    if (_236)
    {
        float _266 = rsqrt(_214);
        _262 = _266;
    }
    float _268 = _262;
    if (!_234)
    {
        float _270 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _270;
    }
    float _272 = _264;
    bool _274 = !_234;
    float _276 = _272;
    float _278 = _250;
    if (!_274)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _180 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _180);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _308;
        _242 = _294;
        _254 = _296;
    }
    float _310 = _276;
    float _312 = _242;
    float _314 = _254;
    bool _316 = !_234;
    float _318 = _312;
    float _320 = _314;
    float _322 = _310;
    if (!_316)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _180 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _244 = _342;
    }
    float _344 = _244;
    float _346 = in.m_71.w;
    if (!_222)
    {
        _318 = 0.0;
    }
    float _348 = _318;
    float _350 = _348;
    if (_222)
    {
        float _352 = _250 * _182;
        _350 = _352;
    }
    float _354 = _350;
    if (!_222)
    {
        _320 = 0.0;
    }
    float _356 = _320;
    float _358 = in.m_58.x;
    float _360 = in.m_58.y;
    float _362 = in.m_58.z;
    float _364 = 0.0;
    float _366 = _356;
    if (!_222)
    {
        _364 = 0.0;
    }
    float _368 = _364;
    float _370 = _368;
    if (_222)
    {
        float _372 = _250 * _174;
        _366 = _372;
    }
    float _374 = _366;
    if (_222)
    {
        float _376 = _250 * _188;
        _370 = _376;
    }
    float _378 = _370;
    float _380 = 0.0;
    if (_252)
    {
        float _382 = rsqrt(_216);
        _380 = _382;
    }
    float _384 = _380;
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _388 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _390 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _392 = 0.0;
    float _394 = _388;
    if (!_236)
    {
        _392 = 0.0;
    }
    float _396 = _392;
    float _398 = _396;
    if (_236)
    {
        float _400 = _268 * _184;
        _398 = _400;
    }
    float _402 = _398;
    float _404 = fma(_344, _194, _388);
    float _406 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _408 = fma(_344, _196, _390);
    if (!_236)
    {
        _278 = 0.0;
    }
    float _410 = _278;
    float _412 = _410;
    if (_236)
    {
        float _414 = _268 * _176;
        _412 = _414;
    }
    float _416 = _412;
    float _418 = fma(_344, _198, _406);
    float _420 = 0.0;
    if (!_236)
    {
        _420 = 0.0;
    }
    float _422 = _420;
    float _424 = _422;
    if (_236)
    {
        float _426 = _268 * _190;
        _424 = _426;
    }
    float _428 = _424;
    if (!_252)
    {
        _394 = 0.0;
    }
    float _430 = _394;
    float _432 = 0.0;
    float _434 = _430;
    if (!_252)
    {
        _432 = 0.0;
    }
    float _436 = _432;
    float _438 = _436;
    if (_252)
    {
        float _440 = _384 * _186;
        _434 = _440;
    }
    float _442 = _434;
    if (!_252)
    {
        _322 = 0.0;
    }
    float _444 = _322;
    float _446 = _444;
    if (_252)
    {
        float _448 = _384 * _178;
        _438 = _448;
    }
    float _450 = _438;
    if (_252)
    {
        float _452 = _384 * _192;
        _446 = _452;
    }
    float _454 = _446;
    float _456 = fma(_404, _346, _358);
    float _458 = fma(_408, _346, _360);
    float _460 = fma(_418, _346, _362);
    bool _462 = !_386;
    float _480;
    if (!_462)
    {
        float _464 = in.m_73.x;
        float _466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _468 = _464 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _470 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _472 = _470 * _466;
        float _474 = floor(_472);
        float _476 = -_474;
        float _478 = _472 + _476;
        _480 = _478;
        _482 = true;
    }
    else
    {
        float _484 = float(_118);
        float _486 = 1.0 / _484;
        float _488 = _152 * _486;
        _480 = _488;
    }
    _482 = false;
    float _490 = _480;
    float _492 = in.m_73.x;
    float _494 = in.m_73.y;
    float _496 = in.m_73.z;
    float _498 = _458 * _184;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _508 = fma(_456, _182, _498);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _512 = _490 + _510;
    float _514 = 1.0 / _502;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _526 = _524 != 0;
    float _528 = 1.0 / _506;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _532 = _490 + _530;
    float _534 = _492 * 2.0;
    float _536 = _496 * 2.0;
    float _538 = _494 + _496;
    float _540 = _494 + _492;
    float _542 = floor(_534);
    float _544 = _494 * 2.0;
    float _546 = _496 + _492;
    float _548 = _496 + (-0.5);
    float _550 = _492 + (-0.5);
    float _552 = _540 + (-1.0);
    float _554 = _532 * _528;
    float _556 = floor(_536);
    float _558 = _538 + (-1.0);
    float _560 = _546 + (-1.0);
    float _562 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _564 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _566 = !_522;
    int _568 = _566 ? 0 : 1;
    float _570 = floor(_544);
    float _572 = _494 + (-0.5);
    float _574 = _512 * _514;
    bool _576 = _542 > 0.0;
    bool _578 = _542 >= 0.0;
    bool _580 = isnan(_542);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _590 = log2(_588);
    bool _592 = _556 > 0.0;
    bool _594 = _556 >= 0.0;
    bool _596 = isnan(_556);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _606 = _586 ? 0 : 1;
    bool _608 = !_518;
    int _610 = _608 ? 0 : 1;
    int _612 = _602 ? 0 : 1;
    int _614 = ~_606;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    int _620 = _618;
    if (!_576)
    {
        int _622 = ~_606;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    int _628 = abs(_610);
    float _630 = _590 * _152;
    int _632 = ~_612;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    int _638 = _636;
    if (!_592)
    {
        int _640 = ~_612;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = exp2(_630);
    int _648 = abs(_568);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _652 = 1.0 + _650;
    float _654 = in.m_75.x;
    float _656 = in.m_75.y;
    float _658 = in.m_75.z;
    float _660 = float(_628);
    float _662 = float(_644);
    float _664 = 1.0 / _652;
    bool _666 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _668 = isnan(1.0);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _674 = _670 || _672;
    float _676 = float(_648);
    float _678 = _660 * _662;
    float _680 = float(_626);
    bool _682 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = -_646;
    float _694 = _692 + 1.0;
    bool _696 = _570 > 0.0;
    float _698 = _676 * _680;
    float _700 = _678 * (-2.0);
    float _702 = _690 ? _694 : 0.0;
    float _704 = _698 * (-2.0);
    bool _706 = _570 >= 0.0;
    bool _708 = isnan(_570);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _716;
    float _720 = fma(_604, _700, _604);
    if (_674)
    {
        float _722 = _702 * _664;
        _156 = _722;
    }
    float _724 = _156;
    int _726 = _714 ? 0 : 1;
    float _728 = fma(_700, _654, _654);
    float _730 = fma(_718, _574, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _732 = fma(_704, _656, _656);
    int _734 = ~_726;
    int _736 = _734 + 1;
    int _738 = _736 + 1;
    float _740 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[196].x, _728);
    int _742 = _738;
    if (!_696)
    {
        int _744 = ~_726;
        int _746 = _744 + 1;
        _742 = _746;
    }
    int _748 = _742;
    float _750 = fma(_562, _704, _562);
    float _752 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _732);
    bool _754 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _756 = isnan(_490);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = fma(_720, _724, _740);
    bool _768 = !_526;
    int _770 = _768 ? 0 : 1;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _776 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _778 = isnan(_490);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -_764;
    float _790 = _788 + 1.0;
    bool _792 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _794 = isnan(_490);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = fma(_750, _724, _752);
    int _806 = abs(_770);
    float _808 = _766 * 0.15915493667125701904296875;
    float _810 = _802 * _790;
    float _812 = -_802;
    float _814 = _812 + 1.0;
    float _816 = float(_806);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _818;
    float _822 = float(_748);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _824;
    float _828 = _786 * _814;
    float _830 = fma(_820, _574, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _836 = _816 * _822;
    float _838 = fma(_826, _574, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _840 = _730 * _828;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _846 = _836 * (-2.0);
    float _848 = fma(_774, _554, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _850 = _830 * _828;
    float _852 = _838 * _828;
    float _854 = fma(_846, _658, _658);
    float _856 = in.m_71.x;
    float _858 = in.m_71.y;
    float _860 = in.m_71.z;
    float _862 = fma(_844, _554, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _864 = fma(_834, _554, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _866 = -_786;
    float _868 = _866 + 1.0;
    float _870 = in.m_77.x;
    float _872 = in.m_77.y;
    float _874 = in.m_77.z;
    float _876 = fma(_564, _846, _564);
    float _878 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[196].z, _854);
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[143].y, _840);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[143].x, _850);
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[143].z, _852);
    float _886 = fma(_876, _724, _878);
    float _888 = fma(_848, _810, _880);
    float _890 = _804 * 0.15915493667125701904296875;
    float _892 = fma(_862, _810, _882);
    float _894 = _886 * 0.15915493667125701904296875;
    float _896 = fma(_864, _810, _884);
    float _898 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[145].y, _888);
    float _900 = _808 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[145].x, _892);
    float _906 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[145].z, _896);
    float _908 = _458 * _190;
    float _910 = _458 * _176;
    float _912 = _904 * _856;
    float _914 = _808 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = _898 * _858;
    float _920 = _906 * _860;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _870);
    float _924 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _872);
    float _928 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _930 = fma(_460, _186, _508);
    float _932 = _890 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _874);
    float _938 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _940 = _924 * _922;
    float _942 = _928 * _926;
    float _944 = fma(_456, _188, _908);
    float _946 = _938 * _936;
    float _948 = _930 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _950 = _890 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = fma(_460, _192, _944);
    bool _956 = _872 != 0.0;
    bool _958 = isnan(_872);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = fma(_456, _174, _910);
    bool _968 = _870 == 0.0;
    bool _970 = !_964;
    bool _972 = _968 && _970;
    float _974 = fma(_460, _178, _966);
    float _976 = _894 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _902 * _934;
    bool _982 = _874 == 0.0;
    bool _984 = _982 && _972;
    float _986 = _894 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _916 * _952;
    float _992 = _902 * _952;
    float _994 = _916 * _978;
    float _996 = _902 * _978;
    float _998 = _916 * _934;
    float _1000 = _934 * _978;
    float _1002 = _994 * _942;
    float _1004 = _952 * _978;
    float _1006 = _996 * _942;
    float _1008 = fma(_988, _990, _980);
    float _1010 = -_942;
    float _1012 = _988 * _1010;
    float _1014 = -_992;
    float _1016 = fma(_988, _998, _1014);
    float _1018 = -_998;
    float _1020 = fma(_988, _992, _1018);
    float _1022 = fma(_1008, _940, _1002);
    float _1024 = fma(_1004, _940, _1012);
    float _1026 = fma(_988, _980, _990);
    float _1028 = fma(_1020, _940, _1006);
    float _1030 = fma(_1016, _946, _1022);
    float _1032 = fma(_1000, _946, _1024);
    float _1034 = _954 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1036 = fma(_1026, _946, _1028);
    float _1038 = _1030 * _402;
    float _1040 = _1030 * _428;
    float _1042 = _1030 * _416;
    float _1044 = fma(_1032, _354, _1038);
    float _1046 = fma(_1032, _378, _1040);
    float _1048 = fma(_1032, _374, _1042);
    float _1050 = fma(_1036, _442, _1044);
    float _1052 = fma(_1036, _454, _1046);
    float _1054 = in.m_79.x;
    float _1056 = in.m_79.y;
    float _1058 = in.m_79.z;
    float _1060 = fma(_1036, _450, _1048);
    float _1062 = _948 + _1050;
    float _1064 = _1034 + _1052;
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1068 = _1062 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1072 = _1064 + _1070;
    float _1074 = _1068 * _1068;
    float _1076 = _1072 * _1072;
    float _1078 = _1074 + _1076;
    float _1080 = sqrt(_1078);
    float _1082 = _1056;
    float _1084 = _1054;
    float _1086 = _1058;
    float _1088 = _1074;
    float _1090 = _1062;
    float _1092 = _1064;
    int _1094 = as_type<int>(_1072);
    float _1096 = _1026;
    if (!_984)
    {
        float _1098 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1082 = _1098;
    }
    float _1100 = _1082;
    float _1102 = _1100;
    if (!_984)
    {
        float _1104 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1054);
        _1084 = _1104;
    }
    float _1106 = _1084;
    float _1108 = _1106;
    if (!_984)
    {
        float _1110 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1058);
        _1086 = _1110;
    }
    float _1112 = _1086;
    float _1114 = _974 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1116 = -_1100;
    float _1118 = _988 * _1116;
    float _1120 = _994 * _1100;
    float _1122 = _996 * _1100;
    float _1124 = fma(_1004, _1106, _1118);
    float _1126 = fma(_1008, _1106, _1120);
    float _1128 = fma(_1020, _1106, _1122);
    bool _1130 = _1080 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = fma(_1000, _1112, _1124);
    float _1134 = fma(_1016, _1112, _1126);
    float _1136 = fma(_1026, _1112, _1128);
    float _1138 = _1114 + _1060;
    if (!_1130)
    {
        _246 = _1076;
    }
    float _1140 = _246;
    float _1142 = _1140;
    if (!_1130)
    {
        _1108 = _1138;
    }
    float _1144 = _1108;
    bool _1146 = !_1130;
    float _1148 = _1144;
    if (!_1146)
    {
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1154 = _1080 + _1152;
        float _1156 = rsqrt(_1078);
        float _1158 = _1154 * _1150;
        float _1160 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = _1158 * 0.15915493667125701904296875;
        float _1164 = _1162 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1162 * 6.283185482025146484375;
        float _1170 = cos(_1168);
        float _1172 = fma(_1166, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1174 = _1156 * _1172;
        float _1176 = _1170 + (-1.0);
        float _1178 = fma(_1068, _1174, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1180 = fma(_1072, _1174, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1182 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1186 = _1178 + _1184;
        float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1190 = _1180 + _1188;
        float _1192 = fma(_1138, _1170, _1182);
        float _1194 = _1186 * _1186;
        float _1196 = _1190 * _1190;
        _1148 = _1192;
        _1088 = _1194;
        _1142 = _1196;
        _1090 = _1178;
        _1092 = _1180;
        _1102 = _1162;
    }
    float _1198 = _1148;
    float _1200 = _1088;
    float _1202 = _1142;
    float _1204 = _1090;
    float _1206 = _1092;
    float _1208 = _1102;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1212 = _1198 + _1210;
    float _1214 = _1134 * _402;
    float _1216 = _1134 * _416;
    float _1218 = _1134 * _428;
    float _1220 = fma(_1212, _1212, _1200);
    float _1222 = fma(_1132, _354, _1214);
    float _1224 = fma(_1132, _374, _1216);
    float _1226 = _1220 + _1202;
    float _1228 = fma(_1136, _442, _1222);
    float _1230 = fma(_1136, _450, _1224);
    float _1232 = fma(_1132, _378, _1218);
    float _1234 = sqrt(_1226);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1244 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = fma(_1136, _454, _1232);
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1244;
    out.m_83.y = _1246;
    out.m_83.z = _1248;
    out.m_83.w = _1242;
    bool _1252 = _1234 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1254 = isnan(_1234);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1260 = _1256 || _1258;
    out.m_85.x = _1228;
    out.m_85.y = _1230;
    out.m_85.z = _1250;
    float _1262 = _1208;
    if (!_1260)
    {
        _1262 = 1.0;
    }
    float _1264 = _1262;
    bool _1266 = !_1260;
    float _1268 = _1264;
    if (!_1266)
    {
        bool _1270 = _1234 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1272 = isnan(_1234);
        bool _1274 = _1270 || _1272;
        bool _1276 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1278 = _1274 || _1276;
        if (!_1278)
        {
            float _1280 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1282 = _1234 + _1280;
            float _1284 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1286 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1284;
            float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1290 = _1288 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1292 = 1.0 / _1286;
            float _1294 = _1282 * _1292;
            float _1296 = fma(_1294, _1290, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1268 = _1296;
            _1298 = true;
        }
        else
        {
            bool _1300 = _1234 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1302 = isnan(_1234);
            bool _1304 = _1300 || _1302;
            bool _1306 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1308 = _1304 || _1306;
            if (!_1308)
            {
                float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1312 = _1234 + _1310;
                float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1316 = _1314 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1320 = _1318 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1322 = 1.0 / _1316;
                float _1324 = _1312 * _1322;
                float _1326 = fma(_1324, _1320, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1268 = _1326;
                _1298 = true;
            }
            else
            {
                _1268 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1298 = false;
    float _1328 = _1268;
    float _1330 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1332 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1334 = floor(_1330);
    float _1336 = floor(_1332);
    float _1338 = -_1334;
    float _1340 = _1330 + _1338;
    float _1342 = -_1336;
    float _1344 = _1332 + _1342;
    float2 _4727 = float2(_1340, _1344);
    float _1346 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4727, float2(0.0), isnan(_4727)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4727, float2(0.0), isnan(_4727)), level(0.0)).x;
    float _1348 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1352 = _1204 + _1350;
    float _1354 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1348);
    float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1358 = _1198 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1362 = _1206 + _1360;
    float _1364 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1354);
    float _1366 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1368 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.5);
    bool _1376 = _1372 || _1374;
    float _1378 = fma(_1352, _1328, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1380 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1382 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1366);
    float _1384 = fma(_1358, _1328, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1386 = fma(_1362, _1328, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1388 = 1.0 / _1380;
    float _1390 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1382);
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1394 = _1358;
    float _1396 = _1328;
    int _1398 = 2;
    if (_1376)
    {
        _1394 = _1378;
    }
    float _1400 = _1394;
    float _1402 = _1392 + _1380;
    float _1404 = _1400;
    if (_1376)
    {
        _1396 = _1384;
    }
    float _1406 = _1396;
    float _1408 = _1402 * _1388;
    float _1410 = _1408 * 0.5;
    float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1414 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1412);
    float _1416 = 1.0 / _1414;
    float _1418 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1420 = _1114 + _1418;
    float _1422 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1424 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1422);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1428 = _1416 * _1426;
    float _1430 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1424);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1434 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1436 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1432);
    bool _1438 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1440 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1442 = !_1434;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1436);
    float _1448 = trunc(_1440);
    int _1450 = int(_1448);
    float _1452 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1454 = _1406;
    if (!_1434)
    {
        _1398 = 1;
    }
    int _1456 = _1398;
    int _1458 = _1456;
    if (!_1438)
    {
        _1458 = _1444;
    }
    int _1460 = _1458;
    float _1462 = trunc(_1452);
    int _1464 = int(_1462);
    int _1466 = _1460 << 6;
    int _1468 = _1466 + 48;
    uint _1471 = uint(int(uint(_1468) >> uint(2)));
    uint _1473 = uint(int(uint(int(_1471)) >> uint(2)));
    int _1475 = int(_1471) & 3;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[int(_1473)][_1475];
    int _1479 = int(_1471) + 1;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    int _1483 = _1479 & 3;
    float _1485 = (*spvDescriptorSet0.vp_c15)._m0[int(_1481)][_1483];
    int _1487 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1489 = _1450 + _1487;
    int _1491 = _1489 + 1;
    bool _1493 = _1491 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1495 = _1466 + 56;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    int _1513 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1515 = _1464 + _1513;
    int _1517 = _1515 + 1;
    int _1519 = _1491 | _1517;
    int _1521 = _1466 + 64;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    uint _1525 = uint(int(uint(int(_1523)) >> uint(2)));
    int _1527 = int(_1523) & 3;
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[int(_1525)][_1527];
    int _1531 = int(_1523) + 1;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    int _1535 = _1531 & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    bool _1539 = _1519 < 0;
    bool _1541 = _1539 || _1493;
    float _1543 = as_type<float>(_1519);
    int _1545 = _1491;
    if (_1376)
    {
        _1543 = _1386;
    }
    float _1547 = _1543;
    bool _1549 = _1517 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1551 = _1549 || _1541;
    int _1553 = _1466 + 72;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
    int _1559 = int(_1555) & 3;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
    int _1563 = int(_1555) + 1;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    int _1567 = _1563 & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = _1466 + 96;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    uint _1575 = uint(int(uint(int(_1573)) >> uint(2)));
    int _1577 = int(_1573) & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    int _1581 = int(_1573) + 1;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    int _1585 = _1581 & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    int _1589 = _1466 + 104;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    float _1607 = _1547;
    if (!_1376)
    {
        float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1611 = _1114 + _1609;
        float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1615 = _948 + _1613;
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1619 = _1611 * _1611;
        float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1623 = _1034 + _1621;
        float _1625 = fma(_1615, _1615, _1619);
        float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1629 = fma(_1623, _1623, _1625);
        float _1631 = sqrt(_1629);
        float _1633 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1635 = -_1034;
        float _1637 = _1635 + _1386;
        float _1639 = precise::min(_1631, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1641 = _1639 * _1627;
        float _1643 = -_1114;
        float _1645 = _1643 + _1384;
        float _1647 = _1633 * _1641;
        float _1649 = -_948;
        float _1651 = _1649 + _1378;
        float _1653 = fma(_1645, _1647, _1114);
        float _1655 = fma(_1651, _1647, _948);
        float _1657 = fma(_1637, _1647, _1034);
        _1454 = _1653;
        _1404 = _1655;
        _1607 = _1657;
        _1094 = as_type<int>(_1627);
    }
    float _1659 = _1454;
    float _1661 = _1404;
    float _1663 = _1607;
    int _1665 = _1094;
    float _1667 = _1420 * _1587;
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1671 = _1665;
    if (!_1551)
    {
        int _1673 = _1517 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1675 = _1673 + _1491;
        _1545 = _1675;
    }
    int _1677 = _1545;
    float _1679 = _1420 * _1537;
    float _1681 = fma(_948, _1579, _1667);
    float _1683 = _1420 * _1485;
    float _1685 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1669);
    int _1687 = as_type<int>(_1685);
    if (!_1551)
    {
        int _1689 = _1677 << 2;
        _1671 = _1689;
    }
    int _1691 = _1671;
    float _1693 = fma(_1034, _1597, _1681);
    float _1695 = fma(_948, _1477, _1683);
    float _1697 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1685);
    float _1699 = fma(_948, _1529, _1679);
    int _1701 = _1691;
    if (!_1551)
    {
        uint _1703 = uint(int(uint(_1677) >> uint(2)));
        _1687 = int(_1703);
    }
    int _1705 = _1687;
    int _1707 = _1466 + 80;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    uint _1711 = uint(int(uint(int(_1709)) >> uint(2)));
    int _1713 = int(_1709) & 3;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[int(_1711)][_1713];
    int _1717 = int(_1709) + 1;
    uint _1719 = uint(int(uint(_1717) >> uint(2)));
    int _1721 = _1717 & 3;
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[int(_1719)][_1721];
    if (!_1551)
    {
        int _1725 = 12 & _1691;
        _1701 = _1725;
    }
    int _1727 = _1701;
    float _1729 = _1693 + _1605;
    float _1731 = fma(_1034, _1503, _1695);
    float _1733 = fma(_1034, _1561, _1699);
    float _1735 = as_type<float>(_1727);
    if (!_1551)
    {
        int _1737 = _1705 << 4;
        int _1739 = _1737 + _1727;
        _1735 = as_type<float>(_1739);
    }
    float _1741 = _1735;
    float _1743 = 1.0 / _1729;
    float _1745 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1747 = _1466 + 88;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    uint _1751 = uint(int(uint(int(_1749)) >> uint(2)));
    int _1753 = int(_1749) & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    int _1757 = int(_1749) + 1;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    int _1761 = _1757 & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    float _1765 = _1731 + _1511;
    float _1767 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = _1733 + _1569;
    float _1771 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1773 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1745);
    float _1775 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1777 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1779 = _1741;
    if (!_1551)
    {
        int _1781 = as_type<int>(_1741) + 400;
        uint _1783 = uint(int(uint(_1781) >> uint(2)));
        uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
        int _1787 = int(_1783) & 3;
        float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
        _1779 = _1789;
    }
    float _1791 = _1779;
    float _1793 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1771);
    float _1795 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1773);
    float _1797 = -_1777;
    float _1799 = fma(_1797, _1775, 1.0);
    float _1801 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1803 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1793);
    float _1805 = _1765 * _1743;
    float _1807 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1809 = _1769 * _1743;
    float _1811 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1801);
    float _1813 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1815 = _1805 >= 0.0;
    float _1817 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1819 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1811);
    float _1821 = _1765;
    float _1823 = _1743;
    if (!_1551)
    {
        float _1825 = floor(_1452);
        _1821 = _1825;
    }
    float _1827 = _1821;
    bool _1829 = _1805 <= 1.0;
    bool _1831 = _1829 && _1815;
    float _1833 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1817);
    float _1835 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1837 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1839 = _1809 >= 0.0;
    bool _1841 = _1839 && _1831;
    float _1843 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1833);
    float _1845 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1847 = log2(_1799);
    bool _1849 = _1809 <= 1.0;
    bool _1851 = _1849 && _1841;
    float _1853 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1843);
    float _1855 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1845);
    float _1857 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1837);
    float _1859 = 1.0 / _1853;
    float _1861 = _1827;
    float _1863 = _1791;
    if (!_1551)
    {
        float _1865 = -_1827;
        float _1867 = _1452 + _1865;
        _1861 = _1867;
    }
    float _1869 = _1861;
    float _1871 = _1420 * _1723;
    float _1873 = _1723;
    if (_1851)
    {
        float _1875 = float(_1460);
        _1873 = _1875;
    }
    float _1877 = _1873;
    float _1879 = fma(_948, _1715, _1871);
    float _1881 = _1378;
    if (!_1551)
    {
        float _1883 = floor(_1440);
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1855);
    float _1889 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1857);
    float _1891 = fma(_1034, _1755, _1879);
    float _1893 = _1847 * 0.693147182464599609375;
    float _1895 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1887);
    float _1897 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1889);
    float _1899 = _1891 + _1763;
    float _1901 = _1871;
    if (_1851)
    {
        float _1903 = rint(_1877);
        float _1905 = precise::max(_1903, 0.0);
        uint _1907 = uint(_1905);
        uint _1909 = clamp(_1907, 0u, 65535u);
        _1901 = as_type<float>(_1909);
    }
    float _1911 = _1901;
    float _1913 = _1895 * _1859;
    float _1915 = _1897 * _1859;
    float _1917 = _1899 * _1743;
    float _1919 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1921 = fma(_1913, 0.5, 0.5);
    float _1923 = fma(_1915, -0.5, 0.5);
    float _1925 = _1879;
    float _1927 = _1859;
    if (!_1551)
    {
        float _1929 = rint(_1791);
        float _1931 = precise::max(_1929, 0.0);
        uint _1933 = uint(_1931);
        uint _1935 = clamp(_1933, 0u, 65535u);
        _1925 = as_type<float>(_1935);
    }
    float _1937 = _1925;
    if (!_1551)
    {
        float _1939 = -_1885;
        float _1941 = _1440 + _1939;
        _1927 = _1941;
    }
    float _1943 = _1927;
    float _1945 = _1911;
    if (_1851)
    {
        float3 _5754 = float3(_1805, _1809, float(as_type<int>(_1911)));
        float3 _5758 = select(_5754, float3(0.0), isnan(_5754));
        float _1947 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5758.xy, uint(rint(_5758.z)), _1917, level(0.0));
        _1945 = _1947;
    }
    float _1949 = _1945;
    float3 _5768 = float3(_1921, _1923, _1919);
    float _1951 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5768, float3(0.0), isnan(_5768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5768, float3(0.0), isnan(_5768)), level(0.0)).x;
    float3 _5777 = float3(_1921, _1923, _1919);
    float4 _1954 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5777, float3(0.0), isnan(_5777)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5777, float3(0.0), isnan(_5777)), level(0.0)).xyzw;
    float _1956 = _1954.x;
    float _1958 = _1954.y;
    float _1960 = _1954.z;
    float _1962 = _1954.w;
    float _1964 = _1869;
    float _1966 = _1937;
    if (!_1551)
    {
        float3 _5801 = float3(_1943, _1869, float(as_type<int>(_1937)));
        float3 _5803 = select(_5801, float3(0.0), isnan(_5801));
        float _1968 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5803.xy, uint(rint(_5803.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5803.xy, uint(rint(_5803.z)), level(0.0)).x;
        _1964 = _1968;
    }
    float _1970 = _1964;
    if (_1551)
    {
        _1823 = 1.0;
    }
    float _1972 = _1823;
    float _1974 = _1972;
    if (!_1551)
    {
        int _1976 = _1677 << 4;
        int _1978 = _1976 + 2048;
        uint _1980 = uint(int(uint(_1978) >> uint(2)));
        uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
        int _1984 = int(_1980) & 3;
        float _1986 = (*spvDescriptorSet0.vp_c15)._m0[int(_1982)][_1984];
        int _1988 = int(_1980) + 1;
        uint _1990 = uint(int(uint(_1988) >> uint(2)));
        int _1992 = _1988 & 3;
        float _1994 = (*spvDescriptorSet0.vp_c15)._m0[int(_1990)][_1992];
        int _1996 = _1978 + 8;
        uint _1998 = uint(int(uint(_1996) >> uint(2)));
        uint _2000 = uint(int(uint(int(_1998)) >> uint(2)));
        int _2002 = int(_1998) & 3;
        float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
        int _2006 = int(_1998) + 1;
        uint _2008 = uint(int(uint(_2006) >> uint(2)));
        int _2010 = _2006 & 3;
        float _2012 = (*spvDescriptorSet0.vp_c15)._m0[int(_2008)][_2010];
        float _2014 = _1420 * _1994;
        float _2016 = fma(_948, _1986, _2014);
        float _2018 = fma(_1034, _2004, _2016);
        float _2020 = _2018 + _2012;
        float _2022 = precise::clamp(_2020, 0.0, 1.0);
        float _2024 = -_2022;
        float _2026 = _2024 + _1970;
        float _2028 = fma(_2026, 500.0, 1.5);
        float _2030 = exp2(_2028);
        float _2032 = 0.0 + _2030;
        float _2034 = precise::clamp(_2032, 0.0, 1.0);
        _1966 = _1986;
        _1974 = _2034;
    }
    float _2036 = _1966;
    float _2038 = _1974;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2042 = _1659 + _2040;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2046 = _1661 + _2044;
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2050 = _1663 + _2048;
    float _2052 = _2042 * _2042;
    float _2054 = fma(_2046, _2046, _2052);
    float _2056 = fma(_2050, _2050, _2054);
    float _2058 = rsqrt(_2056);
    float _2060 = sqrt(_2056);
    float _2062 = _2046 * _2058;
    float _2064 = _2050 * _2058;
    float _2066 = _2042 * _2058;
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2070 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2072 = _2068 * _2068;
    float _2074 = _2070 * _2070;
    float _2076 = _2072 + _2074;
    float _2078 = sqrt(_2076);
    bool _2080 = _2078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2084 = _2078 + _2082;
    float _2086 = _1034;
    float _2088 = _2058;
    float _2090 = _2084;
    float _2092 = _2036;
    if (_2080)
    {
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2086 = _2094;
    }
    float _2096 = _2086;
    if (_2080)
    {
        float _2098 = rsqrt(_2076);
        _2088 = _2098;
    }
    float _2100 = _2088;
    float _2102 = _2100;
    if (_2080)
    {
        float _2104 = _2084 * _2096;
        _2090 = _2104;
    }
    float _2106 = _2090;
    if (_2080)
    {
        float _2108 = _2106 * 0.15915493667125701904296875;
        _2092 = _2108;
    }
    float _2110 = _2092;
    float _2112 = _2096;
    float _2114 = _2110;
    if (_2080)
    {
        float _2116 = _2110 * 6.283185482025146484375;
        float _2118 = sin(_2116);
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2124 = precise::max(0.0, _2122);
    float _2126 = _1970;
    float _2128 = _2124;
    if (_2080)
    {
        float _2130 = _2110 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        _2126 = _2132;
    }
    float _2134 = _2126;
    float _2136 = -_2066;
    float _2138 = -_2124;
    float _2140 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2138);
    if (_2080)
    {
        float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2142;
    }
    float _2144 = _2128;
    float _2146 = _2120;
    float _2148 = _2144;
    if (_2080)
    {
        float _2150 = fma(_2120, _2144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1863 = _2150;
    }
    float _2152 = _1863;
    float _2154 = _2152;
    if (!_2080)
    {
        _2146 = _2068;
    }
    float _2156 = _2146;
    float _2158 = _2156;
    float _2160 = _2134;
    if (_2080)
    {
        float _2162 = _2134 + (-1.0);
        _2148 = _2162;
    }
    float _2164 = _2148;
    float _2166 = _2164;
    if (_2080)
    {
        float _2168 = _2100 * _2152;
        _1096 = _2168;
    }
    float _2170 = _1096;
    if (!_2080)
    {
        _2102 = _2140;
    }
    float _2172 = _2102;
    float _2174 = _2172;
    if (_2080)
    {
        float _2176 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2176;
    }
    float _2178 = _2114;
    if (_2080)
    {
        float _2180 = _2068 * _2170;
        _2158 = _2180;
    }
    float _2182 = _2158;
    if (!_2080)
    {
        _2166 = _2070;
    }
    float _2184 = _2166;
    float _2186 = _2184;
    if (_2080)
    {
        float _2188 = _2070 * _2170;
        _2186 = _2188;
    }
    float _2190 = _2186;
    if (!_2080)
    {
        _2154 = _2072;
    }
    float _2192 = _2154;
    float _2194 = _2192;
    if (_2080)
    {
        float _2196 = fma(_2140, _2134, _2178);
        _2174 = _2196;
    }
    float _2198 = _2174;
    if (_2080)
    {
        float _2200 = _2182 * _2182;
        _2194 = _2200;
    }
    float _2202 = _2194;
    if (!_2080)
    {
        _2160 = _2074;
    }
    float _2204 = _2160;
    float _2206 = _2204;
    if (_2080)
    {
        float _2208 = _2190 * _2190;
        _2206 = _2208;
    }
    float _2210 = _2206;
    float _2212 = fma(_2198, _2198, _2202);
    float _2214 = _2212 + _2210;
    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2218 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2216);
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = -_2220;
    float _2224 = _2222 + 1.0;
    float _2226 = rsqrt(_2214);
    float _2228 = _2226 * _2182;
    float _2230 = _2226 * _2198;
    float _2232 = _2226 * _2190;
    float _2234 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2236 = abs(_2224);
    float _2238 = log2(_2236);
    float _2240 = -_2234;
    float _2242 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2240);
    float _2244 = -_2232;
    float _2246 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2242);
    float _2248 = fma(_2246, -0.5, 0.5);
    float _2250 = fma(_2246, 0.5, 0.5);
    float _2252 = fma(_2250, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2254 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2256 = sqrt(_2248);
    float _2258 = fma(_2250, _2252, -0.212114393711090087890625);
    float _2260 = _2230 + 1.0;
    float _2262 = fma(_2250, _2258, 1.570728778839111328125);
    float _2264 = exp2(_2254);
    float _2266 = _2256 * 0.636619746685028076171875;
    float _2268 = -_2230;
    float _2270 = fma(_2264, _2260, _2268);
    float _2272 = -_2262;
    float _2274 = fma(_2266, _2272, 1.0);
    float _2276 = fma(_2270, 0.5, 0.5);
    float2 _6286 = float2(_2274, _2276);
    float3 _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6286, float2(0.0), isnan(_6286)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6286, float2(0.0), isnan(_6286)), level(0.0)).xyz;
    float _2282 = _2280.x;
    float _2284 = _2280.y;
    float _2286 = _2280.z;
    float _2288 = abs(_1428);
    float _2290 = log2(_2288);
    float _2292 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2294 = -_1346;
    float _2296 = _2294 + 1.0;
    out.m_87.x = _1661;
    out.m_87.y = _1659;
    out.m_87.z = _1663;
    float _2298 = exp2(_2292);
    bool _2300 = _1428 <= 8000.0;
    bool _2302 = isnan(_1428);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan(8000.0);
    bool _2308 = _2304 || _2306;
    float _2310 = float(_2308);
    float _2312 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2314 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2316 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2314);
    float _2318 = exp2(_2312);
    float _2320 = -_2298;
    float _2322 = _2320 + 1.0;
    float _2324 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2316);
    float _2326 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2324);
    float _2328 = _2326 + _1853;
    float _2330 = _2328 * 0.5;
    float _2332 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2334 = precise::clamp(_2332, 0.0, 1.0);
    float _2336 = fma(_2334, -2.0, 3.0);
    float _2338 = _2334 * _2334;
    float _2340 = _2338 * _2336;
    float _2342 = -_2340;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2340);
    float _2348 = _2310 * _2346;
    float _2350 = _2310;
    float _2352 = _2326;
    float _2354 = _1895;
    if (!_1851)
    {
        _2350 = 1.0;
    }
    float _2356 = _2350;
    out.m_89.z = _2330;
    out.m_89.w = _1853;
    float _2358 = _2356;
    if (_1851)
    {
        bool _2360 = _1949 >= _1917;
        bool _2362 = isnan(_1949);
        bool _2364 = _2360 || _2362;
        bool _2366 = isnan(_1917);
        bool _2368 = _2364 || _2366;
        float _2370 = float(_2368);
        _2358 = _2370;
    }
    float _2372 = _2358;
    float _2374 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2376 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2378 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2380 = isnan(_2060);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2386 = _2382 || _2384;
    out.gl_Position.x = _1895;
    out.gl_Position.y = _1897;
    out.gl_Position.z = _2326;
    out.gl_Position.w = _1853;
    float _2388 = _2296 * _2374;
    float _2390 = precise::clamp(_2388, 0.0, 1.0);
    float _2392 = _2376 * _1951;
    float _2394 = _2372 * _2038;
    float _2396 = -_2376;
    float _2398 = _2396 + 1.0;
    float _2400 = -_2390;
    float _2402 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2404 = _1962 * _2392;
    float _2406 = _1962 * _2398;
    float _2408 = -_2394;
    float _2410 = fma(_2408, _2402, 1.0);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = _2402;
    float _2416 = _2412;
    float _2418 = _2390;
    float _2420 = _2392;
    if (!_2386)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2422 = _2414;
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2426 = _2422;
    float _2428 = _2422;
    if (!_2386)
    {
        _2352 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2430 = _2352;
    float _2432 = _2430;
    float _2434 = _2430;
    if (!_2386)
    {
        _2354 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2436 = _2354;
    out.m_91.x = _2424;
    float _2438 = _2436;
    float _2440 = _2436;
    if (!_2386)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2442 = _2416;
    float _2444 = _2442;
    float _2446 = _2442;
    if (!_2386)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2448 = _2418;
    float _2450 = _2286 * _2392;
    float _2452 = fma(_2282, _2404, _1956);
    float _2454 = fma(_2284, _2404, _1958);
    float _2456 = _2448;
    float _2458 = _2448;
    if (!_2386)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2460 = _2420;
    float _2462 = fma(_1962, _2450, _1960);
    out.m_93.x = _2452;
    out.m_93.y = _2454;
    out.m_93.z = _2462;
    out.m_93.w = _2406;
    bool _2464 = !_2386;
    float _2466 = _2460;
    float _2468 = _2460;
    if (!_2464)
    {
        bool _2470 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2472 = isnan(_2060);
        bool _2474 = _2470 || _2472;
        bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2478 = _2474 || _2476;
        if (!_2478)
        {
            float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2482 = _2060 + _2480;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2486 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2484;
            float _2488 = 1.0 / _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2510 = _2482 * _2488;
            float _2512 = precise::clamp(_2510, 0.0, 1.0);
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2518 = fma(_2512, _2492, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2520 = fma(_2512, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2522 = fma(_2512, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2524 = fma(_2512, _2500, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2526 = fma(_2512, _2504, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2528 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2434 = _2518;
            _2446 = _2526;
            _2468 = _2520;
            _2428 = _2524;
            _2440 = _2522;
            _2458 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2534 = isnan(_2060);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2542 = _2466;
            _2468 = _2542;
            if (!_2540)
            {
                _2432 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2544 = _2432;
            _2434 = _2544;
            if (!_2540)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2546 = _2438;
            _2440 = _2546;
            if (!_2540)
            {
                _2426 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2548 = _2426;
            _2428 = _2548;
            if (!_2540)
            {
                _2444 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2550 = _2444;
            _2446 = _2550;
            if (!_2540)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2552 = _2456;
            bool _2554 = !_2540;
            _2458 = _2552;
            if (!_2554)
            {
                bool _2556 = _2060 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2558 = isnan(_2060);
                bool _2560 = _2556 || _2558;
                bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2564 = _2560 || _2562;
                if (!_2564)
                {
                    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2568 = _2060 + _2566;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2572 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2570;
                    float _2574 = 1.0 / _2572;
                    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2596 = _2568 * _2574;
                    float _2598 = precise::clamp(_2596, 0.0, 1.0);
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2604 = fma(_2598, _2578, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2606 = fma(_2598, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2608 = fma(_2598, _2582, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2610 = fma(_2598, _2586, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2612 = fma(_2598, _2590, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2614 = fma(_2598, _2594, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2434 = _2604;
                    _2446 = _2612;
                    _2468 = _2606;
                    _2428 = _2610;
                    _2440 = _2608;
                    _2458 = _2614;
                    _2530 = true;
                }
                else
                {
                    _2434 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2446 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2428 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2530 = false;
    float _2616 = _2434;
    float _2618 = _2446;
    float _2620 = _2468;
    float _2622 = _2428;
    float _2624 = _2440;
    float _2626 = _2458;
    float _2628 = fma(_1230, -0.5, 0.5);
    float _2630 = precise::clamp(_2628, 0.0, 1.0);
    float _2632 = -_2616;
    float _2634 = _2632 + _2618;
    float _2636 = -_2620;
    float _2638 = _2636 + _2622;
    float _2640 = -_2624;
    float _2642 = _2640 + _2626;
    bool _2644 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2646 = fma(_2630, _2634, _2616);
    float _2648 = fma(_2630, _2638, _2620);
    float _2650 = fma(_2630, _2642, _2624);
    float _2652 = _2646 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2654 = fma(_2648, 0.298911988735198974609375, _2652);
    float _2656 = fma(_2650, 0.114477999508380889892578125, _2654);
    out.m_97.x = 0.0;
    float _2658 = -_2656;
    float _2660 = _2648 + _2658;
    float _2662 = -_2656;
    float _2664 = _2646 + _2662;
    float _2666 = -_2656;
    float _2668 = _2650 + _2666;
    float _2670 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2672 = fma(_2660, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2674 = fma(_2664, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2676 = fma(_2668, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    out.m_61.x = _2670;
    out.m_99.x = _2672;
    out.m_99.y = _2674;
    out.m_99.z = _2676;
    if (!_2644)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2678 = -_1659;
    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2682 = -_1661;
    float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2686 = -_1663;
    float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2690 = _2680 * _2680;
    float _2692 = fma(_2684, _2684, _2690);
    float _2694 = fma(_2688, _2688, _2692);
    float _2696 = rsqrt(_2694);
    float _2698 = _2680 * _2696;
    float _2700 = _2684 * _2696;
    float _2702 = _2688 * _2696;
    float _2704 = sqrt(_2694);
    float _2706 = -_2066;
    float _2708 = _2706 + _2698;
    float _2710 = -_2062;
    float _2712 = _2710 + _2700;
    float _2714 = -_2064;
    float _2716 = _2714 + _2702;
    float _2718 = _2708 * _2708;
    float _2720 = fma(_2712, _2712, _2718);
    float _2722 = fma(_2716, _2716, _2720);
    float _2724 = -_2704;
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2728 = rsqrt(_2722);
    float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = abs(_2732);
    float _2736 = log2(_2734);
    float _2738 = _2708 * _2728;
    float _2740 = _2712 * _2728;
    float _2742 = _2716 * _2728;
    float _2744 = _1230 * _2738;
    float _2746 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    float _2750 = _1230 * _2698;
    float _2752 = fma(_1228, _2740, _2744);
    float _2754 = _2748 * _2748;
    float _2756 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2758 = fma(_1228, _2700, _2750);
    float _2760 = fma(_1250, _2742, _2752);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = _2754 + (-1.0);
    float _2766 = fma(_1250, _2702, _2758);
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    float _2770 = _2762 * _2762;
    float _2772 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2774 = exp2(_2756);
    float _2776 = fma(_2770, _2764, 1.0);
    float _2778 = -_2698;
    float _2780 = -_2772;
    float _2782 = fma(_2778, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2780);
    float _2784 = _2776 * _2776;
    float _2786 = -_2702;
    float _2788 = fma(_2786, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2782);
    float _2790 = 1.0 / _2784;
    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2794 = _2788 + _2792;
    float _2796 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = _2774 * _2798;
    float _2802 = _2768 * _2800;
    float _2804 = _2754 * _2790;
    float _2806 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2808 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2810 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2812 = _2802 * _2804;
    float _2814 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2816 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2818 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2806;
    out.m_95.y = _2808;
    out.m_95.z = _2810;
    out.m_97.x = _2814;
    out.m_97.y = _2816;
    out.m_97.z = _2818;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

