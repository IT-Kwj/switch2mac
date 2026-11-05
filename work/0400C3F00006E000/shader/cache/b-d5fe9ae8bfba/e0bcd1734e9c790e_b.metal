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
    float4 m_87 [[user(locn0)]];
    float4 m_89 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_113 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_97 [[user(locn5)]];
    float4 m_103 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_101 [[user(locn8)]];
    float4 m_105 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_111 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
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
    float4 m_91 [[attribute(11)]];
    float4 m_81 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3488 = false;
    bool _2363 = false;
    bool _500 = false;
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
        float _3773 = as_type<float>(_148);
        out.gl_Position.z = _3773;
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
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_63.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3843 = as_type<float>(_186);
        out.gl_Position.z = _3843;
    }
    if (_178)
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
    float _224 = _188 * _188;
    float _226 = _190 * _190;
    float _228 = _192 * _192;
    float _230 = fma(_196, _196, _224);
    float _232 = fma(_198, _198, _226);
    float _234 = fma(_200, _200, _228);
    float _236 = fma(_212, _212, _230);
    float _238 = fma(_214, _214, _232);
    float _240 = fma(_216, _216, _234);
    float _242 = sqrt(_236);
    float _244 = sqrt(_238);
    bool _246 = _242 > 0.0;
    float _248 = sqrt(_240);
    float _250 = _242;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _254 = _194;
    float _256 = _190;
    if (!_210)
    {
        float _258 = _194 * _194;
        float _260 = _258 * 0.5;
        _250 = _260;
    }
    float _262 = _250;
    float _264 = _262;
    if (!_210)
    {
        float _266 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _266;
    }
    float _268 = _264;
    bool _270 = _244 > 0.0;
    float _272 = 0.0;
    float _274 = _268;
    if (_246)
    {
        float _276 = rsqrt(_236);
        _272 = _276;
    }
    float _278 = _272;
    bool _280 = _248 > 0.0;
    float _282 = _248;
    if (!_210)
    {
        _282 = _194;
    }
    float _284 = _282;
    float _286 = 0.0;
    float _288 = _284;
    if (_270)
    {
        float _290 = rsqrt(_238);
        _286 = _290;
    }
    float _292 = _286;
    bool _294 = !_210;
    float _296 = _278;
    if (!_294)
    {
        float _298 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = log2(_298);
        float _302 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _304 = _302 + 1.0;
        float _306 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = _194 * _300;
        float _310 = 1.0 / _304;
        float _312 = _306 * 0.693147182464599609375;
        float _314 = exp2(_308);
        float _316 = 1.0 / _312;
        float _318 = _314 + (-1.0);
        float _320 = -_318;
        float _322 = fma(_320, _316, _194);
        float _324 = _322 * _310;
        float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _326;
    }
    float _328 = _274;
    bool _330 = !_210;
    if (!_330)
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
        _288 = _350;
        _252 = _338;
    }
    float _352 = _288;
    float _354 = _252;
    float _356 = in.m_73.w;
    float _358 = 0.0;
    float _360 = 0.0;
    float _362 = _354;
    if (!_246)
    {
        _358 = 0.0;
        _360 = 0.0;
    }
    float _364 = _358;
    float _366 = _360;
    float _368 = 0.0;
    float _370 = _364;
    float _372 = _366;
    if (!_246)
    {
        _368 = 0.0;
    }
    float _374 = _368;
    float _376 = _374;
    if (_246)
    {
        float _378 = _278 * _196;
        _370 = _378;
    }
    float _380 = _370;
    float _382 = in.m_60.x;
    float _384 = in.m_60.y;
    float _386 = in.m_60.z;
    if (_246)
    {
        float _388 = _278 * _188;
        _376 = _388;
    }
    float _390 = _376;
    if (_246)
    {
        float _392 = _278 * _212;
        _372 = _392;
    }
    float _394 = _372;
    float _396 = 0.0;
    if (_280)
    {
        float _398 = rsqrt(_240);
        _396 = _398;
    }
    float _400 = _396;
    bool _402 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _404 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _406 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _408 = _404;
    if (!_270)
    {
        _362 = 0.0;
    }
    float _410 = _362;
    float _412 = _410;
    if (_270)
    {
        float _414 = _292 * _198;
        _412 = _414;
    }
    float _416 = _412;
    float _418 = fma(_352, _218, _404);
    float _420 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _422 = fma(_352, _220, _406);
    float _424 = 0.0;
    if (!_280)
    {
        _424 = 0.0;
        _408 = 0.0;
    }
    float _426 = _424;
    float _428 = _408;
    float _430 = _426;
    float _432 = _428;
    if (!_270)
    {
        _254 = 0.0;
    }
    float _434 = _254;
    float _436 = fma(_352, _222, _420);
    float _438 = _434;
    if (!_270)
    {
        _296 = 0.0;
    }
    float _440 = _296;
    float _442 = _440;
    if (_270)
    {
        float _444 = _292 * _190;
        _438 = _444;
    }
    float _446 = _438;
    float _448 = 0.0;
    if (!_280)
    {
        _448 = 0.0;
    }
    float _450 = _448;
    float _452 = _450;
    if (_270)
    {
        float _454 = _292 * _214;
        _442 = _454;
    }
    float _456 = _442;
    if (_280)
    {
        float _458 = _400 * _200;
        _430 = _458;
    }
    float _460 = _430;
    if (_280)
    {
        float _462 = _400 * _192;
        _432 = _462;
    }
    float _464 = _432;
    if (_280)
    {
        float _466 = _400 * _216;
        _452 = _466;
    }
    float _468 = _452;
    float _470 = fma(_418, _356, _382);
    float _472 = fma(_422, _356, _384);
    float _474 = fma(_436, _356, _386);
    bool _476 = !_402;
    float _478 = _472;
    float _480 = _474;
    float _498;
    if (!_476)
    {
        float _482 = in.m_75.x;
        float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _486 = _482 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _488 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _490 = _488 * _484;
        float _492 = floor(_490);
        float _494 = -_492;
        float _496 = _490 + _494;
        _498 = _496;
        _500 = true;
    }
    else
    {
        float _502 = float(_132);
        float _504 = 1.0 / _502;
        float _506 = _166 * _504;
        _498 = _506;
    }
    _500 = false;
    float _508 = _498;
    float _510 = in.m_75.x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _514 = _508 + _512;
    float _516 = in.m_75.z;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _518;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _524 = _522 != 0;
    float _526 = in.m_75.y;
    float _528 = _472 * _198;
    float _530 = _472 * _214;
    float _532 = 1.0 / _520;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _536 = fma(_470, _212, _530);
    float _538 = fma(_470, _196, _528);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _542 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _544 = log2(_542);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _548 = fma(_474, _216, _536);
    float _550 = _510 * 2.0;
    float _552 = floor(_550);
    float _554 = _510 + _516;
    float _556 = _516 * 2.0;
    float _558 = _514 * _532;
    float _560 = _532;
    float _562 = _550;
    int _564 = as_type<int>(_516);
    if (!_524)
    {
        _560 = _516;
    }
    float _566 = _560;
    float _568 = _554 + (-1.0);
    float _570 = floor(_556);
    float _572 = _568;
    float _574 = _566;
    if (!_524)
    {
        _562 = _526;
    }
    float _576 = _562;
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _580 = _576;
    if (!_524)
    {
        _572 = _576;
    }
    float _582 = _572;
    float _584 = _582;
    if (_524)
    {
        _580 = _526;
    }
    float _586 = _580;
    bool _588 = _552 > 0.0;
    float _590 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _592 = int(_590);
    if (_524)
    {
        _584 = _510;
    }
    float _594 = _584;
    float _596 = _586 * 2.0;
    bool _598 = _552 >= 0.0;
    bool _600 = isnan(_552);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    if (_524)
    {
        _574 = _586;
    }
    float _608 = _574;
    float _610 = _594 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _612 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[83].z, _534);
    int _614 = _606 ? 0 : 1;
    float _616 = floor(_596);
    float _618 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[83].w, _540);
    float _620 = _608;
    if (!_524)
    {
        _620 = _516;
    }
    float _622 = _620;
    float _624 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _612);
    int _626 = ~_614;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _618);
    float _634 = _622;
    int _636 = _630;
    if (_524)
    {
        _634 = _586;
    }
    float _638 = _634;
    if (!_588)
    {
        int _640 = ~_614;
        int _642 = _640 + 1;
        _636 = _642;
    }
    int _644 = _636;
    bool _646 = _570 > 0.0;
    float _648 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _650 = int(_648);
    bool _652 = _570 >= 0.0;
    bool _654 = isnan(_570);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = _638 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _664 = _510 + _586;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _676 = _674 != 0;
    float _678 = fma(_662, -2.0, _546);
    float _680 = _544 * _166;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _684 = _660 ? 0 : 1;
    float _686 = _664 + (-1.0);
    bool _688 = !_672;
    int _690 = _688 ? 0 : 1;
    float _692 = -_682;
    float _694 = fma(_610, 2.0, _692);
    int _696 = ~_684;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _704 = abs(_690);
    float _706 = exp2(_680);
    int _708 = _700;
    if (!_646)
    {
        int _710 = ~_684;
        int _712 = _710 + 1;
        _708 = _712;
    }
    int _714 = _708;
    float _716 = _516 + _586;
    float _718 = float(_650);
    bool _720 = !_668;
    int _722 = _720 ? 0 : 1;
    float _724 = _716 + (-1.0);
    float _726 = 1.0 / _718;
    int _728 = abs(_722);
    float _730 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _732 = float(_704);
    float _734 = float(_644);
    bool _736 = _616 > 0.0;
    bool _738 = _616 >= 0.0;
    bool _740 = isnan(_616);
    bool _742 = _738 || _740;
    bool _744 = isnan(0.0);
    bool _746 = _742 || _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _750 = 1.0 + _748;
    float _752 = _732 * _734;
    bool _754 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _756 = isnan(1.0);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _762 = _758 || _760;
    float _764 = in.m_77.x;
    float _766 = in.m_77.y;
    float _768 = in.m_77.z;
    float _770 = 1.0 / _750;
    float _772 = float(_728);
    float _774 = -_706;
    float _776 = _774 + 1.0;
    float _778 = float(_714);
    float _780 = _726 * _166;
    bool _782 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = _752 * (-2.0);
    float _794 = float(_592);
    float _796 = _772 * _778;
    float _798 = _790 ? _776 : 0.0;
    float _800 = -_166;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[81].x, _694);
    float _804 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _678);
    float _806 = _794 * _166;
    int _808 = _746 ? 0 : 1;
    float _810 = fma(_730, _792, _730);
    bool _812 = !_676;
    int _814 = _812 ? 0 : 1;
    if (_762)
    {
        float _816 = _798 * _770;
        _168 = _816;
    }
    float _818 = _168;
    float _820 = _796 * (-2.0);
    int _822 = ~_808;
    int _824 = _822 + 1;
    int _826 = _824 + 1;
    int _828 = _826;
    if (!_736)
    {
        int _830 = ~_808;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    int _836 = abs(_814);
    float _838 = fma(_820, _764, _764);
    float _840 = fma(_792, _766, _766);
    float _842 = _586 + (-0.5);
    float _844 = _510 + (-0.5);
    float _846 = float(_834);
    float _848 = fma(_702, _820, _702);
    float _850 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[196].y, _840);
    float _852 = float(_836);
    float _854 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].x, _838);
    float _856 = fma(_810, _818, _850);
    float _858 = _852 * _846;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _860;
    float _864 = fma(_848, _818, _854);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _866;
    float _870 = _858 * (-2.0);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _872;
    bool _876 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _878 = isnan(_508);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = fma(_862, _558, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _890 = fma(_868, _558, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _892 = fma(_874, _558, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _894 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _896 = isnan(_508);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = _856 * 0.15915493667125701904296875;
    float _908 = in.m_73.x;
    float _910 = in.m_73.y;
    float _912 = in.m_73.z;
    float _914 = fma(_870, _768, _768);
    float _916 = _516 + (-0.5);
    float _918 = _864 * 0.15915493667125701904296875;
    float _920 = -_886;
    float _922 = _920 + 1.0;
    float _924 = in.m_79.x;
    float _926 = in.m_79.y;
    float _928 = in.m_79.z;
    float _930 = fma(_578, _870, _578);
    float _932 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[196].z, _914);
    float _934 = _904 * _922;
    float _936 = -_904;
    float _938 = _936 + 1.0;
    float _940 = _918 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = fma(_930, _818, _932);
    float _946 = _888 * _934;
    float _948 = _890 * _934;
    float _950 = _892 * _934;
    float _952 = _944 * 0.15915493667125701904296875;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[143].x, _946);
    float _956 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[143].y, _948);
    float _958 = _918 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[143].z, _950);
    float _964 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[144].x, _954);
    float _966 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[144].y, _956);
    float _968 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[144].z, _962);
    float _970 = _964 * _908;
    float _972 = _966 * _910;
    float _974 = _906 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = _968 * _912;
    float _980 = _970 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _926);
    float _984 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _924);
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _928);
    float _990 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _992 = _906 * 6.283185482025146484375;
    float _994 = cos(_992);
    float _996 = fma(_474, _200, _538);
    float _998 = _982 * _984;
    float _1000 = in.m_69.w;
    float _1002 = _986 * _980;
    float _1004 = _988 * _990;
    float _1006 = _952 * 6.283185482025146484375;
    float _1008 = cos(_1006);
    float _1010 = in.m_71.w;
    float _1012 = _942 * _976;
    float _1014 = _960 * _976;
    float _1016 = _952 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _960 * _994;
    float _1022 = _942 * _994;
    float _1024 = _960 * _1008;
    float _1026 = _994 * _1008;
    float _1028 = _942 * _1008;
    float _1030 = _976 * _1008;
    float _1032 = _1024 * _998;
    float _1034 = _996 + _1000;
    float _1036 = _1028 * _998;
    float _1038 = fma(_1018, _1020, _1012);
    float _1040 = -_998;
    float _1042 = _1018 * _1040;
    float _1044 = -_1022;
    float _1046 = fma(_1018, _1014, _1044);
    float _1048 = -_1014;
    float _1050 = fma(_1018, _1022, _1048);
    float _1052 = fma(_1038, _1002, _1032);
    float _1054 = fma(_1026, _1002, _1042);
    float _1056 = fma(_1018, _1012, _1020);
    float _1058 = fma(_1050, _1002, _1036);
    float _1060 = fma(_1046, _1004, _1052);
    float _1062 = fma(_1030, _1004, _1054);
    float _1064 = _548 + _1010;
    float _1066 = fma(_1056, _1004, _1058);
    float _1068 = _1060 * _416;
    float _1070 = _1060 * _456;
    float _1072 = _1060 * _446;
    float _1074 = fma(_1062, _380, _1068);
    float _1076 = fma(_1062, _394, _1070);
    float _1078 = fma(_1062, _390, _1072);
    float _1080 = in.m_67.w;
    float _1082 = fma(_1066, _460, _1074);
    float _1084 = fma(_1066, _468, _1076);
    float _1086 = fma(_1066, _464, _1078);
    float _1088 = _1034 + _1082;
    float _1090 = _1064 + _1084;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1094 = _1088 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1098 = _1090 + _1096;
    float _1100 = _1094 * _1094;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _472 * _190;
    float _1116 = fma(_470, _188, _1114);
    float _1118 = fma(_474, _192, _1116);
    float _1120 = _1058;
    float _1122 = _1066;
    float _1124 = _1088;
    float _1126 = _1090;
    float _1128 = _1100;
    float _1130 = _1102;
    if (_1108)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1132;
    }
    float _1134 = _1120;
    float _1136 = _1118 + _1080;
    if (_1108)
    {
        float _1138 = rsqrt(_1104);
        _1122 = _1138;
    }
    float _1140 = _1122;
    float _1142 = _1134;
    if (_1108)
    {
        float _1144 = _1112 * _1134;
        _1142 = _1144;
    }
    float _1146 = _1142;
    if (_1108)
    {
        float _1148 = _1146 * 0.15915493667125701904296875;
        _478 = _1148;
    }
    float _1150 = _478;
    float _1152 = _1136 + _1086;
    float _1154 = _188;
    float _1156 = _1152;
    float _1158 = _1150;
    if (_1108)
    {
        float _1160 = _1150 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        _1154 = _1162;
    }
    float _1164 = _1154;
    if (_1108)
    {
        float _1166 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _256 = _1166;
    }
    float _1168 = _256;
    float _1170 = _1168;
    if (_1108)
    {
        float _1172 = fma(_1164, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1170 = _1172;
    }
    float _1174 = _1170;
    float _1176 = _1174;
    if (_1108)
    {
        float _1178 = _1140 * _1174;
        _1176 = _1178;
    }
    float _1180 = _1176;
    if (_1108)
    {
        float _1182 = fma(_1094, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1124 = _1182;
    }
    float _1184 = _1124;
    if (_1108)
    {
        float _1186 = fma(_1098, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1126 = _1186;
    }
    float _1188 = _1126;
    float _1190 = fma(_1184, 6.2500002968590706586837768554688e-05, 0.5);
    float _1192 = fma(_1188, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5322 = float2(_1190, _1192);
    float3 _1196 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5322, float2(0.0), isnan(_5322)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5322, float2(0.0), isnan(_5322)), level(0.0)).xyz;
    float _1198 = _1196.x;
    float _1200 = _1196.y;
    float _1202 = _1196.z;
    float _1204 = float(uint(_592));
    float _1206 = trunc(_780);
    int _1208 = int(_1206);
    int _1210 = ~_592;
    int _1212 = _1210 + 1;
    int _1214 = ~_592;
    int _1216 = _1214 + 1;
    bool _1218 = _592 == 0;
    float _1220 = 1.0 / _1204;
    bool _1222 = !_524;
    float _1224 = _1222 ? _586 : _510;
    int _1226 = ~_592;
    int _1228 = _1226 + 1;
    float _1230 = float(uint(_1208));
    int _1232 = as_type<int>(_1220) + (-2);
    float _1234 = as_type<float>(_1232) * _1230;
    bool _1236 = !_524;
    float _1238 = _1236 ? 1.2345600128173828125 : 1.0;
    float _1240 = trunc(_1234);
    float _1242 = precise::max(_1240, 0.0);
    uint _1245 = uint(_1242);
    float _1247 = _1238 * _1224;
    float _1249 = floor(_1247);
    int _1251 = _1212 * int(_1245);
    int _1253 = _1251 + _1208;
    float _1255 = float(uint(_1253));
    float _1257 = as_type<float>(_1232) * _1255;
    float _1259 = trunc(_1257);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    int _1265 = int(_1245) + int(_1263);
    float _1267 = float(_1208);
    int _1269 = _1216 * _1265;
    int _1271 = _1269 + _1208;
    bool _1273 = _1267 >= _794;
    bool _1275 = isnan(_1267);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan(_794);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = -_1249;
    float _1287 = _1247 + _1285;
    float _1289 = float(_132);
    bool _1291 = uint(_1271) >= uint(_592);
    float _1293 = _794 * _1287;
    float _1295 = trunc(_1283);
    int _1297 = int(_1295);
    int _1299 = _592 + (-1);
    bool _1301 = !_1291;
    int _1303 = _1301 ? 0 : (-1);
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1307 = _1305 != 0;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1311 = _1309 != 0;
    int _1313 = ~_1265;
    int _1315 = _1313 + _1303;
    int _1317 = _1315 + 1;
    float _1319 = 1.0 / _1289;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1323 = _1321 != 0;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1327 = _1325 != 0;
    int _1329 = _592 * _1317;
    int _1331 = _1329 + _1208;
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1335 = _1333 != 0;
    float _1337 = in.m_81.x;
    int _1339 = ~_1297;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    float _1345 = trunc(_1293);
    int _1347 = int(_1345);
    bool _1349 = !_1218;
    int _1351 = _1349 ? _1331 : (-1);
    int _1353 = _1343 * _1351;
    float _1355 = _806 * _1319;
    bool _1357 = !_1311;
    int _1359 = _1357 ? 0 : 1;
    bool _1361 = !_1307;
    int _1363 = _1361 ? 0 : 1;
    float _1365 = trunc(_1355);
    int _1367 = int(_1365);
    int _1369 = abs(_1359);
    int _1371 = _1297 * _1299;
    int _1373 = _1371 + _1353;
    bool _1375 = !_1335;
    int _1377 = _1375 ? 0 : 1;
    bool _1379 = !_1323;
    int _1381 = _1379 ? 0 : 1;
    int _1383 = abs(_1363);
    int _1385 = abs(_1377);
    int _1387 = abs(_1381);
    int _1389 = _1373 * _1369;
    int _1391 = _1347 * _1385;
    int _1393 = _1391 + _1208;
    bool _1395 = !_1327;
    int _1397 = _1395 ? 0 : 1;
    int _1399 = _1367 * _1383;
    int _1401 = _1399 + _1389;
    int _1403 = abs(_1397);
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1407 = _1405 != 0;
    int _1409 = _1393 * _1387;
    int _1411 = _1409 + _1401;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1415 = _1413 != 0;
    float _1417 = float(uint(_1393));
    int _1419 = _1347 * _1403;
    int _1421 = _1419 + _1411;
    int _1423 = ~_592;
    int _1425 = _1423 + 1;
    float _1427 = as_type<float>(_1232) * _1417;
    float _1429 = float(uint(_1421));
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1433 = _1335;
    float _1435 = as_type<float>(_1228);
    float _1437 = _1188;
    if (_1407)
    {
        bool _1439 = _516 > 0.5;
        _1433 = _1439;
    }
    bool _1441 = _1433;
    float _1443 = as_type<float>(_1232) * _1429;
    float _1445 = _1337;
    if (_1415)
    {
        float _1447 = -_1337;
        float _1449 = _1447 + 1.0;
        _564 = as_type<int>(_1449);
    }
    int _1451 = _564;
    if (!_1415)
    {
        _480 = _1337;
    }
    float _1453 = _480;
    float _1455 = trunc(_1427);
    float _1457 = precise::max(_1455, 0.0);
    uint _1459 = uint(_1457);
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1463 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = trunc(_1443);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    int _1471 = ~_592;
    int _1473 = _1471 + 1;
    int _1475 = _1425 * int(_1469);
    int _1477 = _1475 + _1421;
    float _1479 = float(uint(_1477));
    float _1481 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1483 = as_type<float>(_1232) * _1479;
    float _1485 = _1481 * _510;
    float _1487 = in.m_75.w;
    float _1489 = trunc(_1483);
    float _1491 = precise::max(_1489, 0.0);
    uint _1493 = uint(_1491);
    float _1495 = trunc(_1485);
    int _1497 = int(_1495);
    int _1499 = int(_1469) + int(_1493);
    int _1501 = _1473 * _1499;
    int _1503 = _1501 + _1421;
    bool _1505 = _1487 > 0.5;
    bool _1507 = uint(_1503) >= uint(_592);
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    bool _1509 = !_1507;
    int _1511 = _1509 ? 0 : (-1);
    float _1513 = in.m_81.y;
    bool _1515 = _1507;
    int _1517 = _1499;
    float _1519 = _1453;
    float _1521 = _1461;
    if (_1415)
    {
        bool _1523 = _510 > 0.5;
        _1515 = _1523;
    }
    bool _1525 = _1515;
    int _1527 = ~_1499;
    int _1529 = _1527 + _1511;
    int _1531 = _1529 + 1;
    if (_1407)
    {
        float _1533 = -_1337;
        float _1535 = _1533 + 1.0;
        _1517 = as_type<int>(_1535);
    }
    int _1537 = _1517;
    if (_1415)
    {
        float _1539 = _1525 ? as_type<float>(_1451) : _1337;
        _1519 = _1539;
    }
    float _1541 = _1519;
    int _1543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1545 = _1543 != 0;
    int _1547 = _592 * _1531;
    int _1549 = _1547 + _1421;
    int _1551 = _1497 << 4;
    int _1553 = _1551 + 1968;
    float _1555 = in.m_85.x;
    float _1557 = in.m_85.y;
    float _1559 = in.m_85.z;
    if (_1407)
    {
        float _1561 = _1441 ? as_type<float>(_1537) : _1337;
        _1445 = _1561;
    }
    float _1563 = _1445;
    uint _1565 = uint(int(uint(_1553) >> uint(2)));
    uint _1567 = uint(int(uint(int(_1565)) >> uint(2)));
    int _1569 = int(_1565) & 3;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[int(_1567)][_1569];
    int _1573 = int(_1565) + 1;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    int _1577 = _1573 & 3;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[int(_1575)][_1577];
    bool _1581 = !_1218;
    int _1583 = _1581 ? _1549 : (-1);
    bool _1585 = _926 != 0.0;
    bool _1587 = isnan(_926);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.0);
    bool _1593 = _1589 || _1591;
    int _1595 = _1583 >> 31;
    bool _1597 = _924 == 0.0;
    bool _1599 = !_1593;
    bool _1601 = _1597 && _1599;
    int _1603 = _1553 + 8;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = _1595 & 3;
    bool _1615 = _928 == 0.0;
    bool _1617 = _1615 && _1601;
    float _1619 = -_1513;
    float _1621 = _1619 + 1.0;
    int _1623 = _1583 + _1613;
    int _1625 = _1228 * int(_1459);
    int _1627 = _1625 + _1393;
    int _1629 = _1623 >> 2;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1633 = _1629 << 4;
    int _1635 = _1633 + 512;
    float _1637 = float(uint(_1627));
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    uint _1641 = uint(int(uint(_1635) >> uint(2)));
    uint _1643 = uint(int(uint(int(_1641)) >> uint(2)));
    int _1645 = int(_1641) & 3;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[int(_1643)][_1645];
    int _1649 = int(_1641) + 1;
    uint _1651 = uint(int(uint(_1649) >> uint(2)));
    int _1653 = _1649 & 3;
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[int(_1651)][_1653];
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1659 = _1657 != 0;
    float _1661 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1665 = _1663 != 0;
    float _1667 = as_type<float>(_1232) * _1637;
    int _1669 = _1505 ? as_type<int>(_1621) : as_type<int>(_1513);
    float _1671 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1673 = _586 > 0.5;
    float _1675 = _1665 ? as_type<float>(_1669) : _1513;
    float _1677 = trunc(_1667);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    float _1683 = _1513;
    float _1685 = _1621;
    float _1687 = _1637;
    if (_1545)
    {
        float _1689 = _1673 ? _1621 : _1513;
        _1683 = _1689;
    }
    float _1691 = _1683;
    out.m_87.x = _1661;
    out.m_87.y = _1671;
    out.m_87.z = _1463;
    out.m_87.w = _1461;
    if (_1617)
    {
        _1435 = _1555;
    }
    float _1693 = _1435;
    float _1695 = _1693;
    if (_1617)
    {
        _1685 = _1557;
    }
    float _1697 = _1685;
    float _1699 = _1697;
    if (_1617)
    {
        _1687 = _1693;
    }
    float _1701 = _1687;
    int _1703 = _1583 & 3;
    bool _1705 = _1703 != 0;
    float _1707 = _1701;
    if (!_1617)
    {
        _1695 = _1555;
    }
    float _1709 = _1695;
    bool _1711 = uint(_1703) > 1u;
    int _1713 = _1705 ? 0 : 1;
    float _1715 = _1579 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1717 = _1571;
    if (_1617)
    {
        _1521 = _1697;
    }
    float _1719 = _1521;
    float _1721 = _1571 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1723 = _1719;
    if (!_1617)
    {
        _1699 = _1557;
    }
    float _1725 = _1699;
    if (!_1617)
    {
        float _1727 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1709);
        _1707 = _1727;
    }
    float _1729 = _1707;
    int _1731 = _1635 + 8;
    uint _1733 = uint(int(uint(_1731) >> uint(2)));
    uint _1735 = uint(int(uint(int(_1733)) >> uint(2)));
    int _1737 = int(_1733) & 3;
    float _1739 = (*spvDescriptorSet0.vp_c9)._m0[int(_1735)][_1737];
    int _1741 = int(_1733) + 1;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    int _1745 = _1741 & 3;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[int(_1743)][_1745];
    int _1749 = ~_592;
    int _1751 = _1749 + 1;
    float _1753 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1755 = int(_1459) + int(_1681);
    float _1757 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1759 = ~_1713;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    float _1765 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1767 = _1763;
    if (!_1711)
    {
        int _1769 = ~_1713;
        int _1771 = _1769 + 1;
        _1767 = _1771;
    }
    int _1773 = _1767;
    int _1775 = _1751 * _1755;
    int _1777 = _1775 + _1393;
    bool _1779 = _1703 != 3;
    float _1781 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1783 = int(_1781);
    int _1785 = abs(_1773);
    float _1787 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1617)
    {
        _1717 = _1559;
    }
    float _1789 = _1717;
    float _1791 = _1789;
    if (!_1617)
    {
        float _1793 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1559);
        _1791 = _1793;
    }
    float _1795 = _1791;
    bool _1797 = uint(_1703) >= 2u;
    if (!_1617)
    {
        float _1799 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1725);
        _1723 = _1799;
    }
    float _1801 = _1723;
    bool _1803 = uint(_1777) >= uint(_592);
    out.m_89.x = _1757;
    out.m_89.y = _1765;
    out.m_89.z = _1787;
    int _1805 = _1797 ? 0 : 1;
    int _1807 = _1583 & 3;
    bool _1809 = _1807 != 0;
    int _1811 = ~_1785;
    int _1813 = _1811 + 1;
    int _1815 = _1813 + 1;
    bool _1817 = _1703 != 3;
    float _1819 = float(uint(_1783));
    bool _1821 = !_1803;
    int _1823 = _1821 ? 0 : (-1);
    int _1825 = ~_1805;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    int _1831 = ~_1755;
    int _1833 = _1831 + _1823;
    int _1835 = _1833 + 1;
    int _1837 = _1815 * as_type<int>(_1655);
    bool _1839 = !_1809;
    int _1841 = _1839 ? 0 : 1;
    int _1843 = _1829;
    if (_1779)
    {
        int _1845 = ~_1805;
        int _1847 = _1845 + 1;
        _1843 = _1847;
    }
    int _1849 = _1843;
    float _1851 = in.m_91.x;
    float _1853 = in.m_91.y;
    float _1855 = in.m_91.z;
    float _1857 = in.m_91.w;
    int _1859 = abs(_1841);
    bool _1861 = !_1817;
    int _1863 = _1861 ? 0 : (-1);
    int _1865 = abs(_1783);
    int _1867 = abs(_1849);
    int _1869 = abs(_1863);
    float _1871 = 1.0 / _1819;
    int _1873 = ~_1859;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    bool _1879 = !_1659;
    int _1881 = _1879 ? 0 : 1;
    int _1883 = _1877 * as_type<int>(_1647);
    int _1885 = _1883 + _1837;
    int _1887 = ~_1867;
    int _1889 = _1887 + 1;
    int _1891 = _1889 + 1;
    int _1893 = abs(_1881);
    int _1895 = ~_1869;
    int _1897 = _1895 + 1;
    int _1899 = _1897 + 1;
    int _1901 = _1891 * as_type<int>(_1739);
    int _1903 = _1901 + _1885;
    int _1905 = _592 * _1835;
    int _1907 = _1905 + _1393;
    float _1909 = float(uint(_1865));
    int _1911 = _1899 * as_type<int>(_1747);
    int _1913 = _1911 + _1903;
    int _1915 = ~_1893;
    int _1917 = _1915 + 1;
    int _1919 = _1917 + 1;
    float _1921 = _1853 * _1559;
    float _1923 = 1.0 / _1909;
    bool _1925 = !_1218;
    int _1927 = _1925 ? _1907 : (-1);
    float _1929 = _1851 * _1725;
    int _1931 = _1919 * _1913;
    float _1933 = _1855 * _1709;
    float _1935 = -_1921;
    float _1937 = fma(_1855, _1725, _1935);
    float _1939 = -_1929;
    float _1941 = fma(_1853, _1709, _1939);
    int _1943 = _1927 * _1893;
    int _1945 = _1943 + _1931;
    float _1947 = -_1933;
    float _1949 = fma(_1851, _1559, _1947);
    float _1951 = _1937 * _1857;
    float _1953 = _1941 * _1857;
    int _1955 = as_type<int>(_1871) + (-2);
    float _1957 = _1949 * _1857;
    float _1959 = float(uint(_1945));
    float _1961 = -_1801;
    float _1963 = _1018 * _1961;
    int _1965 = abs(_1945);
    float _1967 = -_1853;
    float _1969 = _1018 * _1967;
    int _1971 = as_type<int>(_1923) + (-2);
    float _1973 = as_type<float>(_1955) * _1959;
    float _1975 = float(uint(_1965));
    float _1977 = -_1957;
    float _1979 = _1018 * _1977;
    float _1981 = fma(_1026, _1729, _1963);
    int _1983 = ~_1783;
    int _1985 = _1983 + 1;
    float _1987 = fma(_1026, _1851, _1969);
    float _1989 = trunc(_1973);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = as_type<float>(_1971) * _1975;
    float _1997 = _1024 * _1801;
    float _1999 = fma(_1026, _1951, _1979);
    float _2001 = _1024 * _1853;
    float _2003 = _1028 * _1853;
    float _2005 = _1028 * _1801;
    float _2007 = _1024 * _1957;
    float _2009 = trunc(_1995);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    float _2015 = fma(_1038, _1729, _1997);
    int _2017 = ~_1865;
    int _2019 = _2017 + 1;
    float _2021 = _1028 * _1957;
    float _2023 = fma(_1038, _1851, _2001);
    float _2025 = fma(_1038, _1951, _2007);
    int _2027 = _1985 * int(_1993);
    int _2029 = _2027 + _1945;
    float _2031 = fma(_1050, _1951, _2021);
    float _2033 = fma(_1050, _1729, _2005);
    float _2035 = fma(_1050, _1851, _2003);
    float _2037 = fma(_1030, _1855, _1987);
    float _2039 = float(uint(_2029));
    float _2041 = fma(_1046, _1855, _2023);
    float _2043 = fma(_1056, _1855, _2035);
    int _2045 = _2019 * int(_2013);
    int _2047 = _2045 + _1965;
    float _2049 = fma(_1046, _1953, _2025);
    float _2051 = as_type<float>(_1955) * _2039;
    float _2053 = fma(_1046, _1795, _2015);
    float _2055 = fma(_1030, _1795, _1981);
    float _2057 = float(uint(_2047));
    float _2059 = trunc(_2051);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = ~_1783;
    int _2067 = _2065 + 1;
    float _2069 = fma(_1056, _1795, _2033);
    float _2071 = fma(_1056, _1953, _2031);
    float _2073 = as_type<float>(_1971) * _2057;
    float _2075 = _2041 * _446;
    float _2077 = fma(_1030, _1953, _1999);
    float _2079 = _2049 * _416;
    float _2081 = _2031;
    float _2083 = as_type<float>(_1965);
    float _2085 = _2055;
    float _2087 = _2071;
    float _2089 = _2077;
    if (_1108)
    {
        float _2091 = _1150 * 6.283185482025146484375;
        float _2093 = cos(_2091);
        _2081 = _2093;
    }
    float _2095 = _2081;
    float _2097 = _2053 * _446;
    float _2099 = _2049 * _446;
    float _2101 = _2041 * _456;
    float _2103 = _2053 * _456;
    float _2105 = _2049 * _456;
    float _2107 = _2041 * _416;
    float _2109 = trunc(_2073);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = int(_1993) + int(_2063);
    float _2117 = _2053 * _416;
    int _2119 = ~_1865;
    int _2121 = _2119 + 1;
    float _2123 = fma(_2037, _380, _2107);
    float _2125 = fma(_2037, _394, _2101);
    int _2127 = _2067 * _2115;
    int _2129 = _2127 + _1945;
    float _2131 = fma(_2055, _380, _2117);
    float _2133 = fma(_2077, _380, _2079);
    float _2135 = fma(_2055, _390, _2097);
    bool _2137 = uint(_2129) >= uint(_1783);
    float _2139 = fma(_2055, _394, _2103);
    float _2141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2143 = _2103;
    float _2145 = as_type<float>(_2121);
    if (_1108)
    {
        float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2149 = _1184 + _2147;
        _2143 = _2149;
    }
    float _2151 = _2143;
    bool _2153 = !_2137;
    int _2155 = _2153 ? 0 : (-1);
    float _2157 = fma(_2037, _390, _2075);
    int _2159 = int(_2013) + int(_2113);
    float _2161 = as_type<float>(_2113);
    if (_1108)
    {
        float _2163 = _2151 * _2151;
        _1128 = _2163;
    }
    float _2165 = _1128;
    int _2167 = ~_2115;
    int _2169 = _2167 + _2155;
    int _2171 = _2169 + 1;
    float _2173 = fma(_2043, _464, _2157);
    int _2175 = _1945 ^ _1783;
    int _2177 = _2121 * _2159;
    int _2179 = _2177 + _1965;
    float _2181 = as_type<float>(_2179);
    if (_1108)
    {
        float _2183 = _2095 + (-1.0);
        _2083 = _2183;
    }
    float _2185 = _2083;
    int _2187 = _1783 * _2171;
    int _2189 = _2187 + _1945;
    uint _2191 = uint(int(uint(_2175) >> uint(31)));
    float _2193 = fma(_2043, _468, _2125);
    if (_1108)
    {
        float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2085 = _2195;
    }
    float _2197 = _2085;
    bool _2199 = uint(_2179) >= uint(_1865);
    float _2201 = fma(_2077, _390, _2099);
    int _2203 = ~int(_2191);
    int _2205 = _2203 + 1;
    float _2207 = _2201;
    if (_1108)
    {
        float _2209 = fma(_1152, _2095, _2197);
        _1156 = _2209;
    }
    float _2211 = _1156;
    bool _2213 = !_2199;
    int _2215 = _2213 ? 0 : (-1);
    float _2217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2219 = _1783 == 0;
    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2223 = _2211 + _2221;
    int _2225 = ~_2215;
    int _2227 = _2159 + _2225;
    int _2229 = _2227 + 1;
    if (_1108)
    {
        float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2233 = _1188 + _2231;
        _2181 = _2233;
    }
    float _2235 = _2181;
    bool _2237 = _1783 == 0;
    float _2239 = fma(_2077, _394, _2105);
    int _2241 = _2229 ^ _2205;
    float _2243 = fma(_2223, _2223, _2165);
    bool _2245 = !_2219;
    int _2247 = _2245 ? _2189 : (-1);
    float _2249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2251 = ~_2205;
    int _2253 = _2251 + _2241;
    int _2255 = _2253 + 1;
    if (_1108)
    {
        float _2257 = _2235 * _2235;
        _1130 = _2257;
    }
    float _2259 = _1130;
    float _2261 = _2141 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2263 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2265 = !_2237;
    int _2267 = _2265 ? _2255 : (-1);
    float _2269 = _2243 + _2259;
    float _2271 = float(_2247);
    float _2273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2275 = float(_2267);
    float _2277 = _2217 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2279 = fma(_2261, _1563, -0.5);
    float _2281 = fma(_2261, _2271, _802);
    float _2283 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2285 = fma(_2277, _1675, -0.5);
    float _2287 = -_804;
    float _2289 = fma(_2277, _2275, _2287);
    float _2291 = sqrt(_2269);
    float _2293 = fma(_624, _2279, _2281);
    float _2295 = _2283 * _2249;
    float _2297 = fma(_632, _2285, _2289);
    float _2299 = fma(_2069, _460, _2131);
    float _2301 = fma(_2071, _460, _2133);
    float _2303 = fma(_2071, _464, _2201);
    float _2305 = fma(_2071, _468, _2239);
    float _2307 = _2263 * _2273;
    float _2309 = fma(_2043, _460, _2123);
    float _2311 = _2293 + 0.5;
    float _2313 = _2297 + 0.5;
    float _2315 = fma(_2069, _464, _2135);
    float _2317 = fma(_2069, _468, _2139);
    out.m_93.x = _2309;
    out.m_93.y = _2173;
    out.m_93.z = _2193;
    bool _2319 = _2291 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2321 = isnan(_2291);
    bool _2323 = _2319 || _2321;
    bool _2325 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2327 = _2323 || _2325;
    out.m_95.x = _2301;
    out.m_95.y = _2303;
    out.m_95.z = _2305;
    out.m_97.x = _2295;
    out.m_97.y = _2307;
    out.m_97.z = _2311;
    out.m_97.w = _2313;
    out.m_99.x = _1198;
    out.m_99.y = _1200;
    out.m_99.z = _1202;
    if (!_2327)
    {
        _2207 = 1.0;
    }
    float _2329 = _2207;
    out.m_101.x = _2299;
    out.m_101.y = _2315;
    out.m_101.z = _2317;
    bool _2331 = !_2327;
    float _2333 = _2329;
    if (!_2331)
    {
        bool _2335 = _2291 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2337 = isnan(_2291);
        bool _2339 = _2335 || _2337;
        bool _2341 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2343 = _2339 || _2341;
        if (!_2343)
        {
            float _2345 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2347 = _2291 + _2345;
            float _2349 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2351 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2349;
            float _2353 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2357 = 1.0 / _2351;
            float _2359 = _2347 * _2357;
            float _2361 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2333 = _2361;
            _2363 = true;
        }
        else
        {
            bool _2365 = _2291 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2367 = isnan(_2291);
            bool _2369 = _2365 || _2367;
            bool _2371 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2373 = _2369 || _2371;
            if (!_2373)
            {
                float _2375 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2377 = _2291 + _2375;
                float _2379 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2381 = _2379 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2383 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2385 = _2383 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2387 = 1.0 / _2381;
                float _2389 = _2377 * _2387;
                float _2391 = fma(_2389, _2385, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2333 = _2391;
                _2363 = true;
            }
            else
            {
                _2333 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2363 = false;
    float _2393 = _2333;
    float _2395 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2397 = _2211 + _2395;
    float _2399 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2401 = _1184 + _2399;
    float _2403 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2405 = _1188 + _2403;
    float _2407 = fma(_2397, _2393, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2409 = fma(_2401, _2393, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2411 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2415 = _2407 + _2413;
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2419 = _2409 + _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2423 = _2411 + _2421;
    float _2425 = _2415 * _2415;
    float _2427 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2429 = fma(_2419, _2419, _2425);
    float _2431 = floor(_2427);
    float _2433 = fma(_2423, _2423, _2429);
    float _2435 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2437 = rsqrt(_2433);
    float _2439 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2435);
    float _2441 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2439);
    float _2443 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2445 = -_2431;
    float _2447 = _2427 + _2445;
    float _2449 = _2441 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2451 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2443);
    float _2453 = sqrt(_2433);
    float _2455 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2451);
    float _2457 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2459 = _2455 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2461 = 1.0 / _2449;
    float _2463 = _2419 * _2457;
    float _2465 = _2423 * _2457;
    float _2467 = _2459 + _2449;
    float _2469 = _2463 * _2463;
    float _2471 = _2465 * _2465;
    float _2473 = _2469 + _2471;
    float _2475 = sqrt(_2473);
    float _2477 = _2467 * _2461;
    float _2479 = _2477 * 0.5;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2483 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2481);
    float _2485 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2487 = 1.0 / _2483;
    float _2489 = _1136 + _2485;
    bool _2491 = _2475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2493 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2495 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2499 = _2475 + _2497;
    float _2501 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2493);
    float _2503 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2495);
    float _2505 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2501);
    float _2507 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2503);
    float _2509 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2511 = _2487 * _2509;
    float _2513 = _2193;
    float _2515 = _2499;
    int _2517 = 2;
    float _2519 = _2465;
    float _2521 = _2469;
    if (_2491)
    {
        float _2523 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2513 = _2523;
    }
    float _2525 = _2513;
    float _2527 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2529 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2531 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2533 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2535 = trunc(_2527);
    int _2537 = int(_2535);
    float _2539 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2541 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2543 = _2539;
    int _2545 = as_type<int>(_2529);
    if (_2491)
    {
        float _2547 = _2499 * _2525;
        _2515 = _2547;
    }
    float _2549 = _2515;
    float _2551 = trunc(_2529);
    int _2553 = int(_2551);
    if (!_2531)
    {
        _2517 = 1;
    }
    int _2555 = _2517;
    int _2557 = _2555;
    if (_2491)
    {
        float _2559 = _2549 * 0.15915493667125701904296875;
        _1158 = _2559;
    }
    float _2561 = _1158;
    bool _2563 = !_2531;
    int _2565 = _2563 ? 0 : 1;
    int _2567 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2569 = _2537 + _2567;
    int _2571 = _2569 + 1;
    float _2573 = (*spvDescriptorSet0.vp_c13)._m0[1].y;
    if (_2491)
    {
        float _2575 = _2561 * 6.283185482025146484375;
        float _2577 = sin(_2575);
        _2573 = _2577;
    }
    float _2579 = _2573;
    if (!_2533)
    {
        _2557 = _2565;
    }
    int _2581 = _2557;
    float _2583 = precise::max(0.0, _2539);
    int _2585 = _2581 << 6;
    bool _2587 = _2571 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2589 = _2473;
    float _2591 = as_type<float>(_2581);
    if (_2491)
    {
        float _2593 = rsqrt(_2473);
        _2589 = _2593;
    }
    float _2595 = _2589;
    int _2597 = _2585 + 48;
    uint _2599 = uint(int(uint(_2597) >> uint(2)));
    uint _2601 = uint(int(uint(int(_2599)) >> uint(2)));
    int _2603 = int(_2599) & 3;
    float _2605 = (*spvDescriptorSet0.vp_c15)._m0[int(_2601)][_2603];
    int _2607 = int(_2599) + 1;
    uint _2609 = uint(int(uint(_2607) >> uint(2)));
    int _2611 = _2607 & 3;
    float _2613 = (*spvDescriptorSet0.vp_c15)._m0[int(_2609)][_2611];
    float _2615 = -_2457;
    float _2617 = -_2583;
    float _2619 = fma(_2415, _2615, _2617);
    int _2621 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2623 = _2553 + _2621;
    int _2625 = _2623 + 1;
    float _2627 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2491)
    {
        float _2629 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2543 = _2629;
    }
    float _2631 = _2543;
    int _2633 = _2571 | _2625;
    float _2635 = _2561;
    if (_2491)
    {
        float _2637 = _2561 * 6.283185482025146484375;
        float _2639 = cos(_2637);
        _2635 = _2639;
    }
    float _2641 = _2635;
    int _2643 = _2585 + 96;
    uint _2645 = uint(int(uint(_2643) >> uint(2)));
    uint _2647 = uint(int(uint(int(_2645)) >> uint(2)));
    int _2649 = int(_2645) & 3;
    float _2651 = (*spvDescriptorSet0.vp_c15)._m0[int(_2647)][_2649];
    int _2653 = int(_2645) + 1;
    uint _2655 = uint(int(uint(_2653) >> uint(2)));
    int _2657 = _2653 & 3;
    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[int(_2655)][_2657];
    if (_2491)
    {
        float _2661 = fma(_2579, _2631, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2145 = _2661;
    }
    float _2663 = _2145;
    bool _2665 = _2633 < 0;
    bool _2667 = _2665 || _2587;
    bool _2669 = _2625 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2671 = _2669 || _2667;
    float _2673 = _2595;
    if (_2491)
    {
        float _2675 = _2595 * _2663;
        _1437 = _2675;
    }
    float _2677 = _1437;
    int _2679 = _2585 + 64;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    uint _2683 = uint(int(uint(int(_2681)) >> uint(2)));
    int _2685 = int(_2681) & 3;
    float _2687 = (*spvDescriptorSet0.vp_c15)._m0[int(_2683)][_2685];
    int _2689 = int(_2681) + 1;
    uint _2691 = uint(int(uint(_2689) >> uint(2)));
    int _2693 = _2689 & 3;
    float _2695 = (*spvDescriptorSet0.vp_c15)._m0[int(_2691)][_2693];
    float _2697 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2627);
    if (!_2491)
    {
        _2673 = _2619;
    }
    float _2699 = _2673;
    float _2701 = _2699;
    if (_2491)
    {
        float _2703 = _2465 * _2677;
        _2519 = _2703;
    }
    float _2705 = _2519;
    float _2707 = floor(_2541);
    float _2709 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2697);
    float _2711 = _2709;
    if (_2491)
    {
        float _2713 = _2641 + (-1.0);
        _2087 = _2713;
    }
    float _2715 = _2087;
    int _2717 = _2585 + 80;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    uint _2721 = uint(int(uint(int(_2719)) >> uint(2)));
    int _2723 = int(_2719) & 3;
    float _2725 = (*spvDescriptorSet0.vp_c15)._m0[int(_2721)][_2723];
    int _2727 = int(_2719) + 1;
    uint _2729 = uint(int(uint(_2727) >> uint(2)));
    int _2731 = _2727 & 3;
    float _2733 = (*spvDescriptorSet0.vp_c15)._m0[int(_2729)][_2731];
    float _2735 = _2715;
    if (_2491)
    {
        float _2737 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2161 = _2737;
    }
    float _2739 = _2161;
    if (!_2491)
    {
        _2735 = _2463;
    }
    float _2741 = _2735;
    float _2743 = _2741;
    if (_2491)
    {
        float _2745 = _2463 * _2677;
        _2743 = _2745;
    }
    float _2747 = _2743;
    float _2749 = _2709 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_2491)
    {
        float _2751 = fma(_2619, _2641, _2739);
        _2701 = _2751;
    }
    float _2753 = _2701;
    int _2755 = _2585 + 104;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    uint _2759 = uint(int(uint(int(_2757)) >> uint(2)));
    int _2761 = int(_2757) & 3;
    float _2763 = (*spvDescriptorSet0.vp_c15)._m0[int(_2759)][_2761];
    int _2765 = int(_2757) + 1;
    uint _2767 = uint(int(uint(_2765) >> uint(2)));
    int _2769 = _2765 & 3;
    float _2771 = (*spvDescriptorSet0.vp_c15)._m0[int(_2767)][_2769];
    if (_2491)
    {
        float _2773 = _2747 * _2747;
        _2521 = _2773;
    }
    float _2775 = _2521;
    if (!_2491)
    {
        _2711 = _2471;
    }
    float _2777 = _2711;
    float _2779 = _2777;
    if (_2491)
    {
        float _2781 = _2705 * _2705;
        _2779 = _2781;
    }
    float _2783 = _2779;
    if (!_2671)
    {
        float _2785 = floor(_2529);
        _2089 = _2785;
    }
    float _2787 = _2089;
    float _2789 = fma(_2753, _2753, _2775);
    float _2791 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2793 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2795 = _2585 + 88;
    uint _2797 = uint(int(uint(_2795) >> uint(2)));
    uint _2799 = uint(int(uint(int(_2797)) >> uint(2)));
    int _2801 = int(_2797) & 3;
    float _2803 = (*spvDescriptorSet0.vp_c15)._m0[int(_2799)][_2801];
    int _2805 = int(_2797) + 1;
    uint _2807 = uint(int(uint(_2805) >> uint(2)));
    int _2809 = _2805 & 3;
    float _2811 = (*spvDescriptorSet0.vp_c15)._m0[int(_2807)][_2809];
    float _2813 = _2789 + _2783;
    float _2815 = -_2707;
    float _2817 = _2541 + _2815;
    float _2819 = -_2793;
    float _2821 = fma(_2819, _2791, 1.0);
    int _2823 = as_type<int>(_2793);
    if (!_2671)
    {
        int _2825 = _2625 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2827 = _2825 + _2571;
        _2823 = _2827;
    }
    int _2829 = _2823;
    float _2831 = rsqrt(_2813);
    int _2833 = _2585 + 72;
    uint _2835 = uint(int(uint(_2833) >> uint(2)));
    uint _2837 = uint(int(uint(int(_2835)) >> uint(2)));
    int _2839 = int(_2835) & 3;
    float _2841 = (*spvDescriptorSet0.vp_c15)._m0[int(_2837)][_2839];
    int _2843 = int(_2835) + 1;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    int _2847 = _2843 & 3;
    float _2849 = (*spvDescriptorSet0.vp_c15)._m0[int(_2845)][_2847];
    float _2851 = _2489 * _2613;
    float _2853 = fma(_1034, _2605, _2851);
    int _2855 = _2585 + 56;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    uint _2859 = uint(int(uint(int(_2857)) >> uint(2)));
    int _2861 = int(_2857) & 3;
    float _2863 = (*spvDescriptorSet0.vp_c15)._m0[int(_2859)][_2861];
    int _2865 = int(_2857) + 1;
    uint _2867 = uint(int(uint(_2865) >> uint(2)));
    int _2869 = _2865 & 3;
    float _2871 = (*spvDescriptorSet0.vp_c15)._m0[int(_2867)][_2869];
    float _2873 = _2489 * _2659;
    float _2875 = fma(_1034, _2651, _2873);
    float _2877 = _2831 * _2747;
    float _2879 = _2489 * _2695;
    float _2881 = _2695;
    if (!_2671)
    {
        float _2883 = -_2787;
        float _2885 = _2529 + _2883;
        _2881 = _2885;
    }
    float _2887 = _2881;
    if (!_2671)
    {
        int _2889 = _2829 << 2;
        _2545 = _2889;
    }
    int _2891 = _2545;
    float _2893 = _2831 * _2753;
    float _2895 = fma(_1034, _2687, _2879);
    float _2897 = _2831 * _2705;
    int _2899 = _2891;
    int _2901 = as_type<int>(_2733);
    if (!_2671)
    {
        int _2903 = 12 & _2891;
        _2899 = _2903;
    }
    int _2905 = _2899;
    float _2907 = _2489 * _2733;
    float _2909 = as_type<float>(_2905);
    if (!_2671)
    {
        uint _2911 = uint(int(uint(_2829) >> uint(2)));
        _2901 = int(_2911);
    }
    int _2913 = _2901;
    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2917 = fma(_2453, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2915);
    float _2919 = precise::clamp(_2917, 0.0, 1.0);
    float _2921 = fma(_1034, _2725, _2907);
    if (!_2671)
    {
        int _2923 = _2913 << 4;
        int _2925 = _2923 + _2905;
        _2909 = as_type<float>(_2925);
    }
    float _2927 = _2909;
    float _2929 = -_2919;
    float _2931 = _2929 + 1.0;
    float _2933 = log2(_2821);
    float _2935 = fma(_1064, _2763, _2875);
    float _2937 = _2927;
    if (!_2671)
    {
        int _2939 = as_type<int>(_2927) + 400;
        uint _2941 = uint(int(uint(_2939) >> uint(2)));
        uint _2943 = uint(int(uint(int(_2941)) >> uint(2)));
        int _2945 = int(_2941) & 3;
        float _2947 = (*spvDescriptorSet0.vp_c15)._m0[int(_2943)][_2945];
        _2937 = _2947;
    }
    float _2949 = _2937;
    float _2951 = _2935 + _2771;
    float _2953 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2955 = abs(_2931);
    float _2957 = log2(_2955);
    float _2959 = fma(_1064, _2803, _2921);
    float _2961 = -_2953;
    float _2963 = fma(_2893, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2961);
    float _2965 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2967 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2965);
    float _2969 = 1.0 / _2951;
    float _2971 = fma(_1064, _2841, _2895);
    float _2973 = _2933 * 0.693147182464599609375;
    float _2975 = _2971 + _2849;
    float _2977 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2979 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2967);
    float _2981 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2983 = fma(_1064, _2863, _2853);
    float _2985 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2977);
    float _2987 = _2979 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2989 = -_2897;
    float _2991 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2963);
    float _2993 = _2983 + _2871;
    float _2995 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2997 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2985);
    float _2999 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3001 = fma(_2991, -0.5, 0.5);
    float _3003 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2995);
    float _3005 = _2993 * _2969;
    float _3007 = _2997 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3009 = exp2(_2981);
    float _3011 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3003);
    float _3013 = fma(_2991, 0.5, 0.5);
    bool _3015 = _3005 >= 0.0;
    float _3017 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2999);
    float _3019 = _2975 * _2969;
    float _3021 = _3011 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3023 = _3005 <= 1.0;
    bool _3025 = _3023 && _3015;
    float _3027 = sqrt(_3001);
    float _3029 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3017);
    float _3031 = _2959 + _2811;
    bool _3033 = _3019 >= 0.0;
    bool _3035 = _3033 && _3025;
    float _3037 = fma(_3013, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3039 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3041 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3029);
    bool _3043 = _3019 <= 1.0;
    bool _3045 = _3043 && _3035;
    float _3047 = _2893 + 1.0;
    float _3049 = fma(_3013, _3037, -0.212114393711090087890625);
    float _3051 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3039);
    float _3053 = 1.0 / _3041;
    float _3055 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3057 = -_2893;
    float _3059 = fma(_3009, _3047, _3057);
    float _3061 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3051);
    float _3063 = fma(_3013, _3049, 1.570728778839111328125);
    float _3065 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3055);
    float _3067 = _3027 * 0.636619746685028076171875;
    float2 _8290 = float2(_2447, _2817);
    float _3069 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8290, float2(0.0), isnan(_8290)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8290, float2(0.0), isnan(_8290)), level(0.0)).x;
    float _3071 = _2821;
    if (!_2671)
    {
        float _3073 = floor(_2527);
        _3071 = _3073;
    }
    float _3075 = _3071;
    if (_3045)
    {
        float _3077 = float(_2581);
        _2591 = _3077;
    }
    float _3079 = _2591;
    float _3081 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3065);
    float _3083 = -_3063;
    float _3085 = fma(_3067, _3083, 1.0);
    float _3087 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3061);
    float _3089 = _3031 * _2969;
    float _3091 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3081);
    float _3093 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3095 = _3051;
    if (_3045)
    {
        float _3097 = rint(_3079);
        float _3099 = precise::max(_3097, 0.0);
        uint _3101 = uint(_3099);
        uint _3103 = clamp(_3101, 0u, 65535u);
        _3095 = as_type<float>(_3103);
    }
    float _3105 = _3095;
    float _3107 = _3087 * _3053;
    float _3109 = _3091 * _3053;
    float _3111 = fma(_3107, 0.5, 0.5);
    float _3113 = fma(_3109, -0.5, 0.5);
    float _3115 = _2893;
    if (!_2671)
    {
        float _3117 = rint(_2949);
        float _3119 = precise::max(_3117, 0.0);
        uint _3121 = uint(_3119);
        uint _3123 = clamp(_3121, 0u, 65535u);
        _3115 = as_type<float>(_3123);
    }
    float _3125 = _3115;
    float _3127 = _3075;
    if (!_2671)
    {
        float _3129 = -_3075;
        float _3131 = _2527 + _3129;
        _3127 = _3131;
    }
    float _3133 = _3127;
    float _3135 = fma(_3059, 0.5, 0.5);
    float _3137 = (*spvDescriptorSet0.vp_c15)._m0[23].w;
    if (_3045)
    {
        float3 _8405 = float3(_3005, _3019, float(as_type<int>(_3105)));
        float3 _8409 = select(_8405, float3(0.0), isnan(_8405));
        float _3139 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8409.xy, uint(rint(_8409.z)), _3089, level(0.0));
        _3137 = _3139;
    }
    float _3141 = _3137;
    float3 _8419 = float3(_3111, _3113, _3093);
    float _3143 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8419, float3(0.0), isnan(_8419)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8419, float3(0.0), isnan(_8419)), level(0.0)).x;
    float3 _8428 = float3(_3111, _3113, _3093);
    float4 _3146 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8428, float3(0.0), isnan(_8428)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8428, float3(0.0), isnan(_8428)), level(0.0)).xyzw;
    float _3148 = _3146.x;
    float _3150 = _3146.y;
    float _3152 = _3146.z;
    float _3154 = _3146.w;
    float2 _8444 = float2(_3085, _3135);
    float3 _3156 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8444, float2(0.0), isnan(_8444)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8444, float2(0.0), isnan(_8444)), level(0.0)).xyz;
    float _3158 = _3156.x;
    float _3160 = _3156.y;
    float _3162 = _3156.z;
    float _3164 = _2887;
    if (!_2671)
    {
        float3 _8465 = float3(_3133, _2887, float(as_type<int>(_3125)));
        float3 _8467 = select(_8465, float3(0.0), isnan(_8465));
        float _3166 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8467.xy, uint(rint(_8467.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8467.xy, uint(rint(_8467.z)), level(0.0)).x;
        _3164 = _3166;
    }
    float _3168 = _3164;
    float _3170 = abs(_2511);
    float _3172 = log2(_3170);
    float _3174 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3176 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3174);
    float _3178 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3180 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3176);
    bool _3182 = _2511 <= 8000.0;
    bool _3184 = isnan(_2511);
    bool _3186 = _3182 || _3184;
    bool _3188 = isnan(8000.0);
    bool _3190 = _3186 || _3188;
    float _3192 = float(_3190);
    float _3194 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3180);
    float _3196 = exp2(_3178);
    float _3198 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3087;
    out.gl_Position.y = _3091;
    out.gl_Position.z = _3194;
    out.gl_Position.w = _3041;
    float _3200 = exp2(_3198);
    float _3202 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3204 = precise::clamp(_3202, 0.0, 1.0);
    float _3206 = fma(_3204, -2.0, 3.0);
    float _3208 = _3204 * _3204;
    float _3210 = _3208 * _3206;
    float _3212 = _3194 + _3041;
    float _3214 = _3212 * 0.5;
    float _3216 = -_3210;
    float _3218 = _3216 + 1.0;
    out.m_103.z = _3214;
    out.m_103.w = _3041;
    float _3220 = fma(_3218, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3210);
    float _3222 = _3192 * _3220;
    float _3224 = _3220;
    float _3226 = _3194;
    float _3228 = _3087;
    if (!_3045)
    {
        _3224 = 1.0;
    }
    float _3230 = _3224;
    float _3232 = _3222 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3234 = -_3196;
    float _3236 = _3234 + 1.0;
    float _3238 = -_3069;
    float _3240 = _3238 + 1.0;
    float _3242 = _3240 * _3232;
    float _3244 = precise::clamp(_3242, 0.0, 1.0);
    float _3246 = _3230;
    float _3248 = _3236;
    if (_3045)
    {
        bool _3250 = _3141 >= _3089;
        bool _3252 = isnan(_3141);
        bool _3254 = _3250 || _3252;
        bool _3256 = isnan(_3089);
        bool _3258 = _3254 || _3256;
        float _3260 = float(_3258);
        _3246 = _3260;
    }
    float _3262 = _3246;
    float _3264 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3266 = _3264;
    if (_2671)
    {
        _3248 = 1.0;
    }
    float _3268 = _3248;
    float _3270 = _3268;
    if (!_2671)
    {
        int _3272 = _2829 << 4;
        int _3274 = _3272 + 2048;
        uint _3276 = uint(int(uint(_3274) >> uint(2)));
        uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
        int _3280 = int(_3276) & 3;
        float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
        int _3284 = int(_3276) + 1;
        uint _3286 = uint(int(uint(_3284) >> uint(2)));
        int _3288 = _3284 & 3;
        float _3290 = (*spvDescriptorSet0.vp_c15)._m0[int(_3286)][_3288];
        int _3292 = _3274 + 8;
        uint _3294 = uint(int(uint(_3292) >> uint(2)));
        uint _3296 = uint(int(uint(int(_3294)) >> uint(2)));
        int _3298 = int(_3294) & 3;
        float _3300 = (*spvDescriptorSet0.vp_c15)._m0[int(_3296)][_3298];
        int _3302 = int(_3294) + 1;
        uint _3304 = uint(int(uint(_3302) >> uint(2)));
        int _3306 = _3302 & 3;
        float _3308 = (*spvDescriptorSet0.vp_c15)._m0[int(_3304)][_3306];
        float _3310 = _2489 * _3290;
        float _3312 = fma(_1034, _3282, _3310);
        float _3314 = fma(_1064, _3300, _3312);
        float _3316 = _3314 + _3308;
        float _3318 = precise::clamp(_3316, 0.0, 1.0);
        float _3320 = -_3318;
        float _3322 = _3320 + _3168;
        float _3324 = fma(_3322, 500.0, 1.5);
        float _3326 = exp2(_3324);
        float _3328 = 0.0 + _3326;
        float _3330 = precise::clamp(_3328, 0.0, 1.0);
        _3270 = _3330;
        _3226 = _3300;
        _3228 = 500.0;
    }
    float _3332 = _3270;
    float _3334 = _3226;
    float _3336 = _3228;
    float _3338 = _3262 * _3332;
    float _3340 = -_3244;
    float _3342 = fma(_3340, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3344 = _3264 * _3143;
    out.m_105.x = _2409;
    out.m_105.y = _2407;
    out.m_105.z = _2411;
    bool _3346 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3348 = isnan(_2453);
    bool _3350 = _3346 || _3348;
    bool _3352 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3354 = _3350 || _3352;
    float _3356 = -_3338;
    float _3358 = fma(_3356, _3342, 1.0);
    float _3360 = precise::clamp(_3358, 0.0, 1.0);
    float _3362 = _3154 * _3344;
    float _3364 = -_3264;
    float _3366 = _3364 + 1.0;
    float _3368 = _3162 * _3344;
    float _3370 = _3360 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3372 = fma(_3158, _3362, _3148);
    float _3374 = fma(_3160, _3362, _3150);
    float _3376 = _3154 * _3366;
    float _3378 = fma(_3154, _3368, _3152);
    out.m_107.x = _3370;
    float _3380 = _3334;
    float _3382 = _3362;
    float _3384 = _3336;
    float _3386 = _3366;
    float _3388 = _3360;
    if (!_3354)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3390 = _3380;
    out.m_109.x = _3372;
    out.m_109.y = _3374;
    out.m_109.z = _3378;
    out.m_109.w = _3376;
    float _3392 = _3390;
    float _3394 = _3390;
    if (!_3354)
    {
        _3382 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3396 = _3382;
    float _3398 = _3396;
    float _3400 = _3396;
    if (!_3354)
    {
        _3384 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3402 = _3384;
    float _3404 = _3402;
    float _3406 = _3402;
    if (!_3354)
    {
        _3266 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3408 = _3266;
    float _3410 = _3408;
    float _3412 = _3408;
    if (!_3354)
    {
        _3386 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3414 = _3386;
    float _3416 = _3414;
    float _3418 = _3414;
    if (!_3354)
    {
        _3388 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3420 = _3388;
    bool _3422 = !_3354;
    float _3424 = _3420;
    float _3426 = _3420;
    if (!_3422)
    {
        bool _3428 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3430 = isnan(_2453);
        bool _3432 = _3428 || _3430;
        bool _3434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3436 = _3432 || _3434;
        if (!_3436)
        {
            float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3440 = _2453 + _3438;
            float _3442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3442;
            float _3446 = 1.0 / _3444;
            float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3458 = _3456 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3460 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3464 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3466 = _3464 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3468 = _3440 * _3446;
            float _3470 = precise::clamp(_3468, 0.0, 1.0);
            float _3472 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3474 = _3472 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3476 = fma(_3470, _3450, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3478 = fma(_3470, _3474, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3480 = fma(_3470, _3454, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3482 = fma(_3470, _3458, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3484 = fma(_3470, _3462, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3486 = fma(_3470, _3466, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3400 = _3478;
            _3418 = _3484;
            _3394 = _3476;
            _3412 = _3482;
            _3406 = _3480;
            _3426 = _3486;
            _3488 = true;
        }
        else
        {
            bool _3490 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3492 = isnan(_2453);
            bool _3494 = _3490 || _3492;
            bool _3496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3498 = _3494 || _3496;
            if (!_3498)
            {
                _3392 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3500 = _3392;
            _3394 = _3500;
            if (!_3498)
            {
                _3398 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3502 = _3398;
            _3400 = _3502;
            if (!_3498)
            {
                _3404 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3504 = _3404;
            _3406 = _3504;
            if (!_3498)
            {
                _3410 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3506 = _3410;
            _3412 = _3506;
            if (!_3498)
            {
                _3416 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3508 = _3416;
            _3418 = _3508;
            if (!_3498)
            {
                _3424 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3510 = _3424;
            bool _3512 = !_3498;
            _3426 = _3510;
            if (!_3512)
            {
                bool _3514 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3516 = isnan(_2453);
                bool _3518 = _3514 || _3516;
                bool _3520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3522 = _3518 || _3520;
                if (!_3522)
                {
                    float _3524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3526 = _2453 + _3524;
                    float _3528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3528;
                    float _3532 = 1.0 / _3530;
                    float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3542 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3554 = _3526 * _3532;
                    float _3556 = precise::clamp(_3554, 0.0, 1.0);
                    float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3560 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3562 = fma(_3556, _3536, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3564 = fma(_3556, _3560, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3566 = fma(_3556, _3540, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3568 = fma(_3556, _3544, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3570 = fma(_3556, _3548, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3572 = fma(_3556, _3552, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3400 = _3564;
                    _3418 = _3570;
                    _3394 = _3562;
                    _3412 = _3568;
                    _3406 = _3566;
                    _3426 = _3572;
                    _3488 = true;
                }
                else
                {
                    _3400 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3418 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3394 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3412 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3406 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3426 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3488 = false;
    float _3574 = _3400;
    float _3576 = _3418;
    float _3578 = _3394;
    float _3580 = _3412;
    float _3582 = _3406;
    float _3584 = _3426;
    float _3586 = fma(_2315, -0.5, 0.5);
    float _3588 = precise::clamp(_3586, 0.0, 1.0);
    float _3590 = -_3574;
    float _3592 = _3590 + _3576;
    float _3594 = -_3578;
    float _3596 = _3594 + _3580;
    float _3598 = -_3582;
    float _3600 = _3598 + _3584;
    bool _3602 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3604 = fma(_3588, _3592, _3574);
    float _3606 = fma(_3588, _3596, _3578);
    float _3608 = fma(_3588, _3600, _3582);
    float _3610 = _3604 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3612 = fma(_3606, 0.298911988735198974609375, _3610);
    float _3614 = fma(_3608, 0.114477999508380889892578125, _3612);
    out.m_111.x = 0.0;
    float _3616 = -_3614;
    float _3618 = _3606 + _3616;
    float _3620 = -_3614;
    float _3622 = _3604 + _3620;
    float _3624 = -_3614;
    float _3626 = _3608 + _3624;
    float _3628 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3630 = fma(_3618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3614);
    float _3632 = fma(_3622, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3614);
    float _3634 = fma(_3626, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3614);
    out.m_107.w = _3628;
    out.m_113.x = _3630;
    out.m_113.y = _3632;
    out.m_113.z = _3634;
    if (!_3602)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3636 = -_2407;
    float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3640 = -_2409;
    float _3642 = _3640 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3644 = -_2411;
    float _3646 = _3644 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3648 = _3638 * _3638;
    float _3650 = fma(_3642, _3642, _3648);
    float _3652 = fma(_3646, _3646, _3650);
    float _3654 = sqrt(_3652);
    float _3656 = rsqrt(_3652);
    float _3658 = -_3654;
    float _3660 = _3658 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3662 = _3660 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3664 = precise::clamp(_3662, 0.0, 1.0);
    float _3666 = _3642 * _3656;
    float _3668 = _3638 * _3656;
    float _3670 = abs(_3664);
    float _3672 = log2(_3670);
    float _3674 = _3646 * _3656;
    float _3676 = _3666 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3678 = _2315 * _3668;
    float _3680 = -_3668;
    float _3682 = -_3676;
    float _3684 = fma(_3680, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3682);
    float _3686 = fma(_2299, _3666, _3678);
    float _3688 = -_3674;
    float _3690 = fma(_3688, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3684);
    float _3692 = fma(_2317, _3674, _3686);
    float _3694 = precise::clamp(_3692, 0.0, 1.0);
    float _3696 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3698 = _3690 + _3696;
    float _3700 = _3672 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3702 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3704 = precise::clamp(_3702, 0.0, 1.0);
    float _3706 = exp2(_3700);
    float _3708 = _3706 * _3704;
    float _3710 = _3694 * _3708;
    float _3712 = _3710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3714 = _3710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3716 = _3710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _3712;
    out.m_111.y = _3714;
    out.m_111.z = _3716;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3488 = false;
    bool _2363 = false;
    bool _500 = false;
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
        float _3773 = as_type<float>(_148);
        out.gl_Position.z = _3773;
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
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_63.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3843 = as_type<float>(_186);
        out.gl_Position.z = _3843;
    }
    if (_178)
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
    float _224 = _188 * _188;
    float _226 = _190 * _190;
    float _228 = _192 * _192;
    float _230 = fma(_196, _196, _224);
    float _232 = fma(_198, _198, _226);
    float _234 = fma(_200, _200, _228);
    float _236 = fma(_212, _212, _230);
    float _238 = fma(_214, _214, _232);
    float _240 = fma(_216, _216, _234);
    float _242 = sqrt(_236);
    float _244 = sqrt(_238);
    bool _246 = _242 > 0.0;
    float _248 = sqrt(_240);
    float _250 = _242;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _254 = _194;
    float _256 = _190;
    if (!_210)
    {
        float _258 = _194 * _194;
        float _260 = _258 * 0.5;
        _250 = _260;
    }
    float _262 = _250;
    float _264 = _262;
    if (!_210)
    {
        float _266 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _266;
    }
    float _268 = _264;
    bool _270 = _244 > 0.0;
    float _272 = 0.0;
    float _274 = _268;
    if (_246)
    {
        float _276 = rsqrt(_236);
        _272 = _276;
    }
    float _278 = _272;
    bool _280 = _248 > 0.0;
    float _282 = _248;
    if (!_210)
    {
        _282 = _194;
    }
    float _284 = _282;
    float _286 = 0.0;
    float _288 = _284;
    if (_270)
    {
        float _290 = rsqrt(_238);
        _286 = _290;
    }
    float _292 = _286;
    bool _294 = !_210;
    float _296 = _278;
    if (!_294)
    {
        float _298 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = log2(_298);
        float _302 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _304 = _302 + 1.0;
        float _306 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = _194 * _300;
        float _310 = 1.0 / _304;
        float _312 = _306 * 0.693147182464599609375;
        float _314 = exp2(_308);
        float _316 = 1.0 / _312;
        float _318 = _314 + (-1.0);
        float _320 = -_318;
        float _322 = fma(_320, _316, _194);
        float _324 = _322 * _310;
        float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _326;
    }
    float _328 = _274;
    bool _330 = !_210;
    if (!_330)
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
        _288 = _350;
        _252 = _338;
    }
    float _352 = _288;
    float _354 = _252;
    float _356 = in.m_73.w;
    float _358 = 0.0;
    float _360 = 0.0;
    float _362 = _354;
    if (!_246)
    {
        _358 = 0.0;
        _360 = 0.0;
    }
    float _364 = _358;
    float _366 = _360;
    float _368 = 0.0;
    float _370 = _364;
    float _372 = _366;
    if (!_246)
    {
        _368 = 0.0;
    }
    float _374 = _368;
    float _376 = _374;
    if (_246)
    {
        float _378 = _278 * _196;
        _370 = _378;
    }
    float _380 = _370;
    float _382 = in.m_60.x;
    float _384 = in.m_60.y;
    float _386 = in.m_60.z;
    if (_246)
    {
        float _388 = _278 * _188;
        _376 = _388;
    }
    float _390 = _376;
    if (_246)
    {
        float _392 = _278 * _212;
        _372 = _392;
    }
    float _394 = _372;
    float _396 = 0.0;
    if (_280)
    {
        float _398 = rsqrt(_240);
        _396 = _398;
    }
    float _400 = _396;
    bool _402 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _404 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _406 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _408 = _404;
    if (!_270)
    {
        _362 = 0.0;
    }
    float _410 = _362;
    float _412 = _410;
    if (_270)
    {
        float _414 = _292 * _198;
        _412 = _414;
    }
    float _416 = _412;
    float _418 = fma(_352, _218, _404);
    float _420 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _422 = fma(_352, _220, _406);
    float _424 = 0.0;
    if (!_280)
    {
        _424 = 0.0;
        _408 = 0.0;
    }
    float _426 = _424;
    float _428 = _408;
    float _430 = _426;
    float _432 = _428;
    if (!_270)
    {
        _254 = 0.0;
    }
    float _434 = _254;
    float _436 = fma(_352, _222, _420);
    float _438 = _434;
    if (!_270)
    {
        _296 = 0.0;
    }
    float _440 = _296;
    float _442 = _440;
    if (_270)
    {
        float _444 = _292 * _190;
        _438 = _444;
    }
    float _446 = _438;
    float _448 = 0.0;
    if (!_280)
    {
        _448 = 0.0;
    }
    float _450 = _448;
    float _452 = _450;
    if (_270)
    {
        float _454 = _292 * _214;
        _442 = _454;
    }
    float _456 = _442;
    if (_280)
    {
        float _458 = _400 * _200;
        _430 = _458;
    }
    float _460 = _430;
    if (_280)
    {
        float _462 = _400 * _192;
        _432 = _462;
    }
    float _464 = _432;
    if (_280)
    {
        float _466 = _400 * _216;
        _452 = _466;
    }
    float _468 = _452;
    float _470 = fma(_418, _356, _382);
    float _472 = fma(_422, _356, _384);
    float _474 = fma(_436, _356, _386);
    bool _476 = !_402;
    float _478 = _472;
    float _480 = _474;
    float _498;
    if (!_476)
    {
        float _482 = in.m_75.x;
        float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _486 = _482 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _488 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _490 = _488 * _484;
        float _492 = floor(_490);
        float _494 = -_492;
        float _496 = _490 + _494;
        _498 = _496;
        _500 = true;
    }
    else
    {
        float _502 = float(_132);
        float _504 = 1.0 / _502;
        float _506 = _166 * _504;
        _498 = _506;
    }
    _500 = false;
    float _508 = _498;
    float _510 = in.m_75.x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _514 = _508 + _512;
    float _516 = in.m_75.z;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _518;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _524 = _522 != 0;
    float _526 = in.m_75.y;
    float _528 = _472 * _198;
    float _530 = _472 * _214;
    float _532 = 1.0 / _520;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _536 = fma(_470, _212, _530);
    float _538 = fma(_470, _196, _528);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _542 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _544 = log2(_542);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _548 = fma(_474, _216, _536);
    float _550 = _510 * 2.0;
    float _552 = floor(_550);
    float _554 = _510 + _516;
    float _556 = _516 * 2.0;
    float _558 = _514 * _532;
    float _560 = _532;
    float _562 = _550;
    int _564 = as_type<int>(_516);
    if (!_524)
    {
        _560 = _516;
    }
    float _566 = _560;
    float _568 = _554 + (-1.0);
    float _570 = floor(_556);
    float _572 = _568;
    float _574 = _566;
    if (!_524)
    {
        _562 = _526;
    }
    float _576 = _562;
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _580 = _576;
    if (!_524)
    {
        _572 = _576;
    }
    float _582 = _572;
    float _584 = _582;
    if (_524)
    {
        _580 = _526;
    }
    float _586 = _580;
    bool _588 = _552 > 0.0;
    float _590 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _592 = int(_590);
    if (_524)
    {
        _584 = _510;
    }
    float _594 = _584;
    float _596 = _586 * 2.0;
    bool _598 = _552 >= 0.0;
    bool _600 = isnan(_552);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    if (_524)
    {
        _574 = _586;
    }
    float _608 = _574;
    float _610 = _594 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _612 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[83].z, _534);
    int _614 = _606 ? 0 : 1;
    float _616 = floor(_596);
    float _618 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[83].w, _540);
    float _620 = _608;
    if (!_524)
    {
        _620 = _516;
    }
    float _622 = _620;
    float _624 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _612);
    int _626 = ~_614;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _618);
    float _634 = _622;
    int _636 = _630;
    if (_524)
    {
        _634 = _586;
    }
    float _638 = _634;
    if (!_588)
    {
        int _640 = ~_614;
        int _642 = _640 + 1;
        _636 = _642;
    }
    int _644 = _636;
    bool _646 = _570 > 0.0;
    float _648 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _650 = int(_648);
    bool _652 = _570 >= 0.0;
    bool _654 = isnan(_570);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = _638 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _664 = _510 + _586;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _676 = _674 != 0;
    float _678 = fma(_662, -2.0, _546);
    float _680 = _544 * _166;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _684 = _660 ? 0 : 1;
    float _686 = _664 + (-1.0);
    bool _688 = !_672;
    int _690 = _688 ? 0 : 1;
    float _692 = -_682;
    float _694 = fma(_610, 2.0, _692);
    int _696 = ~_684;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _704 = abs(_690);
    float _706 = exp2(_680);
    int _708 = _700;
    if (!_646)
    {
        int _710 = ~_684;
        int _712 = _710 + 1;
        _708 = _712;
    }
    int _714 = _708;
    float _716 = _516 + _586;
    float _718 = float(_650);
    bool _720 = !_668;
    int _722 = _720 ? 0 : 1;
    float _724 = _716 + (-1.0);
    float _726 = 1.0 / _718;
    int _728 = abs(_722);
    float _730 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _732 = float(_704);
    float _734 = float(_644);
    bool _736 = _616 > 0.0;
    bool _738 = _616 >= 0.0;
    bool _740 = isnan(_616);
    bool _742 = _738 || _740;
    bool _744 = isnan(0.0);
    bool _746 = _742 || _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _750 = 1.0 + _748;
    float _752 = _732 * _734;
    bool _754 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _756 = isnan(1.0);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _762 = _758 || _760;
    float _764 = in.m_77.x;
    float _766 = in.m_77.y;
    float _768 = in.m_77.z;
    float _770 = 1.0 / _750;
    float _772 = float(_728);
    float _774 = -_706;
    float _776 = _774 + 1.0;
    float _778 = float(_714);
    float _780 = _726 * _166;
    bool _782 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = _752 * (-2.0);
    float _794 = float(_592);
    float _796 = _772 * _778;
    float _798 = _790 ? _776 : 0.0;
    float _800 = -_166;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[81].x, _694);
    float _804 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _678);
    float _806 = _794 * _166;
    int _808 = _746 ? 0 : 1;
    float _810 = fma(_730, _792, _730);
    bool _812 = !_676;
    int _814 = _812 ? 0 : 1;
    if (_762)
    {
        float _816 = _798 * _770;
        _168 = _816;
    }
    float _818 = _168;
    float _820 = _796 * (-2.0);
    int _822 = ~_808;
    int _824 = _822 + 1;
    int _826 = _824 + 1;
    int _828 = _826;
    if (!_736)
    {
        int _830 = ~_808;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    int _836 = abs(_814);
    float _838 = fma(_820, _764, _764);
    float _840 = fma(_792, _766, _766);
    float _842 = _586 + (-0.5);
    float _844 = _510 + (-0.5);
    float _846 = float(_834);
    float _848 = fma(_702, _820, _702);
    float _850 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[196].y, _840);
    float _852 = float(_836);
    float _854 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].x, _838);
    float _856 = fma(_810, _818, _850);
    float _858 = _852 * _846;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _860;
    float _864 = fma(_848, _818, _854);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _866;
    float _870 = _858 * (-2.0);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _872;
    bool _876 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _878 = isnan(_508);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = fma(_862, _558, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _890 = fma(_868, _558, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _892 = fma(_874, _558, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _894 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _896 = isnan(_508);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = _856 * 0.15915493667125701904296875;
    float _908 = in.m_73.x;
    float _910 = in.m_73.y;
    float _912 = in.m_73.z;
    float _914 = fma(_870, _768, _768);
    float _916 = _516 + (-0.5);
    float _918 = _864 * 0.15915493667125701904296875;
    float _920 = -_886;
    float _922 = _920 + 1.0;
    float _924 = in.m_79.x;
    float _926 = in.m_79.y;
    float _928 = in.m_79.z;
    float _930 = fma(_578, _870, _578);
    float _932 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[196].z, _914);
    float _934 = _904 * _922;
    float _936 = -_904;
    float _938 = _936 + 1.0;
    float _940 = _918 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = fma(_930, _818, _932);
    float _946 = _888 * _934;
    float _948 = _890 * _934;
    float _950 = _892 * _934;
    float _952 = _944 * 0.15915493667125701904296875;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[143].x, _946);
    float _956 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[143].y, _948);
    float _958 = _918 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[143].z, _950);
    float _964 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[144].x, _954);
    float _966 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[144].y, _956);
    float _968 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[144].z, _962);
    float _970 = _964 * _908;
    float _972 = _966 * _910;
    float _974 = _906 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = _968 * _912;
    float _980 = _970 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _926);
    float _984 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _924);
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _928);
    float _990 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _992 = _906 * 6.283185482025146484375;
    float _994 = cos(_992);
    float _996 = fma(_474, _200, _538);
    float _998 = _982 * _984;
    float _1000 = in.m_69.w;
    float _1002 = _986 * _980;
    float _1004 = _988 * _990;
    float _1006 = _952 * 6.283185482025146484375;
    float _1008 = cos(_1006);
    float _1010 = in.m_71.w;
    float _1012 = _942 * _976;
    float _1014 = _960 * _976;
    float _1016 = _952 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _960 * _994;
    float _1022 = _942 * _994;
    float _1024 = _960 * _1008;
    float _1026 = _994 * _1008;
    float _1028 = _942 * _1008;
    float _1030 = _976 * _1008;
    float _1032 = _1024 * _998;
    float _1034 = _996 + _1000;
    float _1036 = _1028 * _998;
    float _1038 = fma(_1018, _1020, _1012);
    float _1040 = -_998;
    float _1042 = _1018 * _1040;
    float _1044 = -_1022;
    float _1046 = fma(_1018, _1014, _1044);
    float _1048 = -_1014;
    float _1050 = fma(_1018, _1022, _1048);
    float _1052 = fma(_1038, _1002, _1032);
    float _1054 = fma(_1026, _1002, _1042);
    float _1056 = fma(_1018, _1012, _1020);
    float _1058 = fma(_1050, _1002, _1036);
    float _1060 = fma(_1046, _1004, _1052);
    float _1062 = fma(_1030, _1004, _1054);
    float _1064 = _548 + _1010;
    float _1066 = fma(_1056, _1004, _1058);
    float _1068 = _1060 * _416;
    float _1070 = _1060 * _456;
    float _1072 = _1060 * _446;
    float _1074 = fma(_1062, _380, _1068);
    float _1076 = fma(_1062, _394, _1070);
    float _1078 = fma(_1062, _390, _1072);
    float _1080 = in.m_67.w;
    float _1082 = fma(_1066, _460, _1074);
    float _1084 = fma(_1066, _468, _1076);
    float _1086 = fma(_1066, _464, _1078);
    float _1088 = _1034 + _1082;
    float _1090 = _1064 + _1084;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1094 = _1088 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1098 = _1090 + _1096;
    float _1100 = _1094 * _1094;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _472 * _190;
    float _1116 = fma(_470, _188, _1114);
    float _1118 = fma(_474, _192, _1116);
    float _1120 = _1058;
    float _1122 = _1066;
    float _1124 = _1088;
    float _1126 = _1090;
    float _1128 = _1100;
    float _1130 = _1102;
    if (_1108)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1132;
    }
    float _1134 = _1120;
    float _1136 = _1118 + _1080;
    if (_1108)
    {
        float _1138 = rsqrt(_1104);
        _1122 = _1138;
    }
    float _1140 = _1122;
    float _1142 = _1134;
    if (_1108)
    {
        float _1144 = _1112 * _1134;
        _1142 = _1144;
    }
    float _1146 = _1142;
    if (_1108)
    {
        float _1148 = _1146 * 0.15915493667125701904296875;
        _478 = _1148;
    }
    float _1150 = _478;
    float _1152 = _1136 + _1086;
    float _1154 = _188;
    float _1156 = _1152;
    float _1158 = _1150;
    if (_1108)
    {
        float _1160 = _1150 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        _1154 = _1162;
    }
    float _1164 = _1154;
    if (_1108)
    {
        float _1166 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _256 = _1166;
    }
    float _1168 = _256;
    float _1170 = _1168;
    if (_1108)
    {
        float _1172 = fma(_1164, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1170 = _1172;
    }
    float _1174 = _1170;
    float _1176 = _1174;
    if (_1108)
    {
        float _1178 = _1140 * _1174;
        _1176 = _1178;
    }
    float _1180 = _1176;
    if (_1108)
    {
        float _1182 = fma(_1094, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1124 = _1182;
    }
    float _1184 = _1124;
    if (_1108)
    {
        float _1186 = fma(_1098, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1126 = _1186;
    }
    float _1188 = _1126;
    float _1190 = fma(_1184, 6.2500002968590706586837768554688e-05, 0.5);
    float _1192 = fma(_1188, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5322 = float2(_1190, _1192);
    float3 _1196 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5322, float2(0.0), isnan(_5322)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5322, float2(0.0), isnan(_5322)), level(0.0)).xyz;
    float _1198 = _1196.x;
    float _1200 = _1196.y;
    float _1202 = _1196.z;
    float _1204 = float(uint(_592));
    float _1206 = trunc(_780);
    int _1208 = int(_1206);
    int _1210 = ~_592;
    int _1212 = _1210 + 1;
    int _1214 = ~_592;
    int _1216 = _1214 + 1;
    bool _1218 = _592 == 0;
    float _1220 = 1.0 / _1204;
    bool _1222 = !_524;
    float _1224 = _1222 ? _586 : _510;
    int _1226 = ~_592;
    int _1228 = _1226 + 1;
    float _1230 = float(uint(_1208));
    int _1232 = as_type<int>(_1220) + (-2);
    float _1234 = as_type<float>(_1232) * _1230;
    bool _1236 = !_524;
    float _1238 = _1236 ? 1.2345600128173828125 : 1.0;
    float _1240 = trunc(_1234);
    float _1242 = precise::max(_1240, 0.0);
    uint _1245 = uint(_1242);
    float _1247 = _1238 * _1224;
    float _1249 = floor(_1247);
    int _1251 = _1212 * int(_1245);
    int _1253 = _1251 + _1208;
    float _1255 = float(uint(_1253));
    float _1257 = as_type<float>(_1232) * _1255;
    float _1259 = trunc(_1257);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    int _1265 = int(_1245) + int(_1263);
    float _1267 = float(_1208);
    int _1269 = _1216 * _1265;
    int _1271 = _1269 + _1208;
    bool _1273 = _1267 >= _794;
    bool _1275 = isnan(_1267);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan(_794);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = -_1249;
    float _1287 = _1247 + _1285;
    float _1289 = float(_132);
    bool _1291 = uint(_1271) >= uint(_592);
    float _1293 = _794 * _1287;
    float _1295 = trunc(_1283);
    int _1297 = int(_1295);
    int _1299 = _592 + (-1);
    bool _1301 = !_1291;
    int _1303 = _1301 ? 0 : (-1);
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1307 = _1305 != 0;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1311 = _1309 != 0;
    int _1313 = ~_1265;
    int _1315 = _1313 + _1303;
    int _1317 = _1315 + 1;
    float _1319 = 1.0 / _1289;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1323 = _1321 != 0;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1327 = _1325 != 0;
    int _1329 = _592 * _1317;
    int _1331 = _1329 + _1208;
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1335 = _1333 != 0;
    float _1337 = in.m_81.x;
    int _1339 = ~_1297;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    float _1345 = trunc(_1293);
    int _1347 = int(_1345);
    bool _1349 = !_1218;
    int _1351 = _1349 ? _1331 : (-1);
    int _1353 = _1343 * _1351;
    float _1355 = _806 * _1319;
    bool _1357 = !_1311;
    int _1359 = _1357 ? 0 : 1;
    bool _1361 = !_1307;
    int _1363 = _1361 ? 0 : 1;
    float _1365 = trunc(_1355);
    int _1367 = int(_1365);
    int _1369 = abs(_1359);
    int _1371 = _1297 * _1299;
    int _1373 = _1371 + _1353;
    bool _1375 = !_1335;
    int _1377 = _1375 ? 0 : 1;
    bool _1379 = !_1323;
    int _1381 = _1379 ? 0 : 1;
    int _1383 = abs(_1363);
    int _1385 = abs(_1377);
    int _1387 = abs(_1381);
    int _1389 = _1373 * _1369;
    int _1391 = _1347 * _1385;
    int _1393 = _1391 + _1208;
    bool _1395 = !_1327;
    int _1397 = _1395 ? 0 : 1;
    int _1399 = _1367 * _1383;
    int _1401 = _1399 + _1389;
    int _1403 = abs(_1397);
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1407 = _1405 != 0;
    int _1409 = _1393 * _1387;
    int _1411 = _1409 + _1401;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1415 = _1413 != 0;
    float _1417 = float(uint(_1393));
    int _1419 = _1347 * _1403;
    int _1421 = _1419 + _1411;
    int _1423 = ~_592;
    int _1425 = _1423 + 1;
    float _1427 = as_type<float>(_1232) * _1417;
    float _1429 = float(uint(_1421));
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1433 = _1335;
    float _1435 = as_type<float>(_1228);
    float _1437 = _1188;
    if (_1407)
    {
        bool _1439 = _516 > 0.5;
        _1433 = _1439;
    }
    bool _1441 = _1433;
    float _1443 = as_type<float>(_1232) * _1429;
    float _1445 = _1337;
    if (_1415)
    {
        float _1447 = -_1337;
        float _1449 = _1447 + 1.0;
        _564 = as_type<int>(_1449);
    }
    int _1451 = _564;
    if (!_1415)
    {
        _480 = _1337;
    }
    float _1453 = _480;
    float _1455 = trunc(_1427);
    float _1457 = precise::max(_1455, 0.0);
    uint _1459 = uint(_1457);
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1463 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = trunc(_1443);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    int _1471 = ~_592;
    int _1473 = _1471 + 1;
    int _1475 = _1425 * int(_1469);
    int _1477 = _1475 + _1421;
    float _1479 = float(uint(_1477));
    float _1481 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1483 = as_type<float>(_1232) * _1479;
    float _1485 = _1481 * _510;
    float _1487 = in.m_75.w;
    float _1489 = trunc(_1483);
    float _1491 = precise::max(_1489, 0.0);
    uint _1493 = uint(_1491);
    float _1495 = trunc(_1485);
    int _1497 = int(_1495);
    int _1499 = int(_1469) + int(_1493);
    int _1501 = _1473 * _1499;
    int _1503 = _1501 + _1421;
    bool _1505 = _1487 > 0.5;
    bool _1507 = uint(_1503) >= uint(_592);
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    bool _1509 = !_1507;
    int _1511 = _1509 ? 0 : (-1);
    float _1513 = in.m_81.y;
    bool _1515 = _1507;
    int _1517 = _1499;
    float _1519 = _1453;
    float _1521 = _1461;
    if (_1415)
    {
        bool _1523 = _510 > 0.5;
        _1515 = _1523;
    }
    bool _1525 = _1515;
    int _1527 = ~_1499;
    int _1529 = _1527 + _1511;
    int _1531 = _1529 + 1;
    if (_1407)
    {
        float _1533 = -_1337;
        float _1535 = _1533 + 1.0;
        _1517 = as_type<int>(_1535);
    }
    int _1537 = _1517;
    if (_1415)
    {
        float _1539 = _1525 ? as_type<float>(_1451) : _1337;
        _1519 = _1539;
    }
    float _1541 = _1519;
    int _1543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1545 = _1543 != 0;
    int _1547 = _592 * _1531;
    int _1549 = _1547 + _1421;
    int _1551 = _1497 << 4;
    int _1553 = _1551 + 1968;
    float _1555 = in.m_85.x;
    float _1557 = in.m_85.y;
    float _1559 = in.m_85.z;
    if (_1407)
    {
        float _1561 = _1441 ? as_type<float>(_1537) : _1337;
        _1445 = _1561;
    }
    float _1563 = _1445;
    uint _1565 = uint(int(uint(_1553) >> uint(2)));
    uint _1567 = uint(int(uint(int(_1565)) >> uint(2)));
    int _1569 = int(_1565) & 3;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[int(_1567)][_1569];
    int _1573 = int(_1565) + 1;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    int _1577 = _1573 & 3;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[int(_1575)][_1577];
    bool _1581 = !_1218;
    int _1583 = _1581 ? _1549 : (-1);
    bool _1585 = _926 != 0.0;
    bool _1587 = isnan(_926);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.0);
    bool _1593 = _1589 || _1591;
    int _1595 = _1583 >> 31;
    bool _1597 = _924 == 0.0;
    bool _1599 = !_1593;
    bool _1601 = _1597 && _1599;
    int _1603 = _1553 + 8;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = _1595 & 3;
    bool _1615 = _928 == 0.0;
    bool _1617 = _1615 && _1601;
    float _1619 = -_1513;
    float _1621 = _1619 + 1.0;
    int _1623 = _1583 + _1613;
    int _1625 = _1228 * int(_1459);
    int _1627 = _1625 + _1393;
    int _1629 = _1623 >> 2;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1633 = _1629 << 4;
    int _1635 = _1633 + 512;
    float _1637 = float(uint(_1627));
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    uint _1641 = uint(int(uint(_1635) >> uint(2)));
    uint _1643 = uint(int(uint(int(_1641)) >> uint(2)));
    int _1645 = int(_1641) & 3;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[int(_1643)][_1645];
    int _1649 = int(_1641) + 1;
    uint _1651 = uint(int(uint(_1649) >> uint(2)));
    int _1653 = _1649 & 3;
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[int(_1651)][_1653];
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1659 = _1657 != 0;
    float _1661 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1665 = _1663 != 0;
    float _1667 = as_type<float>(_1232) * _1637;
    int _1669 = _1505 ? as_type<int>(_1621) : as_type<int>(_1513);
    float _1671 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1673 = _586 > 0.5;
    float _1675 = _1665 ? as_type<float>(_1669) : _1513;
    float _1677 = trunc(_1667);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    float _1683 = _1513;
    float _1685 = _1621;
    float _1687 = _1637;
    if (_1545)
    {
        float _1689 = _1673 ? _1621 : _1513;
        _1683 = _1689;
    }
    float _1691 = _1683;
    out.m_87.x = _1661;
    out.m_87.y = _1671;
    out.m_87.z = _1463;
    out.m_87.w = _1461;
    if (_1617)
    {
        _1435 = _1555;
    }
    float _1693 = _1435;
    float _1695 = _1693;
    if (_1617)
    {
        _1685 = _1557;
    }
    float _1697 = _1685;
    float _1699 = _1697;
    if (_1617)
    {
        _1687 = _1693;
    }
    float _1701 = _1687;
    int _1703 = _1583 & 3;
    bool _1705 = _1703 != 0;
    float _1707 = _1701;
    if (!_1617)
    {
        _1695 = _1555;
    }
    float _1709 = _1695;
    bool _1711 = uint(_1703) > 1u;
    int _1713 = _1705 ? 0 : 1;
    float _1715 = _1579 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1717 = _1571;
    if (_1617)
    {
        _1521 = _1697;
    }
    float _1719 = _1521;
    float _1721 = _1571 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1723 = _1719;
    if (!_1617)
    {
        _1699 = _1557;
    }
    float _1725 = _1699;
    if (!_1617)
    {
        float _1727 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1709);
        _1707 = _1727;
    }
    float _1729 = _1707;
    int _1731 = _1635 + 8;
    uint _1733 = uint(int(uint(_1731) >> uint(2)));
    uint _1735 = uint(int(uint(int(_1733)) >> uint(2)));
    int _1737 = int(_1733) & 3;
    float _1739 = (*spvDescriptorSet0.vp_c9)._m0[int(_1735)][_1737];
    int _1741 = int(_1733) + 1;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    int _1745 = _1741 & 3;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[int(_1743)][_1745];
    int _1749 = ~_592;
    int _1751 = _1749 + 1;
    float _1753 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1755 = int(_1459) + int(_1681);
    float _1757 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1759 = ~_1713;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    float _1765 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1767 = _1763;
    if (!_1711)
    {
        int _1769 = ~_1713;
        int _1771 = _1769 + 1;
        _1767 = _1771;
    }
    int _1773 = _1767;
    int _1775 = _1751 * _1755;
    int _1777 = _1775 + _1393;
    bool _1779 = _1703 != 3;
    float _1781 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1783 = int(_1781);
    int _1785 = abs(_1773);
    float _1787 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1617)
    {
        _1717 = _1559;
    }
    float _1789 = _1717;
    float _1791 = _1789;
    if (!_1617)
    {
        float _1793 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1559);
        _1791 = _1793;
    }
    float _1795 = _1791;
    bool _1797 = uint(_1703) >= 2u;
    if (!_1617)
    {
        float _1799 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1725);
        _1723 = _1799;
    }
    float _1801 = _1723;
    bool _1803 = uint(_1777) >= uint(_592);
    out.m_89.x = _1757;
    out.m_89.y = _1765;
    out.m_89.z = _1787;
    int _1805 = _1797 ? 0 : 1;
    int _1807 = _1583 & 3;
    bool _1809 = _1807 != 0;
    int _1811 = ~_1785;
    int _1813 = _1811 + 1;
    int _1815 = _1813 + 1;
    bool _1817 = _1703 != 3;
    float _1819 = float(uint(_1783));
    bool _1821 = !_1803;
    int _1823 = _1821 ? 0 : (-1);
    int _1825 = ~_1805;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    int _1831 = ~_1755;
    int _1833 = _1831 + _1823;
    int _1835 = _1833 + 1;
    int _1837 = _1815 * as_type<int>(_1655);
    bool _1839 = !_1809;
    int _1841 = _1839 ? 0 : 1;
    int _1843 = _1829;
    if (_1779)
    {
        int _1845 = ~_1805;
        int _1847 = _1845 + 1;
        _1843 = _1847;
    }
    int _1849 = _1843;
    float _1851 = in.m_91.x;
    float _1853 = in.m_91.y;
    float _1855 = in.m_91.z;
    float _1857 = in.m_91.w;
    int _1859 = abs(_1841);
    bool _1861 = !_1817;
    int _1863 = _1861 ? 0 : (-1);
    int _1865 = abs(_1783);
    int _1867 = abs(_1849);
    int _1869 = abs(_1863);
    float _1871 = 1.0 / _1819;
    int _1873 = ~_1859;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    bool _1879 = !_1659;
    int _1881 = _1879 ? 0 : 1;
    int _1883 = _1877 * as_type<int>(_1647);
    int _1885 = _1883 + _1837;
    int _1887 = ~_1867;
    int _1889 = _1887 + 1;
    int _1891 = _1889 + 1;
    int _1893 = abs(_1881);
    int _1895 = ~_1869;
    int _1897 = _1895 + 1;
    int _1899 = _1897 + 1;
    int _1901 = _1891 * as_type<int>(_1739);
    int _1903 = _1901 + _1885;
    int _1905 = _592 * _1835;
    int _1907 = _1905 + _1393;
    float _1909 = float(uint(_1865));
    int _1911 = _1899 * as_type<int>(_1747);
    int _1913 = _1911 + _1903;
    int _1915 = ~_1893;
    int _1917 = _1915 + 1;
    int _1919 = _1917 + 1;
    float _1921 = _1853 * _1559;
    float _1923 = 1.0 / _1909;
    bool _1925 = !_1218;
    int _1927 = _1925 ? _1907 : (-1);
    float _1929 = _1851 * _1725;
    int _1931 = _1919 * _1913;
    float _1933 = _1855 * _1709;
    float _1935 = -_1921;
    float _1937 = fma(_1855, _1725, _1935);
    float _1939 = -_1929;
    float _1941 = fma(_1853, _1709, _1939);
    int _1943 = _1927 * _1893;
    int _1945 = _1943 + _1931;
    float _1947 = -_1933;
    float _1949 = fma(_1851, _1559, _1947);
    float _1951 = _1937 * _1857;
    float _1953 = _1941 * _1857;
    int _1955 = as_type<int>(_1871) + (-2);
    float _1957 = _1949 * _1857;
    float _1959 = float(uint(_1945));
    float _1961 = -_1801;
    float _1963 = _1018 * _1961;
    int _1965 = abs(_1945);
    float _1967 = -_1853;
    float _1969 = _1018 * _1967;
    int _1971 = as_type<int>(_1923) + (-2);
    float _1973 = as_type<float>(_1955) * _1959;
    float _1975 = float(uint(_1965));
    float _1977 = -_1957;
    float _1979 = _1018 * _1977;
    float _1981 = fma(_1026, _1729, _1963);
    int _1983 = ~_1783;
    int _1985 = _1983 + 1;
    float _1987 = fma(_1026, _1851, _1969);
    float _1989 = trunc(_1973);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = as_type<float>(_1971) * _1975;
    float _1997 = _1024 * _1801;
    float _1999 = fma(_1026, _1951, _1979);
    float _2001 = _1024 * _1853;
    float _2003 = _1028 * _1853;
    float _2005 = _1028 * _1801;
    float _2007 = _1024 * _1957;
    float _2009 = trunc(_1995);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    float _2015 = fma(_1038, _1729, _1997);
    int _2017 = ~_1865;
    int _2019 = _2017 + 1;
    float _2021 = _1028 * _1957;
    float _2023 = fma(_1038, _1851, _2001);
    float _2025 = fma(_1038, _1951, _2007);
    int _2027 = _1985 * int(_1993);
    int _2029 = _2027 + _1945;
    float _2031 = fma(_1050, _1951, _2021);
    float _2033 = fma(_1050, _1729, _2005);
    float _2035 = fma(_1050, _1851, _2003);
    float _2037 = fma(_1030, _1855, _1987);
    float _2039 = float(uint(_2029));
    float _2041 = fma(_1046, _1855, _2023);
    float _2043 = fma(_1056, _1855, _2035);
    int _2045 = _2019 * int(_2013);
    int _2047 = _2045 + _1965;
    float _2049 = fma(_1046, _1953, _2025);
    float _2051 = as_type<float>(_1955) * _2039;
    float _2053 = fma(_1046, _1795, _2015);
    float _2055 = fma(_1030, _1795, _1981);
    float _2057 = float(uint(_2047));
    float _2059 = trunc(_2051);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = ~_1783;
    int _2067 = _2065 + 1;
    float _2069 = fma(_1056, _1795, _2033);
    float _2071 = fma(_1056, _1953, _2031);
    float _2073 = as_type<float>(_1971) * _2057;
    float _2075 = _2041 * _446;
    float _2077 = fma(_1030, _1953, _1999);
    float _2079 = _2049 * _416;
    float _2081 = _2031;
    float _2083 = as_type<float>(_1965);
    float _2085 = _2055;
    float _2087 = _2071;
    float _2089 = _2077;
    if (_1108)
    {
        float _2091 = _1150 * 6.283185482025146484375;
        float _2093 = cos(_2091);
        _2081 = _2093;
    }
    float _2095 = _2081;
    float _2097 = _2053 * _446;
    float _2099 = _2049 * _446;
    float _2101 = _2041 * _456;
    float _2103 = _2053 * _456;
    float _2105 = _2049 * _456;
    float _2107 = _2041 * _416;
    float _2109 = trunc(_2073);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = int(_1993) + int(_2063);
    float _2117 = _2053 * _416;
    int _2119 = ~_1865;
    int _2121 = _2119 + 1;
    float _2123 = fma(_2037, _380, _2107);
    float _2125 = fma(_2037, _394, _2101);
    int _2127 = _2067 * _2115;
    int _2129 = _2127 + _1945;
    float _2131 = fma(_2055, _380, _2117);
    float _2133 = fma(_2077, _380, _2079);
    float _2135 = fma(_2055, _390, _2097);
    bool _2137 = uint(_2129) >= uint(_1783);
    float _2139 = fma(_2055, _394, _2103);
    float _2141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2143 = _2103;
    float _2145 = as_type<float>(_2121);
    if (_1108)
    {
        float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2149 = _1184 + _2147;
        _2143 = _2149;
    }
    float _2151 = _2143;
    bool _2153 = !_2137;
    int _2155 = _2153 ? 0 : (-1);
    float _2157 = fma(_2037, _390, _2075);
    int _2159 = int(_2013) + int(_2113);
    float _2161 = as_type<float>(_2113);
    if (_1108)
    {
        float _2163 = _2151 * _2151;
        _1128 = _2163;
    }
    float _2165 = _1128;
    int _2167 = ~_2115;
    int _2169 = _2167 + _2155;
    int _2171 = _2169 + 1;
    float _2173 = fma(_2043, _464, _2157);
    int _2175 = _1945 ^ _1783;
    int _2177 = _2121 * _2159;
    int _2179 = _2177 + _1965;
    float _2181 = as_type<float>(_2179);
    if (_1108)
    {
        float _2183 = _2095 + (-1.0);
        _2083 = _2183;
    }
    float _2185 = _2083;
    int _2187 = _1783 * _2171;
    int _2189 = _2187 + _1945;
    uint _2191 = uint(int(uint(_2175) >> uint(31)));
    float _2193 = fma(_2043, _468, _2125);
    if (_1108)
    {
        float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2085 = _2195;
    }
    float _2197 = _2085;
    bool _2199 = uint(_2179) >= uint(_1865);
    float _2201 = fma(_2077, _390, _2099);
    int _2203 = ~int(_2191);
    int _2205 = _2203 + 1;
    float _2207 = _2201;
    if (_1108)
    {
        float _2209 = fma(_1152, _2095, _2197);
        _1156 = _2209;
    }
    float _2211 = _1156;
    bool _2213 = !_2199;
    int _2215 = _2213 ? 0 : (-1);
    float _2217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2219 = _1783 == 0;
    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2223 = _2211 + _2221;
    int _2225 = ~_2215;
    int _2227 = _2159 + _2225;
    int _2229 = _2227 + 1;
    if (_1108)
    {
        float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2233 = _1188 + _2231;
        _2181 = _2233;
    }
    float _2235 = _2181;
    bool _2237 = _1783 == 0;
    float _2239 = fma(_2077, _394, _2105);
    int _2241 = _2229 ^ _2205;
    float _2243 = fma(_2223, _2223, _2165);
    bool _2245 = !_2219;
    int _2247 = _2245 ? _2189 : (-1);
    float _2249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2251 = ~_2205;
    int _2253 = _2251 + _2241;
    int _2255 = _2253 + 1;
    if (_1108)
    {
        float _2257 = _2235 * _2235;
        _1130 = _2257;
    }
    float _2259 = _1130;
    float _2261 = _2141 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2263 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2265 = !_2237;
    int _2267 = _2265 ? _2255 : (-1);
    float _2269 = _2243 + _2259;
    float _2271 = float(_2247);
    float _2273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2275 = float(_2267);
    float _2277 = _2217 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2279 = fma(_2261, _1563, -0.5);
    float _2281 = fma(_2261, _2271, _802);
    float _2283 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2285 = fma(_2277, _1675, -0.5);
    float _2287 = -_804;
    float _2289 = fma(_2277, _2275, _2287);
    float _2291 = sqrt(_2269);
    float _2293 = fma(_624, _2279, _2281);
    float _2295 = _2283 * _2249;
    float _2297 = fma(_632, _2285, _2289);
    float _2299 = fma(_2069, _460, _2131);
    float _2301 = fma(_2071, _460, _2133);
    float _2303 = fma(_2071, _464, _2201);
    float _2305 = fma(_2071, _468, _2239);
    float _2307 = _2263 * _2273;
    float _2309 = fma(_2043, _460, _2123);
    float _2311 = _2293 + 0.5;
    float _2313 = _2297 + 0.5;
    float _2315 = fma(_2069, _464, _2135);
    float _2317 = fma(_2069, _468, _2139);
    out.m_93.x = _2309;
    out.m_93.y = _2173;
    out.m_93.z = _2193;
    bool _2319 = _2291 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2321 = isnan(_2291);
    bool _2323 = _2319 || _2321;
    bool _2325 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2327 = _2323 || _2325;
    out.m_95.x = _2301;
    out.m_95.y = _2303;
    out.m_95.z = _2305;
    out.m_97.x = _2295;
    out.m_97.y = _2307;
    out.m_97.z = _2311;
    out.m_97.w = _2313;
    out.m_99.x = _1198;
    out.m_99.y = _1200;
    out.m_99.z = _1202;
    if (!_2327)
    {
        _2207 = 1.0;
    }
    float _2329 = _2207;
    out.m_101.x = _2299;
    out.m_101.y = _2315;
    out.m_101.z = _2317;
    bool _2331 = !_2327;
    float _2333 = _2329;
    if (!_2331)
    {
        bool _2335 = _2291 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2337 = isnan(_2291);
        bool _2339 = _2335 || _2337;
        bool _2341 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2343 = _2339 || _2341;
        if (!_2343)
        {
            float _2345 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2347 = _2291 + _2345;
            float _2349 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2351 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2349;
            float _2353 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2357 = 1.0 / _2351;
            float _2359 = _2347 * _2357;
            float _2361 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2333 = _2361;
            _2363 = true;
        }
        else
        {
            bool _2365 = _2291 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2367 = isnan(_2291);
            bool _2369 = _2365 || _2367;
            bool _2371 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2373 = _2369 || _2371;
            if (!_2373)
            {
                float _2375 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2377 = _2291 + _2375;
                float _2379 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2381 = _2379 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2383 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2385 = _2383 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2387 = 1.0 / _2381;
                float _2389 = _2377 * _2387;
                float _2391 = fma(_2389, _2385, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2333 = _2391;
                _2363 = true;
            }
            else
            {
                _2333 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2363 = false;
    float _2393 = _2333;
    float _2395 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2397 = _2211 + _2395;
    float _2399 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2401 = _1184 + _2399;
    float _2403 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2405 = _1188 + _2403;
    float _2407 = fma(_2397, _2393, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2409 = fma(_2401, _2393, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2411 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2415 = _2407 + _2413;
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2419 = _2409 + _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2423 = _2411 + _2421;
    float _2425 = _2415 * _2415;
    float _2427 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2429 = fma(_2419, _2419, _2425);
    float _2431 = floor(_2427);
    float _2433 = fma(_2423, _2423, _2429);
    float _2435 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2437 = rsqrt(_2433);
    float _2439 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2435);
    float _2441 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2439);
    float _2443 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2445 = -_2431;
    float _2447 = _2427 + _2445;
    float _2449 = _2441 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2451 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2443);
    float _2453 = sqrt(_2433);
    float _2455 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2451);
    float _2457 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2459 = _2455 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2461 = 1.0 / _2449;
    float _2463 = _2419 * _2457;
    float _2465 = _2423 * _2457;
    float _2467 = _2459 + _2449;
    float _2469 = _2463 * _2463;
    float _2471 = _2465 * _2465;
    float _2473 = _2469 + _2471;
    float _2475 = sqrt(_2473);
    float _2477 = _2467 * _2461;
    float _2479 = _2477 * 0.5;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2483 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2481);
    float _2485 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2487 = 1.0 / _2483;
    float _2489 = _1136 + _2485;
    bool _2491 = _2475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2493 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2495 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2499 = _2475 + _2497;
    float _2501 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2493);
    float _2503 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2495);
    float _2505 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2501);
    float _2507 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2503);
    float _2509 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2511 = _2487 * _2509;
    float _2513 = _2193;
    float _2515 = _2499;
    int _2517 = 2;
    float _2519 = _2465;
    float _2521 = _2469;
    if (_2491)
    {
        float _2523 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2513 = _2523;
    }
    float _2525 = _2513;
    float _2527 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2529 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2531 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2533 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2535 = trunc(_2527);
    int _2537 = int(_2535);
    float _2539 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2541 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2543 = _2539;
    int _2545 = as_type<int>(_2529);
    if (_2491)
    {
        float _2547 = _2499 * _2525;
        _2515 = _2547;
    }
    float _2549 = _2515;
    float _2551 = trunc(_2529);
    int _2553 = int(_2551);
    if (!_2531)
    {
        _2517 = 1;
    }
    int _2555 = _2517;
    int _2557 = _2555;
    if (_2491)
    {
        float _2559 = _2549 * 0.15915493667125701904296875;
        _1158 = _2559;
    }
    float _2561 = _1158;
    bool _2563 = !_2531;
    int _2565 = _2563 ? 0 : 1;
    int _2567 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2569 = _2537 + _2567;
    int _2571 = _2569 + 1;
    float _2573 = (*spvDescriptorSet0.vp_c13)._m0[1].y;
    if (_2491)
    {
        float _2575 = _2561 * 6.283185482025146484375;
        float _2577 = sin(_2575);
        _2573 = _2577;
    }
    float _2579 = _2573;
    if (!_2533)
    {
        _2557 = _2565;
    }
    int _2581 = _2557;
    float _2583 = precise::max(0.0, _2539);
    int _2585 = _2581 << 6;
    bool _2587 = _2571 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2589 = _2473;
    float _2591 = as_type<float>(_2581);
    if (_2491)
    {
        float _2593 = rsqrt(_2473);
        _2589 = _2593;
    }
    float _2595 = _2589;
    int _2597 = _2585 + 48;
    uint _2599 = uint(int(uint(_2597) >> uint(2)));
    uint _2601 = uint(int(uint(int(_2599)) >> uint(2)));
    int _2603 = int(_2599) & 3;
    float _2605 = (*spvDescriptorSet0.vp_c15)._m0[int(_2601)][_2603];
    int _2607 = int(_2599) + 1;
    uint _2609 = uint(int(uint(_2607) >> uint(2)));
    int _2611 = _2607 & 3;
    float _2613 = (*spvDescriptorSet0.vp_c15)._m0[int(_2609)][_2611];
    float _2615 = -_2457;
    float _2617 = -_2583;
    float _2619 = fma(_2415, _2615, _2617);
    int _2621 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2623 = _2553 + _2621;
    int _2625 = _2623 + 1;
    float _2627 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2491)
    {
        float _2629 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2543 = _2629;
    }
    float _2631 = _2543;
    int _2633 = _2571 | _2625;
    float _2635 = _2561;
    if (_2491)
    {
        float _2637 = _2561 * 6.283185482025146484375;
        float _2639 = cos(_2637);
        _2635 = _2639;
    }
    float _2641 = _2635;
    int _2643 = _2585 + 96;
    uint _2645 = uint(int(uint(_2643) >> uint(2)));
    uint _2647 = uint(int(uint(int(_2645)) >> uint(2)));
    int _2649 = int(_2645) & 3;
    float _2651 = (*spvDescriptorSet0.vp_c15)._m0[int(_2647)][_2649];
    int _2653 = int(_2645) + 1;
    uint _2655 = uint(int(uint(_2653) >> uint(2)));
    int _2657 = _2653 & 3;
    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[int(_2655)][_2657];
    if (_2491)
    {
        float _2661 = fma(_2579, _2631, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2145 = _2661;
    }
    float _2663 = _2145;
    bool _2665 = _2633 < 0;
    bool _2667 = _2665 || _2587;
    bool _2669 = _2625 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2671 = _2669 || _2667;
    float _2673 = _2595;
    if (_2491)
    {
        float _2675 = _2595 * _2663;
        _1437 = _2675;
    }
    float _2677 = _1437;
    int _2679 = _2585 + 64;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    uint _2683 = uint(int(uint(int(_2681)) >> uint(2)));
    int _2685 = int(_2681) & 3;
    float _2687 = (*spvDescriptorSet0.vp_c15)._m0[int(_2683)][_2685];
    int _2689 = int(_2681) + 1;
    uint _2691 = uint(int(uint(_2689) >> uint(2)));
    int _2693 = _2689 & 3;
    float _2695 = (*spvDescriptorSet0.vp_c15)._m0[int(_2691)][_2693];
    float _2697 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2627);
    if (!_2491)
    {
        _2673 = _2619;
    }
    float _2699 = _2673;
    float _2701 = _2699;
    if (_2491)
    {
        float _2703 = _2465 * _2677;
        _2519 = _2703;
    }
    float _2705 = _2519;
    float _2707 = floor(_2541);
    float _2709 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2697);
    float _2711 = _2709;
    if (_2491)
    {
        float _2713 = _2641 + (-1.0);
        _2087 = _2713;
    }
    float _2715 = _2087;
    int _2717 = _2585 + 80;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    uint _2721 = uint(int(uint(int(_2719)) >> uint(2)));
    int _2723 = int(_2719) & 3;
    float _2725 = (*spvDescriptorSet0.vp_c15)._m0[int(_2721)][_2723];
    int _2727 = int(_2719) + 1;
    uint _2729 = uint(int(uint(_2727) >> uint(2)));
    int _2731 = _2727 & 3;
    float _2733 = (*spvDescriptorSet0.vp_c15)._m0[int(_2729)][_2731];
    float _2735 = _2715;
    if (_2491)
    {
        float _2737 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2161 = _2737;
    }
    float _2739 = _2161;
    if (!_2491)
    {
        _2735 = _2463;
    }
    float _2741 = _2735;
    float _2743 = _2741;
    if (_2491)
    {
        float _2745 = _2463 * _2677;
        _2743 = _2745;
    }
    float _2747 = _2743;
    float _2749 = _2709 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_2491)
    {
        float _2751 = fma(_2619, _2641, _2739);
        _2701 = _2751;
    }
    float _2753 = _2701;
    int _2755 = _2585 + 104;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    uint _2759 = uint(int(uint(int(_2757)) >> uint(2)));
    int _2761 = int(_2757) & 3;
    float _2763 = (*spvDescriptorSet0.vp_c15)._m0[int(_2759)][_2761];
    int _2765 = int(_2757) + 1;
    uint _2767 = uint(int(uint(_2765) >> uint(2)));
    int _2769 = _2765 & 3;
    float _2771 = (*spvDescriptorSet0.vp_c15)._m0[int(_2767)][_2769];
    if (_2491)
    {
        float _2773 = _2747 * _2747;
        _2521 = _2773;
    }
    float _2775 = _2521;
    if (!_2491)
    {
        _2711 = _2471;
    }
    float _2777 = _2711;
    float _2779 = _2777;
    if (_2491)
    {
        float _2781 = _2705 * _2705;
        _2779 = _2781;
    }
    float _2783 = _2779;
    if (!_2671)
    {
        float _2785 = floor(_2529);
        _2089 = _2785;
    }
    float _2787 = _2089;
    float _2789 = fma(_2753, _2753, _2775);
    float _2791 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2793 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2795 = _2585 + 88;
    uint _2797 = uint(int(uint(_2795) >> uint(2)));
    uint _2799 = uint(int(uint(int(_2797)) >> uint(2)));
    int _2801 = int(_2797) & 3;
    float _2803 = (*spvDescriptorSet0.vp_c15)._m0[int(_2799)][_2801];
    int _2805 = int(_2797) + 1;
    uint _2807 = uint(int(uint(_2805) >> uint(2)));
    int _2809 = _2805 & 3;
    float _2811 = (*spvDescriptorSet0.vp_c15)._m0[int(_2807)][_2809];
    float _2813 = _2789 + _2783;
    float _2815 = -_2707;
    float _2817 = _2541 + _2815;
    float _2819 = -_2793;
    float _2821 = fma(_2819, _2791, 1.0);
    int _2823 = as_type<int>(_2793);
    if (!_2671)
    {
        int _2825 = _2625 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2827 = _2825 + _2571;
        _2823 = _2827;
    }
    int _2829 = _2823;
    float _2831 = rsqrt(_2813);
    int _2833 = _2585 + 72;
    uint _2835 = uint(int(uint(_2833) >> uint(2)));
    uint _2837 = uint(int(uint(int(_2835)) >> uint(2)));
    int _2839 = int(_2835) & 3;
    float _2841 = (*spvDescriptorSet0.vp_c15)._m0[int(_2837)][_2839];
    int _2843 = int(_2835) + 1;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    int _2847 = _2843 & 3;
    float _2849 = (*spvDescriptorSet0.vp_c15)._m0[int(_2845)][_2847];
    float _2851 = _2489 * _2613;
    float _2853 = fma(_1034, _2605, _2851);
    int _2855 = _2585 + 56;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    uint _2859 = uint(int(uint(int(_2857)) >> uint(2)));
    int _2861 = int(_2857) & 3;
    float _2863 = (*spvDescriptorSet0.vp_c15)._m0[int(_2859)][_2861];
    int _2865 = int(_2857) + 1;
    uint _2867 = uint(int(uint(_2865) >> uint(2)));
    int _2869 = _2865 & 3;
    float _2871 = (*spvDescriptorSet0.vp_c15)._m0[int(_2867)][_2869];
    float _2873 = _2489 * _2659;
    float _2875 = fma(_1034, _2651, _2873);
    float _2877 = _2831 * _2747;
    float _2879 = _2489 * _2695;
    float _2881 = _2695;
    if (!_2671)
    {
        float _2883 = -_2787;
        float _2885 = _2529 + _2883;
        _2881 = _2885;
    }
    float _2887 = _2881;
    if (!_2671)
    {
        int _2889 = _2829 << 2;
        _2545 = _2889;
    }
    int _2891 = _2545;
    float _2893 = _2831 * _2753;
    float _2895 = fma(_1034, _2687, _2879);
    float _2897 = _2831 * _2705;
    int _2899 = _2891;
    int _2901 = as_type<int>(_2733);
    if (!_2671)
    {
        int _2903 = 12 & _2891;
        _2899 = _2903;
    }
    int _2905 = _2899;
    float _2907 = _2489 * _2733;
    float _2909 = as_type<float>(_2905);
    if (!_2671)
    {
        uint _2911 = uint(int(uint(_2829) >> uint(2)));
        _2901 = int(_2911);
    }
    int _2913 = _2901;
    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2917 = fma(_2453, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2915);
    float _2919 = precise::clamp(_2917, 0.0, 1.0);
    float _2921 = fma(_1034, _2725, _2907);
    if (!_2671)
    {
        int _2923 = _2913 << 4;
        int _2925 = _2923 + _2905;
        _2909 = as_type<float>(_2925);
    }
    float _2927 = _2909;
    float _2929 = -_2919;
    float _2931 = _2929 + 1.0;
    float _2933 = log2(_2821);
    float _2935 = fma(_1064, _2763, _2875);
    float _2937 = _2927;
    if (!_2671)
    {
        int _2939 = as_type<int>(_2927) + 400;
        uint _2941 = uint(int(uint(_2939) >> uint(2)));
        uint _2943 = uint(int(uint(int(_2941)) >> uint(2)));
        int _2945 = int(_2941) & 3;
        float _2947 = (*spvDescriptorSet0.vp_c15)._m0[int(_2943)][_2945];
        _2937 = _2947;
    }
    float _2949 = _2937;
    float _2951 = _2935 + _2771;
    float _2953 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2955 = abs(_2931);
    float _2957 = log2(_2955);
    float _2959 = fma(_1064, _2803, _2921);
    float _2961 = -_2953;
    float _2963 = fma(_2893, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2961);
    float _2965 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2967 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2965);
    float _2969 = 1.0 / _2951;
    float _2971 = fma(_1064, _2841, _2895);
    float _2973 = _2933 * 0.693147182464599609375;
    float _2975 = _2971 + _2849;
    float _2977 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2979 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2967);
    float _2981 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2983 = fma(_1064, _2863, _2853);
    float _2985 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2977);
    float _2987 = _2979 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2989 = -_2897;
    float _2991 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2963);
    float _2993 = _2983 + _2871;
    float _2995 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2997 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2985);
    float _2999 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3001 = fma(_2991, -0.5, 0.5);
    float _3003 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2995);
    float _3005 = _2993 * _2969;
    float _3007 = _2997 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3009 = exp2(_2981);
    float _3011 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3003);
    float _3013 = fma(_2991, 0.5, 0.5);
    bool _3015 = _3005 >= 0.0;
    float _3017 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2999);
    float _3019 = _2975 * _2969;
    float _3021 = _3011 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3023 = _3005 <= 1.0;
    bool _3025 = _3023 && _3015;
    float _3027 = sqrt(_3001);
    float _3029 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3017);
    float _3031 = _2959 + _2811;
    bool _3033 = _3019 >= 0.0;
    bool _3035 = _3033 && _3025;
    float _3037 = fma(_3013, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3039 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3041 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3029);
    bool _3043 = _3019 <= 1.0;
    bool _3045 = _3043 && _3035;
    float _3047 = _2893 + 1.0;
    float _3049 = fma(_3013, _3037, -0.212114393711090087890625);
    float _3051 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3039);
    float _3053 = 1.0 / _3041;
    float _3055 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3057 = -_2893;
    float _3059 = fma(_3009, _3047, _3057);
    float _3061 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3051);
    float _3063 = fma(_3013, _3049, 1.570728778839111328125);
    float _3065 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3055);
    float _3067 = _3027 * 0.636619746685028076171875;
    float2 _8290 = float2(_2447, _2817);
    float _3069 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8290, float2(0.0), isnan(_8290)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8290, float2(0.0), isnan(_8290)), level(0.0)).x;
    float _3071 = _2821;
    if (!_2671)
    {
        float _3073 = floor(_2527);
        _3071 = _3073;
    }
    float _3075 = _3071;
    if (_3045)
    {
        float _3077 = float(_2581);
        _2591 = _3077;
    }
    float _3079 = _2591;
    float _3081 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3065);
    float _3083 = -_3063;
    float _3085 = fma(_3067, _3083, 1.0);
    float _3087 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3061);
    float _3089 = _3031 * _2969;
    float _3091 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3081);
    float _3093 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3095 = _3051;
    if (_3045)
    {
        float _3097 = rint(_3079);
        float _3099 = precise::max(_3097, 0.0);
        uint _3101 = uint(_3099);
        uint _3103 = clamp(_3101, 0u, 65535u);
        _3095 = as_type<float>(_3103);
    }
    float _3105 = _3095;
    float _3107 = _3087 * _3053;
    float _3109 = _3091 * _3053;
    float _3111 = fma(_3107, 0.5, 0.5);
    float _3113 = fma(_3109, -0.5, 0.5);
    float _3115 = _2893;
    if (!_2671)
    {
        float _3117 = rint(_2949);
        float _3119 = precise::max(_3117, 0.0);
        uint _3121 = uint(_3119);
        uint _3123 = clamp(_3121, 0u, 65535u);
        _3115 = as_type<float>(_3123);
    }
    float _3125 = _3115;
    float _3127 = _3075;
    if (!_2671)
    {
        float _3129 = -_3075;
        float _3131 = _2527 + _3129;
        _3127 = _3131;
    }
    float _3133 = _3127;
    float _3135 = fma(_3059, 0.5, 0.5);
    float _3137 = (*spvDescriptorSet0.vp_c15)._m0[23].w;
    if (_3045)
    {
        float3 _8405 = float3(_3005, _3019, float(as_type<int>(_3105)));
        float3 _8409 = select(_8405, float3(0.0), isnan(_8405));
        float _3139 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8409.xy, uint(rint(_8409.z)), _3089, level(0.0));
        _3137 = _3139;
    }
    float _3141 = _3137;
    float3 _8419 = float3(_3111, _3113, _3093);
    float _3143 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8419, float3(0.0), isnan(_8419)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8419, float3(0.0), isnan(_8419)), level(0.0)).x;
    float3 _8428 = float3(_3111, _3113, _3093);
    float4 _3146 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8428, float3(0.0), isnan(_8428)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8428, float3(0.0), isnan(_8428)), level(0.0)).xyzw;
    float _3148 = _3146.x;
    float _3150 = _3146.y;
    float _3152 = _3146.z;
    float _3154 = _3146.w;
    float2 _8444 = float2(_3085, _3135);
    float3 _3156 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8444, float2(0.0), isnan(_8444)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8444, float2(0.0), isnan(_8444)), level(0.0)).xyz;
    float _3158 = _3156.x;
    float _3160 = _3156.y;
    float _3162 = _3156.z;
    float _3164 = _2887;
    if (!_2671)
    {
        float3 _8465 = float3(_3133, _2887, float(as_type<int>(_3125)));
        float3 _8467 = select(_8465, float3(0.0), isnan(_8465));
        float _3166 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8467.xy, uint(rint(_8467.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8467.xy, uint(rint(_8467.z)), level(0.0)).x;
        _3164 = _3166;
    }
    float _3168 = _3164;
    float _3170 = abs(_2511);
    float _3172 = log2(_3170);
    float _3174 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3176 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3174);
    float _3178 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3180 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3176);
    bool _3182 = _2511 <= 8000.0;
    bool _3184 = isnan(_2511);
    bool _3186 = _3182 || _3184;
    bool _3188 = isnan(8000.0);
    bool _3190 = _3186 || _3188;
    float _3192 = float(_3190);
    float _3194 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3180);
    float _3196 = exp2(_3178);
    float _3198 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3087;
    out.gl_Position.y = _3091;
    out.gl_Position.z = _3194;
    out.gl_Position.w = _3041;
    float _3200 = exp2(_3198);
    float _3202 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3204 = precise::clamp(_3202, 0.0, 1.0);
    float _3206 = fma(_3204, -2.0, 3.0);
    float _3208 = _3204 * _3204;
    float _3210 = _3208 * _3206;
    float _3212 = _3194 + _3041;
    float _3214 = _3212 * 0.5;
    float _3216 = -_3210;
    float _3218 = _3216 + 1.0;
    out.m_103.z = _3214;
    out.m_103.w = _3041;
    float _3220 = fma(_3218, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3210);
    float _3222 = _3192 * _3220;
    float _3224 = _3220;
    float _3226 = _3194;
    float _3228 = _3087;
    if (!_3045)
    {
        _3224 = 1.0;
    }
    float _3230 = _3224;
    float _3232 = _3222 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3234 = -_3196;
    float _3236 = _3234 + 1.0;
    float _3238 = -_3069;
    float _3240 = _3238 + 1.0;
    float _3242 = _3240 * _3232;
    float _3244 = precise::clamp(_3242, 0.0, 1.0);
    float _3246 = _3230;
    float _3248 = _3236;
    if (_3045)
    {
        bool _3250 = _3141 >= _3089;
        bool _3252 = isnan(_3141);
        bool _3254 = _3250 || _3252;
        bool _3256 = isnan(_3089);
        bool _3258 = _3254 || _3256;
        float _3260 = float(_3258);
        _3246 = _3260;
    }
    float _3262 = _3246;
    float _3264 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3266 = _3264;
    if (_2671)
    {
        _3248 = 1.0;
    }
    float _3268 = _3248;
    float _3270 = _3268;
    if (!_2671)
    {
        int _3272 = _2829 << 4;
        int _3274 = _3272 + 2048;
        uint _3276 = uint(int(uint(_3274) >> uint(2)));
        uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
        int _3280 = int(_3276) & 3;
        float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
        int _3284 = int(_3276) + 1;
        uint _3286 = uint(int(uint(_3284) >> uint(2)));
        int _3288 = _3284 & 3;
        float _3290 = (*spvDescriptorSet0.vp_c15)._m0[int(_3286)][_3288];
        int _3292 = _3274 + 8;
        uint _3294 = uint(int(uint(_3292) >> uint(2)));
        uint _3296 = uint(int(uint(int(_3294)) >> uint(2)));
        int _3298 = int(_3294) & 3;
        float _3300 = (*spvDescriptorSet0.vp_c15)._m0[int(_3296)][_3298];
        int _3302 = int(_3294) + 1;
        uint _3304 = uint(int(uint(_3302) >> uint(2)));
        int _3306 = _3302 & 3;
        float _3308 = (*spvDescriptorSet0.vp_c15)._m0[int(_3304)][_3306];
        float _3310 = _2489 * _3290;
        float _3312 = fma(_1034, _3282, _3310);
        float _3314 = fma(_1064, _3300, _3312);
        float _3316 = _3314 + _3308;
        float _3318 = precise::clamp(_3316, 0.0, 1.0);
        float _3320 = -_3318;
        float _3322 = _3320 + _3168;
        float _3324 = fma(_3322, 500.0, 1.5);
        float _3326 = exp2(_3324);
        float _3328 = 0.0 + _3326;
        float _3330 = precise::clamp(_3328, 0.0, 1.0);
        _3270 = _3330;
        _3226 = _3300;
        _3228 = 500.0;
    }
    float _3332 = _3270;
    float _3334 = _3226;
    float _3336 = _3228;
    float _3338 = _3262 * _3332;
    float _3340 = -_3244;
    float _3342 = fma(_3340, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3344 = _3264 * _3143;
    out.m_105.x = _2409;
    out.m_105.y = _2407;
    out.m_105.z = _2411;
    bool _3346 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3348 = isnan(_2453);
    bool _3350 = _3346 || _3348;
    bool _3352 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3354 = _3350 || _3352;
    float _3356 = -_3338;
    float _3358 = fma(_3356, _3342, 1.0);
    float _3360 = precise::clamp(_3358, 0.0, 1.0);
    float _3362 = _3154 * _3344;
    float _3364 = -_3264;
    float _3366 = _3364 + 1.0;
    float _3368 = _3162 * _3344;
    float _3370 = _3360 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3372 = fma(_3158, _3362, _3148);
    float _3374 = fma(_3160, _3362, _3150);
    float _3376 = _3154 * _3366;
    float _3378 = fma(_3154, _3368, _3152);
    out.m_107.x = _3370;
    float _3380 = _3334;
    float _3382 = _3362;
    float _3384 = _3336;
    float _3386 = _3366;
    float _3388 = _3360;
    if (!_3354)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3390 = _3380;
    out.m_109.x = _3372;
    out.m_109.y = _3374;
    out.m_109.z = _3378;
    out.m_109.w = _3376;
    float _3392 = _3390;
    float _3394 = _3390;
    if (!_3354)
    {
        _3382 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3396 = _3382;
    float _3398 = _3396;
    float _3400 = _3396;
    if (!_3354)
    {
        _3384 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3402 = _3384;
    float _3404 = _3402;
    float _3406 = _3402;
    if (!_3354)
    {
        _3266 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3408 = _3266;
    float _3410 = _3408;
    float _3412 = _3408;
    if (!_3354)
    {
        _3386 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3414 = _3386;
    float _3416 = _3414;
    float _3418 = _3414;
    if (!_3354)
    {
        _3388 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3420 = _3388;
    bool _3422 = !_3354;
    float _3424 = _3420;
    float _3426 = _3420;
    if (!_3422)
    {
        bool _3428 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3430 = isnan(_2453);
        bool _3432 = _3428 || _3430;
        bool _3434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3436 = _3432 || _3434;
        if (!_3436)
        {
            float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3440 = _2453 + _3438;
            float _3442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3442;
            float _3446 = 1.0 / _3444;
            float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3458 = _3456 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3460 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3464 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3466 = _3464 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3468 = _3440 * _3446;
            float _3470 = precise::clamp(_3468, 0.0, 1.0);
            float _3472 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3474 = _3472 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3476 = fma(_3470, _3450, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3478 = fma(_3470, _3474, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3480 = fma(_3470, _3454, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3482 = fma(_3470, _3458, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3484 = fma(_3470, _3462, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3486 = fma(_3470, _3466, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3400 = _3478;
            _3418 = _3484;
            _3394 = _3476;
            _3412 = _3482;
            _3406 = _3480;
            _3426 = _3486;
            _3488 = true;
        }
        else
        {
            bool _3490 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3492 = isnan(_2453);
            bool _3494 = _3490 || _3492;
            bool _3496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3498 = _3494 || _3496;
            if (!_3498)
            {
                _3392 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3500 = _3392;
            _3394 = _3500;
            if (!_3498)
            {
                _3398 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3502 = _3398;
            _3400 = _3502;
            if (!_3498)
            {
                _3404 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3504 = _3404;
            _3406 = _3504;
            if (!_3498)
            {
                _3410 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3506 = _3410;
            _3412 = _3506;
            if (!_3498)
            {
                _3416 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3508 = _3416;
            _3418 = _3508;
            if (!_3498)
            {
                _3424 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3510 = _3424;
            bool _3512 = !_3498;
            _3426 = _3510;
            if (!_3512)
            {
                bool _3514 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3516 = isnan(_2453);
                bool _3518 = _3514 || _3516;
                bool _3520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3522 = _3518 || _3520;
                if (!_3522)
                {
                    float _3524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3526 = _2453 + _3524;
                    float _3528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3528;
                    float _3532 = 1.0 / _3530;
                    float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3542 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3554 = _3526 * _3532;
                    float _3556 = precise::clamp(_3554, 0.0, 1.0);
                    float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3560 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3562 = fma(_3556, _3536, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3564 = fma(_3556, _3560, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3566 = fma(_3556, _3540, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3568 = fma(_3556, _3544, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3570 = fma(_3556, _3548, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3572 = fma(_3556, _3552, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3400 = _3564;
                    _3418 = _3570;
                    _3394 = _3562;
                    _3412 = _3568;
                    _3406 = _3566;
                    _3426 = _3572;
                    _3488 = true;
                }
                else
                {
                    _3400 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3418 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3394 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3412 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3406 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3426 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3488 = false;
    float _3574 = _3400;
    float _3576 = _3418;
    float _3578 = _3394;
    float _3580 = _3412;
    float _3582 = _3406;
    float _3584 = _3426;
    float _3586 = fma(_2315, -0.5, 0.5);
    float _3588 = precise::clamp(_3586, 0.0, 1.0);
    float _3590 = -_3574;
    float _3592 = _3590 + _3576;
    float _3594 = -_3578;
    float _3596 = _3594 + _3580;
    float _3598 = -_3582;
    float _3600 = _3598 + _3584;
    bool _3602 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3604 = fma(_3588, _3592, _3574);
    float _3606 = fma(_3588, _3596, _3578);
    float _3608 = fma(_3588, _3600, _3582);
    float _3610 = _3604 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3612 = fma(_3606, 0.298911988735198974609375, _3610);
    float _3614 = fma(_3608, 0.114477999508380889892578125, _3612);
    out.m_111.x = 0.0;
    float _3616 = -_3614;
    float _3618 = _3606 + _3616;
    float _3620 = -_3614;
    float _3622 = _3604 + _3620;
    float _3624 = -_3614;
    float _3626 = _3608 + _3624;
    float _3628 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3630 = fma(_3618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3614);
    float _3632 = fma(_3622, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3614);
    float _3634 = fma(_3626, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3614);
    out.m_107.w = _3628;
    out.m_113.x = _3630;
    out.m_113.y = _3632;
    out.m_113.z = _3634;
    if (!_3602)
    {
        return out;
    }
    float _3636 = -_2407;
    float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3640 = -_2409;
    float _3642 = _3640 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3644 = -_2411;
    float _3646 = _3644 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3648 = _3638 * _3638;
    float _3650 = fma(_3642, _3642, _3648);
    float _3652 = fma(_3646, _3646, _3650);
    float _3654 = sqrt(_3652);
    float _3656 = rsqrt(_3652);
    float _3658 = -_3654;
    float _3660 = _3658 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3662 = _3660 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3664 = precise::clamp(_3662, 0.0, 1.0);
    float _3666 = _3642 * _3656;
    float _3668 = _3638 * _3656;
    float _3670 = abs(_3664);
    float _3672 = log2(_3670);
    float _3674 = _3646 * _3656;
    float _3676 = _3666 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3678 = _2315 * _3668;
    float _3680 = -_3668;
    float _3682 = -_3676;
    float _3684 = fma(_3680, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3682);
    float _3686 = fma(_2299, _3666, _3678);
    float _3688 = -_3674;
    float _3690 = fma(_3688, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3684);
    float _3692 = fma(_2317, _3674, _3686);
    float _3694 = precise::clamp(_3692, 0.0, 1.0);
    float _3696 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3698 = _3690 + _3696;
    float _3700 = _3672 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3702 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3704 = precise::clamp(_3702, 0.0, 1.0);
    float _3706 = exp2(_3700);
    float _3708 = _3706 * _3704;
    float _3710 = _3694 * _3708;
    float _3712 = _3710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3714 = _3710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3716 = _3710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _3712;
    out.m_111.y = _3714;
    out.m_111.z = _3716;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3488 = false;
    bool _2363 = false;
    bool _500 = false;
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
        float _3773 = as_type<float>(_148);
        out.gl_Position.z = _3773;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_65.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_63.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3843 = as_type<float>(_186);
        out.gl_Position.z = _3843;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _224 = _188 * _188;
    float _226 = _190 * _190;
    float _228 = _192 * _192;
    float _230 = fma(_196, _196, _224);
    float _232 = fma(_198, _198, _226);
    float _234 = fma(_200, _200, _228);
    float _236 = fma(_212, _212, _230);
    float _238 = fma(_214, _214, _232);
    float _240 = fma(_216, _216, _234);
    float _242 = sqrt(_236);
    float _244 = sqrt(_238);
    bool _246 = _242 > 0.0;
    float _248 = sqrt(_240);
    float _250 = _242;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _254 = _194;
    float _256 = _190;
    if (!_210)
    {
        float _258 = _194 * _194;
        float _260 = _258 * 0.5;
        _250 = _260;
    }
    float _262 = _250;
    float _264 = _262;
    if (!_210)
    {
        float _266 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _266;
    }
    float _268 = _264;
    bool _270 = _244 > 0.0;
    float _272 = 0.0;
    float _274 = _268;
    if (_246)
    {
        float _276 = rsqrt(_236);
        _272 = _276;
    }
    float _278 = _272;
    bool _280 = _248 > 0.0;
    float _282 = _248;
    if (!_210)
    {
        _282 = _194;
    }
    float _284 = _282;
    float _286 = 0.0;
    float _288 = _284;
    if (_270)
    {
        float _290 = rsqrt(_238);
        _286 = _290;
    }
    float _292 = _286;
    bool _294 = !_210;
    float _296 = _278;
    if (!_294)
    {
        float _298 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = log2(_298);
        float _302 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _304 = _302 + 1.0;
        float _306 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = _194 * _300;
        float _310 = 1.0 / _304;
        float _312 = _306 * 0.693147182464599609375;
        float _314 = exp2(_308);
        float _316 = 1.0 / _312;
        float _318 = _314 + (-1.0);
        float _320 = -_318;
        float _322 = fma(_320, _316, _194);
        float _324 = _322 * _310;
        float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _326;
    }
    float _328 = _274;
    bool _330 = !_210;
    if (!_330)
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
        _288 = _350;
        _252 = _338;
    }
    float _352 = _288;
    float _354 = _252;
    float _356 = in.m_73.w;
    float _358 = 0.0;
    float _360 = 0.0;
    float _362 = _354;
    if (!_246)
    {
        _358 = 0.0;
        _360 = 0.0;
    }
    float _364 = _358;
    float _366 = _360;
    float _368 = 0.0;
    float _370 = _364;
    float _372 = _366;
    if (!_246)
    {
        _368 = 0.0;
    }
    float _374 = _368;
    float _376 = _374;
    if (_246)
    {
        float _378 = _278 * _196;
        _370 = _378;
    }
    float _380 = _370;
    float _382 = in.m_60.x;
    float _384 = in.m_60.y;
    float _386 = in.m_60.z;
    if (_246)
    {
        float _388 = _278 * _188;
        _376 = _388;
    }
    float _390 = _376;
    if (_246)
    {
        float _392 = _278 * _212;
        _372 = _392;
    }
    float _394 = _372;
    float _396 = 0.0;
    if (_280)
    {
        float _398 = rsqrt(_240);
        _396 = _398;
    }
    float _400 = _396;
    bool _402 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _404 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _406 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _408 = _404;
    if (!_270)
    {
        _362 = 0.0;
    }
    float _410 = _362;
    float _412 = _410;
    if (_270)
    {
        float _414 = _292 * _198;
        _412 = _414;
    }
    float _416 = _412;
    float _418 = fma(_352, _218, _404);
    float _420 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _422 = fma(_352, _220, _406);
    float _424 = 0.0;
    if (!_280)
    {
        _424 = 0.0;
        _408 = 0.0;
    }
    float _426 = _424;
    float _428 = _408;
    float _430 = _426;
    float _432 = _428;
    if (!_270)
    {
        _254 = 0.0;
    }
    float _434 = _254;
    float _436 = fma(_352, _222, _420);
    float _438 = _434;
    if (!_270)
    {
        _296 = 0.0;
    }
    float _440 = _296;
    float _442 = _440;
    if (_270)
    {
        float _444 = _292 * _190;
        _438 = _444;
    }
    float _446 = _438;
    float _448 = 0.0;
    if (!_280)
    {
        _448 = 0.0;
    }
    float _450 = _448;
    float _452 = _450;
    if (_270)
    {
        float _454 = _292 * _214;
        _442 = _454;
    }
    float _456 = _442;
    if (_280)
    {
        float _458 = _400 * _200;
        _430 = _458;
    }
    float _460 = _430;
    if (_280)
    {
        float _462 = _400 * _192;
        _432 = _462;
    }
    float _464 = _432;
    if (_280)
    {
        float _466 = _400 * _216;
        _452 = _466;
    }
    float _468 = _452;
    float _470 = fma(_418, _356, _382);
    float _472 = fma(_422, _356, _384);
    float _474 = fma(_436, _356, _386);
    bool _476 = !_402;
    float _478 = _472;
    float _480 = _474;
    float _498;
    if (!_476)
    {
        float _482 = in.m_75.x;
        float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _486 = _482 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _488 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _490 = _488 * _484;
        float _492 = floor(_490);
        float _494 = -_492;
        float _496 = _490 + _494;
        _498 = _496;
        _500 = true;
    }
    else
    {
        float _502 = float(_132);
        float _504 = 1.0 / _502;
        float _506 = _166 * _504;
        _498 = _506;
    }
    _500 = false;
    float _508 = _498;
    float _510 = in.m_75.x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _514 = _508 + _512;
    float _516 = in.m_75.z;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _518;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _524 = _522 != 0;
    float _526 = in.m_75.y;
    float _528 = _472 * _198;
    float _530 = _472 * _214;
    float _532 = 1.0 / _520;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _536 = fma(_470, _212, _530);
    float _538 = fma(_470, _196, _528);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _542 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _544 = log2(_542);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _548 = fma(_474, _216, _536);
    float _550 = _510 * 2.0;
    float _552 = floor(_550);
    float _554 = _510 + _516;
    float _556 = _516 * 2.0;
    float _558 = _514 * _532;
    float _560 = _532;
    float _562 = _550;
    int _564 = as_type<int>(_516);
    if (!_524)
    {
        _560 = _516;
    }
    float _566 = _560;
    float _568 = _554 + (-1.0);
    float _570 = floor(_556);
    float _572 = _568;
    float _574 = _566;
    if (!_524)
    {
        _562 = _526;
    }
    float _576 = _562;
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _580 = _576;
    if (!_524)
    {
        _572 = _576;
    }
    float _582 = _572;
    float _584 = _582;
    if (_524)
    {
        _580 = _526;
    }
    float _586 = _580;
    bool _588 = _552 > 0.0;
    float _590 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _592 = int(_590);
    if (_524)
    {
        _584 = _510;
    }
    float _594 = _584;
    float _596 = _586 * 2.0;
    bool _598 = _552 >= 0.0;
    bool _600 = isnan(_552);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    if (_524)
    {
        _574 = _586;
    }
    float _608 = _574;
    float _610 = _594 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _612 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[83].z, _534);
    int _614 = _606 ? 0 : 1;
    float _616 = floor(_596);
    float _618 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[83].w, _540);
    float _620 = _608;
    if (!_524)
    {
        _620 = _516;
    }
    float _622 = _620;
    float _624 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _612);
    int _626 = ~_614;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _618);
    float _634 = _622;
    int _636 = _630;
    if (_524)
    {
        _634 = _586;
    }
    float _638 = _634;
    if (!_588)
    {
        int _640 = ~_614;
        int _642 = _640 + 1;
        _636 = _642;
    }
    int _644 = _636;
    bool _646 = _570 > 0.0;
    float _648 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _650 = int(_648);
    bool _652 = _570 >= 0.0;
    bool _654 = isnan(_570);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = _638 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _664 = _510 + _586;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _676 = _674 != 0;
    float _678 = fma(_662, -2.0, _546);
    float _680 = _544 * _166;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _684 = _660 ? 0 : 1;
    float _686 = _664 + (-1.0);
    bool _688 = !_672;
    int _690 = _688 ? 0 : 1;
    float _692 = -_682;
    float _694 = fma(_610, 2.0, _692);
    int _696 = ~_684;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _704 = abs(_690);
    float _706 = exp2(_680);
    int _708 = _700;
    if (!_646)
    {
        int _710 = ~_684;
        int _712 = _710 + 1;
        _708 = _712;
    }
    int _714 = _708;
    float _716 = _516 + _586;
    float _718 = float(_650);
    bool _720 = !_668;
    int _722 = _720 ? 0 : 1;
    float _724 = _716 + (-1.0);
    float _726 = 1.0 / _718;
    int _728 = abs(_722);
    float _730 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _732 = float(_704);
    float _734 = float(_644);
    bool _736 = _616 > 0.0;
    bool _738 = _616 >= 0.0;
    bool _740 = isnan(_616);
    bool _742 = _738 || _740;
    bool _744 = isnan(0.0);
    bool _746 = _742 || _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _750 = 1.0 + _748;
    float _752 = _732 * _734;
    bool _754 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _756 = isnan(1.0);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _762 = _758 || _760;
    float _764 = in.m_77.x;
    float _766 = in.m_77.y;
    float _768 = in.m_77.z;
    float _770 = 1.0 / _750;
    float _772 = float(_728);
    float _774 = -_706;
    float _776 = _774 + 1.0;
    float _778 = float(_714);
    float _780 = _726 * _166;
    bool _782 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = _752 * (-2.0);
    float _794 = float(_592);
    float _796 = _772 * _778;
    float _798 = _790 ? _776 : 0.0;
    float _800 = -_166;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[81].x, _694);
    float _804 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _678);
    float _806 = _794 * _166;
    int _808 = _746 ? 0 : 1;
    float _810 = fma(_730, _792, _730);
    bool _812 = !_676;
    int _814 = _812 ? 0 : 1;
    if (_762)
    {
        float _816 = _798 * _770;
        _168 = _816;
    }
    float _818 = _168;
    float _820 = _796 * (-2.0);
    int _822 = ~_808;
    int _824 = _822 + 1;
    int _826 = _824 + 1;
    int _828 = _826;
    if (!_736)
    {
        int _830 = ~_808;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    int _836 = abs(_814);
    float _838 = fma(_820, _764, _764);
    float _840 = fma(_792, _766, _766);
    float _842 = _586 + (-0.5);
    float _844 = _510 + (-0.5);
    float _846 = float(_834);
    float _848 = fma(_702, _820, _702);
    float _850 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[196].y, _840);
    float _852 = float(_836);
    float _854 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].x, _838);
    float _856 = fma(_810, _818, _850);
    float _858 = _852 * _846;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _860;
    float _864 = fma(_848, _818, _854);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _866;
    float _870 = _858 * (-2.0);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _872;
    bool _876 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _878 = isnan(_508);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = fma(_862, _558, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _890 = fma(_868, _558, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _892 = fma(_874, _558, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _894 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _896 = isnan(_508);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = _856 * 0.15915493667125701904296875;
    float _908 = in.m_73.x;
    float _910 = in.m_73.y;
    float _912 = in.m_73.z;
    float _914 = fma(_870, _768, _768);
    float _916 = _516 + (-0.5);
    float _918 = _864 * 0.15915493667125701904296875;
    float _920 = -_886;
    float _922 = _920 + 1.0;
    float _924 = in.m_79.x;
    float _926 = in.m_79.y;
    float _928 = in.m_79.z;
    float _930 = fma(_578, _870, _578);
    float _932 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[196].z, _914);
    float _934 = _904 * _922;
    float _936 = -_904;
    float _938 = _936 + 1.0;
    float _940 = _918 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = fma(_930, _818, _932);
    float _946 = _888 * _934;
    float _948 = _890 * _934;
    float _950 = _892 * _934;
    float _952 = _944 * 0.15915493667125701904296875;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[143].x, _946);
    float _956 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[143].y, _948);
    float _958 = _918 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[143].z, _950);
    float _964 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[144].x, _954);
    float _966 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[144].y, _956);
    float _968 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[144].z, _962);
    float _970 = _964 * _908;
    float _972 = _966 * _910;
    float _974 = _906 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = _968 * _912;
    float _980 = _970 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _926);
    float _984 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _924);
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _928);
    float _990 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _992 = _906 * 6.283185482025146484375;
    float _994 = cos(_992);
    float _996 = fma(_474, _200, _538);
    float _998 = _982 * _984;
    float _1000 = in.m_69.w;
    float _1002 = _986 * _980;
    float _1004 = _988 * _990;
    float _1006 = _952 * 6.283185482025146484375;
    float _1008 = cos(_1006);
    float _1010 = in.m_71.w;
    float _1012 = _942 * _976;
    float _1014 = _960 * _976;
    float _1016 = _952 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _960 * _994;
    float _1022 = _942 * _994;
    float _1024 = _960 * _1008;
    float _1026 = _994 * _1008;
    float _1028 = _942 * _1008;
    float _1030 = _976 * _1008;
    float _1032 = _1024 * _998;
    float _1034 = _996 + _1000;
    float _1036 = _1028 * _998;
    float _1038 = fma(_1018, _1020, _1012);
    float _1040 = -_998;
    float _1042 = _1018 * _1040;
    float _1044 = -_1022;
    float _1046 = fma(_1018, _1014, _1044);
    float _1048 = -_1014;
    float _1050 = fma(_1018, _1022, _1048);
    float _1052 = fma(_1038, _1002, _1032);
    float _1054 = fma(_1026, _1002, _1042);
    float _1056 = fma(_1018, _1012, _1020);
    float _1058 = fma(_1050, _1002, _1036);
    float _1060 = fma(_1046, _1004, _1052);
    float _1062 = fma(_1030, _1004, _1054);
    float _1064 = _548 + _1010;
    float _1066 = fma(_1056, _1004, _1058);
    float _1068 = _1060 * _416;
    float _1070 = _1060 * _456;
    float _1072 = _1060 * _446;
    float _1074 = fma(_1062, _380, _1068);
    float _1076 = fma(_1062, _394, _1070);
    float _1078 = fma(_1062, _390, _1072);
    float _1080 = in.m_67.w;
    float _1082 = fma(_1066, _460, _1074);
    float _1084 = fma(_1066, _468, _1076);
    float _1086 = fma(_1066, _464, _1078);
    float _1088 = _1034 + _1082;
    float _1090 = _1064 + _1084;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1094 = _1088 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1098 = _1090 + _1096;
    float _1100 = _1094 * _1094;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _472 * _190;
    float _1116 = fma(_470, _188, _1114);
    float _1118 = fma(_474, _192, _1116);
    float _1120 = _1058;
    float _1122 = _1066;
    float _1124 = _1088;
    float _1126 = _1090;
    float _1128 = _1100;
    float _1130 = _1102;
    if (_1108)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1132;
    }
    float _1134 = _1120;
    float _1136 = _1118 + _1080;
    if (_1108)
    {
        float _1138 = rsqrt(_1104);
        _1122 = _1138;
    }
    float _1140 = _1122;
    float _1142 = _1134;
    if (_1108)
    {
        float _1144 = _1112 * _1134;
        _1142 = _1144;
    }
    float _1146 = _1142;
    if (_1108)
    {
        float _1148 = _1146 * 0.15915493667125701904296875;
        _478 = _1148;
    }
    float _1150 = _478;
    float _1152 = _1136 + _1086;
    float _1154 = _188;
    float _1156 = _1152;
    float _1158 = _1150;
    if (_1108)
    {
        float _1160 = _1150 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        _1154 = _1162;
    }
    float _1164 = _1154;
    if (_1108)
    {
        float _1166 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _256 = _1166;
    }
    float _1168 = _256;
    float _1170 = _1168;
    if (_1108)
    {
        float _1172 = fma(_1164, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1170 = _1172;
    }
    float _1174 = _1170;
    float _1176 = _1174;
    if (_1108)
    {
        float _1178 = _1140 * _1174;
        _1176 = _1178;
    }
    float _1180 = _1176;
    if (_1108)
    {
        float _1182 = fma(_1094, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1124 = _1182;
    }
    float _1184 = _1124;
    if (_1108)
    {
        float _1186 = fma(_1098, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1126 = _1186;
    }
    float _1188 = _1126;
    float _1190 = fma(_1184, 6.2500002968590706586837768554688e-05, 0.5);
    float _1192 = fma(_1188, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5322 = float2(_1190, _1192);
    float3 _1196 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5322, float2(0.0), isnan(_5322)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5322, float2(0.0), isnan(_5322)), level(0.0)).xyz;
    float _1198 = _1196.x;
    float _1200 = _1196.y;
    float _1202 = _1196.z;
    float _1204 = float(uint(_592));
    float _1206 = trunc(_780);
    int _1208 = int(_1206);
    int _1210 = ~_592;
    int _1212 = _1210 + 1;
    int _1214 = ~_592;
    int _1216 = _1214 + 1;
    bool _1218 = _592 == 0;
    float _1220 = 1.0 / _1204;
    bool _1222 = !_524;
    float _1224 = _1222 ? _586 : _510;
    int _1226 = ~_592;
    int _1228 = _1226 + 1;
    float _1230 = float(uint(_1208));
    int _1232 = as_type<int>(_1220) + (-2);
    float _1234 = as_type<float>(_1232) * _1230;
    bool _1236 = !_524;
    float _1238 = _1236 ? 1.2345600128173828125 : 1.0;
    float _1240 = trunc(_1234);
    float _1242 = precise::max(_1240, 0.0);
    uint _1245 = uint(_1242);
    float _1247 = _1238 * _1224;
    float _1249 = floor(_1247);
    int _1251 = _1212 * int(_1245);
    int _1253 = _1251 + _1208;
    float _1255 = float(uint(_1253));
    float _1257 = as_type<float>(_1232) * _1255;
    float _1259 = trunc(_1257);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    int _1265 = int(_1245) + int(_1263);
    float _1267 = float(_1208);
    int _1269 = _1216 * _1265;
    int _1271 = _1269 + _1208;
    bool _1273 = _1267 >= _794;
    bool _1275 = isnan(_1267);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan(_794);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = -_1249;
    float _1287 = _1247 + _1285;
    float _1289 = float(_132);
    bool _1291 = uint(_1271) >= uint(_592);
    float _1293 = _794 * _1287;
    float _1295 = trunc(_1283);
    int _1297 = int(_1295);
    int _1299 = _592 + (-1);
    bool _1301 = !_1291;
    int _1303 = _1301 ? 0 : (-1);
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1307 = _1305 != 0;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1311 = _1309 != 0;
    int _1313 = ~_1265;
    int _1315 = _1313 + _1303;
    int _1317 = _1315 + 1;
    float _1319 = 1.0 / _1289;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1323 = _1321 != 0;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1327 = _1325 != 0;
    int _1329 = _592 * _1317;
    int _1331 = _1329 + _1208;
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1335 = _1333 != 0;
    float _1337 = in.m_81.x;
    int _1339 = ~_1297;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    float _1345 = trunc(_1293);
    int _1347 = int(_1345);
    bool _1349 = !_1218;
    int _1351 = _1349 ? _1331 : (-1);
    int _1353 = _1343 * _1351;
    float _1355 = _806 * _1319;
    bool _1357 = !_1311;
    int _1359 = _1357 ? 0 : 1;
    bool _1361 = !_1307;
    int _1363 = _1361 ? 0 : 1;
    float _1365 = trunc(_1355);
    int _1367 = int(_1365);
    int _1369 = abs(_1359);
    int _1371 = _1297 * _1299;
    int _1373 = _1371 + _1353;
    bool _1375 = !_1335;
    int _1377 = _1375 ? 0 : 1;
    bool _1379 = !_1323;
    int _1381 = _1379 ? 0 : 1;
    int _1383 = abs(_1363);
    int _1385 = abs(_1377);
    int _1387 = abs(_1381);
    int _1389 = _1373 * _1369;
    int _1391 = _1347 * _1385;
    int _1393 = _1391 + _1208;
    bool _1395 = !_1327;
    int _1397 = _1395 ? 0 : 1;
    int _1399 = _1367 * _1383;
    int _1401 = _1399 + _1389;
    int _1403 = abs(_1397);
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1407 = _1405 != 0;
    int _1409 = _1393 * _1387;
    int _1411 = _1409 + _1401;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1415 = _1413 != 0;
    float _1417 = float(uint(_1393));
    int _1419 = _1347 * _1403;
    int _1421 = _1419 + _1411;
    int _1423 = ~_592;
    int _1425 = _1423 + 1;
    float _1427 = as_type<float>(_1232) * _1417;
    float _1429 = float(uint(_1421));
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1433 = _1335;
    float _1435 = as_type<float>(_1228);
    float _1437 = _1188;
    if (_1407)
    {
        bool _1439 = _516 > 0.5;
        _1433 = _1439;
    }
    bool _1441 = _1433;
    float _1443 = as_type<float>(_1232) * _1429;
    float _1445 = _1337;
    if (_1415)
    {
        float _1447 = -_1337;
        float _1449 = _1447 + 1.0;
        _564 = as_type<int>(_1449);
    }
    int _1451 = _564;
    if (!_1415)
    {
        _480 = _1337;
    }
    float _1453 = _480;
    float _1455 = trunc(_1427);
    float _1457 = precise::max(_1455, 0.0);
    uint _1459 = uint(_1457);
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1463 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = trunc(_1443);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    int _1471 = ~_592;
    int _1473 = _1471 + 1;
    int _1475 = _1425 * int(_1469);
    int _1477 = _1475 + _1421;
    float _1479 = float(uint(_1477));
    float _1481 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1483 = as_type<float>(_1232) * _1479;
    float _1485 = _1481 * _510;
    float _1487 = in.m_75.w;
    float _1489 = trunc(_1483);
    float _1491 = precise::max(_1489, 0.0);
    uint _1493 = uint(_1491);
    float _1495 = trunc(_1485);
    int _1497 = int(_1495);
    int _1499 = int(_1469) + int(_1493);
    int _1501 = _1473 * _1499;
    int _1503 = _1501 + _1421;
    bool _1505 = _1487 > 0.5;
    bool _1507 = uint(_1503) >= uint(_592);
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    bool _1509 = !_1507;
    int _1511 = _1509 ? 0 : (-1);
    float _1513 = in.m_81.y;
    bool _1515 = _1507;
    int _1517 = _1499;
    float _1519 = _1453;
    float _1521 = _1461;
    if (_1415)
    {
        bool _1523 = _510 > 0.5;
        _1515 = _1523;
    }
    bool _1525 = _1515;
    int _1527 = ~_1499;
    int _1529 = _1527 + _1511;
    int _1531 = _1529 + 1;
    if (_1407)
    {
        float _1533 = -_1337;
        float _1535 = _1533 + 1.0;
        _1517 = as_type<int>(_1535);
    }
    int _1537 = _1517;
    if (_1415)
    {
        float _1539 = _1525 ? as_type<float>(_1451) : _1337;
        _1519 = _1539;
    }
    float _1541 = _1519;
    int _1543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1545 = _1543 != 0;
    int _1547 = _592 * _1531;
    int _1549 = _1547 + _1421;
    int _1551 = _1497 << 4;
    int _1553 = _1551 + 1968;
    float _1555 = in.m_85.x;
    float _1557 = in.m_85.y;
    float _1559 = in.m_85.z;
    if (_1407)
    {
        float _1561 = _1441 ? as_type<float>(_1537) : _1337;
        _1445 = _1561;
    }
    float _1563 = _1445;
    uint _1565 = uint(int(uint(_1553) >> uint(2)));
    uint _1567 = uint(int(uint(int(_1565)) >> uint(2)));
    int _1569 = int(_1565) & 3;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[int(_1567)][_1569];
    int _1573 = int(_1565) + 1;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    int _1577 = _1573 & 3;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[int(_1575)][_1577];
    bool _1581 = !_1218;
    int _1583 = _1581 ? _1549 : (-1);
    bool _1585 = _926 != 0.0;
    bool _1587 = isnan(_926);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.0);
    bool _1593 = _1589 || _1591;
    int _1595 = _1583 >> 31;
    bool _1597 = _924 == 0.0;
    bool _1599 = !_1593;
    bool _1601 = _1597 && _1599;
    int _1603 = _1553 + 8;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = _1595 & 3;
    bool _1615 = _928 == 0.0;
    bool _1617 = _1615 && _1601;
    float _1619 = -_1513;
    float _1621 = _1619 + 1.0;
    int _1623 = _1583 + _1613;
    int _1625 = _1228 * int(_1459);
    int _1627 = _1625 + _1393;
    int _1629 = _1623 >> 2;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1633 = _1629 << 4;
    int _1635 = _1633 + 512;
    float _1637 = float(uint(_1627));
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    uint _1641 = uint(int(uint(_1635) >> uint(2)));
    uint _1643 = uint(int(uint(int(_1641)) >> uint(2)));
    int _1645 = int(_1641) & 3;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[int(_1643)][_1645];
    int _1649 = int(_1641) + 1;
    uint _1651 = uint(int(uint(_1649) >> uint(2)));
    int _1653 = _1649 & 3;
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[int(_1651)][_1653];
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1659 = _1657 != 0;
    float _1661 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1665 = _1663 != 0;
    float _1667 = as_type<float>(_1232) * _1637;
    int _1669 = _1505 ? as_type<int>(_1621) : as_type<int>(_1513);
    float _1671 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1673 = _586 > 0.5;
    float _1675 = _1665 ? as_type<float>(_1669) : _1513;
    float _1677 = trunc(_1667);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    float _1683 = _1513;
    float _1685 = _1621;
    float _1687 = _1637;
    if (_1545)
    {
        float _1689 = _1673 ? _1621 : _1513;
        _1683 = _1689;
    }
    float _1691 = _1683;
    out.m_87.x = _1661;
    out.m_87.y = _1671;
    out.m_87.z = _1463;
    out.m_87.w = _1461;
    if (_1617)
    {
        _1435 = _1555;
    }
    float _1693 = _1435;
    float _1695 = _1693;
    if (_1617)
    {
        _1685 = _1557;
    }
    float _1697 = _1685;
    float _1699 = _1697;
    if (_1617)
    {
        _1687 = _1693;
    }
    float _1701 = _1687;
    int _1703 = _1583 & 3;
    bool _1705 = _1703 != 0;
    float _1707 = _1701;
    if (!_1617)
    {
        _1695 = _1555;
    }
    float _1709 = _1695;
    bool _1711 = uint(_1703) > 1u;
    int _1713 = _1705 ? 0 : 1;
    float _1715 = _1579 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1717 = _1571;
    if (_1617)
    {
        _1521 = _1697;
    }
    float _1719 = _1521;
    float _1721 = _1571 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1723 = _1719;
    if (!_1617)
    {
        _1699 = _1557;
    }
    float _1725 = _1699;
    if (!_1617)
    {
        float _1727 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1709);
        _1707 = _1727;
    }
    float _1729 = _1707;
    int _1731 = _1635 + 8;
    uint _1733 = uint(int(uint(_1731) >> uint(2)));
    uint _1735 = uint(int(uint(int(_1733)) >> uint(2)));
    int _1737 = int(_1733) & 3;
    float _1739 = (*spvDescriptorSet0.vp_c9)._m0[int(_1735)][_1737];
    int _1741 = int(_1733) + 1;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    int _1745 = _1741 & 3;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[int(_1743)][_1745];
    int _1749 = ~_592;
    int _1751 = _1749 + 1;
    float _1753 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1755 = int(_1459) + int(_1681);
    float _1757 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1759 = ~_1713;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    float _1765 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1767 = _1763;
    if (!_1711)
    {
        int _1769 = ~_1713;
        int _1771 = _1769 + 1;
        _1767 = _1771;
    }
    int _1773 = _1767;
    int _1775 = _1751 * _1755;
    int _1777 = _1775 + _1393;
    bool _1779 = _1703 != 3;
    float _1781 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1783 = int(_1781);
    int _1785 = abs(_1773);
    float _1787 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1617)
    {
        _1717 = _1559;
    }
    float _1789 = _1717;
    float _1791 = _1789;
    if (!_1617)
    {
        float _1793 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1559);
        _1791 = _1793;
    }
    float _1795 = _1791;
    bool _1797 = uint(_1703) >= 2u;
    if (!_1617)
    {
        float _1799 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1725);
        _1723 = _1799;
    }
    float _1801 = _1723;
    bool _1803 = uint(_1777) >= uint(_592);
    out.m_89.x = _1757;
    out.m_89.y = _1765;
    out.m_89.z = _1787;
    int _1805 = _1797 ? 0 : 1;
    int _1807 = _1583 & 3;
    bool _1809 = _1807 != 0;
    int _1811 = ~_1785;
    int _1813 = _1811 + 1;
    int _1815 = _1813 + 1;
    bool _1817 = _1703 != 3;
    float _1819 = float(uint(_1783));
    bool _1821 = !_1803;
    int _1823 = _1821 ? 0 : (-1);
    int _1825 = ~_1805;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    int _1831 = ~_1755;
    int _1833 = _1831 + _1823;
    int _1835 = _1833 + 1;
    int _1837 = _1815 * as_type<int>(_1655);
    bool _1839 = !_1809;
    int _1841 = _1839 ? 0 : 1;
    int _1843 = _1829;
    if (_1779)
    {
        int _1845 = ~_1805;
        int _1847 = _1845 + 1;
        _1843 = _1847;
    }
    int _1849 = _1843;
    float _1851 = in.m_91.x;
    float _1853 = in.m_91.y;
    float _1855 = in.m_91.z;
    float _1857 = in.m_91.w;
    int _1859 = abs(_1841);
    bool _1861 = !_1817;
    int _1863 = _1861 ? 0 : (-1);
    int _1865 = abs(_1783);
    int _1867 = abs(_1849);
    int _1869 = abs(_1863);
    float _1871 = 1.0 / _1819;
    int _1873 = ~_1859;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    bool _1879 = !_1659;
    int _1881 = _1879 ? 0 : 1;
    int _1883 = _1877 * as_type<int>(_1647);
    int _1885 = _1883 + _1837;
    int _1887 = ~_1867;
    int _1889 = _1887 + 1;
    int _1891 = _1889 + 1;
    int _1893 = abs(_1881);
    int _1895 = ~_1869;
    int _1897 = _1895 + 1;
    int _1899 = _1897 + 1;
    int _1901 = _1891 * as_type<int>(_1739);
    int _1903 = _1901 + _1885;
    int _1905 = _592 * _1835;
    int _1907 = _1905 + _1393;
    float _1909 = float(uint(_1865));
    int _1911 = _1899 * as_type<int>(_1747);
    int _1913 = _1911 + _1903;
    int _1915 = ~_1893;
    int _1917 = _1915 + 1;
    int _1919 = _1917 + 1;
    float _1921 = _1853 * _1559;
    float _1923 = 1.0 / _1909;
    bool _1925 = !_1218;
    int _1927 = _1925 ? _1907 : (-1);
    float _1929 = _1851 * _1725;
    int _1931 = _1919 * _1913;
    float _1933 = _1855 * _1709;
    float _1935 = -_1921;
    float _1937 = fma(_1855, _1725, _1935);
    float _1939 = -_1929;
    float _1941 = fma(_1853, _1709, _1939);
    int _1943 = _1927 * _1893;
    int _1945 = _1943 + _1931;
    float _1947 = -_1933;
    float _1949 = fma(_1851, _1559, _1947);
    float _1951 = _1937 * _1857;
    float _1953 = _1941 * _1857;
    int _1955 = as_type<int>(_1871) + (-2);
    float _1957 = _1949 * _1857;
    float _1959 = float(uint(_1945));
    float _1961 = -_1801;
    float _1963 = _1018 * _1961;
    int _1965 = abs(_1945);
    float _1967 = -_1853;
    float _1969 = _1018 * _1967;
    int _1971 = as_type<int>(_1923) + (-2);
    float _1973 = as_type<float>(_1955) * _1959;
    float _1975 = float(uint(_1965));
    float _1977 = -_1957;
    float _1979 = _1018 * _1977;
    float _1981 = fma(_1026, _1729, _1963);
    int _1983 = ~_1783;
    int _1985 = _1983 + 1;
    float _1987 = fma(_1026, _1851, _1969);
    float _1989 = trunc(_1973);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = as_type<float>(_1971) * _1975;
    float _1997 = _1024 * _1801;
    float _1999 = fma(_1026, _1951, _1979);
    float _2001 = _1024 * _1853;
    float _2003 = _1028 * _1853;
    float _2005 = _1028 * _1801;
    float _2007 = _1024 * _1957;
    float _2009 = trunc(_1995);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    float _2015 = fma(_1038, _1729, _1997);
    int _2017 = ~_1865;
    int _2019 = _2017 + 1;
    float _2021 = _1028 * _1957;
    float _2023 = fma(_1038, _1851, _2001);
    float _2025 = fma(_1038, _1951, _2007);
    int _2027 = _1985 * int(_1993);
    int _2029 = _2027 + _1945;
    float _2031 = fma(_1050, _1951, _2021);
    float _2033 = fma(_1050, _1729, _2005);
    float _2035 = fma(_1050, _1851, _2003);
    float _2037 = fma(_1030, _1855, _1987);
    float _2039 = float(uint(_2029));
    float _2041 = fma(_1046, _1855, _2023);
    float _2043 = fma(_1056, _1855, _2035);
    int _2045 = _2019 * int(_2013);
    int _2047 = _2045 + _1965;
    float _2049 = fma(_1046, _1953, _2025);
    float _2051 = as_type<float>(_1955) * _2039;
    float _2053 = fma(_1046, _1795, _2015);
    float _2055 = fma(_1030, _1795, _1981);
    float _2057 = float(uint(_2047));
    float _2059 = trunc(_2051);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = ~_1783;
    int _2067 = _2065 + 1;
    float _2069 = fma(_1056, _1795, _2033);
    float _2071 = fma(_1056, _1953, _2031);
    float _2073 = as_type<float>(_1971) * _2057;
    float _2075 = _2041 * _446;
    float _2077 = fma(_1030, _1953, _1999);
    float _2079 = _2049 * _416;
    float _2081 = _2031;
    float _2083 = as_type<float>(_1965);
    float _2085 = _2055;
    float _2087 = _2071;
    float _2089 = _2077;
    if (_1108)
    {
        float _2091 = _1150 * 6.283185482025146484375;
        float _2093 = cos(_2091);
        _2081 = _2093;
    }
    float _2095 = _2081;
    float _2097 = _2053 * _446;
    float _2099 = _2049 * _446;
    float _2101 = _2041 * _456;
    float _2103 = _2053 * _456;
    float _2105 = _2049 * _456;
    float _2107 = _2041 * _416;
    float _2109 = trunc(_2073);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = int(_1993) + int(_2063);
    float _2117 = _2053 * _416;
    int _2119 = ~_1865;
    int _2121 = _2119 + 1;
    float _2123 = fma(_2037, _380, _2107);
    float _2125 = fma(_2037, _394, _2101);
    int _2127 = _2067 * _2115;
    int _2129 = _2127 + _1945;
    float _2131 = fma(_2055, _380, _2117);
    float _2133 = fma(_2077, _380, _2079);
    float _2135 = fma(_2055, _390, _2097);
    bool _2137 = uint(_2129) >= uint(_1783);
    float _2139 = fma(_2055, _394, _2103);
    float _2141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2143 = _2103;
    float _2145 = as_type<float>(_2121);
    if (_1108)
    {
        float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2149 = _1184 + _2147;
        _2143 = _2149;
    }
    float _2151 = _2143;
    bool _2153 = !_2137;
    int _2155 = _2153 ? 0 : (-1);
    float _2157 = fma(_2037, _390, _2075);
    int _2159 = int(_2013) + int(_2113);
    float _2161 = as_type<float>(_2113);
    if (_1108)
    {
        float _2163 = _2151 * _2151;
        _1128 = _2163;
    }
    float _2165 = _1128;
    int _2167 = ~_2115;
    int _2169 = _2167 + _2155;
    int _2171 = _2169 + 1;
    float _2173 = fma(_2043, _464, _2157);
    int _2175 = _1945 ^ _1783;
    int _2177 = _2121 * _2159;
    int _2179 = _2177 + _1965;
    float _2181 = as_type<float>(_2179);
    if (_1108)
    {
        float _2183 = _2095 + (-1.0);
        _2083 = _2183;
    }
    float _2185 = _2083;
    int _2187 = _1783 * _2171;
    int _2189 = _2187 + _1945;
    uint _2191 = uint(int(uint(_2175) >> uint(31)));
    float _2193 = fma(_2043, _468, _2125);
    if (_1108)
    {
        float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2085 = _2195;
    }
    float _2197 = _2085;
    bool _2199 = uint(_2179) >= uint(_1865);
    float _2201 = fma(_2077, _390, _2099);
    int _2203 = ~int(_2191);
    int _2205 = _2203 + 1;
    float _2207 = _2201;
    if (_1108)
    {
        float _2209 = fma(_1152, _2095, _2197);
        _1156 = _2209;
    }
    float _2211 = _1156;
    bool _2213 = !_2199;
    int _2215 = _2213 ? 0 : (-1);
    float _2217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2219 = _1783 == 0;
    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2223 = _2211 + _2221;
    int _2225 = ~_2215;
    int _2227 = _2159 + _2225;
    int _2229 = _2227 + 1;
    if (_1108)
    {
        float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2233 = _1188 + _2231;
        _2181 = _2233;
    }
    float _2235 = _2181;
    bool _2237 = _1783 == 0;
    float _2239 = fma(_2077, _394, _2105);
    int _2241 = _2229 ^ _2205;
    float _2243 = fma(_2223, _2223, _2165);
    bool _2245 = !_2219;
    int _2247 = _2245 ? _2189 : (-1);
    float _2249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2251 = ~_2205;
    int _2253 = _2251 + _2241;
    int _2255 = _2253 + 1;
    if (_1108)
    {
        float _2257 = _2235 * _2235;
        _1130 = _2257;
    }
    float _2259 = _1130;
    float _2261 = _2141 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2263 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2265 = !_2237;
    int _2267 = _2265 ? _2255 : (-1);
    float _2269 = _2243 + _2259;
    float _2271 = float(_2247);
    float _2273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2275 = float(_2267);
    float _2277 = _2217 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2279 = fma(_2261, _1563, -0.5);
    float _2281 = fma(_2261, _2271, _802);
    float _2283 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2285 = fma(_2277, _1675, -0.5);
    float _2287 = -_804;
    float _2289 = fma(_2277, _2275, _2287);
    float _2291 = sqrt(_2269);
    float _2293 = fma(_624, _2279, _2281);
    float _2295 = _2283 * _2249;
    float _2297 = fma(_632, _2285, _2289);
    float _2299 = fma(_2069, _460, _2131);
    float _2301 = fma(_2071, _460, _2133);
    float _2303 = fma(_2071, _464, _2201);
    float _2305 = fma(_2071, _468, _2239);
    float _2307 = _2263 * _2273;
    float _2309 = fma(_2043, _460, _2123);
    float _2311 = _2293 + 0.5;
    float _2313 = _2297 + 0.5;
    float _2315 = fma(_2069, _464, _2135);
    float _2317 = fma(_2069, _468, _2139);
    out.m_93.x = _2309;
    out.m_93.y = _2173;
    out.m_93.z = _2193;
    bool _2319 = _2291 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2321 = isnan(_2291);
    bool _2323 = _2319 || _2321;
    bool _2325 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2327 = _2323 || _2325;
    out.m_95.x = _2301;
    out.m_95.y = _2303;
    out.m_95.z = _2305;
    out.m_97.x = _2295;
    out.m_97.y = _2307;
    out.m_97.z = _2311;
    out.m_97.w = _2313;
    out.m_99.x = _1198;
    out.m_99.y = _1200;
    out.m_99.z = _1202;
    if (!_2327)
    {
        _2207 = 1.0;
    }
    float _2329 = _2207;
    out.m_101.x = _2299;
    out.m_101.y = _2315;
    out.m_101.z = _2317;
    bool _2331 = !_2327;
    float _2333 = _2329;
    if (!_2331)
    {
        bool _2335 = _2291 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2337 = isnan(_2291);
        bool _2339 = _2335 || _2337;
        bool _2341 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2343 = _2339 || _2341;
        if (!_2343)
        {
            float _2345 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2347 = _2291 + _2345;
            float _2349 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2351 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2349;
            float _2353 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2357 = 1.0 / _2351;
            float _2359 = _2347 * _2357;
            float _2361 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2333 = _2361;
            _2363 = true;
        }
        else
        {
            bool _2365 = _2291 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2367 = isnan(_2291);
            bool _2369 = _2365 || _2367;
            bool _2371 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2373 = _2369 || _2371;
            if (!_2373)
            {
                float _2375 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2377 = _2291 + _2375;
                float _2379 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2381 = _2379 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2383 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2385 = _2383 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2387 = 1.0 / _2381;
                float _2389 = _2377 * _2387;
                float _2391 = fma(_2389, _2385, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2333 = _2391;
                _2363 = true;
            }
            else
            {
                _2333 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2363 = false;
    float _2393 = _2333;
    float _2395 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2397 = _2211 + _2395;
    float _2399 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2401 = _1184 + _2399;
    float _2403 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2405 = _1188 + _2403;
    float _2407 = fma(_2397, _2393, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2409 = fma(_2401, _2393, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2411 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2415 = _2407 + _2413;
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2419 = _2409 + _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2423 = _2411 + _2421;
    float _2425 = _2415 * _2415;
    float _2427 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2429 = fma(_2419, _2419, _2425);
    float _2431 = floor(_2427);
    float _2433 = fma(_2423, _2423, _2429);
    float _2435 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2437 = rsqrt(_2433);
    float _2439 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2435);
    float _2441 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2439);
    float _2443 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2445 = -_2431;
    float _2447 = _2427 + _2445;
    float _2449 = _2441 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2451 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2443);
    float _2453 = sqrt(_2433);
    float _2455 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2451);
    float _2457 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2459 = _2455 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2461 = 1.0 / _2449;
    float _2463 = _2419 * _2457;
    float _2465 = _2423 * _2457;
    float _2467 = _2459 + _2449;
    float _2469 = _2463 * _2463;
    float _2471 = _2465 * _2465;
    float _2473 = _2469 + _2471;
    float _2475 = sqrt(_2473);
    float _2477 = _2467 * _2461;
    float _2479 = _2477 * 0.5;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2483 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2481);
    float _2485 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2487 = 1.0 / _2483;
    float _2489 = _1136 + _2485;
    bool _2491 = _2475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2493 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2495 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2499 = _2475 + _2497;
    float _2501 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2493);
    float _2503 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2495);
    float _2505 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2501);
    float _2507 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2503);
    float _2509 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2511 = _2487 * _2509;
    float _2513 = _2193;
    float _2515 = _2499;
    int _2517 = 2;
    float _2519 = _2465;
    float _2521 = _2469;
    if (_2491)
    {
        float _2523 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2513 = _2523;
    }
    float _2525 = _2513;
    float _2527 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2529 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2531 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2533 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2535 = trunc(_2527);
    int _2537 = int(_2535);
    float _2539 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2541 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2543 = _2539;
    int _2545 = as_type<int>(_2529);
    if (_2491)
    {
        float _2547 = _2499 * _2525;
        _2515 = _2547;
    }
    float _2549 = _2515;
    float _2551 = trunc(_2529);
    int _2553 = int(_2551);
    if (!_2531)
    {
        _2517 = 1;
    }
    int _2555 = _2517;
    int _2557 = _2555;
    if (_2491)
    {
        float _2559 = _2549 * 0.15915493667125701904296875;
        _1158 = _2559;
    }
    float _2561 = _1158;
    bool _2563 = !_2531;
    int _2565 = _2563 ? 0 : 1;
    int _2567 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2569 = _2537 + _2567;
    int _2571 = _2569 + 1;
    float _2573 = (*spvDescriptorSet0.vp_c13)._m0[1].y;
    if (_2491)
    {
        float _2575 = _2561 * 6.283185482025146484375;
        float _2577 = sin(_2575);
        _2573 = _2577;
    }
    float _2579 = _2573;
    if (!_2533)
    {
        _2557 = _2565;
    }
    int _2581 = _2557;
    float _2583 = precise::max(0.0, _2539);
    int _2585 = _2581 << 6;
    bool _2587 = _2571 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2589 = _2473;
    float _2591 = as_type<float>(_2581);
    if (_2491)
    {
        float _2593 = rsqrt(_2473);
        _2589 = _2593;
    }
    float _2595 = _2589;
    int _2597 = _2585 + 48;
    uint _2599 = uint(int(uint(_2597) >> uint(2)));
    uint _2601 = uint(int(uint(int(_2599)) >> uint(2)));
    int _2603 = int(_2599) & 3;
    float _2605 = (*spvDescriptorSet0.vp_c15)._m0[int(_2601)][_2603];
    int _2607 = int(_2599) + 1;
    uint _2609 = uint(int(uint(_2607) >> uint(2)));
    int _2611 = _2607 & 3;
    float _2613 = (*spvDescriptorSet0.vp_c15)._m0[int(_2609)][_2611];
    float _2615 = -_2457;
    float _2617 = -_2583;
    float _2619 = fma(_2415, _2615, _2617);
    int _2621 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2623 = _2553 + _2621;
    int _2625 = _2623 + 1;
    float _2627 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2491)
    {
        float _2629 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2543 = _2629;
    }
    float _2631 = _2543;
    int _2633 = _2571 | _2625;
    float _2635 = _2561;
    if (_2491)
    {
        float _2637 = _2561 * 6.283185482025146484375;
        float _2639 = cos(_2637);
        _2635 = _2639;
    }
    float _2641 = _2635;
    int _2643 = _2585 + 96;
    uint _2645 = uint(int(uint(_2643) >> uint(2)));
    uint _2647 = uint(int(uint(int(_2645)) >> uint(2)));
    int _2649 = int(_2645) & 3;
    float _2651 = (*spvDescriptorSet0.vp_c15)._m0[int(_2647)][_2649];
    int _2653 = int(_2645) + 1;
    uint _2655 = uint(int(uint(_2653) >> uint(2)));
    int _2657 = _2653 & 3;
    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[int(_2655)][_2657];
    if (_2491)
    {
        float _2661 = fma(_2579, _2631, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2145 = _2661;
    }
    float _2663 = _2145;
    bool _2665 = _2633 < 0;
    bool _2667 = _2665 || _2587;
    bool _2669 = _2625 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2671 = _2669 || _2667;
    float _2673 = _2595;
    if (_2491)
    {
        float _2675 = _2595 * _2663;
        _1437 = _2675;
    }
    float _2677 = _1437;
    int _2679 = _2585 + 64;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    uint _2683 = uint(int(uint(int(_2681)) >> uint(2)));
    int _2685 = int(_2681) & 3;
    float _2687 = (*spvDescriptorSet0.vp_c15)._m0[int(_2683)][_2685];
    int _2689 = int(_2681) + 1;
    uint _2691 = uint(int(uint(_2689) >> uint(2)));
    int _2693 = _2689 & 3;
    float _2695 = (*spvDescriptorSet0.vp_c15)._m0[int(_2691)][_2693];
    float _2697 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2627);
    if (!_2491)
    {
        _2673 = _2619;
    }
    float _2699 = _2673;
    float _2701 = _2699;
    if (_2491)
    {
        float _2703 = _2465 * _2677;
        _2519 = _2703;
    }
    float _2705 = _2519;
    float _2707 = floor(_2541);
    float _2709 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2697);
    float _2711 = _2709;
    if (_2491)
    {
        float _2713 = _2641 + (-1.0);
        _2087 = _2713;
    }
    float _2715 = _2087;
    int _2717 = _2585 + 80;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    uint _2721 = uint(int(uint(int(_2719)) >> uint(2)));
    int _2723 = int(_2719) & 3;
    float _2725 = (*spvDescriptorSet0.vp_c15)._m0[int(_2721)][_2723];
    int _2727 = int(_2719) + 1;
    uint _2729 = uint(int(uint(_2727) >> uint(2)));
    int _2731 = _2727 & 3;
    float _2733 = (*spvDescriptorSet0.vp_c15)._m0[int(_2729)][_2731];
    float _2735 = _2715;
    if (_2491)
    {
        float _2737 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2161 = _2737;
    }
    float _2739 = _2161;
    if (!_2491)
    {
        _2735 = _2463;
    }
    float _2741 = _2735;
    float _2743 = _2741;
    if (_2491)
    {
        float _2745 = _2463 * _2677;
        _2743 = _2745;
    }
    float _2747 = _2743;
    float _2749 = _2709 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_2491)
    {
        float _2751 = fma(_2619, _2641, _2739);
        _2701 = _2751;
    }
    float _2753 = _2701;
    int _2755 = _2585 + 104;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    uint _2759 = uint(int(uint(int(_2757)) >> uint(2)));
    int _2761 = int(_2757) & 3;
    float _2763 = (*spvDescriptorSet0.vp_c15)._m0[int(_2759)][_2761];
    int _2765 = int(_2757) + 1;
    uint _2767 = uint(int(uint(_2765) >> uint(2)));
    int _2769 = _2765 & 3;
    float _2771 = (*spvDescriptorSet0.vp_c15)._m0[int(_2767)][_2769];
    if (_2491)
    {
        float _2773 = _2747 * _2747;
        _2521 = _2773;
    }
    float _2775 = _2521;
    if (!_2491)
    {
        _2711 = _2471;
    }
    float _2777 = _2711;
    float _2779 = _2777;
    if (_2491)
    {
        float _2781 = _2705 * _2705;
        _2779 = _2781;
    }
    float _2783 = _2779;
    if (!_2671)
    {
        float _2785 = floor(_2529);
        _2089 = _2785;
    }
    float _2787 = _2089;
    float _2789 = fma(_2753, _2753, _2775);
    float _2791 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2793 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2795 = _2585 + 88;
    uint _2797 = uint(int(uint(_2795) >> uint(2)));
    uint _2799 = uint(int(uint(int(_2797)) >> uint(2)));
    int _2801 = int(_2797) & 3;
    float _2803 = (*spvDescriptorSet0.vp_c15)._m0[int(_2799)][_2801];
    int _2805 = int(_2797) + 1;
    uint _2807 = uint(int(uint(_2805) >> uint(2)));
    int _2809 = _2805 & 3;
    float _2811 = (*spvDescriptorSet0.vp_c15)._m0[int(_2807)][_2809];
    float _2813 = _2789 + _2783;
    float _2815 = -_2707;
    float _2817 = _2541 + _2815;
    float _2819 = -_2793;
    float _2821 = fma(_2819, _2791, 1.0);
    int _2823 = as_type<int>(_2793);
    if (!_2671)
    {
        int _2825 = _2625 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2827 = _2825 + _2571;
        _2823 = _2827;
    }
    int _2829 = _2823;
    float _2831 = rsqrt(_2813);
    int _2833 = _2585 + 72;
    uint _2835 = uint(int(uint(_2833) >> uint(2)));
    uint _2837 = uint(int(uint(int(_2835)) >> uint(2)));
    int _2839 = int(_2835) & 3;
    float _2841 = (*spvDescriptorSet0.vp_c15)._m0[int(_2837)][_2839];
    int _2843 = int(_2835) + 1;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    int _2847 = _2843 & 3;
    float _2849 = (*spvDescriptorSet0.vp_c15)._m0[int(_2845)][_2847];
    float _2851 = _2489 * _2613;
    float _2853 = fma(_1034, _2605, _2851);
    int _2855 = _2585 + 56;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    uint _2859 = uint(int(uint(int(_2857)) >> uint(2)));
    int _2861 = int(_2857) & 3;
    float _2863 = (*spvDescriptorSet0.vp_c15)._m0[int(_2859)][_2861];
    int _2865 = int(_2857) + 1;
    uint _2867 = uint(int(uint(_2865) >> uint(2)));
    int _2869 = _2865 & 3;
    float _2871 = (*spvDescriptorSet0.vp_c15)._m0[int(_2867)][_2869];
    float _2873 = _2489 * _2659;
    float _2875 = fma(_1034, _2651, _2873);
    float _2877 = _2831 * _2747;
    float _2879 = _2489 * _2695;
    float _2881 = _2695;
    if (!_2671)
    {
        float _2883 = -_2787;
        float _2885 = _2529 + _2883;
        _2881 = _2885;
    }
    float _2887 = _2881;
    if (!_2671)
    {
        int _2889 = _2829 << 2;
        _2545 = _2889;
    }
    int _2891 = _2545;
    float _2893 = _2831 * _2753;
    float _2895 = fma(_1034, _2687, _2879);
    float _2897 = _2831 * _2705;
    int _2899 = _2891;
    int _2901 = as_type<int>(_2733);
    if (!_2671)
    {
        int _2903 = 12 & _2891;
        _2899 = _2903;
    }
    int _2905 = _2899;
    float _2907 = _2489 * _2733;
    float _2909 = as_type<float>(_2905);
    if (!_2671)
    {
        uint _2911 = uint(int(uint(_2829) >> uint(2)));
        _2901 = int(_2911);
    }
    int _2913 = _2901;
    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2917 = fma(_2453, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2915);
    float _2919 = precise::clamp(_2917, 0.0, 1.0);
    float _2921 = fma(_1034, _2725, _2907);
    if (!_2671)
    {
        int _2923 = _2913 << 4;
        int _2925 = _2923 + _2905;
        _2909 = as_type<float>(_2925);
    }
    float _2927 = _2909;
    float _2929 = -_2919;
    float _2931 = _2929 + 1.0;
    float _2933 = log2(_2821);
    float _2935 = fma(_1064, _2763, _2875);
    float _2937 = _2927;
    if (!_2671)
    {
        int _2939 = as_type<int>(_2927) + 400;
        uint _2941 = uint(int(uint(_2939) >> uint(2)));
        uint _2943 = uint(int(uint(int(_2941)) >> uint(2)));
        int _2945 = int(_2941) & 3;
        float _2947 = (*spvDescriptorSet0.vp_c15)._m0[int(_2943)][_2945];
        _2937 = _2947;
    }
    float _2949 = _2937;
    float _2951 = _2935 + _2771;
    float _2953 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2955 = abs(_2931);
    float _2957 = log2(_2955);
    float _2959 = fma(_1064, _2803, _2921);
    float _2961 = -_2953;
    float _2963 = fma(_2893, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2961);
    float _2965 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2967 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2965);
    float _2969 = 1.0 / _2951;
    float _2971 = fma(_1064, _2841, _2895);
    float _2973 = _2933 * 0.693147182464599609375;
    float _2975 = _2971 + _2849;
    float _2977 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2979 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2967);
    float _2981 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2983 = fma(_1064, _2863, _2853);
    float _2985 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2977);
    float _2987 = _2979 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2989 = -_2897;
    float _2991 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2963);
    float _2993 = _2983 + _2871;
    float _2995 = _2407 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2997 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2985);
    float _2999 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3001 = fma(_2991, -0.5, 0.5);
    float _3003 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2995);
    float _3005 = _2993 * _2969;
    float _3007 = _2997 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3009 = exp2(_2981);
    float _3011 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3003);
    float _3013 = fma(_2991, 0.5, 0.5);
    bool _3015 = _3005 >= 0.0;
    float _3017 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2999);
    float _3019 = _2975 * _2969;
    float _3021 = _3011 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3023 = _3005 <= 1.0;
    bool _3025 = _3023 && _3015;
    float _3027 = sqrt(_3001);
    float _3029 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3017);
    float _3031 = _2959 + _2811;
    bool _3033 = _3019 >= 0.0;
    bool _3035 = _3033 && _3025;
    float _3037 = fma(_3013, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3039 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3041 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3029);
    bool _3043 = _3019 <= 1.0;
    bool _3045 = _3043 && _3035;
    float _3047 = _2893 + 1.0;
    float _3049 = fma(_3013, _3037, -0.212114393711090087890625);
    float _3051 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3039);
    float _3053 = 1.0 / _3041;
    float _3055 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3057 = -_2893;
    float _3059 = fma(_3009, _3047, _3057);
    float _3061 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3051);
    float _3063 = fma(_3013, _3049, 1.570728778839111328125);
    float _3065 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3055);
    float _3067 = _3027 * 0.636619746685028076171875;
    float2 _8290 = float2(_2447, _2817);
    float _3069 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8290, float2(0.0), isnan(_8290)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8290, float2(0.0), isnan(_8290)), level(0.0)).x;
    float _3071 = _2821;
    if (!_2671)
    {
        float _3073 = floor(_2527);
        _3071 = _3073;
    }
    float _3075 = _3071;
    if (_3045)
    {
        float _3077 = float(_2581);
        _2591 = _3077;
    }
    float _3079 = _2591;
    float _3081 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3065);
    float _3083 = -_3063;
    float _3085 = fma(_3067, _3083, 1.0);
    float _3087 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3061);
    float _3089 = _3031 * _2969;
    float _3091 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3081);
    float _3093 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3095 = _3051;
    if (_3045)
    {
        float _3097 = rint(_3079);
        float _3099 = precise::max(_3097, 0.0);
        uint _3101 = uint(_3099);
        uint _3103 = clamp(_3101, 0u, 65535u);
        _3095 = as_type<float>(_3103);
    }
    float _3105 = _3095;
    float _3107 = _3087 * _3053;
    float _3109 = _3091 * _3053;
    float _3111 = fma(_3107, 0.5, 0.5);
    float _3113 = fma(_3109, -0.5, 0.5);
    float _3115 = _2893;
    if (!_2671)
    {
        float _3117 = rint(_2949);
        float _3119 = precise::max(_3117, 0.0);
        uint _3121 = uint(_3119);
        uint _3123 = clamp(_3121, 0u, 65535u);
        _3115 = as_type<float>(_3123);
    }
    float _3125 = _3115;
    float _3127 = _3075;
    if (!_2671)
    {
        float _3129 = -_3075;
        float _3131 = _2527 + _3129;
        _3127 = _3131;
    }
    float _3133 = _3127;
    float _3135 = fma(_3059, 0.5, 0.5);
    float _3137 = (*spvDescriptorSet0.vp_c15)._m0[23].w;
    if (_3045)
    {
        float3 _8405 = float3(_3005, _3019, float(as_type<int>(_3105)));
        float3 _8409 = select(_8405, float3(0.0), isnan(_8405));
        float _3139 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8409.xy, uint(rint(_8409.z)), _3089, level(0.0));
        _3137 = _3139;
    }
    float _3141 = _3137;
    float3 _8419 = float3(_3111, _3113, _3093);
    float _3143 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8419, float3(0.0), isnan(_8419)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8419, float3(0.0), isnan(_8419)), level(0.0)).x;
    float3 _8428 = float3(_3111, _3113, _3093);
    float4 _3146 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8428, float3(0.0), isnan(_8428)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8428, float3(0.0), isnan(_8428)), level(0.0)).xyzw;
    float _3148 = _3146.x;
    float _3150 = _3146.y;
    float _3152 = _3146.z;
    float _3154 = _3146.w;
    float2 _8444 = float2(_3085, _3135);
    float3 _3156 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8444, float2(0.0), isnan(_8444)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8444, float2(0.0), isnan(_8444)), level(0.0)).xyz;
    float _3158 = _3156.x;
    float _3160 = _3156.y;
    float _3162 = _3156.z;
    float _3164 = _2887;
    if (!_2671)
    {
        float3 _8465 = float3(_3133, _2887, float(as_type<int>(_3125)));
        float3 _8467 = select(_8465, float3(0.0), isnan(_8465));
        float _3166 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8467.xy, uint(rint(_8467.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8467.xy, uint(rint(_8467.z)), level(0.0)).x;
        _3164 = _3166;
    }
    float _3168 = _3164;
    float _3170 = abs(_2511);
    float _3172 = log2(_3170);
    float _3174 = _2987 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3176 = fma(_3007, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3174);
    float _3178 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3180 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3176);
    bool _3182 = _2511 <= 8000.0;
    bool _3184 = isnan(_2511);
    bool _3186 = _3182 || _3184;
    bool _3188 = isnan(8000.0);
    bool _3190 = _3186 || _3188;
    float _3192 = float(_3190);
    float _3194 = fma(_3021, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3180);
    float _3196 = exp2(_3178);
    float _3198 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3087;
    out.gl_Position.y = _3091;
    out.gl_Position.z = _3194;
    out.gl_Position.w = _3041;
    float _3200 = exp2(_3198);
    float _3202 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3204 = precise::clamp(_3202, 0.0, 1.0);
    float _3206 = fma(_3204, -2.0, 3.0);
    float _3208 = _3204 * _3204;
    float _3210 = _3208 * _3206;
    float _3212 = _3194 + _3041;
    float _3214 = _3212 * 0.5;
    float _3216 = -_3210;
    float _3218 = _3216 + 1.0;
    out.m_103.z = _3214;
    out.m_103.w = _3041;
    float _3220 = fma(_3218, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3210);
    float _3222 = _3192 * _3220;
    float _3224 = _3220;
    float _3226 = _3194;
    float _3228 = _3087;
    if (!_3045)
    {
        _3224 = 1.0;
    }
    float _3230 = _3224;
    float _3232 = _3222 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3234 = -_3196;
    float _3236 = _3234 + 1.0;
    float _3238 = -_3069;
    float _3240 = _3238 + 1.0;
    float _3242 = _3240 * _3232;
    float _3244 = precise::clamp(_3242, 0.0, 1.0);
    float _3246 = _3230;
    float _3248 = _3236;
    if (_3045)
    {
        bool _3250 = _3141 >= _3089;
        bool _3252 = isnan(_3141);
        bool _3254 = _3250 || _3252;
        bool _3256 = isnan(_3089);
        bool _3258 = _3254 || _3256;
        float _3260 = float(_3258);
        _3246 = _3260;
    }
    float _3262 = _3246;
    float _3264 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3266 = _3264;
    if (_2671)
    {
        _3248 = 1.0;
    }
    float _3268 = _3248;
    float _3270 = _3268;
    if (!_2671)
    {
        int _3272 = _2829 << 4;
        int _3274 = _3272 + 2048;
        uint _3276 = uint(int(uint(_3274) >> uint(2)));
        uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
        int _3280 = int(_3276) & 3;
        float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
        int _3284 = int(_3276) + 1;
        uint _3286 = uint(int(uint(_3284) >> uint(2)));
        int _3288 = _3284 & 3;
        float _3290 = (*spvDescriptorSet0.vp_c15)._m0[int(_3286)][_3288];
        int _3292 = _3274 + 8;
        uint _3294 = uint(int(uint(_3292) >> uint(2)));
        uint _3296 = uint(int(uint(int(_3294)) >> uint(2)));
        int _3298 = int(_3294) & 3;
        float _3300 = (*spvDescriptorSet0.vp_c15)._m0[int(_3296)][_3298];
        int _3302 = int(_3294) + 1;
        uint _3304 = uint(int(uint(_3302) >> uint(2)));
        int _3306 = _3302 & 3;
        float _3308 = (*spvDescriptorSet0.vp_c15)._m0[int(_3304)][_3306];
        float _3310 = _2489 * _3290;
        float _3312 = fma(_1034, _3282, _3310);
        float _3314 = fma(_1064, _3300, _3312);
        float _3316 = _3314 + _3308;
        float _3318 = precise::clamp(_3316, 0.0, 1.0);
        float _3320 = -_3318;
        float _3322 = _3320 + _3168;
        float _3324 = fma(_3322, 500.0, 1.5);
        float _3326 = exp2(_3324);
        float _3328 = 0.0 + _3326;
        float _3330 = precise::clamp(_3328, 0.0, 1.0);
        _3270 = _3330;
        _3226 = _3300;
        _3228 = 500.0;
    }
    float _3332 = _3270;
    float _3334 = _3226;
    float _3336 = _3228;
    float _3338 = _3262 * _3332;
    float _3340 = -_3244;
    float _3342 = fma(_3340, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3344 = _3264 * _3143;
    out.m_105.x = _2409;
    out.m_105.y = _2407;
    out.m_105.z = _2411;
    bool _3346 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3348 = isnan(_2453);
    bool _3350 = _3346 || _3348;
    bool _3352 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3354 = _3350 || _3352;
    float _3356 = -_3338;
    float _3358 = fma(_3356, _3342, 1.0);
    float _3360 = precise::clamp(_3358, 0.0, 1.0);
    float _3362 = _3154 * _3344;
    float _3364 = -_3264;
    float _3366 = _3364 + 1.0;
    float _3368 = _3162 * _3344;
    float _3370 = _3360 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3372 = fma(_3158, _3362, _3148);
    float _3374 = fma(_3160, _3362, _3150);
    float _3376 = _3154 * _3366;
    float _3378 = fma(_3154, _3368, _3152);
    out.m_107.x = _3370;
    float _3380 = _3334;
    float _3382 = _3362;
    float _3384 = _3336;
    float _3386 = _3366;
    float _3388 = _3360;
    if (!_3354)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3390 = _3380;
    out.m_109.x = _3372;
    out.m_109.y = _3374;
    out.m_109.z = _3378;
    out.m_109.w = _3376;
    float _3392 = _3390;
    float _3394 = _3390;
    if (!_3354)
    {
        _3382 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3396 = _3382;
    float _3398 = _3396;
    float _3400 = _3396;
    if (!_3354)
    {
        _3384 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3402 = _3384;
    float _3404 = _3402;
    float _3406 = _3402;
    if (!_3354)
    {
        _3266 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3408 = _3266;
    float _3410 = _3408;
    float _3412 = _3408;
    if (!_3354)
    {
        _3386 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3414 = _3386;
    float _3416 = _3414;
    float _3418 = _3414;
    if (!_3354)
    {
        _3388 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3420 = _3388;
    bool _3422 = !_3354;
    float _3424 = _3420;
    float _3426 = _3420;
    if (!_3422)
    {
        bool _3428 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3430 = isnan(_2453);
        bool _3432 = _3428 || _3430;
        bool _3434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3436 = _3432 || _3434;
        if (!_3436)
        {
            float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3440 = _2453 + _3438;
            float _3442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3442;
            float _3446 = 1.0 / _3444;
            float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3458 = _3456 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3460 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3464 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3466 = _3464 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3468 = _3440 * _3446;
            float _3470 = precise::clamp(_3468, 0.0, 1.0);
            float _3472 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3474 = _3472 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3476 = fma(_3470, _3450, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3478 = fma(_3470, _3474, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3480 = fma(_3470, _3454, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3482 = fma(_3470, _3458, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3484 = fma(_3470, _3462, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3486 = fma(_3470, _3466, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3400 = _3478;
            _3418 = _3484;
            _3394 = _3476;
            _3412 = _3482;
            _3406 = _3480;
            _3426 = _3486;
            _3488 = true;
        }
        else
        {
            bool _3490 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3492 = isnan(_2453);
            bool _3494 = _3490 || _3492;
            bool _3496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3498 = _3494 || _3496;
            if (!_3498)
            {
                _3392 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3500 = _3392;
            _3394 = _3500;
            if (!_3498)
            {
                _3398 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3502 = _3398;
            _3400 = _3502;
            if (!_3498)
            {
                _3404 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3504 = _3404;
            _3406 = _3504;
            if (!_3498)
            {
                _3410 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3506 = _3410;
            _3412 = _3506;
            if (!_3498)
            {
                _3416 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3508 = _3416;
            _3418 = _3508;
            if (!_3498)
            {
                _3424 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3510 = _3424;
            bool _3512 = !_3498;
            _3426 = _3510;
            if (!_3512)
            {
                bool _3514 = _2453 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3516 = isnan(_2453);
                bool _3518 = _3514 || _3516;
                bool _3520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3522 = _3518 || _3520;
                if (!_3522)
                {
                    float _3524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3526 = _2453 + _3524;
                    float _3528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3528;
                    float _3532 = 1.0 / _3530;
                    float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3542 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3554 = _3526 * _3532;
                    float _3556 = precise::clamp(_3554, 0.0, 1.0);
                    float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3560 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3562 = fma(_3556, _3536, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3564 = fma(_3556, _3560, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3566 = fma(_3556, _3540, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3568 = fma(_3556, _3544, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3570 = fma(_3556, _3548, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3572 = fma(_3556, _3552, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3400 = _3564;
                    _3418 = _3570;
                    _3394 = _3562;
                    _3412 = _3568;
                    _3406 = _3566;
                    _3426 = _3572;
                    _3488 = true;
                }
                else
                {
                    _3400 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3418 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3394 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3412 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3406 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3426 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3488 = false;
    float _3574 = _3400;
    float _3576 = _3418;
    float _3578 = _3394;
    float _3580 = _3412;
    float _3582 = _3406;
    float _3584 = _3426;
    float _3586 = fma(_2315, -0.5, 0.5);
    float _3588 = precise::clamp(_3586, 0.0, 1.0);
    float _3590 = -_3574;
    float _3592 = _3590 + _3576;
    float _3594 = -_3578;
    float _3596 = _3594 + _3580;
    float _3598 = -_3582;
    float _3600 = _3598 + _3584;
    bool _3602 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3604 = fma(_3588, _3592, _3574);
    float _3606 = fma(_3588, _3596, _3578);
    float _3608 = fma(_3588, _3600, _3582);
    float _3610 = _3604 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3612 = fma(_3606, 0.298911988735198974609375, _3610);
    float _3614 = fma(_3608, 0.114477999508380889892578125, _3612);
    out.m_111.x = 0.0;
    float _3616 = -_3614;
    float _3618 = _3606 + _3616;
    float _3620 = -_3614;
    float _3622 = _3604 + _3620;
    float _3624 = -_3614;
    float _3626 = _3608 + _3624;
    float _3628 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3630 = fma(_3618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3614);
    float _3632 = fma(_3622, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3614);
    float _3634 = fma(_3626, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3614);
    out.m_107.w = _3628;
    out.m_113.x = _3630;
    out.m_113.y = _3632;
    out.m_113.z = _3634;
    if (!_3602)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3636 = -_2407;
    float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3640 = -_2409;
    float _3642 = _3640 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3644 = -_2411;
    float _3646 = _3644 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3648 = _3638 * _3638;
    float _3650 = fma(_3642, _3642, _3648);
    float _3652 = fma(_3646, _3646, _3650);
    float _3654 = sqrt(_3652);
    float _3656 = rsqrt(_3652);
    float _3658 = -_3654;
    float _3660 = _3658 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3662 = _3660 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3664 = precise::clamp(_3662, 0.0, 1.0);
    float _3666 = _3642 * _3656;
    float _3668 = _3638 * _3656;
    float _3670 = abs(_3664);
    float _3672 = log2(_3670);
    float _3674 = _3646 * _3656;
    float _3676 = _3666 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3678 = _2315 * _3668;
    float _3680 = -_3668;
    float _3682 = -_3676;
    float _3684 = fma(_3680, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3682);
    float _3686 = fma(_2299, _3666, _3678);
    float _3688 = -_3674;
    float _3690 = fma(_3688, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3684);
    float _3692 = fma(_2317, _3674, _3686);
    float _3694 = precise::clamp(_3692, 0.0, 1.0);
    float _3696 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3698 = _3690 + _3696;
    float _3700 = _3672 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3702 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3704 = precise::clamp(_3702, 0.0, 1.0);
    float _3706 = exp2(_3700);
    float _3708 = _3706 * _3704;
    float _3710 = _3694 * _3708;
    float _3712 = _3710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3714 = _3710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3716 = _3710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _3712;
    out.m_111.y = _3714;
    out.m_111.z = _3716;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

