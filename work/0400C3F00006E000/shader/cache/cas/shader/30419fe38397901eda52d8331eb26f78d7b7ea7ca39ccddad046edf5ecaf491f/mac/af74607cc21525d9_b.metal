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
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_85 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_95 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_101 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
    float4 m_83 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2582 = false;
    bool _1450 = false;
    bool _378 = false;
    bool _200 = false;
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
        float _2867 = as_type<float>(_138);
        out.gl_Position.z = _2867;
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
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2936 = as_type<float>(_176);
        out.gl_Position.z = _2936;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_65.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_122);
        float _204 = 1.0 / _202;
        float _206 = _156 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _208 + _210;
    bool _214 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _216 = isnan(_208);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _208 + _226;
    bool _230 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_208);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_208);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_224;
    float _264 = _262 + 1.0;
    float _266 = 1.0 / _248;
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = 1.0 / _244;
    float _282 = _240 * _272;
    float _284 = -_240;
    float _286 = _284 + 1.0;
    float _288 = _228 * _266;
    float _290 = _212 * _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _296;
    float _300 = fma(_276, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_294, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = fma(_298, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = _300 * _282;
    float _308 = _302 * _282;
    float _310 = _304 * _282;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _306);
    float _326 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _308);
    float _328 = fma(_314, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _330 = fma(_318, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _332 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _334 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _310);
    float _336 = fma(_328, _268, _324);
    float _338 = fma(_330, _268, _326);
    float _340 = fma(_332, _268, _334);
    float _342 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].x, _336);
    float _344 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].y, _338);
    float _346 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].z, _340);
    bool _348 = !_278;
    int _350 = as_type<int>(_340);
    int _352 = as_type<int>(_336);
    float _354 = _290;
    bool _356 = _278;
    float _374;
    float _376;
    if (!_348)
    {
        float _358 = in.m_65.x;
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _358 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _366;
        _376 = _372;
        _378 = true;
    }
    else
    {
        float _380 = float(_122);
        float _382 = 1.0 / _380;
        float _384 = _156 * _382;
        _374 = _382;
        _376 = _384;
    }
    _378 = false;
    float _386 = _374;
    float _388 = _376;
    float _390 = in.m_67.x;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _394 = _392 != 0;
    float _396 = in.m_65.x;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _400 = _398 != 0;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _404 = _402 != 0;
    float _406 = in.m_67.y;
    float _408 = in.m_65.z;
    float _410 = in.m_65.w;
    float _412 = _386;
    float _414 = _406;
    if (_394)
    {
        float _416 = in.m_65.z;
        _412 = _416;
    }
    float _418 = _412;
    float _420 = in.m_65.y;
    float _422 = _390;
    if (_394)
    {
        float _424 = -_390;
        float _426 = _424 + 1.0;
        _350 = as_type<int>(_426);
    }
    int _428 = _350;
    if (_400)
    {
        float _430 = -_390;
        float _432 = _430 + 1.0;
        _352 = as_type<int>(_432);
    }
    int _434 = _352;
    if (!_394)
    {
        _354 = _390;
    }
    float _436 = _354;
    float _438 = in.m_69.z;
    float _440 = _436;
    if (_400)
    {
        bool _442 = _396 > 0.5;
        _356 = _442;
    }
    bool _444 = _356;
    float _446 = 0.0;
    if (!_400)
    {
        _446 = _390;
    }
    float _448 = _446;
    float _450 = in.m_69.y;
    float _452 = _448;
    if (_400)
    {
        float _454 = _444 ? as_type<float>(_434) : _390;
        _452 = _454;
    }
    float _456 = _452;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _460 = _458 != 0;
    float _462 = in.m_69.x;
    bool _464 = _408 > 0.5;
    bool _466 = _410 > 0.5;
    float _468 = in.m_58.x;
    float _470 = in.m_58.y;
    float _472 = in.m_58.z;
    bool _474 = false;
    if (_394)
    {
        bool _476 = _418 > 0.5;
        _474 = _476;
    }
    bool _478 = _474;
    float _480 = in.m_71.x;
    float _482 = in.m_71.y;
    float _484 = in.m_71.z;
    if (_394)
    {
        float _486 = _478 ? as_type<float>(_428) : _390;
        _440 = _486;
    }
    float _488 = _440;
    float _490 = -_406;
    float _492 = _490 + 1.0;
    bool _494 = _420 > 0.5;
    float _496 = in.m_69.w;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _500 = _498 != 0;
    float _502 = _420 * 2.0;
    int _504 = _464 ? as_type<int>(_492) : as_type<int>(_406);
    out.m_73.z = _438;
    int _506 = _494 ? as_type<int>(_492) : as_type<int>(_406);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _510 = _508 != 0;
    out.m_73.y = _450;
    float _512 = _500 ? as_type<float>(_504) : _406;
    float _514 = floor(_502);
    float _516 = _404 ? as_type<float>(_506) : _406;
    float _518 = _408 * 2.0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _530 = _528 != 0;
    out.m_73.x = _462;
    float _532 = _470 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_460)
    {
        float _534 = _466 ? _492 : _406;
        _414 = _534;
    }
    float _536 = _414;
    float _538 = floor(_518);
    float _540 = _470 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _542 = _346 * _484;
    float _544 = _344 * _482;
    float _546 = _342 * _480;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _556 = _470 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _560 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].x, _532);
    float _562 = 1.0 / _554;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _568 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _570 = _538 > 0.0;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
    float _578 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].x, _540);
    float _580 = _420 + _408;
    float _582 = _396 * 2.0;
    out.m_75.x = _568;
    out.m_75.y = _572;
    out.m_75.z = _574;
    bool _584 = _538 >= 0.0;
    bool _586 = isnan(_538);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = _580 + (-1.0);
    int _596 = as_type<int>(_538);
    if (_510)
    {
        float _598 = -_390;
        float _600 = _598 + 1.0;
        _596 = as_type<int>(_600);
    }
    int _602 = _596;
    out.m_73.w = _496;
    float _604 = _550 * _562;
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _608 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = in.m_77.x;
    float _612 = in.m_77.y;
    float _614 = in.m_77.z;
    if (_510)
    {
        float _616 = _494 ? as_type<float>(_602) : _390;
        _422 = _616;
    }
    float _618 = _422;
    float _620 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _622 = _514 >= 0.0;
    bool _624 = isnan(_514);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = _396 + _420;
    float _634 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _636 = log2(_634);
    float _638 = _396 + _408;
    float _640 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _642 = _632 + (-1.0);
    float _644 = _396 + (-0.5);
    float _646 = _638 + (-1.0);
    float _648 = _420 + (-0.5);
    float _650 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _652 = floor(_582);
    int _654 = _592 ? 0 : 1;
    float _656 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _658 = _408 + (-0.5);
    int _660 = ~_654;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    int _666 = _664;
    float _668 = _658;
    if (!_570)
    {
        int _670 = ~_654;
        int _672 = _670 + 1;
        _666 = _672;
    }
    int _674 = _666;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _388 + _676;
    float _680 = _636 * _156;
    bool _682 = _514 > 0.0;
    float _684 = fma(_604, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _686 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _688 = isnan(_388);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _610);
    float _700 = exp2(_680);
    bool _702 = _652 > 0.0;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _614);
    float _706 = _698 * _620;
    bool _708 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _710 = isnan(_388);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_696;
    float _722 = _720 + 1.0;
    bool _724 = _652 >= 0.0;
    bool _726 = isnan(_652);
    bool _728 = _724 || _726;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _612);
    float _736 = _718 * _722;
    float _738 = float(_674);
    float _740 = _734 * _608;
    float _742 = _704 * _640;
    float _744 = _684 * _736;
    bool _746 = !_522;
    int _748 = _746 ? 0 : 1;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _752 = 1.0 + _750;
    float _754 = -_700;
    float _756 = _754 + 1.0;
    float _758 = -_718;
    float _760 = _758 + 1.0;
    int _762 = abs(_748);
    float _764 = 1.0 / _752;
    float _766 = in.m_79.x;
    float _768 = in.m_79.y;
    float _770 = in.m_79.z;
    bool _772 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _774 = isnan(1.0);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _780 = _776 || _778;
    float _782 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[115].x, _744);
    float _784 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
    int _786 = _732 ? 0 : 1;
    float _788 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[116].x, _782);
    float _790 = float(_762);
    float _792 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[5].z, _576);
    bool _794 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _802 = _798 || _800;
    float _804 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
    bool _806 = !_526;
    int _808 = _806 ? 0 : 1;
    float _810 = _790 * _738;
    float _812 = _802 ? _756 : 0.0;
    float _814 = in.m_81.x;
    float _816 = in.m_81.y;
    float _818 = in.m_81.z;
    int _820 = ~_786;
    int _822 = _820 + 1;
    int _824 = _822 + 1;
    float _826 = _810 * (-2.0);
    int _828 = _824;
    float _830 = _826;
    if (!_702)
    {
        int _832 = ~_786;
        int _834 = _832 + 1;
        _828 = _834;
    }
    int _836 = _828;
    if (_780)
    {
        float _838 = _812 * _764;
        _160 = _838;
    }
    float _840 = _160;
    bool _842 = !_530;
    int _844 = _842 ? 0 : 1;
    float _846 = fma(_650, _826, _650);
    int _848 = abs(_808);
    float _850 = _792 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _852 = abs(_844);
    float _854 = fma(_826, _766, _766);
    float _856 = float(_848);
    float _858 = float(_836);
    float _860 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _854);
    int _862 = _630 ? 0 : 1;
    float _864 = _856 * _858;
    int _866 = ~_862;
    int _868 = _866 + 1;
    int _870 = _868 + 1;
    float _872 = fma(_846, _840, _860);
    int _874 = _870;
    float _876 = _864;
    if (!_682)
    {
        int _878 = ~_862;
        int _880 = _878 + 1;
        _874 = _880;
    }
    int _882 = _874;
    bool _884 = _612 != 0.0;
    bool _886 = isnan(_612);
    bool _888 = _884 || _886;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    float _894 = _872 * 0.15915493667125701904296875;
    float _896 = float(_852);
    float _898 = _864 * (-2.0);
    float _900 = float(_882);
    bool _902 = _610 == 0.0;
    bool _904 = !_892;
    bool _906 = _902 && _904;
    float _908 = fma(_898, _768, _768);
    float _910 = fma(_606, _898, _606);
    float _912 = _896 * _900;
    bool _914 = _614 == 0.0;
    bool _916 = _914 && _906;
    float _918 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].y, _908);
    float _920 = _894 * 6.283185482025146484375;
    float _922 = sin(_920);
    float _924 = _912 * (-2.0);
    float _926 = fma(_910, _840, _918);
    float _928 = fma(_924, _770, _770);
    float _930 = fma(_656, _924, _656);
    float _932 = _926 * 0.15915493667125701904296875;
    float _934 = _894 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = in.m_83.x;
    float _940 = in.m_83.y;
    float _942 = in.m_83.z;
    float _944 = in.m_83.w;
    float _946 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].z, _928);
    float _948 = _908;
    float _950 = _898;
    if (_916)
    {
        _830 = _814;
    }
    float _952 = _830;
    float _954 = _952;
    if (_916)
    {
        _948 = _816;
    }
    float _956 = _948;
    float _958 = fma(_930, _840, _946);
    float _960 = _956;
    if (_916)
    {
        _950 = _952;
    }
    float _962 = _950;
    float _964 = _932 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _962;
    if (!_916)
    {
        _954 = _814;
    }
    float _970 = _954;
    float _972 = _958 * 0.15915493667125701904296875;
    float _974 = 0.0;
    if (_916)
    {
        _974 = _818;
    }
    float _976 = _974;
    float _978 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _980 = _976;
    if (_916)
    {
        _876 = _956;
    }
    float _982 = _876;
    float _984 = _982;
    if (!_916)
    {
        float _986 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _970);
        _968 = _986;
    }
    float _988 = _968;
    float _990 = _988;
    if (_916)
    {
        _668 = _976;
    }
    float _992 = _668;
    float _994 = _932 * 6.283185482025146484375;
    float _996 = cos(_994);
    float _998 = _992;
    if (!_916)
    {
        _960 = _816;
    }
    float _1000 = _960;
    if (!_916)
    {
        _980 = _818;
    }
    float _1002 = _980;
    if (!_916)
    {
        float _1004 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1000);
        _984 = _1004;
    }
    float _1006 = _984;
    float _1008 = _972 * 6.283185482025146484375;
    float _1010 = cos(_1008);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1014 = _940 * _1002;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1018 = _938 * _1000;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _972 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _942 * _970;
    if (!_916)
    {
        float _1034 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1002);
        _998 = _1034;
    }
    float _1036 = _998;
    float _1038 = -_1014;
    float _1040 = fma(_942, _1000, _1038);
    float _1042 = -_1018;
    float _1044 = fma(_940, _970, _1042);
    float _1046 = _936 * _996;
    float _1048 = _936 * _1010;
    float _1050 = _922 * _966;
    float _1052 = -_1032;
    float _1054 = fma(_938, _1002, _1052);
    out.m_85.x = _1022;
    out.m_85.y = _1028;
    out.m_85.z = _1030;
    out.m_85.w = _978;
    float _1056 = _936 * _966;
    float _1058 = _922 * _996;
    float _1060 = _996 * _1010;
    float _1062 = _922 * _1010;
    float _1064 = fma(_1026, _1046, _1050);
    float _1066 = fma(_1026, _1050, _1046);
    float _1068 = -_1056;
    float _1070 = fma(_1026, _1058, _1068);
    float _1072 = -_1058;
    float _1074 = fma(_1026, _1056, _1072);
    float _1076 = -_740;
    float _1078 = _1026 * _1076;
    float _1080 = _966 * _1010;
    float _1082 = _1054 * _944;
    float _1084 = _1040 * _944;
    float _1086 = fma(_1060, _706, _1078);
    float _1088 = _1048 * _740;
    float _1090 = _1062 * _740;
    float _1092 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1094 = fma(_1080, _742, _1086);
    float _1096 = fma(_1064, _706, _1088);
    float _1098 = fma(_1070, _706, _1090);
    float _1100 = _1044 * _944;
    float _1102 = _784 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = fma(_1074, _742, _1096);
    float _1106 = fma(_1066, _742, _1098);
    float _1108 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1110 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1112 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1116 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1118 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1120 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1112);
    float _1122 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1114);
    float _1124 = -_1026;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1108);
    float _1128 = -_1026;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1110);
    float _1132 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1120);
    float _1134 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1122);
    float _1136 = -_1026;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1116);
    float _1140 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1118);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1144 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1146 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1148 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = _1102 + _1142;
    float _1152 = _1092 + _1144;
    float _1154 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1146);
    float _1156 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1150 + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1164 = _1152 + _1162;
    float _1166 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1168 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1130);
    float _1170 = _1160 * _1160;
    float _1172 = _1164 * _1164;
    float _1174 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1126);
    float _1180 = _1170 + _1172;
    float _1182 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1184 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1186 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1138);
    float _1188 = sqrt(_1180);
    float _1190 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    float _1192 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    float _1194 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1156);
    float _1196 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1166);
    float _1198 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1154);
    float _1200 = _1168 * _940;
    float _1202 = _1168 * _1006;
    float _1204 = _1082 * _1168;
    float _1206 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1184);
    float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1210 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1190);
    float _1212 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1196);
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1216 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1140);
    float _1218 = _1178 * _940;
    bool _1220 = _1188 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = _1178 * _1006;
    float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1226 = _1186 * _1006;
    float _1228 = _1082 * _1178;
    float _1230 = _850 + _1214;
    float _1232 = _1186 * _940;
    float _1234 = _1082 * _1186;
    float _1236 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1194);
    float _1238 = fma(_1216, _988, _1222);
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1242 = fma(_1192, _988, _1202);
    float _1244 = fma(_1198, _988, _1226);
    float _1246 = _1170;
    float _1248 = _1172;
    float _1250 = _1150;
    float _1252 = _1152;
    float _1254 = _1218;
    float _1256 = _1212;
    float _1258 = _1204;
    float _1260 = _1214;
    float _1262 = _1226;
    if (!_1220)
    {
        _990 = _1170;
    }
    float _1264 = _990;
    float _1266 = fma(_1216, _938, _1218);
    float _1268 = fma(_1084, _1216, _1228);
    float _1270 = _1264;
    if (!_1220)
    {
        _1246 = _1230;
    }
    float _1272 = _1246;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _1278 = !_1220;
    float _1280 = _1272;
    if (!_1278)
    {
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1286 = _1188 + _1284;
        float _1288 = rsqrt(_1180);
        float _1290 = _1286 * _1282;
        float _1292 = _1230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = _1290 * 0.15915493667125701904296875;
        float _1296 = _1294 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = _1294 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = fma(_1298, _1292, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1306 = _1288 * _1304;
        float _1308 = _1302 + (-1.0);
        float _1310 = fma(_1160, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1164, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1314 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1318 = _1310 + _1316;
        float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1322 = _1312 + _1320;
        float _1324 = fma(_1230, _1302, _1314);
        float _1326 = _1318 * _1318;
        float _1328 = _1322 * _1322;
        _1280 = _1324;
        _1270 = _1326;
        _1248 = _1328;
        _1250 = _1310;
        _1252 = _1312;
        _1254 = _1294;
    }
    float _1330 = _1280;
    float _1332 = _1270;
    float _1334 = _1248;
    float _1336 = _1250;
    float _1338 = _1252;
    float _1340 = _1254;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1344 = _1330 + _1342;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1348 = fma(_1192, _938, _1200);
    float _1350 = fma(_1198, _938, _1232);
    float _1352 = fma(_1344, _1344, _1332);
    float _1354 = _512 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1356 = _516 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1358 = _536 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1360 = _1352 + _1334;
    float _1362 = fma(_1084, _1192, _1204);
    float _1364 = fma(_1084, _1198, _1234);
    float _1366 = _456 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1368 = _618 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1370 = _488 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1372 = sqrt(_1360);
    float _1374 = _1356 * _1224;
    float _1376 = _1358 * _1240;
    float _1378 = _1366 * _1208;
    float _1380 = fma(_1236, _1036, _1238);
    float _1382 = fma(_1236, _942, _1266);
    float _1384 = fma(_1100, _1236, _1268);
    float _1386 = fma(_1210, _942, _1348);
    float _1388 = fma(_1212, _942, _1350);
    float _1390 = _1354 * _1276;
    float _1392 = _1368 * _1274;
    float _1394 = _1370 * _1346;
    float _1396 = fma(_1210, _1036, _1242);
    float _1398 = fma(_1100, _1210, _1362);
    float _1400 = fma(_1100, _1212, _1364);
    float _1402 = fma(_1212, _1036, _1244);
    out.m_87.x = _1378;
    out.m_87.y = _1374;
    out.m_87.z = _1394;
    out.m_87.w = _1376;
    bool _1404 = _1372 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1406 = isnan(_1372);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1412 = _1408 || _1410;
    out.m_89.x = _1392;
    out.m_89.y = _1390;
    out.m_91.x = _1382;
    out.m_91.y = _1386;
    out.m_91.z = _1388;
    out.m_93.x = _1384;
    out.m_93.y = _1398;
    out.m_93.z = _1400;
    float _1414 = _1340;
    if (!_1412)
    {
        _1256 = 1.0;
    }
    float _1416 = _1256;
    out.m_95.x = _1380;
    out.m_95.y = _1396;
    out.m_95.z = _1402;
    bool _1418 = !_1412;
    float _1420 = _1416;
    if (!_1418)
    {
        bool _1422 = _1372 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1424 = isnan(_1372);
        bool _1426 = _1422 || _1424;
        bool _1428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1430 = _1426 || _1428;
        if (!_1430)
        {
            float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1434 = _1372 + _1432;
            float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1438 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1436;
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1442 = _1440 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1444 = 1.0 / _1438;
            float _1446 = _1434 * _1444;
            float _1448 = fma(_1446, _1442, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1420 = _1448;
            _1450 = true;
        }
        else
        {
            bool _1452 = _1372 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1454 = isnan(_1372);
            bool _1456 = _1452 || _1454;
            bool _1458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1460 = _1456 || _1458;
            if (!_1460)
            {
                float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1464 = _1372 + _1462;
                float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1468 = _1466 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1474 = 1.0 / _1468;
                float _1476 = _1464 * _1474;
                float _1478 = fma(_1476, _1472, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1420 = _1478;
                _1450 = true;
            }
            else
            {
                _1420 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1450 = false;
    float _1480 = _1420;
    float _1482 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1484 = _1330 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1488 = _1336 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1492 = _1338 + _1490;
    float _1494 = _850 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1496 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1498 = fma(_1488, _1480, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1500 = fma(_1492, _1480, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1502 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1494);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1496 + _1504;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1498 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1500 + _1512;
    float _1516 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1502);
    float _1518 = _1506 * _1506;
    float _1520 = _850 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1522 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1524 = fma(_1510, _1510, _1518);
    float _1526 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1520);
    float _1528 = 1.0 / _1522;
    float _1530 = fma(_1514, _1514, _1524);
    float _1532 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1526);
    float _1534 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1536 = rsqrt(_1530);
    float _1538 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1540 = _1534 + _1522;
    float _1542 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1544 = _850 + _1542;
    float _1546 = _1540 * _1528;
    float _1548 = _1546 * 0.5;
    float _1550 = floor(_1538);
    float _1552 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1556 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1554);
    float _1558 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1560 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1552);
    float _1562 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1564 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1558);
    float _1566 = 1.0 / _1556;
    float _1568 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1560);
    float _1570 = _1510 * _1562;
    float _1572 = _1514 * _1562;
    float _1574 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1564);
    float _1576 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1578 = _1570 * _1570;
    float _1580 = _1572 * _1572;
    float _1582 = _1574 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1584 = trunc(_1576);
    int _1586 = int(_1584);
    float _1588 = -_1550;
    float _1590 = _1538 + _1588;
    float _1592 = _1578 + _1580;
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1596 = _1566 * _1594;
    float _1598 = sqrt(_1592);
    bool _1600 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1602 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1604 = trunc(_1582);
    int _1606 = int(_1604);
    int _1608 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1610 = _1586 + _1608;
    int _1612 = _1610 + 1;
    bool _1614 = _1598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1598 + _1616;
    int _1620 = 2;
    float _1622 = _1592;
    float _1624 = _1618;
    float _1626 = _1562;
    float _1628 = _1570;
    float _1630 = _1550;
    float _1632 = _1578;
    if (!_1600)
    {
        _1620 = 1;
    }
    int _1634 = _1620;
    float _1636 = sqrt(_1530);
    int _1638 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1640 = _1606 + _1638;
    int _1642 = _1640 + 1;
    float _1644 = _1542;
    int _1646 = _1634;
    if (_1614)
    {
        float _1648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1644 = _1648;
    }
    float _1650 = _1644;
    if (_1614)
    {
        float _1652 = rsqrt(_1592);
        _1622 = _1652;
    }
    float _1654 = _1622;
    float _1656 = _1654;
    if (_1614)
    {
        float _1658 = _1618 * _1650;
        _1624 = _1658;
    }
    float _1660 = _1624;
    if (_1614)
    {
        float _1662 = _1660 * 0.15915493667125701904296875;
        _1258 = _1662;
    }
    float _1664 = _1258;
    bool _1666 = !_1600;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1672 = _1568;
    if (_1614)
    {
        float _1674 = _1664 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        _1672 = _1676;
    }
    float _1678 = _1672;
    if (!_1602)
    {
        _1646 = _1668;
    }
    int _1680 = _1646;
    float _1682 = precise::max(0.0, _1670);
    int _1684 = _1680 << 6;
    bool _1686 = _1612 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1688 = -_1562;
    float _1690 = -_1682;
    float _1692 = fma(_1506, _1688, _1690);
    int _1694 = _1684 + 48;
    uint _1697 = uint(int(uint(_1694) >> uint(2)));
    uint _1699 = uint(int(uint(int(_1697)) >> uint(2)));
    int _1701 = int(_1697) & 3;
    float _1703 = (*spvDescriptorSet0.vp_c15)._m0[int(_1699)][_1701];
    int _1705 = int(_1697) + 1;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    int _1709 = _1705 & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    int _1713 = _1612 | _1642;
    float _1715 = _1664;
    float _1717 = as_type<float>(_1713);
    if (_1614)
    {
        float _1719 = _1664 * 6.283185482025146484375;
        float _1721 = cos(_1719);
        _1715 = _1721;
    }
    float _1723 = _1715;
    if (_1614)
    {
        float _1725 = _1692 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1725;
    }
    float _1727 = _1626;
    bool _1729 = _1713 < 0;
    bool _1731 = _1729 || _1686;
    if (_1614)
    {
        float _1733 = fma(_1678, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1717 = _1733;
    }
    float _1735 = _1717;
    int _1737 = _1684 + 96;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    uint _1741 = uint(int(uint(int(_1739)) >> uint(2)));
    int _1743 = int(_1739) & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    int _1747 = int(_1739) + 1;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    int _1751 = _1747 & 3;
    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[int(_1749)][_1751];
    float _1755 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1757 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1614)
    {
        float _1759 = _1654 * _1735;
        _1260 = _1759;
    }
    float _1761 = _1260;
    bool _1763 = _1642 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1765 = _1763 || _1731;
    float _1767 = floor(_1755);
    float _1769 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1757);
    if (_1614)
    {
        float _1771 = _1570 * _1761;
        _1628 = _1771;
    }
    float _1773 = _1628;
    int _1775 = _1684 + 64;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    uint _1779 = uint(int(uint(int(_1777)) >> uint(2)));
    int _1781 = int(_1777) & 3;
    float _1783 = (*spvDescriptorSet0.vp_c15)._m0[int(_1779)][_1781];
    int _1785 = int(_1777) + 1;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    int _1789 = _1785 & 3;
    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
    if (!_1614)
    {
        _1630 = _1692;
    }
    float _1793 = _1630;
    float _1795 = _1793;
    float _1797 = _1723;
    if (_1614)
    {
        float _1799 = _1723 + (-1.0);
        _1656 = _1799;
    }
    float _1801 = _1656;
    float _1803 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1769);
    float _1805 = _1801;
    if (_1614)
    {
        float _1807 = _1773 * _1773;
        _1632 = _1807;
    }
    float _1809 = _1632;
    if (_1614)
    {
        float _1811 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1811;
    }
    float _1813 = _1262;
    if (!_1614)
    {
        _1805 = _1572;
    }
    float _1815 = _1805;
    int _1817 = _1684 + 104;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    float _1835 = _1815;
    if (_1614)
    {
        float _1837 = _1572 * _1761;
        _1835 = _1837;
    }
    float _1839 = _1835;
    if (_1614)
    {
        float _1841 = fma(_1692, _1723, _1813);
        _1795 = _1841;
    }
    float _1843 = _1795;
    float _1845 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1614)
    {
        _1797 = _1580;
    }
    float _1847 = _1797;
    float _1849 = _1847;
    if (_1614)
    {
        float _1851 = _1839 * _1839;
        _1849 = _1851;
    }
    float _1853 = _1849;
    float _1855 = fma(_1843, _1843, _1809);
    float _1857 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1859 = _1684 + 80;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    uint _1863 = uint(int(uint(int(_1861)) >> uint(2)));
    int _1865 = int(_1861) & 3;
    float _1867 = (*spvDescriptorSet0.vp_c15)._m0[int(_1863)][_1865];
    int _1869 = int(_1861) + 1;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    int _1873 = _1869 & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    float _1877 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1879 = -_1767;
    float _1881 = _1755 + _1879;
    float _1883 = _1855 + _1853;
    int _1885 = as_type<int>(_1877);
    if (!_1765)
    {
        float _1887 = floor(_1582);
        _1414 = _1887;
    }
    float _1889 = _1414;
    float _1891 = -_1877;
    float _1893 = fma(_1891, _1857, 1.0);
    if (!_1765)
    {
        int _1895 = _1642 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1897 = _1895 + _1612;
        _1885 = _1897;
    }
    int _1899 = _1885;
    int _1901 = _1684 + 56;
    uint _1903 = uint(int(uint(_1901) >> uint(2)));
    uint _1905 = uint(int(uint(int(_1903)) >> uint(2)));
    int _1907 = int(_1903) & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    int _1911 = int(_1903) + 1;
    uint _1913 = uint(int(uint(_1911) >> uint(2)));
    int _1915 = _1911 & 3;
    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[int(_1913)][_1915];
    float _1919 = log2(_1893);
    int _1921 = _1684 + 72;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    uint _1925 = uint(int(uint(int(_1923)) >> uint(2)));
    int _1927 = int(_1923) & 3;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[int(_1925)][_1927];
    int _1931 = int(_1923) + 1;
    uint _1933 = uint(int(uint(_1931) >> uint(2)));
    int _1935 = _1931 & 3;
    float _1937 = (*spvDescriptorSet0.vp_c15)._m0[int(_1933)][_1935];
    float _1939 = _1544 * _1711;
    float _1941 = rsqrt(_1883);
    float _1943 = fma(_1102, _1703, _1939);
    int _1945 = as_type<int>(_1939);
    if (!_1765)
    {
        int _1947 = _1899 << 2;
        _1945 = _1947;
    }
    int _1949 = _1945;
    int _1951 = _1684 + 88;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[int(_1955)][_1957];
    int _1961 = int(_1953) + 1;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    int _1965 = _1961 & 3;
    float _1967 = (*spvDescriptorSet0.vp_c15)._m0[int(_1963)][_1965];
    float _1969 = _1544 * _1753;
    int _1971 = _1949;
    int _1973 = as_type<int>(_1745);
    if (!_1765)
    {
        int _1975 = 12 & _1949;
        _1971 = _1975;
    }
    int _1977 = _1971;
    float _1979 = _1919 * 0.693147182464599609375;
    float _1981 = fma(_1102, _1745, _1969);
    float _1983 = _1544 * _1791;
    float _1985 = _1791;
    int _1987 = as_type<int>(_1875);
    if (!_1765)
    {
        float _1989 = -_1889;
        float _1991 = _1582 + _1989;
        _1985 = _1991;
    }
    float _1993 = _1985;
    float2 _5920 = float2(_1590, _1881);
    float _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5920, float2(0.0), isnan(_5920)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5920, float2(0.0), isnan(_5920)), level(0.0)).x;
    float _1997 = fma(_1102, _1783, _1983);
    float _1999 = _1941 * _1773;
    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2003 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2001);
    float _2005 = precise::clamp(_2003, 0.0, 1.0);
    float _2007 = _1941 * _1843;
    float _2009 = fma(_1092, _1825, _1981);
    float _2011 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2013 = _1941 * _1839;
    float _2015 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2017 = _2009 + _1833;
    float _2019 = -_2011;
    float _2021 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2019);
    float _2023 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2025 = _1544 * _1875;
    float _2027 = _2013;
    if (!_1765)
    {
        uint _2029 = uint(int(uint(_1899) >> uint(2)));
        _1987 = int(_2029);
    }
    int _2031 = _1987;
    float _2033 = 1.0 / _2017;
    float _2035 = fma(_1102, _1867, _2025);
    float _2037 = -_2005;
    float _2039 = _2037 + 1.0;
    if (!_1765)
    {
        int _2041 = _2031 << 4;
        int _2043 = _2041 + _1977;
        _1973 = _2043;
    }
    int _2045 = _1973;
    float _2047 = -_2013;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2021);
    float _2051 = fma(_1092, _1909, _1943);
    if (!_1765)
    {
        float _2053 = floor(_1576);
        _2027 = _2053;
    }
    float _2055 = _2027;
    float _2057 = fma(_2049, -0.5, 0.5);
    float _2059 = _2051 + _1917;
    float _2061 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2063 = _2051;
    if (!_1765)
    {
        int _2065 = _2045 + 400;
        uint _2067 = uint(int(uint(_2065) >> uint(2)));
        uint _2069 = uint(int(uint(int(_2067)) >> uint(2)));
        int _2071 = int(_2067) & 3;
        float _2073 = (*spvDescriptorSet0.vp_c15)._m0[int(_2069)][_2071];
        _2063 = _2073;
    }
    float _2075 = _2063;
    float _2077 = fma(_2049, 0.5, 0.5);
    float _2079 = fma(_1092, _1929, _1997);
    float _2081 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2061);
    float _2083 = abs(_2039);
    float _2085 = log2(_2083);
    float _2087 = fma(_2077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2089 = _2079 + _1937;
    float _2091 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2093 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2081);
    float _2095 = fma(_2077, _2087, -0.212114393711090087890625);
    float _2097 = fma(_1092, _1959, _2035);
    float _2099 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2091);
    float _2101 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2023);
    float _2103 = _2059 * _2033;
    float _2105 = _2097 + _1967;
    float _2107 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2099);
    float _2109 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2111 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2101);
    bool _2113 = _2103 >= 0.0;
    float _2115 = _2107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2117 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2119 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2121 = _2103 <= 1.0;
    bool _2123 = _2121 && _2113;
    float _2125 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2127 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2117);
    float _2129 = _2089 * _2033;
    float _2131 = _2007 + 1.0;
    float _2133 = exp2(_2119);
    float _2135 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2127);
    float _2137 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2139 = _2129 >= 0.0;
    bool _2141 = _2139 && _2123;
    float _2143 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2145 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2135);
    float _2147 = fma(_2077, _2095, 1.570728778839111328125);
    bool _2149 = _2129 <= 1.0;
    bool _2151 = _2149 && _2141;
    float _2153 = sqrt(_2057);
    float _2155 = _2105 * _2033;
    float _2157 = -_2007;
    float _2159 = fma(_2133, _2131, _2157);
    float _2161 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2137);
    float _2163 = 1.0 / _2145;
    float _2165 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2143);
    float _2167 = _2137;
    float _2169 = _2145;
    if (_2151)
    {
        float _2171 = float(_1680);
        _2167 = _2171;
    }
    float _2173 = _2167;
    float _2175 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2161);
    float _2177 = fma(_2159, 0.5, 0.5);
    float _2179 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2165);
    float _2181 = _2153 * 0.636619746685028076171875;
    float _2183 = _2173;
    float _2185 = _2175;
    if (_2151)
    {
        float _2187 = rint(_2173);
        float _2189 = precise::max(_2187, 0.0);
        uint _2191 = uint(_2189);
        uint _2193 = clamp(_2191, 0u, 65535u);
        _2183 = as_type<float>(_2193);
    }
    float _2195 = _2183;
    float _2197 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2179);
    float _2199 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2175);
    float _2201 = -_2147;
    float _2203 = fma(_2181, _2201, 1.0);
    float _2205 = _2197;
    float _2207 = _2199;
    if (!_1765)
    {
        float _2209 = -_2055;
        float _2211 = _1576 + _2209;
        _2185 = _2211;
    }
    float _2213 = _2185;
    float _2215 = _2197 * _2163;
    float _2217 = _2199 * _2163;
    float _2219 = _2075;
    if (!_1765)
    {
        float _2221 = rint(_2075);
        float _2223 = precise::max(_2221, 0.0);
        uint _2225 = uint(_2223);
        uint _2227 = clamp(_2225, 0u, 65535u);
        _2219 = as_type<float>(_2227);
    }
    float _2229 = _2219;
    float _2231 = fma(_2215, 0.5, 0.5);
    float _2233 = fma(_2217, -0.5, 0.5);
    float _2235 = _2195;
    if (_2151)
    {
        float3 _6330 = float3(_2103, _2129, float(as_type<int>(_2195)));
        float3 _6334 = select(_6330, float3(0.0), isnan(_6330));
        float _2237 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6334.xy, uint(rint(_6334.z)), _2155, level(0.0));
        _2235 = _2237;
    }
    float _2239 = _2235;
    float3 _6344 = float3(_2231, _2233, _2015);
    float _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6344, float3(0.0), isnan(_6344)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6344, float3(0.0), isnan(_6344)), level(0.0)).x;
    float3 _6353 = float3(_2231, _2233, _2015);
    float4 _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6353, float3(0.0), isnan(_6353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6353, float3(0.0), isnan(_6353)), level(0.0)).xyzw;
    float _2246 = _2244.x;
    float _2248 = _2244.y;
    float _2250 = _2244.z;
    float _2252 = _2244.w;
    float2 _6369 = float2(_2203, _2177);
    float3 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6369, float2(0.0), isnan(_6369)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6369, float2(0.0), isnan(_6369)), level(0.0)).xyz;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    float _2264 = _2213;
    if (!_1765)
    {
        float3 _6390 = float3(_2213, _1993, float(as_type<int>(_2229)));
        float3 _6392 = select(_6390, float3(0.0), isnan(_6390));
        float _2266 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6392.xy, uint(rint(_6392.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6392.xy, uint(rint(_6392.z)), level(0.0)).x;
        _2264 = _2266;
    }
    float _2268 = _2264;
    float _2270 = abs(_1596);
    float _2272 = log2(_2270);
    float _2274 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2276 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2278 = exp2(_2274);
    float _2280 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2276);
    bool _2282 = _1596 <= 8000.0;
    bool _2284 = isnan(_1596);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(8000.0);
    bool _2290 = _2286 || _2288;
    float _2292 = float(_2290);
    float _2294 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2280);
    float _2296 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2298 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2294);
    float _2300 = exp2(_2296);
    out.gl_Position.x = _2197;
    out.gl_Position.y = _2199;
    out.gl_Position.z = _2298;
    out.gl_Position.w = _2145;
    float _2302 = -_2278;
    float _2304 = _2302 + 1.0;
    float _2306 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2308 = _2298;
    if (_1765)
    {
        _2205 = 1.0;
    }
    float _2310 = _2205;
    float _2312 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2314 = precise::clamp(_2312, 0.0, 1.0);
    float _2316 = fma(_2314, -2.0, 3.0);
    float _2318 = _2314 * _2314;
    float _2320 = _2318 * _2316;
    float _2322 = -_2320;
    float _2324 = _2322 + 1.0;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2320);
    float _2328 = _2324;
    float _2330 = _2310;
    if (!_2151)
    {
        _2328 = 1.0;
    }
    float _2332 = _2328;
    float _2334 = _2292 * _2326;
    float _2336 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2338 = -_1995;
    float _2340 = _2338 + 1.0;
    float _2342 = _2340 * _2336;
    float _2344 = precise::clamp(_2342, 0.0, 1.0);
    float _2346 = _2332;
    float _2348 = _2336;
    if (_2151)
    {
        bool _2350 = _2239 >= _2155;
        bool _2352 = isnan(_2239);
        bool _2354 = _2350 || _2352;
        bool _2356 = isnan(_2155);
        bool _2358 = _2354 || _2356;
        float _2360 = float(_2358);
        _2346 = _2360;
    }
    float _2362 = _2346;
    if (!_1765)
    {
        int _2364 = _1899 << 4;
        int _2366 = _2364 + 2048;
        uint _2368 = uint(int(uint(_2366) >> uint(2)));
        uint _2370 = uint(int(uint(int(_2368)) >> uint(2)));
        int _2372 = int(_2368) & 3;
        float _2374 = (*spvDescriptorSet0.vp_c15)._m0[int(_2370)][_2372];
        int _2376 = int(_2368) + 1;
        uint _2378 = uint(int(uint(_2376) >> uint(2)));
        int _2380 = _2376 & 3;
        float _2382 = (*spvDescriptorSet0.vp_c15)._m0[int(_2378)][_2380];
        int _2384 = _2366 + 8;
        uint _2386 = uint(int(uint(_2384) >> uint(2)));
        uint _2388 = uint(int(uint(int(_2386)) >> uint(2)));
        int _2390 = int(_2386) & 3;
        float _2392 = (*spvDescriptorSet0.vp_c15)._m0[int(_2388)][_2390];
        int _2394 = int(_2386) + 1;
        uint _2396 = uint(int(uint(_2394) >> uint(2)));
        int _2398 = _2394 & 3;
        float _2400 = (*spvDescriptorSet0.vp_c15)._m0[int(_2396)][_2398];
        float _2402 = _1544 * _2382;
        float _2404 = fma(_1102, _2374, _2402);
        float _2406 = fma(_1092, _2392, _2404);
        float _2408 = _2406 + _2400;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        float _2412 = -_2410;
        float _2414 = _2412 + _2268;
        float _2416 = fma(_2414, 500.0, 1.5);
        float _2418 = exp2(_2416);
        float _2420 = 0.0 + _2418;
        float _2422 = precise::clamp(_2420, 0.0, 1.0);
        _2330 = _2422;
        _2169 = _2400;
        _2207 = _2382;
        _2308 = _2392;
    }
    float _2424 = _2330;
    float _2426 = _2169;
    float _2428 = _2207;
    float _2430 = _2308;
    float _2432 = _2362 * _2424;
    float _2434 = _2306 * _2241;
    float _2436 = -_2344;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2440 = -_2306;
    float _2442 = _2440 + 1.0;
    bool _2444 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2446 = isnan(_1636);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2452 = _2448 || _2450;
    float _2454 = _2252 * _2434;
    float _2456 = -_2432;
    float _2458 = fma(_2456, _2438, 1.0);
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    float _2462 = _2262 * _2434;
    float _2464 = _2252 * _2442;
    float _2466 = fma(_2258, _2454, _2246);
    float _2468 = fma(_2260, _2454, _2248);
    float _2470 = _2460 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2472 = fma(_2252, _2462, _2250);
    out.m_97.x = _2470;
    float _2474 = _2426;
    float _2476 = _2430;
    float _2478 = _2428;
    float _2480 = _2460;
    float _2482 = _2454;
    if (!_2452)
    {
        _2348 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2484 = _2348;
    float _2486 = _2484;
    float _2488 = _2484;
    if (!_2452)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2490 = _2474;
    out.m_99.x = _2466;
    out.m_99.y = _2468;
    out.m_99.z = _2472;
    out.m_99.w = _2464;
    float _2492 = _2490;
    float _2494 = _2490;
    if (!_2452)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2496 = _2476;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2452)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2502 = _2478;
    float _2504 = _2502;
    float _2506 = _2502;
    if (!_2452)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2508 = _2480;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2452)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2514 = _2482;
    bool _2516 = !_2452;
    float _2518 = _2514;
    float _2520 = _2514;
    if (!_2516)
    {
        bool _2522 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2524 = isnan(_1636);
        bool _2526 = _2522 || _2524;
        bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2530 = _2526 || _2528;
        if (!_2530)
        {
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2534 = _1636 + _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2538 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2536;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2544 = 1.0 / _2538;
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2562 = _2534 * _2544;
            float _2564 = precise::clamp(_2562, 0.0, 1.0);
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2570 = fma(_2564, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2572 = fma(_2564, _2568, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2574 = fma(_2564, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2576 = fma(_2564, _2552, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2578 = fma(_2564, _2556, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2580 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2494 = _2574;
            _2512 = _2578;
            _2488 = _2570;
            _2506 = _2576;
            _2500 = _2572;
            _2520 = _2580;
            _2582 = true;
        }
        else
        {
            bool _2584 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2586 = isnan(_1636);
            bool _2588 = _2584 || _2586;
            bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2592 = _2588 || _2590;
            if (!_2592)
            {
                _2486 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2594 = _2486;
            _2488 = _2594;
            if (!_2592)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2596 = _2492;
            _2494 = _2596;
            if (!_2592)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2598 = _2498;
            _2500 = _2598;
            if (!_2592)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2600 = _2504;
            _2506 = _2600;
            if (!_2592)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2602 = _2510;
            _2512 = _2602;
            if (!_2592)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2604 = _2518;
            bool _2606 = !_2592;
            _2520 = _2604;
            if (!_2606)
            {
                bool _2608 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2610 = isnan(_1636);
                bool _2612 = _2608 || _2610;
                bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2616 = _2612 || _2614;
                if (!_2616)
                {
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2620 = _1636 + _2618;
                    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2624 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2622;
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2630 = 1.0 / _2624;
                    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2648 = _2620 * _2630;
                    float _2650 = precise::clamp(_2648, 0.0, 1.0);
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2656 = fma(_2650, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2658 = fma(_2650, _2654, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2660 = fma(_2650, _2634, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2662 = fma(_2650, _2638, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2664 = fma(_2650, _2642, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2666 = fma(_2650, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2494 = _2660;
                    _2512 = _2664;
                    _2488 = _2656;
                    _2506 = _2662;
                    _2500 = _2658;
                    _2520 = _2666;
                    _2582 = true;
                }
                else
                {
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2488 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2582 = false;
    float _2668 = _2494;
    float _2670 = _2512;
    float _2672 = _2488;
    float _2674 = _2506;
    float _2676 = _2500;
    float _2678 = _2520;
    float _2680 = fma(_1396, -0.5, 0.5);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = -_2668;
    float _2686 = _2684 + _2670;
    float _2688 = -_2672;
    float _2690 = _2688 + _2674;
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    bool _2696 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2698 = fma(_2682, _2686, _2668);
    float _2700 = fma(_2682, _2690, _2672);
    float _2702 = fma(_2682, _2694, _2676);
    float _2704 = _2698 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2706 = fma(_2700, 0.298911988735198974609375, _2704);
    float _2708 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2710 = fma(_2702, 0.114477999508380889892578125, _2706);
    out.m_97.w = _2708;
    float _2712 = -_2710;
    float _2714 = _2700 + _2712;
    float _2716 = -_2710;
    float _2718 = _2698 + _2716;
    float _2720 = -_2710;
    float _2722 = _2702 + _2720;
    out.m_101.x = 0.0;
    float _2724 = fma(_2714, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2726 = fma(_2718, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2728 = fma(_2722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    out.m_103.x = _2724;
    out.m_103.y = _2726;
    out.m_103.z = _2728;
    if (!_2696)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2730 = -_1496;
    float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2734 = -_1498;
    float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2738 = -_1500;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2742 = _2732 * _2732;
    float _2744 = fma(_2736, _2736, _2742);
    float _2746 = fma(_2740, _2740, _2744);
    float _2748 = sqrt(_2746);
    float _2750 = rsqrt(_2746);
    float _2752 = -_2748;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2756 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2758 = precise::clamp(_2756, 0.0, 1.0);
    float _2760 = _2736 * _2750;
    float _2762 = _2732 * _2750;
    float _2764 = abs(_2758);
    float _2766 = log2(_2764);
    float _2768 = _2740 * _2750;
    float _2770 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2772 = _1396 * _2762;
    float _2774 = -_2762;
    float _2776 = -_2770;
    float _2778 = fma(_2774, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2776);
    float _2780 = fma(_1380, _2760, _2772);
    float _2782 = -_2768;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2778);
    float _2786 = fma(_1402, _2768, _2780);
    float _2788 = precise::clamp(_2786, 0.0, 1.0);
    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2792 = _2784 + _2790;
    float _2794 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2796 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = exp2(_2794);
    float _2802 = _2800 * _2798;
    float _2804 = _2788 * _2802;
    float _2806 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2808 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2810 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2806;
    out.m_101.y = _2808;
    out.m_101.z = _2810;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2582 = false;
    bool _1450 = false;
    bool _378 = false;
    bool _200 = false;
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
        float _2867 = as_type<float>(_138);
        out.gl_Position.z = _2867;
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
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2936 = as_type<float>(_176);
        out.gl_Position.z = _2936;
    }
    if (_170)
    {
        return out;
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_65.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_122);
        float _204 = 1.0 / _202;
        float _206 = _156 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _208 + _210;
    bool _214 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _216 = isnan(_208);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _208 + _226;
    bool _230 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_208);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_208);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_224;
    float _264 = _262 + 1.0;
    float _266 = 1.0 / _248;
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = 1.0 / _244;
    float _282 = _240 * _272;
    float _284 = -_240;
    float _286 = _284 + 1.0;
    float _288 = _228 * _266;
    float _290 = _212 * _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _296;
    float _300 = fma(_276, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_294, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = fma(_298, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = _300 * _282;
    float _308 = _302 * _282;
    float _310 = _304 * _282;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _306);
    float _326 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _308);
    float _328 = fma(_314, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _330 = fma(_318, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _332 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _334 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _310);
    float _336 = fma(_328, _268, _324);
    float _338 = fma(_330, _268, _326);
    float _340 = fma(_332, _268, _334);
    float _342 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].x, _336);
    float _344 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].y, _338);
    float _346 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].z, _340);
    bool _348 = !_278;
    int _350 = as_type<int>(_340);
    int _352 = as_type<int>(_336);
    float _354 = _290;
    bool _356 = _278;
    float _374;
    float _376;
    if (!_348)
    {
        float _358 = in.m_65.x;
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _358 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _366;
        _376 = _372;
        _378 = true;
    }
    else
    {
        float _380 = float(_122);
        float _382 = 1.0 / _380;
        float _384 = _156 * _382;
        _374 = _382;
        _376 = _384;
    }
    _378 = false;
    float _386 = _374;
    float _388 = _376;
    float _390 = in.m_67.x;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _394 = _392 != 0;
    float _396 = in.m_65.x;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _400 = _398 != 0;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _404 = _402 != 0;
    float _406 = in.m_67.y;
    float _408 = in.m_65.z;
    float _410 = in.m_65.w;
    float _412 = _386;
    float _414 = _406;
    if (_394)
    {
        float _416 = in.m_65.z;
        _412 = _416;
    }
    float _418 = _412;
    float _420 = in.m_65.y;
    float _422 = _390;
    if (_394)
    {
        float _424 = -_390;
        float _426 = _424 + 1.0;
        _350 = as_type<int>(_426);
    }
    int _428 = _350;
    if (_400)
    {
        float _430 = -_390;
        float _432 = _430 + 1.0;
        _352 = as_type<int>(_432);
    }
    int _434 = _352;
    if (!_394)
    {
        _354 = _390;
    }
    float _436 = _354;
    float _438 = in.m_69.z;
    float _440 = _436;
    if (_400)
    {
        bool _442 = _396 > 0.5;
        _356 = _442;
    }
    bool _444 = _356;
    float _446 = 0.0;
    if (!_400)
    {
        _446 = _390;
    }
    float _448 = _446;
    float _450 = in.m_69.y;
    float _452 = _448;
    if (_400)
    {
        float _454 = _444 ? as_type<float>(_434) : _390;
        _452 = _454;
    }
    float _456 = _452;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _460 = _458 != 0;
    float _462 = in.m_69.x;
    bool _464 = _408 > 0.5;
    bool _466 = _410 > 0.5;
    float _468 = in.m_58.x;
    float _470 = in.m_58.y;
    float _472 = in.m_58.z;
    bool _474 = false;
    if (_394)
    {
        bool _476 = _418 > 0.5;
        _474 = _476;
    }
    bool _478 = _474;
    float _480 = in.m_71.x;
    float _482 = in.m_71.y;
    float _484 = in.m_71.z;
    if (_394)
    {
        float _486 = _478 ? as_type<float>(_428) : _390;
        _440 = _486;
    }
    float _488 = _440;
    float _490 = -_406;
    float _492 = _490 + 1.0;
    bool _494 = _420 > 0.5;
    float _496 = in.m_69.w;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _500 = _498 != 0;
    float _502 = _420 * 2.0;
    int _504 = _464 ? as_type<int>(_492) : as_type<int>(_406);
    out.m_73.z = _438;
    int _506 = _494 ? as_type<int>(_492) : as_type<int>(_406);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _510 = _508 != 0;
    out.m_73.y = _450;
    float _512 = _500 ? as_type<float>(_504) : _406;
    float _514 = floor(_502);
    float _516 = _404 ? as_type<float>(_506) : _406;
    float _518 = _408 * 2.0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _530 = _528 != 0;
    out.m_73.x = _462;
    float _532 = _470 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_460)
    {
        float _534 = _466 ? _492 : _406;
        _414 = _534;
    }
    float _536 = _414;
    float _538 = floor(_518);
    float _540 = _470 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _542 = _346 * _484;
    float _544 = _344 * _482;
    float _546 = _342 * _480;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _556 = _470 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _560 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].x, _532);
    float _562 = 1.0 / _554;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _568 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _570 = _538 > 0.0;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
    float _578 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].x, _540);
    float _580 = _420 + _408;
    float _582 = _396 * 2.0;
    out.m_75.x = _568;
    out.m_75.y = _572;
    out.m_75.z = _574;
    bool _584 = _538 >= 0.0;
    bool _586 = isnan(_538);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = _580 + (-1.0);
    int _596 = as_type<int>(_538);
    if (_510)
    {
        float _598 = -_390;
        float _600 = _598 + 1.0;
        _596 = as_type<int>(_600);
    }
    int _602 = _596;
    out.m_73.w = _496;
    float _604 = _550 * _562;
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _608 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = in.m_77.x;
    float _612 = in.m_77.y;
    float _614 = in.m_77.z;
    if (_510)
    {
        float _616 = _494 ? as_type<float>(_602) : _390;
        _422 = _616;
    }
    float _618 = _422;
    float _620 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _622 = _514 >= 0.0;
    bool _624 = isnan(_514);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = _396 + _420;
    float _634 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _636 = log2(_634);
    float _638 = _396 + _408;
    float _640 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _642 = _632 + (-1.0);
    float _644 = _396 + (-0.5);
    float _646 = _638 + (-1.0);
    float _648 = _420 + (-0.5);
    float _650 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _652 = floor(_582);
    int _654 = _592 ? 0 : 1;
    float _656 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _658 = _408 + (-0.5);
    int _660 = ~_654;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    int _666 = _664;
    float _668 = _658;
    if (!_570)
    {
        int _670 = ~_654;
        int _672 = _670 + 1;
        _666 = _672;
    }
    int _674 = _666;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _388 + _676;
    float _680 = _636 * _156;
    bool _682 = _514 > 0.0;
    float _684 = fma(_604, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _686 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _688 = isnan(_388);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _610);
    float _700 = exp2(_680);
    bool _702 = _652 > 0.0;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _614);
    float _706 = _698 * _620;
    bool _708 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _710 = isnan(_388);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_696;
    float _722 = _720 + 1.0;
    bool _724 = _652 >= 0.0;
    bool _726 = isnan(_652);
    bool _728 = _724 || _726;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _612);
    float _736 = _718 * _722;
    float _738 = float(_674);
    float _740 = _734 * _608;
    float _742 = _704 * _640;
    float _744 = _684 * _736;
    bool _746 = !_522;
    int _748 = _746 ? 0 : 1;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _752 = 1.0 + _750;
    float _754 = -_700;
    float _756 = _754 + 1.0;
    float _758 = -_718;
    float _760 = _758 + 1.0;
    int _762 = abs(_748);
    float _764 = 1.0 / _752;
    float _766 = in.m_79.x;
    float _768 = in.m_79.y;
    float _770 = in.m_79.z;
    bool _772 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _774 = isnan(1.0);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _780 = _776 || _778;
    float _782 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[115].x, _744);
    float _784 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
    int _786 = _732 ? 0 : 1;
    float _788 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[116].x, _782);
    float _790 = float(_762);
    float _792 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[5].z, _576);
    bool _794 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _802 = _798 || _800;
    float _804 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
    bool _806 = !_526;
    int _808 = _806 ? 0 : 1;
    float _810 = _790 * _738;
    float _812 = _802 ? _756 : 0.0;
    float _814 = in.m_81.x;
    float _816 = in.m_81.y;
    float _818 = in.m_81.z;
    int _820 = ~_786;
    int _822 = _820 + 1;
    int _824 = _822 + 1;
    float _826 = _810 * (-2.0);
    int _828 = _824;
    float _830 = _826;
    if (!_702)
    {
        int _832 = ~_786;
        int _834 = _832 + 1;
        _828 = _834;
    }
    int _836 = _828;
    if (_780)
    {
        float _838 = _812 * _764;
        _160 = _838;
    }
    float _840 = _160;
    bool _842 = !_530;
    int _844 = _842 ? 0 : 1;
    float _846 = fma(_650, _826, _650);
    int _848 = abs(_808);
    float _850 = _792 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _852 = abs(_844);
    float _854 = fma(_826, _766, _766);
    float _856 = float(_848);
    float _858 = float(_836);
    float _860 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _854);
    int _862 = _630 ? 0 : 1;
    float _864 = _856 * _858;
    int _866 = ~_862;
    int _868 = _866 + 1;
    int _870 = _868 + 1;
    float _872 = fma(_846, _840, _860);
    int _874 = _870;
    float _876 = _864;
    if (!_682)
    {
        int _878 = ~_862;
        int _880 = _878 + 1;
        _874 = _880;
    }
    int _882 = _874;
    bool _884 = _612 != 0.0;
    bool _886 = isnan(_612);
    bool _888 = _884 || _886;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    float _894 = _872 * 0.15915493667125701904296875;
    float _896 = float(_852);
    float _898 = _864 * (-2.0);
    float _900 = float(_882);
    bool _902 = _610 == 0.0;
    bool _904 = !_892;
    bool _906 = _902 && _904;
    float _908 = fma(_898, _768, _768);
    float _910 = fma(_606, _898, _606);
    float _912 = _896 * _900;
    bool _914 = _614 == 0.0;
    bool _916 = _914 && _906;
    float _918 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].y, _908);
    float _920 = _894 * 6.283185482025146484375;
    float _922 = sin(_920);
    float _924 = _912 * (-2.0);
    float _926 = fma(_910, _840, _918);
    float _928 = fma(_924, _770, _770);
    float _930 = fma(_656, _924, _656);
    float _932 = _926 * 0.15915493667125701904296875;
    float _934 = _894 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = in.m_83.x;
    float _940 = in.m_83.y;
    float _942 = in.m_83.z;
    float _944 = in.m_83.w;
    float _946 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].z, _928);
    float _948 = _908;
    float _950 = _898;
    if (_916)
    {
        _830 = _814;
    }
    float _952 = _830;
    float _954 = _952;
    if (_916)
    {
        _948 = _816;
    }
    float _956 = _948;
    float _958 = fma(_930, _840, _946);
    float _960 = _956;
    if (_916)
    {
        _950 = _952;
    }
    float _962 = _950;
    float _964 = _932 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _962;
    if (!_916)
    {
        _954 = _814;
    }
    float _970 = _954;
    float _972 = _958 * 0.15915493667125701904296875;
    float _974 = 0.0;
    if (_916)
    {
        _974 = _818;
    }
    float _976 = _974;
    float _978 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _980 = _976;
    if (_916)
    {
        _876 = _956;
    }
    float _982 = _876;
    float _984 = _982;
    if (!_916)
    {
        float _986 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _970);
        _968 = _986;
    }
    float _988 = _968;
    float _990 = _988;
    if (_916)
    {
        _668 = _976;
    }
    float _992 = _668;
    float _994 = _932 * 6.283185482025146484375;
    float _996 = cos(_994);
    float _998 = _992;
    if (!_916)
    {
        _960 = _816;
    }
    float _1000 = _960;
    if (!_916)
    {
        _980 = _818;
    }
    float _1002 = _980;
    if (!_916)
    {
        float _1004 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1000);
        _984 = _1004;
    }
    float _1006 = _984;
    float _1008 = _972 * 6.283185482025146484375;
    float _1010 = cos(_1008);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1014 = _940 * _1002;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1018 = _938 * _1000;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _972 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _942 * _970;
    if (!_916)
    {
        float _1034 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1002);
        _998 = _1034;
    }
    float _1036 = _998;
    float _1038 = -_1014;
    float _1040 = fma(_942, _1000, _1038);
    float _1042 = -_1018;
    float _1044 = fma(_940, _970, _1042);
    float _1046 = _936 * _996;
    float _1048 = _936 * _1010;
    float _1050 = _922 * _966;
    float _1052 = -_1032;
    float _1054 = fma(_938, _1002, _1052);
    out.m_85.x = _1022;
    out.m_85.y = _1028;
    out.m_85.z = _1030;
    out.m_85.w = _978;
    float _1056 = _936 * _966;
    float _1058 = _922 * _996;
    float _1060 = _996 * _1010;
    float _1062 = _922 * _1010;
    float _1064 = fma(_1026, _1046, _1050);
    float _1066 = fma(_1026, _1050, _1046);
    float _1068 = -_1056;
    float _1070 = fma(_1026, _1058, _1068);
    float _1072 = -_1058;
    float _1074 = fma(_1026, _1056, _1072);
    float _1076 = -_740;
    float _1078 = _1026 * _1076;
    float _1080 = _966 * _1010;
    float _1082 = _1054 * _944;
    float _1084 = _1040 * _944;
    float _1086 = fma(_1060, _706, _1078);
    float _1088 = _1048 * _740;
    float _1090 = _1062 * _740;
    float _1092 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1094 = fma(_1080, _742, _1086);
    float _1096 = fma(_1064, _706, _1088);
    float _1098 = fma(_1070, _706, _1090);
    float _1100 = _1044 * _944;
    float _1102 = _784 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = fma(_1074, _742, _1096);
    float _1106 = fma(_1066, _742, _1098);
    float _1108 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1110 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1112 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1116 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1118 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1120 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1112);
    float _1122 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1114);
    float _1124 = -_1026;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1108);
    float _1128 = -_1026;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1110);
    float _1132 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1120);
    float _1134 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1122);
    float _1136 = -_1026;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1116);
    float _1140 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1118);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1144 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1146 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1148 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = _1102 + _1142;
    float _1152 = _1092 + _1144;
    float _1154 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1146);
    float _1156 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1150 + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1164 = _1152 + _1162;
    float _1166 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1168 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1130);
    float _1170 = _1160 * _1160;
    float _1172 = _1164 * _1164;
    float _1174 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1126);
    float _1180 = _1170 + _1172;
    float _1182 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1184 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1186 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1138);
    float _1188 = sqrt(_1180);
    float _1190 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    float _1192 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    float _1194 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1156);
    float _1196 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1166);
    float _1198 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1154);
    float _1200 = _1168 * _940;
    float _1202 = _1168 * _1006;
    float _1204 = _1082 * _1168;
    float _1206 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1184);
    float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1210 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1190);
    float _1212 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1196);
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1216 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1140);
    float _1218 = _1178 * _940;
    bool _1220 = _1188 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = _1178 * _1006;
    float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1226 = _1186 * _1006;
    float _1228 = _1082 * _1178;
    float _1230 = _850 + _1214;
    float _1232 = _1186 * _940;
    float _1234 = _1082 * _1186;
    float _1236 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1194);
    float _1238 = fma(_1216, _988, _1222);
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1242 = fma(_1192, _988, _1202);
    float _1244 = fma(_1198, _988, _1226);
    float _1246 = _1170;
    float _1248 = _1172;
    float _1250 = _1150;
    float _1252 = _1152;
    float _1254 = _1218;
    float _1256 = _1212;
    float _1258 = _1204;
    float _1260 = _1214;
    float _1262 = _1226;
    if (!_1220)
    {
        _990 = _1170;
    }
    float _1264 = _990;
    float _1266 = fma(_1216, _938, _1218);
    float _1268 = fma(_1084, _1216, _1228);
    float _1270 = _1264;
    if (!_1220)
    {
        _1246 = _1230;
    }
    float _1272 = _1246;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _1278 = !_1220;
    float _1280 = _1272;
    if (!_1278)
    {
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1286 = _1188 + _1284;
        float _1288 = rsqrt(_1180);
        float _1290 = _1286 * _1282;
        float _1292 = _1230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = _1290 * 0.15915493667125701904296875;
        float _1296 = _1294 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = _1294 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = fma(_1298, _1292, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1306 = _1288 * _1304;
        float _1308 = _1302 + (-1.0);
        float _1310 = fma(_1160, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1164, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1314 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1318 = _1310 + _1316;
        float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1322 = _1312 + _1320;
        float _1324 = fma(_1230, _1302, _1314);
        float _1326 = _1318 * _1318;
        float _1328 = _1322 * _1322;
        _1280 = _1324;
        _1270 = _1326;
        _1248 = _1328;
        _1250 = _1310;
        _1252 = _1312;
        _1254 = _1294;
    }
    float _1330 = _1280;
    float _1332 = _1270;
    float _1334 = _1248;
    float _1336 = _1250;
    float _1338 = _1252;
    float _1340 = _1254;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1344 = _1330 + _1342;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1348 = fma(_1192, _938, _1200);
    float _1350 = fma(_1198, _938, _1232);
    float _1352 = fma(_1344, _1344, _1332);
    float _1354 = _512 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1356 = _516 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1358 = _536 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1360 = _1352 + _1334;
    float _1362 = fma(_1084, _1192, _1204);
    float _1364 = fma(_1084, _1198, _1234);
    float _1366 = _456 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1368 = _618 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1370 = _488 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1372 = sqrt(_1360);
    float _1374 = _1356 * _1224;
    float _1376 = _1358 * _1240;
    float _1378 = _1366 * _1208;
    float _1380 = fma(_1236, _1036, _1238);
    float _1382 = fma(_1236, _942, _1266);
    float _1384 = fma(_1100, _1236, _1268);
    float _1386 = fma(_1210, _942, _1348);
    float _1388 = fma(_1212, _942, _1350);
    float _1390 = _1354 * _1276;
    float _1392 = _1368 * _1274;
    float _1394 = _1370 * _1346;
    float _1396 = fma(_1210, _1036, _1242);
    float _1398 = fma(_1100, _1210, _1362);
    float _1400 = fma(_1100, _1212, _1364);
    float _1402 = fma(_1212, _1036, _1244);
    out.m_87.x = _1378;
    out.m_87.y = _1374;
    out.m_87.z = _1394;
    out.m_87.w = _1376;
    bool _1404 = _1372 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1406 = isnan(_1372);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1412 = _1408 || _1410;
    out.m_89.x = _1392;
    out.m_89.y = _1390;
    out.m_91.x = _1382;
    out.m_91.y = _1386;
    out.m_91.z = _1388;
    out.m_93.x = _1384;
    out.m_93.y = _1398;
    out.m_93.z = _1400;
    float _1414 = _1340;
    if (!_1412)
    {
        _1256 = 1.0;
    }
    float _1416 = _1256;
    out.m_95.x = _1380;
    out.m_95.y = _1396;
    out.m_95.z = _1402;
    bool _1418 = !_1412;
    float _1420 = _1416;
    if (!_1418)
    {
        bool _1422 = _1372 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1424 = isnan(_1372);
        bool _1426 = _1422 || _1424;
        bool _1428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1430 = _1426 || _1428;
        if (!_1430)
        {
            float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1434 = _1372 + _1432;
            float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1438 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1436;
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1442 = _1440 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1444 = 1.0 / _1438;
            float _1446 = _1434 * _1444;
            float _1448 = fma(_1446, _1442, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1420 = _1448;
            _1450 = true;
        }
        else
        {
            bool _1452 = _1372 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1454 = isnan(_1372);
            bool _1456 = _1452 || _1454;
            bool _1458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1460 = _1456 || _1458;
            if (!_1460)
            {
                float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1464 = _1372 + _1462;
                float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1468 = _1466 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1474 = 1.0 / _1468;
                float _1476 = _1464 * _1474;
                float _1478 = fma(_1476, _1472, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1420 = _1478;
                _1450 = true;
            }
            else
            {
                _1420 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1450 = false;
    float _1480 = _1420;
    float _1482 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1484 = _1330 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1488 = _1336 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1492 = _1338 + _1490;
    float _1494 = _850 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1496 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1498 = fma(_1488, _1480, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1500 = fma(_1492, _1480, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1502 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1494);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1496 + _1504;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1498 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1500 + _1512;
    float _1516 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1502);
    float _1518 = _1506 * _1506;
    float _1520 = _850 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1522 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1524 = fma(_1510, _1510, _1518);
    float _1526 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1520);
    float _1528 = 1.0 / _1522;
    float _1530 = fma(_1514, _1514, _1524);
    float _1532 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1526);
    float _1534 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1536 = rsqrt(_1530);
    float _1538 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1540 = _1534 + _1522;
    float _1542 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1544 = _850 + _1542;
    float _1546 = _1540 * _1528;
    float _1548 = _1546 * 0.5;
    float _1550 = floor(_1538);
    float _1552 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1556 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1554);
    float _1558 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1560 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1552);
    float _1562 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1564 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1558);
    float _1566 = 1.0 / _1556;
    float _1568 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1560);
    float _1570 = _1510 * _1562;
    float _1572 = _1514 * _1562;
    float _1574 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1564);
    float _1576 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1578 = _1570 * _1570;
    float _1580 = _1572 * _1572;
    float _1582 = _1574 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1584 = trunc(_1576);
    int _1586 = int(_1584);
    float _1588 = -_1550;
    float _1590 = _1538 + _1588;
    float _1592 = _1578 + _1580;
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1596 = _1566 * _1594;
    float _1598 = sqrt(_1592);
    bool _1600 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1602 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1604 = trunc(_1582);
    int _1606 = int(_1604);
    int _1608 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1610 = _1586 + _1608;
    int _1612 = _1610 + 1;
    bool _1614 = _1598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1598 + _1616;
    int _1620 = 2;
    float _1622 = _1592;
    float _1624 = _1618;
    float _1626 = _1562;
    float _1628 = _1570;
    float _1630 = _1550;
    float _1632 = _1578;
    if (!_1600)
    {
        _1620 = 1;
    }
    int _1634 = _1620;
    float _1636 = sqrt(_1530);
    int _1638 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1640 = _1606 + _1638;
    int _1642 = _1640 + 1;
    float _1644 = _1542;
    int _1646 = _1634;
    if (_1614)
    {
        float _1648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1644 = _1648;
    }
    float _1650 = _1644;
    if (_1614)
    {
        float _1652 = rsqrt(_1592);
        _1622 = _1652;
    }
    float _1654 = _1622;
    float _1656 = _1654;
    if (_1614)
    {
        float _1658 = _1618 * _1650;
        _1624 = _1658;
    }
    float _1660 = _1624;
    if (_1614)
    {
        float _1662 = _1660 * 0.15915493667125701904296875;
        _1258 = _1662;
    }
    float _1664 = _1258;
    bool _1666 = !_1600;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1672 = _1568;
    if (_1614)
    {
        float _1674 = _1664 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        _1672 = _1676;
    }
    float _1678 = _1672;
    if (!_1602)
    {
        _1646 = _1668;
    }
    int _1680 = _1646;
    float _1682 = precise::max(0.0, _1670);
    int _1684 = _1680 << 6;
    bool _1686 = _1612 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1688 = -_1562;
    float _1690 = -_1682;
    float _1692 = fma(_1506, _1688, _1690);
    int _1694 = _1684 + 48;
    uint _1697 = uint(int(uint(_1694) >> uint(2)));
    uint _1699 = uint(int(uint(int(_1697)) >> uint(2)));
    int _1701 = int(_1697) & 3;
    float _1703 = (*spvDescriptorSet0.vp_c15)._m0[int(_1699)][_1701];
    int _1705 = int(_1697) + 1;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    int _1709 = _1705 & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    int _1713 = _1612 | _1642;
    float _1715 = _1664;
    float _1717 = as_type<float>(_1713);
    if (_1614)
    {
        float _1719 = _1664 * 6.283185482025146484375;
        float _1721 = cos(_1719);
        _1715 = _1721;
    }
    float _1723 = _1715;
    if (_1614)
    {
        float _1725 = _1692 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1725;
    }
    float _1727 = _1626;
    bool _1729 = _1713 < 0;
    bool _1731 = _1729 || _1686;
    if (_1614)
    {
        float _1733 = fma(_1678, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1717 = _1733;
    }
    float _1735 = _1717;
    int _1737 = _1684 + 96;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    uint _1741 = uint(int(uint(int(_1739)) >> uint(2)));
    int _1743 = int(_1739) & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    int _1747 = int(_1739) + 1;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    int _1751 = _1747 & 3;
    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[int(_1749)][_1751];
    float _1755 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1757 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1614)
    {
        float _1759 = _1654 * _1735;
        _1260 = _1759;
    }
    float _1761 = _1260;
    bool _1763 = _1642 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1765 = _1763 || _1731;
    float _1767 = floor(_1755);
    float _1769 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1757);
    if (_1614)
    {
        float _1771 = _1570 * _1761;
        _1628 = _1771;
    }
    float _1773 = _1628;
    int _1775 = _1684 + 64;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    uint _1779 = uint(int(uint(int(_1777)) >> uint(2)));
    int _1781 = int(_1777) & 3;
    float _1783 = (*spvDescriptorSet0.vp_c15)._m0[int(_1779)][_1781];
    int _1785 = int(_1777) + 1;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    int _1789 = _1785 & 3;
    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
    if (!_1614)
    {
        _1630 = _1692;
    }
    float _1793 = _1630;
    float _1795 = _1793;
    float _1797 = _1723;
    if (_1614)
    {
        float _1799 = _1723 + (-1.0);
        _1656 = _1799;
    }
    float _1801 = _1656;
    float _1803 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1769);
    float _1805 = _1801;
    if (_1614)
    {
        float _1807 = _1773 * _1773;
        _1632 = _1807;
    }
    float _1809 = _1632;
    if (_1614)
    {
        float _1811 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1811;
    }
    float _1813 = _1262;
    if (!_1614)
    {
        _1805 = _1572;
    }
    float _1815 = _1805;
    int _1817 = _1684 + 104;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    float _1835 = _1815;
    if (_1614)
    {
        float _1837 = _1572 * _1761;
        _1835 = _1837;
    }
    float _1839 = _1835;
    if (_1614)
    {
        float _1841 = fma(_1692, _1723, _1813);
        _1795 = _1841;
    }
    float _1843 = _1795;
    float _1845 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1614)
    {
        _1797 = _1580;
    }
    float _1847 = _1797;
    float _1849 = _1847;
    if (_1614)
    {
        float _1851 = _1839 * _1839;
        _1849 = _1851;
    }
    float _1853 = _1849;
    float _1855 = fma(_1843, _1843, _1809);
    float _1857 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1859 = _1684 + 80;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    uint _1863 = uint(int(uint(int(_1861)) >> uint(2)));
    int _1865 = int(_1861) & 3;
    float _1867 = (*spvDescriptorSet0.vp_c15)._m0[int(_1863)][_1865];
    int _1869 = int(_1861) + 1;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    int _1873 = _1869 & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    float _1877 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1879 = -_1767;
    float _1881 = _1755 + _1879;
    float _1883 = _1855 + _1853;
    int _1885 = as_type<int>(_1877);
    if (!_1765)
    {
        float _1887 = floor(_1582);
        _1414 = _1887;
    }
    float _1889 = _1414;
    float _1891 = -_1877;
    float _1893 = fma(_1891, _1857, 1.0);
    if (!_1765)
    {
        int _1895 = _1642 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1897 = _1895 + _1612;
        _1885 = _1897;
    }
    int _1899 = _1885;
    int _1901 = _1684 + 56;
    uint _1903 = uint(int(uint(_1901) >> uint(2)));
    uint _1905 = uint(int(uint(int(_1903)) >> uint(2)));
    int _1907 = int(_1903) & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    int _1911 = int(_1903) + 1;
    uint _1913 = uint(int(uint(_1911) >> uint(2)));
    int _1915 = _1911 & 3;
    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[int(_1913)][_1915];
    float _1919 = log2(_1893);
    int _1921 = _1684 + 72;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    uint _1925 = uint(int(uint(int(_1923)) >> uint(2)));
    int _1927 = int(_1923) & 3;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[int(_1925)][_1927];
    int _1931 = int(_1923) + 1;
    uint _1933 = uint(int(uint(_1931) >> uint(2)));
    int _1935 = _1931 & 3;
    float _1937 = (*spvDescriptorSet0.vp_c15)._m0[int(_1933)][_1935];
    float _1939 = _1544 * _1711;
    float _1941 = rsqrt(_1883);
    float _1943 = fma(_1102, _1703, _1939);
    int _1945 = as_type<int>(_1939);
    if (!_1765)
    {
        int _1947 = _1899 << 2;
        _1945 = _1947;
    }
    int _1949 = _1945;
    int _1951 = _1684 + 88;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[int(_1955)][_1957];
    int _1961 = int(_1953) + 1;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    int _1965 = _1961 & 3;
    float _1967 = (*spvDescriptorSet0.vp_c15)._m0[int(_1963)][_1965];
    float _1969 = _1544 * _1753;
    int _1971 = _1949;
    int _1973 = as_type<int>(_1745);
    if (!_1765)
    {
        int _1975 = 12 & _1949;
        _1971 = _1975;
    }
    int _1977 = _1971;
    float _1979 = _1919 * 0.693147182464599609375;
    float _1981 = fma(_1102, _1745, _1969);
    float _1983 = _1544 * _1791;
    float _1985 = _1791;
    int _1987 = as_type<int>(_1875);
    if (!_1765)
    {
        float _1989 = -_1889;
        float _1991 = _1582 + _1989;
        _1985 = _1991;
    }
    float _1993 = _1985;
    float2 _5920 = float2(_1590, _1881);
    float _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5920, float2(0.0), isnan(_5920)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5920, float2(0.0), isnan(_5920)), level(0.0)).x;
    float _1997 = fma(_1102, _1783, _1983);
    float _1999 = _1941 * _1773;
    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2003 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2001);
    float _2005 = precise::clamp(_2003, 0.0, 1.0);
    float _2007 = _1941 * _1843;
    float _2009 = fma(_1092, _1825, _1981);
    float _2011 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2013 = _1941 * _1839;
    float _2015 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2017 = _2009 + _1833;
    float _2019 = -_2011;
    float _2021 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2019);
    float _2023 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2025 = _1544 * _1875;
    float _2027 = _2013;
    if (!_1765)
    {
        uint _2029 = uint(int(uint(_1899) >> uint(2)));
        _1987 = int(_2029);
    }
    int _2031 = _1987;
    float _2033 = 1.0 / _2017;
    float _2035 = fma(_1102, _1867, _2025);
    float _2037 = -_2005;
    float _2039 = _2037 + 1.0;
    if (!_1765)
    {
        int _2041 = _2031 << 4;
        int _2043 = _2041 + _1977;
        _1973 = _2043;
    }
    int _2045 = _1973;
    float _2047 = -_2013;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2021);
    float _2051 = fma(_1092, _1909, _1943);
    if (!_1765)
    {
        float _2053 = floor(_1576);
        _2027 = _2053;
    }
    float _2055 = _2027;
    float _2057 = fma(_2049, -0.5, 0.5);
    float _2059 = _2051 + _1917;
    float _2061 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2063 = _2051;
    if (!_1765)
    {
        int _2065 = _2045 + 400;
        uint _2067 = uint(int(uint(_2065) >> uint(2)));
        uint _2069 = uint(int(uint(int(_2067)) >> uint(2)));
        int _2071 = int(_2067) & 3;
        float _2073 = (*spvDescriptorSet0.vp_c15)._m0[int(_2069)][_2071];
        _2063 = _2073;
    }
    float _2075 = _2063;
    float _2077 = fma(_2049, 0.5, 0.5);
    float _2079 = fma(_1092, _1929, _1997);
    float _2081 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2061);
    float _2083 = abs(_2039);
    float _2085 = log2(_2083);
    float _2087 = fma(_2077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2089 = _2079 + _1937;
    float _2091 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2093 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2081);
    float _2095 = fma(_2077, _2087, -0.212114393711090087890625);
    float _2097 = fma(_1092, _1959, _2035);
    float _2099 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2091);
    float _2101 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2023);
    float _2103 = _2059 * _2033;
    float _2105 = _2097 + _1967;
    float _2107 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2099);
    float _2109 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2111 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2101);
    bool _2113 = _2103 >= 0.0;
    float _2115 = _2107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2117 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2119 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2121 = _2103 <= 1.0;
    bool _2123 = _2121 && _2113;
    float _2125 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2127 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2117);
    float _2129 = _2089 * _2033;
    float _2131 = _2007 + 1.0;
    float _2133 = exp2(_2119);
    float _2135 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2127);
    float _2137 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2139 = _2129 >= 0.0;
    bool _2141 = _2139 && _2123;
    float _2143 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2145 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2135);
    float _2147 = fma(_2077, _2095, 1.570728778839111328125);
    bool _2149 = _2129 <= 1.0;
    bool _2151 = _2149 && _2141;
    float _2153 = sqrt(_2057);
    float _2155 = _2105 * _2033;
    float _2157 = -_2007;
    float _2159 = fma(_2133, _2131, _2157);
    float _2161 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2137);
    float _2163 = 1.0 / _2145;
    float _2165 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2143);
    float _2167 = _2137;
    float _2169 = _2145;
    if (_2151)
    {
        float _2171 = float(_1680);
        _2167 = _2171;
    }
    float _2173 = _2167;
    float _2175 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2161);
    float _2177 = fma(_2159, 0.5, 0.5);
    float _2179 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2165);
    float _2181 = _2153 * 0.636619746685028076171875;
    float _2183 = _2173;
    float _2185 = _2175;
    if (_2151)
    {
        float _2187 = rint(_2173);
        float _2189 = precise::max(_2187, 0.0);
        uint _2191 = uint(_2189);
        uint _2193 = clamp(_2191, 0u, 65535u);
        _2183 = as_type<float>(_2193);
    }
    float _2195 = _2183;
    float _2197 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2179);
    float _2199 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2175);
    float _2201 = -_2147;
    float _2203 = fma(_2181, _2201, 1.0);
    float _2205 = _2197;
    float _2207 = _2199;
    if (!_1765)
    {
        float _2209 = -_2055;
        float _2211 = _1576 + _2209;
        _2185 = _2211;
    }
    float _2213 = _2185;
    float _2215 = _2197 * _2163;
    float _2217 = _2199 * _2163;
    float _2219 = _2075;
    if (!_1765)
    {
        float _2221 = rint(_2075);
        float _2223 = precise::max(_2221, 0.0);
        uint _2225 = uint(_2223);
        uint _2227 = clamp(_2225, 0u, 65535u);
        _2219 = as_type<float>(_2227);
    }
    float _2229 = _2219;
    float _2231 = fma(_2215, 0.5, 0.5);
    float _2233 = fma(_2217, -0.5, 0.5);
    float _2235 = _2195;
    if (_2151)
    {
        float3 _6330 = float3(_2103, _2129, float(as_type<int>(_2195)));
        float3 _6334 = select(_6330, float3(0.0), isnan(_6330));
        float _2237 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6334.xy, uint(rint(_6334.z)), _2155, level(0.0));
        _2235 = _2237;
    }
    float _2239 = _2235;
    float3 _6344 = float3(_2231, _2233, _2015);
    float _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6344, float3(0.0), isnan(_6344)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6344, float3(0.0), isnan(_6344)), level(0.0)).x;
    float3 _6353 = float3(_2231, _2233, _2015);
    float4 _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6353, float3(0.0), isnan(_6353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6353, float3(0.0), isnan(_6353)), level(0.0)).xyzw;
    float _2246 = _2244.x;
    float _2248 = _2244.y;
    float _2250 = _2244.z;
    float _2252 = _2244.w;
    float2 _6369 = float2(_2203, _2177);
    float3 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6369, float2(0.0), isnan(_6369)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6369, float2(0.0), isnan(_6369)), level(0.0)).xyz;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    float _2264 = _2213;
    if (!_1765)
    {
        float3 _6390 = float3(_2213, _1993, float(as_type<int>(_2229)));
        float3 _6392 = select(_6390, float3(0.0), isnan(_6390));
        float _2266 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6392.xy, uint(rint(_6392.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6392.xy, uint(rint(_6392.z)), level(0.0)).x;
        _2264 = _2266;
    }
    float _2268 = _2264;
    float _2270 = abs(_1596);
    float _2272 = log2(_2270);
    float _2274 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2276 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2278 = exp2(_2274);
    float _2280 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2276);
    bool _2282 = _1596 <= 8000.0;
    bool _2284 = isnan(_1596);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(8000.0);
    bool _2290 = _2286 || _2288;
    float _2292 = float(_2290);
    float _2294 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2280);
    float _2296 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2298 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2294);
    float _2300 = exp2(_2296);
    out.gl_Position.x = _2197;
    out.gl_Position.y = _2199;
    out.gl_Position.z = _2298;
    out.gl_Position.w = _2145;
    float _2302 = -_2278;
    float _2304 = _2302 + 1.0;
    float _2306 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2308 = _2298;
    if (_1765)
    {
        _2205 = 1.0;
    }
    float _2310 = _2205;
    float _2312 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2314 = precise::clamp(_2312, 0.0, 1.0);
    float _2316 = fma(_2314, -2.0, 3.0);
    float _2318 = _2314 * _2314;
    float _2320 = _2318 * _2316;
    float _2322 = -_2320;
    float _2324 = _2322 + 1.0;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2320);
    float _2328 = _2324;
    float _2330 = _2310;
    if (!_2151)
    {
        _2328 = 1.0;
    }
    float _2332 = _2328;
    float _2334 = _2292 * _2326;
    float _2336 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2338 = -_1995;
    float _2340 = _2338 + 1.0;
    float _2342 = _2340 * _2336;
    float _2344 = precise::clamp(_2342, 0.0, 1.0);
    float _2346 = _2332;
    float _2348 = _2336;
    if (_2151)
    {
        bool _2350 = _2239 >= _2155;
        bool _2352 = isnan(_2239);
        bool _2354 = _2350 || _2352;
        bool _2356 = isnan(_2155);
        bool _2358 = _2354 || _2356;
        float _2360 = float(_2358);
        _2346 = _2360;
    }
    float _2362 = _2346;
    if (!_1765)
    {
        int _2364 = _1899 << 4;
        int _2366 = _2364 + 2048;
        uint _2368 = uint(int(uint(_2366) >> uint(2)));
        uint _2370 = uint(int(uint(int(_2368)) >> uint(2)));
        int _2372 = int(_2368) & 3;
        float _2374 = (*spvDescriptorSet0.vp_c15)._m0[int(_2370)][_2372];
        int _2376 = int(_2368) + 1;
        uint _2378 = uint(int(uint(_2376) >> uint(2)));
        int _2380 = _2376 & 3;
        float _2382 = (*spvDescriptorSet0.vp_c15)._m0[int(_2378)][_2380];
        int _2384 = _2366 + 8;
        uint _2386 = uint(int(uint(_2384) >> uint(2)));
        uint _2388 = uint(int(uint(int(_2386)) >> uint(2)));
        int _2390 = int(_2386) & 3;
        float _2392 = (*spvDescriptorSet0.vp_c15)._m0[int(_2388)][_2390];
        int _2394 = int(_2386) + 1;
        uint _2396 = uint(int(uint(_2394) >> uint(2)));
        int _2398 = _2394 & 3;
        float _2400 = (*spvDescriptorSet0.vp_c15)._m0[int(_2396)][_2398];
        float _2402 = _1544 * _2382;
        float _2404 = fma(_1102, _2374, _2402);
        float _2406 = fma(_1092, _2392, _2404);
        float _2408 = _2406 + _2400;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        float _2412 = -_2410;
        float _2414 = _2412 + _2268;
        float _2416 = fma(_2414, 500.0, 1.5);
        float _2418 = exp2(_2416);
        float _2420 = 0.0 + _2418;
        float _2422 = precise::clamp(_2420, 0.0, 1.0);
        _2330 = _2422;
        _2169 = _2400;
        _2207 = _2382;
        _2308 = _2392;
    }
    float _2424 = _2330;
    float _2426 = _2169;
    float _2428 = _2207;
    float _2430 = _2308;
    float _2432 = _2362 * _2424;
    float _2434 = _2306 * _2241;
    float _2436 = -_2344;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2440 = -_2306;
    float _2442 = _2440 + 1.0;
    bool _2444 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2446 = isnan(_1636);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2452 = _2448 || _2450;
    float _2454 = _2252 * _2434;
    float _2456 = -_2432;
    float _2458 = fma(_2456, _2438, 1.0);
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    float _2462 = _2262 * _2434;
    float _2464 = _2252 * _2442;
    float _2466 = fma(_2258, _2454, _2246);
    float _2468 = fma(_2260, _2454, _2248);
    float _2470 = _2460 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2472 = fma(_2252, _2462, _2250);
    out.m_97.x = _2470;
    float _2474 = _2426;
    float _2476 = _2430;
    float _2478 = _2428;
    float _2480 = _2460;
    float _2482 = _2454;
    if (!_2452)
    {
        _2348 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2484 = _2348;
    float _2486 = _2484;
    float _2488 = _2484;
    if (!_2452)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2490 = _2474;
    out.m_99.x = _2466;
    out.m_99.y = _2468;
    out.m_99.z = _2472;
    out.m_99.w = _2464;
    float _2492 = _2490;
    float _2494 = _2490;
    if (!_2452)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2496 = _2476;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2452)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2502 = _2478;
    float _2504 = _2502;
    float _2506 = _2502;
    if (!_2452)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2508 = _2480;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2452)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2514 = _2482;
    bool _2516 = !_2452;
    float _2518 = _2514;
    float _2520 = _2514;
    if (!_2516)
    {
        bool _2522 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2524 = isnan(_1636);
        bool _2526 = _2522 || _2524;
        bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2530 = _2526 || _2528;
        if (!_2530)
        {
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2534 = _1636 + _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2538 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2536;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2544 = 1.0 / _2538;
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2562 = _2534 * _2544;
            float _2564 = precise::clamp(_2562, 0.0, 1.0);
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2570 = fma(_2564, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2572 = fma(_2564, _2568, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2574 = fma(_2564, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2576 = fma(_2564, _2552, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2578 = fma(_2564, _2556, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2580 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2494 = _2574;
            _2512 = _2578;
            _2488 = _2570;
            _2506 = _2576;
            _2500 = _2572;
            _2520 = _2580;
            _2582 = true;
        }
        else
        {
            bool _2584 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2586 = isnan(_1636);
            bool _2588 = _2584 || _2586;
            bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2592 = _2588 || _2590;
            if (!_2592)
            {
                _2486 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2594 = _2486;
            _2488 = _2594;
            if (!_2592)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2596 = _2492;
            _2494 = _2596;
            if (!_2592)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2598 = _2498;
            _2500 = _2598;
            if (!_2592)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2600 = _2504;
            _2506 = _2600;
            if (!_2592)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2602 = _2510;
            _2512 = _2602;
            if (!_2592)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2604 = _2518;
            bool _2606 = !_2592;
            _2520 = _2604;
            if (!_2606)
            {
                bool _2608 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2610 = isnan(_1636);
                bool _2612 = _2608 || _2610;
                bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2616 = _2612 || _2614;
                if (!_2616)
                {
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2620 = _1636 + _2618;
                    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2624 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2622;
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2630 = 1.0 / _2624;
                    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2648 = _2620 * _2630;
                    float _2650 = precise::clamp(_2648, 0.0, 1.0);
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2656 = fma(_2650, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2658 = fma(_2650, _2654, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2660 = fma(_2650, _2634, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2662 = fma(_2650, _2638, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2664 = fma(_2650, _2642, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2666 = fma(_2650, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2494 = _2660;
                    _2512 = _2664;
                    _2488 = _2656;
                    _2506 = _2662;
                    _2500 = _2658;
                    _2520 = _2666;
                    _2582 = true;
                }
                else
                {
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2488 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2582 = false;
    float _2668 = _2494;
    float _2670 = _2512;
    float _2672 = _2488;
    float _2674 = _2506;
    float _2676 = _2500;
    float _2678 = _2520;
    float _2680 = fma(_1396, -0.5, 0.5);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = -_2668;
    float _2686 = _2684 + _2670;
    float _2688 = -_2672;
    float _2690 = _2688 + _2674;
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    bool _2696 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2698 = fma(_2682, _2686, _2668);
    float _2700 = fma(_2682, _2690, _2672);
    float _2702 = fma(_2682, _2694, _2676);
    float _2704 = _2698 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2706 = fma(_2700, 0.298911988735198974609375, _2704);
    float _2708 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2710 = fma(_2702, 0.114477999508380889892578125, _2706);
    out.m_97.w = _2708;
    float _2712 = -_2710;
    float _2714 = _2700 + _2712;
    float _2716 = -_2710;
    float _2718 = _2698 + _2716;
    float _2720 = -_2710;
    float _2722 = _2702 + _2720;
    out.m_101.x = 0.0;
    float _2724 = fma(_2714, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2726 = fma(_2718, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2728 = fma(_2722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    out.m_103.x = _2724;
    out.m_103.y = _2726;
    out.m_103.z = _2728;
    if (!_2696)
    {
        return out;
    }
    float _2730 = -_1496;
    float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2734 = -_1498;
    float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2738 = -_1500;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2742 = _2732 * _2732;
    float _2744 = fma(_2736, _2736, _2742);
    float _2746 = fma(_2740, _2740, _2744);
    float _2748 = sqrt(_2746);
    float _2750 = rsqrt(_2746);
    float _2752 = -_2748;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2756 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2758 = precise::clamp(_2756, 0.0, 1.0);
    float _2760 = _2736 * _2750;
    float _2762 = _2732 * _2750;
    float _2764 = abs(_2758);
    float _2766 = log2(_2764);
    float _2768 = _2740 * _2750;
    float _2770 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2772 = _1396 * _2762;
    float _2774 = -_2762;
    float _2776 = -_2770;
    float _2778 = fma(_2774, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2776);
    float _2780 = fma(_1380, _2760, _2772);
    float _2782 = -_2768;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2778);
    float _2786 = fma(_1402, _2768, _2780);
    float _2788 = precise::clamp(_2786, 0.0, 1.0);
    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2792 = _2784 + _2790;
    float _2794 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2796 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = exp2(_2794);
    float _2802 = _2800 * _2798;
    float _2804 = _2788 * _2802;
    float _2806 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2808 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2810 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2806;
    out.m_101.y = _2808;
    out.m_101.z = _2810;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2582 = false;
    bool _1450 = false;
    bool _378 = false;
    bool _200 = false;
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
        float _2867 = as_type<float>(_138);
        out.gl_Position.z = _2867;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_63.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2936 = as_type<float>(_176);
        out.gl_Position.z = _2936;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_65.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_122);
        float _204 = 1.0 / _202;
        float _206 = _156 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _208 + _210;
    bool _214 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _216 = isnan(_208);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _208 + _226;
    bool _230 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_208);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_208);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_224;
    float _264 = _262 + 1.0;
    float _266 = 1.0 / _248;
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = 1.0 / _244;
    float _282 = _240 * _272;
    float _284 = -_240;
    float _286 = _284 + 1.0;
    float _288 = _228 * _266;
    float _290 = _212 * _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _296;
    float _300 = fma(_276, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_294, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = fma(_298, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = _300 * _282;
    float _308 = _302 * _282;
    float _310 = _304 * _282;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _306);
    float _326 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _308);
    float _328 = fma(_314, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _330 = fma(_318, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _332 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _334 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _310);
    float _336 = fma(_328, _268, _324);
    float _338 = fma(_330, _268, _326);
    float _340 = fma(_332, _268, _334);
    float _342 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].x, _336);
    float _344 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].y, _338);
    float _346 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].z, _340);
    bool _348 = !_278;
    int _350 = as_type<int>(_340);
    int _352 = as_type<int>(_336);
    float _354 = _290;
    bool _356 = _278;
    float _374;
    float _376;
    if (!_348)
    {
        float _358 = in.m_65.x;
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _358 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _366;
        _376 = _372;
        _378 = true;
    }
    else
    {
        float _380 = float(_122);
        float _382 = 1.0 / _380;
        float _384 = _156 * _382;
        _374 = _382;
        _376 = _384;
    }
    _378 = false;
    float _386 = _374;
    float _388 = _376;
    float _390 = in.m_67.x;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _394 = _392 != 0;
    float _396 = in.m_65.x;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _400 = _398 != 0;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _404 = _402 != 0;
    float _406 = in.m_67.y;
    float _408 = in.m_65.z;
    float _410 = in.m_65.w;
    float _412 = _386;
    float _414 = _406;
    if (_394)
    {
        float _416 = in.m_65.z;
        _412 = _416;
    }
    float _418 = _412;
    float _420 = in.m_65.y;
    float _422 = _390;
    if (_394)
    {
        float _424 = -_390;
        float _426 = _424 + 1.0;
        _350 = as_type<int>(_426);
    }
    int _428 = _350;
    if (_400)
    {
        float _430 = -_390;
        float _432 = _430 + 1.0;
        _352 = as_type<int>(_432);
    }
    int _434 = _352;
    if (!_394)
    {
        _354 = _390;
    }
    float _436 = _354;
    float _438 = in.m_69.z;
    float _440 = _436;
    if (_400)
    {
        bool _442 = _396 > 0.5;
        _356 = _442;
    }
    bool _444 = _356;
    float _446 = 0.0;
    if (!_400)
    {
        _446 = _390;
    }
    float _448 = _446;
    float _450 = in.m_69.y;
    float _452 = _448;
    if (_400)
    {
        float _454 = _444 ? as_type<float>(_434) : _390;
        _452 = _454;
    }
    float _456 = _452;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _460 = _458 != 0;
    float _462 = in.m_69.x;
    bool _464 = _408 > 0.5;
    bool _466 = _410 > 0.5;
    float _468 = in.m_58.x;
    float _470 = in.m_58.y;
    float _472 = in.m_58.z;
    bool _474 = false;
    if (_394)
    {
        bool _476 = _418 > 0.5;
        _474 = _476;
    }
    bool _478 = _474;
    float _480 = in.m_71.x;
    float _482 = in.m_71.y;
    float _484 = in.m_71.z;
    if (_394)
    {
        float _486 = _478 ? as_type<float>(_428) : _390;
        _440 = _486;
    }
    float _488 = _440;
    float _490 = -_406;
    float _492 = _490 + 1.0;
    bool _494 = _420 > 0.5;
    float _496 = in.m_69.w;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _500 = _498 != 0;
    float _502 = _420 * 2.0;
    int _504 = _464 ? as_type<int>(_492) : as_type<int>(_406);
    out.m_73.z = _438;
    int _506 = _494 ? as_type<int>(_492) : as_type<int>(_406);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _510 = _508 != 0;
    out.m_73.y = _450;
    float _512 = _500 ? as_type<float>(_504) : _406;
    float _514 = floor(_502);
    float _516 = _404 ? as_type<float>(_506) : _406;
    float _518 = _408 * 2.0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _530 = _528 != 0;
    out.m_73.x = _462;
    float _532 = _470 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_460)
    {
        float _534 = _466 ? _492 : _406;
        _414 = _534;
    }
    float _536 = _414;
    float _538 = floor(_518);
    float _540 = _470 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _542 = _346 * _484;
    float _544 = _344 * _482;
    float _546 = _342 * _480;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _556 = _470 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _560 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].x, _532);
    float _562 = 1.0 / _554;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _568 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _570 = _538 > 0.0;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
    float _578 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].x, _540);
    float _580 = _420 + _408;
    float _582 = _396 * 2.0;
    out.m_75.x = _568;
    out.m_75.y = _572;
    out.m_75.z = _574;
    bool _584 = _538 >= 0.0;
    bool _586 = isnan(_538);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = _580 + (-1.0);
    int _596 = as_type<int>(_538);
    if (_510)
    {
        float _598 = -_390;
        float _600 = _598 + 1.0;
        _596 = as_type<int>(_600);
    }
    int _602 = _596;
    out.m_73.w = _496;
    float _604 = _550 * _562;
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _608 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = in.m_77.x;
    float _612 = in.m_77.y;
    float _614 = in.m_77.z;
    if (_510)
    {
        float _616 = _494 ? as_type<float>(_602) : _390;
        _422 = _616;
    }
    float _618 = _422;
    float _620 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _622 = _514 >= 0.0;
    bool _624 = isnan(_514);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = _396 + _420;
    float _634 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _636 = log2(_634);
    float _638 = _396 + _408;
    float _640 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _642 = _632 + (-1.0);
    float _644 = _396 + (-0.5);
    float _646 = _638 + (-1.0);
    float _648 = _420 + (-0.5);
    float _650 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _652 = floor(_582);
    int _654 = _592 ? 0 : 1;
    float _656 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _658 = _408 + (-0.5);
    int _660 = ~_654;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    int _666 = _664;
    float _668 = _658;
    if (!_570)
    {
        int _670 = ~_654;
        int _672 = _670 + 1;
        _666 = _672;
    }
    int _674 = _666;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _388 + _676;
    float _680 = _636 * _156;
    bool _682 = _514 > 0.0;
    float _684 = fma(_604, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _686 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _688 = isnan(_388);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _610);
    float _700 = exp2(_680);
    bool _702 = _652 > 0.0;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _614);
    float _706 = _698 * _620;
    bool _708 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _710 = isnan(_388);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_696;
    float _722 = _720 + 1.0;
    bool _724 = _652 >= 0.0;
    bool _726 = isnan(_652);
    bool _728 = _724 || _726;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _612);
    float _736 = _718 * _722;
    float _738 = float(_674);
    float _740 = _734 * _608;
    float _742 = _704 * _640;
    float _744 = _684 * _736;
    bool _746 = !_522;
    int _748 = _746 ? 0 : 1;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _752 = 1.0 + _750;
    float _754 = -_700;
    float _756 = _754 + 1.0;
    float _758 = -_718;
    float _760 = _758 + 1.0;
    int _762 = abs(_748);
    float _764 = 1.0 / _752;
    float _766 = in.m_79.x;
    float _768 = in.m_79.y;
    float _770 = in.m_79.z;
    bool _772 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _774 = isnan(1.0);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _780 = _776 || _778;
    float _782 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[115].x, _744);
    float _784 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
    int _786 = _732 ? 0 : 1;
    float _788 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[116].x, _782);
    float _790 = float(_762);
    float _792 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[5].z, _576);
    bool _794 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _802 = _798 || _800;
    float _804 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
    bool _806 = !_526;
    int _808 = _806 ? 0 : 1;
    float _810 = _790 * _738;
    float _812 = _802 ? _756 : 0.0;
    float _814 = in.m_81.x;
    float _816 = in.m_81.y;
    float _818 = in.m_81.z;
    int _820 = ~_786;
    int _822 = _820 + 1;
    int _824 = _822 + 1;
    float _826 = _810 * (-2.0);
    int _828 = _824;
    float _830 = _826;
    if (!_702)
    {
        int _832 = ~_786;
        int _834 = _832 + 1;
        _828 = _834;
    }
    int _836 = _828;
    if (_780)
    {
        float _838 = _812 * _764;
        _160 = _838;
    }
    float _840 = _160;
    bool _842 = !_530;
    int _844 = _842 ? 0 : 1;
    float _846 = fma(_650, _826, _650);
    int _848 = abs(_808);
    float _850 = _792 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _852 = abs(_844);
    float _854 = fma(_826, _766, _766);
    float _856 = float(_848);
    float _858 = float(_836);
    float _860 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _854);
    int _862 = _630 ? 0 : 1;
    float _864 = _856 * _858;
    int _866 = ~_862;
    int _868 = _866 + 1;
    int _870 = _868 + 1;
    float _872 = fma(_846, _840, _860);
    int _874 = _870;
    float _876 = _864;
    if (!_682)
    {
        int _878 = ~_862;
        int _880 = _878 + 1;
        _874 = _880;
    }
    int _882 = _874;
    bool _884 = _612 != 0.0;
    bool _886 = isnan(_612);
    bool _888 = _884 || _886;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    float _894 = _872 * 0.15915493667125701904296875;
    float _896 = float(_852);
    float _898 = _864 * (-2.0);
    float _900 = float(_882);
    bool _902 = _610 == 0.0;
    bool _904 = !_892;
    bool _906 = _902 && _904;
    float _908 = fma(_898, _768, _768);
    float _910 = fma(_606, _898, _606);
    float _912 = _896 * _900;
    bool _914 = _614 == 0.0;
    bool _916 = _914 && _906;
    float _918 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].y, _908);
    float _920 = _894 * 6.283185482025146484375;
    float _922 = sin(_920);
    float _924 = _912 * (-2.0);
    float _926 = fma(_910, _840, _918);
    float _928 = fma(_924, _770, _770);
    float _930 = fma(_656, _924, _656);
    float _932 = _926 * 0.15915493667125701904296875;
    float _934 = _894 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = in.m_83.x;
    float _940 = in.m_83.y;
    float _942 = in.m_83.z;
    float _944 = in.m_83.w;
    float _946 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].z, _928);
    float _948 = _908;
    float _950 = _898;
    if (_916)
    {
        _830 = _814;
    }
    float _952 = _830;
    float _954 = _952;
    if (_916)
    {
        _948 = _816;
    }
    float _956 = _948;
    float _958 = fma(_930, _840, _946);
    float _960 = _956;
    if (_916)
    {
        _950 = _952;
    }
    float _962 = _950;
    float _964 = _932 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _962;
    if (!_916)
    {
        _954 = _814;
    }
    float _970 = _954;
    float _972 = _958 * 0.15915493667125701904296875;
    float _974 = 0.0;
    if (_916)
    {
        _974 = _818;
    }
    float _976 = _974;
    float _978 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _980 = _976;
    if (_916)
    {
        _876 = _956;
    }
    float _982 = _876;
    float _984 = _982;
    if (!_916)
    {
        float _986 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _970);
        _968 = _986;
    }
    float _988 = _968;
    float _990 = _988;
    if (_916)
    {
        _668 = _976;
    }
    float _992 = _668;
    float _994 = _932 * 6.283185482025146484375;
    float _996 = cos(_994);
    float _998 = _992;
    if (!_916)
    {
        _960 = _816;
    }
    float _1000 = _960;
    if (!_916)
    {
        _980 = _818;
    }
    float _1002 = _980;
    if (!_916)
    {
        float _1004 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1000);
        _984 = _1004;
    }
    float _1006 = _984;
    float _1008 = _972 * 6.283185482025146484375;
    float _1010 = cos(_1008);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1014 = _940 * _1002;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1018 = _938 * _1000;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _972 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _942 * _970;
    if (!_916)
    {
        float _1034 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1002);
        _998 = _1034;
    }
    float _1036 = _998;
    float _1038 = -_1014;
    float _1040 = fma(_942, _1000, _1038);
    float _1042 = -_1018;
    float _1044 = fma(_940, _970, _1042);
    float _1046 = _936 * _996;
    float _1048 = _936 * _1010;
    float _1050 = _922 * _966;
    float _1052 = -_1032;
    float _1054 = fma(_938, _1002, _1052);
    out.m_85.x = _1022;
    out.m_85.y = _1028;
    out.m_85.z = _1030;
    out.m_85.w = _978;
    float _1056 = _936 * _966;
    float _1058 = _922 * _996;
    float _1060 = _996 * _1010;
    float _1062 = _922 * _1010;
    float _1064 = fma(_1026, _1046, _1050);
    float _1066 = fma(_1026, _1050, _1046);
    float _1068 = -_1056;
    float _1070 = fma(_1026, _1058, _1068);
    float _1072 = -_1058;
    float _1074 = fma(_1026, _1056, _1072);
    float _1076 = -_740;
    float _1078 = _1026 * _1076;
    float _1080 = _966 * _1010;
    float _1082 = _1054 * _944;
    float _1084 = _1040 * _944;
    float _1086 = fma(_1060, _706, _1078);
    float _1088 = _1048 * _740;
    float _1090 = _1062 * _740;
    float _1092 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1094 = fma(_1080, _742, _1086);
    float _1096 = fma(_1064, _706, _1088);
    float _1098 = fma(_1070, _706, _1090);
    float _1100 = _1044 * _944;
    float _1102 = _784 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = fma(_1074, _742, _1096);
    float _1106 = fma(_1066, _742, _1098);
    float _1108 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1110 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1112 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1116 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1118 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1120 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1112);
    float _1122 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1114);
    float _1124 = -_1026;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1108);
    float _1128 = -_1026;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1110);
    float _1132 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1120);
    float _1134 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1122);
    float _1136 = -_1026;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1116);
    float _1140 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1118);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1144 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1146 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1148 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = _1102 + _1142;
    float _1152 = _1092 + _1144;
    float _1154 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1146);
    float _1156 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1150 + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1164 = _1152 + _1162;
    float _1166 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1168 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1130);
    float _1170 = _1160 * _1160;
    float _1172 = _1164 * _1164;
    float _1174 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1126);
    float _1180 = _1170 + _1172;
    float _1182 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1184 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1186 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1138);
    float _1188 = sqrt(_1180);
    float _1190 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    float _1192 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    float _1194 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1156);
    float _1196 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1166);
    float _1198 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1154);
    float _1200 = _1168 * _940;
    float _1202 = _1168 * _1006;
    float _1204 = _1082 * _1168;
    float _1206 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1184);
    float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1210 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1190);
    float _1212 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1196);
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1216 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1140);
    float _1218 = _1178 * _940;
    bool _1220 = _1188 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = _1178 * _1006;
    float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1226 = _1186 * _1006;
    float _1228 = _1082 * _1178;
    float _1230 = _850 + _1214;
    float _1232 = _1186 * _940;
    float _1234 = _1082 * _1186;
    float _1236 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1194);
    float _1238 = fma(_1216, _988, _1222);
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1242 = fma(_1192, _988, _1202);
    float _1244 = fma(_1198, _988, _1226);
    float _1246 = _1170;
    float _1248 = _1172;
    float _1250 = _1150;
    float _1252 = _1152;
    float _1254 = _1218;
    float _1256 = _1212;
    float _1258 = _1204;
    float _1260 = _1214;
    float _1262 = _1226;
    if (!_1220)
    {
        _990 = _1170;
    }
    float _1264 = _990;
    float _1266 = fma(_1216, _938, _1218);
    float _1268 = fma(_1084, _1216, _1228);
    float _1270 = _1264;
    if (!_1220)
    {
        _1246 = _1230;
    }
    float _1272 = _1246;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _1278 = !_1220;
    float _1280 = _1272;
    if (!_1278)
    {
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1286 = _1188 + _1284;
        float _1288 = rsqrt(_1180);
        float _1290 = _1286 * _1282;
        float _1292 = _1230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = _1290 * 0.15915493667125701904296875;
        float _1296 = _1294 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = _1294 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = fma(_1298, _1292, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1306 = _1288 * _1304;
        float _1308 = _1302 + (-1.0);
        float _1310 = fma(_1160, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1164, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1314 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1318 = _1310 + _1316;
        float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1322 = _1312 + _1320;
        float _1324 = fma(_1230, _1302, _1314);
        float _1326 = _1318 * _1318;
        float _1328 = _1322 * _1322;
        _1280 = _1324;
        _1270 = _1326;
        _1248 = _1328;
        _1250 = _1310;
        _1252 = _1312;
        _1254 = _1294;
    }
    float _1330 = _1280;
    float _1332 = _1270;
    float _1334 = _1248;
    float _1336 = _1250;
    float _1338 = _1252;
    float _1340 = _1254;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1344 = _1330 + _1342;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1348 = fma(_1192, _938, _1200);
    float _1350 = fma(_1198, _938, _1232);
    float _1352 = fma(_1344, _1344, _1332);
    float _1354 = _512 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1356 = _516 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1358 = _536 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1360 = _1352 + _1334;
    float _1362 = fma(_1084, _1192, _1204);
    float _1364 = fma(_1084, _1198, _1234);
    float _1366 = _456 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1368 = _618 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1370 = _488 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1372 = sqrt(_1360);
    float _1374 = _1356 * _1224;
    float _1376 = _1358 * _1240;
    float _1378 = _1366 * _1208;
    float _1380 = fma(_1236, _1036, _1238);
    float _1382 = fma(_1236, _942, _1266);
    float _1384 = fma(_1100, _1236, _1268);
    float _1386 = fma(_1210, _942, _1348);
    float _1388 = fma(_1212, _942, _1350);
    float _1390 = _1354 * _1276;
    float _1392 = _1368 * _1274;
    float _1394 = _1370 * _1346;
    float _1396 = fma(_1210, _1036, _1242);
    float _1398 = fma(_1100, _1210, _1362);
    float _1400 = fma(_1100, _1212, _1364);
    float _1402 = fma(_1212, _1036, _1244);
    out.m_87.x = _1378;
    out.m_87.y = _1374;
    out.m_87.z = _1394;
    out.m_87.w = _1376;
    bool _1404 = _1372 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1406 = isnan(_1372);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1412 = _1408 || _1410;
    out.m_89.x = _1392;
    out.m_89.y = _1390;
    out.m_91.x = _1382;
    out.m_91.y = _1386;
    out.m_91.z = _1388;
    out.m_93.x = _1384;
    out.m_93.y = _1398;
    out.m_93.z = _1400;
    float _1414 = _1340;
    if (!_1412)
    {
        _1256 = 1.0;
    }
    float _1416 = _1256;
    out.m_95.x = _1380;
    out.m_95.y = _1396;
    out.m_95.z = _1402;
    bool _1418 = !_1412;
    float _1420 = _1416;
    if (!_1418)
    {
        bool _1422 = _1372 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1424 = isnan(_1372);
        bool _1426 = _1422 || _1424;
        bool _1428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1430 = _1426 || _1428;
        if (!_1430)
        {
            float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1434 = _1372 + _1432;
            float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1438 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1436;
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1442 = _1440 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1444 = 1.0 / _1438;
            float _1446 = _1434 * _1444;
            float _1448 = fma(_1446, _1442, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1420 = _1448;
            _1450 = true;
        }
        else
        {
            bool _1452 = _1372 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1454 = isnan(_1372);
            bool _1456 = _1452 || _1454;
            bool _1458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1460 = _1456 || _1458;
            if (!_1460)
            {
                float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1464 = _1372 + _1462;
                float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1468 = _1466 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1474 = 1.0 / _1468;
                float _1476 = _1464 * _1474;
                float _1478 = fma(_1476, _1472, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1420 = _1478;
                _1450 = true;
            }
            else
            {
                _1420 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1450 = false;
    float _1480 = _1420;
    float _1482 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1484 = _1330 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1488 = _1336 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1492 = _1338 + _1490;
    float _1494 = _850 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1496 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1498 = fma(_1488, _1480, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1500 = fma(_1492, _1480, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1502 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1494);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1496 + _1504;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1498 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1500 + _1512;
    float _1516 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1502);
    float _1518 = _1506 * _1506;
    float _1520 = _850 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1522 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1524 = fma(_1510, _1510, _1518);
    float _1526 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1520);
    float _1528 = 1.0 / _1522;
    float _1530 = fma(_1514, _1514, _1524);
    float _1532 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1526);
    float _1534 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1536 = rsqrt(_1530);
    float _1538 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1540 = _1534 + _1522;
    float _1542 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1544 = _850 + _1542;
    float _1546 = _1540 * _1528;
    float _1548 = _1546 * 0.5;
    float _1550 = floor(_1538);
    float _1552 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1556 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1554);
    float _1558 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1560 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1552);
    float _1562 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1564 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1558);
    float _1566 = 1.0 / _1556;
    float _1568 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1560);
    float _1570 = _1510 * _1562;
    float _1572 = _1514 * _1562;
    float _1574 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1564);
    float _1576 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1578 = _1570 * _1570;
    float _1580 = _1572 * _1572;
    float _1582 = _1574 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1584 = trunc(_1576);
    int _1586 = int(_1584);
    float _1588 = -_1550;
    float _1590 = _1538 + _1588;
    float _1592 = _1578 + _1580;
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1596 = _1566 * _1594;
    float _1598 = sqrt(_1592);
    bool _1600 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1602 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1604 = trunc(_1582);
    int _1606 = int(_1604);
    int _1608 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1610 = _1586 + _1608;
    int _1612 = _1610 + 1;
    bool _1614 = _1598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1598 + _1616;
    int _1620 = 2;
    float _1622 = _1592;
    float _1624 = _1618;
    float _1626 = _1562;
    float _1628 = _1570;
    float _1630 = _1550;
    float _1632 = _1578;
    if (!_1600)
    {
        _1620 = 1;
    }
    int _1634 = _1620;
    float _1636 = sqrt(_1530);
    int _1638 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1640 = _1606 + _1638;
    int _1642 = _1640 + 1;
    float _1644 = _1542;
    int _1646 = _1634;
    if (_1614)
    {
        float _1648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1644 = _1648;
    }
    float _1650 = _1644;
    if (_1614)
    {
        float _1652 = rsqrt(_1592);
        _1622 = _1652;
    }
    float _1654 = _1622;
    float _1656 = _1654;
    if (_1614)
    {
        float _1658 = _1618 * _1650;
        _1624 = _1658;
    }
    float _1660 = _1624;
    if (_1614)
    {
        float _1662 = _1660 * 0.15915493667125701904296875;
        _1258 = _1662;
    }
    float _1664 = _1258;
    bool _1666 = !_1600;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1672 = _1568;
    if (_1614)
    {
        float _1674 = _1664 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        _1672 = _1676;
    }
    float _1678 = _1672;
    if (!_1602)
    {
        _1646 = _1668;
    }
    int _1680 = _1646;
    float _1682 = precise::max(0.0, _1670);
    int _1684 = _1680 << 6;
    bool _1686 = _1612 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1688 = -_1562;
    float _1690 = -_1682;
    float _1692 = fma(_1506, _1688, _1690);
    int _1694 = _1684 + 48;
    uint _1697 = uint(int(uint(_1694) >> uint(2)));
    uint _1699 = uint(int(uint(int(_1697)) >> uint(2)));
    int _1701 = int(_1697) & 3;
    float _1703 = (*spvDescriptorSet0.vp_c15)._m0[int(_1699)][_1701];
    int _1705 = int(_1697) + 1;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    int _1709 = _1705 & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    int _1713 = _1612 | _1642;
    float _1715 = _1664;
    float _1717 = as_type<float>(_1713);
    if (_1614)
    {
        float _1719 = _1664 * 6.283185482025146484375;
        float _1721 = cos(_1719);
        _1715 = _1721;
    }
    float _1723 = _1715;
    if (_1614)
    {
        float _1725 = _1692 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1725;
    }
    float _1727 = _1626;
    bool _1729 = _1713 < 0;
    bool _1731 = _1729 || _1686;
    if (_1614)
    {
        float _1733 = fma(_1678, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1717 = _1733;
    }
    float _1735 = _1717;
    int _1737 = _1684 + 96;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    uint _1741 = uint(int(uint(int(_1739)) >> uint(2)));
    int _1743 = int(_1739) & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    int _1747 = int(_1739) + 1;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    int _1751 = _1747 & 3;
    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[int(_1749)][_1751];
    float _1755 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1757 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1614)
    {
        float _1759 = _1654 * _1735;
        _1260 = _1759;
    }
    float _1761 = _1260;
    bool _1763 = _1642 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1765 = _1763 || _1731;
    float _1767 = floor(_1755);
    float _1769 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1757);
    if (_1614)
    {
        float _1771 = _1570 * _1761;
        _1628 = _1771;
    }
    float _1773 = _1628;
    int _1775 = _1684 + 64;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    uint _1779 = uint(int(uint(int(_1777)) >> uint(2)));
    int _1781 = int(_1777) & 3;
    float _1783 = (*spvDescriptorSet0.vp_c15)._m0[int(_1779)][_1781];
    int _1785 = int(_1777) + 1;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    int _1789 = _1785 & 3;
    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
    if (!_1614)
    {
        _1630 = _1692;
    }
    float _1793 = _1630;
    float _1795 = _1793;
    float _1797 = _1723;
    if (_1614)
    {
        float _1799 = _1723 + (-1.0);
        _1656 = _1799;
    }
    float _1801 = _1656;
    float _1803 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1769);
    float _1805 = _1801;
    if (_1614)
    {
        float _1807 = _1773 * _1773;
        _1632 = _1807;
    }
    float _1809 = _1632;
    if (_1614)
    {
        float _1811 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1811;
    }
    float _1813 = _1262;
    if (!_1614)
    {
        _1805 = _1572;
    }
    float _1815 = _1805;
    int _1817 = _1684 + 104;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    float _1835 = _1815;
    if (_1614)
    {
        float _1837 = _1572 * _1761;
        _1835 = _1837;
    }
    float _1839 = _1835;
    if (_1614)
    {
        float _1841 = fma(_1692, _1723, _1813);
        _1795 = _1841;
    }
    float _1843 = _1795;
    float _1845 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1614)
    {
        _1797 = _1580;
    }
    float _1847 = _1797;
    float _1849 = _1847;
    if (_1614)
    {
        float _1851 = _1839 * _1839;
        _1849 = _1851;
    }
    float _1853 = _1849;
    float _1855 = fma(_1843, _1843, _1809);
    float _1857 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1859 = _1684 + 80;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    uint _1863 = uint(int(uint(int(_1861)) >> uint(2)));
    int _1865 = int(_1861) & 3;
    float _1867 = (*spvDescriptorSet0.vp_c15)._m0[int(_1863)][_1865];
    int _1869 = int(_1861) + 1;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    int _1873 = _1869 & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    float _1877 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1879 = -_1767;
    float _1881 = _1755 + _1879;
    float _1883 = _1855 + _1853;
    int _1885 = as_type<int>(_1877);
    if (!_1765)
    {
        float _1887 = floor(_1582);
        _1414 = _1887;
    }
    float _1889 = _1414;
    float _1891 = -_1877;
    float _1893 = fma(_1891, _1857, 1.0);
    if (!_1765)
    {
        int _1895 = _1642 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1897 = _1895 + _1612;
        _1885 = _1897;
    }
    int _1899 = _1885;
    int _1901 = _1684 + 56;
    uint _1903 = uint(int(uint(_1901) >> uint(2)));
    uint _1905 = uint(int(uint(int(_1903)) >> uint(2)));
    int _1907 = int(_1903) & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    int _1911 = int(_1903) + 1;
    uint _1913 = uint(int(uint(_1911) >> uint(2)));
    int _1915 = _1911 & 3;
    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[int(_1913)][_1915];
    float _1919 = log2(_1893);
    int _1921 = _1684 + 72;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    uint _1925 = uint(int(uint(int(_1923)) >> uint(2)));
    int _1927 = int(_1923) & 3;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[int(_1925)][_1927];
    int _1931 = int(_1923) + 1;
    uint _1933 = uint(int(uint(_1931) >> uint(2)));
    int _1935 = _1931 & 3;
    float _1937 = (*spvDescriptorSet0.vp_c15)._m0[int(_1933)][_1935];
    float _1939 = _1544 * _1711;
    float _1941 = rsqrt(_1883);
    float _1943 = fma(_1102, _1703, _1939);
    int _1945 = as_type<int>(_1939);
    if (!_1765)
    {
        int _1947 = _1899 << 2;
        _1945 = _1947;
    }
    int _1949 = _1945;
    int _1951 = _1684 + 88;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[int(_1955)][_1957];
    int _1961 = int(_1953) + 1;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    int _1965 = _1961 & 3;
    float _1967 = (*spvDescriptorSet0.vp_c15)._m0[int(_1963)][_1965];
    float _1969 = _1544 * _1753;
    int _1971 = _1949;
    int _1973 = as_type<int>(_1745);
    if (!_1765)
    {
        int _1975 = 12 & _1949;
        _1971 = _1975;
    }
    int _1977 = _1971;
    float _1979 = _1919 * 0.693147182464599609375;
    float _1981 = fma(_1102, _1745, _1969);
    float _1983 = _1544 * _1791;
    float _1985 = _1791;
    int _1987 = as_type<int>(_1875);
    if (!_1765)
    {
        float _1989 = -_1889;
        float _1991 = _1582 + _1989;
        _1985 = _1991;
    }
    float _1993 = _1985;
    float2 _5920 = float2(_1590, _1881);
    float _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5920, float2(0.0), isnan(_5920)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5920, float2(0.0), isnan(_5920)), level(0.0)).x;
    float _1997 = fma(_1102, _1783, _1983);
    float _1999 = _1941 * _1773;
    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2003 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2001);
    float _2005 = precise::clamp(_2003, 0.0, 1.0);
    float _2007 = _1941 * _1843;
    float _2009 = fma(_1092, _1825, _1981);
    float _2011 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2013 = _1941 * _1839;
    float _2015 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2017 = _2009 + _1833;
    float _2019 = -_2011;
    float _2021 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2019);
    float _2023 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2025 = _1544 * _1875;
    float _2027 = _2013;
    if (!_1765)
    {
        uint _2029 = uint(int(uint(_1899) >> uint(2)));
        _1987 = int(_2029);
    }
    int _2031 = _1987;
    float _2033 = 1.0 / _2017;
    float _2035 = fma(_1102, _1867, _2025);
    float _2037 = -_2005;
    float _2039 = _2037 + 1.0;
    if (!_1765)
    {
        int _2041 = _2031 << 4;
        int _2043 = _2041 + _1977;
        _1973 = _2043;
    }
    int _2045 = _1973;
    float _2047 = -_2013;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2021);
    float _2051 = fma(_1092, _1909, _1943);
    if (!_1765)
    {
        float _2053 = floor(_1576);
        _2027 = _2053;
    }
    float _2055 = _2027;
    float _2057 = fma(_2049, -0.5, 0.5);
    float _2059 = _2051 + _1917;
    float _2061 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2063 = _2051;
    if (!_1765)
    {
        int _2065 = _2045 + 400;
        uint _2067 = uint(int(uint(_2065) >> uint(2)));
        uint _2069 = uint(int(uint(int(_2067)) >> uint(2)));
        int _2071 = int(_2067) & 3;
        float _2073 = (*spvDescriptorSet0.vp_c15)._m0[int(_2069)][_2071];
        _2063 = _2073;
    }
    float _2075 = _2063;
    float _2077 = fma(_2049, 0.5, 0.5);
    float _2079 = fma(_1092, _1929, _1997);
    float _2081 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2061);
    float _2083 = abs(_2039);
    float _2085 = log2(_2083);
    float _2087 = fma(_2077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2089 = _2079 + _1937;
    float _2091 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2093 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2081);
    float _2095 = fma(_2077, _2087, -0.212114393711090087890625);
    float _2097 = fma(_1092, _1959, _2035);
    float _2099 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2091);
    float _2101 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2023);
    float _2103 = _2059 * _2033;
    float _2105 = _2097 + _1967;
    float _2107 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2099);
    float _2109 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2111 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2101);
    bool _2113 = _2103 >= 0.0;
    float _2115 = _2107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2117 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2119 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2121 = _2103 <= 1.0;
    bool _2123 = _2121 && _2113;
    float _2125 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2127 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2117);
    float _2129 = _2089 * _2033;
    float _2131 = _2007 + 1.0;
    float _2133 = exp2(_2119);
    float _2135 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2127);
    float _2137 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2139 = _2129 >= 0.0;
    bool _2141 = _2139 && _2123;
    float _2143 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2145 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2135);
    float _2147 = fma(_2077, _2095, 1.570728778839111328125);
    bool _2149 = _2129 <= 1.0;
    bool _2151 = _2149 && _2141;
    float _2153 = sqrt(_2057);
    float _2155 = _2105 * _2033;
    float _2157 = -_2007;
    float _2159 = fma(_2133, _2131, _2157);
    float _2161 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2137);
    float _2163 = 1.0 / _2145;
    float _2165 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2143);
    float _2167 = _2137;
    float _2169 = _2145;
    if (_2151)
    {
        float _2171 = float(_1680);
        _2167 = _2171;
    }
    float _2173 = _2167;
    float _2175 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2161);
    float _2177 = fma(_2159, 0.5, 0.5);
    float _2179 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2165);
    float _2181 = _2153 * 0.636619746685028076171875;
    float _2183 = _2173;
    float _2185 = _2175;
    if (_2151)
    {
        float _2187 = rint(_2173);
        float _2189 = precise::max(_2187, 0.0);
        uint _2191 = uint(_2189);
        uint _2193 = clamp(_2191, 0u, 65535u);
        _2183 = as_type<float>(_2193);
    }
    float _2195 = _2183;
    float _2197 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2179);
    float _2199 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2175);
    float _2201 = -_2147;
    float _2203 = fma(_2181, _2201, 1.0);
    float _2205 = _2197;
    float _2207 = _2199;
    if (!_1765)
    {
        float _2209 = -_2055;
        float _2211 = _1576 + _2209;
        _2185 = _2211;
    }
    float _2213 = _2185;
    float _2215 = _2197 * _2163;
    float _2217 = _2199 * _2163;
    float _2219 = _2075;
    if (!_1765)
    {
        float _2221 = rint(_2075);
        float _2223 = precise::max(_2221, 0.0);
        uint _2225 = uint(_2223);
        uint _2227 = clamp(_2225, 0u, 65535u);
        _2219 = as_type<float>(_2227);
    }
    float _2229 = _2219;
    float _2231 = fma(_2215, 0.5, 0.5);
    float _2233 = fma(_2217, -0.5, 0.5);
    float _2235 = _2195;
    if (_2151)
    {
        float3 _6330 = float3(_2103, _2129, float(as_type<int>(_2195)));
        float3 _6334 = select(_6330, float3(0.0), isnan(_6330));
        float _2237 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6334.xy, uint(rint(_6334.z)), _2155, level(0.0));
        _2235 = _2237;
    }
    float _2239 = _2235;
    float3 _6344 = float3(_2231, _2233, _2015);
    float _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6344, float3(0.0), isnan(_6344)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6344, float3(0.0), isnan(_6344)), level(0.0)).x;
    float3 _6353 = float3(_2231, _2233, _2015);
    float4 _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6353, float3(0.0), isnan(_6353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6353, float3(0.0), isnan(_6353)), level(0.0)).xyzw;
    float _2246 = _2244.x;
    float _2248 = _2244.y;
    float _2250 = _2244.z;
    float _2252 = _2244.w;
    float2 _6369 = float2(_2203, _2177);
    float3 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6369, float2(0.0), isnan(_6369)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6369, float2(0.0), isnan(_6369)), level(0.0)).xyz;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    float _2264 = _2213;
    if (!_1765)
    {
        float3 _6390 = float3(_2213, _1993, float(as_type<int>(_2229)));
        float3 _6392 = select(_6390, float3(0.0), isnan(_6390));
        float _2266 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6392.xy, uint(rint(_6392.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6392.xy, uint(rint(_6392.z)), level(0.0)).x;
        _2264 = _2266;
    }
    float _2268 = _2264;
    float _2270 = abs(_1596);
    float _2272 = log2(_2270);
    float _2274 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2276 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2278 = exp2(_2274);
    float _2280 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2276);
    bool _2282 = _1596 <= 8000.0;
    bool _2284 = isnan(_1596);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(8000.0);
    bool _2290 = _2286 || _2288;
    float _2292 = float(_2290);
    float _2294 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2280);
    float _2296 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2298 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2294);
    float _2300 = exp2(_2296);
    out.gl_Position.x = _2197;
    out.gl_Position.y = _2199;
    out.gl_Position.z = _2298;
    out.gl_Position.w = _2145;
    float _2302 = -_2278;
    float _2304 = _2302 + 1.0;
    float _2306 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2308 = _2298;
    if (_1765)
    {
        _2205 = 1.0;
    }
    float _2310 = _2205;
    float _2312 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2314 = precise::clamp(_2312, 0.0, 1.0);
    float _2316 = fma(_2314, -2.0, 3.0);
    float _2318 = _2314 * _2314;
    float _2320 = _2318 * _2316;
    float _2322 = -_2320;
    float _2324 = _2322 + 1.0;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2320);
    float _2328 = _2324;
    float _2330 = _2310;
    if (!_2151)
    {
        _2328 = 1.0;
    }
    float _2332 = _2328;
    float _2334 = _2292 * _2326;
    float _2336 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2338 = -_1995;
    float _2340 = _2338 + 1.0;
    float _2342 = _2340 * _2336;
    float _2344 = precise::clamp(_2342, 0.0, 1.0);
    float _2346 = _2332;
    float _2348 = _2336;
    if (_2151)
    {
        bool _2350 = _2239 >= _2155;
        bool _2352 = isnan(_2239);
        bool _2354 = _2350 || _2352;
        bool _2356 = isnan(_2155);
        bool _2358 = _2354 || _2356;
        float _2360 = float(_2358);
        _2346 = _2360;
    }
    float _2362 = _2346;
    if (!_1765)
    {
        int _2364 = _1899 << 4;
        int _2366 = _2364 + 2048;
        uint _2368 = uint(int(uint(_2366) >> uint(2)));
        uint _2370 = uint(int(uint(int(_2368)) >> uint(2)));
        int _2372 = int(_2368) & 3;
        float _2374 = (*spvDescriptorSet0.vp_c15)._m0[int(_2370)][_2372];
        int _2376 = int(_2368) + 1;
        uint _2378 = uint(int(uint(_2376) >> uint(2)));
        int _2380 = _2376 & 3;
        float _2382 = (*spvDescriptorSet0.vp_c15)._m0[int(_2378)][_2380];
        int _2384 = _2366 + 8;
        uint _2386 = uint(int(uint(_2384) >> uint(2)));
        uint _2388 = uint(int(uint(int(_2386)) >> uint(2)));
        int _2390 = int(_2386) & 3;
        float _2392 = (*spvDescriptorSet0.vp_c15)._m0[int(_2388)][_2390];
        int _2394 = int(_2386) + 1;
        uint _2396 = uint(int(uint(_2394) >> uint(2)));
        int _2398 = _2394 & 3;
        float _2400 = (*spvDescriptorSet0.vp_c15)._m0[int(_2396)][_2398];
        float _2402 = _1544 * _2382;
        float _2404 = fma(_1102, _2374, _2402);
        float _2406 = fma(_1092, _2392, _2404);
        float _2408 = _2406 + _2400;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        float _2412 = -_2410;
        float _2414 = _2412 + _2268;
        float _2416 = fma(_2414, 500.0, 1.5);
        float _2418 = exp2(_2416);
        float _2420 = 0.0 + _2418;
        float _2422 = precise::clamp(_2420, 0.0, 1.0);
        _2330 = _2422;
        _2169 = _2400;
        _2207 = _2382;
        _2308 = _2392;
    }
    float _2424 = _2330;
    float _2426 = _2169;
    float _2428 = _2207;
    float _2430 = _2308;
    float _2432 = _2362 * _2424;
    float _2434 = _2306 * _2241;
    float _2436 = -_2344;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2440 = -_2306;
    float _2442 = _2440 + 1.0;
    bool _2444 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2446 = isnan(_1636);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2452 = _2448 || _2450;
    float _2454 = _2252 * _2434;
    float _2456 = -_2432;
    float _2458 = fma(_2456, _2438, 1.0);
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    float _2462 = _2262 * _2434;
    float _2464 = _2252 * _2442;
    float _2466 = fma(_2258, _2454, _2246);
    float _2468 = fma(_2260, _2454, _2248);
    float _2470 = _2460 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2472 = fma(_2252, _2462, _2250);
    out.m_97.x = _2470;
    float _2474 = _2426;
    float _2476 = _2430;
    float _2478 = _2428;
    float _2480 = _2460;
    float _2482 = _2454;
    if (!_2452)
    {
        _2348 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2484 = _2348;
    float _2486 = _2484;
    float _2488 = _2484;
    if (!_2452)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2490 = _2474;
    out.m_99.x = _2466;
    out.m_99.y = _2468;
    out.m_99.z = _2472;
    out.m_99.w = _2464;
    float _2492 = _2490;
    float _2494 = _2490;
    if (!_2452)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2496 = _2476;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2452)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2502 = _2478;
    float _2504 = _2502;
    float _2506 = _2502;
    if (!_2452)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2508 = _2480;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2452)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2514 = _2482;
    bool _2516 = !_2452;
    float _2518 = _2514;
    float _2520 = _2514;
    if (!_2516)
    {
        bool _2522 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2524 = isnan(_1636);
        bool _2526 = _2522 || _2524;
        bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2530 = _2526 || _2528;
        if (!_2530)
        {
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2534 = _1636 + _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2538 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2536;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2544 = 1.0 / _2538;
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2562 = _2534 * _2544;
            float _2564 = precise::clamp(_2562, 0.0, 1.0);
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2570 = fma(_2564, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2572 = fma(_2564, _2568, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2574 = fma(_2564, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2576 = fma(_2564, _2552, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2578 = fma(_2564, _2556, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2580 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2494 = _2574;
            _2512 = _2578;
            _2488 = _2570;
            _2506 = _2576;
            _2500 = _2572;
            _2520 = _2580;
            _2582 = true;
        }
        else
        {
            bool _2584 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2586 = isnan(_1636);
            bool _2588 = _2584 || _2586;
            bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2592 = _2588 || _2590;
            if (!_2592)
            {
                _2486 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2594 = _2486;
            _2488 = _2594;
            if (!_2592)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2596 = _2492;
            _2494 = _2596;
            if (!_2592)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2598 = _2498;
            _2500 = _2598;
            if (!_2592)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2600 = _2504;
            _2506 = _2600;
            if (!_2592)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2602 = _2510;
            _2512 = _2602;
            if (!_2592)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2604 = _2518;
            bool _2606 = !_2592;
            _2520 = _2604;
            if (!_2606)
            {
                bool _2608 = _1636 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2610 = isnan(_1636);
                bool _2612 = _2608 || _2610;
                bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2616 = _2612 || _2614;
                if (!_2616)
                {
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2620 = _1636 + _2618;
                    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2624 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2622;
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2630 = 1.0 / _2624;
                    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2648 = _2620 * _2630;
                    float _2650 = precise::clamp(_2648, 0.0, 1.0);
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2656 = fma(_2650, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2658 = fma(_2650, _2654, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2660 = fma(_2650, _2634, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2662 = fma(_2650, _2638, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2664 = fma(_2650, _2642, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2666 = fma(_2650, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2494 = _2660;
                    _2512 = _2664;
                    _2488 = _2656;
                    _2506 = _2662;
                    _2500 = _2658;
                    _2520 = _2666;
                    _2582 = true;
                }
                else
                {
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2488 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2582 = false;
    float _2668 = _2494;
    float _2670 = _2512;
    float _2672 = _2488;
    float _2674 = _2506;
    float _2676 = _2500;
    float _2678 = _2520;
    float _2680 = fma(_1396, -0.5, 0.5);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = -_2668;
    float _2686 = _2684 + _2670;
    float _2688 = -_2672;
    float _2690 = _2688 + _2674;
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    bool _2696 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2698 = fma(_2682, _2686, _2668);
    float _2700 = fma(_2682, _2690, _2672);
    float _2702 = fma(_2682, _2694, _2676);
    float _2704 = _2698 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2706 = fma(_2700, 0.298911988735198974609375, _2704);
    float _2708 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2710 = fma(_2702, 0.114477999508380889892578125, _2706);
    out.m_97.w = _2708;
    float _2712 = -_2710;
    float _2714 = _2700 + _2712;
    float _2716 = -_2710;
    float _2718 = _2698 + _2716;
    float _2720 = -_2710;
    float _2722 = _2702 + _2720;
    out.m_101.x = 0.0;
    float _2724 = fma(_2714, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2726 = fma(_2718, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2728 = fma(_2722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    out.m_103.x = _2724;
    out.m_103.y = _2726;
    out.m_103.z = _2728;
    if (!_2696)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2730 = -_1496;
    float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2734 = -_1498;
    float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2738 = -_1500;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2742 = _2732 * _2732;
    float _2744 = fma(_2736, _2736, _2742);
    float _2746 = fma(_2740, _2740, _2744);
    float _2748 = sqrt(_2746);
    float _2750 = rsqrt(_2746);
    float _2752 = -_2748;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2756 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2758 = precise::clamp(_2756, 0.0, 1.0);
    float _2760 = _2736 * _2750;
    float _2762 = _2732 * _2750;
    float _2764 = abs(_2758);
    float _2766 = log2(_2764);
    float _2768 = _2740 * _2750;
    float _2770 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2772 = _1396 * _2762;
    float _2774 = -_2762;
    float _2776 = -_2770;
    float _2778 = fma(_2774, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2776);
    float _2780 = fma(_1380, _2760, _2772);
    float _2782 = -_2768;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2778);
    float _2786 = fma(_1402, _2768, _2780);
    float _2788 = precise::clamp(_2786, 0.0, 1.0);
    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2792 = _2784 + _2790;
    float _2794 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2796 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = exp2(_2794);
    float _2802 = _2800 * _2798;
    float _2804 = _2788 * _2802;
    float _2806 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2808 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2810 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2806;
    out.m_101.y = _2808;
    out.m_101.z = _2810;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

