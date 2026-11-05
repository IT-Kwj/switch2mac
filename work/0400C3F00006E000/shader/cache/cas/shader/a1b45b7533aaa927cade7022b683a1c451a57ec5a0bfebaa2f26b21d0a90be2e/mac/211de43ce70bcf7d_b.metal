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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    texture2d_array<float> vp_t_tcb_14 [[id(19)]];
    sampler vp_t_tcb_14Smplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    sampler vp_t_tcb_14Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_89 [[user(locn0)]];
    float4 m_91 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_113 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_95 [[user(locn5)]];
    float4 m_103 [[user(locn6)]];
    float4 m_97 [[user(locn7)]];
    float4 m_99 [[user(locn8)]];
    float4 m_105 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_111 [[user(locn11)]];
    float4 m_101 [[user(locn12)]];
    float4 m_107 [[user(locn13)]];
    float4 m_109 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_71 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_85 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_87 [[attribute(11)]];
    float4 m_81 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2856 = false;
    bool _1719 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_60.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_63.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3141 = as_type<float>(_148);
        out.gl_Position.z = _3141;
    }
    if (!_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_65.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = 0.0;
    float _170 = _166;
    if (_162)
    {
        float _172 = float(_132);
        _168 = _172;
    }
    float _174 = _168;
    bool _176 = _166 >= _174;
    bool _178 = !_162;
    bool _180 = _176 || _178;
    if (_180)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _142;
    if (_180)
    {
        out.m_63.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3210 = as_type<float>(_186);
        out.gl_Position.z = _3210;
    }
    if (_180)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _196 = in.m_69.x;
    float _198 = in.m_69.y;
    float _200 = in.m_69.z;
    bool _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _206 = _202 || _204;
    bool _208 = isnan(1.0);
    bool _210 = _206 || _208;
    float _212 = in.m_71.x;
    float _214 = in.m_71.y;
    float _216 = in.m_71.z;
    float _218 = in.m_65.x;
    float _220 = in.m_65.y;
    float _222 = in.m_65.z;
    float _224 = 0.0;
    float _226 = _194;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_210)
    {
        float _230 = _194 * _194;
        float _232 = _230 * 0.5;
        _224 = _232;
    }
    float _234 = _224;
    float _236 = _234;
    if (!_210)
    {
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _238;
    }
    float _240 = _236;
    float _242 = _188 * _188;
    float _244 = _190 * _190;
    float _246 = _192 * _192;
    float _248 = fma(_196, _196, _242);
    float _250 = fma(_198, _198, _244);
    float _252 = fma(_200, _200, _246);
    float _254 = fma(_212, _212, _248);
    float _256 = fma(_214, _214, _250);
    float _258 = fma(_216, _216, _252);
    float _260 = sqrt(_254);
    float _262 = sqrt(_256);
    bool _264 = _260 > 0.0;
    float _266 = sqrt(_258);
    bool _268 = _262 > 0.0;
    float _270 = _260;
    float _272 = _240;
    float _274 = _188;
    if (_264)
    {
        float _276 = rsqrt(_254);
        _270 = _276;
    }
    float _278 = _270;
    bool _280 = _266 > 0.0;
    float _282 = 0.0;
    float _284 = _266;
    if (_268)
    {
        float _286 = rsqrt(_256);
        _282 = _286;
    }
    float _288 = _282;
    bool _290 = !_210;
    float _292 = _278;
    if (!_290)
    {
        float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = log2(_294);
        float _298 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _300 = _298 + 1.0;
        float _302 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = _194 * _296;
        float _306 = 1.0 / _300;
        float _308 = _302 * 0.693147182464599609375;
        float _310 = exp2(_304);
        float _312 = 1.0 / _308;
        float _314 = _310 + (-1.0);
        float _316 = -_314;
        float _318 = fma(_316, _312, _194);
        float _320 = _318 * _306;
        float _322 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = _322;
        _284 = _320;
    }
    float _324 = _272;
    float _326 = _284;
    bool _328 = !_210;
    float _330 = _326;
    if (!_328)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = 1.0 / _338;
        float _342 = _194 * _334;
        float _344 = exp2(_342);
        float _346 = -_344;
        float _348 = _346 + 1.0;
        float _350 = _348 * _340;
        _226 = _350;
        _228 = _338;
    }
    float _352 = _226;
    float _354 = _228;
    float _356 = in.m_73.w;
    float _358 = _354;
    if (!_264)
    {
        _330 = 0.0;
    }
    float _360 = _330;
    float _362 = _360;
    if (_264)
    {
        float _364 = _278 * _196;
        _362 = _364;
    }
    float _366 = _362;
    if (!_264)
    {
        _358 = 0.0;
    }
    float _368 = _358;
    float _370 = in.m_60.x;
    float _372 = in.m_60.y;
    float _374 = in.m_60.z;
    float _376 = 0.0;
    float _378 = _368;
    if (!_264)
    {
        _376 = 0.0;
    }
    float _380 = _376;
    float _382 = _380;
    if (_264)
    {
        float _384 = _278 * _188;
        _378 = _384;
    }
    float _386 = _378;
    if (_264)
    {
        float _388 = _278 * _212;
        _382 = _388;
    }
    float _390 = _382;
    float _392 = _258;
    if (_280)
    {
        float _394 = rsqrt(_258);
        _392 = _394;
    }
    float _396 = _392;
    bool _398 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _400 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _402 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _404 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _406 = 0.0;
    float _408 = _402;
    if (!_268)
    {
        _406 = 0.0;
    }
    float _410 = _406;
    float _412 = fma(_352, _218, _400);
    float _414 = fma(_352, _220, _402);
    float _416 = fma(_352, _222, _404);
    float _418 = 0.0;
    float _420 = _410;
    if (!_280)
    {
        _408 = 0.0;
        _418 = 0.0;
    }
    float _422 = _408;
    float _424 = _418;
    float _426 = 0.0;
    float _428 = _424;
    float _430 = _422;
    if (!_268)
    {
        _426 = 0.0;
    }
    float _432 = _426;
    float _434 = _432;
    if (_268)
    {
        float _436 = _288 * _198;
        _420 = _436;
    }
    float _438 = _420;
    if (!_268)
    {
        _292 = 0.0;
    }
    float _440 = _292;
    float _442 = _440;
    if (_268)
    {
        float _444 = _288 * _190;
        _434 = _444;
    }
    float _446 = _434;
    float _448 = 0.0;
    if (!_280)
    {
        _448 = 0.0;
    }
    float _450 = _448;
    float _452 = _450;
    if (_268)
    {
        float _454 = _288 * _214;
        _442 = _454;
    }
    float _456 = _442;
    float _458 = _456;
    if (_280)
    {
        float _460 = _396 * _200;
        _452 = _460;
    }
    float _462 = _452;
    if (_280)
    {
        float _464 = _396 * _192;
        _428 = _464;
    }
    float _466 = _428;
    if (_280)
    {
        float _468 = _396 * _216;
        _430 = _468;
    }
    float _470 = _430;
    float _472 = fma(_412, _356, _370);
    float _474 = fma(_414, _356, _372);
    float _476 = fma(_416, _356, _374);
    bool _478 = !_398;
    float _496;
    if (!_478)
    {
        float _480 = in.m_75.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_132);
        float _502 = 1.0 / _500;
        float _504 = _166 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = in.m_75.z;
    float _510 = _474 * _198;
    float _512 = in.m_75.x;
    float _514 = _474 * _214;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _516;
    float _520 = fma(_472, _196, _510);
    float _522 = in.m_75.y;
    float _524 = 1.0 / _518;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _530;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _544 = _542 != 0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _548 = _506 + _546;
    float _550 = fma(_472, _212, _514);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _554 = _506 + _552;
    float _556 = 1.0 / _528;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _560 = _506 + _558;
    float _562 = fma(_476, _216, _550);
    float _564 = _474 * _190;
    float _566 = _508 * 2.0;
    bool _568 = !_540;
    int _570 = _568 ? 0 : 1;
    float _572 = 1.0 / _532;
    float _574 = _560 * _524;
    float _576 = _512 * 2.0;
    float _578 = _512 + _508;
    int _580 = abs(_570);
    float _582 = fma(_472, _188, _564);
    float _584 = _522 * 2.0;
    float _586 = _578 + (-1.0);
    float _588 = floor(_566);
    float _590 = _548 * _556;
    float _592 = _522 + _508;
    float _594 = _512 + _522;
    float _596 = fma(_476, _192, _582);
    float _598 = _592 + (-1.0);
    float _600 = _594 + (-1.0);
    float _602 = floor(_584);
    float _604 = _554 * _572;
    float _606 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _608;
    float _612 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _614 = _588 > 0.0;
    float _616 = fma(_610, _574, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _618 = _588 >= 0.0;
    bool _620 = isnan(_588);
    bool _622 = _618 || _620;
    bool _624 = isnan(0.0);
    bool _626 = _622 || _624;
    float _628 = floor(_576);
    int _630 = _626 ? 0 : 1;
    bool _632 = _602 >= 0.0;
    bool _634 = isnan(_602);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    int _642 = ~_630;
    int _644 = _642 + 1;
    int _646 = _644 + 1;
    float _648 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _650 = _646;
    int _652 = as_type<int>(_512);
    if (!_614)
    {
        int _654 = ~_630;
        int _656 = _654 + 1;
        _650 = _656;
    }
    int _658 = _650;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _660;
    bool _664 = _628 > 0.0;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _666;
    bool _670 = _628 >= 0.0;
    bool _672 = isnan(_628);
    bool _674 = _670 || _672;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    float _680 = fma(_662, _574, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _682 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _684 = log2(_682);
    bool _686 = !_536;
    int _688 = _686 ? 0 : 1;
    float _690 = fma(_668, _574, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _692 = _602 > 0.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _698 = abs(_688);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _708 = _678 ? 0 : 1;
    float _710 = fma(_702, _590, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _712 = fma(_706, _590, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _714 = fma(_696, _590, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _716 = _684 * _166;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _720 = 1.0 + _718;
    bool _722 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(1.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = float(_698);
    float _734 = 1.0 / _720;
    float _736 = float(_658);
    int _738 = ~_708;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    int _744 = _742;
    if (!_664)
    {
        int _746 = ~_708;
        int _748 = _746 + 1;
        _744 = _748;
    }
    int _750 = _744;
    float _752 = _732 * _736;
    bool _754 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _756 = isnan(0.0);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _762 = _758 || _760;
    float _764 = exp2(_716);
    float _766 = in.m_77.x;
    float _768 = in.m_77.y;
    float _770 = in.m_77.z;
    float _772 = _752 * (-2.0);
    float _774 = float(_580);
    float _776 = float(_750);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _782;
    float _786 = _774 * _776;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _788;
    bool _792 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _794 = isnan(_506);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = fma(_780, _604, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _806 = _786 * (-2.0);
    float _808 = -_764;
    float _810 = _808 + 1.0;
    float _812 = fma(_784, _604, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _814 = fma(_790, _604, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _816 = -_802;
    float _818 = _816 + 1.0;
    float _820 = fma(_612, _806, _612);
    float _822 = _762 ? _810 : 0.0;
    int _824 = _640 ? 0 : 1;
    float _826 = fma(_806, _768, _768);
    if (_730)
    {
        float _828 = _822 * _734;
        _170 = _828;
    }
    float _830 = _170;
    float _832 = fma(_606, _772, _606);
    float _834 = fma(_772, _766, _766);
    bool _836 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _838 = isnan(_506);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _512 + (-0.5);
    bool _850 = !_544;
    int _852 = _850 ? 0 : 1;
    int _854 = ~_824;
    int _856 = _854 + 1;
    int _858 = _856 + 1;
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].x, _834);
    bool _862 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _864 = isnan(_506);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = _846 * _818;
    float _876 = -_846;
    float _878 = _876 + 1.0;
    int _880 = abs(_852);
    float _882 = _522 + (-0.5);
    int _884 = _858;
    if (!_692)
    {
        int _886 = ~_824;
        int _888 = _886 + 1;
        _884 = _888;
    }
    int _890 = _884;
    float _892 = _872 * _878;
    float _894 = -_872;
    float _896 = _894 + 1.0;
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _826);
    bool _900 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _902 = isnan(_506);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = fma(_832, _830, _860);
    float _914 = float(_880);
    float _916 = fma(_820, _830, _898);
    float _918 = float(_890);
    float _920 = _910 * _896;
    float _922 = _912 * 0.15915493667125701904296875;
    float _924 = _916 * 0.15915493667125701904296875;
    float _926 = _914 * _918;
    float _928 = _680 * _920;
    float _930 = _690 * _920;
    float _932 = _616 * _920;
    float _934 = -_910;
    float _936 = _934 + 1.0;
    float _938 = _926 * (-2.0);
    float _940 = in.m_73.x;
    float _942 = in.m_73.y;
    float _944 = in.m_73.z;
    float _946 = _922 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[143].x, _928);
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[143].y, _930);
    float _954 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[143].z, _932);
    float _956 = fma(_938, _770, _770);
    float _958 = _508 + (-0.5);
    float _960 = in.m_79.x;
    float _962 = in.m_79.y;
    float _964 = in.m_79.z;
    float _966 = fma(_648, _938, _648);
    float _968 = fma(_714, _892, _954);
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].z, _956);
    float _972 = fma(_712, _892, _950);
    float _974 = fma(_710, _892, _952);
    float _976 = fma(_814, _874, _968);
    float _978 = fma(_966, _830, _970);
    float _980 = fma(_804, _874, _972);
    float _982 = fma(_812, _874, _974);
    float _984 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[146].z, _976);
    float _986 = _978 * 0.15915493667125701904296875;
    float _988 = _922 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[146].x, _980);
    float _994 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[146].y, _982);
    float _996 = fma(_476, _200, _520);
    float _998 = _984 * _944;
    float _1000 = _994 * _942;
    float _1002 = _992 * _940;
    float _1004 = _924 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = in.m_71.w;
    float _1010 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _962);
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _960);
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _964);
    float _1020 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1022 = _924 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    float _1026 = _1016 * _1012;
    float _1028 = _1014 * _1010;
    float _1030 = _1018 * _1020;
    float _1032 = in.m_69.w;
    float _1034 = _986 * 6.283185482025146484375;
    float _1036 = cos(_1034);
    float _1038 = _948 * _1006;
    float _1040 = _990 * _1006;
    float _1042 = _986 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    float _1046 = _990 * _1024;
    float _1048 = _948 * _1024;
    float _1050 = _562 + _1008;
    float _1052 = _990 * _1036;
    float _1054 = _948 * _1036;
    float _1056 = _1024 * _1036;
    float _1058 = _1006 * _1036;
    float _1060 = _1052 * _1028;
    float _1062 = _1054 * _1028;
    float _1064 = _996 + _1032;
    float _1066 = fma(_1044, _1046, _1038);
    float _1068 = -_1028;
    float _1070 = _1044 * _1068;
    float _1072 = -_1048;
    float _1074 = fma(_1044, _1040, _1072);
    float _1076 = -_1040;
    float _1078 = fma(_1044, _1048, _1076);
    float _1080 = fma(_1066, _1026, _1060);
    float _1082 = fma(_1056, _1026, _1070);
    float _1084 = fma(_1044, _1038, _1046);
    float _1086 = fma(_1078, _1026, _1062);
    float _1088 = fma(_1074, _1030, _1080);
    float _1090 = fma(_1058, _1030, _1082);
    float _1092 = in.m_67.w;
    float _1094 = fma(_1084, _1030, _1086);
    float _1096 = _1088 * _438;
    float _1098 = _1088 * _456;
    float _1100 = _1088 * _446;
    float _1102 = fma(_1090, _366, _1096);
    float _1104 = fma(_1090, _390, _1098);
    float _1106 = fma(_1090, _386, _1100);
    float _1108 = fma(_1094, _462, _1102);
    float _1110 = fma(_1094, _470, _1104);
    float _1112 = fma(_1094, _466, _1106);
    float _1114 = _1064 + _1108;
    float _1116 = _1050 + _1110;
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1120 = _1114 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1124 = _1116 + _1122;
    float _1126 = _1120 * _1120;
    float _1128 = _1124 * _1124;
    float _1130 = _596 + _1092;
    float _1132 = _1126 + _1128;
    float _1134 = _1130 + _1112;
    float _1136 = sqrt(_1132);
    bool _1138 = _1136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = _1136 + _1140;
    float _1144 = _952;
    float _1146 = _1112;
    float _1148 = _1114;
    float _1150 = _1116;
    float _1152 = _1126;
    float _1154 = _1134;
    float _1156 = _1128;
    float _1158 = _1074;
    float _1160 = _1058;
    if (_1138)
    {
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1162;
    }
    float _1164 = _1144;
    if (_1138)
    {
        float _1166 = _1134 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1146 = _1166;
    }
    float _1168 = _1146;
    float _1170 = _1168;
    if (_1138)
    {
        float _1172 = rsqrt(_1132);
        _274 = _1172;
    }
    float _1174 = _274;
    float _1176 = _1164;
    float _1178 = _1174;
    if (_1138)
    {
        float _1180 = _1142 * _1164;
        _1176 = _1180;
    }
    float _1182 = _1176;
    float _1184 = _1182;
    if (_1138)
    {
        float _1186 = _1182 * 0.15915493667125701904296875;
        _1184 = _1186;
    }
    float _1188 = _1184;
    float _1190 = _1088;
    if (_1138)
    {
        float _1192 = _1188 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        _1190 = _1194;
    }
    float _1196 = _1190;
    if (_1138)
    {
        float _1198 = fma(_1196, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1170 = _1198;
    }
    float _1200 = _1170;
    if (_1138)
    {
        float _1202 = _1174 * _1200;
        _1178 = _1202;
    }
    float _1204 = _1178;
    if (_1138)
    {
        float _1206 = fma(_1120, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1148 = _1206;
    }
    float _1208 = _1148;
    if (_1138)
    {
        float _1210 = fma(_1124, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1150 = _1210;
    }
    float _1212 = _1150;
    float _1214 = fma(_1208, 6.2500002968590706586837768554688e-05, 0.5);
    float _1216 = fma(_1212, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4721 = float2(_1214, _1216);
    float3 _1220 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4721, float2(0.0), isnan(_4721)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4721, float2(0.0), isnan(_4721)), level(0.0)).xyz;
    float _1222 = _1220.x;
    float _1224 = _1220.y;
    float _1226 = _1220.z;
    float _1228 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1230 = in.m_81.y;
    float _1232 = _1228 * _512;
    float _1234 = in.m_75.w;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1242 = _1240 != 0;
    float _1244 = in.m_81.x;
    float _1246 = trunc(_1232);
    int _1248 = int(_1246);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1256 = _1254 != 0;
    bool _1258 = _522 > 0.5;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1260 = -_1230;
    float _1262 = _1260 + 1.0;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1266 = _1248 << 4;
    int _1268 = _1266 + 1968;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1274 = _1234 > 0.5;
    uint _1277 = uint(int(uint(_1268) >> uint(2)));
    uint _1279 = uint(int(uint(int(_1277)) >> uint(2)));
    int _1281 = int(_1277) & 3;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[int(_1279)][_1281];
    int _1285 = int(_1277) + 1;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    int _1289 = _1285 & 3;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[int(_1287)][_1289];
    float _1293 = in.m_85.x;
    float _1295 = in.m_85.y;
    float _1297 = in.m_85.z;
    float _1299 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1301 = _1274 ? as_type<int>(_1262) : as_type<int>(_1230);
    float _1303 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1305 = _962 != 0.0;
    bool _1307 = isnan(_962);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(0.0);
    bool _1313 = _1309 || _1311;
    int _1315 = 0;
    float _1317 = _1230;
    bool _1319 = _1256;
    float _1321 = 1.0;
    bool _1323 = _1258;
    float _1325 = _1272;
    float _1327 = _1212;
    if (_1252)
    {
        float _1329 = -_1244;
        float _1331 = _1329 + 1.0;
        _1315 = as_type<int>(_1331);
    }
    int _1333 = _1315;
    float _1335 = _1256 ? as_type<float>(_1301) : _1230;
    int _1337 = _1268 + 8;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    uint _1341 = uint(int(uint(int(_1339)) >> uint(2)));
    int _1343 = int(_1339) & 3;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[int(_1341)][_1343];
    bool _1347 = _960 == 0.0;
    bool _1349 = !_1313;
    bool _1351 = _1347 && _1349;
    if (_1238)
    {
        float _1353 = _1258 ? _1262 : _1230;
        _1317 = _1353;
    }
    float _1355 = _1317;
    bool _1357 = _964 == 0.0;
    bool _1359 = _1357 && _1351;
    float _1361 = in.m_87.x;
    float _1363 = in.m_87.y;
    float _1365 = in.m_87.z;
    float _1367 = in.m_87.w;
    if (_1242)
    {
        bool _1369 = _512 > 0.5;
        _1319 = _1369;
    }
    bool _1371 = _1319;
    if (_1242)
    {
        float _1373 = -_1244;
        float _1375 = _1373 + 1.0;
        _652 = as_type<int>(_1375);
    }
    int _1377 = _652;
    float _1379 = as_type<float>(_1377);
    if (!_1242)
    {
        _1321 = _1244;
    }
    float _1381 = _1321;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1385 = _1381;
    if (_1252)
    {
        bool _1387 = _508 > 0.5;
        _1323 = _1387;
    }
    bool _1389 = _1323;
    if (_1242)
    {
        float _1391 = _1371 ? as_type<float>(_1377) : _1244;
        _1385 = _1391;
    }
    float _1393 = _1385;
    float _1395 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1397 = 0.0;
    float _1399 = _1293;
    if (_1359)
    {
        _1397 = _1293;
    }
    float _1401 = _1397;
    out.m_89.x = _1299;
    out.m_89.y = _1395;
    out.m_89.z = _1303;
    out.m_89.w = _1272;
    float _1403 = _1401;
    if (_1359)
    {
        _1379 = _1401;
    }
    float _1405 = _1379;
    float _1407 = _1405;
    if (!_1359)
    {
        _1403 = _1293;
    }
    float _1409 = _1403;
    if (!_1252)
    {
        _1399 = _1244;
    }
    float _1411 = _1399;
    float _1413 = _1411;
    if (_1252)
    {
        float _1415 = _1389 ? as_type<float>(_1333) : _1244;
        _1413 = _1415;
    }
    float _1417 = _1413;
    if (!_1359)
    {
        float _1419 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1409);
        _1407 = _1419;
    }
    float _1421 = _1407;
    float _1423 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1359)
    {
        _1325 = _1295;
    }
    float _1425 = _1325;
    float _1427 = _1425;
    if (!_1359)
    {
        float _1429 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1295);
        _1427 = _1429;
    }
    float _1431 = _1427;
    float _1433 = _1363 * _1297;
    float _1435 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1437 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1439 = -_1431;
    float _1441 = _1044 * _1439;
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1365 * _1409;
    float _1447 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1449 = _1437;
    if (_1359)
    {
        _1449 = _1297;
    }
    float _1451 = _1449;
    float _1453 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1455 = _1451;
    if (!_1359)
    {
        float _1457 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1297);
        _1455 = _1457;
    }
    float _1459 = _1455;
    float _1461 = _1361 * _1295;
    float _1463 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = -_1445;
    float _1467 = fma(_1361, _1297, _1465);
    float _1469 = -_1433;
    float _1471 = fma(_1365, _1295, _1469);
    float _1473 = -_1461;
    float _1475 = fma(_1363, _1409, _1473);
    float _1477 = -_1363;
    float _1479 = _1044 * _1477;
    float _1481 = _1467 * _1367;
    out.m_91.x = _1447;
    out.m_91.y = _1443;
    out.m_91.z = _1463;
    float _1483 = _1471 * _1367;
    float _1485 = _1475 * _1367;
    float _1487 = _1052 * _1363;
    float _1489 = _1054 * _1363;
    float _1491 = fma(_1056, _1361, _1479);
    float _1493 = fma(_1066, _1361, _1487);
    float _1495 = fma(_1078, _1361, _1489);
    float _1497 = fma(_1058, _1365, _1491);
    float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1501 = -_1481;
    float _1503 = _1044 * _1501;
    float _1505 = _1052 * _1431;
    float _1507 = _1054 * _1431;
    float _1509 = _1052 * _1481;
    float _1511 = _1054 * _1481;
    float _1513 = fma(_1056, _1421, _1441);
    float _1515 = fma(_1066, _1421, _1505);
    float _1517 = fma(_1078, _1421, _1507);
    float _1519 = fma(_1078, _1483, _1511);
    float _1521 = fma(_1066, _1483, _1509);
    float _1523 = _1511;
    if (_1138)
    {
        float _1525 = _1188 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        _1523 = _1527;
    }
    float _1529 = _1523;
    float _1531 = fma(_1074, _1459, _1515);
    float _1533 = fma(_1058, _1459, _1513);
    float _1535 = fma(_1084, _1459, _1517);
    float _1537 = fma(_1074, _1365, _1493);
    float _1539 = fma(_1074, _1485, _1521);
    float _1541 = fma(_1056, _1483, _1503);
    float _1543 = fma(_1084, _1365, _1495);
    float _1545 = _1531 * _438;
    float _1547 = _1531 * _456;
    float _1549 = _1537 * _456;
    float _1551 = _1539 * _456;
    float _1553 = fma(_1058, _1485, _1541);
    float _1555 = fma(_1084, _1485, _1519);
    float _1557 = _1537 * _438;
    float _1559 = _1539 * _438;
    float _1561 = _1537;
    float _1563 = _1545;
    if (_1138)
    {
        float _1565 = _1529 + (-1.0);
        _458 = _1565;
    }
    float _1567 = _458;
    float _1569 = fma(_1533, _366, _1545);
    float _1571 = _1537 * _446;
    if (_1138)
    {
        float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1575 = _1208 + _1573;
        _1561 = _1575;
    }
    float _1577 = _1561;
    if (_1138)
    {
        float _1579 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1579;
    }
    float _1581 = _1563;
    float _1583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1585 = _1531 * _446;
    float _1587 = _1581;
    if (_1138)
    {
        float _1589 = _1577 * _1577;
        _1152 = _1589;
    }
    float _1591 = _1152;
    if (_1138)
    {
        float _1593 = fma(_1134, _1529, _1581);
        _1154 = _1593;
    }
    float _1595 = _1154;
    if (_1138)
    {
        float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1599 = _1212 + _1597;
        _1587 = _1599;
    }
    float _1601 = _1587;
    float _1603 = _1539 * _446;
    float _1605 = fma(_1533, _386, _1585);
    float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1609 = _1595 + _1607;
    float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1138)
    {
        float _1613 = _1601 * _1601;
        _1156 = _1613;
    }
    float _1615 = _1156;
    float _1617 = fma(_1533, _390, _1547);
    float _1619 = fma(_1609, _1609, _1591);
    float _1621 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1623 = fma(_1497, _366, _1557);
    float _1625 = fma(_1497, _386, _1571);
    float _1627 = _1619 + _1615;
    float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1631 = fma(_1553, _366, _1559);
    float _1633 = fma(_1553, _386, _1603);
    float _1635 = fma(_1497, _390, _1549);
    float _1637 = fma(_1553, _390, _1551);
    float _1639 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1641 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1643 = _1621 * _1583;
    float _1645 = sqrt(_1627);
    float _1647 = _1423 * _1499;
    float _1649 = fma(_1543, _462, _1623);
    float _1651 = fma(_1543, _466, _1625);
    float _1653 = fma(_1555, _462, _1631);
    float _1655 = fma(_1555, _466, _1633);
    float _1657 = _1639 * _1611;
    float _1659 = fma(_1543, _470, _1635);
    float _1661 = fma(_1555, _470, _1637);
    float _1663 = _1641 * _1629;
    float _1665 = fma(_1535, _462, _1569);
    float _1667 = fma(_1535, _466, _1605);
    float _1669 = fma(_1535, _470, _1617);
    out.m_93.x = _1649;
    out.m_93.y = _1651;
    out.m_93.z = _1659;
    bool _1671 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1673 = isnan(_1645);
    bool _1675 = _1671 || _1673;
    bool _1677 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1679 = _1675 || _1677;
    out.m_95.x = _1663;
    out.m_95.y = _1643;
    out.m_95.z = _1647;
    out.m_95.w = _1657;
    out.m_97.x = _1653;
    out.m_97.y = _1655;
    out.m_97.z = _1661;
    out.m_99.x = _1665;
    out.m_99.y = _1667;
    out.m_99.z = _1669;
    float _1681 = _1641;
    float _1683 = _1637;
    if (!_1679)
    {
        _1681 = 1.0;
    }
    float _1685 = _1681;
    out.m_101.x = _1222;
    out.m_101.y = _1224;
    out.m_101.z = _1226;
    bool _1687 = !_1679;
    float _1689 = _1685;
    if (!_1687)
    {
        bool _1691 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1693 = isnan(_1645);
        bool _1695 = _1691 || _1693;
        bool _1697 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1699 = _1695 || _1697;
        if (!_1699)
        {
            float _1701 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1703 = _1645 + _1701;
            float _1705 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1707 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1705;
            float _1709 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1713 = 1.0 / _1707;
            float _1715 = _1703 * _1713;
            float _1717 = fma(_1715, _1711, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1689 = _1717;
            _1719 = true;
        }
        else
        {
            bool _1721 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1723 = isnan(_1645);
            bool _1725 = _1721 || _1723;
            bool _1727 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1729 = _1725 || _1727;
            if (!_1729)
            {
                float _1731 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1733 = _1645 + _1731;
                float _1735 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1737 = _1735 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1741 = _1739 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1743 = 1.0 / _1737;
                float _1745 = _1733 * _1743;
                float _1747 = fma(_1745, _1741, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1689 = _1747;
                _1719 = true;
            }
            else
            {
                _1689 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1719 = false;
    float _1749 = _1689;
    float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1753 = _1595 + _1751;
    float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1757 = _1208 + _1755;
    float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1761 = _1212 + _1759;
    float _1763 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1765 = fma(_1753, _1749, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1767 = fma(_1757, _1749, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1769 = fma(_1761, _1749, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1771 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1763);
    float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1775 = _1765 + _1773;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1779 = _1767 + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1783 = _1769 + _1781;
    float _1785 = _1775 * _1775;
    float _1787 = fma(_1779, _1779, _1785);
    float _1789 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1791 = fma(_1783, _1783, _1787);
    float _1793 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1771);
    float _1795 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1797 = floor(_1789);
    float _1799 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1801 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1803 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1795);
    float _1805 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1803);
    float _1807 = rsqrt(_1791);
    float _1809 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1811 = _1809 + _1801;
    float _1813 = 1.0 / _1801;
    float _1815 = -_1797;
    float _1817 = _1789 + _1815;
    float _1819 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1821 = floor(_1799);
    float _1823 = _1779 * _1819;
    float _1825 = _1783 * _1819;
    float _1827 = _1823 * _1823;
    float _1829 = _1825 * _1825;
    float _1831 = _1811 * _1813;
    float _1833 = _1831 * 0.5;
    float _1835 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1837 = sqrt(_1791);
    float _1839 = _1827 + _1829;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1843 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1841);
    float _1845 = _1130 + _1835;
    float _1847 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1849 = sqrt(_1839);
    float _1851 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1853 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1847);
    float _1855 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1851);
    float _1857 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1853);
    float _1859 = 1.0 / _1843;
    float _1861 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1855);
    float _1863 = _1857 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1865 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1867 = _1849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1869 = trunc(_1863);
    int _1871 = int(_1869);
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1875 = _1859 * _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = _1849 + _1877;
    float _1881 = trunc(_1865);
    int _1883 = int(_1881);
    bool _1885 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1887 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1889 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1891 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1893 = _1871 + _1891;
    int _1895 = _1893 + 1;
    float _1897 = _1813;
    int _1899 = 2;
    float _1901 = _1839;
    float _1903 = _1819;
    float _1905 = _1879;
    float _1907 = _1797;
    float _1909 = _1823;
    float _1911 = _1827;
    int _1913 = as_type<int>(_1865);
    if (_1867)
    {
        float _1915 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1897 = _1915;
    }
    float _1917 = _1897;
    float _1919 = precise::max(0.0, _1889);
    if (!_1885)
    {
        _1899 = 1;
    }
    int _1921 = _1899;
    float _1923 = -_1819;
    float _1925 = -_1919;
    float _1927 = fma(_1775, _1923, _1925);
    int _1929 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1931 = _1883 + _1929;
    int _1933 = _1931 + 1;
    int _1935 = _1921;
    if (_1867)
    {
        float _1937 = rsqrt(_1839);
        _1901 = _1937;
    }
    float _1939 = _1901;
    float _1941 = _1939;
    if (_1867)
    {
        float _1943 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _1943;
    }
    float _1945 = _1903;
    int _1947 = _1895 | _1933;
    float _1949 = as_type<float>(_1947);
    if (_1867)
    {
        float _1951 = _1879 * _1917;
        _1905 = _1951;
    }
    float _1953 = _1905;
    if (!_1867)
    {
        _1907 = _1927;
    }
    float _1955 = _1907;
    float _1957 = _1955;
    if (_1867)
    {
        float _1959 = _1953 * 0.15915493667125701904296875;
        _1327 = _1959;
    }
    float _1961 = _1327;
    bool _1963 = !_1885;
    int _1965 = _1963 ? 0 : 1;
    float _1967 = _1857;
    if (_1867)
    {
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        _1967 = _1971;
    }
    float _1973 = _1967;
    if (!_1887)
    {
        _1935 = _1965;
    }
    int _1975 = _1935;
    bool _1977 = _1895 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1979 = _1975 << 6;
    bool _1981 = _1947 < 0;
    bool _1983 = _1981 || _1977;
    float _1985 = _1961;
    float _1987 = as_type<float>(_1975);
    if (_1867)
    {
        float _1989 = _1961 * 6.283185482025146484375;
        float _1991 = cos(_1989);
        _1985 = _1991;
    }
    float _1993 = _1985;
    int _1995 = _1979 + 96;
    uint _1997 = uint(int(uint(_1995) >> uint(2)));
    uint _1999 = uint(int(uint(int(_1997)) >> uint(2)));
    int _2001 = int(_1997) & 3;
    float _2003 = (*spvDescriptorSet0.vp_c15)._m0[int(_1999)][_2001];
    int _2005 = int(_1997) + 1;
    uint _2007 = uint(int(uint(_2005) >> uint(2)));
    int _2009 = _2005 & 3;
    float _2011 = (*spvDescriptorSet0.vp_c15)._m0[int(_2007)][_2009];
    bool _2013 = _1933 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2015 = _2013 || _1983;
    if (_1867)
    {
        float _2017 = fma(_1973, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1949 = _2017;
    }
    float _2019 = _1949;
    int _2021 = _1979 + 48;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    uint _2025 = uint(int(uint(int(_2023)) >> uint(2)));
    int _2027 = int(_2023) & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    int _2031 = int(_2023) + 1;
    uint _2033 = uint(int(uint(_2031) >> uint(2)));
    int _2035 = _2031 & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    float _2039 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1867)
    {
        float _2041 = _1939 * _2019;
        _1158 = _2041;
    }
    float _2043 = _1158;
    float _2045 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2039);
    float _2047 = _1993;
    if (_1867)
    {
        float _2049 = _1993 + (-1.0);
        _1941 = _2049;
    }
    float _2051 = _1941;
    int _2053 = _1979 + 64;
    uint _2055 = uint(int(uint(_2053) >> uint(2)));
    uint _2057 = uint(int(uint(int(_2055)) >> uint(2)));
    int _2059 = int(_2055) & 3;
    float _2061 = (*spvDescriptorSet0.vp_c15)._m0[int(_2057)][_2059];
    int _2063 = int(_2055) + 1;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    int _2067 = _2063 & 3;
    float _2069 = (*spvDescriptorSet0.vp_c15)._m0[int(_2065)][_2067];
    float _2071 = _2051;
    if (_1867)
    {
        float _2073 = _1823 * _2043;
        _1909 = _2073;
    }
    float _2075 = _1909;
    float _2077 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2045);
    if (_1867)
    {
        float _2079 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1160 = _2079;
    }
    float _2081 = _1160;
    if (!_1867)
    {
        _2071 = _1825;
    }
    float _2083 = _2071;
    float _2085 = _2083;
    if (_1867)
    {
        float _2087 = _1825 * _2043;
        _2085 = _2087;
    }
    float _2089 = _2085;
    if (_1867)
    {
        float _2091 = _2075 * _2075;
        _1911 = _2091;
    }
    float _2093 = _1911;
    if (_1867)
    {
        float _2095 = fma(_1927, _1993, _2081);
        _1957 = _2095;
    }
    float _2097 = _1957;
    int _2099 = _1979 + 104;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    uint _2103 = uint(int(uint(int(_2101)) >> uint(2)));
    int _2105 = int(_2101) & 3;
    float _2107 = (*spvDescriptorSet0.vp_c15)._m0[int(_2103)][_2105];
    int _2109 = int(_2101) + 1;
    uint _2111 = uint(int(uint(_2109) >> uint(2)));
    int _2113 = _2109 & 3;
    float _2115 = (*spvDescriptorSet0.vp_c15)._m0[int(_2111)][_2113];
    float _2117 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1867)
    {
        _2047 = _1829;
    }
    float _2119 = _2047;
    float _2121 = _2119;
    if (_1867)
    {
        float _2123 = _2089 * _2089;
        _2121 = _2123;
    }
    float _2125 = _2121;
    float _2127 = fma(_2097, _2097, _2093);
    if (!_2015)
    {
        float _2129 = floor(_1865);
        _1683 = _2129;
    }
    float _2131 = _1683;
    float _2133 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2135 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2137 = _1979 + 80;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    uint _2141 = uint(int(uint(int(_2139)) >> uint(2)));
    int _2143 = int(_2139) & 3;
    float _2145 = (*spvDescriptorSet0.vp_c15)._m0[int(_2141)][_2143];
    int _2147 = int(_2139) + 1;
    uint _2149 = uint(int(uint(_2147) >> uint(2)));
    int _2151 = _2147 & 3;
    float _2153 = (*spvDescriptorSet0.vp_c15)._m0[int(_2149)][_2151];
    float _2155 = -_1821;
    float _2157 = _1799 + _2155;
    float _2159 = _2127 + _2125;
    float _2161 = -_2135;
    float _2163 = fma(_2161, _2133, 1.0);
    int _2165 = as_type<int>(_2135);
    if (!_2015)
    {
        int _2167 = _1933 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2169 = _2167 + _1895;
        _2165 = _2169;
    }
    int _2171 = _2165;
    int _2173 = _1979 + 56;
    uint _2175 = uint(int(uint(_2173) >> uint(2)));
    uint _2177 = uint(int(uint(int(_2175)) >> uint(2)));
    int _2179 = int(_2175) & 3;
    float _2181 = (*spvDescriptorSet0.vp_c15)._m0[int(_2177)][_2179];
    int _2183 = int(_2175) + 1;
    uint _2185 = uint(int(uint(_2183) >> uint(2)));
    int _2187 = _2183 & 3;
    float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
    float _2191 = log2(_2163);
    int _2193 = _1979 + 88;
    uint _2195 = uint(int(uint(_2193) >> uint(2)));
    uint _2197 = uint(int(uint(int(_2195)) >> uint(2)));
    int _2199 = int(_2195) & 3;
    float _2201 = (*spvDescriptorSet0.vp_c15)._m0[int(_2197)][_2199];
    int _2203 = int(_2195) + 1;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    int _2207 = _2203 & 3;
    float _2209 = (*spvDescriptorSet0.vp_c15)._m0[int(_2205)][_2207];
    float _2211 = _1845 * _2011;
    float _2213 = fma(_1064, _2003, _2211);
    int _2215 = _1979 + 72;
    uint _2217 = uint(int(uint(_2215) >> uint(2)));
    uint _2219 = uint(int(uint(int(_2217)) >> uint(2)));
    int _2221 = int(_2217) & 3;
    float _2223 = (*spvDescriptorSet0.vp_c15)._m0[int(_2219)][_2221];
    int _2225 = int(_2217) + 1;
    uint _2227 = uint(int(uint(_2225) >> uint(2)));
    int _2229 = _2225 & 3;
    float _2231 = (*spvDescriptorSet0.vp_c15)._m0[int(_2227)][_2229];
    float _2233 = _1845 * _2037;
    float _2235 = _2191 * 0.693147182464599609375;
    float _2237 = rsqrt(_2159);
    float _2239 = fma(_1064, _2029, _2233);
    float _2241 = _1845 * _2069;
    float _2243 = _2069;
    int _2245 = as_type<int>(_2003);
    float _2247 = as_type<float>(_2171);
    if (!_2015)
    {
        float _2249 = -_2131;
        float _2251 = _1865 + _2249;
        _2243 = _2251;
    }
    float _2253 = _2243;
    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2257 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2255);
    float _2259 = precise::clamp(_2257, 0.0, 1.0);
    if (!_2015)
    {
        int _2261 = _2171 << 2;
        _1913 = _2261;
    }
    int _2263 = _1913;
    float _2265 = fma(_1064, _2061, _2241);
    float2 _6517 = float2(_1817, _2157);
    float _2267 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6517, float2(0.0), isnan(_6517)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6517, float2(0.0), isnan(_6517)), level(0.0)).x;
    float _2269 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    int _2271 = _2263;
    if (!_2015)
    {
        int _2273 = 12 & _2263;
        _2271 = _2273;
    }
    int _2275 = _2271;
    float _2277 = fma(_1050, _2107, _2213);
    float _2279 = _2237 * _2075;
    float _2281 = _2277 + _2115;
    float _2283 = _2237 * _2097;
    float _2285 = _2237 * _2089;
    float _2287 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2289 = _1845 * _2153;
    int _2291 = as_type<int>(_2153);
    if (!_2015)
    {
        uint _2293 = uint(int(uint(_2171) >> uint(2)));
        _2291 = int(_2293);
    }
    int _2295 = _2291;
    float _2297 = fma(_1064, _2145, _2289);
    float _2299 = -_2259;
    float _2301 = _2299 + 1.0;
    if (!_2015)
    {
        int _2303 = _2295 << 4;
        int _2305 = _2303 + _2275;
        _2245 = _2305;
    }
    int _2307 = _2245;
    float _2309 = fma(_1050, _2181, _2239);
    float _2311 = 1.0 / _2281;
    float _2313 = _2279;
    if (!_2015)
    {
        int _2315 = _2307 + 400;
        uint _2317 = uint(int(uint(_2315) >> uint(2)));
        uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
        int _2321 = int(_2317) & 3;
        float _2323 = (*spvDescriptorSet0.vp_c15)._m0[int(_2319)][_2321];
        _2313 = _2323;
    }
    float _2325 = _2313;
    float _2327 = _2309 + _2189;
    float _2329 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2331 = fma(_1050, _2201, _2297);
    float _2333 = -_2287;
    float _2335 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2333);
    float _2337 = abs(_2301);
    float _2339 = log2(_2337);
    float _2341 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2343 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2329);
    float _2345 = -_2285;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2335);
    float _2349 = _2331 + _2209;
    float _2351 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2341);
    float _2353 = fma(_1050, _2223, _2265);
    float _2355 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2343);
    float _2357 = _2327 * _2311;
    float _2359 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2351);
    float _2361 = _2353 + _2231;
    float _2363 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2365 = fma(_2347, -0.5, 0.5);
    bool _2367 = _2357 >= 0.0;
    float _2369 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2371 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2363);
    float _2373 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2375 = _2361 * _2311;
    bool _2377 = _2357 <= 1.0;
    bool _2379 = _2377 && _2367;
    float _2381 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2371);
    float _2383 = exp2(_2373);
    float _2385 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2387 = _2375 >= 0.0;
    bool _2389 = _2387 && _2379;
    float _2391 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2393 = fma(_2347, 0.5, 0.5);
    float _2395 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2397 = _2375 <= 1.0;
    bool _2399 = _2397 && _2389;
    float _2401 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2385);
    float _2403 = _2283 + 1.0;
    float _2405 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2407 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2401);
    float _2409 = sqrt(_2365);
    float _2411 = fma(_2393, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2413 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2407);
    float _2415 = -_2283;
    float _2417 = fma(_2383, _2403, _2415);
    float _2419 = fma(_2393, _2411, -0.212114393711090087890625);
    float _2421 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2423 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2405);
    float _2425 = 1.0 / _2413;
    if (_2399)
    {
        float _2427 = float(_1975);
        _1987 = _2427;
    }
    float _2429 = _1987;
    float _2431 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2421);
    float _2433 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2423);
    float _2435 = fma(_2393, _2419, 1.570728778839111328125);
    float _2437 = _2349 * _2311;
    float _2439 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2431);
    float _2441 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2433);
    float _2443 = _2423;
    float _2445 = _2437;
    if (_2399)
    {
        float _2447 = rint(_2429);
        float _2449 = precise::max(_2447, 0.0);
        uint _2451 = uint(_2449);
        uint _2453 = clamp(_2451, 0u, 65535u);
        _2443 = as_type<float>(_2453);
    }
    float _2455 = _2443;
    float _2457 = _2409 * 0.636619746685028076171875;
    float _2459 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2439);
    float _2461 = fma(_2417, 0.5, 0.5);
    float _2463 = -_2435;
    float _2465 = fma(_2457, _2463, 1.0);
    float _2467 = _2355;
    if (!_2015)
    {
        float _2469 = floor(_1863);
        _2467 = _2469;
    }
    float _2471 = _2467;
    float _2473 = _2441 * _2425;
    float _2475 = _2459 * _2425;
    float _2477 = fma(_2473, 0.5, 0.5);
    float _2479 = fma(_2475, -0.5, 0.5);
    float _2481 = _2455;
    if (_2399)
    {
        float3 _6891 = float3(_2357, _2375, float(as_type<int>(_2455)));
        float3 _6895 = select(_6891, float3(0.0), isnan(_6891));
        float _2483 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6895.xy, uint(rint(_6895.z)), _2437, level(0.0));
        _2481 = _2483;
    }
    float _2485 = _2481;
    float _2487 = _2311;
    if (!_2015)
    {
        float _2489 = rint(_2325);
        float _2491 = precise::max(_2489, 0.0);
        uint _2493 = uint(_2491);
        uint _2495 = clamp(_2493, 0u, 65535u);
        _2487 = as_type<float>(_2495);
    }
    float _2497 = _2487;
    float3 _6921 = float3(_2477, _2479, _2269);
    float _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6921, float3(0.0), isnan(_6921)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6921, float3(0.0), isnan(_6921)), level(0.0)).x;
    float _2501 = _2471;
    if (!_2015)
    {
        float _2503 = -_2471;
        float _2505 = _1863 + _2503;
        _2501 = _2505;
    }
    float _2507 = _2501;
    float3 _6942 = float3(_2477, _2479, _2269);
    float4 _2510 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6942, float3(0.0), isnan(_6942)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6942, float3(0.0), isnan(_6942)), level(0.0)).xyzw;
    float _2512 = _2510.x;
    float _2514 = _2510.y;
    float _2516 = _2510.z;
    float _2518 = _2510.w;
    float2 _6958 = float2(_2465, _2461);
    float3 _2520 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6958, float2(0.0), isnan(_6958)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6958, float2(0.0), isnan(_6958)), level(0.0)).xyz;
    float _2522 = _2520.x;
    float _2524 = _2520.y;
    float _2526 = _2520.z;
    float _2528 = _2497;
    if (!_2015)
    {
        float3 _6979 = float3(_2507, _2253, float(as_type<int>(_2497)));
        float3 _6981 = select(_6979, float3(0.0), isnan(_6979));
        float _2530 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6981.xy, uint(rint(_6981.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6981.xy, uint(rint(_6981.z)), level(0.0)).x;
        _2528 = _2530;
    }
    float _2532 = _2528;
    float _2534 = abs(_1875);
    float _2536 = log2(_2534);
    float _2538 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2540 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2538);
    float _2542 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2540);
    bool _2544 = _1875 <= 8000.0;
    bool _2546 = isnan(_1875);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(8000.0);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2542);
    float _2558 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2560 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2562 = exp2(_2558);
    out.gl_Position.x = _2441;
    out.gl_Position.y = _2459;
    out.gl_Position.z = _2556;
    out.gl_Position.w = _2413;
    float _2564 = exp2(_2560);
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2568 = precise::clamp(_2566, 0.0, 1.0);
    float _2570 = fma(_2568, -2.0, 3.0);
    float _2572 = _2568 * _2568;
    float _2574 = _2572 * _2570;
    float _2576 = _2556 + _2413;
    float _2578 = _2576 * 0.5;
    float _2580 = -_2574;
    float _2582 = _2580 + 1.0;
    out.m_103.z = _2578;
    out.m_103.w = _2413;
    float _2584 = fma(_2582, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2574);
    float _2586 = _2554 * _2584;
    float _2588 = _2584;
    float _2590 = _2556;
    float _2592 = _2441;
    if (!_2399)
    {
        _2588 = 1.0;
    }
    float _2594 = _2588;
    float _2596 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2598 = -_2562;
    float _2600 = _2598 + 1.0;
    float _2602 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2604 = _2600;
    float _2606 = _2594;
    if (_2015)
    {
        _2604 = 1.0;
    }
    float _2608 = _2604;
    float _2610 = -_2267;
    float _2612 = _2610 + 1.0;
    float _2614 = _2612 * _2596;
    float _2616 = precise::clamp(_2614, 0.0, 1.0);
    float _2618 = _2608;
    if (_2399)
    {
        bool _2620 = _2485 >= _2437;
        bool _2622 = isnan(_2485);
        bool _2624 = _2620 || _2622;
        bool _2626 = isnan(_2437);
        bool _2628 = _2624 || _2626;
        float _2630 = float(_2628);
        _2606 = _2630;
    }
    float _2632 = _2606;
    if (!_2015)
    {
        int _2634 = _2171 << 4;
        int _2636 = _2634 + 2048;
        uint _2638 = uint(int(uint(_2636) >> uint(2)));
        uint _2640 = uint(int(uint(int(_2638)) >> uint(2)));
        int _2642 = int(_2638) & 3;
        float _2644 = (*spvDescriptorSet0.vp_c15)._m0[int(_2640)][_2642];
        int _2646 = int(_2638) + 1;
        uint _2648 = uint(int(uint(_2646) >> uint(2)));
        int _2650 = _2646 & 3;
        float _2652 = (*spvDescriptorSet0.vp_c15)._m0[int(_2648)][_2650];
        int _2654 = _2636 + 8;
        uint _2656 = uint(int(uint(_2654) >> uint(2)));
        uint _2658 = uint(int(uint(int(_2656)) >> uint(2)));
        int _2660 = int(_2656) & 3;
        float _2662 = (*spvDescriptorSet0.vp_c15)._m0[int(_2658)][_2660];
        int _2664 = int(_2656) + 1;
        uint _2666 = uint(int(uint(_2664) >> uint(2)));
        int _2668 = _2664 & 3;
        float _2670 = (*spvDescriptorSet0.vp_c15)._m0[int(_2666)][_2668];
        float _2672 = _1845 * _2652;
        float _2674 = fma(_1064, _2644, _2672);
        float _2676 = fma(_1050, _2662, _2674);
        float _2678 = _2676 + _2670;
        float _2680 = precise::clamp(_2678, 0.0, 1.0);
        float _2682 = -_2680;
        float _2684 = _2682 + _2532;
        float _2686 = fma(_2684, 500.0, 1.5);
        float _2688 = exp2(_2686);
        float _2690 = 0.0 + _2688;
        float _2692 = precise::clamp(_2690, 0.0, 1.0);
        _2618 = _2692;
        _2590 = _2644;
        _2247 = as_type<float>(_2636);
        _2445 = _2688;
        _2592 = 500.0;
    }
    float _2694 = _2618;
    float _2696 = _2590;
    float _2698 = _2247;
    float _2700 = _2445;
    float _2702 = _2592;
    float _2704 = _2632 * _2694;
    float _2706 = _2602 * _2499;
    float _2708 = -_2616;
    float _2710 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_105.x = _1767;
    out.m_105.y = _1765;
    out.m_105.z = _1769;
    bool _2712 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2714 = isnan(_1837);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2720 = _2716 || _2718;
    float _2722 = _2518 * _2706;
    float _2724 = -_2704;
    float _2726 = fma(_2724, _2710, 1.0);
    float _2728 = precise::clamp(_2726, 0.0, 1.0);
    float _2730 = -_2602;
    float _2732 = _2730 + 1.0;
    float _2734 = _2526 * _2706;
    float _2736 = fma(_2522, _2722, _2512);
    float _2738 = fma(_2524, _2722, _2514);
    float _2740 = _2518 * _2732;
    float _2742 = _2728 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2744 = fma(_2518, _2734, _2516);
    out.m_107.x = _2742;
    float _2746 = _2700;
    float _2748 = _2696;
    float _2750 = _2702;
    float _2752 = _2732;
    float _2754 = _2698;
    float _2756 = _2728;
    if (!_2720)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2758 = _2746;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2720)
    {
        _2748 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2748;
    out.m_109.x = _2736;
    out.m_109.y = _2738;
    out.m_109.z = _2744;
    out.m_109.w = _2740;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2720)
    {
        _2750 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2770 = _2750;
    float _2772 = _2770;
    float _2774 = _2770;
    if (!_2720)
    {
        _2752 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2776 = _2752;
    float _2778 = _2776;
    float _2780 = _2776;
    if (!_2720)
    {
        _2754 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2782 = _2754;
    float _2784 = _2782;
    float _2786 = _2782;
    if (!_2720)
    {
        _2756 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2788 = _2756;
    bool _2790 = !_2720;
    float _2792 = _2788;
    float _2794 = _2788;
    if (!_2790)
    {
        bool _2796 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2798 = isnan(_1837);
        bool _2800 = _2796 || _2798;
        bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2804 = _2800 || _2802;
        if (!_2804)
        {
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2808 = _1837 + _2806;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2812 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2810;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2818 = 1.0 / _2812;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2836 = _2808 * _2818;
            float _2838 = precise::clamp(_2836, 0.0, 1.0);
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2844 = fma(_2838, _2816, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2846 = fma(_2838, _2842, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2848 = fma(_2838, _2822, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2850 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2852 = fma(_2838, _2830, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2854 = fma(_2838, _2834, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2768 = _2844;
            _2786 = _2852;
            _2762 = _2848;
            _2780 = _2850;
            _2774 = _2846;
            _2794 = _2854;
            _2856 = true;
        }
        else
        {
            bool _2858 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2860 = isnan(_1837);
            bool _2862 = _2858 || _2860;
            bool _2864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2866 = _2862 || _2864;
            if (!_2866)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2868 = _2760;
            _2762 = _2868;
            if (!_2866)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2870 = _2766;
            _2768 = _2870;
            if (!_2866)
            {
                _2772 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2872 = _2772;
            _2774 = _2872;
            if (!_2866)
            {
                _2778 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2874 = _2778;
            _2780 = _2874;
            if (!_2866)
            {
                _2784 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2876 = _2784;
            _2786 = _2876;
            if (!_2866)
            {
                _2792 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2878 = _2792;
            bool _2880 = !_2866;
            _2794 = _2878;
            if (!_2880)
            {
                bool _2882 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2884 = isnan(_1837);
                bool _2886 = _2882 || _2884;
                bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2890 = _2886 || _2888;
                if (!_2890)
                {
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2894 = _1837 + _2892;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2898 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2896;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2904 = 1.0 / _2898;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2922 = _2894 * _2904;
                    float _2924 = precise::clamp(_2922, 0.0, 1.0);
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2930 = fma(_2924, _2902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2932 = fma(_2924, _2928, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2934 = fma(_2924, _2908, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2936 = fma(_2924, _2912, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2938 = fma(_2924, _2916, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2940 = fma(_2924, _2920, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2768 = _2930;
                    _2786 = _2938;
                    _2762 = _2934;
                    _2780 = _2936;
                    _2774 = _2932;
                    _2794 = _2940;
                    _2856 = true;
                }
                else
                {
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2786 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2780 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2774 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2794 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2856 = false;
    float _2942 = _2768;
    float _2944 = _2786;
    float _2946 = _2762;
    float _2948 = _2780;
    float _2950 = _2774;
    float _2952 = _2794;
    float _2954 = fma(_1667, -0.5, 0.5);
    float _2956 = precise::clamp(_2954, 0.0, 1.0);
    float _2958 = -_2942;
    float _2960 = _2958 + _2944;
    float _2962 = -_2946;
    float _2964 = _2962 + _2948;
    float _2966 = -_2950;
    float _2968 = _2966 + _2952;
    bool _2970 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2972 = fma(_2956, _2960, _2942);
    float _2974 = fma(_2956, _2964, _2946);
    float _2976 = fma(_2956, _2968, _2950);
    float _2978 = _2972 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2980 = fma(_2974, 0.298911988735198974609375, _2978);
    float _2982 = fma(_2976, 0.114477999508380889892578125, _2980);
    out.m_111.x = 0.0;
    float _2984 = -_2982;
    float _2986 = _2974 + _2984;
    float _2988 = -_2982;
    float _2990 = _2972 + _2988;
    float _2992 = -_2982;
    float _2994 = _2976 + _2992;
    float _2996 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2998 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3000 = fma(_2990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3002 = fma(_2994, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    out.m_107.w = _2996;
    out.m_113.x = _2998;
    out.m_113.y = _3000;
    out.m_113.z = _3002;
    if (!_2970)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3004 = -_1765;
    float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3008 = -_1767;
    float _3010 = _3008 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3012 = -_1769;
    float _3014 = _3012 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3016 = _3006 * _3006;
    float _3018 = fma(_3010, _3010, _3016);
    float _3020 = fma(_3014, _3014, _3018);
    float _3022 = sqrt(_3020);
    float _3024 = rsqrt(_3020);
    float _3026 = -_3022;
    float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3030 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3032 = precise::clamp(_3030, 0.0, 1.0);
    float _3034 = _3010 * _3024;
    float _3036 = _3006 * _3024;
    float _3038 = abs(_3032);
    float _3040 = log2(_3038);
    float _3042 = _3014 * _3024;
    float _3044 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3046 = _1667 * _3036;
    float _3048 = -_3036;
    float _3050 = -_3044;
    float _3052 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3050);
    float _3054 = fma(_1665, _3034, _3046);
    float _3056 = -_3042;
    float _3058 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3052);
    float _3060 = fma(_1669, _3042, _3054);
    float _3062 = precise::clamp(_3060, 0.0, 1.0);
    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3066 = _3058 + _3064;
    float _3068 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3070 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3072 = precise::clamp(_3070, 0.0, 1.0);
    float _3074 = exp2(_3068);
    float _3076 = _3074 * _3072;
    float _3078 = _3062 * _3076;
    float _3080 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3082 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3084 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _3080;
    out.m_111.y = _3082;
    out.m_111.z = _3084;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2856 = false;
    bool _1719 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_60.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_63.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3141 = as_type<float>(_148);
        out.gl_Position.z = _3141;
    }
    if (!_136)
    {
        return out;
    }
    float _152 = in.m_65.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = 0.0;
    float _170 = _166;
    if (_162)
    {
        float _172 = float(_132);
        _168 = _172;
    }
    float _174 = _168;
    bool _176 = _166 >= _174;
    bool _178 = !_162;
    bool _180 = _176 || _178;
    if (_180)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _142;
    if (_180)
    {
        out.m_63.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3210 = as_type<float>(_186);
        out.gl_Position.z = _3210;
    }
    if (_180)
    {
        return out;
    }
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _196 = in.m_69.x;
    float _198 = in.m_69.y;
    float _200 = in.m_69.z;
    bool _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _206 = _202 || _204;
    bool _208 = isnan(1.0);
    bool _210 = _206 || _208;
    float _212 = in.m_71.x;
    float _214 = in.m_71.y;
    float _216 = in.m_71.z;
    float _218 = in.m_65.x;
    float _220 = in.m_65.y;
    float _222 = in.m_65.z;
    float _224 = 0.0;
    float _226 = _194;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_210)
    {
        float _230 = _194 * _194;
        float _232 = _230 * 0.5;
        _224 = _232;
    }
    float _234 = _224;
    float _236 = _234;
    if (!_210)
    {
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _238;
    }
    float _240 = _236;
    float _242 = _188 * _188;
    float _244 = _190 * _190;
    float _246 = _192 * _192;
    float _248 = fma(_196, _196, _242);
    float _250 = fma(_198, _198, _244);
    float _252 = fma(_200, _200, _246);
    float _254 = fma(_212, _212, _248);
    float _256 = fma(_214, _214, _250);
    float _258 = fma(_216, _216, _252);
    float _260 = sqrt(_254);
    float _262 = sqrt(_256);
    bool _264 = _260 > 0.0;
    float _266 = sqrt(_258);
    bool _268 = _262 > 0.0;
    float _270 = _260;
    float _272 = _240;
    float _274 = _188;
    if (_264)
    {
        float _276 = rsqrt(_254);
        _270 = _276;
    }
    float _278 = _270;
    bool _280 = _266 > 0.0;
    float _282 = 0.0;
    float _284 = _266;
    if (_268)
    {
        float _286 = rsqrt(_256);
        _282 = _286;
    }
    float _288 = _282;
    bool _290 = !_210;
    float _292 = _278;
    if (!_290)
    {
        float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = log2(_294);
        float _298 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _300 = _298 + 1.0;
        float _302 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = _194 * _296;
        float _306 = 1.0 / _300;
        float _308 = _302 * 0.693147182464599609375;
        float _310 = exp2(_304);
        float _312 = 1.0 / _308;
        float _314 = _310 + (-1.0);
        float _316 = -_314;
        float _318 = fma(_316, _312, _194);
        float _320 = _318 * _306;
        float _322 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = _322;
        _284 = _320;
    }
    float _324 = _272;
    float _326 = _284;
    bool _328 = !_210;
    float _330 = _326;
    if (!_328)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = 1.0 / _338;
        float _342 = _194 * _334;
        float _344 = exp2(_342);
        float _346 = -_344;
        float _348 = _346 + 1.0;
        float _350 = _348 * _340;
        _226 = _350;
        _228 = _338;
    }
    float _352 = _226;
    float _354 = _228;
    float _356 = in.m_73.w;
    float _358 = _354;
    if (!_264)
    {
        _330 = 0.0;
    }
    float _360 = _330;
    float _362 = _360;
    if (_264)
    {
        float _364 = _278 * _196;
        _362 = _364;
    }
    float _366 = _362;
    if (!_264)
    {
        _358 = 0.0;
    }
    float _368 = _358;
    float _370 = in.m_60.x;
    float _372 = in.m_60.y;
    float _374 = in.m_60.z;
    float _376 = 0.0;
    float _378 = _368;
    if (!_264)
    {
        _376 = 0.0;
    }
    float _380 = _376;
    float _382 = _380;
    if (_264)
    {
        float _384 = _278 * _188;
        _378 = _384;
    }
    float _386 = _378;
    if (_264)
    {
        float _388 = _278 * _212;
        _382 = _388;
    }
    float _390 = _382;
    float _392 = _258;
    if (_280)
    {
        float _394 = rsqrt(_258);
        _392 = _394;
    }
    float _396 = _392;
    bool _398 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _400 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _402 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _404 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _406 = 0.0;
    float _408 = _402;
    if (!_268)
    {
        _406 = 0.0;
    }
    float _410 = _406;
    float _412 = fma(_352, _218, _400);
    float _414 = fma(_352, _220, _402);
    float _416 = fma(_352, _222, _404);
    float _418 = 0.0;
    float _420 = _410;
    if (!_280)
    {
        _408 = 0.0;
        _418 = 0.0;
    }
    float _422 = _408;
    float _424 = _418;
    float _426 = 0.0;
    float _428 = _424;
    float _430 = _422;
    if (!_268)
    {
        _426 = 0.0;
    }
    float _432 = _426;
    float _434 = _432;
    if (_268)
    {
        float _436 = _288 * _198;
        _420 = _436;
    }
    float _438 = _420;
    if (!_268)
    {
        _292 = 0.0;
    }
    float _440 = _292;
    float _442 = _440;
    if (_268)
    {
        float _444 = _288 * _190;
        _434 = _444;
    }
    float _446 = _434;
    float _448 = 0.0;
    if (!_280)
    {
        _448 = 0.0;
    }
    float _450 = _448;
    float _452 = _450;
    if (_268)
    {
        float _454 = _288 * _214;
        _442 = _454;
    }
    float _456 = _442;
    float _458 = _456;
    if (_280)
    {
        float _460 = _396 * _200;
        _452 = _460;
    }
    float _462 = _452;
    if (_280)
    {
        float _464 = _396 * _192;
        _428 = _464;
    }
    float _466 = _428;
    if (_280)
    {
        float _468 = _396 * _216;
        _430 = _468;
    }
    float _470 = _430;
    float _472 = fma(_412, _356, _370);
    float _474 = fma(_414, _356, _372);
    float _476 = fma(_416, _356, _374);
    bool _478 = !_398;
    float _496;
    if (!_478)
    {
        float _480 = in.m_75.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_132);
        float _502 = 1.0 / _500;
        float _504 = _166 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = in.m_75.z;
    float _510 = _474 * _198;
    float _512 = in.m_75.x;
    float _514 = _474 * _214;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _516;
    float _520 = fma(_472, _196, _510);
    float _522 = in.m_75.y;
    float _524 = 1.0 / _518;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _530;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _544 = _542 != 0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _548 = _506 + _546;
    float _550 = fma(_472, _212, _514);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _554 = _506 + _552;
    float _556 = 1.0 / _528;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _560 = _506 + _558;
    float _562 = fma(_476, _216, _550);
    float _564 = _474 * _190;
    float _566 = _508 * 2.0;
    bool _568 = !_540;
    int _570 = _568 ? 0 : 1;
    float _572 = 1.0 / _532;
    float _574 = _560 * _524;
    float _576 = _512 * 2.0;
    float _578 = _512 + _508;
    int _580 = abs(_570);
    float _582 = fma(_472, _188, _564);
    float _584 = _522 * 2.0;
    float _586 = _578 + (-1.0);
    float _588 = floor(_566);
    float _590 = _548 * _556;
    float _592 = _522 + _508;
    float _594 = _512 + _522;
    float _596 = fma(_476, _192, _582);
    float _598 = _592 + (-1.0);
    float _600 = _594 + (-1.0);
    float _602 = floor(_584);
    float _604 = _554 * _572;
    float _606 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _608;
    float _612 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _614 = _588 > 0.0;
    float _616 = fma(_610, _574, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _618 = _588 >= 0.0;
    bool _620 = isnan(_588);
    bool _622 = _618 || _620;
    bool _624 = isnan(0.0);
    bool _626 = _622 || _624;
    float _628 = floor(_576);
    int _630 = _626 ? 0 : 1;
    bool _632 = _602 >= 0.0;
    bool _634 = isnan(_602);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    int _642 = ~_630;
    int _644 = _642 + 1;
    int _646 = _644 + 1;
    float _648 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _650 = _646;
    int _652 = as_type<int>(_512);
    if (!_614)
    {
        int _654 = ~_630;
        int _656 = _654 + 1;
        _650 = _656;
    }
    int _658 = _650;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _660;
    bool _664 = _628 > 0.0;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _666;
    bool _670 = _628 >= 0.0;
    bool _672 = isnan(_628);
    bool _674 = _670 || _672;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    float _680 = fma(_662, _574, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _682 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _684 = log2(_682);
    bool _686 = !_536;
    int _688 = _686 ? 0 : 1;
    float _690 = fma(_668, _574, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _692 = _602 > 0.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _698 = abs(_688);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _708 = _678 ? 0 : 1;
    float _710 = fma(_702, _590, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _712 = fma(_706, _590, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _714 = fma(_696, _590, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _716 = _684 * _166;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _720 = 1.0 + _718;
    bool _722 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(1.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = float(_698);
    float _734 = 1.0 / _720;
    float _736 = float(_658);
    int _738 = ~_708;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    int _744 = _742;
    if (!_664)
    {
        int _746 = ~_708;
        int _748 = _746 + 1;
        _744 = _748;
    }
    int _750 = _744;
    float _752 = _732 * _736;
    bool _754 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _756 = isnan(0.0);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _762 = _758 || _760;
    float _764 = exp2(_716);
    float _766 = in.m_77.x;
    float _768 = in.m_77.y;
    float _770 = in.m_77.z;
    float _772 = _752 * (-2.0);
    float _774 = float(_580);
    float _776 = float(_750);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _782;
    float _786 = _774 * _776;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _788;
    bool _792 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _794 = isnan(_506);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = fma(_780, _604, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _806 = _786 * (-2.0);
    float _808 = -_764;
    float _810 = _808 + 1.0;
    float _812 = fma(_784, _604, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _814 = fma(_790, _604, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _816 = -_802;
    float _818 = _816 + 1.0;
    float _820 = fma(_612, _806, _612);
    float _822 = _762 ? _810 : 0.0;
    int _824 = _640 ? 0 : 1;
    float _826 = fma(_806, _768, _768);
    if (_730)
    {
        float _828 = _822 * _734;
        _170 = _828;
    }
    float _830 = _170;
    float _832 = fma(_606, _772, _606);
    float _834 = fma(_772, _766, _766);
    bool _836 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _838 = isnan(_506);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _512 + (-0.5);
    bool _850 = !_544;
    int _852 = _850 ? 0 : 1;
    int _854 = ~_824;
    int _856 = _854 + 1;
    int _858 = _856 + 1;
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].x, _834);
    bool _862 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _864 = isnan(_506);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = _846 * _818;
    float _876 = -_846;
    float _878 = _876 + 1.0;
    int _880 = abs(_852);
    float _882 = _522 + (-0.5);
    int _884 = _858;
    if (!_692)
    {
        int _886 = ~_824;
        int _888 = _886 + 1;
        _884 = _888;
    }
    int _890 = _884;
    float _892 = _872 * _878;
    float _894 = -_872;
    float _896 = _894 + 1.0;
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _826);
    bool _900 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _902 = isnan(_506);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = fma(_832, _830, _860);
    float _914 = float(_880);
    float _916 = fma(_820, _830, _898);
    float _918 = float(_890);
    float _920 = _910 * _896;
    float _922 = _912 * 0.15915493667125701904296875;
    float _924 = _916 * 0.15915493667125701904296875;
    float _926 = _914 * _918;
    float _928 = _680 * _920;
    float _930 = _690 * _920;
    float _932 = _616 * _920;
    float _934 = -_910;
    float _936 = _934 + 1.0;
    float _938 = _926 * (-2.0);
    float _940 = in.m_73.x;
    float _942 = in.m_73.y;
    float _944 = in.m_73.z;
    float _946 = _922 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[143].x, _928);
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[143].y, _930);
    float _954 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[143].z, _932);
    float _956 = fma(_938, _770, _770);
    float _958 = _508 + (-0.5);
    float _960 = in.m_79.x;
    float _962 = in.m_79.y;
    float _964 = in.m_79.z;
    float _966 = fma(_648, _938, _648);
    float _968 = fma(_714, _892, _954);
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].z, _956);
    float _972 = fma(_712, _892, _950);
    float _974 = fma(_710, _892, _952);
    float _976 = fma(_814, _874, _968);
    float _978 = fma(_966, _830, _970);
    float _980 = fma(_804, _874, _972);
    float _982 = fma(_812, _874, _974);
    float _984 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[146].z, _976);
    float _986 = _978 * 0.15915493667125701904296875;
    float _988 = _922 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[146].x, _980);
    float _994 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[146].y, _982);
    float _996 = fma(_476, _200, _520);
    float _998 = _984 * _944;
    float _1000 = _994 * _942;
    float _1002 = _992 * _940;
    float _1004 = _924 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = in.m_71.w;
    float _1010 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _962);
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _960);
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _964);
    float _1020 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1022 = _924 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    float _1026 = _1016 * _1012;
    float _1028 = _1014 * _1010;
    float _1030 = _1018 * _1020;
    float _1032 = in.m_69.w;
    float _1034 = _986 * 6.283185482025146484375;
    float _1036 = cos(_1034);
    float _1038 = _948 * _1006;
    float _1040 = _990 * _1006;
    float _1042 = _986 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    float _1046 = _990 * _1024;
    float _1048 = _948 * _1024;
    float _1050 = _562 + _1008;
    float _1052 = _990 * _1036;
    float _1054 = _948 * _1036;
    float _1056 = _1024 * _1036;
    float _1058 = _1006 * _1036;
    float _1060 = _1052 * _1028;
    float _1062 = _1054 * _1028;
    float _1064 = _996 + _1032;
    float _1066 = fma(_1044, _1046, _1038);
    float _1068 = -_1028;
    float _1070 = _1044 * _1068;
    float _1072 = -_1048;
    float _1074 = fma(_1044, _1040, _1072);
    float _1076 = -_1040;
    float _1078 = fma(_1044, _1048, _1076);
    float _1080 = fma(_1066, _1026, _1060);
    float _1082 = fma(_1056, _1026, _1070);
    float _1084 = fma(_1044, _1038, _1046);
    float _1086 = fma(_1078, _1026, _1062);
    float _1088 = fma(_1074, _1030, _1080);
    float _1090 = fma(_1058, _1030, _1082);
    float _1092 = in.m_67.w;
    float _1094 = fma(_1084, _1030, _1086);
    float _1096 = _1088 * _438;
    float _1098 = _1088 * _456;
    float _1100 = _1088 * _446;
    float _1102 = fma(_1090, _366, _1096);
    float _1104 = fma(_1090, _390, _1098);
    float _1106 = fma(_1090, _386, _1100);
    float _1108 = fma(_1094, _462, _1102);
    float _1110 = fma(_1094, _470, _1104);
    float _1112 = fma(_1094, _466, _1106);
    float _1114 = _1064 + _1108;
    float _1116 = _1050 + _1110;
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1120 = _1114 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1124 = _1116 + _1122;
    float _1126 = _1120 * _1120;
    float _1128 = _1124 * _1124;
    float _1130 = _596 + _1092;
    float _1132 = _1126 + _1128;
    float _1134 = _1130 + _1112;
    float _1136 = sqrt(_1132);
    bool _1138 = _1136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = _1136 + _1140;
    float _1144 = _952;
    float _1146 = _1112;
    float _1148 = _1114;
    float _1150 = _1116;
    float _1152 = _1126;
    float _1154 = _1134;
    float _1156 = _1128;
    float _1158 = _1074;
    float _1160 = _1058;
    if (_1138)
    {
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1162;
    }
    float _1164 = _1144;
    if (_1138)
    {
        float _1166 = _1134 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1146 = _1166;
    }
    float _1168 = _1146;
    float _1170 = _1168;
    if (_1138)
    {
        float _1172 = rsqrt(_1132);
        _274 = _1172;
    }
    float _1174 = _274;
    float _1176 = _1164;
    float _1178 = _1174;
    if (_1138)
    {
        float _1180 = _1142 * _1164;
        _1176 = _1180;
    }
    float _1182 = _1176;
    float _1184 = _1182;
    if (_1138)
    {
        float _1186 = _1182 * 0.15915493667125701904296875;
        _1184 = _1186;
    }
    float _1188 = _1184;
    float _1190 = _1088;
    if (_1138)
    {
        float _1192 = _1188 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        _1190 = _1194;
    }
    float _1196 = _1190;
    if (_1138)
    {
        float _1198 = fma(_1196, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1170 = _1198;
    }
    float _1200 = _1170;
    if (_1138)
    {
        float _1202 = _1174 * _1200;
        _1178 = _1202;
    }
    float _1204 = _1178;
    if (_1138)
    {
        float _1206 = fma(_1120, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1148 = _1206;
    }
    float _1208 = _1148;
    if (_1138)
    {
        float _1210 = fma(_1124, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1150 = _1210;
    }
    float _1212 = _1150;
    float _1214 = fma(_1208, 6.2500002968590706586837768554688e-05, 0.5);
    float _1216 = fma(_1212, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4721 = float2(_1214, _1216);
    float3 _1220 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4721, float2(0.0), isnan(_4721)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4721, float2(0.0), isnan(_4721)), level(0.0)).xyz;
    float _1222 = _1220.x;
    float _1224 = _1220.y;
    float _1226 = _1220.z;
    float _1228 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1230 = in.m_81.y;
    float _1232 = _1228 * _512;
    float _1234 = in.m_75.w;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1242 = _1240 != 0;
    float _1244 = in.m_81.x;
    float _1246 = trunc(_1232);
    int _1248 = int(_1246);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1256 = _1254 != 0;
    bool _1258 = _522 > 0.5;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1260 = -_1230;
    float _1262 = _1260 + 1.0;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1266 = _1248 << 4;
    int _1268 = _1266 + 1968;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1274 = _1234 > 0.5;
    uint _1277 = uint(int(uint(_1268) >> uint(2)));
    uint _1279 = uint(int(uint(int(_1277)) >> uint(2)));
    int _1281 = int(_1277) & 3;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[int(_1279)][_1281];
    int _1285 = int(_1277) + 1;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    int _1289 = _1285 & 3;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[int(_1287)][_1289];
    float _1293 = in.m_85.x;
    float _1295 = in.m_85.y;
    float _1297 = in.m_85.z;
    float _1299 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1301 = _1274 ? as_type<int>(_1262) : as_type<int>(_1230);
    float _1303 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1305 = _962 != 0.0;
    bool _1307 = isnan(_962);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(0.0);
    bool _1313 = _1309 || _1311;
    int _1315 = 0;
    float _1317 = _1230;
    bool _1319 = _1256;
    float _1321 = 1.0;
    bool _1323 = _1258;
    float _1325 = _1272;
    float _1327 = _1212;
    if (_1252)
    {
        float _1329 = -_1244;
        float _1331 = _1329 + 1.0;
        _1315 = as_type<int>(_1331);
    }
    int _1333 = _1315;
    float _1335 = _1256 ? as_type<float>(_1301) : _1230;
    int _1337 = _1268 + 8;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    uint _1341 = uint(int(uint(int(_1339)) >> uint(2)));
    int _1343 = int(_1339) & 3;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[int(_1341)][_1343];
    bool _1347 = _960 == 0.0;
    bool _1349 = !_1313;
    bool _1351 = _1347 && _1349;
    if (_1238)
    {
        float _1353 = _1258 ? _1262 : _1230;
        _1317 = _1353;
    }
    float _1355 = _1317;
    bool _1357 = _964 == 0.0;
    bool _1359 = _1357 && _1351;
    float _1361 = in.m_87.x;
    float _1363 = in.m_87.y;
    float _1365 = in.m_87.z;
    float _1367 = in.m_87.w;
    if (_1242)
    {
        bool _1369 = _512 > 0.5;
        _1319 = _1369;
    }
    bool _1371 = _1319;
    if (_1242)
    {
        float _1373 = -_1244;
        float _1375 = _1373 + 1.0;
        _652 = as_type<int>(_1375);
    }
    int _1377 = _652;
    float _1379 = as_type<float>(_1377);
    if (!_1242)
    {
        _1321 = _1244;
    }
    float _1381 = _1321;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1385 = _1381;
    if (_1252)
    {
        bool _1387 = _508 > 0.5;
        _1323 = _1387;
    }
    bool _1389 = _1323;
    if (_1242)
    {
        float _1391 = _1371 ? as_type<float>(_1377) : _1244;
        _1385 = _1391;
    }
    float _1393 = _1385;
    float _1395 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1397 = 0.0;
    float _1399 = _1293;
    if (_1359)
    {
        _1397 = _1293;
    }
    float _1401 = _1397;
    out.m_89.x = _1299;
    out.m_89.y = _1395;
    out.m_89.z = _1303;
    out.m_89.w = _1272;
    float _1403 = _1401;
    if (_1359)
    {
        _1379 = _1401;
    }
    float _1405 = _1379;
    float _1407 = _1405;
    if (!_1359)
    {
        _1403 = _1293;
    }
    float _1409 = _1403;
    if (!_1252)
    {
        _1399 = _1244;
    }
    float _1411 = _1399;
    float _1413 = _1411;
    if (_1252)
    {
        float _1415 = _1389 ? as_type<float>(_1333) : _1244;
        _1413 = _1415;
    }
    float _1417 = _1413;
    if (!_1359)
    {
        float _1419 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1409);
        _1407 = _1419;
    }
    float _1421 = _1407;
    float _1423 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1359)
    {
        _1325 = _1295;
    }
    float _1425 = _1325;
    float _1427 = _1425;
    if (!_1359)
    {
        float _1429 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1295);
        _1427 = _1429;
    }
    float _1431 = _1427;
    float _1433 = _1363 * _1297;
    float _1435 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1437 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1439 = -_1431;
    float _1441 = _1044 * _1439;
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1365 * _1409;
    float _1447 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1449 = _1437;
    if (_1359)
    {
        _1449 = _1297;
    }
    float _1451 = _1449;
    float _1453 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1455 = _1451;
    if (!_1359)
    {
        float _1457 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1297);
        _1455 = _1457;
    }
    float _1459 = _1455;
    float _1461 = _1361 * _1295;
    float _1463 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = -_1445;
    float _1467 = fma(_1361, _1297, _1465);
    float _1469 = -_1433;
    float _1471 = fma(_1365, _1295, _1469);
    float _1473 = -_1461;
    float _1475 = fma(_1363, _1409, _1473);
    float _1477 = -_1363;
    float _1479 = _1044 * _1477;
    float _1481 = _1467 * _1367;
    out.m_91.x = _1447;
    out.m_91.y = _1443;
    out.m_91.z = _1463;
    float _1483 = _1471 * _1367;
    float _1485 = _1475 * _1367;
    float _1487 = _1052 * _1363;
    float _1489 = _1054 * _1363;
    float _1491 = fma(_1056, _1361, _1479);
    float _1493 = fma(_1066, _1361, _1487);
    float _1495 = fma(_1078, _1361, _1489);
    float _1497 = fma(_1058, _1365, _1491);
    float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1501 = -_1481;
    float _1503 = _1044 * _1501;
    float _1505 = _1052 * _1431;
    float _1507 = _1054 * _1431;
    float _1509 = _1052 * _1481;
    float _1511 = _1054 * _1481;
    float _1513 = fma(_1056, _1421, _1441);
    float _1515 = fma(_1066, _1421, _1505);
    float _1517 = fma(_1078, _1421, _1507);
    float _1519 = fma(_1078, _1483, _1511);
    float _1521 = fma(_1066, _1483, _1509);
    float _1523 = _1511;
    if (_1138)
    {
        float _1525 = _1188 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        _1523 = _1527;
    }
    float _1529 = _1523;
    float _1531 = fma(_1074, _1459, _1515);
    float _1533 = fma(_1058, _1459, _1513);
    float _1535 = fma(_1084, _1459, _1517);
    float _1537 = fma(_1074, _1365, _1493);
    float _1539 = fma(_1074, _1485, _1521);
    float _1541 = fma(_1056, _1483, _1503);
    float _1543 = fma(_1084, _1365, _1495);
    float _1545 = _1531 * _438;
    float _1547 = _1531 * _456;
    float _1549 = _1537 * _456;
    float _1551 = _1539 * _456;
    float _1553 = fma(_1058, _1485, _1541);
    float _1555 = fma(_1084, _1485, _1519);
    float _1557 = _1537 * _438;
    float _1559 = _1539 * _438;
    float _1561 = _1537;
    float _1563 = _1545;
    if (_1138)
    {
        float _1565 = _1529 + (-1.0);
        _458 = _1565;
    }
    float _1567 = _458;
    float _1569 = fma(_1533, _366, _1545);
    float _1571 = _1537 * _446;
    if (_1138)
    {
        float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1575 = _1208 + _1573;
        _1561 = _1575;
    }
    float _1577 = _1561;
    if (_1138)
    {
        float _1579 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1579;
    }
    float _1581 = _1563;
    float _1583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1585 = _1531 * _446;
    float _1587 = _1581;
    if (_1138)
    {
        float _1589 = _1577 * _1577;
        _1152 = _1589;
    }
    float _1591 = _1152;
    if (_1138)
    {
        float _1593 = fma(_1134, _1529, _1581);
        _1154 = _1593;
    }
    float _1595 = _1154;
    if (_1138)
    {
        float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1599 = _1212 + _1597;
        _1587 = _1599;
    }
    float _1601 = _1587;
    float _1603 = _1539 * _446;
    float _1605 = fma(_1533, _386, _1585);
    float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1609 = _1595 + _1607;
    float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1138)
    {
        float _1613 = _1601 * _1601;
        _1156 = _1613;
    }
    float _1615 = _1156;
    float _1617 = fma(_1533, _390, _1547);
    float _1619 = fma(_1609, _1609, _1591);
    float _1621 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1623 = fma(_1497, _366, _1557);
    float _1625 = fma(_1497, _386, _1571);
    float _1627 = _1619 + _1615;
    float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1631 = fma(_1553, _366, _1559);
    float _1633 = fma(_1553, _386, _1603);
    float _1635 = fma(_1497, _390, _1549);
    float _1637 = fma(_1553, _390, _1551);
    float _1639 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1641 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1643 = _1621 * _1583;
    float _1645 = sqrt(_1627);
    float _1647 = _1423 * _1499;
    float _1649 = fma(_1543, _462, _1623);
    float _1651 = fma(_1543, _466, _1625);
    float _1653 = fma(_1555, _462, _1631);
    float _1655 = fma(_1555, _466, _1633);
    float _1657 = _1639 * _1611;
    float _1659 = fma(_1543, _470, _1635);
    float _1661 = fma(_1555, _470, _1637);
    float _1663 = _1641 * _1629;
    float _1665 = fma(_1535, _462, _1569);
    float _1667 = fma(_1535, _466, _1605);
    float _1669 = fma(_1535, _470, _1617);
    out.m_93.x = _1649;
    out.m_93.y = _1651;
    out.m_93.z = _1659;
    bool _1671 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1673 = isnan(_1645);
    bool _1675 = _1671 || _1673;
    bool _1677 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1679 = _1675 || _1677;
    out.m_95.x = _1663;
    out.m_95.y = _1643;
    out.m_95.z = _1647;
    out.m_95.w = _1657;
    out.m_97.x = _1653;
    out.m_97.y = _1655;
    out.m_97.z = _1661;
    out.m_99.x = _1665;
    out.m_99.y = _1667;
    out.m_99.z = _1669;
    float _1681 = _1641;
    float _1683 = _1637;
    if (!_1679)
    {
        _1681 = 1.0;
    }
    float _1685 = _1681;
    out.m_101.x = _1222;
    out.m_101.y = _1224;
    out.m_101.z = _1226;
    bool _1687 = !_1679;
    float _1689 = _1685;
    if (!_1687)
    {
        bool _1691 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1693 = isnan(_1645);
        bool _1695 = _1691 || _1693;
        bool _1697 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1699 = _1695 || _1697;
        if (!_1699)
        {
            float _1701 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1703 = _1645 + _1701;
            float _1705 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1707 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1705;
            float _1709 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1713 = 1.0 / _1707;
            float _1715 = _1703 * _1713;
            float _1717 = fma(_1715, _1711, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1689 = _1717;
            _1719 = true;
        }
        else
        {
            bool _1721 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1723 = isnan(_1645);
            bool _1725 = _1721 || _1723;
            bool _1727 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1729 = _1725 || _1727;
            if (!_1729)
            {
                float _1731 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1733 = _1645 + _1731;
                float _1735 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1737 = _1735 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1741 = _1739 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1743 = 1.0 / _1737;
                float _1745 = _1733 * _1743;
                float _1747 = fma(_1745, _1741, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1689 = _1747;
                _1719 = true;
            }
            else
            {
                _1689 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1719 = false;
    float _1749 = _1689;
    float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1753 = _1595 + _1751;
    float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1757 = _1208 + _1755;
    float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1761 = _1212 + _1759;
    float _1763 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1765 = fma(_1753, _1749, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1767 = fma(_1757, _1749, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1769 = fma(_1761, _1749, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1771 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1763);
    float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1775 = _1765 + _1773;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1779 = _1767 + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1783 = _1769 + _1781;
    float _1785 = _1775 * _1775;
    float _1787 = fma(_1779, _1779, _1785);
    float _1789 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1791 = fma(_1783, _1783, _1787);
    float _1793 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1771);
    float _1795 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1797 = floor(_1789);
    float _1799 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1801 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1803 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1795);
    float _1805 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1803);
    float _1807 = rsqrt(_1791);
    float _1809 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1811 = _1809 + _1801;
    float _1813 = 1.0 / _1801;
    float _1815 = -_1797;
    float _1817 = _1789 + _1815;
    float _1819 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1821 = floor(_1799);
    float _1823 = _1779 * _1819;
    float _1825 = _1783 * _1819;
    float _1827 = _1823 * _1823;
    float _1829 = _1825 * _1825;
    float _1831 = _1811 * _1813;
    float _1833 = _1831 * 0.5;
    float _1835 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1837 = sqrt(_1791);
    float _1839 = _1827 + _1829;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1843 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1841);
    float _1845 = _1130 + _1835;
    float _1847 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1849 = sqrt(_1839);
    float _1851 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1853 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1847);
    float _1855 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1851);
    float _1857 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1853);
    float _1859 = 1.0 / _1843;
    float _1861 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1855);
    float _1863 = _1857 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1865 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1867 = _1849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1869 = trunc(_1863);
    int _1871 = int(_1869);
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1875 = _1859 * _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = _1849 + _1877;
    float _1881 = trunc(_1865);
    int _1883 = int(_1881);
    bool _1885 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1887 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1889 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1891 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1893 = _1871 + _1891;
    int _1895 = _1893 + 1;
    float _1897 = _1813;
    int _1899 = 2;
    float _1901 = _1839;
    float _1903 = _1819;
    float _1905 = _1879;
    float _1907 = _1797;
    float _1909 = _1823;
    float _1911 = _1827;
    int _1913 = as_type<int>(_1865);
    if (_1867)
    {
        float _1915 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1897 = _1915;
    }
    float _1917 = _1897;
    float _1919 = precise::max(0.0, _1889);
    if (!_1885)
    {
        _1899 = 1;
    }
    int _1921 = _1899;
    float _1923 = -_1819;
    float _1925 = -_1919;
    float _1927 = fma(_1775, _1923, _1925);
    int _1929 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1931 = _1883 + _1929;
    int _1933 = _1931 + 1;
    int _1935 = _1921;
    if (_1867)
    {
        float _1937 = rsqrt(_1839);
        _1901 = _1937;
    }
    float _1939 = _1901;
    float _1941 = _1939;
    if (_1867)
    {
        float _1943 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _1943;
    }
    float _1945 = _1903;
    int _1947 = _1895 | _1933;
    float _1949 = as_type<float>(_1947);
    if (_1867)
    {
        float _1951 = _1879 * _1917;
        _1905 = _1951;
    }
    float _1953 = _1905;
    if (!_1867)
    {
        _1907 = _1927;
    }
    float _1955 = _1907;
    float _1957 = _1955;
    if (_1867)
    {
        float _1959 = _1953 * 0.15915493667125701904296875;
        _1327 = _1959;
    }
    float _1961 = _1327;
    bool _1963 = !_1885;
    int _1965 = _1963 ? 0 : 1;
    float _1967 = _1857;
    if (_1867)
    {
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        _1967 = _1971;
    }
    float _1973 = _1967;
    if (!_1887)
    {
        _1935 = _1965;
    }
    int _1975 = _1935;
    bool _1977 = _1895 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1979 = _1975 << 6;
    bool _1981 = _1947 < 0;
    bool _1983 = _1981 || _1977;
    float _1985 = _1961;
    float _1987 = as_type<float>(_1975);
    if (_1867)
    {
        float _1989 = _1961 * 6.283185482025146484375;
        float _1991 = cos(_1989);
        _1985 = _1991;
    }
    float _1993 = _1985;
    int _1995 = _1979 + 96;
    uint _1997 = uint(int(uint(_1995) >> uint(2)));
    uint _1999 = uint(int(uint(int(_1997)) >> uint(2)));
    int _2001 = int(_1997) & 3;
    float _2003 = (*spvDescriptorSet0.vp_c15)._m0[int(_1999)][_2001];
    int _2005 = int(_1997) + 1;
    uint _2007 = uint(int(uint(_2005) >> uint(2)));
    int _2009 = _2005 & 3;
    float _2011 = (*spvDescriptorSet0.vp_c15)._m0[int(_2007)][_2009];
    bool _2013 = _1933 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2015 = _2013 || _1983;
    if (_1867)
    {
        float _2017 = fma(_1973, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1949 = _2017;
    }
    float _2019 = _1949;
    int _2021 = _1979 + 48;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    uint _2025 = uint(int(uint(int(_2023)) >> uint(2)));
    int _2027 = int(_2023) & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    int _2031 = int(_2023) + 1;
    uint _2033 = uint(int(uint(_2031) >> uint(2)));
    int _2035 = _2031 & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    float _2039 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1867)
    {
        float _2041 = _1939 * _2019;
        _1158 = _2041;
    }
    float _2043 = _1158;
    float _2045 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2039);
    float _2047 = _1993;
    if (_1867)
    {
        float _2049 = _1993 + (-1.0);
        _1941 = _2049;
    }
    float _2051 = _1941;
    int _2053 = _1979 + 64;
    uint _2055 = uint(int(uint(_2053) >> uint(2)));
    uint _2057 = uint(int(uint(int(_2055)) >> uint(2)));
    int _2059 = int(_2055) & 3;
    float _2061 = (*spvDescriptorSet0.vp_c15)._m0[int(_2057)][_2059];
    int _2063 = int(_2055) + 1;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    int _2067 = _2063 & 3;
    float _2069 = (*spvDescriptorSet0.vp_c15)._m0[int(_2065)][_2067];
    float _2071 = _2051;
    if (_1867)
    {
        float _2073 = _1823 * _2043;
        _1909 = _2073;
    }
    float _2075 = _1909;
    float _2077 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2045);
    if (_1867)
    {
        float _2079 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1160 = _2079;
    }
    float _2081 = _1160;
    if (!_1867)
    {
        _2071 = _1825;
    }
    float _2083 = _2071;
    float _2085 = _2083;
    if (_1867)
    {
        float _2087 = _1825 * _2043;
        _2085 = _2087;
    }
    float _2089 = _2085;
    if (_1867)
    {
        float _2091 = _2075 * _2075;
        _1911 = _2091;
    }
    float _2093 = _1911;
    if (_1867)
    {
        float _2095 = fma(_1927, _1993, _2081);
        _1957 = _2095;
    }
    float _2097 = _1957;
    int _2099 = _1979 + 104;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    uint _2103 = uint(int(uint(int(_2101)) >> uint(2)));
    int _2105 = int(_2101) & 3;
    float _2107 = (*spvDescriptorSet0.vp_c15)._m0[int(_2103)][_2105];
    int _2109 = int(_2101) + 1;
    uint _2111 = uint(int(uint(_2109) >> uint(2)));
    int _2113 = _2109 & 3;
    float _2115 = (*spvDescriptorSet0.vp_c15)._m0[int(_2111)][_2113];
    float _2117 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1867)
    {
        _2047 = _1829;
    }
    float _2119 = _2047;
    float _2121 = _2119;
    if (_1867)
    {
        float _2123 = _2089 * _2089;
        _2121 = _2123;
    }
    float _2125 = _2121;
    float _2127 = fma(_2097, _2097, _2093);
    if (!_2015)
    {
        float _2129 = floor(_1865);
        _1683 = _2129;
    }
    float _2131 = _1683;
    float _2133 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2135 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2137 = _1979 + 80;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    uint _2141 = uint(int(uint(int(_2139)) >> uint(2)));
    int _2143 = int(_2139) & 3;
    float _2145 = (*spvDescriptorSet0.vp_c15)._m0[int(_2141)][_2143];
    int _2147 = int(_2139) + 1;
    uint _2149 = uint(int(uint(_2147) >> uint(2)));
    int _2151 = _2147 & 3;
    float _2153 = (*spvDescriptorSet0.vp_c15)._m0[int(_2149)][_2151];
    float _2155 = -_1821;
    float _2157 = _1799 + _2155;
    float _2159 = _2127 + _2125;
    float _2161 = -_2135;
    float _2163 = fma(_2161, _2133, 1.0);
    int _2165 = as_type<int>(_2135);
    if (!_2015)
    {
        int _2167 = _1933 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2169 = _2167 + _1895;
        _2165 = _2169;
    }
    int _2171 = _2165;
    int _2173 = _1979 + 56;
    uint _2175 = uint(int(uint(_2173) >> uint(2)));
    uint _2177 = uint(int(uint(int(_2175)) >> uint(2)));
    int _2179 = int(_2175) & 3;
    float _2181 = (*spvDescriptorSet0.vp_c15)._m0[int(_2177)][_2179];
    int _2183 = int(_2175) + 1;
    uint _2185 = uint(int(uint(_2183) >> uint(2)));
    int _2187 = _2183 & 3;
    float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
    float _2191 = log2(_2163);
    int _2193 = _1979 + 88;
    uint _2195 = uint(int(uint(_2193) >> uint(2)));
    uint _2197 = uint(int(uint(int(_2195)) >> uint(2)));
    int _2199 = int(_2195) & 3;
    float _2201 = (*spvDescriptorSet0.vp_c15)._m0[int(_2197)][_2199];
    int _2203 = int(_2195) + 1;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    int _2207 = _2203 & 3;
    float _2209 = (*spvDescriptorSet0.vp_c15)._m0[int(_2205)][_2207];
    float _2211 = _1845 * _2011;
    float _2213 = fma(_1064, _2003, _2211);
    int _2215 = _1979 + 72;
    uint _2217 = uint(int(uint(_2215) >> uint(2)));
    uint _2219 = uint(int(uint(int(_2217)) >> uint(2)));
    int _2221 = int(_2217) & 3;
    float _2223 = (*spvDescriptorSet0.vp_c15)._m0[int(_2219)][_2221];
    int _2225 = int(_2217) + 1;
    uint _2227 = uint(int(uint(_2225) >> uint(2)));
    int _2229 = _2225 & 3;
    float _2231 = (*spvDescriptorSet0.vp_c15)._m0[int(_2227)][_2229];
    float _2233 = _1845 * _2037;
    float _2235 = _2191 * 0.693147182464599609375;
    float _2237 = rsqrt(_2159);
    float _2239 = fma(_1064, _2029, _2233);
    float _2241 = _1845 * _2069;
    float _2243 = _2069;
    int _2245 = as_type<int>(_2003);
    float _2247 = as_type<float>(_2171);
    if (!_2015)
    {
        float _2249 = -_2131;
        float _2251 = _1865 + _2249;
        _2243 = _2251;
    }
    float _2253 = _2243;
    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2257 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2255);
    float _2259 = precise::clamp(_2257, 0.0, 1.0);
    if (!_2015)
    {
        int _2261 = _2171 << 2;
        _1913 = _2261;
    }
    int _2263 = _1913;
    float _2265 = fma(_1064, _2061, _2241);
    float2 _6517 = float2(_1817, _2157);
    float _2267 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6517, float2(0.0), isnan(_6517)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6517, float2(0.0), isnan(_6517)), level(0.0)).x;
    float _2269 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    int _2271 = _2263;
    if (!_2015)
    {
        int _2273 = 12 & _2263;
        _2271 = _2273;
    }
    int _2275 = _2271;
    float _2277 = fma(_1050, _2107, _2213);
    float _2279 = _2237 * _2075;
    float _2281 = _2277 + _2115;
    float _2283 = _2237 * _2097;
    float _2285 = _2237 * _2089;
    float _2287 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2289 = _1845 * _2153;
    int _2291 = as_type<int>(_2153);
    if (!_2015)
    {
        uint _2293 = uint(int(uint(_2171) >> uint(2)));
        _2291 = int(_2293);
    }
    int _2295 = _2291;
    float _2297 = fma(_1064, _2145, _2289);
    float _2299 = -_2259;
    float _2301 = _2299 + 1.0;
    if (!_2015)
    {
        int _2303 = _2295 << 4;
        int _2305 = _2303 + _2275;
        _2245 = _2305;
    }
    int _2307 = _2245;
    float _2309 = fma(_1050, _2181, _2239);
    float _2311 = 1.0 / _2281;
    float _2313 = _2279;
    if (!_2015)
    {
        int _2315 = _2307 + 400;
        uint _2317 = uint(int(uint(_2315) >> uint(2)));
        uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
        int _2321 = int(_2317) & 3;
        float _2323 = (*spvDescriptorSet0.vp_c15)._m0[int(_2319)][_2321];
        _2313 = _2323;
    }
    float _2325 = _2313;
    float _2327 = _2309 + _2189;
    float _2329 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2331 = fma(_1050, _2201, _2297);
    float _2333 = -_2287;
    float _2335 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2333);
    float _2337 = abs(_2301);
    float _2339 = log2(_2337);
    float _2341 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2343 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2329);
    float _2345 = -_2285;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2335);
    float _2349 = _2331 + _2209;
    float _2351 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2341);
    float _2353 = fma(_1050, _2223, _2265);
    float _2355 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2343);
    float _2357 = _2327 * _2311;
    float _2359 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2351);
    float _2361 = _2353 + _2231;
    float _2363 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2365 = fma(_2347, -0.5, 0.5);
    bool _2367 = _2357 >= 0.0;
    float _2369 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2371 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2363);
    float _2373 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2375 = _2361 * _2311;
    bool _2377 = _2357 <= 1.0;
    bool _2379 = _2377 && _2367;
    float _2381 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2371);
    float _2383 = exp2(_2373);
    float _2385 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2387 = _2375 >= 0.0;
    bool _2389 = _2387 && _2379;
    float _2391 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2393 = fma(_2347, 0.5, 0.5);
    float _2395 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2397 = _2375 <= 1.0;
    bool _2399 = _2397 && _2389;
    float _2401 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2385);
    float _2403 = _2283 + 1.0;
    float _2405 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2407 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2401);
    float _2409 = sqrt(_2365);
    float _2411 = fma(_2393, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2413 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2407);
    float _2415 = -_2283;
    float _2417 = fma(_2383, _2403, _2415);
    float _2419 = fma(_2393, _2411, -0.212114393711090087890625);
    float _2421 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2423 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2405);
    float _2425 = 1.0 / _2413;
    if (_2399)
    {
        float _2427 = float(_1975);
        _1987 = _2427;
    }
    float _2429 = _1987;
    float _2431 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2421);
    float _2433 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2423);
    float _2435 = fma(_2393, _2419, 1.570728778839111328125);
    float _2437 = _2349 * _2311;
    float _2439 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2431);
    float _2441 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2433);
    float _2443 = _2423;
    float _2445 = _2437;
    if (_2399)
    {
        float _2447 = rint(_2429);
        float _2449 = precise::max(_2447, 0.0);
        uint _2451 = uint(_2449);
        uint _2453 = clamp(_2451, 0u, 65535u);
        _2443 = as_type<float>(_2453);
    }
    float _2455 = _2443;
    float _2457 = _2409 * 0.636619746685028076171875;
    float _2459 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2439);
    float _2461 = fma(_2417, 0.5, 0.5);
    float _2463 = -_2435;
    float _2465 = fma(_2457, _2463, 1.0);
    float _2467 = _2355;
    if (!_2015)
    {
        float _2469 = floor(_1863);
        _2467 = _2469;
    }
    float _2471 = _2467;
    float _2473 = _2441 * _2425;
    float _2475 = _2459 * _2425;
    float _2477 = fma(_2473, 0.5, 0.5);
    float _2479 = fma(_2475, -0.5, 0.5);
    float _2481 = _2455;
    if (_2399)
    {
        float3 _6891 = float3(_2357, _2375, float(as_type<int>(_2455)));
        float3 _6895 = select(_6891, float3(0.0), isnan(_6891));
        float _2483 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6895.xy, uint(rint(_6895.z)), _2437, level(0.0));
        _2481 = _2483;
    }
    float _2485 = _2481;
    float _2487 = _2311;
    if (!_2015)
    {
        float _2489 = rint(_2325);
        float _2491 = precise::max(_2489, 0.0);
        uint _2493 = uint(_2491);
        uint _2495 = clamp(_2493, 0u, 65535u);
        _2487 = as_type<float>(_2495);
    }
    float _2497 = _2487;
    float3 _6921 = float3(_2477, _2479, _2269);
    float _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6921, float3(0.0), isnan(_6921)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6921, float3(0.0), isnan(_6921)), level(0.0)).x;
    float _2501 = _2471;
    if (!_2015)
    {
        float _2503 = -_2471;
        float _2505 = _1863 + _2503;
        _2501 = _2505;
    }
    float _2507 = _2501;
    float3 _6942 = float3(_2477, _2479, _2269);
    float4 _2510 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6942, float3(0.0), isnan(_6942)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6942, float3(0.0), isnan(_6942)), level(0.0)).xyzw;
    float _2512 = _2510.x;
    float _2514 = _2510.y;
    float _2516 = _2510.z;
    float _2518 = _2510.w;
    float2 _6958 = float2(_2465, _2461);
    float3 _2520 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6958, float2(0.0), isnan(_6958)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6958, float2(0.0), isnan(_6958)), level(0.0)).xyz;
    float _2522 = _2520.x;
    float _2524 = _2520.y;
    float _2526 = _2520.z;
    float _2528 = _2497;
    if (!_2015)
    {
        float3 _6979 = float3(_2507, _2253, float(as_type<int>(_2497)));
        float3 _6981 = select(_6979, float3(0.0), isnan(_6979));
        float _2530 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6981.xy, uint(rint(_6981.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6981.xy, uint(rint(_6981.z)), level(0.0)).x;
        _2528 = _2530;
    }
    float _2532 = _2528;
    float _2534 = abs(_1875);
    float _2536 = log2(_2534);
    float _2538 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2540 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2538);
    float _2542 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2540);
    bool _2544 = _1875 <= 8000.0;
    bool _2546 = isnan(_1875);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(8000.0);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2542);
    float _2558 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2560 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2562 = exp2(_2558);
    out.gl_Position.x = _2441;
    out.gl_Position.y = _2459;
    out.gl_Position.z = _2556;
    out.gl_Position.w = _2413;
    float _2564 = exp2(_2560);
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2568 = precise::clamp(_2566, 0.0, 1.0);
    float _2570 = fma(_2568, -2.0, 3.0);
    float _2572 = _2568 * _2568;
    float _2574 = _2572 * _2570;
    float _2576 = _2556 + _2413;
    float _2578 = _2576 * 0.5;
    float _2580 = -_2574;
    float _2582 = _2580 + 1.0;
    out.m_103.z = _2578;
    out.m_103.w = _2413;
    float _2584 = fma(_2582, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2574);
    float _2586 = _2554 * _2584;
    float _2588 = _2584;
    float _2590 = _2556;
    float _2592 = _2441;
    if (!_2399)
    {
        _2588 = 1.0;
    }
    float _2594 = _2588;
    float _2596 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2598 = -_2562;
    float _2600 = _2598 + 1.0;
    float _2602 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2604 = _2600;
    float _2606 = _2594;
    if (_2015)
    {
        _2604 = 1.0;
    }
    float _2608 = _2604;
    float _2610 = -_2267;
    float _2612 = _2610 + 1.0;
    float _2614 = _2612 * _2596;
    float _2616 = precise::clamp(_2614, 0.0, 1.0);
    float _2618 = _2608;
    if (_2399)
    {
        bool _2620 = _2485 >= _2437;
        bool _2622 = isnan(_2485);
        bool _2624 = _2620 || _2622;
        bool _2626 = isnan(_2437);
        bool _2628 = _2624 || _2626;
        float _2630 = float(_2628);
        _2606 = _2630;
    }
    float _2632 = _2606;
    if (!_2015)
    {
        int _2634 = _2171 << 4;
        int _2636 = _2634 + 2048;
        uint _2638 = uint(int(uint(_2636) >> uint(2)));
        uint _2640 = uint(int(uint(int(_2638)) >> uint(2)));
        int _2642 = int(_2638) & 3;
        float _2644 = (*spvDescriptorSet0.vp_c15)._m0[int(_2640)][_2642];
        int _2646 = int(_2638) + 1;
        uint _2648 = uint(int(uint(_2646) >> uint(2)));
        int _2650 = _2646 & 3;
        float _2652 = (*spvDescriptorSet0.vp_c15)._m0[int(_2648)][_2650];
        int _2654 = _2636 + 8;
        uint _2656 = uint(int(uint(_2654) >> uint(2)));
        uint _2658 = uint(int(uint(int(_2656)) >> uint(2)));
        int _2660 = int(_2656) & 3;
        float _2662 = (*spvDescriptorSet0.vp_c15)._m0[int(_2658)][_2660];
        int _2664 = int(_2656) + 1;
        uint _2666 = uint(int(uint(_2664) >> uint(2)));
        int _2668 = _2664 & 3;
        float _2670 = (*spvDescriptorSet0.vp_c15)._m0[int(_2666)][_2668];
        float _2672 = _1845 * _2652;
        float _2674 = fma(_1064, _2644, _2672);
        float _2676 = fma(_1050, _2662, _2674);
        float _2678 = _2676 + _2670;
        float _2680 = precise::clamp(_2678, 0.0, 1.0);
        float _2682 = -_2680;
        float _2684 = _2682 + _2532;
        float _2686 = fma(_2684, 500.0, 1.5);
        float _2688 = exp2(_2686);
        float _2690 = 0.0 + _2688;
        float _2692 = precise::clamp(_2690, 0.0, 1.0);
        _2618 = _2692;
        _2590 = _2644;
        _2247 = as_type<float>(_2636);
        _2445 = _2688;
        _2592 = 500.0;
    }
    float _2694 = _2618;
    float _2696 = _2590;
    float _2698 = _2247;
    float _2700 = _2445;
    float _2702 = _2592;
    float _2704 = _2632 * _2694;
    float _2706 = _2602 * _2499;
    float _2708 = -_2616;
    float _2710 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_105.x = _1767;
    out.m_105.y = _1765;
    out.m_105.z = _1769;
    bool _2712 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2714 = isnan(_1837);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2720 = _2716 || _2718;
    float _2722 = _2518 * _2706;
    float _2724 = -_2704;
    float _2726 = fma(_2724, _2710, 1.0);
    float _2728 = precise::clamp(_2726, 0.0, 1.0);
    float _2730 = -_2602;
    float _2732 = _2730 + 1.0;
    float _2734 = _2526 * _2706;
    float _2736 = fma(_2522, _2722, _2512);
    float _2738 = fma(_2524, _2722, _2514);
    float _2740 = _2518 * _2732;
    float _2742 = _2728 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2744 = fma(_2518, _2734, _2516);
    out.m_107.x = _2742;
    float _2746 = _2700;
    float _2748 = _2696;
    float _2750 = _2702;
    float _2752 = _2732;
    float _2754 = _2698;
    float _2756 = _2728;
    if (!_2720)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2758 = _2746;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2720)
    {
        _2748 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2748;
    out.m_109.x = _2736;
    out.m_109.y = _2738;
    out.m_109.z = _2744;
    out.m_109.w = _2740;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2720)
    {
        _2750 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2770 = _2750;
    float _2772 = _2770;
    float _2774 = _2770;
    if (!_2720)
    {
        _2752 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2776 = _2752;
    float _2778 = _2776;
    float _2780 = _2776;
    if (!_2720)
    {
        _2754 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2782 = _2754;
    float _2784 = _2782;
    float _2786 = _2782;
    if (!_2720)
    {
        _2756 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2788 = _2756;
    bool _2790 = !_2720;
    float _2792 = _2788;
    float _2794 = _2788;
    if (!_2790)
    {
        bool _2796 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2798 = isnan(_1837);
        bool _2800 = _2796 || _2798;
        bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2804 = _2800 || _2802;
        if (!_2804)
        {
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2808 = _1837 + _2806;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2812 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2810;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2818 = 1.0 / _2812;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2836 = _2808 * _2818;
            float _2838 = precise::clamp(_2836, 0.0, 1.0);
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2844 = fma(_2838, _2816, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2846 = fma(_2838, _2842, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2848 = fma(_2838, _2822, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2850 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2852 = fma(_2838, _2830, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2854 = fma(_2838, _2834, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2768 = _2844;
            _2786 = _2852;
            _2762 = _2848;
            _2780 = _2850;
            _2774 = _2846;
            _2794 = _2854;
            _2856 = true;
        }
        else
        {
            bool _2858 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2860 = isnan(_1837);
            bool _2862 = _2858 || _2860;
            bool _2864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2866 = _2862 || _2864;
            if (!_2866)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2868 = _2760;
            _2762 = _2868;
            if (!_2866)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2870 = _2766;
            _2768 = _2870;
            if (!_2866)
            {
                _2772 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2872 = _2772;
            _2774 = _2872;
            if (!_2866)
            {
                _2778 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2874 = _2778;
            _2780 = _2874;
            if (!_2866)
            {
                _2784 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2876 = _2784;
            _2786 = _2876;
            if (!_2866)
            {
                _2792 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2878 = _2792;
            bool _2880 = !_2866;
            _2794 = _2878;
            if (!_2880)
            {
                bool _2882 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2884 = isnan(_1837);
                bool _2886 = _2882 || _2884;
                bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2890 = _2886 || _2888;
                if (!_2890)
                {
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2894 = _1837 + _2892;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2898 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2896;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2904 = 1.0 / _2898;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2922 = _2894 * _2904;
                    float _2924 = precise::clamp(_2922, 0.0, 1.0);
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2930 = fma(_2924, _2902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2932 = fma(_2924, _2928, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2934 = fma(_2924, _2908, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2936 = fma(_2924, _2912, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2938 = fma(_2924, _2916, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2940 = fma(_2924, _2920, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2768 = _2930;
                    _2786 = _2938;
                    _2762 = _2934;
                    _2780 = _2936;
                    _2774 = _2932;
                    _2794 = _2940;
                    _2856 = true;
                }
                else
                {
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2786 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2780 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2774 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2794 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2856 = false;
    float _2942 = _2768;
    float _2944 = _2786;
    float _2946 = _2762;
    float _2948 = _2780;
    float _2950 = _2774;
    float _2952 = _2794;
    float _2954 = fma(_1667, -0.5, 0.5);
    float _2956 = precise::clamp(_2954, 0.0, 1.0);
    float _2958 = -_2942;
    float _2960 = _2958 + _2944;
    float _2962 = -_2946;
    float _2964 = _2962 + _2948;
    float _2966 = -_2950;
    float _2968 = _2966 + _2952;
    bool _2970 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2972 = fma(_2956, _2960, _2942);
    float _2974 = fma(_2956, _2964, _2946);
    float _2976 = fma(_2956, _2968, _2950);
    float _2978 = _2972 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2980 = fma(_2974, 0.298911988735198974609375, _2978);
    float _2982 = fma(_2976, 0.114477999508380889892578125, _2980);
    out.m_111.x = 0.0;
    float _2984 = -_2982;
    float _2986 = _2974 + _2984;
    float _2988 = -_2982;
    float _2990 = _2972 + _2988;
    float _2992 = -_2982;
    float _2994 = _2976 + _2992;
    float _2996 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2998 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3000 = fma(_2990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3002 = fma(_2994, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    out.m_107.w = _2996;
    out.m_113.x = _2998;
    out.m_113.y = _3000;
    out.m_113.z = _3002;
    if (!_2970)
    {
        return out;
    }
    float _3004 = -_1765;
    float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3008 = -_1767;
    float _3010 = _3008 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3012 = -_1769;
    float _3014 = _3012 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3016 = _3006 * _3006;
    float _3018 = fma(_3010, _3010, _3016);
    float _3020 = fma(_3014, _3014, _3018);
    float _3022 = sqrt(_3020);
    float _3024 = rsqrt(_3020);
    float _3026 = -_3022;
    float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3030 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3032 = precise::clamp(_3030, 0.0, 1.0);
    float _3034 = _3010 * _3024;
    float _3036 = _3006 * _3024;
    float _3038 = abs(_3032);
    float _3040 = log2(_3038);
    float _3042 = _3014 * _3024;
    float _3044 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3046 = _1667 * _3036;
    float _3048 = -_3036;
    float _3050 = -_3044;
    float _3052 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3050);
    float _3054 = fma(_1665, _3034, _3046);
    float _3056 = -_3042;
    float _3058 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3052);
    float _3060 = fma(_1669, _3042, _3054);
    float _3062 = precise::clamp(_3060, 0.0, 1.0);
    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3066 = _3058 + _3064;
    float _3068 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3070 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3072 = precise::clamp(_3070, 0.0, 1.0);
    float _3074 = exp2(_3068);
    float _3076 = _3074 * _3072;
    float _3078 = _3062 * _3076;
    float _3080 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3082 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3084 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _3080;
    out.m_111.y = _3082;
    out.m_111.z = _3084;
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
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2856 = false;
    bool _1719 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_60.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_63.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3141 = as_type<float>(_148);
        out.gl_Position.z = _3141;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_65.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = 0.0;
    float _170 = _166;
    if (_162)
    {
        float _172 = float(_132);
        _168 = _172;
    }
    float _174 = _168;
    bool _176 = _166 >= _174;
    bool _178 = !_162;
    bool _180 = _176 || _178;
    if (_180)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _142;
    if (_180)
    {
        out.m_63.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3210 = as_type<float>(_186);
        out.gl_Position.z = _3210;
    }
    if (_180)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _196 = in.m_69.x;
    float _198 = in.m_69.y;
    float _200 = in.m_69.z;
    bool _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _206 = _202 || _204;
    bool _208 = isnan(1.0);
    bool _210 = _206 || _208;
    float _212 = in.m_71.x;
    float _214 = in.m_71.y;
    float _216 = in.m_71.z;
    float _218 = in.m_65.x;
    float _220 = in.m_65.y;
    float _222 = in.m_65.z;
    float _224 = 0.0;
    float _226 = _194;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_210)
    {
        float _230 = _194 * _194;
        float _232 = _230 * 0.5;
        _224 = _232;
    }
    float _234 = _224;
    float _236 = _234;
    if (!_210)
    {
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _238;
    }
    float _240 = _236;
    float _242 = _188 * _188;
    float _244 = _190 * _190;
    float _246 = _192 * _192;
    float _248 = fma(_196, _196, _242);
    float _250 = fma(_198, _198, _244);
    float _252 = fma(_200, _200, _246);
    float _254 = fma(_212, _212, _248);
    float _256 = fma(_214, _214, _250);
    float _258 = fma(_216, _216, _252);
    float _260 = sqrt(_254);
    float _262 = sqrt(_256);
    bool _264 = _260 > 0.0;
    float _266 = sqrt(_258);
    bool _268 = _262 > 0.0;
    float _270 = _260;
    float _272 = _240;
    float _274 = _188;
    if (_264)
    {
        float _276 = rsqrt(_254);
        _270 = _276;
    }
    float _278 = _270;
    bool _280 = _266 > 0.0;
    float _282 = 0.0;
    float _284 = _266;
    if (_268)
    {
        float _286 = rsqrt(_256);
        _282 = _286;
    }
    float _288 = _282;
    bool _290 = !_210;
    float _292 = _278;
    if (!_290)
    {
        float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = log2(_294);
        float _298 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _300 = _298 + 1.0;
        float _302 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = _194 * _296;
        float _306 = 1.0 / _300;
        float _308 = _302 * 0.693147182464599609375;
        float _310 = exp2(_304);
        float _312 = 1.0 / _308;
        float _314 = _310 + (-1.0);
        float _316 = -_314;
        float _318 = fma(_316, _312, _194);
        float _320 = _318 * _306;
        float _322 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = _322;
        _284 = _320;
    }
    float _324 = _272;
    float _326 = _284;
    bool _328 = !_210;
    float _330 = _326;
    if (!_328)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = 1.0 / _338;
        float _342 = _194 * _334;
        float _344 = exp2(_342);
        float _346 = -_344;
        float _348 = _346 + 1.0;
        float _350 = _348 * _340;
        _226 = _350;
        _228 = _338;
    }
    float _352 = _226;
    float _354 = _228;
    float _356 = in.m_73.w;
    float _358 = _354;
    if (!_264)
    {
        _330 = 0.0;
    }
    float _360 = _330;
    float _362 = _360;
    if (_264)
    {
        float _364 = _278 * _196;
        _362 = _364;
    }
    float _366 = _362;
    if (!_264)
    {
        _358 = 0.0;
    }
    float _368 = _358;
    float _370 = in.m_60.x;
    float _372 = in.m_60.y;
    float _374 = in.m_60.z;
    float _376 = 0.0;
    float _378 = _368;
    if (!_264)
    {
        _376 = 0.0;
    }
    float _380 = _376;
    float _382 = _380;
    if (_264)
    {
        float _384 = _278 * _188;
        _378 = _384;
    }
    float _386 = _378;
    if (_264)
    {
        float _388 = _278 * _212;
        _382 = _388;
    }
    float _390 = _382;
    float _392 = _258;
    if (_280)
    {
        float _394 = rsqrt(_258);
        _392 = _394;
    }
    float _396 = _392;
    bool _398 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _400 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _402 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _404 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _406 = 0.0;
    float _408 = _402;
    if (!_268)
    {
        _406 = 0.0;
    }
    float _410 = _406;
    float _412 = fma(_352, _218, _400);
    float _414 = fma(_352, _220, _402);
    float _416 = fma(_352, _222, _404);
    float _418 = 0.0;
    float _420 = _410;
    if (!_280)
    {
        _408 = 0.0;
        _418 = 0.0;
    }
    float _422 = _408;
    float _424 = _418;
    float _426 = 0.0;
    float _428 = _424;
    float _430 = _422;
    if (!_268)
    {
        _426 = 0.0;
    }
    float _432 = _426;
    float _434 = _432;
    if (_268)
    {
        float _436 = _288 * _198;
        _420 = _436;
    }
    float _438 = _420;
    if (!_268)
    {
        _292 = 0.0;
    }
    float _440 = _292;
    float _442 = _440;
    if (_268)
    {
        float _444 = _288 * _190;
        _434 = _444;
    }
    float _446 = _434;
    float _448 = 0.0;
    if (!_280)
    {
        _448 = 0.0;
    }
    float _450 = _448;
    float _452 = _450;
    if (_268)
    {
        float _454 = _288 * _214;
        _442 = _454;
    }
    float _456 = _442;
    float _458 = _456;
    if (_280)
    {
        float _460 = _396 * _200;
        _452 = _460;
    }
    float _462 = _452;
    if (_280)
    {
        float _464 = _396 * _192;
        _428 = _464;
    }
    float _466 = _428;
    if (_280)
    {
        float _468 = _396 * _216;
        _430 = _468;
    }
    float _470 = _430;
    float _472 = fma(_412, _356, _370);
    float _474 = fma(_414, _356, _372);
    float _476 = fma(_416, _356, _374);
    bool _478 = !_398;
    float _496;
    if (!_478)
    {
        float _480 = in.m_75.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_132);
        float _502 = 1.0 / _500;
        float _504 = _166 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = in.m_75.z;
    float _510 = _474 * _198;
    float _512 = in.m_75.x;
    float _514 = _474 * _214;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _516;
    float _520 = fma(_472, _196, _510);
    float _522 = in.m_75.y;
    float _524 = 1.0 / _518;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _530;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _544 = _542 != 0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _548 = _506 + _546;
    float _550 = fma(_472, _212, _514);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _554 = _506 + _552;
    float _556 = 1.0 / _528;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _560 = _506 + _558;
    float _562 = fma(_476, _216, _550);
    float _564 = _474 * _190;
    float _566 = _508 * 2.0;
    bool _568 = !_540;
    int _570 = _568 ? 0 : 1;
    float _572 = 1.0 / _532;
    float _574 = _560 * _524;
    float _576 = _512 * 2.0;
    float _578 = _512 + _508;
    int _580 = abs(_570);
    float _582 = fma(_472, _188, _564);
    float _584 = _522 * 2.0;
    float _586 = _578 + (-1.0);
    float _588 = floor(_566);
    float _590 = _548 * _556;
    float _592 = _522 + _508;
    float _594 = _512 + _522;
    float _596 = fma(_476, _192, _582);
    float _598 = _592 + (-1.0);
    float _600 = _594 + (-1.0);
    float _602 = floor(_584);
    float _604 = _554 * _572;
    float _606 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _608;
    float _612 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _614 = _588 > 0.0;
    float _616 = fma(_610, _574, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _618 = _588 >= 0.0;
    bool _620 = isnan(_588);
    bool _622 = _618 || _620;
    bool _624 = isnan(0.0);
    bool _626 = _622 || _624;
    float _628 = floor(_576);
    int _630 = _626 ? 0 : 1;
    bool _632 = _602 >= 0.0;
    bool _634 = isnan(_602);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    int _642 = ~_630;
    int _644 = _642 + 1;
    int _646 = _644 + 1;
    float _648 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _650 = _646;
    int _652 = as_type<int>(_512);
    if (!_614)
    {
        int _654 = ~_630;
        int _656 = _654 + 1;
        _650 = _656;
    }
    int _658 = _650;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _660;
    bool _664 = _628 > 0.0;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _666;
    bool _670 = _628 >= 0.0;
    bool _672 = isnan(_628);
    bool _674 = _670 || _672;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    float _680 = fma(_662, _574, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _682 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _684 = log2(_682);
    bool _686 = !_536;
    int _688 = _686 ? 0 : 1;
    float _690 = fma(_668, _574, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _692 = _602 > 0.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _698 = abs(_688);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _708 = _678 ? 0 : 1;
    float _710 = fma(_702, _590, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _712 = fma(_706, _590, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _714 = fma(_696, _590, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _716 = _684 * _166;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _720 = 1.0 + _718;
    bool _722 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(1.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = float(_698);
    float _734 = 1.0 / _720;
    float _736 = float(_658);
    int _738 = ~_708;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    int _744 = _742;
    if (!_664)
    {
        int _746 = ~_708;
        int _748 = _746 + 1;
        _744 = _748;
    }
    int _750 = _744;
    float _752 = _732 * _736;
    bool _754 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _756 = isnan(0.0);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _762 = _758 || _760;
    float _764 = exp2(_716);
    float _766 = in.m_77.x;
    float _768 = in.m_77.y;
    float _770 = in.m_77.z;
    float _772 = _752 * (-2.0);
    float _774 = float(_580);
    float _776 = float(_750);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _782;
    float _786 = _774 * _776;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _788;
    bool _792 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _794 = isnan(_506);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = fma(_780, _604, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _806 = _786 * (-2.0);
    float _808 = -_764;
    float _810 = _808 + 1.0;
    float _812 = fma(_784, _604, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _814 = fma(_790, _604, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _816 = -_802;
    float _818 = _816 + 1.0;
    float _820 = fma(_612, _806, _612);
    float _822 = _762 ? _810 : 0.0;
    int _824 = _640 ? 0 : 1;
    float _826 = fma(_806, _768, _768);
    if (_730)
    {
        float _828 = _822 * _734;
        _170 = _828;
    }
    float _830 = _170;
    float _832 = fma(_606, _772, _606);
    float _834 = fma(_772, _766, _766);
    bool _836 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _838 = isnan(_506);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _512 + (-0.5);
    bool _850 = !_544;
    int _852 = _850 ? 0 : 1;
    int _854 = ~_824;
    int _856 = _854 + 1;
    int _858 = _856 + 1;
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].x, _834);
    bool _862 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _864 = isnan(_506);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = _846 * _818;
    float _876 = -_846;
    float _878 = _876 + 1.0;
    int _880 = abs(_852);
    float _882 = _522 + (-0.5);
    int _884 = _858;
    if (!_692)
    {
        int _886 = ~_824;
        int _888 = _886 + 1;
        _884 = _888;
    }
    int _890 = _884;
    float _892 = _872 * _878;
    float _894 = -_872;
    float _896 = _894 + 1.0;
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _826);
    bool _900 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _902 = isnan(_506);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = fma(_832, _830, _860);
    float _914 = float(_880);
    float _916 = fma(_820, _830, _898);
    float _918 = float(_890);
    float _920 = _910 * _896;
    float _922 = _912 * 0.15915493667125701904296875;
    float _924 = _916 * 0.15915493667125701904296875;
    float _926 = _914 * _918;
    float _928 = _680 * _920;
    float _930 = _690 * _920;
    float _932 = _616 * _920;
    float _934 = -_910;
    float _936 = _934 + 1.0;
    float _938 = _926 * (-2.0);
    float _940 = in.m_73.x;
    float _942 = in.m_73.y;
    float _944 = in.m_73.z;
    float _946 = _922 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[143].x, _928);
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[143].y, _930);
    float _954 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[143].z, _932);
    float _956 = fma(_938, _770, _770);
    float _958 = _508 + (-0.5);
    float _960 = in.m_79.x;
    float _962 = in.m_79.y;
    float _964 = in.m_79.z;
    float _966 = fma(_648, _938, _648);
    float _968 = fma(_714, _892, _954);
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].z, _956);
    float _972 = fma(_712, _892, _950);
    float _974 = fma(_710, _892, _952);
    float _976 = fma(_814, _874, _968);
    float _978 = fma(_966, _830, _970);
    float _980 = fma(_804, _874, _972);
    float _982 = fma(_812, _874, _974);
    float _984 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[146].z, _976);
    float _986 = _978 * 0.15915493667125701904296875;
    float _988 = _922 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[146].x, _980);
    float _994 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[146].y, _982);
    float _996 = fma(_476, _200, _520);
    float _998 = _984 * _944;
    float _1000 = _994 * _942;
    float _1002 = _992 * _940;
    float _1004 = _924 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = in.m_71.w;
    float _1010 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _962);
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _960);
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _964);
    float _1020 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1022 = _924 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    float _1026 = _1016 * _1012;
    float _1028 = _1014 * _1010;
    float _1030 = _1018 * _1020;
    float _1032 = in.m_69.w;
    float _1034 = _986 * 6.283185482025146484375;
    float _1036 = cos(_1034);
    float _1038 = _948 * _1006;
    float _1040 = _990 * _1006;
    float _1042 = _986 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    float _1046 = _990 * _1024;
    float _1048 = _948 * _1024;
    float _1050 = _562 + _1008;
    float _1052 = _990 * _1036;
    float _1054 = _948 * _1036;
    float _1056 = _1024 * _1036;
    float _1058 = _1006 * _1036;
    float _1060 = _1052 * _1028;
    float _1062 = _1054 * _1028;
    float _1064 = _996 + _1032;
    float _1066 = fma(_1044, _1046, _1038);
    float _1068 = -_1028;
    float _1070 = _1044 * _1068;
    float _1072 = -_1048;
    float _1074 = fma(_1044, _1040, _1072);
    float _1076 = -_1040;
    float _1078 = fma(_1044, _1048, _1076);
    float _1080 = fma(_1066, _1026, _1060);
    float _1082 = fma(_1056, _1026, _1070);
    float _1084 = fma(_1044, _1038, _1046);
    float _1086 = fma(_1078, _1026, _1062);
    float _1088 = fma(_1074, _1030, _1080);
    float _1090 = fma(_1058, _1030, _1082);
    float _1092 = in.m_67.w;
    float _1094 = fma(_1084, _1030, _1086);
    float _1096 = _1088 * _438;
    float _1098 = _1088 * _456;
    float _1100 = _1088 * _446;
    float _1102 = fma(_1090, _366, _1096);
    float _1104 = fma(_1090, _390, _1098);
    float _1106 = fma(_1090, _386, _1100);
    float _1108 = fma(_1094, _462, _1102);
    float _1110 = fma(_1094, _470, _1104);
    float _1112 = fma(_1094, _466, _1106);
    float _1114 = _1064 + _1108;
    float _1116 = _1050 + _1110;
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1120 = _1114 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1124 = _1116 + _1122;
    float _1126 = _1120 * _1120;
    float _1128 = _1124 * _1124;
    float _1130 = _596 + _1092;
    float _1132 = _1126 + _1128;
    float _1134 = _1130 + _1112;
    float _1136 = sqrt(_1132);
    bool _1138 = _1136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = _1136 + _1140;
    float _1144 = _952;
    float _1146 = _1112;
    float _1148 = _1114;
    float _1150 = _1116;
    float _1152 = _1126;
    float _1154 = _1134;
    float _1156 = _1128;
    float _1158 = _1074;
    float _1160 = _1058;
    if (_1138)
    {
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1162;
    }
    float _1164 = _1144;
    if (_1138)
    {
        float _1166 = _1134 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1146 = _1166;
    }
    float _1168 = _1146;
    float _1170 = _1168;
    if (_1138)
    {
        float _1172 = rsqrt(_1132);
        _274 = _1172;
    }
    float _1174 = _274;
    float _1176 = _1164;
    float _1178 = _1174;
    if (_1138)
    {
        float _1180 = _1142 * _1164;
        _1176 = _1180;
    }
    float _1182 = _1176;
    float _1184 = _1182;
    if (_1138)
    {
        float _1186 = _1182 * 0.15915493667125701904296875;
        _1184 = _1186;
    }
    float _1188 = _1184;
    float _1190 = _1088;
    if (_1138)
    {
        float _1192 = _1188 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        _1190 = _1194;
    }
    float _1196 = _1190;
    if (_1138)
    {
        float _1198 = fma(_1196, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1170 = _1198;
    }
    float _1200 = _1170;
    if (_1138)
    {
        float _1202 = _1174 * _1200;
        _1178 = _1202;
    }
    float _1204 = _1178;
    if (_1138)
    {
        float _1206 = fma(_1120, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1148 = _1206;
    }
    float _1208 = _1148;
    if (_1138)
    {
        float _1210 = fma(_1124, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1150 = _1210;
    }
    float _1212 = _1150;
    float _1214 = fma(_1208, 6.2500002968590706586837768554688e-05, 0.5);
    float _1216 = fma(_1212, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4721 = float2(_1214, _1216);
    float3 _1220 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4721, float2(0.0), isnan(_4721)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4721, float2(0.0), isnan(_4721)), level(0.0)).xyz;
    float _1222 = _1220.x;
    float _1224 = _1220.y;
    float _1226 = _1220.z;
    float _1228 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1230 = in.m_81.y;
    float _1232 = _1228 * _512;
    float _1234 = in.m_75.w;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1242 = _1240 != 0;
    float _1244 = in.m_81.x;
    float _1246 = trunc(_1232);
    int _1248 = int(_1246);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1256 = _1254 != 0;
    bool _1258 = _522 > 0.5;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1260 = -_1230;
    float _1262 = _1260 + 1.0;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1266 = _1248 << 4;
    int _1268 = _1266 + 1968;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1274 = _1234 > 0.5;
    uint _1277 = uint(int(uint(_1268) >> uint(2)));
    uint _1279 = uint(int(uint(int(_1277)) >> uint(2)));
    int _1281 = int(_1277) & 3;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[int(_1279)][_1281];
    int _1285 = int(_1277) + 1;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    int _1289 = _1285 & 3;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[int(_1287)][_1289];
    float _1293 = in.m_85.x;
    float _1295 = in.m_85.y;
    float _1297 = in.m_85.z;
    float _1299 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1301 = _1274 ? as_type<int>(_1262) : as_type<int>(_1230);
    float _1303 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1305 = _962 != 0.0;
    bool _1307 = isnan(_962);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(0.0);
    bool _1313 = _1309 || _1311;
    int _1315 = 0;
    float _1317 = _1230;
    bool _1319 = _1256;
    float _1321 = 1.0;
    bool _1323 = _1258;
    float _1325 = _1272;
    float _1327 = _1212;
    if (_1252)
    {
        float _1329 = -_1244;
        float _1331 = _1329 + 1.0;
        _1315 = as_type<int>(_1331);
    }
    int _1333 = _1315;
    float _1335 = _1256 ? as_type<float>(_1301) : _1230;
    int _1337 = _1268 + 8;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    uint _1341 = uint(int(uint(int(_1339)) >> uint(2)));
    int _1343 = int(_1339) & 3;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[int(_1341)][_1343];
    bool _1347 = _960 == 0.0;
    bool _1349 = !_1313;
    bool _1351 = _1347 && _1349;
    if (_1238)
    {
        float _1353 = _1258 ? _1262 : _1230;
        _1317 = _1353;
    }
    float _1355 = _1317;
    bool _1357 = _964 == 0.0;
    bool _1359 = _1357 && _1351;
    float _1361 = in.m_87.x;
    float _1363 = in.m_87.y;
    float _1365 = in.m_87.z;
    float _1367 = in.m_87.w;
    if (_1242)
    {
        bool _1369 = _512 > 0.5;
        _1319 = _1369;
    }
    bool _1371 = _1319;
    if (_1242)
    {
        float _1373 = -_1244;
        float _1375 = _1373 + 1.0;
        _652 = as_type<int>(_1375);
    }
    int _1377 = _652;
    float _1379 = as_type<float>(_1377);
    if (!_1242)
    {
        _1321 = _1244;
    }
    float _1381 = _1321;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1385 = _1381;
    if (_1252)
    {
        bool _1387 = _508 > 0.5;
        _1323 = _1387;
    }
    bool _1389 = _1323;
    if (_1242)
    {
        float _1391 = _1371 ? as_type<float>(_1377) : _1244;
        _1385 = _1391;
    }
    float _1393 = _1385;
    float _1395 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1397 = 0.0;
    float _1399 = _1293;
    if (_1359)
    {
        _1397 = _1293;
    }
    float _1401 = _1397;
    out.m_89.x = _1299;
    out.m_89.y = _1395;
    out.m_89.z = _1303;
    out.m_89.w = _1272;
    float _1403 = _1401;
    if (_1359)
    {
        _1379 = _1401;
    }
    float _1405 = _1379;
    float _1407 = _1405;
    if (!_1359)
    {
        _1403 = _1293;
    }
    float _1409 = _1403;
    if (!_1252)
    {
        _1399 = _1244;
    }
    float _1411 = _1399;
    float _1413 = _1411;
    if (_1252)
    {
        float _1415 = _1389 ? as_type<float>(_1333) : _1244;
        _1413 = _1415;
    }
    float _1417 = _1413;
    if (!_1359)
    {
        float _1419 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1409);
        _1407 = _1419;
    }
    float _1421 = _1407;
    float _1423 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1359)
    {
        _1325 = _1295;
    }
    float _1425 = _1325;
    float _1427 = _1425;
    if (!_1359)
    {
        float _1429 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1295);
        _1427 = _1429;
    }
    float _1431 = _1427;
    float _1433 = _1363 * _1297;
    float _1435 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1437 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1439 = -_1431;
    float _1441 = _1044 * _1439;
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1365 * _1409;
    float _1447 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1449 = _1437;
    if (_1359)
    {
        _1449 = _1297;
    }
    float _1451 = _1449;
    float _1453 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1455 = _1451;
    if (!_1359)
    {
        float _1457 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1297);
        _1455 = _1457;
    }
    float _1459 = _1455;
    float _1461 = _1361 * _1295;
    float _1463 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = -_1445;
    float _1467 = fma(_1361, _1297, _1465);
    float _1469 = -_1433;
    float _1471 = fma(_1365, _1295, _1469);
    float _1473 = -_1461;
    float _1475 = fma(_1363, _1409, _1473);
    float _1477 = -_1363;
    float _1479 = _1044 * _1477;
    float _1481 = _1467 * _1367;
    out.m_91.x = _1447;
    out.m_91.y = _1443;
    out.m_91.z = _1463;
    float _1483 = _1471 * _1367;
    float _1485 = _1475 * _1367;
    float _1487 = _1052 * _1363;
    float _1489 = _1054 * _1363;
    float _1491 = fma(_1056, _1361, _1479);
    float _1493 = fma(_1066, _1361, _1487);
    float _1495 = fma(_1078, _1361, _1489);
    float _1497 = fma(_1058, _1365, _1491);
    float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1501 = -_1481;
    float _1503 = _1044 * _1501;
    float _1505 = _1052 * _1431;
    float _1507 = _1054 * _1431;
    float _1509 = _1052 * _1481;
    float _1511 = _1054 * _1481;
    float _1513 = fma(_1056, _1421, _1441);
    float _1515 = fma(_1066, _1421, _1505);
    float _1517 = fma(_1078, _1421, _1507);
    float _1519 = fma(_1078, _1483, _1511);
    float _1521 = fma(_1066, _1483, _1509);
    float _1523 = _1511;
    if (_1138)
    {
        float _1525 = _1188 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        _1523 = _1527;
    }
    float _1529 = _1523;
    float _1531 = fma(_1074, _1459, _1515);
    float _1533 = fma(_1058, _1459, _1513);
    float _1535 = fma(_1084, _1459, _1517);
    float _1537 = fma(_1074, _1365, _1493);
    float _1539 = fma(_1074, _1485, _1521);
    float _1541 = fma(_1056, _1483, _1503);
    float _1543 = fma(_1084, _1365, _1495);
    float _1545 = _1531 * _438;
    float _1547 = _1531 * _456;
    float _1549 = _1537 * _456;
    float _1551 = _1539 * _456;
    float _1553 = fma(_1058, _1485, _1541);
    float _1555 = fma(_1084, _1485, _1519);
    float _1557 = _1537 * _438;
    float _1559 = _1539 * _438;
    float _1561 = _1537;
    float _1563 = _1545;
    if (_1138)
    {
        float _1565 = _1529 + (-1.0);
        _458 = _1565;
    }
    float _1567 = _458;
    float _1569 = fma(_1533, _366, _1545);
    float _1571 = _1537 * _446;
    if (_1138)
    {
        float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1575 = _1208 + _1573;
        _1561 = _1575;
    }
    float _1577 = _1561;
    if (_1138)
    {
        float _1579 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1579;
    }
    float _1581 = _1563;
    float _1583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1585 = _1531 * _446;
    float _1587 = _1581;
    if (_1138)
    {
        float _1589 = _1577 * _1577;
        _1152 = _1589;
    }
    float _1591 = _1152;
    if (_1138)
    {
        float _1593 = fma(_1134, _1529, _1581);
        _1154 = _1593;
    }
    float _1595 = _1154;
    if (_1138)
    {
        float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1599 = _1212 + _1597;
        _1587 = _1599;
    }
    float _1601 = _1587;
    float _1603 = _1539 * _446;
    float _1605 = fma(_1533, _386, _1585);
    float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1609 = _1595 + _1607;
    float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1138)
    {
        float _1613 = _1601 * _1601;
        _1156 = _1613;
    }
    float _1615 = _1156;
    float _1617 = fma(_1533, _390, _1547);
    float _1619 = fma(_1609, _1609, _1591);
    float _1621 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1623 = fma(_1497, _366, _1557);
    float _1625 = fma(_1497, _386, _1571);
    float _1627 = _1619 + _1615;
    float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1631 = fma(_1553, _366, _1559);
    float _1633 = fma(_1553, _386, _1603);
    float _1635 = fma(_1497, _390, _1549);
    float _1637 = fma(_1553, _390, _1551);
    float _1639 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1641 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1643 = _1621 * _1583;
    float _1645 = sqrt(_1627);
    float _1647 = _1423 * _1499;
    float _1649 = fma(_1543, _462, _1623);
    float _1651 = fma(_1543, _466, _1625);
    float _1653 = fma(_1555, _462, _1631);
    float _1655 = fma(_1555, _466, _1633);
    float _1657 = _1639 * _1611;
    float _1659 = fma(_1543, _470, _1635);
    float _1661 = fma(_1555, _470, _1637);
    float _1663 = _1641 * _1629;
    float _1665 = fma(_1535, _462, _1569);
    float _1667 = fma(_1535, _466, _1605);
    float _1669 = fma(_1535, _470, _1617);
    out.m_93.x = _1649;
    out.m_93.y = _1651;
    out.m_93.z = _1659;
    bool _1671 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1673 = isnan(_1645);
    bool _1675 = _1671 || _1673;
    bool _1677 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1679 = _1675 || _1677;
    out.m_95.x = _1663;
    out.m_95.y = _1643;
    out.m_95.z = _1647;
    out.m_95.w = _1657;
    out.m_97.x = _1653;
    out.m_97.y = _1655;
    out.m_97.z = _1661;
    out.m_99.x = _1665;
    out.m_99.y = _1667;
    out.m_99.z = _1669;
    float _1681 = _1641;
    float _1683 = _1637;
    if (!_1679)
    {
        _1681 = 1.0;
    }
    float _1685 = _1681;
    out.m_101.x = _1222;
    out.m_101.y = _1224;
    out.m_101.z = _1226;
    bool _1687 = !_1679;
    float _1689 = _1685;
    if (!_1687)
    {
        bool _1691 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1693 = isnan(_1645);
        bool _1695 = _1691 || _1693;
        bool _1697 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1699 = _1695 || _1697;
        if (!_1699)
        {
            float _1701 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1703 = _1645 + _1701;
            float _1705 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1707 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1705;
            float _1709 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1713 = 1.0 / _1707;
            float _1715 = _1703 * _1713;
            float _1717 = fma(_1715, _1711, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1689 = _1717;
            _1719 = true;
        }
        else
        {
            bool _1721 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1723 = isnan(_1645);
            bool _1725 = _1721 || _1723;
            bool _1727 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1729 = _1725 || _1727;
            if (!_1729)
            {
                float _1731 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1733 = _1645 + _1731;
                float _1735 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1737 = _1735 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1741 = _1739 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1743 = 1.0 / _1737;
                float _1745 = _1733 * _1743;
                float _1747 = fma(_1745, _1741, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1689 = _1747;
                _1719 = true;
            }
            else
            {
                _1689 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1719 = false;
    float _1749 = _1689;
    float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1753 = _1595 + _1751;
    float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1757 = _1208 + _1755;
    float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1761 = _1212 + _1759;
    float _1763 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1765 = fma(_1753, _1749, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1767 = fma(_1757, _1749, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1769 = fma(_1761, _1749, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1771 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1763);
    float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1775 = _1765 + _1773;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1779 = _1767 + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1783 = _1769 + _1781;
    float _1785 = _1775 * _1775;
    float _1787 = fma(_1779, _1779, _1785);
    float _1789 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1791 = fma(_1783, _1783, _1787);
    float _1793 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1771);
    float _1795 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1797 = floor(_1789);
    float _1799 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1801 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1803 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1795);
    float _1805 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1803);
    float _1807 = rsqrt(_1791);
    float _1809 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1811 = _1809 + _1801;
    float _1813 = 1.0 / _1801;
    float _1815 = -_1797;
    float _1817 = _1789 + _1815;
    float _1819 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1821 = floor(_1799);
    float _1823 = _1779 * _1819;
    float _1825 = _1783 * _1819;
    float _1827 = _1823 * _1823;
    float _1829 = _1825 * _1825;
    float _1831 = _1811 * _1813;
    float _1833 = _1831 * 0.5;
    float _1835 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1837 = sqrt(_1791);
    float _1839 = _1827 + _1829;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1843 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1841);
    float _1845 = _1130 + _1835;
    float _1847 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1849 = sqrt(_1839);
    float _1851 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1853 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1847);
    float _1855 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1851);
    float _1857 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1853);
    float _1859 = 1.0 / _1843;
    float _1861 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1855);
    float _1863 = _1857 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1865 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1867 = _1849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1869 = trunc(_1863);
    int _1871 = int(_1869);
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1875 = _1859 * _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = _1849 + _1877;
    float _1881 = trunc(_1865);
    int _1883 = int(_1881);
    bool _1885 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1887 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1889 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1891 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1893 = _1871 + _1891;
    int _1895 = _1893 + 1;
    float _1897 = _1813;
    int _1899 = 2;
    float _1901 = _1839;
    float _1903 = _1819;
    float _1905 = _1879;
    float _1907 = _1797;
    float _1909 = _1823;
    float _1911 = _1827;
    int _1913 = as_type<int>(_1865);
    if (_1867)
    {
        float _1915 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1897 = _1915;
    }
    float _1917 = _1897;
    float _1919 = precise::max(0.0, _1889);
    if (!_1885)
    {
        _1899 = 1;
    }
    int _1921 = _1899;
    float _1923 = -_1819;
    float _1925 = -_1919;
    float _1927 = fma(_1775, _1923, _1925);
    int _1929 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1931 = _1883 + _1929;
    int _1933 = _1931 + 1;
    int _1935 = _1921;
    if (_1867)
    {
        float _1937 = rsqrt(_1839);
        _1901 = _1937;
    }
    float _1939 = _1901;
    float _1941 = _1939;
    if (_1867)
    {
        float _1943 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _1943;
    }
    float _1945 = _1903;
    int _1947 = _1895 | _1933;
    float _1949 = as_type<float>(_1947);
    if (_1867)
    {
        float _1951 = _1879 * _1917;
        _1905 = _1951;
    }
    float _1953 = _1905;
    if (!_1867)
    {
        _1907 = _1927;
    }
    float _1955 = _1907;
    float _1957 = _1955;
    if (_1867)
    {
        float _1959 = _1953 * 0.15915493667125701904296875;
        _1327 = _1959;
    }
    float _1961 = _1327;
    bool _1963 = !_1885;
    int _1965 = _1963 ? 0 : 1;
    float _1967 = _1857;
    if (_1867)
    {
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        _1967 = _1971;
    }
    float _1973 = _1967;
    if (!_1887)
    {
        _1935 = _1965;
    }
    int _1975 = _1935;
    bool _1977 = _1895 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1979 = _1975 << 6;
    bool _1981 = _1947 < 0;
    bool _1983 = _1981 || _1977;
    float _1985 = _1961;
    float _1987 = as_type<float>(_1975);
    if (_1867)
    {
        float _1989 = _1961 * 6.283185482025146484375;
        float _1991 = cos(_1989);
        _1985 = _1991;
    }
    float _1993 = _1985;
    int _1995 = _1979 + 96;
    uint _1997 = uint(int(uint(_1995) >> uint(2)));
    uint _1999 = uint(int(uint(int(_1997)) >> uint(2)));
    int _2001 = int(_1997) & 3;
    float _2003 = (*spvDescriptorSet0.vp_c15)._m0[int(_1999)][_2001];
    int _2005 = int(_1997) + 1;
    uint _2007 = uint(int(uint(_2005) >> uint(2)));
    int _2009 = _2005 & 3;
    float _2011 = (*spvDescriptorSet0.vp_c15)._m0[int(_2007)][_2009];
    bool _2013 = _1933 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2015 = _2013 || _1983;
    if (_1867)
    {
        float _2017 = fma(_1973, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1949 = _2017;
    }
    float _2019 = _1949;
    int _2021 = _1979 + 48;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    uint _2025 = uint(int(uint(int(_2023)) >> uint(2)));
    int _2027 = int(_2023) & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    int _2031 = int(_2023) + 1;
    uint _2033 = uint(int(uint(_2031) >> uint(2)));
    int _2035 = _2031 & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    float _2039 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1867)
    {
        float _2041 = _1939 * _2019;
        _1158 = _2041;
    }
    float _2043 = _1158;
    float _2045 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2039);
    float _2047 = _1993;
    if (_1867)
    {
        float _2049 = _1993 + (-1.0);
        _1941 = _2049;
    }
    float _2051 = _1941;
    int _2053 = _1979 + 64;
    uint _2055 = uint(int(uint(_2053) >> uint(2)));
    uint _2057 = uint(int(uint(int(_2055)) >> uint(2)));
    int _2059 = int(_2055) & 3;
    float _2061 = (*spvDescriptorSet0.vp_c15)._m0[int(_2057)][_2059];
    int _2063 = int(_2055) + 1;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    int _2067 = _2063 & 3;
    float _2069 = (*spvDescriptorSet0.vp_c15)._m0[int(_2065)][_2067];
    float _2071 = _2051;
    if (_1867)
    {
        float _2073 = _1823 * _2043;
        _1909 = _2073;
    }
    float _2075 = _1909;
    float _2077 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2045);
    if (_1867)
    {
        float _2079 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1160 = _2079;
    }
    float _2081 = _1160;
    if (!_1867)
    {
        _2071 = _1825;
    }
    float _2083 = _2071;
    float _2085 = _2083;
    if (_1867)
    {
        float _2087 = _1825 * _2043;
        _2085 = _2087;
    }
    float _2089 = _2085;
    if (_1867)
    {
        float _2091 = _2075 * _2075;
        _1911 = _2091;
    }
    float _2093 = _1911;
    if (_1867)
    {
        float _2095 = fma(_1927, _1993, _2081);
        _1957 = _2095;
    }
    float _2097 = _1957;
    int _2099 = _1979 + 104;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    uint _2103 = uint(int(uint(int(_2101)) >> uint(2)));
    int _2105 = int(_2101) & 3;
    float _2107 = (*spvDescriptorSet0.vp_c15)._m0[int(_2103)][_2105];
    int _2109 = int(_2101) + 1;
    uint _2111 = uint(int(uint(_2109) >> uint(2)));
    int _2113 = _2109 & 3;
    float _2115 = (*spvDescriptorSet0.vp_c15)._m0[int(_2111)][_2113];
    float _2117 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1867)
    {
        _2047 = _1829;
    }
    float _2119 = _2047;
    float _2121 = _2119;
    if (_1867)
    {
        float _2123 = _2089 * _2089;
        _2121 = _2123;
    }
    float _2125 = _2121;
    float _2127 = fma(_2097, _2097, _2093);
    if (!_2015)
    {
        float _2129 = floor(_1865);
        _1683 = _2129;
    }
    float _2131 = _1683;
    float _2133 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2135 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2137 = _1979 + 80;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    uint _2141 = uint(int(uint(int(_2139)) >> uint(2)));
    int _2143 = int(_2139) & 3;
    float _2145 = (*spvDescriptorSet0.vp_c15)._m0[int(_2141)][_2143];
    int _2147 = int(_2139) + 1;
    uint _2149 = uint(int(uint(_2147) >> uint(2)));
    int _2151 = _2147 & 3;
    float _2153 = (*spvDescriptorSet0.vp_c15)._m0[int(_2149)][_2151];
    float _2155 = -_1821;
    float _2157 = _1799 + _2155;
    float _2159 = _2127 + _2125;
    float _2161 = -_2135;
    float _2163 = fma(_2161, _2133, 1.0);
    int _2165 = as_type<int>(_2135);
    if (!_2015)
    {
        int _2167 = _1933 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2169 = _2167 + _1895;
        _2165 = _2169;
    }
    int _2171 = _2165;
    int _2173 = _1979 + 56;
    uint _2175 = uint(int(uint(_2173) >> uint(2)));
    uint _2177 = uint(int(uint(int(_2175)) >> uint(2)));
    int _2179 = int(_2175) & 3;
    float _2181 = (*spvDescriptorSet0.vp_c15)._m0[int(_2177)][_2179];
    int _2183 = int(_2175) + 1;
    uint _2185 = uint(int(uint(_2183) >> uint(2)));
    int _2187 = _2183 & 3;
    float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
    float _2191 = log2(_2163);
    int _2193 = _1979 + 88;
    uint _2195 = uint(int(uint(_2193) >> uint(2)));
    uint _2197 = uint(int(uint(int(_2195)) >> uint(2)));
    int _2199 = int(_2195) & 3;
    float _2201 = (*spvDescriptorSet0.vp_c15)._m0[int(_2197)][_2199];
    int _2203 = int(_2195) + 1;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    int _2207 = _2203 & 3;
    float _2209 = (*spvDescriptorSet0.vp_c15)._m0[int(_2205)][_2207];
    float _2211 = _1845 * _2011;
    float _2213 = fma(_1064, _2003, _2211);
    int _2215 = _1979 + 72;
    uint _2217 = uint(int(uint(_2215) >> uint(2)));
    uint _2219 = uint(int(uint(int(_2217)) >> uint(2)));
    int _2221 = int(_2217) & 3;
    float _2223 = (*spvDescriptorSet0.vp_c15)._m0[int(_2219)][_2221];
    int _2225 = int(_2217) + 1;
    uint _2227 = uint(int(uint(_2225) >> uint(2)));
    int _2229 = _2225 & 3;
    float _2231 = (*spvDescriptorSet0.vp_c15)._m0[int(_2227)][_2229];
    float _2233 = _1845 * _2037;
    float _2235 = _2191 * 0.693147182464599609375;
    float _2237 = rsqrt(_2159);
    float _2239 = fma(_1064, _2029, _2233);
    float _2241 = _1845 * _2069;
    float _2243 = _2069;
    int _2245 = as_type<int>(_2003);
    float _2247 = as_type<float>(_2171);
    if (!_2015)
    {
        float _2249 = -_2131;
        float _2251 = _1865 + _2249;
        _2243 = _2251;
    }
    float _2253 = _2243;
    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2257 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2255);
    float _2259 = precise::clamp(_2257, 0.0, 1.0);
    if (!_2015)
    {
        int _2261 = _2171 << 2;
        _1913 = _2261;
    }
    int _2263 = _1913;
    float _2265 = fma(_1064, _2061, _2241);
    float2 _6517 = float2(_1817, _2157);
    float _2267 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6517, float2(0.0), isnan(_6517)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6517, float2(0.0), isnan(_6517)), level(0.0)).x;
    float _2269 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    int _2271 = _2263;
    if (!_2015)
    {
        int _2273 = 12 & _2263;
        _2271 = _2273;
    }
    int _2275 = _2271;
    float _2277 = fma(_1050, _2107, _2213);
    float _2279 = _2237 * _2075;
    float _2281 = _2277 + _2115;
    float _2283 = _2237 * _2097;
    float _2285 = _2237 * _2089;
    float _2287 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2289 = _1845 * _2153;
    int _2291 = as_type<int>(_2153);
    if (!_2015)
    {
        uint _2293 = uint(int(uint(_2171) >> uint(2)));
        _2291 = int(_2293);
    }
    int _2295 = _2291;
    float _2297 = fma(_1064, _2145, _2289);
    float _2299 = -_2259;
    float _2301 = _2299 + 1.0;
    if (!_2015)
    {
        int _2303 = _2295 << 4;
        int _2305 = _2303 + _2275;
        _2245 = _2305;
    }
    int _2307 = _2245;
    float _2309 = fma(_1050, _2181, _2239);
    float _2311 = 1.0 / _2281;
    float _2313 = _2279;
    if (!_2015)
    {
        int _2315 = _2307 + 400;
        uint _2317 = uint(int(uint(_2315) >> uint(2)));
        uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
        int _2321 = int(_2317) & 3;
        float _2323 = (*spvDescriptorSet0.vp_c15)._m0[int(_2319)][_2321];
        _2313 = _2323;
    }
    float _2325 = _2313;
    float _2327 = _2309 + _2189;
    float _2329 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2331 = fma(_1050, _2201, _2297);
    float _2333 = -_2287;
    float _2335 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2333);
    float _2337 = abs(_2301);
    float _2339 = log2(_2337);
    float _2341 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2343 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2329);
    float _2345 = -_2285;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2335);
    float _2349 = _2331 + _2209;
    float _2351 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2341);
    float _2353 = fma(_1050, _2223, _2265);
    float _2355 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2343);
    float _2357 = _2327 * _2311;
    float _2359 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2351);
    float _2361 = _2353 + _2231;
    float _2363 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2365 = fma(_2347, -0.5, 0.5);
    bool _2367 = _2357 >= 0.0;
    float _2369 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2371 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2363);
    float _2373 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2375 = _2361 * _2311;
    bool _2377 = _2357 <= 1.0;
    bool _2379 = _2377 && _2367;
    float _2381 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2371);
    float _2383 = exp2(_2373);
    float _2385 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2387 = _2375 >= 0.0;
    bool _2389 = _2387 && _2379;
    float _2391 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2393 = fma(_2347, 0.5, 0.5);
    float _2395 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2397 = _2375 <= 1.0;
    bool _2399 = _2397 && _2389;
    float _2401 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2385);
    float _2403 = _2283 + 1.0;
    float _2405 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2407 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2401);
    float _2409 = sqrt(_2365);
    float _2411 = fma(_2393, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2413 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2407);
    float _2415 = -_2283;
    float _2417 = fma(_2383, _2403, _2415);
    float _2419 = fma(_2393, _2411, -0.212114393711090087890625);
    float _2421 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2423 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2405);
    float _2425 = 1.0 / _2413;
    if (_2399)
    {
        float _2427 = float(_1975);
        _1987 = _2427;
    }
    float _2429 = _1987;
    float _2431 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2421);
    float _2433 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2423);
    float _2435 = fma(_2393, _2419, 1.570728778839111328125);
    float _2437 = _2349 * _2311;
    float _2439 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2431);
    float _2441 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2433);
    float _2443 = _2423;
    float _2445 = _2437;
    if (_2399)
    {
        float _2447 = rint(_2429);
        float _2449 = precise::max(_2447, 0.0);
        uint _2451 = uint(_2449);
        uint _2453 = clamp(_2451, 0u, 65535u);
        _2443 = as_type<float>(_2453);
    }
    float _2455 = _2443;
    float _2457 = _2409 * 0.636619746685028076171875;
    float _2459 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2439);
    float _2461 = fma(_2417, 0.5, 0.5);
    float _2463 = -_2435;
    float _2465 = fma(_2457, _2463, 1.0);
    float _2467 = _2355;
    if (!_2015)
    {
        float _2469 = floor(_1863);
        _2467 = _2469;
    }
    float _2471 = _2467;
    float _2473 = _2441 * _2425;
    float _2475 = _2459 * _2425;
    float _2477 = fma(_2473, 0.5, 0.5);
    float _2479 = fma(_2475, -0.5, 0.5);
    float _2481 = _2455;
    if (_2399)
    {
        float3 _6891 = float3(_2357, _2375, float(as_type<int>(_2455)));
        float3 _6895 = select(_6891, float3(0.0), isnan(_6891));
        float _2483 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6895.xy, uint(rint(_6895.z)), _2437, level(0.0));
        _2481 = _2483;
    }
    float _2485 = _2481;
    float _2487 = _2311;
    if (!_2015)
    {
        float _2489 = rint(_2325);
        float _2491 = precise::max(_2489, 0.0);
        uint _2493 = uint(_2491);
        uint _2495 = clamp(_2493, 0u, 65535u);
        _2487 = as_type<float>(_2495);
    }
    float _2497 = _2487;
    float3 _6921 = float3(_2477, _2479, _2269);
    float _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6921, float3(0.0), isnan(_6921)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6921, float3(0.0), isnan(_6921)), level(0.0)).x;
    float _2501 = _2471;
    if (!_2015)
    {
        float _2503 = -_2471;
        float _2505 = _1863 + _2503;
        _2501 = _2505;
    }
    float _2507 = _2501;
    float3 _6942 = float3(_2477, _2479, _2269);
    float4 _2510 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6942, float3(0.0), isnan(_6942)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6942, float3(0.0), isnan(_6942)), level(0.0)).xyzw;
    float _2512 = _2510.x;
    float _2514 = _2510.y;
    float _2516 = _2510.z;
    float _2518 = _2510.w;
    float2 _6958 = float2(_2465, _2461);
    float3 _2520 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6958, float2(0.0), isnan(_6958)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6958, float2(0.0), isnan(_6958)), level(0.0)).xyz;
    float _2522 = _2520.x;
    float _2524 = _2520.y;
    float _2526 = _2520.z;
    float _2528 = _2497;
    if (!_2015)
    {
        float3 _6979 = float3(_2507, _2253, float(as_type<int>(_2497)));
        float3 _6981 = select(_6979, float3(0.0), isnan(_6979));
        float _2530 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6981.xy, uint(rint(_6981.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6981.xy, uint(rint(_6981.z)), level(0.0)).x;
        _2528 = _2530;
    }
    float _2532 = _2528;
    float _2534 = abs(_1875);
    float _2536 = log2(_2534);
    float _2538 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2540 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2538);
    float _2542 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2540);
    bool _2544 = _1875 <= 8000.0;
    bool _2546 = isnan(_1875);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(8000.0);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2542);
    float _2558 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2560 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2562 = exp2(_2558);
    out.gl_Position.x = _2441;
    out.gl_Position.y = _2459;
    out.gl_Position.z = _2556;
    out.gl_Position.w = _2413;
    float _2564 = exp2(_2560);
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2568 = precise::clamp(_2566, 0.0, 1.0);
    float _2570 = fma(_2568, -2.0, 3.0);
    float _2572 = _2568 * _2568;
    float _2574 = _2572 * _2570;
    float _2576 = _2556 + _2413;
    float _2578 = _2576 * 0.5;
    float _2580 = -_2574;
    float _2582 = _2580 + 1.0;
    out.m_103.z = _2578;
    out.m_103.w = _2413;
    float _2584 = fma(_2582, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2574);
    float _2586 = _2554 * _2584;
    float _2588 = _2584;
    float _2590 = _2556;
    float _2592 = _2441;
    if (!_2399)
    {
        _2588 = 1.0;
    }
    float _2594 = _2588;
    float _2596 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2598 = -_2562;
    float _2600 = _2598 + 1.0;
    float _2602 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2604 = _2600;
    float _2606 = _2594;
    if (_2015)
    {
        _2604 = 1.0;
    }
    float _2608 = _2604;
    float _2610 = -_2267;
    float _2612 = _2610 + 1.0;
    float _2614 = _2612 * _2596;
    float _2616 = precise::clamp(_2614, 0.0, 1.0);
    float _2618 = _2608;
    if (_2399)
    {
        bool _2620 = _2485 >= _2437;
        bool _2622 = isnan(_2485);
        bool _2624 = _2620 || _2622;
        bool _2626 = isnan(_2437);
        bool _2628 = _2624 || _2626;
        float _2630 = float(_2628);
        _2606 = _2630;
    }
    float _2632 = _2606;
    if (!_2015)
    {
        int _2634 = _2171 << 4;
        int _2636 = _2634 + 2048;
        uint _2638 = uint(int(uint(_2636) >> uint(2)));
        uint _2640 = uint(int(uint(int(_2638)) >> uint(2)));
        int _2642 = int(_2638) & 3;
        float _2644 = (*spvDescriptorSet0.vp_c15)._m0[int(_2640)][_2642];
        int _2646 = int(_2638) + 1;
        uint _2648 = uint(int(uint(_2646) >> uint(2)));
        int _2650 = _2646 & 3;
        float _2652 = (*spvDescriptorSet0.vp_c15)._m0[int(_2648)][_2650];
        int _2654 = _2636 + 8;
        uint _2656 = uint(int(uint(_2654) >> uint(2)));
        uint _2658 = uint(int(uint(int(_2656)) >> uint(2)));
        int _2660 = int(_2656) & 3;
        float _2662 = (*spvDescriptorSet0.vp_c15)._m0[int(_2658)][_2660];
        int _2664 = int(_2656) + 1;
        uint _2666 = uint(int(uint(_2664) >> uint(2)));
        int _2668 = _2664 & 3;
        float _2670 = (*spvDescriptorSet0.vp_c15)._m0[int(_2666)][_2668];
        float _2672 = _1845 * _2652;
        float _2674 = fma(_1064, _2644, _2672);
        float _2676 = fma(_1050, _2662, _2674);
        float _2678 = _2676 + _2670;
        float _2680 = precise::clamp(_2678, 0.0, 1.0);
        float _2682 = -_2680;
        float _2684 = _2682 + _2532;
        float _2686 = fma(_2684, 500.0, 1.5);
        float _2688 = exp2(_2686);
        float _2690 = 0.0 + _2688;
        float _2692 = precise::clamp(_2690, 0.0, 1.0);
        _2618 = _2692;
        _2590 = _2644;
        _2247 = as_type<float>(_2636);
        _2445 = _2688;
        _2592 = 500.0;
    }
    float _2694 = _2618;
    float _2696 = _2590;
    float _2698 = _2247;
    float _2700 = _2445;
    float _2702 = _2592;
    float _2704 = _2632 * _2694;
    float _2706 = _2602 * _2499;
    float _2708 = -_2616;
    float _2710 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_105.x = _1767;
    out.m_105.y = _1765;
    out.m_105.z = _1769;
    bool _2712 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2714 = isnan(_1837);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2720 = _2716 || _2718;
    float _2722 = _2518 * _2706;
    float _2724 = -_2704;
    float _2726 = fma(_2724, _2710, 1.0);
    float _2728 = precise::clamp(_2726, 0.0, 1.0);
    float _2730 = -_2602;
    float _2732 = _2730 + 1.0;
    float _2734 = _2526 * _2706;
    float _2736 = fma(_2522, _2722, _2512);
    float _2738 = fma(_2524, _2722, _2514);
    float _2740 = _2518 * _2732;
    float _2742 = _2728 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2744 = fma(_2518, _2734, _2516);
    out.m_107.x = _2742;
    float _2746 = _2700;
    float _2748 = _2696;
    float _2750 = _2702;
    float _2752 = _2732;
    float _2754 = _2698;
    float _2756 = _2728;
    if (!_2720)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2758 = _2746;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2720)
    {
        _2748 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2748;
    out.m_109.x = _2736;
    out.m_109.y = _2738;
    out.m_109.z = _2744;
    out.m_109.w = _2740;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2720)
    {
        _2750 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2770 = _2750;
    float _2772 = _2770;
    float _2774 = _2770;
    if (!_2720)
    {
        _2752 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2776 = _2752;
    float _2778 = _2776;
    float _2780 = _2776;
    if (!_2720)
    {
        _2754 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2782 = _2754;
    float _2784 = _2782;
    float _2786 = _2782;
    if (!_2720)
    {
        _2756 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2788 = _2756;
    bool _2790 = !_2720;
    float _2792 = _2788;
    float _2794 = _2788;
    if (!_2790)
    {
        bool _2796 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2798 = isnan(_1837);
        bool _2800 = _2796 || _2798;
        bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2804 = _2800 || _2802;
        if (!_2804)
        {
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2808 = _1837 + _2806;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2812 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2810;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2818 = 1.0 / _2812;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2836 = _2808 * _2818;
            float _2838 = precise::clamp(_2836, 0.0, 1.0);
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2844 = fma(_2838, _2816, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2846 = fma(_2838, _2842, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2848 = fma(_2838, _2822, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2850 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2852 = fma(_2838, _2830, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2854 = fma(_2838, _2834, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2768 = _2844;
            _2786 = _2852;
            _2762 = _2848;
            _2780 = _2850;
            _2774 = _2846;
            _2794 = _2854;
            _2856 = true;
        }
        else
        {
            bool _2858 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2860 = isnan(_1837);
            bool _2862 = _2858 || _2860;
            bool _2864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2866 = _2862 || _2864;
            if (!_2866)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2868 = _2760;
            _2762 = _2868;
            if (!_2866)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2870 = _2766;
            _2768 = _2870;
            if (!_2866)
            {
                _2772 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2872 = _2772;
            _2774 = _2872;
            if (!_2866)
            {
                _2778 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2874 = _2778;
            _2780 = _2874;
            if (!_2866)
            {
                _2784 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2876 = _2784;
            _2786 = _2876;
            if (!_2866)
            {
                _2792 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2878 = _2792;
            bool _2880 = !_2866;
            _2794 = _2878;
            if (!_2880)
            {
                bool _2882 = _1837 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2884 = isnan(_1837);
                bool _2886 = _2882 || _2884;
                bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2890 = _2886 || _2888;
                if (!_2890)
                {
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2894 = _1837 + _2892;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2898 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2896;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2904 = 1.0 / _2898;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2922 = _2894 * _2904;
                    float _2924 = precise::clamp(_2922, 0.0, 1.0);
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2930 = fma(_2924, _2902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2932 = fma(_2924, _2928, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2934 = fma(_2924, _2908, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2936 = fma(_2924, _2912, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2938 = fma(_2924, _2916, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2940 = fma(_2924, _2920, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2768 = _2930;
                    _2786 = _2938;
                    _2762 = _2934;
                    _2780 = _2936;
                    _2774 = _2932;
                    _2794 = _2940;
                    _2856 = true;
                }
                else
                {
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2786 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2780 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2774 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2794 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2856 = false;
    float _2942 = _2768;
    float _2944 = _2786;
    float _2946 = _2762;
    float _2948 = _2780;
    float _2950 = _2774;
    float _2952 = _2794;
    float _2954 = fma(_1667, -0.5, 0.5);
    float _2956 = precise::clamp(_2954, 0.0, 1.0);
    float _2958 = -_2942;
    float _2960 = _2958 + _2944;
    float _2962 = -_2946;
    float _2964 = _2962 + _2948;
    float _2966 = -_2950;
    float _2968 = _2966 + _2952;
    bool _2970 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2972 = fma(_2956, _2960, _2942);
    float _2974 = fma(_2956, _2964, _2946);
    float _2976 = fma(_2956, _2968, _2950);
    float _2978 = _2972 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2980 = fma(_2974, 0.298911988735198974609375, _2978);
    float _2982 = fma(_2976, 0.114477999508380889892578125, _2980);
    out.m_111.x = 0.0;
    float _2984 = -_2982;
    float _2986 = _2974 + _2984;
    float _2988 = -_2982;
    float _2990 = _2972 + _2988;
    float _2992 = -_2982;
    float _2994 = _2976 + _2992;
    float _2996 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2998 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3000 = fma(_2990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3002 = fma(_2994, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    out.m_107.w = _2996;
    out.m_113.x = _2998;
    out.m_113.y = _3000;
    out.m_113.z = _3002;
    if (!_2970)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3004 = -_1765;
    float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3008 = -_1767;
    float _3010 = _3008 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3012 = -_1769;
    float _3014 = _3012 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3016 = _3006 * _3006;
    float _3018 = fma(_3010, _3010, _3016);
    float _3020 = fma(_3014, _3014, _3018);
    float _3022 = sqrt(_3020);
    float _3024 = rsqrt(_3020);
    float _3026 = -_3022;
    float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3030 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3032 = precise::clamp(_3030, 0.0, 1.0);
    float _3034 = _3010 * _3024;
    float _3036 = _3006 * _3024;
    float _3038 = abs(_3032);
    float _3040 = log2(_3038);
    float _3042 = _3014 * _3024;
    float _3044 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3046 = _1667 * _3036;
    float _3048 = -_3036;
    float _3050 = -_3044;
    float _3052 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3050);
    float _3054 = fma(_1665, _3034, _3046);
    float _3056 = -_3042;
    float _3058 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3052);
    float _3060 = fma(_1669, _3042, _3054);
    float _3062 = precise::clamp(_3060, 0.0, 1.0);
    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3066 = _3058 + _3064;
    float _3068 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3070 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3072 = precise::clamp(_3070, 0.0, 1.0);
    float _3074 = exp2(_3068);
    float _3076 = _3074 * _3072;
    float _3078 = _3062 * _3076;
    float _3080 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3082 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3084 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _3080;
    out.m_111.y = _3082;
    out.m_111.z = _3084;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

