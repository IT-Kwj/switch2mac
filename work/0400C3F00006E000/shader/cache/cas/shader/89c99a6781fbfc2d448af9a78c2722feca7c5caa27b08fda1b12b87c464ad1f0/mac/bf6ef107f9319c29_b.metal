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
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_81 [[user(locn0)]];
    float4 m_63 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_97 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_99 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_69 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_83 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2562 = false;
    bool _1338 = false;
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_60.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_63.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2847 = as_type<float>(_140);
        out.gl_Position.z = _2847;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_65.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_63.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2917 = as_type<float>(_178);
        out.gl_Position.z = _2917;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_67.w;
    float _182 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_65.x;
    float _196 = in.m_65.y;
    float _198 = in.m_65.z;
    float _200 = in.m_60.x;
    float _202 = in.m_60.y;
    float _204 = in.m_60.z;
    float _206 = 0.0;
    float _208 = _182;
    if (!_192)
    {
        float _210 = _182 * _182;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    float _216 = _214;
    if (!_192)
    {
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _218;
    }
    float _220 = _216;
    bool _222 = !_192;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _182 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _182);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_192;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _182 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _208 = _278;
    }
    float _280 = _208;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = fma(_280, _194, _284);
    float _292 = fma(_280, _196, _286);
    float _294 = fma(_280, _198, _288);
    float _296 = fma(_290, _180, _200);
    float _298 = fma(_292, _180, _202);
    float _300 = fma(_294, _180, _204);
    bool _302 = !_282;
    float _320;
    if (!_302)
    {
        float _304 = in.m_69.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        float _324 = float(_124);
        float _326 = 1.0 / _324;
        float _328 = _158 * _326;
        _320 = _328;
    }
    _322 = false;
    float _330 = _320;
    float _332 = in.m_69.x;
    float _334 = in.m_69.y;
    float _336 = in.m_69.z;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = _330 + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _342;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _356 = _354 != 0;
    float _358 = 1.0 / _344;
    bool _360 = !_352;
    int _362 = _360 ? 0 : 1;
    int _364 = abs(_362);
    float _366 = _336 * 2.0;
    float _368 = _332 * 2.0;
    float _370 = _334 * 2.0;
    float _372 = _334 + _336;
    float _374 = _332 + _336;
    float _376 = _336 + (-0.5);
    float _378 = floor(_366);
    float _380 = _334 + _332;
    float _382 = _332 + (-0.5);
    float _384 = _340 * _358;
    float _386 = _372 + (-1.0);
    float _388 = _374 + (-1.0);
    float _390 = _380 + (-1.0);
    float _392 = floor(_368);
    float _394 = _334 + (-0.5);
    float _396 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _400 = !_348;
    int _402 = _400 ? 0 : 1;
    float _404 = floor(_370);
    bool _406 = _378 > 0.0;
    bool _408 = _378 >= 0.0;
    bool _410 = isnan(_378);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    int _418 = abs(_402);
    float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _422 = log2(_420);
    bool _424 = _392 >= 0.0;
    bool _426 = isnan(_392);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _436 = 1.0 + _434;
    bool _438 = _392 > 0.0;
    float _440 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _442 = _416 ? 0 : 1;
    int _444 = _432 ? 0 : 1;
    float _446 = 1.0 / _436;
    bool _448 = _404 > 0.0;
    bool _450 = _404 >= 0.0;
    bool _452 = isnan(_404);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    int _460 = ~_442;
    int _462 = _460 + 1;
    int _464 = _462 + 1;
    int _466 = ~_444;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = _422 * _158;
    int _474 = _464;
    int _476 = _470;
    if (!_406)
    {
        int _478 = ~_442;
        int _480 = _478 + 1;
        _474 = _480;
    }
    int _482 = _474;
    if (!_438)
    {
        int _484 = ~_444;
        int _486 = _484 + 1;
        _476 = _486;
    }
    int _488 = _476;
    float _490 = in.m_71.x;
    float _492 = in.m_71.y;
    float _494 = in.m_71.z;
    float _496 = exp2(_472);
    bool _498 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _500 = isnan(1.0);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _506 = _502 || _504;
    float _508 = float(_418);
    float _510 = float(_482);
    bool _512 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _520 = _516 || _518;
    float _522 = float(_364);
    float _524 = _508 * _510;
    float _526 = float(_488);
    int _528 = _458 ? 0 : 1;
    float _530 = -_496;
    float _532 = _530 + 1.0;
    float _534 = _524 * (-2.0);
    float _536 = _522 * _526;
    int _538 = ~_528;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = _520 ? _532 : 0.0;
    int _546 = _542;
    if (!_448)
    {
        int _548 = ~_528;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    if (_506)
    {
        float _554 = _544 * _446;
        _160 = _554;
    }
    float _556 = _160;
    float _558 = _536 * (-2.0);
    float _560 = fma(_534, _490, _490);
    float _562 = fma(_398, _534, _398);
    bool _564 = !_356;
    int _566 = _564 ? 0 : 1;
    float _568 = fma(_558, _492, _492);
    float _570 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[196].x, _560);
    float _572 = fma(_440, _558, _440);
    int _574 = abs(_566);
    float _576 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[196].y, _568);
    float _578 = fma(_562, _556, _570);
    float _580 = float(_574);
    float _582 = fma(_572, _556, _576);
    float _584 = float(_552);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _586;
    float _590 = _582 * 0.15915493667125701904296875;
    float _592 = _580 * _584;
    bool _594 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _596 = isnan(_330);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _606;
    bool _610 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _612 = isnan(_330);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _592 * (-2.0);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _624;
    float _628 = fma(_588, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _630 = _578 * 0.15915493667125701904296875;
    float _632 = in.m_67.x;
    float _634 = in.m_67.y;
    float _636 = in.m_67.z;
    float _638 = -_620;
    float _640 = _638 + 1.0;
    float _642 = fma(_622, _494, _494);
    float _644 = fma(_608, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _646 = fma(_626, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _648 = _604 * _640;
    float _650 = in.m_73.x;
    float _652 = in.m_73.y;
    float _654 = in.m_73.z;
    float _656 = fma(_396, _622, _396);
    float _658 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[196].z, _642);
    float _660 = -_604;
    float _662 = _660 + 1.0;
    float _664 = _644 * _648;
    float _666 = _628 * _648;
    float _668 = fma(_656, _556, _658);
    float _670 = _646 * _648;
    float _672 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].x, _664);
    float _674 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].z, _666);
    float _676 = _668 * 0.15915493667125701904296875;
    float _678 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].y, _670);
    float _680 = _630 * 6.283185482025146484375;
    float _682 = cos(_680);
    float _684 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[144].x, _672);
    float _686 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[144].z, _674);
    float _688 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[144].y, _678);
    float _690 = _684 * _632;
    float _692 = _688 * _634;
    float _694 = _590 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _686 * _636;
    float _700 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _702 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _652);
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _650);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _654);
    float _710 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = _590 * 6.283185482025146484375;
    float _714 = cos(_712);
    float _716 = _704 * _702;
    float _718 = _706 * _700;
    float _720 = _708 * _710;
    float _722 = _630 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = _682 * _696;
    float _728 = _676 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = _682 * _714;
    float _734 = _676 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = _724 * _696;
    float _740 = _724 * _714;
    float _742 = _682 * _730;
    float _744 = _714 * _730;
    float _746 = _724 * _730;
    float _748 = _696 * _730;
    float _750 = _742 * _716;
    float _752 = _746 * _716;
    float _754 = fma(_736, _732, _738);
    float _756 = fma(_736, _738, _732);
    float _758 = -_716;
    float _760 = _736 * _758;
    float _762 = -_726;
    float _764 = fma(_736, _740, _762);
    float _766 = -_740;
    float _768 = fma(_736, _726, _766);
    float _770 = fma(_754, _718, _750);
    float _772 = fma(_744, _718, _760);
    float _774 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _778 = fma(_768, _720, _770);
    float _780 = fma(_764, _718, _752);
    float _782 = fma(_748, _720, _772);
    float _784 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _786 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _776);
    float _788 = _778 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _790 = _778 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _792 = fma(_756, _720, _780);
    float _794 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _784);
    float _796 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _786);
    float _798 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _788);
    float _800 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].x, _790);
    float _802 = _794 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _804 = _796 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _806 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[8].z, _798);
    float _808 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[10].z, _800);
    float _810 = _802 + _806;
    float _812 = _804 + _808;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _816 = _810 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _820 = _812 + _818;
    float _822 = _816 * _816;
    float _824 = _820 * _820;
    float _826 = _822 + _824;
    float _828 = sqrt(_826);
    bool _830 = _828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _834 = _828 + _832;
    float _836 = 0.0;
    float _838 = _810;
    float _840 = _812;
    float _842 = _822;
    float _844 = _824;
    if (_830)
    {
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _836 = _846;
    }
    float _848 = _836;
    float _850 = _848;
    if (_830)
    {
        float _852 = _834 * _848;
        _850 = _852;
    }
    float _854 = _850;
    float _856 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _858 = _778 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _860 = _854;
    if (_830)
    {
        float _862 = _854 * 0.15915493667125701904296875;
        _860 = _862;
    }
    float _864 = _860;
    float _866 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _856);
    float _868 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].x, _858);
    float _870 = _856;
    float _872 = _868;
    if (_830)
    {
        float _874 = _864 * 6.283185482025146484375;
        float _876 = sin(_874);
        _870 = _876;
    }
    float _878 = _870;
    float _880 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _866);
    float _882 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[9].z, _868);
    float _884 = _880 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _886 = _300;
    if (_830)
    {
        float _888 = rsqrt(_826);
        _886 = _888;
    }
    float _890 = _886;
    float _892 = _884 + _882;
    float _894 = _892;
    if (_830)
    {
        float _896 = _892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _872 = _896;
    }
    float _898 = _872;
    float _900 = _898;
    if (_830)
    {
        float _902 = fma(_878, _898, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _900 = _902;
    }
    float _904 = _900;
    float _906 = _904;
    if (_830)
    {
        float _908 = _890 * _904;
        _906 = _908;
    }
    float _910 = _906;
    if (_830)
    {
        float _912 = fma(_816, _910, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _838 = _912;
    }
    float _914 = _838;
    if (_830)
    {
        float _916 = fma(_820, _910, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _840 = _916;
    }
    float _918 = _840;
    float _920 = fma(_914, 6.2500002968590706586837768554688e-05, 0.5);
    float _922 = fma(_918, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4042 = float2(_920, _922);
    float3 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4042, float2(0.0), isnan(_4042)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4042, float2(0.0), isnan(_4042)), level(0.0)).xyz;
    float _928 = _926.x;
    float _930 = _926.y;
    float _932 = _926.z;
    float _934 = in.m_75.y;
    bool _936 = _652 != 0.0;
    bool _938 = isnan(_652);
    bool _940 = _936 || _938;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    float _946 = _864;
    if (_830)
    {
        float _948 = _864 * 6.283185482025146484375;
        float _950 = cos(_948);
        _946 = _950;
    }
    float _952 = _946;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _956 = _954 != 0;
    float _958 = in.m_69.w;
    bool _960 = _650 == 0.0;
    bool _962 = !_944;
    bool _964 = _960 && _962;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _968 = _966 != 0;
    float _970 = in.m_77.x;
    float _972 = in.m_77.y;
    float _974 = in.m_77.z;
    bool _976 = _654 == 0.0;
    bool _978 = _976 && _964;
    float _980 = in.m_75.x;
    float _982 = _782;
    float _984 = 1.0;
    float _986 = 1.0;
    if (_956)
    {
        float _988 = in.m_69.z;
        _982 = _988;
    }
    float _990 = _982;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _996 = -_934;
    float _998 = _996 + 1.0;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1004 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1006 = _958 > 0.5;
    float _1008 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _934;
    if (_968)
    {
        float _1014 = _1006 ? _998 : _934;
        _1012 = _1014;
    }
    float _1016 = _1012;
    float _1018 = 0.0;
    float _1020 = _970;
    float _1022 = _972;
    if (_978)
    {
        _1018 = _970;
    }
    float _1024 = _1018;
    out.m_81.x = _1004;
    out.m_81.y = _1008;
    out.m_81.z = _1010;
    out.m_81.w = _1002;
    float _1026 = _1024;
    if (!_956)
    {
        _984 = _980;
    }
    float _1028 = _984;
    float _1030 = 0.0;
    float _1032 = _1028;
    if (_978)
    {
        _1030 = _1024;
    }
    float _1034 = _1030;
    bool _1036 = _990 > 0.5;
    bool _1038 = _1036 && _956;
    float _1040 = in.m_83.x;
    float _1042 = in.m_83.y;
    float _1044 = in.m_83.z;
    float _1046 = in.m_83.w;
    float _1048 = _1034;
    if (!_978)
    {
        _1026 = _970;
    }
    float _1050 = _1026;
    if (_978)
    {
        _1020 = _972;
    }
    float _1052 = _1020;
    float _1054 = _1052;
    if (_978)
    {
        _986 = _974;
    }
    float _1056 = _986;
    float _1058 = _1056;
    if (!_978)
    {
        float _1060 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _974);
        _1058 = _1060;
    }
    float _1062 = _1058;
    float _1064 = 0.0;
    if (_978)
    {
        _1064 = _1052;
    }
    float _1066 = _1064;
    float _1068 = _1066;
    if (!_978)
    {
        float _1070 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1050);
        _1048 = _1070;
    }
    float _1072 = _1048;
    if (!_978)
    {
        _1054 = _972;
    }
    float _1074 = _1054;
    if (_956)
    {
        _1022 = _980;
    }
    float _1076 = _1022;
    float _1078 = _1076;
    if (!_978)
    {
        float _1080 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1074);
        _1068 = _1080;
    }
    float _1082 = _1068;
    if (_1038)
    {
        float _1084 = -_1076;
        float _1086 = _1084 + 1.0;
        _1078 = _1086;
    }
    float _1088 = _1078;
    float _1090 = -_1082;
    float _1092 = _736 * _1090;
    float _1094 = _746 * _1082;
    if (_956)
    {
        _1032 = _1088;
    }
    float _1096 = _1032;
    float _1098 = fma(_744, _1072, _1092);
    float _1100 = fma(_764, _1072, _1094);
    float _1102 = _1044 * _1050;
    float _1104 = _1042 * _974;
    float _1106 = _1040 * _1074;
    float _1108 = fma(_748, _1062, _1098);
    float _1110 = -_1102;
    float _1112 = fma(_1040, _974, _1110);
    float _1114 = -_1104;
    float _1116 = fma(_1044, _1074, _1114);
    float _1118 = -_1106;
    float _1120 = fma(_1042, _1050, _1118);
    float _1122 = -_1042;
    float _1124 = _736 * _1122;
    float _1126 = _1112 * _1046;
    float _1128 = _742 * _1082;
    float _1130 = _1116 * _1046;
    float _1132 = _1120 * _1046;
    float _1134 = -_1126;
    float _1136 = _736 * _1134;
    float _1138 = _742 * _1042;
    float _1140 = _742 * _1126;
    float _1142 = _746 * _1042;
    float _1144 = _746 * _1126;
    float _1146 = fma(_754, _1072, _1128);
    float _1148 = fma(_744, _1130, _1136);
    float _1150 = fma(_754, _1130, _1140);
    float _1152 = fma(_744, _1040, _1124);
    float _1154 = fma(_754, _1040, _1138);
    float _1156 = fma(_764, _1040, _1142);
    float _1158 = fma(_764, _1130, _1144);
    float _1160 = fma(_768, _1062, _1146);
    float _1162 = fma(_748, _1044, _1152);
    float _1164 = fma(_768, _1044, _1154);
    float _1166 = fma(_756, _1044, _1156);
    float _1168 = fma(_748, _1132, _1148);
    float _1170 = fma(_768, _1132, _1150);
    float _1172 = fma(_756, _1132, _1158);
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1176 = _1132;
    float _1178 = _1174;
    if (_830)
    {
        float _1180 = _952 + (-1.0);
        _1176 = _1180;
    }
    float _1182 = _1176;
    float _1184 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1186 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1174);
    float _1190 = _1182;
    float _1192 = _1184;
    if (_830)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1194;
    }
    float _1196 = _1178;
    float _1198 = fma(_756, _1062, _1100);
    float _1200 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1184);
    float _1202 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1206 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_830)
    {
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1210 = _914 + _1208;
        _1190 = _1210;
    }
    float _1212 = _1190;
    if (_830)
    {
        float _1214 = fma(_892, _952, _1196);
        _894 = _1214;
    }
    float _1216 = _894;
    if (_830)
    {
        float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1220 = _918 + _1218;
        _1192 = _1220;
    }
    float _1222 = _1192;
    float _1224 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1206);
    if (_830)
    {
        float _1226 = _1212 * _1212;
        _842 = _1226;
    }
    float _1228 = _842;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1232 = _1216 + _1230;
    float _1234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1236 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_830)
    {
        float _1238 = _1222 * _1222;
        _844 = _1238;
    }
    float _1240 = _844;
    float _1242 = fma(_1232, _1232, _1228);
    float _1244 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1246 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1248 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1236);
    float _1250 = _1242 + _1240;
    float _1252 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1244);
    float _1254 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1256 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1258 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1260 = _1246 * _1204;
    float _1262 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1264 = sqrt(_1250);
    float _1266 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1254);
    float _1268 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1256);
    float _1270 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1258);
    float _1272 = _1262 * _1234;
    float _1274 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1224);
    float _1276 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1248);
    float _1278 = fma(_1172, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1266);
    float _1280 = fma(_1172, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1268);
    float _1282 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1188);
    float _1284 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1252);
    float _1286 = fma(_1172, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1270);
    float _1288 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1200);
    float _1290 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1202);
    out.m_85.z = _1260;
    out.m_85.w = _1272;
    bool _1292 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1294 = isnan(_1264);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1300 = _1296 || _1298;
    out.m_87.x = _1274;
    out.m_87.y = _1276;
    out.m_87.z = _1284;
    out.m_89.x = _1278;
    out.m_89.y = _1280;
    out.m_89.z = _1286;
    out.m_91.x = _1282;
    out.m_91.y = _1288;
    out.m_91.z = _1290;
    float _1302 = _1270;
    if (!_1300)
    {
        _1302 = 1.0;
    }
    float _1304 = _1302;
    out.m_93.x = _928;
    out.m_93.y = _930;
    out.m_93.z = _932;
    bool _1306 = !_1300;
    float _1308 = _1304;
    if (!_1306)
    {
        bool _1310 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1312 = isnan(_1264);
        bool _1314 = _1310 || _1312;
        bool _1316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1318 = _1314 || _1316;
        if (!_1318)
        {
            float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1322 = _1264 + _1320;
            float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1326 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1324;
            float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1330 = _1328 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1332 = 1.0 / _1326;
            float _1334 = _1322 * _1332;
            float _1336 = fma(_1334, _1330, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1308 = _1336;
            _1338 = true;
        }
        else
        {
            bool _1340 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1342 = isnan(_1264);
            bool _1344 = _1340 || _1342;
            bool _1346 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1348 = _1344 || _1346;
            if (!_1348)
            {
                float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1352 = _1264 + _1350;
                float _1354 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1356 = _1354 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1358 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1360 = _1358 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1362 = 1.0 / _1356;
                float _1364 = _1352 * _1362;
                float _1366 = fma(_1364, _1360, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1308 = _1366;
                _1338 = true;
            }
            else
            {
                _1308 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1338 = false;
    float _1368 = _1308;
    float _1370 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1372 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1374 = floor(_1370);
    float _1376 = floor(_1372);
    float _1378 = -_1374;
    float _1380 = _1370 + _1378;
    float _1382 = -_1376;
    float _1384 = _1372 + _1382;
    float2 _4860 = float2(_1380, _1384);
    float _1386 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4860, float2(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4860, float2(0.0), isnan(_4860)), level(0.0)).x;
    float _1388 = _884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1392 = _914 + _1390;
    float _1394 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1388);
    float _1396 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1398 = _1216 + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1402 = _918 + _1400;
    float _1404 = fma(_1392, _1368, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1406 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1394);
    float _1408 = _884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1410 = fma(_1398, _1368, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1412 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1414 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1408);
    float _1416 = fma(_1402, _1368, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1418 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1420 = 1.0 / _1412;
    float _1422 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1414);
    float _1424 = _884 + _1418;
    float _1426 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1428 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1430 = _1426 + _1412;
    float _1432 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1428);
    float _1434 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1432);
    float _1436 = _1430 * _1420;
    float _1438 = _1436 * 0.5;
    float _1440 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1444 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1442);
    float _1446 = 1.0 / _1444;
    bool _1448 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.5);
    bool _1456 = _1452 || _1454;
    float _1458 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1460 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1458);
    float _1462 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    int _1464 = 2;
    int _1466 = as_type<int>(_1402);
    if (_1456)
    {
        _1462 = _1416;
    }
    float _1468 = _1462;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1472 = _1446 * _1470;
    float _1474 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1460);
    bool _1476 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1478 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1480 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1482 = !_1476;
    int _1484 = _1482 ? 0 : 1;
    float _1486 = trunc(_1478);
    int _1488 = int(_1486);
    float _1490 = _1468;
    if (!_1476)
    {
        _1464 = 1;
    }
    int _1492 = _1464;
    int _1494 = _1492;
    if (!_1480)
    {
        _1494 = _1484;
    }
    int _1496 = _1494;
    float _1498 = trunc(_1440);
    int _1500 = int(_1498);
    int _1502 = _1496 << 6;
    int _1504 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1506 = _1488 + _1504;
    int _1508 = _1506 + 1;
    int _1510 = _1502 + 48;
    uint _1513 = uint(int(uint(_1510) >> uint(2)));
    uint _1515 = uint(int(uint(int(_1513)) >> uint(2)));
    int _1517 = int(_1513) & 3;
    float _1519 = (*spvDescriptorSet0.vp_c15)._m0[int(_1515)][_1517];
    int _1521 = int(_1513) + 1;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    int _1525 = _1521 & 3;
    float _1527 = (*spvDescriptorSet0.vp_c15)._m0[int(_1523)][_1525];
    int _1529 = _1502 + 56;
    uint _1531 = uint(int(uint(_1529) >> uint(2)));
    uint _1533 = uint(int(uint(int(_1531)) >> uint(2)));
    int _1535 = int(_1531) & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    int _1539 = int(_1531) + 1;
    uint _1541 = uint(int(uint(_1539) >> uint(2)));
    int _1543 = _1539 & 3;
    float _1545 = (*spvDescriptorSet0.vp_c15)._m0[int(_1541)][_1543];
    int _1547 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1549 = _1500 + _1547;
    int _1551 = _1549 + 1;
    float _1553 = as_type<float>(_1500);
    float _1555 = as_type<float>(_1551);
    if (_1456)
    {
        _1553 = _1410;
    }
    float _1557 = _1553;
    bool _1559 = _1551 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1561 = _1502 + 64;
    uint _1563 = uint(int(uint(_1561) >> uint(2)));
    uint _1565 = uint(int(uint(int(_1563)) >> uint(2)));
    int _1567 = int(_1563) & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = int(_1563) + 1;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    int _1575 = _1571 & 3;
    float _1577 = (*spvDescriptorSet0.vp_c15)._m0[int(_1573)][_1575];
    int _1579 = _1551 | _1508;
    bool _1581 = _1579 < 0;
    bool _1583 = _1581 || _1559;
    float _1585 = as_type<float>(_1579);
    float _1587 = _1557;
    if (_1456)
    {
        _1585 = _1404;
    }
    float _1589 = _1585;
    int _1591 = _1502 + 72;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
    int _1597 = int(_1593) & 3;
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
    int _1601 = int(_1593) + 1;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    int _1605 = _1601 & 3;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[int(_1603)][_1605];
    bool _1609 = _1508 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1611 = _1609 || _1583;
    int _1613 = _1502 + 96;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    uint _1617 = uint(int(uint(int(_1615)) >> uint(2)));
    int _1619 = int(_1615) & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    int _1623 = int(_1615) + 1;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    int _1627 = _1623 & 3;
    float _1629 = (*spvDescriptorSet0.vp_c15)._m0[int(_1625)][_1627];
    int _1631 = _1502 + 104;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    uint _1635 = uint(int(uint(int(_1633)) >> uint(2)));
    int _1637 = int(_1633) & 3;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
    int _1641 = int(_1633) + 1;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    int _1645 = _1641 & 3;
    float _1647 = (*spvDescriptorSet0.vp_c15)._m0[int(_1643)][_1645];
    float _1649 = _1589;
    int _1651 = as_type<int>(_1639);
    if (!_1456)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1655 = _884 + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1659 = _802 + _1657;
        float _1661 = -_884;
        float _1663 = _1661 + _1410;
        float _1665 = _1655 * _1655;
        float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1669 = _804 + _1667;
        float _1671 = fma(_1659, _1659, _1665);
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1675 = fma(_1669, _1669, _1671);
        float _1677 = sqrt(_1675);
        float _1679 = precise::min(_1677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1681 = _1679 * _1673;
        float _1683 = -_802;
        float _1685 = _1683 + _1404;
        float _1687 = -_804;
        float _1689 = _1687 + _1416;
        float _1691 = fma(_1663, _1681, _884);
        float _1693 = fma(_1685, _1681, _802);
        float _1695 = fma(_1689, _1681, _804);
        _1587 = _1691;
        _1649 = _1693;
        _1490 = _1695;
        _1466 = as_type<int>(_1677);
    }
    float _1697 = _1587;
    float _1699 = _1649;
    float _1701 = _1490;
    int _1703 = _1466;
    float _1705 = _1424 * _1629;
    float _1707 = _1424 * _1577;
    float _1709 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1711 = _1703;
    if (!_1611)
    {
        int _1713 = _1508 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1715 = _1713 + _1551;
        _1711 = _1715;
    }
    int _1717 = _1711;
    float _1719 = fma(_802, _1621, _1705);
    float _1721 = _1424 * _1527;
    float _1723 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1725 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1727 = fma(_804, _1639, _1719);
    float _1729 = fma(_802, _1519, _1721);
    float _1731 = fma(_802, _1569, _1707);
    float _1733 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1723);
    int _1735 = _1502 + 80;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    uint _1739 = uint(int(uint(int(_1737)) >> uint(2)));
    int _1741 = int(_1737) & 3;
    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[int(_1739)][_1741];
    int _1745 = int(_1737) + 1;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    int _1749 = _1745 & 3;
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
    int _1753 = as_type<int>(_1733);
    float _1755 = as_type<float>(_1717);
    if (!_1611)
    {
        int _1757 = _1717 << 2;
        _1651 = _1757;
    }
    int _1759 = _1651;
    float _1761 = _1727 + _1647;
    float _1763 = fma(_804, _1537, _1729);
    float _1765 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1767 = _1759;
    if (!_1611)
    {
        uint _1769 = uint(int(uint(_1717) >> uint(2)));
        _1753 = int(_1769);
    }
    int _1771 = _1753;
    float _1773 = 1.0 / _1761;
    if (!_1611)
    {
        int _1775 = 12 & _1759;
        _1767 = _1775;
    }
    int _1777 = _1767;
    int _1779 = _1502 + 88;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
    int _1785 = int(_1781) & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    int _1789 = int(_1781) + 1;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    int _1793 = _1789 & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    float _1797 = _1765 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1799 = fma(_804, _1599, _1731);
    if (!_1611)
    {
        int _1801 = _1771 << 4;
        int _1803 = _1801 + _1777;
        _1555 = as_type<float>(_1803);
    }
    float _1805 = _1555;
    float _1807 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1809 = -_1797;
    float _1811 = fma(_1809, _1725, 1.0);
    float _1813 = _1763 + _1545;
    float _1815 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1817 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1819 = _1805;
    if (!_1611)
    {
        int _1821 = as_type<int>(_1805) + 400;
        uint _1823 = uint(int(uint(_1821) >> uint(2)));
        uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
        int _1827 = int(_1823) & 3;
        float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
        _1819 = _1829;
    }
    float _1831 = _1819;
    float _1833 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1807);
    float _1835 = _1799 + _1607;
    float _1837 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1815);
    float _1839 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1817);
    float _1841 = _1813 * _1773;
    float _1843 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1833);
    float _1845 = _1835 * _1773;
    float _1847 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1839);
    float _1849 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1837);
    float _1851 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1853 = _1841 >= 0.0;
    float _1855 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1861 = _1841 <= 1.0;
    bool _1863 = _1861 && _1853;
    float _1865 = log2(_1811);
    float _1867 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1869 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    bool _1871 = _1845 >= 0.0;
    bool _1873 = _1871 && _1863;
    float _1875 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1867);
    float _1877 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1869);
    bool _1879 = _1845 <= 1.0;
    bool _1881 = _1879 && _1873;
    float _1883 = _1725;
    if (!_1611)
    {
        float _1885 = floor(_1440);
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1891 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1877);
    float _1893 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1889);
    float _1895 = _1424 * _1751;
    float _1897 = as_type<float>(_1508);
    float _1899 = _1751;
    if (!_1611)
    {
        float _1901 = floor(_1478);
        _1897 = _1901;
    }
    float _1903 = _1897;
    float _1905 = _1865 * 0.693147182464599609375;
    float _1907 = fma(_802, _1743, _1895);
    float _1909 = _1905;
    float _1911 = _1907;
    if (_1881)
    {
        float _1913 = float(_1496);
        _1899 = _1913;
    }
    float _1915 = _1899;
    float _1917 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1875);
    float _1919 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1893);
    float _1921 = fma(_804, _1787, _1907);
    float _1923 = 1.0 / _1891;
    float _1925 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1917);
    float _1927 = _1921 + _1795;
    float _1929 = _1927 * _1773;
    float _1931 = _1895;
    float _1933 = _1925;
    if (_1881)
    {
        float _1935 = rint(_1915);
        float _1937 = precise::max(_1935, 0.0);
        uint _1939 = uint(_1937);
        uint _1941 = clamp(_1939, 0u, 65535u);
        _1931 = as_type<float>(_1941);
    }
    float _1943 = _1931;
    float _1945 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    if (!_1611)
    {
        float _1947 = -_1887;
        float _1949 = _1440 + _1947;
        _1909 = _1949;
    }
    float _1951 = _1909;
    float _1953 = _1903;
    if (!_1611)
    {
        float _1955 = -_1903;
        float _1957 = _1478 + _1955;
        _1953 = _1957;
    }
    float _1959 = _1953;
    float _1961 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1919);
    float _1963 = _1887;
    if (!_1611)
    {
        float _1965 = rint(_1831);
        float _1967 = precise::max(_1965, 0.0);
        uint _1969 = uint(_1967);
        uint _1971 = clamp(_1969, 0u, 65535u);
        _1963 = as_type<float>(_1971);
    }
    float _1973 = _1963;
    float _1975 = _1961 * _1923;
    float _1977 = _1925 * _1923;
    float _1979 = fma(_1975, 0.5, 0.5);
    float _1981 = fma(_1977, -0.5, 0.5);
    float _1983 = _1845;
    float _1985 = _1977;
    float _1987 = _1981;
    if (_1881)
    {
        float3 _5883 = float3(_1841, _1845, float(as_type<int>(_1943)));
        float3 _5887 = select(_5883, float3(0.0), isnan(_5883));
        float _1989 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5887.xy, uint(rint(_5887.z)), _1929, level(0.0));
        _1983 = _1989;
    }
    float _1991 = _1983;
    float3 _5897 = float3(_1979, _1981, _1945);
    float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5897, float3(0.0), isnan(_5897)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5897, float3(0.0), isnan(_5897)), level(0.0)).x;
    float3 _5906 = float3(_1979, _1981, _1945);
    float4 _1996 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5906, float3(0.0), isnan(_5906)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5906, float3(0.0), isnan(_5906)), level(0.0)).xyzw;
    float _1998 = _1996.x;
    float _2000 = _1996.y;
    float _2002 = _1996.z;
    float _2004 = _1996.w;
    float _2006 = _1951;
    if (!_1611)
    {
        float3 _5929 = float3(_1951, _1959, float(as_type<int>(_1973)));
        float3 _5931 = select(_5929, float3(0.0), isnan(_5929));
        float _2008 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5931.xy, uint(rint(_5931.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5931.xy, uint(rint(_5931.z)), level(0.0)).x;
        _2006 = _2008;
    }
    float _2010 = _2006;
    if (_1611)
    {
        _1985 = 1.0;
    }
    float _2012 = _1985;
    float _2014 = _2012;
    if (!_1611)
    {
        int _2016 = _1717 << 4;
        int _2018 = _2016 + 2048;
        uint _2020 = uint(int(uint(_2018) >> uint(2)));
        uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
        int _2024 = int(_2020) & 3;
        float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
        int _2028 = int(_2020) + 1;
        uint _2030 = uint(int(uint(_2028) >> uint(2)));
        int _2032 = _2028 & 3;
        float _2034 = (*spvDescriptorSet0.vp_c15)._m0[int(_2030)][_2032];
        int _2036 = _2018 + 8;
        uint _2038 = uint(int(uint(_2036) >> uint(2)));
        uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
        int _2042 = int(_2038) & 3;
        float _2044 = (*spvDescriptorSet0.vp_c15)._m0[int(_2040)][_2042];
        int _2046 = int(_2038) + 1;
        uint _2048 = uint(int(uint(_2046) >> uint(2)));
        int _2050 = _2046 & 3;
        float _2052 = (*spvDescriptorSet0.vp_c15)._m0[int(_2048)][_2050];
        float _2054 = _1424 * _2034;
        float _2056 = fma(_802, _2026, _2054);
        float _2058 = fma(_804, _2044, _2056);
        float _2060 = _2058 + _2052;
        float _2062 = precise::clamp(_2060, 0.0, 1.0);
        float _2064 = -_2062;
        float _2066 = _2064 + _2010;
        float _2068 = fma(_2066, 500.0, 1.5);
        float _2070 = exp2(_2068);
        float _2072 = 0.0 + _2070;
        float _2074 = precise::clamp(_2072, 0.0, 1.0);
        _1755 = as_type<float>(_2018);
        _2014 = _2074;
    }
    float _2076 = _1755;
    float _2078 = _2014;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _1697 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _1699 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _1701 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2102 = _2086 * _2100;
    float _2104 = _2090 * _2100;
    float _2106 = _2102 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 + _2108;
    float _2112 = sqrt(_2110);
    bool _2114 = _2112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = _2112 + _2116;
    float _2120 = _2090;
    float _2122 = _2076;
    float _2124 = _2118;
    float _2126 = _2082;
    if (_2114)
    {
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2128;
    }
    float _2130 = _2120;
    if (_2114)
    {
        float _2132 = rsqrt(_2110);
        _2122 = _2132;
    }
    float _2134 = _2122;
    float _2136 = _2134;
    if (_2114)
    {
        float _2138 = _2118 * _2130;
        _2124 = _2138;
    }
    float _2140 = _2124;
    if (_2114)
    {
        float _2142 = _2140 * 0.15915493667125701904296875;
        _1911 = _2142;
    }
    float _2144 = _1911;
    float _2146 = _2098;
    float _2148 = _2144;
    if (_2114)
    {
        float _2150 = _2144 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        _2146 = _2152;
    }
    float _2154 = _2146;
    float _2156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2158 = precise::max(0.0, _2156);
    float _2160 = _2094;
    float _2162 = _2158;
    float _2164 = _2156;
    if (_2114)
    {
        float _2166 = _2144 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2160 = _2168;
    }
    float _2170 = _2160;
    float _2172 = -_2100;
    float _2174 = -_2158;
    float _2176 = fma(_2082, _2172, _2174);
    if (!_2114)
    {
        _2162 = _2104;
    }
    float _2178 = _2162;
    float _2180 = _2178;
    if (_2114)
    {
        float _2182 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2164 = _2182;
    }
    float _2184 = _2164;
    float _2186 = _2154;
    float _2188 = _2184;
    if (_2114)
    {
        float _2190 = fma(_2154, _2184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2126 = _2190;
    }
    float _2192 = _2126;
    float _2194 = _2192;
    if (!_2114)
    {
        _2186 = _2102;
    }
    float _2196 = _2186;
    float _2198 = _2196;
    float _2200 = _2170;
    if (_2114)
    {
        float _2202 = _2170 + (-1.0);
        _2188 = _2202;
    }
    float _2204 = _2188;
    if (_2114)
    {
        float _2206 = _2134 * _2192;
        _1987 = _2206;
    }
    float _2208 = _1987;
    if (!_2114)
    {
        _2194 = _2176;
    }
    float _2210 = _2194;
    float _2212 = _2210;
    if (_2114)
    {
        float _2214 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2148 = _2214;
    }
    float _2216 = _2148;
    if (_2114)
    {
        float _2218 = _2102 * _2208;
        _2198 = _2218;
    }
    float _2220 = _2198;
    if (!_2114)
    {
        _2136 = _2106;
    }
    float _2222 = _2136;
    float _2224 = _2222;
    if (_2114)
    {
        float _2226 = _2104 * _2208;
        _2180 = _2226;
    }
    float _2228 = _2180;
    if (_2114)
    {
        float _2230 = fma(_2176, _2170, _2216);
        _2212 = _2230;
    }
    float _2232 = _2212;
    if (_2114)
    {
        float _2234 = _2220 * _2220;
        _2224 = _2234;
    }
    float _2236 = _2224;
    if (!_2114)
    {
        _2200 = _2108;
    }
    float _2238 = _2200;
    float _2240 = _2238;
    if (_2114)
    {
        float _2242 = _2228 * _2228;
        _2240 = _2242;
    }
    float _2244 = _2240;
    float _2246 = sqrt(_2096);
    float _2248 = fma(_2232, _2232, _2236);
    float _2250 = _2248 + _2244;
    float _2252 = rsqrt(_2250);
    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2256 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2254);
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    float _2260 = -_2258;
    float _2262 = _2260 + 1.0;
    float _2264 = _2252 * _2220;
    float _2266 = _2252 * _2232;
    float _2268 = _2252 * _2228;
    float _2270 = abs(_2262);
    float _2272 = log2(_2270);
    float _2274 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2276 = -_2274;
    float _2278 = fma(_2266, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2276);
    float _2280 = -_2268;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2278);
    float _2284 = fma(_2282, -0.5, 0.5);
    float _2286 = fma(_2282, 0.5, 0.5);
    float _2288 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2290 = fma(_2286, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2292 = sqrt(_2284);
    float _2294 = fma(_2286, _2290, -0.212114393711090087890625);
    float _2296 = _2266 + 1.0;
    float _2298 = fma(_2286, _2294, 1.570728778839111328125);
    float _2300 = exp2(_2288);
    float _2302 = _2292 * 0.636619746685028076171875;
    float _2304 = -_2266;
    float _2306 = fma(_2300, _2296, _2304);
    float _2308 = -_2298;
    float _2310 = fma(_2302, _2308, 1.0);
    float _2312 = fma(_2306, 0.5, 0.5);
    float2 _6406 = float2(_2310, _2312);
    float3 _2314 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6406, float2(0.0), isnan(_6406)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6406, float2(0.0), isnan(_6406)), level(0.0)).xyz;
    float _2316 = _2314.x;
    float _2318 = _2314.y;
    float _2320 = _2314.z;
    float _2322 = abs(_1472);
    float _2324 = log2(_2322);
    float _2326 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2328 = -_1386;
    float _2330 = _2328 + 1.0;
    float _2332 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2326);
    out.m_95.x = _1699;
    out.m_95.y = _1697;
    out.m_95.z = _1701;
    bool _2334 = _1472 <= 8000.0;
    bool _2336 = isnan(_1472);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan(8000.0);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2348 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2332);
    float _2350 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2352 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2348);
    float _2354 = exp2(_2346);
    float _2356 = exp2(_2350);
    float _2358 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2360 = precise::clamp(_2358, 0.0, 1.0);
    float _2362 = fma(_2360, -2.0, 3.0);
    float _2364 = _2360 * _2360;
    float _2366 = -_2356;
    float _2368 = _2366 + 1.0;
    float _2370 = _2364 * _2362;
    float _2372 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2374 = -_2370;
    float _2376 = _2374 + 1.0;
    float _2378 = _2372 * _1993;
    float _2380 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2370);
    float _2382 = _2352 + _1891;
    float _2384 = -_2372;
    float _2386 = _2384 + 1.0;
    float _2388 = _2344 * _2380;
    float _2390 = _2382 * 0.5;
    float _2392 = _2382;
    float _2394 = _2352;
    float _2396 = _1961;
    if (!_1881)
    {
        _2392 = 1.0;
    }
    float _2398 = _2392;
    out.gl_Position.x = _1961;
    out.gl_Position.y = _1925;
    out.gl_Position.z = _2352;
    out.gl_Position.w = _1891;
    float _2400 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2402 = _2398;
    if (_1881)
    {
        bool _2404 = _1991 >= _1929;
        bool _2406 = isnan(_1991);
        bool _2408 = _2404 || _2406;
        bool _2410 = isnan(_1929);
        bool _2412 = _2408 || _2410;
        float _2414 = float(_2412);
        _2402 = _2414;
    }
    float _2416 = _2402;
    float _2418 = _2004 * _2378;
    out.m_97.z = _2390;
    out.m_97.w = _1891;
    float _2420 = _2330 * _2400;
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    bool _2424 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2426 = isnan(_2246);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2432 = _2428 || _2430;
    float _2434 = _2416 * _2078;
    float _2436 = -_2422;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2440 = -_2434;
    float _2442 = fma(_2440, _2438, 1.0);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    float _2446 = _2444 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2448 = _2434;
    float _2450 = _2444;
    float _2452 = _2422;
    if (!_2432)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2454 = _2394;
    float _2456 = _2454;
    float _2458 = _2454;
    if (!_2432)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2460 = _1933;
    out.m_99.x = _2446;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2432)
    {
        _2396 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2466 = _2396;
    float _2468 = _2466;
    float _2470 = _2466;
    if (!_2432)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2472 = _2448;
    float _2474 = _2472;
    float _2476 = _2472;
    if (!_2432)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2478 = _2450;
    float _2480 = _2478;
    float _2482 = _2478;
    if (!_2432)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2484 = _2452;
    float _2486 = _2320 * _2378;
    float _2488 = fma(_2316, _2418, _1998);
    float _2490 = fma(_2318, _2418, _2000);
    float _2492 = _2004 * _2386;
    float _2494 = fma(_2004, _2486, _2002);
    out.m_101.x = _2488;
    out.m_101.y = _2490;
    out.m_101.z = _2494;
    out.m_101.w = _2492;
    bool _2496 = !_2432;
    float _2498 = _2484;
    float _2500 = _2484;
    if (!_2496)
    {
        bool _2502 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2504 = isnan(_2246);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2510 = _2506 || _2508;
        if (!_2510)
        {
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2514 = _2246 + _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2518 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2516;
            float _2520 = 1.0 / _2518;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2542 = _2514 * _2520;
            float _2544 = precise::clamp(_2542, 0.0, 1.0);
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2550 = fma(_2544, _2524, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2552 = fma(_2544, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2554 = fma(_2544, _2528, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2556 = fma(_2544, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2558 = fma(_2544, _2536, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2560 = fma(_2544, _2540, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2464 = _2552;
            _2482 = _2558;
            _2458 = _2550;
            _2476 = _2556;
            _2470 = _2554;
            _2500 = _2560;
            _2562 = true;
        }
        else
        {
            bool _2564 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2566 = isnan(_2246);
            bool _2568 = _2564 || _2566;
            bool _2570 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2572 = _2568 || _2570;
            if (!_2572)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2574 = _2456;
            _2458 = _2574;
            if (!_2572)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2576 = _2462;
            _2464 = _2576;
            if (!_2572)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2578 = _2468;
            _2470 = _2578;
            if (!_2572)
            {
                _2474 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2580 = _2474;
            _2476 = _2580;
            if (!_2572)
            {
                _2480 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2582 = _2480;
            _2482 = _2582;
            if (!_2572)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2584 = _2498;
            bool _2586 = !_2572;
            _2500 = _2584;
            if (!_2586)
            {
                bool _2588 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2590 = isnan(_2246);
                bool _2592 = _2588 || _2590;
                bool _2594 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2596 = _2592 || _2594;
                if (!_2596)
                {
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2600 = _2246 + _2598;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2604 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2602;
                    float _2606 = 1.0 / _2604;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2622 = _2620 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2628 = _2600 * _2606;
                    float _2630 = precise::clamp(_2628, 0.0, 1.0);
                    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2636 = fma(_2630, _2610, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2638 = fma(_2630, _2634, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2640 = fma(_2630, _2614, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2642 = fma(_2630, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2644 = fma(_2630, _2622, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2646 = fma(_2630, _2626, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2464 = _2638;
                    _2482 = _2644;
                    _2458 = _2636;
                    _2476 = _2642;
                    _2470 = _2640;
                    _2500 = _2646;
                    _2562 = true;
                }
                else
                {
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2482 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2476 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2562 = false;
    float _2648 = _2464;
    float _2650 = _2482;
    float _2652 = _2458;
    float _2654 = _2476;
    float _2656 = _2470;
    float _2658 = _2500;
    float _2660 = fma(_1288, -0.5, 0.5);
    float _2662 = precise::clamp(_2660, 0.0, 1.0);
    float _2664 = -_2648;
    float _2666 = _2664 + _2650;
    float _2668 = -_2652;
    float _2670 = _2668 + _2654;
    float _2672 = -_2656;
    float _2674 = _2672 + _2658;
    bool _2676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2678 = fma(_2662, _2666, _2648);
    float _2680 = fma(_2662, _2670, _2652);
    float _2682 = fma(_2662, _2674, _2656);
    float _2684 = _2678 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2686 = fma(_2680, 0.298911988735198974609375, _2684);
    float _2688 = fma(_2682, 0.114477999508380889892578125, _2686);
    out.m_103.x = 0.0;
    float _2690 = -_2688;
    float _2692 = _2680 + _2690;
    float _2694 = -_2688;
    float _2696 = _2678 + _2694;
    float _2698 = -_2688;
    float _2700 = _2682 + _2698;
    float _2702 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2706 = fma(_2696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2708 = fma(_2700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    out.m_99.w = _2702;
    out.m_105.x = _2704;
    out.m_105.y = _2706;
    out.m_105.z = _2708;
    if (!_2676)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2710 = -_1697;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2714 = -_1699;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2718 = -_1701;
    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2722 = _2712 * _2712;
    float _2724 = fma(_2716, _2716, _2722);
    float _2726 = fma(_2720, _2720, _2724);
    float _2728 = sqrt(_2726);
    float _2730 = rsqrt(_2726);
    float _2732 = -_2728;
    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2736 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2738 = precise::clamp(_2736, 0.0, 1.0);
    float _2740 = _2716 * _2730;
    float _2742 = _2712 * _2730;
    float _2744 = abs(_2738);
    float _2746 = log2(_2744);
    float _2748 = _2720 * _2730;
    float _2750 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2752 = _1288 * _2742;
    float _2754 = -_2742;
    float _2756 = -_2750;
    float _2758 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2756);
    float _2760 = fma(_1282, _2740, _2752);
    float _2762 = -_2748;
    float _2764 = fma(_2762, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2758);
    float _2766 = fma(_1290, _2748, _2760);
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2772 = _2764 + _2770;
    float _2774 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2776 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2778 = precise::clamp(_2776, 0.0, 1.0);
    float _2780 = exp2(_2774);
    float _2782 = _2780 * _2778;
    float _2784 = _2768 * _2782;
    float _2786 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2788 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2790 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2786;
    out.m_103.y = _2788;
    out.m_103.z = _2790;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2562 = false;
    bool _1338 = false;
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_60.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_63.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2847 = as_type<float>(_140);
        out.gl_Position.z = _2847;
    }
    if (!_128)
    {
        return out;
    }
    float _144 = in.m_65.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_63.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2917 = as_type<float>(_178);
        out.gl_Position.z = _2917;
    }
    if (_170)
    {
        return out;
    }
    float _180 = in.m_67.w;
    float _182 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_65.x;
    float _196 = in.m_65.y;
    float _198 = in.m_65.z;
    float _200 = in.m_60.x;
    float _202 = in.m_60.y;
    float _204 = in.m_60.z;
    float _206 = 0.0;
    float _208 = _182;
    if (!_192)
    {
        float _210 = _182 * _182;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    float _216 = _214;
    if (!_192)
    {
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _218;
    }
    float _220 = _216;
    bool _222 = !_192;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _182 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _182);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_192;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _182 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _208 = _278;
    }
    float _280 = _208;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = fma(_280, _194, _284);
    float _292 = fma(_280, _196, _286);
    float _294 = fma(_280, _198, _288);
    float _296 = fma(_290, _180, _200);
    float _298 = fma(_292, _180, _202);
    float _300 = fma(_294, _180, _204);
    bool _302 = !_282;
    float _320;
    if (!_302)
    {
        float _304 = in.m_69.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        float _324 = float(_124);
        float _326 = 1.0 / _324;
        float _328 = _158 * _326;
        _320 = _328;
    }
    _322 = false;
    float _330 = _320;
    float _332 = in.m_69.x;
    float _334 = in.m_69.y;
    float _336 = in.m_69.z;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = _330 + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _342;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _356 = _354 != 0;
    float _358 = 1.0 / _344;
    bool _360 = !_352;
    int _362 = _360 ? 0 : 1;
    int _364 = abs(_362);
    float _366 = _336 * 2.0;
    float _368 = _332 * 2.0;
    float _370 = _334 * 2.0;
    float _372 = _334 + _336;
    float _374 = _332 + _336;
    float _376 = _336 + (-0.5);
    float _378 = floor(_366);
    float _380 = _334 + _332;
    float _382 = _332 + (-0.5);
    float _384 = _340 * _358;
    float _386 = _372 + (-1.0);
    float _388 = _374 + (-1.0);
    float _390 = _380 + (-1.0);
    float _392 = floor(_368);
    float _394 = _334 + (-0.5);
    float _396 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _400 = !_348;
    int _402 = _400 ? 0 : 1;
    float _404 = floor(_370);
    bool _406 = _378 > 0.0;
    bool _408 = _378 >= 0.0;
    bool _410 = isnan(_378);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    int _418 = abs(_402);
    float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _422 = log2(_420);
    bool _424 = _392 >= 0.0;
    bool _426 = isnan(_392);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _436 = 1.0 + _434;
    bool _438 = _392 > 0.0;
    float _440 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _442 = _416 ? 0 : 1;
    int _444 = _432 ? 0 : 1;
    float _446 = 1.0 / _436;
    bool _448 = _404 > 0.0;
    bool _450 = _404 >= 0.0;
    bool _452 = isnan(_404);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    int _460 = ~_442;
    int _462 = _460 + 1;
    int _464 = _462 + 1;
    int _466 = ~_444;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = _422 * _158;
    int _474 = _464;
    int _476 = _470;
    if (!_406)
    {
        int _478 = ~_442;
        int _480 = _478 + 1;
        _474 = _480;
    }
    int _482 = _474;
    if (!_438)
    {
        int _484 = ~_444;
        int _486 = _484 + 1;
        _476 = _486;
    }
    int _488 = _476;
    float _490 = in.m_71.x;
    float _492 = in.m_71.y;
    float _494 = in.m_71.z;
    float _496 = exp2(_472);
    bool _498 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _500 = isnan(1.0);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _506 = _502 || _504;
    float _508 = float(_418);
    float _510 = float(_482);
    bool _512 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _520 = _516 || _518;
    float _522 = float(_364);
    float _524 = _508 * _510;
    float _526 = float(_488);
    int _528 = _458 ? 0 : 1;
    float _530 = -_496;
    float _532 = _530 + 1.0;
    float _534 = _524 * (-2.0);
    float _536 = _522 * _526;
    int _538 = ~_528;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = _520 ? _532 : 0.0;
    int _546 = _542;
    if (!_448)
    {
        int _548 = ~_528;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    if (_506)
    {
        float _554 = _544 * _446;
        _160 = _554;
    }
    float _556 = _160;
    float _558 = _536 * (-2.0);
    float _560 = fma(_534, _490, _490);
    float _562 = fma(_398, _534, _398);
    bool _564 = !_356;
    int _566 = _564 ? 0 : 1;
    float _568 = fma(_558, _492, _492);
    float _570 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[196].x, _560);
    float _572 = fma(_440, _558, _440);
    int _574 = abs(_566);
    float _576 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[196].y, _568);
    float _578 = fma(_562, _556, _570);
    float _580 = float(_574);
    float _582 = fma(_572, _556, _576);
    float _584 = float(_552);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _586;
    float _590 = _582 * 0.15915493667125701904296875;
    float _592 = _580 * _584;
    bool _594 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _596 = isnan(_330);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _606;
    bool _610 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _612 = isnan(_330);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _592 * (-2.0);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _624;
    float _628 = fma(_588, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _630 = _578 * 0.15915493667125701904296875;
    float _632 = in.m_67.x;
    float _634 = in.m_67.y;
    float _636 = in.m_67.z;
    float _638 = -_620;
    float _640 = _638 + 1.0;
    float _642 = fma(_622, _494, _494);
    float _644 = fma(_608, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _646 = fma(_626, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _648 = _604 * _640;
    float _650 = in.m_73.x;
    float _652 = in.m_73.y;
    float _654 = in.m_73.z;
    float _656 = fma(_396, _622, _396);
    float _658 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[196].z, _642);
    float _660 = -_604;
    float _662 = _660 + 1.0;
    float _664 = _644 * _648;
    float _666 = _628 * _648;
    float _668 = fma(_656, _556, _658);
    float _670 = _646 * _648;
    float _672 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].x, _664);
    float _674 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].z, _666);
    float _676 = _668 * 0.15915493667125701904296875;
    float _678 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].y, _670);
    float _680 = _630 * 6.283185482025146484375;
    float _682 = cos(_680);
    float _684 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[144].x, _672);
    float _686 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[144].z, _674);
    float _688 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[144].y, _678);
    float _690 = _684 * _632;
    float _692 = _688 * _634;
    float _694 = _590 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _686 * _636;
    float _700 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _702 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _652);
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _650);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _654);
    float _710 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = _590 * 6.283185482025146484375;
    float _714 = cos(_712);
    float _716 = _704 * _702;
    float _718 = _706 * _700;
    float _720 = _708 * _710;
    float _722 = _630 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = _682 * _696;
    float _728 = _676 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = _682 * _714;
    float _734 = _676 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = _724 * _696;
    float _740 = _724 * _714;
    float _742 = _682 * _730;
    float _744 = _714 * _730;
    float _746 = _724 * _730;
    float _748 = _696 * _730;
    float _750 = _742 * _716;
    float _752 = _746 * _716;
    float _754 = fma(_736, _732, _738);
    float _756 = fma(_736, _738, _732);
    float _758 = -_716;
    float _760 = _736 * _758;
    float _762 = -_726;
    float _764 = fma(_736, _740, _762);
    float _766 = -_740;
    float _768 = fma(_736, _726, _766);
    float _770 = fma(_754, _718, _750);
    float _772 = fma(_744, _718, _760);
    float _774 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _778 = fma(_768, _720, _770);
    float _780 = fma(_764, _718, _752);
    float _782 = fma(_748, _720, _772);
    float _784 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _786 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _776);
    float _788 = _778 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _790 = _778 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _792 = fma(_756, _720, _780);
    float _794 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _784);
    float _796 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _786);
    float _798 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _788);
    float _800 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].x, _790);
    float _802 = _794 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _804 = _796 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _806 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[8].z, _798);
    float _808 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[10].z, _800);
    float _810 = _802 + _806;
    float _812 = _804 + _808;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _816 = _810 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _820 = _812 + _818;
    float _822 = _816 * _816;
    float _824 = _820 * _820;
    float _826 = _822 + _824;
    float _828 = sqrt(_826);
    bool _830 = _828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _834 = _828 + _832;
    float _836 = 0.0;
    float _838 = _810;
    float _840 = _812;
    float _842 = _822;
    float _844 = _824;
    if (_830)
    {
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _836 = _846;
    }
    float _848 = _836;
    float _850 = _848;
    if (_830)
    {
        float _852 = _834 * _848;
        _850 = _852;
    }
    float _854 = _850;
    float _856 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _858 = _778 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _860 = _854;
    if (_830)
    {
        float _862 = _854 * 0.15915493667125701904296875;
        _860 = _862;
    }
    float _864 = _860;
    float _866 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _856);
    float _868 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].x, _858);
    float _870 = _856;
    float _872 = _868;
    if (_830)
    {
        float _874 = _864 * 6.283185482025146484375;
        float _876 = sin(_874);
        _870 = _876;
    }
    float _878 = _870;
    float _880 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _866);
    float _882 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[9].z, _868);
    float _884 = _880 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _886 = _300;
    if (_830)
    {
        float _888 = rsqrt(_826);
        _886 = _888;
    }
    float _890 = _886;
    float _892 = _884 + _882;
    float _894 = _892;
    if (_830)
    {
        float _896 = _892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _872 = _896;
    }
    float _898 = _872;
    float _900 = _898;
    if (_830)
    {
        float _902 = fma(_878, _898, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _900 = _902;
    }
    float _904 = _900;
    float _906 = _904;
    if (_830)
    {
        float _908 = _890 * _904;
        _906 = _908;
    }
    float _910 = _906;
    if (_830)
    {
        float _912 = fma(_816, _910, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _838 = _912;
    }
    float _914 = _838;
    if (_830)
    {
        float _916 = fma(_820, _910, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _840 = _916;
    }
    float _918 = _840;
    float _920 = fma(_914, 6.2500002968590706586837768554688e-05, 0.5);
    float _922 = fma(_918, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4042 = float2(_920, _922);
    float3 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4042, float2(0.0), isnan(_4042)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4042, float2(0.0), isnan(_4042)), level(0.0)).xyz;
    float _928 = _926.x;
    float _930 = _926.y;
    float _932 = _926.z;
    float _934 = in.m_75.y;
    bool _936 = _652 != 0.0;
    bool _938 = isnan(_652);
    bool _940 = _936 || _938;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    float _946 = _864;
    if (_830)
    {
        float _948 = _864 * 6.283185482025146484375;
        float _950 = cos(_948);
        _946 = _950;
    }
    float _952 = _946;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _956 = _954 != 0;
    float _958 = in.m_69.w;
    bool _960 = _650 == 0.0;
    bool _962 = !_944;
    bool _964 = _960 && _962;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _968 = _966 != 0;
    float _970 = in.m_77.x;
    float _972 = in.m_77.y;
    float _974 = in.m_77.z;
    bool _976 = _654 == 0.0;
    bool _978 = _976 && _964;
    float _980 = in.m_75.x;
    float _982 = _782;
    float _984 = 1.0;
    float _986 = 1.0;
    if (_956)
    {
        float _988 = in.m_69.z;
        _982 = _988;
    }
    float _990 = _982;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _996 = -_934;
    float _998 = _996 + 1.0;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1004 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1006 = _958 > 0.5;
    float _1008 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _934;
    if (_968)
    {
        float _1014 = _1006 ? _998 : _934;
        _1012 = _1014;
    }
    float _1016 = _1012;
    float _1018 = 0.0;
    float _1020 = _970;
    float _1022 = _972;
    if (_978)
    {
        _1018 = _970;
    }
    float _1024 = _1018;
    out.m_81.x = _1004;
    out.m_81.y = _1008;
    out.m_81.z = _1010;
    out.m_81.w = _1002;
    float _1026 = _1024;
    if (!_956)
    {
        _984 = _980;
    }
    float _1028 = _984;
    float _1030 = 0.0;
    float _1032 = _1028;
    if (_978)
    {
        _1030 = _1024;
    }
    float _1034 = _1030;
    bool _1036 = _990 > 0.5;
    bool _1038 = _1036 && _956;
    float _1040 = in.m_83.x;
    float _1042 = in.m_83.y;
    float _1044 = in.m_83.z;
    float _1046 = in.m_83.w;
    float _1048 = _1034;
    if (!_978)
    {
        _1026 = _970;
    }
    float _1050 = _1026;
    if (_978)
    {
        _1020 = _972;
    }
    float _1052 = _1020;
    float _1054 = _1052;
    if (_978)
    {
        _986 = _974;
    }
    float _1056 = _986;
    float _1058 = _1056;
    if (!_978)
    {
        float _1060 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _974);
        _1058 = _1060;
    }
    float _1062 = _1058;
    float _1064 = 0.0;
    if (_978)
    {
        _1064 = _1052;
    }
    float _1066 = _1064;
    float _1068 = _1066;
    if (!_978)
    {
        float _1070 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1050);
        _1048 = _1070;
    }
    float _1072 = _1048;
    if (!_978)
    {
        _1054 = _972;
    }
    float _1074 = _1054;
    if (_956)
    {
        _1022 = _980;
    }
    float _1076 = _1022;
    float _1078 = _1076;
    if (!_978)
    {
        float _1080 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1074);
        _1068 = _1080;
    }
    float _1082 = _1068;
    if (_1038)
    {
        float _1084 = -_1076;
        float _1086 = _1084 + 1.0;
        _1078 = _1086;
    }
    float _1088 = _1078;
    float _1090 = -_1082;
    float _1092 = _736 * _1090;
    float _1094 = _746 * _1082;
    if (_956)
    {
        _1032 = _1088;
    }
    float _1096 = _1032;
    float _1098 = fma(_744, _1072, _1092);
    float _1100 = fma(_764, _1072, _1094);
    float _1102 = _1044 * _1050;
    float _1104 = _1042 * _974;
    float _1106 = _1040 * _1074;
    float _1108 = fma(_748, _1062, _1098);
    float _1110 = -_1102;
    float _1112 = fma(_1040, _974, _1110);
    float _1114 = -_1104;
    float _1116 = fma(_1044, _1074, _1114);
    float _1118 = -_1106;
    float _1120 = fma(_1042, _1050, _1118);
    float _1122 = -_1042;
    float _1124 = _736 * _1122;
    float _1126 = _1112 * _1046;
    float _1128 = _742 * _1082;
    float _1130 = _1116 * _1046;
    float _1132 = _1120 * _1046;
    float _1134 = -_1126;
    float _1136 = _736 * _1134;
    float _1138 = _742 * _1042;
    float _1140 = _742 * _1126;
    float _1142 = _746 * _1042;
    float _1144 = _746 * _1126;
    float _1146 = fma(_754, _1072, _1128);
    float _1148 = fma(_744, _1130, _1136);
    float _1150 = fma(_754, _1130, _1140);
    float _1152 = fma(_744, _1040, _1124);
    float _1154 = fma(_754, _1040, _1138);
    float _1156 = fma(_764, _1040, _1142);
    float _1158 = fma(_764, _1130, _1144);
    float _1160 = fma(_768, _1062, _1146);
    float _1162 = fma(_748, _1044, _1152);
    float _1164 = fma(_768, _1044, _1154);
    float _1166 = fma(_756, _1044, _1156);
    float _1168 = fma(_748, _1132, _1148);
    float _1170 = fma(_768, _1132, _1150);
    float _1172 = fma(_756, _1132, _1158);
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1176 = _1132;
    float _1178 = _1174;
    if (_830)
    {
        float _1180 = _952 + (-1.0);
        _1176 = _1180;
    }
    float _1182 = _1176;
    float _1184 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1186 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1174);
    float _1190 = _1182;
    float _1192 = _1184;
    if (_830)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1194;
    }
    float _1196 = _1178;
    float _1198 = fma(_756, _1062, _1100);
    float _1200 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1184);
    float _1202 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1206 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_830)
    {
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1210 = _914 + _1208;
        _1190 = _1210;
    }
    float _1212 = _1190;
    if (_830)
    {
        float _1214 = fma(_892, _952, _1196);
        _894 = _1214;
    }
    float _1216 = _894;
    if (_830)
    {
        float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1220 = _918 + _1218;
        _1192 = _1220;
    }
    float _1222 = _1192;
    float _1224 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1206);
    if (_830)
    {
        float _1226 = _1212 * _1212;
        _842 = _1226;
    }
    float _1228 = _842;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1232 = _1216 + _1230;
    float _1234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1236 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_830)
    {
        float _1238 = _1222 * _1222;
        _844 = _1238;
    }
    float _1240 = _844;
    float _1242 = fma(_1232, _1232, _1228);
    float _1244 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1246 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1248 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1236);
    float _1250 = _1242 + _1240;
    float _1252 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1244);
    float _1254 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1256 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1258 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1260 = _1246 * _1204;
    float _1262 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1264 = sqrt(_1250);
    float _1266 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1254);
    float _1268 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1256);
    float _1270 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1258);
    float _1272 = _1262 * _1234;
    float _1274 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1224);
    float _1276 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1248);
    float _1278 = fma(_1172, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1266);
    float _1280 = fma(_1172, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1268);
    float _1282 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1188);
    float _1284 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1252);
    float _1286 = fma(_1172, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1270);
    float _1288 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1200);
    float _1290 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1202);
    out.m_85.z = _1260;
    out.m_85.w = _1272;
    bool _1292 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1294 = isnan(_1264);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1300 = _1296 || _1298;
    out.m_87.x = _1274;
    out.m_87.y = _1276;
    out.m_87.z = _1284;
    out.m_89.x = _1278;
    out.m_89.y = _1280;
    out.m_89.z = _1286;
    out.m_91.x = _1282;
    out.m_91.y = _1288;
    out.m_91.z = _1290;
    float _1302 = _1270;
    if (!_1300)
    {
        _1302 = 1.0;
    }
    float _1304 = _1302;
    out.m_93.x = _928;
    out.m_93.y = _930;
    out.m_93.z = _932;
    bool _1306 = !_1300;
    float _1308 = _1304;
    if (!_1306)
    {
        bool _1310 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1312 = isnan(_1264);
        bool _1314 = _1310 || _1312;
        bool _1316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1318 = _1314 || _1316;
        if (!_1318)
        {
            float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1322 = _1264 + _1320;
            float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1326 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1324;
            float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1330 = _1328 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1332 = 1.0 / _1326;
            float _1334 = _1322 * _1332;
            float _1336 = fma(_1334, _1330, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1308 = _1336;
            _1338 = true;
        }
        else
        {
            bool _1340 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1342 = isnan(_1264);
            bool _1344 = _1340 || _1342;
            bool _1346 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1348 = _1344 || _1346;
            if (!_1348)
            {
                float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1352 = _1264 + _1350;
                float _1354 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1356 = _1354 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1358 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1360 = _1358 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1362 = 1.0 / _1356;
                float _1364 = _1352 * _1362;
                float _1366 = fma(_1364, _1360, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1308 = _1366;
                _1338 = true;
            }
            else
            {
                _1308 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1338 = false;
    float _1368 = _1308;
    float _1370 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1372 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1374 = floor(_1370);
    float _1376 = floor(_1372);
    float _1378 = -_1374;
    float _1380 = _1370 + _1378;
    float _1382 = -_1376;
    float _1384 = _1372 + _1382;
    float2 _4860 = float2(_1380, _1384);
    float _1386 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4860, float2(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4860, float2(0.0), isnan(_4860)), level(0.0)).x;
    float _1388 = _884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1392 = _914 + _1390;
    float _1394 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1388);
    float _1396 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1398 = _1216 + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1402 = _918 + _1400;
    float _1404 = fma(_1392, _1368, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1406 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1394);
    float _1408 = _884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1410 = fma(_1398, _1368, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1412 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1414 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1408);
    float _1416 = fma(_1402, _1368, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1418 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1420 = 1.0 / _1412;
    float _1422 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1414);
    float _1424 = _884 + _1418;
    float _1426 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1428 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1430 = _1426 + _1412;
    float _1432 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1428);
    float _1434 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1432);
    float _1436 = _1430 * _1420;
    float _1438 = _1436 * 0.5;
    float _1440 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1444 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1442);
    float _1446 = 1.0 / _1444;
    bool _1448 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.5);
    bool _1456 = _1452 || _1454;
    float _1458 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1460 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1458);
    float _1462 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    int _1464 = 2;
    int _1466 = as_type<int>(_1402);
    if (_1456)
    {
        _1462 = _1416;
    }
    float _1468 = _1462;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1472 = _1446 * _1470;
    float _1474 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1460);
    bool _1476 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1478 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1480 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1482 = !_1476;
    int _1484 = _1482 ? 0 : 1;
    float _1486 = trunc(_1478);
    int _1488 = int(_1486);
    float _1490 = _1468;
    if (!_1476)
    {
        _1464 = 1;
    }
    int _1492 = _1464;
    int _1494 = _1492;
    if (!_1480)
    {
        _1494 = _1484;
    }
    int _1496 = _1494;
    float _1498 = trunc(_1440);
    int _1500 = int(_1498);
    int _1502 = _1496 << 6;
    int _1504 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1506 = _1488 + _1504;
    int _1508 = _1506 + 1;
    int _1510 = _1502 + 48;
    uint _1513 = uint(int(uint(_1510) >> uint(2)));
    uint _1515 = uint(int(uint(int(_1513)) >> uint(2)));
    int _1517 = int(_1513) & 3;
    float _1519 = (*spvDescriptorSet0.vp_c15)._m0[int(_1515)][_1517];
    int _1521 = int(_1513) + 1;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    int _1525 = _1521 & 3;
    float _1527 = (*spvDescriptorSet0.vp_c15)._m0[int(_1523)][_1525];
    int _1529 = _1502 + 56;
    uint _1531 = uint(int(uint(_1529) >> uint(2)));
    uint _1533 = uint(int(uint(int(_1531)) >> uint(2)));
    int _1535 = int(_1531) & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    int _1539 = int(_1531) + 1;
    uint _1541 = uint(int(uint(_1539) >> uint(2)));
    int _1543 = _1539 & 3;
    float _1545 = (*spvDescriptorSet0.vp_c15)._m0[int(_1541)][_1543];
    int _1547 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1549 = _1500 + _1547;
    int _1551 = _1549 + 1;
    float _1553 = as_type<float>(_1500);
    float _1555 = as_type<float>(_1551);
    if (_1456)
    {
        _1553 = _1410;
    }
    float _1557 = _1553;
    bool _1559 = _1551 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1561 = _1502 + 64;
    uint _1563 = uint(int(uint(_1561) >> uint(2)));
    uint _1565 = uint(int(uint(int(_1563)) >> uint(2)));
    int _1567 = int(_1563) & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = int(_1563) + 1;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    int _1575 = _1571 & 3;
    float _1577 = (*spvDescriptorSet0.vp_c15)._m0[int(_1573)][_1575];
    int _1579 = _1551 | _1508;
    bool _1581 = _1579 < 0;
    bool _1583 = _1581 || _1559;
    float _1585 = as_type<float>(_1579);
    float _1587 = _1557;
    if (_1456)
    {
        _1585 = _1404;
    }
    float _1589 = _1585;
    int _1591 = _1502 + 72;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
    int _1597 = int(_1593) & 3;
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
    int _1601 = int(_1593) + 1;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    int _1605 = _1601 & 3;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[int(_1603)][_1605];
    bool _1609 = _1508 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1611 = _1609 || _1583;
    int _1613 = _1502 + 96;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    uint _1617 = uint(int(uint(int(_1615)) >> uint(2)));
    int _1619 = int(_1615) & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    int _1623 = int(_1615) + 1;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    int _1627 = _1623 & 3;
    float _1629 = (*spvDescriptorSet0.vp_c15)._m0[int(_1625)][_1627];
    int _1631 = _1502 + 104;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    uint _1635 = uint(int(uint(int(_1633)) >> uint(2)));
    int _1637 = int(_1633) & 3;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
    int _1641 = int(_1633) + 1;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    int _1645 = _1641 & 3;
    float _1647 = (*spvDescriptorSet0.vp_c15)._m0[int(_1643)][_1645];
    float _1649 = _1589;
    int _1651 = as_type<int>(_1639);
    if (!_1456)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1655 = _884 + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1659 = _802 + _1657;
        float _1661 = -_884;
        float _1663 = _1661 + _1410;
        float _1665 = _1655 * _1655;
        float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1669 = _804 + _1667;
        float _1671 = fma(_1659, _1659, _1665);
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1675 = fma(_1669, _1669, _1671);
        float _1677 = sqrt(_1675);
        float _1679 = precise::min(_1677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1681 = _1679 * _1673;
        float _1683 = -_802;
        float _1685 = _1683 + _1404;
        float _1687 = -_804;
        float _1689 = _1687 + _1416;
        float _1691 = fma(_1663, _1681, _884);
        float _1693 = fma(_1685, _1681, _802);
        float _1695 = fma(_1689, _1681, _804);
        _1587 = _1691;
        _1649 = _1693;
        _1490 = _1695;
        _1466 = as_type<int>(_1677);
    }
    float _1697 = _1587;
    float _1699 = _1649;
    float _1701 = _1490;
    int _1703 = _1466;
    float _1705 = _1424 * _1629;
    float _1707 = _1424 * _1577;
    float _1709 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1711 = _1703;
    if (!_1611)
    {
        int _1713 = _1508 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1715 = _1713 + _1551;
        _1711 = _1715;
    }
    int _1717 = _1711;
    float _1719 = fma(_802, _1621, _1705);
    float _1721 = _1424 * _1527;
    float _1723 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1725 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1727 = fma(_804, _1639, _1719);
    float _1729 = fma(_802, _1519, _1721);
    float _1731 = fma(_802, _1569, _1707);
    float _1733 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1723);
    int _1735 = _1502 + 80;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    uint _1739 = uint(int(uint(int(_1737)) >> uint(2)));
    int _1741 = int(_1737) & 3;
    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[int(_1739)][_1741];
    int _1745 = int(_1737) + 1;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    int _1749 = _1745 & 3;
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
    int _1753 = as_type<int>(_1733);
    float _1755 = as_type<float>(_1717);
    if (!_1611)
    {
        int _1757 = _1717 << 2;
        _1651 = _1757;
    }
    int _1759 = _1651;
    float _1761 = _1727 + _1647;
    float _1763 = fma(_804, _1537, _1729);
    float _1765 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1767 = _1759;
    if (!_1611)
    {
        uint _1769 = uint(int(uint(_1717) >> uint(2)));
        _1753 = int(_1769);
    }
    int _1771 = _1753;
    float _1773 = 1.0 / _1761;
    if (!_1611)
    {
        int _1775 = 12 & _1759;
        _1767 = _1775;
    }
    int _1777 = _1767;
    int _1779 = _1502 + 88;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
    int _1785 = int(_1781) & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    int _1789 = int(_1781) + 1;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    int _1793 = _1789 & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    float _1797 = _1765 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1799 = fma(_804, _1599, _1731);
    if (!_1611)
    {
        int _1801 = _1771 << 4;
        int _1803 = _1801 + _1777;
        _1555 = as_type<float>(_1803);
    }
    float _1805 = _1555;
    float _1807 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1809 = -_1797;
    float _1811 = fma(_1809, _1725, 1.0);
    float _1813 = _1763 + _1545;
    float _1815 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1817 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1819 = _1805;
    if (!_1611)
    {
        int _1821 = as_type<int>(_1805) + 400;
        uint _1823 = uint(int(uint(_1821) >> uint(2)));
        uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
        int _1827 = int(_1823) & 3;
        float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
        _1819 = _1829;
    }
    float _1831 = _1819;
    float _1833 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1807);
    float _1835 = _1799 + _1607;
    float _1837 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1815);
    float _1839 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1817);
    float _1841 = _1813 * _1773;
    float _1843 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1833);
    float _1845 = _1835 * _1773;
    float _1847 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1839);
    float _1849 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1837);
    float _1851 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1853 = _1841 >= 0.0;
    float _1855 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1861 = _1841 <= 1.0;
    bool _1863 = _1861 && _1853;
    float _1865 = log2(_1811);
    float _1867 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1869 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    bool _1871 = _1845 >= 0.0;
    bool _1873 = _1871 && _1863;
    float _1875 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1867);
    float _1877 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1869);
    bool _1879 = _1845 <= 1.0;
    bool _1881 = _1879 && _1873;
    float _1883 = _1725;
    if (!_1611)
    {
        float _1885 = floor(_1440);
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1891 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1877);
    float _1893 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1889);
    float _1895 = _1424 * _1751;
    float _1897 = as_type<float>(_1508);
    float _1899 = _1751;
    if (!_1611)
    {
        float _1901 = floor(_1478);
        _1897 = _1901;
    }
    float _1903 = _1897;
    float _1905 = _1865 * 0.693147182464599609375;
    float _1907 = fma(_802, _1743, _1895);
    float _1909 = _1905;
    float _1911 = _1907;
    if (_1881)
    {
        float _1913 = float(_1496);
        _1899 = _1913;
    }
    float _1915 = _1899;
    float _1917 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1875);
    float _1919 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1893);
    float _1921 = fma(_804, _1787, _1907);
    float _1923 = 1.0 / _1891;
    float _1925 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1917);
    float _1927 = _1921 + _1795;
    float _1929 = _1927 * _1773;
    float _1931 = _1895;
    float _1933 = _1925;
    if (_1881)
    {
        float _1935 = rint(_1915);
        float _1937 = precise::max(_1935, 0.0);
        uint _1939 = uint(_1937);
        uint _1941 = clamp(_1939, 0u, 65535u);
        _1931 = as_type<float>(_1941);
    }
    float _1943 = _1931;
    float _1945 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    if (!_1611)
    {
        float _1947 = -_1887;
        float _1949 = _1440 + _1947;
        _1909 = _1949;
    }
    float _1951 = _1909;
    float _1953 = _1903;
    if (!_1611)
    {
        float _1955 = -_1903;
        float _1957 = _1478 + _1955;
        _1953 = _1957;
    }
    float _1959 = _1953;
    float _1961 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1919);
    float _1963 = _1887;
    if (!_1611)
    {
        float _1965 = rint(_1831);
        float _1967 = precise::max(_1965, 0.0);
        uint _1969 = uint(_1967);
        uint _1971 = clamp(_1969, 0u, 65535u);
        _1963 = as_type<float>(_1971);
    }
    float _1973 = _1963;
    float _1975 = _1961 * _1923;
    float _1977 = _1925 * _1923;
    float _1979 = fma(_1975, 0.5, 0.5);
    float _1981 = fma(_1977, -0.5, 0.5);
    float _1983 = _1845;
    float _1985 = _1977;
    float _1987 = _1981;
    if (_1881)
    {
        float3 _5883 = float3(_1841, _1845, float(as_type<int>(_1943)));
        float3 _5887 = select(_5883, float3(0.0), isnan(_5883));
        float _1989 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5887.xy, uint(rint(_5887.z)), _1929, level(0.0));
        _1983 = _1989;
    }
    float _1991 = _1983;
    float3 _5897 = float3(_1979, _1981, _1945);
    float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5897, float3(0.0), isnan(_5897)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5897, float3(0.0), isnan(_5897)), level(0.0)).x;
    float3 _5906 = float3(_1979, _1981, _1945);
    float4 _1996 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5906, float3(0.0), isnan(_5906)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5906, float3(0.0), isnan(_5906)), level(0.0)).xyzw;
    float _1998 = _1996.x;
    float _2000 = _1996.y;
    float _2002 = _1996.z;
    float _2004 = _1996.w;
    float _2006 = _1951;
    if (!_1611)
    {
        float3 _5929 = float3(_1951, _1959, float(as_type<int>(_1973)));
        float3 _5931 = select(_5929, float3(0.0), isnan(_5929));
        float _2008 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5931.xy, uint(rint(_5931.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5931.xy, uint(rint(_5931.z)), level(0.0)).x;
        _2006 = _2008;
    }
    float _2010 = _2006;
    if (_1611)
    {
        _1985 = 1.0;
    }
    float _2012 = _1985;
    float _2014 = _2012;
    if (!_1611)
    {
        int _2016 = _1717 << 4;
        int _2018 = _2016 + 2048;
        uint _2020 = uint(int(uint(_2018) >> uint(2)));
        uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
        int _2024 = int(_2020) & 3;
        float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
        int _2028 = int(_2020) + 1;
        uint _2030 = uint(int(uint(_2028) >> uint(2)));
        int _2032 = _2028 & 3;
        float _2034 = (*spvDescriptorSet0.vp_c15)._m0[int(_2030)][_2032];
        int _2036 = _2018 + 8;
        uint _2038 = uint(int(uint(_2036) >> uint(2)));
        uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
        int _2042 = int(_2038) & 3;
        float _2044 = (*spvDescriptorSet0.vp_c15)._m0[int(_2040)][_2042];
        int _2046 = int(_2038) + 1;
        uint _2048 = uint(int(uint(_2046) >> uint(2)));
        int _2050 = _2046 & 3;
        float _2052 = (*spvDescriptorSet0.vp_c15)._m0[int(_2048)][_2050];
        float _2054 = _1424 * _2034;
        float _2056 = fma(_802, _2026, _2054);
        float _2058 = fma(_804, _2044, _2056);
        float _2060 = _2058 + _2052;
        float _2062 = precise::clamp(_2060, 0.0, 1.0);
        float _2064 = -_2062;
        float _2066 = _2064 + _2010;
        float _2068 = fma(_2066, 500.0, 1.5);
        float _2070 = exp2(_2068);
        float _2072 = 0.0 + _2070;
        float _2074 = precise::clamp(_2072, 0.0, 1.0);
        _1755 = as_type<float>(_2018);
        _2014 = _2074;
    }
    float _2076 = _1755;
    float _2078 = _2014;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _1697 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _1699 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _1701 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2102 = _2086 * _2100;
    float _2104 = _2090 * _2100;
    float _2106 = _2102 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 + _2108;
    float _2112 = sqrt(_2110);
    bool _2114 = _2112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = _2112 + _2116;
    float _2120 = _2090;
    float _2122 = _2076;
    float _2124 = _2118;
    float _2126 = _2082;
    if (_2114)
    {
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2128;
    }
    float _2130 = _2120;
    if (_2114)
    {
        float _2132 = rsqrt(_2110);
        _2122 = _2132;
    }
    float _2134 = _2122;
    float _2136 = _2134;
    if (_2114)
    {
        float _2138 = _2118 * _2130;
        _2124 = _2138;
    }
    float _2140 = _2124;
    if (_2114)
    {
        float _2142 = _2140 * 0.15915493667125701904296875;
        _1911 = _2142;
    }
    float _2144 = _1911;
    float _2146 = _2098;
    float _2148 = _2144;
    if (_2114)
    {
        float _2150 = _2144 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        _2146 = _2152;
    }
    float _2154 = _2146;
    float _2156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2158 = precise::max(0.0, _2156);
    float _2160 = _2094;
    float _2162 = _2158;
    float _2164 = _2156;
    if (_2114)
    {
        float _2166 = _2144 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2160 = _2168;
    }
    float _2170 = _2160;
    float _2172 = -_2100;
    float _2174 = -_2158;
    float _2176 = fma(_2082, _2172, _2174);
    if (!_2114)
    {
        _2162 = _2104;
    }
    float _2178 = _2162;
    float _2180 = _2178;
    if (_2114)
    {
        float _2182 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2164 = _2182;
    }
    float _2184 = _2164;
    float _2186 = _2154;
    float _2188 = _2184;
    if (_2114)
    {
        float _2190 = fma(_2154, _2184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2126 = _2190;
    }
    float _2192 = _2126;
    float _2194 = _2192;
    if (!_2114)
    {
        _2186 = _2102;
    }
    float _2196 = _2186;
    float _2198 = _2196;
    float _2200 = _2170;
    if (_2114)
    {
        float _2202 = _2170 + (-1.0);
        _2188 = _2202;
    }
    float _2204 = _2188;
    if (_2114)
    {
        float _2206 = _2134 * _2192;
        _1987 = _2206;
    }
    float _2208 = _1987;
    if (!_2114)
    {
        _2194 = _2176;
    }
    float _2210 = _2194;
    float _2212 = _2210;
    if (_2114)
    {
        float _2214 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2148 = _2214;
    }
    float _2216 = _2148;
    if (_2114)
    {
        float _2218 = _2102 * _2208;
        _2198 = _2218;
    }
    float _2220 = _2198;
    if (!_2114)
    {
        _2136 = _2106;
    }
    float _2222 = _2136;
    float _2224 = _2222;
    if (_2114)
    {
        float _2226 = _2104 * _2208;
        _2180 = _2226;
    }
    float _2228 = _2180;
    if (_2114)
    {
        float _2230 = fma(_2176, _2170, _2216);
        _2212 = _2230;
    }
    float _2232 = _2212;
    if (_2114)
    {
        float _2234 = _2220 * _2220;
        _2224 = _2234;
    }
    float _2236 = _2224;
    if (!_2114)
    {
        _2200 = _2108;
    }
    float _2238 = _2200;
    float _2240 = _2238;
    if (_2114)
    {
        float _2242 = _2228 * _2228;
        _2240 = _2242;
    }
    float _2244 = _2240;
    float _2246 = sqrt(_2096);
    float _2248 = fma(_2232, _2232, _2236);
    float _2250 = _2248 + _2244;
    float _2252 = rsqrt(_2250);
    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2256 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2254);
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    float _2260 = -_2258;
    float _2262 = _2260 + 1.0;
    float _2264 = _2252 * _2220;
    float _2266 = _2252 * _2232;
    float _2268 = _2252 * _2228;
    float _2270 = abs(_2262);
    float _2272 = log2(_2270);
    float _2274 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2276 = -_2274;
    float _2278 = fma(_2266, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2276);
    float _2280 = -_2268;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2278);
    float _2284 = fma(_2282, -0.5, 0.5);
    float _2286 = fma(_2282, 0.5, 0.5);
    float _2288 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2290 = fma(_2286, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2292 = sqrt(_2284);
    float _2294 = fma(_2286, _2290, -0.212114393711090087890625);
    float _2296 = _2266 + 1.0;
    float _2298 = fma(_2286, _2294, 1.570728778839111328125);
    float _2300 = exp2(_2288);
    float _2302 = _2292 * 0.636619746685028076171875;
    float _2304 = -_2266;
    float _2306 = fma(_2300, _2296, _2304);
    float _2308 = -_2298;
    float _2310 = fma(_2302, _2308, 1.0);
    float _2312 = fma(_2306, 0.5, 0.5);
    float2 _6406 = float2(_2310, _2312);
    float3 _2314 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6406, float2(0.0), isnan(_6406)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6406, float2(0.0), isnan(_6406)), level(0.0)).xyz;
    float _2316 = _2314.x;
    float _2318 = _2314.y;
    float _2320 = _2314.z;
    float _2322 = abs(_1472);
    float _2324 = log2(_2322);
    float _2326 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2328 = -_1386;
    float _2330 = _2328 + 1.0;
    float _2332 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2326);
    out.m_95.x = _1699;
    out.m_95.y = _1697;
    out.m_95.z = _1701;
    bool _2334 = _1472 <= 8000.0;
    bool _2336 = isnan(_1472);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan(8000.0);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2348 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2332);
    float _2350 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2352 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2348);
    float _2354 = exp2(_2346);
    float _2356 = exp2(_2350);
    float _2358 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2360 = precise::clamp(_2358, 0.0, 1.0);
    float _2362 = fma(_2360, -2.0, 3.0);
    float _2364 = _2360 * _2360;
    float _2366 = -_2356;
    float _2368 = _2366 + 1.0;
    float _2370 = _2364 * _2362;
    float _2372 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2374 = -_2370;
    float _2376 = _2374 + 1.0;
    float _2378 = _2372 * _1993;
    float _2380 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2370);
    float _2382 = _2352 + _1891;
    float _2384 = -_2372;
    float _2386 = _2384 + 1.0;
    float _2388 = _2344 * _2380;
    float _2390 = _2382 * 0.5;
    float _2392 = _2382;
    float _2394 = _2352;
    float _2396 = _1961;
    if (!_1881)
    {
        _2392 = 1.0;
    }
    float _2398 = _2392;
    out.gl_Position.x = _1961;
    out.gl_Position.y = _1925;
    out.gl_Position.z = _2352;
    out.gl_Position.w = _1891;
    float _2400 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2402 = _2398;
    if (_1881)
    {
        bool _2404 = _1991 >= _1929;
        bool _2406 = isnan(_1991);
        bool _2408 = _2404 || _2406;
        bool _2410 = isnan(_1929);
        bool _2412 = _2408 || _2410;
        float _2414 = float(_2412);
        _2402 = _2414;
    }
    float _2416 = _2402;
    float _2418 = _2004 * _2378;
    out.m_97.z = _2390;
    out.m_97.w = _1891;
    float _2420 = _2330 * _2400;
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    bool _2424 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2426 = isnan(_2246);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2432 = _2428 || _2430;
    float _2434 = _2416 * _2078;
    float _2436 = -_2422;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2440 = -_2434;
    float _2442 = fma(_2440, _2438, 1.0);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    float _2446 = _2444 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2448 = _2434;
    float _2450 = _2444;
    float _2452 = _2422;
    if (!_2432)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2454 = _2394;
    float _2456 = _2454;
    float _2458 = _2454;
    if (!_2432)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2460 = _1933;
    out.m_99.x = _2446;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2432)
    {
        _2396 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2466 = _2396;
    float _2468 = _2466;
    float _2470 = _2466;
    if (!_2432)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2472 = _2448;
    float _2474 = _2472;
    float _2476 = _2472;
    if (!_2432)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2478 = _2450;
    float _2480 = _2478;
    float _2482 = _2478;
    if (!_2432)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2484 = _2452;
    float _2486 = _2320 * _2378;
    float _2488 = fma(_2316, _2418, _1998);
    float _2490 = fma(_2318, _2418, _2000);
    float _2492 = _2004 * _2386;
    float _2494 = fma(_2004, _2486, _2002);
    out.m_101.x = _2488;
    out.m_101.y = _2490;
    out.m_101.z = _2494;
    out.m_101.w = _2492;
    bool _2496 = !_2432;
    float _2498 = _2484;
    float _2500 = _2484;
    if (!_2496)
    {
        bool _2502 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2504 = isnan(_2246);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2510 = _2506 || _2508;
        if (!_2510)
        {
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2514 = _2246 + _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2518 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2516;
            float _2520 = 1.0 / _2518;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2542 = _2514 * _2520;
            float _2544 = precise::clamp(_2542, 0.0, 1.0);
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2550 = fma(_2544, _2524, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2552 = fma(_2544, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2554 = fma(_2544, _2528, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2556 = fma(_2544, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2558 = fma(_2544, _2536, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2560 = fma(_2544, _2540, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2464 = _2552;
            _2482 = _2558;
            _2458 = _2550;
            _2476 = _2556;
            _2470 = _2554;
            _2500 = _2560;
            _2562 = true;
        }
        else
        {
            bool _2564 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2566 = isnan(_2246);
            bool _2568 = _2564 || _2566;
            bool _2570 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2572 = _2568 || _2570;
            if (!_2572)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2574 = _2456;
            _2458 = _2574;
            if (!_2572)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2576 = _2462;
            _2464 = _2576;
            if (!_2572)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2578 = _2468;
            _2470 = _2578;
            if (!_2572)
            {
                _2474 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2580 = _2474;
            _2476 = _2580;
            if (!_2572)
            {
                _2480 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2582 = _2480;
            _2482 = _2582;
            if (!_2572)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2584 = _2498;
            bool _2586 = !_2572;
            _2500 = _2584;
            if (!_2586)
            {
                bool _2588 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2590 = isnan(_2246);
                bool _2592 = _2588 || _2590;
                bool _2594 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2596 = _2592 || _2594;
                if (!_2596)
                {
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2600 = _2246 + _2598;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2604 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2602;
                    float _2606 = 1.0 / _2604;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2622 = _2620 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2628 = _2600 * _2606;
                    float _2630 = precise::clamp(_2628, 0.0, 1.0);
                    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2636 = fma(_2630, _2610, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2638 = fma(_2630, _2634, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2640 = fma(_2630, _2614, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2642 = fma(_2630, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2644 = fma(_2630, _2622, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2646 = fma(_2630, _2626, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2464 = _2638;
                    _2482 = _2644;
                    _2458 = _2636;
                    _2476 = _2642;
                    _2470 = _2640;
                    _2500 = _2646;
                    _2562 = true;
                }
                else
                {
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2482 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2476 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2562 = false;
    float _2648 = _2464;
    float _2650 = _2482;
    float _2652 = _2458;
    float _2654 = _2476;
    float _2656 = _2470;
    float _2658 = _2500;
    float _2660 = fma(_1288, -0.5, 0.5);
    float _2662 = precise::clamp(_2660, 0.0, 1.0);
    float _2664 = -_2648;
    float _2666 = _2664 + _2650;
    float _2668 = -_2652;
    float _2670 = _2668 + _2654;
    float _2672 = -_2656;
    float _2674 = _2672 + _2658;
    bool _2676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2678 = fma(_2662, _2666, _2648);
    float _2680 = fma(_2662, _2670, _2652);
    float _2682 = fma(_2662, _2674, _2656);
    float _2684 = _2678 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2686 = fma(_2680, 0.298911988735198974609375, _2684);
    float _2688 = fma(_2682, 0.114477999508380889892578125, _2686);
    out.m_103.x = 0.0;
    float _2690 = -_2688;
    float _2692 = _2680 + _2690;
    float _2694 = -_2688;
    float _2696 = _2678 + _2694;
    float _2698 = -_2688;
    float _2700 = _2682 + _2698;
    float _2702 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2706 = fma(_2696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2708 = fma(_2700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    out.m_99.w = _2702;
    out.m_105.x = _2704;
    out.m_105.y = _2706;
    out.m_105.z = _2708;
    if (!_2676)
    {
        return out;
    }
    float _2710 = -_1697;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2714 = -_1699;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2718 = -_1701;
    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2722 = _2712 * _2712;
    float _2724 = fma(_2716, _2716, _2722);
    float _2726 = fma(_2720, _2720, _2724);
    float _2728 = sqrt(_2726);
    float _2730 = rsqrt(_2726);
    float _2732 = -_2728;
    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2736 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2738 = precise::clamp(_2736, 0.0, 1.0);
    float _2740 = _2716 * _2730;
    float _2742 = _2712 * _2730;
    float _2744 = abs(_2738);
    float _2746 = log2(_2744);
    float _2748 = _2720 * _2730;
    float _2750 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2752 = _1288 * _2742;
    float _2754 = -_2742;
    float _2756 = -_2750;
    float _2758 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2756);
    float _2760 = fma(_1282, _2740, _2752);
    float _2762 = -_2748;
    float _2764 = fma(_2762, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2758);
    float _2766 = fma(_1290, _2748, _2760);
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2772 = _2764 + _2770;
    float _2774 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2776 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2778 = precise::clamp(_2776, 0.0, 1.0);
    float _2780 = exp2(_2774);
    float _2782 = _2780 * _2778;
    float _2784 = _2768 * _2782;
    float _2786 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2788 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2790 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2786;
    out.m_103.y = _2788;
    out.m_103.z = _2790;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2562 = false;
    bool _1338 = false;
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_60.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_63.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2847 = as_type<float>(_140);
        out.gl_Position.z = _2847;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_65.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_63.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2917 = as_type<float>(_178);
        out.gl_Position.z = _2917;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_67.w;
    float _182 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_65.x;
    float _196 = in.m_65.y;
    float _198 = in.m_65.z;
    float _200 = in.m_60.x;
    float _202 = in.m_60.y;
    float _204 = in.m_60.z;
    float _206 = 0.0;
    float _208 = _182;
    if (!_192)
    {
        float _210 = _182 * _182;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    float _216 = _214;
    if (!_192)
    {
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _218;
    }
    float _220 = _216;
    bool _222 = !_192;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _182 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _182);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_192;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _182 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _208 = _278;
    }
    float _280 = _208;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = fma(_280, _194, _284);
    float _292 = fma(_280, _196, _286);
    float _294 = fma(_280, _198, _288);
    float _296 = fma(_290, _180, _200);
    float _298 = fma(_292, _180, _202);
    float _300 = fma(_294, _180, _204);
    bool _302 = !_282;
    float _320;
    if (!_302)
    {
        float _304 = in.m_69.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        float _324 = float(_124);
        float _326 = 1.0 / _324;
        float _328 = _158 * _326;
        _320 = _328;
    }
    _322 = false;
    float _330 = _320;
    float _332 = in.m_69.x;
    float _334 = in.m_69.y;
    float _336 = in.m_69.z;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = _330 + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _342;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _356 = _354 != 0;
    float _358 = 1.0 / _344;
    bool _360 = !_352;
    int _362 = _360 ? 0 : 1;
    int _364 = abs(_362);
    float _366 = _336 * 2.0;
    float _368 = _332 * 2.0;
    float _370 = _334 * 2.0;
    float _372 = _334 + _336;
    float _374 = _332 + _336;
    float _376 = _336 + (-0.5);
    float _378 = floor(_366);
    float _380 = _334 + _332;
    float _382 = _332 + (-0.5);
    float _384 = _340 * _358;
    float _386 = _372 + (-1.0);
    float _388 = _374 + (-1.0);
    float _390 = _380 + (-1.0);
    float _392 = floor(_368);
    float _394 = _334 + (-0.5);
    float _396 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _400 = !_348;
    int _402 = _400 ? 0 : 1;
    float _404 = floor(_370);
    bool _406 = _378 > 0.0;
    bool _408 = _378 >= 0.0;
    bool _410 = isnan(_378);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    int _418 = abs(_402);
    float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _422 = log2(_420);
    bool _424 = _392 >= 0.0;
    bool _426 = isnan(_392);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _436 = 1.0 + _434;
    bool _438 = _392 > 0.0;
    float _440 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _442 = _416 ? 0 : 1;
    int _444 = _432 ? 0 : 1;
    float _446 = 1.0 / _436;
    bool _448 = _404 > 0.0;
    bool _450 = _404 >= 0.0;
    bool _452 = isnan(_404);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    int _460 = ~_442;
    int _462 = _460 + 1;
    int _464 = _462 + 1;
    int _466 = ~_444;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = _422 * _158;
    int _474 = _464;
    int _476 = _470;
    if (!_406)
    {
        int _478 = ~_442;
        int _480 = _478 + 1;
        _474 = _480;
    }
    int _482 = _474;
    if (!_438)
    {
        int _484 = ~_444;
        int _486 = _484 + 1;
        _476 = _486;
    }
    int _488 = _476;
    float _490 = in.m_71.x;
    float _492 = in.m_71.y;
    float _494 = in.m_71.z;
    float _496 = exp2(_472);
    bool _498 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _500 = isnan(1.0);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _506 = _502 || _504;
    float _508 = float(_418);
    float _510 = float(_482);
    bool _512 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _520 = _516 || _518;
    float _522 = float(_364);
    float _524 = _508 * _510;
    float _526 = float(_488);
    int _528 = _458 ? 0 : 1;
    float _530 = -_496;
    float _532 = _530 + 1.0;
    float _534 = _524 * (-2.0);
    float _536 = _522 * _526;
    int _538 = ~_528;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = _520 ? _532 : 0.0;
    int _546 = _542;
    if (!_448)
    {
        int _548 = ~_528;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    if (_506)
    {
        float _554 = _544 * _446;
        _160 = _554;
    }
    float _556 = _160;
    float _558 = _536 * (-2.0);
    float _560 = fma(_534, _490, _490);
    float _562 = fma(_398, _534, _398);
    bool _564 = !_356;
    int _566 = _564 ? 0 : 1;
    float _568 = fma(_558, _492, _492);
    float _570 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[196].x, _560);
    float _572 = fma(_440, _558, _440);
    int _574 = abs(_566);
    float _576 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[196].y, _568);
    float _578 = fma(_562, _556, _570);
    float _580 = float(_574);
    float _582 = fma(_572, _556, _576);
    float _584 = float(_552);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _586;
    float _590 = _582 * 0.15915493667125701904296875;
    float _592 = _580 * _584;
    bool _594 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _596 = isnan(_330);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _606;
    bool _610 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _612 = isnan(_330);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _592 * (-2.0);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _624;
    float _628 = fma(_588, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _630 = _578 * 0.15915493667125701904296875;
    float _632 = in.m_67.x;
    float _634 = in.m_67.y;
    float _636 = in.m_67.z;
    float _638 = -_620;
    float _640 = _638 + 1.0;
    float _642 = fma(_622, _494, _494);
    float _644 = fma(_608, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _646 = fma(_626, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _648 = _604 * _640;
    float _650 = in.m_73.x;
    float _652 = in.m_73.y;
    float _654 = in.m_73.z;
    float _656 = fma(_396, _622, _396);
    float _658 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[196].z, _642);
    float _660 = -_604;
    float _662 = _660 + 1.0;
    float _664 = _644 * _648;
    float _666 = _628 * _648;
    float _668 = fma(_656, _556, _658);
    float _670 = _646 * _648;
    float _672 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].x, _664);
    float _674 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].z, _666);
    float _676 = _668 * 0.15915493667125701904296875;
    float _678 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].y, _670);
    float _680 = _630 * 6.283185482025146484375;
    float _682 = cos(_680);
    float _684 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[144].x, _672);
    float _686 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[144].z, _674);
    float _688 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[144].y, _678);
    float _690 = _684 * _632;
    float _692 = _688 * _634;
    float _694 = _590 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _686 * _636;
    float _700 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _702 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _652);
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _650);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _654);
    float _710 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = _590 * 6.283185482025146484375;
    float _714 = cos(_712);
    float _716 = _704 * _702;
    float _718 = _706 * _700;
    float _720 = _708 * _710;
    float _722 = _630 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = _682 * _696;
    float _728 = _676 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = _682 * _714;
    float _734 = _676 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = _724 * _696;
    float _740 = _724 * _714;
    float _742 = _682 * _730;
    float _744 = _714 * _730;
    float _746 = _724 * _730;
    float _748 = _696 * _730;
    float _750 = _742 * _716;
    float _752 = _746 * _716;
    float _754 = fma(_736, _732, _738);
    float _756 = fma(_736, _738, _732);
    float _758 = -_716;
    float _760 = _736 * _758;
    float _762 = -_726;
    float _764 = fma(_736, _740, _762);
    float _766 = -_740;
    float _768 = fma(_736, _726, _766);
    float _770 = fma(_754, _718, _750);
    float _772 = fma(_744, _718, _760);
    float _774 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _778 = fma(_768, _720, _770);
    float _780 = fma(_764, _718, _752);
    float _782 = fma(_748, _720, _772);
    float _784 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _786 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _776);
    float _788 = _778 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _790 = _778 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _792 = fma(_756, _720, _780);
    float _794 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _784);
    float _796 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _786);
    float _798 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _788);
    float _800 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].x, _790);
    float _802 = _794 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _804 = _796 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _806 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[8].z, _798);
    float _808 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[10].z, _800);
    float _810 = _802 + _806;
    float _812 = _804 + _808;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _816 = _810 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _820 = _812 + _818;
    float _822 = _816 * _816;
    float _824 = _820 * _820;
    float _826 = _822 + _824;
    float _828 = sqrt(_826);
    bool _830 = _828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _834 = _828 + _832;
    float _836 = 0.0;
    float _838 = _810;
    float _840 = _812;
    float _842 = _822;
    float _844 = _824;
    if (_830)
    {
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _836 = _846;
    }
    float _848 = _836;
    float _850 = _848;
    if (_830)
    {
        float _852 = _834 * _848;
        _850 = _852;
    }
    float _854 = _850;
    float _856 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _858 = _778 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _860 = _854;
    if (_830)
    {
        float _862 = _854 * 0.15915493667125701904296875;
        _860 = _862;
    }
    float _864 = _860;
    float _866 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _856);
    float _868 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].x, _858);
    float _870 = _856;
    float _872 = _868;
    if (_830)
    {
        float _874 = _864 * 6.283185482025146484375;
        float _876 = sin(_874);
        _870 = _876;
    }
    float _878 = _870;
    float _880 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _866);
    float _882 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[9].z, _868);
    float _884 = _880 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _886 = _300;
    if (_830)
    {
        float _888 = rsqrt(_826);
        _886 = _888;
    }
    float _890 = _886;
    float _892 = _884 + _882;
    float _894 = _892;
    if (_830)
    {
        float _896 = _892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _872 = _896;
    }
    float _898 = _872;
    float _900 = _898;
    if (_830)
    {
        float _902 = fma(_878, _898, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _900 = _902;
    }
    float _904 = _900;
    float _906 = _904;
    if (_830)
    {
        float _908 = _890 * _904;
        _906 = _908;
    }
    float _910 = _906;
    if (_830)
    {
        float _912 = fma(_816, _910, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _838 = _912;
    }
    float _914 = _838;
    if (_830)
    {
        float _916 = fma(_820, _910, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _840 = _916;
    }
    float _918 = _840;
    float _920 = fma(_914, 6.2500002968590706586837768554688e-05, 0.5);
    float _922 = fma(_918, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4042 = float2(_920, _922);
    float3 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4042, float2(0.0), isnan(_4042)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4042, float2(0.0), isnan(_4042)), level(0.0)).xyz;
    float _928 = _926.x;
    float _930 = _926.y;
    float _932 = _926.z;
    float _934 = in.m_75.y;
    bool _936 = _652 != 0.0;
    bool _938 = isnan(_652);
    bool _940 = _936 || _938;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    float _946 = _864;
    if (_830)
    {
        float _948 = _864 * 6.283185482025146484375;
        float _950 = cos(_948);
        _946 = _950;
    }
    float _952 = _946;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _956 = _954 != 0;
    float _958 = in.m_69.w;
    bool _960 = _650 == 0.0;
    bool _962 = !_944;
    bool _964 = _960 && _962;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _968 = _966 != 0;
    float _970 = in.m_77.x;
    float _972 = in.m_77.y;
    float _974 = in.m_77.z;
    bool _976 = _654 == 0.0;
    bool _978 = _976 && _964;
    float _980 = in.m_75.x;
    float _982 = _782;
    float _984 = 1.0;
    float _986 = 1.0;
    if (_956)
    {
        float _988 = in.m_69.z;
        _982 = _988;
    }
    float _990 = _982;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _996 = -_934;
    float _998 = _996 + 1.0;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1004 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1006 = _958 > 0.5;
    float _1008 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _934;
    if (_968)
    {
        float _1014 = _1006 ? _998 : _934;
        _1012 = _1014;
    }
    float _1016 = _1012;
    float _1018 = 0.0;
    float _1020 = _970;
    float _1022 = _972;
    if (_978)
    {
        _1018 = _970;
    }
    float _1024 = _1018;
    out.m_81.x = _1004;
    out.m_81.y = _1008;
    out.m_81.z = _1010;
    out.m_81.w = _1002;
    float _1026 = _1024;
    if (!_956)
    {
        _984 = _980;
    }
    float _1028 = _984;
    float _1030 = 0.0;
    float _1032 = _1028;
    if (_978)
    {
        _1030 = _1024;
    }
    float _1034 = _1030;
    bool _1036 = _990 > 0.5;
    bool _1038 = _1036 && _956;
    float _1040 = in.m_83.x;
    float _1042 = in.m_83.y;
    float _1044 = in.m_83.z;
    float _1046 = in.m_83.w;
    float _1048 = _1034;
    if (!_978)
    {
        _1026 = _970;
    }
    float _1050 = _1026;
    if (_978)
    {
        _1020 = _972;
    }
    float _1052 = _1020;
    float _1054 = _1052;
    if (_978)
    {
        _986 = _974;
    }
    float _1056 = _986;
    float _1058 = _1056;
    if (!_978)
    {
        float _1060 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _974);
        _1058 = _1060;
    }
    float _1062 = _1058;
    float _1064 = 0.0;
    if (_978)
    {
        _1064 = _1052;
    }
    float _1066 = _1064;
    float _1068 = _1066;
    if (!_978)
    {
        float _1070 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1050);
        _1048 = _1070;
    }
    float _1072 = _1048;
    if (!_978)
    {
        _1054 = _972;
    }
    float _1074 = _1054;
    if (_956)
    {
        _1022 = _980;
    }
    float _1076 = _1022;
    float _1078 = _1076;
    if (!_978)
    {
        float _1080 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1074);
        _1068 = _1080;
    }
    float _1082 = _1068;
    if (_1038)
    {
        float _1084 = -_1076;
        float _1086 = _1084 + 1.0;
        _1078 = _1086;
    }
    float _1088 = _1078;
    float _1090 = -_1082;
    float _1092 = _736 * _1090;
    float _1094 = _746 * _1082;
    if (_956)
    {
        _1032 = _1088;
    }
    float _1096 = _1032;
    float _1098 = fma(_744, _1072, _1092);
    float _1100 = fma(_764, _1072, _1094);
    float _1102 = _1044 * _1050;
    float _1104 = _1042 * _974;
    float _1106 = _1040 * _1074;
    float _1108 = fma(_748, _1062, _1098);
    float _1110 = -_1102;
    float _1112 = fma(_1040, _974, _1110);
    float _1114 = -_1104;
    float _1116 = fma(_1044, _1074, _1114);
    float _1118 = -_1106;
    float _1120 = fma(_1042, _1050, _1118);
    float _1122 = -_1042;
    float _1124 = _736 * _1122;
    float _1126 = _1112 * _1046;
    float _1128 = _742 * _1082;
    float _1130 = _1116 * _1046;
    float _1132 = _1120 * _1046;
    float _1134 = -_1126;
    float _1136 = _736 * _1134;
    float _1138 = _742 * _1042;
    float _1140 = _742 * _1126;
    float _1142 = _746 * _1042;
    float _1144 = _746 * _1126;
    float _1146 = fma(_754, _1072, _1128);
    float _1148 = fma(_744, _1130, _1136);
    float _1150 = fma(_754, _1130, _1140);
    float _1152 = fma(_744, _1040, _1124);
    float _1154 = fma(_754, _1040, _1138);
    float _1156 = fma(_764, _1040, _1142);
    float _1158 = fma(_764, _1130, _1144);
    float _1160 = fma(_768, _1062, _1146);
    float _1162 = fma(_748, _1044, _1152);
    float _1164 = fma(_768, _1044, _1154);
    float _1166 = fma(_756, _1044, _1156);
    float _1168 = fma(_748, _1132, _1148);
    float _1170 = fma(_768, _1132, _1150);
    float _1172 = fma(_756, _1132, _1158);
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1176 = _1132;
    float _1178 = _1174;
    if (_830)
    {
        float _1180 = _952 + (-1.0);
        _1176 = _1180;
    }
    float _1182 = _1176;
    float _1184 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1186 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1174);
    float _1190 = _1182;
    float _1192 = _1184;
    if (_830)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1194;
    }
    float _1196 = _1178;
    float _1198 = fma(_756, _1062, _1100);
    float _1200 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1184);
    float _1202 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1206 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_830)
    {
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1210 = _914 + _1208;
        _1190 = _1210;
    }
    float _1212 = _1190;
    if (_830)
    {
        float _1214 = fma(_892, _952, _1196);
        _894 = _1214;
    }
    float _1216 = _894;
    if (_830)
    {
        float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1220 = _918 + _1218;
        _1192 = _1220;
    }
    float _1222 = _1192;
    float _1224 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1206);
    if (_830)
    {
        float _1226 = _1212 * _1212;
        _842 = _1226;
    }
    float _1228 = _842;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1232 = _1216 + _1230;
    float _1234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1236 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_830)
    {
        float _1238 = _1222 * _1222;
        _844 = _1238;
    }
    float _1240 = _844;
    float _1242 = fma(_1232, _1232, _1228);
    float _1244 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1246 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1248 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1236);
    float _1250 = _1242 + _1240;
    float _1252 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1244);
    float _1254 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1256 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1258 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1260 = _1246 * _1204;
    float _1262 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1264 = sqrt(_1250);
    float _1266 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1254);
    float _1268 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1256);
    float _1270 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1258);
    float _1272 = _1262 * _1234;
    float _1274 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1224);
    float _1276 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1248);
    float _1278 = fma(_1172, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1266);
    float _1280 = fma(_1172, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1268);
    float _1282 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1188);
    float _1284 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1252);
    float _1286 = fma(_1172, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1270);
    float _1288 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1200);
    float _1290 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1202);
    out.m_85.z = _1260;
    out.m_85.w = _1272;
    bool _1292 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1294 = isnan(_1264);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1300 = _1296 || _1298;
    out.m_87.x = _1274;
    out.m_87.y = _1276;
    out.m_87.z = _1284;
    out.m_89.x = _1278;
    out.m_89.y = _1280;
    out.m_89.z = _1286;
    out.m_91.x = _1282;
    out.m_91.y = _1288;
    out.m_91.z = _1290;
    float _1302 = _1270;
    if (!_1300)
    {
        _1302 = 1.0;
    }
    float _1304 = _1302;
    out.m_93.x = _928;
    out.m_93.y = _930;
    out.m_93.z = _932;
    bool _1306 = !_1300;
    float _1308 = _1304;
    if (!_1306)
    {
        bool _1310 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1312 = isnan(_1264);
        bool _1314 = _1310 || _1312;
        bool _1316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1318 = _1314 || _1316;
        if (!_1318)
        {
            float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1322 = _1264 + _1320;
            float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1326 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1324;
            float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1330 = _1328 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1332 = 1.0 / _1326;
            float _1334 = _1322 * _1332;
            float _1336 = fma(_1334, _1330, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1308 = _1336;
            _1338 = true;
        }
        else
        {
            bool _1340 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1342 = isnan(_1264);
            bool _1344 = _1340 || _1342;
            bool _1346 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1348 = _1344 || _1346;
            if (!_1348)
            {
                float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1352 = _1264 + _1350;
                float _1354 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1356 = _1354 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1358 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1360 = _1358 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1362 = 1.0 / _1356;
                float _1364 = _1352 * _1362;
                float _1366 = fma(_1364, _1360, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1308 = _1366;
                _1338 = true;
            }
            else
            {
                _1308 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1338 = false;
    float _1368 = _1308;
    float _1370 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1372 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1374 = floor(_1370);
    float _1376 = floor(_1372);
    float _1378 = -_1374;
    float _1380 = _1370 + _1378;
    float _1382 = -_1376;
    float _1384 = _1372 + _1382;
    float2 _4860 = float2(_1380, _1384);
    float _1386 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4860, float2(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4860, float2(0.0), isnan(_4860)), level(0.0)).x;
    float _1388 = _884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1392 = _914 + _1390;
    float _1394 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1388);
    float _1396 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1398 = _1216 + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1402 = _918 + _1400;
    float _1404 = fma(_1392, _1368, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1406 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1394);
    float _1408 = _884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1410 = fma(_1398, _1368, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1412 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1414 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1408);
    float _1416 = fma(_1402, _1368, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1418 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1420 = 1.0 / _1412;
    float _1422 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1414);
    float _1424 = _884 + _1418;
    float _1426 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1428 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1430 = _1426 + _1412;
    float _1432 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1428);
    float _1434 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1432);
    float _1436 = _1430 * _1420;
    float _1438 = _1436 * 0.5;
    float _1440 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1444 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1442);
    float _1446 = 1.0 / _1444;
    bool _1448 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.5);
    bool _1456 = _1452 || _1454;
    float _1458 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1460 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1458);
    float _1462 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    int _1464 = 2;
    int _1466 = as_type<int>(_1402);
    if (_1456)
    {
        _1462 = _1416;
    }
    float _1468 = _1462;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1472 = _1446 * _1470;
    float _1474 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1460);
    bool _1476 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1478 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1480 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1482 = !_1476;
    int _1484 = _1482 ? 0 : 1;
    float _1486 = trunc(_1478);
    int _1488 = int(_1486);
    float _1490 = _1468;
    if (!_1476)
    {
        _1464 = 1;
    }
    int _1492 = _1464;
    int _1494 = _1492;
    if (!_1480)
    {
        _1494 = _1484;
    }
    int _1496 = _1494;
    float _1498 = trunc(_1440);
    int _1500 = int(_1498);
    int _1502 = _1496 << 6;
    int _1504 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1506 = _1488 + _1504;
    int _1508 = _1506 + 1;
    int _1510 = _1502 + 48;
    uint _1513 = uint(int(uint(_1510) >> uint(2)));
    uint _1515 = uint(int(uint(int(_1513)) >> uint(2)));
    int _1517 = int(_1513) & 3;
    float _1519 = (*spvDescriptorSet0.vp_c15)._m0[int(_1515)][_1517];
    int _1521 = int(_1513) + 1;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    int _1525 = _1521 & 3;
    float _1527 = (*spvDescriptorSet0.vp_c15)._m0[int(_1523)][_1525];
    int _1529 = _1502 + 56;
    uint _1531 = uint(int(uint(_1529) >> uint(2)));
    uint _1533 = uint(int(uint(int(_1531)) >> uint(2)));
    int _1535 = int(_1531) & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    int _1539 = int(_1531) + 1;
    uint _1541 = uint(int(uint(_1539) >> uint(2)));
    int _1543 = _1539 & 3;
    float _1545 = (*spvDescriptorSet0.vp_c15)._m0[int(_1541)][_1543];
    int _1547 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1549 = _1500 + _1547;
    int _1551 = _1549 + 1;
    float _1553 = as_type<float>(_1500);
    float _1555 = as_type<float>(_1551);
    if (_1456)
    {
        _1553 = _1410;
    }
    float _1557 = _1553;
    bool _1559 = _1551 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1561 = _1502 + 64;
    uint _1563 = uint(int(uint(_1561) >> uint(2)));
    uint _1565 = uint(int(uint(int(_1563)) >> uint(2)));
    int _1567 = int(_1563) & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = int(_1563) + 1;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    int _1575 = _1571 & 3;
    float _1577 = (*spvDescriptorSet0.vp_c15)._m0[int(_1573)][_1575];
    int _1579 = _1551 | _1508;
    bool _1581 = _1579 < 0;
    bool _1583 = _1581 || _1559;
    float _1585 = as_type<float>(_1579);
    float _1587 = _1557;
    if (_1456)
    {
        _1585 = _1404;
    }
    float _1589 = _1585;
    int _1591 = _1502 + 72;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
    int _1597 = int(_1593) & 3;
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
    int _1601 = int(_1593) + 1;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    int _1605 = _1601 & 3;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[int(_1603)][_1605];
    bool _1609 = _1508 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1611 = _1609 || _1583;
    int _1613 = _1502 + 96;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    uint _1617 = uint(int(uint(int(_1615)) >> uint(2)));
    int _1619 = int(_1615) & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    int _1623 = int(_1615) + 1;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    int _1627 = _1623 & 3;
    float _1629 = (*spvDescriptorSet0.vp_c15)._m0[int(_1625)][_1627];
    int _1631 = _1502 + 104;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    uint _1635 = uint(int(uint(int(_1633)) >> uint(2)));
    int _1637 = int(_1633) & 3;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
    int _1641 = int(_1633) + 1;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    int _1645 = _1641 & 3;
    float _1647 = (*spvDescriptorSet0.vp_c15)._m0[int(_1643)][_1645];
    float _1649 = _1589;
    int _1651 = as_type<int>(_1639);
    if (!_1456)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1655 = _884 + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1659 = _802 + _1657;
        float _1661 = -_884;
        float _1663 = _1661 + _1410;
        float _1665 = _1655 * _1655;
        float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1669 = _804 + _1667;
        float _1671 = fma(_1659, _1659, _1665);
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1675 = fma(_1669, _1669, _1671);
        float _1677 = sqrt(_1675);
        float _1679 = precise::min(_1677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1681 = _1679 * _1673;
        float _1683 = -_802;
        float _1685 = _1683 + _1404;
        float _1687 = -_804;
        float _1689 = _1687 + _1416;
        float _1691 = fma(_1663, _1681, _884);
        float _1693 = fma(_1685, _1681, _802);
        float _1695 = fma(_1689, _1681, _804);
        _1587 = _1691;
        _1649 = _1693;
        _1490 = _1695;
        _1466 = as_type<int>(_1677);
    }
    float _1697 = _1587;
    float _1699 = _1649;
    float _1701 = _1490;
    int _1703 = _1466;
    float _1705 = _1424 * _1629;
    float _1707 = _1424 * _1577;
    float _1709 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1711 = _1703;
    if (!_1611)
    {
        int _1713 = _1508 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1715 = _1713 + _1551;
        _1711 = _1715;
    }
    int _1717 = _1711;
    float _1719 = fma(_802, _1621, _1705);
    float _1721 = _1424 * _1527;
    float _1723 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1725 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1727 = fma(_804, _1639, _1719);
    float _1729 = fma(_802, _1519, _1721);
    float _1731 = fma(_802, _1569, _1707);
    float _1733 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1723);
    int _1735 = _1502 + 80;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    uint _1739 = uint(int(uint(int(_1737)) >> uint(2)));
    int _1741 = int(_1737) & 3;
    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[int(_1739)][_1741];
    int _1745 = int(_1737) + 1;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    int _1749 = _1745 & 3;
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
    int _1753 = as_type<int>(_1733);
    float _1755 = as_type<float>(_1717);
    if (!_1611)
    {
        int _1757 = _1717 << 2;
        _1651 = _1757;
    }
    int _1759 = _1651;
    float _1761 = _1727 + _1647;
    float _1763 = fma(_804, _1537, _1729);
    float _1765 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1767 = _1759;
    if (!_1611)
    {
        uint _1769 = uint(int(uint(_1717) >> uint(2)));
        _1753 = int(_1769);
    }
    int _1771 = _1753;
    float _1773 = 1.0 / _1761;
    if (!_1611)
    {
        int _1775 = 12 & _1759;
        _1767 = _1775;
    }
    int _1777 = _1767;
    int _1779 = _1502 + 88;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
    int _1785 = int(_1781) & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    int _1789 = int(_1781) + 1;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    int _1793 = _1789 & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    float _1797 = _1765 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1799 = fma(_804, _1599, _1731);
    if (!_1611)
    {
        int _1801 = _1771 << 4;
        int _1803 = _1801 + _1777;
        _1555 = as_type<float>(_1803);
    }
    float _1805 = _1555;
    float _1807 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1809 = -_1797;
    float _1811 = fma(_1809, _1725, 1.0);
    float _1813 = _1763 + _1545;
    float _1815 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1817 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1819 = _1805;
    if (!_1611)
    {
        int _1821 = as_type<int>(_1805) + 400;
        uint _1823 = uint(int(uint(_1821) >> uint(2)));
        uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
        int _1827 = int(_1823) & 3;
        float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
        _1819 = _1829;
    }
    float _1831 = _1819;
    float _1833 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1807);
    float _1835 = _1799 + _1607;
    float _1837 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1815);
    float _1839 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1817);
    float _1841 = _1813 * _1773;
    float _1843 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1833);
    float _1845 = _1835 * _1773;
    float _1847 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1839);
    float _1849 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1837);
    float _1851 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1853 = _1841 >= 0.0;
    float _1855 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1861 = _1841 <= 1.0;
    bool _1863 = _1861 && _1853;
    float _1865 = log2(_1811);
    float _1867 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1869 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    bool _1871 = _1845 >= 0.0;
    bool _1873 = _1871 && _1863;
    float _1875 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1867);
    float _1877 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1869);
    bool _1879 = _1845 <= 1.0;
    bool _1881 = _1879 && _1873;
    float _1883 = _1725;
    if (!_1611)
    {
        float _1885 = floor(_1440);
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1891 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1877);
    float _1893 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1889);
    float _1895 = _1424 * _1751;
    float _1897 = as_type<float>(_1508);
    float _1899 = _1751;
    if (!_1611)
    {
        float _1901 = floor(_1478);
        _1897 = _1901;
    }
    float _1903 = _1897;
    float _1905 = _1865 * 0.693147182464599609375;
    float _1907 = fma(_802, _1743, _1895);
    float _1909 = _1905;
    float _1911 = _1907;
    if (_1881)
    {
        float _1913 = float(_1496);
        _1899 = _1913;
    }
    float _1915 = _1899;
    float _1917 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1875);
    float _1919 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1893);
    float _1921 = fma(_804, _1787, _1907);
    float _1923 = 1.0 / _1891;
    float _1925 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1917);
    float _1927 = _1921 + _1795;
    float _1929 = _1927 * _1773;
    float _1931 = _1895;
    float _1933 = _1925;
    if (_1881)
    {
        float _1935 = rint(_1915);
        float _1937 = precise::max(_1935, 0.0);
        uint _1939 = uint(_1937);
        uint _1941 = clamp(_1939, 0u, 65535u);
        _1931 = as_type<float>(_1941);
    }
    float _1943 = _1931;
    float _1945 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    if (!_1611)
    {
        float _1947 = -_1887;
        float _1949 = _1440 + _1947;
        _1909 = _1949;
    }
    float _1951 = _1909;
    float _1953 = _1903;
    if (!_1611)
    {
        float _1955 = -_1903;
        float _1957 = _1478 + _1955;
        _1953 = _1957;
    }
    float _1959 = _1953;
    float _1961 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1919);
    float _1963 = _1887;
    if (!_1611)
    {
        float _1965 = rint(_1831);
        float _1967 = precise::max(_1965, 0.0);
        uint _1969 = uint(_1967);
        uint _1971 = clamp(_1969, 0u, 65535u);
        _1963 = as_type<float>(_1971);
    }
    float _1973 = _1963;
    float _1975 = _1961 * _1923;
    float _1977 = _1925 * _1923;
    float _1979 = fma(_1975, 0.5, 0.5);
    float _1981 = fma(_1977, -0.5, 0.5);
    float _1983 = _1845;
    float _1985 = _1977;
    float _1987 = _1981;
    if (_1881)
    {
        float3 _5883 = float3(_1841, _1845, float(as_type<int>(_1943)));
        float3 _5887 = select(_5883, float3(0.0), isnan(_5883));
        float _1989 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5887.xy, uint(rint(_5887.z)), _1929, level(0.0));
        _1983 = _1989;
    }
    float _1991 = _1983;
    float3 _5897 = float3(_1979, _1981, _1945);
    float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5897, float3(0.0), isnan(_5897)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5897, float3(0.0), isnan(_5897)), level(0.0)).x;
    float3 _5906 = float3(_1979, _1981, _1945);
    float4 _1996 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5906, float3(0.0), isnan(_5906)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5906, float3(0.0), isnan(_5906)), level(0.0)).xyzw;
    float _1998 = _1996.x;
    float _2000 = _1996.y;
    float _2002 = _1996.z;
    float _2004 = _1996.w;
    float _2006 = _1951;
    if (!_1611)
    {
        float3 _5929 = float3(_1951, _1959, float(as_type<int>(_1973)));
        float3 _5931 = select(_5929, float3(0.0), isnan(_5929));
        float _2008 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5931.xy, uint(rint(_5931.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5931.xy, uint(rint(_5931.z)), level(0.0)).x;
        _2006 = _2008;
    }
    float _2010 = _2006;
    if (_1611)
    {
        _1985 = 1.0;
    }
    float _2012 = _1985;
    float _2014 = _2012;
    if (!_1611)
    {
        int _2016 = _1717 << 4;
        int _2018 = _2016 + 2048;
        uint _2020 = uint(int(uint(_2018) >> uint(2)));
        uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
        int _2024 = int(_2020) & 3;
        float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
        int _2028 = int(_2020) + 1;
        uint _2030 = uint(int(uint(_2028) >> uint(2)));
        int _2032 = _2028 & 3;
        float _2034 = (*spvDescriptorSet0.vp_c15)._m0[int(_2030)][_2032];
        int _2036 = _2018 + 8;
        uint _2038 = uint(int(uint(_2036) >> uint(2)));
        uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
        int _2042 = int(_2038) & 3;
        float _2044 = (*spvDescriptorSet0.vp_c15)._m0[int(_2040)][_2042];
        int _2046 = int(_2038) + 1;
        uint _2048 = uint(int(uint(_2046) >> uint(2)));
        int _2050 = _2046 & 3;
        float _2052 = (*spvDescriptorSet0.vp_c15)._m0[int(_2048)][_2050];
        float _2054 = _1424 * _2034;
        float _2056 = fma(_802, _2026, _2054);
        float _2058 = fma(_804, _2044, _2056);
        float _2060 = _2058 + _2052;
        float _2062 = precise::clamp(_2060, 0.0, 1.0);
        float _2064 = -_2062;
        float _2066 = _2064 + _2010;
        float _2068 = fma(_2066, 500.0, 1.5);
        float _2070 = exp2(_2068);
        float _2072 = 0.0 + _2070;
        float _2074 = precise::clamp(_2072, 0.0, 1.0);
        _1755 = as_type<float>(_2018);
        _2014 = _2074;
    }
    float _2076 = _1755;
    float _2078 = _2014;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _1697 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _1699 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _1701 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2102 = _2086 * _2100;
    float _2104 = _2090 * _2100;
    float _2106 = _2102 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 + _2108;
    float _2112 = sqrt(_2110);
    bool _2114 = _2112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = _2112 + _2116;
    float _2120 = _2090;
    float _2122 = _2076;
    float _2124 = _2118;
    float _2126 = _2082;
    if (_2114)
    {
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2128;
    }
    float _2130 = _2120;
    if (_2114)
    {
        float _2132 = rsqrt(_2110);
        _2122 = _2132;
    }
    float _2134 = _2122;
    float _2136 = _2134;
    if (_2114)
    {
        float _2138 = _2118 * _2130;
        _2124 = _2138;
    }
    float _2140 = _2124;
    if (_2114)
    {
        float _2142 = _2140 * 0.15915493667125701904296875;
        _1911 = _2142;
    }
    float _2144 = _1911;
    float _2146 = _2098;
    float _2148 = _2144;
    if (_2114)
    {
        float _2150 = _2144 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        _2146 = _2152;
    }
    float _2154 = _2146;
    float _2156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2158 = precise::max(0.0, _2156);
    float _2160 = _2094;
    float _2162 = _2158;
    float _2164 = _2156;
    if (_2114)
    {
        float _2166 = _2144 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2160 = _2168;
    }
    float _2170 = _2160;
    float _2172 = -_2100;
    float _2174 = -_2158;
    float _2176 = fma(_2082, _2172, _2174);
    if (!_2114)
    {
        _2162 = _2104;
    }
    float _2178 = _2162;
    float _2180 = _2178;
    if (_2114)
    {
        float _2182 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2164 = _2182;
    }
    float _2184 = _2164;
    float _2186 = _2154;
    float _2188 = _2184;
    if (_2114)
    {
        float _2190 = fma(_2154, _2184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2126 = _2190;
    }
    float _2192 = _2126;
    float _2194 = _2192;
    if (!_2114)
    {
        _2186 = _2102;
    }
    float _2196 = _2186;
    float _2198 = _2196;
    float _2200 = _2170;
    if (_2114)
    {
        float _2202 = _2170 + (-1.0);
        _2188 = _2202;
    }
    float _2204 = _2188;
    if (_2114)
    {
        float _2206 = _2134 * _2192;
        _1987 = _2206;
    }
    float _2208 = _1987;
    if (!_2114)
    {
        _2194 = _2176;
    }
    float _2210 = _2194;
    float _2212 = _2210;
    if (_2114)
    {
        float _2214 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2148 = _2214;
    }
    float _2216 = _2148;
    if (_2114)
    {
        float _2218 = _2102 * _2208;
        _2198 = _2218;
    }
    float _2220 = _2198;
    if (!_2114)
    {
        _2136 = _2106;
    }
    float _2222 = _2136;
    float _2224 = _2222;
    if (_2114)
    {
        float _2226 = _2104 * _2208;
        _2180 = _2226;
    }
    float _2228 = _2180;
    if (_2114)
    {
        float _2230 = fma(_2176, _2170, _2216);
        _2212 = _2230;
    }
    float _2232 = _2212;
    if (_2114)
    {
        float _2234 = _2220 * _2220;
        _2224 = _2234;
    }
    float _2236 = _2224;
    if (!_2114)
    {
        _2200 = _2108;
    }
    float _2238 = _2200;
    float _2240 = _2238;
    if (_2114)
    {
        float _2242 = _2228 * _2228;
        _2240 = _2242;
    }
    float _2244 = _2240;
    float _2246 = sqrt(_2096);
    float _2248 = fma(_2232, _2232, _2236);
    float _2250 = _2248 + _2244;
    float _2252 = rsqrt(_2250);
    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2256 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2254);
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    float _2260 = -_2258;
    float _2262 = _2260 + 1.0;
    float _2264 = _2252 * _2220;
    float _2266 = _2252 * _2232;
    float _2268 = _2252 * _2228;
    float _2270 = abs(_2262);
    float _2272 = log2(_2270);
    float _2274 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2276 = -_2274;
    float _2278 = fma(_2266, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2276);
    float _2280 = -_2268;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2278);
    float _2284 = fma(_2282, -0.5, 0.5);
    float _2286 = fma(_2282, 0.5, 0.5);
    float _2288 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2290 = fma(_2286, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2292 = sqrt(_2284);
    float _2294 = fma(_2286, _2290, -0.212114393711090087890625);
    float _2296 = _2266 + 1.0;
    float _2298 = fma(_2286, _2294, 1.570728778839111328125);
    float _2300 = exp2(_2288);
    float _2302 = _2292 * 0.636619746685028076171875;
    float _2304 = -_2266;
    float _2306 = fma(_2300, _2296, _2304);
    float _2308 = -_2298;
    float _2310 = fma(_2302, _2308, 1.0);
    float _2312 = fma(_2306, 0.5, 0.5);
    float2 _6406 = float2(_2310, _2312);
    float3 _2314 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6406, float2(0.0), isnan(_6406)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6406, float2(0.0), isnan(_6406)), level(0.0)).xyz;
    float _2316 = _2314.x;
    float _2318 = _2314.y;
    float _2320 = _2314.z;
    float _2322 = abs(_1472);
    float _2324 = log2(_2322);
    float _2326 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2328 = -_1386;
    float _2330 = _2328 + 1.0;
    float _2332 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2326);
    out.m_95.x = _1699;
    out.m_95.y = _1697;
    out.m_95.z = _1701;
    bool _2334 = _1472 <= 8000.0;
    bool _2336 = isnan(_1472);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan(8000.0);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2348 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2332);
    float _2350 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2352 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2348);
    float _2354 = exp2(_2346);
    float _2356 = exp2(_2350);
    float _2358 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2360 = precise::clamp(_2358, 0.0, 1.0);
    float _2362 = fma(_2360, -2.0, 3.0);
    float _2364 = _2360 * _2360;
    float _2366 = -_2356;
    float _2368 = _2366 + 1.0;
    float _2370 = _2364 * _2362;
    float _2372 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2374 = -_2370;
    float _2376 = _2374 + 1.0;
    float _2378 = _2372 * _1993;
    float _2380 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2370);
    float _2382 = _2352 + _1891;
    float _2384 = -_2372;
    float _2386 = _2384 + 1.0;
    float _2388 = _2344 * _2380;
    float _2390 = _2382 * 0.5;
    float _2392 = _2382;
    float _2394 = _2352;
    float _2396 = _1961;
    if (!_1881)
    {
        _2392 = 1.0;
    }
    float _2398 = _2392;
    out.gl_Position.x = _1961;
    out.gl_Position.y = _1925;
    out.gl_Position.z = _2352;
    out.gl_Position.w = _1891;
    float _2400 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2402 = _2398;
    if (_1881)
    {
        bool _2404 = _1991 >= _1929;
        bool _2406 = isnan(_1991);
        bool _2408 = _2404 || _2406;
        bool _2410 = isnan(_1929);
        bool _2412 = _2408 || _2410;
        float _2414 = float(_2412);
        _2402 = _2414;
    }
    float _2416 = _2402;
    float _2418 = _2004 * _2378;
    out.m_97.z = _2390;
    out.m_97.w = _1891;
    float _2420 = _2330 * _2400;
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    bool _2424 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2426 = isnan(_2246);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2432 = _2428 || _2430;
    float _2434 = _2416 * _2078;
    float _2436 = -_2422;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2440 = -_2434;
    float _2442 = fma(_2440, _2438, 1.0);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    float _2446 = _2444 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2448 = _2434;
    float _2450 = _2444;
    float _2452 = _2422;
    if (!_2432)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2454 = _2394;
    float _2456 = _2454;
    float _2458 = _2454;
    if (!_2432)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2460 = _1933;
    out.m_99.x = _2446;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2432)
    {
        _2396 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2466 = _2396;
    float _2468 = _2466;
    float _2470 = _2466;
    if (!_2432)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2472 = _2448;
    float _2474 = _2472;
    float _2476 = _2472;
    if (!_2432)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2478 = _2450;
    float _2480 = _2478;
    float _2482 = _2478;
    if (!_2432)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2484 = _2452;
    float _2486 = _2320 * _2378;
    float _2488 = fma(_2316, _2418, _1998);
    float _2490 = fma(_2318, _2418, _2000);
    float _2492 = _2004 * _2386;
    float _2494 = fma(_2004, _2486, _2002);
    out.m_101.x = _2488;
    out.m_101.y = _2490;
    out.m_101.z = _2494;
    out.m_101.w = _2492;
    bool _2496 = !_2432;
    float _2498 = _2484;
    float _2500 = _2484;
    if (!_2496)
    {
        bool _2502 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2504 = isnan(_2246);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2510 = _2506 || _2508;
        if (!_2510)
        {
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2514 = _2246 + _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2518 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2516;
            float _2520 = 1.0 / _2518;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2542 = _2514 * _2520;
            float _2544 = precise::clamp(_2542, 0.0, 1.0);
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2550 = fma(_2544, _2524, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2552 = fma(_2544, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2554 = fma(_2544, _2528, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2556 = fma(_2544, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2558 = fma(_2544, _2536, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2560 = fma(_2544, _2540, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2464 = _2552;
            _2482 = _2558;
            _2458 = _2550;
            _2476 = _2556;
            _2470 = _2554;
            _2500 = _2560;
            _2562 = true;
        }
        else
        {
            bool _2564 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2566 = isnan(_2246);
            bool _2568 = _2564 || _2566;
            bool _2570 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2572 = _2568 || _2570;
            if (!_2572)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2574 = _2456;
            _2458 = _2574;
            if (!_2572)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2576 = _2462;
            _2464 = _2576;
            if (!_2572)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2578 = _2468;
            _2470 = _2578;
            if (!_2572)
            {
                _2474 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2580 = _2474;
            _2476 = _2580;
            if (!_2572)
            {
                _2480 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2582 = _2480;
            _2482 = _2582;
            if (!_2572)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2584 = _2498;
            bool _2586 = !_2572;
            _2500 = _2584;
            if (!_2586)
            {
                bool _2588 = _2246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2590 = isnan(_2246);
                bool _2592 = _2588 || _2590;
                bool _2594 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2596 = _2592 || _2594;
                if (!_2596)
                {
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2600 = _2246 + _2598;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2604 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2602;
                    float _2606 = 1.0 / _2604;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2622 = _2620 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2628 = _2600 * _2606;
                    float _2630 = precise::clamp(_2628, 0.0, 1.0);
                    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2636 = fma(_2630, _2610, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2638 = fma(_2630, _2634, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2640 = fma(_2630, _2614, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2642 = fma(_2630, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2644 = fma(_2630, _2622, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2646 = fma(_2630, _2626, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2464 = _2638;
                    _2482 = _2644;
                    _2458 = _2636;
                    _2476 = _2642;
                    _2470 = _2640;
                    _2500 = _2646;
                    _2562 = true;
                }
                else
                {
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2482 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2476 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2562 = false;
    float _2648 = _2464;
    float _2650 = _2482;
    float _2652 = _2458;
    float _2654 = _2476;
    float _2656 = _2470;
    float _2658 = _2500;
    float _2660 = fma(_1288, -0.5, 0.5);
    float _2662 = precise::clamp(_2660, 0.0, 1.0);
    float _2664 = -_2648;
    float _2666 = _2664 + _2650;
    float _2668 = -_2652;
    float _2670 = _2668 + _2654;
    float _2672 = -_2656;
    float _2674 = _2672 + _2658;
    bool _2676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2678 = fma(_2662, _2666, _2648);
    float _2680 = fma(_2662, _2670, _2652);
    float _2682 = fma(_2662, _2674, _2656);
    float _2684 = _2678 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2686 = fma(_2680, 0.298911988735198974609375, _2684);
    float _2688 = fma(_2682, 0.114477999508380889892578125, _2686);
    out.m_103.x = 0.0;
    float _2690 = -_2688;
    float _2692 = _2680 + _2690;
    float _2694 = -_2688;
    float _2696 = _2678 + _2694;
    float _2698 = -_2688;
    float _2700 = _2682 + _2698;
    float _2702 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2706 = fma(_2696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2708 = fma(_2700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    out.m_99.w = _2702;
    out.m_105.x = _2704;
    out.m_105.y = _2706;
    out.m_105.z = _2708;
    if (!_2676)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2710 = -_1697;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2714 = -_1699;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2718 = -_1701;
    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2722 = _2712 * _2712;
    float _2724 = fma(_2716, _2716, _2722);
    float _2726 = fma(_2720, _2720, _2724);
    float _2728 = sqrt(_2726);
    float _2730 = rsqrt(_2726);
    float _2732 = -_2728;
    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2736 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2738 = precise::clamp(_2736, 0.0, 1.0);
    float _2740 = _2716 * _2730;
    float _2742 = _2712 * _2730;
    float _2744 = abs(_2738);
    float _2746 = log2(_2744);
    float _2748 = _2720 * _2730;
    float _2750 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2752 = _1288 * _2742;
    float _2754 = -_2742;
    float _2756 = -_2750;
    float _2758 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2756);
    float _2760 = fma(_1282, _2740, _2752);
    float _2762 = -_2748;
    float _2764 = fma(_2762, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2758);
    float _2766 = fma(_1290, _2748, _2760);
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2772 = _2764 + _2770;
    float _2774 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2776 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2778 = precise::clamp(_2776, 0.0, 1.0);
    float _2780 = exp2(_2774);
    float _2782 = _2780 * _2778;
    float _2784 = _2768 * _2782;
    float _2786 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2788 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2790 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2786;
    out.m_103.y = _2788;
    out.m_103.z = _2790;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

