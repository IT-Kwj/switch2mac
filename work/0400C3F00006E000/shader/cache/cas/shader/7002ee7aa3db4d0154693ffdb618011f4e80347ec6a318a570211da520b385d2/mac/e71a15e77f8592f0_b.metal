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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
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
    float4 m_89 [[user(locn0)]];
    float4 m_85 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_103 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_93 [[user(locn5)]];
    float4 m_97 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_101 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_87 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_83 [[attribute(8)]];
    float4 m_79 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_81 [[attribute(11)]];
    float4 m_75 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3798 = false;
    bool _3626 = false;
    bool _2087 = false;
    bool _2075 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_61.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4031 = as_type<float>(_138);
        out.gl_Position.z = _4031;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_63.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = _156;
    if (_152)
    {
        float _160 = float(_122);
        _132 = _160;
    }
    float _162 = _132;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4101 = as_type<float>(_176);
        out.gl_Position.z = _4101;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = in.m_69.x;
    float _192 = in.m_69.y;
    float _194 = in.m_69.z;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = fma(_184, _184, _196);
    float _202 = fma(_186, _186, _198);
    float _204 = fma(_190, _190, _200);
    float _206 = _182 * _182;
    float _208 = fma(_192, _192, _202);
    float _210 = sqrt(_204);
    float _212 = fma(_188, _188, _206);
    float _214 = in.m_71.x;
    float _216 = in.m_71.y;
    float _218 = in.m_71.z;
    float _220 = fma(_194, _194, _212);
    float _222 = sqrt(_208);
    float _224 = sqrt(_220);
    bool _226 = _210 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _180 * _216;
    float _232 = 0.0;
    int _234 = as_type<int>(_208);
    if (_226)
    {
        float _236 = rsqrt(_204);
        _232 = _236;
    }
    float _238 = _232;
    float _240 = 0.0;
    float _242 = 0.0;
    if (!_226)
    {
        _240 = 0.0;
        _242 = 0.0;
    }
    float _244 = _240;
    float _246 = _242;
    bool _248 = _224 > 0.0;
    float _250 = _186 * _216;
    float _252 = 0.0;
    float _254 = _244;
    float _256 = _246;
    if (!_226)
    {
        _252 = 0.0;
    }
    float _258 = _252;
    float _260 = _192 * _216;
    float _262 = fma(_178, _214, _230);
    float _264 = fma(_184, _214, _250);
    float _266 = _222;
    float _268 = _258;
    if (_228)
    {
        float _270 = rsqrt(_208);
        _266 = _270;
    }
    float _272 = _266;
    float _274 = fma(_190, _214, _260);
    float _276 = 0.0;
    if (!_228)
    {
        _276 = 0.0;
    }
    float _278 = _276;
    float _280 = fma(_188, _218, _264);
    float _282 = 0.0;
    float _284 = _278;
    if (!_228)
    {
        _282 = 0.0;
    }
    float _286 = _282;
    float _288 = fma(_182, _218, _262);
    float _290 = 0.0;
    float _292 = _286;
    if (!_228)
    {
        _290 = 0.0;
    }
    float _294 = _290;
    float _296 = 0.0;
    float _298 = 0.0;
    float _300 = _294;
    if (!_248)
    {
        _296 = 0.0;
        _298 = 0.0;
    }
    float _302 = _296;
    float _304 = _298;
    float _306 = 0.0;
    float _308 = _302;
    float _310 = _304;
    if (_248)
    {
        float _312 = rsqrt(_220);
        _306 = _312;
    }
    float _314 = _306;
    if (_226)
    {
        float _316 = _238 * _184;
        _254 = _316;
    }
    float _318 = _254;
    if (_226)
    {
        float _320 = _238 * _178;
        _256 = _320;
    }
    float _322 = _256;
    if (_226)
    {
        float _324 = _238 * _190;
        _268 = _324;
    }
    float _326 = _268;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = fma(_194, _218, _274);
    float _332 = 0.0;
    bool _334 = _328;
    if (!_248)
    {
        _332 = 0.0;
    }
    float _336 = _332;
    float _338 = _336;
    if (_228)
    {
        float _340 = _272 * _186;
        _284 = _340;
    }
    float _342 = _284;
    if (_228)
    {
        float _344 = _272 * _180;
        _292 = _344;
    }
    float _346 = _292;
    float _348 = _346;
    if (_228)
    {
        float _350 = _272 * _192;
        _300 = _350;
    }
    float _352 = _300;
    if (_248)
    {
        float _354 = _314 * _188;
        _308 = _354;
    }
    float _356 = _308;
    if (_248)
    {
        float _358 = _314 * _182;
        _310 = _358;
    }
    float _360 = _310;
    float _362 = _360;
    if (_248)
    {
        float _364 = _314 * _194;
        _338 = _364;
    }
    float _366 = _338;
    bool _368 = !_328;
    float _386;
    if (!_368)
    {
        float _370 = in.m_73.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_122);
        float _392 = 1.0 / _390;
        float _394 = _156 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _400 = int(_398);
    float _402 = in.m_75.x;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    float _408 = in.m_75.y;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _412 = _410 != 0;
    float _414 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _416 = int(_414);
    float _418 = in.m_73.x;
    float _420 = in.m_73.y;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _428 = _426 != 0;
    float _430 = in.m_58.x;
    float _432 = in.m_58.y;
    float _434 = in.m_58.z;
    float _436 = float(_400);
    float _438 = _314;
    if (_406)
    {
        float _440 = in.m_73.x;
        _438 = _440;
    }
    float _442 = _438;
    float _444 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _446 = log2(_444);
    float _448 = in.m_73.w;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _452 = _450 != 0;
    float _454 = _402;
    if (_406)
    {
        float _456 = -_402;
        float _458 = _456 + 1.0;
        _234 = as_type<int>(_458);
    }
    int _460 = _234;
    float _462 = 0.0;
    if (!_406)
    {
        _462 = _402;
    }
    float _464 = _462;
    float _466 = 1.0 / _436;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _468 = -_408;
    float _470 = _468 + 1.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _476 = in.m_73.z;
    bool _478 = _420 > 0.5;
    float _480 = 1.0 / _474;
    float _482 = _180 * _432;
    float _484 = _186 * _432;
    float _486 = _192 * _432;
    int _488 = _478 ? as_type<int>(_470) : as_type<int>(_408);
    float _490 = fma(_178, _430, _482);
    float _492 = _464;
    float _494 = _408;
    if (_406)
    {
        bool _496 = _442 > 0.5;
        _334 = _496;
    }
    bool _498 = _334;
    float _500 = _466 * _156;
    float _502 = in.m_79.x;
    float _504 = in.m_79.y;
    float _506 = in.m_79.z;
    float _508 = fma(_182, _434, _490);
    if (_406)
    {
        float _510 = _498 ? as_type<float>(_460) : _402;
        _492 = _510;
    }
    float _512 = _492;
    float _514 = fma(_184, _430, _484);
    float _516 = float(uint(_416));
    float _518 = trunc(_500);
    int _520 = int(_518);
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _524 = _522 != 0;
    float _526 = fma(_190, _430, _486);
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _530 = _528 != 0;
    float _532 = fma(_188, _434, _514);
    float _534 = fma(_194, _434, _526);
    float _536 = _530 ? as_type<float>(_488) : _408;
    float _538 = 1.0 / _516;
    bool _540 = _448 > 0.5;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _544;
    float _548 = float(_122);
    float _550 = in.m_81.x;
    float _552 = in.m_81.y;
    float _554 = in.m_81.z;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _560 = float(uint(_520));
    float _562 = in.m_83.x;
    float _564 = in.m_83.y;
    float _566 = in.m_83.z;
    bool _568 = _504 != 0.0;
    bool _570 = isnan(_504);
    bool _572 = _568 || _570;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_85.w = _542;
    bool _582 = _502 == 0.0;
    bool _584 = !_576;
    bool _586 = _582 && _584;
    float _588 = 1.0 / _558;
    int _590 = as_type<int>(_538) + (-2);
    float _592 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _506);
    bool _594 = _506 == 0.0;
    bool _596 = _594 && _586;
    float _598 = _420 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _600 = as_type<float>(_590) * _560;
    int _602 = ~_416;
    int _604 = _602 + 1;
    float _606 = 1.0 / _580;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _610 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _612 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _614 = _596;
    if (_428)
    {
        float _616 = _540 ? _470 : _408;
        _494 = _616;
    }
    float _618 = _494;
    float _620 = trunc(_600);
    float _622 = precise::max(_620, 0.0);
    uint _625 = uint(_622);
    float _627 = _546 * _588;
    float _629 = _566;
    float _631 = _564;
    float _633 = _562;
    int _635 = as_type<int>(_588);
    if (!_596)
    {
        float _637 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _566);
        _629 = _637;
    }
    float _639 = _629;
    if (!_596)
    {
        float _641 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _564);
        _631 = _641;
    }
    float _643 = _631;
    if (!_596)
    {
        float _645 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _562);
        _633 = _645;
    }
    float _647 = _633;
    if (_424)
    {
        float _649 = -_402;
        float _651 = _649 + 1.0;
        _635 = as_type<int>(_651);
    }
    int _653 = _635;
    if (_424)
    {
        bool _655 = _476 > 0.5;
        _614 = _655;
    }
    bool _657 = _614;
    float _659 = -_608;
    float _661 = fma(_610, 2.0, _659);
    float _663 = 1.0 / _548;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_424)
    {
        float _667 = _657 ? as_type<float>(_653) : _402;
        _454 = _667;
    }
    float _669 = _454;
    float _671 = _420 + _418;
    bool _673 = !_452;
    float _675 = _673 ? 7.345489978790283203125 : 1.0;
    float _677 = _418 * 2.0;
    float _679 = fma(_598, -2.0, _665);
    int _681 = _604 * int(_625);
    int _683 = _681 + _520;
    float _685 = float(_416);
    float _687 = _671 + (-1.0);
    float _689 = float(_520);
    float _691 = _675 * _418;
    float _693 = float(uint(_683));
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _703 = floor(_677);
    float _705 = as_type<float>(_590) * _693;
    float _707 = _697 * _606;
    float _709 = _685 * _156;
    float _711 = _701 * _480;
    float _713 = _418 + _476;
    float _715 = trunc(_705);
    float _717 = precise::max(_715, 0.0);
    uint _719 = uint(_717);
    float _721 = _709 * _663;
    int _723 = ~_416;
    int _725 = _723 + 1;
    float _727 = _713 + (-1.0);
    bool _729 = _689 >= _685;
    bool _731 = isnan(_689);
    bool _733 = _729 || _731;
    bool _735 = isnan(_685);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _743 = !_524;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _749 = trunc(_721);
    int _751 = int(_749);
    float _753 = _554 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _755 = abs(_745);
    float _757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _504);
    float _759 = -_156;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[76].x, _661);
    float _763 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _679);
    float _765 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _767 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _502);
    int _769 = int(_625) + int(_719);
    float _771 = trunc(_739);
    int _773 = int(_771);
    int _775 = _725 * _769;
    int _777 = _775 + _520;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _793 = _791 != 0;
    float _795 = floor(_691);
    bool _797 = uint(_777) >= uint(_416);
    bool _799 = !_785;
    int _801 = _799 ? 0 : 1;
    bool _803 = !_797;
    int _805 = _803 ? 0 : (-1);
    bool _807 = _416 == 0;
    int _809 = ~_769;
    int _811 = _809 + _805;
    int _813 = _811 + 1;
    float _815 = _420 + _476;
    bool _817 = _703 > 0.0;
    int _819 = _416 * _813;
    int _821 = _819 + _520;
    float _823 = _815 + (-1.0);
    float _825 = -_795;
    float _827 = _691 + _825;
    bool _829 = !_781;
    int _831 = _829 ? 0 : 1;
    bool _833 = _703 >= 0.0;
    bool _835 = isnan(_703);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = _420 * 2.0;
    int _845 = ~_773;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    float _851 = _827 * _685;
    bool _853 = !_807;
    int _855 = _853 ? _821 : (-1);
    float _857 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _859 = abs(_801);
    float _861 = floor(_843);
    bool _863 = !_789;
    int _865 = _863 ? 0 : 1;
    int _867 = _855 * _849;
    int _869 = _416 + (-1);
    bool _871 = !_793;
    int _873 = _871 ? 0 : 1;
    int _875 = abs(_831);
    float _877 = trunc(_851);
    int _879 = int(_877);
    int _881 = _773 * _869;
    int _883 = _881 + _867;
    float _885 = _476 * 2.0;
    int _887 = _841 ? 0 : 1;
    int _889 = _883 * _859;
    int _891 = abs(_865);
    float _893 = floor(_885);
    bool _895 = _861 > 0.0;
    int _897 = _751 * _875;
    int _899 = _897 + _889;
    int _901 = abs(_873);
    bool _903 = _861 >= 0.0;
    bool _905 = isnan(_861);
    bool _907 = _903 || _905;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    int _913 = _879 * _755;
    int _915 = _913 + _520;
    float _917 = _911 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _919 = ~_887;
    int _921 = _919 + 1;
    int _923 = _921 + 1;
    int _925 = _915 * _891;
    int _927 = _925 + _899;
    int _929 = ~as_type<int>(_917);
    int _931 = _929 + 1;
    int _933 = _931 + 1;
    int _935 = _933;
    int _937 = _923;
    float _939 = as_type<float>(_901);
    float _941 = as_type<float>(_899);
    float _943 = _917;
    if (!_895)
    {
        int _945 = ~as_type<int>(_917);
        int _947 = _945 + 1;
        _935 = _947;
    }
    int _949 = _935;
    int _951 = _879 * _901;
    int _953 = _951 + _927;
    bool _955 = _893 >= 0.0;
    bool _957 = isnan(_893);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    float _965 = _753 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_817)
    {
        int _967 = ~_887;
        int _969 = _967 + 1;
        _937 = _969;
    }
    int _971 = _937;
    float _973 = float(uint(_953));
    float _975 = in.m_67.w;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _987 = _985 != 0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _991 = _396 + _989;
    int _993 = _963 ? 0 : 1;
    float _995 = as_type<float>(_590) * _973;
    bool _997 = _893 > 0.0;
    float _999 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1001 = fma(_707, _991, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1003 = _965 * _592;
    float _1005 = trunc(_995);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    float _1011 = _999 * _757;
    float _1013 = in.m_65.w;
    int _1015 = ~_416;
    int _1017 = _1015 + 1;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1021 = _396 + _1019;
    float _1023 = in.m_69.w;
    if (!_452)
    {
        _939 = _476;
    }
    float _1025 = _939;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1029 = _396 + _1027;
    float _1031 = _1025;
    if (_452)
    {
        _1031 = _420;
    }
    float _1033 = _1031;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1037 = fma(_627, _1021, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1039 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1041 = isnan(_396);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1047 = _1043 || _1045;
    float _1049 = float(_1047);
    float _1051 = fma(_711, _1029, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1053 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1055 = isnan(_396);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1035);
    int _1067 = _1017 * int(_1009);
    int _1069 = _1067 + _953;
    float _1071 = -_1049;
    float _1073 = _1071 + 1.0;
    bool _1075 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1077 = isnan(_396);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = -_1063;
    float _1089 = _1087 + 1.0;
    float _1091 = _532 + _975;
    float _1093 = float(uint(_1069));
    float _1095 = _1063 * _1073;
    bool _1097 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1099 = isnan(_396);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = _1085 * _1089;
    float _1111 = -_1085;
    float _1113 = _1111 + 1.0;
    float _1115 = as_type<float>(_590) * _1093;
    float _1117 = _508 + _1013;
    float _1119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1121 = _534 + _1023;
    float _1123 = _446 * _156;
    if (!_452)
    {
        _941 = _420;
    }
    float _1125 = _941;
    float _1127 = _1107 * _1113;
    float _1129 = _1125;
    if (_452)
    {
        _1129 = _418;
    }
    float _1131 = _1129;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1135 = trunc(_1115);
    float _1137 = precise::max(_1135, 0.0);
    uint _1139 = uint(_1137);
    float _1141 = _1001 * _1127;
    float _1143 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1133);
    float _1145 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1149 = _1091 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _1151 = ~_993;
    int _1153 = _1151 + 1;
    int _1155 = _1153 + 1;
    float _1157 = exp2(_1123);
    float _1159 = -_1147;
    float _1161 = fma(_1145, 2.0, _1159);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1165 = 1.0 + _1163;
    float _1167 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1169 = _1155;
    if (!_997)
    {
        int _1171 = ~_993;
        int _1173 = _1171 + 1;
        _1169 = _1173;
    }
    int _1175 = _1169;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1179 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1181 = isnan(0.0);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1187 = _1183 || _1185;
    float _1189 = fma(_1167, _618, -0.5);
    int _1191 = int(_1009) + int(_1139);
    float _1193 = 1.0 / _1165;
    float _1195 = -_1107;
    float _1197 = _1195 + 1.0;
    if (!_452)
    {
        _943 = _476;
    }
    float _1199 = _943;
    float _1201 = _1199;
    if (_452)
    {
        _1201 = _420;
    }
    float _1203 = _1201;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1207 = -_1157;
    float _1209 = _1207 + 1.0;
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _1213 = ~_416;
    int _1215 = _1213 + 1;
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1219 = _1187 ? _1209 : 0.0;
    float _1221 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1205);
    bool _1223 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1225 = isnan(1.0);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1231 = _1227 || _1229;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1235 = float(uint(_915));
    float _1237 = fma(_1217, -2.0, _1177);
    float _1239 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1233);
    float _1241 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1065);
    float _1243 = as_type<float>(_590) * _1235;
    float _1245 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1221);
    int _1247 = _1215 * _1191;
    int _1249 = _1247 + _953;
    float _1251 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1239);
    float _1253 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1143);
    float _1255 = -_156;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1161);
    float _1259 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1237);
    if (_1231)
    {
        float _1261 = _1219 * _1193;
        _158 = _1261;
    }
    float _1263 = _158;
    bool _1265 = uint(_1249) >= uint(_416);
    float _1267 = trunc(_1243);
    float _1269 = precise::max(_1267, 0.0);
    uint _1271 = uint(_1269);
    float _1273 = _1117 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _1275 = !_987;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1141);
    bool _1281 = !_1265;
    int _1283 = _1281 ? 0 : (-1);
    float _1285 = _1273 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1287 = _1273 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1289 = _1273 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _1291 = ~_1191;
    int _1293 = _1291 + _1283;
    int _1295 = _1293 + 1;
    float _1297 = fma(_1149, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1285);
    float _1299 = fma(_1149, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1287);
    float _1301 = fma(_1149, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1289);
    int _1303 = abs(_1277);
    float _1305 = in.m_87.x;
    float _1307 = in.m_87.y;
    float _1309 = in.m_87.z;
    int _1311 = ~_416;
    int _1313 = _1311 + 1;
    int _1315 = _416 * _1295;
    int _1317 = _1315 + _953;
    bool _1319 = !_979;
    int _1321 = _1319 ? 0 : 1;
    float _1323 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1325 = float(_949);
    int _1327 = _1313 * int(_1271);
    int _1329 = _1327 + _915;
    float _1331 = float(_1303);
    float _1333 = _1121 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    bool _1335 = !_807;
    int _1337 = _1335 ? _1317 : (-1);
    float _1339 = -_1259;
    float _1341 = fma(_1241, _1189, _1339);
    bool _1343 = !_983;
    int _1345 = _1343 ? 0 : 1;
    float _1347 = _1331 * _1325;
    int _1349 = abs(_1321);
    float _1351 = fma(_1333, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1297);
    float _1353 = float(uint(_1329));
    float _1355 = fma(_1333, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1299);
    int _1357 = _1337 >> 31;
    float _1359 = fma(_1333, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1301);
    int _1361 = abs(_1345);
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1365 = float(_1349);
    float _1367 = as_type<float>(_590) * _1353;
    float _1369 = float(_1175);
    float _1371 = _1351 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    int _1373 = _1357 & 3;
    float _1375 = _476 + (-0.5);
    float _1377 = float(_971);
    float _1379 = _1365 * _1369;
    float _1381 = float(_1361);
    float _1383 = trunc(_1367);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    int _1389 = _1337 + _1373;
    float _1391 = _1379 * (-2.0);
    int _1393 = _1337 & 3;
    bool _1395 = _1393 != 0;
    float _1397 = _1381 * _1377;
    int _1399 = _1389 >> 2;
    float _1401 = fma(_741, _1391, _741);
    float _1403 = fma(_1391, _1305, _1305);
    float _1405 = _1397 * (-2.0);
    float _1407 = _1347 * (-2.0);
    int _1409 = _1399 << 4;
    int _1411 = _1409 + 368;
    float _1413 = _1355 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1415 = fma(_857, _1405, _857);
    float _1417 = fma(_1405, _1307, _1307);
    float _1419 = fma(_747, _1407, _747);
    float _1421 = _1359 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    uint _1423 = uint(int(uint(_1411) >> uint(2)));
    uint _1425 = uint(int(uint(int(_1423)) >> uint(2)));
    int _1427 = int(_1423) & 3;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[int(_1425)][_1427];
    int _1431 = int(_1423) + 1;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    int _1435 = _1431 & 3;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[int(_1433)][_1435];
    float _1439 = _418 + (-0.5);
    float _1441 = _1371 * _1323;
    float _1443 = _1421 * _1363;
    float _1445 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1447 = int(_1445);
    float _1449 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1403);
    int _1451 = _1337 & 3;
    bool _1453 = _1451 != 0;
    float _1455 = fma(_1407, _1309, _1309);
    int _1457 = _1411 + 8;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[int(_1469)][_1471];
    int _1475 = int(_1271) + int(_1387);
    float _1477 = _420 + (-0.5);
    bool _1479 = uint(_1451) > 1u;
    float _1481 = _1413 * _1211;
    int _1483 = ~_416;
    int _1485 = _1483 + 1;
    float _1487 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1417);
    int _1489 = _1395 ? 0 : 1;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1493 = _1451 != 3;
    int _1495 = _1485 * _1475;
    int _1497 = _1495 + _915;
    float _1499 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1455);
    int _1501 = abs(_1447);
    float _1503 = fma(_1415, _1263, _1487);
    int _1505 = ~_1489;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    float _1511 = fma(_1401, _1263, _1449);
    int _1513 = _1509;
    if (!_1479)
    {
        int _1515 = ~_1489;
        int _1517 = _1515 + 1;
        _1513 = _1517;
    }
    int _1519 = _1513;
    float _1521 = fma(_1443, 0.5, 0.5);
    bool _1523 = uint(_1451) >= 2u;
    float _1525 = fma(_1481, 0.5, 0.5);
    float _1527 = float(uint(_1501));
    float _1529 = fma(_1441, 0.5, 0.5);
    int _1531 = _1523 ? 0 : 1;
    float _1533 = 1.0 / _1527;
    bool _1535 = uint(_1497) >= uint(_416);
    float _1537 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1539 = _1451 != 3;
    int _1541 = ~_1531;
    int _1543 = _1541 + 1;
    int _1545 = _1543 + 1;
    bool _1547 = !_1453;
    int _1549 = _1547 ? 0 : 1;
    float _1551 = floor(_1529);
    int _1553 = abs(_1519);
    int _1555 = _1545;
    if (_1493)
    {
        int _1557 = ~_1531;
        int _1559 = _1557 + 1;
        _1555 = _1559;
    }
    int _1561 = _1555;
    int _1563 = ~_1553;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = abs(_1549);
    float _1571 = _1503 * 0.15915493667125701904296875;
    int _1573 = abs(_1561);
    int _1575 = _1567 * as_type<int>(_1437);
    int _1577 = ~_1569;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = floor(_1521);
    bool _1585 = !_1539;
    int _1587 = _1585 ? 0 : (-1);
    int _1589 = _1581 * as_type<int>(_1429);
    int _1591 = _1589 + _1575;
    bool _1593 = !_1535;
    int _1595 = _1593 ? 0 : (-1);
    float _1597 = -_1551;
    float _1599 = _1529 + _1597;
    bool _1601 = !_412;
    int _1603 = _1601 ? 0 : 1;
    float _1605 = _1571 * 6.283185482025146484375;
    float _1607 = sin(_1605);
    int _1609 = abs(_1587);
    float _1611 = fma(_1599, 2.0, -1.0);
    int _1613 = ~_1573;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    float _1619 = float(uint(_1447));
    int _1621 = ~_1475;
    int _1623 = _1621 + _1595;
    int _1625 = _1623 + 1;
    int _1627 = _1617 * as_type<int>(_1465);
    int _1629 = _1627 + _1591;
    int _1631 = abs(_1603);
    float _1633 = _1571 * 6.283185482025146484375;
    float _1635 = cos(_1633);
    int _1637 = ~_1609;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    int _1643 = _416 * _1625;
    int _1645 = _1643 + _915;
    int _1647 = ~_1631;
    int _1649 = _1647 + 1;
    int _1651 = _1649 + 1;
    float _1653 = fma(_1419, _1263, _1499);
    int _1655 = as_type<int>(_1533) + (-2);
    int _1657 = _1641 * as_type<int>(_1473);
    int _1659 = _1657 + _1629;
    bool _1661 = !_807;
    int _1663 = _1661 ? _1645 : (-1);
    float _1665 = 1.0 / _1619;
    float _1667 = fma(_1051, _1109, _1279);
    int _1669 = _1659 * _1651;
    float _1671 = fma(_1537, _669, -0.5);
    float _1673 = _1511 * 0.15915493667125701904296875;
    float _1675 = fma(_1037, _1095, _1667);
    int _1677 = _1663 * _1631;
    int _1679 = _1677 + _1669;
    float _1681 = _1653 * 0.15915493667125701904296875;
    int _1683 = ~_1447;
    int _1685 = _1683 + 1;
    float _1687 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1675);
    float _1689 = _1673 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    int _1693 = abs(_1679);
    float _1695 = fma(_1253, _1671, _1257);
    float _1697 = float(uint(_1679));
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1701 = as_type<int>(_1665) + (-2);
    float _1703 = _1681 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    float _1707 = as_type<float>(_1701) * _1697;
    float _1709 = float(uint(_1693));
    int _1711 = ~_1501;
    int _1713 = _1711 + 1;
    float _1715 = trunc(_1707);
    float _1717 = precise::max(_1715, 0.0);
    uint _1719 = uint(_1717);
    float _1721 = as_type<float>(_1655) * _1709;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1729 = _1723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1731 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1733 = trunc(_1721);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1741 = _1691 * _1607;
    bool _1743 = _1447 == 0;
    out.m_89.x = _1729;
    out.m_89.y = _1739;
    out.m_89.z = _1731;
    out.m_89.w = _1699;
    float _1745 = _1673 * 6.283185482025146484375;
    float _1747 = cos(_1745);
    int _1749 = _1685 * int(_1719);
    int _1751 = _1749 + _1679;
    float _1753 = _1635 * _1705;
    float _1755 = float(uint(_1751));
    float _1757 = -_1583;
    float _1759 = _1521 + _1757;
    float _1761 = _1681 * 6.283185482025146484375;
    float _1763 = sin(_1761);
    int _1765 = _1713 * int(_1737);
    int _1767 = _1765 + _1693;
    float _1769 = as_type<float>(_1701) * _1755;
    float _1771 = _1691 * _1635;
    float _1773 = _1691 * _1705;
    int _1775 = ~_1447;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1759, 2.0, -1.0);
    float _1781 = _1747 * _1635;
    float _1783 = float(uint(_1767));
    float _1785 = trunc(_1769);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    float _1791 = _1747 * _1607;
    float _1793 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1795 = _1747 * _1705;
    float _1797 = as_type<float>(_1655) * _1783;
    int _1799 = _1679 ^ _1447;
    float _1801 = fma(_1763, _1781, _1741);
    float _1803 = fma(_1763, _1741, _1781);
    float _1805 = floor(_1525);
    float _1807 = _1793 * _767;
    float _1809 = -_1011;
    float _1811 = _1763 * _1809;
    float _1813 = -_643;
    float _1815 = _1763 * _1813;
    float _1817 = _1607 * _1705;
    float _1819 = fma(_1753, _1807, _1811);
    float _1821 = fma(_1753, _647, _1815);
    float _1823 = trunc(_1797);
    float _1825 = precise::max(_1823, 0.0);
    uint _1827 = uint(_1825);
    int _1829 = int(_1719) + int(_1789);
    float _1831 = _1795 * _1011;
    float _1833 = _1773 * _1011;
    float _1835 = _1795 * _643;
    float _1837 = _1773 * _643;
    int _1839 = _1777 * _1829;
    int _1841 = _1839 + _1679;
    float _1843 = fma(_1801, _1807, _1831);
    float _1845 = -_1805;
    float _1847 = _1525 + _1845;
    float _1849 = -_1791;
    float _1851 = fma(_1763, _1771, _1849);
    float _1853 = -_1771;
    float _1855 = fma(_1763, _1791, _1853);
    int _1857 = ~_1501;
    int _1859 = _1857 + 1;
    bool _1861 = uint(_1841) >= uint(_1447);
    float _1863 = fma(_1851, _1807, _1833);
    float _1865 = fma(_1851, _647, _1837);
    int _1867 = int(_1737) + int(_1827);
    float _1869 = fma(_1801, _647, _1835);
    bool _1871 = !_1861;
    int _1873 = _1871 ? 0 : (-1);
    float _1875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1877 = uint(int(uint(_1799) >> uint(31)));
    int _1879 = _1859 * _1867;
    int _1881 = _1879 + _1693;
    int _1883 = ~_1829;
    int _1885 = _1883 + _1873;
    int _1887 = _1885 + 1;
    float _1889 = fma(_1817, _1003, _1819);
    float _1891 = fma(_1847, 2.0, -1.0);
    int _1893 = ~int(_1877);
    int _1895 = _1893 + 1;
    float _1897 = fma(_1855, _1003, _1843);
    bool _1899 = uint(_1881) >= uint(_1501);
    int _1901 = _1447 * _1887;
    int _1903 = _1901 + _1679;
    float _1905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1907 = _1891 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1909 = !_1899;
    int _1911 = _1909 ? 0 : (-1);
    float _1913 = fma(_1855, _639, _1869);
    bool _1915 = _1447 == 0;
    float _1917 = _1907 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    int _1919 = ~_1911;
    int _1921 = _1867 + _1919;
    int _1923 = _1921 + 1;
    float _1925 = _1907 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1927 = _1907 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    bool _1929 = !_1915;
    int _1931 = _1929 ? _1903 : (-1);
    float _1933 = _1875 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1935 = _1923 ^ _1895;
    float _1937 = fma(_1817, _639, _1821);
    float _1939 = float(_1931);
    float _1941 = fma(_1803, _1003, _1863);
    int _1943 = ~_1895;
    int _1945 = _1943 + _1935;
    int _1947 = _1945 + 1;
    float _1949 = fma(_1803, _639, _1865);
    float _1951 = _1905 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1953 = fma(_1933, _512, -0.5);
    bool _1955 = !_1743;
    int _1957 = _1955 ? _1947 : (-1);
    float _1959 = fma(_1933, _1939, _761);
    float _1961 = _1913 * _342;
    float _1963 = _1913 * _346;
    float _1965 = float(_1957);
    float _1967 = _1913 * _352;
    float _1969 = fma(_1951, _536, -0.5);
    float _1971 = fma(_1937, _318, _1961);
    float _1973 = fma(_1937, _322, _1963);
    float _1975 = -_763;
    float _1977 = fma(_1951, _1965, _1975);
    float _1979 = fma(_1937, _326, _1967);
    float _1981 = fma(_1949, _356, _1971);
    float _1983 = _1611 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1985 = fma(_1251, _1969, _1977);
    float _1987 = fma(_1949, _360, _1973);
    float _1989 = fma(_1949, _366, _1979);
    bool _1991 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1993 = isnan(1.0);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1999 = _1995 || _1997;
    float _2001 = _1985 + 0.5;
    float _2003 = fma(_1245, _1953, _1959);
    float _2005 = _1897 * _342;
    out.m_91.x = _1981;
    out.m_91.y = _1987;
    out.m_91.z = _1989;
    float _2007 = _1897 * _346;
    float _2009 = fma(_1983, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1925);
    float _2011 = fma(_1983, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1917);
    float _2013 = _1695 + 0.5;
    float _2015 = _1897 * _352;
    float _2017 = fma(_1983, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1927);
    float _2019 = _1779 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2021 = _1341 + 0.5;
    float _2023 = _2003 + 0.5;
    float _2025 = fma(_1889, _326, _2015);
    float _2027 = fma(_1889, _318, _2005);
    float _2029 = fma(_1889, _322, _2007);
    float _2031 = fma(_2019, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2009);
    float _2033 = fma(_2019, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2011);
    float _2035 = fma(_2019, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2017);
    out.m_93.x = _2023;
    out.m_93.y = _2001;
    out.m_93.z = _2013;
    out.m_93.w = _2021;
    float _2037 = fma(_1941, _366, _2025);
    float _2039 = fma(_1941, _356, _2027);
    float _2041 = fma(_1941, _360, _2029);
    float _2043 = _2031 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2045 = _2035 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2047 = _2039 + _2043;
    float _2049 = _2037 + _2045;
    float _2051 = _2033 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2053 = _2041 + _2051;
    float _2055 = _2037;
    float _2057 = _2041;
    float _2059 = _1611;
    float _2061 = _1891;
    float _2063 = _2001;
    float _2065 = _1779;
    float _2067 = _2023;
    float _2069 = as_type<float>(_1903);
    float _2079;
    float _2081;
    float _2083;
    float _2085;
    if (!_1999)
    {
        bool _2071 = _2051 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2073 = !_2071;
        _2075 = _2073;
        if (!_2075)
        {
            float _2077 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2079 = _2077;
            _2081 = 0.0;
            _2083 = 0.0;
            _2085 = 0.0;
            _2087 = true;
        }
    }
    if ((!_2087) || _2075)
    {
        bool _2125;
        if (!_2075)
        {
            bool _2089 = _2051 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2091 = isnan(_2051);
            bool _2093 = _2089 || _2091;
            bool _2095 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2097 = _2093 || _2095;
            bool _2099 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2101 = !_2097;
            bool _2103 = _2099 && _2101;
            bool _2105 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2107 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2103)
            {
                _362 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2109 = _362;
            float _2111 = _2109;
            if (_2103)
            {
                _2055 = 0.0;
            }
            float _2113 = _2055;
            _2081 = _2113;
            if (_2103)
            {
                _348 = 0.0;
            }
            float _2115 = _348;
            _2083 = _2115;
            if (_2103)
            {
                float _2117 = _2109 * 5.0;
                _2111 = _2117;
            }
            float _2119 = _2111;
            _2079 = _2119;
            if (_2103)
            {
                _2107 = 0.0;
            }
            float _2121 = _2107;
            bool _2123 = !_2097;
            _2125 = _2123 && _2105;
            _2057 = _2121;
            _2085 = _2121;
        }
        if ((!_2125) || _2075)
        {
            _2075 = false;
            float _2127 = _2057;
            bool _2129 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2131 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2133 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2135 = _2039;
            float _2137 = _2127;
            _2079 = _2049;
            _2081 = _2047;
            _2083 = _2053;
            if (_2129)
            {
                float _2139 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2135 = _2139;
            }
            float _2141 = _2135;
            if (_2129)
            {
                float _2143 = abs(_1611);
                float _2145 = -_2143;
                float _2147 = _2145 + 1.0;
                _2059 = _2147;
            }
            float _2149 = _2059;
            if (_2131)
            {
                float _2151 = abs(_1891);
                float _2153 = -_2151;
                float _2155 = _2153 + 1.0;
                _2061 = _2155;
            }
            float _2157 = _2061;
            if (!_2129)
            {
                _2063 = 1.0;
            }
            float _2159 = _2063;
            float _2161 = _2159;
            if (_2133)
            {
                float _2163 = abs(_1779);
                float _2165 = -_2163;
                float _2167 = _2165 + 1.0;
                _2065 = _2167;
            }
            float _2169 = _2065;
            if (!_2131)
            {
                _2067 = 1.0;
            }
            float _2171 = _2067;
            float _2173 = _2171;
            if (!_2133)
            {
                _2137 = 1.0;
            }
            float _2175 = _2137;
            float _2177 = _2021;
            float _2179 = _2175;
            if (_2131)
            {
                float _2181 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2177 = _2181;
            }
            float _2183 = _2177;
            float _2185 = _1341;
            if (_2133)
            {
                float _2187 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2185 = _2187;
            }
            float _2189 = _2185;
            if (_2129)
            {
                float _2191 = _2149 * _2141;
                float _2193 = precise::clamp(_2191, 0.0, 1.0);
                _2161 = _2193;
            }
            float _2195 = _2161;
            if (_2131)
            {
                float _2197 = _2157 * _2183;
                float _2199 = precise::clamp(_2197, 0.0, 1.0);
                _2173 = _2199;
            }
            float _2201 = _2173;
            float _2203 = _2195 * _2201;
            if (_2133)
            {
                float _2205 = _2169 * _2189;
                float _2207 = precise::clamp(_2205, 0.0, 1.0);
                _2179 = _2207;
            }
            float _2209 = _2179;
            float _2211 = _2203 * _2209;
            _2085 = _2211;
        }
    }
    _2087 = false;
    float _2213 = _2079;
    float _2215 = _2081;
    float _2217 = _2083;
    float _2219 = _2085;
    float _2221 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2223 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2225 = floor(_2221);
    float _2227 = floor(_2223);
    float _2229 = -_2225;
    float _2231 = _2221 + _2229;
    float _2233 = -_2227;
    float _2235 = _2223 + _2233;
    float2 _7161 = float2(_2231, _2235);
    float _2237 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7161, float2(0.0), isnan(_7161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7161, float2(0.0), isnan(_7161)), level(0.0)).x;
    float _2239 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2243 = _2213 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2247 = _2215 + _2245;
    float _2249 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2239);
    float _2251 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2249);
    float _2253 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2255 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2257 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2253);
    float _2259 = 1.0 / _2255;
    float _2261 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2257);
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2265 = _2263 + _2255;
    float _2267 = _2265 * _2259;
    float _2269 = _2267 * 0.5;
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2273 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2271);
    float _2275 = 1.0 / _2273;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2279 = _2275 * _2277;
    float _2281 = _2243 * _2243;
    bool _2283 = _2279 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2285 = fma(_2247, _2247, _2281);
    bool _2287 = _2279 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2289 = !_2283;
    int _2291 = _2289 ? 0 : 1;
    float _2293 = sqrt(_2285);
    int _2295 = 2;
    float _2297 = _2217;
    float _2299 = _2215;
    float _2301 = _2213;
    float _2303 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    if (!_2283)
    {
        _2295 = 1;
    }
    int _2305 = _2295;
    int _2307 = _2305;
    if (!_2287)
    {
        _2307 = _2291;
    }
    int _2309 = _2307;
    float _2311 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _2313 = _2309 << 6;
    float _2315 = _2051 + _2311;
    bool _2317 = _2293 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2319 = _2313 + 48;
    uint _2321 = uint(int(uint(_2319) >> uint(2)));
    uint _2323 = uint(int(uint(int(_2321)) >> uint(2)));
    int _2325 = int(_2321) & 3;
    float _2327 = (*spvDescriptorSet0.vp_c15)._m0[int(_2323)][_2325];
    int _2329 = int(_2321) + 1;
    uint _2331 = uint(int(uint(_2329) >> uint(2)));
    int _2333 = _2329 & 3;
    float _2335 = (*spvDescriptorSet0.vp_c15)._m0[int(_2331)][_2333];
    float _2337 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2339 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2341 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2337);
    float _2343 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2339);
    int _2345 = _2313 + 56;
    uint _2347 = uint(int(uint(_2345) >> uint(2)));
    uint _2349 = uint(int(uint(int(_2347)) >> uint(2)));
    int _2351 = int(_2347) & 3;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[int(_2349)][_2351];
    int _2355 = int(_2347) + 1;
    uint _2357 = uint(int(uint(_2355) >> uint(2)));
    int _2359 = _2355 & 3;
    float _2361 = (*spvDescriptorSet0.vp_c15)._m0[int(_2357)][_2359];
    float _2363 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2341);
    float _2365 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2343);
    float _2367 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2369 = _2365 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2371 = _2313 + 64;
    uint _2373 = uint(int(uint(_2371) >> uint(2)));
    uint _2375 = uint(int(uint(int(_2373)) >> uint(2)));
    int _2377 = int(_2373) & 3;
    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[int(_2375)][_2377];
    int _2381 = int(_2373) + 1;
    uint _2383 = uint(int(uint(_2381) >> uint(2)));
    int _2385 = _2381 & 3;
    float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
    float _2389 = trunc(_2367);
    int _2391 = int(_2389);
    int _2393 = _2313 + 72;
    uint _2395 = uint(int(uint(_2393) >> uint(2)));
    uint _2397 = uint(int(uint(int(_2395)) >> uint(2)));
    int _2399 = int(_2395) & 3;
    float _2401 = (*spvDescriptorSet0.vp_c15)._m0[int(_2397)][_2399];
    int _2403 = int(_2395) + 1;
    uint _2405 = uint(int(uint(_2403) >> uint(2)));
    int _2407 = _2403 & 3;
    float _2409 = (*spvDescriptorSet0.vp_c15)._m0[int(_2405)][_2407];
    float _2411 = trunc(_2369);
    int _2413 = int(_2411);
    int _2415 = _2313 + 96;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    uint _2419 = uint(int(uint(int(_2417)) >> uint(2)));
    int _2421 = int(_2417) & 3;
    float _2423 = (*spvDescriptorSet0.vp_c15)._m0[int(_2419)][_2421];
    int _2425 = int(_2417) + 1;
    uint _2427 = uint(int(uint(_2425) >> uint(2)));
    int _2429 = _2425 & 3;
    float _2431 = (*spvDescriptorSet0.vp_c15)._m0[int(_2427)][_2429];
    int _2433 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2435 = _2391 + _2433;
    int _2437 = _2435 + 1;
    int _2439 = _2313 + 104;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    uint _2443 = uint(int(uint(int(_2441)) >> uint(2)));
    int _2445 = int(_2441) & 3;
    float _2447 = (*spvDescriptorSet0.vp_c15)._m0[int(_2443)][_2445];
    int _2449 = int(_2441) + 1;
    uint _2451 = uint(int(uint(_2449) >> uint(2)));
    int _2453 = _2449 & 3;
    float _2455 = (*spvDescriptorSet0.vp_c15)._m0[int(_2451)][_2453];
    bool _2457 = !_2317;
    int _2459 = as_type<int>(_2335);
    float _2461 = _2401;
    float _2463 = _2409;
    float _2465 = as_type<float>(_2309);
    float _2467 = as_type<float>(_2437);
    if (!_2457)
    {
        float _2469 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2473 = _2293 + _2471;
        float _2475 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2477 = rsqrt(_2285);
        float _2479 = _2473 * _2469;
        float _2481 = _2479 * 0.15915493667125701904296875;
        float _2483 = _2481 * 6.283185482025146484375;
        float _2485 = cos(_2483);
        float _2487 = _2481 * 6.283185482025146484375;
        float _2489 = sin(_2487);
        float _2491 = _2485 + (-1.0);
        float _2493 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2495 = fma(_2489, _2475, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2497 = fma(_2485, _2217, _2493);
        float _2499 = _2477 * _2495;
        float _2501 = fma(_2247, _2499, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2503 = fma(_2243, _2499, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2297 = _2497;
        _2299 = _2501;
        _2301 = _2503;
    }
    float _2505 = _2297;
    float _2507 = _2299;
    float _2509 = _2301;
    float _2511 = -_2051;
    float _2513 = _2511 + _2505;
    int _2515 = _2313 + 80;
    uint _2517 = uint(int(uint(_2515) >> uint(2)));
    uint _2519 = uint(int(uint(int(_2517)) >> uint(2)));
    int _2521 = int(_2517) & 3;
    float _2523 = (*spvDescriptorSet0.vp_c15)._m0[int(_2519)][_2521];
    int _2525 = int(_2517) + 1;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    int _2529 = _2525 & 3;
    float _2531 = (*spvDescriptorSet0.vp_c15)._m0[int(_2527)][_2529];
    float _2533 = -_2043;
    float _2535 = _2533 + _2507;
    int _2537 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2539 = _2413 + _2537;
    int _2541 = _2539 + 1;
    float _2543 = _2513 * _2513;
    float _2545 = -_2045;
    float _2547 = _2545 + _2509;
    bool _2549 = _2437 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2551 = fma(_2535, _2535, _2543);
    int _2553 = _2437 | _2541;
    float _2555 = _2315 * _2431;
    bool _2557 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2559 = isnan(0.5);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2565 = _2561 || _2563;
    float _2567 = fma(_2547, _2547, _2551);
    bool _2569 = _2553 < 0;
    bool _2571 = _2569 || _2549;
    float _2573 = fma(_2043, _2423, _2555);
    float _2575 = _2315 * _2335;
    float _2577 = sqrt(_2567);
    bool _2579 = _2541 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2581 = _2579 || _2571;
    float _2583 = fma(_2045, _2447, _2573);
    float _2585 = fma(_2043, _2327, _2575);
    float _2587 = _2583 + _2455;
    float _2589 = fma(_2045, _2353, _2585);
    float _2591 = 1.0 / _2587;
    int _2593 = as_type<int>(_2555);
    int _2595 = as_type<int>(_2583);
    float _2597 = _2507;
    float _2599 = _2509;
    float _2601 = _2505;
    if (!_2581)
    {
        int _2603 = _2541 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2605 = _2603 + _2437;
        _2593 = _2605;
    }
    int _2607 = _2593;
    bool _2609 = _2577 > 0.0;
    float _2611 = _2315 * _2387;
    float _2613 = as_type<float>(_2607);
    if (!_2581)
    {
        int _2615 = _2607 << 2;
        _2595 = _2615;
    }
    int _2617 = _2595;
    float _2619 = _2447;
    int _2621 = _2617;
    if (!_2581)
    {
        float _2623 = floor(_2367);
        _2619 = _2623;
    }
    float _2625 = _2619;
    float _2627 = fma(_2043, _2379, _2611);
    float _2629 = _2627;
    if (!_2581)
    {
        uint _2631 = uint(int(uint(_2607) >> uint(2)));
        _2459 = int(_2631);
    }
    int _2633 = _2459;
    int _2635 = _2633;
    if (!_2581)
    {
        int _2637 = 12 & _2617;
        _2621 = _2637;
    }
    int _2639 = _2621;
    float _2641 = fma(_2045, _2401, _2627);
    float _2643 = as_type<float>(_2639);
    if (!_2581)
    {
        int _2645 = _2633 << 4;
        int _2647 = _2645 + _2639;
        _2635 = _2647;
    }
    int _2649 = _2635;
    if (!_2609)
    {
        _2629 = _2505;
    }
    float _2651 = _2629;
    float _2653 = _2651;
    float _2655 = _2651;
    if (!_2609)
    {
        _2461 = _2509;
    }
    float _2657 = _2461;
    bool _2659 = !_2609;
    float _2661 = _2657;
    if (!_2659)
    {
        float _2663 = _288 * _288;
        float _2665 = fma(_280, _280, _2663);
        float _2667 = fma(_330, _330, _2665);
        float _2669 = rsqrt(_2567);
        float _2671 = sqrt(_2667);
        float _2673 = _2535 * _2669;
        float _2675 = _2513 * _2669;
        float _2677 = _2547 * _2669;
        bool _2679 = _2671 > 0.0;
        float _2681 = _2669;
        _2643 = _2673;
        if (!_2679)
        {
            _2653 = _2505;
        }
        float _2683 = _2653;
        _2655 = _2683;
        if (!_2679)
        {
            _2681 = _2509;
        }
        float _2685 = _2681;
        bool _2687 = !_2679;
        _2661 = _2685;
        if (!_2687)
        {
            float _2689 = rsqrt(_2667);
            float _2691 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2693 = _288 * _2689;
            float _2695 = _280 * _2689;
            float _2697 = _2675 * _2693;
            float _2699 = _330 * _2689;
            float _2701 = fma(_2673, _2695, _2697);
            float _2703 = _2691 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2705 = fma(_2677, _2699, _2701);
            float _2707 = _2705 * _2703;
            float _2709 = fma(_280, _2707, _2507);
            float _2711 = fma(_288, _2707, _2505);
            float _2713 = fma(_330, _2707, _2509);
            _2655 = _2711;
            _2661 = _2713;
            _2597 = _2709;
        }
    }
    float _2715 = _2655;
    float _2717 = _2661;
    float _2719 = _2597;
    float _2721 = _2643;
    float _2723 = _2589 + _2361;
    float _2725 = _2641 + _2409;
    float _2727 = _2719;
    if (_2565)
    {
        _2599 = _2715;
    }
    float _2729 = _2599;
    float _2731 = _2729;
    if (_2565)
    {
        _2601 = _2717;
    }
    float _2733 = _2601;
    float _2735 = _2733;
    if (!_2565)
    {
        float _2737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2739 = _2051 + _2737;
        float _2741 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2743 = _2043 + _2741;
        float _2745 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2747 = -_2043;
        float _2749 = _2747 + _2719;
        float _2751 = _2739 * _2739;
        float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2755 = _2045 + _2753;
        float _2757 = -_2051;
        float _2759 = _2757 + _2715;
        float _2761 = -_2045;
        float _2763 = _2761 + _2717;
        float _2765 = fma(_2743, _2743, _2751);
        float _2767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2769 = fma(_2755, _2755, _2765);
        float _2771 = sqrt(_2769);
        float _2773 = _2745 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2775 = precise::min(_2771, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2777 = _2775 * _2767;
        float _2779 = _2773 * _2777;
        float _2781 = fma(_2749, _2779, _2043);
        float _2783 = fma(_2759, _2779, _2051);
        float _2785 = fma(_2763, _2779, _2045);
        _2731 = _2783;
        _2727 = _2781;
        _2735 = _2785;
        _2463 = _2771;
    }
    float _2787 = _2731;
    float _2789 = _2727;
    float _2791 = _2735;
    float _2793 = _2463;
    float _2795 = _2721;
    if (!_2581)
    {
        int _2797 = _2649 + 400;
        uint _2799 = uint(int(uint(_2797) >> uint(2)));
        uint _2801 = uint(int(uint(int(_2799)) >> uint(2)));
        int _2803 = int(_2799) & 3;
        float _2805 = (*spvDescriptorSet0.vp_c15)._m0[int(_2801)][_2803];
        _2795 = _2805;
    }
    float _2807 = _2795;
    float _2809 = _2725 * _2591;
    float _2811 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2813 = _2723 * _2591;
    float _2815 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2817 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2819 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2811);
    float _2821 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _2823 = _2313 + 88;
    uint _2825 = uint(int(uint(_2823) >> uint(2)));
    uint _2827 = uint(int(uint(int(_2825)) >> uint(2)));
    int _2829 = int(_2825) & 3;
    float _2831 = (*spvDescriptorSet0.vp_c15)._m0[int(_2827)][_2829];
    int _2833 = int(_2825) + 1;
    uint _2835 = uint(int(uint(_2833) >> uint(2)));
    int _2837 = _2833 & 3;
    float _2839 = (*spvDescriptorSet0.vp_c15)._m0[int(_2835)][_2837];
    float _2841 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2815);
    float _2843 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2819);
    bool _2845 = _2813 >= 0.0;
    float _2847 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2817);
    float _2849 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2841);
    float _2851 = _2843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2853 = _2813 <= 1.0;
    bool _2855 = _2853 && _2845;
    float _2857 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2847);
    float _2859 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2821);
    float _2861 = _2849 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2863 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2865 = _2857 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2867 = _2809 >= 0.0;
    bool _2869 = _2867 && _2855;
    float _2871 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2859);
    float _2873 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2863);
    float _2875 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2877 = _2865 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2879 = _2809 <= 1.0;
    bool _2881 = _2879 && _2869;
    float _2883 = _2871 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2885 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2873);
    float _2887 = -_2877;
    float _2889 = fma(_2887, _2875, 1.0);
    float _2891 = _2793;
    if (!_2581)
    {
        float _2893 = floor(_2369);
        _2891 = _2893;
    }
    float _2895 = _2891;
    float _2897 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2899 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2885);
    float _2901 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2903 = _2315 * _2531;
    float _2905 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2897);
    float _2907 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2901);
    float _2909 = log2(_2889);
    float _2911 = _2901;
    if (_2881)
    {
        float _2913 = float(_2309);
        _2465 = _2913;
    }
    float _2915 = _2465;
    float _2917 = fma(_2043, _2523, _2903);
    float _2919 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2905);
    float _2921 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2907);
    float _2923 = _2915;
    if (!_2581)
    {
        float _2925 = -_2625;
        float _2927 = _2367 + _2925;
        _2911 = _2927;
    }
    float _2929 = _2911;
    float _2931 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2919);
    float _2933 = 1.0 / _2899;
    float _2935 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2921);
    if (!_2581)
    {
        float _2937 = -_2895;
        float _2939 = _2369 + _2937;
        _2467 = _2939;
    }
    float _2941 = _2467;
    float _2943 = _2903;
    if (_2881)
    {
        float _2945 = rint(_2915);
        float _2947 = precise::max(_2945, 0.0);
        uint _2949 = uint(_2947);
        uint _2951 = clamp(_2949, 0u, 65535u);
        _2943 = as_type<float>(_2951);
    }
    float _2953 = _2943;
    float _2955 = _2909 * 0.693147182464599609375;
    float _2957 = fma(_2045, _2831, _2917);
    float _2959 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2961 = _2957 + _2839;
    float _2963 = _2625;
    if (!_2581)
    {
        float _2965 = rint(_2807);
        float _2967 = precise::max(_2965, 0.0);
        uint _2969 = uint(_2967);
        uint _2971 = clamp(_2969, 0u, 65535u);
        _2963 = as_type<float>(_2971);
    }
    float _2973 = _2963;
    float _2975 = _2931 * _2933;
    float _2977 = _2935 * _2933;
    float _2979 = _2961 * _2591;
    float _2981 = fma(_2975, 0.5, 0.5);
    float _2983 = fma(_2977, -0.5, 0.5);
    float _2985 = _2809;
    if (_2881)
    {
        float3 _8400 = float3(_2813, _2809, float(as_type<int>(_2953)));
        float3 _8404 = select(_8400, float3(0.0), isnan(_8400));
        float _2987 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8404.xy, uint(rint(_8404.z)), _2979, level(0.0));
        _2985 = _2987;
    }
    float _2989 = _2985;
    float3 _8414 = float3(_2981, _2983, _2959);
    float _2991 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8414, float3(0.0), isnan(_8414)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8414, float3(0.0), isnan(_8414)), level(0.0)).x;
    float3 _8423 = float3(_2981, _2983, _2959);
    float4 _2994 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8423, float3(0.0), isnan(_8423)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8423, float3(0.0), isnan(_8423)), level(0.0)).xyzw;
    float _2996 = _2994.x;
    float _2998 = _2994.y;
    float _3000 = _2994.z;
    float _3002 = _2994.w;
    float _3004 = _2929;
    if (!_2581)
    {
        float3 _8446 = float3(_2929, _2941, float(as_type<int>(_2973)));
        float3 _8448 = select(_8446, float3(0.0), isnan(_8446));
        float _3006 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8448.xy, uint(rint(_8448.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8448.xy, uint(rint(_8448.z)), level(0.0)).x;
        _3004 = _3006;
    }
    float _3008 = _3004;
    if (_2581)
    {
        _2923 = 1.0;
    }
    float _3010 = _2923;
    float _3012 = _3010;
    if (!_2581)
    {
        int _3014 = _2607 << 4;
        int _3016 = _3014 + 2048;
        uint _3018 = uint(int(uint(_3016) >> uint(2)));
        uint _3020 = uint(int(uint(int(_3018)) >> uint(2)));
        int _3022 = int(_3018) & 3;
        float _3024 = (*spvDescriptorSet0.vp_c15)._m0[int(_3020)][_3022];
        int _3026 = int(_3018) + 1;
        uint _3028 = uint(int(uint(_3026) >> uint(2)));
        int _3030 = _3026 & 3;
        float _3032 = (*spvDescriptorSet0.vp_c15)._m0[int(_3028)][_3030];
        int _3034 = _3016 + 8;
        uint _3036 = uint(int(uint(_3034) >> uint(2)));
        uint _3038 = uint(int(uint(int(_3036)) >> uint(2)));
        int _3040 = int(_3036) & 3;
        float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
        int _3044 = int(_3036) + 1;
        uint _3046 = uint(int(uint(_3044) >> uint(2)));
        int _3048 = _3044 & 3;
        float _3050 = (*spvDescriptorSet0.vp_c15)._m0[int(_3046)][_3048];
        float _3052 = _2315 * _3032;
        float _3054 = fma(_2043, _3024, _3052);
        float _3056 = fma(_2045, _3042, _3054);
        float _3058 = _3056 + _3050;
        float _3060 = precise::clamp(_3058, 0.0, 1.0);
        float _3062 = -_3060;
        float _3064 = _3062 + _3008;
        float _3066 = fma(_3064, 500.0, 1.5);
        float _3068 = exp2(_3066);
        float _3070 = 0.0 + _3068;
        float _3072 = precise::clamp(_3070, 0.0, 1.0);
        _2613 = as_type<float>(_3016);
        _3012 = _3072;
    }
    float _3074 = _2613;
    float _3076 = _3012;
    float _3078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3080 = _2787 + _3078;
    float _3082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3084 = _2789 + _3082;
    float _3086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3088 = _2791 + _3086;
    float _3090 = _3080 * _3080;
    float _3092 = fma(_3084, _3084, _3090);
    float _3094 = fma(_3088, _3088, _3092);
    float _3096 = rsqrt(_3094);
    float _3098 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3100 = _3084 * _3098;
    float _3102 = _3088 * _3098;
    float _3104 = _3100 * _3100;
    float _3106 = _3102 * _3102;
    float _3108 = _3104 + _3106;
    float _3110 = sqrt(_3108);
    bool _3112 = _3110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3116 = _3110 + _3114;
    float _3118 = _3088;
    float _3120 = _3108;
    float _3122 = _3116;
    float _3124 = _3074;
    float _3126 = _3080;
    float _3128 = _3098;
    if (_3112)
    {
        float _3130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3118 = _3130;
    }
    float _3132 = _3118;
    if (_3112)
    {
        float _3134 = rsqrt(_3108);
        _3120 = _3134;
    }
    float _3136 = _3120;
    float _3138 = _3136;
    if (_3112)
    {
        float _3140 = _3116 * _3132;
        _3122 = _3140;
    }
    float _3142 = _3122;
    if (_3112)
    {
        float _3144 = _3142 * 0.15915493667125701904296875;
        _3124 = _3144;
    }
    float _3146 = _3124;
    float _3148 = _3090;
    if (_3112)
    {
        float _3150 = _3146 * 6.283185482025146484375;
        float _3152 = sin(_3150);
        _3148 = _3152;
    }
    float _3154 = _3148;
    float _3156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3158 = precise::max(0.0, _3156);
    float _3160 = _3096;
    float _3162 = _3156;
    if (_3112)
    {
        float _3164 = _3146 * 6.283185482025146484375;
        float _3166 = cos(_3164);
        _3160 = _3166;
    }
    float _3168 = _3160;
    float _3170 = -_3098;
    float _3172 = -_3158;
    float _3174 = fma(_3080, _3170, _3172);
    float _3176 = _3174;
    if (!_3112)
    {
        _3126 = _3102;
    }
    float _3178 = _3126;
    float _3180 = _3178;
    if (_3112)
    {
        float _3182 = _3174 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3162 = _3182;
    }
    float _3184 = _3162;
    float _3186 = _3154;
    float _3188 = _3184;
    if (_3112)
    {
        float _3190 = fma(_3154, _3184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3186 = _3190;
    }
    float _3192 = _3186;
    float _3194 = _3192;
    float _3196 = _3168;
    if (_3112)
    {
        float _3198 = _3168 + (-1.0);
        _3188 = _3198;
    }
    float _3200 = _3188;
    if (_3112)
    {
        float _3202 = _3136 * _3192;
        _2069 = _3202;
    }
    float _3204 = _2069;
    if (!_3112)
    {
        _3194 = _3100;
    }
    float _3206 = _3194;
    float _3208 = _3206;
    if (_3112)
    {
        float _3210 = _3200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3128 = _3210;
    }
    float _3212 = _3128;
    if (_3112)
    {
        float _3214 = _3100 * _3204;
        _3208 = _3214;
    }
    float _3216 = _3208;
    if (_3112)
    {
        float _3218 = _3102 * _3204;
        _3180 = _3218;
    }
    float _3220 = _3180;
    if (!_3112)
    {
        _3138 = _3106;
    }
    float _3222 = _3138;
    float _3224 = _3222;
    if (_3112)
    {
        float _3226 = fma(_3174, _3168, _3212);
        _3176 = _3226;
    }
    float _3228 = _3176;
    if (!_3112)
    {
        _3196 = _3104;
    }
    float _3230 = _3196;
    float _3232 = _3230;
    if (_3112)
    {
        float _3234 = _3216 * _3216;
        _3232 = _3234;
    }
    float _3236 = _3232;
    if (_3112)
    {
        float _3238 = _3220 * _3220;
        _3224 = _3238;
    }
    float _3240 = _3224;
    float _3242 = sqrt(_3094);
    float _3244 = fma(_3228, _3228, _3236);
    float _3246 = _3244 + _3240;
    float _3248 = rsqrt(_3246);
    float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3252 = fma(_3242, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3250);
    float _3254 = precise::clamp(_3252, 0.0, 1.0);
    float _3256 = -_3254;
    float _3258 = _3256 + 1.0;
    float _3260 = abs(_3258);
    float _3262 = log2(_3260);
    float _3264 = _3248 * _3216;
    float _3266 = _3248 * _3228;
    float _3268 = _3248 * _3220;
    float _3270 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3272 = -_3270;
    float _3274 = fma(_3266, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3272);
    float _3276 = -_3268;
    float _3278 = fma(_3276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3274);
    float _3280 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3282 = fma(_3278, -0.5, 0.5);
    float _3284 = fma(_3278, 0.5, 0.5);
    float _3286 = exp2(_3280);
    float _3288 = _3266 + 1.0;
    float _3290 = fma(_3284, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3292 = fma(_3284, _3290, -0.212114393711090087890625);
    float _3294 = sqrt(_3282);
    float _3296 = fma(_3284, _3292, 1.570728778839111328125);
    float _3298 = -_3266;
    float _3300 = fma(_3286, _3288, _3298);
    float _3302 = fma(_3300, 0.5, 0.5);
    float _3304 = _3294 * 0.636619746685028076171875;
    float _3306 = -_3296;
    float _3308 = fma(_3304, _3306, 1.0);
    float2 _8917 = float2(_3308, _3302);
    float3 _3312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8917, float2(0.0), isnan(_8917)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8917, float2(0.0), isnan(_8917)), level(0.0)).xyz;
    float _3314 = _3312.x;
    float _3316 = _3312.y;
    float _3318 = _3312.z;
    float _3320 = abs(_2279);
    float _3322 = log2(_3320);
    float _3324 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3326 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3328 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3330 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3332 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3324);
    float _3334 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3326);
    float _3336 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3328);
    float _3338 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3330);
    float _3340 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3332);
    float _3342 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3344 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3334);
    float _3346 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3336);
    float _3348 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3338);
    float _3350 = _3322 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3352 = _3340 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3354 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3342);
    float _3356 = _3344 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3358 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3360 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3362 = exp2(_3350);
    float _3364 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3354);
    float _3366 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3368 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3370 = _2279 <= 8000.0;
    bool _3372 = isnan(_2279);
    bool _3374 = _3370 || _3372;
    bool _3376 = isnan(8000.0);
    bool _3378 = _3374 || _3376;
    float _3380 = float(_3378);
    float _3382 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3360);
    float _3384 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3364);
    float _3386 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3366);
    float _3388 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3368);
    float _3390 = -_2237;
    float _3392 = _3390 + 1.0;
    out.m_95.y = 1.0;
    float _3394 = -_280;
    float _3396 = _3394 + _2789;
    float _3398 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3388);
    float _3400 = -_330;
    float _3402 = _3400 + _2791;
    out.gl_Position.x = _2931;
    out.gl_Position.y = _2935;
    out.gl_Position.z = _3384;
    out.gl_Position.w = _2899;
    float _3404 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3406 = precise::clamp(_3404, 0.0, 1.0);
    float _3408 = fma(_3406, -2.0, 3.0);
    float _3410 = _3406 * _3406;
    float _3412 = _3410 * _3408;
    float _3414 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3416 = -_3412;
    float _3418 = _3416 + 1.0;
    float _3420 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3414);
    float _3422 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3424 = fma(_3418, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3412);
    float _3426 = _3348 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3428 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3430 = _3422 + _3382;
    float _3432 = _3380 * _3424;
    float _3434 = _3384 + _2899;
    float _3436 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3430);
    float _3438 = exp2(_3428);
    float _3440 = _3434 * 0.5;
    float _3442 = _3434;
    if (!_2881)
    {
        _3442 = 1.0;
    }
    float _3444 = _3442;
    float _3446 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3398);
    float _3448 = _3444;
    if (_2881)
    {
        bool _3450 = _2989 >= _2979;
        bool _3452 = isnan(_2989);
        bool _3454 = _3450 || _3452;
        bool _3456 = isnan(_2979);
        bool _3458 = _3454 || _3456;
        float _3460 = float(_3458);
        _3448 = _3460;
    }
    float _3462 = _3448;
    float _3464 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_97.z = _3440;
    out.m_97.w = _2899;
    float _3466 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3468 = 1.0 / _3436;
    float _3470 = _3392 * _3464;
    float _3472 = precise::clamp(_3470, 0.0, 1.0);
    float _3474 = _3462 * _3076;
    float _3476 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3478 = _3466 + _3420;
    float _3480 = -_3472;
    float _3482 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3484 = _3476 + _3386;
    float _3486 = -_3438;
    float _3488 = _3486 + 1.0;
    float _3490 = -_288;
    float _3492 = _3490 + _2787;
    float _3494 = -_3474;
    float _3496 = fma(_3494, _3482, 1.0);
    float _3498 = precise::clamp(_3496, 0.0, 1.0);
    float _3500 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3478);
    float _3502 = _3488 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3504 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3484);
    float _3506 = _3502 * _2991;
    float _3508 = _3446 * _3468;
    float _3510 = -_3502;
    float _3512 = _3510 + 1.0;
    float _3514 = _3500 * _3468;
    float _3516 = _3002 * _3506;
    float _3518 = _3504 * _3468;
    bool _3520 = _3508 > 0.0;
    float _3522 = _3002 * _3512;
    bool _3524 = _3508 < 1.0;
    bool _3526 = _3524 && _3520;
    bool _3528 = _2975 > (-1.0);
    bool _3530 = _3528 && _3526;
    bool _3532 = _2977 > (-1.0);
    bool _3534 = _3532 && _3530;
    bool _3536 = _2975 < 1.0;
    bool _3538 = _3536 && _3534;
    bool _3540 = _2977 < 1.0;
    bool _3542 = _3540 && _3538;
    float _3544 = _3318 * _3506;
    float _3546 = fma(_3314, _3516, _2996);
    float _3548 = fma(_3316, _3516, _2998);
    float _3550 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3552 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3550);
    float _3554 = _3498 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3556 = fma(_3002, _3544, _3000);
    float _3558 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3560 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3552);
    out.m_95.x = _3554;
    float _3562 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3558);
    float _3564 = _3560 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3566 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_99.x = _3546;
    out.m_99.y = _3548;
    out.m_99.z = _3556;
    out.m_99.w = _3522;
    float _3568 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3562);
    float _3570 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3566);
    float _3572 = 1.0 / _3564;
    float _3574 = _3568 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3576 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3570);
    float _3578 = _3576 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3580 = _2219 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3582 = _3578 * _3572;
    float _3584 = _3574 * _3572;
    bool _3586 = !_3542;
    float _3588 = _3582;
    float _3614;
    float _3616;
    float _3624;
    if (!_3586)
    {
        float _3590 = -_3518;
        float _3592 = _2977 + _3590;
        float _3594 = -_3514;
        float _3596 = _2975 + _3594;
        float _3598 = -_3582;
        float _3600 = _2975 + _3598;
        float _3602 = -_3584;
        float _3604 = _2977 + _3602;
        float _3606 = _3592 * _3592;
        float _3608 = fma(_3596, _3596, _3606);
        float _3610 = sqrt(_3608);
        bool _3612 = _3610 > 0.0;
        _3614 = _3608;
        _3616 = _3610;
        if (!_3612)
        {
            _3588 = _3580;
        }
        float _3618 = _3588;
        bool _3620 = !_3612;
        float _3622 = _3618;
        _3624 = _3618;
        _3626 = _3620;
        if (!_3626)
        {
            float _3628 = _3604 * _3604;
            float _3630 = fma(_3600, _3600, _3628);
            float _3632 = rsqrt(_3608);
            float _3634 = sqrt(_3630);
            float _3636 = _3596 * _3632;
            float _3638 = _3592 * _3632;
            bool _3640 = _3634 > 0.0;
            _2303 = _3634;
            _3616 = _3632;
            if (!_3640)
            {
                _3622 = _3580;
            }
            float _3642 = _3622;
            bool _3644 = !_3640;
            _3624 = _3642;
            _3626 = _3644;
            if (!_3626)
            {
                float _3646 = _1793 * _3426;
                float _3648 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _3650 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3422);
                float _3652 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3476);
                float _3654 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3466);
                float _3656 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3650);
                float _3658 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3652);
                float _3660 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3654);
                float _3662 = rsqrt(_3630);
                float _3664 = _3648 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3666 = 1.0 / _3656;
                float _3668 = _3604 * _3664;
                float _3670 = _3600 * _3664;
                float _3672 = _3668 * _3668;
                float _3674 = fma(_3670, _3670, _3672);
                float _3676 = _3658 * _3666;
                float _3678 = _3660 * _3666;
                float _3680 = sqrt(_3674);
                float _3682 = _3676 * _3676;
                float _3684 = fma(_3678, _3678, _3682);
                float _3686 = _3604 * _3662;
                float _3688 = _3600 * _3662;
                float _3690 = sqrt(_3684);
                float _3692 = _3638 * _3686;
                float _3694 = fma(_3636, _3688, _3692);
                float _3696 = precise::min(0.0, _3694);
                float _3698 = _2899 * _3696;
                float _3700 = fma(_3680, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3690);
                float _3702 = fma(_3670, _3698, _2931);
                float _3704 = 1.0 / _3700;
                float _3706 = fma(_3668, _3698, _2935);
                out.gl_Position.x = _3702;
                out.gl_Position.y = _3706;
                float _3708 = _3690 * _3704;
                out.m_95.y = _3708;
                _3614 = _3692;
                _3624 = _3580;
                _2303 = _3668;
                _3616 = _3708;
                _3626 = true;
            }
        }
    }
    else
    {
        float _3710 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3710;
        _3614 = 0.0;
        _3624 = 0.0;
        _2303 = _3710;
        _3616 = 0.0;
    }
    _3626 = false;
    float _3712 = _3614;
    float _3714 = _3624;
    float _3716 = _2303;
    float _3718 = _3616;
    bool _3720 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3722 = isnan(_3242);
    bool _3724 = _3720 || _3722;
    bool _3726 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3728 = _3724 || _3726;
    float _3730 = _3716;
    float _3732 = _3712;
    float _3734 = _3718;
    if (!_3728)
    {
        _3730 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3736 = _3730;
    float _3738 = _3736;
    float _3740 = _3736;
    if (!_3728)
    {
        _3732 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3742 = _3732;
    float _3744 = _3742;
    float _3746 = _3742;
    if (!_3728)
    {
        _3734 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3748 = _3734;
    bool _3750 = !_3728;
    float _3752 = _3748;
    float _3754 = _3748;
    if (!_3750)
    {
        bool _3756 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3758 = isnan(_3242);
        bool _3760 = _3756 || _3758;
        bool _3762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3764 = _3760 || _3762;
        if (!_3764)
        {
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = _3242 + _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3772 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3770;
            float _3774 = 1.0 / _3772;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3784 = _3768 * _3774;
            float _3786 = precise::clamp(_3784, 0.0, 1.0);
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3792 = fma(_3786, _3782, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3794 = fma(_3786, _3790, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3796 = fma(_3786, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3746 = _3796;
            _3740 = _3794;
            _3754 = _3792;
            _3798 = true;
        }
        else
        {
            bool _3800 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3802 = isnan(_3242);
            bool _3804 = _3800 || _3802;
            bool _3806 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3808 = _3804 || _3806;
            if (!_3808)
            {
                _3738 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3810 = _3738;
            _3740 = _3810;
            if (!_3808)
            {
                _3744 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3812 = _3744;
            _3746 = _3812;
            if (!_3808)
            {
                _3752 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3814 = _3752;
            bool _3816 = !_3808;
            _3754 = _3814;
            if (!_3816)
            {
                bool _3818 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3820 = isnan(_3242);
                bool _3822 = _3818 || _3820;
                bool _3824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3826 = _3822 || _3824;
                if (!_3826)
                {
                    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3830 = _3242 + _3828;
                    float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3834 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3832;
                    float _3836 = 1.0 / _3834;
                    float _3838 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3840 = _3838 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3842 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3844 = _3842 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3846 = _3830 * _3836;
                    float _3848 = precise::clamp(_3846, 0.0, 1.0);
                    float _3850 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3852 = _3850 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3854 = fma(_3848, _3844, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3856 = fma(_3848, _3852, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3858 = fma(_3848, _3840, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3746 = _3858;
                    _3740 = _3856;
                    _3754 = _3854;
                    _3798 = true;
                }
                else
                {
                    _3746 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3740 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3754 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3798 = false;
    float _3860 = _3746;
    float _3862 = _3740;
    float _3864 = _3754;
    float _3866 = _3860 * 0.586610972881317138671875;
    bool _3868 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3870 = _3714 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_101.x = 0.0;
    float _3872 = fma(_3862, 0.298911988735198974609375, _3866);
    out.m_61.x = _3870;
    float _3874 = fma(_3864, 0.114477999508380889892578125, _3872);
    float _3876 = -_3874;
    float _3878 = _3876 + _3862;
    float _3880 = -_3874;
    float _3882 = _3880 + _3860;
    float _3884 = -_3874;
    float _3886 = _3884 + _3864;
    float _3888 = fma(_3878, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3874);
    float _3890 = fma(_3882, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3874);
    float _3892 = fma(_3886, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3874);
    out.m_103.x = _3888;
    out.m_103.y = _3890;
    out.m_103.z = _3892;
    if (!_3868)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3894 = -_2787;
    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3898 = -_2789;
    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3902 = -_2791;
    float _3904 = _3902 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3906 = _3896 * _3896;
    float _3908 = fma(_3900, _3900, _3906);
    float _3910 = fma(_3904, _3904, _3908);
    float _3912 = sqrt(_3910);
    float _3914 = rsqrt(_3910);
    float _3916 = -_3912;
    float _3918 = _3916 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3920 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3922 = precise::clamp(_3920, 0.0, 1.0);
    float _3924 = _3900 * _3914;
    float _3926 = _3896 * _3914;
    float _3928 = abs(_3922);
    float _3930 = log2(_3928);
    float _3932 = _3904 * _3914;
    float _3934 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3936 = _1987 * _3926;
    float _3938 = -_3926;
    float _3940 = -_3934;
    float _3942 = fma(_3938, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3940);
    float _3944 = fma(_1981, _3924, _3936);
    float _3946 = -_3932;
    float _3948 = fma(_3946, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3942);
    float _3950 = fma(_1989, _3932, _3944);
    float _3952 = precise::clamp(_3950, 0.0, 1.0);
    float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3956 = _3948 + _3954;
    float _3958 = _3930 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3960 = _3956 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3962 = precise::clamp(_3960, 0.0, 1.0);
    float _3964 = exp2(_3958);
    float _3966 = _3964 * _3962;
    float _3968 = _3952 * _3966;
    float _3970 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3972 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3974 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _3970;
    out.m_101.y = _3972;
    out.m_101.z = _3974;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3798 = false;
    bool _3626 = false;
    bool _2087 = false;
    bool _2075 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_61.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4031 = as_type<float>(_138);
        out.gl_Position.z = _4031;
    }
    if (!_126)
    {
        return out;
    }
    float _142 = in.m_63.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = _156;
    if (_152)
    {
        float _160 = float(_122);
        _132 = _160;
    }
    float _162 = _132;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4101 = as_type<float>(_176);
        out.gl_Position.z = _4101;
    }
    if (_168)
    {
        return out;
    }
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = in.m_69.x;
    float _192 = in.m_69.y;
    float _194 = in.m_69.z;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = fma(_184, _184, _196);
    float _202 = fma(_186, _186, _198);
    float _204 = fma(_190, _190, _200);
    float _206 = _182 * _182;
    float _208 = fma(_192, _192, _202);
    float _210 = sqrt(_204);
    float _212 = fma(_188, _188, _206);
    float _214 = in.m_71.x;
    float _216 = in.m_71.y;
    float _218 = in.m_71.z;
    float _220 = fma(_194, _194, _212);
    float _222 = sqrt(_208);
    float _224 = sqrt(_220);
    bool _226 = _210 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _180 * _216;
    float _232 = 0.0;
    int _234 = as_type<int>(_208);
    if (_226)
    {
        float _236 = rsqrt(_204);
        _232 = _236;
    }
    float _238 = _232;
    float _240 = 0.0;
    float _242 = 0.0;
    if (!_226)
    {
        _240 = 0.0;
        _242 = 0.0;
    }
    float _244 = _240;
    float _246 = _242;
    bool _248 = _224 > 0.0;
    float _250 = _186 * _216;
    float _252 = 0.0;
    float _254 = _244;
    float _256 = _246;
    if (!_226)
    {
        _252 = 0.0;
    }
    float _258 = _252;
    float _260 = _192 * _216;
    float _262 = fma(_178, _214, _230);
    float _264 = fma(_184, _214, _250);
    float _266 = _222;
    float _268 = _258;
    if (_228)
    {
        float _270 = rsqrt(_208);
        _266 = _270;
    }
    float _272 = _266;
    float _274 = fma(_190, _214, _260);
    float _276 = 0.0;
    if (!_228)
    {
        _276 = 0.0;
    }
    float _278 = _276;
    float _280 = fma(_188, _218, _264);
    float _282 = 0.0;
    float _284 = _278;
    if (!_228)
    {
        _282 = 0.0;
    }
    float _286 = _282;
    float _288 = fma(_182, _218, _262);
    float _290 = 0.0;
    float _292 = _286;
    if (!_228)
    {
        _290 = 0.0;
    }
    float _294 = _290;
    float _296 = 0.0;
    float _298 = 0.0;
    float _300 = _294;
    if (!_248)
    {
        _296 = 0.0;
        _298 = 0.0;
    }
    float _302 = _296;
    float _304 = _298;
    float _306 = 0.0;
    float _308 = _302;
    float _310 = _304;
    if (_248)
    {
        float _312 = rsqrt(_220);
        _306 = _312;
    }
    float _314 = _306;
    if (_226)
    {
        float _316 = _238 * _184;
        _254 = _316;
    }
    float _318 = _254;
    if (_226)
    {
        float _320 = _238 * _178;
        _256 = _320;
    }
    float _322 = _256;
    if (_226)
    {
        float _324 = _238 * _190;
        _268 = _324;
    }
    float _326 = _268;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = fma(_194, _218, _274);
    float _332 = 0.0;
    bool _334 = _328;
    if (!_248)
    {
        _332 = 0.0;
    }
    float _336 = _332;
    float _338 = _336;
    if (_228)
    {
        float _340 = _272 * _186;
        _284 = _340;
    }
    float _342 = _284;
    if (_228)
    {
        float _344 = _272 * _180;
        _292 = _344;
    }
    float _346 = _292;
    float _348 = _346;
    if (_228)
    {
        float _350 = _272 * _192;
        _300 = _350;
    }
    float _352 = _300;
    if (_248)
    {
        float _354 = _314 * _188;
        _308 = _354;
    }
    float _356 = _308;
    if (_248)
    {
        float _358 = _314 * _182;
        _310 = _358;
    }
    float _360 = _310;
    float _362 = _360;
    if (_248)
    {
        float _364 = _314 * _194;
        _338 = _364;
    }
    float _366 = _338;
    bool _368 = !_328;
    float _386;
    if (!_368)
    {
        float _370 = in.m_73.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_122);
        float _392 = 1.0 / _390;
        float _394 = _156 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _400 = int(_398);
    float _402 = in.m_75.x;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    float _408 = in.m_75.y;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _412 = _410 != 0;
    float _414 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _416 = int(_414);
    float _418 = in.m_73.x;
    float _420 = in.m_73.y;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _428 = _426 != 0;
    float _430 = in.m_58.x;
    float _432 = in.m_58.y;
    float _434 = in.m_58.z;
    float _436 = float(_400);
    float _438 = _314;
    if (_406)
    {
        float _440 = in.m_73.x;
        _438 = _440;
    }
    float _442 = _438;
    float _444 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _446 = log2(_444);
    float _448 = in.m_73.w;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _452 = _450 != 0;
    float _454 = _402;
    if (_406)
    {
        float _456 = -_402;
        float _458 = _456 + 1.0;
        _234 = as_type<int>(_458);
    }
    int _460 = _234;
    float _462 = 0.0;
    if (!_406)
    {
        _462 = _402;
    }
    float _464 = _462;
    float _466 = 1.0 / _436;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _468 = -_408;
    float _470 = _468 + 1.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _476 = in.m_73.z;
    bool _478 = _420 > 0.5;
    float _480 = 1.0 / _474;
    float _482 = _180 * _432;
    float _484 = _186 * _432;
    float _486 = _192 * _432;
    int _488 = _478 ? as_type<int>(_470) : as_type<int>(_408);
    float _490 = fma(_178, _430, _482);
    float _492 = _464;
    float _494 = _408;
    if (_406)
    {
        bool _496 = _442 > 0.5;
        _334 = _496;
    }
    bool _498 = _334;
    float _500 = _466 * _156;
    float _502 = in.m_79.x;
    float _504 = in.m_79.y;
    float _506 = in.m_79.z;
    float _508 = fma(_182, _434, _490);
    if (_406)
    {
        float _510 = _498 ? as_type<float>(_460) : _402;
        _492 = _510;
    }
    float _512 = _492;
    float _514 = fma(_184, _430, _484);
    float _516 = float(uint(_416));
    float _518 = trunc(_500);
    int _520 = int(_518);
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _524 = _522 != 0;
    float _526 = fma(_190, _430, _486);
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _530 = _528 != 0;
    float _532 = fma(_188, _434, _514);
    float _534 = fma(_194, _434, _526);
    float _536 = _530 ? as_type<float>(_488) : _408;
    float _538 = 1.0 / _516;
    bool _540 = _448 > 0.5;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _544;
    float _548 = float(_122);
    float _550 = in.m_81.x;
    float _552 = in.m_81.y;
    float _554 = in.m_81.z;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _560 = float(uint(_520));
    float _562 = in.m_83.x;
    float _564 = in.m_83.y;
    float _566 = in.m_83.z;
    bool _568 = _504 != 0.0;
    bool _570 = isnan(_504);
    bool _572 = _568 || _570;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_85.w = _542;
    bool _582 = _502 == 0.0;
    bool _584 = !_576;
    bool _586 = _582 && _584;
    float _588 = 1.0 / _558;
    int _590 = as_type<int>(_538) + (-2);
    float _592 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _506);
    bool _594 = _506 == 0.0;
    bool _596 = _594 && _586;
    float _598 = _420 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _600 = as_type<float>(_590) * _560;
    int _602 = ~_416;
    int _604 = _602 + 1;
    float _606 = 1.0 / _580;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _610 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _612 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _614 = _596;
    if (_428)
    {
        float _616 = _540 ? _470 : _408;
        _494 = _616;
    }
    float _618 = _494;
    float _620 = trunc(_600);
    float _622 = precise::max(_620, 0.0);
    uint _625 = uint(_622);
    float _627 = _546 * _588;
    float _629 = _566;
    float _631 = _564;
    float _633 = _562;
    int _635 = as_type<int>(_588);
    if (!_596)
    {
        float _637 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _566);
        _629 = _637;
    }
    float _639 = _629;
    if (!_596)
    {
        float _641 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _564);
        _631 = _641;
    }
    float _643 = _631;
    if (!_596)
    {
        float _645 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _562);
        _633 = _645;
    }
    float _647 = _633;
    if (_424)
    {
        float _649 = -_402;
        float _651 = _649 + 1.0;
        _635 = as_type<int>(_651);
    }
    int _653 = _635;
    if (_424)
    {
        bool _655 = _476 > 0.5;
        _614 = _655;
    }
    bool _657 = _614;
    float _659 = -_608;
    float _661 = fma(_610, 2.0, _659);
    float _663 = 1.0 / _548;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_424)
    {
        float _667 = _657 ? as_type<float>(_653) : _402;
        _454 = _667;
    }
    float _669 = _454;
    float _671 = _420 + _418;
    bool _673 = !_452;
    float _675 = _673 ? 7.345489978790283203125 : 1.0;
    float _677 = _418 * 2.0;
    float _679 = fma(_598, -2.0, _665);
    int _681 = _604 * int(_625);
    int _683 = _681 + _520;
    float _685 = float(_416);
    float _687 = _671 + (-1.0);
    float _689 = float(_520);
    float _691 = _675 * _418;
    float _693 = float(uint(_683));
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _703 = floor(_677);
    float _705 = as_type<float>(_590) * _693;
    float _707 = _697 * _606;
    float _709 = _685 * _156;
    float _711 = _701 * _480;
    float _713 = _418 + _476;
    float _715 = trunc(_705);
    float _717 = precise::max(_715, 0.0);
    uint _719 = uint(_717);
    float _721 = _709 * _663;
    int _723 = ~_416;
    int _725 = _723 + 1;
    float _727 = _713 + (-1.0);
    bool _729 = _689 >= _685;
    bool _731 = isnan(_689);
    bool _733 = _729 || _731;
    bool _735 = isnan(_685);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _743 = !_524;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _749 = trunc(_721);
    int _751 = int(_749);
    float _753 = _554 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _755 = abs(_745);
    float _757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _504);
    float _759 = -_156;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[76].x, _661);
    float _763 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _679);
    float _765 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _767 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _502);
    int _769 = int(_625) + int(_719);
    float _771 = trunc(_739);
    int _773 = int(_771);
    int _775 = _725 * _769;
    int _777 = _775 + _520;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _793 = _791 != 0;
    float _795 = floor(_691);
    bool _797 = uint(_777) >= uint(_416);
    bool _799 = !_785;
    int _801 = _799 ? 0 : 1;
    bool _803 = !_797;
    int _805 = _803 ? 0 : (-1);
    bool _807 = _416 == 0;
    int _809 = ~_769;
    int _811 = _809 + _805;
    int _813 = _811 + 1;
    float _815 = _420 + _476;
    bool _817 = _703 > 0.0;
    int _819 = _416 * _813;
    int _821 = _819 + _520;
    float _823 = _815 + (-1.0);
    float _825 = -_795;
    float _827 = _691 + _825;
    bool _829 = !_781;
    int _831 = _829 ? 0 : 1;
    bool _833 = _703 >= 0.0;
    bool _835 = isnan(_703);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = _420 * 2.0;
    int _845 = ~_773;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    float _851 = _827 * _685;
    bool _853 = !_807;
    int _855 = _853 ? _821 : (-1);
    float _857 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _859 = abs(_801);
    float _861 = floor(_843);
    bool _863 = !_789;
    int _865 = _863 ? 0 : 1;
    int _867 = _855 * _849;
    int _869 = _416 + (-1);
    bool _871 = !_793;
    int _873 = _871 ? 0 : 1;
    int _875 = abs(_831);
    float _877 = trunc(_851);
    int _879 = int(_877);
    int _881 = _773 * _869;
    int _883 = _881 + _867;
    float _885 = _476 * 2.0;
    int _887 = _841 ? 0 : 1;
    int _889 = _883 * _859;
    int _891 = abs(_865);
    float _893 = floor(_885);
    bool _895 = _861 > 0.0;
    int _897 = _751 * _875;
    int _899 = _897 + _889;
    int _901 = abs(_873);
    bool _903 = _861 >= 0.0;
    bool _905 = isnan(_861);
    bool _907 = _903 || _905;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    int _913 = _879 * _755;
    int _915 = _913 + _520;
    float _917 = _911 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _919 = ~_887;
    int _921 = _919 + 1;
    int _923 = _921 + 1;
    int _925 = _915 * _891;
    int _927 = _925 + _899;
    int _929 = ~as_type<int>(_917);
    int _931 = _929 + 1;
    int _933 = _931 + 1;
    int _935 = _933;
    int _937 = _923;
    float _939 = as_type<float>(_901);
    float _941 = as_type<float>(_899);
    float _943 = _917;
    if (!_895)
    {
        int _945 = ~as_type<int>(_917);
        int _947 = _945 + 1;
        _935 = _947;
    }
    int _949 = _935;
    int _951 = _879 * _901;
    int _953 = _951 + _927;
    bool _955 = _893 >= 0.0;
    bool _957 = isnan(_893);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    float _965 = _753 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_817)
    {
        int _967 = ~_887;
        int _969 = _967 + 1;
        _937 = _969;
    }
    int _971 = _937;
    float _973 = float(uint(_953));
    float _975 = in.m_67.w;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _987 = _985 != 0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _991 = _396 + _989;
    int _993 = _963 ? 0 : 1;
    float _995 = as_type<float>(_590) * _973;
    bool _997 = _893 > 0.0;
    float _999 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1001 = fma(_707, _991, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1003 = _965 * _592;
    float _1005 = trunc(_995);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    float _1011 = _999 * _757;
    float _1013 = in.m_65.w;
    int _1015 = ~_416;
    int _1017 = _1015 + 1;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1021 = _396 + _1019;
    float _1023 = in.m_69.w;
    if (!_452)
    {
        _939 = _476;
    }
    float _1025 = _939;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1029 = _396 + _1027;
    float _1031 = _1025;
    if (_452)
    {
        _1031 = _420;
    }
    float _1033 = _1031;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1037 = fma(_627, _1021, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1039 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1041 = isnan(_396);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1047 = _1043 || _1045;
    float _1049 = float(_1047);
    float _1051 = fma(_711, _1029, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1053 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1055 = isnan(_396);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1035);
    int _1067 = _1017 * int(_1009);
    int _1069 = _1067 + _953;
    float _1071 = -_1049;
    float _1073 = _1071 + 1.0;
    bool _1075 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1077 = isnan(_396);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = -_1063;
    float _1089 = _1087 + 1.0;
    float _1091 = _532 + _975;
    float _1093 = float(uint(_1069));
    float _1095 = _1063 * _1073;
    bool _1097 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1099 = isnan(_396);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = _1085 * _1089;
    float _1111 = -_1085;
    float _1113 = _1111 + 1.0;
    float _1115 = as_type<float>(_590) * _1093;
    float _1117 = _508 + _1013;
    float _1119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1121 = _534 + _1023;
    float _1123 = _446 * _156;
    if (!_452)
    {
        _941 = _420;
    }
    float _1125 = _941;
    float _1127 = _1107 * _1113;
    float _1129 = _1125;
    if (_452)
    {
        _1129 = _418;
    }
    float _1131 = _1129;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1135 = trunc(_1115);
    float _1137 = precise::max(_1135, 0.0);
    uint _1139 = uint(_1137);
    float _1141 = _1001 * _1127;
    float _1143 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1133);
    float _1145 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1149 = _1091 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _1151 = ~_993;
    int _1153 = _1151 + 1;
    int _1155 = _1153 + 1;
    float _1157 = exp2(_1123);
    float _1159 = -_1147;
    float _1161 = fma(_1145, 2.0, _1159);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1165 = 1.0 + _1163;
    float _1167 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1169 = _1155;
    if (!_997)
    {
        int _1171 = ~_993;
        int _1173 = _1171 + 1;
        _1169 = _1173;
    }
    int _1175 = _1169;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1179 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1181 = isnan(0.0);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1187 = _1183 || _1185;
    float _1189 = fma(_1167, _618, -0.5);
    int _1191 = int(_1009) + int(_1139);
    float _1193 = 1.0 / _1165;
    float _1195 = -_1107;
    float _1197 = _1195 + 1.0;
    if (!_452)
    {
        _943 = _476;
    }
    float _1199 = _943;
    float _1201 = _1199;
    if (_452)
    {
        _1201 = _420;
    }
    float _1203 = _1201;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1207 = -_1157;
    float _1209 = _1207 + 1.0;
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _1213 = ~_416;
    int _1215 = _1213 + 1;
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1219 = _1187 ? _1209 : 0.0;
    float _1221 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1205);
    bool _1223 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1225 = isnan(1.0);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1231 = _1227 || _1229;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1235 = float(uint(_915));
    float _1237 = fma(_1217, -2.0, _1177);
    float _1239 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1233);
    float _1241 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1065);
    float _1243 = as_type<float>(_590) * _1235;
    float _1245 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1221);
    int _1247 = _1215 * _1191;
    int _1249 = _1247 + _953;
    float _1251 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1239);
    float _1253 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1143);
    float _1255 = -_156;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1161);
    float _1259 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1237);
    if (_1231)
    {
        float _1261 = _1219 * _1193;
        _158 = _1261;
    }
    float _1263 = _158;
    bool _1265 = uint(_1249) >= uint(_416);
    float _1267 = trunc(_1243);
    float _1269 = precise::max(_1267, 0.0);
    uint _1271 = uint(_1269);
    float _1273 = _1117 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _1275 = !_987;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1141);
    bool _1281 = !_1265;
    int _1283 = _1281 ? 0 : (-1);
    float _1285 = _1273 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1287 = _1273 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1289 = _1273 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _1291 = ~_1191;
    int _1293 = _1291 + _1283;
    int _1295 = _1293 + 1;
    float _1297 = fma(_1149, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1285);
    float _1299 = fma(_1149, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1287);
    float _1301 = fma(_1149, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1289);
    int _1303 = abs(_1277);
    float _1305 = in.m_87.x;
    float _1307 = in.m_87.y;
    float _1309 = in.m_87.z;
    int _1311 = ~_416;
    int _1313 = _1311 + 1;
    int _1315 = _416 * _1295;
    int _1317 = _1315 + _953;
    bool _1319 = !_979;
    int _1321 = _1319 ? 0 : 1;
    float _1323 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1325 = float(_949);
    int _1327 = _1313 * int(_1271);
    int _1329 = _1327 + _915;
    float _1331 = float(_1303);
    float _1333 = _1121 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    bool _1335 = !_807;
    int _1337 = _1335 ? _1317 : (-1);
    float _1339 = -_1259;
    float _1341 = fma(_1241, _1189, _1339);
    bool _1343 = !_983;
    int _1345 = _1343 ? 0 : 1;
    float _1347 = _1331 * _1325;
    int _1349 = abs(_1321);
    float _1351 = fma(_1333, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1297);
    float _1353 = float(uint(_1329));
    float _1355 = fma(_1333, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1299);
    int _1357 = _1337 >> 31;
    float _1359 = fma(_1333, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1301);
    int _1361 = abs(_1345);
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1365 = float(_1349);
    float _1367 = as_type<float>(_590) * _1353;
    float _1369 = float(_1175);
    float _1371 = _1351 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    int _1373 = _1357 & 3;
    float _1375 = _476 + (-0.5);
    float _1377 = float(_971);
    float _1379 = _1365 * _1369;
    float _1381 = float(_1361);
    float _1383 = trunc(_1367);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    int _1389 = _1337 + _1373;
    float _1391 = _1379 * (-2.0);
    int _1393 = _1337 & 3;
    bool _1395 = _1393 != 0;
    float _1397 = _1381 * _1377;
    int _1399 = _1389 >> 2;
    float _1401 = fma(_741, _1391, _741);
    float _1403 = fma(_1391, _1305, _1305);
    float _1405 = _1397 * (-2.0);
    float _1407 = _1347 * (-2.0);
    int _1409 = _1399 << 4;
    int _1411 = _1409 + 368;
    float _1413 = _1355 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1415 = fma(_857, _1405, _857);
    float _1417 = fma(_1405, _1307, _1307);
    float _1419 = fma(_747, _1407, _747);
    float _1421 = _1359 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    uint _1423 = uint(int(uint(_1411) >> uint(2)));
    uint _1425 = uint(int(uint(int(_1423)) >> uint(2)));
    int _1427 = int(_1423) & 3;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[int(_1425)][_1427];
    int _1431 = int(_1423) + 1;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    int _1435 = _1431 & 3;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[int(_1433)][_1435];
    float _1439 = _418 + (-0.5);
    float _1441 = _1371 * _1323;
    float _1443 = _1421 * _1363;
    float _1445 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1447 = int(_1445);
    float _1449 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1403);
    int _1451 = _1337 & 3;
    bool _1453 = _1451 != 0;
    float _1455 = fma(_1407, _1309, _1309);
    int _1457 = _1411 + 8;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[int(_1469)][_1471];
    int _1475 = int(_1271) + int(_1387);
    float _1477 = _420 + (-0.5);
    bool _1479 = uint(_1451) > 1u;
    float _1481 = _1413 * _1211;
    int _1483 = ~_416;
    int _1485 = _1483 + 1;
    float _1487 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1417);
    int _1489 = _1395 ? 0 : 1;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1493 = _1451 != 3;
    int _1495 = _1485 * _1475;
    int _1497 = _1495 + _915;
    float _1499 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1455);
    int _1501 = abs(_1447);
    float _1503 = fma(_1415, _1263, _1487);
    int _1505 = ~_1489;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    float _1511 = fma(_1401, _1263, _1449);
    int _1513 = _1509;
    if (!_1479)
    {
        int _1515 = ~_1489;
        int _1517 = _1515 + 1;
        _1513 = _1517;
    }
    int _1519 = _1513;
    float _1521 = fma(_1443, 0.5, 0.5);
    bool _1523 = uint(_1451) >= 2u;
    float _1525 = fma(_1481, 0.5, 0.5);
    float _1527 = float(uint(_1501));
    float _1529 = fma(_1441, 0.5, 0.5);
    int _1531 = _1523 ? 0 : 1;
    float _1533 = 1.0 / _1527;
    bool _1535 = uint(_1497) >= uint(_416);
    float _1537 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1539 = _1451 != 3;
    int _1541 = ~_1531;
    int _1543 = _1541 + 1;
    int _1545 = _1543 + 1;
    bool _1547 = !_1453;
    int _1549 = _1547 ? 0 : 1;
    float _1551 = floor(_1529);
    int _1553 = abs(_1519);
    int _1555 = _1545;
    if (_1493)
    {
        int _1557 = ~_1531;
        int _1559 = _1557 + 1;
        _1555 = _1559;
    }
    int _1561 = _1555;
    int _1563 = ~_1553;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = abs(_1549);
    float _1571 = _1503 * 0.15915493667125701904296875;
    int _1573 = abs(_1561);
    int _1575 = _1567 * as_type<int>(_1437);
    int _1577 = ~_1569;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = floor(_1521);
    bool _1585 = !_1539;
    int _1587 = _1585 ? 0 : (-1);
    int _1589 = _1581 * as_type<int>(_1429);
    int _1591 = _1589 + _1575;
    bool _1593 = !_1535;
    int _1595 = _1593 ? 0 : (-1);
    float _1597 = -_1551;
    float _1599 = _1529 + _1597;
    bool _1601 = !_412;
    int _1603 = _1601 ? 0 : 1;
    float _1605 = _1571 * 6.283185482025146484375;
    float _1607 = sin(_1605);
    int _1609 = abs(_1587);
    float _1611 = fma(_1599, 2.0, -1.0);
    int _1613 = ~_1573;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    float _1619 = float(uint(_1447));
    int _1621 = ~_1475;
    int _1623 = _1621 + _1595;
    int _1625 = _1623 + 1;
    int _1627 = _1617 * as_type<int>(_1465);
    int _1629 = _1627 + _1591;
    int _1631 = abs(_1603);
    float _1633 = _1571 * 6.283185482025146484375;
    float _1635 = cos(_1633);
    int _1637 = ~_1609;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    int _1643 = _416 * _1625;
    int _1645 = _1643 + _915;
    int _1647 = ~_1631;
    int _1649 = _1647 + 1;
    int _1651 = _1649 + 1;
    float _1653 = fma(_1419, _1263, _1499);
    int _1655 = as_type<int>(_1533) + (-2);
    int _1657 = _1641 * as_type<int>(_1473);
    int _1659 = _1657 + _1629;
    bool _1661 = !_807;
    int _1663 = _1661 ? _1645 : (-1);
    float _1665 = 1.0 / _1619;
    float _1667 = fma(_1051, _1109, _1279);
    int _1669 = _1659 * _1651;
    float _1671 = fma(_1537, _669, -0.5);
    float _1673 = _1511 * 0.15915493667125701904296875;
    float _1675 = fma(_1037, _1095, _1667);
    int _1677 = _1663 * _1631;
    int _1679 = _1677 + _1669;
    float _1681 = _1653 * 0.15915493667125701904296875;
    int _1683 = ~_1447;
    int _1685 = _1683 + 1;
    float _1687 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1675);
    float _1689 = _1673 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    int _1693 = abs(_1679);
    float _1695 = fma(_1253, _1671, _1257);
    float _1697 = float(uint(_1679));
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1701 = as_type<int>(_1665) + (-2);
    float _1703 = _1681 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    float _1707 = as_type<float>(_1701) * _1697;
    float _1709 = float(uint(_1693));
    int _1711 = ~_1501;
    int _1713 = _1711 + 1;
    float _1715 = trunc(_1707);
    float _1717 = precise::max(_1715, 0.0);
    uint _1719 = uint(_1717);
    float _1721 = as_type<float>(_1655) * _1709;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1729 = _1723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1731 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1733 = trunc(_1721);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1741 = _1691 * _1607;
    bool _1743 = _1447 == 0;
    out.m_89.x = _1729;
    out.m_89.y = _1739;
    out.m_89.z = _1731;
    out.m_89.w = _1699;
    float _1745 = _1673 * 6.283185482025146484375;
    float _1747 = cos(_1745);
    int _1749 = _1685 * int(_1719);
    int _1751 = _1749 + _1679;
    float _1753 = _1635 * _1705;
    float _1755 = float(uint(_1751));
    float _1757 = -_1583;
    float _1759 = _1521 + _1757;
    float _1761 = _1681 * 6.283185482025146484375;
    float _1763 = sin(_1761);
    int _1765 = _1713 * int(_1737);
    int _1767 = _1765 + _1693;
    float _1769 = as_type<float>(_1701) * _1755;
    float _1771 = _1691 * _1635;
    float _1773 = _1691 * _1705;
    int _1775 = ~_1447;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1759, 2.0, -1.0);
    float _1781 = _1747 * _1635;
    float _1783 = float(uint(_1767));
    float _1785 = trunc(_1769);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    float _1791 = _1747 * _1607;
    float _1793 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1795 = _1747 * _1705;
    float _1797 = as_type<float>(_1655) * _1783;
    int _1799 = _1679 ^ _1447;
    float _1801 = fma(_1763, _1781, _1741);
    float _1803 = fma(_1763, _1741, _1781);
    float _1805 = floor(_1525);
    float _1807 = _1793 * _767;
    float _1809 = -_1011;
    float _1811 = _1763 * _1809;
    float _1813 = -_643;
    float _1815 = _1763 * _1813;
    float _1817 = _1607 * _1705;
    float _1819 = fma(_1753, _1807, _1811);
    float _1821 = fma(_1753, _647, _1815);
    float _1823 = trunc(_1797);
    float _1825 = precise::max(_1823, 0.0);
    uint _1827 = uint(_1825);
    int _1829 = int(_1719) + int(_1789);
    float _1831 = _1795 * _1011;
    float _1833 = _1773 * _1011;
    float _1835 = _1795 * _643;
    float _1837 = _1773 * _643;
    int _1839 = _1777 * _1829;
    int _1841 = _1839 + _1679;
    float _1843 = fma(_1801, _1807, _1831);
    float _1845 = -_1805;
    float _1847 = _1525 + _1845;
    float _1849 = -_1791;
    float _1851 = fma(_1763, _1771, _1849);
    float _1853 = -_1771;
    float _1855 = fma(_1763, _1791, _1853);
    int _1857 = ~_1501;
    int _1859 = _1857 + 1;
    bool _1861 = uint(_1841) >= uint(_1447);
    float _1863 = fma(_1851, _1807, _1833);
    float _1865 = fma(_1851, _647, _1837);
    int _1867 = int(_1737) + int(_1827);
    float _1869 = fma(_1801, _647, _1835);
    bool _1871 = !_1861;
    int _1873 = _1871 ? 0 : (-1);
    float _1875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1877 = uint(int(uint(_1799) >> uint(31)));
    int _1879 = _1859 * _1867;
    int _1881 = _1879 + _1693;
    int _1883 = ~_1829;
    int _1885 = _1883 + _1873;
    int _1887 = _1885 + 1;
    float _1889 = fma(_1817, _1003, _1819);
    float _1891 = fma(_1847, 2.0, -1.0);
    int _1893 = ~int(_1877);
    int _1895 = _1893 + 1;
    float _1897 = fma(_1855, _1003, _1843);
    bool _1899 = uint(_1881) >= uint(_1501);
    int _1901 = _1447 * _1887;
    int _1903 = _1901 + _1679;
    float _1905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1907 = _1891 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1909 = !_1899;
    int _1911 = _1909 ? 0 : (-1);
    float _1913 = fma(_1855, _639, _1869);
    bool _1915 = _1447 == 0;
    float _1917 = _1907 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    int _1919 = ~_1911;
    int _1921 = _1867 + _1919;
    int _1923 = _1921 + 1;
    float _1925 = _1907 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1927 = _1907 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    bool _1929 = !_1915;
    int _1931 = _1929 ? _1903 : (-1);
    float _1933 = _1875 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1935 = _1923 ^ _1895;
    float _1937 = fma(_1817, _639, _1821);
    float _1939 = float(_1931);
    float _1941 = fma(_1803, _1003, _1863);
    int _1943 = ~_1895;
    int _1945 = _1943 + _1935;
    int _1947 = _1945 + 1;
    float _1949 = fma(_1803, _639, _1865);
    float _1951 = _1905 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1953 = fma(_1933, _512, -0.5);
    bool _1955 = !_1743;
    int _1957 = _1955 ? _1947 : (-1);
    float _1959 = fma(_1933, _1939, _761);
    float _1961 = _1913 * _342;
    float _1963 = _1913 * _346;
    float _1965 = float(_1957);
    float _1967 = _1913 * _352;
    float _1969 = fma(_1951, _536, -0.5);
    float _1971 = fma(_1937, _318, _1961);
    float _1973 = fma(_1937, _322, _1963);
    float _1975 = -_763;
    float _1977 = fma(_1951, _1965, _1975);
    float _1979 = fma(_1937, _326, _1967);
    float _1981 = fma(_1949, _356, _1971);
    float _1983 = _1611 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1985 = fma(_1251, _1969, _1977);
    float _1987 = fma(_1949, _360, _1973);
    float _1989 = fma(_1949, _366, _1979);
    bool _1991 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1993 = isnan(1.0);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1999 = _1995 || _1997;
    float _2001 = _1985 + 0.5;
    float _2003 = fma(_1245, _1953, _1959);
    float _2005 = _1897 * _342;
    out.m_91.x = _1981;
    out.m_91.y = _1987;
    out.m_91.z = _1989;
    float _2007 = _1897 * _346;
    float _2009 = fma(_1983, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1925);
    float _2011 = fma(_1983, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1917);
    float _2013 = _1695 + 0.5;
    float _2015 = _1897 * _352;
    float _2017 = fma(_1983, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1927);
    float _2019 = _1779 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2021 = _1341 + 0.5;
    float _2023 = _2003 + 0.5;
    float _2025 = fma(_1889, _326, _2015);
    float _2027 = fma(_1889, _318, _2005);
    float _2029 = fma(_1889, _322, _2007);
    float _2031 = fma(_2019, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2009);
    float _2033 = fma(_2019, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2011);
    float _2035 = fma(_2019, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2017);
    out.m_93.x = _2023;
    out.m_93.y = _2001;
    out.m_93.z = _2013;
    out.m_93.w = _2021;
    float _2037 = fma(_1941, _366, _2025);
    float _2039 = fma(_1941, _356, _2027);
    float _2041 = fma(_1941, _360, _2029);
    float _2043 = _2031 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2045 = _2035 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2047 = _2039 + _2043;
    float _2049 = _2037 + _2045;
    float _2051 = _2033 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2053 = _2041 + _2051;
    float _2055 = _2037;
    float _2057 = _2041;
    float _2059 = _1611;
    float _2061 = _1891;
    float _2063 = _2001;
    float _2065 = _1779;
    float _2067 = _2023;
    float _2069 = as_type<float>(_1903);
    float _2079;
    float _2081;
    float _2083;
    float _2085;
    if (!_1999)
    {
        bool _2071 = _2051 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2073 = !_2071;
        _2075 = _2073;
        if (!_2075)
        {
            float _2077 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2079 = _2077;
            _2081 = 0.0;
            _2083 = 0.0;
            _2085 = 0.0;
            _2087 = true;
        }
    }
    if ((!_2087) || _2075)
    {
        bool _2125;
        if (!_2075)
        {
            bool _2089 = _2051 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2091 = isnan(_2051);
            bool _2093 = _2089 || _2091;
            bool _2095 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2097 = _2093 || _2095;
            bool _2099 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2101 = !_2097;
            bool _2103 = _2099 && _2101;
            bool _2105 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2107 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2103)
            {
                _362 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2109 = _362;
            float _2111 = _2109;
            if (_2103)
            {
                _2055 = 0.0;
            }
            float _2113 = _2055;
            _2081 = _2113;
            if (_2103)
            {
                _348 = 0.0;
            }
            float _2115 = _348;
            _2083 = _2115;
            if (_2103)
            {
                float _2117 = _2109 * 5.0;
                _2111 = _2117;
            }
            float _2119 = _2111;
            _2079 = _2119;
            if (_2103)
            {
                _2107 = 0.0;
            }
            float _2121 = _2107;
            bool _2123 = !_2097;
            _2125 = _2123 && _2105;
            _2057 = _2121;
            _2085 = _2121;
        }
        if ((!_2125) || _2075)
        {
            _2075 = false;
            float _2127 = _2057;
            bool _2129 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2131 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2133 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2135 = _2039;
            float _2137 = _2127;
            _2079 = _2049;
            _2081 = _2047;
            _2083 = _2053;
            if (_2129)
            {
                float _2139 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2135 = _2139;
            }
            float _2141 = _2135;
            if (_2129)
            {
                float _2143 = abs(_1611);
                float _2145 = -_2143;
                float _2147 = _2145 + 1.0;
                _2059 = _2147;
            }
            float _2149 = _2059;
            if (_2131)
            {
                float _2151 = abs(_1891);
                float _2153 = -_2151;
                float _2155 = _2153 + 1.0;
                _2061 = _2155;
            }
            float _2157 = _2061;
            if (!_2129)
            {
                _2063 = 1.0;
            }
            float _2159 = _2063;
            float _2161 = _2159;
            if (_2133)
            {
                float _2163 = abs(_1779);
                float _2165 = -_2163;
                float _2167 = _2165 + 1.0;
                _2065 = _2167;
            }
            float _2169 = _2065;
            if (!_2131)
            {
                _2067 = 1.0;
            }
            float _2171 = _2067;
            float _2173 = _2171;
            if (!_2133)
            {
                _2137 = 1.0;
            }
            float _2175 = _2137;
            float _2177 = _2021;
            float _2179 = _2175;
            if (_2131)
            {
                float _2181 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2177 = _2181;
            }
            float _2183 = _2177;
            float _2185 = _1341;
            if (_2133)
            {
                float _2187 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2185 = _2187;
            }
            float _2189 = _2185;
            if (_2129)
            {
                float _2191 = _2149 * _2141;
                float _2193 = precise::clamp(_2191, 0.0, 1.0);
                _2161 = _2193;
            }
            float _2195 = _2161;
            if (_2131)
            {
                float _2197 = _2157 * _2183;
                float _2199 = precise::clamp(_2197, 0.0, 1.0);
                _2173 = _2199;
            }
            float _2201 = _2173;
            float _2203 = _2195 * _2201;
            if (_2133)
            {
                float _2205 = _2169 * _2189;
                float _2207 = precise::clamp(_2205, 0.0, 1.0);
                _2179 = _2207;
            }
            float _2209 = _2179;
            float _2211 = _2203 * _2209;
            _2085 = _2211;
        }
    }
    _2087 = false;
    float _2213 = _2079;
    float _2215 = _2081;
    float _2217 = _2083;
    float _2219 = _2085;
    float _2221 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2223 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2225 = floor(_2221);
    float _2227 = floor(_2223);
    float _2229 = -_2225;
    float _2231 = _2221 + _2229;
    float _2233 = -_2227;
    float _2235 = _2223 + _2233;
    float2 _7161 = float2(_2231, _2235);
    float _2237 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7161, float2(0.0), isnan(_7161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7161, float2(0.0), isnan(_7161)), level(0.0)).x;
    float _2239 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2243 = _2213 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2247 = _2215 + _2245;
    float _2249 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2239);
    float _2251 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2249);
    float _2253 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2255 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2257 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2253);
    float _2259 = 1.0 / _2255;
    float _2261 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2257);
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2265 = _2263 + _2255;
    float _2267 = _2265 * _2259;
    float _2269 = _2267 * 0.5;
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2273 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2271);
    float _2275 = 1.0 / _2273;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2279 = _2275 * _2277;
    float _2281 = _2243 * _2243;
    bool _2283 = _2279 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2285 = fma(_2247, _2247, _2281);
    bool _2287 = _2279 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2289 = !_2283;
    int _2291 = _2289 ? 0 : 1;
    float _2293 = sqrt(_2285);
    int _2295 = 2;
    float _2297 = _2217;
    float _2299 = _2215;
    float _2301 = _2213;
    float _2303 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    if (!_2283)
    {
        _2295 = 1;
    }
    int _2305 = _2295;
    int _2307 = _2305;
    if (!_2287)
    {
        _2307 = _2291;
    }
    int _2309 = _2307;
    float _2311 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _2313 = _2309 << 6;
    float _2315 = _2051 + _2311;
    bool _2317 = _2293 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2319 = _2313 + 48;
    uint _2321 = uint(int(uint(_2319) >> uint(2)));
    uint _2323 = uint(int(uint(int(_2321)) >> uint(2)));
    int _2325 = int(_2321) & 3;
    float _2327 = (*spvDescriptorSet0.vp_c15)._m0[int(_2323)][_2325];
    int _2329 = int(_2321) + 1;
    uint _2331 = uint(int(uint(_2329) >> uint(2)));
    int _2333 = _2329 & 3;
    float _2335 = (*spvDescriptorSet0.vp_c15)._m0[int(_2331)][_2333];
    float _2337 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2339 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2341 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2337);
    float _2343 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2339);
    int _2345 = _2313 + 56;
    uint _2347 = uint(int(uint(_2345) >> uint(2)));
    uint _2349 = uint(int(uint(int(_2347)) >> uint(2)));
    int _2351 = int(_2347) & 3;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[int(_2349)][_2351];
    int _2355 = int(_2347) + 1;
    uint _2357 = uint(int(uint(_2355) >> uint(2)));
    int _2359 = _2355 & 3;
    float _2361 = (*spvDescriptorSet0.vp_c15)._m0[int(_2357)][_2359];
    float _2363 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2341);
    float _2365 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2343);
    float _2367 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2369 = _2365 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2371 = _2313 + 64;
    uint _2373 = uint(int(uint(_2371) >> uint(2)));
    uint _2375 = uint(int(uint(int(_2373)) >> uint(2)));
    int _2377 = int(_2373) & 3;
    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[int(_2375)][_2377];
    int _2381 = int(_2373) + 1;
    uint _2383 = uint(int(uint(_2381) >> uint(2)));
    int _2385 = _2381 & 3;
    float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
    float _2389 = trunc(_2367);
    int _2391 = int(_2389);
    int _2393 = _2313 + 72;
    uint _2395 = uint(int(uint(_2393) >> uint(2)));
    uint _2397 = uint(int(uint(int(_2395)) >> uint(2)));
    int _2399 = int(_2395) & 3;
    float _2401 = (*spvDescriptorSet0.vp_c15)._m0[int(_2397)][_2399];
    int _2403 = int(_2395) + 1;
    uint _2405 = uint(int(uint(_2403) >> uint(2)));
    int _2407 = _2403 & 3;
    float _2409 = (*spvDescriptorSet0.vp_c15)._m0[int(_2405)][_2407];
    float _2411 = trunc(_2369);
    int _2413 = int(_2411);
    int _2415 = _2313 + 96;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    uint _2419 = uint(int(uint(int(_2417)) >> uint(2)));
    int _2421 = int(_2417) & 3;
    float _2423 = (*spvDescriptorSet0.vp_c15)._m0[int(_2419)][_2421];
    int _2425 = int(_2417) + 1;
    uint _2427 = uint(int(uint(_2425) >> uint(2)));
    int _2429 = _2425 & 3;
    float _2431 = (*spvDescriptorSet0.vp_c15)._m0[int(_2427)][_2429];
    int _2433 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2435 = _2391 + _2433;
    int _2437 = _2435 + 1;
    int _2439 = _2313 + 104;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    uint _2443 = uint(int(uint(int(_2441)) >> uint(2)));
    int _2445 = int(_2441) & 3;
    float _2447 = (*spvDescriptorSet0.vp_c15)._m0[int(_2443)][_2445];
    int _2449 = int(_2441) + 1;
    uint _2451 = uint(int(uint(_2449) >> uint(2)));
    int _2453 = _2449 & 3;
    float _2455 = (*spvDescriptorSet0.vp_c15)._m0[int(_2451)][_2453];
    bool _2457 = !_2317;
    int _2459 = as_type<int>(_2335);
    float _2461 = _2401;
    float _2463 = _2409;
    float _2465 = as_type<float>(_2309);
    float _2467 = as_type<float>(_2437);
    if (!_2457)
    {
        float _2469 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2473 = _2293 + _2471;
        float _2475 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2477 = rsqrt(_2285);
        float _2479 = _2473 * _2469;
        float _2481 = _2479 * 0.15915493667125701904296875;
        float _2483 = _2481 * 6.283185482025146484375;
        float _2485 = cos(_2483);
        float _2487 = _2481 * 6.283185482025146484375;
        float _2489 = sin(_2487);
        float _2491 = _2485 + (-1.0);
        float _2493 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2495 = fma(_2489, _2475, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2497 = fma(_2485, _2217, _2493);
        float _2499 = _2477 * _2495;
        float _2501 = fma(_2247, _2499, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2503 = fma(_2243, _2499, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2297 = _2497;
        _2299 = _2501;
        _2301 = _2503;
    }
    float _2505 = _2297;
    float _2507 = _2299;
    float _2509 = _2301;
    float _2511 = -_2051;
    float _2513 = _2511 + _2505;
    int _2515 = _2313 + 80;
    uint _2517 = uint(int(uint(_2515) >> uint(2)));
    uint _2519 = uint(int(uint(int(_2517)) >> uint(2)));
    int _2521 = int(_2517) & 3;
    float _2523 = (*spvDescriptorSet0.vp_c15)._m0[int(_2519)][_2521];
    int _2525 = int(_2517) + 1;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    int _2529 = _2525 & 3;
    float _2531 = (*spvDescriptorSet0.vp_c15)._m0[int(_2527)][_2529];
    float _2533 = -_2043;
    float _2535 = _2533 + _2507;
    int _2537 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2539 = _2413 + _2537;
    int _2541 = _2539 + 1;
    float _2543 = _2513 * _2513;
    float _2545 = -_2045;
    float _2547 = _2545 + _2509;
    bool _2549 = _2437 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2551 = fma(_2535, _2535, _2543);
    int _2553 = _2437 | _2541;
    float _2555 = _2315 * _2431;
    bool _2557 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2559 = isnan(0.5);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2565 = _2561 || _2563;
    float _2567 = fma(_2547, _2547, _2551);
    bool _2569 = _2553 < 0;
    bool _2571 = _2569 || _2549;
    float _2573 = fma(_2043, _2423, _2555);
    float _2575 = _2315 * _2335;
    float _2577 = sqrt(_2567);
    bool _2579 = _2541 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2581 = _2579 || _2571;
    float _2583 = fma(_2045, _2447, _2573);
    float _2585 = fma(_2043, _2327, _2575);
    float _2587 = _2583 + _2455;
    float _2589 = fma(_2045, _2353, _2585);
    float _2591 = 1.0 / _2587;
    int _2593 = as_type<int>(_2555);
    int _2595 = as_type<int>(_2583);
    float _2597 = _2507;
    float _2599 = _2509;
    float _2601 = _2505;
    if (!_2581)
    {
        int _2603 = _2541 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2605 = _2603 + _2437;
        _2593 = _2605;
    }
    int _2607 = _2593;
    bool _2609 = _2577 > 0.0;
    float _2611 = _2315 * _2387;
    float _2613 = as_type<float>(_2607);
    if (!_2581)
    {
        int _2615 = _2607 << 2;
        _2595 = _2615;
    }
    int _2617 = _2595;
    float _2619 = _2447;
    int _2621 = _2617;
    if (!_2581)
    {
        float _2623 = floor(_2367);
        _2619 = _2623;
    }
    float _2625 = _2619;
    float _2627 = fma(_2043, _2379, _2611);
    float _2629 = _2627;
    if (!_2581)
    {
        uint _2631 = uint(int(uint(_2607) >> uint(2)));
        _2459 = int(_2631);
    }
    int _2633 = _2459;
    int _2635 = _2633;
    if (!_2581)
    {
        int _2637 = 12 & _2617;
        _2621 = _2637;
    }
    int _2639 = _2621;
    float _2641 = fma(_2045, _2401, _2627);
    float _2643 = as_type<float>(_2639);
    if (!_2581)
    {
        int _2645 = _2633 << 4;
        int _2647 = _2645 + _2639;
        _2635 = _2647;
    }
    int _2649 = _2635;
    if (!_2609)
    {
        _2629 = _2505;
    }
    float _2651 = _2629;
    float _2653 = _2651;
    float _2655 = _2651;
    if (!_2609)
    {
        _2461 = _2509;
    }
    float _2657 = _2461;
    bool _2659 = !_2609;
    float _2661 = _2657;
    if (!_2659)
    {
        float _2663 = _288 * _288;
        float _2665 = fma(_280, _280, _2663);
        float _2667 = fma(_330, _330, _2665);
        float _2669 = rsqrt(_2567);
        float _2671 = sqrt(_2667);
        float _2673 = _2535 * _2669;
        float _2675 = _2513 * _2669;
        float _2677 = _2547 * _2669;
        bool _2679 = _2671 > 0.0;
        float _2681 = _2669;
        _2643 = _2673;
        if (!_2679)
        {
            _2653 = _2505;
        }
        float _2683 = _2653;
        _2655 = _2683;
        if (!_2679)
        {
            _2681 = _2509;
        }
        float _2685 = _2681;
        bool _2687 = !_2679;
        _2661 = _2685;
        if (!_2687)
        {
            float _2689 = rsqrt(_2667);
            float _2691 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2693 = _288 * _2689;
            float _2695 = _280 * _2689;
            float _2697 = _2675 * _2693;
            float _2699 = _330 * _2689;
            float _2701 = fma(_2673, _2695, _2697);
            float _2703 = _2691 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2705 = fma(_2677, _2699, _2701);
            float _2707 = _2705 * _2703;
            float _2709 = fma(_280, _2707, _2507);
            float _2711 = fma(_288, _2707, _2505);
            float _2713 = fma(_330, _2707, _2509);
            _2655 = _2711;
            _2661 = _2713;
            _2597 = _2709;
        }
    }
    float _2715 = _2655;
    float _2717 = _2661;
    float _2719 = _2597;
    float _2721 = _2643;
    float _2723 = _2589 + _2361;
    float _2725 = _2641 + _2409;
    float _2727 = _2719;
    if (_2565)
    {
        _2599 = _2715;
    }
    float _2729 = _2599;
    float _2731 = _2729;
    if (_2565)
    {
        _2601 = _2717;
    }
    float _2733 = _2601;
    float _2735 = _2733;
    if (!_2565)
    {
        float _2737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2739 = _2051 + _2737;
        float _2741 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2743 = _2043 + _2741;
        float _2745 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2747 = -_2043;
        float _2749 = _2747 + _2719;
        float _2751 = _2739 * _2739;
        float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2755 = _2045 + _2753;
        float _2757 = -_2051;
        float _2759 = _2757 + _2715;
        float _2761 = -_2045;
        float _2763 = _2761 + _2717;
        float _2765 = fma(_2743, _2743, _2751);
        float _2767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2769 = fma(_2755, _2755, _2765);
        float _2771 = sqrt(_2769);
        float _2773 = _2745 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2775 = precise::min(_2771, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2777 = _2775 * _2767;
        float _2779 = _2773 * _2777;
        float _2781 = fma(_2749, _2779, _2043);
        float _2783 = fma(_2759, _2779, _2051);
        float _2785 = fma(_2763, _2779, _2045);
        _2731 = _2783;
        _2727 = _2781;
        _2735 = _2785;
        _2463 = _2771;
    }
    float _2787 = _2731;
    float _2789 = _2727;
    float _2791 = _2735;
    float _2793 = _2463;
    float _2795 = _2721;
    if (!_2581)
    {
        int _2797 = _2649 + 400;
        uint _2799 = uint(int(uint(_2797) >> uint(2)));
        uint _2801 = uint(int(uint(int(_2799)) >> uint(2)));
        int _2803 = int(_2799) & 3;
        float _2805 = (*spvDescriptorSet0.vp_c15)._m0[int(_2801)][_2803];
        _2795 = _2805;
    }
    float _2807 = _2795;
    float _2809 = _2725 * _2591;
    float _2811 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2813 = _2723 * _2591;
    float _2815 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2817 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2819 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2811);
    float _2821 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _2823 = _2313 + 88;
    uint _2825 = uint(int(uint(_2823) >> uint(2)));
    uint _2827 = uint(int(uint(int(_2825)) >> uint(2)));
    int _2829 = int(_2825) & 3;
    float _2831 = (*spvDescriptorSet0.vp_c15)._m0[int(_2827)][_2829];
    int _2833 = int(_2825) + 1;
    uint _2835 = uint(int(uint(_2833) >> uint(2)));
    int _2837 = _2833 & 3;
    float _2839 = (*spvDescriptorSet0.vp_c15)._m0[int(_2835)][_2837];
    float _2841 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2815);
    float _2843 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2819);
    bool _2845 = _2813 >= 0.0;
    float _2847 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2817);
    float _2849 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2841);
    float _2851 = _2843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2853 = _2813 <= 1.0;
    bool _2855 = _2853 && _2845;
    float _2857 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2847);
    float _2859 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2821);
    float _2861 = _2849 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2863 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2865 = _2857 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2867 = _2809 >= 0.0;
    bool _2869 = _2867 && _2855;
    float _2871 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2859);
    float _2873 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2863);
    float _2875 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2877 = _2865 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2879 = _2809 <= 1.0;
    bool _2881 = _2879 && _2869;
    float _2883 = _2871 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2885 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2873);
    float _2887 = -_2877;
    float _2889 = fma(_2887, _2875, 1.0);
    float _2891 = _2793;
    if (!_2581)
    {
        float _2893 = floor(_2369);
        _2891 = _2893;
    }
    float _2895 = _2891;
    float _2897 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2899 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2885);
    float _2901 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2903 = _2315 * _2531;
    float _2905 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2897);
    float _2907 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2901);
    float _2909 = log2(_2889);
    float _2911 = _2901;
    if (_2881)
    {
        float _2913 = float(_2309);
        _2465 = _2913;
    }
    float _2915 = _2465;
    float _2917 = fma(_2043, _2523, _2903);
    float _2919 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2905);
    float _2921 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2907);
    float _2923 = _2915;
    if (!_2581)
    {
        float _2925 = -_2625;
        float _2927 = _2367 + _2925;
        _2911 = _2927;
    }
    float _2929 = _2911;
    float _2931 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2919);
    float _2933 = 1.0 / _2899;
    float _2935 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2921);
    if (!_2581)
    {
        float _2937 = -_2895;
        float _2939 = _2369 + _2937;
        _2467 = _2939;
    }
    float _2941 = _2467;
    float _2943 = _2903;
    if (_2881)
    {
        float _2945 = rint(_2915);
        float _2947 = precise::max(_2945, 0.0);
        uint _2949 = uint(_2947);
        uint _2951 = clamp(_2949, 0u, 65535u);
        _2943 = as_type<float>(_2951);
    }
    float _2953 = _2943;
    float _2955 = _2909 * 0.693147182464599609375;
    float _2957 = fma(_2045, _2831, _2917);
    float _2959 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2961 = _2957 + _2839;
    float _2963 = _2625;
    if (!_2581)
    {
        float _2965 = rint(_2807);
        float _2967 = precise::max(_2965, 0.0);
        uint _2969 = uint(_2967);
        uint _2971 = clamp(_2969, 0u, 65535u);
        _2963 = as_type<float>(_2971);
    }
    float _2973 = _2963;
    float _2975 = _2931 * _2933;
    float _2977 = _2935 * _2933;
    float _2979 = _2961 * _2591;
    float _2981 = fma(_2975, 0.5, 0.5);
    float _2983 = fma(_2977, -0.5, 0.5);
    float _2985 = _2809;
    if (_2881)
    {
        float3 _8400 = float3(_2813, _2809, float(as_type<int>(_2953)));
        float3 _8404 = select(_8400, float3(0.0), isnan(_8400));
        float _2987 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8404.xy, uint(rint(_8404.z)), _2979, level(0.0));
        _2985 = _2987;
    }
    float _2989 = _2985;
    float3 _8414 = float3(_2981, _2983, _2959);
    float _2991 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8414, float3(0.0), isnan(_8414)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8414, float3(0.0), isnan(_8414)), level(0.0)).x;
    float3 _8423 = float3(_2981, _2983, _2959);
    float4 _2994 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8423, float3(0.0), isnan(_8423)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8423, float3(0.0), isnan(_8423)), level(0.0)).xyzw;
    float _2996 = _2994.x;
    float _2998 = _2994.y;
    float _3000 = _2994.z;
    float _3002 = _2994.w;
    float _3004 = _2929;
    if (!_2581)
    {
        float3 _8446 = float3(_2929, _2941, float(as_type<int>(_2973)));
        float3 _8448 = select(_8446, float3(0.0), isnan(_8446));
        float _3006 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8448.xy, uint(rint(_8448.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8448.xy, uint(rint(_8448.z)), level(0.0)).x;
        _3004 = _3006;
    }
    float _3008 = _3004;
    if (_2581)
    {
        _2923 = 1.0;
    }
    float _3010 = _2923;
    float _3012 = _3010;
    if (!_2581)
    {
        int _3014 = _2607 << 4;
        int _3016 = _3014 + 2048;
        uint _3018 = uint(int(uint(_3016) >> uint(2)));
        uint _3020 = uint(int(uint(int(_3018)) >> uint(2)));
        int _3022 = int(_3018) & 3;
        float _3024 = (*spvDescriptorSet0.vp_c15)._m0[int(_3020)][_3022];
        int _3026 = int(_3018) + 1;
        uint _3028 = uint(int(uint(_3026) >> uint(2)));
        int _3030 = _3026 & 3;
        float _3032 = (*spvDescriptorSet0.vp_c15)._m0[int(_3028)][_3030];
        int _3034 = _3016 + 8;
        uint _3036 = uint(int(uint(_3034) >> uint(2)));
        uint _3038 = uint(int(uint(int(_3036)) >> uint(2)));
        int _3040 = int(_3036) & 3;
        float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
        int _3044 = int(_3036) + 1;
        uint _3046 = uint(int(uint(_3044) >> uint(2)));
        int _3048 = _3044 & 3;
        float _3050 = (*spvDescriptorSet0.vp_c15)._m0[int(_3046)][_3048];
        float _3052 = _2315 * _3032;
        float _3054 = fma(_2043, _3024, _3052);
        float _3056 = fma(_2045, _3042, _3054);
        float _3058 = _3056 + _3050;
        float _3060 = precise::clamp(_3058, 0.0, 1.0);
        float _3062 = -_3060;
        float _3064 = _3062 + _3008;
        float _3066 = fma(_3064, 500.0, 1.5);
        float _3068 = exp2(_3066);
        float _3070 = 0.0 + _3068;
        float _3072 = precise::clamp(_3070, 0.0, 1.0);
        _2613 = as_type<float>(_3016);
        _3012 = _3072;
    }
    float _3074 = _2613;
    float _3076 = _3012;
    float _3078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3080 = _2787 + _3078;
    float _3082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3084 = _2789 + _3082;
    float _3086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3088 = _2791 + _3086;
    float _3090 = _3080 * _3080;
    float _3092 = fma(_3084, _3084, _3090);
    float _3094 = fma(_3088, _3088, _3092);
    float _3096 = rsqrt(_3094);
    float _3098 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3100 = _3084 * _3098;
    float _3102 = _3088 * _3098;
    float _3104 = _3100 * _3100;
    float _3106 = _3102 * _3102;
    float _3108 = _3104 + _3106;
    float _3110 = sqrt(_3108);
    bool _3112 = _3110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3116 = _3110 + _3114;
    float _3118 = _3088;
    float _3120 = _3108;
    float _3122 = _3116;
    float _3124 = _3074;
    float _3126 = _3080;
    float _3128 = _3098;
    if (_3112)
    {
        float _3130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3118 = _3130;
    }
    float _3132 = _3118;
    if (_3112)
    {
        float _3134 = rsqrt(_3108);
        _3120 = _3134;
    }
    float _3136 = _3120;
    float _3138 = _3136;
    if (_3112)
    {
        float _3140 = _3116 * _3132;
        _3122 = _3140;
    }
    float _3142 = _3122;
    if (_3112)
    {
        float _3144 = _3142 * 0.15915493667125701904296875;
        _3124 = _3144;
    }
    float _3146 = _3124;
    float _3148 = _3090;
    if (_3112)
    {
        float _3150 = _3146 * 6.283185482025146484375;
        float _3152 = sin(_3150);
        _3148 = _3152;
    }
    float _3154 = _3148;
    float _3156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3158 = precise::max(0.0, _3156);
    float _3160 = _3096;
    float _3162 = _3156;
    if (_3112)
    {
        float _3164 = _3146 * 6.283185482025146484375;
        float _3166 = cos(_3164);
        _3160 = _3166;
    }
    float _3168 = _3160;
    float _3170 = -_3098;
    float _3172 = -_3158;
    float _3174 = fma(_3080, _3170, _3172);
    float _3176 = _3174;
    if (!_3112)
    {
        _3126 = _3102;
    }
    float _3178 = _3126;
    float _3180 = _3178;
    if (_3112)
    {
        float _3182 = _3174 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3162 = _3182;
    }
    float _3184 = _3162;
    float _3186 = _3154;
    float _3188 = _3184;
    if (_3112)
    {
        float _3190 = fma(_3154, _3184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3186 = _3190;
    }
    float _3192 = _3186;
    float _3194 = _3192;
    float _3196 = _3168;
    if (_3112)
    {
        float _3198 = _3168 + (-1.0);
        _3188 = _3198;
    }
    float _3200 = _3188;
    if (_3112)
    {
        float _3202 = _3136 * _3192;
        _2069 = _3202;
    }
    float _3204 = _2069;
    if (!_3112)
    {
        _3194 = _3100;
    }
    float _3206 = _3194;
    float _3208 = _3206;
    if (_3112)
    {
        float _3210 = _3200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3128 = _3210;
    }
    float _3212 = _3128;
    if (_3112)
    {
        float _3214 = _3100 * _3204;
        _3208 = _3214;
    }
    float _3216 = _3208;
    if (_3112)
    {
        float _3218 = _3102 * _3204;
        _3180 = _3218;
    }
    float _3220 = _3180;
    if (!_3112)
    {
        _3138 = _3106;
    }
    float _3222 = _3138;
    float _3224 = _3222;
    if (_3112)
    {
        float _3226 = fma(_3174, _3168, _3212);
        _3176 = _3226;
    }
    float _3228 = _3176;
    if (!_3112)
    {
        _3196 = _3104;
    }
    float _3230 = _3196;
    float _3232 = _3230;
    if (_3112)
    {
        float _3234 = _3216 * _3216;
        _3232 = _3234;
    }
    float _3236 = _3232;
    if (_3112)
    {
        float _3238 = _3220 * _3220;
        _3224 = _3238;
    }
    float _3240 = _3224;
    float _3242 = sqrt(_3094);
    float _3244 = fma(_3228, _3228, _3236);
    float _3246 = _3244 + _3240;
    float _3248 = rsqrt(_3246);
    float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3252 = fma(_3242, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3250);
    float _3254 = precise::clamp(_3252, 0.0, 1.0);
    float _3256 = -_3254;
    float _3258 = _3256 + 1.0;
    float _3260 = abs(_3258);
    float _3262 = log2(_3260);
    float _3264 = _3248 * _3216;
    float _3266 = _3248 * _3228;
    float _3268 = _3248 * _3220;
    float _3270 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3272 = -_3270;
    float _3274 = fma(_3266, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3272);
    float _3276 = -_3268;
    float _3278 = fma(_3276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3274);
    float _3280 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3282 = fma(_3278, -0.5, 0.5);
    float _3284 = fma(_3278, 0.5, 0.5);
    float _3286 = exp2(_3280);
    float _3288 = _3266 + 1.0;
    float _3290 = fma(_3284, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3292 = fma(_3284, _3290, -0.212114393711090087890625);
    float _3294 = sqrt(_3282);
    float _3296 = fma(_3284, _3292, 1.570728778839111328125);
    float _3298 = -_3266;
    float _3300 = fma(_3286, _3288, _3298);
    float _3302 = fma(_3300, 0.5, 0.5);
    float _3304 = _3294 * 0.636619746685028076171875;
    float _3306 = -_3296;
    float _3308 = fma(_3304, _3306, 1.0);
    float2 _8917 = float2(_3308, _3302);
    float3 _3312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8917, float2(0.0), isnan(_8917)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8917, float2(0.0), isnan(_8917)), level(0.0)).xyz;
    float _3314 = _3312.x;
    float _3316 = _3312.y;
    float _3318 = _3312.z;
    float _3320 = abs(_2279);
    float _3322 = log2(_3320);
    float _3324 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3326 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3328 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3330 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3332 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3324);
    float _3334 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3326);
    float _3336 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3328);
    float _3338 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3330);
    float _3340 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3332);
    float _3342 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3344 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3334);
    float _3346 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3336);
    float _3348 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3338);
    float _3350 = _3322 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3352 = _3340 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3354 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3342);
    float _3356 = _3344 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3358 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3360 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3362 = exp2(_3350);
    float _3364 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3354);
    float _3366 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3368 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3370 = _2279 <= 8000.0;
    bool _3372 = isnan(_2279);
    bool _3374 = _3370 || _3372;
    bool _3376 = isnan(8000.0);
    bool _3378 = _3374 || _3376;
    float _3380 = float(_3378);
    float _3382 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3360);
    float _3384 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3364);
    float _3386 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3366);
    float _3388 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3368);
    float _3390 = -_2237;
    float _3392 = _3390 + 1.0;
    out.m_95.y = 1.0;
    float _3394 = -_280;
    float _3396 = _3394 + _2789;
    float _3398 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3388);
    float _3400 = -_330;
    float _3402 = _3400 + _2791;
    out.gl_Position.x = _2931;
    out.gl_Position.y = _2935;
    out.gl_Position.z = _3384;
    out.gl_Position.w = _2899;
    float _3404 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3406 = precise::clamp(_3404, 0.0, 1.0);
    float _3408 = fma(_3406, -2.0, 3.0);
    float _3410 = _3406 * _3406;
    float _3412 = _3410 * _3408;
    float _3414 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3416 = -_3412;
    float _3418 = _3416 + 1.0;
    float _3420 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3414);
    float _3422 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3424 = fma(_3418, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3412);
    float _3426 = _3348 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3428 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3430 = _3422 + _3382;
    float _3432 = _3380 * _3424;
    float _3434 = _3384 + _2899;
    float _3436 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3430);
    float _3438 = exp2(_3428);
    float _3440 = _3434 * 0.5;
    float _3442 = _3434;
    if (!_2881)
    {
        _3442 = 1.0;
    }
    float _3444 = _3442;
    float _3446 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3398);
    float _3448 = _3444;
    if (_2881)
    {
        bool _3450 = _2989 >= _2979;
        bool _3452 = isnan(_2989);
        bool _3454 = _3450 || _3452;
        bool _3456 = isnan(_2979);
        bool _3458 = _3454 || _3456;
        float _3460 = float(_3458);
        _3448 = _3460;
    }
    float _3462 = _3448;
    float _3464 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_97.z = _3440;
    out.m_97.w = _2899;
    float _3466 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3468 = 1.0 / _3436;
    float _3470 = _3392 * _3464;
    float _3472 = precise::clamp(_3470, 0.0, 1.0);
    float _3474 = _3462 * _3076;
    float _3476 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3478 = _3466 + _3420;
    float _3480 = -_3472;
    float _3482 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3484 = _3476 + _3386;
    float _3486 = -_3438;
    float _3488 = _3486 + 1.0;
    float _3490 = -_288;
    float _3492 = _3490 + _2787;
    float _3494 = -_3474;
    float _3496 = fma(_3494, _3482, 1.0);
    float _3498 = precise::clamp(_3496, 0.0, 1.0);
    float _3500 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3478);
    float _3502 = _3488 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3504 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3484);
    float _3506 = _3502 * _2991;
    float _3508 = _3446 * _3468;
    float _3510 = -_3502;
    float _3512 = _3510 + 1.0;
    float _3514 = _3500 * _3468;
    float _3516 = _3002 * _3506;
    float _3518 = _3504 * _3468;
    bool _3520 = _3508 > 0.0;
    float _3522 = _3002 * _3512;
    bool _3524 = _3508 < 1.0;
    bool _3526 = _3524 && _3520;
    bool _3528 = _2975 > (-1.0);
    bool _3530 = _3528 && _3526;
    bool _3532 = _2977 > (-1.0);
    bool _3534 = _3532 && _3530;
    bool _3536 = _2975 < 1.0;
    bool _3538 = _3536 && _3534;
    bool _3540 = _2977 < 1.0;
    bool _3542 = _3540 && _3538;
    float _3544 = _3318 * _3506;
    float _3546 = fma(_3314, _3516, _2996);
    float _3548 = fma(_3316, _3516, _2998);
    float _3550 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3552 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3550);
    float _3554 = _3498 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3556 = fma(_3002, _3544, _3000);
    float _3558 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3560 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3552);
    out.m_95.x = _3554;
    float _3562 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3558);
    float _3564 = _3560 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3566 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_99.x = _3546;
    out.m_99.y = _3548;
    out.m_99.z = _3556;
    out.m_99.w = _3522;
    float _3568 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3562);
    float _3570 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3566);
    float _3572 = 1.0 / _3564;
    float _3574 = _3568 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3576 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3570);
    float _3578 = _3576 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3580 = _2219 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3582 = _3578 * _3572;
    float _3584 = _3574 * _3572;
    bool _3586 = !_3542;
    float _3588 = _3582;
    float _3614;
    float _3616;
    float _3624;
    if (!_3586)
    {
        float _3590 = -_3518;
        float _3592 = _2977 + _3590;
        float _3594 = -_3514;
        float _3596 = _2975 + _3594;
        float _3598 = -_3582;
        float _3600 = _2975 + _3598;
        float _3602 = -_3584;
        float _3604 = _2977 + _3602;
        float _3606 = _3592 * _3592;
        float _3608 = fma(_3596, _3596, _3606);
        float _3610 = sqrt(_3608);
        bool _3612 = _3610 > 0.0;
        _3614 = _3608;
        _3616 = _3610;
        if (!_3612)
        {
            _3588 = _3580;
        }
        float _3618 = _3588;
        bool _3620 = !_3612;
        float _3622 = _3618;
        _3624 = _3618;
        _3626 = _3620;
        if (!_3626)
        {
            float _3628 = _3604 * _3604;
            float _3630 = fma(_3600, _3600, _3628);
            float _3632 = rsqrt(_3608);
            float _3634 = sqrt(_3630);
            float _3636 = _3596 * _3632;
            float _3638 = _3592 * _3632;
            bool _3640 = _3634 > 0.0;
            _2303 = _3634;
            _3616 = _3632;
            if (!_3640)
            {
                _3622 = _3580;
            }
            float _3642 = _3622;
            bool _3644 = !_3640;
            _3624 = _3642;
            _3626 = _3644;
            if (!_3626)
            {
                float _3646 = _1793 * _3426;
                float _3648 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _3650 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3422);
                float _3652 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3476);
                float _3654 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3466);
                float _3656 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3650);
                float _3658 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3652);
                float _3660 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3654);
                float _3662 = rsqrt(_3630);
                float _3664 = _3648 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3666 = 1.0 / _3656;
                float _3668 = _3604 * _3664;
                float _3670 = _3600 * _3664;
                float _3672 = _3668 * _3668;
                float _3674 = fma(_3670, _3670, _3672);
                float _3676 = _3658 * _3666;
                float _3678 = _3660 * _3666;
                float _3680 = sqrt(_3674);
                float _3682 = _3676 * _3676;
                float _3684 = fma(_3678, _3678, _3682);
                float _3686 = _3604 * _3662;
                float _3688 = _3600 * _3662;
                float _3690 = sqrt(_3684);
                float _3692 = _3638 * _3686;
                float _3694 = fma(_3636, _3688, _3692);
                float _3696 = precise::min(0.0, _3694);
                float _3698 = _2899 * _3696;
                float _3700 = fma(_3680, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3690);
                float _3702 = fma(_3670, _3698, _2931);
                float _3704 = 1.0 / _3700;
                float _3706 = fma(_3668, _3698, _2935);
                out.gl_Position.x = _3702;
                out.gl_Position.y = _3706;
                float _3708 = _3690 * _3704;
                out.m_95.y = _3708;
                _3614 = _3692;
                _3624 = _3580;
                _2303 = _3668;
                _3616 = _3708;
                _3626 = true;
            }
        }
    }
    else
    {
        float _3710 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3710;
        _3614 = 0.0;
        _3624 = 0.0;
        _2303 = _3710;
        _3616 = 0.0;
    }
    _3626 = false;
    float _3712 = _3614;
    float _3714 = _3624;
    float _3716 = _2303;
    float _3718 = _3616;
    bool _3720 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3722 = isnan(_3242);
    bool _3724 = _3720 || _3722;
    bool _3726 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3728 = _3724 || _3726;
    float _3730 = _3716;
    float _3732 = _3712;
    float _3734 = _3718;
    if (!_3728)
    {
        _3730 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3736 = _3730;
    float _3738 = _3736;
    float _3740 = _3736;
    if (!_3728)
    {
        _3732 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3742 = _3732;
    float _3744 = _3742;
    float _3746 = _3742;
    if (!_3728)
    {
        _3734 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3748 = _3734;
    bool _3750 = !_3728;
    float _3752 = _3748;
    float _3754 = _3748;
    if (!_3750)
    {
        bool _3756 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3758 = isnan(_3242);
        bool _3760 = _3756 || _3758;
        bool _3762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3764 = _3760 || _3762;
        if (!_3764)
        {
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = _3242 + _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3772 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3770;
            float _3774 = 1.0 / _3772;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3784 = _3768 * _3774;
            float _3786 = precise::clamp(_3784, 0.0, 1.0);
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3792 = fma(_3786, _3782, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3794 = fma(_3786, _3790, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3796 = fma(_3786, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3746 = _3796;
            _3740 = _3794;
            _3754 = _3792;
            _3798 = true;
        }
        else
        {
            bool _3800 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3802 = isnan(_3242);
            bool _3804 = _3800 || _3802;
            bool _3806 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3808 = _3804 || _3806;
            if (!_3808)
            {
                _3738 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3810 = _3738;
            _3740 = _3810;
            if (!_3808)
            {
                _3744 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3812 = _3744;
            _3746 = _3812;
            if (!_3808)
            {
                _3752 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3814 = _3752;
            bool _3816 = !_3808;
            _3754 = _3814;
            if (!_3816)
            {
                bool _3818 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3820 = isnan(_3242);
                bool _3822 = _3818 || _3820;
                bool _3824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3826 = _3822 || _3824;
                if (!_3826)
                {
                    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3830 = _3242 + _3828;
                    float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3834 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3832;
                    float _3836 = 1.0 / _3834;
                    float _3838 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3840 = _3838 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3842 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3844 = _3842 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3846 = _3830 * _3836;
                    float _3848 = precise::clamp(_3846, 0.0, 1.0);
                    float _3850 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3852 = _3850 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3854 = fma(_3848, _3844, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3856 = fma(_3848, _3852, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3858 = fma(_3848, _3840, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3746 = _3858;
                    _3740 = _3856;
                    _3754 = _3854;
                    _3798 = true;
                }
                else
                {
                    _3746 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3740 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3754 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3798 = false;
    float _3860 = _3746;
    float _3862 = _3740;
    float _3864 = _3754;
    float _3866 = _3860 * 0.586610972881317138671875;
    bool _3868 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3870 = _3714 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_101.x = 0.0;
    float _3872 = fma(_3862, 0.298911988735198974609375, _3866);
    out.m_61.x = _3870;
    float _3874 = fma(_3864, 0.114477999508380889892578125, _3872);
    float _3876 = -_3874;
    float _3878 = _3876 + _3862;
    float _3880 = -_3874;
    float _3882 = _3880 + _3860;
    float _3884 = -_3874;
    float _3886 = _3884 + _3864;
    float _3888 = fma(_3878, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3874);
    float _3890 = fma(_3882, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3874);
    float _3892 = fma(_3886, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3874);
    out.m_103.x = _3888;
    out.m_103.y = _3890;
    out.m_103.z = _3892;
    if (!_3868)
    {
        return out;
    }
    float _3894 = -_2787;
    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3898 = -_2789;
    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3902 = -_2791;
    float _3904 = _3902 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3906 = _3896 * _3896;
    float _3908 = fma(_3900, _3900, _3906);
    float _3910 = fma(_3904, _3904, _3908);
    float _3912 = sqrt(_3910);
    float _3914 = rsqrt(_3910);
    float _3916 = -_3912;
    float _3918 = _3916 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3920 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3922 = precise::clamp(_3920, 0.0, 1.0);
    float _3924 = _3900 * _3914;
    float _3926 = _3896 * _3914;
    float _3928 = abs(_3922);
    float _3930 = log2(_3928);
    float _3932 = _3904 * _3914;
    float _3934 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3936 = _1987 * _3926;
    float _3938 = -_3926;
    float _3940 = -_3934;
    float _3942 = fma(_3938, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3940);
    float _3944 = fma(_1981, _3924, _3936);
    float _3946 = -_3932;
    float _3948 = fma(_3946, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3942);
    float _3950 = fma(_1989, _3932, _3944);
    float _3952 = precise::clamp(_3950, 0.0, 1.0);
    float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3956 = _3948 + _3954;
    float _3958 = _3930 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3960 = _3956 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3962 = precise::clamp(_3960, 0.0, 1.0);
    float _3964 = exp2(_3958);
    float _3966 = _3964 * _3962;
    float _3968 = _3952 * _3966;
    float _3970 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3972 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3974 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _3970;
    out.m_101.y = _3972;
    out.m_101.z = _3974;
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3798 = false;
    bool _3626 = false;
    bool _2087 = false;
    bool _2075 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_61.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4031 = as_type<float>(_138);
        out.gl_Position.z = _4031;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_63.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = _156;
    if (_152)
    {
        float _160 = float(_122);
        _132 = _160;
    }
    float _162 = _132;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4101 = as_type<float>(_176);
        out.gl_Position.z = _4101;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = in.m_69.x;
    float _192 = in.m_69.y;
    float _194 = in.m_69.z;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = fma(_184, _184, _196);
    float _202 = fma(_186, _186, _198);
    float _204 = fma(_190, _190, _200);
    float _206 = _182 * _182;
    float _208 = fma(_192, _192, _202);
    float _210 = sqrt(_204);
    float _212 = fma(_188, _188, _206);
    float _214 = in.m_71.x;
    float _216 = in.m_71.y;
    float _218 = in.m_71.z;
    float _220 = fma(_194, _194, _212);
    float _222 = sqrt(_208);
    float _224 = sqrt(_220);
    bool _226 = _210 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _180 * _216;
    float _232 = 0.0;
    int _234 = as_type<int>(_208);
    if (_226)
    {
        float _236 = rsqrt(_204);
        _232 = _236;
    }
    float _238 = _232;
    float _240 = 0.0;
    float _242 = 0.0;
    if (!_226)
    {
        _240 = 0.0;
        _242 = 0.0;
    }
    float _244 = _240;
    float _246 = _242;
    bool _248 = _224 > 0.0;
    float _250 = _186 * _216;
    float _252 = 0.0;
    float _254 = _244;
    float _256 = _246;
    if (!_226)
    {
        _252 = 0.0;
    }
    float _258 = _252;
    float _260 = _192 * _216;
    float _262 = fma(_178, _214, _230);
    float _264 = fma(_184, _214, _250);
    float _266 = _222;
    float _268 = _258;
    if (_228)
    {
        float _270 = rsqrt(_208);
        _266 = _270;
    }
    float _272 = _266;
    float _274 = fma(_190, _214, _260);
    float _276 = 0.0;
    if (!_228)
    {
        _276 = 0.0;
    }
    float _278 = _276;
    float _280 = fma(_188, _218, _264);
    float _282 = 0.0;
    float _284 = _278;
    if (!_228)
    {
        _282 = 0.0;
    }
    float _286 = _282;
    float _288 = fma(_182, _218, _262);
    float _290 = 0.0;
    float _292 = _286;
    if (!_228)
    {
        _290 = 0.0;
    }
    float _294 = _290;
    float _296 = 0.0;
    float _298 = 0.0;
    float _300 = _294;
    if (!_248)
    {
        _296 = 0.0;
        _298 = 0.0;
    }
    float _302 = _296;
    float _304 = _298;
    float _306 = 0.0;
    float _308 = _302;
    float _310 = _304;
    if (_248)
    {
        float _312 = rsqrt(_220);
        _306 = _312;
    }
    float _314 = _306;
    if (_226)
    {
        float _316 = _238 * _184;
        _254 = _316;
    }
    float _318 = _254;
    if (_226)
    {
        float _320 = _238 * _178;
        _256 = _320;
    }
    float _322 = _256;
    if (_226)
    {
        float _324 = _238 * _190;
        _268 = _324;
    }
    float _326 = _268;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = fma(_194, _218, _274);
    float _332 = 0.0;
    bool _334 = _328;
    if (!_248)
    {
        _332 = 0.0;
    }
    float _336 = _332;
    float _338 = _336;
    if (_228)
    {
        float _340 = _272 * _186;
        _284 = _340;
    }
    float _342 = _284;
    if (_228)
    {
        float _344 = _272 * _180;
        _292 = _344;
    }
    float _346 = _292;
    float _348 = _346;
    if (_228)
    {
        float _350 = _272 * _192;
        _300 = _350;
    }
    float _352 = _300;
    if (_248)
    {
        float _354 = _314 * _188;
        _308 = _354;
    }
    float _356 = _308;
    if (_248)
    {
        float _358 = _314 * _182;
        _310 = _358;
    }
    float _360 = _310;
    float _362 = _360;
    if (_248)
    {
        float _364 = _314 * _194;
        _338 = _364;
    }
    float _366 = _338;
    bool _368 = !_328;
    float _386;
    if (!_368)
    {
        float _370 = in.m_73.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_122);
        float _392 = 1.0 / _390;
        float _394 = _156 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _400 = int(_398);
    float _402 = in.m_75.x;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    float _408 = in.m_75.y;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _412 = _410 != 0;
    float _414 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _416 = int(_414);
    float _418 = in.m_73.x;
    float _420 = in.m_73.y;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _428 = _426 != 0;
    float _430 = in.m_58.x;
    float _432 = in.m_58.y;
    float _434 = in.m_58.z;
    float _436 = float(_400);
    float _438 = _314;
    if (_406)
    {
        float _440 = in.m_73.x;
        _438 = _440;
    }
    float _442 = _438;
    float _444 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _446 = log2(_444);
    float _448 = in.m_73.w;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _452 = _450 != 0;
    float _454 = _402;
    if (_406)
    {
        float _456 = -_402;
        float _458 = _456 + 1.0;
        _234 = as_type<int>(_458);
    }
    int _460 = _234;
    float _462 = 0.0;
    if (!_406)
    {
        _462 = _402;
    }
    float _464 = _462;
    float _466 = 1.0 / _436;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _468 = -_408;
    float _470 = _468 + 1.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _476 = in.m_73.z;
    bool _478 = _420 > 0.5;
    float _480 = 1.0 / _474;
    float _482 = _180 * _432;
    float _484 = _186 * _432;
    float _486 = _192 * _432;
    int _488 = _478 ? as_type<int>(_470) : as_type<int>(_408);
    float _490 = fma(_178, _430, _482);
    float _492 = _464;
    float _494 = _408;
    if (_406)
    {
        bool _496 = _442 > 0.5;
        _334 = _496;
    }
    bool _498 = _334;
    float _500 = _466 * _156;
    float _502 = in.m_79.x;
    float _504 = in.m_79.y;
    float _506 = in.m_79.z;
    float _508 = fma(_182, _434, _490);
    if (_406)
    {
        float _510 = _498 ? as_type<float>(_460) : _402;
        _492 = _510;
    }
    float _512 = _492;
    float _514 = fma(_184, _430, _484);
    float _516 = float(uint(_416));
    float _518 = trunc(_500);
    int _520 = int(_518);
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _524 = _522 != 0;
    float _526 = fma(_190, _430, _486);
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _530 = _528 != 0;
    float _532 = fma(_188, _434, _514);
    float _534 = fma(_194, _434, _526);
    float _536 = _530 ? as_type<float>(_488) : _408;
    float _538 = 1.0 / _516;
    bool _540 = _448 > 0.5;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _544;
    float _548 = float(_122);
    float _550 = in.m_81.x;
    float _552 = in.m_81.y;
    float _554 = in.m_81.z;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _560 = float(uint(_520));
    float _562 = in.m_83.x;
    float _564 = in.m_83.y;
    float _566 = in.m_83.z;
    bool _568 = _504 != 0.0;
    bool _570 = isnan(_504);
    bool _572 = _568 || _570;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_85.w = _542;
    bool _582 = _502 == 0.0;
    bool _584 = !_576;
    bool _586 = _582 && _584;
    float _588 = 1.0 / _558;
    int _590 = as_type<int>(_538) + (-2);
    float _592 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _506);
    bool _594 = _506 == 0.0;
    bool _596 = _594 && _586;
    float _598 = _420 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _600 = as_type<float>(_590) * _560;
    int _602 = ~_416;
    int _604 = _602 + 1;
    float _606 = 1.0 / _580;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _610 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _612 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _614 = _596;
    if (_428)
    {
        float _616 = _540 ? _470 : _408;
        _494 = _616;
    }
    float _618 = _494;
    float _620 = trunc(_600);
    float _622 = precise::max(_620, 0.0);
    uint _625 = uint(_622);
    float _627 = _546 * _588;
    float _629 = _566;
    float _631 = _564;
    float _633 = _562;
    int _635 = as_type<int>(_588);
    if (!_596)
    {
        float _637 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _566);
        _629 = _637;
    }
    float _639 = _629;
    if (!_596)
    {
        float _641 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _564);
        _631 = _641;
    }
    float _643 = _631;
    if (!_596)
    {
        float _645 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _562);
        _633 = _645;
    }
    float _647 = _633;
    if (_424)
    {
        float _649 = -_402;
        float _651 = _649 + 1.0;
        _635 = as_type<int>(_651);
    }
    int _653 = _635;
    if (_424)
    {
        bool _655 = _476 > 0.5;
        _614 = _655;
    }
    bool _657 = _614;
    float _659 = -_608;
    float _661 = fma(_610, 2.0, _659);
    float _663 = 1.0 / _548;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_424)
    {
        float _667 = _657 ? as_type<float>(_653) : _402;
        _454 = _667;
    }
    float _669 = _454;
    float _671 = _420 + _418;
    bool _673 = !_452;
    float _675 = _673 ? 7.345489978790283203125 : 1.0;
    float _677 = _418 * 2.0;
    float _679 = fma(_598, -2.0, _665);
    int _681 = _604 * int(_625);
    int _683 = _681 + _520;
    float _685 = float(_416);
    float _687 = _671 + (-1.0);
    float _689 = float(_520);
    float _691 = _675 * _418;
    float _693 = float(uint(_683));
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _703 = floor(_677);
    float _705 = as_type<float>(_590) * _693;
    float _707 = _697 * _606;
    float _709 = _685 * _156;
    float _711 = _701 * _480;
    float _713 = _418 + _476;
    float _715 = trunc(_705);
    float _717 = precise::max(_715, 0.0);
    uint _719 = uint(_717);
    float _721 = _709 * _663;
    int _723 = ~_416;
    int _725 = _723 + 1;
    float _727 = _713 + (-1.0);
    bool _729 = _689 >= _685;
    bool _731 = isnan(_689);
    bool _733 = _729 || _731;
    bool _735 = isnan(_685);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _743 = !_524;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _749 = trunc(_721);
    int _751 = int(_749);
    float _753 = _554 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _755 = abs(_745);
    float _757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _504);
    float _759 = -_156;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[76].x, _661);
    float _763 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _679);
    float _765 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _767 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _502);
    int _769 = int(_625) + int(_719);
    float _771 = trunc(_739);
    int _773 = int(_771);
    int _775 = _725 * _769;
    int _777 = _775 + _520;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _793 = _791 != 0;
    float _795 = floor(_691);
    bool _797 = uint(_777) >= uint(_416);
    bool _799 = !_785;
    int _801 = _799 ? 0 : 1;
    bool _803 = !_797;
    int _805 = _803 ? 0 : (-1);
    bool _807 = _416 == 0;
    int _809 = ~_769;
    int _811 = _809 + _805;
    int _813 = _811 + 1;
    float _815 = _420 + _476;
    bool _817 = _703 > 0.0;
    int _819 = _416 * _813;
    int _821 = _819 + _520;
    float _823 = _815 + (-1.0);
    float _825 = -_795;
    float _827 = _691 + _825;
    bool _829 = !_781;
    int _831 = _829 ? 0 : 1;
    bool _833 = _703 >= 0.0;
    bool _835 = isnan(_703);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = _420 * 2.0;
    int _845 = ~_773;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    float _851 = _827 * _685;
    bool _853 = !_807;
    int _855 = _853 ? _821 : (-1);
    float _857 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _859 = abs(_801);
    float _861 = floor(_843);
    bool _863 = !_789;
    int _865 = _863 ? 0 : 1;
    int _867 = _855 * _849;
    int _869 = _416 + (-1);
    bool _871 = !_793;
    int _873 = _871 ? 0 : 1;
    int _875 = abs(_831);
    float _877 = trunc(_851);
    int _879 = int(_877);
    int _881 = _773 * _869;
    int _883 = _881 + _867;
    float _885 = _476 * 2.0;
    int _887 = _841 ? 0 : 1;
    int _889 = _883 * _859;
    int _891 = abs(_865);
    float _893 = floor(_885);
    bool _895 = _861 > 0.0;
    int _897 = _751 * _875;
    int _899 = _897 + _889;
    int _901 = abs(_873);
    bool _903 = _861 >= 0.0;
    bool _905 = isnan(_861);
    bool _907 = _903 || _905;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    int _913 = _879 * _755;
    int _915 = _913 + _520;
    float _917 = _911 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _919 = ~_887;
    int _921 = _919 + 1;
    int _923 = _921 + 1;
    int _925 = _915 * _891;
    int _927 = _925 + _899;
    int _929 = ~as_type<int>(_917);
    int _931 = _929 + 1;
    int _933 = _931 + 1;
    int _935 = _933;
    int _937 = _923;
    float _939 = as_type<float>(_901);
    float _941 = as_type<float>(_899);
    float _943 = _917;
    if (!_895)
    {
        int _945 = ~as_type<int>(_917);
        int _947 = _945 + 1;
        _935 = _947;
    }
    int _949 = _935;
    int _951 = _879 * _901;
    int _953 = _951 + _927;
    bool _955 = _893 >= 0.0;
    bool _957 = isnan(_893);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    float _965 = _753 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_817)
    {
        int _967 = ~_887;
        int _969 = _967 + 1;
        _937 = _969;
    }
    int _971 = _937;
    float _973 = float(uint(_953));
    float _975 = in.m_67.w;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _987 = _985 != 0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _991 = _396 + _989;
    int _993 = _963 ? 0 : 1;
    float _995 = as_type<float>(_590) * _973;
    bool _997 = _893 > 0.0;
    float _999 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1001 = fma(_707, _991, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1003 = _965 * _592;
    float _1005 = trunc(_995);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    float _1011 = _999 * _757;
    float _1013 = in.m_65.w;
    int _1015 = ~_416;
    int _1017 = _1015 + 1;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1021 = _396 + _1019;
    float _1023 = in.m_69.w;
    if (!_452)
    {
        _939 = _476;
    }
    float _1025 = _939;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1029 = _396 + _1027;
    float _1031 = _1025;
    if (_452)
    {
        _1031 = _420;
    }
    float _1033 = _1031;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1037 = fma(_627, _1021, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1039 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1041 = isnan(_396);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1047 = _1043 || _1045;
    float _1049 = float(_1047);
    float _1051 = fma(_711, _1029, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1053 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1055 = isnan(_396);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1035);
    int _1067 = _1017 * int(_1009);
    int _1069 = _1067 + _953;
    float _1071 = -_1049;
    float _1073 = _1071 + 1.0;
    bool _1075 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1077 = isnan(_396);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = -_1063;
    float _1089 = _1087 + 1.0;
    float _1091 = _532 + _975;
    float _1093 = float(uint(_1069));
    float _1095 = _1063 * _1073;
    bool _1097 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1099 = isnan(_396);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = _1085 * _1089;
    float _1111 = -_1085;
    float _1113 = _1111 + 1.0;
    float _1115 = as_type<float>(_590) * _1093;
    float _1117 = _508 + _1013;
    float _1119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1121 = _534 + _1023;
    float _1123 = _446 * _156;
    if (!_452)
    {
        _941 = _420;
    }
    float _1125 = _941;
    float _1127 = _1107 * _1113;
    float _1129 = _1125;
    if (_452)
    {
        _1129 = _418;
    }
    float _1131 = _1129;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1135 = trunc(_1115);
    float _1137 = precise::max(_1135, 0.0);
    uint _1139 = uint(_1137);
    float _1141 = _1001 * _1127;
    float _1143 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1133);
    float _1145 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1149 = _1091 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _1151 = ~_993;
    int _1153 = _1151 + 1;
    int _1155 = _1153 + 1;
    float _1157 = exp2(_1123);
    float _1159 = -_1147;
    float _1161 = fma(_1145, 2.0, _1159);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1165 = 1.0 + _1163;
    float _1167 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1169 = _1155;
    if (!_997)
    {
        int _1171 = ~_993;
        int _1173 = _1171 + 1;
        _1169 = _1173;
    }
    int _1175 = _1169;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1179 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1181 = isnan(0.0);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1187 = _1183 || _1185;
    float _1189 = fma(_1167, _618, -0.5);
    int _1191 = int(_1009) + int(_1139);
    float _1193 = 1.0 / _1165;
    float _1195 = -_1107;
    float _1197 = _1195 + 1.0;
    if (!_452)
    {
        _943 = _476;
    }
    float _1199 = _943;
    float _1201 = _1199;
    if (_452)
    {
        _1201 = _420;
    }
    float _1203 = _1201;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1207 = -_1157;
    float _1209 = _1207 + 1.0;
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _1213 = ~_416;
    int _1215 = _1213 + 1;
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1219 = _1187 ? _1209 : 0.0;
    float _1221 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1205);
    bool _1223 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1225 = isnan(1.0);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1231 = _1227 || _1229;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1235 = float(uint(_915));
    float _1237 = fma(_1217, -2.0, _1177);
    float _1239 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1233);
    float _1241 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1065);
    float _1243 = as_type<float>(_590) * _1235;
    float _1245 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1221);
    int _1247 = _1215 * _1191;
    int _1249 = _1247 + _953;
    float _1251 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1239);
    float _1253 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1143);
    float _1255 = -_156;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1161);
    float _1259 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1237);
    if (_1231)
    {
        float _1261 = _1219 * _1193;
        _158 = _1261;
    }
    float _1263 = _158;
    bool _1265 = uint(_1249) >= uint(_416);
    float _1267 = trunc(_1243);
    float _1269 = precise::max(_1267, 0.0);
    uint _1271 = uint(_1269);
    float _1273 = _1117 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _1275 = !_987;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1141);
    bool _1281 = !_1265;
    int _1283 = _1281 ? 0 : (-1);
    float _1285 = _1273 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1287 = _1273 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1289 = _1273 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _1291 = ~_1191;
    int _1293 = _1291 + _1283;
    int _1295 = _1293 + 1;
    float _1297 = fma(_1149, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1285);
    float _1299 = fma(_1149, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1287);
    float _1301 = fma(_1149, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1289);
    int _1303 = abs(_1277);
    float _1305 = in.m_87.x;
    float _1307 = in.m_87.y;
    float _1309 = in.m_87.z;
    int _1311 = ~_416;
    int _1313 = _1311 + 1;
    int _1315 = _416 * _1295;
    int _1317 = _1315 + _953;
    bool _1319 = !_979;
    int _1321 = _1319 ? 0 : 1;
    float _1323 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1325 = float(_949);
    int _1327 = _1313 * int(_1271);
    int _1329 = _1327 + _915;
    float _1331 = float(_1303);
    float _1333 = _1121 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    bool _1335 = !_807;
    int _1337 = _1335 ? _1317 : (-1);
    float _1339 = -_1259;
    float _1341 = fma(_1241, _1189, _1339);
    bool _1343 = !_983;
    int _1345 = _1343 ? 0 : 1;
    float _1347 = _1331 * _1325;
    int _1349 = abs(_1321);
    float _1351 = fma(_1333, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1297);
    float _1353 = float(uint(_1329));
    float _1355 = fma(_1333, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1299);
    int _1357 = _1337 >> 31;
    float _1359 = fma(_1333, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1301);
    int _1361 = abs(_1345);
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1365 = float(_1349);
    float _1367 = as_type<float>(_590) * _1353;
    float _1369 = float(_1175);
    float _1371 = _1351 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    int _1373 = _1357 & 3;
    float _1375 = _476 + (-0.5);
    float _1377 = float(_971);
    float _1379 = _1365 * _1369;
    float _1381 = float(_1361);
    float _1383 = trunc(_1367);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    int _1389 = _1337 + _1373;
    float _1391 = _1379 * (-2.0);
    int _1393 = _1337 & 3;
    bool _1395 = _1393 != 0;
    float _1397 = _1381 * _1377;
    int _1399 = _1389 >> 2;
    float _1401 = fma(_741, _1391, _741);
    float _1403 = fma(_1391, _1305, _1305);
    float _1405 = _1397 * (-2.0);
    float _1407 = _1347 * (-2.0);
    int _1409 = _1399 << 4;
    int _1411 = _1409 + 368;
    float _1413 = _1355 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1415 = fma(_857, _1405, _857);
    float _1417 = fma(_1405, _1307, _1307);
    float _1419 = fma(_747, _1407, _747);
    float _1421 = _1359 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    uint _1423 = uint(int(uint(_1411) >> uint(2)));
    uint _1425 = uint(int(uint(int(_1423)) >> uint(2)));
    int _1427 = int(_1423) & 3;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[int(_1425)][_1427];
    int _1431 = int(_1423) + 1;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    int _1435 = _1431 & 3;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[int(_1433)][_1435];
    float _1439 = _418 + (-0.5);
    float _1441 = _1371 * _1323;
    float _1443 = _1421 * _1363;
    float _1445 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1447 = int(_1445);
    float _1449 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1403);
    int _1451 = _1337 & 3;
    bool _1453 = _1451 != 0;
    float _1455 = fma(_1407, _1309, _1309);
    int _1457 = _1411 + 8;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[int(_1469)][_1471];
    int _1475 = int(_1271) + int(_1387);
    float _1477 = _420 + (-0.5);
    bool _1479 = uint(_1451) > 1u;
    float _1481 = _1413 * _1211;
    int _1483 = ~_416;
    int _1485 = _1483 + 1;
    float _1487 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1417);
    int _1489 = _1395 ? 0 : 1;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1493 = _1451 != 3;
    int _1495 = _1485 * _1475;
    int _1497 = _1495 + _915;
    float _1499 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1455);
    int _1501 = abs(_1447);
    float _1503 = fma(_1415, _1263, _1487);
    int _1505 = ~_1489;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    float _1511 = fma(_1401, _1263, _1449);
    int _1513 = _1509;
    if (!_1479)
    {
        int _1515 = ~_1489;
        int _1517 = _1515 + 1;
        _1513 = _1517;
    }
    int _1519 = _1513;
    float _1521 = fma(_1443, 0.5, 0.5);
    bool _1523 = uint(_1451) >= 2u;
    float _1525 = fma(_1481, 0.5, 0.5);
    float _1527 = float(uint(_1501));
    float _1529 = fma(_1441, 0.5, 0.5);
    int _1531 = _1523 ? 0 : 1;
    float _1533 = 1.0 / _1527;
    bool _1535 = uint(_1497) >= uint(_416);
    float _1537 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1539 = _1451 != 3;
    int _1541 = ~_1531;
    int _1543 = _1541 + 1;
    int _1545 = _1543 + 1;
    bool _1547 = !_1453;
    int _1549 = _1547 ? 0 : 1;
    float _1551 = floor(_1529);
    int _1553 = abs(_1519);
    int _1555 = _1545;
    if (_1493)
    {
        int _1557 = ~_1531;
        int _1559 = _1557 + 1;
        _1555 = _1559;
    }
    int _1561 = _1555;
    int _1563 = ~_1553;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = abs(_1549);
    float _1571 = _1503 * 0.15915493667125701904296875;
    int _1573 = abs(_1561);
    int _1575 = _1567 * as_type<int>(_1437);
    int _1577 = ~_1569;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = floor(_1521);
    bool _1585 = !_1539;
    int _1587 = _1585 ? 0 : (-1);
    int _1589 = _1581 * as_type<int>(_1429);
    int _1591 = _1589 + _1575;
    bool _1593 = !_1535;
    int _1595 = _1593 ? 0 : (-1);
    float _1597 = -_1551;
    float _1599 = _1529 + _1597;
    bool _1601 = !_412;
    int _1603 = _1601 ? 0 : 1;
    float _1605 = _1571 * 6.283185482025146484375;
    float _1607 = sin(_1605);
    int _1609 = abs(_1587);
    float _1611 = fma(_1599, 2.0, -1.0);
    int _1613 = ~_1573;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    float _1619 = float(uint(_1447));
    int _1621 = ~_1475;
    int _1623 = _1621 + _1595;
    int _1625 = _1623 + 1;
    int _1627 = _1617 * as_type<int>(_1465);
    int _1629 = _1627 + _1591;
    int _1631 = abs(_1603);
    float _1633 = _1571 * 6.283185482025146484375;
    float _1635 = cos(_1633);
    int _1637 = ~_1609;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    int _1643 = _416 * _1625;
    int _1645 = _1643 + _915;
    int _1647 = ~_1631;
    int _1649 = _1647 + 1;
    int _1651 = _1649 + 1;
    float _1653 = fma(_1419, _1263, _1499);
    int _1655 = as_type<int>(_1533) + (-2);
    int _1657 = _1641 * as_type<int>(_1473);
    int _1659 = _1657 + _1629;
    bool _1661 = !_807;
    int _1663 = _1661 ? _1645 : (-1);
    float _1665 = 1.0 / _1619;
    float _1667 = fma(_1051, _1109, _1279);
    int _1669 = _1659 * _1651;
    float _1671 = fma(_1537, _669, -0.5);
    float _1673 = _1511 * 0.15915493667125701904296875;
    float _1675 = fma(_1037, _1095, _1667);
    int _1677 = _1663 * _1631;
    int _1679 = _1677 + _1669;
    float _1681 = _1653 * 0.15915493667125701904296875;
    int _1683 = ~_1447;
    int _1685 = _1683 + 1;
    float _1687 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1675);
    float _1689 = _1673 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    int _1693 = abs(_1679);
    float _1695 = fma(_1253, _1671, _1257);
    float _1697 = float(uint(_1679));
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1701 = as_type<int>(_1665) + (-2);
    float _1703 = _1681 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    float _1707 = as_type<float>(_1701) * _1697;
    float _1709 = float(uint(_1693));
    int _1711 = ~_1501;
    int _1713 = _1711 + 1;
    float _1715 = trunc(_1707);
    float _1717 = precise::max(_1715, 0.0);
    uint _1719 = uint(_1717);
    float _1721 = as_type<float>(_1655) * _1709;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1729 = _1723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1731 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1733 = trunc(_1721);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1741 = _1691 * _1607;
    bool _1743 = _1447 == 0;
    out.m_89.x = _1729;
    out.m_89.y = _1739;
    out.m_89.z = _1731;
    out.m_89.w = _1699;
    float _1745 = _1673 * 6.283185482025146484375;
    float _1747 = cos(_1745);
    int _1749 = _1685 * int(_1719);
    int _1751 = _1749 + _1679;
    float _1753 = _1635 * _1705;
    float _1755 = float(uint(_1751));
    float _1757 = -_1583;
    float _1759 = _1521 + _1757;
    float _1761 = _1681 * 6.283185482025146484375;
    float _1763 = sin(_1761);
    int _1765 = _1713 * int(_1737);
    int _1767 = _1765 + _1693;
    float _1769 = as_type<float>(_1701) * _1755;
    float _1771 = _1691 * _1635;
    float _1773 = _1691 * _1705;
    int _1775 = ~_1447;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1759, 2.0, -1.0);
    float _1781 = _1747 * _1635;
    float _1783 = float(uint(_1767));
    float _1785 = trunc(_1769);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    float _1791 = _1747 * _1607;
    float _1793 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1795 = _1747 * _1705;
    float _1797 = as_type<float>(_1655) * _1783;
    int _1799 = _1679 ^ _1447;
    float _1801 = fma(_1763, _1781, _1741);
    float _1803 = fma(_1763, _1741, _1781);
    float _1805 = floor(_1525);
    float _1807 = _1793 * _767;
    float _1809 = -_1011;
    float _1811 = _1763 * _1809;
    float _1813 = -_643;
    float _1815 = _1763 * _1813;
    float _1817 = _1607 * _1705;
    float _1819 = fma(_1753, _1807, _1811);
    float _1821 = fma(_1753, _647, _1815);
    float _1823 = trunc(_1797);
    float _1825 = precise::max(_1823, 0.0);
    uint _1827 = uint(_1825);
    int _1829 = int(_1719) + int(_1789);
    float _1831 = _1795 * _1011;
    float _1833 = _1773 * _1011;
    float _1835 = _1795 * _643;
    float _1837 = _1773 * _643;
    int _1839 = _1777 * _1829;
    int _1841 = _1839 + _1679;
    float _1843 = fma(_1801, _1807, _1831);
    float _1845 = -_1805;
    float _1847 = _1525 + _1845;
    float _1849 = -_1791;
    float _1851 = fma(_1763, _1771, _1849);
    float _1853 = -_1771;
    float _1855 = fma(_1763, _1791, _1853);
    int _1857 = ~_1501;
    int _1859 = _1857 + 1;
    bool _1861 = uint(_1841) >= uint(_1447);
    float _1863 = fma(_1851, _1807, _1833);
    float _1865 = fma(_1851, _647, _1837);
    int _1867 = int(_1737) + int(_1827);
    float _1869 = fma(_1801, _647, _1835);
    bool _1871 = !_1861;
    int _1873 = _1871 ? 0 : (-1);
    float _1875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1877 = uint(int(uint(_1799) >> uint(31)));
    int _1879 = _1859 * _1867;
    int _1881 = _1879 + _1693;
    int _1883 = ~_1829;
    int _1885 = _1883 + _1873;
    int _1887 = _1885 + 1;
    float _1889 = fma(_1817, _1003, _1819);
    float _1891 = fma(_1847, 2.0, -1.0);
    int _1893 = ~int(_1877);
    int _1895 = _1893 + 1;
    float _1897 = fma(_1855, _1003, _1843);
    bool _1899 = uint(_1881) >= uint(_1501);
    int _1901 = _1447 * _1887;
    int _1903 = _1901 + _1679;
    float _1905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1907 = _1891 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1909 = !_1899;
    int _1911 = _1909 ? 0 : (-1);
    float _1913 = fma(_1855, _639, _1869);
    bool _1915 = _1447 == 0;
    float _1917 = _1907 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    int _1919 = ~_1911;
    int _1921 = _1867 + _1919;
    int _1923 = _1921 + 1;
    float _1925 = _1907 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1927 = _1907 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    bool _1929 = !_1915;
    int _1931 = _1929 ? _1903 : (-1);
    float _1933 = _1875 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1935 = _1923 ^ _1895;
    float _1937 = fma(_1817, _639, _1821);
    float _1939 = float(_1931);
    float _1941 = fma(_1803, _1003, _1863);
    int _1943 = ~_1895;
    int _1945 = _1943 + _1935;
    int _1947 = _1945 + 1;
    float _1949 = fma(_1803, _639, _1865);
    float _1951 = _1905 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1953 = fma(_1933, _512, -0.5);
    bool _1955 = !_1743;
    int _1957 = _1955 ? _1947 : (-1);
    float _1959 = fma(_1933, _1939, _761);
    float _1961 = _1913 * _342;
    float _1963 = _1913 * _346;
    float _1965 = float(_1957);
    float _1967 = _1913 * _352;
    float _1969 = fma(_1951, _536, -0.5);
    float _1971 = fma(_1937, _318, _1961);
    float _1973 = fma(_1937, _322, _1963);
    float _1975 = -_763;
    float _1977 = fma(_1951, _1965, _1975);
    float _1979 = fma(_1937, _326, _1967);
    float _1981 = fma(_1949, _356, _1971);
    float _1983 = _1611 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1985 = fma(_1251, _1969, _1977);
    float _1987 = fma(_1949, _360, _1973);
    float _1989 = fma(_1949, _366, _1979);
    bool _1991 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1993 = isnan(1.0);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1999 = _1995 || _1997;
    float _2001 = _1985 + 0.5;
    float _2003 = fma(_1245, _1953, _1959);
    float _2005 = _1897 * _342;
    out.m_91.x = _1981;
    out.m_91.y = _1987;
    out.m_91.z = _1989;
    float _2007 = _1897 * _346;
    float _2009 = fma(_1983, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1925);
    float _2011 = fma(_1983, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1917);
    float _2013 = _1695 + 0.5;
    float _2015 = _1897 * _352;
    float _2017 = fma(_1983, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1927);
    float _2019 = _1779 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2021 = _1341 + 0.5;
    float _2023 = _2003 + 0.5;
    float _2025 = fma(_1889, _326, _2015);
    float _2027 = fma(_1889, _318, _2005);
    float _2029 = fma(_1889, _322, _2007);
    float _2031 = fma(_2019, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2009);
    float _2033 = fma(_2019, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2011);
    float _2035 = fma(_2019, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2017);
    out.m_93.x = _2023;
    out.m_93.y = _2001;
    out.m_93.z = _2013;
    out.m_93.w = _2021;
    float _2037 = fma(_1941, _366, _2025);
    float _2039 = fma(_1941, _356, _2027);
    float _2041 = fma(_1941, _360, _2029);
    float _2043 = _2031 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2045 = _2035 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2047 = _2039 + _2043;
    float _2049 = _2037 + _2045;
    float _2051 = _2033 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2053 = _2041 + _2051;
    float _2055 = _2037;
    float _2057 = _2041;
    float _2059 = _1611;
    float _2061 = _1891;
    float _2063 = _2001;
    float _2065 = _1779;
    float _2067 = _2023;
    float _2069 = as_type<float>(_1903);
    float _2079;
    float _2081;
    float _2083;
    float _2085;
    if (!_1999)
    {
        bool _2071 = _2051 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2073 = !_2071;
        _2075 = _2073;
        if (!_2075)
        {
            float _2077 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2079 = _2077;
            _2081 = 0.0;
            _2083 = 0.0;
            _2085 = 0.0;
            _2087 = true;
        }
    }
    if ((!_2087) || _2075)
    {
        bool _2125;
        if (!_2075)
        {
            bool _2089 = _2051 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2091 = isnan(_2051);
            bool _2093 = _2089 || _2091;
            bool _2095 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2097 = _2093 || _2095;
            bool _2099 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2101 = !_2097;
            bool _2103 = _2099 && _2101;
            bool _2105 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2107 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2103)
            {
                _362 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2109 = _362;
            float _2111 = _2109;
            if (_2103)
            {
                _2055 = 0.0;
            }
            float _2113 = _2055;
            _2081 = _2113;
            if (_2103)
            {
                _348 = 0.0;
            }
            float _2115 = _348;
            _2083 = _2115;
            if (_2103)
            {
                float _2117 = _2109 * 5.0;
                _2111 = _2117;
            }
            float _2119 = _2111;
            _2079 = _2119;
            if (_2103)
            {
                _2107 = 0.0;
            }
            float _2121 = _2107;
            bool _2123 = !_2097;
            _2125 = _2123 && _2105;
            _2057 = _2121;
            _2085 = _2121;
        }
        if ((!_2125) || _2075)
        {
            _2075 = false;
            float _2127 = _2057;
            bool _2129 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2131 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2133 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2135 = _2039;
            float _2137 = _2127;
            _2079 = _2049;
            _2081 = _2047;
            _2083 = _2053;
            if (_2129)
            {
                float _2139 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2135 = _2139;
            }
            float _2141 = _2135;
            if (_2129)
            {
                float _2143 = abs(_1611);
                float _2145 = -_2143;
                float _2147 = _2145 + 1.0;
                _2059 = _2147;
            }
            float _2149 = _2059;
            if (_2131)
            {
                float _2151 = abs(_1891);
                float _2153 = -_2151;
                float _2155 = _2153 + 1.0;
                _2061 = _2155;
            }
            float _2157 = _2061;
            if (!_2129)
            {
                _2063 = 1.0;
            }
            float _2159 = _2063;
            float _2161 = _2159;
            if (_2133)
            {
                float _2163 = abs(_1779);
                float _2165 = -_2163;
                float _2167 = _2165 + 1.0;
                _2065 = _2167;
            }
            float _2169 = _2065;
            if (!_2131)
            {
                _2067 = 1.0;
            }
            float _2171 = _2067;
            float _2173 = _2171;
            if (!_2133)
            {
                _2137 = 1.0;
            }
            float _2175 = _2137;
            float _2177 = _2021;
            float _2179 = _2175;
            if (_2131)
            {
                float _2181 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2177 = _2181;
            }
            float _2183 = _2177;
            float _2185 = _1341;
            if (_2133)
            {
                float _2187 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2185 = _2187;
            }
            float _2189 = _2185;
            if (_2129)
            {
                float _2191 = _2149 * _2141;
                float _2193 = precise::clamp(_2191, 0.0, 1.0);
                _2161 = _2193;
            }
            float _2195 = _2161;
            if (_2131)
            {
                float _2197 = _2157 * _2183;
                float _2199 = precise::clamp(_2197, 0.0, 1.0);
                _2173 = _2199;
            }
            float _2201 = _2173;
            float _2203 = _2195 * _2201;
            if (_2133)
            {
                float _2205 = _2169 * _2189;
                float _2207 = precise::clamp(_2205, 0.0, 1.0);
                _2179 = _2207;
            }
            float _2209 = _2179;
            float _2211 = _2203 * _2209;
            _2085 = _2211;
        }
    }
    _2087 = false;
    float _2213 = _2079;
    float _2215 = _2081;
    float _2217 = _2083;
    float _2219 = _2085;
    float _2221 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2223 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2225 = floor(_2221);
    float _2227 = floor(_2223);
    float _2229 = -_2225;
    float _2231 = _2221 + _2229;
    float _2233 = -_2227;
    float _2235 = _2223 + _2233;
    float2 _7161 = float2(_2231, _2235);
    float _2237 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7161, float2(0.0), isnan(_7161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7161, float2(0.0), isnan(_7161)), level(0.0)).x;
    float _2239 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2243 = _2213 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2247 = _2215 + _2245;
    float _2249 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2239);
    float _2251 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2249);
    float _2253 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2255 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2257 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2253);
    float _2259 = 1.0 / _2255;
    float _2261 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2257);
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2265 = _2263 + _2255;
    float _2267 = _2265 * _2259;
    float _2269 = _2267 * 0.5;
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2273 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2271);
    float _2275 = 1.0 / _2273;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2279 = _2275 * _2277;
    float _2281 = _2243 * _2243;
    bool _2283 = _2279 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2285 = fma(_2247, _2247, _2281);
    bool _2287 = _2279 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2289 = !_2283;
    int _2291 = _2289 ? 0 : 1;
    float _2293 = sqrt(_2285);
    int _2295 = 2;
    float _2297 = _2217;
    float _2299 = _2215;
    float _2301 = _2213;
    float _2303 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    if (!_2283)
    {
        _2295 = 1;
    }
    int _2305 = _2295;
    int _2307 = _2305;
    if (!_2287)
    {
        _2307 = _2291;
    }
    int _2309 = _2307;
    float _2311 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _2313 = _2309 << 6;
    float _2315 = _2051 + _2311;
    bool _2317 = _2293 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2319 = _2313 + 48;
    uint _2321 = uint(int(uint(_2319) >> uint(2)));
    uint _2323 = uint(int(uint(int(_2321)) >> uint(2)));
    int _2325 = int(_2321) & 3;
    float _2327 = (*spvDescriptorSet0.vp_c15)._m0[int(_2323)][_2325];
    int _2329 = int(_2321) + 1;
    uint _2331 = uint(int(uint(_2329) >> uint(2)));
    int _2333 = _2329 & 3;
    float _2335 = (*spvDescriptorSet0.vp_c15)._m0[int(_2331)][_2333];
    float _2337 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2339 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2341 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2337);
    float _2343 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2339);
    int _2345 = _2313 + 56;
    uint _2347 = uint(int(uint(_2345) >> uint(2)));
    uint _2349 = uint(int(uint(int(_2347)) >> uint(2)));
    int _2351 = int(_2347) & 3;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[int(_2349)][_2351];
    int _2355 = int(_2347) + 1;
    uint _2357 = uint(int(uint(_2355) >> uint(2)));
    int _2359 = _2355 & 3;
    float _2361 = (*spvDescriptorSet0.vp_c15)._m0[int(_2357)][_2359];
    float _2363 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2341);
    float _2365 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2343);
    float _2367 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2369 = _2365 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2371 = _2313 + 64;
    uint _2373 = uint(int(uint(_2371) >> uint(2)));
    uint _2375 = uint(int(uint(int(_2373)) >> uint(2)));
    int _2377 = int(_2373) & 3;
    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[int(_2375)][_2377];
    int _2381 = int(_2373) + 1;
    uint _2383 = uint(int(uint(_2381) >> uint(2)));
    int _2385 = _2381 & 3;
    float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
    float _2389 = trunc(_2367);
    int _2391 = int(_2389);
    int _2393 = _2313 + 72;
    uint _2395 = uint(int(uint(_2393) >> uint(2)));
    uint _2397 = uint(int(uint(int(_2395)) >> uint(2)));
    int _2399 = int(_2395) & 3;
    float _2401 = (*spvDescriptorSet0.vp_c15)._m0[int(_2397)][_2399];
    int _2403 = int(_2395) + 1;
    uint _2405 = uint(int(uint(_2403) >> uint(2)));
    int _2407 = _2403 & 3;
    float _2409 = (*spvDescriptorSet0.vp_c15)._m0[int(_2405)][_2407];
    float _2411 = trunc(_2369);
    int _2413 = int(_2411);
    int _2415 = _2313 + 96;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    uint _2419 = uint(int(uint(int(_2417)) >> uint(2)));
    int _2421 = int(_2417) & 3;
    float _2423 = (*spvDescriptorSet0.vp_c15)._m0[int(_2419)][_2421];
    int _2425 = int(_2417) + 1;
    uint _2427 = uint(int(uint(_2425) >> uint(2)));
    int _2429 = _2425 & 3;
    float _2431 = (*spvDescriptorSet0.vp_c15)._m0[int(_2427)][_2429];
    int _2433 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2435 = _2391 + _2433;
    int _2437 = _2435 + 1;
    int _2439 = _2313 + 104;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    uint _2443 = uint(int(uint(int(_2441)) >> uint(2)));
    int _2445 = int(_2441) & 3;
    float _2447 = (*spvDescriptorSet0.vp_c15)._m0[int(_2443)][_2445];
    int _2449 = int(_2441) + 1;
    uint _2451 = uint(int(uint(_2449) >> uint(2)));
    int _2453 = _2449 & 3;
    float _2455 = (*spvDescriptorSet0.vp_c15)._m0[int(_2451)][_2453];
    bool _2457 = !_2317;
    int _2459 = as_type<int>(_2335);
    float _2461 = _2401;
    float _2463 = _2409;
    float _2465 = as_type<float>(_2309);
    float _2467 = as_type<float>(_2437);
    if (!_2457)
    {
        float _2469 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2473 = _2293 + _2471;
        float _2475 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2477 = rsqrt(_2285);
        float _2479 = _2473 * _2469;
        float _2481 = _2479 * 0.15915493667125701904296875;
        float _2483 = _2481 * 6.283185482025146484375;
        float _2485 = cos(_2483);
        float _2487 = _2481 * 6.283185482025146484375;
        float _2489 = sin(_2487);
        float _2491 = _2485 + (-1.0);
        float _2493 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2495 = fma(_2489, _2475, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2497 = fma(_2485, _2217, _2493);
        float _2499 = _2477 * _2495;
        float _2501 = fma(_2247, _2499, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2503 = fma(_2243, _2499, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2297 = _2497;
        _2299 = _2501;
        _2301 = _2503;
    }
    float _2505 = _2297;
    float _2507 = _2299;
    float _2509 = _2301;
    float _2511 = -_2051;
    float _2513 = _2511 + _2505;
    int _2515 = _2313 + 80;
    uint _2517 = uint(int(uint(_2515) >> uint(2)));
    uint _2519 = uint(int(uint(int(_2517)) >> uint(2)));
    int _2521 = int(_2517) & 3;
    float _2523 = (*spvDescriptorSet0.vp_c15)._m0[int(_2519)][_2521];
    int _2525 = int(_2517) + 1;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    int _2529 = _2525 & 3;
    float _2531 = (*spvDescriptorSet0.vp_c15)._m0[int(_2527)][_2529];
    float _2533 = -_2043;
    float _2535 = _2533 + _2507;
    int _2537 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2539 = _2413 + _2537;
    int _2541 = _2539 + 1;
    float _2543 = _2513 * _2513;
    float _2545 = -_2045;
    float _2547 = _2545 + _2509;
    bool _2549 = _2437 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2551 = fma(_2535, _2535, _2543);
    int _2553 = _2437 | _2541;
    float _2555 = _2315 * _2431;
    bool _2557 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2559 = isnan(0.5);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2565 = _2561 || _2563;
    float _2567 = fma(_2547, _2547, _2551);
    bool _2569 = _2553 < 0;
    bool _2571 = _2569 || _2549;
    float _2573 = fma(_2043, _2423, _2555);
    float _2575 = _2315 * _2335;
    float _2577 = sqrt(_2567);
    bool _2579 = _2541 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2581 = _2579 || _2571;
    float _2583 = fma(_2045, _2447, _2573);
    float _2585 = fma(_2043, _2327, _2575);
    float _2587 = _2583 + _2455;
    float _2589 = fma(_2045, _2353, _2585);
    float _2591 = 1.0 / _2587;
    int _2593 = as_type<int>(_2555);
    int _2595 = as_type<int>(_2583);
    float _2597 = _2507;
    float _2599 = _2509;
    float _2601 = _2505;
    if (!_2581)
    {
        int _2603 = _2541 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2605 = _2603 + _2437;
        _2593 = _2605;
    }
    int _2607 = _2593;
    bool _2609 = _2577 > 0.0;
    float _2611 = _2315 * _2387;
    float _2613 = as_type<float>(_2607);
    if (!_2581)
    {
        int _2615 = _2607 << 2;
        _2595 = _2615;
    }
    int _2617 = _2595;
    float _2619 = _2447;
    int _2621 = _2617;
    if (!_2581)
    {
        float _2623 = floor(_2367);
        _2619 = _2623;
    }
    float _2625 = _2619;
    float _2627 = fma(_2043, _2379, _2611);
    float _2629 = _2627;
    if (!_2581)
    {
        uint _2631 = uint(int(uint(_2607) >> uint(2)));
        _2459 = int(_2631);
    }
    int _2633 = _2459;
    int _2635 = _2633;
    if (!_2581)
    {
        int _2637 = 12 & _2617;
        _2621 = _2637;
    }
    int _2639 = _2621;
    float _2641 = fma(_2045, _2401, _2627);
    float _2643 = as_type<float>(_2639);
    if (!_2581)
    {
        int _2645 = _2633 << 4;
        int _2647 = _2645 + _2639;
        _2635 = _2647;
    }
    int _2649 = _2635;
    if (!_2609)
    {
        _2629 = _2505;
    }
    float _2651 = _2629;
    float _2653 = _2651;
    float _2655 = _2651;
    if (!_2609)
    {
        _2461 = _2509;
    }
    float _2657 = _2461;
    bool _2659 = !_2609;
    float _2661 = _2657;
    if (!_2659)
    {
        float _2663 = _288 * _288;
        float _2665 = fma(_280, _280, _2663);
        float _2667 = fma(_330, _330, _2665);
        float _2669 = rsqrt(_2567);
        float _2671 = sqrt(_2667);
        float _2673 = _2535 * _2669;
        float _2675 = _2513 * _2669;
        float _2677 = _2547 * _2669;
        bool _2679 = _2671 > 0.0;
        float _2681 = _2669;
        _2643 = _2673;
        if (!_2679)
        {
            _2653 = _2505;
        }
        float _2683 = _2653;
        _2655 = _2683;
        if (!_2679)
        {
            _2681 = _2509;
        }
        float _2685 = _2681;
        bool _2687 = !_2679;
        _2661 = _2685;
        if (!_2687)
        {
            float _2689 = rsqrt(_2667);
            float _2691 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2693 = _288 * _2689;
            float _2695 = _280 * _2689;
            float _2697 = _2675 * _2693;
            float _2699 = _330 * _2689;
            float _2701 = fma(_2673, _2695, _2697);
            float _2703 = _2691 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2705 = fma(_2677, _2699, _2701);
            float _2707 = _2705 * _2703;
            float _2709 = fma(_280, _2707, _2507);
            float _2711 = fma(_288, _2707, _2505);
            float _2713 = fma(_330, _2707, _2509);
            _2655 = _2711;
            _2661 = _2713;
            _2597 = _2709;
        }
    }
    float _2715 = _2655;
    float _2717 = _2661;
    float _2719 = _2597;
    float _2721 = _2643;
    float _2723 = _2589 + _2361;
    float _2725 = _2641 + _2409;
    float _2727 = _2719;
    if (_2565)
    {
        _2599 = _2715;
    }
    float _2729 = _2599;
    float _2731 = _2729;
    if (_2565)
    {
        _2601 = _2717;
    }
    float _2733 = _2601;
    float _2735 = _2733;
    if (!_2565)
    {
        float _2737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2739 = _2051 + _2737;
        float _2741 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2743 = _2043 + _2741;
        float _2745 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2747 = -_2043;
        float _2749 = _2747 + _2719;
        float _2751 = _2739 * _2739;
        float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2755 = _2045 + _2753;
        float _2757 = -_2051;
        float _2759 = _2757 + _2715;
        float _2761 = -_2045;
        float _2763 = _2761 + _2717;
        float _2765 = fma(_2743, _2743, _2751);
        float _2767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2769 = fma(_2755, _2755, _2765);
        float _2771 = sqrt(_2769);
        float _2773 = _2745 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2775 = precise::min(_2771, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2777 = _2775 * _2767;
        float _2779 = _2773 * _2777;
        float _2781 = fma(_2749, _2779, _2043);
        float _2783 = fma(_2759, _2779, _2051);
        float _2785 = fma(_2763, _2779, _2045);
        _2731 = _2783;
        _2727 = _2781;
        _2735 = _2785;
        _2463 = _2771;
    }
    float _2787 = _2731;
    float _2789 = _2727;
    float _2791 = _2735;
    float _2793 = _2463;
    float _2795 = _2721;
    if (!_2581)
    {
        int _2797 = _2649 + 400;
        uint _2799 = uint(int(uint(_2797) >> uint(2)));
        uint _2801 = uint(int(uint(int(_2799)) >> uint(2)));
        int _2803 = int(_2799) & 3;
        float _2805 = (*spvDescriptorSet0.vp_c15)._m0[int(_2801)][_2803];
        _2795 = _2805;
    }
    float _2807 = _2795;
    float _2809 = _2725 * _2591;
    float _2811 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2813 = _2723 * _2591;
    float _2815 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2817 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2819 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2811);
    float _2821 = _2787 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _2823 = _2313 + 88;
    uint _2825 = uint(int(uint(_2823) >> uint(2)));
    uint _2827 = uint(int(uint(int(_2825)) >> uint(2)));
    int _2829 = int(_2825) & 3;
    float _2831 = (*spvDescriptorSet0.vp_c15)._m0[int(_2827)][_2829];
    int _2833 = int(_2825) + 1;
    uint _2835 = uint(int(uint(_2833) >> uint(2)));
    int _2837 = _2833 & 3;
    float _2839 = (*spvDescriptorSet0.vp_c15)._m0[int(_2835)][_2837];
    float _2841 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2815);
    float _2843 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2819);
    bool _2845 = _2813 >= 0.0;
    float _2847 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2817);
    float _2849 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2841);
    float _2851 = _2843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2853 = _2813 <= 1.0;
    bool _2855 = _2853 && _2845;
    float _2857 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2847);
    float _2859 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2821);
    float _2861 = _2849 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2863 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2865 = _2857 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2867 = _2809 >= 0.0;
    bool _2869 = _2867 && _2855;
    float _2871 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2859);
    float _2873 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2863);
    float _2875 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2877 = _2865 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2879 = _2809 <= 1.0;
    bool _2881 = _2879 && _2869;
    float _2883 = _2871 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2885 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2873);
    float _2887 = -_2877;
    float _2889 = fma(_2887, _2875, 1.0);
    float _2891 = _2793;
    if (!_2581)
    {
        float _2893 = floor(_2369);
        _2891 = _2893;
    }
    float _2895 = _2891;
    float _2897 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2899 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2885);
    float _2901 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2903 = _2315 * _2531;
    float _2905 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2897);
    float _2907 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2901);
    float _2909 = log2(_2889);
    float _2911 = _2901;
    if (_2881)
    {
        float _2913 = float(_2309);
        _2465 = _2913;
    }
    float _2915 = _2465;
    float _2917 = fma(_2043, _2523, _2903);
    float _2919 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2905);
    float _2921 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2907);
    float _2923 = _2915;
    if (!_2581)
    {
        float _2925 = -_2625;
        float _2927 = _2367 + _2925;
        _2911 = _2927;
    }
    float _2929 = _2911;
    float _2931 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2919);
    float _2933 = 1.0 / _2899;
    float _2935 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2921);
    if (!_2581)
    {
        float _2937 = -_2895;
        float _2939 = _2369 + _2937;
        _2467 = _2939;
    }
    float _2941 = _2467;
    float _2943 = _2903;
    if (_2881)
    {
        float _2945 = rint(_2915);
        float _2947 = precise::max(_2945, 0.0);
        uint _2949 = uint(_2947);
        uint _2951 = clamp(_2949, 0u, 65535u);
        _2943 = as_type<float>(_2951);
    }
    float _2953 = _2943;
    float _2955 = _2909 * 0.693147182464599609375;
    float _2957 = fma(_2045, _2831, _2917);
    float _2959 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2961 = _2957 + _2839;
    float _2963 = _2625;
    if (!_2581)
    {
        float _2965 = rint(_2807);
        float _2967 = precise::max(_2965, 0.0);
        uint _2969 = uint(_2967);
        uint _2971 = clamp(_2969, 0u, 65535u);
        _2963 = as_type<float>(_2971);
    }
    float _2973 = _2963;
    float _2975 = _2931 * _2933;
    float _2977 = _2935 * _2933;
    float _2979 = _2961 * _2591;
    float _2981 = fma(_2975, 0.5, 0.5);
    float _2983 = fma(_2977, -0.5, 0.5);
    float _2985 = _2809;
    if (_2881)
    {
        float3 _8400 = float3(_2813, _2809, float(as_type<int>(_2953)));
        float3 _8404 = select(_8400, float3(0.0), isnan(_8400));
        float _2987 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8404.xy, uint(rint(_8404.z)), _2979, level(0.0));
        _2985 = _2987;
    }
    float _2989 = _2985;
    float3 _8414 = float3(_2981, _2983, _2959);
    float _2991 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8414, float3(0.0), isnan(_8414)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8414, float3(0.0), isnan(_8414)), level(0.0)).x;
    float3 _8423 = float3(_2981, _2983, _2959);
    float4 _2994 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8423, float3(0.0), isnan(_8423)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8423, float3(0.0), isnan(_8423)), level(0.0)).xyzw;
    float _2996 = _2994.x;
    float _2998 = _2994.y;
    float _3000 = _2994.z;
    float _3002 = _2994.w;
    float _3004 = _2929;
    if (!_2581)
    {
        float3 _8446 = float3(_2929, _2941, float(as_type<int>(_2973)));
        float3 _8448 = select(_8446, float3(0.0), isnan(_8446));
        float _3006 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8448.xy, uint(rint(_8448.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8448.xy, uint(rint(_8448.z)), level(0.0)).x;
        _3004 = _3006;
    }
    float _3008 = _3004;
    if (_2581)
    {
        _2923 = 1.0;
    }
    float _3010 = _2923;
    float _3012 = _3010;
    if (!_2581)
    {
        int _3014 = _2607 << 4;
        int _3016 = _3014 + 2048;
        uint _3018 = uint(int(uint(_3016) >> uint(2)));
        uint _3020 = uint(int(uint(int(_3018)) >> uint(2)));
        int _3022 = int(_3018) & 3;
        float _3024 = (*spvDescriptorSet0.vp_c15)._m0[int(_3020)][_3022];
        int _3026 = int(_3018) + 1;
        uint _3028 = uint(int(uint(_3026) >> uint(2)));
        int _3030 = _3026 & 3;
        float _3032 = (*spvDescriptorSet0.vp_c15)._m0[int(_3028)][_3030];
        int _3034 = _3016 + 8;
        uint _3036 = uint(int(uint(_3034) >> uint(2)));
        uint _3038 = uint(int(uint(int(_3036)) >> uint(2)));
        int _3040 = int(_3036) & 3;
        float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
        int _3044 = int(_3036) + 1;
        uint _3046 = uint(int(uint(_3044) >> uint(2)));
        int _3048 = _3044 & 3;
        float _3050 = (*spvDescriptorSet0.vp_c15)._m0[int(_3046)][_3048];
        float _3052 = _2315 * _3032;
        float _3054 = fma(_2043, _3024, _3052);
        float _3056 = fma(_2045, _3042, _3054);
        float _3058 = _3056 + _3050;
        float _3060 = precise::clamp(_3058, 0.0, 1.0);
        float _3062 = -_3060;
        float _3064 = _3062 + _3008;
        float _3066 = fma(_3064, 500.0, 1.5);
        float _3068 = exp2(_3066);
        float _3070 = 0.0 + _3068;
        float _3072 = precise::clamp(_3070, 0.0, 1.0);
        _2613 = as_type<float>(_3016);
        _3012 = _3072;
    }
    float _3074 = _2613;
    float _3076 = _3012;
    float _3078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3080 = _2787 + _3078;
    float _3082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3084 = _2789 + _3082;
    float _3086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3088 = _2791 + _3086;
    float _3090 = _3080 * _3080;
    float _3092 = fma(_3084, _3084, _3090);
    float _3094 = fma(_3088, _3088, _3092);
    float _3096 = rsqrt(_3094);
    float _3098 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3100 = _3084 * _3098;
    float _3102 = _3088 * _3098;
    float _3104 = _3100 * _3100;
    float _3106 = _3102 * _3102;
    float _3108 = _3104 + _3106;
    float _3110 = sqrt(_3108);
    bool _3112 = _3110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3116 = _3110 + _3114;
    float _3118 = _3088;
    float _3120 = _3108;
    float _3122 = _3116;
    float _3124 = _3074;
    float _3126 = _3080;
    float _3128 = _3098;
    if (_3112)
    {
        float _3130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3118 = _3130;
    }
    float _3132 = _3118;
    if (_3112)
    {
        float _3134 = rsqrt(_3108);
        _3120 = _3134;
    }
    float _3136 = _3120;
    float _3138 = _3136;
    if (_3112)
    {
        float _3140 = _3116 * _3132;
        _3122 = _3140;
    }
    float _3142 = _3122;
    if (_3112)
    {
        float _3144 = _3142 * 0.15915493667125701904296875;
        _3124 = _3144;
    }
    float _3146 = _3124;
    float _3148 = _3090;
    if (_3112)
    {
        float _3150 = _3146 * 6.283185482025146484375;
        float _3152 = sin(_3150);
        _3148 = _3152;
    }
    float _3154 = _3148;
    float _3156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3158 = precise::max(0.0, _3156);
    float _3160 = _3096;
    float _3162 = _3156;
    if (_3112)
    {
        float _3164 = _3146 * 6.283185482025146484375;
        float _3166 = cos(_3164);
        _3160 = _3166;
    }
    float _3168 = _3160;
    float _3170 = -_3098;
    float _3172 = -_3158;
    float _3174 = fma(_3080, _3170, _3172);
    float _3176 = _3174;
    if (!_3112)
    {
        _3126 = _3102;
    }
    float _3178 = _3126;
    float _3180 = _3178;
    if (_3112)
    {
        float _3182 = _3174 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3162 = _3182;
    }
    float _3184 = _3162;
    float _3186 = _3154;
    float _3188 = _3184;
    if (_3112)
    {
        float _3190 = fma(_3154, _3184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3186 = _3190;
    }
    float _3192 = _3186;
    float _3194 = _3192;
    float _3196 = _3168;
    if (_3112)
    {
        float _3198 = _3168 + (-1.0);
        _3188 = _3198;
    }
    float _3200 = _3188;
    if (_3112)
    {
        float _3202 = _3136 * _3192;
        _2069 = _3202;
    }
    float _3204 = _2069;
    if (!_3112)
    {
        _3194 = _3100;
    }
    float _3206 = _3194;
    float _3208 = _3206;
    if (_3112)
    {
        float _3210 = _3200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3128 = _3210;
    }
    float _3212 = _3128;
    if (_3112)
    {
        float _3214 = _3100 * _3204;
        _3208 = _3214;
    }
    float _3216 = _3208;
    if (_3112)
    {
        float _3218 = _3102 * _3204;
        _3180 = _3218;
    }
    float _3220 = _3180;
    if (!_3112)
    {
        _3138 = _3106;
    }
    float _3222 = _3138;
    float _3224 = _3222;
    if (_3112)
    {
        float _3226 = fma(_3174, _3168, _3212);
        _3176 = _3226;
    }
    float _3228 = _3176;
    if (!_3112)
    {
        _3196 = _3104;
    }
    float _3230 = _3196;
    float _3232 = _3230;
    if (_3112)
    {
        float _3234 = _3216 * _3216;
        _3232 = _3234;
    }
    float _3236 = _3232;
    if (_3112)
    {
        float _3238 = _3220 * _3220;
        _3224 = _3238;
    }
    float _3240 = _3224;
    float _3242 = sqrt(_3094);
    float _3244 = fma(_3228, _3228, _3236);
    float _3246 = _3244 + _3240;
    float _3248 = rsqrt(_3246);
    float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3252 = fma(_3242, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3250);
    float _3254 = precise::clamp(_3252, 0.0, 1.0);
    float _3256 = -_3254;
    float _3258 = _3256 + 1.0;
    float _3260 = abs(_3258);
    float _3262 = log2(_3260);
    float _3264 = _3248 * _3216;
    float _3266 = _3248 * _3228;
    float _3268 = _3248 * _3220;
    float _3270 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3272 = -_3270;
    float _3274 = fma(_3266, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3272);
    float _3276 = -_3268;
    float _3278 = fma(_3276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3274);
    float _3280 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3282 = fma(_3278, -0.5, 0.5);
    float _3284 = fma(_3278, 0.5, 0.5);
    float _3286 = exp2(_3280);
    float _3288 = _3266 + 1.0;
    float _3290 = fma(_3284, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3292 = fma(_3284, _3290, -0.212114393711090087890625);
    float _3294 = sqrt(_3282);
    float _3296 = fma(_3284, _3292, 1.570728778839111328125);
    float _3298 = -_3266;
    float _3300 = fma(_3286, _3288, _3298);
    float _3302 = fma(_3300, 0.5, 0.5);
    float _3304 = _3294 * 0.636619746685028076171875;
    float _3306 = -_3296;
    float _3308 = fma(_3304, _3306, 1.0);
    float2 _8917 = float2(_3308, _3302);
    float3 _3312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8917, float2(0.0), isnan(_8917)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8917, float2(0.0), isnan(_8917)), level(0.0)).xyz;
    float _3314 = _3312.x;
    float _3316 = _3312.y;
    float _3318 = _3312.z;
    float _3320 = abs(_2279);
    float _3322 = log2(_3320);
    float _3324 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3326 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3328 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3330 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3332 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3324);
    float _3334 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3326);
    float _3336 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3328);
    float _3338 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3330);
    float _3340 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3332);
    float _3342 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3344 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3334);
    float _3346 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3336);
    float _3348 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3338);
    float _3350 = _3322 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3352 = _3340 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3354 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3342);
    float _3356 = _3344 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3358 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3360 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3362 = exp2(_3350);
    float _3364 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3354);
    float _3366 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3368 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3370 = _2279 <= 8000.0;
    bool _3372 = isnan(_2279);
    bool _3374 = _3370 || _3372;
    bool _3376 = isnan(8000.0);
    bool _3378 = _3374 || _3376;
    float _3380 = float(_3378);
    float _3382 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3360);
    float _3384 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3364);
    float _3386 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3366);
    float _3388 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3368);
    float _3390 = -_2237;
    float _3392 = _3390 + 1.0;
    out.m_95.y = 1.0;
    float _3394 = -_280;
    float _3396 = _3394 + _2789;
    float _3398 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3388);
    float _3400 = -_330;
    float _3402 = _3400 + _2791;
    out.gl_Position.x = _2931;
    out.gl_Position.y = _2935;
    out.gl_Position.z = _3384;
    out.gl_Position.w = _2899;
    float _3404 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3406 = precise::clamp(_3404, 0.0, 1.0);
    float _3408 = fma(_3406, -2.0, 3.0);
    float _3410 = _3406 * _3406;
    float _3412 = _3410 * _3408;
    float _3414 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3416 = -_3412;
    float _3418 = _3416 + 1.0;
    float _3420 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3414);
    float _3422 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3424 = fma(_3418, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3412);
    float _3426 = _3348 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3428 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3430 = _3422 + _3382;
    float _3432 = _3380 * _3424;
    float _3434 = _3384 + _2899;
    float _3436 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3430);
    float _3438 = exp2(_3428);
    float _3440 = _3434 * 0.5;
    float _3442 = _3434;
    if (!_2881)
    {
        _3442 = 1.0;
    }
    float _3444 = _3442;
    float _3446 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3398);
    float _3448 = _3444;
    if (_2881)
    {
        bool _3450 = _2989 >= _2979;
        bool _3452 = isnan(_2989);
        bool _3454 = _3450 || _3452;
        bool _3456 = isnan(_2979);
        bool _3458 = _3454 || _3456;
        float _3460 = float(_3458);
        _3448 = _3460;
    }
    float _3462 = _3448;
    float _3464 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_97.z = _3440;
    out.m_97.w = _2899;
    float _3466 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3468 = 1.0 / _3436;
    float _3470 = _3392 * _3464;
    float _3472 = precise::clamp(_3470, 0.0, 1.0);
    float _3474 = _3462 * _3076;
    float _3476 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3478 = _3466 + _3420;
    float _3480 = -_3472;
    float _3482 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3484 = _3476 + _3386;
    float _3486 = -_3438;
    float _3488 = _3486 + 1.0;
    float _3490 = -_288;
    float _3492 = _3490 + _2787;
    float _3494 = -_3474;
    float _3496 = fma(_3494, _3482, 1.0);
    float _3498 = precise::clamp(_3496, 0.0, 1.0);
    float _3500 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3478);
    float _3502 = _3488 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3504 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3484);
    float _3506 = _3502 * _2991;
    float _3508 = _3446 * _3468;
    float _3510 = -_3502;
    float _3512 = _3510 + 1.0;
    float _3514 = _3500 * _3468;
    float _3516 = _3002 * _3506;
    float _3518 = _3504 * _3468;
    bool _3520 = _3508 > 0.0;
    float _3522 = _3002 * _3512;
    bool _3524 = _3508 < 1.0;
    bool _3526 = _3524 && _3520;
    bool _3528 = _2975 > (-1.0);
    bool _3530 = _3528 && _3526;
    bool _3532 = _2977 > (-1.0);
    bool _3534 = _3532 && _3530;
    bool _3536 = _2975 < 1.0;
    bool _3538 = _3536 && _3534;
    bool _3540 = _2977 < 1.0;
    bool _3542 = _3540 && _3538;
    float _3544 = _3318 * _3506;
    float _3546 = fma(_3314, _3516, _2996);
    float _3548 = fma(_3316, _3516, _2998);
    float _3550 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3552 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3550);
    float _3554 = _3498 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3556 = fma(_3002, _3544, _3000);
    float _3558 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3560 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3552);
    out.m_95.x = _3554;
    float _3562 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3558);
    float _3564 = _3560 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3566 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_99.x = _3546;
    out.m_99.y = _3548;
    out.m_99.z = _3556;
    out.m_99.w = _3522;
    float _3568 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3562);
    float _3570 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3566);
    float _3572 = 1.0 / _3564;
    float _3574 = _3568 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3576 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3570);
    float _3578 = _3576 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3580 = _2219 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3582 = _3578 * _3572;
    float _3584 = _3574 * _3572;
    bool _3586 = !_3542;
    float _3588 = _3582;
    float _3614;
    float _3616;
    float _3624;
    if (!_3586)
    {
        float _3590 = -_3518;
        float _3592 = _2977 + _3590;
        float _3594 = -_3514;
        float _3596 = _2975 + _3594;
        float _3598 = -_3582;
        float _3600 = _2975 + _3598;
        float _3602 = -_3584;
        float _3604 = _2977 + _3602;
        float _3606 = _3592 * _3592;
        float _3608 = fma(_3596, _3596, _3606);
        float _3610 = sqrt(_3608);
        bool _3612 = _3610 > 0.0;
        _3614 = _3608;
        _3616 = _3610;
        if (!_3612)
        {
            _3588 = _3580;
        }
        float _3618 = _3588;
        bool _3620 = !_3612;
        float _3622 = _3618;
        _3624 = _3618;
        _3626 = _3620;
        if (!_3626)
        {
            float _3628 = _3604 * _3604;
            float _3630 = fma(_3600, _3600, _3628);
            float _3632 = rsqrt(_3608);
            float _3634 = sqrt(_3630);
            float _3636 = _3596 * _3632;
            float _3638 = _3592 * _3632;
            bool _3640 = _3634 > 0.0;
            _2303 = _3634;
            _3616 = _3632;
            if (!_3640)
            {
                _3622 = _3580;
            }
            float _3642 = _3622;
            bool _3644 = !_3640;
            _3624 = _3642;
            _3626 = _3644;
            if (!_3626)
            {
                float _3646 = _1793 * _3426;
                float _3648 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _3650 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3422);
                float _3652 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3476);
                float _3654 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3466);
                float _3656 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3650);
                float _3658 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3652);
                float _3660 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3654);
                float _3662 = rsqrt(_3630);
                float _3664 = _3648 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3666 = 1.0 / _3656;
                float _3668 = _3604 * _3664;
                float _3670 = _3600 * _3664;
                float _3672 = _3668 * _3668;
                float _3674 = fma(_3670, _3670, _3672);
                float _3676 = _3658 * _3666;
                float _3678 = _3660 * _3666;
                float _3680 = sqrt(_3674);
                float _3682 = _3676 * _3676;
                float _3684 = fma(_3678, _3678, _3682);
                float _3686 = _3604 * _3662;
                float _3688 = _3600 * _3662;
                float _3690 = sqrt(_3684);
                float _3692 = _3638 * _3686;
                float _3694 = fma(_3636, _3688, _3692);
                float _3696 = precise::min(0.0, _3694);
                float _3698 = _2899 * _3696;
                float _3700 = fma(_3680, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3690);
                float _3702 = fma(_3670, _3698, _2931);
                float _3704 = 1.0 / _3700;
                float _3706 = fma(_3668, _3698, _2935);
                out.gl_Position.x = _3702;
                out.gl_Position.y = _3706;
                float _3708 = _3690 * _3704;
                out.m_95.y = _3708;
                _3614 = _3692;
                _3624 = _3580;
                _2303 = _3668;
                _3616 = _3708;
                _3626 = true;
            }
        }
    }
    else
    {
        float _3710 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3710;
        _3614 = 0.0;
        _3624 = 0.0;
        _2303 = _3710;
        _3616 = 0.0;
    }
    _3626 = false;
    float _3712 = _3614;
    float _3714 = _3624;
    float _3716 = _2303;
    float _3718 = _3616;
    bool _3720 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3722 = isnan(_3242);
    bool _3724 = _3720 || _3722;
    bool _3726 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3728 = _3724 || _3726;
    float _3730 = _3716;
    float _3732 = _3712;
    float _3734 = _3718;
    if (!_3728)
    {
        _3730 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3736 = _3730;
    float _3738 = _3736;
    float _3740 = _3736;
    if (!_3728)
    {
        _3732 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3742 = _3732;
    float _3744 = _3742;
    float _3746 = _3742;
    if (!_3728)
    {
        _3734 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3748 = _3734;
    bool _3750 = !_3728;
    float _3752 = _3748;
    float _3754 = _3748;
    if (!_3750)
    {
        bool _3756 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3758 = isnan(_3242);
        bool _3760 = _3756 || _3758;
        bool _3762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3764 = _3760 || _3762;
        if (!_3764)
        {
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = _3242 + _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3772 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3770;
            float _3774 = 1.0 / _3772;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3784 = _3768 * _3774;
            float _3786 = precise::clamp(_3784, 0.0, 1.0);
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3792 = fma(_3786, _3782, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3794 = fma(_3786, _3790, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3796 = fma(_3786, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3746 = _3796;
            _3740 = _3794;
            _3754 = _3792;
            _3798 = true;
        }
        else
        {
            bool _3800 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3802 = isnan(_3242);
            bool _3804 = _3800 || _3802;
            bool _3806 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3808 = _3804 || _3806;
            if (!_3808)
            {
                _3738 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3810 = _3738;
            _3740 = _3810;
            if (!_3808)
            {
                _3744 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3812 = _3744;
            _3746 = _3812;
            if (!_3808)
            {
                _3752 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3814 = _3752;
            bool _3816 = !_3808;
            _3754 = _3814;
            if (!_3816)
            {
                bool _3818 = _3242 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3820 = isnan(_3242);
                bool _3822 = _3818 || _3820;
                bool _3824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3826 = _3822 || _3824;
                if (!_3826)
                {
                    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3830 = _3242 + _3828;
                    float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3834 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3832;
                    float _3836 = 1.0 / _3834;
                    float _3838 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3840 = _3838 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3842 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3844 = _3842 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3846 = _3830 * _3836;
                    float _3848 = precise::clamp(_3846, 0.0, 1.0);
                    float _3850 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3852 = _3850 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3854 = fma(_3848, _3844, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3856 = fma(_3848, _3852, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3858 = fma(_3848, _3840, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3746 = _3858;
                    _3740 = _3856;
                    _3754 = _3854;
                    _3798 = true;
                }
                else
                {
                    _3746 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3740 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3754 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3798 = false;
    float _3860 = _3746;
    float _3862 = _3740;
    float _3864 = _3754;
    float _3866 = _3860 * 0.586610972881317138671875;
    bool _3868 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3870 = _3714 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_101.x = 0.0;
    float _3872 = fma(_3862, 0.298911988735198974609375, _3866);
    out.m_61.x = _3870;
    float _3874 = fma(_3864, 0.114477999508380889892578125, _3872);
    float _3876 = -_3874;
    float _3878 = _3876 + _3862;
    float _3880 = -_3874;
    float _3882 = _3880 + _3860;
    float _3884 = -_3874;
    float _3886 = _3884 + _3864;
    float _3888 = fma(_3878, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3874);
    float _3890 = fma(_3882, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3874);
    float _3892 = fma(_3886, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3874);
    out.m_103.x = _3888;
    out.m_103.y = _3890;
    out.m_103.z = _3892;
    if (!_3868)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3894 = -_2787;
    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3898 = -_2789;
    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3902 = -_2791;
    float _3904 = _3902 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3906 = _3896 * _3896;
    float _3908 = fma(_3900, _3900, _3906);
    float _3910 = fma(_3904, _3904, _3908);
    float _3912 = sqrt(_3910);
    float _3914 = rsqrt(_3910);
    float _3916 = -_3912;
    float _3918 = _3916 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3920 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3922 = precise::clamp(_3920, 0.0, 1.0);
    float _3924 = _3900 * _3914;
    float _3926 = _3896 * _3914;
    float _3928 = abs(_3922);
    float _3930 = log2(_3928);
    float _3932 = _3904 * _3914;
    float _3934 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3936 = _1987 * _3926;
    float _3938 = -_3926;
    float _3940 = -_3934;
    float _3942 = fma(_3938, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3940);
    float _3944 = fma(_1981, _3924, _3936);
    float _3946 = -_3932;
    float _3948 = fma(_3946, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3942);
    float _3950 = fma(_1989, _3932, _3944);
    float _3952 = precise::clamp(_3950, 0.0, 1.0);
    float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3956 = _3948 + _3954;
    float _3958 = _3930 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3960 = _3956 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3962 = precise::clamp(_3960, 0.0, 1.0);
    float _3964 = exp2(_3958);
    float _3966 = _3964 * _3962;
    float _3968 = _3952 * _3966;
    float _3970 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3972 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3974 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _3970;
    out.m_101.y = _3972;
    out.m_101.z = _3974;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

